extern crate proc_macro;
use quote::quote;
use syn::{parse_macro_input, ItemFn};

#[proc_macro_attribute]
pub fn no_isr(
    _attr: proc_macro::TokenStream,
    input: proc_macro::TokenStream,
) -> proc_macro::TokenStream {
    let ItemFn {
        attrs,
        vis,
        sig,
        block,
    } = parse_macro_input!(input as ItemFn);
    let stmts = &block.stmts;
    let gen = quote! {
        #(#attrs)* #vis #sig {
            let mut _level: u32 = 0;
            let mut _disable_mask: u32 = 0;
            core::arch::asm!(r#"
              mfmsr {0}
              rlwinm {1},{0},0,17,15
              mtmsr {1}
              extrwi {0},{0},1,16
              "#,
              inout(reg) _disable_mask,
              inout(reg) _level,
            );

            #(#stmts)*

            let mut _enable_mask : u32 = 0;
            _level = 0;
            core::arch::asm!(r#"
                cmpwi {0},0
                beq 1f
                mfmsr {1}
                ori {1},{1},0x8000
                mtmsr {1}
                1:
              "#,
              inout(reg) _enable_mask,
              inout(reg) _level,
            );
        }
    };

    gen.into()
}
