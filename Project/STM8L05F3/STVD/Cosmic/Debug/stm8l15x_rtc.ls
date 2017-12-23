   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  82                     ; 232 ErrorStatus RTC_DeInit(void)
  82                     ; 233 {
  83                     .text:	section	.text,new
  84  0000               f_RTC_DeInit:
  86  0000 5205          	subw	sp,#5
  87       00000005      OFST:	set	5
  90                     ; 234   ErrorStatus status = ERROR;
  92                     ; 235   uint16_t wutwfcount = 0;
  94  0002 5f            	clrw	x
  95  0003 1f02          	ldw	(OFST-3,sp),x
  96                     ; 236   uint16_t recalpfcount = 0;
  98  0005 1f04          	ldw	(OFST-1,sp),x
  99                     ; 239   RTC->WPR = 0xCA;
 101  0007 35ca5159      	mov	20825,#202
 102                     ; 240   RTC->WPR = 0x53;
 104  000b 35535159      	mov	20825,#83
 105                     ; 243   if (RTC_EnterInitMode() == ERROR)
 107  000f 8d000000      	callf	f_RTC_EnterInitMode
 109  0013 4d            	tnz	a
 110  0014 260b          	jrne	L74
 111                     ; 245     status = ERROR;
 113  0016               LC002:
 115  0016 6b01          	ld	(OFST-4,sp),a
 116                     ; 247     RTC->WPR = 0xFF; 
 119  0018               L15:
 122  0018 35ff5159      	mov	20825,#255
 123                     ; 343   return (ErrorStatus)status;
 125  001c 7b01          	ld	a,(OFST-4,sp)
 128  001e 5b05          	addw	sp,#5
 129  0020 87            	retf	
 130  0021               L74:
 131                     ; 252     RTC->TR1 = RTC_TR1_RESET_VALUE;
 133  0021 725f5140      	clr	20800
 134                     ; 253     RTC->TR2 = RTC_TR2_RESET_VALUE;
 136  0025 725f5141      	clr	20801
 137                     ; 254     RTC->TR3 = RTC_TR3_RESET_VALUE;
 139  0029 725f5142      	clr	20802
 140                     ; 257     RTC->DR1 = RTC_DR1_RESET_VALUE;
 142  002d 35015144      	mov	20804,#1
 143                     ; 258     RTC->DR2 = RTC_DR2_RESET_VALUE;
 145  0031 35215145      	mov	20805,#33
 146                     ; 259     RTC->DR3 = RTC_DR3_RESET_VALUE;
 148  0035 725f5146      	clr	20806
 149                     ; 262     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 151  0039 725f5150      	clr	20816
 152                     ; 263     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 154  003d 35ff5151      	mov	20817,#255
 155                     ; 264     RTC->APRER  = RTC_APRER_RESET_VALUE;
 157  0041 357f5152      	mov	20818,#127
 158                     ; 266     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 160  0045 725f516c      	clr	20844
 161                     ; 267     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 163  0049 725f516d      	clr	20845
 164                     ; 271     RTC->CR1 = RTC_CR1_RESET_VALUE;
 166  004d 725f5148      	clr	20808
 167                     ; 272     RTC->CR2 = RTC_CR2_RESET_VALUE;
 169  0051 725f5149      	clr	20809
 170                     ; 273     RTC->CR3 = RTC_CR3_RESET_VALUE;
 172  0055 725f514a      	clr	20810
 174  0059 2007          	jra	L75
 175  005b               L35:
 176                     ; 278       wutwfcount++;
 178  005b 5c            	incw	x
 179  005c 1f02          	ldw	(OFST-3,sp),x
 180                     ; 279       RTC->ISR1 = 0;
 182  005e 725f514c      	clr	20812
 183  0062               L75:
 184                     ; 276     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 186  0062 7204514c07    	btjt	20812,#2,L36
 188  0067 1e02          	ldw	x,(OFST-3,sp)
 189  0069 a3ffff        	cpw	x,#65535
 190  006c 26ed          	jrne	L35
 191  006e               L36:
 192                     ; 282     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 194  006e 7204514c02    	btjt	20812,#2,L56
 195                     ; 284       status = ERROR;
 196                     ; 286       RTC->WPR = 0xFF; 
 198  0073 2064          	jpf	L301
 199  0075               L56:
 200                     ; 291       RTC->CR1 = RTC_CR1_RESET_VALUE;
 202  0075 725f5148      	clr	20808
 203                     ; 294       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 205  0079 35ff5154      	mov	20820,#255
 206                     ; 295       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 208  007d 35ff5155      	mov	20821,#255
 209                     ; 298       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 211  0081 725f515c      	clr	20828
 212                     ; 299       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 214  0085 725f515d      	clr	20829
 215                     ; 300       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 217  0089 725f515e      	clr	20830
 218                     ; 301       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 220  008d 725f515f      	clr	20831
 221                     ; 303       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 223  0091 725f5164      	clr	20836
 224                     ; 304       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 226  0095 725f5165      	clr	20837
 227                     ; 305       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 229  0099 725f5166      	clr	20838
 230                     ; 308       RTC->ISR1 = (uint8_t)0x00;
 232  009d 725f514c      	clr	20812
 233                     ; 309       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 235  00a1 725f514d      	clr	20813
 236                     ; 311       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 238  00a5 7203514c11    	btjf	20812,#1,L17
 240  00aa 2003          	jra	L57
 241  00ac               L37:
 242                     ; 315           recalpfcount++;
 244  00ac 5c            	incw	x
 245  00ad 1f04          	ldw	(OFST-1,sp),x
 246  00af               L57:
 247                     ; 313         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 249  00af 7203514c07    	btjf	20812,#1,L17
 251  00b4 1e04          	ldw	x,(OFST-1,sp)
 252  00b6 a3ffff        	cpw	x,#65535
 253  00b9 26f1          	jrne	L37
 254  00bb               L17:
 255                     ; 318       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 257  00bb 7202514c19    	btjt	20812,#1,L301
 258                     ; 320         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 260  00c0 725f516a      	clr	20842
 261                     ; 321         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 263  00c4 725f516b      	clr	20843
 264                     ; 323         if (RTC_WaitForSynchro() == ERROR)
 266  00c8 8d000000      	callf	f_RTC_WaitForSynchro
 268  00cc 4d            	tnz	a
 269                     ; 325           status = ERROR;
 271  00cd 2604ac160016  	jreq	LC002
 272                     ; 329           status = SUCCESS;
 274  00d3 a601          	ld	a,#1
 275  00d5 ac160016      	jpf	LC002
 276  00d9               L301:
 277                     ; 334         status = ERROR;
 280  00d9 0f01          	clr	(OFST-4,sp)
 281                     ; 338       RTC->WPR = 0xFF; 
 282  00db ac180018      	jra	L15
 381                     ; 359 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 381                     ; 360 {
 382                     .text:	section	.text,new
 383  0000               f_RTC_Init:
 385  0000 89            	pushw	x
 386  0001 88            	push	a
 387       00000001      OFST:	set	1
 390                     ; 361   ErrorStatus status = ERROR;
 392  0002 0f01          	clr	(OFST+0,sp)
 393                     ; 364   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 395                     ; 365   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 397                     ; 366   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 399                     ; 369   RTC->WPR = 0xCA;
 401  0004 35ca5159      	mov	20825,#202
 402                     ; 370   RTC->WPR = 0x53;
 404  0008 35535159      	mov	20825,#83
 405                     ; 373   if (RTC_EnterInitMode() == ERROR)
 407  000c 8d000000      	callf	f_RTC_EnterInitMode
 409  0010 4d            	tnz	a
 410                     ; 375     status = ERROR;
 413  0011 2727          	jreq	L561
 414                     ; 380     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 416  0013 721d5148      	bres	20808,#6
 417                     ; 383     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 419  0017 1e02          	ldw	x,(OFST+1,sp)
 420  0019 c65148        	ld	a,20808
 421  001c fa            	or	a,(x)
 422  001d c75148        	ld	20808,a
 423                     ; 386     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 425  0020 ee02          	ldw	x,(2,x)
 426  0022 4f            	clr	a
 427  0023 01            	rrwa	x,a
 428  0024 9f            	ld	a,xl
 429  0025 c75150        	ld	20816,a
 430                     ; 387     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 432  0028 1e02          	ldw	x,(OFST+1,sp)
 433  002a e603          	ld	a,(3,x)
 434  002c c75151        	ld	20817,a
 435                     ; 388     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 437  002f e601          	ld	a,(1,x)
 438  0031 c75152        	ld	20818,a
 439                     ; 391     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 441  0034 721f514c      	bres	20812,#7
 442                     ; 393     status = SUCCESS;
 444  0038 a601          	ld	a,#1
 445  003a               L561:
 446                     ; 397   RTC->WPR = 0xFF; 
 448  003a 35ff5159      	mov	20825,#255
 449                     ; 400   return (ErrorStatus)(status);
 453  003e 5b03          	addw	sp,#3
 454  0040 87            	retf	
 490                     ; 410 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 490                     ; 411 {
 491                     .text:	section	.text,new
 492  0000               f_RTC_StructInit:
 496                     ; 413   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 498  0000 7f            	clr	(x)
 499                     ; 416   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 501  0001 a67f          	ld	a,#127
 502  0003 e701          	ld	(1,x),a
 503                     ; 419   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 505  0005 90ae00ff      	ldw	y,#255
 506  0009 ef02          	ldw	(2,x),y
 507                     ; 420 }
 510  000b 87            	retf	
 565                     ; 430 void RTC_WriteProtectionCmd(FunctionalState NewState)
 565                     ; 431 {
 566                     .text:	section	.text,new
 567  0000               f_RTC_WriteProtectionCmd:
 571                     ; 433   assert_param(IS_FUNCTIONAL_STATE(NewState));
 573                     ; 435   if (NewState != DISABLE)
 575  0000 4d            	tnz	a
 576  0001 2705          	jreq	L532
 577                     ; 438     RTC->WPR = RTC_WPR_EnableKey;
 579  0003 35ff5159      	mov	20825,#255
 582  0007 87            	retf	
 583  0008               L532:
 584                     ; 443     RTC->WPR = RTC_WPR_DisableKey1;
 586  0008 35ca5159      	mov	20825,#202
 587                     ; 444     RTC->WPR = RTC_WPR_DisableKey2;
 589  000c 35535159      	mov	20825,#83
 590                     ; 446 }
 593  0010 87            	retf	
 635                     ; 458 ErrorStatus RTC_EnterInitMode(void)
 635                     ; 459 {
 636                     .text:	section	.text,new
 637  0000               f_RTC_EnterInitMode:
 639  0000 5203          	subw	sp,#3
 640       00000003      OFST:	set	3
 643                     ; 460   ErrorStatus status = ERROR;
 645                     ; 461   uint16_t initfcount = 0;
 647  0002 5f            	clrw	x
 648  0003 1f02          	ldw	(OFST-1,sp),x
 649                     ; 464   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 651  0005 720c514c13    	btjt	20812,#6,L162
 652                     ; 467     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 654  000a 3580514c      	mov	20812,#128
 656  000e 2003          	jra	L762
 657  0010               L362:
 658                     ; 472       initfcount++;
 660  0010 5c            	incw	x
 661  0011 1f02          	ldw	(OFST-1,sp),x
 662  0013               L762:
 663                     ; 470     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 665  0013 720c514c05    	btjt	20812,#6,L162
 667  0018 a3ffff        	cpw	x,#65535
 668  001b 26f3          	jrne	L362
 669  001d               L162:
 670                     ; 476   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 672  001d 720c514c03    	btjt	20812,#6,L572
 673                     ; 478     status = ERROR;
 675  0022 4f            	clr	a
 677  0023 2002          	jra	L772
 678  0025               L572:
 679                     ; 482     status = SUCCESS;
 681  0025 a601          	ld	a,#1
 682  0027               L772:
 683                     ; 485   return (ErrorStatus)status;
 687  0027 5b03          	addw	sp,#3
 688  0029 87            	retf	
 710                     ; 498 void RTC_ExitInitMode(void)
 710                     ; 499 {
 711                     .text:	section	.text,new
 712  0000               f_RTC_ExitInitMode:
 716                     ; 501   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 718  0000 721f514c      	bres	20812,#7
 719                     ; 502 }
 722  0004 87            	retf	
 764                     ; 527 ErrorStatus RTC_WaitForSynchro(void)
 764                     ; 528 {
 765                     .text:	section	.text,new
 766  0000               f_RTC_WaitForSynchro:
 768  0000 5203          	subw	sp,#3
 769       00000003      OFST:	set	3
 772                     ; 529   uint16_t rsfcount = 0;
 774  0002 5f            	clrw	x
 775  0003 1f02          	ldw	(OFST-1,sp),x
 776                     ; 530   ErrorStatus status = ERROR;
 778  0005 7b01          	ld	a,(OFST-2,sp)
 779  0007 97            	ld	xl,a
 780                     ; 533   RTC->WPR = 0xCA;
 782  0008 35ca5159      	mov	20825,#202
 783                     ; 534   RTC->WPR = 0x53;
 785  000c 35535159      	mov	20825,#83
 786                     ; 537   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 788  0010 c6514c        	ld	a,20812
 789  0013 a45f          	and	a,#95
 790  0015 c7514c        	ld	20812,a
 792  0018 2003          	jra	L333
 793  001a               L133:
 794                     ; 542     rsfcount++;
 796  001a 5c            	incw	x
 797  001b 1f02          	ldw	(OFST-1,sp),x
 798  001d               L333:
 799                     ; 540   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 801  001d 720a514c07    	btjt	20812,#5,L733
 803  0022 1e02          	ldw	x,(OFST-1,sp)
 804  0024 a3ffff        	cpw	x,#65535
 805  0027 26f1          	jrne	L133
 806  0029               L733:
 807                     ; 546   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 809  0029 720b514c06    	btjf	20812,#5,L143
 810                     ; 548     status = SUCCESS;
 812  002e a601          	ld	a,#1
 813  0030 6b01          	ld	(OFST-2,sp),a
 815  0032 2002          	jra	L343
 816  0034               L143:
 817                     ; 552     status = ERROR;
 819  0034 0f01          	clr	(OFST-2,sp)
 820  0036               L343:
 821                     ; 556   RTC->WPR = 0xFF; 
 823  0036 35ff5159      	mov	20825,#255
 824                     ; 558   return (ErrorStatus)status;
 826  003a 7b01          	ld	a,(OFST-2,sp)
 829  003c 5b03          	addw	sp,#3
 830  003e 87            	retf	
 864                     ; 568 void RTC_RatioCmd(FunctionalState NewState)
 864                     ; 569 {
 865                     .text:	section	.text,new
 866  0000               f_RTC_RatioCmd:
 870                     ; 571   assert_param(IS_FUNCTIONAL_STATE(NewState));
 872                     ; 574   RTC->WPR = 0xCA;
 874  0000 35ca5159      	mov	20825,#202
 875                     ; 575   RTC->WPR = 0x53;
 877  0004 35535159      	mov	20825,#83
 878                     ; 577   if (NewState != DISABLE)
 880  0008 4d            	tnz	a
 881  0009 2706          	jreq	L363
 882                     ; 580     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 884  000b 721a5148      	bset	20808,#5
 886  000f 2004          	jra	L563
 887  0011               L363:
 888                     ; 585     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 890  0011 721b5148      	bres	20808,#5
 891  0015               L563:
 892                     ; 589   RTC->WPR = 0xFF; 
 894  0015 35ff5159      	mov	20825,#255
 895                     ; 590 }
 898  0019 87            	retf	
 933                     ; 598 void RTC_BypassShadowCmd(FunctionalState NewState)
 933                     ; 599 {
 934                     .text:	section	.text,new
 935  0000               f_RTC_BypassShadowCmd:
 939                     ; 601   assert_param(IS_FUNCTIONAL_STATE(NewState));
 941                     ; 604   RTC->WPR = 0xCA;
 943  0000 35ca5159      	mov	20825,#202
 944                     ; 605   RTC->WPR = 0x53;
 946  0004 35535159      	mov	20825,#83
 947                     ; 607   if (NewState != DISABLE)
 949  0008 4d            	tnz	a
 950  0009 2706          	jreq	L504
 951                     ; 610     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 953  000b 72185148      	bset	20808,#4
 955  000f 2004          	jra	L704
 956  0011               L504:
 957                     ; 615     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 959  0011 72195148      	bres	20808,#4
 960  0015               L704:
 961                     ; 619   RTC->WPR = 0xFF; 
 963  0015 35ff5159      	mov	20825,#255
 964                     ; 620 }
 967  0019 87            	retf	
1112                     ; 659 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1112                     ; 660                         RTC_TimeTypeDef* RTC_TimeStruct)
1112                     ; 661 {
1113                     .text:	section	.text,new
1114  0000               f_RTC_SetTime:
1116  0000 88            	push	a
1117  0001 88            	push	a
1118       00000001      OFST:	set	1
1121                     ; 662   ErrorStatus status = ERROR;
1123                     ; 663   uint8_t temp = 0;
1125                     ; 666   assert_param(IS_RTC_FORMAT(RTC_Format));
1127                     ; 668   if (RTC_Format == RTC_Format_BIN)
1129  0002 0d02          	tnz	(OFST+1,sp)
1130                     ; 671     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1131                     ; 673       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1133                     ; 674       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1136                     ; 678       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1138                     ; 680     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1140                     ; 681     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1143                     ; 686     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1145                     ; 688       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1147                     ; 689       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1151  0004 c65148        	ld	a,20808
1152  0007 a540          	bcp	a,#64
1153                     ; 693       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1155                     ; 695     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1157                     ; 696     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1159                     ; 701   RTC->WPR = 0xCA;
1161  0009 35ca5159      	mov	20825,#202
1162                     ; 702   RTC->WPR = 0x53;
1164  000d 35535159      	mov	20825,#83
1165                     ; 705   if (RTC_EnterInitMode() == ERROR)
1167  0011 8d000000      	callf	f_RTC_EnterInitMode
1169  0015 4d            	tnz	a
1170  0016 2606          	jrne	L515
1171                     ; 707     status = ERROR;
1173                     ; 709     RTC->WPR = 0xFF; 
1175  0018 35ff5159      	mov	20825,#255
1177  001c 205d          	jra	L715
1178  001e               L515:
1179                     ; 714     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1181  001e 720d514808    	btjf	20808,#6,L125
1182                     ; 716       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1184                     ; 717       temp = RTC_TimeStruct->RTC_H12;
1186  0023 1e06          	ldw	x,(OFST+5,sp)
1187  0025 e603          	ld	a,(3,x)
1188  0027 6b01          	ld	(OFST+0,sp),a
1190  0029 2002          	jra	L325
1191  002b               L125:
1192                     ; 721       temp = 0;
1194  002b 0f01          	clr	(OFST+0,sp)
1195  002d               L325:
1196                     ; 724     if (RTC_Format != RTC_Format_BIN)
1198  002d 7b02          	ld	a,(OFST+1,sp)
1199  002f 270f          	jreq	L525
1200                     ; 726       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1202  0031 1e06          	ldw	x,(OFST+5,sp)
1203  0033 e602          	ld	a,(2,x)
1204  0035 c75140        	ld	20800,a
1205                     ; 727       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1207  0038 e601          	ld	a,(1,x)
1208  003a c75141        	ld	20801,a
1209                     ; 728       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1211  003d f6            	ld	a,(x)
1213  003e 201d          	jra	L725
1214  0040               L525:
1215                     ; 732       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1217  0040 1e06          	ldw	x,(OFST+5,sp)
1218  0042 e602          	ld	a,(2,x)
1219  0044 8d000000      	callf	L3f_ByteToBcd2
1221  0048 c75140        	ld	20800,a
1222                     ; 733       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1224  004b 1e06          	ldw	x,(OFST+5,sp)
1225  004d e601          	ld	a,(1,x)
1226  004f 8d000000      	callf	L3f_ByteToBcd2
1228  0053 c75141        	ld	20801,a
1229                     ; 734       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1231  0056 1e06          	ldw	x,(OFST+5,sp)
1232  0058 f6            	ld	a,(x)
1233  0059 8d000000      	callf	L3f_ByteToBcd2
1235  005d               L725:
1236  005d 1a01          	or	a,(OFST+0,sp)
1237  005f c75142        	ld	20802,a
1238                     ; 737     (void)(RTC->DR3);
1240  0062 c65146        	ld	a,20806
1241                     ; 740     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1243  0065 721f514c      	bres	20812,#7
1244                     ; 743     RTC->WPR = 0xFF; 
1246  0069 35ff5159      	mov	20825,#255
1247                     ; 746     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1249  006d 7208514807    	btjt	20808,#4,L135
1250                     ; 748       if (RTC_WaitForSynchro() == ERROR)
1252  0072 8d000000      	callf	f_RTC_WaitForSynchro
1254  0076 4d            	tnz	a
1255                     ; 750         status = ERROR;
1258  0077 2702          	jreq	L715
1259                     ; 754         status = SUCCESS;
1260  0079               L135:
1261                     ; 759       status = SUCCESS;
1264  0079 a601          	ld	a,#1
1265  007b               L715:
1266                     ; 763   return (ErrorStatus)status;
1270  007b 85            	popw	x
1271  007c 87            	retf	
1307                     ; 775 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1307                     ; 776 {
1308                     .text:	section	.text,new
1309  0000               f_RTC_TimeStructInit:
1313                     ; 778   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1315  0000 6f03          	clr	(3,x)
1316                     ; 779   RTC_TimeStruct->RTC_Hours = 0;
1318  0002 7f            	clr	(x)
1319                     ; 780   RTC_TimeStruct->RTC_Minutes = 0;
1321  0003 6f01          	clr	(1,x)
1322                     ; 781   RTC_TimeStruct->RTC_Seconds = 0;
1324  0005 6f02          	clr	(2,x)
1325                     ; 782 }
1328  0007 87            	retf	
1382                     ; 798 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1382                     ; 799                  RTC_TimeTypeDef* RTC_TimeStruct)
1382                     ; 800 {
1383                     .text:	section	.text,new
1384  0000               f_RTC_GetTime:
1386  0000 88            	push	a
1387  0001 88            	push	a
1388       00000001      OFST:	set	1
1391                     ; 801   uint8_t  tmpreg = 0;
1393  0002 0f01          	clr	(OFST+0,sp)
1394                     ; 804   assert_param(IS_RTC_FORMAT(RTC_Format));
1396                     ; 808   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1398  0004 1e06          	ldw	x,(OFST+5,sp)
1399  0006 c65140        	ld	a,20800
1400  0009 e702          	ld	(2,x),a
1401                     ; 811   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1403  000b c65141        	ld	a,20801
1404  000e e701          	ld	(1,x),a
1405                     ; 814   tmpreg = (uint8_t)RTC->TR3;
1407  0010 c65142        	ld	a,20802
1408  0013 6b01          	ld	(OFST+0,sp),a
1409                     ; 817   (void) (RTC->DR3) ;
1411  0015 c65146        	ld	a,20806
1412                     ; 821   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1414  0018 7b01          	ld	a,(OFST+0,sp)
1415  001a a4bf          	and	a,#191
1416  001c f7            	ld	(x),a
1417                     ; 824   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1419  001d 7b01          	ld	a,(OFST+0,sp)
1420  001f a440          	and	a,#64
1421  0021 e703          	ld	(3,x),a
1422                     ; 827   if (RTC_Format == RTC_Format_BIN)
1424  0023 7b02          	ld	a,(OFST+1,sp)
1425  0025 261c          	jrne	L706
1426                     ; 830     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1428  0027 f6            	ld	a,(x)
1429  0028 8d000000      	callf	L5f_Bcd2ToByte
1431  002c 1e06          	ldw	x,(OFST+5,sp)
1432  002e f7            	ld	(x),a
1433                     ; 831     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1435  002f e601          	ld	a,(1,x)
1436  0031 8d000000      	callf	L5f_Bcd2ToByte
1438  0035 1e06          	ldw	x,(OFST+5,sp)
1439  0037 e701          	ld	(1,x),a
1440                     ; 832     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1442  0039 e602          	ld	a,(2,x)
1443  003b 8d000000      	callf	L5f_Bcd2ToByte
1445  003f 1e06          	ldw	x,(OFST+5,sp)
1446  0041 e702          	ld	(2,x),a
1447  0043               L706:
1448                     ; 834 }
1451  0043 85            	popw	x
1452  0044 87            	retf	
1497                     ; 845 uint16_t RTC_GetSubSecond(void)
1497                     ; 846 {
1498                     .text:	section	.text,new
1499  0000               f_RTC_GetSubSecond:
1501  0000 5206          	subw	sp,#6
1502       00000006      OFST:	set	6
1505                     ; 847   uint8_t ssrhreg = 0, ssrlreg = 0;
1509                     ; 848   uint16_t ssrreg = 0;
1511                     ; 851   ssrhreg = RTC->SSRH;
1513  0002 c65157        	ld	a,20823
1514  0005 6b03          	ld	(OFST-3,sp),a
1515                     ; 852   ssrlreg = RTC->SSRL;
1517  0007 c65158        	ld	a,20824
1518  000a 6b04          	ld	(OFST-2,sp),a
1519                     ; 855   (void) (RTC->DR3);
1521  000c c65146        	ld	a,20806
1522                     ; 858   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1524  000f 7b04          	ld	a,(OFST-2,sp)
1525  0011 5f            	clrw	x
1526  0012 97            	ld	xl,a
1527  0013 1f01          	ldw	(OFST-5,sp),x
1528  0015 7b03          	ld	a,(OFST-3,sp)
1529  0017 97            	ld	xl,a
1530  0018 7b02          	ld	a,(OFST-4,sp)
1531  001a 01            	rrwa	x,a
1532  001b 1a01          	or	a,(OFST-5,sp)
1533  001d 01            	rrwa	x,a
1534                     ; 859   return (uint16_t)(ssrreg);
1538  001e 5b06          	addw	sp,#6
1539  0020 87            	retf	
1790                     ; 876 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1790                     ; 877                         RTC_DateTypeDef* RTC_DateStruct)
1790                     ; 878 {
1791                     .text:	section	.text,new
1792  0000               f_RTC_SetDate:
1794  0000 88            	push	a
1795  0001 89            	pushw	x
1796       00000002      OFST:	set	2
1799                     ; 879   ErrorStatus status = ERROR;
1801  0002 0f02          	clr	(OFST+0,sp)
1802                     ; 881   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1804  0004 4d            	tnz	a
1805  0005 2610          	jrne	L757
1807  0007 1e07          	ldw	x,(OFST+5,sp)
1808  0009 e601          	ld	a,(1,x)
1809  000b a410          	and	a,#16
1810  000d 2708          	jreq	L757
1811                     ; 883     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1813  000f e601          	ld	a,(1,x)
1814  0011 a4ef          	and	a,#239
1815  0013 ab0a          	add	a,#10
1816  0015 e701          	ld	(1,x),a
1817  0017               L757:
1818                     ; 887   assert_param(IS_RTC_FORMAT(RTC_Format));
1820                     ; 888   if (RTC_Format == RTC_Format_BIN)
1822  0017 0d03          	tnz	(OFST+1,sp)
1823                     ; 890     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1825                     ; 891     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1827                     ; 892     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1829                     ; 893     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1831                     ; 894     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1834                     ; 898     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1836                     ; 899     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1838                     ; 900     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1840                     ; 901     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1842                     ; 902     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1844                     ; 904   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1846                     ; 907   RTC->WPR = 0xCA;
1848  0019 35ca5159      	mov	20825,#202
1849                     ; 908   RTC->WPR = 0x53;
1851  001d 35535159      	mov	20825,#83
1852                     ; 911   if (RTC_EnterInitMode() == ERROR)
1854  0021 8d000000      	callf	f_RTC_EnterInitMode
1856  0025 4d            	tnz	a
1857  0026 2606          	jrne	L567
1858                     ; 913     status = ERROR;
1860                     ; 915     RTC->WPR = 0xFF; 
1862  0028 35ff5159      	mov	20825,#255
1864  002c 2062          	jra	L767
1865  002e               L567:
1866                     ; 919     (void)(RTC->TR1);
1868  002e c65140        	ld	a,20800
1869                     ; 922     if (RTC_Format != RTC_Format_BIN)
1871  0031 7b03          	ld	a,(OFST+1,sp)
1872  0033 2718          	jreq	L177
1873                     ; 924       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1875  0035 1e07          	ldw	x,(OFST+5,sp)
1876  0037 e602          	ld	a,(2,x)
1877  0039 c75144        	ld	20804,a
1878                     ; 925       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1880  003c f6            	ld	a,(x)
1881  003d 97            	ld	xl,a
1882  003e a620          	ld	a,#32
1883  0040 42            	mul	x,a
1884  0041 9f            	ld	a,xl
1885  0042 1e07          	ldw	x,(OFST+5,sp)
1886  0044 ea01          	or	a,(1,x)
1887  0046 c75145        	ld	20805,a
1888                     ; 926       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1890  0049 e603          	ld	a,(3,x)
1892  004b 202a          	jra	L377
1893  004d               L177:
1894                     ; 930       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1896  004d 1e07          	ldw	x,(OFST+5,sp)
1897  004f e602          	ld	a,(2,x)
1898  0051 8d000000      	callf	L3f_ByteToBcd2
1900  0055 c75144        	ld	20804,a
1901                     ; 931       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1903  0058 1e07          	ldw	x,(OFST+5,sp)
1904  005a f6            	ld	a,(x)
1905  005b 97            	ld	xl,a
1906  005c a620          	ld	a,#32
1907  005e 42            	mul	x,a
1908  005f 9f            	ld	a,xl
1909  0060 6b01          	ld	(OFST-1,sp),a
1910  0062 1e07          	ldw	x,(OFST+5,sp)
1911  0064 e601          	ld	a,(1,x)
1912  0066 8d000000      	callf	L3f_ByteToBcd2
1914  006a 1a01          	or	a,(OFST-1,sp)
1915  006c c75145        	ld	20805,a
1916                     ; 932       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1918  006f 1e07          	ldw	x,(OFST+5,sp)
1919  0071 e603          	ld	a,(3,x)
1920  0073 8d000000      	callf	L3f_ByteToBcd2
1922  0077               L377:
1923  0077 c75146        	ld	20806,a
1924                     ; 936     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1926  007a 721f514c      	bres	20812,#7
1927                     ; 939     RTC->WPR = 0xFF; 
1929  007e 35ff5159      	mov	20825,#255
1930                     ; 942     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1932  0082 7208514807    	btjt	20808,#4,L577
1933                     ; 944       if (RTC_WaitForSynchro() == ERROR)
1935  0087 8d000000      	callf	f_RTC_WaitForSynchro
1937  008b 4d            	tnz	a
1938                     ; 946         status = ERROR;
1941  008c 2702          	jreq	L767
1942                     ; 950         status = SUCCESS;
1943  008e               L577:
1944                     ; 955       status = SUCCESS;
1947  008e a601          	ld	a,#1
1948  0090               L767:
1949                     ; 959   return (ErrorStatus)status;
1953  0090 5b03          	addw	sp,#3
1954  0092 87            	retf	
1990                     ; 968 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
1990                     ; 969 {
1991                     .text:	section	.text,new
1992  0000               f_RTC_DateStructInit:
1996                     ; 971   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
1998  0000 a601          	ld	a,#1
1999  0002 f7            	ld	(x),a
2000                     ; 972   RTC_DateStruct->RTC_Date = 1;
2002  0003 e702          	ld	(2,x),a
2003                     ; 973   RTC_DateStruct->RTC_Month = RTC_Month_January;
2005  0005 e701          	ld	(1,x),a
2006                     ; 974   RTC_DateStruct->RTC_Year = 0;
2008  0007 6f03          	clr	(3,x)
2009                     ; 975 }
2012  0009 87            	retf	
2066                     ; 988 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2066                     ; 989                  RTC_DateTypeDef* RTC_DateStruct)
2066                     ; 990 {
2067                     .text:	section	.text,new
2068  0000               f_RTC_GetDate:
2070  0000 88            	push	a
2071  0001 88            	push	a
2072       00000001      OFST:	set	1
2075                     ; 991   uint8_t tmpreg = 0;
2077  0002 0f01          	clr	(OFST+0,sp)
2078                     ; 994   assert_param(IS_RTC_FORMAT(RTC_Format));
2080                     ; 997   (void) (RTC->TR1) ;
2082  0004 c65140        	ld	a,20800
2083                     ; 998   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2085  0007 1e06          	ldw	x,(OFST+5,sp)
2086  0009 c65144        	ld	a,20804
2087  000c e702          	ld	(2,x),a
2088                     ; 999   tmpreg = (uint8_t)RTC->DR2;
2090  000e c65145        	ld	a,20805
2091  0011 6b01          	ld	(OFST+0,sp),a
2092                     ; 1000   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2094  0013 c65146        	ld	a,20806
2095  0016 e703          	ld	(3,x),a
2096                     ; 1003   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2098  0018 7b01          	ld	a,(OFST+0,sp)
2099  001a a41f          	and	a,#31
2100  001c e701          	ld	(1,x),a
2101                     ; 1004   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2103  001e 7b01          	ld	a,(OFST+0,sp)
2104  0020 4e            	swap	a
2105  0021 a40e          	and	a,#14
2106  0023 44            	srl	a
2107  0024 f7            	ld	(x),a
2108                     ; 1007   if (RTC_Format == RTC_Format_BIN)
2110  0025 7b02          	ld	a,(OFST+1,sp)
2111  0027 261e          	jrne	L3501
2112                     ; 1010     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2114  0029 e603          	ld	a,(3,x)
2115  002b 8d000000      	callf	L5f_Bcd2ToByte
2117  002f 1e06          	ldw	x,(OFST+5,sp)
2118  0031 e703          	ld	(3,x),a
2119                     ; 1011     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2121  0033 e601          	ld	a,(1,x)
2122  0035 8d000000      	callf	L5f_Bcd2ToByte
2124  0039 1e06          	ldw	x,(OFST+5,sp)
2125  003b e701          	ld	(1,x),a
2126                     ; 1012     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2128  003d e602          	ld	a,(2,x)
2129  003f 8d000000      	callf	L5f_Bcd2ToByte
2131  0043 1e06          	ldw	x,(OFST+5,sp)
2132  0045 e702          	ld	(2,x),a
2133  0047               L3501:
2134                     ; 1014 }
2137  0047 85            	popw	x
2138  0048 87            	retf	
2278                     ; 1044 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2278                     ; 1045                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2278                     ; 1046 {
2279                     .text:	section	.text,new
2280  0000               f_RTC_SetAlarm:
2282  0000 88            	push	a
2283  0001 5205          	subw	sp,#5
2284       00000005      OFST:	set	5
2287                     ; 1047   uint8_t tmpreg1 = 0;
2289                     ; 1048   uint8_t tmpreg2 = 0;
2291                     ; 1049   uint8_t tmpreg3 = 0;
2293                     ; 1050   uint8_t tmpreg4 = 0;
2295                     ; 1053   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2297                     ; 1054   assert_param(IS_RTC_FORMAT(RTC_Format));
2299                     ; 1055   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2301                     ; 1056   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2303                     ; 1059   if (RTC_Format == RTC_Format_BIN)
2305  0003 0d06          	tnz	(OFST+1,sp)
2306                     ; 1062     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2307                     ; 1064       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2309                     ; 1065       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2312                     ; 1069       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2314                     ; 1071     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2316                     ; 1072     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2319                     ; 1077     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2321                     ; 1079       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2323                     ; 1080       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2327  0005 c65148        	ld	a,20808
2328  0008 a540          	bcp	a,#64
2329                     ; 1084       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2331                     ; 1087     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2333                     ; 1089     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2335                     ; 1094   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2337  000a 1e0a          	ldw	x,(OFST+5,sp)
2338  000c e604          	ld	a,(4,x)
2339  000e a510          	bcp	a,#16
2340  0010 2604          	jrne	L7511
2341                     ; 1096     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2343  0012 e605          	ld	a,(5,x)
2344  0014 a140          	cp	a,#64
2345                     ; 1098       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2348  0016               L7511:
2349                     ; 1102       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2351                     ; 1103       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2353                     ; 1108   RTC->WPR = 0xCA;
2355  0016 35ca5159      	mov	20825,#202
2356                     ; 1109   RTC->WPR = 0x53;
2358  001a 35535159      	mov	20825,#83
2359                     ; 1113   if (RTC_Format != RTC_Format_BIN)
2361  001e 7b06          	ld	a,(OFST+1,sp)
2362  0020 272f          	jreq	L3611
2363                     ; 1115     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2363                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2365  0022 e604          	ld	a,(4,x)
2366  0024 a480          	and	a,#128
2367  0026 ea02          	or	a,(2,x)
2368  0028 6b02          	ld	(OFST-3,sp),a
2369                     ; 1118     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2369                     ; 1119                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2371  002a e604          	ld	a,(4,x)
2372  002c 48            	sll	a
2373  002d a480          	and	a,#128
2374  002f ea01          	or	a,(1,x)
2375  0031 6b03          	ld	(OFST-2,sp),a
2376                     ; 1121     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2376                     ; 1122                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2376                     ; 1123                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2378  0033 e604          	ld	a,(4,x)
2379  0035 48            	sll	a
2380  0036 48            	sll	a
2381  0037 a480          	and	a,#128
2382  0039 6b01          	ld	(OFST-4,sp),a
2383  003b e603          	ld	a,(3,x)
2384  003d fa            	or	a,(x)
2385  003e 1a01          	or	a,(OFST-4,sp)
2386  0040 6b04          	ld	(OFST-1,sp),a
2387                     ; 1125     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2387                     ; 1126                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2387                     ; 1127                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2389  0042 e604          	ld	a,(4,x)
2390  0044 48            	sll	a
2391  0045 48            	sll	a
2392  0046 48            	sll	a
2393  0047 a480          	and	a,#128
2394  0049 6b01          	ld	(OFST-4,sp),a
2395  004b e605          	ld	a,(5,x)
2396  004d ea06          	or	a,(6,x)
2398  004f 204d          	jra	L5611
2399  0051               L3611:
2400                     ; 1132     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2400                     ; 1133                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2402  0051 e604          	ld	a,(4,x)
2403  0053 a480          	and	a,#128
2404  0055 6b01          	ld	(OFST-4,sp),a
2405  0057 e602          	ld	a,(2,x)
2406  0059 8d000000      	callf	L3f_ByteToBcd2
2408  005d 1a01          	or	a,(OFST-4,sp)
2409  005f 6b02          	ld	(OFST-3,sp),a
2410                     ; 1135     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2410                     ; 1136                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2412  0061 1e0a          	ldw	x,(OFST+5,sp)
2413  0063 e604          	ld	a,(4,x)
2414  0065 48            	sll	a
2415  0066 a480          	and	a,#128
2416  0068 6b01          	ld	(OFST-4,sp),a
2417  006a e601          	ld	a,(1,x)
2418  006c 8d000000      	callf	L3f_ByteToBcd2
2420  0070 1a01          	or	a,(OFST-4,sp)
2421  0072 6b03          	ld	(OFST-2,sp),a
2422                     ; 1138     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2422                     ; 1139                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2422                     ; 1140                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2424  0074 1e0a          	ldw	x,(OFST+5,sp)
2425  0076 e604          	ld	a,(4,x)
2426  0078 48            	sll	a
2427  0079 48            	sll	a
2428  007a a480          	and	a,#128
2429  007c 6b01          	ld	(OFST-4,sp),a
2430  007e f6            	ld	a,(x)
2431  007f 8d000000      	callf	L3f_ByteToBcd2
2433  0083 1e0a          	ldw	x,(OFST+5,sp)
2434  0085 ea03          	or	a,(3,x)
2435  0087 1a01          	or	a,(OFST-4,sp)
2436  0089 6b04          	ld	(OFST-1,sp),a
2437                     ; 1142     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2437                     ; 1143                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2437                     ; 1144                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2439  008b e604          	ld	a,(4,x)
2440  008d 48            	sll	a
2441  008e 48            	sll	a
2442  008f 48            	sll	a
2443  0090 a480          	and	a,#128
2444  0092 6b01          	ld	(OFST-4,sp),a
2445  0094 e606          	ld	a,(6,x)
2446  0096 8d000000      	callf	L3f_ByteToBcd2
2448  009a 1e0a          	ldw	x,(OFST+5,sp)
2449  009c ea05          	or	a,(5,x)
2450  009e               L5611:
2451  009e 1a01          	or	a,(OFST-4,sp)
2452  00a0 6b05          	ld	(OFST+0,sp),a
2453                     ; 1148   RTC->ALRMAR1 = tmpreg1;
2455  00a2 7b02          	ld	a,(OFST-3,sp)
2456  00a4 c7515c        	ld	20828,a
2457                     ; 1149   RTC->ALRMAR2 = tmpreg2;
2459  00a7 7b03          	ld	a,(OFST-2,sp)
2460  00a9 c7515d        	ld	20829,a
2461                     ; 1150   RTC->ALRMAR3 = tmpreg3;
2463  00ac 7b04          	ld	a,(OFST-1,sp)
2464  00ae c7515e        	ld	20830,a
2465                     ; 1151   RTC->ALRMAR4 = tmpreg4;
2467  00b1 7b05          	ld	a,(OFST+0,sp)
2468  00b3 c7515f        	ld	20831,a
2469                     ; 1154   RTC->WPR = 0xFF; 
2471  00b6 35ff5159      	mov	20825,#255
2472                     ; 1155 }
2475  00ba 5b06          	addw	sp,#6
2476  00bc 87            	retf	
2513                     ; 1165 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2513                     ; 1166 {
2514                     .text:	section	.text,new
2515  0000               f_RTC_AlarmStructInit:
2519                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2521  0000 6f03          	clr	(3,x)
2522                     ; 1169   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2524  0002 7f            	clr	(x)
2525                     ; 1170   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2527  0003 6f01          	clr	(1,x)
2528                     ; 1171   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2530  0005 6f02          	clr	(2,x)
2531                     ; 1174   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2533  0007 6f05          	clr	(5,x)
2534                     ; 1175   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2536  0009 a601          	ld	a,#1
2537  000b e706          	ld	(6,x),a
2538                     ; 1178   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2540  000d a6f0          	ld	a,#240
2541  000f e704          	ld	(4,x),a
2542                     ; 1179 }
2545  0011 87            	retf	
2627                     ; 1188 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2627                     ; 1189                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2627                     ; 1190 {
2628                     .text:	section	.text,new
2629  0000               f_RTC_GetAlarm:
2631  0000 88            	push	a
2632  0001 5204          	subw	sp,#4
2633       00000004      OFST:	set	4
2636                     ; 1191   uint8_t tmpreg1 = 0;
2638                     ; 1192   uint8_t tmpreg2 = 0;
2640                     ; 1193   uint8_t tmpreg3 = 0;
2642                     ; 1194   uint8_t tmpreg4 = 0;
2644                     ; 1195   uint8_t alarmmask = 0;
2646                     ; 1198   assert_param(IS_RTC_FORMAT(RTC_Format));
2648                     ; 1201   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2650  0003 c6515c        	ld	a,20828
2651  0006 6b04          	ld	(OFST+0,sp),a
2652                     ; 1202   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2654  0008 c6515d        	ld	a,20829
2655  000b 6b01          	ld	(OFST-3,sp),a
2656                     ; 1203   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2658  000d c6515e        	ld	a,20830
2659  0010 6b02          	ld	(OFST-2,sp),a
2660                     ; 1204   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2662  0012 c6515f        	ld	a,20831
2663  0015 6b03          	ld	(OFST-1,sp),a
2664                     ; 1207   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2666  0017 7b04          	ld	a,(OFST+0,sp)
2667  0019 a47f          	and	a,#127
2668  001b 1e09          	ldw	x,(OFST+5,sp)
2669  001d e702          	ld	(2,x),a
2670                     ; 1208   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2672  001f 7b04          	ld	a,(OFST+0,sp)
2673  0021 a480          	and	a,#128
2674  0023 6b04          	ld	(OFST+0,sp),a
2675                     ; 1211   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2677  0025 7b01          	ld	a,(OFST-3,sp)
2678  0027 a47f          	and	a,#127
2679  0029 e701          	ld	(1,x),a
2680                     ; 1212   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2682  002b 7b01          	ld	a,(OFST-3,sp)
2683  002d a480          	and	a,#128
2684  002f 44            	srl	a
2685  0030 1a04          	or	a,(OFST+0,sp)
2686  0032 6b04          	ld	(OFST+0,sp),a
2687                     ; 1215   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2689  0034 7b02          	ld	a,(OFST-2,sp)
2690  0036 a43f          	and	a,#63
2691  0038 f7            	ld	(x),a
2692                     ; 1216   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2694  0039 7b02          	ld	a,(OFST-2,sp)
2695  003b a440          	and	a,#64
2696  003d e703          	ld	(3,x),a
2697                     ; 1217   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2699  003f 7b02          	ld	a,(OFST-2,sp)
2700  0041 a480          	and	a,#128
2701  0043 44            	srl	a
2702  0044 44            	srl	a
2703  0045 1a04          	or	a,(OFST+0,sp)
2704  0047 6b04          	ld	(OFST+0,sp),a
2705                     ; 1220   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2707  0049 7b03          	ld	a,(OFST-1,sp)
2708  004b a43f          	and	a,#63
2709  004d e706          	ld	(6,x),a
2710                     ; 1221   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2712  004f 7b03          	ld	a,(OFST-1,sp)
2713  0051 a440          	and	a,#64
2714  0053 e705          	ld	(5,x),a
2715                     ; 1222   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2717  0055 7b03          	ld	a,(OFST-1,sp)
2718  0057 a480          	and	a,#128
2719  0059 44            	srl	a
2720  005a 44            	srl	a
2721  005b 44            	srl	a
2722  005c 1a04          	or	a,(OFST+0,sp)
2723  005e 6b04          	ld	(OFST+0,sp),a
2724                     ; 1224   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2726  0060 e704          	ld	(4,x),a
2727                     ; 1226   if (RTC_Format == RTC_Format_BIN)
2729  0062 7b05          	ld	a,(OFST+1,sp)
2730  0064 2626          	jrne	L5421
2731                     ; 1228     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2733  0066 f6            	ld	a,(x)
2734  0067 8d000000      	callf	L5f_Bcd2ToByte
2736  006b 1e09          	ldw	x,(OFST+5,sp)
2737  006d f7            	ld	(x),a
2738                     ; 1229     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2740  006e e601          	ld	a,(1,x)
2741  0070 8d000000      	callf	L5f_Bcd2ToByte
2743  0074 1e09          	ldw	x,(OFST+5,sp)
2744  0076 e701          	ld	(1,x),a
2745                     ; 1230     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2747  0078 e602          	ld	a,(2,x)
2748  007a 8d000000      	callf	L5f_Bcd2ToByte
2750  007e 1e09          	ldw	x,(OFST+5,sp)
2751  0080 e702          	ld	(2,x),a
2752                     ; 1231     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2754  0082 e606          	ld	a,(6,x)
2755  0084 8d000000      	callf	L5f_Bcd2ToByte
2757  0088 1e09          	ldw	x,(OFST+5,sp)
2758  008a e706          	ld	(6,x),a
2759  008c               L5421:
2760                     ; 1233 }
2763  008c 5b05          	addw	sp,#5
2764  008e 87            	retf	
2825                     ; 1242 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2825                     ; 1243 {
2826                     .text:	section	.text,new
2827  0000               f_RTC_AlarmCmd:
2829  0000 88            	push	a
2830  0001 5203          	subw	sp,#3
2831       00000003      OFST:	set	3
2834                     ; 1244   __IO uint16_t alrawfcount = 0;
2836  0003 5f            	clrw	x
2837  0004 1f01          	ldw	(OFST-2,sp),x
2838                     ; 1245   ErrorStatus status = ERROR;
2840                     ; 1246   uint8_t temp1 = 0;
2842  0006 7b03          	ld	a,(OFST+0,sp)
2843  0008 97            	ld	xl,a
2844                     ; 1249   assert_param(IS_FUNCTIONAL_STATE(NewState));
2846                     ; 1252   RTC->WPR = 0xCA;
2848  0009 35ca5159      	mov	20825,#202
2849                     ; 1253   RTC->WPR = 0x53;
2851  000d 35535159      	mov	20825,#83
2852                     ; 1256   if (NewState != DISABLE)
2854  0011 7b04          	ld	a,(OFST+1,sp)
2855  0013 2711          	jreq	L7721
2856                     ; 1258     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2858  0015 72105149      	bset	20809,#0
2859                     ; 1259     status = SUCCESS;
2861  0019               LC006:
2863  0019 a601          	ld	a,#1
2864  001b 6b03          	ld	(OFST+0,sp),a
2866  001d               L1031:
2867                     ; 1283   RTC->WPR = 0xFF; 
2869  001d 35ff5159      	mov	20825,#255
2870                     ; 1286   return (ErrorStatus)status;
2872  0021 7b03          	ld	a,(OFST+0,sp)
2875  0023 5b04          	addw	sp,#4
2876  0025 87            	retf	
2877  0026               L7721:
2878                     ; 1263     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2880  0026 72115149      	bres	20809,#0
2881                     ; 1266     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2883  002a c6514c        	ld	a,20812
2884  002d a401          	and	a,#1
2885  002f 6b03          	ld	(OFST+0,sp),a
2887  0031 2005          	jra	L7031
2888  0033               L3031:
2889                     ; 1269       alrawfcount++;
2891  0033 1e01          	ldw	x,(OFST-2,sp)
2892  0035 5c            	incw	x
2893  0036 1f01          	ldw	(OFST-2,sp),x
2894  0038               L7031:
2895                     ; 1267     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2897  0038 1e01          	ldw	x,(OFST-2,sp)
2898  003a a3ffff        	cpw	x,#65535
2899  003d 2704          	jreq	L3131
2901  003f 7b03          	ld	a,(OFST+0,sp)
2902  0041 27f0          	jreq	L3031
2903  0043               L3131:
2904                     ; 1272     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2906  0043 7200514c04    	btjt	20812,#0,L5131
2907                     ; 1274       status = ERROR;
2909  0048 0f03          	clr	(OFST+0,sp)
2911  004a 20d1          	jra	L1031
2912  004c               L5131:
2913                     ; 1278       status = SUCCESS;
2914  004c 20cb          	jpf	LC006
3110                     ; 1298 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3110                     ; 1299                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3110                     ; 1300 {
3111                     .text:	section	.text,new
3112  0000               f_RTC_AlarmSubSecondConfig:
3114  0000 89            	pushw	x
3115  0001 88            	push	a
3116       00000001      OFST:	set	1
3119                     ; 1301   uint8_t alarmstatus = 0;
3121                     ; 1302   ErrorStatus status = ERROR;
3123  0002 7b01          	ld	a,(OFST+0,sp)
3124  0004 97            	ld	xl,a
3125                     ; 1305   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3127                     ; 1306   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3129                     ; 1309   RTC->WPR = 0xCA;
3131  0005 35ca5159      	mov	20825,#202
3132                     ; 1310   RTC->WPR = 0x53;
3134  0009 35535159      	mov	20825,#83
3135                     ; 1313   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3137  000d 720c514c28    	btjt	20812,#6,L3141
3138                     ; 1316     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3140  0012 c65149        	ld	a,20809
3141  0015 aa01          	or	a,#1
3142  0017 6b01          	ld	(OFST+0,sp),a
3143                     ; 1319     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3145  0019 72115149      	bres	20809,#0
3146                     ; 1322     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3148  001d 7b02          	ld	a,(OFST+1,sp)
3149  001f c75164        	ld	20836,a
3150                     ; 1323     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3152  0022 7b03          	ld	a,(OFST+2,sp)
3153  0024 c75165        	ld	20837,a
3154                     ; 1324     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3156  0027 7b07          	ld	a,(OFST+6,sp)
3157  0029 c75166        	ld	20838,a
3158                     ; 1327     RTC->CR2 |= alarmstatus;
3160  002c c65149        	ld	a,20809
3161  002f 1a01          	or	a,(OFST+0,sp)
3162  0031 c75149        	ld	20809,a
3163                     ; 1329     status = SUCCESS;
3165  0034 a601          	ld	a,#1
3166  0036 6b01          	ld	(OFST+0,sp),a
3168  0038 2002          	jra	L5141
3169  003a               L3141:
3170                     ; 1333     status = ERROR;
3172  003a 0f01          	clr	(OFST+0,sp)
3173  003c               L5141:
3174                     ; 1337   RTC->WPR = 0xFF; 
3176  003c 35ff5159      	mov	20825,#255
3177                     ; 1339   return (ErrorStatus)status;
3179  0040 7b01          	ld	a,(OFST+0,sp)
3182  0042 5b03          	addw	sp,#3
3183  0044 87            	retf	
3272                     ; 1369 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3272                     ; 1370 {
3273                     .text:	section	.text,new
3274  0000               f_RTC_WakeUpClockConfig:
3276  0000 88            	push	a
3277       00000000      OFST:	set	0
3280                     ; 1373   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3282                     ; 1376   RTC->WPR = 0xCA;
3284  0001 35ca5159      	mov	20825,#202
3285                     ; 1377   RTC->WPR = 0x53;
3287  0005 35535159      	mov	20825,#83
3288                     ; 1380   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3290  0009 72155149      	bres	20809,#2
3291                     ; 1383   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3293  000d c65148        	ld	a,20808
3294  0010 a4f8          	and	a,#248
3295  0012 c75148        	ld	20808,a
3296                     ; 1386   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3298  0015 c65148        	ld	a,20808
3299  0018 1a01          	or	a,(OFST+1,sp)
3300  001a c75148        	ld	20808,a
3301                     ; 1389   RTC->WPR = 0xFF; 
3303  001d 35ff5159      	mov	20825,#255
3304                     ; 1390 }
3307  0021 84            	pop	a
3308  0022 87            	retf	
3340                     ; 1400 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3340                     ; 1401 {
3341                     .text:	section	.text,new
3342  0000               f_RTC_SetWakeUpCounter:
3346                     ; 1403   RTC->WPR = 0xCA;
3348  0000 35ca5159      	mov	20825,#202
3349                     ; 1404   RTC->WPR = 0x53;
3351  0004 35535159      	mov	20825,#83
3352                     ; 1408   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3354  0008 9e            	ld	a,xh
3355  0009 c75154        	ld	20820,a
3356                     ; 1409   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3358  000c 9f            	ld	a,xl
3359  000d c75155        	ld	20821,a
3360                     ; 1412   RTC->WPR = 0xFF; 
3362  0010 35ff5159      	mov	20825,#255
3363                     ; 1413 }
3366  0014 87            	retf	
3398                     ; 1420 uint16_t RTC_GetWakeUpCounter(void)
3398                     ; 1421 {
3399                     .text:	section	.text,new
3400  0000               f_RTC_GetWakeUpCounter:
3402  0000 89            	pushw	x
3403       00000002      OFST:	set	2
3406                     ; 1422   uint16_t tmpreg = 0;
3408                     ; 1425   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3410  0001 c65154        	ld	a,20820
3411  0004 97            	ld	xl,a
3412  0005 4f            	clr	a
3413  0006 02            	rlwa	x,a
3414  0007 1f01          	ldw	(OFST-1,sp),x
3415                     ; 1426   tmpreg |= RTC->WUTRL;
3417  0009 c65155        	ld	a,20821
3418  000c 5f            	clrw	x
3419  000d 97            	ld	xl,a
3420  000e 01            	rrwa	x,a
3421  000f 1a02          	or	a,(OFST+0,sp)
3422  0011 01            	rrwa	x,a
3423  0012 1a01          	or	a,(OFST-1,sp)
3424  0014 01            	rrwa	x,a
3425                     ; 1429   return (uint16_t)tmpreg;
3429  0015 5b02          	addw	sp,#2
3430  0017 87            	retf	
3482                     ; 1440 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3482                     ; 1441 {
3483                     .text:	section	.text,new
3484  0000               f_RTC_WakeUpCmd:
3486  0000 88            	push	a
3487  0001 5203          	subw	sp,#3
3488       00000003      OFST:	set	3
3491                     ; 1442   ErrorStatus status = ERROR;
3493                     ; 1443   uint16_t wutwfcount = 0;
3495  0003 5f            	clrw	x
3496  0004 1f02          	ldw	(OFST-1,sp),x
3497                     ; 1446   assert_param(IS_FUNCTIONAL_STATE(NewState));
3499                     ; 1449   RTC->WPR = 0xCA;
3501  0006 35ca5159      	mov	20825,#202
3502                     ; 1450   RTC->WPR = 0x53;
3504  000a 35535159      	mov	20825,#83
3505                     ; 1452   if (NewState != DISABLE)
3507  000e 7b04          	ld	a,(OFST+1,sp)
3508  0010 2711          	jreq	L1351
3509                     ; 1455     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3511  0012 72145149      	bset	20809,#2
3512                     ; 1457     status = SUCCESS;
3514  0016               LC007:
3516  0016 a601          	ld	a,#1
3517  0018 6b01          	ld	(OFST-2,sp),a
3519  001a               L3351:
3520                     ; 1482   RTC->WPR = 0xFF; 
3522  001a 35ff5159      	mov	20825,#255
3523                     ; 1485   return (ErrorStatus)status;
3525  001e 7b01          	ld	a,(OFST-2,sp)
3528  0020 5b04          	addw	sp,#4
3529  0022 87            	retf	
3530  0023               L1351:
3531                     ; 1462     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3533  0023 72155149      	bres	20809,#2
3535  0027 2003          	jra	L7351
3536  0029               L5351:
3537                     ; 1467       wutwfcount++;
3539  0029 5c            	incw	x
3540  002a 1f02          	ldw	(OFST-1,sp),x
3541  002c               L7351:
3542                     ; 1465     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3544  002c 7204514c05    	btjt	20812,#2,L3451
3546  0031 a3ffff        	cpw	x,#65535
3547  0034 26f3          	jrne	L5351
3548  0036               L3451:
3549                     ; 1471     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3551  0036 7204514c04    	btjt	20812,#2,L5451
3552                     ; 1473       status = ERROR;
3554  003b 0f01          	clr	(OFST-2,sp)
3556  003d 20db          	jra	L3351
3557  003f               L5451:
3558                     ; 1477       status = SUCCESS;
3559  003f 20d5          	jpf	LC007
3648                     ; 1522 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3648                     ; 1523                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3648                     ; 1524 {
3649                     .text:	section	.text,new
3650  0000               f_RTC_DayLightSavingConfig:
3652  0000 89            	pushw	x
3653       00000000      OFST:	set	0
3656                     ; 1526   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3658                     ; 1527   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3660                     ; 1530   RTC->WPR = 0xCA;
3662  0001 35ca5159      	mov	20825,#202
3663                     ; 1531   RTC->WPR = 0x53;
3665  0005 35535159      	mov	20825,#83
3666                     ; 1534   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3668  0009 7215514a      	bres	20810,#2
3669                     ; 1537   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3671  000d 9f            	ld	a,xl
3672  000e 1a01          	or	a,(OFST+1,sp)
3673  0010 ca514a        	or	a,20810
3674  0013 c7514a        	ld	20810,a
3675                     ; 1540   RTC->WPR = 0xFF; 
3677  0016 35ff5159      	mov	20825,#255
3678                     ; 1541 }
3681  001a 85            	popw	x
3682  001b 87            	retf	
3706                     ; 1549 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3706                     ; 1550 {
3707                     .text:	section	.text,new
3708  0000               f_RTC_GetStoreOperation:
3712                     ; 1552   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3714  0000 c6514a        	ld	a,20810
3715  0003 a404          	and	a,#4
3718  0005 87            	retf	
3811                     ; 1587 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3811                     ; 1588                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3811                     ; 1589 {
3812                     .text:	section	.text,new
3813  0000               f_RTC_OutputConfig:
3815  0000 89            	pushw	x
3816       00000000      OFST:	set	0
3819                     ; 1591   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3821                     ; 1592   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3823                     ; 1595   RTC->WPR = 0xCA;
3825  0001 35ca5159      	mov	20825,#202
3826                     ; 1596   RTC->WPR = 0x53;
3828  0005 35535159      	mov	20825,#83
3829                     ; 1599   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3831  0009 c6514a        	ld	a,20810
3832  000c a48f          	and	a,#143
3833  000e c7514a        	ld	20810,a
3834                     ; 1602   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3836  0011 9f            	ld	a,xl
3837  0012 1a01          	or	a,(OFST+1,sp)
3838  0014 ca514a        	or	a,20810
3839  0017 c7514a        	ld	20810,a
3840                     ; 1605   RTC->WPR = 0xFF; 
3842  001a 35ff5159      	mov	20825,#255
3843                     ; 1606 }
3846  001e 85            	popw	x
3847  001f 87            	retf	
3935                     ; 1639 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
3935                     ; 1640                                    uint16_t RTC_ShiftSubFS)
3935                     ; 1641 {
3936                     .text:	section	.text,new
3937  0000               f_RTC_SynchroShiftConfig:
3939  0000 88            	push	a
3940  0001 5203          	subw	sp,#3
3941       00000003      OFST:	set	3
3944                     ; 1642   uint8_t shiftrhreg = 0;
3946                     ; 1643   ErrorStatus status = ERROR;
3948                     ; 1644   uint16_t shpfcount = 0;
3950  0003 5f            	clrw	x
3951  0004 1f02          	ldw	(OFST-1,sp),x
3952                     ; 1647   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
3954                     ; 1648   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
3956                     ; 1651   RTC->WPR = 0xCA;
3958  0006 35ca5159      	mov	20825,#202
3959                     ; 1652   RTC->WPR = 0x53;
3961  000a 35535159      	mov	20825,#83
3962                     ; 1655   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
3964  000e 7207514c0f    	btjf	20812,#3,L7271
3966  0013 2003          	jra	L3371
3967  0015               L1371:
3968                     ; 1660       shpfcount++;
3970  0015 5c            	incw	x
3971  0016 1f02          	ldw	(OFST-1,sp),x
3972  0018               L3371:
3973                     ; 1658     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
3975  0018 7207514c05    	btjf	20812,#3,L7271
3977  001d a3ffff        	cpw	x,#65535
3978  0020 26f3          	jrne	L1371
3979  0022               L7271:
3980                     ; 1665   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
3982  0022 7206514c12    	btjt	20812,#3,L1471
3983                     ; 1668     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
3985  0027 7b08          	ld	a,(OFST+5,sp)
3986  0029 1a04          	or	a,(OFST+1,sp)
3987                     ; 1669     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
3989  002b c7515a        	ld	20826,a
3990                     ; 1670     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
3992  002e 7b09          	ld	a,(OFST+6,sp)
3993  0030 c7515b        	ld	20827,a
3994                     ; 1672     status = SUCCESS;
3996  0033 a601          	ld	a,#1
3997  0035 6b01          	ld	(OFST-2,sp),a
3999  0037 2002          	jra	L3471
4000  0039               L1471:
4001                     ; 1676     status = ERROR;
4003  0039 0f01          	clr	(OFST-2,sp)
4004  003b               L3471:
4005                     ; 1680   RTC->WPR = 0xFF; 
4007  003b 35ff5159      	mov	20825,#255
4008                     ; 1682   return (ErrorStatus)(status);
4010  003f 7b01          	ld	a,(OFST-2,sp)
4013  0041 5b04          	addw	sp,#4
4014  0043 87            	retf	
4139                     ; 1718 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4139                     ; 1719                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4139                     ; 1720                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4139                     ; 1721 {
4140                     .text:	section	.text,new
4141  0000               f_RTC_SmoothCalibConfig:
4143  0000 89            	pushw	x
4144  0001 5203          	subw	sp,#3
4145       00000003      OFST:	set	3
4148                     ; 1722   ErrorStatus status = ERROR;
4150                     ; 1723   uint16_t recalpfcount = 0;
4152  0003 5f            	clrw	x
4153  0004 1f02          	ldw	(OFST-1,sp),x
4154                     ; 1726   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4156                     ; 1727   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4158                     ; 1728   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4160                     ; 1731   RTC->WPR = 0xCA;
4162  0006 35ca5159      	mov	20825,#202
4163                     ; 1732   RTC->WPR = 0x53;
4165  000a 35535159      	mov	20825,#83
4166                     ; 1735   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4168  000e 7203514c0f    	btjf	20812,#1,L1202
4170  0013 2003          	jra	L5202
4171  0015               L3202:
4172                     ; 1740       recalpfcount++;
4174  0015 5c            	incw	x
4175  0016 1f02          	ldw	(OFST-1,sp),x
4176  0018               L5202:
4177                     ; 1738     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4179  0018 7203514c05    	btjf	20812,#1,L1202
4181  001d a3ffff        	cpw	x,#65535
4182  0020 26f3          	jrne	L3202
4183  0022               L1202:
4184                     ; 1746   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4186  0022 7202514c14    	btjt	20812,#1,L3302
4187                     ; 1749     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4187                     ; 1750                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4187                     ; 1751                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4189  0027 7b04          	ld	a,(OFST+1,sp)
4190  0029 1a05          	or	a,(OFST+2,sp)
4191  002b 1a09          	or	a,(OFST+6,sp)
4192  002d c7516a        	ld	20842,a
4193                     ; 1752     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4195  0030 7b0a          	ld	a,(OFST+7,sp)
4196  0032 c7516b        	ld	20843,a
4197                     ; 1754     status = SUCCESS;
4199  0035 a601          	ld	a,#1
4200  0037 6b01          	ld	(OFST-2,sp),a
4202  0039 2002          	jra	L5302
4203  003b               L3302:
4204                     ; 1758     status = ERROR;
4206  003b 0f01          	clr	(OFST-2,sp)
4207  003d               L5302:
4208                     ; 1762   RTC->WPR = 0xFF; 
4210  003d 35ff5159      	mov	20825,#255
4211                     ; 1764   return (ErrorStatus)(status);
4213  0041 7b01          	ld	a,(OFST-2,sp)
4216  0043 5b05          	addw	sp,#5
4217  0045 87            	retf	
4274                     ; 1790 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4274                     ; 1791 {
4275                     .text:	section	.text,new
4276  0000               f_RTC_CalibOutputConfig:
4280                     ; 1793   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4282                     ; 1796   RTC->WPR = 0xCA;
4284  0000 35ca5159      	mov	20825,#202
4285                     ; 1797   RTC->WPR = 0x53;
4287  0004 35535159      	mov	20825,#83
4288                     ; 1799   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4290  0008 4d            	tnz	a
4291  0009 2706          	jreq	L5602
4292                     ; 1802     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4294  000b 7216514a      	bset	20810,#3
4296  000f 2004          	jra	L7602
4297  0011               L5602:
4298                     ; 1807     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4300  0011 7217514a      	bres	20810,#3
4301  0015               L7602:
4302                     ; 1811   RTC->WPR = 0xFF; 
4304  0015 35ff5159      	mov	20825,#255
4305                     ; 1812 }
4308  0019 87            	retf	
4342                     ; 1820 void RTC_CalibOutputCmd(FunctionalState NewState)
4342                     ; 1821 {
4343                     .text:	section	.text,new
4344  0000               f_RTC_CalibOutputCmd:
4348                     ; 1823   assert_param(IS_FUNCTIONAL_STATE(NewState));
4350                     ; 1826   RTC->WPR = 0xCA;
4352  0000 35ca5159      	mov	20825,#202
4353                     ; 1827   RTC->WPR = 0x53;
4355  0004 35535159      	mov	20825,#83
4356                     ; 1829   if (NewState != DISABLE)
4358  0008 4d            	tnz	a
4359  0009 2706          	jreq	L7012
4360                     ; 1832     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4362  000b 721e514a      	bset	20810,#7
4364  000f 2004          	jra	L1112
4365  0011               L7012:
4366                     ; 1837     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4368  0011 721f514a      	bres	20810,#7
4369  0015               L1112:
4370                     ; 1841   RTC->WPR = 0xFF; 
4372  0015 35ff5159      	mov	20825,#255
4373                     ; 1842 }
4376  0019 87            	retf	
4470                     ; 1871 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4470                     ; 1872                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4470                     ; 1873 {
4471                     .text:	section	.text,new
4472  0000               f_RTC_TamperLevelConfig:
4474  0000 89            	pushw	x
4475       00000000      OFST:	set	0
4478                     ; 1875   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4480                     ; 1876   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4482                     ; 1879   RTC->WPR = 0xCA;
4484  0001 35ca5159      	mov	20825,#202
4485                     ; 1880   RTC->WPR = 0x53;
4487  0005 35535159      	mov	20825,#83
4488                     ; 1882   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4490  0009 9f            	ld	a,xl
4491  000a 4d            	tnz	a
4492  000b 2707          	jreq	L7512
4493                     ; 1885     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4495  000d 9e            	ld	a,xh
4496  000e 48            	sll	a
4497  000f ca516c        	or	a,20844
4499  0012 2007          	jra	L1612
4500  0014               L7512:
4501                     ; 1890     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4503  0014 7b01          	ld	a,(OFST+1,sp)
4504  0016 48            	sll	a
4505  0017 43            	cpl	a
4506  0018 c4516c        	and	a,20844
4507  001b               L1612:
4508  001b c7516c        	ld	20844,a
4509                     ; 1894   RTC->WPR = 0xFF; 
4511  001e 35ff5159      	mov	20825,#255
4512                     ; 1895 }
4515  0022 85            	popw	x
4516  0023 87            	retf	
4589                     ; 1903 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4589                     ; 1904 {
4590                     .text:	section	.text,new
4591  0000               f_RTC_TamperFilterConfig:
4593  0000 88            	push	a
4594       00000000      OFST:	set	0
4597                     ; 1907   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4599                     ; 1910   RTC->WPR = 0xCA;
4601  0001 35ca5159      	mov	20825,#202
4602                     ; 1911   RTC->WPR = 0x53;
4604  0005 35535159      	mov	20825,#83
4605                     ; 1914   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4607  0009 c6516d        	ld	a,20845
4608  000c a4e7          	and	a,#231
4609  000e c7516d        	ld	20845,a
4610                     ; 1917   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4612  0011 c6516d        	ld	a,20845
4613  0014 1a01          	or	a,(OFST+1,sp)
4614  0016 c7516d        	ld	20845,a
4615                     ; 1920   RTC->WPR = 0xFF; 
4617  0019 35ff5159      	mov	20825,#255
4618                     ; 1922 }
4621  001d 84            	pop	a
4622  001e 87            	retf	
4734                     ; 1931 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4734                     ; 1932 {
4735                     .text:	section	.text,new
4736  0000               f_RTC_TamperSamplingFreqConfig:
4738  0000 88            	push	a
4739       00000000      OFST:	set	0
4742                     ; 1934   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4744                     ; 1937   RTC->WPR = 0xCA;
4746  0001 35ca5159      	mov	20825,#202
4747                     ; 1938   RTC->WPR = 0x53;
4749  0005 35535159      	mov	20825,#83
4750                     ; 1941   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4752  0009 c6516d        	ld	a,20845
4753  000c a4f8          	and	a,#248
4754  000e c7516d        	ld	20845,a
4755                     ; 1944   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4757  0011 c6516d        	ld	a,20845
4758  0014 1a01          	or	a,(OFST+1,sp)
4759  0016 c7516d        	ld	20845,a
4760                     ; 1947   RTC->WPR = 0xFF; 
4762  0019 35ff5159      	mov	20825,#255
4763                     ; 1948 }
4766  001d 84            	pop	a
4767  001e 87            	retf	
4849                     ; 1958 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4849                     ; 1959 {
4850                     .text:	section	.text,new
4851  0000               f_RTC_TamperPinsPrechargeDuration:
4853  0000 88            	push	a
4854       00000000      OFST:	set	0
4857                     ; 1961   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4859                     ; 1964   RTC->WPR = 0xCA;
4861  0001 35ca5159      	mov	20825,#202
4862                     ; 1965   RTC->WPR = 0x53;
4864  0005 35535159      	mov	20825,#83
4865                     ; 1968   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4867  0009 c6516d        	ld	a,20845
4868  000c a41f          	and	a,#31
4869  000e c7516d        	ld	20845,a
4870                     ; 1971   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4872  0011 c6516d        	ld	a,20845
4873  0014 1a01          	or	a,(OFST+1,sp)
4874  0016 c7516d        	ld	20845,a
4875                     ; 1974   RTC->WPR = 0xFF; 
4877  0019 35ff5159      	mov	20825,#255
4878                     ; 1975 }
4881  001d 84            	pop	a
4882  001e 87            	retf	
4926                     ; 1987 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
4926                     ; 1988                    FunctionalState NewState)
4926                     ; 1989 {
4927                     .text:	section	.text,new
4928  0000               f_RTC_TamperCmd:
4930  0000 89            	pushw	x
4931       00000000      OFST:	set	0
4934                     ; 1992   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4936                     ; 1993   assert_param(IS_FUNCTIONAL_STATE(NewState));
4938                     ; 1996   RTC->WPR = 0xCA;
4940  0001 35ca5159      	mov	20825,#202
4941                     ; 1997   RTC->WPR = 0x53;
4943  0005 35535159      	mov	20825,#83
4944                     ; 2000   if (NewState != DISABLE)
4946  0009 9f            	ld	a,xl
4947  000a 4d            	tnz	a
4948  000b 2706          	jreq	L5332
4949                     ; 2003     RTC->TCR1 |= (uint8_t)RTC_Tamper;
4951  000d 9e            	ld	a,xh
4952  000e ca516c        	or	a,20844
4954  0011 2006          	jra	L7332
4955  0013               L5332:
4956                     ; 2008     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
4958  0013 7b01          	ld	a,(OFST+1,sp)
4959  0015 43            	cpl	a
4960  0016 c4516c        	and	a,20844
4961  0019               L7332:
4962  0019 c7516c        	ld	20844,a
4963                     ; 2013   RTC->WPR = 0xFF; 
4965  001c 35ff5159      	mov	20825,#255
4966                     ; 2014 }
4969  0020 85            	popw	x
4970  0021 87            	retf	
5041                     ; 2058 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5041                     ; 2059 {
5042                     .text:	section	.text,new
5043  0000               f_RTC_ITConfig:
5045  0000 89            	pushw	x
5046       00000000      OFST:	set	0
5049                     ; 2061   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5051                     ; 2062   assert_param(IS_FUNCTIONAL_STATE(NewState));
5053                     ; 2065   RTC->WPR = 0xCA;
5055  0001 35ca5159      	mov	20825,#202
5056                     ; 2066   RTC->WPR = 0x53;
5058  0005 35535159      	mov	20825,#83
5059                     ; 2068   if (NewState != DISABLE)
5061  0009 7b06          	ld	a,(OFST+6,sp)
5062  000b 2712          	jreq	L5732
5063                     ; 2071     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5065  000d 9f            	ld	a,xl
5066  000e a4f0          	and	a,#240
5067  0010 ca5149        	or	a,20809
5068  0013 c75149        	ld	20809,a
5069                     ; 2072     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5071  0016 7b02          	ld	a,(OFST+2,sp)
5072  0018 a401          	and	a,#1
5073  001a ca516c        	or	a,20844
5075  001d 2013          	jra	L7732
5076  001f               L5732:
5077                     ; 2077     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5079  001f 7b02          	ld	a,(OFST+2,sp)
5080  0021 a4f0          	and	a,#240
5081  0023 43            	cpl	a
5082  0024 c45149        	and	a,20809
5083  0027 c75149        	ld	20809,a
5084                     ; 2078     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5086  002a 7b02          	ld	a,(OFST+2,sp)
5087  002c a401          	and	a,#1
5088  002e 43            	cpl	a
5089  002f c4516c        	and	a,20844
5090  0032               L7732:
5091  0032 c7516c        	ld	20844,a
5092                     ; 2082   RTC->WPR = 0xFF; 
5094  0035 35ff5159      	mov	20825,#255
5095                     ; 2083 }
5098  0039 85            	popw	x
5099  003a 87            	retf	
5268                     ; 2090 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5268                     ; 2091 {
5269                     .text:	section	.text,new
5270  0000               f_RTC_GetFlagStatus:
5272  0000 89            	pushw	x
5273  0001 5203          	subw	sp,#3
5274       00000003      OFST:	set	3
5277                     ; 2092   FlagStatus flagstatus = RESET;
5279                     ; 2093   uint16_t tmpreg1 = 0;
5281                     ; 2094   uint16_t tmpreg2 = 0;
5283                     ; 2097   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5285                     ; 2100   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5287  0003 c6514c        	ld	a,20812
5288  0006 97            	ld	xl,a
5289  0007 4f            	clr	a
5290  0008 02            	rlwa	x,a
5291  0009 1f02          	ldw	(OFST-1,sp),x
5292                     ; 2101   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5294  000b c6514d        	ld	a,20813
5295  000e 5f            	clrw	x
5296  000f 97            	ld	xl,a
5297  0010 01            	rrwa	x,a
5298  0011 1a03          	or	a,(OFST+0,sp)
5299  0013 01            	rrwa	x,a
5300  0014 1a02          	or	a,(OFST-1,sp)
5301  0016 01            	rrwa	x,a
5302  0017 1f02          	ldw	(OFST-1,sp),x
5303                     ; 2104   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5305  0019 01            	rrwa	x,a
5306  001a 1405          	and	a,(OFST+2,sp)
5307  001c 01            	rrwa	x,a
5308  001d 1404          	and	a,(OFST+1,sp)
5309  001f 01            	rrwa	x,a
5310  0020 5d            	tnzw	x
5311  0021 2704          	jreq	L3742
5312                     ; 2106     flagstatus = SET;
5314  0023 a601          	ld	a,#1
5316  0025 2001          	jra	L5742
5317  0027               L3742:
5318                     ; 2110     flagstatus = RESET;
5320  0027 4f            	clr	a
5321  0028               L5742:
5322                     ; 2112   return (FlagStatus)flagstatus;
5326  0028 5b05          	addw	sp,#5
5327  002a 87            	retf	
5361                     ; 2122 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5361                     ; 2123 {
5362                     .text:	section	.text,new
5363  0000               f_RTC_ClearFlag:
5365  0000 89            	pushw	x
5366       00000000      OFST:	set	0
5369                     ; 2125   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5371                     ; 2128   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5373  0001 9f            	ld	a,xl
5374  0002 43            	cpl	a
5375  0003 c7514d        	ld	20813,a
5376                     ; 2129   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5378  0006 7b01          	ld	a,(OFST+1,sp)
5379  0008 43            	cpl	a
5380  0009 a47f          	and	a,#127
5381  000b c7514c        	ld	20812,a
5382                     ; 2130 }
5385  000e 85            	popw	x
5386  000f 87            	retf	
5445                     ; 2138 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5445                     ; 2139 {
5446                     .text:	section	.text,new
5447  0000               f_RTC_GetITStatus:
5449  0000 89            	pushw	x
5450  0001 89            	pushw	x
5451       00000002      OFST:	set	2
5454                     ; 2140   ITStatus itstatus = RESET;
5456                     ; 2141   uint8_t enablestatus = 0, tmpreg = 0;
5460                     ; 2144   assert_param(IS_RTC_GET_IT(RTC_IT));
5462                     ; 2147   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5464  0002 c65149        	ld	a,20809
5465  0005 1404          	and	a,(OFST+2,sp)
5466  0007 6b01          	ld	(OFST-1,sp),a
5467                     ; 2150   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5469  0009 1e03          	ldw	x,(OFST+1,sp)
5470  000b 54            	srlw	x
5471  000c 54            	srlw	x
5472  000d 54            	srlw	x
5473  000e 54            	srlw	x
5474  000f 9f            	ld	a,xl
5475  0010 c4514d        	and	a,20813
5476  0013 6b02          	ld	(OFST+0,sp),a
5477                     ; 2153   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5479  0015 7b01          	ld	a,(OFST-1,sp)
5480  0017 2708          	jreq	L3452
5482  0019 7b02          	ld	a,(OFST+0,sp)
5483  001b 2704          	jreq	L3452
5484                     ; 2155     itstatus = SET;
5486  001d a601          	ld	a,#1
5488  001f 2001          	jra	L5452
5489  0021               L3452:
5490                     ; 2159     itstatus = RESET;
5492  0021 4f            	clr	a
5493  0022               L5452:
5494                     ; 2162   return (ITStatus)itstatus;
5498  0022 5b04          	addw	sp,#4
5499  0024 87            	retf	
5534                     ; 2172 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5534                     ; 2173 {
5535                     .text:	section	.text,new
5536  0000               f_RTC_ClearITPendingBit:
5540                     ; 2175   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5542                     ; 2178   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5544  0000 54            	srlw	x
5545  0001 54            	srlw	x
5546  0002 54            	srlw	x
5547  0003 54            	srlw	x
5548  0004 9f            	ld	a,xl
5549  0005 43            	cpl	a
5550  0006 c7514d        	ld	20813,a
5551                     ; 2179 }
5554  0009 87            	retf	
5592                     ; 2202 static uint8_t ByteToBcd2(uint8_t Value)
5592                     ; 2203 {
5593                     .text:	section	.text,new
5594  0000               L3f_ByteToBcd2:
5596  0000 88            	push	a
5597  0001 88            	push	a
5598       00000001      OFST:	set	1
5601                     ; 2204   uint8_t bcdhigh = 0;
5603  0002 0f01          	clr	(OFST+0,sp)
5605  0004 7b02          	ld	a,(OFST+1,sp)
5606  0006 2006          	jra	L7062
5607  0008               L3062:
5608                     ; 2208     bcdhigh++;
5610  0008 0c01          	inc	(OFST+0,sp)
5611                     ; 2209     Value -= 10;
5613  000a a00a          	sub	a,#10
5614  000c 6b02          	ld	(OFST+1,sp),a
5615  000e               L7062:
5616                     ; 2206   while (Value >= 10)
5618  000e a10a          	cp	a,#10
5619  0010 24f6          	jruge	L3062
5620                     ; 2212   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5622  0012 7b01          	ld	a,(OFST+0,sp)
5623  0014 97            	ld	xl,a
5624  0015 a610          	ld	a,#16
5625  0017 42            	mul	x,a
5626  0018 9f            	ld	a,xl
5627  0019 1a02          	or	a,(OFST+1,sp)
5630  001b 85            	popw	x
5631  001c 87            	retf	
5669                     ; 2220 static uint8_t Bcd2ToByte(uint8_t Value)
5669                     ; 2221 {
5670                     .text:	section	.text,new
5671  0000               L5f_Bcd2ToByte:
5673  0000 88            	push	a
5674  0001 88            	push	a
5675       00000001      OFST:	set	1
5678                     ; 2222   uint8_t tmp = 0;
5680  0002 0f01          	clr	(OFST+0,sp)
5681                     ; 2224   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5683  0004 4e            	swap	a
5684  0005 a40f          	and	a,#15
5685  0007 97            	ld	xl,a
5686  0008 a60a          	ld	a,#10
5687  000a 42            	mul	x,a
5688  000b 9f            	ld	a,xl
5689  000c 6b01          	ld	(OFST+0,sp),a
5690                     ; 2226   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5692  000e 7b02          	ld	a,(OFST+1,sp)
5693  0010 a40f          	and	a,#15
5694  0012 1b01          	add	a,(OFST+0,sp)
5697  0014 85            	popw	x
5698  0015 87            	retf	
5710                     	xdef	f_RTC_ClearITPendingBit
5711                     	xdef	f_RTC_GetITStatus
5712                     	xdef	f_RTC_ClearFlag
5713                     	xdef	f_RTC_GetFlagStatus
5714                     	xdef	f_RTC_ITConfig
5715                     	xdef	f_RTC_TamperCmd
5716                     	xdef	f_RTC_TamperPinsPrechargeDuration
5717                     	xdef	f_RTC_TamperSamplingFreqConfig
5718                     	xdef	f_RTC_TamperFilterConfig
5719                     	xdef	f_RTC_TamperLevelConfig
5720                     	xdef	f_RTC_CalibOutputCmd
5721                     	xdef	f_RTC_CalibOutputConfig
5722                     	xdef	f_RTC_SmoothCalibConfig
5723                     	xdef	f_RTC_SynchroShiftConfig
5724                     	xdef	f_RTC_OutputConfig
5725                     	xdef	f_RTC_GetStoreOperation
5726                     	xdef	f_RTC_DayLightSavingConfig
5727                     	xdef	f_RTC_WakeUpCmd
5728                     	xdef	f_RTC_GetWakeUpCounter
5729                     	xdef	f_RTC_SetWakeUpCounter
5730                     	xdef	f_RTC_WakeUpClockConfig
5731                     	xdef	f_RTC_AlarmSubSecondConfig
5732                     	xdef	f_RTC_AlarmCmd
5733                     	xdef	f_RTC_GetAlarm
5734                     	xdef	f_RTC_AlarmStructInit
5735                     	xdef	f_RTC_SetAlarm
5736                     	xdef	f_RTC_GetDate
5737                     	xdef	f_RTC_DateStructInit
5738                     	xdef	f_RTC_SetDate
5739                     	xdef	f_RTC_GetSubSecond
5740                     	xdef	f_RTC_GetTime
5741                     	xdef	f_RTC_TimeStructInit
5742                     	xdef	f_RTC_SetTime
5743                     	xdef	f_RTC_BypassShadowCmd
5744                     	xdef	f_RTC_RatioCmd
5745                     	xdef	f_RTC_WaitForSynchro
5746                     	xdef	f_RTC_ExitInitMode
5747                     	xdef	f_RTC_EnterInitMode
5748                     	xdef	f_RTC_WriteProtectionCmd
5749                     	xdef	f_RTC_StructInit
5750                     	xdef	f_RTC_Init
5751                     	xdef	f_RTC_DeInit
5770                     	end
