use mmacro::no_isr;

extern "C" {
    static __gxregs: *const u8;
    static __text_start: *const u8;
    static __isIPL: *const u8;
    static __Arena1Lo: *const u8;
    static __Arena1Hi: *const u8;
}

#[export_name = "_sys_init"]
#[no_isr]
unsafe extern "C" fn sys_init() {
    //somecode
}
