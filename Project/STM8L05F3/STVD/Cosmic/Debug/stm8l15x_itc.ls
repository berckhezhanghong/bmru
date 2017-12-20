   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 56 uint8_t ITC_GetCPUCC(void)
  33                     ; 57 {
  35                     .text:	section	.text,new
  36  0000               _ITC_GetCPUCC:
  40                     ; 59   _asm("push cc");
  43  0000 8a            	push	cc
  45                     ; 60   _asm("pop a");
  48  0001 84            	pop	a
  50                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  53  0002 81            	ret	
  76                     ; 87 void ITC_DeInit(void)
  76                     ; 88 {
  77                     .text:	section	.text,new
  78  0000               _ITC_DeInit:
  82                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  84  0000 35ff7f70      	mov	32624,#255
  85                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  87  0004 35ff7f71      	mov	32625,#255
  88                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  90  0008 35ff7f72      	mov	32626,#255
  91                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  93  000c 35ff7f73      	mov	32627,#255
  94                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  96  0010 35ff7f74      	mov	32628,#255
  97                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  99  0014 35ff7f75      	mov	32629,#255
 100                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 102  0018 35ff7f76      	mov	32630,#255
 103                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 105  001c 35ff7f77      	mov	32631,#255
 106                     ; 97 }
 109  0020 81            	ret	
 134                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 134                     ; 105 {
 135                     .text:	section	.text,new
 136  0000               _ITC_GetSoftIntStatus:
 140                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 142  0000 cd0000        	call	_ITC_GetCPUCC
 144  0003 a428          	and	a,#40
 147  0005 81            	ret	
 433                     .const:	section	.text
 434  0000               L42:
 435  0000 0024          	dc.w	L14
 436  0002 0024          	dc.w	L14
 437  0004 0024          	dc.w	L14
 438  0006 0029          	dc.w	L34
 439  0008 0029          	dc.w	L34
 440  000a 0029          	dc.w	L34
 441  000c 0029          	dc.w	L34
 442  000e 002e          	dc.w	L54
 443  0010 002e          	dc.w	L54
 444  0012 002e          	dc.w	L54
 445  0014 002e          	dc.w	L54
 446  0016 0033          	dc.w	L74
 447  0018 0033          	dc.w	L74
 448  001a 0033          	dc.w	L74
 449  001c 0033          	dc.w	L74
 450  001e 004e          	dc.w	L712
 451  0020 0038          	dc.w	L15
 452  0022 0038          	dc.w	L15
 453  0024 0038          	dc.w	L15
 454  0026 003d          	dc.w	L35
 455  0028 003d          	dc.w	L35
 456  002a 003d          	dc.w	L35
 457  002c 004e          	dc.w	L712
 458  002e 004e          	dc.w	L712
 459  0030 0042          	dc.w	L55
 460  0032 0042          	dc.w	L55
 461  0034 0042          	dc.w	L55
 462  0036 0047          	dc.w	L75
 463  0038 0047          	dc.w	L75
 464                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 464                     ; 115 {
 465                     .text:	section	.text,new
 466  0000               _ITC_GetSoftwarePriority:
 468  0000 88            	push	a
 469  0001 89            	pushw	x
 470       00000002      OFST:	set	2
 473                     ; 116   uint8_t Value = 0;
 475  0002 0f02          	clr	(OFST+0,sp)
 476                     ; 117   uint8_t Mask = 0;
 478                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 480                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 482  0004 7b03          	ld	a,(OFST+1,sp)
 483  0006 a403          	and	a,#3
 484  0008 48            	sll	a
 485  0009 5f            	clrw	x
 486  000a 97            	ld	xl,a
 487  000b a603          	ld	a,#3
 488  000d 5d            	tnzw	x
 489  000e 2704          	jreq	L61
 490  0010               L02:
 491  0010 48            	sll	a
 492  0011 5a            	decw	x
 493  0012 26fc          	jrne	L02
 494  0014               L61:
 495  0014 6b01          	ld	(OFST-1,sp),a
 496                     ; 125   switch (IRQn)
 498  0016 7b03          	ld	a,(OFST+1,sp)
 500                     ; 223     default:
 500                     ; 224       break;
 501  0018 4a            	dec	a
 502  0019 a11d          	cp	a,#29
 503  001b 2431          	jruge	L712
 504  001d 5f            	clrw	x
 505  001e 97            	ld	xl,a
 506  001f 58            	sllw	x
 507  0020 de0000        	ldw	x,(L42,x)
 508  0023 fc            	jp	(x)
 509  0024               L14:
 510                     ; 127     case FLASH_IRQn:
 510                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 510                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 510                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 512  0024 c67f70        	ld	a,32624
 513                     ; 131       break;
 515  0027 2021          	jp	LC001
 516  0029               L34:
 517                     ; 133     case EXTIE_F_PVD_IRQn:
 517                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 517                     ; 135     case RTC_IRQn:
 517                     ; 136     case EXTIB_IRQn:
 517                     ; 137     case EXTID_IRQn:
 517                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 517                     ; 139     case RTC_CSSLSE_IRQn:
 517                     ; 140     case EXTIB_IRQn:
 517                     ; 141     case EXTID_IRQn:
 517                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 517                     ; 143     case RTC_CSSLSE_IRQn:
 517                     ; 144     case EXTIB_G_IRQn:
 517                     ; 145     case EXTID_H_IRQn:
 517                     ; 146 #endif  /* STM8L15X_MD */
 517                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 519  0029 c67f71        	ld	a,32625
 520                     ; 148       break;
 522  002c 201c          	jp	LC001
 523  002e               L54:
 524                     ; 150     case EXTI0_IRQn:
 524                     ; 151     case EXTI1_IRQn:
 524                     ; 152     case EXTI2_IRQn:
 524                     ; 153     case EXTI3_IRQn:
 524                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 526  002e c67f72        	ld	a,32626
 527                     ; 155       break;
 529  0031 2017          	jp	LC001
 530  0033               L74:
 531                     ; 157     case EXTI4_IRQn:
 531                     ; 158     case EXTI5_IRQn:
 531                     ; 159     case EXTI6_IRQn:
 531                     ; 160     case EXTI7_IRQn:
 531                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 533  0033 c67f73        	ld	a,32627
 534                     ; 162       break;
 536  0036 2012          	jp	LC001
 537  0038               L15:
 538                     ; 165     case SWITCH_CSS_IRQn:
 538                     ; 166 #else
 538                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 538                     ; 168 #endif /* STM8L15X_LD */		
 538                     ; 169     case ADC1_COMP_IRQn:
 538                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 538                     ; 171     case LCD_IRQn:
 538                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 538                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 538                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 538                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 538                     ; 176     case LCD_AES_IRQn:
 538                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 538                     ; 178 #endif  /* STM8L15X_MD */
 538                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 540  0038 c67f74        	ld	a,32628
 541                     ; 180       break;
 543  003b 200d          	jp	LC001
 544  003d               L35:
 545                     ; 187     case TIM2_CC_IRQn:
 545                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 545                     ; 189     case TIM3_CC_IRQn:
 545                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 545                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 545                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 545                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 545                     ; 194 #endif  /* STM8L15X_MD */
 545                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 547  003d c67f75        	ld	a,32629
 548                     ; 196       break;
 550  0040 2008          	jp	LC001
 551  0042               L55:
 552                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 552                     ; 202     case SPI1_IRQn:
 552                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 552                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 552                     ; 205     case USART1_TX_IRQn:
 552                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 552                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 552                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 552                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 554  0042 c67f76        	ld	a,32630
 555                     ; 210       break;
 557  0045 2003          	jp	LC001
 558  0047               L75:
 559                     ; 214     case USART1_RX_IRQn:
 559                     ; 215     case I2C1_IRQn:
 559                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 559                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 559                     ; 218     case I2C1_SPI2_IRQn:
 559                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 559                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 561  0047 c67f77        	ld	a,32631
 562  004a               LC001:
 563  004a 1401          	and	a,(OFST-1,sp)
 564  004c 6b02          	ld	(OFST+0,sp),a
 565                     ; 221       break;
 567                     ; 223     default:
 567                     ; 224       break;
 569  004e               L712:
 570                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 572  004e 7b03          	ld	a,(OFST+1,sp)
 573  0050 a403          	and	a,#3
 574  0052 48            	sll	a
 575  0053 5f            	clrw	x
 576  0054 97            	ld	xl,a
 577  0055 7b02          	ld	a,(OFST+0,sp)
 578  0057 5d            	tnzw	x
 579  0058 2704          	jreq	L62
 580  005a               L03:
 581  005a 44            	srl	a
 582  005b 5a            	decw	x
 583  005c 26fc          	jrne	L03
 584  005e               L62:
 585                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 589  005e 5b03          	addw	sp,#3
 590  0060 81            	ret	
 654                     	switch	.const
 655  003a               L64:
 656  003a 0038          	dc.w	L122
 657  003c 0038          	dc.w	L122
 658  003e 0038          	dc.w	L122
 659  0040 004a          	dc.w	L322
 660  0042 004a          	dc.w	L322
 661  0044 004a          	dc.w	L322
 662  0046 004a          	dc.w	L322
 663  0048 005c          	dc.w	L522
 664  004a 005c          	dc.w	L522
 665  004c 005c          	dc.w	L522
 666  004e 005c          	dc.w	L522
 667  0050 006e          	dc.w	L722
 668  0052 006e          	dc.w	L722
 669  0054 006e          	dc.w	L722
 670  0056 006e          	dc.w	L722
 671  0058 00c6          	dc.w	L772
 672  005a 0080          	dc.w	L132
 673  005c 0080          	dc.w	L132
 674  005e 0080          	dc.w	L132
 675  0060 0092          	dc.w	L332
 676  0062 0092          	dc.w	L332
 677  0064 0092          	dc.w	L332
 678  0066 00c6          	dc.w	L772
 679  0068 00c6          	dc.w	L772
 680  006a 00a4          	dc.w	L532
 681  006c 00a4          	dc.w	L532
 682  006e 00a4          	dc.w	L532
 683  0070 00b6          	dc.w	L732
 684  0072 00b6          	dc.w	L732
 685                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 685                     ; 251 {
 686                     .text:	section	.text,new
 687  0000               _ITC_SetSoftwarePriority:
 689  0000 89            	pushw	x
 690  0001 89            	pushw	x
 691       00000002      OFST:	set	2
 694                     ; 252   uint8_t Mask = 0;
 696                     ; 253   uint8_t NewPriority = 0;
 698                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 700                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 702                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 704                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 706  0002 7b03          	ld	a,(OFST+1,sp)
 707  0004 a403          	and	a,#3
 708  0006 48            	sll	a
 709  0007 5f            	clrw	x
 710  0008 97            	ld	xl,a
 711  0009 a603          	ld	a,#3
 712  000b 5d            	tnzw	x
 713  000c 2704          	jreq	L43
 714  000e               L63:
 715  000e 48            	sll	a
 716  000f 5a            	decw	x
 717  0010 26fc          	jrne	L63
 718  0012               L43:
 719  0012 43            	cpl	a
 720  0013 6b01          	ld	(OFST-1,sp),a
 721                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 723  0015 7b03          	ld	a,(OFST+1,sp)
 724  0017 a403          	and	a,#3
 725  0019 48            	sll	a
 726  001a 5f            	clrw	x
 727  001b 97            	ld	xl,a
 728  001c 7b04          	ld	a,(OFST+2,sp)
 729  001e 5d            	tnzw	x
 730  001f 2704          	jreq	L04
 731  0021               L24:
 732  0021 48            	sll	a
 733  0022 5a            	decw	x
 734  0023 26fc          	jrne	L24
 735  0025               L04:
 736  0025 6b02          	ld	(OFST+0,sp),a
 737                     ; 268   switch (IRQn)
 739  0027 7b03          	ld	a,(OFST+1,sp)
 741                     ; 372     default:
 741                     ; 373       break;
 742  0029 4a            	dec	a
 743  002a a11d          	cp	a,#29
 744  002c 2503cc00c6    	jruge	L772
 745  0031 5f            	clrw	x
 746  0032 97            	ld	xl,a
 747  0033 58            	sllw	x
 748  0034 de003a        	ldw	x,(L64,x)
 749  0037 fc            	jp	(x)
 750  0038               L122:
 751                     ; 270     case FLASH_IRQn:
 751                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 751                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 751                     ; 273       ITC->ISPR1 &= Mask;
 753  0038 c67f70        	ld	a,32624
 754  003b 1401          	and	a,(OFST-1,sp)
 755  003d c77f70        	ld	32624,a
 756                     ; 274       ITC->ISPR1 |= NewPriority;
 758  0040 c67f70        	ld	a,32624
 759  0043 1a02          	or	a,(OFST+0,sp)
 760  0045 c77f70        	ld	32624,a
 761                     ; 275       break;
 763  0048 207c          	jra	L772
 764  004a               L322:
 765                     ; 277     case EXTIE_F_PVD_IRQn:
 765                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 765                     ; 279     case RTC_IRQn:
 765                     ; 280     case EXTIB_IRQn:
 765                     ; 281     case EXTID_IRQn:
 765                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 765                     ; 283     case RTC_CSSLSE_IRQn:
 765                     ; 284     case EXTIB_IRQn:
 765                     ; 285     case EXTID_IRQn:
 765                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 765                     ; 287     case RTC_CSSLSE_IRQn:
 765                     ; 288     case EXTIB_G_IRQn:
 765                     ; 289     case EXTID_H_IRQn:
 765                     ; 290 #endif  /* STM8L15X_MD */
 765                     ; 291       ITC->ISPR2 &= Mask;
 767  004a c67f71        	ld	a,32625
 768  004d 1401          	and	a,(OFST-1,sp)
 769  004f c77f71        	ld	32625,a
 770                     ; 292       ITC->ISPR2 |= NewPriority;
 772  0052 c67f71        	ld	a,32625
 773  0055 1a02          	or	a,(OFST+0,sp)
 774  0057 c77f71        	ld	32625,a
 775                     ; 293       break;
 777  005a 206a          	jra	L772
 778  005c               L522:
 779                     ; 295     case EXTI0_IRQn:
 779                     ; 296     case EXTI1_IRQn:
 779                     ; 297     case EXTI2_IRQn:
 779                     ; 298     case EXTI3_IRQn:
 779                     ; 299       ITC->ISPR3 &= Mask;
 781  005c c67f72        	ld	a,32626
 782  005f 1401          	and	a,(OFST-1,sp)
 783  0061 c77f72        	ld	32626,a
 784                     ; 300       ITC->ISPR3 |= NewPriority;
 786  0064 c67f72        	ld	a,32626
 787  0067 1a02          	or	a,(OFST+0,sp)
 788  0069 c77f72        	ld	32626,a
 789                     ; 301       break;
 791  006c 2058          	jra	L772
 792  006e               L722:
 793                     ; 303     case EXTI4_IRQn:
 793                     ; 304     case EXTI5_IRQn:
 793                     ; 305     case EXTI6_IRQn:
 793                     ; 306     case EXTI7_IRQn:
 793                     ; 307       ITC->ISPR4 &= Mask;
 795  006e c67f73        	ld	a,32627
 796  0071 1401          	and	a,(OFST-1,sp)
 797  0073 c77f73        	ld	32627,a
 798                     ; 308       ITC->ISPR4 |= NewPriority;
 800  0076 c67f73        	ld	a,32627
 801  0079 1a02          	or	a,(OFST+0,sp)
 802  007b c77f73        	ld	32627,a
 803                     ; 309       break;
 805  007e 2046          	jra	L772
 806  0080               L132:
 807                     ; 313     case SWITCH_CSS_IRQn:
 807                     ; 314 #endif /*	STM8L15X_LD	*/
 807                     ; 315     case ADC1_COMP_IRQn:
 807                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 807                     ; 317     case LCD_IRQn:
 807                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 807                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 807                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 807                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 807                     ; 322     case LCD_AES_IRQn:
 807                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 807                     ; 324 #endif  /* STM8L15X_MD */
 807                     ; 325       ITC->ISPR5 &= Mask;
 809  0080 c67f74        	ld	a,32628
 810  0083 1401          	and	a,(OFST-1,sp)
 811  0085 c77f74        	ld	32628,a
 812                     ; 326       ITC->ISPR5 |= NewPriority;
 814  0088 c67f74        	ld	a,32628
 815  008b 1a02          	or	a,(OFST+0,sp)
 816  008d c77f74        	ld	32628,a
 817                     ; 327       break;
 819  0090 2034          	jra	L772
 820  0092               L332:
 821                     ; 333     case TIM2_CC_IRQn:
 821                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 821                     ; 335     case TIM3_CC_IRQn:
 821                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 821                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 821                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 821                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 821                     ; 340 #endif  /* STM8L15X_MD */
 821                     ; 341       ITC->ISPR6 &= Mask;
 823  0092 c67f75        	ld	a,32629
 824  0095 1401          	and	a,(OFST-1,sp)
 825  0097 c77f75        	ld	32629,a
 826                     ; 342       ITC->ISPR6 |= NewPriority;
 828  009a c67f75        	ld	a,32629
 829  009d 1a02          	or	a,(OFST+0,sp)
 830  009f c77f75        	ld	32629,a
 831                     ; 343       break;
 833  00a2 2022          	jra	L772
 834  00a4               L532:
 835                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 835                     ; 349     case SPI1_IRQn:
 835                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 835                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 835                     ; 352     case USART1_TX_IRQn:
 835                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 835                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 835                     ; 355 #endif  /* STM8L15X_MD */
 835                     ; 356       ITC->ISPR7 &= Mask;
 837  00a4 c67f76        	ld	a,32630
 838  00a7 1401          	and	a,(OFST-1,sp)
 839  00a9 c77f76        	ld	32630,a
 840                     ; 357       ITC->ISPR7 |= NewPriority;
 842  00ac c67f76        	ld	a,32630
 843  00af 1a02          	or	a,(OFST+0,sp)
 844  00b1 c77f76        	ld	32630,a
 845                     ; 358       break;
 847  00b4 2010          	jra	L772
 848  00b6               L732:
 849                     ; 362     case USART1_RX_IRQn:
 849                     ; 363     case I2C1_IRQn:
 849                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 849                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 849                     ; 366     case I2C1_SPI2_IRQn:
 849                     ; 367 #endif  /* STM8L15X_MD */
 849                     ; 368       ITC->ISPR8 &= Mask;
 851  00b6 c67f77        	ld	a,32631
 852  00b9 1401          	and	a,(OFST-1,sp)
 853  00bb c77f77        	ld	32631,a
 854                     ; 369       ITC->ISPR8 |= NewPriority;
 856  00be c67f77        	ld	a,32631
 857  00c1 1a02          	or	a,(OFST+0,sp)
 858  00c3 c77f77        	ld	32631,a
 859                     ; 370       break;
 861                     ; 372     default:
 861                     ; 373       break;
 863  00c6               L772:
 864                     ; 375 }
 867  00c6 5b04          	addw	sp,#4
 868  00c8 81            	ret	
 881                     	xdef	_ITC_GetSoftwarePriority
 882                     	xdef	_ITC_SetSoftwarePriority
 883                     	xdef	_ITC_GetSoftIntStatus
 884                     	xdef	_ITC_GetCPUCC
 885                     	xdef	_ITC_DeInit
 904                     	end
