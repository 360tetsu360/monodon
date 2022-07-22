OUTPUT_FORMAT("elf32-powerpc");
OUTPUT_ARCH(powerpc:common);

ENTRY(_start)

MEMORY {
  ROM (xr): ORIGIN = 0x81600020, LENGTH = 64K /*Not the correct length, but for testing purposes.*/
}

SECTIONS {
  .init ORIGIN(ROM) : {
    . = ALIGN(4);
    KEEP(*(.init));
    . = ALIGN(4);
  } > ROM
}