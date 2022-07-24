	.globl __realmode
__realmode:
	clrlwi	%r3,%r3,2
	mtsrr0	%r3
	mfmsr	%r3
	rlwinm	%r3,%r3,0,28,25
	mtsrr1	%r3
	rfi

	.globl __configBATS
__configBATS:
	lis		%r3,0x0011
	ori		%r3,%r3,0x0c64
	mtspr	HID0,%r3
	isync

	li		%r0,0
	mtspr	IBAT0U,%r0
  mtspr	IBAT1U,%r0
  mtspr	IBAT2U,%r0
  mtspr	IBAT3U,%r0
	mtspr	DBAT0U,%r0
  mtspr	DBAT1U,%r0
  mtspr	DBAT2U,%r0
  mtspr	DBAT3U,%r0
	isync

	// clear all SRs
	lis		%r0,0x8000
	mtsr	0,%r0
  mtsr	1,%r0
  mtsr	2,%r0
  mtsr	3,%r0
  mtsr	4,%r0
  mtsr	5,%r0
  mtsr	6,%r0
	mtsr	7,%r0
  mtsr	8,%r0
  mtsr	9,%r0
  mtsr	10,%r0
  mtsr	11,%r0
  mtsr	12,%r0
  mtsr	13,%r0
	mtsr	14,%r0
  mtsr	15,%r0
	isync

	// set [DI]BAT0 for 256MB@80000000,
	// real 00000000, WIMG=0000, R/W
	li		%r3,2
	lis		%r4,0x8000
	ori		%r4,%r4,0x1fff
	mtspr	IBAT0L,%r3
	mtspr	IBAT0U,%r4
	mtspr	DBAT0L,%r3
	mtspr	DBAT0U,%r4
	isync
	// set DBAT1 for 256MB@c0000000,
	// real 00000000, WIMG=0101, R/W
	li		%r3,0x2a
	lis		%r4,0xc000
	ori		%r4,%r4,0x1fff
	mtspr	DBAT1L,%r3
	mtspr	DBAT1U,%r4
	isync

	mfmsr	%r3
	ori		%r3,%r3,MSR_DR|MSR_IR
	mtsrr1	%r3
	mflr	%r3
	oris    %r3,%r3,0x8000
	mtsrr0	%r3
	rfi

  .globl ICEnabled
ICEnabled:
	mfspr   %r3, HID0
	rlwinm. %r0, %r3, 0, 17, 17	// Check if the Data Cache has been enabled or not.
	bne     DCEnabled

	bl		DCEnable	
DCEnabled:
	
	mfspr   %r3, L2CR
	clrrwi. %r0, %r3, 31
	bne     L2Enabled

	bl		L2Init
	bl		L2Enable
L2Enabled:
	lwz     %r0, 20(%r1)
	lwz     %r31, 12(%r1)
	addi    %r1, %r1, 16
	mtlr    %r0
	blr
