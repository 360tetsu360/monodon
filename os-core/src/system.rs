use crate::processor::{_cpu_isr_disable, _cpu_isr_restore};

#[export_name = "_sys_init"]
unsafe extern "C" fn sys_init() {
    let mut _level: u32 = 0;
    _cpu_isr_disable!(_level);
    //somecode
    _cpu_isr_restore!(_level);
}
