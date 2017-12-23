   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 82 void PWR_DeInit(void)
  33                     ; 83 {
  34                     .text:	section	.text,new
  35  0000               f_PWR_DeInit:
  39                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  41  0000 352050b2      	mov	20658,#32
  42                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  44  0004 725f50b3      	clr	20659
  45                     ; 86 }
  48  0008 87            	retf	
 144                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 144                     ; 103 {
 145                     .text:	section	.text,new
 146  0000               f_PWR_PVDLevelConfig:
 148  0000 88            	push	a
 149       00000000      OFST:	set	0
 152                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 154                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 156  0001 c650b2        	ld	a,20658
 157  0004 a4f1          	and	a,#241
 158  0006 c750b2        	ld	20658,a
 159                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 161  0009 c650b2        	ld	a,20658
 162  000c 1a01          	or	a,(OFST+1,sp)
 163  000e c750b2        	ld	20658,a
 164                     ; 113 }
 167  0011 84            	pop	a
 168  0012 87            	retf	
 222                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 222                     ; 122 {
 223                     .text:	section	.text,new
 224  0000               f_PWR_PVDCmd:
 228                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 230                     ; 126   if (NewState != DISABLE)
 232  0000 4d            	tnz	a
 233  0001 2705          	jreq	L111
 234                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 236  0003 721050b2      	bset	20658,#0
 239  0007 87            	retf	
 240  0008               L111:
 241                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 243  0008 721150b2      	bres	20658,#0
 244                     ; 136 }
 247  000c 87            	retf	
 281                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 281                     ; 172 {
 282                     .text:	section	.text,new
 283  0000               f_PWR_FastWakeUpCmd:
 287                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 289                     ; 176   if (NewState != DISABLE)
 291  0000 4d            	tnz	a
 292  0001 2705          	jreq	L331
 293                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 295  0003 721450b3      	bset	20659,#2
 298  0007 87            	retf	
 299  0008               L331:
 300                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 302  0008 721550b3      	bres	20659,#2
 303                     ; 186 }
 306  000c 87            	retf	
 341                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 341                     ; 195 {
 342                     .text:	section	.text,new
 343  0000               f_PWR_UltraLowPowerCmd:
 347                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 349                     ; 199   if (NewState != DISABLE)
 351  0000 4d            	tnz	a
 352  0001 2705          	jreq	L551
 353                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 355  0003 721250b3      	bset	20659,#1
 358  0007 87            	retf	
 359  0008               L551:
 360                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 362  0008 721350b3      	bres	20659,#1
 363                     ; 209 }
 366  000c 87            	retf	
 400                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 400                     ; 233 {
 401                     .text:	section	.text,new
 402  0000               f_PWR_PVDITConfig:
 406                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 408                     ; 237   if (NewState != DISABLE)
 410  0000 4d            	tnz	a
 411  0001 2705          	jreq	L771
 412                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 414  0003 721850b2      	bset	20658,#4
 417  0007 87            	retf	
 418  0008               L771:
 419                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 421  0008 721950b2      	bres	20658,#4
 422                     ; 247 }
 425  000c 87            	retf	
 517                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 517                     ; 262 {
 518                     .text:	section	.text,new
 519  0000               f_PWR_GetFlagStatus:
 521  0000 88            	push	a
 522  0001 88            	push	a
 523       00000001      OFST:	set	1
 526                     ; 263   FlagStatus bitstatus = RESET;
 528  0002 0f01          	clr	(OFST+0,sp)
 529                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 531                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 533  0004 a501          	bcp	a,#1
 534  0006 2709          	jreq	L742
 535                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 537  0008 720150b302    	btjf	20659,#0,L152
 538                     ; 272       bitstatus = SET;
 540  000d 2009          	jpf	LC002
 541  000f               L152:
 542                     ; 276       bitstatus = RESET;
 543  000f 200b          	jpf	L752
 544  0011               L742:
 545                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 547  0011 c650b2        	ld	a,20658
 548  0014 1502          	bcp	a,(OFST+1,sp)
 549  0016 2704          	jreq	L752
 550                     ; 283       bitstatus = SET;
 552  0018               LC002:
 554  0018 a601          	ld	a,#1
 556  001a 2001          	jra	L552
 557  001c               L752:
 558                     ; 287       bitstatus = RESET;
 561  001c 4f            	clr	a
 562  001d               L552:
 563                     ; 292   return((FlagStatus)bitstatus);
 567  001d 85            	popw	x
 568  001e 87            	retf	
 590                     ; 300 void PWR_PVDClearFlag(void)
 590                     ; 301 {
 591                     .text:	section	.text,new
 592  0000               f_PWR_PVDClearFlag:
 596                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 598  0000 721a50b2      	bset	20658,#5
 599                     ; 304 }
 602  0004 87            	retf	
 651                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 651                     ; 312 {
 652                     .text:	section	.text,new
 653  0000               f_PWR_PVDGetITStatus:
 655  0000 89            	pushw	x
 656       00000002      OFST:	set	2
 659                     ; 313   ITStatus bitstatus = RESET;
 661                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 665                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 667  0001 c650b2        	ld	a,20658
 668  0004 a420          	and	a,#32
 669  0006 6b01          	ld	(OFST-1,sp),a
 670                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 672  0008 c650b2        	ld	a,20658
 673  000b a410          	and	a,#16
 674  000d 6b02          	ld	(OFST+0,sp),a
 675                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 677  000f 7b01          	ld	a,(OFST-1,sp)
 678  0011 2708          	jreq	L513
 680  0013 7b02          	ld	a,(OFST+0,sp)
 681  0015 2704          	jreq	L513
 682                     ; 322     bitstatus = (ITStatus)SET;
 684  0017 a601          	ld	a,#1
 686  0019 2001          	jra	L713
 687  001b               L513:
 688                     ; 326     bitstatus = (ITStatus)RESET;
 690  001b 4f            	clr	a
 691  001c               L713:
 692                     ; 328   return ((ITStatus)bitstatus);
 696  001c 85            	popw	x
 697  001d 87            	retf	
 720                     ; 336 void PWR_PVDClearITPendingBit(void)
 720                     ; 337 {
 721                     .text:	section	.text,new
 722  0000               f_PWR_PVDClearITPendingBit:
 726                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 728  0000 721a50b2      	bset	20658,#5
 729                     ; 340 }
 732  0004 87            	retf	
 744                     	xdef	f_PWR_PVDClearITPendingBit
 745                     	xdef	f_PWR_PVDClearFlag
 746                     	xdef	f_PWR_GetFlagStatus
 747                     	xdef	f_PWR_PVDGetITStatus
 748                     	xdef	f_PWR_PVDITConfig
 749                     	xdef	f_PWR_UltraLowPowerCmd
 750                     	xdef	f_PWR_FastWakeUpCmd
 751                     	xdef	f_PWR_PVDCmd
 752                     	xdef	f_PWR_PVDLevelConfig
 753                     	xdef	f_PWR_DeInit
 772                     	end
