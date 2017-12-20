   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 111 void COMP_DeInit(void)
  33                     ; 112 {
  35                     .text:	section	.text,new
  36  0000               _COMP_DeInit:
  40                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  42  0000 725f5440      	clr	21568
  43                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  45  0004 725f5441      	clr	21569
  46                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  48  0008 35c05442      	mov	21570,#192
  49                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  51  000c 725f5443      	clr	21571
  52                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  54  0010 725f5444      	clr	21572
  55                     ; 127 }
  58  0014 81            	ret	
 234                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 234                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 234                     ; 155 {
 235                     .text:	section	.text,new
 236  0000               _COMP_Init:
 238  0000 89            	pushw	x
 239       00000000      OFST:	set	0
 242                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 244                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 246                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 248                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 250  0001 c65442        	ld	a,21570
 251  0004 a4c7          	and	a,#199
 252  0006 c75442        	ld	21570,a
 253                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 255  0009 9e            	ld	a,xh
 256  000a ca5442        	or	a,21570
 257  000d c75442        	ld	21570,a
 258                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 260  0010 c65442        	ld	a,21570
 261  0013 a43f          	and	a,#63
 262  0015 c75442        	ld	21570,a
 263                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 265  0018 9f            	ld	a,xl
 266  0019 ca5442        	or	a,21570
 267  001c c75442        	ld	21570,a
 268                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 270  001f 72155441      	bres	21569,#2
 271                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 273  0023 c65441        	ld	a,21569
 274  0026 1a05          	or	a,(OFST+5,sp)
 275  0028 c75441        	ld	21569,a
 276                     ; 175 }
 279  002b 85            	popw	x
 280  002c 81            	ret	
 336                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 336                     ; 184 {
 337                     .text:	section	.text,new
 338  0000               _COMP_VrefintToCOMP1Connect:
 342                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 344                     ; 188   if (NewState != DISABLE)
 346  0000 4d            	tnz	a
 347  0001 2705          	jreq	L341
 348                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 350  0003 72145442      	bset	21570,#2
 353  0007 81            	ret	
 354  0008               L341:
 355                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 357  0008 72155442      	bres	21570,#2
 358                     ; 198 }
 361  000c 81            	ret	
 456                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 456                     ; 213 {
 457                     .text:	section	.text,new
 458  0000               _COMP_EdgeConfig:
 460  0000 89            	pushw	x
 461       00000000      OFST:	set	0
 464                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 466                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 468                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 470  0001 9e            	ld	a,xh
 471  0002 4a            	dec	a
 472  0003 2611          	jrne	L312
 473                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 475  0005 c65440        	ld	a,21568
 476  0008 a4fc          	and	a,#252
 477  000a c75440        	ld	21568,a
 478                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 480  000d 9f            	ld	a,xl
 481  000e ca5440        	or	a,21568
 482  0011 c75440        	ld	21568,a
 484  0014 2010          	jra	L512
 485  0016               L312:
 486                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 488  0016 c65441        	ld	a,21569
 489  0019 a4fc          	and	a,#252
 490  001b c75441        	ld	21569,a
 491                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 493  001e c65441        	ld	a,21569
 494  0021 1a02          	or	a,(OFST+2,sp)
 495  0023 c75441        	ld	21569,a
 496  0026               L512:
 497                     ; 236 }
 500  0026 85            	popw	x
 501  0027 81            	ret	
 569                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 569                     ; 252 {
 570                     .text:	section	.text,new
 571  0000               _COMP_GetOutputLevel:
 573  0000 88            	push	a
 574       00000001      OFST:	set	1
 577                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 579                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 581  0001 4a            	dec	a
 582  0002 2609          	jrne	L152
 583                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 585  0004 7207544002    	btjf	21568,#3,L352
 586                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 588  0009 2007          	jp	LC002
 589  000b               L352:
 590                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 591  000b 2009          	jp	L162
 592  000d               L152:
 593                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 595  000d 7207544104    	btjf	21569,#3,L162
 596                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 598  0012               LC002:
 600  0012 a601          	ld	a,#1
 602  0014 2001          	jra	L752
 603  0016               L162:
 604                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 607  0016 4f            	clr	a
 608  0017               L752:
 609                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 613  0017 5b01          	addw	sp,#1
 614  0019 81            	ret	
 649                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 649                     ; 325 {
 650                     .text:	section	.text,new
 651  0000               _COMP_WindowCmd:
 655                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 657                     ; 329   if (NewState != DISABLE)
 659  0000 4d            	tnz	a
 660  0001 2705          	jreq	L303
 661                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 663  0003 72125442      	bset	21570,#1
 666  0007 81            	ret	
 667  0008               L303:
 668                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 670  0008 72135442      	bres	21570,#1
 671                     ; 339 }
 674  000c 81            	ret	
 710                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 710                     ; 363 {
 711                     .text:	section	.text,new
 712  0000               _COMP_VrefintOutputCmd:
 716                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 718                     ; 367   if (NewState != DISABLE)
 720  0000 4d            	tnz	a
 721  0001 2705          	jreq	L523
 722                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 724  0003 72105442      	bset	21570,#0
 727  0007 81            	ret	
 728  0008               L523:
 729                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 731  0008 72115442      	bres	21570,#0
 732                     ; 377 }
 735  000c 81            	ret	
 771                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 771                     ; 402 {
 772                     .text:	section	.text,new
 773  0000               _COMP_SchmittTriggerCmd:
 777                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 779                     ; 406   if (NewState != DISABLE)
 781  0000 4d            	tnz	a
 782  0001 2705          	jreq	L743
 783                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 785  0003 72145440      	bset	21568,#2
 788  0007 81            	ret	
 789  0008               L743:
 790                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 792  0008 72155440      	bres	21568,#2
 793                     ; 416 }
 796  000c 81            	ret	
 916                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 916                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 916                     ; 437                         FunctionalState NewState)
 916                     ; 438 {
 917                     .text:	section	.text,new
 918  0000               _COMP_TriggerConfig:
 920  0000 89            	pushw	x
 921       00000000      OFST:	set	0
 924                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 926                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 928                     ; 443   switch (COMP_TriggerGroup)
 930  0001 9e            	ld	a,xh
 932                     ; 490     default:
 932                     ; 491       break;
 933  0002 4a            	dec	a
 934  0003 270b          	jreq	L353
 935  0005 4a            	dec	a
 936  0006 2717          	jreq	L553
 937  0008 4a            	dec	a
 938  0009 2730          	jreq	L753
 939  000b 4a            	dec	a
 940  000c 2740          	jreq	L163
 941  000e 2058          	jra	L344
 942  0010               L353:
 943                     ; 445     case COMP_TriggerGroup_InvertingInput:
 943                     ; 446 
 943                     ; 447       if (NewState != DISABLE)
 945  0010 7b05          	ld	a,(OFST+5,sp)
 946  0012 2704          	jreq	L544
 947                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 949  0014 7b02          	ld	a,(OFST+2,sp)
 951  0016 2010          	jp	LC005
 952  0018               L544:
 953                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 955  0018 c65443        	ld	a,21571
 956  001b 1a02          	or	a,(OFST+2,sp)
 957  001d 2017          	jp	LC004
 958  001f               L553:
 959                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 959                     ; 458       if (NewState != DISABLE)
 961  001f 7b05          	ld	a,(OFST+5,sp)
 962  0021 270b          	jreq	L154
 963                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 965  0023 7b02          	ld	a,(OFST+2,sp)
 966  0025 48            	sll	a
 967  0026 48            	sll	a
 968  0027 48            	sll	a
 969  0028               LC005:
 970  0028 43            	cpl	a
 971  0029 c45443        	and	a,21571
 973  002c 2008          	jp	LC004
 974  002e               L154:
 975                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 977  002e 7b02          	ld	a,(OFST+2,sp)
 978  0030 48            	sll	a
 979  0031 48            	sll	a
 980  0032 48            	sll	a
 981  0033 ca5443        	or	a,21571
 982  0036               LC004:
 983  0036 c75443        	ld	21571,a
 984  0039 202d          	jra	L344
 985  003b               L753:
 986                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
 986                     ; 469       if (NewState != DISABLE)
 988  003b 7b05          	ld	a,(OFST+5,sp)
 989  003d 2708          	jreq	L554
 990                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
 992  003f 7b02          	ld	a,(OFST+2,sp)
 993  0041 43            	cpl	a
 994  0042 c45444        	and	a,21572
 996  0045 201e          	jp	LC003
 997  0047               L554:
 998                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1000  0047 c65444        	ld	a,21572
1001  004a 1a02          	or	a,(OFST+2,sp)
1002  004c 2017          	jp	LC003
1003  004e               L163:
1004                     ; 479     case COMP_TriggerGroup_DACOutput:
1004                     ; 480       if (NewState != DISABLE)
1006  004e 7b05          	ld	a,(OFST+5,sp)
1007  0050 270b          	jreq	L164
1008                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1010  0052 7b02          	ld	a,(OFST+2,sp)
1011  0054 48            	sll	a
1012  0055 48            	sll	a
1013  0056 48            	sll	a
1014  0057 43            	cpl	a
1015  0058 c45444        	and	a,21572
1017  005b 2008          	jp	LC003
1018  005d               L164:
1019                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1021  005d 7b02          	ld	a,(OFST+2,sp)
1022  005f 48            	sll	a
1023  0060 48            	sll	a
1024  0061 48            	sll	a
1025  0062 ca5444        	or	a,21572
1026  0065               LC003:
1027  0065 c75444        	ld	21572,a
1028                     ; 490     default:
1028                     ; 491       break;
1030  0068               L344:
1031                     ; 493 }
1034  0068 85            	popw	x
1035  0069 81            	ret	
1080                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1080                     ; 522 {
1081                     .text:	section	.text,new
1082  0000               _COMP_ITConfig:
1084  0000 89            	pushw	x
1085       00000000      OFST:	set	0
1088                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1090                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1092                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1094  0001 9e            	ld	a,xh
1095  0002 4a            	dec	a
1096  0003 2610          	jrne	L705
1097                     ; 530     if (NewState != DISABLE)
1099  0005 9f            	ld	a,xl
1100  0006 4d            	tnz	a
1101  0007 2706          	jreq	L115
1102                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1104  0009 721a5440      	bset	21568,#5
1106  000d 2014          	jra	L515
1107  000f               L115:
1108                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1110  000f 721b5440      	bres	21568,#5
1111  0013 200e          	jra	L515
1112  0015               L705:
1113                     ; 543     if (NewState != DISABLE)
1115  0015 7b02          	ld	a,(OFST+2,sp)
1116  0017 2706          	jreq	L715
1117                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1119  0019 721a5441      	bset	21569,#5
1121  001d 2004          	jra	L515
1122  001f               L715:
1123                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1125  001f 721b5441      	bres	21569,#5
1126  0023               L515:
1127                     ; 554 }
1130  0023 85            	popw	x
1131  0024 81            	ret	
1197                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1197                     ; 565 {
1198                     .text:	section	.text,new
1199  0000               _COMP_GetFlagStatus:
1201  0000 88            	push	a
1202       00000001      OFST:	set	1
1205                     ; 566   FlagStatus bitstatus = RESET;
1207  0001 0f01          	clr	(OFST+0,sp)
1208                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1210                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1212  0003 4a            	dec	a
1213  0004 2609          	jrne	L555
1214                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1216  0006 7209544002    	btjf	21568,#4,L755
1217                     ; 577       bitstatus = SET;
1219  000b 2007          	jp	LC007
1220  000d               L755:
1221                     ; 582       bitstatus = RESET;
1222  000d 2009          	jp	L565
1223  000f               L555:
1224                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1226  000f 7209544104    	btjf	21569,#4,L565
1227                     ; 590       bitstatus = SET;
1229  0014               LC007:
1231  0014 a601          	ld	a,#1
1233  0016 2001          	jra	L365
1234  0018               L565:
1235                     ; 595       bitstatus = RESET;
1238  0018 4f            	clr	a
1239  0019               L365:
1240                     ; 600   return (FlagStatus)(bitstatus);
1244  0019 5b01          	addw	sp,#1
1245  001b 81            	ret	
1280                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1280                     ; 612 {
1281                     .text:	section	.text,new
1282  0000               _COMP_ClearFlag:
1286                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1288                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1290  0000 4a            	dec	a
1291  0001 2605          	jrne	L706
1292                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1294  0003 72195440      	bres	21568,#4
1297  0007 81            	ret	
1298  0008               L706:
1299                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1301  0008 72195441      	bres	21569,#4
1302                     ; 626 }
1305  000c 81            	ret	
1369                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1369                     ; 637 {
1370                     .text:	section	.text,new
1371  0000               _COMP_GetITStatus:
1373  0000 88            	push	a
1374  0001 89            	pushw	x
1375       00000002      OFST:	set	2
1378                     ; 638   ITStatus bitstatus = RESET;
1380                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1384  0002 7b02          	ld	a,(OFST+0,sp)
1385  0004 97            	ld	xl,a
1386                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1388                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1390  0005 7b03          	ld	a,(OFST+1,sp)
1391  0007 4a            	dec	a
1392  0008 2618          	jrne	L546
1393                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1395  000a c65440        	ld	a,21568
1396  000d a410          	and	a,#16
1397  000f 6b01          	ld	(OFST-1,sp),a
1398                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1400  0011 c65440        	ld	a,21568
1401  0014 a420          	and	a,#32
1402  0016 6b02          	ld	(OFST+0,sp),a
1403                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1405  0018 7b01          	ld	a,(OFST-1,sp)
1406  001a 2720          	jreq	L556
1408  001c 7b02          	ld	a,(OFST+0,sp)
1409  001e 271c          	jreq	L556
1410                     ; 655       bitstatus = SET;
1412  0020 2016          	jp	LC009
1413                     ; 660       bitstatus = RESET;
1414  0022               L546:
1415                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1417  0022 c65441        	ld	a,21569
1418  0025 a410          	and	a,#16
1419  0027 6b01          	ld	(OFST-1,sp),a
1420                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1422  0029 c65441        	ld	a,21569
1423  002c a420          	and	a,#32
1424  002e 6b02          	ld	(OFST+0,sp),a
1425                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1427  0030 7b01          	ld	a,(OFST-1,sp)
1428  0032 2708          	jreq	L556
1430  0034 7b02          	ld	a,(OFST+0,sp)
1431  0036 2704          	jreq	L556
1432                     ; 674       bitstatus = SET;
1434  0038               LC009:
1436  0038 a601          	ld	a,#1
1438  003a 2001          	jra	L356
1439  003c               L556:
1440                     ; 679       bitstatus = RESET;
1443  003c 4f            	clr	a
1444  003d               L356:
1445                     ; 684   return (ITStatus) bitstatus;
1449  003d 5b03          	addw	sp,#3
1450  003f 81            	ret	
1486                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1486                     ; 696 {
1487                     .text:	section	.text,new
1488  0000               _COMP_ClearITPendingBit:
1492                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1494                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1496  0000 4a            	dec	a
1497  0001 2605          	jrne	L776
1498                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1500  0003 72195440      	bres	21568,#4
1503  0007 81            	ret	
1504  0008               L776:
1505                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1507  0008 72195441      	bres	21569,#4
1508                     ; 710 }
1511  000c 81            	ret	
1524                     	xdef	_COMP_ClearITPendingBit
1525                     	xdef	_COMP_GetITStatus
1526                     	xdef	_COMP_ClearFlag
1527                     	xdef	_COMP_GetFlagStatus
1528                     	xdef	_COMP_ITConfig
1529                     	xdef	_COMP_TriggerConfig
1530                     	xdef	_COMP_SchmittTriggerCmd
1531                     	xdef	_COMP_VrefintOutputCmd
1532                     	xdef	_COMP_WindowCmd
1533                     	xdef	_COMP_GetOutputLevel
1534                     	xdef	_COMP_EdgeConfig
1535                     	xdef	_COMP_VrefintToCOMP1Connect
1536                     	xdef	_COMP_Init
1537                     	xdef	_COMP_DeInit
1556                     	end
