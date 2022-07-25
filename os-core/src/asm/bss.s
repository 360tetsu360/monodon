.text 
.section .bss
	.balign 8
__crt0stack_end:
	.space 0x4000
__crt0stack:

	.globl __system_argv
	.section	.sdata,"aw",@progbits
	.align 2
	.type	__system_argv, @object
	.size	__system_argv, 4
__system_argv:
	.long	__argv