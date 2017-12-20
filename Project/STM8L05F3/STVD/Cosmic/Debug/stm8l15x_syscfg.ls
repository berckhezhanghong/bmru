   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 119 void SYSCFG_RIDeInit(void)
  33                     ; 120 {
  35                     .text:	section	.text,new
  36  0000               _SYSCFG_RIDeInit:
  40                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  42  0000 725f5431      	clr	21553
  43                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  45  0004 725f5432      	clr	21554
  46                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  48  0008 725f5439      	clr	21561
  49                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  51  000c 725f543a      	clr	21562
  52                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  54  0010 725f543b      	clr	21563
  55                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  57  0014 725f5457      	clr	21591
  58                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  60  0018 725f543d      	clr	21565
  61                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  63  001c 725f543e      	clr	21566
  64                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  66  0020 725f543f      	clr	21567
  67                     ; 130 }
  70  0024 81            	ret	
 329                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 329                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 329                     ; 144 {
 330                     .text:	section	.text,new
 331  0000               _SYSCFG_RITIMInputCaptureConfig:
 333  0000 89            	pushw	x
 334       00000000      OFST:	set	0
 337                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 339                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 341                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 343  0001 9e            	ld	a,xh
 344  0002 a102          	cp	a,#2
 345  0004 2606          	jrne	L531
 346                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 348  0006 9f            	ld	a,xl
 349  0007 c75431        	ld	21553,a
 351  000a 2005          	jra	L731
 352  000c               L531:
 353                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 355  000c 7b02          	ld	a,(OFST+2,sp)
 356  000e c75432        	ld	21554,a
 357  0011               L731:
 358                     ; 161 }
 361  0011 85            	popw	x
 362  0012 81            	ret	
 544                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 544                     ; 185                                  FunctionalState NewState)
 544                     ; 186 {
 545                     .text:	section	.text,new
 546  0000               _SYSCFG_RIAnalogSwitchConfig:
 548  0000 89            	pushw	x
 549  0001 89            	pushw	x
 550       00000002      OFST:	set	2
 553                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 555                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 557                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 559                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 561  0002 7b03          	ld	a,(OFST+1,sp)
 562  0004 a4f0          	and	a,#240
 563  0006 6b01          	ld	(OFST-1,sp),a
 564                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 566  0008 7b03          	ld	a,(OFST+1,sp)
 567  000a a40f          	and	a,#15
 568  000c 6b02          	ld	(OFST+0,sp),a
 569                     ; 199   if (NewState != DISABLE)
 571  000e 7b04          	ld	a,(OFST+2,sp)
 572  0010 2724          	jreq	L142
 573                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 575  0012 7b01          	ld	a,(OFST-1,sp)
 576  0014 a110          	cp	a,#16
 577  0016 260f          	jrne	L342
 578                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 580  0018 7b02          	ld	a,(OFST+0,sp)
 581  001a ad47          	call	LC003
 582  001c 2704          	jreq	L21
 583  001e               L41:
 584  001e 48            	sll	a
 585  001f 5a            	decw	x
 586  0020 26fc          	jrne	L41
 587  0022               L21:
 588  0022 ca543d        	or	a,21565
 590  0025 2023          	jp	LC002
 591  0027               L342:
 592                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 594  0027 7b02          	ld	a,(OFST+0,sp)
 595  0029 ad38          	call	LC003
 596  002b 2704          	jreq	L61
 597  002d               L02:
 598  002d 48            	sll	a
 599  002e 5a            	decw	x
 600  002f 26fc          	jrne	L02
 601  0031               L61:
 602  0031 ca543e        	or	a,21566
 603  0034 2027          	jp	LC001
 604  0036               L142:
 605                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 607  0036 7b01          	ld	a,(OFST-1,sp)
 608  0038 a110          	cp	a,#16
 609  003a 2613          	jrne	L152
 610                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 612  003c 7b02          	ld	a,(OFST+0,sp)
 613  003e ad23          	call	LC003
 614  0040 2704          	jreq	L22
 615  0042               L42:
 616  0042 48            	sll	a
 617  0043 5a            	decw	x
 618  0044 26fc          	jrne	L42
 619  0046               L22:
 620  0046 43            	cpl	a
 621  0047 c4543d        	and	a,21565
 622  004a               LC002:
 623  004a c7543d        	ld	21565,a
 625  004d 2011          	jra	L742
 626  004f               L152:
 627                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 629  004f 7b02          	ld	a,(OFST+0,sp)
 630  0051 ad10          	call	LC003
 631  0053 2704          	jreq	L62
 632  0055               L03:
 633  0055 48            	sll	a
 634  0056 5a            	decw	x
 635  0057 26fc          	jrne	L03
 636  0059               L62:
 637  0059 43            	cpl	a
 638  005a c4543e        	and	a,21566
 639  005d               LC001:
 640  005d c7543e        	ld	21566,a
 641  0060               L742:
 642                     ; 225 }
 645  0060 5b04          	addw	sp,#4
 646  0062 81            	ret	
 648  0063               LC003:
 649  0063 5f            	clrw	x
 650  0064 97            	ld	xl,a
 651  0065 a601          	ld	a,#1
 652  0067 5d            	tnzw	x
 653  0068 81            	ret	
 918                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 918                     ; 235                              FunctionalState NewState)
 918                     ; 236 {
 919                     .text:	section	.text,new
 920  0000               _SYSCFG_RIIOSwitchConfig:
 922  0000 89            	pushw	x
 923  0001 89            	pushw	x
 924       00000002      OFST:	set	2
 927                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 929                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 931                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 933                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 935  0002 7b03          	ld	a,(OFST+1,sp)
 936  0004 a40f          	and	a,#15
 937  0006 6b02          	ld	(OFST+0,sp),a
 938                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 940  0008 7b03          	ld	a,(OFST+1,sp)
 941  000a a4f0          	and	a,#240
 942  000c 6b01          	ld	(OFST-1,sp),a
 943                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 945  000e a110          	cp	a,#16
 946  0010 262c          	jrne	L304
 947                     ; 252     if (NewState != DISABLE)
 949  0012 7b04          	ld	a,(OFST+2,sp)
 950  0014 2714          	jreq	L504
 951                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 953  0016 7b02          	ld	a,(OFST+0,sp)
 954  0018 cd00bc        	call	LC006
 955  001b 2704          	jreq	L43
 956  001d               L63:
 957  001d 48            	sll	a
 958  001e 5a            	decw	x
 959  001f 26fc          	jrne	L63
 960  0021               L43:
 961  0021 ca5439        	or	a,21561
 962  0024 c75439        	ld	21561,a
 964  0027 cc00b9        	jra	L114
 965  002a               L504:
 966                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 968  002a 7b02          	ld	a,(OFST+0,sp)
 969  002c cd00bc        	call	LC006
 970  002f 2704          	jreq	L04
 971  0031               L24:
 972  0031 48            	sll	a
 973  0032 5a            	decw	x
 974  0033 26fc          	jrne	L24
 975  0035               L04:
 976  0035 43            	cpl	a
 977  0036 c45439        	and	a,21561
 978  0039 c75439        	ld	21561,a
 979  003c 207b          	jra	L114
 980  003e               L304:
 981                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
 983  003e a120          	cp	a,#32
 984  0040 2629          	jrne	L314
 985                     ; 267     if (NewState != DISABLE)
 987  0042 7b04          	ld	a,(OFST+2,sp)
 988  0044 2712          	jreq	L514
 989                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 991  0046 7b02          	ld	a,(OFST+0,sp)
 992  0048 ad72          	call	LC006
 993  004a 2704          	jreq	L44
 994  004c               L64:
 995  004c 48            	sll	a
 996  004d 5a            	decw	x
 997  004e 26fc          	jrne	L64
 998  0050               L44:
 999  0050 ca543a        	or	a,21562
1000  0053 c7543a        	ld	21562,a
1002  0056 2061          	jra	L114
1003  0058               L514:
1004                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1006  0058 7b02          	ld	a,(OFST+0,sp)
1007  005a ad60          	call	LC006
1008  005c 2704          	jreq	L05
1009  005e               L25:
1010  005e 48            	sll	a
1011  005f 5a            	decw	x
1012  0060 26fc          	jrne	L25
1013  0062               L05:
1014  0062 43            	cpl	a
1015  0063 c4543a        	and	a,21562
1016  0066 c7543a        	ld	21562,a
1017  0069 204e          	jra	L114
1018  006b               L314:
1019                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1021  006b a130          	cp	a,#48
1022  006d 2626          	jrne	L324
1023                     ; 282     if (NewState != DISABLE)
1025  006f 7b04          	ld	a,(OFST+2,sp)
1026  0071 270f          	jreq	L524
1027                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1029  0073 7b02          	ld	a,(OFST+0,sp)
1030  0075 ad45          	call	LC006
1031  0077 2704          	jreq	L45
1032  0079               L65:
1033  0079 48            	sll	a
1034  007a 5a            	decw	x
1035  007b 26fc          	jrne	L65
1036  007d               L45:
1037  007d ca543b        	or	a,21563
1039  0080 200e          	jp	LC005
1040  0082               L524:
1041                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1043  0082 7b02          	ld	a,(OFST+0,sp)
1044  0084 ad36          	call	LC006
1045  0086 2704          	jreq	L06
1046  0088               L26:
1047  0088 48            	sll	a
1048  0089 5a            	decw	x
1049  008a 26fc          	jrne	L26
1050  008c               L06:
1051  008c 43            	cpl	a
1052  008d c4543b        	and	a,21563
1053  0090               LC005:
1054  0090 c7543b        	ld	21563,a
1055  0093 2024          	jra	L114
1056  0095               L324:
1057                     ; 297     if (NewState != DISABLE)
1059  0095 7b04          	ld	a,(OFST+2,sp)
1060  0097 270f          	jreq	L334
1061                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1063  0099 7b02          	ld	a,(OFST+0,sp)
1064  009b ad1f          	call	LC006
1065  009d 2704          	jreq	L46
1066  009f               L66:
1067  009f 48            	sll	a
1068  00a0 5a            	decw	x
1069  00a1 26fc          	jrne	L66
1070  00a3               L46:
1071  00a3 ca5457        	or	a,21591
1073  00a6 200e          	jp	LC004
1074  00a8               L334:
1075                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1077  00a8 7b02          	ld	a,(OFST+0,sp)
1078  00aa ad10          	call	LC006
1079  00ac 2704          	jreq	L07
1080  00ae               L27:
1081  00ae 48            	sll	a
1082  00af 5a            	decw	x
1083  00b0 26fc          	jrne	L27
1084  00b2               L07:
1085  00b2 43            	cpl	a
1086  00b3 c45457        	and	a,21591
1087  00b6               LC004:
1088  00b6 c75457        	ld	21591,a
1089  00b9               L114:
1090                     ; 308 }
1093  00b9 5b04          	addw	sp,#4
1094  00bb 81            	ret	
1096  00bc               LC006:
1097  00bc 5f            	clrw	x
1098  00bd 97            	ld	xl,a
1099  00be a601          	ld	a,#1
1100  00c0 5d            	tnzw	x
1101  00c1 81            	ret	
1180                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1180                     ; 321 {
1181                     .text:	section	.text,new
1182  0000               _SYSCFG_RIResistorConfig:
1184  0000 89            	pushw	x
1185       00000000      OFST:	set	0
1188                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1190                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1192                     ; 326   if (NewState != DISABLE)
1194  0001 9f            	ld	a,xl
1195  0002 4d            	tnz	a
1196  0003 2706          	jreq	L574
1197                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1199  0005 9e            	ld	a,xh
1200  0006 ca543f        	or	a,21567
1202  0009 2006          	jra	L774
1203  000b               L574:
1204                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1206  000b 7b01          	ld	a,(OFST+1,sp)
1207  000d 43            	cpl	a
1208  000e c4543f        	and	a,21567
1209  0011               L774:
1210  0011 c7543f        	ld	21567,a
1211                     ; 336 }
1214  0014 85            	popw	x
1215  0015 81            	ret	
1238                     ; 368 void SYSCFG_REMAPDeInit(void)
1238                     ; 369 {
1239                     .text:	section	.text,new
1240  0000               _SYSCFG_REMAPDeInit:
1244                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1246  0000 350c509e      	mov	20638,#12
1247                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1249  0004 725f509f      	clr	20639
1250                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1252  0008 725f509d      	clr	20637
1253                     ; 378 }
1256  000c 81            	ret	
1474                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1474                     ; 412 {
1475                     .text:	section	.text,new
1476  0000               _SYSCFG_REMAPPinConfig:
1478  0000 89            	pushw	x
1479  0001 88            	push	a
1480       00000001      OFST:	set	1
1483                     ; 413   uint8_t regindex = 0;
1485  0002 0f01          	clr	(OFST+0,sp)
1486                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1488                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1490                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1492  0004 9e            	ld	a,xh
1493  0005 6b01          	ld	(OFST+0,sp),a
1494                     ; 422   if (regindex == 0x01)
1496  0007 a101          	cp	a,#1
1497  0009 261c          	jrne	L316
1498                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1500  000b a610          	ld	a,#16
1501  000d 42            	mul	x,a
1502  000e 9f            	ld	a,xl
1503  000f aa0f          	or	a,#15
1504  0011 c4509e        	and	a,20638
1505  0014 c7509e        	ld	20638,a
1506                     ; 425     if (NewState != DISABLE)
1508  0017 7b06          	ld	a,(OFST+5,sp)
1509  0019 273a          	jreq	L716
1510                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1512  001b 7b03          	ld	a,(OFST+2,sp)
1513  001d a4f0          	and	a,#240
1514  001f ca509e        	or	a,20638
1515  0022 c7509e        	ld	20638,a
1516  0025 202e          	jra	L716
1517  0027               L316:
1518                     ; 431   else if (regindex == 0x02)
1520  0027 a102          	cp	a,#2
1521  0029 2616          	jrne	L126
1522                     ; 433     if (NewState != DISABLE)
1524  002b 7b06          	ld	a,(OFST+5,sp)
1525  002d 2707          	jreq	L326
1526                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1528  002f c6509f        	ld	a,20639
1529  0032 1a03          	or	a,(OFST+2,sp)
1531  0034 2006          	jp	LC008
1532  0036               L326:
1533                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1535  0036 7b03          	ld	a,(OFST+2,sp)
1536  0038 43            	cpl	a
1537  0039 c4509f        	and	a,20639
1538  003c               LC008:
1539  003c c7509f        	ld	20639,a
1540  003f 2014          	jra	L716
1541  0041               L126:
1542                     ; 445     if (NewState != DISABLE)
1544  0041 7b06          	ld	a,(OFST+5,sp)
1545  0043 2707          	jreq	L136
1546                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1548  0045 c6509d        	ld	a,20637
1549  0048 1a03          	or	a,(OFST+2,sp)
1551  004a 2006          	jp	LC007
1552  004c               L136:
1553                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1555  004c 7b03          	ld	a,(OFST+2,sp)
1556  004e 43            	cpl	a
1557  004f c4509d        	and	a,20637
1558  0052               LC007:
1559  0052 c7509d        	ld	20637,a
1560  0055               L716:
1561                     ; 454 }
1564  0055 5b03          	addw	sp,#3
1565  0057 81            	ret	
1671                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1671                     ; 471 {
1672                     .text:	section	.text,new
1673  0000               _SYSCFG_REMAPDMAChannelConfig:
1675  0000 88            	push	a
1676       00000000      OFST:	set	0
1679                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1681                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1683  0001 a5f0          	bcp	a,#240
1684  0003 2707          	jreq	L776
1685                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1687  0005 c6509e        	ld	a,20638
1688  0008 a4f3          	and	a,#243
1690  000a 2005          	jra	L107
1691  000c               L776:
1692                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1694  000c c6509e        	ld	a,20638
1695  000f a4fc          	and	a,#252
1696  0011               L107:
1697  0011 c7509e        	ld	20638,a
1698                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1700  0014 7b01          	ld	a,(OFST+1,sp)
1701  0016 a40f          	and	a,#15
1702  0018 ca509e        	or	a,20638
1703  001b c7509e        	ld	20638,a
1704                     ; 489 }
1707  001e 84            	pop	a
1708  001f 81            	ret	
1721                     	xdef	_SYSCFG_REMAPDMAChannelConfig
1722                     	xdef	_SYSCFG_REMAPPinConfig
1723                     	xdef	_SYSCFG_REMAPDeInit
1724                     	xdef	_SYSCFG_RIResistorConfig
1725                     	xdef	_SYSCFG_RIIOSwitchConfig
1726                     	xdef	_SYSCFG_RIAnalogSwitchConfig
1727                     	xdef	_SYSCFG_RITIMInputCaptureConfig
1728                     	xdef	_SYSCFG_RIDeInit
1747                     	end
