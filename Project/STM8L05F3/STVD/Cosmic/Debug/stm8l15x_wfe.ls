   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 95 void WFE_DeInit(void)
  33                     ; 96 {
  34                     .text:	section	.text,new
  35  0000               f_WFE_DeInit:
  39                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  41  0000 725f50a6      	clr	20646
  42                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  44  0004 725f50a7      	clr	20647
  45                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  47  0008 725f50a8      	clr	20648
  48                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  50  000c 725f50a9      	clr	20649
  51                     ; 101 }
  54  0010 87            	retf	
 375                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 375                     ; 142 {
 376                     .text:	section	.text,new
 377  0000               f_WFE_WakeUpSourceEventCmd:
 379  0000 89            	pushw	x
 380  0001 88            	push	a
 381       00000001      OFST:	set	1
 384                     ; 143   uint8_t register_index = 0;
 386  0002 0f01          	clr	(OFST+0,sp)
 387                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 389                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 391                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 393  0004 9e            	ld	a,xh
 394  0005 6b01          	ld	(OFST+0,sp),a
 395                     ; 151   if (NewState != DISABLE)
 397  0007 0d07          	tnz	(OFST+6,sp)
 398  0009 2730          	jreq	L302
 399                     ; 153     switch (register_index)
 402                     ; 171       default:
 402                     ; 172         break;
 403  000b 4a            	dec	a
 404  000c 270b          	jreq	L12
 405  000e 4a            	dec	a
 406  000f 270f          	jreq	L32
 407  0011 4a            	dec	a
 408  0012 2716          	jreq	L52
 409  0014 4a            	dec	a
 410  0015 271d          	jreq	L72
 411  0017 2039          	jra	L112
 412  0019               L12:
 413                     ; 155       case 1:
 413                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 415  0019 c650a6        	ld	a,20646
 416  001c 1a03          	or	a,(OFST+2,sp)
 417                     ; 157         break;
 419  001e 202f          	jpf	LC001
 420  0020               L32:
 421                     ; 159       case 2:
 421                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 423  0020 c650a7        	ld	a,20647
 424  0023 1a03          	or	a,(OFST+2,sp)
 425  0025 c750a7        	ld	20647,a
 426                     ; 161         break;
 428  0028 2028          	jra	L112
 429  002a               L52:
 430                     ; 163       case 3:
 430                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 432  002a c650a8        	ld	a,20648
 433  002d 1a03          	or	a,(OFST+2,sp)
 434  002f c750a8        	ld	20648,a
 435                     ; 165         break;
 437  0032 201e          	jra	L112
 438  0034               L72:
 439                     ; 167       case 4:
 439                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 441  0034 c650a9        	ld	a,20649
 442  0037 1a03          	or	a,(OFST+2,sp)
 443                     ; 169         break;
 445  0039 2036          	jpf	LC002
 446                     ; 171       default:
 446                     ; 172         break;
 449  003b               L302:
 450                     ; 177     switch (register_index)
 453                     ; 195       default:
 453                     ; 196         break;
 454  003b 4a            	dec	a
 455  003c 270b          	jreq	L33
 456  003e 4a            	dec	a
 457  003f 2714          	jreq	L53
 458  0041 4a            	dec	a
 459  0042 271c          	jreq	L73
 460  0044 4a            	dec	a
 461  0045 2724          	jreq	L14
 462  0047 2009          	jra	L112
 463  0049               L33:
 464                     ; 179       case 1:
 464                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 466  0049 7b03          	ld	a,(OFST+2,sp)
 467  004b 43            	cpl	a
 468  004c c450a6        	and	a,20646
 469  004f               LC001:
 470  004f c750a6        	ld	20646,a
 471                     ; 181         break;
 472  0052               L112:
 473                     ; 199 }
 476  0052 5b03          	addw	sp,#3
 477  0054 87            	retf	
 478  0055               L53:
 479                     ; 183       case 2:
 479                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 481  0055 7b03          	ld	a,(OFST+2,sp)
 482  0057 43            	cpl	a
 483  0058 c450a7        	and	a,20647
 484  005b c750a7        	ld	20647,a
 485                     ; 185         break;
 487  005e 20f2          	jra	L112
 488  0060               L73:
 489                     ; 187       case 3:
 489                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 491  0060 7b03          	ld	a,(OFST+2,sp)
 492  0062 43            	cpl	a
 493  0063 c450a8        	and	a,20648
 494  0066 c750a8        	ld	20648,a
 495                     ; 189         break;
 497  0069 20e7          	jra	L112
 498  006b               L14:
 499                     ; 191       case 4:
 499                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 501  006b 7b03          	ld	a,(OFST+2,sp)
 502  006d 43            	cpl	a
 503  006e c450a9        	and	a,20649
 504  0071               LC002:
 505  0071 c750a9        	ld	20649,a
 506                     ; 193         break;
 508  0074 20dc          	jra	L112
 509                     ; 195       default:
 509                     ; 196         break;
 556                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 556                     ; 238 {
 557                     .text:	section	.text,new
 558  0000               f_WFE_GetWakeUpSourceEventStatus:
 560  0000 89            	pushw	x
 561  0001 88            	push	a
 562       00000001      OFST:	set	1
 565                     ; 239   FunctionalState status = DISABLE;
 567  0002 0f01          	clr	(OFST+0,sp)
 568                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 570                     ; 243   switch (WFE_Source)
 573                     ; 326     default:
 573                     ; 327       break;
 574  0004 1d0101        	subw	x,#257
 575  0007 2604ac9d009d  	jreq	L712
 576  000d 5a            	decw	x
 577  000e 27f9          	jreq	L712
 578  0010 1d0002        	subw	x,#2
 579  0013 27f4          	jreq	L712
 580  0015 1d0004        	subw	x,#4
 581  0018 27ef          	jreq	L712
 582  001a 1d0008        	subw	x,#8
 583  001d 277e          	jreq	L712
 584  001f 1d0010        	subw	x,#16
 585  0022 2779          	jreq	L712
 586  0024 1d0020        	subw	x,#32
 587  0027 2774          	jreq	L712
 588  0029 1d0040        	subw	x,#64
 589  002c 276f          	jreq	L712
 590  002e 1d0081        	subw	x,#129
 591  0031 276f          	jreq	L122
 592  0033 5a            	decw	x
 593  0034 276c          	jreq	L122
 594  0036 1d0002        	subw	x,#2
 595  0039 2767          	jreq	L122
 596  003b 1d0004        	subw	x,#4
 597  003e 2762          	jreq	L122
 598  0040 1d0008        	subw	x,#8
 599  0043 275d          	jreq	L122
 600  0045 1d0010        	subw	x,#16
 601  0048 2758          	jreq	L122
 602  004a 1d0020        	subw	x,#32
 603  004d 2753          	jreq	L122
 604  004f 1d0040        	subw	x,#64
 605  0052 274e          	jreq	L122
 606  0054 1d0081        	subw	x,#129
 607  0057 274e          	jreq	L322
 608  0059 5a            	decw	x
 609  005a 274b          	jreq	L322
 610  005c 1d0002        	subw	x,#2
 611  005f 2746          	jreq	L322
 612  0061 1d0004        	subw	x,#4
 613  0064 2741          	jreq	L322
 614  0066 1d0008        	subw	x,#8
 615  0069 273c          	jreq	L322
 616  006b 1d0010        	subw	x,#16
 617  006e 2737          	jreq	L322
 618  0070 1d0020        	subw	x,#32
 619  0073 2732          	jreq	L322
 620  0075 1d0040        	subw	x,#64
 621  0078 272d          	jreq	L322
 622  007a 1d0081        	subw	x,#129
 623  007d 2735          	jreq	L522
 624  007f 5a            	decw	x
 625  0080 2732          	jreq	L522
 626  0082 1d0002        	subw	x,#2
 627  0085 272d          	jreq	L522
 628  0087 1d0004        	subw	x,#4
 629  008a 2728          	jreq	L522
 630  008c 1d0008        	subw	x,#8
 631  008f 2723          	jreq	L522
 632  0091 1d0010        	subw	x,#16
 633  0094 271e          	jreq	L522
 634  0096 1d0020        	subw	x,#32
 635  0099 2719          	jreq	L522
 636  009b 2020          	jra	L552
 637  009d               L712:
 638                     ; 245     case WFE_Source_TIM2_EV0:
 638                     ; 246     case WFE_Source_TIM2_EV1:
 638                     ; 247     case WFE_Source_TIM1_EV0:
 638                     ; 248     case WFE_Source_TIM1_EV1:
 638                     ; 249     case WFE_Source_EXTI_EV0:
 638                     ; 250     case WFE_Source_EXTI_EV1:
 638                     ; 251     case WFE_Source_EXTI_EV2:
 638                     ; 252     case WFE_Source_EXTI_EV3:
 638                     ; 253 
 638                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 640  009d c650a6        	ld	a,20646
 641                     ; 257         status = ENABLE;
 643  00a0 2008          	jpf	LC005
 644                     ; 262         status = DISABLE;
 645  00a2               L122:
 646                     ; 266     case WFE_Source_EXTI_EV4:
 646                     ; 267     case WFE_Source_EXTI_EV5:
 646                     ; 268     case WFE_Source_EXTI_EV6:
 646                     ; 269     case WFE_Source_EXTI_EV7:
 646                     ; 270     case WFE_Source_EXTI_EVB_G:
 646                     ; 271     case WFE_Source_EXTI_EVD_H:
 646                     ; 272     case WFE_Source_EXTI_EVE_F:
 646                     ; 273     case WFE_Source_ADC1_COMP_EV:
 646                     ; 274 
 646                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 648  00a2 c650a7        	ld	a,20647
 649                     ; 278         status = ENABLE;
 651  00a5 2003          	jpf	LC005
 652                     ; 283         status = DISABLE;
 653  00a7               L322:
 654                     ; 286     case WFE_Source_TIM3_EV0:
 654                     ; 287     case WFE_Source_TIM3_EV1:
 654                     ; 288     case WFE_Source_TIM4_EV:
 654                     ; 289     case WFE_Source_SPI1_EV:
 654                     ; 290     case WFE_Source_I2C1_EV:
 654                     ; 291     case WFE_Source_USART1_EV:
 654                     ; 292     case WFE_Source_DMA1CH01_EV:
 654                     ; 293     case WFE_Source_DMA1CH23_EV:
 654                     ; 294 
 654                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 656  00a7 c650a8        	ld	a,20648
 657  00aa               LC005:
 658  00aa 1503          	bcp	a,(OFST+2,sp)
 659  00ac 270d          	jreq	L372
 660                     ; 298         status = ENABLE;
 662  00ae               LC004:
 666  00ae a601          	ld	a,#1
 667  00b0 6b01          	ld	(OFST+0,sp),a
 669  00b2 2009          	jra	L552
 670                     ; 303         status = DISABLE;
 671  00b4               L522:
 672                     ; 307     case WFE_Source_TIM5_EV0:
 672                     ; 308     case WFE_Source_TIM5_EV1:
 672                     ; 309     case WFE_Source_AES_EV:
 672                     ; 310     case WFE_Source_SPI2_EV:
 672                     ; 311     case WFE_Source_USART2_EV:
 672                     ; 312     case WFE_Source_USART3_EV:
 672                     ; 313     case WFE_Source_RTC_CSS_EV:
 672                     ; 314 
 672                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 674  00b4 c650a9        	ld	a,20649
 675  00b7 1503          	bcp	a,(OFST+2,sp)
 676                     ; 318         status = ENABLE;
 678  00b9 26f3          	jrne	LC004
 679  00bb               L372:
 680                     ; 323         status = DISABLE;
 685  00bb 0f01          	clr	(OFST+0,sp)
 686                     ; 326     default:
 686                     ; 327       break;
 688  00bd               L552:
 689                     ; 329   return status;
 691  00bd 7b01          	ld	a,(OFST+0,sp)
 694  00bf 5b03          	addw	sp,#3
 695  00c1 87            	retf	
 707                     	xdef	f_WFE_GetWakeUpSourceEventStatus
 708                     	xdef	f_WFE_WakeUpSourceEventCmd
 709                     	xdef	f_WFE_DeInit
 728                     	end
