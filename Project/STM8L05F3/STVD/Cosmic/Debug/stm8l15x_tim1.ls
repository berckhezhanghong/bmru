   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 181 void TIM1_DeInit(void)
  32                     ; 182 {
  33                     .text:	section	.text,new
  34  0000               f_TIM1_DeInit:
  38                     ; 183   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  40  0000 725f52b0      	clr	21168
  41                     ; 184   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  43  0004 725f52b1      	clr	21169
  44                     ; 185   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  46  0008 725f52b2      	clr	21170
  47                     ; 186   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  49  000c 725f52b3      	clr	21171
  50                     ; 187   TIM1->IER  = TIM1_IER_RESET_VALUE;
  52  0010 725f52b5      	clr	21173
  53                     ; 190   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  55  0014 725f52bd      	clr	21181
  56                     ; 191   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  58  0018 725f52be      	clr	21182
  59                     ; 193   TIM1->CCMR1 = 0x01;
  61  001c 350152b9      	mov	21177,#1
  62                     ; 194   TIM1->CCMR2 = 0x01;
  64  0020 350152ba      	mov	21178,#1
  65                     ; 195   TIM1->CCMR3 = 0x01;
  67  0024 350152bb      	mov	21179,#1
  68                     ; 196   TIM1->CCMR4 = 0x01;
  70  0028 350152bc      	mov	21180,#1
  71                     ; 198   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  73  002c 725f52bd      	clr	21181
  74                     ; 199   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  76  0030 725f52be      	clr	21182
  77                     ; 200   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  79  0034 725f52b9      	clr	21177
  80                     ; 201   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  82  0038 725f52ba      	clr	21178
  83                     ; 202   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
  85  003c 725f52bb      	clr	21179
  86                     ; 203   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
  88  0040 725f52bc      	clr	21180
  89                     ; 204   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
  91  0044 725f52bf      	clr	21183
  92                     ; 205   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
  94  0048 725f52c0      	clr	21184
  95                     ; 206   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
  97  004c 725f52c1      	clr	21185
  98                     ; 207   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 100  0050 725f52c2      	clr	21186
 101                     ; 208   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 103  0054 35ff52c3      	mov	21187,#255
 104                     ; 209   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 106  0058 35ff52c4      	mov	21188,#255
 107                     ; 210   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 109  005c 725f52c6      	clr	21190
 110                     ; 211   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 112  0060 725f52c7      	clr	21191
 113                     ; 212   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 115  0064 725f52c8      	clr	21192
 116                     ; 213   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 118  0068 725f52c9      	clr	21193
 119                     ; 214   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 121  006c 725f52ca      	clr	21194
 122                     ; 215   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 124  0070 725f52cb      	clr	21195
 125                     ; 216   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 127  0074 725f52cc      	clr	21196
 128                     ; 217   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 130  0078 725f52cd      	clr	21197
 131                     ; 218   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 133  007c 725f52d0      	clr	21200
 134                     ; 219   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 136  0080 350152b8      	mov	21176,#1
 137                     ; 220   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 139  0084 725f52cf      	clr	21199
 140                     ; 221   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 142  0088 725f52ce      	clr	21198
 143                     ; 222   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 145  008c 725f52c5      	clr	21189
 146                     ; 223   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 148  0090 725f52b6      	clr	21174
 149                     ; 224   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 151  0094 725f52b7      	clr	21175
 152                     ; 225 }
 155  0098 87            	retf
 257                     ; 241 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 257                     ; 242                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 257                     ; 243                        uint16_t TIM1_Period,
 257                     ; 244                        uint8_t TIM1_RepetitionCounter)
 257                     ; 245 {
 258                     .text:	section	.text,new
 259  0000               f_TIM1_TimeBaseInit:
 261  0000 89            	pushw	x
 262       00000000      OFST:	set	0
 265                     ; 247   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 267                     ; 251   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 269  0001 7b07          	ld	a,(OFST+7,sp)
 270  0003 c752c3        	ld	21187,a
 271                     ; 252   TIM1->ARRL = (uint8_t)(TIM1_Period);
 273  0006 7b08          	ld	a,(OFST+8,sp)
 274  0008 c752c4        	ld	21188,a
 275                     ; 255   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 277  000b 9e            	ld	a,xh
 278  000c c752c1        	ld	21185,a
 279                     ; 256   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 281  000f 9f            	ld	a,xl
 282  0010 c752c2        	ld	21186,a
 283                     ; 259   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 283                     ; 260                         | (uint8_t)(TIM1_CounterMode));
 285  0013 c652b0        	ld	a,21168
 286  0016 a48f          	and	a,#143
 287  0018 1a06          	or	a,(OFST+6,sp)
 288  001a c752b0        	ld	21168,a
 289                     ; 263   TIM1->RCR = TIM1_RepetitionCounter;
 291  001d 7b09          	ld	a,(OFST+9,sp)
 292  001f c752c5        	ld	21189,a
 293                     ; 265 }
 296  0022 85            	popw	x
 297  0023 87            	retf
 361                     ; 279 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 361                     ; 280 {
 362                     .text:	section	.text,new
 363  0000               f_TIM1_PrescalerConfig:
 365  0000 89            	pushw	x
 366       00000000      OFST:	set	0
 369                     ; 282   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 371                     ; 285   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 373  0001 9e            	ld	a,xh
 374  0002 c752c1        	ld	21185,a
 375                     ; 286   TIM1->PSCRL = (uint8_t)(Prescaler);
 377  0005 9f            	ld	a,xl
 378  0006 c752c2        	ld	21186,a
 379                     ; 289   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 381  0009 7b06          	ld	a,(OFST+6,sp)
 382  000b c752b8        	ld	21176,a
 383                     ; 290 }
 386  000e 85            	popw	x
 387  000f 87            	retf
 422                     ; 303 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 422                     ; 304 {
 423                     .text:	section	.text,new
 424  0000               f_TIM1_CounterModeConfig:
 426  0000 88            	push	a
 427       00000000      OFST:	set	0
 430                     ; 306   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 432                     ; 310   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 432                     ; 311                         | (uint8_t)TIM1_CounterMode);
 434  0001 c652b0        	ld	a,21168
 435  0004 a48f          	and	a,#143
 436  0006 1a01          	or	a,(OFST+1,sp)
 437  0008 c752b0        	ld	21168,a
 438                     ; 312 }
 441  000b 84            	pop	a
 442  000c 87            	retf
 473                     ; 320 void TIM1_SetCounter(uint16_t Counter)
 473                     ; 321 {
 474                     .text:	section	.text,new
 475  0000               f_TIM1_SetCounter:
 479                     ; 323   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 481  0000 9e            	ld	a,xh
 482  0001 c752bf        	ld	21183,a
 483                     ; 324   TIM1->CNTRL = (uint8_t)(Counter);
 485  0004 9f            	ld	a,xl
 486  0005 c752c0        	ld	21184,a
 487                     ; 325 }
 490  0008 87            	retf
 521                     ; 333 void TIM1_SetAutoreload(uint16_t Autoreload)
 521                     ; 334 {
 522                     .text:	section	.text,new
 523  0000               f_TIM1_SetAutoreload:
 527                     ; 336   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 529  0000 9e            	ld	a,xh
 530  0001 c752c3        	ld	21187,a
 531                     ; 337   TIM1->ARRL = (uint8_t)(Autoreload);
 533  0004 9f            	ld	a,xl
 534  0005 c752c4        	ld	21188,a
 535                     ; 338 }
 538  0008 87            	retf
 583                     ; 345 uint16_t TIM1_GetCounter(void)
 583                     ; 346 {
 584                     .text:	section	.text,new
 585  0000               f_TIM1_GetCounter:
 587  0000 5204          	subw	sp,#4
 588       00000004      OFST:	set	4
 591                     ; 348   uint16_t tmpcntr = 0;
 593  0002 1e03          	ldw	x,(OFST-1,sp)
 594                     ; 349   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 596  0004 7b01          	ld	a,(OFST-3,sp)
 597  0006 97            	ld	xl,a
 600  0007 7b02          	ld	a,(OFST-2,sp)
 601  0009 97            	ld	xl,a
 602                     ; 351   tmpcntrh = TIM1->CNTRH;
 604  000a c652bf        	ld	a,21183
 605  000d 6b02          	ld	(OFST-2,sp),a
 606                     ; 352   tmpcntrl = TIM1->CNTRL;
 608  000f c652c0        	ld	a,21184
 609  0012 6b01          	ld	(OFST-3,sp),a
 610                     ; 354   tmpcntr  = (uint16_t)(tmpcntrl);
 612  0014 7b01          	ld	a,(OFST-3,sp)
 613  0016 5f            	clrw	x
 614  0017 97            	ld	xl,a
 615  0018 1f03          	ldw	(OFST-1,sp),x
 616                     ; 355   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 618  001a 7b02          	ld	a,(OFST-2,sp)
 619  001c 5f            	clrw	x
 620  001d 97            	ld	xl,a
 621  001e 4f            	clr	a
 622  001f 02            	rlwa	x,a
 623  0020 01            	rrwa	x,a
 624  0021 1a04          	or	a,(OFST+0,sp)
 625  0023 01            	rrwa	x,a
 626  0024 1a03          	or	a,(OFST-1,sp)
 627  0026 01            	rrwa	x,a
 628  0027 1f03          	ldw	(OFST-1,sp),x
 629                     ; 358   return (uint16_t)tmpcntr;
 631  0029 1e03          	ldw	x,(OFST-1,sp)
 634  002b 5b04          	addw	sp,#4
 635  002d 87            	retf
 666                     ; 366 uint16_t TIM1_GetPrescaler(void)
 666                     ; 367 {
 667                     .text:	section	.text,new
 668  0000               f_TIM1_GetPrescaler:
 670  0000 89            	pushw	x
 671       00000002      OFST:	set	2
 674                     ; 368   uint16_t tmpreg = 0;
 676  0001 5f            	clrw	x
 677  0002 1f01          	ldw	(OFST-1,sp),x
 678                     ; 369   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 680  0004 c652c1        	ld	a,21185
 681  0007 5f            	clrw	x
 682  0008 97            	ld	xl,a
 683  0009 4f            	clr	a
 684  000a 02            	rlwa	x,a
 685  000b 1f01          	ldw	(OFST-1,sp),x
 686                     ; 371   return (uint16_t)(tmpreg | TIM1->PSCRL);
 688  000d c652c2        	ld	a,21186
 689  0010 5f            	clrw	x
 690  0011 97            	ld	xl,a
 691  0012 01            	rrwa	x,a
 692  0013 1a02          	or	a,(OFST+0,sp)
 693  0015 01            	rrwa	x,a
 694  0016 1a01          	or	a,(OFST-1,sp)
 695  0018 01            	rrwa	x,a
 698  0019 5b02          	addw	sp,#2
 699  001b 87            	retf
 754                     ; 380 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 754                     ; 381 {
 755                     .text:	section	.text,new
 756  0000               f_TIM1_UpdateDisableConfig:
 760                     ; 383   assert_param(IS_FUNCTIONAL_STATE(NewState));
 762                     ; 386   if (NewState != DISABLE)
 764  0000 4d            	tnz	a
 765  0001 2706          	jreq	L352
 766                     ; 388     TIM1->CR1 |= TIM1_CR1_UDIS;
 768  0003 721252b0      	bset	21168,#1
 770  0007 2004          	jra	L552
 771  0009               L352:
 772                     ; 392     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 774  0009 721352b0      	bres	21168,#1
 775  000d               L552:
 776                     ; 394 }
 779  000d 87            	retf
 836                     ; 404 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 836                     ; 405 {
 837                     .text:	section	.text,new
 838  0000               f_TIM1_UpdateRequestConfig:
 842                     ; 407   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 844                     ; 410   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 846  0000 4d            	tnz	a
 847  0001 2706          	jreq	L503
 848                     ; 412     TIM1->CR1 |= TIM1_CR1_URS;
 850  0003 721452b0      	bset	21168,#2
 852  0007 2004          	jra	L703
 853  0009               L503:
 854                     ; 416     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 856  0009 721552b0      	bres	21168,#2
 857  000d               L703:
 858                     ; 418 }
 861  000d 87            	retf
 896                     ; 426 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 896                     ; 427 {
 897                     .text:	section	.text,new
 898  0000               f_TIM1_ARRPreloadConfig:
 902                     ; 429   assert_param(IS_FUNCTIONAL_STATE(NewState));
 904                     ; 432   if (NewState != DISABLE)
 906  0000 4d            	tnz	a
 907  0001 2706          	jreq	L723
 908                     ; 434     TIM1->CR1 |= TIM1_CR1_ARPE;
 910  0003 721e52b0      	bset	21168,#7
 912  0007 2004          	jra	L133
 913  0009               L723:
 914                     ; 438     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 916  0009 721f52b0      	bres	21168,#7
 917  000d               L133:
 918                     ; 440 }
 921  000d 87            	retf
 977                     ; 450 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 977                     ; 451 {
 978                     .text:	section	.text,new
 979  0000               f_TIM1_SelectOnePulseMode:
 983                     ; 453   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
 985                     ; 456   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
 987  0000 4d            	tnz	a
 988  0001 2706          	jreq	L163
 989                     ; 458     TIM1->CR1 |= TIM1_CR1_OPM;
 991  0003 721652b0      	bset	21168,#3
 993  0007 2004          	jra	L363
 994  0009               L163:
 995                     ; 462     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
 997  0009 721752b0      	bres	21168,#3
 998  000d               L363:
 999                     ; 464 }
1002  000d 87            	retf
1036                     ; 472 void TIM1_Cmd(FunctionalState NewState)
1036                     ; 473 {
1037                     .text:	section	.text,new
1038  0000               f_TIM1_Cmd:
1042                     ; 475   assert_param(IS_FUNCTIONAL_STATE(NewState));
1044                     ; 478   if (NewState != DISABLE)
1046  0000 4d            	tnz	a
1047  0001 2706          	jreq	L304
1048                     ; 480     TIM1->CR1 |= TIM1_CR1_CEN;
1050  0003 721052b0      	bset	21168,#0
1052  0007 2004          	jra	L504
1053  0009               L304:
1054                     ; 484     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1056  0009 721152b0      	bres	21168,#0
1057  000d               L504:
1058                     ; 486 }
1061  000d 87            	retf
1343                     ; 577 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1343                     ; 578                   TIM1_OutputState_TypeDef TIM1_OutputState,
1343                     ; 579                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1343                     ; 580                   uint16_t TIM1_Pulse,
1343                     ; 581                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1343                     ; 582                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1343                     ; 583                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1343                     ; 584                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1343                     ; 585 {
1344                     .text:	section	.text,new
1345  0000               f_TIM1_OC1Init:
1347  0000 89            	pushw	x
1348  0001 5203          	subw	sp,#3
1349       00000003      OFST:	set	3
1352                     ; 587   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1354                     ; 588   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1356                     ; 589   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1358                     ; 590   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1360                     ; 591   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1362                     ; 592   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1364                     ; 593   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1366                     ; 597   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1366                     ; 598                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1368  0003 c652bd        	ld	a,21181
1369  0006 a4f0          	and	a,#240
1370  0008 c752bd        	ld	21181,a
1371                     ; 601   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1371                     ; 602                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1371                     ; 603                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1371                     ; 604                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1373  000b 7b0d          	ld	a,(OFST+10,sp)
1374  000d a408          	and	a,#8
1375  000f 6b03          	ld	(OFST+0,sp),a
1376  0011 7b0c          	ld	a,(OFST+9,sp)
1377  0013 a402          	and	a,#2
1378  0015 1a03          	or	a,(OFST+0,sp)
1379  0017 6b02          	ld	(OFST-1,sp),a
1380  0019 7b09          	ld	a,(OFST+6,sp)
1381  001b a404          	and	a,#4
1382  001d 6b01          	ld	(OFST-2,sp),a
1383  001f 9f            	ld	a,xl
1384  0020 a401          	and	a,#1
1385  0022 1a01          	or	a,(OFST-2,sp)
1386  0024 1a02          	or	a,(OFST-1,sp)
1387  0026 ca52bd        	or	a,21181
1388  0029 c752bd        	ld	21181,a
1389                     ; 607   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1389                     ; 608                           | (uint8_t)TIM1_OCMode);
1391  002c c652b9        	ld	a,21177
1392  002f a48f          	and	a,#143
1393  0031 1a04          	or	a,(OFST+1,sp)
1394  0033 c752b9        	ld	21177,a
1395                     ; 611   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1397  0036 c652d0        	ld	a,21200
1398  0039 a4fc          	and	a,#252
1399  003b c752d0        	ld	21200,a
1400                     ; 613   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1400                     ; 614                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1402  003e 7b0f          	ld	a,(OFST+12,sp)
1403  0040 a402          	and	a,#2
1404  0042 6b03          	ld	(OFST+0,sp),a
1405  0044 7b0e          	ld	a,(OFST+11,sp)
1406  0046 a401          	and	a,#1
1407  0048 1a03          	or	a,(OFST+0,sp)
1408  004a ca52d0        	or	a,21200
1409  004d c752d0        	ld	21200,a
1410                     ; 617   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1412  0050 7b0a          	ld	a,(OFST+7,sp)
1413  0052 c752c6        	ld	21190,a
1414                     ; 618   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1416  0055 7b0b          	ld	a,(OFST+8,sp)
1417  0057 c752c7        	ld	21191,a
1418                     ; 619 }
1421  005a 5b05          	addw	sp,#5
1422  005c 87            	retf
1523                     ; 658 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1523                     ; 659                   TIM1_OutputState_TypeDef TIM1_OutputState,
1523                     ; 660                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1523                     ; 661                   uint16_t TIM1_Pulse,
1523                     ; 662                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1523                     ; 663                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1523                     ; 664                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1523                     ; 665                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1523                     ; 666 {
1524                     .text:	section	.text,new
1525  0000               f_TIM1_OC2Init:
1527  0000 89            	pushw	x
1528  0001 5203          	subw	sp,#3
1529       00000003      OFST:	set	3
1532                     ; 669   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1534                     ; 670   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1536                     ; 671   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1538                     ; 672   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1540                     ; 673   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1542                     ; 674   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1544                     ; 675   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1546                     ; 679   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1548  0003 c652bd        	ld	a,21181
1549  0006 a40f          	and	a,#15
1550  0008 c752bd        	ld	21181,a
1551                     ; 682   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1551                     ; 683                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1553  000b 7b0d          	ld	a,(OFST+10,sp)
1554  000d a480          	and	a,#128
1555  000f 6b03          	ld	(OFST+0,sp),a
1556  0011 7b0c          	ld	a,(OFST+9,sp)
1557  0013 a420          	and	a,#32
1558  0015 1a03          	or	a,(OFST+0,sp)
1559  0017 6b02          	ld	(OFST-1,sp),a
1560  0019 7b09          	ld	a,(OFST+6,sp)
1561  001b a440          	and	a,#64
1562  001d 6b01          	ld	(OFST-2,sp),a
1563  001f 9f            	ld	a,xl
1564  0020 a410          	and	a,#16
1565  0022 1a01          	or	a,(OFST-2,sp)
1566  0024 1a02          	or	a,(OFST-1,sp)
1567  0026 ca52bd        	or	a,21181
1568  0029 c752bd        	ld	21181,a
1569                     ; 686   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1571  002c c652ba        	ld	a,21178
1572  002f a48f          	and	a,#143
1573  0031 1a04          	or	a,(OFST+1,sp)
1574  0033 c752ba        	ld	21178,a
1575                     ; 689   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1577  0036 c652d0        	ld	a,21200
1578  0039 a4f3          	and	a,#243
1579  003b c752d0        	ld	21200,a
1580                     ; 691   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1582  003e 7b0f          	ld	a,(OFST+12,sp)
1583  0040 a408          	and	a,#8
1584  0042 6b03          	ld	(OFST+0,sp),a
1585  0044 7b0e          	ld	a,(OFST+11,sp)
1586  0046 a404          	and	a,#4
1587  0048 1a03          	or	a,(OFST+0,sp)
1588  004a ca52d0        	or	a,21200
1589  004d c752d0        	ld	21200,a
1590                     ; 694   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1592  0050 7b0a          	ld	a,(OFST+7,sp)
1593  0052 c752c8        	ld	21192,a
1594                     ; 695   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1596  0055 7b0b          	ld	a,(OFST+8,sp)
1597  0057 c752c9        	ld	21193,a
1598                     ; 696 }
1601  005a 5b05          	addw	sp,#5
1602  005c 87            	retf
1703                     ; 735 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1703                     ; 736                   TIM1_OutputState_TypeDef TIM1_OutputState,
1703                     ; 737                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1703                     ; 738                   uint16_t TIM1_Pulse,
1703                     ; 739                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1703                     ; 740                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1703                     ; 741                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1703                     ; 742                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1703                     ; 743 {
1704                     .text:	section	.text,new
1705  0000               f_TIM1_OC3Init:
1707  0000 89            	pushw	x
1708  0001 5203          	subw	sp,#3
1709       00000003      OFST:	set	3
1712                     ; 746   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1714                     ; 747   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1716                     ; 748   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1718                     ; 749   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1720                     ; 750   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1722                     ; 751   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1724                     ; 752   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1726                     ; 756   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1728  0003 c652be        	ld	a,21182
1729  0006 a4f0          	and	a,#240
1730  0008 c752be        	ld	21182,a
1731                     ; 759   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1731                     ; 760                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1733  000b 7b0d          	ld	a,(OFST+10,sp)
1734  000d a408          	and	a,#8
1735  000f 6b03          	ld	(OFST+0,sp),a
1736  0011 7b0c          	ld	a,(OFST+9,sp)
1737  0013 a402          	and	a,#2
1738  0015 1a03          	or	a,(OFST+0,sp)
1739  0017 6b02          	ld	(OFST-1,sp),a
1740  0019 7b09          	ld	a,(OFST+6,sp)
1741  001b a404          	and	a,#4
1742  001d 6b01          	ld	(OFST-2,sp),a
1743  001f 9f            	ld	a,xl
1744  0020 a401          	and	a,#1
1745  0022 1a01          	or	a,(OFST-2,sp)
1746  0024 1a02          	or	a,(OFST-1,sp)
1747  0026 ca52be        	or	a,21182
1748  0029 c752be        	ld	21182,a
1749                     ; 763   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1751  002c c652bb        	ld	a,21179
1752  002f a48f          	and	a,#143
1753  0031 1a04          	or	a,(OFST+1,sp)
1754  0033 c752bb        	ld	21179,a
1755                     ; 766   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1757  0036 c652d0        	ld	a,21200
1758  0039 a4cf          	and	a,#207
1759  003b c752d0        	ld	21200,a
1760                     ; 768   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1762  003e 7b0f          	ld	a,(OFST+12,sp)
1763  0040 a420          	and	a,#32
1764  0042 6b03          	ld	(OFST+0,sp),a
1765  0044 7b0e          	ld	a,(OFST+11,sp)
1766  0046 a410          	and	a,#16
1767  0048 1a03          	or	a,(OFST+0,sp)
1768  004a ca52d0        	or	a,21200
1769  004d c752d0        	ld	21200,a
1770                     ; 771   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1772  0050 7b0a          	ld	a,(OFST+7,sp)
1773  0052 c752ca        	ld	21194,a
1774                     ; 772   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1776  0055 7b0b          	ld	a,(OFST+8,sp)
1777  0057 c752cb        	ld	21195,a
1778                     ; 773 }
1781  005a 5b05          	addw	sp,#5
1782  005c 87            	retf
1986                     ; 803 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1986                     ; 804                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1986                     ; 805                      uint8_t TIM1_DeadTime,
1986                     ; 806                      TIM1_BreakState_TypeDef TIM1_Break,
1986                     ; 807                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1986                     ; 808                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1986                     ; 809 {
1987                     .text:	section	.text,new
1988  0000               f_TIM1_BDTRConfig:
1990  0000 89            	pushw	x
1991  0001 88            	push	a
1992       00000001      OFST:	set	1
1995                     ; 812   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
1997                     ; 813   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
1999                     ; 814   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2001                     ; 815   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2003                     ; 816   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2005                     ; 818   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2007  0002 7b07          	ld	a,(OFST+6,sp)
2008  0004 c752cf        	ld	21199,a
2009                     ; 822   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2009                     ; 823                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2009                     ; 824                                       | (uint8_t)TIM1_AutomaticOutput));
2011  0007 7b08          	ld	a,(OFST+7,sp)
2012  0009 1a09          	or	a,(OFST+8,sp)
2013  000b 1a0a          	or	a,(OFST+9,sp)
2014  000d 6b01          	ld	(OFST+0,sp),a
2015  000f 9f            	ld	a,xl
2016  0010 1a02          	or	a,(OFST+1,sp)
2017  0012 1a01          	or	a,(OFST+0,sp)
2018  0014 c752ce        	ld	21198,a
2019                     ; 826 }
2022  0017 5b03          	addw	sp,#3
2023  0019 87            	retf
2058                     ; 834 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2058                     ; 835 {
2059                     .text:	section	.text,new
2060  0000               f_TIM1_CtrlPWMOutputs:
2064                     ; 837   assert_param(IS_FUNCTIONAL_STATE(NewState));
2066                     ; 841   if (NewState != DISABLE)
2068  0000 4d            	tnz	a
2069  0001 2706          	jreq	L1301
2070                     ; 843     TIM1->BKR |= TIM1_BKR_MOE;
2072  0003 721e52ce      	bset	21198,#7
2074  0007 2004          	jra	L3301
2075  0009               L1301:
2076                     ; 847     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2078  0009 721f52ce      	bres	21198,#7
2079  000d               L3301:
2080                     ; 849 }
2083  000d 87            	retf
2161                     ; 871 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2161                     ; 872 {
2162                     .text:	section	.text,new
2163  0000               f_TIM1_SelectOCxM:
2165  0000 89            	pushw	x
2166       00000000      OFST:	set	0
2169                     ; 874   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2171                     ; 875   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2173                     ; 877   if (TIM1_Channel == TIM1_Channel_1)
2175  0001 9e            	ld	a,xh
2176  0002 4d            	tnz	a
2177  0003 2610          	jrne	L3701
2178                     ; 880     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2180  0005 721152bd      	bres	21181,#0
2181                     ; 883     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2183  0009 c652b9        	ld	a,21177
2184  000c a48f          	and	a,#143
2185  000e 1a02          	or	a,(OFST+2,sp)
2186  0010 c752b9        	ld	21177,a
2188  0013 2024          	jra	L5701
2189  0015               L3701:
2190                     ; 885   else if (TIM1_Channel == TIM1_Channel_2)
2192  0015 7b01          	ld	a,(OFST+1,sp)
2193  0017 a101          	cp	a,#1
2194  0019 2610          	jrne	L7701
2195                     ; 888     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2197  001b 721952bd      	bres	21181,#4
2198                     ; 891     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2200  001f c652ba        	ld	a,21178
2201  0022 a48f          	and	a,#143
2202  0024 1a02          	or	a,(OFST+2,sp)
2203  0026 c752ba        	ld	21178,a
2205  0029 200e          	jra	L5701
2206  002b               L7701:
2207                     ; 896     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2209  002b 721152be      	bres	21182,#0
2210                     ; 899     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2212  002f c652bb        	ld	a,21179
2213  0032 a48f          	and	a,#143
2214  0034 1a02          	or	a,(OFST+2,sp)
2215  0036 c752bb        	ld	21179,a
2216  0039               L5701:
2217                     ; 902 }
2220  0039 85            	popw	x
2221  003a 87            	retf
2252                     ; 910 void TIM1_SetCompare1(uint16_t Compare1)
2252                     ; 911 {
2253                     .text:	section	.text,new
2254  0000               f_TIM1_SetCompare1:
2258                     ; 913   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2260  0000 9e            	ld	a,xh
2261  0001 c752c6        	ld	21190,a
2262                     ; 914   TIM1->CCR1L = (uint8_t)(Compare1);
2264  0004 9f            	ld	a,xl
2265  0005 c752c7        	ld	21191,a
2266                     ; 916 }
2269  0008 87            	retf
2300                     ; 924 void TIM1_SetCompare2(uint16_t Compare2)
2300                     ; 925 {
2301                     .text:	section	.text,new
2302  0000               f_TIM1_SetCompare2:
2306                     ; 927   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2308  0000 9e            	ld	a,xh
2309  0001 c752c8        	ld	21192,a
2310                     ; 928   TIM1->CCR2L = (uint8_t)(Compare2);
2312  0004 9f            	ld	a,xl
2313  0005 c752c9        	ld	21193,a
2314                     ; 929 }
2317  0008 87            	retf
2348                     ; 937 void TIM1_SetCompare3(uint16_t Compare3)
2348                     ; 938 {
2349                     .text:	section	.text,new
2350  0000               f_TIM1_SetCompare3:
2354                     ; 940   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2356  0000 9e            	ld	a,xh
2357  0001 c752ca        	ld	21194,a
2358                     ; 941   TIM1->CCR3L = (uint8_t)(Compare3);
2360  0004 9f            	ld	a,xl
2361  0005 c752cb        	ld	21195,a
2362                     ; 942 }
2365  0008 87            	retf
2396                     ; 950 void TIM1_SetCompare4(uint16_t Compare4)
2396                     ; 951 {
2397                     .text:	section	.text,new
2398  0000               f_TIM1_SetCompare4:
2402                     ; 953   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2404  0000 9e            	ld	a,xh
2405  0001 c752cc        	ld	21196,a
2406                     ; 954   TIM1->CCR4L = (uint8_t)(Compare4);
2408  0004 9f            	ld	a,xl
2409  0005 c752cd        	ld	21197,a
2410                     ; 955 }
2413  0008 87            	retf
2448                     ; 963 void TIM1_CCPreloadControl(FunctionalState NewState)
2448                     ; 964 {
2449                     .text:	section	.text,new
2450  0000               f_TIM1_CCPreloadControl:
2454                     ; 966   assert_param(IS_FUNCTIONAL_STATE(NewState));
2456                     ; 969   if (NewState != DISABLE)
2458  0000 4d            	tnz	a
2459  0001 2706          	jreq	L1021
2460                     ; 971     TIM1->CR2 |= TIM1_CR2_CCPC;
2462  0003 721052b1      	bset	21169,#0
2464  0007 2004          	jra	L3021
2465  0009               L1021:
2466                     ; 975     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2468  0009 721152b1      	bres	21169,#0
2469  000d               L3021:
2470                     ; 977 }
2473  000d 87            	retf
2530                     ; 987 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2530                     ; 988 {
2531                     .text:	section	.text,new
2532  0000               f_TIM1_ForcedOC1Config:
2534  0000 88            	push	a
2535       00000000      OFST:	set	0
2538                     ; 990   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2540                     ; 993   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2542  0001 c652b9        	ld	a,21177
2543  0004 a48f          	and	a,#143
2544  0006 1a01          	or	a,(OFST+1,sp)
2545  0008 c752b9        	ld	21177,a
2546                     ; 994 }
2549  000b 84            	pop	a
2550  000c 87            	retf
2585                     ; 1004 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2585                     ; 1005 {
2586                     .text:	section	.text,new
2587  0000               f_TIM1_ForcedOC2Config:
2589  0000 88            	push	a
2590       00000000      OFST:	set	0
2593                     ; 1007   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2595                     ; 1010   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2597  0001 c652ba        	ld	a,21178
2598  0004 a48f          	and	a,#143
2599  0006 1a01          	or	a,(OFST+1,sp)
2600  0008 c752ba        	ld	21178,a
2601                     ; 1011 }
2604  000b 84            	pop	a
2605  000c 87            	retf
2640                     ; 1021 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2640                     ; 1022 {
2641                     .text:	section	.text,new
2642  0000               f_TIM1_ForcedOC3Config:
2644  0000 88            	push	a
2645       00000000      OFST:	set	0
2648                     ; 1024   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2650                     ; 1027   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2652  0001 c652bb        	ld	a,21179
2653  0004 a48f          	and	a,#143
2654  0006 1a01          	or	a,(OFST+1,sp)
2655  0008 c752bb        	ld	21179,a
2656                     ; 1028 }
2659  000b 84            	pop	a
2660  000c 87            	retf
2695                     ; 1036 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2695                     ; 1037 {
2696                     .text:	section	.text,new
2697  0000               f_TIM1_OC1PreloadConfig:
2701                     ; 1039   assert_param(IS_FUNCTIONAL_STATE(NewState));
2703                     ; 1042   if (NewState != DISABLE)
2705  0000 4d            	tnz	a
2706  0001 2706          	jreq	L5031
2707                     ; 1044     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2709  0003 721652b9      	bset	21177,#3
2711  0007 2004          	jra	L7031
2712  0009               L5031:
2713                     ; 1048     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2715  0009 721752b9      	bres	21177,#3
2716  000d               L7031:
2717                     ; 1050 }
2720  000d 87            	retf
2755                     ; 1058 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2755                     ; 1059 {
2756                     .text:	section	.text,new
2757  0000               f_TIM1_OC2PreloadConfig:
2761                     ; 1061   assert_param(IS_FUNCTIONAL_STATE(NewState));
2763                     ; 1064   if (NewState != DISABLE)
2765  0000 4d            	tnz	a
2766  0001 2706          	jreq	L7231
2767                     ; 1066     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2769  0003 721652ba      	bset	21178,#3
2771  0007 2004          	jra	L1331
2772  0009               L7231:
2773                     ; 1070     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2775  0009 721752ba      	bres	21178,#3
2776  000d               L1331:
2777                     ; 1072 }
2780  000d 87            	retf
2815                     ; 1080 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2815                     ; 1081 {
2816                     .text:	section	.text,new
2817  0000               f_TIM1_OC3PreloadConfig:
2821                     ; 1083   assert_param(IS_FUNCTIONAL_STATE(NewState));
2823                     ; 1086   if (NewState != DISABLE)
2825  0000 4d            	tnz	a
2826  0001 2706          	jreq	L1531
2827                     ; 1088     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2829  0003 721652bb      	bset	21179,#3
2831  0007 2004          	jra	L3531
2832  0009               L1531:
2833                     ; 1092     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2835  0009 721752bb      	bres	21179,#3
2836  000d               L3531:
2837                     ; 1094 }
2840  000d 87            	retf
2875                     ; 1102 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2875                     ; 1103 {
2876                     .text:	section	.text,new
2877  0000               f_TIM1_OC4PreloadConfig:
2881                     ; 1105   assert_param(IS_FUNCTIONAL_STATE(NewState));
2883                     ; 1108   if (NewState != DISABLE)
2885  0000 4d            	tnz	a
2886  0001 2706          	jreq	L3731
2887                     ; 1110     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2889  0003 721652bc      	bset	21180,#3
2891  0007 2004          	jra	L5731
2892  0009               L3731:
2893                     ; 1114     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2895  0009 721752bc      	bres	21180,#3
2896  000d               L5731:
2897                     ; 1116 }
2900  000d 87            	retf
2934                     ; 1124 void TIM1_OC1FastConfig(FunctionalState NewState)
2934                     ; 1125 {
2935                     .text:	section	.text,new
2936  0000               f_TIM1_OC1FastConfig:
2940                     ; 1127   assert_param(IS_FUNCTIONAL_STATE(NewState));
2942                     ; 1130   if (NewState != DISABLE)
2944  0000 4d            	tnz	a
2945  0001 2706          	jreq	L5141
2946                     ; 1132     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2948  0003 721452b9      	bset	21177,#2
2950  0007 2004          	jra	L7141
2951  0009               L5141:
2952                     ; 1136     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2954  0009 721552b9      	bres	21177,#2
2955  000d               L7141:
2956                     ; 1138 }
2959  000d 87            	retf
2993                     ; 1146 void TIM1_OC2FastConfig(FunctionalState NewState)
2993                     ; 1147 {
2994                     .text:	section	.text,new
2995  0000               f_TIM1_OC2FastConfig:
2999                     ; 1149   assert_param(IS_FUNCTIONAL_STATE(NewState));
3001                     ; 1152   if (NewState != DISABLE)
3003  0000 4d            	tnz	a
3004  0001 2706          	jreq	L7341
3005                     ; 1154     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3007  0003 721452ba      	bset	21178,#2
3009  0007 2004          	jra	L1441
3010  0009               L7341:
3011                     ; 1158     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3013  0009 721552ba      	bres	21178,#2
3014  000d               L1441:
3015                     ; 1160 }
3018  000d 87            	retf
3052                     ; 1168 void TIM1_OC3FastConfig(FunctionalState NewState)
3052                     ; 1169 {
3053                     .text:	section	.text,new
3054  0000               f_TIM1_OC3FastConfig:
3058                     ; 1171   assert_param(IS_FUNCTIONAL_STATE(NewState));
3060                     ; 1174   if (NewState != DISABLE)
3062  0000 4d            	tnz	a
3063  0001 2706          	jreq	L1641
3064                     ; 1176     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3066  0003 721452bb      	bset	21179,#2
3068  0007 2004          	jra	L3641
3069  0009               L1641:
3070                     ; 1180     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3072  0009 721552bb      	bres	21179,#2
3073  000d               L3641:
3074                     ; 1182 }
3077  000d 87            	retf
3111                     ; 1190 void TIM1_ClearOC1Ref(FunctionalState NewState)
3111                     ; 1191 {
3112                     .text:	section	.text,new
3113  0000               f_TIM1_ClearOC1Ref:
3117                     ; 1193   assert_param(IS_FUNCTIONAL_STATE(NewState));
3119                     ; 1196   if (NewState != DISABLE)
3121  0000 4d            	tnz	a
3122  0001 2706          	jreq	L3051
3123                     ; 1198     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3125  0003 721e52b9      	bset	21177,#7
3127  0007 2004          	jra	L5051
3128  0009               L3051:
3129                     ; 1202     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3131  0009 721f52b9      	bres	21177,#7
3132  000d               L5051:
3133                     ; 1204 }
3136  000d 87            	retf
3170                     ; 1212 void TIM1_ClearOC2Ref(FunctionalState NewState)
3170                     ; 1213 {
3171                     .text:	section	.text,new
3172  0000               f_TIM1_ClearOC2Ref:
3176                     ; 1215   assert_param(IS_FUNCTIONAL_STATE(NewState));
3178                     ; 1218   if (NewState != DISABLE)
3180  0000 4d            	tnz	a
3181  0001 2706          	jreq	L5251
3182                     ; 1220     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3184  0003 721e52ba      	bset	21178,#7
3186  0007 2004          	jra	L7251
3187  0009               L5251:
3188                     ; 1224     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3190  0009 721f52ba      	bres	21178,#7
3191  000d               L7251:
3192                     ; 1226 }
3195  000d 87            	retf
3229                     ; 1234 void TIM1_ClearOC3Ref(FunctionalState NewState)
3229                     ; 1235 {
3230                     .text:	section	.text,new
3231  0000               f_TIM1_ClearOC3Ref:
3235                     ; 1237   assert_param(IS_FUNCTIONAL_STATE(NewState));
3237                     ; 1240   if (NewState != DISABLE)
3239  0000 4d            	tnz	a
3240  0001 2706          	jreq	L7451
3241                     ; 1242     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3243  0003 721e52bb      	bset	21179,#7
3245  0007 2004          	jra	L1551
3246  0009               L7451:
3247                     ; 1246     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3249  0009 721f52bb      	bres	21179,#7
3250  000d               L1551:
3251                     ; 1248 }
3254  000d 87            	retf
3288                     ; 1256 void TIM1_ClearOC4Ref(FunctionalState NewState)
3288                     ; 1257 {
3289                     .text:	section	.text,new
3290  0000               f_TIM1_ClearOC4Ref:
3294                     ; 1259   assert_param(IS_FUNCTIONAL_STATE(NewState));
3296                     ; 1262   if (NewState != DISABLE)
3298  0000 4d            	tnz	a
3299  0001 2706          	jreq	L1751
3300                     ; 1264     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3302  0003 721e52bc      	bset	21180,#7
3304  0007 2004          	jra	L3751
3305  0009               L1751:
3306                     ; 1268     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3308  0009 721f52bc      	bres	21180,#7
3309  000d               L3751:
3310                     ; 1270 }
3313  000d 87            	retf
3348                     ; 1280 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3348                     ; 1281 {
3349                     .text:	section	.text,new
3350  0000               f_TIM1_OC1PolarityConfig:
3354                     ; 1283   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3356                     ; 1286   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3358  0000 4d            	tnz	a
3359  0001 2706          	jreq	L3161
3360                     ; 1288     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3362  0003 721252bd      	bset	21181,#1
3364  0007 2004          	jra	L5161
3365  0009               L3161:
3366                     ; 1292     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3368  0009 721352bd      	bres	21181,#1
3369  000d               L5161:
3370                     ; 1294 }
3373  000d 87            	retf
3408                     ; 1304 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3408                     ; 1305 {
3409                     .text:	section	.text,new
3410  0000               f_TIM1_OC1NPolarityConfig:
3414                     ; 1307   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3416                     ; 1310   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3418  0000 4d            	tnz	a
3419  0001 2706          	jreq	L5361
3420                     ; 1312     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3422  0003 721652bd      	bset	21181,#3
3424  0007 2004          	jra	L7361
3425  0009               L5361:
3426                     ; 1316     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3428  0009 721752bd      	bres	21181,#3
3429  000d               L7361:
3430                     ; 1318 }
3433  000d 87            	retf
3468                     ; 1328 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3468                     ; 1329 {
3469                     .text:	section	.text,new
3470  0000               f_TIM1_OC2PolarityConfig:
3474                     ; 1331   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3476                     ; 1334   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3478  0000 4d            	tnz	a
3479  0001 2706          	jreq	L7561
3480                     ; 1336     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3482  0003 721a52bd      	bset	21181,#5
3484  0007 2004          	jra	L1661
3485  0009               L7561:
3486                     ; 1340     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3488  0009 721b52bd      	bres	21181,#5
3489  000d               L1661:
3490                     ; 1342 }
3493  000d 87            	retf
3528                     ; 1352 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3528                     ; 1353 {
3529                     .text:	section	.text,new
3530  0000               f_TIM1_OC2NPolarityConfig:
3534                     ; 1355   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3536                     ; 1358   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3538  0000 4d            	tnz	a
3539  0001 2706          	jreq	L1071
3540                     ; 1360     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3542  0003 721e52bd      	bset	21181,#7
3544  0007 2004          	jra	L3071
3545  0009               L1071:
3546                     ; 1364     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3548  0009 721f52bd      	bres	21181,#7
3549  000d               L3071:
3550                     ; 1366 }
3553  000d 87            	retf
3588                     ; 1376 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3588                     ; 1377 {
3589                     .text:	section	.text,new
3590  0000               f_TIM1_OC3PolarityConfig:
3594                     ; 1379   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3596                     ; 1382   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3598  0000 4d            	tnz	a
3599  0001 2706          	jreq	L3271
3600                     ; 1384     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3602  0003 721252be      	bset	21182,#1
3604  0007 2004          	jra	L5271
3605  0009               L3271:
3606                     ; 1388     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3608  0009 721352be      	bres	21182,#1
3609  000d               L5271:
3610                     ; 1390 }
3613  000d 87            	retf
3648                     ; 1400 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3648                     ; 1401 {
3649                     .text:	section	.text,new
3650  0000               f_TIM1_OC3NPolarityConfig:
3654                     ; 1403   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3656                     ; 1406   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3658  0000 4d            	tnz	a
3659  0001 2706          	jreq	L5471
3660                     ; 1408     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3662  0003 721652be      	bset	21182,#3
3664  0007 2004          	jra	L7471
3665  0009               L5471:
3666                     ; 1412     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3668  0009 721752be      	bres	21182,#3
3669  000d               L7471:
3670                     ; 1414 }
3673  000d 87            	retf
3731                     ; 1424 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3731                     ; 1425 {
3732                     .text:	section	.text,new
3733  0000               f_TIM1_SelectOCREFClear:
3737                     ; 1427   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3739                     ; 1430   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3741  0000 721752b2      	bres	21170,#3
3742                     ; 1431   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3744  0004 ca52b2        	or	a,21170
3745  0007 c752b2        	ld	21170,a
3746                     ; 1432 }
3749  000a 87            	retf
3783                     ; 1440 void TIM1_SelectCOM(FunctionalState NewState)
3783                     ; 1441 {
3784                     .text:	section	.text,new
3785  0000               f_TIM1_SelectCOM:
3789                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3791                     ; 1446   if (NewState != DISABLE)
3793  0000 4d            	tnz	a
3794  0001 2706          	jreq	L5102
3795                     ; 1448     TIM1->CR2 |= TIM1_CR2_CCUS;
3797  0003 721452b1      	bset	21169,#2
3799  0007 2004          	jra	L7102
3800  0009               L5102:
3801                     ; 1452     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3803  0009 721552b1      	bres	21169,#2
3804  000d               L7102:
3805                     ; 1454 }
3808  000d 87            	retf
3852                     ; 1468 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3852                     ; 1469 {
3853                     .text:	section	.text,new
3854  0000               f_TIM1_CCxCmd:
3856  0000 89            	pushw	x
3857       00000000      OFST:	set	0
3860                     ; 1471   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3862                     ; 1472   assert_param(IS_FUNCTIONAL_STATE(NewState));
3864                     ; 1474   if (TIM1_Channel == TIM1_Channel_1)
3866  0001 9e            	ld	a,xh
3867  0002 4d            	tnz	a
3868  0003 2610          	jrne	L3402
3869                     ; 1477     if (NewState != DISABLE)
3871  0005 9f            	ld	a,xl
3872  0006 4d            	tnz	a
3873  0007 2706          	jreq	L5402
3874                     ; 1479       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3876  0009 721052bd      	bset	21181,#0
3878  000d 2040          	jra	L1502
3879  000f               L5402:
3880                     ; 1483       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3882  000f 721152bd      	bres	21181,#0
3883  0013 203a          	jra	L1502
3884  0015               L3402:
3885                     ; 1486   else if (TIM1_Channel == TIM1_Channel_2)
3887  0015 7b01          	ld	a,(OFST+1,sp)
3888  0017 a101          	cp	a,#1
3889  0019 2610          	jrne	L3502
3890                     ; 1489     if (NewState != DISABLE)
3892  001b 0d02          	tnz	(OFST+2,sp)
3893  001d 2706          	jreq	L5502
3894                     ; 1491       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3896  001f 721852bd      	bset	21181,#4
3898  0023 202a          	jra	L1502
3899  0025               L5502:
3900                     ; 1495       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3902  0025 721952bd      	bres	21181,#4
3903  0029 2024          	jra	L1502
3904  002b               L3502:
3905                     ; 1498   else if (TIM1_Channel == TIM1_Channel_3)
3907  002b 7b01          	ld	a,(OFST+1,sp)
3908  002d a102          	cp	a,#2
3909  002f 2610          	jrne	L3602
3910                     ; 1501     if (NewState != DISABLE)
3912  0031 0d02          	tnz	(OFST+2,sp)
3913  0033 2706          	jreq	L5602
3914                     ; 1503       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3916  0035 721052be      	bset	21182,#0
3918  0039 2014          	jra	L1502
3919  003b               L5602:
3920                     ; 1507       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3922  003b 721152be      	bres	21182,#0
3923  003f 200e          	jra	L1502
3924  0041               L3602:
3925                     ; 1513     if (NewState != DISABLE)
3927  0041 0d02          	tnz	(OFST+2,sp)
3928  0043 2706          	jreq	L3702
3929                     ; 1515       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3931  0045 721852be      	bset	21182,#4
3933  0049 2004          	jra	L1502
3934  004b               L3702:
3935                     ; 1519       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3937  004b 721952be      	bres	21182,#4
3938  004f               L1502:
3939                     ; 1522 }
3942  004f 85            	popw	x
3943  0050 87            	retf
3987                     ; 1535 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3987                     ; 1536 {
3988                     .text:	section	.text,new
3989  0000               f_TIM1_CCxNCmd:
3991  0000 89            	pushw	x
3992       00000000      OFST:	set	0
3995                     ; 1538   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
3997                     ; 1539   assert_param(IS_FUNCTIONAL_STATE(NewState));
3999                     ; 1541   if (TIM1_Channel == TIM1_Channel_1)
4001  0001 9e            	ld	a,xh
4002  0002 4d            	tnz	a
4003  0003 2610          	jrne	L1212
4004                     ; 1544     if (NewState != DISABLE)
4006  0005 9f            	ld	a,xl
4007  0006 4d            	tnz	a
4008  0007 2706          	jreq	L3212
4009                     ; 1546       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4011  0009 721452bd      	bset	21181,#2
4013  000d 202a          	jra	L7212
4014  000f               L3212:
4015                     ; 1550       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4017  000f 721552bd      	bres	21181,#2
4018  0013 2024          	jra	L7212
4019  0015               L1212:
4020                     ; 1553   else if (TIM1_Channel == TIM1_Channel_2)
4022  0015 7b01          	ld	a,(OFST+1,sp)
4023  0017 a101          	cp	a,#1
4024  0019 2610          	jrne	L1312
4025                     ; 1556     if (NewState != DISABLE)
4027  001b 0d02          	tnz	(OFST+2,sp)
4028  001d 2706          	jreq	L3312
4029                     ; 1558       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4031  001f 721c52bd      	bset	21181,#6
4033  0023 2014          	jra	L7212
4034  0025               L3312:
4035                     ; 1562       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4037  0025 721d52bd      	bres	21181,#6
4038  0029 200e          	jra	L7212
4039  002b               L1312:
4040                     ; 1568     if (NewState != DISABLE)
4042  002b 0d02          	tnz	(OFST+2,sp)
4043  002d 2706          	jreq	L1412
4044                     ; 1570       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4046  002f 721452be      	bset	21182,#2
4048  0033 2004          	jra	L7212
4049  0035               L1412:
4050                     ; 1574       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4052  0035 721552be      	bres	21182,#2
4053  0039               L7212:
4054                     ; 1577 }
4057  0039 85            	popw	x
4058  003a 87            	retf
4223                     ; 1664 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4223                     ; 1665                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4223                     ; 1666                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4223                     ; 1667                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4223                     ; 1668                  uint8_t TIM1_ICFilter)
4223                     ; 1669 {
4224                     .text:	section	.text,new
4225  0000               f_TIM1_ICInit:
4227  0000 89            	pushw	x
4228       00000000      OFST:	set	0
4231                     ; 1672   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4233                     ; 1673   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4235                     ; 1674   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4237                     ; 1675   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4239                     ; 1676   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4241                     ; 1678   if (TIM1_Channel == TIM1_Channel_1)
4243  0001 9e            	ld	a,xh
4244  0002 4d            	tnz	a
4245  0003 2616          	jrne	L7322
4246                     ; 1681     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4248  0005 7b08          	ld	a,(OFST+8,sp)
4249  0007 88            	push	a
4250  0008 7b07          	ld	a,(OFST+7,sp)
4251  000a 97            	ld	xl,a
4252  000b 7b03          	ld	a,(OFST+3,sp)
4253  000d 95            	ld	xh,a
4254  000e 8d000000      	callf	L3f_TI1_Config
4256  0012 84            	pop	a
4257                     ; 1683     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4259  0013 7b07          	ld	a,(OFST+7,sp)
4260  0015 8d000000      	callf	f_TIM1_SetIC1Prescaler
4263  0019 204c          	jra	L1422
4264  001b               L7322:
4265                     ; 1685   else if (TIM1_Channel == TIM1_Channel_2)
4267  001b 7b01          	ld	a,(OFST+1,sp)
4268  001d a101          	cp	a,#1
4269  001f 2616          	jrne	L3422
4270                     ; 1688     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4272  0021 7b08          	ld	a,(OFST+8,sp)
4273  0023 88            	push	a
4274  0024 7b07          	ld	a,(OFST+7,sp)
4275  0026 97            	ld	xl,a
4276  0027 7b03          	ld	a,(OFST+3,sp)
4277  0029 95            	ld	xh,a
4278  002a 8d000000      	callf	L5f_TI2_Config
4280  002e 84            	pop	a
4281                     ; 1690     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4283  002f 7b07          	ld	a,(OFST+7,sp)
4284  0031 8d000000      	callf	f_TIM1_SetIC2Prescaler
4287  0035 2030          	jra	L1422
4288  0037               L3422:
4289                     ; 1692   else if (TIM1_Channel == TIM1_Channel_3)
4291  0037 7b01          	ld	a,(OFST+1,sp)
4292  0039 a102          	cp	a,#2
4293  003b 2616          	jrne	L7422
4294                     ; 1695     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4296  003d 7b08          	ld	a,(OFST+8,sp)
4297  003f 88            	push	a
4298  0040 7b07          	ld	a,(OFST+7,sp)
4299  0042 97            	ld	xl,a
4300  0043 7b03          	ld	a,(OFST+3,sp)
4301  0045 95            	ld	xh,a
4302  0046 8d000000      	callf	L7f_TI3_Config
4304  004a 84            	pop	a
4305                     ; 1697     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4307  004b 7b07          	ld	a,(OFST+7,sp)
4308  004d 8d000000      	callf	f_TIM1_SetIC3Prescaler
4311  0051 2014          	jra	L1422
4312  0053               L7422:
4313                     ; 1702     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4315  0053 7b08          	ld	a,(OFST+8,sp)
4316  0055 88            	push	a
4317  0056 7b07          	ld	a,(OFST+7,sp)
4318  0058 97            	ld	xl,a
4319  0059 7b03          	ld	a,(OFST+3,sp)
4320  005b 95            	ld	xh,a
4321  005c 8d000000      	callf	L11f_TI4_Config
4323  0060 84            	pop	a
4324                     ; 1704     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4326  0061 7b07          	ld	a,(OFST+7,sp)
4327  0063 8d000000      	callf	f_TIM1_SetIC4Prescaler
4329  0067               L1422:
4330                     ; 1706 }
4333  0067 85            	popw	x
4334  0068 87            	retf
4429                     ; 1733 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4429                     ; 1734                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4429                     ; 1735                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4429                     ; 1736                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4429                     ; 1737                      uint8_t TIM1_ICFilter)
4429                     ; 1738 {
4430                     .text:	section	.text,new
4431  0000               f_TIM1_PWMIConfig:
4433  0000 89            	pushw	x
4434  0001 89            	pushw	x
4435       00000002      OFST:	set	2
4438                     ; 1739   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4440  0002 7b01          	ld	a,(OFST-1,sp)
4441  0004 97            	ld	xl,a
4442                     ; 1740   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4444  0005 7b02          	ld	a,(OFST+0,sp)
4445  0007 97            	ld	xl,a
4446                     ; 1743   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4448                     ; 1744   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4450                     ; 1745   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4452                     ; 1746   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4454                     ; 1749   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4456  0008 7b04          	ld	a,(OFST+2,sp)
4457  000a a101          	cp	a,#1
4458  000c 2706          	jreq	L7132
4459                     ; 1751     icpolarity = TIM1_ICPolarity_Falling;
4461  000e a601          	ld	a,#1
4462  0010 6b01          	ld	(OFST-1,sp),a
4464  0012 2002          	jra	L1232
4465  0014               L7132:
4466                     ; 1755     icpolarity = TIM1_ICPolarity_Rising;
4468  0014 0f01          	clr	(OFST-1,sp)
4469  0016               L1232:
4470                     ; 1759   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4472  0016 7b08          	ld	a,(OFST+6,sp)
4473  0018 a101          	cp	a,#1
4474  001a 2606          	jrne	L3232
4475                     ; 1761     icselection = TIM1_ICSelection_IndirectTI;
4477  001c a602          	ld	a,#2
4478  001e 6b02          	ld	(OFST+0,sp),a
4480  0020 2004          	jra	L5232
4481  0022               L3232:
4482                     ; 1765     icselection = TIM1_ICSelection_DirectTI;
4484  0022 a601          	ld	a,#1
4485  0024 6b02          	ld	(OFST+0,sp),a
4486  0026               L5232:
4487                     ; 1768   if (TIM1_Channel == TIM1_Channel_1)
4489  0026 0d03          	tnz	(OFST+1,sp)
4490  0028 262a          	jrne	L7232
4491                     ; 1771     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4493  002a 7b0a          	ld	a,(OFST+8,sp)
4494  002c 88            	push	a
4495  002d 7b09          	ld	a,(OFST+7,sp)
4496  002f 97            	ld	xl,a
4497  0030 7b05          	ld	a,(OFST+3,sp)
4498  0032 95            	ld	xh,a
4499  0033 8d000000      	callf	L3f_TI1_Config
4501  0037 84            	pop	a
4502                     ; 1774     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4504  0038 7b09          	ld	a,(OFST+7,sp)
4505  003a 8d000000      	callf	f_TIM1_SetIC1Prescaler
4507                     ; 1777     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4509  003e 7b0a          	ld	a,(OFST+8,sp)
4510  0040 88            	push	a
4511  0041 7b03          	ld	a,(OFST+1,sp)
4512  0043 97            	ld	xl,a
4513  0044 7b02          	ld	a,(OFST+0,sp)
4514  0046 95            	ld	xh,a
4515  0047 8d000000      	callf	L5f_TI2_Config
4517  004b 84            	pop	a
4518                     ; 1780     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4520  004c 7b09          	ld	a,(OFST+7,sp)
4521  004e 8d000000      	callf	f_TIM1_SetIC2Prescaler
4524  0052 2028          	jra	L1332
4525  0054               L7232:
4526                     ; 1785     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4528  0054 7b0a          	ld	a,(OFST+8,sp)
4529  0056 88            	push	a
4530  0057 7b09          	ld	a,(OFST+7,sp)
4531  0059 97            	ld	xl,a
4532  005a 7b05          	ld	a,(OFST+3,sp)
4533  005c 95            	ld	xh,a
4534  005d 8d000000      	callf	L5f_TI2_Config
4536  0061 84            	pop	a
4537                     ; 1788     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4539  0062 7b09          	ld	a,(OFST+7,sp)
4540  0064 8d000000      	callf	f_TIM1_SetIC2Prescaler
4542                     ; 1791     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4544  0068 7b0a          	ld	a,(OFST+8,sp)
4545  006a 88            	push	a
4546  006b 7b03          	ld	a,(OFST+1,sp)
4547  006d 97            	ld	xl,a
4548  006e 7b02          	ld	a,(OFST+0,sp)
4549  0070 95            	ld	xh,a
4550  0071 8d000000      	callf	L3f_TI1_Config
4552  0075 84            	pop	a
4553                     ; 1794     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4555  0076 7b09          	ld	a,(OFST+7,sp)
4556  0078 8d000000      	callf	f_TIM1_SetIC1Prescaler
4558  007c               L1332:
4559                     ; 1796 }
4562  007c 5b04          	addw	sp,#4
4563  007e 87            	retf
4608                     ; 1803 uint16_t TIM1_GetCapture1(void)
4608                     ; 1804 {
4609                     .text:	section	.text,new
4610  0000               f_TIM1_GetCapture1:
4612  0000 5204          	subw	sp,#4
4613       00000004      OFST:	set	4
4616                     ; 1807   uint16_t tmpccr1 = 0;
4618  0002 1e03          	ldw	x,(OFST-1,sp)
4619                     ; 1808   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4621  0004 7b01          	ld	a,(OFST-3,sp)
4622  0006 97            	ld	xl,a
4625  0007 7b02          	ld	a,(OFST-2,sp)
4626  0009 97            	ld	xl,a
4627                     ; 1810   tmpccr1h = TIM1->CCR1H;
4629  000a c652c6        	ld	a,21190
4630  000d 6b02          	ld	(OFST-2,sp),a
4631                     ; 1811   tmpccr1l = TIM1->CCR1L;
4633  000f c652c7        	ld	a,21191
4634  0012 6b01          	ld	(OFST-3,sp),a
4635                     ; 1813   tmpccr1 = (uint16_t)(tmpccr1l);
4637  0014 7b01          	ld	a,(OFST-3,sp)
4638  0016 5f            	clrw	x
4639  0017 97            	ld	xl,a
4640  0018 1f03          	ldw	(OFST-1,sp),x
4641                     ; 1814   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4643  001a 7b02          	ld	a,(OFST-2,sp)
4644  001c 5f            	clrw	x
4645  001d 97            	ld	xl,a
4646  001e 4f            	clr	a
4647  001f 02            	rlwa	x,a
4648  0020 01            	rrwa	x,a
4649  0021 1a04          	or	a,(OFST+0,sp)
4650  0023 01            	rrwa	x,a
4651  0024 1a03          	or	a,(OFST-1,sp)
4652  0026 01            	rrwa	x,a
4653  0027 1f03          	ldw	(OFST-1,sp),x
4654                     ; 1816   return (uint16_t)tmpccr1;
4656  0029 1e03          	ldw	x,(OFST-1,sp)
4659  002b 5b04          	addw	sp,#4
4660  002d 87            	retf
4705                     ; 1824 uint16_t TIM1_GetCapture2(void)
4705                     ; 1825 {
4706                     .text:	section	.text,new
4707  0000               f_TIM1_GetCapture2:
4709  0000 5204          	subw	sp,#4
4710       00000004      OFST:	set	4
4713                     ; 1828   uint16_t tmpccr2 = 0;
4715  0002 1e03          	ldw	x,(OFST-1,sp)
4716                     ; 1829   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4718  0004 7b01          	ld	a,(OFST-3,sp)
4719  0006 97            	ld	xl,a
4722  0007 7b02          	ld	a,(OFST-2,sp)
4723  0009 97            	ld	xl,a
4724                     ; 1831   tmpccr2h = TIM1->CCR2H;
4726  000a c652c8        	ld	a,21192
4727  000d 6b02          	ld	(OFST-2,sp),a
4728                     ; 1832   tmpccr2l = TIM1->CCR2L;
4730  000f c652c9        	ld	a,21193
4731  0012 6b01          	ld	(OFST-3,sp),a
4732                     ; 1834   tmpccr2 = (uint16_t)(tmpccr2l);
4734  0014 7b01          	ld	a,(OFST-3,sp)
4735  0016 5f            	clrw	x
4736  0017 97            	ld	xl,a
4737  0018 1f03          	ldw	(OFST-1,sp),x
4738                     ; 1835   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4740  001a 7b02          	ld	a,(OFST-2,sp)
4741  001c 5f            	clrw	x
4742  001d 97            	ld	xl,a
4743  001e 4f            	clr	a
4744  001f 02            	rlwa	x,a
4745  0020 01            	rrwa	x,a
4746  0021 1a04          	or	a,(OFST+0,sp)
4747  0023 01            	rrwa	x,a
4748  0024 1a03          	or	a,(OFST-1,sp)
4749  0026 01            	rrwa	x,a
4750  0027 1f03          	ldw	(OFST-1,sp),x
4751                     ; 1837   return (uint16_t)tmpccr2;
4753  0029 1e03          	ldw	x,(OFST-1,sp)
4756  002b 5b04          	addw	sp,#4
4757  002d 87            	retf
4802                     ; 1845 uint16_t TIM1_GetCapture3(void)
4802                     ; 1846 {
4803                     .text:	section	.text,new
4804  0000               f_TIM1_GetCapture3:
4806  0000 5204          	subw	sp,#4
4807       00000004      OFST:	set	4
4810                     ; 1848   uint16_t tmpccr3 = 0;
4812  0002 1e03          	ldw	x,(OFST-1,sp)
4813                     ; 1849   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4815  0004 7b01          	ld	a,(OFST-3,sp)
4816  0006 97            	ld	xl,a
4819  0007 7b02          	ld	a,(OFST-2,sp)
4820  0009 97            	ld	xl,a
4821                     ; 1851   tmpccr3h = TIM1->CCR3H;
4823  000a c652ca        	ld	a,21194
4824  000d 6b02          	ld	(OFST-2,sp),a
4825                     ; 1852   tmpccr3l = TIM1->CCR3L;
4827  000f c652cb        	ld	a,21195
4828  0012 6b01          	ld	(OFST-3,sp),a
4829                     ; 1854   tmpccr3 = (uint16_t)(tmpccr3l);
4831  0014 7b01          	ld	a,(OFST-3,sp)
4832  0016 5f            	clrw	x
4833  0017 97            	ld	xl,a
4834  0018 1f03          	ldw	(OFST-1,sp),x
4835                     ; 1855   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4837  001a 7b02          	ld	a,(OFST-2,sp)
4838  001c 5f            	clrw	x
4839  001d 97            	ld	xl,a
4840  001e 4f            	clr	a
4841  001f 02            	rlwa	x,a
4842  0020 01            	rrwa	x,a
4843  0021 1a04          	or	a,(OFST+0,sp)
4844  0023 01            	rrwa	x,a
4845  0024 1a03          	or	a,(OFST-1,sp)
4846  0026 01            	rrwa	x,a
4847  0027 1f03          	ldw	(OFST-1,sp),x
4848                     ; 1857   return (uint16_t)tmpccr3;
4850  0029 1e03          	ldw	x,(OFST-1,sp)
4853  002b 5b04          	addw	sp,#4
4854  002d 87            	retf
4899                     ; 1865 uint16_t TIM1_GetCapture4(void)
4899                     ; 1866 {
4900                     .text:	section	.text,new
4901  0000               f_TIM1_GetCapture4:
4903  0000 5204          	subw	sp,#4
4904       00000004      OFST:	set	4
4907                     ; 1868   uint16_t tmpccr4 = 0;
4909  0002 1e03          	ldw	x,(OFST-1,sp)
4910                     ; 1869   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4912  0004 7b01          	ld	a,(OFST-3,sp)
4913  0006 97            	ld	xl,a
4916  0007 7b02          	ld	a,(OFST-2,sp)
4917  0009 97            	ld	xl,a
4918                     ; 1871   tmpccr4h = TIM1->CCR4H;
4920  000a c652cc        	ld	a,21196
4921  000d 6b02          	ld	(OFST-2,sp),a
4922                     ; 1872   tmpccr4l = TIM1->CCR4L;
4924  000f c652cd        	ld	a,21197
4925  0012 6b01          	ld	(OFST-3,sp),a
4926                     ; 1874   tmpccr4 = (uint16_t)(tmpccr4l);
4928  0014 7b01          	ld	a,(OFST-3,sp)
4929  0016 5f            	clrw	x
4930  0017 97            	ld	xl,a
4931  0018 1f03          	ldw	(OFST-1,sp),x
4932                     ; 1875   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4934  001a 7b02          	ld	a,(OFST-2,sp)
4935  001c 5f            	clrw	x
4936  001d 97            	ld	xl,a
4937  001e 4f            	clr	a
4938  001f 02            	rlwa	x,a
4939  0020 01            	rrwa	x,a
4940  0021 1a04          	or	a,(OFST+0,sp)
4941  0023 01            	rrwa	x,a
4942  0024 1a03          	or	a,(OFST-1,sp)
4943  0026 01            	rrwa	x,a
4944  0027 1f03          	ldw	(OFST-1,sp),x
4945                     ; 1877   return (uint16_t)tmpccr4;
4947  0029 1e03          	ldw	x,(OFST-1,sp)
4950  002b 5b04          	addw	sp,#4
4951  002d 87            	retf
4986                     ; 1890 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
4986                     ; 1891 {
4987                     .text:	section	.text,new
4988  0000               f_TIM1_SetIC1Prescaler:
4990  0000 88            	push	a
4991       00000000      OFST:	set	0
4994                     ; 1893   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
4996                     ; 1896   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
4998  0001 c652b9        	ld	a,21177
4999  0004 a4f3          	and	a,#243
5000  0006 1a01          	or	a,(OFST+1,sp)
5001  0008 c752b9        	ld	21177,a
5002                     ; 1897 }
5005  000b 84            	pop	a
5006  000c 87            	retf
5041                     ; 1909 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5041                     ; 1910 {
5042                     .text:	section	.text,new
5043  0000               f_TIM1_SetIC2Prescaler:
5045  0000 88            	push	a
5046       00000000      OFST:	set	0
5049                     ; 1912   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5051                     ; 1915   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5053  0001 c652ba        	ld	a,21178
5054  0004 a4f3          	and	a,#243
5055  0006 1a01          	or	a,(OFST+1,sp)
5056  0008 c752ba        	ld	21178,a
5057                     ; 1916 }
5060  000b 84            	pop	a
5061  000c 87            	retf
5096                     ; 1928 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5096                     ; 1929 {
5097                     .text:	section	.text,new
5098  0000               f_TIM1_SetIC3Prescaler:
5100  0000 88            	push	a
5101       00000000      OFST:	set	0
5104                     ; 1932   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5106                     ; 1935   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5108  0001 c652bb        	ld	a,21179
5109  0004 a4f3          	and	a,#243
5110  0006 1a01          	or	a,(OFST+1,sp)
5111  0008 c752bb        	ld	21179,a
5112                     ; 1936 }
5115  000b 84            	pop	a
5116  000c 87            	retf
5151                     ; 1948 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5151                     ; 1949 {
5152                     .text:	section	.text,new
5153  0000               f_TIM1_SetIC4Prescaler:
5155  0000 88            	push	a
5156       00000000      OFST:	set	0
5159                     ; 1952   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5161                     ; 1955   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5163  0001 c652bc        	ld	a,21180
5164  0004 a4f3          	and	a,#243
5165  0006 1a01          	or	a,(OFST+1,sp)
5166  0008 c752bc        	ld	21180,a
5167                     ; 1956 }
5170  000b 84            	pop	a
5171  000c 87            	retf
5277                     ; 1991 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5277                     ; 1992 {
5278                     .text:	section	.text,new
5279  0000               f_TIM1_ITConfig:
5281  0000 89            	pushw	x
5282       00000000      OFST:	set	0
5285                     ; 1994   assert_param(IS_TIM1_IT(TIM1_IT));
5287                     ; 1995   assert_param(IS_FUNCTIONAL_STATE(NewState));
5289                     ; 1997   if (NewState != DISABLE)
5291  0001 9f            	ld	a,xl
5292  0002 4d            	tnz	a
5293  0003 2709          	jreq	L1752
5294                     ; 2000     TIM1->IER |= (uint8_t)TIM1_IT;
5296  0005 9e            	ld	a,xh
5297  0006 ca52b5        	or	a,21173
5298  0009 c752b5        	ld	21173,a
5300  000c 2009          	jra	L3752
5301  000e               L1752:
5302                     ; 2005     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5304  000e 7b01          	ld	a,(OFST+1,sp)
5305  0010 43            	cpl	a
5306  0011 c452b5        	and	a,21173
5307  0014 c752b5        	ld	21173,a
5308  0017               L3752:
5309                     ; 2007 }
5312  0017 85            	popw	x
5313  0018 87            	retf
5417                     ; 2023 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5417                     ; 2024 {
5418                     .text:	section	.text,new
5419  0000               f_TIM1_GenerateEvent:
5423                     ; 2026   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5425                     ; 2029   TIM1->EGR = (uint8_t)TIM1_EventSource;
5427  0000 c752b8        	ld	21176,a
5428                     ; 2030 }
5431  0003 87            	retf
5600                     ; 2049 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5600                     ; 2050 {
5601                     .text:	section	.text,new
5602  0000               f_TIM1_GetFlagStatus:
5604  0000 89            	pushw	x
5605  0001 89            	pushw	x
5606       00000002      OFST:	set	2
5609                     ; 2051   FlagStatus bitstatus = RESET;
5611  0002 7b02          	ld	a,(OFST+0,sp)
5612  0004 97            	ld	xl,a
5613                     ; 2052   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5615  0005 7b01          	ld	a,(OFST-1,sp)
5616  0007 97            	ld	xl,a
5619  0008 7b02          	ld	a,(OFST+0,sp)
5620  000a 97            	ld	xl,a
5621                     ; 2055   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5623                     ; 2057   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5625  000b c652b6        	ld	a,21174
5626  000e 1404          	and	a,(OFST+2,sp)
5627  0010 6b01          	ld	(OFST-1,sp),a
5628                     ; 2058   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5630  0012 c652b7        	ld	a,21175
5631  0015 1403          	and	a,(OFST+1,sp)
5632  0017 6b02          	ld	(OFST+0,sp),a
5633                     ; 2060   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5635  0019 7b01          	ld	a,(OFST-1,sp)
5636  001b 1a02          	or	a,(OFST+0,sp)
5637  001d 2706          	jreq	L1372
5638                     ; 2062     bitstatus = SET;
5640  001f a601          	ld	a,#1
5641  0021 6b02          	ld	(OFST+0,sp),a
5643  0023 2002          	jra	L3372
5644  0025               L1372:
5645                     ; 2066     bitstatus = RESET;
5647  0025 0f02          	clr	(OFST+0,sp)
5648  0027               L3372:
5649                     ; 2068   return (FlagStatus)(bitstatus);
5651  0027 7b02          	ld	a,(OFST+0,sp)
5654  0029 5b04          	addw	sp,#4
5655  002b 87            	retf
5689                     ; 2089 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5689                     ; 2090 {
5690                     .text:	section	.text,new
5691  0000               f_TIM1_ClearFlag:
5693  0000 89            	pushw	x
5694       00000000      OFST:	set	0
5697                     ; 2092   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5699                     ; 2095   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5701  0001 9f            	ld	a,xl
5702  0002 43            	cpl	a
5703  0003 c752b6        	ld	21174,a
5704                     ; 2096   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5706  0006 7b01          	ld	a,(OFST+1,sp)
5707  0008 43            	cpl	a
5708  0009 a41e          	and	a,#30
5709  000b c752b7        	ld	21175,a
5710                     ; 2097 }
5713  000e 85            	popw	x
5714  000f 87            	retf
5773                     ; 2114 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5773                     ; 2115 {
5774                     .text:	section	.text,new
5775  0000               f_TIM1_GetITStatus:
5777  0000 88            	push	a
5778  0001 89            	pushw	x
5779       00000002      OFST:	set	2
5782                     ; 2116   ITStatus bitstatus = RESET;
5784  0002 7b02          	ld	a,(OFST+0,sp)
5785  0004 97            	ld	xl,a
5786                     ; 2118   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5788  0005 7b01          	ld	a,(OFST-1,sp)
5789  0007 97            	ld	xl,a
5792  0008 7b02          	ld	a,(OFST+0,sp)
5793  000a 97            	ld	xl,a
5794                     ; 2121   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5796                     ; 2123   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5798  000b c652b6        	ld	a,21174
5799  000e 1403          	and	a,(OFST+1,sp)
5800  0010 6b01          	ld	(OFST-1,sp),a
5801                     ; 2125   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5803  0012 c652b5        	ld	a,21173
5804  0015 1403          	and	a,(OFST+1,sp)
5805  0017 6b02          	ld	(OFST+0,sp),a
5806                     ; 2127   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5808  0019 0d01          	tnz	(OFST-1,sp)
5809  001b 270a          	jreq	L1003
5811  001d 0d02          	tnz	(OFST+0,sp)
5812  001f 2706          	jreq	L1003
5813                     ; 2129     bitstatus = SET;
5815  0021 a601          	ld	a,#1
5816  0023 6b02          	ld	(OFST+0,sp),a
5818  0025 2002          	jra	L3003
5819  0027               L1003:
5820                     ; 2133     bitstatus = RESET;
5822  0027 0f02          	clr	(OFST+0,sp)
5823  0029               L3003:
5824                     ; 2135   return (ITStatus)(bitstatus);
5826  0029 7b02          	ld	a,(OFST+0,sp)
5829  002b 5b03          	addw	sp,#3
5830  002d 87            	retf
5865                     ; 2152 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5865                     ; 2153 {
5866                     .text:	section	.text,new
5867  0000               f_TIM1_ClearITPendingBit:
5871                     ; 2155   assert_param(IS_TIM1_IT(TIM1_IT));
5873                     ; 2158   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5875  0000 43            	cpl	a
5876  0001 c752b6        	ld	21174,a
5877                     ; 2159 }
5880  0004 87            	retf
6417                     ; 2167 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6417                     ; 2168                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6417                     ; 2169 {
6418                     .text:	section	.text,new
6419  0000               f_TIM1_DMAConfig:
6423                     ; 2171   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6425                     ; 2172   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6427                     ; 2175   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6429  0000 9e            	ld	a,xh
6430  0001 c752d1        	ld	21201,a
6431                     ; 2176   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6433  0004 9f            	ld	a,xl
6434  0005 c752d2        	ld	21202,a
6435                     ; 2177 }
6438  0008 87            	retf
6531                     ; 2189 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6531                     ; 2190 {
6532                     .text:	section	.text,new
6533  0000               f_TIM1_DMACmd:
6535  0000 89            	pushw	x
6536       00000000      OFST:	set	0
6539                     ; 2192   assert_param(IS_FUNCTIONAL_STATE(NewState));
6541                     ; 2193   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6543                     ; 2195   if (NewState != DISABLE)
6545  0001 9f            	ld	a,xl
6546  0002 4d            	tnz	a
6547  0003 2709          	jreq	L7133
6548                     ; 2198     TIM1->DER |= (uint8_t)TIM1_DMASource;
6550  0005 9e            	ld	a,xh
6551  0006 ca52b4        	or	a,21172
6552  0009 c752b4        	ld	21172,a
6554  000c 2009          	jra	L1233
6555  000e               L7133:
6556                     ; 2203     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6558  000e 7b01          	ld	a,(OFST+1,sp)
6559  0010 43            	cpl	a
6560  0011 c452b4        	and	a,21172
6561  0014 c752b4        	ld	21172,a
6562  0017               L1233:
6563                     ; 2205 }
6566  0017 85            	popw	x
6567  0018 87            	retf
6601                     ; 2213 void TIM1_SelectCCDMA(FunctionalState NewState)
6601                     ; 2214 {
6602                     .text:	section	.text,new
6603  0000               f_TIM1_SelectCCDMA:
6607                     ; 2216   assert_param(IS_FUNCTIONAL_STATE(NewState));
6609                     ; 2218   if (NewState != DISABLE)
6611  0000 4d            	tnz	a
6612  0001 2706          	jreq	L1433
6613                     ; 2221     TIM1->CR2 |= TIM1_CR2_CCDS;
6615  0003 721652b1      	bset	21169,#3
6617  0007 2004          	jra	L3433
6618  0009               L1433:
6619                     ; 2226     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6621  0009 721752b1      	bres	21169,#3
6622  000d               L3433:
6623                     ; 2228 }
6626  000d 87            	retf
6649                     ; 2251 void TIM1_InternalClockConfig(void)
6649                     ; 2252 {
6650                     .text:	section	.text,new
6651  0000               f_TIM1_InternalClockConfig:
6655                     ; 2254   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6657  0000 c652b2        	ld	a,21170
6658  0003 a4f8          	and	a,#248
6659  0005 c752b2        	ld	21170,a
6660                     ; 2255 }
6663  0008 87            	retf
6749                     ; 2272 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6749                     ; 2273                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6749                     ; 2274                                  uint8_t ICFilter)
6749                     ; 2275 {
6750                     .text:	section	.text,new
6751  0000               f_TIM1_TIxExternalClockConfig:
6753  0000 89            	pushw	x
6754       00000000      OFST:	set	0
6757                     ; 2277   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6759                     ; 2278   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6761                     ; 2279   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6763                     ; 2282   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6765  0001 9e            	ld	a,xh
6766  0002 a160          	cp	a,#96
6767  0004 2610          	jrne	L3143
6768                     ; 2284     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6770  0006 7b06          	ld	a,(OFST+6,sp)
6771  0008 88            	push	a
6772  0009 ae0001        	ldw	x,#1
6773  000c 7b03          	ld	a,(OFST+3,sp)
6774  000e 95            	ld	xh,a
6775  000f 8d000000      	callf	L5f_TI2_Config
6777  0013 84            	pop	a
6779  0014 200e          	jra	L5143
6780  0016               L3143:
6781                     ; 2288     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6783  0016 7b06          	ld	a,(OFST+6,sp)
6784  0018 88            	push	a
6785  0019 ae0001        	ldw	x,#1
6786  001c 7b03          	ld	a,(OFST+3,sp)
6787  001e 95            	ld	xh,a
6788  001f 8d000000      	callf	L3f_TI1_Config
6790  0023 84            	pop	a
6791  0024               L5143:
6792                     ; 2292   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6794  0024 7b01          	ld	a,(OFST+1,sp)
6795  0026 8d000000      	callf	f_TIM1_SelectInputTrigger
6797                     ; 2295   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6799  002a c652b2        	ld	a,21170
6800  002d aa07          	or	a,#7
6801  002f c752b2        	ld	21170,a
6802                     ; 2296 }
6805  0032 85            	popw	x
6806  0033 87            	retf
6920                     ; 2314 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6920                     ; 2315                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6920                     ; 2316                               uint8_t ExtTRGFilter)
6920                     ; 2317 {
6921                     .text:	section	.text,new
6922  0000               f_TIM1_ETRClockMode1Config:
6924  0000 89            	pushw	x
6925       00000000      OFST:	set	0
6928                     ; 2319   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6930                     ; 2320   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6932                     ; 2321   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
6934                     ; 2324   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6936  0001 7b06          	ld	a,(OFST+6,sp)
6937  0003 88            	push	a
6938  0004 9f            	ld	a,xl
6939  0005 97            	ld	xl,a
6940  0006 7b02          	ld	a,(OFST+2,sp)
6941  0008 95            	ld	xh,a
6942  0009 8d000000      	callf	f_TIM1_ETRConfig
6944  000d 84            	pop	a
6945                     ; 2327   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
6945                     ; 2328                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
6947  000e c652b2        	ld	a,21170
6948  0011 a488          	and	a,#136
6949  0013 aa77          	or	a,#119
6950  0015 c752b2        	ld	21170,a
6951                     ; 2329 }
6954  0018 85            	popw	x
6955  0019 87            	retf
7010                     ; 2347 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7010                     ; 2348                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7010                     ; 2349                               uint8_t ExtTRGFilter)
7010                     ; 2350 {
7011                     .text:	section	.text,new
7012  0000               f_TIM1_ETRClockMode2Config:
7014  0000 89            	pushw	x
7015       00000000      OFST:	set	0
7018                     ; 2352   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7020                     ; 2353   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7022                     ; 2356   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7024  0001 7b06          	ld	a,(OFST+6,sp)
7025  0003 88            	push	a
7026  0004 9f            	ld	a,xl
7027  0005 97            	ld	xl,a
7028  0006 7b02          	ld	a,(OFST+2,sp)
7029  0008 95            	ld	xh,a
7030  0009 8d000000      	callf	f_TIM1_ETRConfig
7032  000d 84            	pop	a
7033                     ; 2359   TIM1->ETR |= TIM1_ETR_ECE;
7035  000e 721c52b3      	bset	21171,#6
7036                     ; 2360 }
7039  0012 85            	popw	x
7040  0013 87            	retf
7146                     ; 2410 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7146                     ; 2411 {
7147                     .text:	section	.text,new
7148  0000               f_TIM1_SelectInputTrigger:
7150  0000 88            	push	a
7151       00000000      OFST:	set	0
7154                     ; 2413   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7156                     ; 2416   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7158  0001 c652b2        	ld	a,21170
7159  0004 a48f          	and	a,#143
7160  0006 1a01          	or	a,(OFST+1,sp)
7161  0008 c752b2        	ld	21170,a
7162                     ; 2417 }
7165  000b 84            	pop	a
7166  000c 87            	retf
7271                     ; 2433 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7271                     ; 2434 {
7272                     .text:	section	.text,new
7273  0000               f_TIM1_SelectOutputTrigger:
7275  0000 88            	push	a
7276       00000000      OFST:	set	0
7279                     ; 2436   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7281                     ; 2438   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7283  0001 c652b1        	ld	a,21169
7284  0004 a48f          	and	a,#143
7285  0006 1a01          	or	a,(OFST+1,sp)
7286  0008 c752b1        	ld	21169,a
7287                     ; 2439 }
7290  000b 84            	pop	a
7291  000c 87            	retf
7364                     ; 2451 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7364                     ; 2452 {
7365                     .text:	section	.text,new
7366  0000               f_TIM1_SelectSlaveMode:
7368  0000 88            	push	a
7369       00000000      OFST:	set	0
7372                     ; 2454   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7374                     ; 2457   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7376  0001 c652b2        	ld	a,21170
7377  0004 a4f8          	and	a,#248
7378  0006 1a01          	or	a,(OFST+1,sp)
7379  0008 c752b2        	ld	21170,a
7380                     ; 2459 }
7383  000b 84            	pop	a
7384  000c 87            	retf
7419                     ; 2467 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7419                     ; 2468 {
7420                     .text:	section	.text,new
7421  0000               f_TIM1_SelectMasterSlaveMode:
7425                     ; 2470   assert_param(IS_FUNCTIONAL_STATE(NewState));
7427                     ; 2473   if (NewState != DISABLE)
7429  0000 4d            	tnz	a
7430  0001 2706          	jreq	L7663
7431                     ; 2475     TIM1->SMCR |= TIM1_SMCR_MSM;
7433  0003 721e52b2      	bset	21170,#7
7435  0007 2004          	jra	L1763
7436  0009               L7663:
7437                     ; 2479     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7439  0009 721f52b2      	bres	21170,#7
7440  000d               L1763:
7441                     ; 2481 }
7444  000d 87            	retf
7497                     ; 2499 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7497                     ; 2500                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7497                     ; 2501                     uint8_t ExtTRGFilter)
7497                     ; 2502 {
7498                     .text:	section	.text,new
7499  0000               f_TIM1_ETRConfig:
7501  0000 89            	pushw	x
7502       00000000      OFST:	set	0
7505                     ; 2503   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7507                     ; 2506   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7507                     ; 2507                                    | (uint8_t) TIM1_ExtTRGPolarity)
7507                     ; 2508                          | (uint8_t) ExtTRGFilter);
7509  0001 9f            	ld	a,xl
7510  0002 1a01          	or	a,(OFST+1,sp)
7511  0004 1a06          	or	a,(OFST+6,sp)
7512  0006 ca52b3        	or	a,21171
7513  0009 c752b3        	ld	21171,a
7514                     ; 2509 }
7517  000c 85            	popw	x
7518  000d 87            	retf
7603                     ; 2547 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7603                     ; 2548                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7603                     ; 2549                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7603                     ; 2550 {
7604                     .text:	section	.text,new
7605  0000               f_TIM1_EncoderInterfaceConfig:
7607  0000 89            	pushw	x
7608       00000000      OFST:	set	0
7611                     ; 2552   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7613                     ; 2553   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7615                     ; 2554   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7617                     ; 2557   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7619  0001 9f            	ld	a,xl
7620  0002 4d            	tnz	a
7621  0003 2706          	jreq	L7573
7622                     ; 2559     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7624  0005 721252bd      	bset	21181,#1
7626  0009 2004          	jra	L1673
7627  000b               L7573:
7628                     ; 2563     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7630  000b 721352bd      	bres	21181,#1
7631  000f               L1673:
7632                     ; 2566   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7634  000f 0d06          	tnz	(OFST+6,sp)
7635  0011 2706          	jreq	L3673
7636                     ; 2568     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7638  0013 721a52bd      	bset	21181,#5
7640  0017 2004          	jra	L5673
7641  0019               L3673:
7642                     ; 2572     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7644  0019 721b52bd      	bres	21181,#5
7645  001d               L5673:
7646                     ; 2575   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7648  001d c652b2        	ld	a,21170
7649  0020 a4f0          	and	a,#240
7650  0022 1a01          	or	a,(OFST+1,sp)
7651  0024 c752b2        	ld	21170,a
7652                     ; 2578   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7654  0027 c652b9        	ld	a,21177
7655  002a a4fc          	and	a,#252
7656  002c aa01          	or	a,#1
7657  002e c752b9        	ld	21177,a
7658                     ; 2579   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7660  0031 c652ba        	ld	a,21178
7661  0034 a4fc          	and	a,#252
7662  0036 aa01          	or	a,#1
7663  0038 c752ba        	ld	21178,a
7664                     ; 2581 }
7667  003b 85            	popw	x
7668  003c 87            	retf
7703                     ; 2589 void TIM1_SelectHallSensor(FunctionalState NewState)
7703                     ; 2590 {
7704                     .text:	section	.text,new
7705  0000               f_TIM1_SelectHallSensor:
7709                     ; 2592   assert_param(IS_FUNCTIONAL_STATE(NewState));
7711                     ; 2595   if (NewState != DISABLE)
7713  0000 4d            	tnz	a
7714  0001 2706          	jreq	L5004
7715                     ; 2597     TIM1->CR2 |= TIM1_CR2_TI1S;
7717  0003 721e52b1      	bset	21169,#7
7719  0007 2004          	jra	L7004
7720  0009               L5004:
7721                     ; 2601     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7723  0009 721f52b1      	bres	21169,#7
7724  000d               L7004:
7725                     ; 2603 }
7728  000d 87            	retf
7773                     ; 2623 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7773                     ; 2624 {
7774                     .text:	section	.text,new
7775  0000               L3f_TI1_Config:
7777  0000 89            	pushw	x
7778  0001 88            	push	a
7779       00000001      OFST:	set	1
7782                     ; 2627   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7784  0002 721152bd      	bres	21181,#0
7785                     ; 2630   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7785                     ; 2631                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7787  0006 7b07          	ld	a,(OFST+6,sp)
7788  0008 97            	ld	xl,a
7789  0009 a610          	ld	a,#16
7790  000b 42            	mul	x,a
7791  000c 9f            	ld	a,xl
7792  000d 1a03          	or	a,(OFST+2,sp)
7793  000f 6b01          	ld	(OFST+0,sp),a
7794  0011 c652b9        	ld	a,21177
7795  0014 a40c          	and	a,#12
7796  0016 1a01          	or	a,(OFST+0,sp)
7797  0018 c752b9        	ld	21177,a
7798                     ; 2636   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7800  001b 0d02          	tnz	(OFST+1,sp)
7801  001d 2706          	jreq	L1304
7802                     ; 2638     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7804  001f 721252bd      	bset	21181,#1
7806  0023 2004          	jra	L3304
7807  0025               L1304:
7808                     ; 2642     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7810  0025 721352bd      	bres	21181,#1
7811  0029               L3304:
7812                     ; 2646   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7814  0029 721052bd      	bset	21181,#0
7815                     ; 2647 }
7818  002d 5b03          	addw	sp,#3
7819  002f 87            	retf
7864                     ; 2663 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7864                     ; 2664 {
7865                     .text:	section	.text,new
7866  0000               L5f_TI2_Config:
7868  0000 89            	pushw	x
7869  0001 88            	push	a
7870       00000001      OFST:	set	1
7873                     ; 2666   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7875  0002 721952bd      	bres	21181,#4
7876                     ; 2669   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7876                     ; 2670                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7878  0006 7b07          	ld	a,(OFST+6,sp)
7879  0008 97            	ld	xl,a
7880  0009 a610          	ld	a,#16
7881  000b 42            	mul	x,a
7882  000c 9f            	ld	a,xl
7883  000d 1a03          	or	a,(OFST+2,sp)
7884  000f 6b01          	ld	(OFST+0,sp),a
7885  0011 c652ba        	ld	a,21178
7886  0014 a40c          	and	a,#12
7887  0016 1a01          	or	a,(OFST+0,sp)
7888  0018 c752ba        	ld	21178,a
7889                     ; 2672   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7891  001b 0d02          	tnz	(OFST+1,sp)
7892  001d 2706          	jreq	L5504
7893                     ; 2674     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7895  001f 721a52bd      	bset	21181,#5
7897  0023 2004          	jra	L7504
7898  0025               L5504:
7899                     ; 2678     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7901  0025 721b52bd      	bres	21181,#5
7902  0029               L7504:
7903                     ; 2681   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7905  0029 721852bd      	bset	21181,#4
7906                     ; 2682 }
7909  002d 5b03          	addw	sp,#3
7910  002f 87            	retf
7955                     ; 2698 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7955                     ; 2699 {
7956                     .text:	section	.text,new
7957  0000               L7f_TI3_Config:
7959  0000 89            	pushw	x
7960  0001 88            	push	a
7961       00000001      OFST:	set	1
7964                     ; 2701   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7966  0002 721152be      	bres	21182,#0
7967                     ; 2704   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7967                     ; 2705                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7969  0006 7b07          	ld	a,(OFST+6,sp)
7970  0008 97            	ld	xl,a
7971  0009 a610          	ld	a,#16
7972  000b 42            	mul	x,a
7973  000c 9f            	ld	a,xl
7974  000d 1a03          	or	a,(OFST+2,sp)
7975  000f 6b01          	ld	(OFST+0,sp),a
7976  0011 c652bb        	ld	a,21179
7977  0014 a40c          	and	a,#12
7978  0016 1a01          	or	a,(OFST+0,sp)
7979  0018 c752bb        	ld	21179,a
7980                     ; 2708   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7982  001b 0d02          	tnz	(OFST+1,sp)
7983  001d 2706          	jreq	L1014
7984                     ; 2710     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7986  001f 721252be      	bset	21182,#1
7988  0023 2004          	jra	L3014
7989  0025               L1014:
7990                     ; 2714     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7992  0025 721352be      	bres	21182,#1
7993  0029               L3014:
7994                     ; 2717   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7996  0029 721052be      	bset	21182,#0
7997                     ; 2718 }
8000  002d 5b03          	addw	sp,#3
8001  002f 87            	retf
8046                     ; 2733 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8046                     ; 2734 {
8047                     .text:	section	.text,new
8048  0000               L11f_TI4_Config:
8050  0000 89            	pushw	x
8051  0001 88            	push	a
8052       00000001      OFST:	set	1
8055                     ; 2737   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8057  0002 721952be      	bres	21182,#4
8058                     ; 2740   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8058                     ; 2741                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8060  0006 7b07          	ld	a,(OFST+6,sp)
8061  0008 97            	ld	xl,a
8062  0009 a610          	ld	a,#16
8063  000b 42            	mul	x,a
8064  000c 9f            	ld	a,xl
8065  000d 1a03          	or	a,(OFST+2,sp)
8066  000f 6b01          	ld	(OFST+0,sp),a
8067  0011 c652bc        	ld	a,21180
8068  0014 a40c          	and	a,#12
8069  0016 1a01          	or	a,(OFST+0,sp)
8070  0018 c752bc        	ld	21180,a
8071                     ; 2744   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8073  001b 0d02          	tnz	(OFST+1,sp)
8074  001d 2706          	jreq	L5214
8075                     ; 2746     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8077  001f 721a52be      	bset	21182,#5
8079  0023 2004          	jra	L7214
8080  0025               L5214:
8081                     ; 2750     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8083  0025 721b52be      	bres	21182,#5
8084  0029               L7214:
8085                     ; 2754   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8087  0029 721852be      	bset	21182,#4
8088                     ; 2755 }
8091  002d 5b03          	addw	sp,#3
8092  002f 87            	retf
8104                     	xdef	f_TIM1_SelectHallSensor
8105                     	xdef	f_TIM1_EncoderInterfaceConfig
8106                     	xdef	f_TIM1_ETRConfig
8107                     	xdef	f_TIM1_SelectMasterSlaveMode
8108                     	xdef	f_TIM1_SelectSlaveMode
8109                     	xdef	f_TIM1_SelectOutputTrigger
8110                     	xdef	f_TIM1_SelectInputTrigger
8111                     	xdef	f_TIM1_ETRClockMode2Config
8112                     	xdef	f_TIM1_ETRClockMode1Config
8113                     	xdef	f_TIM1_TIxExternalClockConfig
8114                     	xdef	f_TIM1_InternalClockConfig
8115                     	xdef	f_TIM1_SelectCCDMA
8116                     	xdef	f_TIM1_DMACmd
8117                     	xdef	f_TIM1_DMAConfig
8118                     	xdef	f_TIM1_ClearITPendingBit
8119                     	xdef	f_TIM1_GetITStatus
8120                     	xdef	f_TIM1_ClearFlag
8121                     	xdef	f_TIM1_GetFlagStatus
8122                     	xdef	f_TIM1_GenerateEvent
8123                     	xdef	f_TIM1_ITConfig
8124                     	xdef	f_TIM1_SetIC4Prescaler
8125                     	xdef	f_TIM1_SetIC3Prescaler
8126                     	xdef	f_TIM1_SetIC2Prescaler
8127                     	xdef	f_TIM1_SetIC1Prescaler
8128                     	xdef	f_TIM1_GetCapture4
8129                     	xdef	f_TIM1_GetCapture3
8130                     	xdef	f_TIM1_GetCapture2
8131                     	xdef	f_TIM1_GetCapture1
8132                     	xdef	f_TIM1_PWMIConfig
8133                     	xdef	f_TIM1_ICInit
8134                     	xdef	f_TIM1_CCxNCmd
8135                     	xdef	f_TIM1_CCxCmd
8136                     	xdef	f_TIM1_SelectCOM
8137                     	xdef	f_TIM1_SelectOCREFClear
8138                     	xdef	f_TIM1_OC3NPolarityConfig
8139                     	xdef	f_TIM1_OC3PolarityConfig
8140                     	xdef	f_TIM1_OC2NPolarityConfig
8141                     	xdef	f_TIM1_OC2PolarityConfig
8142                     	xdef	f_TIM1_OC1NPolarityConfig
8143                     	xdef	f_TIM1_OC1PolarityConfig
8144                     	xdef	f_TIM1_ClearOC4Ref
8145                     	xdef	f_TIM1_ClearOC3Ref
8146                     	xdef	f_TIM1_ClearOC2Ref
8147                     	xdef	f_TIM1_ClearOC1Ref
8148                     	xdef	f_TIM1_OC3FastConfig
8149                     	xdef	f_TIM1_OC2FastConfig
8150                     	xdef	f_TIM1_OC1FastConfig
8151                     	xdef	f_TIM1_OC4PreloadConfig
8152                     	xdef	f_TIM1_OC3PreloadConfig
8153                     	xdef	f_TIM1_OC2PreloadConfig
8154                     	xdef	f_TIM1_OC1PreloadConfig
8155                     	xdef	f_TIM1_ForcedOC3Config
8156                     	xdef	f_TIM1_ForcedOC2Config
8157                     	xdef	f_TIM1_ForcedOC1Config
8158                     	xdef	f_TIM1_CCPreloadControl
8159                     	xdef	f_TIM1_SetCompare4
8160                     	xdef	f_TIM1_SetCompare3
8161                     	xdef	f_TIM1_SetCompare2
8162                     	xdef	f_TIM1_SetCompare1
8163                     	xdef	f_TIM1_SelectOCxM
8164                     	xdef	f_TIM1_CtrlPWMOutputs
8165                     	xdef	f_TIM1_BDTRConfig
8166                     	xdef	f_TIM1_OC3Init
8167                     	xdef	f_TIM1_OC2Init
8168                     	xdef	f_TIM1_OC1Init
8169                     	xdef	f_TIM1_Cmd
8170                     	xdef	f_TIM1_SelectOnePulseMode
8171                     	xdef	f_TIM1_ARRPreloadConfig
8172                     	xdef	f_TIM1_UpdateRequestConfig
8173                     	xdef	f_TIM1_UpdateDisableConfig
8174                     	xdef	f_TIM1_GetPrescaler
8175                     	xdef	f_TIM1_GetCounter
8176                     	xdef	f_TIM1_SetAutoreload
8177                     	xdef	f_TIM1_SetCounter
8178                     	xdef	f_TIM1_CounterModeConfig
8179                     	xdef	f_TIM1_PrescalerConfig
8180                     	xdef	f_TIM1_TimeBaseInit
8181                     	xdef	f_TIM1_DeInit
8200                     	end
