   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
  41                     ; 121 void LCD_DeInit(void)
  41                     ; 122 {
  42                     .text:	section	.text,new
  43  0000               f_LCD_DeInit:
  45  0000 88            	push	a
  46       00000001      OFST:	set	1
  49                     ; 123   uint8_t counter = 0;
  51  0001 0f01          	clr	(OFST+0,sp)
  52                     ; 125   LCD->CR1 = LCD_CR1_RESET_VALUE;
  54  0003 725f5400      	clr	21504
  55                     ; 126   LCD->CR2 = LCD_CR2_RESET_VALUE;
  57  0007 725f5401      	clr	21505
  58                     ; 127   LCD->CR3 = LCD_CR3_RESET_VALUE;
  60  000b 725f5402      	clr	21506
  61                     ; 128   LCD->FRQ = LCD_FRQ_RESET_VALUE;
  63  000f 725f5403      	clr	21507
  64                     ; 130   for (counter = 0;counter < 0x05; counter++)
  66  0013 0f01          	clr	(OFST+0,sp)
  67  0015               L52:
  68                     ; 132     LCD->PM[counter] = LCD_PM_RESET_VALUE;
  70  0015 7b01          	ld	a,(OFST+0,sp)
  71  0017 5f            	clrw	x
  72  0018 97            	ld	xl,a
  73  0019 724f5404      	clr	(21508,x)
  74                     ; 130   for (counter = 0;counter < 0x05; counter++)
  76  001d 0c01          	inc	(OFST+0,sp)
  79  001f 7b01          	ld	a,(OFST+0,sp)
  80  0021 a105          	cp	a,#5
  81  0023 25f0          	jrult	L52
  82                     ; 135   for (counter = 0;counter < 0x16; counter++)
  84  0025 0f01          	clr	(OFST+0,sp)
  85  0027               L33:
  86                     ; 137     LCD->RAM[counter] =  LCD_RAM_RESET_VALUE;
  88  0027 7b01          	ld	a,(OFST+0,sp)
  89  0029 5f            	clrw	x
  90  002a 97            	ld	xl,a
  91  002b 724f540c      	clr	(21516,x)
  92                     ; 135   for (counter = 0;counter < 0x16; counter++)
  94  002f 0c01          	inc	(OFST+0,sp)
  97  0031 7b01          	ld	a,(OFST+0,sp)
  98  0033 a116          	cp	a,#22
  99  0035 25f0          	jrult	L33
 100                     ; 140   LCD->CR4 = LCD_CR4_RESET_VALUE;
 102  0037 725f542f      	clr	21551
 103                     ; 142 }
 106  003b 84            	pop	a
 107  003c 87            	retf
 509                     ; 200 void LCD_Init(LCD_Prescaler_TypeDef LCD_Prescaler, LCD_Divider_TypeDef LCD_Divider,
 509                     ; 201               LCD_Duty_TypeDef LCD_Duty, LCD_Bias_TypeDef LCD_Bias,
 509                     ; 202               LCD_VoltageSource_TypeDef LCD_VoltageSource)
 509                     ; 203 {
 510                     .text:	section	.text,new
 511  0000               f_LCD_Init:
 513  0000 89            	pushw	x
 514       00000000      OFST:	set	0
 517                     ; 205   assert_param(IS_LCD_CLOCK_PRESCALER(LCD_Prescaler));
 519                     ; 206   assert_param(IS_LCD_CLOCK_DIVIDER(LCD_Divider));
 521                     ; 207   assert_param(IS_LCD_DUTY(LCD_Duty));
 523                     ; 208   assert_param(IS_LCD_BIAS(LCD_Bias));
 525                     ; 209   assert_param(IS_LCD_VOLTAGE_SOURCE(LCD_VoltageSource));
 527                     ; 211   LCD->FRQ &= (uint8_t)(~LCD_FRQ_PS);     /* Clear the prescaler bits */
 529  0001 c65403        	ld	a,21507
 530  0004 a40f          	and	a,#15
 531  0006 c75403        	ld	21507,a
 532                     ; 212   LCD->FRQ |= LCD_Prescaler;
 534  0009 9e            	ld	a,xh
 535  000a ca5403        	or	a,21507
 536  000d c75403        	ld	21507,a
 537                     ; 214   LCD->FRQ &= (uint8_t)(~LCD_FRQ_DIV);     /* Clear the divider bits */
 539  0010 c65403        	ld	a,21507
 540  0013 a4f0          	and	a,#240
 541  0015 c75403        	ld	21507,a
 542                     ; 215   LCD->FRQ |= LCD_Divider;
 544  0018 9f            	ld	a,xl
 545  0019 ca5403        	or	a,21507
 546  001c c75403        	ld	21507,a
 547                     ; 218   LCD->CR1 &= (uint8_t)(~LCD_CR1_DUTY);    /* Clear the duty bits */
 549  001f c65400        	ld	a,21504
 550  0022 a4f9          	and	a,#249
 551  0024 c75400        	ld	21504,a
 552                     ; 219   LCD->CR4 &= (uint8_t)(~LCD_CR4_DUTY8);   /* Clear the DUTY8 bit */
 554  0027 7213542f      	bres	21551,#1
 555                     ; 221   if (LCD_Duty == LCD_Duty_1_8)
 557  002b 7b06          	ld	a,(OFST+6,sp)
 558  002d a120          	cp	a,#32
 559  002f 260f          	jrne	L742
 560                     ; 223     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Duty & (uint8_t)0xF0) >> 4);
 562  0031 7b06          	ld	a,(OFST+6,sp)
 563  0033 a4f0          	and	a,#240
 564  0035 4e            	swap	a
 565  0036 a40f          	and	a,#15
 566  0038 ca542f        	or	a,21551
 567  003b c7542f        	ld	21551,a
 569  003e 200a          	jra	L152
 570  0040               L742:
 571                     ; 227     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Duty & (uint8_t)0x0F);
 573  0040 7b06          	ld	a,(OFST+6,sp)
 574  0042 a40f          	and	a,#15
 575  0044 ca5400        	or	a,21504
 576  0047 c75400        	ld	21504,a
 577  004a               L152:
 578                     ; 231   LCD->CR1 &= (uint8_t)(~LCD_CR1_B2);      /* Clear the B2 bit */
 580  004a 72115400      	bres	21504,#0
 581                     ; 232   LCD->CR4 &= (uint8_t)(~LCD_CR4_B4);      /* Clear the B4 bit */
 583  004e 7211542f      	bres	21551,#0
 584                     ; 234   if (LCD_Bias == LCD_Bias_1_4)
 586  0052 7b07          	ld	a,(OFST+7,sp)
 587  0054 a110          	cp	a,#16
 588  0056 2619          	jrne	L352
 589                     ; 236     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 591  0058 7b07          	ld	a,(OFST+7,sp)
 592  005a a40f          	and	a,#15
 593  005c ca5400        	or	a,21504
 594  005f c75400        	ld	21504,a
 595                     ; 237     LCD->CR4 |= (uint8_t)((uint8_t)((uint8_t)LCD_Bias & (uint8_t)0xF0) >> 4);
 597  0062 7b07          	ld	a,(OFST+7,sp)
 598  0064 a4f0          	and	a,#240
 599  0066 4e            	swap	a
 600  0067 a40f          	and	a,#15
 601  0069 ca542f        	or	a,21551
 602  006c c7542f        	ld	21551,a
 604  006f 200a          	jra	L552
 605  0071               L352:
 606                     ; 241     LCD->CR1 |= (uint8_t)((uint8_t)LCD_Bias & (uint8_t)0x0F);
 608  0071 7b07          	ld	a,(OFST+7,sp)
 609  0073 a40f          	and	a,#15
 610  0075 ca5400        	or	a,21504
 611  0078 c75400        	ld	21504,a
 612  007b               L552:
 613                     ; 244   LCD->CR2 &= (uint8_t)(~LCD_CR2_VSEL);    /* Clear the voltage source bit */
 615  007b 72115401      	bres	21505,#0
 616                     ; 245   LCD->CR2 |= LCD_VoltageSource;
 618  007f c65401        	ld	a,21505
 619  0082 1a08          	or	a,(OFST+8,sp)
 620  0084 c75401        	ld	21505,a
 621                     ; 247 }
 624  0087 85            	popw	x
 625  0088 87            	retf
 721                     ; 262 void LCD_PortMaskConfig(LCD_PortMaskRegister_TypeDef LCD_PortMaskRegister, uint8_t LCD_Mask)
 721                     ; 263 {
 722                     .text:	section	.text,new
 723  0000               f_LCD_PortMaskConfig:
 725  0000 89            	pushw	x
 726       00000000      OFST:	set	0
 729                     ; 265   assert_param(IS_LCD_PORT_MASK(LCD_PortMaskRegister));
 731                     ; 268   LCD->PM[LCD_PortMaskRegister] =  LCD_Mask;
 733  0001 9e            	ld	a,xh
 734  0002 5f            	clrw	x
 735  0003 97            	ld	xl,a
 736  0004 7b02          	ld	a,(OFST+2,sp)
 737  0006 d75404        	ld	(21508,x),a
 738                     ; 270 }
 741  0009 85            	popw	x
 742  000a 87            	retf
 796                     ; 279 void LCD_Cmd(FunctionalState NewState)
 796                     ; 280 {
 797                     .text:	section	.text,new
 798  0000               f_LCD_Cmd:
 802                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 804                     ; 284   if (NewState != DISABLE)
 806  0000 4d            	tnz	a
 807  0001 2706          	jreq	L543
 808                     ; 286     LCD->CR3 |= LCD_CR3_LCDEN; /* Enable the LCD peripheral*/
 810  0003 721c5402      	bset	21506,#6
 812  0007 2004          	jra	L743
 813  0009               L543:
 814                     ; 290     LCD->CR3 &= (uint8_t)(~LCD_CR3_LCDEN); /* Disable the LCD peripheral*/
 816  0009 721d5402      	bres	21506,#6
 817  000d               L743:
 818                     ; 292 }
 821  000d 87            	retf
 855                     ; 305 void LCD_HighDriveCmd(FunctionalState NewState)
 855                     ; 306 {
 856                     .text:	section	.text,new
 857  0000               f_LCD_HighDriveCmd:
 861                     ; 308   assert_param(IS_FUNCTIONAL_STATE(NewState));
 863                     ; 310   if (NewState != DISABLE)
 865  0000 4d            	tnz	a
 866  0001 2706          	jreq	L763
 867                     ; 312     LCD->CR2 |= LCD_CR2_HD; /* Permanently enable low resistance divider */
 869  0003 72185401      	bset	21505,#4
 871  0007 2004          	jra	L173
 872  0009               L763:
 873                     ; 316     LCD->CR2 &= (uint8_t)(~LCD_CR2_HD); /* Permanently disable low resistance divider */
 875  0009 72195401      	bres	21505,#4
 876  000d               L173:
 877                     ; 318 }
 880  000d 87            	retf
 986                     ; 335 void LCD_PulseOnDurationConfig(LCD_PulseOnDuration_TypeDef LCD_PulseOnDuration)
 986                     ; 336 {
 987                     .text:	section	.text,new
 988  0000               f_LCD_PulseOnDurationConfig:
 990  0000 88            	push	a
 991       00000000      OFST:	set	0
 994                     ; 338   assert_param(IS_LCD_PULSE_DURATION(LCD_PulseOnDuration));
 996                     ; 340   LCD->CR2 &= (uint8_t)(~LCD_CR2_PON); /* Clear the pulses on duration bits */
 998  0001 c65401        	ld	a,21505
 999  0004 a41f          	and	a,#31
1000  0006 c75401        	ld	21505,a
1001                     ; 341   LCD->CR2 |= LCD_PulseOnDuration;
1003  0009 c65401        	ld	a,21505
1004  000c 1a01          	or	a,(OFST+1,sp)
1005  000e c75401        	ld	21505,a
1006                     ; 342 }
1009  0011 84            	pop	a
1010  0012 87            	retf
1106                     ; 358 void LCD_DeadTimeConfig(LCD_DeadTime_TypeDef LCD_DeadTime)
1106                     ; 359 {
1107                     .text:	section	.text,new
1108  0000               f_LCD_DeadTimeConfig:
1110  0000 88            	push	a
1111       00000000      OFST:	set	0
1114                     ; 361   assert_param(IS_LCD_DEAD_TIME(LCD_DeadTime));
1116                     ; 363   LCD->CR3 &= (uint8_t)(~LCD_CR3_DEAD);  /* Clear the dead time bits  */
1118  0001 c65402        	ld	a,21506
1119  0004 a4f8          	and	a,#248
1120  0006 c75402        	ld	21506,a
1121                     ; 365   LCD->CR3 |= LCD_DeadTime;
1123  0009 c65402        	ld	a,21506
1124  000c 1a01          	or	a,(OFST+1,sp)
1125  000e c75402        	ld	21506,a
1126                     ; 367 }
1129  0011 84            	pop	a
1130  0012 87            	retf
1281                     ; 391 void LCD_BlinkConfig(LCD_BlinkMode_TypeDef LCD_BlinkMode, LCD_BlinkFrequency_TypeDef LCD_BlinkFrequency)
1281                     ; 392 {
1282                     .text:	section	.text,new
1283  0000               f_LCD_BlinkConfig:
1287                     ; 394   assert_param(IS_LCD_BLINK_MODE(LCD_BlinkMode));
1289                     ; 395   assert_param(IS_LCD_BLINK_FREQUENCY(LCD_BlinkFrequency));
1291                     ; 397   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINK); /* Clear the blink mode bits */
1293  0000 c65400        	ld	a,21504
1294  0003 a43f          	and	a,#63
1295  0005 c75400        	ld	21504,a
1296                     ; 398   LCD->CR1 |= LCD_BlinkMode; /* Config the LCD Blink Mode */
1298  0008 9e            	ld	a,xh
1299  0009 ca5400        	or	a,21504
1300  000c c75400        	ld	21504,a
1301                     ; 400   LCD->CR1 &= (uint8_t)(~LCD_CR1_BLINKF); /* Clear the blink frequency bits */
1303  000f c65400        	ld	a,21504
1304  0012 a4c7          	and	a,#199
1305  0014 c75400        	ld	21504,a
1306                     ; 401   LCD->CR1 |= LCD_BlinkFrequency; /* Config the LCD Blink Frequency */
1308  0017 9f            	ld	a,xl
1309  0018 ca5400        	or	a,21504
1310  001b c75400        	ld	21504,a
1311                     ; 403 }
1314  001e 87            	retf
1418                     ; 419 void LCD_ContrastConfig(LCD_Contrast_TypeDef LCD_Contrast)
1418                     ; 420 {
1419                     .text:	section	.text,new
1420  0000               f_LCD_ContrastConfig:
1422  0000 88            	push	a
1423       00000000      OFST:	set	0
1426                     ; 422   assert_param(IS_LCD_CONTRAST(LCD_Contrast));
1428                     ; 424   LCD->CR2 &= (uint8_t)(~LCD_CR2_CC); /* Clear the contrast bits  */
1430  0001 c65401        	ld	a,21505
1431  0004 a4f1          	and	a,#241
1432  0006 c75401        	ld	21505,a
1433                     ; 425   LCD->CR2 |= LCD_Contrast; /* Select the maximum voltage value Vlcd */
1435  0009 c65401        	ld	a,21505
1436  000c 1a01          	or	a,(OFST+1,sp)
1437  000e c75401        	ld	21505,a
1438                     ; 427 }
1441  0011 84            	pop	a
1442  0012 87            	retf
1643                     ; 474 void LCD_WriteRAM(LCD_RAMRegister_TypeDef LCD_RAMRegister, uint8_t LCD_Data)
1643                     ; 475 {
1644                     .text:	section	.text,new
1645  0000               f_LCD_WriteRAM:
1647  0000 89            	pushw	x
1648       00000000      OFST:	set	0
1651                     ; 477   assert_param(IS_LCD_RAM_REGISTER(LCD_RAMRegister));
1653                     ; 480   LCD->RAM[LCD_RAMRegister] =  LCD_Data;
1655  0001 9e            	ld	a,xh
1656  0002 5f            	clrw	x
1657  0003 97            	ld	xl,a
1658  0004 7b02          	ld	a,(OFST+2,sp)
1659  0006 d7540c        	ld	(21516,x),a
1660                     ; 482 }
1663  0009 85            	popw	x
1664  000a 87            	retf
1720                     ; 492 void LCD_PageSelect(LCD_PageSelection_TypeDef LCD_PageSelection)
1720                     ; 493 {
1721                     .text:	section	.text,new
1722  0000               f_LCD_PageSelect:
1726                     ; 495   assert_param(IS_LCD_PAGE_SELECT(LCD_PageSelection));
1728                     ; 497   LCD->CR4 &= (uint8_t)(~LCD_CR4_PAGECOM); /* Clear the PAGE COM bit */
1730  0000 7215542f      	bres	21551,#2
1731                     ; 498   LCD->CR4 |= LCD_PageSelection; /* Select the LCD page */
1733  0004 ca542f        	or	a,21551
1734  0007 c7542f        	ld	21551,a
1735                     ; 500 }
1738  000a 87            	retf
1772                     ; 525 void LCD_ITConfig(FunctionalState NewState)
1772                     ; 526 {
1773                     .text:	section	.text,new
1774  0000               f_LCD_ITConfig:
1778                     ; 528   assert_param(IS_FUNCTIONAL_STATE(NewState));
1780                     ; 530   if (NewState != DISABLE)
1782  0000 4d            	tnz	a
1783  0001 2706          	jreq	L767
1784                     ; 532     LCD->CR3 |= LCD_CR3_SOFIE; /* Enable interrupt*/
1786  0003 721a5402      	bset	21506,#5
1788  0007 2004          	jra	L177
1789  0009               L767:
1790                     ; 536     LCD->CR3 &= (uint8_t)(~LCD_CR3_SOFIE); /* Disable interrupt*/
1792  0009 721b5402      	bres	21506,#5
1793  000d               L177:
1794                     ; 539 }
1797  000d 87            	retf
1852                     ; 546 FlagStatus LCD_GetFlagStatus(void)
1852                     ; 547 {
1853                     .text:	section	.text,new
1854  0000               f_LCD_GetFlagStatus:
1856  0000 88            	push	a
1857       00000001      OFST:	set	1
1860                     ; 548   FlagStatus status = RESET;
1862  0001 0f01          	clr	(OFST+0,sp)
1863                     ; 551   if ((LCD->CR3 & (uint8_t)LCD_CR3_SOF) != (uint8_t)RESET)
1865  0003 c65402        	ld	a,21506
1866  0006 a510          	bcp	a,#16
1867  0008 2706          	jreq	L1201
1868                     ; 553     status = SET; /* Flag is set */
1870  000a a601          	ld	a,#1
1871  000c 6b01          	ld	(OFST+0,sp),a
1873  000e 2002          	jra	L3201
1874  0010               L1201:
1875                     ; 557     status = RESET; /* Flag is reset*/
1877  0010 0f01          	clr	(OFST+0,sp)
1878  0012               L3201:
1879                     ; 560   return status;
1881  0012 7b01          	ld	a,(OFST+0,sp)
1884  0014 5b01          	addw	sp,#1
1885  0016 87            	retf
1907                     ; 569 void LCD_ClearFlag(void)
1907                     ; 570 {
1908                     .text:	section	.text,new
1909  0000               f_LCD_ClearFlag:
1913                     ; 572   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
1915  0000 72165402      	bset	21506,#3
1916                     ; 574 }
1919  0004 87            	retf
1961                     ; 582 ITStatus LCD_GetITStatus(void)
1961                     ; 583 {
1962                     .text:	section	.text,new
1963  0000               f_LCD_GetITStatus:
1965  0000 88            	push	a
1966       00000001      OFST:	set	1
1969                     ; 584   ITStatus pendingbitstatus = RESET;
1971  0001 7b01          	ld	a,(OFST+0,sp)
1972  0003 97            	ld	xl,a
1973                     ; 585   uint8_t enablestatus = 0;
1975  0004 7b01          	ld	a,(OFST+0,sp)
1976  0006 97            	ld	xl,a
1977                     ; 587   enablestatus = (uint8_t)((uint8_t)LCD->CR3 & LCD_CR3_SOFIE);
1979  0007 c65402        	ld	a,21506
1980  000a a420          	and	a,#32
1981  000c 6b01          	ld	(OFST+0,sp),a
1982                     ; 589   if (((LCD->CR3 & LCD_CR3_SOF) != RESET) && enablestatus)
1984  000e c65402        	ld	a,21506
1985  0011 a510          	bcp	a,#16
1986  0013 270a          	jreq	L5501
1988  0015 0d01          	tnz	(OFST+0,sp)
1989  0017 2706          	jreq	L5501
1990                     ; 592     pendingbitstatus = SET;
1992  0019 a601          	ld	a,#1
1993  001b 6b01          	ld	(OFST+0,sp),a
1995  001d 2002          	jra	L7501
1996  001f               L5501:
1997                     ; 597     pendingbitstatus = RESET;
1999  001f 0f01          	clr	(OFST+0,sp)
2000  0021               L7501:
2001                     ; 600   return  pendingbitstatus;
2003  0021 7b01          	ld	a,(OFST+0,sp)
2006  0023 5b01          	addw	sp,#1
2007  0025 87            	retf
2030                     ; 609 void LCD_ClearITPendingBit(void)
2030                     ; 610 {
2031                     .text:	section	.text,new
2032  0000               f_LCD_ClearITPendingBit:
2036                     ; 612   LCD->CR3 |= (uint8_t)(LCD_CR3_SOFC);
2038  0000 72165402      	bset	21506,#3
2039                     ; 614 }
2042  0004 87            	retf
2054                     	xdef	f_LCD_ClearITPendingBit
2055                     	xdef	f_LCD_GetITStatus
2056                     	xdef	f_LCD_ClearFlag
2057                     	xdef	f_LCD_GetFlagStatus
2058                     	xdef	f_LCD_ITConfig
2059                     	xdef	f_LCD_PageSelect
2060                     	xdef	f_LCD_WriteRAM
2061                     	xdef	f_LCD_ContrastConfig
2062                     	xdef	f_LCD_BlinkConfig
2063                     	xdef	f_LCD_DeadTimeConfig
2064                     	xdef	f_LCD_PulseOnDurationConfig
2065                     	xdef	f_LCD_HighDriveCmd
2066                     	xdef	f_LCD_Cmd
2067                     	xdef	f_LCD_PortMaskConfig
2068                     	xdef	f_LCD_Init
2069                     	xdef	f_LCD_DeInit
2088                     	end
