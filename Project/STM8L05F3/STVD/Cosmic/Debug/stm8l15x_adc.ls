   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 164                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 164                     ; 136 {
 166                     .text:	section	.text,new
 167  0000               _ADC_DeInit:
 171                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 173  0000 7f            	clr	(x)
 174                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 176  0001 6f01          	clr	(1,x)
 177                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 179  0003 a61f          	ld	a,#31
 180  0005 e702          	ld	(2,x),a
 181                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 183  0007 a6ff          	ld	a,#255
 184  0009 e703          	ld	(3,x),a
 185                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 187  000b a60f          	ld	a,#15
 188  000d e706          	ld	(6,x),a
 189                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 191  000f a6ff          	ld	a,#255
 192  0011 e707          	ld	(7,x),a
 193                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 195  0013 6f08          	clr	(8,x)
 196                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 198  0015 6f09          	clr	(9,x)
 199                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 201  0017 6f0a          	clr	(10,x)
 202                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 204  0019 6f0b          	clr	(11,x)
 205                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 207  001b 6f0c          	clr	(12,x)
 208                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 210  001d 6f0d          	clr	(13,x)
 211                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 213  001f 6f0e          	clr	(14,x)
 214                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 216  0021 6f0f          	clr	(15,x)
 217                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 219  0023 6f10          	clr	(16,x)
 220                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 222  0025 6f11          	clr	(17,x)
 223                     ; 164 }
 226  0027 81            	ret	
 373                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 373                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 373                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 373                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 373                     ; 190 {
 374                     .text:	section	.text,new
 375  0000               _ADC_Init:
 377  0000 89            	pushw	x
 378       00000000      OFST:	set	0
 381                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 383                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 385                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 387                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 389  0001 f6            	ld	a,(x)
 390  0002 a49b          	and	a,#155
 391  0004 f7            	ld	(x),a
 392                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 394  0005 7b05          	ld	a,(OFST+5,sp)
 395  0007 1a06          	or	a,(OFST+6,sp)
 396  0009 fa            	or	a,(x)
 397  000a f7            	ld	(x),a
 398                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 400  000b e601          	ld	a,(1,x)
 401  000d a47f          	and	a,#127
 402  000f e701          	ld	(1,x),a
 403                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 405  0011 e601          	ld	a,(1,x)
 406  0013 1a07          	or	a,(OFST+7,sp)
 407  0015 e701          	ld	(1,x),a
 408                     ; 207 }
 411  0017 85            	popw	x
 412  0018 81            	ret	
 479                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 479                     ; 217              FunctionalState NewState)
 479                     ; 218 {
 480                     .text:	section	.text,new
 481  0000               _ADC_Cmd:
 483  0000 89            	pushw	x
 484       00000000      OFST:	set	0
 487                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 489                     ; 222   if (NewState != DISABLE)
 491  0001 7b05          	ld	a,(OFST+5,sp)
 492  0003 2705          	jreq	L142
 493                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 495  0005 f6            	ld	a,(x)
 496  0006 aa01          	or	a,#1
 498  0008 2005          	jra	L342
 499  000a               L142:
 500                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 502  000a 1e01          	ldw	x,(OFST+1,sp)
 503  000c f6            	ld	a,(x)
 504  000d a4fe          	and	a,#254
 505  000f               L342:
 506  000f f7            	ld	(x),a
 507                     ; 232 }
 510  0010 85            	popw	x
 511  0011 81            	ret	
 549                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 549                     ; 240 {
 550                     .text:	section	.text,new
 551  0000               _ADC_SoftwareStartConv:
 555                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 557  0000 f6            	ld	a,(x)
 558  0001 aa02          	or	a,#2
 559  0003 f7            	ld	(x),a
 560                     ; 243 }
 563  0004 81            	ret	
 691                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 691                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 691                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 691                     ; 264 {
 692                     .text:	section	.text,new
 693  0000               _ADC_ExternalTrigConfig:
 695  0000 89            	pushw	x
 696       00000000      OFST:	set	0
 699                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 701                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 703                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 705  0001 e601          	ld	a,(1,x)
 706  0003 a487          	and	a,#135
 707  0005 e701          	ld	(1,x),a
 708                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 708                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 710  0007 7b06          	ld	a,(OFST+6,sp)
 711  0009 1a05          	or	a,(OFST+5,sp)
 712  000b ea01          	or	a,(1,x)
 713  000d e701          	ld	(1,x),a
 714                     ; 276 }
 717  000f 85            	popw	x
 718  0010 81            	ret	
