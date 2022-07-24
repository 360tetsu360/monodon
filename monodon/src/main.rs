#![no_std]
#![no_main]
#![feature(asm_experimental_arch)]

use core::panic::PanicInfo;
mod argv;
mod asm;

/*
extern "C" fn main() {
}
*/

#[panic_handler]
fn panic_handler(_: &PanicInfo) -> ! {
    loop {}
}
