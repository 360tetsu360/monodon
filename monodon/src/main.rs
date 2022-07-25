#![no_std]
#![no_main]
#![feature(asm_experimental_arch)]
#![feature(core_intrinsics)]
#![allow(unused_imports)]
#![allow(clippy::single_component_path_imports)]

use core::panic::PanicInfo;

#[allow(unused_imports)]
use os_core;

extern "C" fn _main() {}

#[panic_handler]
fn panic_handler(_: &PanicInfo) -> ! {
    loop {}
}
