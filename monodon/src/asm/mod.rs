use core::arch::global_asm;

global_asm!(include_str!("init.s"));
global_asm!(include_str!("bss.s"));
