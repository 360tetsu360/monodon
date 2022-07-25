use core::{intrinsics::volatile_copy_memory, ptr::null};

#[repr(C)]
struct Argv {
    argv_magic: i32,
    command_line: *const u8,
    length: i32,
    argc: i32,
    argv: *const *const u8,
    end_argv: *const *const u8,
}

pub static mut ARGV_ARENA1_LO: *const u8 = 0xdeadbeef as *const u8;

extern "C" {
    static __Arena1Lo: *const u8; // [u8]
    static __system_argv: *mut Argv;
    fn build_argv(argstruct: *const Argv);
}

// ARGV_MAGIC = 0x5f617267

#[export_name = "_check_argv"]
unsafe extern "C" fn checkargv() {
    if (*__system_argv).argv_magic != 0x5f617267 {
        (*__system_argv).argc = 0;
        (*__system_argv).argv = null();
        return;
    }

    let dst: *mut u8 = ((__Arena1Lo as u32 + 3) & !3) as *mut u8;
    volatile_copy_memory(
        dst,
        (*__system_argv).command_line,
        (*__system_argv).length as usize,
    );

    (*__system_argv).command_line = dst as *const u8;
    build_argv(__system_argv);

    ARGV_ARENA1_LO = (*__system_argv).end_argv as *const u8;
}