1032                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1032                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1032                     ; 341 {
1033                     .text:	section	.text,new
1034  0000               _ADC_AnalogWatchdogChannelSelect:
1036  0000 89            	pushw	x
1037       00000000      OFST:	set	0
1040                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1042                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1044  0001 e602          	ld	a,(2,x)
1045  0003 a4e0          	and	a,#224
1046  0005 e702          	ld	(2,x),a
1047                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1049  0007 e602          	ld	a,(2,x)
1050  0009 1a05          	or	a,(OFST+5,sp)
1051  000b e702          	ld	(2,x),a
1052                     ; 350 }
1055  000d 85            	popw	x
1056  000e 81            	ret	
1112                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1112                     ; 362 {
1113                     .text:	section	.text,new
1114  0000               _ADC_AnalogWatchdogThresholdsConfig:
1116  0000 89            	pushw	x
1117       00000000      OFST:	set	0
1120                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1122                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1124                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1126  0001 7b05          	ld	a,(OFST+5,sp)
1127  0003 1e01          	ldw	x,(OFST+1,sp)
1128  0005 e706          	ld	(6,x),a
1129                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1131  0007 7b06          	ld	a,(OFST+6,sp)
1132  0009 e707          	ld	(7,x),a
1133                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1135  000b 7b07          	ld	a,(OFST+7,sp)
1136  000d e708          	ld	(8,x),a
1137                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1139  000f 7b08          	ld	a,(OFST+8,sp)
1140  0011 e709          	ld	(9,x),a
1141                     ; 374 }
1144  0013 85            	popw	x
1145  0014 81            	ret	
1212                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1212                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1212                     ; 414                               uint16_t HighThreshold,
1212                     ; 415                               uint16_t LowThreshold)
1212                     ; 416 {
1213                     .text:	section	.text,new
1214  0000               _ADC_AnalogWatchdogConfig:
1216  0000 89            	pushw	x
1217       00000000      OFST:	set	0
1220                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1222                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1224                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1226                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1228  0001 e602          	ld	a,(2,x)
1229  0003 a4e0          	and	a,#224
1230  0005 e702          	ld	(2,x),a
1231                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1233  0007 e602          	ld	a,(2,x)
1234  0009 1a05          	or	a,(OFST+5,sp)
1235  000b e702          	ld	(2,x),a
1236                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1238  000d 7b06          	ld	a,(OFST+6,sp)
1239  000f 1e01          	ldw	x,(OFST+1,sp)
1240  0011 e706          	ld	(6,x),a
1241                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1243  0013 7b07          	ld	a,(OFST+7,sp)
1244  0015 e707          	ld	(7,x),a
1245                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1247  0017 7b08          	ld	a,(OFST+8,sp)
1248  0019 e708          	ld	(8,x),a
1249                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1251  001b 7b09          	ld	a,(OFST+9,sp)
1252  001d e709          	ld	(9,x),a
1253                     ; 435 }
1256  001f 85            	popw	x
1257  0020 81            	ret	
1292                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1292                     ; 475 {
1293                     .text:	section	.text,new
1294  0000               _ADC_TempSensorCmd:
1298                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1300                     ; 479   if (NewState != DISABLE)
1302  0000 4d            	tnz	a
1303  0001 2705          	jreq	L175
1304                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1306  0003 721a534e      	bset	21326,#5
1309  0007 81            	ret	
1310  0008               L175:
1311                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1313  0008 721b534e      	bres	21326,#5
1314                     ; 489 }
1317  000c 81            	ret	
1352                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1352                     ; 498 {
1353                     .text:	section	.text,new
1354  0000               _ADC_VrefintCmd:
1358                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1360                     ; 502   if (NewState != DISABLE)
1362  0000 4d            	tnz	a
1363  0001 2705          	jreq	L316
1364                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1366  0003 7218534e      	bset	21326,#4
1369  0007 81            	ret	
1370  0008               L316:
1371                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1373  0008 7219534e      	bres	21326,#4
1374                     ; 512 }
1377  000c 81            	ret	
1689                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1689                     ; 584 {
1690                     .text:	section	.text,new
1691  0000               _ADC_ChannelCmd:
1693  0000 89            	pushw	x
1694  0001 88            	push	a
1695       00000001      OFST:	set	1
1698                     ; 585   uint8_t regindex = 0;
1700  0002 0f01          	clr	(OFST+0,sp)
1701                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1703                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1705  0004 7b06          	ld	a,(OFST+5,sp)
1706  0006 6b01          	ld	(OFST+0,sp),a
1707                     ; 591   if (NewState != DISABLE)
1709  0008 0d08          	tnz	(OFST+7,sp)
1710  000a 270d          	jreq	L367
1711                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1713  000c 01            	rrwa	x,a
1714  000d 1b01          	add	a,(OFST+0,sp)
1715  000f 2401          	jrnc	L23
1716  0011 5c            	incw	x
1717  0012               L23:
1718  0012 02            	rlwa	x,a
1719  0013 e60a          	ld	a,(10,x)
1720  0015 1a07          	or	a,(OFST+6,sp)
1722  0017 2010          	jra	L567
1723  0019               L367:
1724                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1726  0019 7b02          	ld	a,(OFST+1,sp)
1727  001b 97            	ld	xl,a
1728  001c 7b03          	ld	a,(OFST+2,sp)
1729  001e 1b01          	add	a,(OFST+0,sp)
1730  0020 2401          	jrnc	L43
1731  0022 5c            	incw	x
1732  0023               L43:
1733  0023 02            	rlwa	x,a
1734  0024 7b07          	ld	a,(OFST+6,sp)
1735  0026 43            	cpl	a
1736  0027 e40a          	and	a,(10,x)
1737  0029               L567:
1738  0029 e70a          	ld	(10,x),a
1739                     ; 601 }
1742  002b 5b03          	addw	sp,#3
1743  002d 81            	ret	
1893                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1893                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1893                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1893                     ; 628 {
1894                     .text:	section	.text,new
1895  0000               _ADC_SamplingTimeConfig:
1897  0000 89            	pushw	x
1898       00000000      OFST:	set	0
1901                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1903                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1905                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1907  0001 7b05          	ld	a,(OFST+5,sp)
1908  0003 2712          	jreq	L3501
1909                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1911  0005 e602          	ld	a,(2,x)
1912  0007 a41f          	and	a,#31
1913  0009 e702          	ld	(2,x),a
1914                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1916  000b 7b06          	ld	a,(OFST+6,sp)
1917  000d 4e            	swap	a
1918  000e 48            	sll	a
1919  000f a4e0          	and	a,#224
1920  0011 ea02          	or	a,(2,x)
1921  0013 e702          	ld	(2,x),a
1923  0015 200e          	jra	L5501
1924  0017               L3501:
1925                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1927  0017 1e01          	ldw	x,(OFST+1,sp)
1928  0019 e601          	ld	a,(1,x)
1929  001b a4f8          	and	a,#248
1930  001d e701          	ld	(1,x),a
1931                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1933  001f e601          	ld	a,(1,x)
1934  0021 1a06          	or	a,(OFST+6,sp)
1935  0023 e701          	ld	(1,x),a
1936  0025               L5501:
1937                     ; 645 }
1940  0025 85            	popw	x
1941  0026 81            	ret	
2008                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2008                     ; 692                               FunctionalState NewState)
2008                     ; 693 {
2009                     .text:	section	.text,new
2010  0000               _ADC_SchmittTriggerConfig:
2012  0000 89            	pushw	x
2013  0001 88            	push	a
2014       00000001      OFST:	set	1
2017                     ; 694   uint8_t regindex = 0;
2019  0002 0f01          	clr	(OFST+0,sp)
2020                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
2022                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2024  0004 7b06          	ld	a,(OFST+5,sp)
2025  0006 6b01          	ld	(OFST+0,sp),a
2026                     ; 700   if (NewState != DISABLE)
2028  0008 0d08          	tnz	(OFST+7,sp)
2029  000a 270e          	jreq	L3111
2030                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2032  000c 01            	rrwa	x,a
2033  000d 1b01          	add	a,(OFST+0,sp)
2034  000f 2401          	jrnc	L24
2035  0011 5c            	incw	x
2036  0012               L24:
2037  0012 02            	rlwa	x,a
2038  0013 7b07          	ld	a,(OFST+6,sp)
2039  0015 43            	cpl	a
2040  0016 e40e          	and	a,(14,x)
2042  0018 200f          	jra	L5111
2043  001a               L3111:
2044                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2046  001a 7b02          	ld	a,(OFST+1,sp)
2047  001c 97            	ld	xl,a
2048  001d 7b03          	ld	a,(OFST+2,sp)
2049  001f 1b01          	add	a,(OFST+0,sp)
2050  0021 2401          	jrnc	L44
2051  0023 5c            	incw	x
2052  0024               L44:
2053  0024 02            	rlwa	x,a
2054  0025 e60e          	ld	a,(14,x)
2055  0027 1a07          	or	a,(OFST+6,sp)
2056  0029               L5111:
2057  0029 e70e          	ld	(14,x),a
2058                     ; 710 }
2061  002b 5b03          	addw	sp,#3
2062  002d 81            	ret	
2109                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2109                     ; 718 {
2110                     .text:	section	.text,new
2111  0000               _ADC_GetConversionValue:
2113  0000 89            	pushw	x
2114  0001 89            	pushw	x
2115       00000002      OFST:	set	2
2118                     ; 719   uint16_t tmpreg = 0;
2120                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2122  0002 1e03          	ldw	x,(OFST+1,sp)
2123  0004 e604          	ld	a,(4,x)
2124  0006 97            	ld	xl,a
2125                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2127  0007 1603          	ldw	y,(OFST+1,sp)
2128  0009 90e605        	ld	a,(5,y)
2129  000c 02            	rlwa	x,a
2130                     ; 726   return (uint16_t)(tmpreg) ;
2134  000d 5b04          	addw	sp,#4
2135  000f 81            	ret	
2182                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2182                     ; 761 {
2183                     .text:	section	.text,new
2184  0000               _ADC_DMACmd:
2186  0000 89            	pushw	x
2187       00000000      OFST:	set	0
2190                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2192                     ; 765   if (NewState != DISABLE)
2194  0001 7b05          	ld	a,(OFST+5,sp)
2195  0003 2706          	jreq	L7611
2196                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2198  0005 e60a          	ld	a,(10,x)
2199  0007 a47f          	and	a,#127
2201  0009 2006          	jra	L1711
2202  000b               L7611:
2203                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2205  000b 1e01          	ldw	x,(OFST+1,sp)
2206  000d e60a          	ld	a,(10,x)
2207  000f aa80          	or	a,#128
2208  0011               L1711:
2209  0011 e70a          	ld	(10,x),a
2210                     ; 775 }
2213  0013 85            	popw	x
2214  0014 81            	ret	
2298                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2298                     ; 832 {
2299                     .text:	section	.text,new
2300  0000               _ADC_ITConfig:
2302  0000 89            	pushw	x
2303       00000000      OFST:	set	0
2306                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2308                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2310                     ; 837   if (NewState != DISABLE)
2312  0001 7b06          	ld	a,(OFST+6,sp)
2313  0003 2705          	jreq	L5321
2314                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2316  0005 f6            	ld	a,(x)
2317  0006 1a05          	or	a,(OFST+5,sp)
2319  0008 2006          	jra	L7321
2320  000a               L5321:
2321                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2323  000a 1e01          	ldw	x,(OFST+1,sp)
2324  000c 7b05          	ld	a,(OFST+5,sp)
2325  000e 43            	cpl	a
2326  000f f4            	and	a,(x)
2327  0010               L7321:
2328  0010 f7            	ld	(x),a
2329                     ; 847 }
2332  0011 85            	popw	x
2333  0012 81            	ret	
2438                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2438                     ; 860 {
2439                     .text:	section	.text,new
2440  0000               _ADC_GetFlagStatus:
2442  0000 89            	pushw	x
2443  0001 88            	push	a
2444       00000001      OFST:	set	1
2447                     ; 861   FlagStatus flagstatus = RESET;
2449  0002 0f01          	clr	(OFST+0,sp)
2450                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2452                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2454  0004 e603          	ld	a,(3,x)
2455  0006 1506          	bcp	a,(OFST+5,sp)
2456  0008 2704          	jreq	L3131
2457                     ; 870     flagstatus = SET;
2459  000a a601          	ld	a,#1
2461  000c 2001          	jra	L5131
2462  000e               L3131:
2463                     ; 875     flagstatus = RESET;
2465  000e 4f            	clr	a
2466  000f               L5131:
2467                     ; 879   return  flagstatus;
2471  000f 5b03          	addw	sp,#3
2472  0011 81            	ret	
2519                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2519                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2519                     ; 894 {
2520                     .text:	section	.text,new
2521  0000               _ADC_ClearFlag:
2523  0000 89            	pushw	x
2524       00000000      OFST:	set	0
2527                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2529                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2531  0001 7b05          	ld	a,(OFST+5,sp)
2532  0003 43            	cpl	a
2533  0004 1e01          	ldw	x,(OFST+1,sp)
2534  0006 e703          	ld	(3,x),a
2535                     ; 900 }
2538  0008 85            	popw	x
2539  0009 81            	ret	
2615                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2615                     ; 913                          ADC_IT_TypeDef ADC_IT)
2615                     ; 914 {
2616                     .text:	section	.text,new
2617  0000               _ADC_GetITStatus:
2619  0000 89            	pushw	x
2620  0001 5203          	subw	sp,#3
2621       00000003      OFST:	set	3
2624                     ; 915   ITStatus itstatus = RESET;
2626                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2630                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2632                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2634  0003 7b08          	ld	a,(OFST+5,sp)
2635  0005 44            	srl	a
2636  0006 44            	srl	a
2637  0007 44            	srl	a
2638  0008 6b03          	ld	(OFST+0,sp),a
2639                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2639                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2641  000a a403          	and	a,#3
2642  000c 6b01          	ld	(OFST-2,sp),a
2643  000e 7b03          	ld	a,(OFST+0,sp)
2644  0010 a410          	and	a,#16
2645  0012 44            	srl	a
2646  0013 44            	srl	a
2647  0014 1a01          	or	a,(OFST-2,sp)
2648  0016 6b03          	ld	(OFST+0,sp),a
2649                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2651  0018 1e04          	ldw	x,(OFST+1,sp)
2652  001a f6            	ld	a,(x)
2653  001b 1408          	and	a,(OFST+5,sp)
2654  001d 6b02          	ld	(OFST-1,sp),a
2655                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2657  001f e603          	ld	a,(3,x)
2658  0021 1503          	bcp	a,(OFST+0,sp)
2659  0023 2708          	jreq	L3041
2661  0025 7b02          	ld	a,(OFST-1,sp)
2662  0027 2704          	jreq	L3041
2663                     ; 933     itstatus = SET;
2665  0029 a601          	ld	a,#1
2667  002b 2001          	jra	L5041
2668  002d               L3041:
2669                     ; 938     itstatus = RESET;
2671  002d 4f            	clr	a
2672  002e               L5041:
2673                     ; 942   return  itstatus;
2677  002e 5b05          	addw	sp,#5
2678  0030 81            	ret	
2735                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2735                     ; 956                            ADC_IT_TypeDef ADC_IT)
2735                     ; 957 {
2736                     .text:	section	.text,new
2737  0000               _ADC_ClearITPendingBit:
2739  0000 89            	pushw	x
2740  0001 89            	pushw	x
2741       00000002      OFST:	set	2
2744                     ; 958   uint8_t itmask = 0;
2746  0002 0f02          	clr	(OFST+0,sp)
2747                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2749                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2751  0004 7b07          	ld	a,(OFST+5,sp)
2752  0006 44            	srl	a
2753  0007 44            	srl	a
2754  0008 44            	srl	a
2755  0009 6b02          	ld	(OFST+0,sp),a
2756                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2756                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2758  000b a403          	and	a,#3
2759  000d 6b01          	ld	(OFST-1,sp),a
2760  000f 7b02          	ld	a,(OFST+0,sp)
2761  0011 a410          	and	a,#16
2762  0013 44            	srl	a
2763  0014 44            	srl	a
2764  0015 1a01          	or	a,(OFST-1,sp)
2765  0017 6b02          	ld	(OFST+0,sp),a
2766                     ; 969   ADCx->SR = (uint8_t)~itmask;
2768  0019 43            	cpl	a
2769  001a 1e03          	ldw	x,(OFST+1,sp)
2770  001c e703          	ld	(3,x),a
2771                     ; 970 }
2774  001e 5b04          	addw	sp,#4
2775  0020 81            	ret	
2788                     	xdef	_ADC_ClearITPendingBit
2789                     	xdef	_ADC_GetITStatus
2790                     	xdef	_ADC_ClearFlag
2791                     	xdef	_ADC_GetFlagStatus
2792                     	xdef	_ADC_ITConfig
2793                     	xdef	_ADC_DMACmd
2794                     	xdef	_ADC_GetConversionValue
2795                     	xdef	_ADC_SchmittTriggerConfig
2796                     	xdef	_ADC_SamplingTimeConfig
2797                     	xdef	_ADC_ChannelCmd
2798                     	xdef	_ADC_VrefintCmd
2799                     	xdef	_ADC_TempSensorCmd
2800                     	xdef	_ADC_AnalogWatchdogConfig
2801                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2802                     	xdef	_ADC_AnalogWatchdogChannelSelect
2803                     	xdef	_ADC_ExternalTrigConfig
2804                     	xdef	_ADC_SoftwareStartConv
2805                     	xdef	_ADC_Cmd
2806                     	xdef	_ADC_Init
2807                     	xdef	_ADC_DeInit
2826                     	end
