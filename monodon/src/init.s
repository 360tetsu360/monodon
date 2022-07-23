.text
.section .init

# Define

.set 	cr0,0
.set 	cr1,1
.set 	cr2,2
.set 	cr3,3
.set 	cr4,4
.set 	cr5,5
.set 	cr6,6
.set 	cr7,7

.set 	r0,0
.set 	r1,1
.set 	sp,1
.set 	r2,2
.set 	to,2
.set 	r3,3
.set 	r4,4
.set 	r5,5
.set 	r6,6
.set 	r7,7
.set 	r8,8
.set 	r9,9
.set 	r10,10
.set 	r11,11
.set 	r12,12
.set 	r13,13
.set 	r14,14
.set 	r15,15
.set 	r16,16
.set 	r17,17
.set 	r18,18
.set 	r19,19
.set 	r20,20
.set 	r21,21
.set 	r22,22
.set 	r23,23
.set 	r24,24
.set 	r25,25
.set 	r26,26
.set 	r27,27
.set 	r28,28
.set 	r29,29
.set 	r30,30
.set 	r31,31

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

.set 	vr0,0
.set 	vr1,1
.set 	vr2,2
.set 	vr3,3
.set 	vr4,4
.set 	vr5,5
.set 	vr6,6
.set 	vr7,7
.set 	vr8,8
.set 	vr9,9
.set 	vr10,10
.set 	vr11,11
.set 	vr12,12
.set 	vr13,13
.set 	vr14,14
.set 	vr15,15
.set 	vr16,16
.set 	vr17,17
.set 	vr18,18
.set 	vr19,19
.set 	vr20,20
.set 	vr21,21
.set 	vr22,22
.set 	vr23,23
.set 	vr24,24
.set 	vr25,25
.set 	vr26,26
.set 	vr27,27
.set 	vr28,28
.set 	vr29,29
.set 	vr30,30
.set 	vr31,31

.set  SPRG0,272
.set  SPRG1,273
.set  SPRG2,274
.set  SPRG3,275

.set  PMC1,953
.set  PMC2,954
.set  PMC3,957
.set  PMC4,958

.set  MMCR0,952
.set  MMCR1,956

.set  EXCEPTION_NUMBER,8
.set  SRR0_OFFSET,12
.set  SRR1_OFFSET,16
.set  GPR0_OFFSET,20
.set  GPR1_OFFSET,24
.set  GPR2_OFFSET,28
.set  GPR3_OFFSET,32
.set  GPR4_OFFSET,36
.set  GPR5_OFFSET,40
.set  GPR6_OFFSET,44
.set  GPR7_OFFSET,48
.set  GPR8_OFFSET,52
.set  GPR9_OFFSET,56
.set  GPR10_OFFSET,60
.set  GPR11_OFFSET,64
.set  GPR12_OFFSET,68
.set  GPR13_OFFSET,72
.set  GPR14_OFFSET,76
.set  GPR15_OFFSET,80
.set  GPR16_OFFSET,84
.set  GPR17_OFFSET,88
.set  GPR18_OFFSET,92
.set  GPR19_OFFSET,96
.set  GPR20_OFFSET,100
.set  GPR21_OFFSET,104
.set  GPR22_OFFSET,108
.set  GPR23_OFFSET,112
.set  GPR24_OFFSET,116
.set  GPR25_OFFSET,120
.set  GPR26_OFFSET,124
.set  GPR27_OFFSET,128
.set  GPR28_OFFSET,132
.set  GPR29_OFFSET,136
.set  GPR30_OFFSET,140
.set  GPR31_OFFSET,144

.set  GQR0_OFFSET,148
.set  GQR1_OFFSET,152
.set  GQR2_OFFSET,156
.set  GQR3_OFFSET,160
.set  GQR4_OFFSET,164
.set  GQR5_OFFSET,168
.set  GQR6_OFFSET,172
.set  GQR7_OFFSET,176

.set  CR_OFFSET,180
.set  LR_OFFSET,184
.set  CTR_OFFSET,188
.set  XER_OFFSET,192
.set  MSR_OFFSET,196
.set  DAR_OFFSET,200

.set 	STATE_OFFSET,204
.set  MODE_OFFSET,206
	 
.set  FPR0_OFFSET,208
.set  FPR1_OFFSET,216
.set  FPR2_OFFSET,224
.set  FPR3_OFFSET,232
.set  FPR4_OFFSET,240
.set  FPR5_OFFSET,248
.set  FPR6_OFFSET,256
.set  FPR7_OFFSET,264
.set  FPR8_OFFSET,272
.set  FPR9_OFFSET,280
.set  FPR10_OFFSET,288
.set  FPR11_OFFSET,296
.set  FPR12_OFFSET,304
.set  FPR13_OFFSET,312
.set  FPR14_OFFSET,320
.set  FPR15_OFFSET,328
.set  FPR16_OFFSET,336
.set  FPR17_OFFSET,344
.set  FPR18_OFFSET,352
.set  FPR19_OFFSET,360
.set  FPR20_OFFSET,368
.set  FPR21_OFFSET,376
.set  FPR22_OFFSET,384
.set  FPR23_OFFSET,392
.set  FPR24_OFFSET,400
.set  FPR25_OFFSET,408
.set  FPR26_OFFSET,416
.set  FPR27_OFFSET,424
.set  FPR28_OFFSET,432
.set  FPR29_OFFSET,440
.set  FPR30_OFFSET,448
.set  FPR31_OFFSET,456

