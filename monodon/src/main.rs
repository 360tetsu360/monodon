#![no_std]
#![no_main]
#![feature(asm_experimental_arch)]

use core::{panic::PanicInfo, arch::{global_asm}};

global_asm!(include_str!("init.s"));

#[panic_handler]
fn panic_handler(_: &PanicInfo) -> ! {
    loop {}
}
