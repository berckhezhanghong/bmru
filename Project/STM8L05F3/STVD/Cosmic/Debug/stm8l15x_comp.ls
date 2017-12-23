   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 111 void COMP_DeInit(void)
  33                     ; 112 {
  34                     .text:	section	.text,new
  35  0000               f_COMP_DeInit:
  39                     ; 114   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  41  0000 725f5440      	clr	21568
  42                     ; 117   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  44  0004 725f5441      	clr	21569
  45                     ; 120   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  47  0008 35c05442      	mov	21570,#192
  48                     ; 123   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  50  000c 725f5443      	clr	21571
  51                     ; 126   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  53  0010 725f5444      	clr	21572
  54                     ; 127 }
  57  0014 87            	retf	
 232                     ; 153 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 232                     ; 154                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 232                     ; 155 {
 233                     .text:	section	.text,new
 234  0000               f_COMP_Init:
 236  0000 89            	pushw	x
 237       00000000      OFST:	set	0
 240                     ; 157   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 242                     ; 158   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 244                     ; 159   assert_param(IS_COMP_SPEED(COMP_Speed));
 246                     ; 162   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 248  0001 c65442        	ld	a,21570
 249  0004 a4c7          	and	a,#199
 250  0006 c75442        	ld	21570,a
 251                     ; 164   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 253  0009 9e            	ld	a,xh
 254  000a ca5442        	or	a,21570
 255  000d c75442        	ld	21570,a
 256                     ; 167   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 258  0010 c65442        	ld	a,21570
 259  0013 a43f          	and	a,#63
 260  0015 c75442        	ld	21570,a
 261                     ; 169   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 263  0018 9f            	ld	a,xl
 264  0019 ca5442        	or	a,21570
 265  001c c75442        	ld	21570,a
 266                     ; 172   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 268  001f 72155441      	bres	21569,#2
 269                     ; 174   COMP->CSR2 |= (uint8_t) COMP_Speed;
 271  0023 c65441        	ld	a,21569
 272  0026 1a06          	or	a,(OFST+6,sp)
 273  0028 c75441        	ld	21569,a
 274                     ; 175 }
 277  002b 85            	popw	x
 278  002c 87            	retf	
 333                     ; 183 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 333                     ; 184 {
 334                     .text:	section	.text,new
 335  0000               f_COMP_VrefintToCOMP1Connect:
 339                     ; 186   assert_param(IS_FUNCTIONAL_STATE(NewState));
 341                     ; 188   if (NewState != DISABLE)
 343  0000 4d            	tnz	a
 344  0001 2705          	jreq	L341
 345                     ; 191     COMP->CSR3 |= COMP_CSR3_VREFEN;
 347  0003 72145442      	bset	21570,#2
 350  0007 87            	retf	
 351  0008               L341:
 352                     ; 196     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 354  0008 72155442      	bres	21570,#2
 355                     ; 198 }
 358  000c 87            	retf	
 452                     ; 212 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 452                     ; 213 {
 453                     .text:	section	.text,new
 454  0000               f_COMP_EdgeConfig:
 456  0000 89            	pushw	x
 457       00000000      OFST:	set	0
 460                     ; 215   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 462                     ; 216   assert_param(IS_COMP_EDGE(COMP_Edge));
 464                     ; 219   if (COMP_Selection == COMP_Selection_COMP1)
 466  0001 9e            	ld	a,xh
 467  0002 4a            	dec	a
 468  0003 2611          	jrne	L312
 469                     ; 222     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 471  0005 c65440        	ld	a,21568
 472  0008 a4fc          	and	a,#252
 473  000a c75440        	ld	21568,a
 474                     ; 225     COMP->CSR1 |= (uint8_t) COMP_Edge;
 476  000d 9f            	ld	a,xl
 477  000e ca5440        	or	a,21568
 478  0011 c75440        	ld	21568,a
 480  0014 2010          	jra	L512
 481  0016               L312:
 482                     ; 231     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 484  0016 c65441        	ld	a,21569
 485  0019 a4fc          	and	a,#252
 486  001b c75441        	ld	21569,a
 487                     ; 234     COMP->CSR2 |= (uint8_t) COMP_Edge;
 489  001e c65441        	ld	a,21569
 490  0021 1a02          	or	a,(OFST+2,sp)
 491  0023 c75441        	ld	21569,a
 492  0026               L512:
 493                     ; 236 }
 496  0026 85            	popw	x
 497  0027 87            	retf	
 562                     ; 251 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 562                     ; 252 {
 563                     .text:	section	.text,new
 564  0000               f_COMP_GetOutputLevel:
 566  0000 88            	push	a
 567       00000001      OFST:	set	1
 570                     ; 256   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 572                     ; 259   if (COMP_Selection == COMP_Selection_COMP1)
 574  0001 4a            	dec	a
 575  0002 2609          	jrne	L742
 576                     ; 262     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 578  0004 7207544002    	btjf	21568,#3,L152
 579                     ; 265       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 581  0009 2007          	jpf	LC002
 582  000b               L152:
 583                     ; 271       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 584  000b 2009          	jpf	L752
 585  000d               L742:
 586                     ; 278     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 588  000d 7207544104    	btjf	21569,#3,L752
 589                     ; 281       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 591  0012               LC002:
 593  0012 a601          	ld	a,#1
 595  0014 2001          	jra	L552
 596  0016               L752:
 597                     ; 287       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 600  0016 4f            	clr	a
 601  0017               L552:
 602                     ; 292   return (COMP_OutputLevel_TypeDef)(compout);
 606  0017 5b01          	addw	sp,#1
 607  0019 87            	retf	
 641                     ; 324 void COMP_WindowCmd(FunctionalState NewState)
 641                     ; 325 {
 642                     .text:	section	.text,new
 643  0000               f_COMP_WindowCmd:
 647                     ; 327   assert_param(IS_FUNCTIONAL_STATE(NewState));
 649                     ; 329   if (NewState != DISABLE)
 651  0000 4d            	tnz	a
 652  0001 2705          	jreq	L103
 653                     ; 332     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 655  0003 72125442      	bset	21570,#1
 658  0007 87            	retf	
 659  0008               L103:
 660                     ; 337     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 662  0008 72135442      	bres	21570,#1
 663                     ; 339 }
 666  000c 87            	retf	
 701                     ; 362 void COMP_VrefintOutputCmd(FunctionalState NewState)
 701                     ; 363 {
 702                     .text:	section	.text,new
 703  0000               f_COMP_VrefintOutputCmd:
 707                     ; 365   assert_param(IS_FUNCTIONAL_STATE(NewState));
 709                     ; 367   if (NewState != DISABLE)
 711  0000 4d            	tnz	a
 712  0001 2705          	jreq	L323
 713                     ; 370     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 715  0003 72105442      	bset	21570,#0
 718  0007 87            	retf	
 719  0008               L323:
 720                     ; 375     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 722  0008 72115442      	bres	21570,#0
 723                     ; 377 }
 726  000c 87            	retf	
 761                     ; 401 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 761                     ; 402 {
 762                     .text:	section	.text,new
 763  0000               f_COMP_SchmittTriggerCmd:
 767                     ; 404   assert_param(IS_FUNCTIONAL_STATE(NewState));
 769                     ; 406   if (NewState != DISABLE)
 771  0000 4d            	tnz	a
 772  0001 2705          	jreq	L543
 773                     ; 409     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 775  0003 72145440      	bset	21568,#2
 778  0007 87            	retf	
 779  0008               L543:
 780                     ; 414     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 782  0008 72155440      	bres	21568,#2
 783                     ; 416 }
 786  000c 87            	retf	
 905                     ; 435 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 905                     ; 436                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 905                     ; 437                         FunctionalState NewState)
 905                     ; 438 {
 906                     .text:	section	.text,new
 907  0000               f_COMP_TriggerConfig:
 909  0000 89            	pushw	x
 910       00000000      OFST:	set	0
 913                     ; 440   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 915                     ; 441   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 917                     ; 443   switch (COMP_TriggerGroup)
 919  0001 9e            	ld	a,xh
 921                     ; 490     default:
 921                     ; 491       break;
 922  0002 4a            	dec	a
 923  0003 270b          	jreq	L153
 924  0005 4a            	dec	a
 925  0006 2717          	jreq	L353
 926  0008 4a            	dec	a
 927  0009 2730          	jreq	L553
 928  000b 4a            	dec	a
 929  000c 2740          	jreq	L753
 930  000e 2058          	jra	L144
 931  0010               L153:
 932                     ; 445     case COMP_TriggerGroup_InvertingInput:
 932                     ; 446 
 932                     ; 447       if (NewState != DISABLE)
 934  0010 7b06          	ld	a,(OFST+6,sp)
 935  0012 2704          	jreq	L344
 936                     ; 449         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 938  0014 7b02          	ld	a,(OFST+2,sp)
 940  0016 2010          	jpf	LC005
 941  0018               L344:
 942                     ; 453         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 944  0018 c65443        	ld	a,21571
 945  001b 1a02          	or	a,(OFST+2,sp)
 946  001d 2017          	jpf	LC004
 947  001f               L353:
 948                     ; 457     case COMP_TriggerGroup_NonInvertingInput:
 948                     ; 458       if (NewState != DISABLE)
 950  001f 7b06          	ld	a,(OFST+6,sp)
 951  0021 270b          	jreq	L744
 952                     ; 460         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 954  0023 7b02          	ld	a,(OFST+2,sp)
 955  0025 48            	sll	a
 956  0026 48            	sll	a
 957  0027 48            	sll	a
 958  0028               LC005:
 959  0028 43            	cpl	a
 960  0029 c45443        	and	a,21571
 962  002c 2008          	jpf	LC004
 963  002e               L744:
 964                     ; 464         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 966  002e 7b02          	ld	a,(OFST+2,sp)
 967  0030 48            	sll	a
 968  0031 48            	sll	a
 969  0032 48            	sll	a
 970  0033 ca5443        	or	a,21571
 971  0036               LC004:
 972  0036 c75443        	ld	21571,a
 973  0039 202d          	jra	L144
 974  003b               L553:
 975                     ; 468     case COMP_TriggerGroup_VREFINTOutput:
 975                     ; 469       if (NewState != DISABLE)
 977  003b 7b06          	ld	a,(OFST+6,sp)
 978  003d 2708          	jreq	L354
 979                     ; 471         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
 981  003f 7b02          	ld	a,(OFST+2,sp)
 982  0041 43            	cpl	a
 983  0042 c45444        	and	a,21572
 985  0045 201e          	jpf	LC003
 986  0047               L354:
 987                     ; 475         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
 989  0047 c65444        	ld	a,21572
 990  004a 1a02          	or	a,(OFST+2,sp)
 991  004c 2017          	jpf	LC003
 992  004e               L753:
 993                     ; 479     case COMP_TriggerGroup_DACOutput:
 993                     ; 480       if (NewState != DISABLE)
 995  004e 7b06          	ld	a,(OFST+6,sp)
 996  0050 270b          	jreq	L754
 997                     ; 482         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 999  0052 7b02          	ld	a,(OFST+2,sp)
1000  0054 48            	sll	a
1001  0055 48            	sll	a
1002  0056 48            	sll	a
1003  0057 43            	cpl	a
1004  0058 c45444        	and	a,21572
1006  005b 2008          	jpf	LC003
1007  005d               L754:
1008                     ; 486         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1010  005d 7b02          	ld	a,(OFST+2,sp)
1011  005f 48            	sll	a
1012  0060 48            	sll	a
1013  0061 48            	sll	a
1014  0062 ca5444        	or	a,21572
1015  0065               LC003:
1016  0065 c75444        	ld	21572,a
1017                     ; 490     default:
1017                     ; 491       break;
1019  0068               L144:
1020                     ; 493 }
1023  0068 85            	popw	x
1024  0069 87            	retf	
1068                     ; 521 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1068                     ; 522 {
1069                     .text:	section	.text,new
1070  0000               f_COMP_ITConfig:
1072  0000 89            	pushw	x
1073       00000000      OFST:	set	0
1076                     ; 524   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1078                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1080                     ; 528   if (COMP_Selection == COMP_Selection_COMP1)
1082  0001 9e            	ld	a,xh
1083  0002 4a            	dec	a
1084  0003 2610          	jrne	L505
1085                     ; 530     if (NewState != DISABLE)
1087  0005 9f            	ld	a,xl
1088  0006 4d            	tnz	a
1089  0007 2706          	jreq	L705
1090                     ; 533       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1092  0009 721a5440      	bset	21568,#5
1094  000d 2014          	jra	L315
1095  000f               L705:
1096                     ; 538       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1098  000f 721b5440      	bres	21568,#5
1099  0013 200e          	jra	L315
1100  0015               L505:
1101                     ; 543     if (NewState != DISABLE)
1103  0015 7b02          	ld	a,(OFST+2,sp)
1104  0017 2706          	jreq	L515
1105                     ; 546       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1107  0019 721a5441      	bset	21569,#5
1109  001d 2004          	jra	L315
1110  001f               L515:
1111                     ; 551       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1113  001f 721b5441      	bres	21569,#5
1114  0023               L315:
1115                     ; 554 }
1118  0023 85            	popw	x
1119  0024 87            	retf	
1184                     ; 564 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1184                     ; 565 {
1185                     .text:	section	.text,new
1186  0000               f_COMP_GetFlagStatus:
1188  0000 88            	push	a
1189       00000001      OFST:	set	1
1192                     ; 566   FlagStatus bitstatus = RESET;
1194  0001 0f01          	clr	(OFST+0,sp)
1195                     ; 569   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1197                     ; 572   if (COMP_Selection == COMP_Selection_COMP1)
1199  0003 4a            	dec	a
1200  0004 2609          	jrne	L355
1201                     ; 574     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1203  0006 7209544002    	btjf	21568,#4,L555
1204                     ; 577       bitstatus = SET;
1206  000b 2007          	jpf	LC007
1207  000d               L555:
1208                     ; 582       bitstatus = RESET;
1209  000d 2009          	jpf	L365
1210  000f               L355:
1211                     ; 587     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1213  000f 7209544104    	btjf	21569,#4,L365
1214                     ; 590       bitstatus = SET;
1216  0014               LC007:
1218  0014 a601          	ld	a,#1
1220  0016 2001          	jra	L165
1221  0018               L365:
1222                     ; 595       bitstatus = RESET;
1225  0018 4f            	clr	a
1226  0019               L165:
1227                     ; 600   return (FlagStatus)(bitstatus);
1231  0019 5b01          	addw	sp,#1
1232  001b 87            	retf	
1266                     ; 611 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1266                     ; 612 {
1267                     .text:	section	.text,new
1268  0000               f_COMP_ClearFlag:
1272                     ; 614   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1274                     ; 616   if (COMP_Selection == COMP_Selection_COMP1)
1276  0000 4a            	dec	a
1277  0001 2605          	jrne	L506
1278                     ; 619     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1280  0003 72195440      	bres	21568,#4
1283  0007 87            	retf	
1284  0008               L506:
1285                     ; 624     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1287  0008 72195441      	bres	21569,#4
1288                     ; 626 }
1291  000c 87            	retf	
1350                     ; 636 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1350                     ; 637 {
1351                     .text:	section	.text,new
1352  0000               f_COMP_GetITStatus:
1354  0000 88            	push	a
1355  0001 89            	pushw	x
1356       00000002      OFST:	set	2
1359                     ; 638   ITStatus bitstatus = RESET;
1361                     ; 639   uint8_t itstatus = 0x00, itenable = 0x00;
1365  0002 7b02          	ld	a,(OFST+0,sp)
1366  0004 97            	ld	xl,a
1367                     ; 642   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1369                     ; 644   if (COMP_Selection == COMP_Selection_COMP1)
1371  0005 7b03          	ld	a,(OFST+1,sp)
1372  0007 4a            	dec	a
1373  0008 2618          	jrne	L736
1374                     ; 647     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1376  000a c65440        	ld	a,21568
1377  000d a410          	and	a,#16
1378  000f 6b01          	ld	(OFST-1,sp),a
1379                     ; 650     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1381  0011 c65440        	ld	a,21568
1382  0014 a420          	and	a,#32
1383  0016 6b02          	ld	(OFST+0,sp),a
1384                     ; 652     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1386  0018 7b01          	ld	a,(OFST-1,sp)
1387  001a 2720          	jreq	L746
1389  001c 7b02          	ld	a,(OFST+0,sp)
1390  001e 271c          	jreq	L746
1391                     ; 655       bitstatus = SET;
1393  0020 2016          	jpf	LC009
1394                     ; 660       bitstatus = RESET;
1395  0022               L736:
1396                     ; 666     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1398  0022 c65441        	ld	a,21569
1399  0025 a410          	and	a,#16
1400  0027 6b01          	ld	(OFST-1,sp),a
1401                     ; 669     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1403  0029 c65441        	ld	a,21569
1404  002c a420          	and	a,#32
1405  002e 6b02          	ld	(OFST+0,sp),a
1406                     ; 671     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1408  0030 7b01          	ld	a,(OFST-1,sp)
1409  0032 2708          	jreq	L746
1411  0034 7b02          	ld	a,(OFST+0,sp)
1412  0036 2704          	jreq	L746
1413                     ; 674       bitstatus = SET;
1415  0038               LC009:
1417  0038 a601          	ld	a,#1
1419  003a 2001          	jra	L546
1420  003c               L746:
1421                     ; 679       bitstatus = RESET;
1424  003c 4f            	clr	a
1425  003d               L546:
1426                     ; 684   return (ITStatus) bitstatus;
1430  003d 5b03          	addw	sp,#3
1431  003f 87            	retf	
1466                     ; 695 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1466                     ; 696 {
1467                     .text:	section	.text,new
1468  0000               f_COMP_ClearITPendingBit:
1472                     ; 698   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1474                     ; 700   if (COMP_Selection == COMP_Selection_COMP1)
1476  0000 4a            	dec	a
1477  0001 2605          	jrne	L176
1478                     ; 703     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1480  0003 72195440      	bres	21568,#4
1483  0007 87            	retf	
1484  0008               L176:
1485                     ; 708     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1487  0008 72195441      	bres	21569,#4
1488                     ; 710 }
1491  000c 87            	retf	
1503                     	xdef	f_COMP_ClearITPendingBit
1504                     	xdef	f_COMP_GetITStatus
1505                     	xdef	f_COMP_ClearFlag
1506                     	xdef	f_COMP_GetFlagStatus
1507                     	xdef	f_COMP_ITConfig
1508                     	xdef	f_COMP_TriggerConfig
1509                     	xdef	f_COMP_SchmittTriggerCmd
1510                     	xdef	f_COMP_VrefintOutputCmd
1511                     	xdef	f_COMP_WindowCmd
1512                     	xdef	f_COMP_GetOutputLevel
1513                     	xdef	f_COMP_EdgeConfig
1514                     	xdef	f_COMP_VrefintToCOMP1Connect
1515                     	xdef	f_COMP_Init
1516                     	xdef	f_COMP_DeInit
1535                     	end
