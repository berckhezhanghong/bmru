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
  42                     .text:	section	.text,new
  43  0000               _CLK_DeInit:
  47                     ; 122   CLK->ICKCR = CLK_ICKCR_RESET_VALUE;
  49  0000 351150c2      	mov	20674,#17
  50                     ; 123   CLK->ECKCR = CLK_ECKCR_RESET_VALUE;
  52  0004 725f50c6      	clr	20678
  53                     ; 124   CLK->CRTCR = CLK_CRTCR_RESET_VALUE;
  55  0008 725f50c1      	clr	20673
  56                     ; 125   CLK->CBEEPR = CLK_CBEEPR_RESET_VALUE;
  58  000c 725f50cb      	clr	20683
  59                     ; 126   CLK->SWR  = CLK_SWR_RESET_VALUE;
  61  0010 350150c8      	mov	20680,#1
  62                     ; 127   CLK->SWCR = CLK_SWCR_RESET_VALUE;
  64  0014 725f50c9      	clr	20681
  65                     ; 128   CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  67  0018 350350c0      	mov	20672,#3
  68                     ; 129   CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  70  001c 725f50c3      	clr	20675
  71                     ; 130   CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  73  0020 358050c4      	mov	20676,#128
  74                     ; 131   CLK->PCKENR3 = CLK_PCKENR3_RESET_VALUE;
  76  0024 725f50d0      	clr	20688
  77                     ; 132   CLK->CSSR  = CLK_CSSR_RESET_VALUE;
  79  0028 725f50ca      	clr	20682
  80                     ; 133   CLK->CCOR = CLK_CCOR_RESET_VALUE;
  82  002c 725f50c5      	clr	20677
  83                     ; 134   CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
  85  0030 725f50cd      	clr	20685
  86                     ; 135   CLK->HSICALR = CLK_HSICALR_RESET_VALUE;
  88  0034 725f50cc      	clr	20684
  89                     ; 136   CLK->HSIUNLCKR = CLK_HSIUNLCKR_RESET_VALUE;
  91  0038 725f50ce      	clr	20686
  92                     ; 137   CLK->REGCSR = CLK_REGCSR_RESET_VALUE;
  94  003c 35b950cf      	mov	20687,#185
  95                     ; 138 }
  98  0040 81            	ret	
 153                     ; 160 void CLK_HSICmd(FunctionalState NewState)
 153                     ; 161 {
 154                     .text:	section	.text,new
 155  0000               _CLK_HSICmd:
 159                     ; 163   assert_param(IS_FUNCTIONAL_STATE(NewState));
 161                     ; 165   if (NewState != DISABLE)
 163  0000 4d            	tnz	a
 164  0001 2705          	jreq	L74
 165                     ; 168     CLK->ICKCR |= CLK_ICKCR_HSION;
 167  0003 721050c2      	bset	20674,#0
 170  0007 81            	ret	
 171  0008               L74:
 172                     ; 173     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_HSION);
 174  0008 721150c2      	bres	20674,#0
 175                     ; 175 }
 178  000c 81            	ret	
 214                     ; 188 void CLK_AdjustHSICalibrationValue(uint8_t CLK_HSICalibrationValue)
 214                     ; 189 {
 215                     .text:	section	.text,new
 216  0000               _CLK_AdjustHSICalibrationValue:
 220                     ; 191   CLK->HSIUNLCKR = 0xAC;
 222  0000 35ac50ce      	mov	20686,#172
 223                     ; 192   CLK->HSIUNLCKR = 0x35;
 225  0004 353550ce      	mov	20686,#53
 226                     ; 195   CLK->HSITRIMR = (uint8_t)CLK_HSICalibrationValue;
 228  0008 c750cd        	ld	20685,a
 229                     ; 196 }
 232  000b 81            	ret	
 267                     ; 212 void CLK_LSICmd(FunctionalState NewState)
 267                     ; 213 {
 268                     .text:	section	.text,new
 269  0000               _CLK_LSICmd:
 273                     ; 216   assert_param(IS_FUNCTIONAL_STATE(NewState));
 275                     ; 218   if (NewState != DISABLE)
 277  0000 4d            	tnz	a
 278  0001 2705          	jreq	L701
 279                     ; 221     CLK->ICKCR |= CLK_ICKCR_LSION;
 281  0003 721450c2      	bset	20674,#2
 284  0007 81            	ret	
 285  0008               L701:
 286                     ; 226     CLK->ICKCR &= (uint8_t)(~CLK_ICKCR_LSION);
 288  0008 721550c2      	bres	20674,#2
 289                     ; 228 }
 292  000c 81            	ret	
 354                     ; 249 void CLK_HSEConfig(CLK_HSE_TypeDef CLK_HSE)
 354                     ; 250 {
 355                     .text:	section	.text,new
 356  0000               _CLK_HSEConfig:
 360                     ; 252   assert_param(IS_CLK_HSE(CLK_HSE));
 362                     ; 256   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEON;
 364  0000 721150c6      	bres	20678,#0
 365                     ; 259   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_HSEBYP;
 367  0004 721950c6      	bres	20678,#4
 368                     ; 262   CLK->ECKCR |= (uint8_t)CLK_HSE;
 370  0008 ca50c6        	or	a,20678
 371  000b c750c6        	ld	20678,a
 372                     ; 263 }
 375  000e 81            	ret	
 437                     ; 280 void CLK_LSEConfig(CLK_LSE_TypeDef CLK_LSE)
 437                     ; 281 {
 438                     .text:	section	.text,new
 439  0000               _CLK_LSEConfig:
 443                     ; 283   assert_param(IS_CLK_LSE(CLK_LSE));
 445                     ; 287   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEON;
 447  0000 721550c6      	bres	20678,#2
 448                     ; 290   CLK->ECKCR &= (uint8_t)~CLK_ECKCR_LSEBYP;
 450  0004 721b50c6      	bres	20678,#5
 451                     ; 293   CLK->ECKCR |= (uint8_t)CLK_LSE;
 453  0008 ca50c6        	or	a,20678
 454  000b c750c6        	ld	20678,a
 455                     ; 295 }
 458  000e 81            	ret	
 482                     ; 306 void CLK_ClockSecuritySystemEnable(void)
 482                     ; 307 {
 483                     .text:	section	.text,new
 484  0000               _CLK_ClockSecuritySystemEnable:
 488                     ; 309   CLK->CSSR |= CLK_CSSR_CSSEN;
 490  0000 721050ca      	bset	20682,#0
 491                     ; 310 }
 494  0004 81            	ret	
 530                     ; 317 void CLK_ClockSecuritySytemDeglitchCmd(FunctionalState NewState)
 530                     ; 318 {
 531                     .text:	section	.text,new
 532  0000               _CLK_ClockSecuritySytemDeglitchCmd:
 536                     ; 320   assert_param(IS_FUNCTIONAL_STATE(NewState));
 538                     ; 322   if (NewState != DISABLE)
 540  0000 4d            	tnz	a
 541  0001 2705          	jreq	L122
 542                     ; 325     CLK->CSSR |= CLK_CSSR_CSSDGON;
 544  0003 721850ca      	bset	20682,#4
 547  0007 81            	ret	
 548  0008               L122:
 549                     ; 330     CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDGON);
 551  0008 721950ca      	bres	20682,#4
 552                     ; 332 }
 555  000c 81            	ret	
 696                     ; 356 void CLK_CCOConfig(CLK_CCOSource_TypeDef CLK_CCOSource, CLK_CCODiv_TypeDef CLK_CCODiv)
 696                     ; 357 {
 697                     .text:	section	.text,new
 698  0000               _CLK_CCOConfig:
 700  0000 89            	pushw	x
 701       00000000      OFST:	set	0
 704                     ; 359   assert_param(IS_CLK_OUTPUT(CLK_CCOSource));
 706                     ; 360   assert_param(IS_CLK_OUTPUT_DIVIDER(CLK_CCODiv));
 708                     ; 363   CLK->CCOR = (uint8_t)((uint8_t)CLK_CCOSource | (uint8_t)CLK_CCODiv);
 710  0001 9f            	ld	a,xl
 711  0002 1a01          	or	a,(OFST+1,sp)
 712  0004 c750c5        	ld	20677,a
 713                     ; 364 }
 716  0007 85            	popw	x
 717  0008 81            	ret	
 791                     ; 416 void CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_TypeDef CLK_SYSCLKSource)
 791                     ; 417 {
 792                     .text:	section	.text,new
 793  0000               _CLK_SYSCLKSourceConfig:
 797                     ; 419   assert_param(IS_CLK_SOURCE(CLK_SYSCLKSource));
 799                     ; 422   CLK->SWR = (uint8_t)CLK_SYSCLKSource;
 801  0000 c750c8        	ld	20680,a
 802                     ; 423 }
 805  0003 81            	ret	
 830                     ; 435 CLK_SYSCLKSource_TypeDef CLK_GetSYSCLKSource(void)
 830                     ; 436 {
 831                     .text:	section	.text,new
 832  0000               _CLK_GetSYSCLKSource:
 836                     ; 437   return ((CLK_SYSCLKSource_TypeDef)(CLK->SCSR));
 838  0000 c650c7        	ld	a,20679
 841  0003 81            	ret	
 913                     ; 478 uint32_t CLK_GetClockFreq(void)
 913                     ; 479 {
 914                     .text:	section	.text,new
 915  0000               _CLK_GetClockFreq:
 917  0000 5209          	subw	sp,#9
 918       00000009      OFST:	set	9
 921                     ; 480   uint32_t clockfrequency = 0;
 923  0002 96            	ldw	x,sp
 924  0003 1c0005        	addw	x,#OFST-4
 925  0006 cd0000        	call	c_ltor
 927                     ; 481   uint32_t sourcefrequency = 0;
 929  0009 5f            	clrw	x
 930  000a 1f07          	ldw	(OFST-2,sp),x
 931  000c 1f05          	ldw	(OFST-4,sp),x
 932                     ; 482   CLK_SYSCLKSource_TypeDef clocksource = CLK_SYSCLKSource_HSI;
 934                     ; 483   uint8_t tmp = 0, presc = 0;
 938                     ; 486   clocksource = (CLK_SYSCLKSource_TypeDef)CLK->SCSR;
 940  000e c650c7        	ld	a,20679
 941  0011 6b09          	ld	(OFST+0,sp),a
 942                     ; 488   if ( clocksource == CLK_SYSCLKSource_HSI)
 944  0013 a101          	cp	a,#1
 945                     ; 490     sourcefrequency = HSI_VALUE;
 947  0015 2710          	jreq	LC002
 948                     ; 492   else if ( clocksource == CLK_SYSCLKSource_LSI)
 950  0017 a102          	cp	a,#2
 951  0019 2608          	jrne	L314
 952                     ; 494     sourcefrequency = LSI_VALUE;
 954  001b ae9470        	ldw	x,#38000
 955  001e 1f07          	ldw	(OFST-2,sp),x
 956  0020 5f            	clrw	x
 958  0021 200c          	jp	LC001
 959  0023               L314:
 960                     ; 496   else if ( clocksource == CLK_SYSCLKSource_HSE)
 962  0023 a104          	cp	a,#4
 963  0025 260c          	jrne	L714
 964                     ; 498     sourcefrequency = HSE_VALUE;
 966  0027               LC002:
 968  0027 ae2400        	ldw	x,#9216
 969  002a 1f07          	ldw	(OFST-2,sp),x
 970  002c ae00f4        	ldw	x,#244
 971  002f               LC001:
 972  002f 1f05          	ldw	(OFST-4,sp),x
 974  0031 2007          	jra	L114
 975  0033               L714:
 976                     ; 502     clockfrequency = LSE_VALUE;
 978  0033 96            	ldw	x,sp
 979  0034 1c0005        	addw	x,#OFST-4
 980  0037 cd0000        	call	c_ltor
 982  003a               L114:
 983                     ; 506   tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_CKM);
 985  003a c650c0        	ld	a,20672
 986  003d a407          	and	a,#7
 987                     ; 507   presc = SYSDivFactor[tmp];
 989  003f 5f            	clrw	x
 990  0040 97            	ld	xl,a
 991  0041 d60000        	ld	a,(_SYSDivFactor,x)
 992  0044 6b09          	ld	(OFST+0,sp),a
 993                     ; 510   clockfrequency = sourcefrequency / presc;
 995  0046 b703          	ld	c_lreg+3,a
 996  0048 3f02          	clr	c_lreg+2
 997  004a 3f01          	clr	c_lreg+1
 998  004c 3f00          	clr	c_lreg
 999  004e 96            	ldw	x,sp
1000  004f 5c            	incw	x
1001  0050 cd0000        	call	c_rtol
1003  0053 96            	ldw	x,sp
1004  0054 1c0005        	addw	x,#OFST-4
1005  0057 cd0000        	call	c_ltor
1007  005a 96            	ldw	x,sp
1008  005b 5c            	incw	x
1009  005c cd0000        	call	c_ludv
1011  005f 96            	ldw	x,sp
1012  0060 1c0005        	addw	x,#OFST-4
1013  0063 cd0000        	call	c_rtol
1015                     ; 512   return((uint32_t)clockfrequency);
1017  0066 96            	ldw	x,sp
1018  0067 1c0005        	addw	x,#OFST-4
1019  006a cd0000        	call	c_ltor
1023  006d 5b09          	addw	sp,#9
1024  006f 81            	ret	
1122                     ; 528 void CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_TypeDef CLK_SYSCLKDiv)
1122                     ; 529 {
1123                     .text:	section	.text,new
1124  0000               _CLK_SYSCLKDivConfig:
1128                     ; 531   assert_param(IS_CLK_SYSTEM_DIVIDER(CLK_SYSCLKDiv));
1130                     ; 533   CLK->CKDIVR = (uint8_t)(CLK_SYSCLKDiv);
1132  0000 c750c0        	ld	20672,a
1133                     ; 534 }
1136  0003 81            	ret	
1172                     ; 541 void CLK_SYSCLKSourceSwitchCmd(FunctionalState NewState)
1172                     ; 542 {
1173                     .text:	section	.text,new
1174  0000               _CLK_SYSCLKSourceSwitchCmd:
1178                     ; 544   assert_param(IS_FUNCTIONAL_STATE(NewState));
1180                     ; 546   if (NewState != DISABLE)
1182  0000 4d            	tnz	a
1183  0001 2705          	jreq	L305
1184                     ; 549     CLK->SWCR |= CLK_SWCR_SWEN;
1186  0003 721250c9      	bset	20681,#1
1189  0007 81            	ret	
1190  0008               L305:
1191                     ; 554     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
1193  0008 721350c9      	bres	20681,#1
1194                     ; 556 }
1197  000c 81            	ret	
1343                     ; 616 void CLK_RTCClockConfig(CLK_RTCCLKSource_TypeDef CLK_RTCCLKSource, CLK_RTCCLKDiv_TypeDef CLK_RTCCLKDiv)
1343                     ; 617 {
1344                     .text:	section	.text,new
1345  0000               _CLK_RTCClockConfig:
1347  0000 89            	pushw	x
1348       00000000      OFST:	set	0
1351                     ; 619   assert_param(IS_CLK_CLOCK_RTC(CLK_RTCCLKSource));
1353                     ; 620   assert_param(IS_CLK_CLOCK_RTC_DIV(CLK_RTCCLKDiv));
1355                     ; 623   CLK->CRTCR = (uint8_t)((uint8_t)CLK_RTCCLKSource | (uint8_t)CLK_RTCCLKDiv);
1357  0001 9f            	ld	a,xl
1358  0002 1a01          	or	a,(OFST+1,sp)
1359  0004 c750c1        	ld	20673,a
1360                     ; 624 }
1363  0007 85            	popw	x
1364  0008 81            	ret	
1430                     ; 635 void CLK_BEEPClockConfig(CLK_BEEPCLKSource_TypeDef CLK_BEEPCLKSource)
1430                     ; 636 {
1431                     .text:	section	.text,new
1432  0000               _CLK_BEEPClockConfig:
1436                     ; 638   assert_param(IS_CLK_CLOCK_BEEP(CLK_BEEPCLKSource));
1438                     ; 641   CLK->CBEEPR = (uint8_t)(CLK_BEEPCLKSource);
1440  0000 c750cb        	ld	20683,a
1441                     ; 643 }
1444  0003 81            	ret	
1669                     ; 677 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
1669                     ; 678 {
1670                     .text:	section	.text,new
1671  0000               _CLK_PeripheralClockConfig:
1673  0000 89            	pushw	x
1674  0001 88            	push	a
1675       00000001      OFST:	set	1
1678                     ; 679   uint8_t reg = 0;
1680  0002 0f01          	clr	(OFST+0,sp)
1681                     ; 682   assert_param(IS_CLK_PERIPHERAL(CLK_Peripheral));
1683                     ; 683   assert_param(IS_FUNCTIONAL_STATE(NewState));
1685                     ; 686   reg = (uint8_t)((uint8_t)CLK_Peripheral & (uint8_t)0xF0);
1687  0004 9e            	ld	a,xh
1688  0005 a4f0          	and	a,#240
1689  0007 6b01          	ld	(OFST+0,sp),a
1690                     ; 688   if ( reg == 0x00)
1692  0009 2629          	jrne	L527
1693                     ; 690     if (NewState != DISABLE)
1695  000b 7b03          	ld	a,(OFST+2,sp)
1696  000d 2712          	jreq	L727
1697                     ; 693       CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1699  000f 7b02          	ld	a,(OFST+1,sp)
1700  0011 ad72          	call	LC005
1701  0013 2704          	jreq	L64
1702  0015               L05:
1703  0015 48            	sll	a
1704  0016 5a            	decw	x
1705  0017 26fc          	jrne	L05
1706  0019               L64:
1707  0019 ca50c3        	or	a,20675
1708  001c c750c3        	ld	20675,a
1710  001f 2061          	jra	L337
1711  0021               L727:
1712                     ; 698       CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1714  0021 7b02          	ld	a,(OFST+1,sp)
1715  0023 ad60          	call	LC005
1716  0025 2704          	jreq	L25
1717  0027               L45:
1718  0027 48            	sll	a
1719  0028 5a            	decw	x
1720  0029 26fc          	jrne	L45
1721  002b               L25:
1722  002b 43            	cpl	a
1723  002c c450c3        	and	a,20675
1724  002f c750c3        	ld	20675,a
1725  0032 204e          	jra	L337
1726  0034               L527:
1727                     ; 701   else if (reg == 0x10)
1729  0034 a110          	cp	a,#16
1730  0036 2626          	jrne	L537
1731                     ; 703     if (NewState != DISABLE)
1733  0038 7b03          	ld	a,(OFST+2,sp)
1734  003a 270f          	jreq	L737
1735                     ; 706       CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1737  003c 7b02          	ld	a,(OFST+1,sp)
1738  003e ad45          	call	LC005
1739  0040 2704          	jreq	L65
1740  0042               L06:
1741  0042 48            	sll	a
1742  0043 5a            	decw	x
1743  0044 26fc          	jrne	L06
1744  0046               L65:
1745  0046 ca50c4        	or	a,20676
1747  0049 200e          	jp	LC004
1748  004b               L737:
1749                     ; 711       CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1751  004b 7b02          	ld	a,(OFST+1,sp)
1752  004d ad36          	call	LC005
1753  004f 2704          	jreq	L26
1754  0051               L46:
1755  0051 48            	sll	a
1756  0052 5a            	decw	x
1757  0053 26fc          	jrne	L46
1758  0055               L26:
1759  0055 43            	cpl	a
1760  0056 c450c4        	and	a,20676
1761  0059               LC004:
1762  0059 c750c4        	ld	20676,a
1763  005c 2024          	jra	L337
1764  005e               L537:
1765                     ; 716     if (NewState != DISABLE)
1767  005e 7b03          	ld	a,(OFST+2,sp)
1768  0060 270f          	jreq	L547
1769                     ; 719       CLK->PCKENR3 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
1771  0062 7b02          	ld	a,(OFST+1,sp)
1772  0064 ad1f          	call	LC005
1773  0066 2704          	jreq	L66
1774  0068               L07:
1775  0068 48            	sll	a
1776  0069 5a            	decw	x
1777  006a 26fc          	jrne	L07
1778  006c               L66:
1779  006c ca50d0        	or	a,20688
1781  006f 200e          	jp	LC003
1782  0071               L547:
1783                     ; 724       CLK->PCKENR3 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
1785  0071 7b02          	ld	a,(OFST+1,sp)
1786  0073 ad10          	call	LC005
1787  0075 2704          	jreq	L27
1788  0077               L47:
1789  0077 48            	sll	a
1790  0078 5a            	decw	x
1791  0079 26fc          	jrne	L47
1792  007b               L27:
1793  007b 43            	cpl	a
1794  007c c450d0        	and	a,20688
1795  007f               LC003:
1796  007f c750d0        	ld	20688,a
1797  0082               L337:
1798                     ; 727 }
1801  0082 5b03          	addw	sp,#3
1802  0084 81            	ret	
1804  0085               LC005:
1805  0085 a40f          	and	a,#15
1806  0087 5f            	clrw	x
1807  0088 97            	ld	xl,a
1808  0089 a601          	ld	a,#1
1809  008b 5d            	tnzw	x
1810  008c 81            	ret	
1833                     ; 765 void CLK_LSEClockSecuritySystemEnable(void)
1833                     ; 766 {
1834                     .text:	section	.text,new
1835  0000               _CLK_LSEClockSecuritySystemEnable:
1839                     ; 768   CSSLSE->CSR |= CSSLSE_CSR_CSSEN;
1841  0000 72105190      	bset	20880,#0
1842                     ; 769 }
1845  0004 81            	ret	
1869                     ; 777 void CLK_RTCCLKSwitchOnLSEFailureEnable(void)
1869                     ; 778 {
1870                     .text:	section	.text,new
1871  0000               _CLK_RTCCLKSwitchOnLSEFailureEnable:
1875                     ; 780   CSSLSE->CSR |= CSSLSE_CSR_SWITCHEN;
1877  0000 72125190      	bset	20880,#1
1878                     ; 781 }
1881  0004 81            	ret	
1956                     ; 807 void CLK_HaltConfig(CLK_Halt_TypeDef CLK_Halt, FunctionalState NewState)
1956                     ; 808 {
1957                     .text:	section	.text,new
1958  0000               _CLK_HaltConfig:
1960  0000 89            	pushw	x
1961       00000000      OFST:	set	0
1964                     ; 810   assert_param(IS_CLK_HALT(CLK_Halt));
1966                     ; 811   assert_param(IS_FUNCTIONAL_STATE(NewState));
1968                     ; 813   if (NewState != DISABLE)
1970  0001 9f            	ld	a,xl
1971  0002 4d            	tnz	a
1972  0003 2706          	jreq	L5201
1973                     ; 815     CLK->ICKCR |= (uint8_t)(CLK_Halt);
1975  0005 9e            	ld	a,xh
1976  0006 ca50c2        	or	a,20674
1978  0009 2006          	jra	L7201
1979  000b               L5201:
1980                     ; 819     CLK->ICKCR &= (uint8_t)(~CLK_Halt);
1982  000b 7b01          	ld	a,(OFST+1,sp)
1983  000d 43            	cpl	a
1984  000e c450c2        	and	a,20674
1985  0011               L7201:
1986  0011 c750c2        	ld	20674,a
1987                     ; 821 }
1990  0014 85            	popw	x
1991  0015 81            	ret	
2027                     ; 831 void CLK_MainRegulatorCmd(FunctionalState NewState)
2027                     ; 832 {
2028                     .text:	section	.text,new
2029  0000               _CLK_MainRegulatorCmd:
2033                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2035                     ; 836   if (NewState != DISABLE)
2037  0000 4d            	tnz	a
2038  0001 2705          	jreq	L7401
2039                     ; 839     CLK->REGCSR &= (uint8_t)(~CLK_REGCSR_REGOFF);
2041  0003 721350cf      	bres	20687,#1
2044  0007 81            	ret	
2045  0008               L7401:
2046                     ; 844     CLK->REGCSR |= CLK_REGCSR_REGOFF;
2048  0008 721250cf      	bset	20687,#1
2049                     ; 846 }
2052  000c 81            	ret	
2124                     ; 875 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
2124                     ; 876 {
2125                     .text:	section	.text,new
2126  0000               _CLK_ITConfig:
2128  0000 89            	pushw	x
2129       00000000      OFST:	set	0
2132                     ; 879   assert_param(IS_CLK_IT(CLK_IT));
2134                     ; 880   assert_param(IS_FUNCTIONAL_STATE(NewState));
2136                     ; 882   if (NewState != DISABLE)
2138  0001 9f            	ld	a,xl
2139  0002 4d            	tnz	a
2140  0003 271d          	jreq	L7011
2141                     ; 884     if (CLK_IT == CLK_IT_SWIF)
2143  0005 9e            	ld	a,xh
2144  0006 a11c          	cp	a,#28
2145  0008 2606          	jrne	L1111
2146                     ; 887       CLK->SWCR |= CLK_SWCR_SWIEN;
2148  000a 721450c9      	bset	20681,#2
2150  000e 202c          	jra	L1211
2151  0010               L1111:
2152                     ; 889     else if (CLK_IT == CLK_IT_LSECSSF)
2154  0010 7b01          	ld	a,(OFST+1,sp)
2155  0012 a12c          	cp	a,#44
2156  0014 2606          	jrne	L5111
2157                     ; 892       CSSLSE->CSR |= CSSLSE_CSR_CSSIE;
2159  0016 72145190      	bset	20880,#2
2161  001a 2020          	jra	L1211
2162  001c               L5111:
2163                     ; 897       CLK->CSSR |= CLK_CSSR_CSSDIE;
2165  001c 721450ca      	bset	20682,#2
2166  0020 201a          	jra	L1211
2167  0022               L7011:
2168                     ; 902     if (CLK_IT == CLK_IT_SWIF)
2170  0022 7b01          	ld	a,(OFST+1,sp)
2171  0024 a11c          	cp	a,#28
2172  0026 2606          	jrne	L3211
2173                     ; 905       CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
2175  0028 721550c9      	bres	20681,#2
2177  002c 200e          	jra	L1211
2178  002e               L3211:
2179                     ; 907     else if (CLK_IT == CLK_IT_LSECSSF)
2181  002e a12c          	cp	a,#44
2182  0030 2606          	jrne	L7211
2183                     ; 910       CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSIE);
2185  0032 72155190      	bres	20880,#2
2187  0036 2004          	jra	L1211
2188  0038               L7211:
2189                     ; 915       CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
2191  0038 721550ca      	bres	20682,#2
2192  003c               L1211:
2193                     ; 918 }
2196  003c 85            	popw	x
2197  003d 81            	ret	
2420                     ; 945 FlagStatus CLK_GetFlagStatus(CLK_FLAG_TypeDef CLK_FLAG)
2420                     ; 946 {
2421                     .text:	section	.text,new
2422  0000               _CLK_GetFlagStatus:
2424  0000 88            	push	a
2425  0001 89            	pushw	x
2426       00000002      OFST:	set	2
2429                     ; 947   uint8_t reg = 0;
2431                     ; 948   uint8_t pos = 0;
2433                     ; 949   FlagStatus bitstatus = RESET;
2435                     ; 952   assert_param(IS_CLK_FLAGS(CLK_FLAG));
2437                     ; 955   reg = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0xF0);
2439  0002 7b03          	ld	a,(OFST+1,sp)
2440  0004 a4f0          	and	a,#240
2441  0006 6b02          	ld	(OFST+0,sp),a
2442                     ; 958   pos = (uint8_t)((uint8_t)CLK_FLAG & (uint8_t)0x0F);
2444  0008 7b03          	ld	a,(OFST+1,sp)
2445  000a a40f          	and	a,#15
2446  000c 6b01          	ld	(OFST-1,sp),a
2447                     ; 960   if (reg == 0x00) /* The flag to check is in CRTC Rregister */
2449  000e 7b02          	ld	a,(OFST+0,sp)
2450  0010 2605          	jrne	L7421
2451                     ; 962     reg = CLK->CRTCR;
2453  0012 c650c1        	ld	a,20673
2455  0015 2042          	jra	L1521
2456  0017               L7421:
2457                     ; 964   else if (reg == 0x10) /* The flag to check is in ICKCR register */
2459  0017 a110          	cp	a,#16
2460  0019 2605          	jrne	L3521
2461                     ; 966     reg = CLK->ICKCR;
2463  001b c650c2        	ld	a,20674
2465  001e 2039          	jra	L1521
2466  0020               L3521:
2467                     ; 968   else if (reg == 0x20) /* The flag to check is in CCOR register */
2469  0020 a120          	cp	a,#32
2470  0022 2605          	jrne	L7521
2471                     ; 970     reg = CLK->CCOR;
2473  0024 c650c5        	ld	a,20677
2475  0027 2030          	jra	L1521
2476  0029               L7521:
2477                     ; 972   else if (reg == 0x30) /* The flag to check is in ECKCR register */
2479  0029 a130          	cp	a,#48
2480  002b 2605          	jrne	L3621
2481                     ; 974     reg = CLK->ECKCR;
2483  002d c650c6        	ld	a,20678
2485  0030 2027          	jra	L1521
2486  0032               L3621:
2487                     ; 976   else if (reg == 0x40) /* The flag to check is in SWCR register */
2489  0032 a140          	cp	a,#64
2490  0034 2605          	jrne	L7621
2491                     ; 978     reg = CLK->SWCR;
2493  0036 c650c9        	ld	a,20681
2495  0039 201e          	jra	L1521
2496  003b               L7621:
2497                     ; 980   else if (reg == 0x50) /* The flag to check is in CSSR register */
2499  003b a150          	cp	a,#80
2500  003d 2605          	jrne	L3721
2501                     ; 982     reg = CLK->CSSR;
2503  003f c650ca        	ld	a,20682
2505  0042 2015          	jra	L1521
2506  0044               L3721:
2507                     ; 984   else if (reg == 0x70) /* The flag to check is in REGCSR register */
2509  0044 a170          	cp	a,#112
2510  0046 2605          	jrne	L7721
2511                     ; 986     reg = CLK->REGCSR;
2513  0048 c650cf        	ld	a,20687
2515  004b 200c          	jra	L1521
2516  004d               L7721:
2517                     ; 988   else if (reg == 0x80) /* The flag to check is in CSSLSE_CSRregister */
2519  004d a180          	cp	a,#128
2520  004f 2605          	jrne	L3031
2521                     ; 990     reg = CSSLSE->CSR;
2523  0051 c65190        	ld	a,20880
2525  0054 2003          	jra	L1521
2526  0056               L3031:
2527                     ; 994     reg = CLK->CBEEPR;
2529  0056 c650cb        	ld	a,20683
2530  0059               L1521:
2531  0059 6b02          	ld	(OFST+0,sp),a
2532                     ; 998   if ((reg & (uint8_t)((uint8_t)1 << (uint8_t)pos)) != (uint8_t)RESET)
2534  005b 7b01          	ld	a,(OFST-1,sp)
2535  005d 5f            	clrw	x
2536  005e 97            	ld	xl,a
2537  005f a601          	ld	a,#1
2538  0061 5d            	tnzw	x
2539  0062 2704          	jreq	L211
2540  0064               L411:
2541  0064 48            	sll	a
2542  0065 5a            	decw	x
2543  0066 26fc          	jrne	L411
2544  0068               L211:
2545  0068 1402          	and	a,(OFST+0,sp)
2546  006a 2702          	jreq	L7031
2547                     ; 1000     bitstatus = SET;
2549  006c a601          	ld	a,#1
2551  006e               L7031:
2552                     ; 1004     bitstatus = RESET;
2554                     ; 1008   return((FlagStatus)bitstatus);
2558  006e 5b03          	addw	sp,#3
2559  0070 81            	ret	
2582                     ; 1016 void CLK_ClearFlag(void)
2582                     ; 1017 {
2583                     .text:	section	.text,new
2584  0000               _CLK_ClearFlag:
2588                     ; 1020   CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2590  0000 72175190      	bres	20880,#3
2591                     ; 1021 }
2594  0004 81            	ret	
2640                     ; 1032 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2640                     ; 1033 {
2641                     .text:	section	.text,new
2642  0000               _CLK_GetITStatus:
2644  0000 88            	push	a
2645  0001 88            	push	a
2646       00000001      OFST:	set	1
2649                     ; 1035   ITStatus bitstatus = RESET;
2651  0002 0f01          	clr	(OFST+0,sp)
2652                     ; 1038   assert_param(IS_CLK_IT(CLK_IT));
2654                     ; 1040   if (CLK_IT == CLK_IT_SWIF)
2656  0004 a11c          	cp	a,#28
2657  0006 2605          	jrne	L5431
2658                     ; 1043     if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2660  0008 c450c9        	and	a,20681
2661                     ; 1045       bitstatus = SET;
2663  000b 200b          	jp	LC008
2664                     ; 1049       bitstatus = RESET;
2665  000d               L5431:
2666                     ; 1052   else if (CLK_IT == CLK_IT_LSECSSF)
2668  000d 7b02          	ld	a,(OFST+1,sp)
2669  000f a12c          	cp	a,#44
2670  0011 260d          	jrne	L5531
2671                     ; 1055     if ((CSSLSE->CSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2673  0013 c65190        	ld	a,20880
2674  0016 1402          	and	a,(OFST+1,sp)
2675  0018               LC008:
2676  0018 a10c          	cp	a,#12
2677  001a 260d          	jrne	L5631
2678                     ; 1057       bitstatus = SET;
2680  001c               LC007:
2683  001c a601          	ld	a,#1
2685  001e 200a          	jra	L3531
2686                     ; 1061       bitstatus = RESET;
2687  0020               L5531:
2688                     ; 1067     if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2690  0020 c650ca        	ld	a,20682
2691  0023 1402          	and	a,(OFST+1,sp)
2692  0025 a10c          	cp	a,#12
2693                     ; 1069       bitstatus = SET;
2695  0027 27f3          	jreq	LC007
2696  0029               L5631:
2697                     ; 1073       bitstatus = RESET;
2701  0029 4f            	clr	a
2702  002a               L3531:
2703                     ; 1078   return bitstatus;
2707  002a 85            	popw	x
2708  002b 81            	ret	
2744                     ; 1089 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2744                     ; 1090 {
2745                     .text:	section	.text,new
2746  0000               _CLK_ClearITPendingBit:
2750                     ; 1093   assert_param(IS_CLK_CLEAR_IT(CLK_IT));
2752                     ; 1095   if ((uint8_t)((uint8_t)CLK_IT & (uint8_t)0xF0) == (uint8_t)0x20)
2754  0000 a4f0          	and	a,#240
2755  0002 a120          	cp	a,#32
2756  0004 2605          	jrne	L7041
2757                     ; 1098     CSSLSE->CSR &= (uint8_t)(~CSSLSE_CSR_CSSF);
2759  0006 72175190      	bres	20880,#3
2762  000a 81            	ret	
2763  000b               L7041:
2764                     ; 1103     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2766  000b 721750c9      	bres	20681,#3
2767                     ; 1105 }
2770  000f 81            	ret	
2795                     	xdef	_SYSDivFactor
2796                     	xdef	_CLK_ClearITPendingBit
2797                     	xdef	_CLK_GetITStatus
2798                     	xdef	_CLK_ClearFlag
2799                     	xdef	_CLK_GetFlagStatus
2800                     	xdef	_CLK_ITConfig
2801                     	xdef	_CLK_MainRegulatorCmd
2802                     	xdef	_CLK_HaltConfig
2803                     	xdef	_CLK_RTCCLKSwitchOnLSEFailureEnable
2804                     	xdef	_CLK_LSEClockSecuritySystemEnable
2805                     	xdef	_CLK_PeripheralClockConfig
2806                     	xdef	_CLK_BEEPClockConfig
2807                     	xdef	_CLK_RTCClockConfig
2808                     	xdef	_CLK_SYSCLKSourceSwitchCmd
2809                     	xdef	_CLK_SYSCLKDivConfig
2810                     	xdef	_CLK_GetClockFreq
2811                     	xdef	_CLK_GetSYSCLKSource
2812                     	xdef	_CLK_SYSCLKSourceConfig
2813                     	xdef	_CLK_CCOConfig
2814                     	xdef	_CLK_ClockSecuritySytemDeglitchCmd
2815                     	xdef	_CLK_ClockSecuritySystemEnable
2816                     	xdef	_CLK_LSEConfig
2817                     	xdef	_CLK_HSEConfig
2818                     	xdef	_CLK_LSICmd
2819                     	xdef	_CLK_AdjustHSICalibrationValue
2820                     	xdef	_CLK_HSICmd
2821                     	xdef	_CLK_DeInit
2822                     	xref.b	c_lreg
2841                     	xref	c_ludv
2842                     	xref	c_rtol
2843                     	xref	c_ltor
2844                     	end