.set  FPSCR_OFFSET,464

.set  PSR0_OFFSET,472
.set  PSR1_OFFSET,480
.set  PSR2_OFFSET,488
.set  PSR3_OFFSET,496
.set  PSR4_OFFSET,504
.set  PSR5_OFFSET,512
.set  PSR6_OFFSET,520
.set  PSR7_OFFSET,528
.set  PSR8_OFFSET,536
.set  PSR9_OFFSET,544
.set  PSR10_OFFSET,552
.set  PSR11_OFFSET,560
.set  PSR12_OFFSET,568
.set  PSR13_OFFSET,576
.set  PSR14_OFFSET,584
.set  PSR15_OFFSET,592
.set  PSR16_OFFSET,600
.set  PSR17_OFFSET,608
.set  PSR18_OFFSET,616
.set  PSR19_OFFSET,624
.set  PSR20_OFFSET,632
.set  PSR21_OFFSET,640
.set  PSR22_OFFSET,648
.set  PSR23_OFFSET,656
.set  PSR24_OFFSET,664
.set  PSR25_OFFSET,672
.set  PSR26_OFFSET,680
.set  PSR27_OFFSET,688
.set  PSR28_OFFSET,696
.set  PSR29_OFFSET,704
.set  PSR30_OFFSET,712
.set  PSR31_OFFSET,720

.set  EXCEPTION_FRAME_END,728

.set 	IBAT0U,528
.set 	IBAT0L,529	
.set 	IBAT1U,530	
.set 	IBAT1L,531	
.set 	IBAT2U,532	
.set 	IBAT2L,533	
.set 	IBAT3U,534	
.set 	IBAT3L,535	
.set 	IBAT4U,560
.set 	IBAT4L,561
.set 	IBAT5U,562
.set 	IBAT5L,563
.set 	IBAT6U,564
.set 	IBAT6L,565
.set 	IBAT7U,566
.set 	IBAT7L,567

.set 	DBAT0U,536
.set 	DBAT0L,537	
.set 	DBAT1U,538	
.set 	DBAT1L,539	
.set 	DBAT2U,540	
.set 	DBAT2L,541	
.set 	DBAT3U,542	
.set 	DBAT3L,543
.set  DBAT4U,568
.set  DBAT4L,569
.set  DBAT5U,570
.set  DBAT5L,571
.set  DBAT6U,572
.set  DBAT6L,573
.set  DBAT7U,574
.set  DBAT7L,575

.set  HID0,1008
.set  HID1,1009
.set  HID2,920	
.set  HID4,1011

.set  GQR0,912
.set  GQR1,913
.set  GQR2,914
.set  GQR3,915
.set  GQR4,916
.set  GQR5,917
.set  GQR6,918
.set  GQR7,919

.set  L2CR,1017

.set  WPAR,921

.set  DMAU,922
.set  DMAL,923

.set  MSR_RI,0x00000002
.set  MSR_DR,0x00000010
.set  MSR_IR,0x00000020
.set  MSR_IP,0x00000040
.set  MSR_SE,0x00000400
.set  MSR_ME,0x00001000
.set  MSR_FP,0x00002000
.set  MSR_POW,0x00004000
.set  MSR_EE,0x00008000

.set  PPC_ALIGNMENT,8

.set  PPC_CACHE_ALIGNMENT,32

.global _start
_start :
  b _startup
  .long	0x5f617267

_startup :
  bl init_bat
  bl init_gprs
  bl init_fprs

init_bat :

init_gprs :
	li      r0,0
	li      r3,0
	li      r4,0
	li      r5,0
	li      r6,0
	li      r7,0
	li      r8,0
	li      r9,0
	li      r10,0
	li      r11,0
	li      r12,0
	li      r14,0
	li      r15,0
	li      r16,0
	li      r17,0
	li      r18,0
	li      r19,0
	li      r20,0
	li      r21,0
	li      r22,0
	li      r23,0
	li      r24,0
	li      r25,0
	li      r26,0
	li      r27,0
	li      r28,0
	li      r29,0
	li      r30,0
	li      r31,0

init_fprs : 


	.globl __realmode
__realmode:
	clrlwi	r3,r3,2
	mtsrr0	r3
	mfmsr	r3
	rlwinm	r3,r3,0,28,25
	mtsrr1	r3
	rfi

	.globl __configBATS
__configBATS:
	lis		r3,0x0011
	ori		r3,r3,0x0c64
	mtspr	HID0,r3
	isync

  li		r0,0
	mtspr	IBAT0U,r0; mtspr	IBAT1U,r0; mtspr	IBAT2U,r0; mtspr	IBAT3U,r0
	mtspr	DBAT0U,r0; mtspr	DBAT1U,r0; mtspr	DBAT2U,r0; mtspr	DBAT3U,r0