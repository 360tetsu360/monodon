.text
.section .text

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

	.globl build_argv
build_argv:
	lwz     %r9,4(%r3)
	li      %r5,0
	lwz     %r10,8(%r3)
	add     %r7,%r9,%r10
	addi    %r10,%r10,-1
	addi    %r7,%r7,4
	add     %r8,%r9,%r10
	rlwinm  %r7,%r7,0,0,29
	mr      %r11,%r7

1:	stw     %r9,0(%r7)
	mr      %r4,%r5
	addi    %r5,%r5,1
	lbz     %r10,0(%r9)
	cmpwi   %r10,0
	beq     6f
	cmplw   %r9,%r8
	bge     6f
	subf    %r10,%r9,%r8
	andi.   %r6,%r10,3
	beq     4f
	cmpwi   %r6,1
	beq     3f
	cmpwi   %r6,2
	beq     2f
	lbzu    %r6,1(%r9)
	cmpwi   %r6,0
	beq     6f

2:	lbzu    %r6,1(%r9)
	cmpwi   %r6,0
	beq     6f

3:	lbzu    %r6,1(%r9)
	cmpwi   %r6,0
	beq     6f
	cmplw   %r8,%r9
	beq     6f

4:	rlwinm  %r10,%r10,30,2,31
	mtctr   %r10

5:	lbz     %r6,1(%r9)
	addi    %r9,%r9,1
	mr      %r10,%r9
	cmpwi   %r6,0
	beq     6f
	lbzu    %r6,1(%r9)
	cmpwi   %r6,0
	beq     6f
	lbz     %r6,2(%r10)
	addi    %r9,%r10,2
	cmpwi   %r6,0
	beq     6f
	lbz     %r6,3(%r10)
	addi    %r9,%r10,3
	cmpwi   %r6,0
	beq     6f
	bdnz    .

6:	addi    %r9,%r9,1
	addi    %r7,%r7,4
	cmplw   %r8,%r9
	bgt     1f
	addi    %r9,%r4,2
	li      %r6,0
	rlwinm  %r9,%r9,2,0,29
	rlwinm  %r10,%r5,2,0,29
	add     %r9,%r11,%r9
	li      %r7,0
	stb     %r6,0(%r8)
	stwx    %r7,%r11,%r10
	stw     %r9,20(%r3)
	stw     %r11,16(%r3)
	stw     %r5,12(%r3)
	blr