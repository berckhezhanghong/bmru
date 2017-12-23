   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 56 uint8_t ITC_GetCPUCC(void)
  33                     ; 57 {
  34                     .text:	section	.text,new
  35  0000               f_ITC_GetCPUCC:
  39                     ; 59   _asm("push cc");
  42  0000 8a            	push	cc
  44                     ; 60   _asm("pop a");
  47  0001 84            	pop	a
  49                     ; 61   return; /* Ignore compiler warning, the returned value is in A register */
  52  0002 87            	retf	
  74                     ; 87 void ITC_DeInit(void)
  74                     ; 88 {
  75                     .text:	section	.text,new
  76  0000               f_ITC_DeInit:
  80                     ; 89   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  82  0000 35ff7f70      	mov	32624,#255
  83                     ; 90   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  85  0004 35ff7f71      	mov	32625,#255
  86                     ; 91   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
  88  0008 35ff7f72      	mov	32626,#255
  89                     ; 92   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
  91  000c 35ff7f73      	mov	32627,#255
  92                     ; 93   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
  94  0010 35ff7f74      	mov	32628,#255
  95                     ; 94   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
  97  0014 35ff7f75      	mov	32629,#255
  98                     ; 95   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 100  0018 35ff7f76      	mov	32630,#255
 101                     ; 96   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 103  001c 35ff7f77      	mov	32631,#255
 104                     ; 97 }
 107  0020 87            	retf	
 131                     ; 104 uint8_t ITC_GetSoftIntStatus(void)
 131                     ; 105 {
 132                     .text:	section	.text,new
 133  0000               f_ITC_GetSoftIntStatus:
 137                     ; 106   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 139  0000 8d000000      	callf	f_ITC_GetCPUCC
 141  0004 a428          	and	a,#40
 144  0006 87            	retf	
 425                     ; 114 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 425                     ; 115 {
 426                     .text:	section	.text,new
 427  0000               f_ITC_GetSoftwarePriority:
 429  0000 88            	push	a
 430  0001 89            	pushw	x
 431       00000002      OFST:	set	2
 434                     ; 116   uint8_t Value = 0;
 436  0002 0f02          	clr	(OFST+0,sp)
 437                     ; 117   uint8_t Mask = 0;
 439                     ; 120   assert_param(IS_ITC_IRQ(IRQn));
 441                     ; 123   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 443  0004 7b03          	ld	a,(OFST+1,sp)
 444  0006 a403          	and	a,#3
 445  0008 48            	sll	a
 446  0009 5f            	clrw	x
 447  000a 97            	ld	xl,a
 448  000b a603          	ld	a,#3
 449  000d 5d            	tnzw	x
 450  000e 2704          	jreq	L61
 451  0010               L02:
 452  0010 48            	sll	a
 453  0011 5a            	decw	x
 454  0012 26fc          	jrne	L02
 455  0014               L61:
 456  0014 6b01          	ld	(OFST-1,sp),a
 457                     ; 125   switch (IRQn)
 459  0016 7b03          	ld	a,(OFST+1,sp)
 461                     ; 223     default:
 461                     ; 224       break;
 462  0018 4a            	dec	a
 463  0019 a11d          	cp	a,#29
 464  001b 246a          	jruge	L312
 465  001d 8d000000      	callf	d_jctab
 467  0021               L42:
 468  0021 003c          	dc.w	L14-L42
 469  0023 003c          	dc.w	L14-L42
 470  0025 003c          	dc.w	L14-L42
 471  0027 0041          	dc.w	L34-L42
 472  0029 0041          	dc.w	L34-L42
 473  002b 0041          	dc.w	L34-L42
 474  002d 0041          	dc.w	L34-L42
 475  002f 0046          	dc.w	L54-L42
 476  0031 0046          	dc.w	L54-L42
 477  0033 0046          	dc.w	L54-L42
 478  0035 0046          	dc.w	L54-L42
 479  0037 004b          	dc.w	L74-L42
 480  0039 004b          	dc.w	L74-L42
 481  003b 004b          	dc.w	L74-L42
 482  003d 004b          	dc.w	L74-L42
 483  003f 0066          	dc.w	L312-L42
 484  0041 0050          	dc.w	L15-L42
 485  0043 0050          	dc.w	L15-L42
 486  0045 0050          	dc.w	L15-L42
 487  0047 0055          	dc.w	L35-L42
 488  0049 0055          	dc.w	L35-L42
 489  004b 0055          	dc.w	L35-L42
 490  004d 0066          	dc.w	L312-L42
 491  004f 0066          	dc.w	L312-L42
 492  0051 005a          	dc.w	L55-L42
 493  0053 005a          	dc.w	L55-L42
 494  0055 005a          	dc.w	L55-L42
 495  0057 005f          	dc.w	L75-L42
 496  0059 005f          	dc.w	L75-L42
 497  005b 202a          	jra	L312
 498  005d               L14:
 499                     ; 127     case FLASH_IRQn:
 499                     ; 128     case DMA1_CHANNEL0_1_IRQn:
 499                     ; 129     case DMA1_CHANNEL2_3_IRQn:
 499                     ; 130       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 501  005d c67f70        	ld	a,32624
 502                     ; 131       break;
 504  0060 2021          	jpf	LC001
 505  0062               L34:
 506                     ; 133     case EXTIE_F_PVD_IRQn:
 506                     ; 134 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 506                     ; 135     case RTC_IRQn:
 506                     ; 136     case EXTIB_IRQn:
 506                     ; 137     case EXTID_IRQn:
 506                     ; 138 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 506                     ; 139     case RTC_CSSLSE_IRQn:
 506                     ; 140     case EXTIB_IRQn:
 506                     ; 141     case EXTID_IRQn:
 506                     ; 142 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 506                     ; 143     case RTC_CSSLSE_IRQn:
 506                     ; 144     case EXTIB_G_IRQn:
 506                     ; 145     case EXTID_H_IRQn:
 506                     ; 146 #endif  /* STM8L15X_MD */
 506                     ; 147       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 508  0062 c67f71        	ld	a,32625
 509                     ; 148       break;
 511  0065 201c          	jpf	LC001
 512  0067               L54:
 513                     ; 150     case EXTI0_IRQn:
 513                     ; 151     case EXTI1_IRQn:
 513                     ; 152     case EXTI2_IRQn:
 513                     ; 153     case EXTI3_IRQn:
 513                     ; 154       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 515  0067 c67f72        	ld	a,32626
 516                     ; 155       break;
 518  006a 2017          	jpf	LC001
 519  006c               L74:
 520                     ; 157     case EXTI4_IRQn:
 520                     ; 158     case EXTI5_IRQn:
 520                     ; 159     case EXTI6_IRQn:
 520                     ; 160     case EXTI7_IRQn:
 520                     ; 161       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 522  006c c67f73        	ld	a,32627
 523                     ; 162       break;
 525  006f 2012          	jpf	LC001
 526  0071               L15:
 527                     ; 165     case SWITCH_CSS_IRQn:
 527                     ; 166 #else
 527                     ; 167     case SWITCH_CSS_BREAK_DAC_IRQn:
 527                     ; 168 #endif /* STM8L15X_LD */		
 527                     ; 169     case ADC1_COMP_IRQn:
 527                     ; 170 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 527                     ; 171     case LCD_IRQn:
 527                     ; 172     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 527                     ; 173 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 527                     ; 174     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 527                     ; 175 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 527                     ; 176     case LCD_AES_IRQn:
 527                     ; 177     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 527                     ; 178 #endif  /* STM8L15X_MD */
 527                     ; 179       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 529  0071 c67f74        	ld	a,32628
 530                     ; 180       break;
 532  0074 200d          	jpf	LC001
 533  0076               L35:
 534                     ; 187     case TIM2_CC_IRQn:
 534                     ; 188     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 534                     ; 189     case TIM3_CC_IRQn:
 534                     ; 190 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 534                     ; 191     case TIM2_CC_USART2_RX_IRQn:
 534                     ; 192     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 534                     ; 193     case TIM3_CC_USART3_RX_IRQn:
 534                     ; 194 #endif  /* STM8L15X_MD */
 534                     ; 195       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 536  0076 c67f75        	ld	a,32629
 537                     ; 196       break;
 539  0079 2008          	jpf	LC001
 540  007b               L55:
 541                     ; 201     case TIM4_UPD_OVF_TRG_IRQn:
 541                     ; 202     case SPI1_IRQn:
 541                     ; 203 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 541                     ; 204  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 541                     ; 205     case USART1_TX_IRQn:
 541                     ; 206 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 541                     ; 207     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 541                     ; 208 #endif  /* STM8L15X_MD || STM8L15X_LD */
 541                     ; 209       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 543  007b c67f76        	ld	a,32630
 544                     ; 210       break;
 546  007e 2003          	jpf	LC001
 547  0080               L75:
 548                     ; 214     case USART1_RX_IRQn:
 548                     ; 215     case I2C1_IRQn:
 548                     ; 216 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 548                     ; 217     case USART1_RX_TIM5_CC_IRQn:
 548                     ; 218     case I2C1_SPI2_IRQn:
 548                     ; 219 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 548                     ; 220       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 550  0080 c67f77        	ld	a,32631
 551  0083               LC001:
 552  0083 1401          	and	a,(OFST-1,sp)
 553  0085 6b02          	ld	(OFST+0,sp),a
 554                     ; 221       break;
 556                     ; 223     default:
 556                     ; 224       break;
 558  0087               L312:
 559                     ; 227   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 561  0087 7b03          	ld	a,(OFST+1,sp)
 562  0089 a403          	and	a,#3
 563  008b 48            	sll	a
 564  008c 5f            	clrw	x
 565  008d 97            	ld	xl,a
 566  008e 7b02          	ld	a,(OFST+0,sp)
 567  0090 5d            	tnzw	x
 568  0091 2704          	jreq	L62
 569  0093               L03:
 570  0093 44            	srl	a
 571  0094 5a            	decw	x
 572  0095 26fc          	jrne	L03
 573  0097               L62:
 574                     ; 229   return((ITC_PriorityLevel_TypeDef)Value);
 578  0097 5b03          	addw	sp,#3
 579  0099 87            	retf	
 638                     ; 250 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 638                     ; 251 {
 639                     .text:	section	.text,new
 640  0000               f_ITC_SetSoftwarePriority:
 642  0000 89            	pushw	x
 643  0001 89            	pushw	x
 644       00000002      OFST:	set	2
 647                     ; 252   uint8_t Mask = 0;
 649                     ; 253   uint8_t NewPriority = 0;
 651                     ; 256   assert_param(IS_ITC_IRQ(IRQn));
 653                     ; 257   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 655                     ; 260   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 657                     ; 264   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 659  0002 7b03          	ld	a,(OFST+1,sp)
 660  0004 a403          	and	a,#3
 661  0006 48            	sll	a
 662  0007 5f            	clrw	x
 663  0008 97            	ld	xl,a
 664  0009 a603          	ld	a,#3
 665  000b 5d            	tnzw	x
 666  000c 2704          	jreq	L43
 667  000e               L63:
 668  000e 48            	sll	a
 669  000f 5a            	decw	x
 670  0010 26fc          	jrne	L63
 671  0012               L43:
 672  0012 43            	cpl	a
 673  0013 6b01          	ld	(OFST-1,sp),a
 674                     ; 266   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 676  0015 7b03          	ld	a,(OFST+1,sp)
 677  0017 a403          	and	a,#3
 678  0019 48            	sll	a
 679  001a 5f            	clrw	x
 680  001b 97            	ld	xl,a
 681  001c 7b04          	ld	a,(OFST+2,sp)
 682  001e 5d            	tnzw	x
 683  001f 2704          	jreq	L04
 684  0021               L24:
 685  0021 48            	sll	a
 686  0022 5a            	decw	x
 687  0023 26fc          	jrne	L24
 688  0025               L04:
 689  0025 6b02          	ld	(OFST+0,sp),a
 690                     ; 268   switch (IRQn)
 692  0027 7b03          	ld	a,(OFST+1,sp)
 694                     ; 372     default:
 694                     ; 373       break;
 695  0029 4a            	dec	a
 696  002a a11d          	cp	a,#29
 697  002c 2504ac020102  	jruge	L762
 698  0032 8d000000      	callf	d_jctab
 700  0036               L64:
 701  0036 003e          	dc.w	L512-L64
 702  0038 003e          	dc.w	L512-L64
 703  003a 003e          	dc.w	L512-L64
 704  003c 0050          	dc.w	L712-L64
 705  003e 0050          	dc.w	L712-L64
 706  0040 0050          	dc.w	L712-L64
 707  0042 0050          	dc.w	L712-L64
 708  0044 0062          	dc.w	L122-L64
 709  0046 0062          	dc.w	L122-L64
 710  0048 0062          	dc.w	L122-L64
 711  004a 0062          	dc.w	L122-L64
 712  004c 0074          	dc.w	L322-L64
 713  004e 0074          	dc.w	L322-L64
 714  0050 0074          	dc.w	L322-L64
 715  0052 0074          	dc.w	L322-L64
 716  0054 00cc          	dc.w	L762-L64
 717  0056 0086          	dc.w	L522-L64
 718  0058 0086          	dc.w	L522-L64
 719  005a 0086          	dc.w	L522-L64
 720  005c 0098          	dc.w	L722-L64
 721  005e 0098          	dc.w	L722-L64
 722  0060 0098          	dc.w	L722-L64
 723  0062 00cc          	dc.w	L762-L64
 724  0064 00cc          	dc.w	L762-L64
 725  0066 00aa          	dc.w	L132-L64
 726  0068 00aa          	dc.w	L132-L64
 727  006a 00aa          	dc.w	L132-L64
 728  006c 00bc          	dc.w	L332-L64
 729  006e 00bc          	dc.w	L332-L64
 730  0070 ac020102      	jra	L762
 731  0074               L512:
 732                     ; 270     case FLASH_IRQn:
 732                     ; 271     case DMA1_CHANNEL0_1_IRQn:
 732                     ; 272     case DMA1_CHANNEL2_3_IRQn:
 732                     ; 273       ITC->ISPR1 &= Mask;
 734  0074 c67f70        	ld	a,32624
 735  0077 1401          	and	a,(OFST-1,sp)
 736  0079 c77f70        	ld	32624,a
 737                     ; 274       ITC->ISPR1 |= NewPriority;
 739  007c c67f70        	ld	a,32624
 740  007f 1a02          	or	a,(OFST+0,sp)
 741  0081 c77f70        	ld	32624,a
 742                     ; 275       break;
 744  0084 207c          	jra	L762
 745  0086               L712:
 746                     ; 277     case EXTIE_F_PVD_IRQn:
 746                     ; 278 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 746                     ; 279     case RTC_IRQn:
 746                     ; 280     case EXTIB_IRQn:
 746                     ; 281     case EXTID_IRQn:
 746                     ; 282 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 746                     ; 283     case RTC_CSSLSE_IRQn:
 746                     ; 284     case EXTIB_IRQn:
 746                     ; 285     case EXTID_IRQn:
 746                     ; 286 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 746                     ; 287     case RTC_CSSLSE_IRQn:
 746                     ; 288     case EXTIB_G_IRQn:
 746                     ; 289     case EXTID_H_IRQn:
 746                     ; 290 #endif  /* STM8L15X_MD */
 746                     ; 291       ITC->ISPR2 &= Mask;
 748  0086 c67f71        	ld	a,32625
 749  0089 1401          	and	a,(OFST-1,sp)
 750  008b c77f71        	ld	32625,a
 751                     ; 292       ITC->ISPR2 |= NewPriority;
 753  008e c67f71        	ld	a,32625
 754  0091 1a02          	or	a,(OFST+0,sp)
 755  0093 c77f71        	ld	32625,a
 756                     ; 293       break;
 758  0096 206a          	jra	L762
 759  0098               L122:
 760                     ; 295     case EXTI0_IRQn:
 760                     ; 296     case EXTI1_IRQn:
 760                     ; 297     case EXTI2_IRQn:
 760                     ; 298     case EXTI3_IRQn:
 760                     ; 299       ITC->ISPR3 &= Mask;
 762  0098 c67f72        	ld	a,32626
 763  009b 1401          	and	a,(OFST-1,sp)
 764  009d c77f72        	ld	32626,a
 765                     ; 300       ITC->ISPR3 |= NewPriority;
 767  00a0 c67f72        	ld	a,32626
 768  00a3 1a02          	or	a,(OFST+0,sp)
 769  00a5 c77f72        	ld	32626,a
 770                     ; 301       break;
 772  00a8 2058          	jra	L762
 773  00aa               L322:
 774                     ; 303     case EXTI4_IRQn:
 774                     ; 304     case EXTI5_IRQn:
 774                     ; 305     case EXTI6_IRQn:
 774                     ; 306     case EXTI7_IRQn:
 774                     ; 307       ITC->ISPR4 &= Mask;
 776  00aa c67f73        	ld	a,32627
 777  00ad 1401          	and	a,(OFST-1,sp)
 778  00af c77f73        	ld	32627,a
 779                     ; 308       ITC->ISPR4 |= NewPriority;
 781  00b2 c67f73        	ld	a,32627
 782  00b5 1a02          	or	a,(OFST+0,sp)
 783  00b7 c77f73        	ld	32627,a
 784                     ; 309       break;
 786  00ba 2046          	jra	L762
 787  00bc               L522:
 788                     ; 313     case SWITCH_CSS_IRQn:
 788                     ; 314 #endif /*	STM8L15X_LD	*/
 788                     ; 315     case ADC1_COMP_IRQn:
 788                     ; 316 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 788                     ; 317     case LCD_IRQn:
 788                     ; 318     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 788                     ; 319 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 788                     ; 320     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 788                     ; 321 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 788                     ; 322     case LCD_AES_IRQn:
 788                     ; 323     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 788                     ; 324 #endif  /* STM8L15X_MD */
 788                     ; 325       ITC->ISPR5 &= Mask;
 790  00bc c67f74        	ld	a,32628
 791  00bf 1401          	and	a,(OFST-1,sp)
 792  00c1 c77f74        	ld	32628,a
 793                     ; 326       ITC->ISPR5 |= NewPriority;
 795  00c4 c67f74        	ld	a,32628
 796  00c7 1a02          	or	a,(OFST+0,sp)
 797  00c9 c77f74        	ld	32628,a
 798                     ; 327       break;
 800  00cc 2034          	jra	L762
 801  00ce               L722:
 802                     ; 333     case TIM2_CC_IRQn:
 802                     ; 334     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 802                     ; 335     case TIM3_CC_IRQn:
 802                     ; 336 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 802                     ; 337     case TIM2_CC_USART2_RX_IRQn:
 802                     ; 338     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 802                     ; 339     case TIM3_CC_USART3_RX_IRQn:
 802                     ; 340 #endif  /* STM8L15X_MD */
 802                     ; 341       ITC->ISPR6 &= Mask;
 804  00ce c67f75        	ld	a,32629
 805  00d1 1401          	and	a,(OFST-1,sp)
 806  00d3 c77f75        	ld	32629,a
 807                     ; 342       ITC->ISPR6 |= NewPriority;
 809  00d6 c67f75        	ld	a,32629
 810  00d9 1a02          	or	a,(OFST+0,sp)
 811  00db c77f75        	ld	32629,a
 812                     ; 343       break;
 814  00de 2022          	jra	L762
 815  00e0               L132:
 816                     ; 348     case TIM4_UPD_OVF_TRG_IRQn:
 816                     ; 349     case SPI1_IRQn:
 816                     ; 350 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 816                     ; 351  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 816                     ; 352     case USART1_TX_IRQn:
 816                     ; 353 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 816                     ; 354     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 816                     ; 355 #endif  /* STM8L15X_MD */
 816                     ; 356       ITC->ISPR7 &= Mask;
 818  00e0 c67f76        	ld	a,32630
 819  00e3 1401          	and	a,(OFST-1,sp)
 820  00e5 c77f76        	ld	32630,a
 821                     ; 357       ITC->ISPR7 |= NewPriority;
 823  00e8 c67f76        	ld	a,32630
 824  00eb 1a02          	or	a,(OFST+0,sp)
 825  00ed c77f76        	ld	32630,a
 826                     ; 358       break;
 828  00f0 2010          	jra	L762
 829  00f2               L332:
 830                     ; 362     case USART1_RX_IRQn:
 830                     ; 363     case I2C1_IRQn:
 830                     ; 364 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 830                     ; 365     case USART1_RX_TIM5_CC_IRQn:
 830                     ; 366     case I2C1_SPI2_IRQn:
 830                     ; 367 #endif  /* STM8L15X_MD */
 830                     ; 368       ITC->ISPR8 &= Mask;
 832  00f2 c67f77        	ld	a,32631
 833  00f5 1401          	and	a,(OFST-1,sp)
 834  00f7 c77f77        	ld	32631,a
 835                     ; 369       ITC->ISPR8 |= NewPriority;
 837  00fa c67f77        	ld	a,32631
 838  00fd 1a02          	or	a,(OFST+0,sp)
 839  00ff c77f77        	ld	32631,a
 840                     ; 370       break;
 842                     ; 372     default:
 842                     ; 373       break;
 844  0102               L762:
 845                     ; 375 }
 848  0102 5b04          	addw	sp,#4
 849  0104 87            	retf	
 861                     	xdef	f_ITC_GetSoftwarePriority
 862                     	xdef	f_ITC_SetSoftwarePriority
 863                     	xdef	f_ITC_GetSoftIntStatus
 864                     	xdef	f_ITC_GetCPUCC
 865                     	xdef	f_ITC_DeInit
 866                     	xref.b	c_x
 885                     	xref	d_jctab
 886                     	end
