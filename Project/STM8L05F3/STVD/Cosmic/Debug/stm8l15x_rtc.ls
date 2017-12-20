   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  86                     ; 232 ErrorStatus RTC_DeInit(void)
  86                     ; 233 {
  88                     .text:	section	.text,new
  89  0000               _RTC_DeInit:
  91  0000 5205          	subw	sp,#5
  92       00000005      OFST:	set	5
  95                     ; 234   ErrorStatus status = ERROR;
  97                     ; 235   uint16_t wutwfcount = 0;
  99  0002 5f            	clrw	x
 100  0003 1f02          	ldw	(OFST-3,sp),x
 101                     ; 236   uint16_t recalpfcount = 0;
 103  0005 1f04          	ldw	(OFST-1,sp),x
 104                     ; 239   RTC->WPR = 0xCA;
 106  0007 35ca5159      	mov	20825,#202
 107                     ; 240   RTC->WPR = 0x53;
 109  000b 35535159      	mov	20825,#83
 110                     ; 243   if (RTC_EnterInitMode() == ERROR)
 112  000f cd0000        	call	_RTC_EnterInitMode
 114  0012 4d            	tnz	a
 115  0013 260b          	jrne	L35
 116                     ; 245     status = ERROR;
 118  0015               LC002:
 120  0015 6b01          	ld	(OFST-4,sp),a
 121                     ; 247     RTC->WPR = 0xFF; 
 124  0017               L55:
 127  0017 35ff5159      	mov	20825,#255
 128                     ; 343   return (ErrorStatus)status;
 130  001b 7b01          	ld	a,(OFST-4,sp)
 133  001d 5b05          	addw	sp,#5
 134  001f 81            	ret	
 135  0020               L35:
 136                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 138  0020 725f5140      	clr	20800
 139                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 141  0024 725f5141      	clr	20801
 142                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 144  0028 725f5142      	clr	20802
 145                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 147  002c 35015144      	mov	20804,#1
 148                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 150  0030 35215145      	mov	20805,#33
 151                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 153  0034 725f5146      	clr	20806
 154                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 156  0038 725f5150      	clr	20816
 157                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 159  003c 35ff5151      	mov	20817,#255
 160                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 162  0040 357f5152      	mov	20818,#127
 163                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 165  0044 725f516c      	clr	20844
 166                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 168  0048 725f516d      	clr	20845
 169                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 171  004c 725f5148      	clr	20808
 172                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 174  0050 725f5149      	clr	20809
 175                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 177  0054 725f514a      	clr	20810
 179  0058 2007          	jra	L36
 180  005a               L75:
 181                     ; 278       wutwfcount++;
 183  005a 5c            	incw	x
 184  005b 1f02          	ldw	(OFST-3,sp),x
 185                     ; 279       RTC->ISR1 = 0;
 187  005d 725f514c      	clr	20812
 188  0061               L36:
 189                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 191  0061 7204514c07    	btjt	20812,#2,L76
 193  0066 1e02          	ldw	x,(OFST-3,sp)
 194  0068 a3ffff        	cpw	x,#65535
 195  006b 26ed          	jrne	L75
 196  006d               L76:
 197                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 199  006d 7204514c02    	btjt	20812,#2,L17
 200                     ; 284       status = ERROR;
 201                     ; 286       RTC->WPR = 0xFF; 
 203  0072 2061          	jp	L701
 204  0074               L17:
 205                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 207  0074 725f5148      	clr	20808
 208                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 210  0078 35ff5154      	mov	20820,#255
 211                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 213  007c 35ff5155      	mov	20821,#255
 214                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 216  0080 725f515c      	clr	20828
 217                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 219  0084 725f515d      	clr	20829
 220                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 222  0088 725f515e      	clr	20830
 223                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 225  008c 725f515f      	clr	20831
 226                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 228  0090 725f5164      	clr	20836
 229                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 231  0094 725f5165      	clr	20837
 232                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 234  0098 725f5166      	clr	20838
 235                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 237  009c 725f514c      	clr	20812
 238                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 240  00a0 725f514d      	clr	20813
 241                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 243  00a4 7203514c11    	btjf	20812,#1,L57
 245  00a9 2003          	jra	L101
 246  00ab               L77:
 247                     ; 315           recalpfcount++;
 249  00ab 5c            	incw	x
 250  00ac 1f04          	ldw	(OFST-1,sp),x
 251  00ae               L101:
 252                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 254  00ae 7203514c07    	btjf	20812,#1,L57
 256  00b3 1e04          	ldw	x,(OFST-1,sp)
 257  00b5 a3ffff        	cpw	x,#65535
 258  00b8 26f1          	jrne	L77
 259  00ba               L57:
 260                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 262  00ba 7202514c16    	btjt	20812,#1,L701
 263                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 265  00bf 725f516a      	clr	20842
 266                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 268  00c3 725f516b      	clr	20843
 269                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 271  00c7 cd0000        	call	_RTC_WaitForSynchro
 273  00ca 4d            	tnz	a
 274                     ; 325           status = ERROR;
 276  00cb 2603cc0015    	jreq	LC002
 277                     ; 329           status = SUCCESS;
 279  00d0 a601          	ld	a,#1
 280  00d2 cc0015        	jp	LC002
 281  00d5               L701:
 282                     ; 334         status = ERROR;
 285  00d5 0f01          	clr	(OFST-4,sp)
 286                     ; 338       RTC->WPR = 0xFF; 
 287  00d7 cc0017        	jra	L55
 387                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 387                     ; 360 {
 388                     .text:	section	.text,new
 389  0000               _RTC_Init:
 391  0000 89            	pushw	x
 392  0001 88            	push	a
 393       00000001      OFST:	set	1
 396                     ; 361   ErrorStatus status = ERROR;
 398  0002 0f01          	clr	(OFST+0,sp)
 399                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 401                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 403                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 405                     ; 369   RTC->WPR = 0xCA;
 407  0004 35ca5159      	mov	20825,#202
 408                     ; 370   RTC->WPR = 0x53;
 410  0008 35535159      	mov	20825,#83
 411                     ; 373   if (RTC_EnterInitMode() == ERROR)
 413  000c cd0000        	call	_RTC_EnterInitMode
 415  000f 4d            	tnz	a
 416                     ; 375     status = ERROR;
 419  0010 2727          	jreq	L171
 420                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 422  0012 721d5148      	bres	20808,#6
 423                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 425  0016 1e02          	ldw	x,(OFST+1,sp)
 426  0018 c65148        	ld	a,20808
 427  001b fa            	or	a,(x)
 428  001c c75148        	ld	20808,a
 429                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 431  001f ee02          	ldw	x,(2,x)
 432  0021 4f            	clr	a
 433  0022 01            	rrwa	x,a
 434  0023 9f            	ld	a,xl
 435  0024 c75150        	ld	20816,a
 436                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 438  0027 1e02          	ldw	x,(OFST+1,sp)
 439  0029 e603          	ld	a,(3,x)
 440  002b c75151        	ld	20817,a
 441                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 443  002e e601          	ld	a,(1,x)
 444  0030 c75152        	ld	20818,a
 445                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 447  0033 721f514c      	bres	20812,#7
 448                     ; 393     status = SUCCESS;
 450  0037 a601          	ld	a,#1
 451  0039               L171:
 452                     ; 397   RTC->WPR = 0xFF; 
 454  0039 35ff5159      	mov	20825,#255
 455                     ; 400   return (ErrorStatus)(status);
 459  003d 5b03          	addw	sp,#3
 460  003f 81            	ret	
 497                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 497                     ; 411 {
 498                     .text:	section	.text,new
 499  0000               _RTC_StructInit:
 503                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 505  0000 7f            	clr	(x)
 506                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 508  0001 a67f          	ld	a,#127
 509  0003 e701          	ld	(1,x),a
 510                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 512  0005 90ae00ff      	ldw	y,#255
 513  0009 ef02          	ldw	(2,x),y
 514                     ; 420 }
 517  000b 81            	ret	
 573                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 573                     ; 431 {
 574                     .text:	section	.text,new
 575  0000               _RTC_WriteProtectionCmd:
 579                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 581                     ; 435   if (NewState != DISABLE)
 583  0000 4d            	tnz	a
 584  0001 2705          	jreq	L142
 585                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 587  0003 35ff5159      	mov	20825,#255
 590  0007 81            	ret	
 591  0008               L142:
 592                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 594  0008 35ca5159      	mov	20825,#202
 595                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 597  000c 35535159      	mov	20825,#83
 598                     ; 446 }
 601  0010 81            	ret	
 646                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 646                     ; 459 {
 647                     .text:	section	.text,new
 648  0000               _RTC_EnterInitMode:
 650  0000 5203          	subw	sp,#3
 651       00000003      OFST:	set	3
 654                     ; 460   ErrorStatus status = ERROR;
 656                     ; 461   uint16_t initfcount = 0;
 658  0002 5f            	clrw	x
 659  0003 1f02          	ldw	(OFST-1,sp),x
 660                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 662  0005 720c514c13    	btjt	20812,#6,L762
 663                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 665  000a 3580514c      	mov	20812,#128
 667  000e 2003          	jra	L572
 668  0010               L172:
 669                     ; 472       initfcount++;
 671  0010 5c            	incw	x
 672  0011 1f02          	ldw	(OFST-1,sp),x
 673  0013               L572:
 674                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 676  0013 720c514c05    	btjt	20812,#6,L762
 678  0018 a3ffff        	cpw	x,#65535
 679  001b 26f3          	jrne	L172
 680  001d               L762:
 681                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 683  001d 720c514c03    	btjt	20812,#6,L303
 684                     ; 478     status = ERROR;
 686  0022 4f            	clr	a
 688  0023 2002          	jra	L503
 689  0025               L303:
 690                     ; 482     status = SUCCESS;
 692  0025 a601          	ld	a,#1
 693  0027               L503:
 694                     ; 485   return (ErrorStatus)status;
 698  0027 5b03          	addw	sp,#3
 699  0029 81            	ret	
 722                     ; 498 void RTC_ExitInitMode(void)
 722                     ; 499 {
 723                     .text:	section	.text,new
 724  0000               _RTC_ExitInitMode:
 728                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 730  0000 721f514c      	bres	20812,#7
 731                     ; 502 }
 734  0004 81            	ret	
 779                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 779                     ; 528 {
 780                     .text:	section	.text,new
 781  0000               _RTC_WaitForSynchro:
 783  0000 5203          	subw	sp,#3
 784       00000003      OFST:	set	3
 787                     ; 529   uint16_t rsfcount = 0;
 789  0002 5f            	clrw	x
 790  0003 1f02          	ldw	(OFST-1,sp),x
 791                     ; 530   ErrorStatus status = ERROR;
 793  0005 7b01          	ld	a,(OFST-2,sp)
 794  0007 97            	ld	xl,a
 795                     ; 533   RTC->WPR = 0xCA;
 797  0008 35ca5159      	mov	20825,#202
 798                     ; 534   RTC->WPR = 0x53;
 800  000c 35535159      	mov	20825,#83
 801                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 803  0010 c6514c        	ld	a,20812
 804  0013 a45f          	and	a,#95
 805  0015 c7514c        	ld	20812,a
 807  0018 2003          	jra	L343
 808  001a               L143:
 809                     ; 542     rsfcount++;
 811  001a 5c            	incw	x
 812  001b 1f02          	ldw	(OFST-1,sp),x
 813  001d               L343:
 814                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 816  001d 720a514c07    	btjt	20812,#5,L743
 818  0022 1e02          	ldw	x,(OFST-1,sp)
 819  0024 a3ffff        	cpw	x,#65535
 820  0027 26f1          	jrne	L143
 821  0029               L743:
 822                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 824  0029 720b514c06    	btjf	20812,#5,L153
 825                     ; 548     status = SUCCESS;
 827  002e a601          	ld	a,#1
 828  0030 6b01          	ld	(OFST-2,sp),a
 830  0032 2002          	jra	L353
 831  0034               L153:
 832                     ; 552     status = ERROR;
 834  0034 0f01          	clr	(OFST-2,sp)
 835  0036               L353:
 836                     ; 556   RTC->WPR = 0xFF; 
 838  0036 35ff5159      	mov	20825,#255
 839                     ; 558   return (ErrorStatus)status;
 841  003a 7b01          	ld	a,(OFST-2,sp)
 844  003c 5b03          	addw	sp,#3
 845  003e 81            	ret	
 880                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 880                     ; 569 {
 881                     .text:	section	.text,new
 882  0000               _RTC_RatioCmd:
 886                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 888                     ; 574   RTC->WPR = 0xCA;
 890  0000 35ca5159      	mov	20825,#202
 891                     ; 575   RTC->WPR = 0x53;
 893  0004 35535159      	mov	20825,#83
 894                     ; 577   if (NewState != DISABLE)
 896  0008 4d            	tnz	a
 897  0009 2706          	jreq	L373
 898                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 900  000b 721a5148      	bset	20808,#5
 902  000f 2004          	jra	L573
 903  0011               L373:
 904                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 906  0011 721b5148      	bres	20808,#5
 907  0015               L573:
 908                     ; 589   RTC->WPR = 0xFF; 
 910  0015 35ff5159      	mov	20825,#255
 911                     ; 590 }
 914  0019 81            	ret	
 950                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 950                     ; 599 {
 951                     .text:	section	.text,new
 952  0000               _RTC_BypassShadowCmd:
 956                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
 958                     ; 604   RTC->WPR = 0xCA;
 960  0000 35ca5159      	mov	20825,#202
 961                     ; 605   RTC->WPR = 0x53;
 963  0004 35535159      	mov	20825,#83
 964                     ; 607   if (NewState != DISABLE)
 966  0008 4d            	tnz	a
 967  0009 2706          	jreq	L514
 968                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 970  000b 72185148      	bset	20808,#4
 972  000f 2004          	jra	L714
 973  0011               L514:
 974                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 976  0011 72195148      	bres	20808,#4
 977  0015               L714:
 978                     ; 619   RTC->WPR = 0xFF; 
 980  0015 35ff5159      	mov	20825,#255
 981                     ; 620 }
 984  0019 81            	ret	
1132                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1132                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1132                     ; 661 {
1133                     .text:	section	.text,new
1134  0000               _RTC_SetTime:
1136  0000 88            	push	a
1137  0001 88            	push	a
1138       00000001      OFST:	set	1
1141                     ; 662   ErrorStatus status = ERROR;
1143                     ; 663   uint8_t temp = 0;
1145                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1147                     ; 668   if (RTC_Format == RTC_Format_BIN)
1149  0002 0d02          	tnz	(OFST+1,sp)
1150                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1151                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1153                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1156                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1158                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1160                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1163                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1165                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1167                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1171  0004 c65148        	ld	a,20808
1172  0007 a540          	bcp	a,#64
1173                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1175                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1177                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1179                     ; 701   RTC->WPR = 0xCA;
1181  0009 35ca5159      	mov	20825,#202
1182                     ; 702   RTC->WPR = 0x53;
1184  000d 35535159      	mov	20825,#83
1185                     ; 705   if (RTC_EnterInitMode() == ERROR)
1187  0011 cd0000        	call	_RTC_EnterInitMode
1189  0014 4d            	tnz	a
1190  0015 2606          	jrne	L725
1191                     ; 707     status = ERROR;
1193                     ; 709     RTC->WPR = 0xFF; 
1195  0017 35ff5159      	mov	20825,#255
1197  001b 2059          	jra	L135
1198  001d               L725:
1199                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1201  001d 720d514808    	btjf	20808,#6,L335
1202                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1204                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1206  0022 1e05          	ldw	x,(OFST+4,sp)
1207  0024 e603          	ld	a,(3,x)
1208  0026 6b01          	ld	(OFST+0,sp),a
1210  0028 2002          	jra	L535
1211  002a               L335:
1212                     ; 721       temp = 0;
1214  002a 0f01          	clr	(OFST+0,sp)
1215  002c               L535:
1216                     ; 724     if (RTC_Format != RTC_Format_BIN)
1218  002c 7b02          	ld	a,(OFST+1,sp)
1219  002e 270f          	jreq	L735
1220                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1222  0030 1e05          	ldw	x,(OFST+4,sp)
1223  0032 e602          	ld	a,(2,x)
1224  0034 c75140        	ld	20800,a
1225                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1227  0037 e601          	ld	a,(1,x)
1228  0039 c75141        	ld	20801,a
1229                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1231  003c f6            	ld	a,(x)
1233  003d 201a          	jra	L145
1234  003f               L735:
1235                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1237  003f 1e05          	ldw	x,(OFST+4,sp)
1238  0041 e602          	ld	a,(2,x)
1239  0043 cd0000        	call	L3_ByteToBcd2
1241  0046 c75140        	ld	20800,a
1242                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1244  0049 1e05          	ldw	x,(OFST+4,sp)
1245  004b e601          	ld	a,(1,x)
1246  004d cd0000        	call	L3_ByteToBcd2
1248  0050 c75141        	ld	20801,a
1249                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1251  0053 1e05          	ldw	x,(OFST+4,sp)
1252  0055 f6            	ld	a,(x)
1253  0056 cd0000        	call	L3_ByteToBcd2
1255  0059               L145:
1256  0059 1a01          	or	a,(OFST+0,sp)
1257  005b c75142        	ld	20802,a
1258                     ; 737     (void)(RTC->DR3);
1260  005e c65146        	ld	a,20806
1261                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1263  0061 721f514c      	bres	20812,#7
1264                     ; 743     RTC->WPR = 0xFF; 
1266  0065 35ff5159      	mov	20825,#255
1267                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1269  0069 7208514806    	btjt	20808,#4,L345
1270                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1272  006e cd0000        	call	_RTC_WaitForSynchro
1274  0071 4d            	tnz	a
1275                     ; 750         status = ERROR;
1278  0072 2702          	jreq	L135
1279                     ; 754         status = SUCCESS;
1280  0074               L345:
1281                     ; 759       status = SUCCESS;
1284  0074 a601          	ld	a,#1
1285  0076               L135:
1286                     ; 763   return (ErrorStatus)status;
1290  0076 85            	popw	x
1291  0077 81            	ret	
1328                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1328                     ; 776 {
1329                     .text:	section	.text,new
1330  0000               _RTC_TimeStructInit:
1334                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1336  0000 6f03          	clr	(3,x)
1337                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1339  0002 7f            	clr	(x)
1340                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1342  0003 6f01          	clr	(1,x)
1343                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1345  0005 6f02          	clr	(2,x)
1346                     ; 782 }
1349  0007 81            	ret	
1406                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1406                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1406                     ; 800 {
1407                     .text:	section	.text,new
1408  0000               _RTC_GetTime:
1410  0000 88            	push	a
1411  0001 88            	push	a
1412       00000001      OFST:	set	1
1415                     ; 801   uint8_t  tmpreg = 0;
1417  0002 0f01          	clr	(OFST+0,sp)
1418                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1420                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1422  0004 1e05          	ldw	x,(OFST+4,sp)
1423  0006 c65140        	ld	a,20800
1424  0009 e702          	ld	(2,x),a
1425                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1427  000b c65141        	ld	a,20801
1428  000e e701          	ld	(1,x),a
1429                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1431  0010 c65142        	ld	a,20802
1432  0013 6b01          	ld	(OFST+0,sp),a
1433                     ; 817   (void) (RTC->DR3) ;
1435  0015 c65146        	ld	a,20806
1436                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1438  0018 7b01          	ld	a,(OFST+0,sp)
1439  001a a4bf          	and	a,#191
1440  001c f7            	ld	(x),a
1441                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1443  001d 7b01          	ld	a,(OFST+0,sp)
1444  001f a440          	and	a,#64
1445  0021 e703          	ld	(3,x),a
1446                     ; 827   if (RTC_Format == RTC_Format_BIN)
1448  0023 7b02          	ld	a,(OFST+1,sp)
1449  0025 2619          	jrne	L326
1450                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1452  0027 f6            	ld	a,(x)
1453  0028 cd0000        	call	L5_Bcd2ToByte
1455  002b 1e05          	ldw	x,(OFST+4,sp)
1456  002d f7            	ld	(x),a
1457                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1459  002e e601          	ld	a,(1,x)
1460  0030 cd0000        	call	L5_Bcd2ToByte
1462  0033 1e05          	ldw	x,(OFST+4,sp)
1463  0035 e701          	ld	(1,x),a
1464                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1466  0037 e602          	ld	a,(2,x)
1467  0039 cd0000        	call	L5_Bcd2ToByte
1469  003c 1e05          	ldw	x,(OFST+4,sp)
1470  003e e702          	ld	(2,x),a
1471  0040               L326:
1472                     ; 834 }
1475  0040 85            	popw	x
1476  0041 81            	ret	
1528                     ; 845 uint16_t RTC_GetSubSecond(void)
1528                     ; 846 {
1529                     .text:	section	.text,new
1530  0000               _RTC_GetSubSecond:
1532  0000 5206          	subw	sp,#6
1533       00000006      OFST:	set	6
1536                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1540                     ; 848   uint16_t ssrreg = 0;
1542                     ; 851   ssrhreg = RTC->SSRH;
1544  0002 c65157        	ld	a,20823
1545  0005 6b03          	ld	(OFST-3,sp),a
1546                     ; 852   ssrlreg = RTC->SSRL;
1548  0007 c65158        	ld	a,20824
1549  000a 6b04          	ld	(OFST-2,sp),a
1550                     ; 855   (void) (RTC->DR3);
1552  000c c65146        	ld	a,20806
1553                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1555  000f 7b04          	ld	a,(OFST-2,sp)
1556  0011 5f            	clrw	x
1557  0012 97            	ld	xl,a
1558  0013 1f01          	ldw	(OFST-5,sp),x
1559  0015 7b03          	ld	a,(OFST-3,sp)
1560  0017 97            	ld	xl,a
1561  0018 7b02          	ld	a,(OFST-4,sp)
1562  001a 01            	rrwa	x,a
1563  001b 1a01          	or	a,(OFST-5,sp)
1564  001d 01            	rrwa	x,a
1565                     ; 859   return (uint16_t)(ssrreg);
1569  001e 5b06          	addw	sp,#6
1570  0020 81            	ret	
1822                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1822                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1822                     ; 878 {
1823                     .text:	section	.text,new
1824  0000               _RTC_SetDate:
1826  0000 88            	push	a
1827  0001 89            	pushw	x
1828       00000002      OFST:	set	2
1831                     ; 879   ErrorStatus status = ERROR;
1833  0002 0f02          	clr	(OFST+0,sp)
1834                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1836  0004 4d            	tnz	a
1837  0005 2610          	jrne	L1001
1839  0007 1e06          	ldw	x,(OFST+4,sp)
1840  0009 e601          	ld	a,(1,x)
1841  000b a410          	and	a,#16
1842  000d 2708          	jreq	L1001
1843                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1845  000f e601          	ld	a,(1,x)
1846  0011 a4ef          	and	a,#239
1847  0013 ab0a          	add	a,#10
1848  0015 e701          	ld	(1,x),a
1849  0017               L1001:
1850                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1852                     ; 888   if (RTC_Format == RTC_Format_BIN)
1854  0017 0d03          	tnz	(OFST+1,sp)
1855                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1857                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1859                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1861                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1863                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1866                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1868                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1870                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1872                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1874                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1876                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1878                     ; 907   RTC->WPR = 0xCA;
1880  0019 35ca5159      	mov	20825,#202
1881                     ; 908   RTC->WPR = 0x53;
1883  001d 35535159      	mov	20825,#83
1884                     ; 911   if (RTC_EnterInitMode() == ERROR)
1886  0021 cd0000        	call	_RTC_EnterInitMode
1888  0024 4d            	tnz	a
1889  0025 2606          	jrne	L7001
1890                     ; 913     status = ERROR;
1892                     ; 915     RTC->WPR = 0xFF; 
1894  0027 35ff5159      	mov	20825,#255
1896  002b 205e          	jra	L1101
1897  002d               L7001:
1898                     ; 919     (void)(RTC->TR1);
1900  002d c65140        	ld	a,20800
1901                     ; 922     if (RTC_Format != RTC_Format_BIN)
1903  0030 7b03          	ld	a,(OFST+1,sp)
1904  0032 2718          	jreq	L3101
1905                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1907  0034 1e06          	ldw	x,(OFST+4,sp)
1908  0036 e602          	ld	a,(2,x)
1909  0038 c75144        	ld	20804,a
1910                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1912  003b f6            	ld	a,(x)
1913  003c 97            	ld	xl,a
1914  003d a620          	ld	a,#32
1915  003f 42            	mul	x,a
1916  0040 9f            	ld	a,xl
1917  0041 1e06          	ldw	x,(OFST+4,sp)
1918  0043 ea01          	or	a,(1,x)
1919  0045 c75145        	ld	20805,a
1920                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1922  0048 e603          	ld	a,(3,x)
1924  004a 2027          	jra	L5101
1925  004c               L3101:
1926                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1928  004c 1e06          	ldw	x,(OFST+4,sp)
1929  004e e602          	ld	a,(2,x)
1930  0050 cd0000        	call	L3_ByteToBcd2
1932  0053 c75144        	ld	20804,a
1933                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1935  0056 1e06          	ldw	x,(OFST+4,sp)
1936  0058 f6            	ld	a,(x)
1937  0059 97            	ld	xl,a
1938  005a a620          	ld	a,#32
1939  005c 42            	mul	x,a
1940  005d 9f            	ld	a,xl
1941  005e 6b01          	ld	(OFST-1,sp),a
1942  0060 1e06          	ldw	x,(OFST+4,sp)
1943  0062 e601          	ld	a,(1,x)
1944  0064 cd0000        	call	L3_ByteToBcd2
1946  0067 1a01          	or	a,(OFST-1,sp)
1947  0069 c75145        	ld	20805,a
1948                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1950  006c 1e06          	ldw	x,(OFST+4,sp)
1951  006e e603          	ld	a,(3,x)
1952  0070 cd0000        	call	L3_ByteToBcd2
1954  0073               L5101:
1955  0073 c75146        	ld	20806,a
1956                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1958  0076 721f514c      	bres	20812,#7
1959                     ; 939     RTC->WPR = 0xFF; 
1961  007a 35ff5159      	mov	20825,#255
1962                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1964  007e 7208514806    	btjt	20808,#4,L7101
1965                     ; 944       if (RTC_WaitForSynchro() == ERROR)
1967  0083 cd0000        	call	_RTC_WaitForSynchro
1969  0086 4d            	tnz	a
1970                     ; 946         status = ERROR;
1973  0087 2702          	jreq	L1101
1974                     ; 950         status = SUCCESS;
1975  0089               L7101:
1976                     ; 955       status = SUCCESS;
1979  0089 a601          	ld	a,#1
1980  008b               L1101:
1981                     ; 959   return (ErrorStatus)status;
1985  008b 5b03          	addw	sp,#3
1986  008d 81            	ret	
2023                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2023                     ; 969 {
2024                     .text:	section	.text,new
2025  0000               _RTC_DateStructInit:
2029                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2031  0000 a601          	ld	a,#1
2032  0002 f7            	ld	(x),a
2033                     ; 972   RTC_DateStruct->RTC_Date = 1;
2035  0003 e702          	ld	(2,x),a
2036                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2038  0005 e701          	ld	(1,x),a
2039                     ; 974   RTC_DateStruct->RTC_Year = 0;
2041  0007 6f03          	clr	(3,x)
2042                     ; 975 }
2045  0009 81            	ret	
2102                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2102                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2102                     ; 990 {
2103                     .text:	section	.text,new
2104  0000               _RTC_GetDate:
2106  0000 88            	push	a
2107  0001 88            	push	a
2108       00000001      OFST:	set	1
2111                     ; 991   uint8_t tmpreg = 0;
2113  0002 0f01          	clr	(OFST+0,sp)
2114                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2116                     ; 997   (void) (RTC->TR1) ;
2118  0004 c65140        	ld	a,20800
2119                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2121  0007 1e05          	ldw	x,(OFST+4,sp)
2122  0009 c65144        	ld	a,20804
2123  000c e702          	ld	(2,x),a
2124                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2126  000e c65145        	ld	a,20805
2127  0011 6b01          	ld	(OFST+0,sp),a
2128                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2130  0013 c65146        	ld	a,20806
2131  0016 e703          	ld	(3,x),a
2132                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2134  0018 7b01          	ld	a,(OFST+0,sp)
2135  001a a41f          	and	a,#31
2136  001c e701          	ld	(1,x),a
2137                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2139  001e 7b01          	ld	a,(OFST+0,sp)
2140  0020 4e            	swap	a
2141  0021 a40e          	and	a,#14
2142  0023 44            	srl	a
2143  0024 f7            	ld	(x),a
2144                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2146  0025 7b02          	ld	a,(OFST+1,sp)
2147  0027 261b          	jrne	L7701
2148                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2150  0029 e603          	ld	a,(3,x)
2151  002b cd0000        	call	L5_Bcd2ToByte
2153  002e 1e05          	ldw	x,(OFST+4,sp)
2154  0030 e703          	ld	(3,x),a
2155                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2157  0032 e601          	ld	a,(1,x)
2158  0034 cd0000        	call	L5_Bcd2ToByte
2160  0037 1e05          	ldw	x,(OFST+4,sp)
2161  0039 e701          	ld	(1,x),a
2162                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2164  003b e602          	ld	a,(2,x)
2165  003d cd0000        	call	L5_Bcd2ToByte
2167  0040 1e05          	ldw	x,(OFST+4,sp)
2168  0042 e702          	ld	(2,x),a
2169  0044               L7701:
2170                     ; 1014 }
2173  0044 85            	popw	x
2174  0045 81            	ret	
2323                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2323                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2323                     ; 1046 {
2324                     .text:	section	.text,new
2325  0000               _RTC_SetAlarm:
2327  0000 88            	push	a
2328  0001 5205          	subw	sp,#5
2329       00000005      OFST:	set	5
2332                     ; 1047   uint8_t tmpreg1 = 0;
2334                     ; 1048   uint8_t tmpreg2 = 0;
2336                     ; 1049   uint8_t tmpreg3 = 0;
2338                     ; 1050   uint8_t tmpreg4 = 0;
2340                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2342                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2344                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2346                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2348                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2350  0003 0d06          	tnz	(OFST+1,sp)
2351                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2352                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2354                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2357                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2359                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2361                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2364                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2366                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2368                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2372  0005 c65148        	ld	a,20808
2373  0008 a540          	bcp	a,#64
2374                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2376                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2378                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2380                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2382  000a 1e09          	ldw	x,(OFST+4,sp)
2383  000c e604          	ld	a,(4,x)
2384  000e a510          	bcp	a,#16
2385  0010 2604          	jrne	L3121
2386                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2388  0012 e605          	ld	a,(5,x)
2389  0014 a140          	cp	a,#64
2390                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2393  0016               L3121:
2394                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2396                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2398                     ; 1108   RTC->WPR = 0xCA;
2400  0016 35ca5159      	mov	20825,#202
2401                     ; 1109   RTC->WPR = 0x53;
2403  001a 35535159      	mov	20825,#83
2404                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2406  001e 7b06          	ld	a,(OFST+1,sp)
2407  0020 272b          	jreq	L7121
2408                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2408                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2410  0022 e604          	ld	a,(4,x)
2411  0024 a480          	and	a,#128
2412  0026 ea02          	or	a,(2,x)
2413  0028 6b02          	ld	(OFST-3,sp),a
2414                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2414                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2416  002a e604          	ld	a,(4,x)
2417  002c 48            	sll	a
2418  002d a480          	and	a,#128
2419  002f ea01          	or	a,(1,x)
2420  0031 6b03          	ld	(OFST-2,sp),a
2421                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2421                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2421                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2423  0033 ad7c          	call	LC006
2424  0035 a480          	and	a,#128
2425  0037 6b01          	ld	(OFST-4,sp),a
2426  0039 e603          	ld	a,(3,x)
2427  003b fa            	or	a,(x)
2428  003c 1a01          	or	a,(OFST-4,sp)
2429  003e 6b04          	ld	(OFST-1,sp),a
2430                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2430                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2430                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2432  0040 ad6f          	call	LC006
2433  0042 48            	sll	a
2434  0043 a480          	and	a,#128
2435  0045 6b01          	ld	(OFST-4,sp),a
2436  0047 e605          	ld	a,(5,x)
2437  0049 ea06          	or	a,(6,x)
2439  004b 2045          	jra	L1221
2440  004d               L7121:
2441                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2441                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2443  004d e604          	ld	a,(4,x)
2444  004f a480          	and	a,#128
2445  0051 6b01          	ld	(OFST-4,sp),a
2446  0053 e602          	ld	a,(2,x)
2447  0055 cd0000        	call	L3_ByteToBcd2
2449  0058 1a01          	or	a,(OFST-4,sp)
2450  005a 6b02          	ld	(OFST-3,sp),a
2451                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2451                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2453  005c 1e09          	ldw	x,(OFST+4,sp)
2454  005e e604          	ld	a,(4,x)
2455  0060 48            	sll	a
2456  0061 a480          	and	a,#128
2457  0063 6b01          	ld	(OFST-4,sp),a
2458  0065 e601          	ld	a,(1,x)
2459  0067 cd0000        	call	L3_ByteToBcd2
2461  006a 1a01          	or	a,(OFST-4,sp)
2462  006c 6b03          	ld	(OFST-2,sp),a
2463                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2463                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2463                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2465  006e 1e09          	ldw	x,(OFST+4,sp)
2466  0070 ad3f          	call	LC006
2467  0072 a480          	and	a,#128
2468  0074 6b01          	ld	(OFST-4,sp),a
2469  0076 f6            	ld	a,(x)
2470  0077 cd0000        	call	L3_ByteToBcd2
2472  007a 1e09          	ldw	x,(OFST+4,sp)
2473  007c ea03          	or	a,(3,x)
2474  007e 1a01          	or	a,(OFST-4,sp)
2475  0080 6b04          	ld	(OFST-1,sp),a
2476                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2476                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2476                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2478  0082 ad2d          	call	LC006
2479  0084 48            	sll	a
2480  0085 a480          	and	a,#128
2481  0087 6b01          	ld	(OFST-4,sp),a
2482  0089 e606          	ld	a,(6,x)
2483  008b cd0000        	call	L3_ByteToBcd2
2485  008e 1e09          	ldw	x,(OFST+4,sp)
2486  0090 ea05          	or	a,(5,x)
2487  0092               L1221:
2488  0092 1a01          	or	a,(OFST-4,sp)
2489  0094 6b05          	ld	(OFST+0,sp),a
2490                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2492  0096 7b02          	ld	a,(OFST-3,sp)
2493  0098 c7515c        	ld	20828,a
2494                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2496  009b 7b03          	ld	a,(OFST-2,sp)
2497  009d c7515d        	ld	20829,a
2498                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2500  00a0 7b04          	ld	a,(OFST-1,sp)
2501  00a2 c7515e        	ld	20830,a
2502                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2504  00a5 7b05          	ld	a,(OFST+0,sp)
2505  00a7 c7515f        	ld	20831,a
2506                     ; 1154   RTC->WPR = 0xFF; 
2508  00aa 35ff5159      	mov	20825,#255
2509                     ; 1155 }
2512  00ae 5b06          	addw	sp,#6
2513  00b0 81            	ret	
2515  00b1               LC006:
2516  00b1 e604          	ld	a,(4,x)
2517  00b3 48            	sll	a
2518  00b4 48            	sll	a
2519  00b5 81            	ret	
2556                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2556                     ; 1166 {
2557                     .text:	section	.text,new
2558  0000               _RTC_AlarmStructInit:
2562                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2564  0000 6f03          	clr	(3,x)
2565                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2567  0002 7f            	clr	(x)
2568                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2570  0003 6f01          	clr	(1,x)
2571                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2573  0005 6f02          	clr	(2,x)
2574                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2576  0007 6f05          	clr	(5,x)
2577                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2579  0009 a601          	ld	a,#1
2580  000b e706          	ld	(6,x),a
2581                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2583  000d a6f0          	ld	a,#240
2584  000f e704          	ld	(4,x),a
2585                     ; 1179 }
2588  0011 81            	ret	
2681                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2681                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2681                     ; 1190 {
2682                     .text:	section	.text,new
2683  0000               _RTC_GetAlarm:
2685  0000 88            	push	a
2686  0001 5204          	subw	sp,#4
2687       00000004      OFST:	set	4
2690                     ; 1191   uint8_t tmpreg1 = 0;
2692                     ; 1192   uint8_t tmpreg2 = 0;
2694                     ; 1193   uint8_t tmpreg3 = 0;
2696                     ; 1194   uint8_t tmpreg4 = 0;
2698                     ; 1195   uint8_t alarmmask = 0;
2700                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2702                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2704  0003 c6515c        	ld	a,20828
2705  0006 6b04          	ld	(OFST+0,sp),a
2706                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2708  0008 c6515d        	ld	a,20829
2709  000b 6b01          	ld	(OFST-3,sp),a
2710                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2712  000d c6515e        	ld	a,20830
2713  0010 6b02          	ld	(OFST-2,sp),a
2714                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2716  0012 c6515f        	ld	a,20831
2717  0015 6b03          	ld	(OFST-1,sp),a
2718                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2720  0017 7b04          	ld	a,(OFST+0,sp)
2721  0019 a47f          	and	a,#127
2722  001b 1e08          	ldw	x,(OFST+4,sp)
2723  001d e702          	ld	(2,x),a
2724                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2726  001f 7b04          	ld	a,(OFST+0,sp)
2727  0021 a480          	and	a,#128
2728  0023 6b04          	ld	(OFST+0,sp),a
2729                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2731  0025 7b01          	ld	a,(OFST-3,sp)
2732  0027 a47f          	and	a,#127
2733  0029 e701          	ld	(1,x),a
2734                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2736  002b 7b01          	ld	a,(OFST-3,sp)
2737  002d a480          	and	a,#128
2738  002f 44            	srl	a
2739  0030 1a04          	or	a,(OFST+0,sp)
2740  0032 6b04          	ld	(OFST+0,sp),a
2741                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2743  0034 7b02          	ld	a,(OFST-2,sp)
2744  0036 a43f          	and	a,#63
2745  0038 f7            	ld	(x),a
2746                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2748  0039 7b02          	ld	a,(OFST-2,sp)
2749  003b a440          	and	a,#64
2750  003d e703          	ld	(3,x),a
2751                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2753  003f 7b02          	ld	a,(OFST-2,sp)
2754  0041 a480          	and	a,#128
2755  0043 44            	srl	a
2756  0044 44            	srl	a
2757  0045 1a04          	or	a,(OFST+0,sp)
2758  0047 6b04          	ld	(OFST+0,sp),a
2759                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2761  0049 7b03          	ld	a,(OFST-1,sp)
2762  004b a43f          	and	a,#63
2763  004d e706          	ld	(6,x),a
2764                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2766  004f 7b03          	ld	a,(OFST-1,sp)
2767  0051 a440          	and	a,#64
2768  0053 e705          	ld	(5,x),a
2769                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2771  0055 7b03          	ld	a,(OFST-1,sp)
2772  0057 a480          	and	a,#128
2773  0059 44            	srl	a
2774  005a 44            	srl	a
2775  005b 44            	srl	a
2776  005c 1a04          	or	a,(OFST+0,sp)
2777  005e 6b04          	ld	(OFST+0,sp),a
2778                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2780  0060 e704          	ld	(4,x),a
2781                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2783  0062 7b05          	ld	a,(OFST+1,sp)
2784  0064 2622          	jrne	L3131
2785                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2787  0066 f6            	ld	a,(x)
2788  0067 cd0000        	call	L5_Bcd2ToByte
2790  006a 1e08          	ldw	x,(OFST+4,sp)
2791  006c f7            	ld	(x),a
2792                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2794  006d e601          	ld	a,(1,x)
2795  006f cd0000        	call	L5_Bcd2ToByte
2797  0072 1e08          	ldw	x,(OFST+4,sp)
2798  0074 e701          	ld	(1,x),a
2799                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2801  0076 e602          	ld	a,(2,x)
2802  0078 cd0000        	call	L5_Bcd2ToByte
2804  007b 1e08          	ldw	x,(OFST+4,sp)
2805  007d e702          	ld	(2,x),a
2806                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2808  007f e606          	ld	a,(6,x)
2809  0081 cd0000        	call	L5_Bcd2ToByte
2811  0084 1e08          	ldw	x,(OFST+4,sp)
2812  0086 e706          	ld	(6,x),a
2813  0088               L3131:
2814                     ; 1233 }
2817  0088 5b05          	addw	sp,#5
2818  008a 81            	ret	
2882                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2882                     ; 1243 {
2883                     .text:	section	.text,new
2884  0000               _RTC_AlarmCmd:
2886  0000 88            	push	a
2887  0001 5203          	subw	sp,#3
2888       00000003      OFST:	set	3
2891                     ; 1244   __IO uint16_t alrawfcount = 0;
2893  0003 5f            	clrw	x
2894  0004 1f01          	ldw	(OFST-2,sp),x
2895                     ; 1245   ErrorStatus status = ERROR;
2897                     ; 1246   uint8_t temp1 = 0;
2899  0006 7b03          	ld	a,(OFST+0,sp)
2900  0008 97            	ld	xl,a
2901                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
2903                     ; 1252   RTC->WPR = 0xCA;
2905  0009 35ca5159      	mov	20825,#202
2906                     ; 1253   RTC->WPR = 0x53;
2908  000d 35535159      	mov	20825,#83
2909                     ; 1256   if (NewState != DISABLE)
2911  0011 7b04          	ld	a,(OFST+1,sp)
2912  0013 2711          	jreq	L7431
2913                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2915  0015 72105149      	bset	20809,#0
2916                     ; 1259     status = SUCCESS;
2918  0019               LC007:
2920  0019 a601          	ld	a,#1
2921  001b 6b03          	ld	(OFST+0,sp),a
2923  001d               L1531:
2924                     ; 1283   RTC->WPR = 0xFF; 
2926  001d 35ff5159      	mov	20825,#255
2927                     ; 1286   return (ErrorStatus)status;
2929  0021 7b03          	ld	a,(OFST+0,sp)
2932  0023 5b04          	addw	sp,#4
2933  0025 81            	ret	
2934  0026               L7431:
2935                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2937  0026 72115149      	bres	20809,#0
2938                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2940  002a c6514c        	ld	a,20812
2941  002d a401          	and	a,#1
2942  002f 6b03          	ld	(OFST+0,sp),a
2944  0031 2005          	jra	L7531
2945  0033               L3531:
2946                     ; 1269       alrawfcount++;
2948  0033 1e01          	ldw	x,(OFST-2,sp)
2949  0035 5c            	incw	x
2950  0036 1f01          	ldw	(OFST-2,sp),x
2951  0038               L7531:
2952                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2954  0038 1e01          	ldw	x,(OFST-2,sp)
2955  003a a3ffff        	cpw	x,#65535
2956  003d 2704          	jreq	L3631
2958  003f 7b03          	ld	a,(OFST+0,sp)
2959  0041 27f0          	jreq	L3531
2960  0043               L3631:
2961                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2963  0043 7200514c04    	btjt	20812,#0,L5631
2964                     ; 1274       status = ERROR;
2966  0048 0f03          	clr	(OFST+0,sp)
2968  004a 20d1          	jra	L1531
2969  004c               L5631:
2970                     ; 1278       status = SUCCESS;
2971  004c 20cb          	jp	LC007
3172                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3172                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3172                     ; 1300 {
3173                     .text:	section	.text,new
3174  0000               _RTC_AlarmSubSecondConfig:
3176  0000 89            	pushw	x
3177  0001 88            	push	a
3178       00000001      OFST:	set	1
3181                     ; 1301   uint8_t alarmstatus = 0;
3183                     ; 1302   ErrorStatus status = ERROR;
3185  0002 7b01          	ld	a,(OFST+0,sp)
3186  0004 97            	ld	xl,a
3187                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3189                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3191                     ; 1309   RTC->WPR = 0xCA;
3193  0005 35ca5159      	mov	20825,#202
3194                     ; 1310   RTC->WPR = 0x53;
3196  0009 35535159      	mov	20825,#83
3197                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3199  000d 720c514c28    	btjt	20812,#6,L7641
3200                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3202  0012 c65149        	ld	a,20809
3203  0015 aa01          	or	a,#1
3204  0017 6b01          	ld	(OFST+0,sp),a
3205                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3207  0019 72115149      	bres	20809,#0
3208                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3210  001d 7b02          	ld	a,(OFST+1,sp)
3211  001f c75164        	ld	20836,a
3212                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3214  0022 7b03          	ld	a,(OFST+2,sp)
3215  0024 c75165        	ld	20837,a
3216                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3218  0027 7b06          	ld	a,(OFST+5,sp)
3219  0029 c75166        	ld	20838,a
3220                     ; 1327     RTC->CR2 |= alarmstatus;
3222  002c c65149        	ld	a,20809
3223  002f 1a01          	or	a,(OFST+0,sp)
3224  0031 c75149        	ld	20809,a
3225                     ; 1329     status = SUCCESS;
3227  0034 a601          	ld	a,#1
3228  0036 6b01          	ld	(OFST+0,sp),a
3230  0038 2002          	jra	L1741
3231  003a               L7641:
3232                     ; 1333     status = ERROR;
3234  003a 0f01          	clr	(OFST+0,sp)
3235  003c               L1741:
3236                     ; 1337   RTC->WPR = 0xFF; 
3238  003c 35ff5159      	mov	20825,#255
3239                     ; 1339   return (ErrorStatus)status;
3241  0040 7b01          	ld	a,(OFST+0,sp)
3244  0042 5b03          	addw	sp,#3
3245  0044 81            	ret	
3335                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3335                     ; 1370 {
3336                     .text:	section	.text,new
3337  0000               _RTC_WakeUpClockConfig:
3339  0000 88            	push	a
3340       00000000      OFST:	set	0
3343                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3345                     ; 1376   RTC->WPR = 0xCA;
3347  0001 35ca5159      	mov	20825,#202
3348                     ; 1377   RTC->WPR = 0x53;
3350  0005 35535159      	mov	20825,#83
3351                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3353  0009 72155149      	bres	20809,#2
3354                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3356  000d c65148        	ld	a,20808
3357  0010 a4f8          	and	a,#248
3358  0012 c75148        	ld	20808,a
3359                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3361  0015 c65148        	ld	a,20808
3362  0018 1a01          	or	a,(OFST+1,sp)
3363  001a c75148        	ld	20808,a
3364                     ; 1389   RTC->WPR = 0xFF; 
3366  001d 35ff5159      	mov	20825,#255
3367                     ; 1390 }
3370  0021 84            	pop	a
3371  0022 81            	ret	
3406                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3406                     ; 1401 {
3407                     .text:	section	.text,new
3408  0000               _RTC_SetWakeUpCounter:
3412                     ; 1403   RTC->WPR = 0xCA;
3414  0000 35ca5159      	mov	20825,#202
3415                     ; 1404   RTC->WPR = 0x53;
3417  0004 35535159      	mov	20825,#83
3418                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3420  0008 9e            	ld	a,xh
3421  0009 c75154        	ld	20820,a
3422                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3424  000c 9f            	ld	a,xl
3425  000d c75155        	ld	20821,a
3426                     ; 1412   RTC->WPR = 0xFF; 
3428  0010 35ff5159      	mov	20825,#255
3429                     ; 1413 }
3432  0014 81            	ret	
3467                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3467                     ; 1421 {
3468                     .text:	section	.text,new
3469  0000               _RTC_GetWakeUpCounter:
3471  0000 89            	pushw	x
3472       00000002      OFST:	set	2
3475                     ; 1422   uint16_t tmpreg = 0;
3477                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3479  0001 c65154        	ld	a,20820
3480  0004 97            	ld	xl,a
3481  0005 4f            	clr	a
3482  0006 02            	rlwa	x,a
3483  0007 1f01          	ldw	(OFST-1,sp),x
3484                     ; 1426   tmpreg |= RTC->WUTRL;
3486  0009 c65155        	ld	a,20821
3487  000c 5f            	clrw	x
3488  000d 97            	ld	xl,a
3489  000e 01            	rrwa	x,a
3490  000f 1a02          	or	a,(OFST+0,sp)
3491  0011 01            	rrwa	x,a
3492  0012 1a01          	or	a,(OFST-1,sp)
3493  0014 01            	rrwa	x,a
3494                     ; 1429   return (uint16_t)tmpreg;
3498  0015 5b02          	addw	sp,#2
3499  0017 81            	ret	
3554                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3554                     ; 1441 {
3555                     .text:	section	.text,new
3556  0000               _RTC_WakeUpCmd:
3558  0000 88            	push	a
3559  0001 5203          	subw	sp,#3
3560       00000003      OFST:	set	3
3563                     ; 1442   ErrorStatus status = ERROR;
3565                     ; 1443   uint16_t wutwfcount = 0;
3567  0003 5f            	clrw	x
3568  0004 1f02          	ldw	(OFST-1,sp),x
3569                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3571                     ; 1449   RTC->WPR = 0xCA;
3573  0006 35ca5159      	mov	20825,#202
3574                     ; 1450   RTC->WPR = 0x53;
3576  000a 35535159      	mov	20825,#83
3577                     ; 1452   if (NewState != DISABLE)
3579  000e 7b04          	ld	a,(OFST+1,sp)
3580  0010 2711          	jreq	L3161
3581                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3583  0012 72145149      	bset	20809,#2
3584                     ; 1457     status = SUCCESS;
3586  0016               LC008:
3588  0016 a601          	ld	a,#1
3589  0018 6b01          	ld	(OFST-2,sp),a
3591  001a               L5161:
3592                     ; 1482   RTC->WPR = 0xFF; 
3594  001a 35ff5159      	mov	20825,#255
3595                     ; 1485   return (ErrorStatus)status;
3597  001e 7b01          	ld	a,(OFST-2,sp)
3600  0020 5b04          	addw	sp,#4
3601  0022 81            	ret	
3602  0023               L3161:
3603                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3605  0023 72155149      	bres	20809,#2
3607  0027 2003          	jra	L1261
3608  0029               L7161:
3609                     ; 1467       wutwfcount++;
3611  0029 5c            	incw	x
3612  002a 1f02          	ldw	(OFST-1,sp),x
3613  002c               L1261:
3614                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3616  002c 7204514c05    	btjt	20812,#2,L5261
3618  0031 a3ffff        	cpw	x,#65535
3619  0034 26f3          	jrne	L7161
3620  0036               L5261:
3621                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3623  0036 7204514c04    	btjt	20812,#2,L7261
3624                     ; 1473       status = ERROR;
3626  003b 0f01          	clr	(OFST-2,sp)
3628  003d 20db          	jra	L5161
3629  003f               L7261:
3630                     ; 1477       status = SUCCESS;
3631  003f 20d5          	jp	LC008
3721                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3721                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3721                     ; 1524 {
3722                     .text:	section	.text,new
3723  0000               _RTC_DayLightSavingConfig:
3725  0000 89            	pushw	x
3726       00000000      OFST:	set	0
3729                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3731                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3733                     ; 1530   RTC->WPR = 0xCA;
3735  0001 35ca5159      	mov	20825,#202
3736                     ; 1531   RTC->WPR = 0x53;
3738  0005 35535159      	mov	20825,#83
3739                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3741  0009 7215514a      	bres	20810,#2
3742                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3744  000d 9f            	ld	a,xl
3745  000e 1a01          	or	a,(OFST+1,sp)
3746  0010 ca514a        	or	a,20810
3747  0013 c7514a        	ld	20810,a
3748                     ; 1540   RTC->WPR = 0xFF; 
3750  0016 35ff5159      	mov	20825,#255
3751                     ; 1541 }
3754  001a 85            	popw	x
3755  001b 81            	ret	
3780                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3780                     ; 1550 {
3781                     .text:	section	.text,new
3782  0000               _RTC_GetStoreOperation:
3786                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3788  0000 c6514a        	ld	a,20810
3789  0003 a404          	and	a,#4
3792  0005 81            	ret	
3886                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3886                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3886                     ; 1589 {
3887                     .text:	section	.text,new
3888  0000               _RTC_OutputConfig:
3890  0000 89            	pushw	x
3891       00000000      OFST:	set	0
3894                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3896                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3898                     ; 1595   RTC->WPR = 0xCA;
3900  0001 35ca5159      	mov	20825,#202
3901                     ; 1596   RTC->WPR = 0x53;
3903  0005 35535159      	mov	20825,#83
3904                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3906  0009 c6514a        	ld	a,20810
3907  000c a48f          	and	a,#143
3908  000e c7514a        	ld	20810,a
3909                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3911  0011 9f            	ld	a,xl
3912  0012 1a01          	or	a,(OFST+1,sp)
3913  0014 ca514a        	or	a,20810
3914  0017 c7514a        	ld	20810,a
3915                     ; 1605   RTC->WPR = 0xFF; 
3917  001a 35ff5159      	mov	20825,#255
3918                     ; 1606 }
3921  001e 85            	popw	x
3922  001f 81            	ret	
4017                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4017                     ; 1640                                    uint16_t RTC_ShiftSubFS)
4017                     ; 1641 {
4018                     .text:	section	.text,new
4019  0000               _RTC_SynchroShiftConfig:
4021  0000 88            	push	a
4022  0001 5203          	subw	sp,#3
4023       00000003      OFST:	set	3
4026                     ; 1642   uint8_t shiftrhreg = 0;
4028                     ; 1643   ErrorStatus status = ERROR;
4030                     ; 1644   uint16_t shpfcount = 0;
4032  0003 5f            	clrw	x
4033  0004 1f02          	ldw	(OFST-1,sp),x
4034                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4036                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4038                     ; 1651   RTC->WPR = 0xCA;
4040  0006 35ca5159      	mov	20825,#202
4041                     ; 1652   RTC->WPR = 0x53;
4043  000a 35535159      	mov	20825,#83
4044                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4046  000e 7207514c0f    	btjf	20812,#3,L7102
4048  0013 2003          	jra	L3202
4049  0015               L1202:
4050                     ; 1660       shpfcount++;
4052  0015 5c            	incw	x
4053  0016 1f02          	ldw	(OFST-1,sp),x
4054  0018               L3202:
4055                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4057  0018 7207514c05    	btjf	20812,#3,L7102
4059  001d a3ffff        	cpw	x,#65535
4060  0020 26f3          	jrne	L1202
4061  0022               L7102:
4062                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4064  0022 7206514c12    	btjt	20812,#3,L1302
4065                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4067  0027 7b07          	ld	a,(OFST+4,sp)
4068  0029 1a04          	or	a,(OFST+1,sp)
4069                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4071  002b c7515a        	ld	20826,a
4072                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4074  002e 7b08          	ld	a,(OFST+5,sp)
4075  0030 c7515b        	ld	20827,a
4076                     ; 1672     status = SUCCESS;
4078  0033 a601          	ld	a,#1
4079  0035 6b01          	ld	(OFST-2,sp),a
4081  0037 2002          	jra	L3302
4082  0039               L1302:
4083                     ; 1676     status = ERROR;
4085  0039 0f01          	clr	(OFST-2,sp)
4086  003b               L3302:
4087                     ; 1680   RTC->WPR = 0xFF; 
4089  003b 35ff5159      	mov	20825,#255
4090                     ; 1682   return (ErrorStatus)(status);
4092  003f 7b01          	ld	a,(OFST-2,sp)
4095  0041 5b04          	addw	sp,#4
4096  0043 81            	ret	
4226                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4226                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4226                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4226                     ; 1721 {
4227                     .text:	section	.text,new
4228  0000               _RTC_SmoothCalibConfig:
4230  0000 89            	pushw	x
4231  0001 5203          	subw	sp,#3
4232       00000003      OFST:	set	3
4235                     ; 1722   ErrorStatus status = ERROR;
4237                     ; 1723   uint16_t recalpfcount = 0;
4239  0003 5f            	clrw	x
4240  0004 1f02          	ldw	(OFST-1,sp),x
4241                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4243                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4245                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4247                     ; 1731   RTC->WPR = 0xCA;
4249  0006 35ca5159      	mov	20825,#202
4250                     ; 1732   RTC->WPR = 0x53;
4252  000a 35535159      	mov	20825,#83
4253                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4255  000e 7203514c0f    	btjf	20812,#1,L5112
4257  0013 2003          	jra	L1212
4258  0015               L7112:
4259                     ; 1740       recalpfcount++;
4261  0015 5c            	incw	x
4262  0016 1f02          	ldw	(OFST-1,sp),x
4263  0018               L1212:
4264                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4266  0018 7203514c05    	btjf	20812,#1,L5112
4268  001d a3ffff        	cpw	x,#65535
4269  0020 26f3          	jrne	L7112
4270  0022               L5112:
4271                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4273  0022 7202514c14    	btjt	20812,#1,L7212
4274                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4274                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4274                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4276  0027 7b04          	ld	a,(OFST+1,sp)
4277  0029 1a05          	or	a,(OFST+2,sp)
4278  002b 1a08          	or	a,(OFST+5,sp)
4279  002d c7516a        	ld	20842,a
4280                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4282  0030 7b09          	ld	a,(OFST+6,sp)
4283  0032 c7516b        	ld	20843,a
4284                     ; 1754     status = SUCCESS;
4286  0035 a601          	ld	a,#1
4287  0037 6b01          	ld	(OFST-2,sp),a
4289  0039 2002          	jra	L1312
4290  003b               L7212:
4291                     ; 1758     status = ERROR;
4293  003b 0f01          	clr	(OFST-2,sp)
4294  003d               L1312:
4295                     ; 1762   RTC->WPR = 0xFF; 
4297  003d 35ff5159      	mov	20825,#255
4298                     ; 1764   return (ErrorStatus)(status);
4300  0041 7b01          	ld	a,(OFST-2,sp)
4303  0043 5b05          	addw	sp,#5
4304  0045 81            	ret	
4362                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4362                     ; 1791 {
4363                     .text:	section	.text,new
4364  0000               _RTC_CalibOutputConfig:
4368                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4370                     ; 1796   RTC->WPR = 0xCA;
4372  0000 35ca5159      	mov	20825,#202
4373                     ; 1797   RTC->WPR = 0x53;
4375  0004 35535159      	mov	20825,#83
4376                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4378  0008 4d            	tnz	a
4379  0009 2706          	jreq	L1612
4380                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4382  000b 7216514a      	bset	20810,#3
4384  000f 2004          	jra	L3612
4385  0011               L1612:
4386                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4388  0011 7217514a      	bres	20810,#3
4389  0015               L3612:
4390                     ; 1811   RTC->WPR = 0xFF; 
4392  0015 35ff5159      	mov	20825,#255
4393                     ; 1812 }
4396  0019 81            	ret	
4431                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4431                     ; 1821 {
4432                     .text:	section	.text,new
4433  0000               _RTC_CalibOutputCmd:
4437                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4439                     ; 1826   RTC->WPR = 0xCA;
4441  0000 35ca5159      	mov	20825,#202
4442                     ; 1827   RTC->WPR = 0x53;
4444  0004 35535159      	mov	20825,#83
4445                     ; 1829   if (NewState != DISABLE)
4447  0008 4d            	tnz	a
4448  0009 2706          	jreq	L3022
4449                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4451  000b 721e514a      	bset	20810,#7
4453  000f 2004          	jra	L5022
4454  0011               L3022:
4455                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4457  0011 721f514a      	bres	20810,#7
4458  0015               L5022:
4459                     ; 1841   RTC->WPR = 0xFF; 
4461  0015 35ff5159      	mov	20825,#255
4462                     ; 1842 }
4465  0019 81            	ret	
4560                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4560                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4560                     ; 1873 {
4561                     .text:	section	.text,new
4562  0000               _RTC_TamperLevelConfig:
4564  0000 89            	pushw	x
4565       00000000      OFST:	set	0
4568                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4570                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4572                     ; 1879   RTC->WPR = 0xCA;
4574  0001 35ca5159      	mov	20825,#202
4575                     ; 1880   RTC->WPR = 0x53;
4577  0005 35535159      	mov	20825,#83
4578                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4580  0009 9f            	ld	a,xl
4581  000a 4d            	tnz	a
4582  000b 2707          	jreq	L3522
4583                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4585  000d 9e            	ld	a,xh
4586  000e 48            	sll	a
4587  000f ca516c        	or	a,20844
4589  0012 2007          	jra	L5522
4590  0014               L3522:
4591                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4593  0014 7b01          	ld	a,(OFST+1,sp)
4594  0016 48            	sll	a
4595  0017 43            	cpl	a
4596  0018 c4516c        	and	a,20844
4597  001b               L5522:
4598  001b c7516c        	ld	20844,a
4599                     ; 1894   RTC->WPR = 0xFF; 
4601  001e 35ff5159      	mov	20825,#255
4602                     ; 1895 }
4605  0022 85            	popw	x
4606  0023 81            	ret	
4680                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4680                     ; 1904 {
4681                     .text:	section	.text,new
4682  0000               _RTC_TamperFilterConfig:
4684  0000 88            	push	a
4685       00000000      OFST:	set	0
4688                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4690                     ; 1910   RTC->WPR = 0xCA;
4692  0001 35ca5159      	mov	20825,#202
4693                     ; 1911   RTC->WPR = 0x53;
4695  0005 35535159      	mov	20825,#83
4696                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4698  0009 c6516d        	ld	a,20845
4699  000c a4e7          	and	a,#231
4700  000e c7516d        	ld	20845,a
4701                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4703  0011 c6516d        	ld	a,20845
4704  0014 1a01          	or	a,(OFST+1,sp)
4705  0016 c7516d        	ld	20845,a
4706                     ; 1920   RTC->WPR = 0xFF; 
4708  0019 35ff5159      	mov	20825,#255
4709                     ; 1922 }
4712  001d 84            	pop	a
4713  001e 81            	ret	
4826                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4826                     ; 1932 {
4827                     .text:	section	.text,new
4828  0000               _RTC_TamperSamplingFreqConfig:
4830  0000 88            	push	a
4831       00000000      OFST:	set	0
4834                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4836                     ; 1937   RTC->WPR = 0xCA;
4838  0001 35ca5159      	mov	20825,#202
4839                     ; 1938   RTC->WPR = 0x53;
4841  0005 35535159      	mov	20825,#83
4842                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4844  0009 c6516d        	ld	a,20845
4845  000c a4f8          	and	a,#248
4846  000e c7516d        	ld	20845,a
4847                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4849  0011 c6516d        	ld	a,20845
4850  0014 1a01          	or	a,(OFST+1,sp)
4851  0016 c7516d        	ld	20845,a
4852                     ; 1947   RTC->WPR = 0xFF; 
4854  0019 35ff5159      	mov	20825,#255
4855                     ; 1948 }
4858  001d 84            	pop	a
4859  001e 81            	ret	
4942                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4942                     ; 1959 {
4943                     .text:	section	.text,new
4944  0000               _RTC_TamperPinsPrechargeDuration:
4946  0000 88            	push	a
4947       00000000      OFST:	set	0
4950                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4952                     ; 1964   RTC->WPR = 0xCA;
4954  0001 35ca5159      	mov	20825,#202
4955                     ; 1965   RTC->WPR = 0x53;
4957  0005 35535159      	mov	20825,#83
4958                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4960  0009 c6516d        	ld	a,20845
4961  000c a41f          	and	a,#31
4962  000e c7516d        	ld	20845,a
4963                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4965  0011 c6516d        	ld	a,20845
4966  0014 1a01          	or	a,(OFST+1,sp)
4967  0016 c7516d        	ld	20845,a
4968                     ; 1974   RTC->WPR = 0xFF; 
4970  0019 35ff5159      	mov	20825,#255
4971                     ; 1975 }
4974  001d 84            	pop	a
4975  001e 81            	ret	
5020                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5020                     ; 1988                    FunctionalState NewState)
5020                     ; 1989 {
5021                     .text:	section	.text,new
5022  0000               _RTC_TamperCmd:
5024  0000 89            	pushw	x
5025       00000000      OFST:	set	0
5028                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5030                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
5032                     ; 1996   RTC->WPR = 0xCA;
5034  0001 35ca5159      	mov	20825,#202
5035                     ; 1997   RTC->WPR = 0x53;
5037  0005 35535159      	mov	20825,#83
5038                     ; 2000   if (NewState != DISABLE)
5040  0009 9f            	ld	a,xl
5041  000a 4d            	tnz	a
5042  000b 2706          	jreq	L1342
5043                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5045  000d 9e            	ld	a,xh
5046  000e ca516c        	or	a,20844
5048  0011 2006          	jra	L3342
5049  0013               L1342:
5050                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5052  0013 7b01          	ld	a,(OFST+1,sp)
5053  0015 43            	cpl	a
5054  0016 c4516c        	and	a,20844
5055  0019               L3342:
5056  0019 c7516c        	ld	20844,a
5057                     ; 2013   RTC->WPR = 0xFF; 
5059  001c 35ff5159      	mov	20825,#255
5060                     ; 2014 }
5063  0020 85            	popw	x
5064  0021 81            	ret	
5136                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5136                     ; 2059 {
5137                     .text:	section	.text,new
5138  0000               _RTC_ITConfig:
5140  0000 89            	pushw	x
5141       00000000      OFST:	set	0
5144                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5146                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5148                     ; 2065   RTC->WPR = 0xCA;
5150  0001 35ca5159      	mov	20825,#202
5151                     ; 2066   RTC->WPR = 0x53;
5153  0005 35535159      	mov	20825,#83
5154                     ; 2068   if (NewState != DISABLE)
5156  0009 7b05          	ld	a,(OFST+5,sp)
5157  000b 2712          	jreq	L1742
5158                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5160  000d 9f            	ld	a,xl
5161  000e a4f0          	and	a,#240
5162  0010 ca5149        	or	a,20809
5163  0013 c75149        	ld	20809,a
5164                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5166  0016 7b02          	ld	a,(OFST+2,sp)
5167  0018 a401          	and	a,#1
5168  001a ca516c        	or	a,20844
5170  001d 2013          	jra	L3742
5171  001f               L1742:
5172                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5174  001f 7b02          	ld	a,(OFST+2,sp)
5175  0021 a4f0          	and	a,#240
5176  0023 43            	cpl	a
5177  0024 c45149        	and	a,20809
5178  0027 c75149        	ld	20809,a
5179                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5181  002a 7b02          	ld	a,(OFST+2,sp)
5182  002c a401          	and	a,#1
5183  002e 43            	cpl	a
5184  002f c4516c        	and	a,20844
5185  0032               L3742:
5186  0032 c7516c        	ld	20844,a
5187                     ; 2082   RTC->WPR = 0xFF; 
5189  0035 35ff5159      	mov	20825,#255
5190                     ; 2083 }
5193  0039 85            	popw	x
5194  003a 81            	ret	
5368                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5368                     ; 2091 {
5369                     .text:	section	.text,new
5370  0000               _RTC_GetFlagStatus:
5372  0000 89            	pushw	x
5373  0001 5203          	subw	sp,#3
5374       00000003      OFST:	set	3
5377                     ; 2092   FlagStatus flagstatus = RESET;
5379                     ; 2093   uint16_t tmpreg1 = 0;
5381                     ; 2094   uint16_t tmpreg2 = 0;
5383                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5385                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5387  0003 c6514c        	ld	a,20812
5388  0006 97            	ld	xl,a
5389  0007 4f            	clr	a
5390  0008 02            	rlwa	x,a
5391  0009 1f02          	ldw	(OFST-1,sp),x
5392                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5394  000b c6514d        	ld	a,20813
5395  000e 5f            	clrw	x
5396  000f 97            	ld	xl,a
5397  0010 01            	rrwa	x,a
5398  0011 1a03          	or	a,(OFST+0,sp)
5399  0013 01            	rrwa	x,a
5400  0014 1a02          	or	a,(OFST-1,sp)
5401  0016 01            	rrwa	x,a
5402  0017 1f02          	ldw	(OFST-1,sp),x
5403                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5405  0019 01            	rrwa	x,a
5406  001a 1405          	and	a,(OFST+2,sp)
5407  001c 01            	rrwa	x,a
5408  001d 1404          	and	a,(OFST+1,sp)
5409  001f 01            	rrwa	x,a
5410  0020 5d            	tnzw	x
5411  0021 2704          	jreq	L3752
5412                     ; 2106     flagstatus = SET;
5414  0023 a601          	ld	a,#1
5416  0025 2001          	jra	L5752
5417  0027               L3752:
5418                     ; 2110     flagstatus = RESET;
5420  0027 4f            	clr	a
5421  0028               L5752:
5422                     ; 2112   return (FlagStatus)flagstatus;
5426  0028 5b05          	addw	sp,#5
5427  002a 81            	ret	
5462                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5462                     ; 2123 {
5463                     .text:	section	.text,new
5464  0000               _RTC_ClearFlag:
5466  0000 89            	pushw	x
5467       00000000      OFST:	set	0
5470                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5472                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5474  0001 9f            	ld	a,xl
5475  0002 43            	cpl	a
5476  0003 c7514d        	ld	20813,a
5477                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5479  0006 7b01          	ld	a,(OFST+1,sp)
5480  0008 43            	cpl	a
5481  0009 a47f          	and	a,#127
5482  000b c7514c        	ld	20812,a
5483                     ; 2130 }
5486  000e 85            	popw	x
5487  000f 81            	ret	
5551                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5551                     ; 2139 {
5552                     .text:	section	.text,new
5553  0000               _RTC_GetITStatus:
5555  0000 89            	pushw	x
5556  0001 89            	pushw	x
5557       00000002      OFST:	set	2
5560                     ; 2140   ITStatus itstatus = RESET;
5562                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5566                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5568                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5570  0002 c65149        	ld	a,20809
5571  0005 1404          	and	a,(OFST+2,sp)
5572  0007 6b01          	ld	(OFST-1,sp),a
5573                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5575  0009 1e03          	ldw	x,(OFST+1,sp)
5576  000b 54            	srlw	x
5577  000c 54            	srlw	x
5578  000d 54            	srlw	x
5579  000e 54            	srlw	x
5580  000f 9f            	ld	a,xl
5581  0010 c4514d        	and	a,20813
5582  0013 6b02          	ld	(OFST+0,sp),a
5583                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5585  0015 7b01          	ld	a,(OFST-1,sp)
5586  0017 2708          	jreq	L7462
5588  0019 7b02          	ld	a,(OFST+0,sp)
5589  001b 2704          	jreq	L7462
5590                     ; 2155     itstatus = SET;
5592  001d a601          	ld	a,#1
5594  001f 2001          	jra	L1562
5595  0021               L7462:
5596                     ; 2159     itstatus = RESET;
5598  0021 4f            	clr	a
5599  0022               L1562:
5600                     ; 2162   return (ITStatus)itstatus;
5604  0022 5b04          	addw	sp,#4
5605  0024 81            	ret	
5641                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5641                     ; 2173 {
5642                     .text:	section	.text,new
5643  0000               _RTC_ClearITPendingBit:
5647                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5649                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5651  0000 54            	srlw	x
5652  0001 54            	srlw	x
5653  0002 54            	srlw	x
5654  0003 54            	srlw	x
5655  0004 9f            	ld	a,xl
5656  0005 43            	cpl	a
5657  0006 c7514d        	ld	20813,a
5658                     ; 2179 }
5661  0009 81            	ret	
5704                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5704                     ; 2203 {
5705                     .text:	section	.text,new
5706  0000               L3_ByteToBcd2:
5708  0000 88            	push	a
5709  0001 88            	push	a
5710       00000001      OFST:	set	1
5713                     ; 2204   uint8_t bcdhigh = 0;
5715  0002 0f01          	clr	(OFST+0,sp)
5717  0004 7b02          	ld	a,(OFST+1,sp)
5718  0006 2006          	jra	L7172
5719  0008               L3172:
5720                     ; 2208     bcdhigh++;
5722  0008 0c01          	inc	(OFST+0,sp)
5723                     ; 2209     Value -= 10;
5725  000a a00a          	sub	a,#10
5726  000c 6b02          	ld	(OFST+1,sp),a
5727  000e               L7172:
5728                     ; 2206   while (Value >= 10)
5730  000e a10a          	cp	a,#10
5731  0010 24f6          	jruge	L3172
5732                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5734  0012 7b01          	ld	a,(OFST+0,sp)
5735  0014 97            	ld	xl,a
5736  0015 a610          	ld	a,#16
5737  0017 42            	mul	x,a
5738  0018 9f            	ld	a,xl
5739  0019 1a02          	or	a,(OFST+1,sp)
5742  001b 85            	popw	x
5743  001c 81            	ret	
5786                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5786                     ; 2221 {
5787                     .text:	section	.text,new
5788  0000               L5_Bcd2ToByte:
5790  0000 88            	push	a
5791  0001 88            	push	a
5792       00000001      OFST:	set	1
5795                     ; 2222   uint8_t tmp = 0;
5797  0002 0f01          	clr	(OFST+0,sp)
5798                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5800  0004 4e            	swap	a
5801  0005 a40f          	and	a,#15
5802  0007 97            	ld	xl,a
5803  0008 a60a          	ld	a,#10
5804  000a 42            	mul	x,a
5805  000b 9f            	ld	a,xl
5806  000c 6b01          	ld	(OFST+0,sp),a
5807                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5809  000e 7b02          	ld	a,(OFST+1,sp)
5810  0010 a40f          	and	a,#15
5811  0012 1b01          	add	a,(OFST+0,sp)
5814  0014 85            	popw	x
5815  0015 81            	ret	
5828                     	xdef	_RTC_ClearITPendingBit
5829                     	xdef	_RTC_GetITStatus
5830                     	xdef	_RTC_ClearFlag
5831                     	xdef	_RTC_GetFlagStatus
5832                     	xdef	_RTC_ITConfig
5833                     	xdef	_RTC_TamperCmd
5834                     	xdef	_RTC_TamperPinsPrechargeDuration
5835                     	xdef	_RTC_TamperSamplingFreqConfig
5836                     	xdef	_RTC_TamperFilterConfig
5837                     	xdef	_RTC_TamperLevelConfig
5838                     	xdef	_RTC_CalibOutputCmd
5839                     	xdef	_RTC_CalibOutputConfig
5840                     	xdef	_RTC_SmoothCalibConfig
5841                     	xdef	_RTC_SynchroShiftConfig
5842                     	xdef	_RTC_OutputConfig
5843                     	xdef	_RTC_GetStoreOperation
5844                     	xdef	_RTC_DayLightSavingConfig
5845                     	xdef	_RTC_WakeUpCmd
5846                     	xdef	_RTC_GetWakeUpCounter
5847                     	xdef	_RTC_SetWakeUpCounter
5848                     	xdef	_RTC_WakeUpClockConfig
5849                     	xdef	_RTC_AlarmSubSecondConfig
5850                     	xdef	_RTC_AlarmCmd
5851                     	xdef	_RTC_GetAlarm
5852                     	xdef	_RTC_AlarmStructInit
5853                     	xdef	_RTC_SetAlarm
5854                     	xdef	_RTC_GetDate
5855                     	xdef	_RTC_DateStructInit
5856                     	xdef	_RTC_SetDate
5857                     	xdef	_RTC_GetSubSecond
5858                     	xdef	_RTC_GetTime
5859                     	xdef	_RTC_TimeStructInit
5860                     	xdef	_RTC_SetTime
5861                     	xdef	_RTC_BypassShadowCmd
5862                     	xdef	_RTC_RatioCmd
5863                     	xdef	_RTC_WaitForSynchro
5864                     	xdef	_RTC_ExitInitMode
5865                     	xdef	_RTC_EnterInitMode
5866                     	xdef	_RTC_WriteProtectionCmd
5867                     	xdef	_RTC_StructInit
5868                     	xdef	_RTC_Init
5869                     	xdef	_RTC_DeInit
5888                     	end
