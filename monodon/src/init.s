.text
.section .init

# Define

# Condition Register Bit Fields
.set 	cr0,0
.set 	cr1,1
.set 	cr2,2
.set 	cr3,3
.set 	cr4,4
.set 	cr5,5
.set 	cr6,6
.set 	cr7,7

# Floating Point Registers (FPRs)
.set 	fr0,0
.set 	fr1,1
.set 	fr2,2
.set 	fr3,3
.set 	fr4,4
.set 	fr5,5
.set 	fr6,6
.set 	fr7,7
.set 	fr8,8
.set 	fr9,9
.set 	fr10,10
.set 	fr11,11
.set 	fr12,12
.set 	fr13,13
.set 	fr14,14
.set 	fr15,15
.set 	fr16,16
.set 	fr17,17
.set 	fr18,18
.set 	fr19,19
.set 	fr20,20
.set 	fr21,21
.set 	fr22,22
.set 	fr23,23
.set 	fr24,24
.set 	fr25,25
.set 	fr26,26
.set 	fr27,27
.set 	fr28,28
.set 	fr29,29
.set 	fr30,30
.set 	fr31,31

# AltiVec Registers (VPRs)
.set	v0,0
.set	v1,1
.set	v2,2
.set	v3,3
.set	v4,4
.set	v5,5
.set	v6,6
.set	v7,7
.set	v8,8
.set	v9,9
.set	v10,10
.set	v11,11
.set	v12,12
.set	v13,13
.set	v14,14
.set	v15,15
.set	v16,16
.set	v17,17
.set	v18,18
.set	v19,19
.set	v20,20
.set	v21,21
.set	v22,22
.set	v23,23
.set	v24,24
.set	v25,25
.set	v26,26
.set	v27,27
.set	v28,28
.set	v29,29
.set	v30,30
.set	v31,31

# TODO 
# VSX Registers (VSRs)
# SPE Registers (EVPRs)
	
.global _start

_start:
  bl _init_grps

	

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

  # set static bases (r2,r13)
  # getting linker error > rust-lld: error: undefined symbol: _SDA2_BASE
	addis   %r13,%r0,_SDA_BASE_ @h
	ori     %r13,%r13,_SDA_BASE_ @l
	addis   %r2,%r0,_SDA2_BASE_ @h
	ori     %r2,%r2,_SDA2_BASE_ @l
	blr

_init_hardware:

_init_frps: