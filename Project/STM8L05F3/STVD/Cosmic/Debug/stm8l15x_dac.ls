   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 142 void DAC_DeInit(void)
  32                     ; 143 {
  33                     .text:	section	.text,new
  34  0000               f_DAC_DeInit:
  38                     ; 145   DAC->CH1CR1 = DAC_CR1_RESET_VALUE;
  40  0000 725f5380      	clr	21376
  41                     ; 146   DAC->CH1CR2 = DAC_CR2_RESET_VALUE;
  43  0004 725f5381      	clr	21377
  44                     ; 149   DAC->CH2CR1 = DAC_CR1_RESET_VALUE;
  46  0008 725f5382      	clr	21378
  47                     ; 150   DAC->CH2CR2 = DAC_CR2_RESET_VALUE;
  49  000c 725f5383      	clr	21379
  50                     ; 153   DAC->SWTRIGR = DAC_SWTRIGR_RESET_VALUE;
  52  0010 725f5384      	clr	21380
  53                     ; 156   DAC->SR = (uint8_t)~DAC_SR_RESET_VALUE;
  55  0014 35ff5385      	mov	21381,#255
  56                     ; 159   DAC->CH1RDHRH = DAC_RDHRH_RESET_VALUE;
  58  0018 725f5388      	clr	21384
  59                     ; 160   DAC->CH1RDHRL = DAC_RDHRL_RESET_VALUE;
  61  001c 725f5389      	clr	21385
  62                     ; 161   DAC->CH1LDHRH = DAC_LDHRH_RESET_VALUE;
  64  0020 725f538c      	clr	21388
  65                     ; 162   DAC->CH1LDHRL = DAC_LDHRL_RESET_VALUE;
  67  0024 725f538d      	clr	21389
  68                     ; 163   DAC->CH1DHR8 = DAC_DHR8_RESET_VALUE;
  70  0028 725f5390      	clr	21392
  71                     ; 166   DAC->CH2RDHRH = DAC_RDHRH_RESET_VALUE;
  73  002c 725f5394      	clr	21396
  74                     ; 167   DAC->CH2RDHRL = DAC_RDHRL_RESET_VALUE;
  76  0030 725f5395      	clr	21397
  77                     ; 168   DAC->CH2LDHRH = DAC_LDHRH_RESET_VALUE;
  79  0034 725f5398      	clr	21400
  80                     ; 169   DAC->CH2LDHRL = DAC_LDHRL_RESET_VALUE;
  82  0038 725f5399      	clr	21401
  83                     ; 170   DAC->CH2DHR8 = DAC_DHR8_RESET_VALUE;
  85  003c 725f539c      	clr	21404
  86                     ; 173   DAC->DCH1RDHRH = DAC_RDHRH_RESET_VALUE;
  88  0040 725f53a0      	clr	21408
  89                     ; 174   DAC->DCH1RDHRL = DAC_RDHRL_RESET_VALUE;
  91  0044 725f53a1      	clr	21409
  92                     ; 175   DAC->DCH2RDHRH = DAC_RDHRH_RESET_VALUE;
  94  0048 725f53a2      	clr	21410
  95                     ; 176   DAC->DCH2RDHRL = DAC_RDHRL_RESET_VALUE;
  97  004c 725f53a3      	clr	21411
  98                     ; 179   DAC->DCH1LDHRH = DAC_LDHRH_RESET_VALUE;
 100  0050 725f53a4      	clr	21412
 101                     ; 180   DAC->DCH1LDHRL = DAC_LDHRL_RESET_VALUE;
 103  0054 725f53a5      	clr	21413
 104                     ; 181   DAC->DCH2LDHRH = DAC_LDHRH_RESET_VALUE;
 106  0058 725f53a6      	clr	21414
 107                     ; 182   DAC->DCH2LDHRL = DAC_LDHRL_RESET_VALUE;
 109  005c 725f53a7      	clr	21415
 110                     ; 185   DAC->DCH1DHR8 = DAC_DHR8_RESET_VALUE;
 112  0060 725f53a8      	clr	21416
 113                     ; 186   DAC->DCH2DHR8 = DAC_DHR8_RESET_VALUE;
 115  0064 725f53a9      	clr	21417
 116                     ; 187 }
 119  0068 87            	retf
 273                     ; 208 void DAC_Init(DAC_Channel_TypeDef DAC_Channel,
 273                     ; 209               DAC_Trigger_TypeDef DAC_Trigger,
 273                     ; 210               DAC_OutputBuffer_TypeDef DAC_OutputBuffer)
 273                     ; 211 {
 274                     .text:	section	.text,new
 275  0000               f_DAC_Init:
 277  0000 89            	pushw	x
 278  0001 5203          	subw	sp,#3
 279       00000003      OFST:	set	3
 282                     ; 212   uint8_t tmpreg = 0;
 284  0003 7b03          	ld	a,(OFST+0,sp)
 285  0005 97            	ld	xl,a
 286                     ; 213   uint16_t tmpreg2 = 0;
 288  0006 1e01          	ldw	x,(OFST-2,sp)
 289                     ; 216   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 291                     ; 217   assert_param(IS_DAC_TRIGGER(DAC_Trigger));
 293                     ; 218   assert_param(IS_DAC_OUTPUT_BUFFER_STATE(DAC_OutputBuffer));
 295                     ; 221   tmpreg2 =  (uint16_t)((uint8_t)((uint8_t)DAC_Channel << 1));
 297  0008 7b04          	ld	a,(OFST+1,sp)
 298  000a 48            	sll	a
 299  000b 5f            	clrw	x
 300  000c 97            	ld	xl,a
 301  000d 1f01          	ldw	(OFST-2,sp),x
 302                     ; 222   tmpreg = *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2));
 304  000f 1e01          	ldw	x,(OFST-2,sp)
 305  0011 d65380        	ld	a,(21376,x)
 306  0014 6b03          	ld	(OFST+0,sp),a
 307                     ; 225   tmpreg &= (uint8_t)~(DAC_CR1_BOFF | DAC_CR1_TEN | DAC_CR1_TSEL );
 309  0016 7b03          	ld	a,(OFST+0,sp)
 310  0018 a4c1          	and	a,#193
 311  001a 6b03          	ld	(OFST+0,sp),a
 312                     ; 228   tmpreg |= (uint8_t)(DAC_OutputBuffer);
 314  001c 7b03          	ld	a,(OFST+0,sp)
 315  001e 1a09          	or	a,(OFST+6,sp)
 316  0020 6b03          	ld	(OFST+0,sp),a
 317                     ; 232   if (DAC_Trigger != DAC_Trigger_None)
 319  0022 7b05          	ld	a,(OFST+2,sp)
 320  0024 a130          	cp	a,#48
 321  0026 2708          	jreq	L111
 322                     ; 235     tmpreg |= (uint8_t)(DAC_CR1_TEN | DAC_Trigger) ;
 324  0028 7b05          	ld	a,(OFST+2,sp)
 325  002a aa04          	or	a,#4
 326  002c 1a03          	or	a,(OFST+0,sp)
 327  002e 6b03          	ld	(OFST+0,sp),a
 328  0030               L111:
 329                     ; 239   *(uint8_t*)((uint16_t)(DAC_BASE + CR1_Offset + tmpreg2)) = (uint8_t)tmpreg;
 331  0030 7b03          	ld	a,(OFST+0,sp)
 332  0032 1e01          	ldw	x,(OFST-2,sp)
 333  0034 d75380        	ld	(21376,x),a
 334                     ; 240 }
 337  0037 5b05          	addw	sp,#5
 338  0039 87            	retf
 409                     ; 254 void DAC_Cmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 409                     ; 255 {
 410                     .text:	section	.text,new
 411  0000               f_DAC_Cmd:
 413  0000 89            	pushw	x
 414  0001 89            	pushw	x
 415       00000002      OFST:	set	2
 418                     ; 256   uint16_t cr1addr = 0;
 420  0002 5f            	clrw	x
 421  0003 1f01          	ldw	(OFST-1,sp),x
 422                     ; 258   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 424                     ; 259   assert_param(IS_FUNCTIONAL_STATE(NewState));
 426                     ; 262   cr1addr = DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
 428  0005 7b03          	ld	a,(OFST+1,sp)
 429  0007 48            	sll	a
 430  0008 5f            	clrw	x
 431  0009 97            	ld	xl,a
 432  000a 1c5380        	addw	x,#21376
 433  000d 1f01          	ldw	(OFST-1,sp),x
 434                     ; 264   if (NewState != DISABLE)
 436  000f 0d04          	tnz	(OFST+2,sp)
 437  0011 2708          	jreq	L741
 438                     ; 267     (*(uint8_t*)(cr1addr)) |= DAC_CR1_EN;
 440  0013 1e01          	ldw	x,(OFST-1,sp)
 441  0015 f6            	ld	a,(x)
 442  0016 aa01          	or	a,#1
 443  0018 f7            	ld	(x),a
 445  0019 2006          	jra	L151
 446  001b               L741:
 447                     ; 272     (*(uint8_t*)(cr1addr)) &= (uint8_t) ~(DAC_CR1_EN);
 449  001b 1e01          	ldw	x,(OFST-1,sp)
 450  001d f6            	ld	a,(x)
 451  001e a4fe          	and	a,#254
 452  0020 f7            	ld	(x),a
 453  0021               L151:
 454                     ; 274 }
 457  0021 5b04          	addw	sp,#4
 458  0023 87            	retf
 503                     ; 286 void DAC_SoftwareTriggerCmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
 503                     ; 287 {
 504                     .text:	section	.text,new
 505  0000               f_DAC_SoftwareTriggerCmd:
 507  0000 89            	pushw	x
 508       00000000      OFST:	set	0
 511                     ; 289   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 513                     ; 290   assert_param(IS_FUNCTIONAL_STATE(NewState));
 515                     ; 292   if (NewState != DISABLE)
 517  0001 9f            	ld	a,xl
 518  0002 4d            	tnz	a
 519  0003 2714          	jreq	L571
 520                     ; 295     DAC->SWTRIGR |= (uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel);
 522  0005 9e            	ld	a,xh
 523  0006 5f            	clrw	x
 524  0007 97            	ld	xl,a
 525  0008 a601          	ld	a,#1
 526  000a 5d            	tnzw	x
 527  000b 2704          	jreq	L41
 528  000d               L61:
 529  000d 48            	sll	a
 530  000e 5a            	decw	x
 531  000f 26fc          	jrne	L61
 532  0011               L41:
 533  0011 ca5384        	or	a,21380
 534  0014 c75384        	ld	21380,a
 536  0017 2014          	jra	L771
 537  0019               L571:
 538                     ; 300     DAC->SWTRIGR &= (uint8_t)~((uint8_t)(DAC_SWTRIGR_SWTRIG1 << DAC_Channel));
 540  0019 7b01          	ld	a,(OFST+1,sp)
 541  001b 5f            	clrw	x
 542  001c 97            	ld	xl,a
 543  001d a601          	ld	a,#1
 544  001f 5d            	tnzw	x
 545  0020 2704          	jreq	L02
 546  0022               L22:
 547  0022 48            	sll	a
 548  0023 5a            	decw	x
 549  0024 26fc          	jrne	L22
 550  0026               L02:
 551  0026 43            	cpl	a
 552  0027 c45384        	and	a,21380
 553  002a c75384        	ld	21380,a
 554  002d               L771:
 555                     ; 302 }
 558  002d 85            	popw	x
 559  002e 87            	retf
 594                     ; 311 void DAC_DualSoftwareTriggerCmd(FunctionalState NewState)
 594                     ; 312 {
 595                     .text:	section	.text,new
 596  0000               f_DAC_DualSoftwareTriggerCmd:
 600                     ; 314   assert_param(IS_FUNCTIONAL_STATE(NewState));
 602                     ; 316   if (NewState != DISABLE)
 604  0000 4d            	tnz	a
 605  0001 270a          	jreq	L712
 606                     ; 319     DAC->SWTRIGR |= (DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2) ;
 608  0003 c65384        	ld	a,21380
 609  0006 aa03          	or	a,#3
 610  0008 c75384        	ld	21380,a
 612  000b 2008          	jra	L122
 613  000d               L712:
 614                     ; 324     DAC->SWTRIGR &= (uint8_t)~(DAC_SWTRIGR_SWTRIG1 | DAC_SWTRIGR_SWTRIG2);
 616  000d c65384        	ld	a,21380
 617  0010 a4fc          	and	a,#252
 618  0012 c75384        	ld	21380,a
 619  0015               L122:
 620                     ; 326 }
 623  0015 87            	retf
 705                     ; 342 void DAC_WaveGenerationCmd(DAC_Channel_TypeDef DAC_Channel,
 705                     ; 343                            DAC_Wave_TypeDef DAC_Wave,
 705                     ; 344                            FunctionalState NewState)
 705                     ; 345 {
 706                     .text:	section	.text,new
 707  0000               f_DAC_WaveGenerationCmd:
 709  0000 89            	pushw	x
 710  0001 88            	push	a
 711       00000001      OFST:	set	1
 714                     ; 346   uint8_t tmpreg = 0;
 716  0002 0f01          	clr	(OFST+0,sp)
 717                     ; 349   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 719                     ; 350   assert_param(IS_DAC_WAVE(DAC_Wave));
 721                     ; 351   assert_param(IS_FUNCTIONAL_STATE(NewState));
 723                     ; 354   tmpreg = (uint8_t)((*(uint8_t*)(uint16_t)(DAC_BASE + CR1_Offset + (uint8_t)((uint8_t)DAC_Channel << 1))) & (uint8_t)~(DAC_CR1_WAVEN));
 725  0004 9e            	ld	a,xh
 726  0005 48            	sll	a
 727  0006 5f            	clrw	x
 728  0007 97            	ld	xl,a
 729  0008 d65380        	ld	a,(21376,x)
 730  000b a43f          	and	a,#63
 731  000d 6b01          	ld	(OFST+0,sp),a
 732                     ; 356   if (NewState != DISABLE)
 734  000f 0d07          	tnz	(OFST+6,sp)
 735  0011 2706          	jreq	L362
 736                     ; 358     tmpreg |= (uint8_t)(DAC_Wave);
 738  0013 7b01          	ld	a,(OFST+0,sp)
 739  0015 1a03          	or	a,(OFST+2,sp)
 740  0017 6b01          	ld	(OFST+0,sp),a
 741  0019               L362:
 742                     ; 362   (*(uint8_t*) (uint16_t)(DAC_BASE + CR1_Offset +  (uint8_t)((uint8_t)DAC_Channel << 1))) = tmpreg;
 744  0019 7b02          	ld	a,(OFST+1,sp)
 745  001b 48            	sll	a
 746  001c 5f            	clrw	x
 747  001d 97            	ld	xl,a
 748  001e 7b01          	ld	a,(OFST+0,sp)
 749  0020 d75380        	ld	(21376,x),a
 750                     ; 364 }
 753  0023 5b03          	addw	sp,#3
 754  0025 87            	retf
 915                     ; 388 void DAC_SetNoiseWaveLFSR(DAC_Channel_TypeDef DAC_Channel, DAC_LFSRUnmask_TypeDef DAC_LFSRUnmask)
 915                     ; 389 {
 916                     .text:	section	.text,new
 917  0000               f_DAC_SetNoiseWaveLFSR:
 919  0000 89            	pushw	x
 920  0001 5203          	subw	sp,#3
 921       00000003      OFST:	set	3
 924                     ; 390   uint8_t tmpreg = 0;
 926  0003 7b01          	ld	a,(OFST-2,sp)
 927  0005 97            	ld	xl,a
 928                     ; 391   uint16_t cr2addr = 0;
 930  0006 1e02          	ldw	x,(OFST-1,sp)
 931                     ; 394   assert_param(IS_DAC_CHANNEL(DAC_Channel));
 933                     ; 395   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_LFSRUnmask));
 935                     ; 398   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
 937  0008 7b04          	ld	a,(OFST+1,sp)
 938  000a 48            	sll	a
 939  000b 5f            	clrw	x
 940  000c 97            	ld	xl,a
 941  000d 1c5381        	addw	x,#21377
 942  0010 1f02          	ldw	(OFST-1,sp),x
 943                     ; 399   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
 945  0012 1e02          	ldw	x,(OFST-1,sp)
 946  0014 f6            	ld	a,(x)
 947  0015 a4f0          	and	a,#240
 948  0017 6b01          	ld	(OFST-2,sp),a
 949                     ; 402   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_LFSRUnmask);
 951  0019 7b01          	ld	a,(OFST-2,sp)
 952  001b 1a05          	or	a,(OFST+2,sp)
 953  001d 1e02          	ldw	x,(OFST-1,sp)
 954  001f f7            	ld	(x),a
 955                     ; 403 }
 958  0020 5b05          	addw	sp,#5
 959  0022 87            	retf
