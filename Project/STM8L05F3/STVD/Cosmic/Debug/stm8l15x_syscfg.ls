   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 119 void SYSCFG_RIDeInit(void)
  33                     ; 120 {
  34                     .text:	section	.text,new
  35  0000               f_SYSCFG_RIDeInit:
  39                     ; 121   RI->ICR1   = RI_ICR1_RESET_VALUE;     /*!< Set RI->ICR1 to reset value */
  41  0000 725f5431      	clr	21553
  42                     ; 122   RI->ICR2   = RI_ICR2_RESET_VALUE;     /*!< Set RI->ICR2 to reset value */
  44  0004 725f5432      	clr	21554
  45                     ; 123   RI->IOSR1  = RI_IOSR1_RESET_VALUE;    /*!< Set RI->IOSR1 to reset value */
  47  0008 725f5439      	clr	21561
  48                     ; 124   RI->IOSR2  = RI_IOSR2_RESET_VALUE;    /*!< Set RI->IOSR2 to reset value */
  50  000c 725f543a      	clr	21562
  51                     ; 125   RI->IOSR3  = RI_IOSR3_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  53  0010 725f543b      	clr	21563
  54                     ; 126   RI->IOSR4  = RI_IOSR4_RESET_VALUE;    /*!< Set RI->IOSR3 to reset value */
  56  0014 725f5457      	clr	21591
  57                     ; 127   RI->ASCR1  = RI_ASCR1_RESET_VALUE;    /*!< Set RI->ASCR1 to reset value */
  59  0018 725f543d      	clr	21565
  60                     ; 128   RI->ASCR2  = RI_ASCR2_RESET_VALUE;    /*!< Set RI->ASCR2 to reset value */
  62  001c 725f543e      	clr	21566
  63                     ; 129   RI->RCR    = RI_RCR_RESET_VALUE;      /*!< Set RI->RCR to reset value */
  65  0020 725f543f      	clr	21567
  66                     ; 130 }
  69  0024 87            	retf	
 327                     ; 142 void SYSCFG_RITIMInputCaptureConfig(RI_InputCapture_TypeDef RI_InputCapture,
 327                     ; 143                                     RI_InputCaptureRouting_TypeDef RI_InputCaptureRouting)
 327                     ; 144 {
 328                     .text:	section	.text,new
 329  0000               f_SYSCFG_RITIMInputCaptureConfig:
 331  0000 89            	pushw	x
 332       00000000      OFST:	set	0
 335                     ; 146   assert_param(IS_RI_INPUTCAPTURE(RI_InputCapture));
 337                     ; 147   assert_param(IS_RI_INPUTCAPTUREROUTING(RI_InputCaptureRouting));
 339                     ; 150   if (RI_InputCapture == RI_InputCapture_IC2)
 341  0001 9e            	ld	a,xh
 342  0002 a102          	cp	a,#2
 343  0004 2606          	jrne	L531
 344                     ; 153     RI->ICR1 = (uint8_t) RI_InputCaptureRouting;
 346  0006 9f            	ld	a,xl
 347  0007 c75431        	ld	21553,a
 349  000a 2005          	jra	L731
 350  000c               L531:
 351                     ; 159     RI->ICR2 = (uint8_t) RI_InputCaptureRouting;
 353  000c 7b02          	ld	a,(OFST+2,sp)
 354  000e c75432        	ld	21554,a
 355  0011               L731:
 356                     ; 161 }
 359  0011 85            	popw	x
 360  0012 87            	retf	
 537                     ; 184 void SYSCFG_RIAnalogSwitchConfig(RI_AnalogSwitch_TypeDef RI_AnalogSwitch,
 537                     ; 185                                  FunctionalState NewState)
 537                     ; 186 {
 538                     .text:	section	.text,new
 539  0000               f_SYSCFG_RIAnalogSwitchConfig:
 541  0000 89            	pushw	x
 542  0001 89            	pushw	x
 543       00000002      OFST:	set	2
 546                     ; 187   uint8_t AnalogSwitchRegister, AnalogSwitchIndex = 0;
 548                     ; 190   assert_param(IS_RI_ANALOGSWITCH(RI_AnalogSwitch));
 550                     ; 191   assert_param(IS_FUNCTIONAL_STATE(NewState));
 552                     ; 194   AnalogSwitchRegister = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0xF0);
 554  0002 7b03          	ld	a,(OFST+1,sp)
 555  0004 a4f0          	and	a,#240
 556  0006 6b01          	ld	(OFST-1,sp),a
 557                     ; 197   AnalogSwitchIndex = (uint8_t) (RI_AnalogSwitch & (uint8_t) 0x0F);
 559  0008 7b03          	ld	a,(OFST+1,sp)
 560  000a a40f          	and	a,#15
 561  000c 6b02          	ld	(OFST+0,sp),a
 562                     ; 199   if (NewState != DISABLE)
 564  000e 7b04          	ld	a,(OFST+2,sp)
 565  0010 272a          	jreq	L532
 566                     ; 201     if (AnalogSwitchRegister == (uint8_t) 0x10)
 568  0012 7b01          	ld	a,(OFST-1,sp)
 569  0014 a110          	cp	a,#16
 570  0016 2612          	jrne	L732
 571                     ; 204       RI->ASCR1 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 573  0018 7b02          	ld	a,(OFST+0,sp)
 574  001a 5f            	clrw	x
 575  001b 97            	ld	xl,a
 576  001c a601          	ld	a,#1
 577  001e 5d            	tnzw	x
 578  001f 2704          	jreq	L21
 579  0021               L41:
 580  0021 48            	sll	a
 581  0022 5a            	decw	x
 582  0023 26fc          	jrne	L41
 583  0025               L21:
 584  0025 ca543d        	or	a,21565
 586  0028 2029          	jpf	LC002
 587  002a               L732:
 588                     ; 209       RI->ASCR2 |= (uint8_t) ((uint8_t)1 << (uint8_t) AnalogSwitchIndex);
 590  002a 7b02          	ld	a,(OFST+0,sp)
 591  002c 5f            	clrw	x
 592  002d 97            	ld	xl,a
 593  002e a601          	ld	a,#1
 594  0030 5d            	tnzw	x
 595  0031 2704          	jreq	L61
 596  0033               L02:
 597  0033 48            	sll	a
 598  0034 5a            	decw	x
 599  0035 26fc          	jrne	L02
 600  0037               L61:
 601  0037 ca543e        	or	a,21566
 602  003a 202d          	jpf	LC001
 603  003c               L532:
 604                     ; 214     if (AnalogSwitchRegister == (uint8_t) 0x10)
 606  003c 7b01          	ld	a,(OFST-1,sp)
 607  003e a110          	cp	a,#16
 608  0040 2616          	jrne	L542
 609                     ; 217       RI->ASCR1 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  AnalogSwitchIndex));
 611  0042 7b02          	ld	a,(OFST+0,sp)
 612  0044 5f            	clrw	x
 613  0045 97            	ld	xl,a
 614  0046 a601          	ld	a,#1
 615  0048 5d            	tnzw	x
 616  0049 2704          	jreq	L22
 617  004b               L42:
 618  004b 48            	sll	a
 619  004c 5a            	decw	x
 620  004d 26fc          	jrne	L42
 621  004f               L22:
 622  004f 43            	cpl	a
 623  0050 c4543d        	and	a,21565
 624  0053               LC002:
 625  0053 c7543d        	ld	21565,a
 627  0056 2014          	jra	L342
 628  0058               L542:
 629                     ; 222       RI->ASCR2 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << AnalogSwitchIndex));
 631  0058 7b02          	ld	a,(OFST+0,sp)
 632  005a 5f            	clrw	x
 633  005b 97            	ld	xl,a
 634  005c a601          	ld	a,#1
 635  005e 5d            	tnzw	x
 636  005f 2704          	jreq	L62
 637  0061               L03:
 638  0061 48            	sll	a
 639  0062 5a            	decw	x
 640  0063 26fc          	jrne	L03
 641  0065               L62:
 642  0065 43            	cpl	a
 643  0066 c4543e        	and	a,21566
 644  0069               LC001:
 645  0069 c7543e        	ld	21566,a
 646  006c               L342:
 647                     ; 225 }
 650  006c 5b04          	addw	sp,#4
 651  006e 87            	retf	
 912                     ; 234 void SYSCFG_RIIOSwitchConfig(RI_IOSwitch_TypeDef RI_IOSwitch,
 912                     ; 235                              FunctionalState NewState)
 912                     ; 236 {
 913                     .text:	section	.text,new
 914  0000               f_SYSCFG_RIIOSwitchConfig:
 916  0000 89            	pushw	x
 917  0001 89            	pushw	x
 918       00000002      OFST:	set	2
 921                     ; 237   uint8_t IOSwitchRegister, IOSwitchIndex = 0;
 923                     ; 240   assert_param(IS_RI_IOSWITCH(RI_IOSwitch));
 925                     ; 241   assert_param(IS_FUNCTIONAL_STATE(NewState));
 927                     ; 244   IOSwitchIndex = (uint8_t) (RI_IOSwitch & (uint8_t) 0x0F);
 929  0002 7b03          	ld	a,(OFST+1,sp)
 930  0004 a40f          	and	a,#15
 931  0006 6b02          	ld	(OFST+0,sp),a
 932                     ; 247   IOSwitchRegister = (uint8_t) (RI_IOSwitch & (uint8_t) 0xF0);
 934  0008 7b03          	ld	a,(OFST+1,sp)
 935  000a a4f0          	and	a,#240
 936  000c 6b01          	ld	(OFST-1,sp),a
 937                     ; 250   if (IOSwitchRegister == (uint8_t) 0x10)
 939  000e a110          	cp	a,#16
 940  0010 2633          	jrne	L373
 941                     ; 252     if (NewState != DISABLE)
 943  0012 7b04          	ld	a,(OFST+2,sp)
 944  0014 2717          	jreq	L573
 945                     ; 255       RI->IOSR1 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 947  0016 7b02          	ld	a,(OFST+0,sp)
 948  0018 5f            	clrw	x
 949  0019 97            	ld	xl,a
 950  001a a601          	ld	a,#1
 951  001c 5d            	tnzw	x
 952  001d 2704          	jreq	L43
 953  001f               L63:
 954  001f 48            	sll	a
 955  0020 5a            	decw	x
 956  0021 26fc          	jrne	L63
 957  0023               L43:
 958  0023 ca5439        	or	a,21561
 959  0026 c75439        	ld	21561,a
 961  0029 acd200d2      	jra	L104
 962  002d               L573:
 963                     ; 260       RI->IOSR1 &= (uint8_t) (~ (uint8_t)((uint8_t)1 << IOSwitchIndex));
 965  002d 7b02          	ld	a,(OFST+0,sp)
 966  002f 5f            	clrw	x
 967  0030 97            	ld	xl,a
 968  0031 a601          	ld	a,#1
 969  0033 5d            	tnzw	x
 970  0034 2704          	jreq	L04
 971  0036               L24:
 972  0036 48            	sll	a
 973  0037 5a            	decw	x
 974  0038 26fc          	jrne	L24
 975  003a               L04:
 976  003a 43            	cpl	a
 977  003b c45439        	and	a,21561
 978  003e c75439        	ld	21561,a
 979  0041 acd200d2      	jra	L104
 980  0045               L373:
 981                     ; 265   else if (IOSwitchRegister == (uint8_t) 0x20)
 983  0045 a120          	cp	a,#32
 984  0047 262f          	jrne	L304
 985                     ; 267     if (NewState != DISABLE)
 987  0049 7b04          	ld	a,(OFST+2,sp)
 988  004b 2715          	jreq	L504
 989                     ; 270       RI->IOSR2 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
 991  004d 7b02          	ld	a,(OFST+0,sp)
 992  004f 5f            	clrw	x
 993  0050 97            	ld	xl,a
 994  0051 a601          	ld	a,#1
 995  0053 5d            	tnzw	x
 996  0054 2704          	jreq	L44
 997  0056               L64:
 998  0056 48            	sll	a
 999  0057 5a            	decw	x
1000  0058 26fc          	jrne	L64
1001  005a               L44:
1002  005a ca543a        	or	a,21562
1003  005d c7543a        	ld	21562,a
1005  0060 2070          	jra	L104
1006  0062               L504:
1007                     ; 275       RI->IOSR2 &= (uint8_t) (~(uint8_t)((uint8_t)1 <<  IOSwitchIndex));
1009  0062 7b02          	ld	a,(OFST+0,sp)
1010  0064 5f            	clrw	x
1011  0065 97            	ld	xl,a
1012  0066 a601          	ld	a,#1
1013  0068 5d            	tnzw	x
1014  0069 2704          	jreq	L05
1015  006b               L25:
1016  006b 48            	sll	a
1017  006c 5a            	decw	x
1018  006d 26fc          	jrne	L25
1019  006f               L05:
1020  006f 43            	cpl	a
1021  0070 c4543a        	and	a,21562
1022  0073 c7543a        	ld	21562,a
1023  0076 205a          	jra	L104
1024  0078               L304:
1025                     ; 280   else if (IOSwitchRegister == (uint8_t) 0x30)
1027  0078 a130          	cp	a,#48
1028  007a 262c          	jrne	L314
1029                     ; 282     if (NewState != DISABLE)
1031  007c 7b04          	ld	a,(OFST+2,sp)
1032  007e 2712          	jreq	L514
1033                     ; 285       RI->IOSR3 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1035  0080 7b02          	ld	a,(OFST+0,sp)
1036  0082 5f            	clrw	x
1037  0083 97            	ld	xl,a
1038  0084 a601          	ld	a,#1
1039  0086 5d            	tnzw	x
1040  0087 2704          	jreq	L45
1041  0089               L65:
1042  0089 48            	sll	a
1043  008a 5a            	decw	x
1044  008b 26fc          	jrne	L65
1045  008d               L45:
1046  008d ca543b        	or	a,21563
1048  0090 2011          	jpf	LC004
1049  0092               L514:
1050                     ; 290       RI->IOSR3 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1052  0092 7b02          	ld	a,(OFST+0,sp)
1053  0094 5f            	clrw	x
1054  0095 97            	ld	xl,a
1055  0096 a601          	ld	a,#1
1056  0098 5d            	tnzw	x
1057  0099 2704          	jreq	L06
1058  009b               L26:
1059  009b 48            	sll	a
1060  009c 5a            	decw	x
1061  009d 26fc          	jrne	L26
1062  009f               L06:
1063  009f 43            	cpl	a
1064  00a0 c4543b        	and	a,21563
1065  00a3               LC004:
1066  00a3 c7543b        	ld	21563,a
1067  00a6 202a          	jra	L104
1068  00a8               L314:
1069                     ; 297     if (NewState != DISABLE)
1071  00a8 7b04          	ld	a,(OFST+2,sp)
1072  00aa 2712          	jreq	L324
1073                     ; 300       RI->IOSR4 |= (uint8_t) ((uint8_t)1 << IOSwitchIndex);
1075  00ac 7b02          	ld	a,(OFST+0,sp)
1076  00ae 5f            	clrw	x
1077  00af 97            	ld	xl,a
1078  00b0 a601          	ld	a,#1
1079  00b2 5d            	tnzw	x
1080  00b3 2704          	jreq	L46
1081  00b5               L66:
1082  00b5 48            	sll	a
1083  00b6 5a            	decw	x
1084  00b7 26fc          	jrne	L66
1085  00b9               L46:
1086  00b9 ca5457        	or	a,21591
1088  00bc 2011          	jpf	LC003
1089  00be               L324:
1090                     ; 305       RI->IOSR4 &= (uint8_t) (~ (uint8_t) ((uint8_t) 1 << IOSwitchIndex));
1092  00be 7b02          	ld	a,(OFST+0,sp)
1093  00c0 5f            	clrw	x
1094  00c1 97            	ld	xl,a
1095  00c2 a601          	ld	a,#1
1096  00c4 5d            	tnzw	x
1097  00c5 2704          	jreq	L07
1098  00c7               L27:
1099  00c7 48            	sll	a
1100  00c8 5a            	decw	x
1101  00c9 26fc          	jrne	L27
1102  00cb               L07:
1103  00cb 43            	cpl	a
1104  00cc c45457        	and	a,21591
1105  00cf               LC003:
1106  00cf c75457        	ld	21591,a
1107  00d2               L104:
1108                     ; 308 }
1111  00d2 5b04          	addw	sp,#4
1112  00d4 87            	retf	
1191                     ; 320 void SYSCFG_RIResistorConfig(RI_Resistor_TypeDef RI_Resistor, FunctionalState NewState)
1191                     ; 321 {
1192                     .text:	section	.text,new
1193  0000               f_SYSCFG_RIResistorConfig:
1195  0000 89            	pushw	x
1196       00000000      OFST:	set	0
1199                     ; 323   assert_param(IS_RI_RESISTOR(RI_Resistor));
1201                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
1203                     ; 326   if (NewState != DISABLE)
1205  0001 9f            	ld	a,xl
1206  0002 4d            	tnz	a
1207  0003 2706          	jreq	L564
1208                     ; 329     RI->RCR |= (uint8_t) RI_Resistor;
1210  0005 9e            	ld	a,xh
1211  0006 ca543f        	or	a,21567
1213  0009 2006          	jra	L764
1214  000b               L564:
1215                     ; 334     RI->RCR &= (uint8_t) (~RI_Resistor);
1217  000b 7b01          	ld	a,(OFST+1,sp)
1218  000d 43            	cpl	a
1219  000e c4543f        	and	a,21567
1220  0011               L764:
1221  0011 c7543f        	ld	21567,a
1222                     ; 336 }
1225  0014 85            	popw	x
1226  0015 87            	retf	
1248                     ; 368 void SYSCFG_REMAPDeInit(void)
1248                     ; 369 {
1249                     .text:	section	.text,new
1250  0000               f_SYSCFG_REMAPDeInit:
1254                     ; 371   SYSCFG->RMPCR1 = SYSCFG_RMPCR1_RESET_VALUE;
1256  0000 350c509e      	mov	20638,#12
1257                     ; 374   SYSCFG->RMPCR2 = SYSCFG_RMPCR2_RESET_VALUE;
1259  0004 725f509f      	clr	20639
1260                     ; 377   SYSCFG->RMPCR3 = SYSCFG_RMPCR3_RESET_VALUE;
1262  0008 725f509d      	clr	20637
1263                     ; 378 }
1266  000c 87            	retf	
1481                     ; 411 void SYSCFG_REMAPPinConfig(REMAP_Pin_TypeDef REMAP_Pin, FunctionalState NewState)
1481                     ; 412 {
1482                     .text:	section	.text,new
1483  0000               f_SYSCFG_REMAPPinConfig:
1485  0000 89            	pushw	x
1486  0001 88            	push	a
1487       00000001      OFST:	set	1
1490                     ; 413   uint8_t regindex = 0;
1492  0002 0f01          	clr	(OFST+0,sp)
1493                     ; 415   assert_param(IS_REMAP_PIN(REMAP_Pin));
1495                     ; 416   assert_param(IS_FUNCTIONAL_STATE(NewState));
1497                     ; 419   regindex = (uint8_t) ((uint16_t) REMAP_Pin >> 8);
1499  0004 9e            	ld	a,xh
1500  0005 6b01          	ld	(OFST+0,sp),a
1501                     ; 422   if (regindex == 0x01)
1503  0007 a101          	cp	a,#1
1504  0009 261c          	jrne	L106
1505                     ; 424     SYSCFG->RMPCR1 &= (uint8_t)((uint8_t)((uint8_t)REMAP_Pin << 4) | (uint8_t)0x0F);
1507  000b a610          	ld	a,#16
1508  000d 42            	mul	x,a
1509  000e 9f            	ld	a,xl
1510  000f aa0f          	or	a,#15
1511  0011 c4509e        	and	a,20638
1512  0014 c7509e        	ld	20638,a
1513                     ; 425     if (NewState != DISABLE)
1515  0017 7b07          	ld	a,(OFST+6,sp)
1516  0019 273a          	jreq	L506
1517                     ; 427       SYSCFG->RMPCR1 |= (uint8_t)((uint16_t)REMAP_Pin & (uint16_t)0x00F0);
1519  001b 7b03          	ld	a,(OFST+2,sp)
1520  001d a4f0          	and	a,#240
1521  001f ca509e        	or	a,20638
1522  0022 c7509e        	ld	20638,a
1523  0025 202e          	jra	L506
1524  0027               L106:
1525                     ; 431   else if (regindex == 0x02)
1527  0027 a102          	cp	a,#2
1528  0029 2616          	jrne	L706
1529                     ; 433     if (NewState != DISABLE)
1531  002b 7b07          	ld	a,(OFST+6,sp)
1532  002d 2707          	jreq	L116
1533                     ; 435       SYSCFG->RMPCR2 |= (uint8_t) REMAP_Pin;
1535  002f c6509f        	ld	a,20639
1536  0032 1a03          	or	a,(OFST+2,sp)
1538  0034 2006          	jpf	LC006
1539  0036               L116:
1540                     ; 439       SYSCFG->RMPCR2 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1542  0036 7b03          	ld	a,(OFST+2,sp)
1543  0038 43            	cpl	a
1544  0039 c4509f        	and	a,20639
1545  003c               LC006:
1546  003c c7509f        	ld	20639,a
1547  003f 2014          	jra	L506
1548  0041               L706:
1549                     ; 445     if (NewState != DISABLE)
1551  0041 7b07          	ld	a,(OFST+6,sp)
1552  0043 2707          	jreq	L716
1553                     ; 447       SYSCFG->RMPCR3 |= (uint8_t) REMAP_Pin;
1555  0045 c6509d        	ld	a,20637
1556  0048 1a03          	or	a,(OFST+2,sp)
1558  004a 2006          	jpf	LC005
1559  004c               L716:
1560                     ; 451       SYSCFG->RMPCR3 &= (uint8_t)((uint16_t)(~(uint16_t)REMAP_Pin));
1562  004c 7b03          	ld	a,(OFST+2,sp)
1563  004e 43            	cpl	a
1564  004f c4509d        	and	a,20637
1565  0052               LC005:
1566  0052 c7509d        	ld	20637,a
1567  0055               L506:
1568                     ; 454 }
1571  0055 5b03          	addw	sp,#3
1572  0057 87            	retf	
1677                     ; 470 void SYSCFG_REMAPDMAChannelConfig(REMAP_DMAChannel_TypeDef REMAP_DMAChannel)
1677                     ; 471 {
1678                     .text:	section	.text,new
1679  0000               f_SYSCFG_REMAPDMAChannelConfig:
1681  0000 88            	push	a
1682       00000000      OFST:	set	0
1685                     ; 473   assert_param(IS_REMAP_DMACHANNEL(REMAP_DMAChannel));
1687                     ; 476   if ((REMAP_DMAChannel & 0xF0) != RESET)
1689  0001 a5f0          	bcp	a,#240
1690  0003 2707          	jreq	L566
1691                     ; 479     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_TIM4DMA_REMAP);
1693  0005 c6509e        	ld	a,20638
1694  0008 a4f3          	and	a,#243
1696  000a 2005          	jra	L766
1697  000c               L566:
1698                     ; 485     SYSCFG->RMPCR1 &= (uint8_t) (~SYSCFG_RMPCR1_ADC1DMA_REMAP);
1700  000c c6509e        	ld	a,20638
1701  000f a4fc          	and	a,#252
1702  0011               L766:
1703  0011 c7509e        	ld	20638,a
1704                     ; 488   SYSCFG->RMPCR1 |= (uint8_t) ((uint8_t)0x0F & REMAP_DMAChannel);
1706  0014 7b01          	ld	a,(OFST+1,sp)
1707  0016 a40f          	and	a,#15
1708  0018 ca509e        	or	a,20638
1709  001b c7509e        	ld	20638,a
1710                     ; 489 }
1713  001e 84            	pop	a
1714  001f 87            	retf	
1726                     	xdef	f_SYSCFG_REMAPDMAChannelConfig
1727                     	xdef	f_SYSCFG_REMAPPinConfig
1728                     	xdef	f_SYSCFG_REMAPDeInit
1729                     	xdef	f_SYSCFG_RIResistorConfig
1730                     	xdef	f_SYSCFG_RIIOSwitchConfig
1731                     	xdef	f_SYSCFG_RIAnalogSwitchConfig
1732                     	xdef	f_SYSCFG_RITIMInputCaptureConfig
1733                     	xdef	f_SYSCFG_RIDeInit
1752                     	end
