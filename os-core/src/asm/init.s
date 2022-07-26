.text
.section .init
	
.global _start

_start:
	b _startup
	rlwnm.  %r1,%r27,%r14,9,19

__argv:
	.long	0		# argv magic
	.long 0		# command line
	.long 0		# command line length
	.long	0		# argc
	.long	0		#	argv
	.long 0		# end address of argv

_startup:
	bl _init_bats
  bl _init_grps
	bl _init_hardware
	bl _init_system

	bl _check_argv

	lis		%r3,__isIPL@h
	ori		%r3,%r3,__isIPL@l
	cmplwi	%r3,0
	bne		1f

	# Clear the SBSS section!
	# lis		%r3,__sbss_start@h
	# ori		%r3,%r3,__sbss_start@l
	# li		%r4,0
	# lis		%r5,__sbss_end@h
	# ori		%r5,%r5,__sbss_end@l
	# sub		%r5,%r5,%r3
	# bl		_memset

	lis		%r3,__bss_start@h
	ori		%r3,%r3,__bss_start@l
	li		%r4,0
	lis		%r5,__bss_end@h
	ori		%r5,%r5,__bss_end@l
	sub		%r5,%r5,%r3
	bl		_memset
1: b  _sys_init

	
_init_bats:
	mflr	%r31
	oris	%r31,%r31,0x8000
	lis		%r3,__configBATS@h
	ori		%r3,%r3,__configBATS@l
	bl		__realmode
	mtlr	%r31
	blr

_init_grps:
  # reset all grp's to 0.
	li  %r0,0
	li  %r3,0
	li  %r4,0
	li  %r5,0
	li  %r6,0
	li  %r7,0
	li  %r8,0
	li  %r9,0
	li  %r10,0
	li  %r11,0
	li  %r12,0
	li  %r14,0
	li  %r15,0
	li  %r16,0
	li  %r17,0
	li  %r18,0
	li  %r19,0
	li  %r20,0
	li  %r21,0
	li  %r22,0
	li  %r23,0
	li  %r24,0
	li  %r25,0
	li  %r26,0
	li  %r27,0
	li  %r28,0
	li  %r29,0
	li  %r30,0
	li  %r31,0

  # set stack pointer address
	lis		%r1,__crt0stack@h		    # we take 0x8173FFF0 as the topmost starting point for our stack,this gives us ~128Kb Stack
	ori		%r1,%r1,__crt0stack@l
	addi	%r1,%r1,-4
	stw		%r0,0(%r1)
	stwu	%r1,-56(%r1)

  # set static bases (r2,r13)
	addis   %r13,%r0,_SDA_BASE_@h
	ori     %r13,%r13,_SDA_BASE_@l
	addis   %r2,%r0,_SDA2_BASE_@h
	ori     %r2,%r2,_SDA2_BASE_@l
	blr

_init_hardware:
	# enable the fpr's
	mfmsr   %r3
	ori     %r3,%r3,MSR_FP
	mtmsr   %r3

	mflr    %r31
  bl 			_init_ps
	bl      _init_fprs
	mtlr    %r31
	blr

_init_ps:
	mflr	%r0
	stw		%r0,4(%r1)
	stwu	%r1,-8(%r1)
	mfspr	%r3,HID2
	oris	%r3,%r3,0xA000
	mtspr	HID2,%r3
	isync
	bl		ICFlashInvalidate
	sync
	li		%r3,0
	mtspr	GQR0,%r3
	mtspr	GQR1,%r3
	mtspr	GQR2,%r3
	mtspr	GQR3,%r3
	mtspr	GQR4,%r3
	mtspr	GQR5,%r3
	mtspr	GQR6,%r3
	mtspr	GQR7,%r3
	isync
	lwz		%r0,12(%r1)
	addi	%r1,%r1,8
	mtlr	%r0
	blr

