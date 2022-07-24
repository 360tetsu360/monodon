use core::arch::global_asm;

global_asm!(include_str!("asm.s"));
global_asm!(include_str!("init.s"));
global_asm!(include_str!("system.s"));
global_asm!(include_str!("cache.s"));
global_asm!(include_str!("bss.s"));
global_asm!(include_str!("data.s"));
