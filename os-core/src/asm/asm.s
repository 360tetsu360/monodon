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


.set HID0,1008
.set HID1,1009
.set HID2,920	
.set HID4,1011
.set GQR0,912
.set GQR1,913
.set GQR2,914
.set GQR3,915
.set GQR4,916
.set GQR5,917
.set GQR6,918
.set GQR7,919


.set MSR_RI,0x00000002
.set MSR_DR,0x00000010
.set MSR_IR,0x00000020
.set MSR_IP,0x00000040
.set MSR_SE,0x00000400
.set MSR_ME,0x00001000
.set MSR_FP,0x00002000
.set MSR_POW,0x00004000
.set MSR_EE,0x00008000