_init_fprs:
	mfspr	%r3,920
	extrwi.	%r3,%r3,1,2
	beq		1f

	# Clear all of the PS FPR's to 0
	lis		%r3,zeroPS@ha
	addi	%r3,%r3,zeroPS@l
	lq    %r0,0(%r3)

	# move register
	.long 0x10200090 # ps_mr   f1,f0
	.long 0x10400090 # ps_mr   f2,f0
	.long 0x10600090 # ps_mr   f3,f0
	.long 0x10800090 # ps_mr   f4,f0
	.long 0x10a00090 # ps_mr   f5,f0
	.long 0x10c00090 # ps_mr   f6,f0
	.long 0x10e00090 # ps_mr   f7,f0
	.long 0x11000090 # ps_mr   f8,f0
	.long 0x11200090 # ps_mr   f9,f0
	.long 0x11400090 # ps_mr   f10,f0
	.long 0x11600090 # ps_mr   f11,f0
	.long 0x11800090 # ps_mr   f12,f0
	.long 0x11a00090 # ps_mr   f13,f0
	.long 0x11c00090 # ps_mr   f14,f0
	.long 0x11e00090 # ps_mr   f15,f0
	.long 0x12000090 # ps_mr   f16,f0
	.long 0x12200090 # ps_mr   f17,f0
	.long 0x12400090 # ps_mr   f18,f0
	.long 0x12600090 # ps_mr   f19,f0
	.long 0x12800090 # ps_mr   f20,f0
	.long 0x12a00090 # ps_mr   f21,f0
	.long 0x12c00090 # ps_mr   f22,f0
	.long 0x12e00090 # ps_mr   f23,f0
	.long 0x13000090 # ps_mr   f24,f0
	.long 0x13200090 # ps_mr   f25,f0
	.long 0x13400090 # ps_mr   f26,f0
	.long 0x13600090 # ps_mr   f27,f0
	.long 0x13800090 # ps_mr   f28,f0
	.long 0x13a00090 # ps_mr   f29,f0
	.long 0x13c00090 # ps_mr   f30,f0
	.long 0x13e00090 # ps_mr   f31,f0
		
	# clear all of the fpr's to 0
1:	
  lis	    %r3,zeroF@ha
	lfd	    fr0,zeroF@l(%r3)
	fmr     fr1,fr0
	fmr     fr2,fr0
	fmr     fr3,fr0
	fmr     fr4,fr0
	fmr     fr5,fr0
	fmr     fr6,fr0
	fmr     fr7,fr0
	fmr     fr8,fr0
	fmr     fr9,fr0
	fmr     fr10,fr0
	fmr     fr11,fr0
	fmr     fr12,fr0
	fmr     fr13,fr0
	fmr     fr14,fr0
	fmr     fr15,fr0
	fmr     fr16,fr0
	fmr     fr17,fr0
	fmr     fr18,fr0
	fmr     fr19,fr0
	fmr     fr20,fr0
	fmr     fr21,fr0
	fmr     fr22,fr0
	fmr     fr23,fr0
	fmr     fr24,fr0
	fmr     fr25,fr0
	fmr     fr26,fr0
	fmr     fr27,fr0
	fmr     fr28,fr0
	fmr     fr29,fr0
	fmr     fr30,fr0
	fmr     fr31,fr0
	mtfsf   255,fr0

	# Return
	blr

_init_cache:
	mflr    %r0
	stw     %r0, 4(%r1)
	stwu    %r1, -16(%r1)
	stw     %r31, 12(%r1)

	mfspr   %r3,HID0
	rlwinm. %r0,%r3, 0, 16, 16	// Check if the Instruction Cache has been enabled or not.
	bne     ICEnabled
	bl		ICEnable

_init_system:
	mflr    %r0
	stw     %r0, 4(%r1)
	stwu    %r1, -24(%r1)
	stmw	%r29, 12(%r1)

	# Disable interrupts!
	mfmsr   %r3
	rlwinm  %r4,%r3,0,17,15
	rlwinm  %r4,%r4,0,26,24
	mtmsr   %r4

	# Clear various SPR's
	li      %r3,0
	mtspr   952, %r3
	mtspr   956, %r3
	mtspr   953, %r3
	mtspr   954, %r3
	mtspr   957, %r3
	mtspr   958, %r3
	isync

	# Disable Speculative Bus Accesses to non-guarded space from both caches.
	mfspr   %r3, HID0
	ori     %r3, %r3, 0x0200
	mtspr   HID0, %r3
	isync
	
	# Set the Non-IEEE mode in the FPSCR
	mtfsb1  29
	
	# Disable Write Gather Pipe
	mfspr   %r3,HID2 # (HID2)
	rlwinm  %r3, %r3, 0, 2, 0	
	mtspr   HID2,%r3 # (HID2)
	isync
	
	# Restore the non-volatile registers to their previous values and return.
	lwz     %r0, 28(%r1)
	lmw			%r29,12(%r1)
	addi    %r1, %r1, 24
	mtlr    %r0
	blr
# r3 = ptr, r4 = fill, r5 = size
	.globl _memset
_memset:
	clrlwi.	%r6,%r5,29
	srwi	%r5,%r5,2
	subi	%r3,%r3,4
	mtctr	%r5
1:	stwu	%r4,4(%r3)
	bdnz	1b
	cmplwi	%r6,0
	beq		3f
2:	stbu	%r4,1(%r3)
	addic.	%r6,%r6,-1
	bne+	2b
3:	blr