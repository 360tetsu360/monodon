macro_rules! _cpu_isr_disable {
  ($x:expr) => (
    let mut _disable_mask : u32 = 0;
    $x = 0;
    core::arch::asm!(r#"
      mfmsr {0}
      rlwinm {1},{0},0,17,15
      mtmsr {1}
      extrwi {0},{0},1,16
      "#,
      inlateout(reg) _disable_mask,
      inlateout(reg) $x,
    );
  )
}

macro_rules! _cpu_isr_restore {
  ($x:expr) => (
    let mut _enable_mask : u32 = 0;
    $x = 0;
    core::arch::asm!(r#"
        cmpwi {0},0
        beq 1f
        mfmsr {1}
        ori {1},{1},0x8000
        mtmsr {1}
        1:
      "#,
      inlateout(reg) _enable_mask,
      inlateout(reg) $x,
    );
  )
}

pub(crate) use _cpu_isr_disable;
pub(crate) use _cpu_isr_restore;
