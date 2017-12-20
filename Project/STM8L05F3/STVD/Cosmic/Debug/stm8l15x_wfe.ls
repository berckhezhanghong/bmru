   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 95 void WFE_DeInit(void)
  33                     ; 96 {
  35                     .text:	section	.text,new
  36  0000               _WFE_DeInit:
  40                     ; 97   WFE->CR1 = WFE_CRX_RESET_VALUE;
  42  0000 725f50a6      	clr	20646
  43                     ; 98   WFE->CR2 = WFE_CRX_RESET_VALUE;
  45  0004 725f50a7      	clr	20647
  46                     ; 99   WFE->CR3 = WFE_CRX_RESET_VALUE;
  48  0008 725f50a8      	clr	20648
  49                     ; 100   WFE->CR4 = WFE_CRX_RESET_VALUE;
  51  000c 725f50a9      	clr	20649
  52                     ; 101 }
  55  0010 81            	ret	
 379                     ; 141 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 379                     ; 142 {
 380                     .text:	section	.text,new
 381  0000               _WFE_WakeUpSourceEventCmd:
 383  0000 89            	pushw	x
 384  0001 88            	push	a
 385       00000001      OFST:	set	1
 388                     ; 143   uint8_t register_index = 0;
 390  0002 0f01          	clr	(OFST+0,sp)
 391                     ; 145   assert_param(IS_WFE_SOURCE(WFE_Source));
 393                     ; 146   assert_param(IS_FUNCTIONAL_STATE(NewState));
 395                     ; 149   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 397  0004 9e            	ld	a,xh
 398  0005 6b01          	ld	(OFST+0,sp),a
 399                     ; 151   if (NewState != DISABLE)
 401  0007 0d06          	tnz	(OFST+5,sp)
 402  0009 2730          	jreq	L502
 403                     ; 153     switch (register_index)
 406                     ; 171       default:
 406                     ; 172         break;
 407  000b 4a            	dec	a
 408  000c 270b          	jreq	L12
 409  000e 4a            	dec	a
 410  000f 270f          	jreq	L32
 411  0011 4a            	dec	a
 412  0012 2716          	jreq	L52
 413  0014 4a            	dec	a
 414  0015 271d          	jreq	L72
 415  0017 2039          	jra	L312
 416  0019               L12:
 417                     ; 155       case 1:
 417                     ; 156         WFE->CR1 |= (uint8_t)WFE_Source;
 419  0019 c650a6        	ld	a,20646
 420  001c 1a03          	or	a,(OFST+2,sp)
 421                     ; 157         break;
 423  001e 202f          	jp	LC001
 424  0020               L32:
 425                     ; 159       case 2:
 425                     ; 160         WFE->CR2 |= (uint8_t)WFE_Source;
 427  0020 c650a7        	ld	a,20647
 428  0023 1a03          	or	a,(OFST+2,sp)
 429  0025 c750a7        	ld	20647,a
 430                     ; 161         break;
 432  0028 2028          	jra	L312
 433  002a               L52:
 434                     ; 163       case 3:
 434                     ; 164         WFE->CR3 |= (uint8_t)WFE_Source;
 436  002a c650a8        	ld	a,20648
 437  002d 1a03          	or	a,(OFST+2,sp)
 438  002f c750a8        	ld	20648,a
 439                     ; 165         break;
 441  0032 201e          	jra	L312
 442  0034               L72:
 443                     ; 167       case 4:
 443                     ; 168         WFE->CR4 |= (uint8_t)WFE_Source;
 445  0034 c650a9        	ld	a,20649
 446  0037 1a03          	or	a,(OFST+2,sp)
 447                     ; 169         break;
 449  0039 2036          	jp	LC002
 450                     ; 171       default:
 450                     ; 172         break;
 453  003b               L502:
 454                     ; 177     switch (register_index)
 457                     ; 195       default:
 457                     ; 196         break;
 458  003b 4a            	dec	a
 459  003c 270b          	jreq	L33
 460  003e 4a            	dec	a
 461  003f 2714          	jreq	L53
 462  0041 4a            	dec	a
 463  0042 271c          	jreq	L73
 464  0044 4a            	dec	a
 465  0045 2724          	jreq	L14
 466  0047 2009          	jra	L312
 467  0049               L33:
 468                     ; 179       case 1:
 468                     ; 180         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 470  0049 7b03          	ld	a,(OFST+2,sp)
 471  004b 43            	cpl	a
 472  004c c450a6        	and	a,20646
 473  004f               LC001:
 474  004f c750a6        	ld	20646,a
 475                     ; 181         break;
 476  0052               L312:
 477                     ; 199 }
 480  0052 5b03          	addw	sp,#3
 481  0054 81            	ret	
 482  0055               L53:
 483                     ; 183       case 2:
 483                     ; 184         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 485  0055 7b03          	ld	a,(OFST+2,sp)
 486  0057 43            	cpl	a
 487  0058 c450a7        	and	a,20647
 488  005b c750a7        	ld	20647,a
 489                     ; 185         break;
 491  005e 20f2          	jra	L312
 492  0060               L73:
 493                     ; 187       case 3:
 493                     ; 188         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 495  0060 7b03          	ld	a,(OFST+2,sp)
 496  0062 43            	cpl	a
 497  0063 c450a8        	and	a,20648
 498  0066 c750a8        	ld	20648,a
 499                     ; 189         break;
 501  0069 20e7          	jra	L312
 502  006b               L14:
 503                     ; 191       case 4:
 503                     ; 192         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 505  006b 7b03          	ld	a,(OFST+2,sp)
 506  006d 43            	cpl	a
 507  006e c450a9        	and	a,20649
 508  0071               LC002:
 509  0071 c750a9        	ld	20649,a
 510                     ; 193         break;
 512  0074 20dc          	jra	L312
 513                     ; 195       default:
 513                     ; 196         break;
 561                     ; 237 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 561                     ; 238 {
 562                     .text:	section	.text,new
 563  0000               _WFE_GetWakeUpSourceEventStatus:
 565  0000 89            	pushw	x
 566  0001 88            	push	a
 567       00000001      OFST:	set	1
 570                     ; 239   FunctionalState status = DISABLE;
 572  0002 0f01          	clr	(OFST+0,sp)
 573                     ; 241   assert_param(IS_WFE_SOURCE(WFE_Source));
 575                     ; 243   switch (WFE_Source)
 578                     ; 326     default:
 578                     ; 327       break;
 579  0004 1d0101        	subw	x,#257
 580  0007 2603cc009c    	jreq	L122
 581  000c 5a            	decw	x
 582  000d 27fa          	jreq	L122
 583  000f 1d0002        	subw	x,#2
 584  0012 27f5          	jreq	L122
 585  0014 1d0004        	subw	x,#4
 586  0017 27f0          	jreq	L122
 587  0019 1d0008        	subw	x,#8
 588  001c 277e          	jreq	L122
 589  001e 1d0010        	subw	x,#16
 590  0021 2779          	jreq	L122
 591  0023 1d0020        	subw	x,#32
 592  0026 2774          	jreq	L122
 593  0028 1d0040        	subw	x,#64
 594  002b 276f          	jreq	L122
 595  002d 1d0081        	subw	x,#129
 596  0030 276f          	jreq	L322
 597  0032 5a            	decw	x
 598  0033 276c          	jreq	L322
 599  0035 1d0002        	subw	x,#2
 600  0038 2767          	jreq	L322
 601  003a 1d0004        	subw	x,#4
 602  003d 2762          	jreq	L322
 603  003f 1d0008        	subw	x,#8
 604  0042 275d          	jreq	L322
 605  0044 1d0010        	subw	x,#16
 606  0047 2758          	jreq	L322
 607  0049 1d0020        	subw	x,#32
 608  004c 2753          	jreq	L322
 609  004e 1d0040        	subw	x,#64
 610  0051 274e          	jreq	L322
 611  0053 1d0081        	subw	x,#129
 612  0056 274e          	jreq	L522
 613  0058 5a            	decw	x
 614  0059 274b          	jreq	L522
 615  005b 1d0002        	subw	x,#2
 616  005e 2746          	jreq	L522
 617  0060 1d0004        	subw	x,#4
 618  0063 2741          	jreq	L522
 619  0065 1d0008        	subw	x,#8
 620  0068 273c          	jreq	L522
 621  006a 1d0010        	subw	x,#16
 622  006d 2737          	jreq	L522
 623  006f 1d0020        	subw	x,#32
 624  0072 2732          	jreq	L522
 625  0074 1d0040        	subw	x,#64
 626  0077 272d          	jreq	L522
 627  0079 1d0081        	subw	x,#129
 628  007c 2735          	jreq	L722
 629  007e 5a            	decw	x
 630  007f 2732          	jreq	L722
 631  0081 1d0002        	subw	x,#2
 632  0084 272d          	jreq	L722
 633  0086 1d0004        	subw	x,#4
 634  0089 2728          	jreq	L722
 635  008b 1d0008        	subw	x,#8
 636  008e 2723          	jreq	L722
 637  0090 1d0010        	subw	x,#16
 638  0093 271e          	jreq	L722
 639  0095 1d0020        	subw	x,#32
 640  0098 2719          	jreq	L722
 641  009a 2020          	jra	L752
 642  009c               L122:
 643                     ; 245     case WFE_Source_TIM2_EV0:
 643                     ; 246     case WFE_Source_TIM2_EV1:
 643                     ; 247     case WFE_Source_TIM1_EV0:
 643                     ; 248     case WFE_Source_TIM1_EV1:
 643                     ; 249     case WFE_Source_EXTI_EV0:
 643                     ; 250     case WFE_Source_EXTI_EV1:
 643                     ; 251     case WFE_Source_EXTI_EV2:
 643                     ; 252     case WFE_Source_EXTI_EV3:
 643                     ; 253 
 643                     ; 254       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 645  009c c650a6        	ld	a,20646
 646                     ; 257         status = ENABLE;
 648  009f 2008          	jp	LC005
 649                     ; 262         status = DISABLE;
 650  00a1               L322:
 651                     ; 266     case WFE_Source_EXTI_EV4:
 651                     ; 267     case WFE_Source_EXTI_EV5:
 651                     ; 268     case WFE_Source_EXTI_EV6:
 651                     ; 269     case WFE_Source_EXTI_EV7:
 651                     ; 270     case WFE_Source_EXTI_EVB_G:
 651                     ; 271     case WFE_Source_EXTI_EVD_H:
 651                     ; 272     case WFE_Source_EXTI_EVE_F:
 651                     ; 273     case WFE_Source_ADC1_COMP_EV:
 651                     ; 274 
 651                     ; 275       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 653  00a1 c650a7        	ld	a,20647
 654                     ; 278         status = ENABLE;
 656  00a4 2003          	jp	LC005
 657                     ; 283         status = DISABLE;
 658  00a6               L522:
 659                     ; 286     case WFE_Source_TIM3_EV0:
 659                     ; 287     case WFE_Source_TIM3_EV1:
 659                     ; 288     case WFE_Source_TIM4_EV:
 659                     ; 289     case WFE_Source_SPI1_EV:
 659                     ; 290     case WFE_Source_I2C1_EV:
 659                     ; 291     case WFE_Source_USART1_EV:
 659                     ; 292     case WFE_Source_DMA1CH01_EV:
 659                     ; 293     case WFE_Source_DMA1CH23_EV:
 659                     ; 294 
 659                     ; 295       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 661  00a6 c650a8        	ld	a,20648
 662  00a9               LC005:
 663  00a9 1503          	bcp	a,(OFST+2,sp)
 664  00ab 270d          	jreq	L572
 665                     ; 298         status = ENABLE;
 667  00ad               LC004:
 671  00ad a601          	ld	a,#1
 672  00af 6b01          	ld	(OFST+0,sp),a
 674  00b1 2009          	jra	L752
 675                     ; 303         status = DISABLE;
 676  00b3               L722:
 677                     ; 307     case WFE_Source_TIM5_EV0:
 677                     ; 308     case WFE_Source_TIM5_EV1:
 677                     ; 309     case WFE_Source_AES_EV:
 677                     ; 310     case WFE_Source_SPI2_EV:
 677                     ; 311     case WFE_Source_USART2_EV:
 677                     ; 312     case WFE_Source_USART3_EV:
 677                     ; 313     case WFE_Source_RTC_CSS_EV:
 677                     ; 314 
 677                     ; 315       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 679  00b3 c650a9        	ld	a,20649
 680  00b6 1503          	bcp	a,(OFST+2,sp)
 681                     ; 318         status = ENABLE;
 683  00b8 26f3          	jrne	LC004
 684  00ba               L572:
 685                     ; 323         status = DISABLE;
 690  00ba 0f01          	clr	(OFST+0,sp)
 691                     ; 326     default:
 691                     ; 327       break;
 693  00bc               L752:
 694                     ; 329   return status;
 696  00bc 7b01          	ld	a,(OFST+0,sp)
 699  00be 5b03          	addw	sp,#3
 700  00c0 81            	ret	
 713                     	xdef	_WFE_GetWakeUpSourceEventStatus
 714                     	xdef	_WFE_WakeUpSourceEventCmd
 715                     	xdef	_WFE_DeInit
 734                     	end
