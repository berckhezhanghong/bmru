   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 82 void PWR_DeInit(void)
  33                     ; 83 {
  35                     .text:	section	.text,new
  36  0000               _PWR_DeInit:
  40                     ; 84   PWR->CSR1 = PWR_CSR1_PVDIF;
  42  0000 352050b2      	mov	20658,#32
  43                     ; 85   PWR->CSR2 = PWR_CSR2_RESET_VALUE;
  45  0004 725f50b3      	clr	20659
  46                     ; 86 }
  49  0008 81            	ret	
 146                     ; 102 void PWR_PVDLevelConfig(PWR_PVDLevel_TypeDef PWR_PVDLevel)
 146                     ; 103 {
 147                     .text:	section	.text,new
 148  0000               _PWR_PVDLevelConfig:
 150  0000 88            	push	a
 151       00000000      OFST:	set	0
 154                     ; 105   assert_param(IS_PWR_PVD_LEVEL(PWR_PVDLevel));
 156                     ; 108   PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PLS);
 158  0001 c650b2        	ld	a,20658
 159  0004 a4f1          	and	a,#241
 160  0006 c750b2        	ld	20658,a
 161                     ; 111   PWR->CSR1 |= PWR_PVDLevel;
 163  0009 c650b2        	ld	a,20658
 164  000c 1a01          	or	a,(OFST+1,sp)
 165  000e c750b2        	ld	20658,a
 166                     ; 113 }
 169  0011 84            	pop	a
 170  0012 81            	ret	
 225                     ; 121 void PWR_PVDCmd(FunctionalState NewState)
 225                     ; 122 {
 226                     .text:	section	.text,new
 227  0000               _PWR_PVDCmd:
 231                     ; 124   assert_param(IS_FUNCTIONAL_STATE(NewState));
 233                     ; 126   if (NewState != DISABLE)
 235  0000 4d            	tnz	a
 236  0001 2705          	jreq	L111
 237                     ; 129     PWR->CSR1 |= PWR_CSR1_PVDE;
 239  0003 721050b2      	bset	20658,#0
 242  0007 81            	ret	
 243  0008               L111:
 244                     ; 134     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDE);
 246  0008 721150b2      	bres	20658,#0
 247                     ; 136 }
 250  000c 81            	ret	
 285                     ; 171 void PWR_FastWakeUpCmd(FunctionalState NewState)
 285                     ; 172 {
 286                     .text:	section	.text,new
 287  0000               _PWR_FastWakeUpCmd:
 291                     ; 174   assert_param(IS_FUNCTIONAL_STATE(NewState));
 293                     ; 176   if (NewState != DISABLE)
 295  0000 4d            	tnz	a
 296  0001 2705          	jreq	L331
 297                     ; 179     PWR->CSR2 |= PWR_CSR2_FWU;
 299  0003 721450b3      	bset	20659,#2
 302  0007 81            	ret	
 303  0008               L331:
 304                     ; 184     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_FWU);
 306  0008 721550b3      	bres	20659,#2
 307                     ; 186 }
 310  000c 81            	ret	
 346                     ; 194 void PWR_UltraLowPowerCmd(FunctionalState NewState)
 346                     ; 195 {
 347                     .text:	section	.text,new
 348  0000               _PWR_UltraLowPowerCmd:
 352                     ; 197   assert_param(IS_FUNCTIONAL_STATE(NewState));
 354                     ; 199   if (NewState != DISABLE)
 356  0000 4d            	tnz	a
 357  0001 2705          	jreq	L551
 358                     ; 202     PWR->CSR2 |= PWR_CSR2_ULP;
 360  0003 721250b3      	bset	20659,#1
 363  0007 81            	ret	
 364  0008               L551:
 365                     ; 207     PWR->CSR2 &= (uint8_t)(~PWR_CSR2_ULP);
 367  0008 721350b3      	bres	20659,#1
 368                     ; 209 }
 371  000c 81            	ret	
 406                     ; 232 void PWR_PVDITConfig(FunctionalState NewState)
 406                     ; 233 {
 407                     .text:	section	.text,new
 408  0000               _PWR_PVDITConfig:
 412                     ; 235   assert_param(IS_FUNCTIONAL_STATE(NewState));
 414                     ; 237   if (NewState != DISABLE)
 416  0000 4d            	tnz	a
 417  0001 2705          	jreq	L771
 418                     ; 240     PWR->CSR1 |= PWR_CSR1_PVDIEN;
 420  0003 721850b2      	bset	20658,#4
 423  0007 81            	ret	
 424  0008               L771:
 425                     ; 245     PWR->CSR1 &= (uint8_t)(~PWR_CSR1_PVDIEN);
 427  0008 721950b2      	bres	20658,#4
 428                     ; 247 }
 431  000c 81            	ret	
 524                     ; 261 FlagStatus PWR_GetFlagStatus(PWR_FLAG_TypeDef PWR_FLAG)
 524                     ; 262 {
 525                     .text:	section	.text,new
 526  0000               _PWR_GetFlagStatus:
 528  0000 88            	push	a
 529  0001 88            	push	a
 530       00000001      OFST:	set	1
 533                     ; 263   FlagStatus bitstatus = RESET;
 535  0002 0f01          	clr	(OFST+0,sp)
 536                     ; 266   assert_param(IS_PWR_FLAG(PWR_FLAG));
 538                     ; 268   if ((PWR_FLAG & PWR_FLAG_VREFINTF) != 0)
 540  0004 a501          	bcp	a,#1
 541  0006 2709          	jreq	L742
 542                     ; 270     if ((PWR->CSR2 & PWR_CR2_VREFINTF) != (uint8_t)RESET )
 544  0008 720150b302    	btjf	20659,#0,L152
 545                     ; 272       bitstatus = SET;
 547  000d 2009          	jp	LC002
 548  000f               L152:
 549                     ; 276       bitstatus = RESET;
 550  000f 200b          	jp	L752
 551  0011               L742:
 552                     ; 281     if ((PWR->CSR1 & PWR_FLAG) != (uint8_t)RESET )
 554  0011 c650b2        	ld	a,20658
 555  0014 1502          	bcp	a,(OFST+1,sp)
 556  0016 2704          	jreq	L752
 557                     ; 283       bitstatus = SET;
 559  0018               LC002:
 561  0018 a601          	ld	a,#1
 563  001a 2001          	jra	L552
 564  001c               L752:
 565                     ; 287       bitstatus = RESET;
 568  001c 4f            	clr	a
 569  001d               L552:
 570                     ; 292   return((FlagStatus)bitstatus);
 574  001d 85            	popw	x
 575  001e 81            	ret	
 598                     ; 300 void PWR_PVDClearFlag(void)
 598                     ; 301 {
 599                     .text:	section	.text,new
 600  0000               _PWR_PVDClearFlag:
 604                     ; 303   PWR->CSR1 |= PWR_CSR1_PVDIF;
 606  0000 721a50b2      	bset	20658,#5
 607                     ; 304 }
 610  0004 81            	ret	
 664                     ; 311 ITStatus PWR_PVDGetITStatus(void)
 664                     ; 312 {
 665                     .text:	section	.text,new
 666  0000               _PWR_PVDGetITStatus:
 668  0000 89            	pushw	x
 669       00000002      OFST:	set	2
 672                     ; 313   ITStatus bitstatus = RESET;
 674                     ; 315   uint8_t PVD_itStatus = 0x0, PVD_itEnable = 0x0;
 678                     ; 317   PVD_itStatus = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIF);
 680  0001 c650b2        	ld	a,20658
 681  0004 a420          	and	a,#32
 682  0006 6b01          	ld	(OFST-1,sp),a
 683                     ; 318   PVD_itEnable = (uint8_t)(PWR->CSR1 & (uint8_t)PWR_CSR1_PVDIEN);
 685  0008 c650b2        	ld	a,20658
 686  000b a410          	and	a,#16
 687  000d 6b02          	ld	(OFST+0,sp),a
 688                     ; 320   if ((PVD_itStatus != (uint8_t)RESET ) && (PVD_itEnable != (uint8_t)RESET))
 690  000f 7b01          	ld	a,(OFST-1,sp)
 691  0011 2708          	jreq	L123
 693  0013 7b02          	ld	a,(OFST+0,sp)
 694  0015 2704          	jreq	L123
 695                     ; 322     bitstatus = (ITStatus)SET;
 697  0017 a601          	ld	a,#1
 699  0019 2001          	jra	L323
 700  001b               L123:
 701                     ; 326     bitstatus = (ITStatus)RESET;
 703  001b 4f            	clr	a
 704  001c               L323:
 705                     ; 328   return ((ITStatus)bitstatus);
 709  001c 85            	popw	x
 710  001d 81            	ret	
 734                     ; 336 void PWR_PVDClearITPendingBit(void)
 734                     ; 337 {
 735                     .text:	section	.text,new
 736  0000               _PWR_PVDClearITPendingBit:
 740                     ; 339   PWR->CSR1 |= PWR_CSR1_PVDIF;
 742  0000 721a50b2      	bset	20658,#5
 743                     ; 340 }
 746  0004 81            	ret	
 759                     	xdef	_PWR_PVDClearITPendingBit
 760                     	xdef	_PWR_PVDClearFlag
 761                     	xdef	_PWR_GetFlagStatus
 762                     	xdef	_PWR_PVDGetITStatus
 763                     	xdef	_PWR_PVDITConfig
 764                     	xdef	_PWR_UltraLowPowerCmd
 765                     	xdef	_PWR_FastWakeUpCmd
 766                     	xdef	_PWR_PVDCmd
 767                     	xdef	_PWR_PVDLevelConfig
 768                     	xdef	_PWR_DeInit
 787                     	end
