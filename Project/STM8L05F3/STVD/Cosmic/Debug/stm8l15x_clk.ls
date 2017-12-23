   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
   5                     .const:	section	.text
   6  0000               _SYSDivFactor:
   7  0000 01            	dc.b	1
   8  0001 02            	dc.b	2
   9  0002 04            	dc.b	4
  10  0003 08            	dc.b	8
  11  0004 10            	dc.b	16
  40                     ; 120 void CLK_DeInit(void)
  40                     ; 121 {
  41                     .text:	section	.text,new
  42  0000               f_CLK_DeInit:
  46                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  48  0000 351150c2      	mov	20674,#17
  49                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  51  0004 725f50c6      	clr	20678
  52                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  54  0008 725f50c1      	clr	20673
  55                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  57  000c 725f50cb      	clr	20683
  58                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  60  0010 350150c8      	mov	20680,#1
  61                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  63  0014 725f50c9      	clr	20681
  64                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  66  0018 350350c0      	mov	20672,#3
  67                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  69  001c 725f50c3      	clr	20675
  70                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  72  0020 358050c4      	mov	20676,#128
  73                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  75  0024 725f50d0      	clr	20688
  76                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  78  0028 725f50ca      	clr	20682
  79                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  81  002c 725f50c5      	clr	20677
  82                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  84  0030 725f50cd      	clr	20685
  85                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  87  0034 725f50cc      	clr	20684
  88                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  90  0038 725f50ce      	clr	20686
  91                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  93  003c 35b950cf      	mov	20687,#185
  94                     ; 138 }
  97  0040 87            	retf	
 151                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 151                     ; 161 {
 152                     .text:	section	.text,new
 153  0000               f_CLK_HSICmd:
 157                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 159                     ; 165   if (NewState != DISABLE)
 161  0000 4d            	tnz	a
 162  0001 2705          	jreq	L74
 163                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 165  0003 721050c2      	bset	20674,#0
 168  0007 87            	retf	
 169  0008               L74:
 170                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 172  0008 721150c2      	bres	20674,#0
 173                     ; 175 }
 176  000c 87            	retf	
 209                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 209                     ; 189 {
 210                     .text:	section	.text,new
 211  0000               f_CLK_AdjustHSICalibrationValue:
 215                     ; 191   CLK->HSIUNLCKR = 0xAC;
 217  0000 35ac50ce      	mov	20686,#172
 218                     ; 192   CLK->HSIUNLCKR = 0x35;
 220  0004 353550ce      	mov	20686,#53
 221                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 223  0008 c750cd        	ld	20685,a
 224                     ; 196 }
 227  000b 87            	retf	
 261                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 261                     ; 213 {
 262                     .text:	section	.text,new
 263  0000               f_CLK_LSICmd:
 267                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 269                     ; 218   if (NewState != DISABLE)
 271  0000 4d            	tnz	a
 272  0001 2705          	jreq	L501
 273                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 275  0003 721450c2      	bset	20674,#2
 278  0007 87            	retf	
 279  0008               L501:
 280                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 282  0008 721550c2      	bres	20674,#2
 283                     ; 228 }
 286  000c 87            	retf	
 347                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 347                     ; 250 {
 348                     .text:	section	.text,new
 349  0000               f_CLK_HSEConfig:
 353                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 355                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 357  0000 721150c6      	bres	20678,#0
 358                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 360  0004 721950c6      	bres	20678,#4
 361                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 363  0008 ca50c6        	or	a,20678
 364  000b c750c6        	ld	20678,a
 365                     ; 263 }
 368  000e 87            	retf	
 429                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 429                     ; 281 {
 430                     .text:	section	.text,new
 431  0000               f_CLK_LSEConfig:
 435                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 437                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 439  0000 721550c6      	bres	20678,#2
 440                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 442  0004 721b50c6      	bres	20678,#5
 443                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 445  0008 ca50c6        	or	a,20678
 446  000b c750c6        	ld	20678,a
 447                     ; 295 }
 450  000e 87            	retf	
 473                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 473                     ; 307 {
 474                     .text:	section	.text,new
 475  0000               f_CLK_ClockSecuritySystemEnable:
 479                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 481  0000 721050ca      	bset	20682,#0
 482                     ; 310 }
 485  0004 87            	retf	
 520                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 520                     ; 318 {
 521                     .text:	section	.text,new
 522  0000               f_CLK_ClockSecuritySytemDeglitchCmd:
 526                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 528                     ; 322   if (NewState != DISABLE)
 530  0000 4d            	tnz	a
 531  0001 2705          	jreq	L712
 532                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 534  0003 721850ca      	bset	20682,#4
 537  0007 87            	retf	
 538  0008               L712:
 539                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 541  0008 721950ca      	bres	20682,#4
 542                     ; 332 }
 545  000c 87            	retf	
 685                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 685                     ; 357 {
 686                     .text:	section	.text,new
 687  0000               f_CLK_CCOConfig:
 689  0000 89            	pushw	x
 690       00000000      OFST:	set	0
 693                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 695                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 697                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 699  0001 9f            	ld	a,xl
 700  0002 1a01          	or	a,(OFST+1,sp)
 701  0004 c750c5        	ld	20677,a
 702                     ; 364 }
 705  0007 85            	popw	x
 706  0008 87            	retf	
 779                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 779                     ; 417 {
 780                     .text:	section	.text,new
 781  0000               f_CLK_SYSCLKSourceConfig:
 785                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 787                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 789  0000 c750c8        	ld	20680,a
 790                     ; 423 }
 793  0003 87            	retf	
 817                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 817                     ; 436 {
 818                     .text:	section	.text,new
 819  0000               f_CLK_GetSYSCLKSource:
 823                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 825  0000 c650c7        	ld	a,20679
 828  0003 87            	retf	
 891                     ; 478 uint32_t CLK_GetClockFreq(void)
 891                     ; 479 {
 892                     .text:	section	.text,new
 893  0000               f_CLK_GetClockFreq:
 895  0000 5209          	subw	sp,#9
 896       00000009      OFST:	set	9
 899                     ; 480   uint32_t clockfrequency = 0;
 901  0002 96            	ldw	x,sp
 902  0003 1c0005        	addw	x,#OFST-4
 903  0006 8d000000      	callf	d_ltor
 905                     ; 481   uint32_t sourcefrequency = 0;
 907  000a 5f            	clrw	x
 908  000b 1f07          	ldw	(OFST-2,sp),x
 909  000d 1f05          	ldw	(OFST-4,sp),x
 910                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 912                     ; 483   uint8_t tmp = 0, presc = 0;
 916                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 918  000f c650c7        	ld	a,20679
 919  0012 6b09          	ld	(OFST+0,sp),a
 920                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 922  0014 a101          	cp	a,#1
 923                     ; 490     sourcefrequency = HSI_VALUE;
 925  0016 2710          	jreq	LC002
 926                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 928  0018 a102          	cp	a,#2
 929  001a 2608          	jrne	L104
 930                     ; 494     sourcefrequency = LSI_VALUE;
 932  001c ae9470        	ldw	x,#38000
 933  001f 1f07          	ldw	(OFST-2,sp),x
 934  0021 5f            	clrw	x
 936  0022 200c          	jpf	LC001
 937  0024               L104:
 938                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 940  0024 a104          	cp	a,#4
 941  0026 260c          	jrne	L504
 942                     ; 498     sourcefrequency = HSE_VALUE;
 944  0028               LC002:
 946  0028 ae2400        	ldw	x,#9216
 947  002b 1f07          	ldw	(OFST-2,sp),x
 948  002d ae00f4        	ldw	x,#244
 949  0030               LC001:
 950  0030 1f05          	ldw	(OFST-4,sp),x
 952  0032 2008          	jra	L773
 953  0034               L504:
 954                     ; 502     clockfrequency = LSE_VALUE;
 956  0034 96            	ldw	x,sp
 957  0035 1c0005        	addw	x,#OFST-4
 958  0038 8d000000      	callf	d_ltor
 960  003c               L773:
 961                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 963  003c c650c0        	ld	a,20672
 964  003f a407          	and	a,#7
 965                     ; 507   presc = SYSDivFactor[tmp];
 967  0041 5f            	clrw	x
 968  0042 97            	ld	xl,a
 969  0043 d60000        	ld	a,(_SYSDivFactor,x)
 970  0046 6b09          	ld	(OFST+0,sp),a
 971                     ; 510   clockfrequency = sourcefrequency / presc;
 973  0048 b703          	ld	c_lreg+3,a
 974  004a 3f02          	clr	c_lreg+2
 975  004c 3f01          	clr	c_lreg+1
 976  004e 3f00          	clr	c_lreg
 977  0050 96            	ldw	x,sp
 978  0051 5c            	incw	x
 979  0052 8d000000      	callf	d_rtol
 981  0056 96            	ldw	x,sp
 982  0057 1c0005        	addw	x,#OFST-4
 983  005a 8d000000      	callf	d_ltor
 985  005e 96            	ldw	x,sp
 986  005f 5c            	incw	x
 987  0060 8d000000      	callf	d_ludv
 989  0064 96            	ldw	x,sp
 990  0065 1c0005        	addw	x,#OFST-4
 991  0068 8d000000      	callf	d_rtol
 993                     ; 512   return((uint32_t)clockfrequency);
 995  006c 96            	ldw	x,sp
 996  006d 1c0005        	addw	x,#OFST-4
 997  0070 8d000000      	callf	d_ltor
1001  0074 5b09          	addw	sp,#9
1002  0076 87            	retf	
1099                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1099                     ; 529 {
1100                     .text:	section	.text,new
1101  0000               f_CLK_SYSCLKDivConfig:
1105                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1107                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1109  0000 c750c0        	ld	20672,a
1110                     ; 534 }
1113  0003 87            	retf	
1148                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1148                     ; 542 {
1149                     .text:	section	.text,new
1150  0000               f_CLK_SYSCLKSourceSwitchCmd:
1154                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1156                     ; 546   if (NewState != DISABLE)
1158  0000 4d            	tnz	a
1159  0001 2705          	jreq	L174
1160                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1162  0003 721250c9      	bset	20681,#1
1165  0007 87            	retf	
1166  0008               L174:
1167                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1169  0008 721350c9      	bres	20681,#1
1170                     ; 556 }
1173  000c 87            	retf	
1318                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1318                     ; 617 {
1319                     .text:	section	.text,new
1320  0000               f_CLK_RTCClockConfig:
1322  0000 89            	pushw	x
1323       00000000      OFST:	set	0
1326                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1328                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1330                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1332  0001 9f            	ld	a,xl
1333  0002 1a01          	or	a,(OFST+1,sp)
1334  0004 c750c1        	ld	20673,a
1335                     ; 624 }
1338  0007 85            	popw	x
1339  0008 87            	retf	
1404                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1404                     ; 636 {
1405                     .text:	section	.text,new
1406  0000               f_CLK_BEEPClockConfig:
1410                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1412                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1414  0000 c750cb        	ld	20683,a
1415                     ; 643 }
1418  0003 87            	retf	
1640                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1640                     ; 678 {
1641                     .text:	section	.text,new
1642  0000               f_CLK_PeripheralClockConfig:
1644  0000 89            	pushw	x
1645  0001 88            	push	a
1646       00000001      OFST:	set	1
1649                     ; 679   uint8_t reg = 0;
1651  0002 0f01          	clr	(OFST+0,sp)
1652                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1654                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1656                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1658  0004 9e            	ld	a,xh
1659  0005 a4f0          	and	a,#240
1660  0007 6b01          	ld	(OFST+0,sp),a
1661                     ; 688   if ( reg == 0x00)
1663  0009 2633          	jrne	L117
1664                     ; 690     if (NewState != DISABLE)
1666  000b 7b03          	ld	a,(OFST+2,sp)
1667  000d 2717          	jreq	L317
1668                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1670  000f 7b02          	ld	a,(OFST+1,sp)
1671  0011 a40f          	and	a,#15
1672  0013 5f            	clrw	x
1673  0014 97            	ld	xl,a
1674  0015 a601          	ld	a,#1
1675  0017 5d            	tnzw	x
1676  0018 2704          	jreq	L64
1677  001a               L05:
1678  001a 48            	sll	a
1679  001b 5a            	decw	x
1680  001c 26fc          	jrne	L05
1681  001e               L64:
1682  001e ca50c3        	or	a,20675
1683  0021 c750c3        	ld	20675,a
1685  0024 207a          	jra	L717
1686  0026               L317:
1687                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1689  0026 7b02          	ld	a,(OFST+1,sp)
1690  0028 a40f          	and	a,#15
1691  002a 5f            	clrw	x
1692  002b 97            	ld	xl,a
1693  002c a601          	ld	a,#1
1694  002e 5d            	tnzw	x
1695  002f 2704          	jreq	L25
1696  0031               L45:
1697  0031 48            	sll	a
1698  0032 5a            	decw	x
1699  0033 26fc          	jrne	L45
1700  0035               L25:
1701  0035 43            	cpl	a
1702  0036 c450c3        	and	a,20675
1703  0039 c750c3        	ld	20675,a
1704  003c 2062          	jra	L717
1705  003e               L117:
1706                     ; 701   else if (reg == 0x10)
1708  003e a110          	cp	a,#16
1709  0040 2630          	jrne	L127
1710                     ; 703     if (NewState != DISABLE)
1712  0042 7b03          	ld	a,(OFST+2,sp)
1713  0044 2714          	jreq	L327
1714                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1716  0046 7b02          	ld	a,(OFST+1,sp)
1717  0048 a40f          	and	a,#15
1718  004a 5f            	clrw	x
1719  004b 97            	ld	xl,a
1720  004c a601          	ld	a,#1
1721  004e 5d            	tnzw	x
1722  004f 2704          	jreq	L65
1723  0051               L06:
1724  0051 48            	sll	a
1725  0052 5a            	decw	x
1726  0053 26fc          	jrne	L06
1727  0055               L65:
1728  0055 ca50c4        	or	a,20676
1730  0058 2013          	jpf	LC004
1731  005a               L327:
1732                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1734  005a 7b02          	ld	a,(OFST+1,sp)
1735  005c a40f          	and	a,#15
1736  005e 5f            	clrw	x
1737  005f 97            	ld	xl,a
1738  0060 a601          	ld	a,#1
1739  0062 5d            	tnzw	x
1740  0063 2704          	jreq	L26
1741  0065               L46:
1742  0065 48            	sll	a
1743  0066 5a            	decw	x
1744  0067 26fc          	jrne	L46
1745  0069               L26:
1746  0069 43            	cpl	a
1747  006a c450c4        	and	a,20676
1748  006d               LC004:
1749  006d c750c4        	ld	20676,a
1750  0070 202e          	jra	L717
1751  0072               L127:
1752                     ; 716     if (NewState != DISABLE)
1754  0072 7b03          	ld	a,(OFST+2,sp)
1755  0074 2714          	jreq	L137
1756                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1758  0076 7b02          	ld	a,(OFST+1,sp)
1759  0078 a40f          	and	a,#15
1760  007a 5f            	clrw	x
1761  007b 97            	ld	xl,a
1762  007c a601          	ld	a,#1
1763  007e 5d            	tnzw	x
1764  007f 2704          	jreq	L66
1765  0081               L07:
1766  0081 48            	sll	a
1767  0082 5a            	decw	x
1768  0083 26fc          	jrne	L07
1769  0085               L66:
1770  0085 ca50d0        	or	a,20688
1772  0088 2013          	jpf	LC003
1773  008a               L137:
1774                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1776  008a 7b02          	ld	a,(OFST+1,sp)
1777  008c a40f          	and	a,#15
1778  008e 5f            	clrw	x
1779  008f 97            	ld	xl,a
1780  0090 a601          	ld	a,#1
1781  0092 5d            	tnzw	x
1782  0093 2704          	jreq	L27
1783  0095               L47:
1784  0095 48            	sll	a
1785  0096 5a            	decw	x
1786  0097 26fc          	jrne	L47
1787  0099               L27:
1788  0099 43            	cpl	a
1789  009a c450d0        	and	a,20688
1790  009d               LC003:
1791  009d c750d0        	ld	20688,a
1792  00a0               L717:
1793                     ; 727 }
1796  00a0 5b03          	addw	sp,#3
1797  00a2 87            	retf	
1820                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1820                     ; 766 {
1821                     .text:	section	.text,new
1822  0000               f_CLK_LSEClockSecuritySystemEnable:
1826                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1828  0000 72105190      	bset	20880,#0
1829                     ; 769 }
1832  0004 87            	retf	
1855                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1855                     ; 778 {
1856                     .text:	section	.text,new
1857  0000               f_CLK_RTCCLKSwitchOnLSEFailureEnable:
1861                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1863  0000 72125190      	bset	20880,#1
1864                     ; 781 }
1867  0004 87            	retf	
1941                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1941                     ; 808 {
1942                     .text:	section	.text,new
1943  0000               f_CLK_HaltConfig:
1945  0000 89            	pushw	x
1946       00000000      OFST:	set	0
1949                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1951                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1953                     ; 813   if (NewState != DISABLE)
1955  0001 9f            	ld	a,xl
1956  0002 4d            	tnz	a
1957  0003 2706          	jreq	L1101
1958                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1960  0005 9e            	ld	a,xh
1961  0006 ca50c2        	or	a,20674
1963  0009 2006          	jra	L3101
1964  000b               L1101:
1965                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1967  000b 7b01          	ld	a,(OFST+1,sp)
1968  000d 43            	cpl	a
1969  000e c450c2        	and	a,20674
1970  0011               L3101:
1971  0011 c750c2        	ld	20674,a
1972                     ; 821 }
1975  0014 85            	popw	x
1976  0015 87            	retf	
2011                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2011                     ; 832 {
2012                     .text:	section	.text,new
2013  0000               f_CLK_MainRegulatorCmd:
2017                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2019                     ; 836   if (NewState != DISABLE)
2021  0000 4d            	tnz	a
2022  0001 2705          	jreq	L3301
2023                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2025  0003 721350cf      	bres	20687,#1
2028  0007 87            	retf	
2029  0008               L3301:
2030                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2032  0008 721250cf      	bset	20687,#1
2033                     ; 846 }
2036  000c 87            	retf	
2107                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2107                     ; 876 {
2108                     .text:	section	.text,new
2109  0000               f_CLK_ITConfig:
2111  0000 89            	pushw	x
2112       00000000      OFST:	set	0
2115                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2117                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2119                     ; 882   if (NewState != DISABLE)
2121  0001 9f            	ld	a,xl
2122  0002 4d            	tnz	a
2123  0003 271d          	jreq	L3701
2124                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2126  0005 9e            	ld	a,xh
2127  0006 a11c          	cp	a,#28
2128  0008 2606          	jrne	L5701
2129                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2131  000a 721450c9      	bset	20681,#2
2133  000e 202c          	jra	L5011
2134  0010               L5701:
2135                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2137  0010 7b01          	ld	a,(OFST+1,sp)
2138  0012 a12c          	cp	a,#44
2139  0014 2606          	jrne	L1011
2140                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2142  0016 72145190      	bset	20880,#2
2144  001a 2020          	jra	L5011
2145  001c               L1011:
2146                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2148  001c 721450ca      	bset	20682,#2
2149  0020 201a          	jra	L5011
2150  0022               L3701:
2151                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2153  0022 7b01          	ld	a,(OFST+1,sp)
2154  0024 a11c          	cp	a,#28
2155  0026 2606          	jrne	L7011
2156                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2158  0028 721550c9      	bres	20681,#2
2160  002c 200e          	jra	L5011
2161  002e               L7011:
2162                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2164  002e a12c          	cp	a,#44
2165  0030 2606          	jrne	L3111
2166                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2168  0032 72155190      	bres	20880,#2
2170  0036 2004          	jra	L5011
2171  0038               L3111:
2172                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2174  0038 721550ca      	bres	20682,#2
2175  003c               L5011:
2176                     ; 918 }
2179  003c 85            	popw	x
2180  003d 87            	retf	
2398                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2398                     ; 946 {
2399                     .text:	section	.text,new
2400  0000               f_CLK_GetFlagStatus:
2402  0000 88            	push	a
2403  0001 89            	pushw	x
2404       00000002      OFST:	set	2
2407                     ; 947   uint8_t reg = 0;
2409                     ; 948   uint8_t pos = 0;
2411                     ; 949   FlagStatus bitstatus = RESET;
2413                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2415                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2417  0002 7b03          	ld	a,(OFST+1,sp)
2418  0004 a4f0          	and	a,#240
2419  0006 6b02          	ld	(OFST+0,sp),a
2420                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2422  0008 7b03          	ld	a,(OFST+1,sp)
2423  000a a40f          	and	a,#15
2424  000c 6b01          	ld	(OFST-1,sp),a
2425                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2427  000e 7b02          	ld	a,(OFST+0,sp)
2428  0010 2605          	jrne	L7221
2429                     ; 962     reg = CLK->CRTCR;
2431  0012 c650c1        	ld	a,20673
2433  0015 2042          	jra	L1321
2434  0017               L7221:
2435                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2437  0017 a110          	cp	a,#16
2438  0019 2605          	jrne	L3321
2439                     ; 966     reg = CLK->ICKCR;
2441  001b c650c2        	ld	a,20674
2443  001e 2039          	jra	L1321
2444  0020               L3321:
2445                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2447  0020 a120          	cp	a,#32
2448  0022 2605          	jrne	L7321
2449                     ; 970     reg = CLK->CCOR;
2451  0024 c650c5        	ld	a,20677
2453  0027 2030          	jra	L1321
2454  0029               L7321:
2455                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2457  0029 a130          	cp	a,#48
2458  002b 2605          	jrne	L3421
2459                     ; 974     reg = CLK->ECKCR;
2461  002d c650c6        	ld	a,20678
2463  0030 2027          	jra	L1321
2464  0032               L3421:
2465                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2467  0032 a140          	cp	a,#64
2468  0034 2605          	jrne	L7421
2469                     ; 978     reg = CLK->SWCR;
2471  0036 c650c9        	ld	a,20681
2473  0039 201e          	jra	L1321
2474  003b               L7421:
2475                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2477  003b a150          	cp	a,#80
2478  003d 2605          	jrne	L3521
2479                     ; 982     reg = CLK->CSSR;
2481  003f c650ca        	ld	a,20682
2483  0042 2015          	jra	L1321
2484  0044               L3521:
2485                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2487  0044 a170          	cp	a,#112
2488  0046 2605          	jrne	L7521
2489                     ; 986     reg = CLK->REGCSR;
2491  0048 c650cf        	ld	a,20687
2493  004b 200c          	jra	L1321
2494  004d               L7521:
2495                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2497  004d a180          	cp	a,#128
2498  004f 2605          	jrne	L3621
2499                     ; 990     reg = CSSLSE->CSR;
2501  0051 c65190        	ld	a,20880
2503  0054 2003          	jra	L1321
2504  0056               L3621:
2505                     ; 994     reg = CLK->CBEEPR;
2507  0056 c650cb        	ld	a,20683
2508  0059               L1321:
2509  0059 6b02          	ld	(OFST+0,sp),a
2510                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2512  005b 7b01          	ld	a,(OFST-1,sp)
2513  005d 5f            	clrw	x
2514  005e 97            	ld	xl,a
2515  005f a601          	ld	a,#1
2516  0061 5d            	tnzw	x
2517  0062 2704          	jreq	L211
2518  0064               L411:
2519  0064 48            	sll	a
2520  0065 5a            	decw	x
2521  0066 26fc          	jrne	L411
2522  0068               L211:
2523  0068 1402          	and	a,(OFST+0,sp)
2524  006a 2702          	jreq	L7621
2525                     ; 1000     bitstatus = SET;
2527  006c a601          	ld	a,#1
2529  006e               L7621:
2530                     ; 1004     bitstatus = RESET;
2532                     ; 1008   return((FlagStatus)bitstatus);
2536  006e 5b03          	addw	sp,#3
2537  0070 87            	retf	
2559                     ; 1016 void CLK_ClearFlag(void)
2559                     ; 1017 {
2560                     .text:	section	.text,new
2561  0000               f_CLK_ClearFlag:
2565                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2567  0000 72175190      	bres	20880,#3
2568                     ; 1021 }
2571  0004 87            	retf	
2616                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2616                     ; 1033 {
2617                     .text:	section	.text,new
2618  0000               f_CLK_GetITStatus:
2620  0000 88            	push	a
2621  0001 88            	push	a
2622       00000001      OFST:	set	1
2625                     ; 1035   ITStatus bitstatus = RESET;
2627  0002 0f01          	clr	(OFST+0,sp)
2628                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2630                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2632  0004 a11c          	cp	a,#28
2633  0006 2605          	jrne	L5231
2634                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2636  0008 c450c9        	and	a,20681
2637                     ; 1045       bitstatus = SET;
2639  000b 200b          	jpf	LC007
2640                     ; 1049       bitstatus = RESET;
2641  000d               L5231:
2642                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2644  000d 7b02          	ld	a,(OFST+1,sp)
2645  000f a12c          	cp	a,#44
2646  0011 260d          	jrne	L5331
2647                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2649  0013 c65190        	ld	a,20880
2650  0016 1402          	and	a,(OFST+1,sp)
2651  0018               LC007:
2652  0018 a10c          	cp	a,#12
2653  001a 260d          	jrne	L5431
2654                     ; 1057       bitstatus = SET;
2656  001c               LC006:
2659  001c a601          	ld	a,#1
2661  001e 200a          	jra	L3331
2662                     ; 1061       bitstatus = RESET;
2663  0020               L5331:
2664                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2666  0020 c650ca        	ld	a,20682
2667  0023 1402          	and	a,(OFST+1,sp)
2668  0025 a10c          	cp	a,#12
2669                     ; 1069       bitstatus = SET;
2671  0027 27f3          	jreq	LC006
2672  0029               L5431:
2673                     ; 1073       bitstatus = RESET;
2677  0029 4f            	clr	a
2678  002a               L3331:
2679                     ; 1078   return bitstatus;
2683  002a 85            	popw	x
2684  002b 87            	retf	
2719                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2719                     ; 1090 {
2720                     .text:	section	.text,new
2721  0000               f_CLK_ClearITPendingBit:
2725                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2727                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2729  0000 a4f0          	and	a,#240
2730  0002 a120          	cp	a,#32
2731  0004 2605          	jrne	L7631
2732                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2734  0006 72175190      	bres	20880,#3
2737  000a 87            	retf	
2738  000b               L7631:
2739                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2741  000b 721750c9      	bres	20681,#3
2742                     ; 1105 }
2745  000f 87            	retf	
2769                     	xdef	_SYSDivFactor
2770                     	xdef	f_CLK_ClearITPendingBit
2771                     	xdef	f_CLK_GetITStatus
2772                     	xdef	f_CLK_ClearFlag
2773                     	xdef	f_CLK_GetFlagStatus
2774                     	xdef	f_CLK_ITConfig
2775                     	xdef	f_CLK_MainRegulatorCmd
2776                     	xdef	f_CLK_HaltConfig
2777                     	xdef	f_CLK_RTCCLKSwitchOnLSEFailureEnable
2778                     	xdef	f_CLK_LSEClockSecuritySystemEnable
2779                     	xdef	f_CLK_PeripheralClockConfig
2780                     	xdef	f_CLK_BEEPClockConfig
2781                     	xdef	f_CLK_RTCClockConfig
2782                     	xdef	f_CLK_SYSCLKSourceSwitchCmd
2783                     	xdef	f_CLK_SYSCLKDivConfig
2784                     	xdef	f_CLK_GetClockFreq
2785                     	xdef	f_CLK_GetSYSCLKSource
2786                     	xdef	f_CLK_SYSCLKSourceConfig
2787                     	xdef	f_CLK_CCOConfig
2788                     	xdef	f_CLK_ClockSecuritySytemDeglitchCmd
2789                     	xdef	f_CLK_ClockSecuritySystemEnable
2790                     	xdef	f_CLK_LSEConfig
2791                     	xdef	f_CLK_HSEConfig
2792                     	xdef	f_CLK_LSICmd
2793                     	xdef	f_CLK_AdjustHSICalibrationValue
2794                     	xdef	f_CLK_HSICmd
2795                     	xdef	f_CLK_DeInit
2796                     	xref.b	c_lreg
2815                     	xref	d_ludv
2816                     	xref	d_rtol
2817                     	xref	d_ltor
2818                     	end