1121                     ; 427 void DAC_SetTriangleWaveAmplitude(DAC_Channel_TypeDef DAC_Channel, DAC_TriangleAmplitude_TypeDef DAC_TriangleAmplitude)
1121                     ; 428 {
1122                     .text:	section	.text,new
1123  0000               f_DAC_SetTriangleWaveAmplitude:
1125  0000 89            	pushw	x
1126  0001 5203          	subw	sp,#3
1127       00000003      OFST:	set	3
1130                     ; 429   uint8_t tmpreg = 0;
1132  0003 7b01          	ld	a,(OFST-2,sp)
1133  0005 97            	ld	xl,a
1134                     ; 430   uint16_t cr2addr = 0;
1136  0006 1e02          	ldw	x,(OFST-1,sp)
1137                     ; 433   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1139                     ; 434   assert_param(IS_DAC_LFSR_UNMASK_TRIANGLE_AMPLITUDE(DAC_TriangleAmplitude));
1141                     ; 438   cr2addr = (uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1));
1143  0008 7b04          	ld	a,(OFST+1,sp)
1144  000a 48            	sll	a
1145  000b 5f            	clrw	x
1146  000c 97            	ld	xl,a
1147  000d 1c5381        	addw	x,#21377
1148  0010 1f02          	ldw	(OFST-1,sp),x
1149                     ; 439   tmpreg = (uint8_t)((*(uint8_t*)(cr2addr)) & (uint8_t)~(DAC_CR2_MAMPx));
1151  0012 1e02          	ldw	x,(OFST-1,sp)
1152  0014 f6            	ld	a,(x)
1153  0015 a4f0          	and	a,#240
1154  0017 6b01          	ld	(OFST-2,sp),a
1155                     ; 442   (*(uint8_t*)(cr2addr)) = (uint8_t)( tmpreg | DAC_TriangleAmplitude);
1157  0019 7b01          	ld	a,(OFST-2,sp)
1158  001b 1a05          	or	a,(OFST+2,sp)
1159  001d 1e02          	ldw	x,(OFST-1,sp)
1160  001f f7            	ld	(x),a
1161                     ; 443 }
1164  0020 5b05          	addw	sp,#5
1165  0022 87            	retf
1234                     ; 455 void DAC_SetChannel1Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1234                     ; 456 {
1235                     .text:	section	.text,new
1236  0000               f_DAC_SetChannel1Data:
1238  0000 88            	push	a
1239       00000000      OFST:	set	0
1242                     ; 458   assert_param(IS_DAC_ALIGN(DAC_Align));
1244                     ; 460   if (DAC_Align != DAC_Align_8b_R)
1246  0001 a108          	cp	a,#8
1247  0003 2712          	jreq	L364
1248                     ; 463     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1250  0005 5f            	clrw	x
1251  0006 97            	ld	xl,a
1252  0007 7b05          	ld	a,(OFST+5,sp)
1253  0009 d75388        	ld	(21384,x),a
1254                     ; 464     *(uint8_t*)((uint16_t)(DAC_BASE + CH1RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1256  000c 7b01          	ld	a,(OFST+1,sp)
1257  000e 5f            	clrw	x
1258  000f 97            	ld	xl,a
1259  0010 7b06          	ld	a,(OFST+6,sp)
1260  0012 d75389        	ld	(21385,x),a
1262  0015 2005          	jra	L564
1263  0017               L364:
1264                     ; 469     assert_param(IS_DAC_DATA_08R(DAC_Data));
1266                     ; 472     DAC->CH1DHR8 = (uint8_t)(DAC_Data);
1268  0017 7b06          	ld	a,(OFST+6,sp)
1269  0019 c75390        	ld	21392,a
1270  001c               L564:
1271                     ; 474 }
1274  001c 84            	pop	a
1275  001d 87            	retf
1317                     ; 486 void DAC_SetChannel2Data(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data)
1317                     ; 487 {
1318                     .text:	section	.text,new
1319  0000               f_DAC_SetChannel2Data:
1321  0000 88            	push	a
1322       00000000      OFST:	set	0
1325                     ; 489   assert_param(IS_DAC_ALIGN(DAC_Align));
1327                     ; 491   if (DAC_Align != DAC_Align_8b_R)
1329  0001 a108          	cp	a,#8
1330  0003 2712          	jreq	L705
1331                     ; 494     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + DAC_Align )) = (uint8_t)(((uint16_t)DAC_Data) >> 8);
1333  0005 5f            	clrw	x
1334  0006 97            	ld	xl,a
1335  0007 7b05          	ld	a,(OFST+5,sp)
1336  0009 d75394        	ld	(21396,x),a
1337                     ; 495     *(uint8_t*)((uint16_t)(DAC_BASE + CH2RDHRH_Offset + 1 + DAC_Align )) = (uint8_t)DAC_Data;
1339  000c 7b01          	ld	a,(OFST+1,sp)
1340  000e 5f            	clrw	x
1341  000f 97            	ld	xl,a
1342  0010 7b06          	ld	a,(OFST+6,sp)
1343  0012 d75395        	ld	(21397,x),a
1345  0015 2005          	jra	L115
1346  0017               L705:
1347                     ; 500     assert_param(IS_DAC_DATA_08R(DAC_Data));
1349                     ; 503     DAC->CH2DHR8 = (uint8_t)(DAC_Data);
1351  0017 7b06          	ld	a,(OFST+6,sp)
1352  0019 c7539c        	ld	21404,a
1353  001c               L115:
1354                     ; 505 }
1357  001c 84            	pop	a
1358  001d 87            	retf
1414                     ; 522 void DAC_SetDualChannelData(DAC_Align_TypeDef DAC_Align, uint16_t DAC_Data2, uint16_t DAC_Data1)
1414                     ; 523 {
1415                     .text:	section	.text,new
1416  0000               f_DAC_SetDualChannelData:
1418  0000 88            	push	a
1419  0001 89            	pushw	x
1420       00000002      OFST:	set	2
1423                     ; 524   uint16_t dchxrdhrhaddr = 0;
1425  0002 5f            	clrw	x
1426  0003 1f01          	ldw	(OFST-1,sp),x
1427                     ; 527   assert_param(IS_DAC_ALIGN(DAC_Align));
1429                     ; 529   if (DAC_Align != DAC_Align_8b_R)
1431  0005 a108          	cp	a,#8
1432  0007 2727          	jreq	L735
1433                     ; 532     dchxrdhrhaddr = (uint16_t)(DAC_BASE + DCH1RDHRH_Offset + DAC_Align);
1435  0009 a653          	ld	a,#83
1436  000b 97            	ld	xl,a
1437  000c a6a0          	ld	a,#160
1438  000e 1b03          	add	a,(OFST+1,sp)
1439  0010 2401          	jrnc	L24
1440  0012 5c            	incw	x
1441  0013               L24:
1442  0013 02            	rlwa	x,a
1443  0014 1f01          	ldw	(OFST-1,sp),x
1444  0016 01            	rrwa	x,a
1445                     ; 535     *(uint8_t*)(uint16_t)dchxrdhrhaddr = (uint8_t)(((uint16_t)DAC_Data1) >> 8);
1447  0017 7b09          	ld	a,(OFST+7,sp)
1448  0019 1e01          	ldw	x,(OFST-1,sp)
1449  001b f7            	ld	(x),a
1450                     ; 536     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 1) = (uint8_t)DAC_Data1;
1452  001c 7b0a          	ld	a,(OFST+8,sp)
1453  001e 1e01          	ldw	x,(OFST-1,sp)
1454  0020 e701          	ld	(1,x),a
1455                     ; 537     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 2) = (uint8_t)(((uint16_t)DAC_Data2) >> 8);
1457  0022 7b07          	ld	a,(OFST+5,sp)
1458  0024 1e01          	ldw	x,(OFST-1,sp)
1459  0026 e702          	ld	(2,x),a
1460                     ; 538     *(uint8_t*)(uint16_t)(dchxrdhrhaddr + 3) = (uint8_t)DAC_Data2;
1462  0028 7b08          	ld	a,(OFST+6,sp)
1463  002a 1e01          	ldw	x,(OFST-1,sp)
1464  002c e703          	ld	(3,x),a
1466  002e 200a          	jra	L145
1467  0030               L735:
1468                     ; 543     assert_param(IS_DAC_DATA_08R(DAC_Data1 | DAC_Data2));
1470                     ; 546     DAC->DCH1DHR8 = (uint8_t)(DAC_Data1);
1472  0030 7b0a          	ld	a,(OFST+8,sp)
1473  0032 c753a8        	ld	21416,a
1474                     ; 547     DAC->DCH2DHR8 = (uint8_t)(DAC_Data2);
1476  0035 7b08          	ld	a,(OFST+6,sp)
1477  0037 c753a9        	ld	21417,a
1478  003a               L145:
1479                     ; 549 }
1482  003a 5b03          	addw	sp,#3
1483  003c 87            	retf
1532                     ; 559 uint16_t DAC_GetDataOutputValue(DAC_Channel_TypeDef DAC_Channel)
1532                     ; 560 {
1533                     .text:	section	.text,new
1534  0000               f_DAC_GetDataOutputValue:
1536  0000 89            	pushw	x
1537       00000002      OFST:	set	2
1540                     ; 561   uint16_t outputdata = 0;
1542  0001 1e01          	ldw	x,(OFST-1,sp)
1543                     ; 562   uint16_t tmp = 0;
1545  0003 1e01          	ldw	x,(OFST-1,sp)
1546                     ; 565   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1548                     ; 567   if ( DAC_Channel ==  DAC_Channel_1)
1550  0005 4d            	tnz	a
1551  0006 2619          	jrne	L565
1552                     ; 570     tmp = (uint16_t)((uint16_t)DAC->CH1DORH << 8);
1554  0008 c653ac        	ld	a,21420
1555  000b 5f            	clrw	x
1556  000c 97            	ld	xl,a
1557  000d 4f            	clr	a
1558  000e 02            	rlwa	x,a
1559  000f 1f01          	ldw	(OFST-1,sp),x
1560                     ; 571     outputdata = (uint16_t)(tmp | (DAC->CH1DORL));
1562  0011 c653ad        	ld	a,21421
1563  0014 5f            	clrw	x
1564  0015 97            	ld	xl,a
1565  0016 01            	rrwa	x,a
1566  0017 1a02          	or	a,(OFST+0,sp)
1567  0019 01            	rrwa	x,a
1568  001a 1a01          	or	a,(OFST-1,sp)
1569  001c 01            	rrwa	x,a
1570  001d 1f01          	ldw	(OFST-1,sp),x
1572  001f 2017          	jra	L765
1573  0021               L565:
1574                     ; 576     tmp = (uint16_t)((uint16_t)DAC->CH2DORH << 8);
1576  0021 c653b0        	ld	a,21424
1577  0024 5f            	clrw	x
1578  0025 97            	ld	xl,a
1579  0026 4f            	clr	a
1580  0027 02            	rlwa	x,a
1581  0028 1f01          	ldw	(OFST-1,sp),x
1582                     ; 577     outputdata = (uint16_t)(tmp | (DAC->CH2DORL));
1584  002a c653b1        	ld	a,21425
1585  002d 5f            	clrw	x
1586  002e 97            	ld	xl,a
1587  002f 01            	rrwa	x,a
1588  0030 1a02          	or	a,(OFST+0,sp)
1589  0032 01            	rrwa	x,a
1590  0033 1a01          	or	a,(OFST-1,sp)
1591  0035 01            	rrwa	x,a
1592  0036 1f01          	ldw	(OFST-1,sp),x
1593  0038               L765:
1594                     ; 581   return (uint16_t)outputdata;
1596  0038 1e01          	ldw	x,(OFST-1,sp)
1599  003a 5b02          	addw	sp,#2
1600  003c 87            	retf
1651                     ; 613 void DAC_DMACmd(DAC_Channel_TypeDef DAC_Channel, FunctionalState NewState)
1651                     ; 614 {
1652                     .text:	section	.text,new
1653  0000               f_DAC_DMACmd:
1655  0000 89            	pushw	x
1656  0001 89            	pushw	x
1657       00000002      OFST:	set	2
1660                     ; 615   uint16_t cr2addr = 0;
1662  0002 5f            	clrw	x
1663  0003 1f01          	ldw	(OFST-1,sp),x
1664                     ; 618   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1666                     ; 619   assert_param(IS_FUNCTIONAL_STATE(NewState));
1668                     ; 622   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1670  0005 7b03          	ld	a,(OFST+1,sp)
1671  0007 48            	sll	a
1672  0008 5f            	clrw	x
1673  0009 97            	ld	xl,a
1674  000a 1c5381        	addw	x,#21377
1675  000d 1f01          	ldw	(OFST-1,sp),x
1676                     ; 624   if (NewState != DISABLE)
1678  000f 0d04          	tnz	(OFST+2,sp)
1679  0011 2708          	jreq	L516
1680                     ; 627     (*(uint8_t*)(cr2addr)) |= DAC_CR2_DMAEN;
1682  0013 1e01          	ldw	x,(OFST-1,sp)
1683  0015 f6            	ld	a,(x)
1684  0016 aa10          	or	a,#16
1685  0018 f7            	ld	(x),a
1687  0019 2006          	jra	L716
1688  001b               L516:
1689                     ; 632     (*(uint8_t*)(cr2addr)) &= (uint8_t)~(DAC_CR2_DMAEN);
1691  001b 1e01          	ldw	x,(OFST-1,sp)
1692  001d f6            	ld	a,(x)
1693  001e a4ef          	and	a,#239
1694  0020 f7            	ld	(x),a
1695  0021               L716:
1696                     ; 634 }
1699  0021 5b04          	addw	sp,#4
1700  0023 87            	retf
1774                     ; 667 void DAC_ITConfig(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT, FunctionalState NewState)
1774                     ; 668 {
1775                     .text:	section	.text,new
1776  0000               f_DAC_ITConfig:
1778  0000 89            	pushw	x
1779  0001 89            	pushw	x
1780       00000002      OFST:	set	2
1783                     ; 669   uint16_t cr2addr = 0;
1785  0002 5f            	clrw	x
1786  0003 1f01          	ldw	(OFST-1,sp),x
1787                     ; 672   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1789                     ; 673   assert_param(IS_FUNCTIONAL_STATE(NewState));
1791                     ; 674   assert_param(IS_DAC_IT(DAC_IT));
1793                     ; 677   cr2addr = DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 1);
1795  0005 7b03          	ld	a,(OFST+1,sp)
1796  0007 48            	sll	a
1797  0008 5f            	clrw	x
1798  0009 97            	ld	xl,a
1799  000a 1c5381        	addw	x,#21377
1800  000d 1f01          	ldw	(OFST-1,sp),x
1801                     ; 679   if (NewState != DISABLE)
1803  000f 0d08          	tnz	(OFST+6,sp)
1804  0011 2708          	jreq	L756
1805                     ; 682     (*(uint8_t*)(cr2addr)) |=  (uint8_t)(DAC_IT);
1807  0013 1e01          	ldw	x,(OFST-1,sp)
1808  0015 f6            	ld	a,(x)
1809  0016 1a04          	or	a,(OFST+2,sp)
1810  0018 f7            	ld	(x),a
1812  0019 2007          	jra	L166
1813  001b               L756:
1814                     ; 687     (*(uint8_t*)(cr2addr)) &= (uint8_t)(~(DAC_IT));
1816  001b 1e01          	ldw	x,(OFST-1,sp)
1817  001d 7b04          	ld	a,(OFST+2,sp)
1818  001f 43            	cpl	a
1819  0020 f4            	and	a,(x)
1820  0021 f7            	ld	(x),a
1821  0022               L166:
1822                     ; 689 }
1825  0022 5b04          	addw	sp,#4
1826  0024 87            	retf
1921                     ; 704 FlagStatus DAC_GetFlagStatus(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
1921                     ; 705 {
1922                     .text:	section	.text,new
1923  0000               f_DAC_GetFlagStatus:
1925  0000 89            	pushw	x
1926  0001 88            	push	a
1927       00000001      OFST:	set	1
1930                     ; 706   FlagStatus flagstatus = RESET;
1932  0002 7b01          	ld	a,(OFST+0,sp)
1933  0004 97            	ld	xl,a
1934                     ; 707   uint8_t flag = 0;
1936  0005 7b01          	ld	a,(OFST+0,sp)
1937  0007 97            	ld	xl,a
1938                     ; 710   assert_param(IS_DAC_CHANNEL(DAC_Channel));
1940                     ; 711   assert_param(IS_DAC_FLAG(DAC_FLAG));
1942                     ; 713   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
1944  0008 7b02          	ld	a,(OFST+1,sp)
1945  000a 5f            	clrw	x
1946  000b 97            	ld	xl,a
1947  000c 7b03          	ld	a,(OFST+2,sp)
1948  000e 5d            	tnzw	x
1949  000f 2704          	jreq	L45
1950  0011               L65:
1951  0011 48            	sll	a
1952  0012 5a            	decw	x
1953  0013 26fc          	jrne	L65
1954  0015               L45:
1955  0015 6b01          	ld	(OFST+0,sp),a
1956                     ; 716   if ((DAC->SR & flag ) != (uint8_t)RESET)
1958  0017 c65385        	ld	a,21381
1959  001a 1501          	bcp	a,(OFST+0,sp)
1960  001c 2706          	jreq	L137
1961                     ; 719     flagstatus = SET;
1963  001e a601          	ld	a,#1
1964  0020 6b01          	ld	(OFST+0,sp),a
1966  0022 2002          	jra	L337
1967  0024               L137:
1968                     ; 724     flagstatus = RESET;
1970  0024 0f01          	clr	(OFST+0,sp)
1971  0026               L337:
1972                     ; 728   return  flagstatus;
1974  0026 7b01          	ld	a,(OFST+0,sp)
1977  0028 5b03          	addw	sp,#3
1978  002a 87            	retf
2029                     ; 742 void DAC_ClearFlag(DAC_Channel_TypeDef DAC_Channel, DAC_FLAG_TypeDef DAC_FLAG)
2029                     ; 743 {
2030                     .text:	section	.text,new
2031  0000               f_DAC_ClearFlag:
2033  0000 89            	pushw	x
2034  0001 88            	push	a
2035       00000001      OFST:	set	1
2038                     ; 744   uint8_t flag = 0;
2040  0002 0f01          	clr	(OFST+0,sp)
2041                     ; 747   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2043                     ; 748   assert_param(IS_DAC_FLAG(DAC_FLAG));
2045                     ; 751   flag = (uint8_t)(DAC_FLAG << DAC_Channel);
2047  0004 9e            	ld	a,xh
2048  0005 5f            	clrw	x
2049  0006 97            	ld	xl,a
2050  0007 7b03          	ld	a,(OFST+2,sp)
2051  0009 5d            	tnzw	x
2052  000a 2704          	jreq	L26
2053  000c               L46:
2054  000c 48            	sll	a
2055  000d 5a            	decw	x
2056  000e 26fc          	jrne	L46
2057  0010               L26:
2058  0010 6b01          	ld	(OFST+0,sp),a
2059                     ; 754   DAC->SR = (uint8_t)(~flag);
2061  0012 7b01          	ld	a,(OFST+0,sp)
2062  0014 43            	cpl	a
2063  0015 c75385        	ld	21381,a
2064                     ; 755 }
2067  0018 5b03          	addw	sp,#3
2068  001a 87            	retf
2144                     ; 770 ITStatus DAC_GetITStatus(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2144                     ; 771 {
2145                     .text:	section	.text,new
2146  0000               f_DAC_GetITStatus:
2148  0000 89            	pushw	x
2149  0001 89            	pushw	x
2150       00000002      OFST:	set	2
2153                     ; 772   ITStatus itstatus = RESET;
2155  0002 7b02          	ld	a,(OFST+0,sp)
2156  0004 97            	ld	xl,a
2157                     ; 773   uint8_t enablestatus = 0;
2159  0005 7b01          	ld	a,(OFST-1,sp)
2160  0007 97            	ld	xl,a
2161                     ; 774   uint8_t flagstatus = 0;
2163  0008 7b02          	ld	a,(OFST+0,sp)
2164  000a 97            	ld	xl,a
2165                     ; 775   uint8_t tempreg = 0;
2167  000b 7b02          	ld	a,(OFST+0,sp)
2168  000d 97            	ld	xl,a
2169                     ; 778   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2171                     ; 779   assert_param(IS_DAC_IT(DAC_IT));
2173                     ; 782   tempreg = *(uint8_t*)(uint16_t)(DAC_BASE + CR2_Offset + (uint8_t)((uint8_t)DAC_Channel << 2));
2175  000e 7b03          	ld	a,(OFST+1,sp)
2176  0010 48            	sll	a
2177  0011 48            	sll	a
2178  0012 5f            	clrw	x
2179  0013 97            	ld	xl,a
2180  0014 d65381        	ld	a,(21377,x)
2181  0017 6b02          	ld	(OFST+0,sp),a
2182                     ; 783   enablestatus = (uint8_t)( tempreg & (uint8_t)((uint8_t)DAC_IT << DAC_Channel));
2184  0019 7b03          	ld	a,(OFST+1,sp)
2185  001b 5f            	clrw	x
2186  001c 97            	ld	xl,a
2187  001d 7b04          	ld	a,(OFST+2,sp)
2188  001f 5d            	tnzw	x
2189  0020 2704          	jreq	L07
2190  0022               L27:
2191  0022 48            	sll	a
2192  0023 5a            	decw	x
2193  0024 26fc          	jrne	L27
2194  0026               L07:
2195  0026 1402          	and	a,(OFST+0,sp)
2196  0028 6b01          	ld	(OFST-1,sp),a
2197                     ; 784   flagstatus = (uint8_t)(DAC->SR & (uint8_t)(DAC_IT >> ((uint8_t)0x05 - DAC_Channel)));
2199  002a a605          	ld	a,#5
2200  002c 1003          	sub	a,(OFST+1,sp)
2201  002e 5f            	clrw	x
2202  002f 97            	ld	xl,a
2203  0030 7b04          	ld	a,(OFST+2,sp)
2204  0032 5d            	tnzw	x
2205  0033 2704          	jreq	L47
2206  0035               L67:
2207  0035 44            	srl	a
2208  0036 5a            	decw	x
2209  0037 26fc          	jrne	L67
2210  0039               L47:
2211  0039 c45385        	and	a,21381
2212  003c 6b02          	ld	(OFST+0,sp),a
2213                     ; 787   if (((flagstatus) != (uint8_t)RESET) && enablestatus)
2215  003e 0d02          	tnz	(OFST+0,sp)
2216  0040 270a          	jreq	L5101
2218  0042 0d01          	tnz	(OFST-1,sp)
2219  0044 2706          	jreq	L5101
2220                     ; 790     itstatus = SET;
2222  0046 a601          	ld	a,#1
2223  0048 6b02          	ld	(OFST+0,sp),a
2225  004a 2002          	jra	L7101
2226  004c               L5101:
2227                     ; 795     itstatus = RESET;
2229  004c 0f02          	clr	(OFST+0,sp)
2230  004e               L7101:
2231                     ; 799   return  itstatus;
2233  004e 7b02          	ld	a,(OFST+0,sp)
2236  0050 5b04          	addw	sp,#4
2237  0052 87            	retf
2282                     ; 813 void DAC_ClearITPendingBit(DAC_Channel_TypeDef DAC_Channel, DAC_IT_TypeDef DAC_IT)
2282                     ; 814 {
2283                     .text:	section	.text,new
2284  0000               f_DAC_ClearITPendingBit:
2286  0000 89            	pushw	x
2287       00000000      OFST:	set	0
2290                     ; 816   assert_param(IS_DAC_CHANNEL(DAC_Channel));
2292                     ; 817   assert_param(IS_DAC_IT(DAC_IT));
2294                     ; 820   DAC->SR = (uint8_t)~(uint8_t)((uint8_t)DAC_IT >> (0x05 - DAC_Channel));
2296  0001 9e            	ld	a,xh
2297  0002 a005          	sub	a,#5
2298  0004 40            	neg	a
2299  0005 5f            	clrw	x
2300  0006 97            	ld	xl,a
2301  0007 7b02          	ld	a,(OFST+2,sp)
2302  0009 5d            	tnzw	x
2303  000a 2704          	jreq	L201
2304  000c               L401:
2305  000c 44            	srl	a
2306  000d 5a            	decw	x
2307  000e 26fc          	jrne	L401
2308  0010               L201:
2309  0010 43            	cpl	a
2310  0011 c75385        	ld	21381,a
2311                     ; 821 }
2314  0014 85            	popw	x
2315  0015 87            	retf
2327                     	xdef	f_DAC_ClearITPendingBit
2328                     	xdef	f_DAC_GetITStatus
2329                     	xdef	f_DAC_ClearFlag
2330                     	xdef	f_DAC_GetFlagStatus
2331                     	xdef	f_DAC_ITConfig
2332                     	xdef	f_DAC_DMACmd
2333                     	xdef	f_DAC_GetDataOutputValue
2334                     	xdef	f_DAC_SetDualChannelData
2335                     	xdef	f_DAC_SetChannel2Data
2336                     	xdef	f_DAC_SetChannel1Data
2337                     	xdef	f_DAC_SetTriangleWaveAmplitude
2338                     	xdef	f_DAC_SetNoiseWaveLFSR
2339                     	xdef	f_DAC_WaveGenerationCmd
2340                     	xdef	f_DAC_DualSoftwareTriggerCmd
2341                     	xdef	f_DAC_SoftwareTriggerCmd
2342                     	xdef	f_DAC_Cmd
2343                     	xdef	f_DAC_Init
2344                     	xdef	f_DAC_DeInit
2363                     	end
