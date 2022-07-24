#[repr(C)]
struct Argv {
    argv_magic: i32,
    command_line: *const i8,
    length: i32,
    argc: i32,
    argv: *const *const char,
    end_argv: *const *const char,
}

// ARGV_MAGIC = 0x5f617267
