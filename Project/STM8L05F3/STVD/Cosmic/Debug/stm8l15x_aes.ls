   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  32                     ; 93 void AES_DeInit(void)
  32                     ; 94 {
  33                     .text:	section	.text,new
  34  0000               f_AES_DeInit:
  38                     ; 96   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  40  0000 351853d0      	mov	21456,#24
  41                     ; 97   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  43  0004 725f53d2      	clr	21458
  44                     ; 98   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  46  0008 725f53d3      	clr	21459
  47                     ; 99 }
  50  000c 87            	retf
 123                     ; 112 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 123                     ; 113 {
 124                     .text:	section	.text,new
 125  0000               f_AES_OperationModeConfig:
 127  0000 88            	push	a
 128       00000000      OFST:	set	0
 131                     ; 115   assert_param(IS_AES_MODE(AES_Operation));
 133                     ; 118   AES->CR &= (uint8_t) (~AES_CR_MODE);
 135  0001 c653d0        	ld	a,21456
 136  0004 a4f9          	and	a,#249
 137  0006 c753d0        	ld	21456,a
 138                     ; 121   AES->CR |= (uint8_t) (AES_Operation);
 140  0009 c653d0        	ld	a,21456
 141  000c 1a01          	or	a,(OFST+1,sp)
 142  000e c753d0        	ld	21456,a
 143                     ; 122 }
 146  0011 84            	pop	a
 147  0012 87            	retf
 201                     ; 132 void AES_Cmd(FunctionalState NewState)
 201                     ; 133 {
 202                     .text:	section	.text,new
 203  0000               f_AES_Cmd:
 207                     ; 135   assert_param(IS_FUNCTIONAL_STATE(NewState));
 209                     ; 137   if (NewState != DISABLE)
 211  0000 4d            	tnz	a
 212  0001 2706          	jreq	L101
 213                     ; 139     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 215  0003 721053d0      	bset	21456,#0
 217  0007 2004          	jra	L301
 218  0009               L101:
 219                     ; 143     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 221  0009 721153d0      	bres	21456,#0
 222  000d               L301:
 223                     ; 145 }
 226  000d 87            	retf
 257                     ; 170 void AES_WriteSubData(uint8_t Data)
 257                     ; 171 {
 258                     .text:	section	.text,new
 259  0000               f_AES_WriteSubData:
 263                     ; 173   AES->DINR = Data;
 265  0000 c753d2        	ld	21458,a
 266                     ; 174 }
 269  0003 87            	retf
 300                     ; 183 void AES_WriteSubKey(uint8_t Key)
 300                     ; 184 {
 301                     .text:	section	.text,new
 302  0000               f_AES_WriteSubKey:
 306                     ; 186   AES->DINR = Key;
 308  0000 c753d2        	ld	21458,a
 309                     ; 187 }
 312  0003 87            	retf
 334                     ; 195 uint8_t AES_ReadSubData(void)
 334                     ; 196 {
 335                     .text:	section	.text,new
 336  0000               f_AES_ReadSubData:
 340                     ; 197   return AES->DOUTR;
 342  0000 c653d3        	ld	a,21459
 345  0003 87            	retf
 367                     ; 206 uint8_t AES_ReadSubKey(void)
 367                     ; 207 {
 368                     .text:	section	.text,new
 369  0000               f_AES_ReadSubKey:
 373                     ; 208   return AES->DOUTR;
 375  0000 c653d3        	ld	a,21459
 378  0003 87            	retf
 436                     ; 237 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 436                     ; 238 {
 437                     .text:	section	.text,new
 438  0000               f_AES_DMAConfig:
 440  0000 89            	pushw	x
 441       00000000      OFST:	set	0
 444                     ; 240   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 446                     ; 242   if (NewState != DISABLE)
 448  0001 9f            	ld	a,xl
 449  0002 4d            	tnz	a
 450  0003 2709          	jreq	L502
 451                     ; 245     AES->CR |= (uint8_t) AES_DMATransfer;
 453  0005 9e            	ld	a,xh
 454  0006 ca53d0        	or	a,21456
 455  0009 c753d0        	ld	21456,a
 457  000c 2009          	jra	L702
 458  000e               L502:
 459                     ; 250     AES->CR &= (uint8_t)(~AES_DMATransfer);
 461  000e 7b01          	ld	a,(OFST+1,sp)
 462  0010 43            	cpl	a
 463  0011 c453d0        	and	a,21456
 464  0014 c753d0        	ld	21456,a
 465  0017               L702:
 466                     ; 252 }
 469  0017 85            	popw	x
 470  0018 87            	retf
 534                     ; 281 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 534                     ; 282 {
 535                     .text:	section	.text,new
 536  0000               f_AES_ITConfig:
 538  0000 89            	pushw	x
 539       00000000      OFST:	set	0
 542                     ; 284   assert_param(IS_FUNCTIONAL_STATE(NewState));
 544                     ; 285   assert_param(IS_AES_IT(AES_IT));
 546                     ; 287   if (NewState != DISABLE)
 548  0001 9f            	ld	a,xl
 549  0002 4d            	tnz	a
 550  0003 2709          	jreq	L342
 551                     ; 289     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 553  0005 9e            	ld	a,xh
 554  0006 ca53d0        	or	a,21456
 555  0009 c753d0        	ld	21456,a
 557  000c 2009          	jra	L542
 558  000e               L342:
 559                     ; 293     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 561  000e 7b01          	ld	a,(OFST+1,sp)
 562  0010 43            	cpl	a
 563  0011 c453d0        	and	a,21456
 564  0014 c753d0        	ld	21456,a
 565  0017               L542:
 566                     ; 295 }
 569  0017 85            	popw	x
 570  0018 87            	retf
 662                     ; 307 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 662                     ; 308 {
 663                     .text:	section	.text,new
 664  0000               f_AES_GetFlagStatus:
 666  0000 88            	push	a
 667  0001 88            	push	a
 668       00000001      OFST:	set	1
 671                     ; 309   FlagStatus status = RESET;
 673  0002 0f01          	clr	(OFST+0,sp)
 674                     ; 312   assert_param(IS_AES_FLAG(AES_FLAG));
 676                     ; 314   if (AES_FLAG == AES_FLAG_CCF)
 678  0004 a101          	cp	a,#1
 679  0006 2611          	jrne	L313
 680                     ; 316     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 682  0008 c653d1        	ld	a,21457
 683  000b a501          	bcp	a,#1
 684  000d 2706          	jreq	L513
 685                     ; 319       status = (FlagStatus) SET;
 687  000f a601          	ld	a,#1
 688  0011 6b01          	ld	(OFST+0,sp),a
 690  0013 202a          	jra	L123
 691  0015               L513:
 692                     ; 324       status = (FlagStatus) RESET;
 694  0015 0f01          	clr	(OFST+0,sp)
 695  0017 2026          	jra	L123
 696  0019               L313:
 697                     ; 327   else if (AES_FLAG == AES_FLAG_RDERR)
 699  0019 7b02          	ld	a,(OFST+1,sp)
 700  001b a102          	cp	a,#2
 701  001d 2611          	jrne	L323
 702                     ; 329     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 704  001f c653d1        	ld	a,21457
 705  0022 a502          	bcp	a,#2
 706  0024 2706          	jreq	L523
 707                     ; 332       status = (FlagStatus) SET;
 709  0026 a601          	ld	a,#1
 710  0028 6b01          	ld	(OFST+0,sp),a
 712  002a 2013          	jra	L123
 713  002c               L523:
 714                     ; 337       status = (FlagStatus) RESET;
 716  002c 0f01          	clr	(OFST+0,sp)
 717  002e 200f          	jra	L123
 718  0030               L323:
 719                     ; 342     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 721  0030 c653d1        	ld	a,21457
 722  0033 a504          	bcp	a,#4
 723  0035 2706          	jreq	L333
 724                     ; 345       status = (FlagStatus) SET;
 726  0037 a601          	ld	a,#1
 727  0039 6b01          	ld	(OFST+0,sp),a
 729  003b 2002          	jra	L123
 730  003d               L333:
 731                     ; 350       status = (FlagStatus) RESET;
 733  003d 0f01          	clr	(OFST+0,sp)
 734  003f               L123:
 735                     ; 354   return ((FlagStatus) status);
 737  003f 7b01          	ld	a,(OFST+0,sp)
 740  0041 85            	popw	x
 741  0042 87            	retf
 775                     ; 366 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 775                     ; 367 {
 776                     .text:	section	.text,new
 777  0000               f_AES_ClearFlag:
 781                     ; 369   assert_param(IS_AES_FLAG(AES_FLAG));
 783                     ; 372   if (AES_FLAG == AES_FLAG_CCF)
 785  0000 a101          	cp	a,#1
 786  0002 2606          	jrne	L553
 787                     ; 375     AES->CR |= (uint8_t) AES_CR_CCFC;
 789  0004 721653d0      	bset	21456,#3
 791  0008 2004          	jra	L753
 792  000a               L553:
 793                     ; 380     AES->CR |= (uint8_t) AES_CR_ERRC;
 795  000a 721853d0      	bset	21456,#4
 796  000e               L753:
 797                     ; 382 }
 800  000e 87            	retf
 865                     ; 392 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 865                     ; 393 {
 866                     .text:	section	.text,new
 867  0000               f_AES_GetITStatus:
 869  0000 88            	push	a
 870  0001 89            	pushw	x
 871       00000002      OFST:	set	2
 874                     ; 394   ITStatus itstatus = RESET;
 876  0002 7b02          	ld	a,(OFST+0,sp)
 877  0004 97            	ld	xl,a
 878                     ; 395   BitStatus cciebitstatus, ccfbitstatus = RESET;
 880  0005 7b02          	ld	a,(OFST+0,sp)
 881  0007 97            	ld	xl,a
 882                     ; 398   assert_param(IS_AES_IT(AES_IT));
 884                     ; 400   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 886  0008 c653d0        	ld	a,21456
 887  000b a420          	and	a,#32
 888  000d 6b01          	ld	(OFST-1,sp),a
 889                     ; 401   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 891  000f c653d1        	ld	a,21457
 892  0012 a401          	and	a,#1
 893  0014 6b02          	ld	(OFST+0,sp),a
 894                     ; 404   if (AES_IT == AES_IT_CCIE)
 896  0016 7b03          	ld	a,(OFST+1,sp)
 897  0018 a120          	cp	a,#32
 898  001a 2612          	jrne	L314
 899                     ; 407     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 901  001c 0d01          	tnz	(OFST-1,sp)
 902  001e 270a          	jreq	L514
 904  0020 0d02          	tnz	(OFST+0,sp)
 905  0022 2706          	jreq	L514
 906                     ; 410       itstatus = (ITStatus) SET;
 908  0024 a601          	ld	a,#1
 909  0026 6b02          	ld	(OFST+0,sp),a
 911  0028 201e          	jra	L124
 912  002a               L514:
 913                     ; 415       itstatus = (ITStatus) RESET;
 915  002a 0f02          	clr	(OFST+0,sp)
 916  002c 201a          	jra	L124
 917  002e               L314:
 918                     ; 421     if ((AES->CR & AES_CR_ERRIE) != RESET)
 920  002e c653d0        	ld	a,21456
 921  0031 a540          	bcp	a,#64
 922  0033 2711          	jreq	L324
 923                     ; 424       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 925  0035 c653d1        	ld	a,21457
 926  0038 a506          	bcp	a,#6
 927  003a 2706          	jreq	L524
 928                     ; 427         itstatus = (ITStatus) SET;
 930  003c a601          	ld	a,#1
 931  003e 6b02          	ld	(OFST+0,sp),a
 933  0040 2006          	jra	L124
 934  0042               L524:
 935                     ; 432         itstatus = (ITStatus) RESET;
 937  0042 0f02          	clr	(OFST+0,sp)
 938  0044 2002          	jra	L124
 939  0046               L324:
 940                     ; 438       itstatus = (ITStatus) RESET;
 942  0046 0f02          	clr	(OFST+0,sp)
 943  0048               L124:
 944                     ; 443   return ((ITStatus)itstatus);
 946  0048 7b02          	ld	a,(OFST+0,sp)
 949  004a 5b03          	addw	sp,#3
 950  004c 87            	retf
 985                     ; 454 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
 985                     ; 455 {
 986                     .text:	section	.text,new
 987  0000               f_AES_ClearITPendingBit:
 991                     ; 457   assert_param(IS_AES_IT(AES_IT));
 993                     ; 460   if (AES_IT == AES_IT_CCIE)
 995  0000 a120          	cp	a,#32
 996  0002 2606          	jrne	L154
 997                     ; 463     AES->CR |= (uint8_t) AES_CR_CCFC;
 999  0004 721653d0      	bset	21456,#3
1001  0008 2004          	jra	L354
1002  000a               L154:
1003                     ; 468     AES->CR |= (uint8_t) AES_CR_ERRC;
1005  000a 721853d0      	bset	21456,#4
1006  000e               L354:
1007                     ; 470 }
1010  000e 87            	retf
1022                     	xdef	f_AES_ClearITPendingBit
1023                     	xdef	f_AES_GetITStatus
1024                     	xdef	f_AES_ClearFlag
1025                     	xdef	f_AES_GetFlagStatus
1026                     	xdef	f_AES_ITConfig
1027                     	xdef	f_AES_DMAConfig
1028                     	xdef	f_AES_ReadSubKey
1029                     	xdef	f_AES_ReadSubData
1030                     	xdef	f_AES_WriteSubKey
1031                     	xdef	f_AES_WriteSubData
1032                     	xdef	f_AES_Cmd
1033                     	xdef	f_AES_OperationModeConfig
1034                     	xdef	f_AES_DeInit
1053                     	end
