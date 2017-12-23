   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 164                     ; 135 void ADC_DeInit(ADC_TypeDef* ADCx)
 164                     ; 136 {
 165                     .text:	section	.text,new
 166  0000               f_ADC_DeInit:
 170                     ; 138   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 172  0000 7f            	clr	(x)
 173                     ; 139   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 175  0001 6f01          	clr	(1,x)
 176                     ; 140   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 178  0003 a61f          	ld	a,#31
 179  0005 e702          	ld	(2,x),a
 180                     ; 143   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 182  0007 a6ff          	ld	a,#255
 183  0009 e703          	ld	(3,x),a
 184                     ; 146   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 186  000b a60f          	ld	a,#15
 187  000d e706          	ld	(6,x),a
 188                     ; 147   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 190  000f a6ff          	ld	a,#255
 191  0011 e707          	ld	(7,x),a
 192                     ; 150   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 194  0013 6f08          	clr	(8,x)
 195                     ; 151   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 197  0015 6f09          	clr	(9,x)
 198                     ; 154   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 200  0017 6f0a          	clr	(10,x)
 201                     ; 155   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 203  0019 6f0b          	clr	(11,x)
 204                     ; 156   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 206  001b 6f0c          	clr	(12,x)
 207                     ; 157   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 209  001d 6f0d          	clr	(13,x)
 210                     ; 160   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 212  001f 6f0e          	clr	(14,x)
 213                     ; 161   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 215  0021 6f0f          	clr	(15,x)
 216                     ; 162   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 218  0023 6f10          	clr	(16,x)
 219                     ; 163   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 221  0025 6f11          	clr	(17,x)
 222                     ; 164 }
 225  0027 87            	retf	
 371                     ; 186 void ADC_Init(ADC_TypeDef* ADCx,
 371                     ; 187               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 371                     ; 188               ADC_Resolution_TypeDef ADC_Resolution,
 371                     ; 189               ADC_Prescaler_TypeDef ADC_Prescaler)
 371                     ; 190 {
 372                     .text:	section	.text,new
 373  0000               f_ADC_Init:
 375  0000 89            	pushw	x
 376       00000000      OFST:	set	0
 379                     ; 192   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 381                     ; 193   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 383                     ; 194   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 385                     ; 197   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 387  0001 f6            	ld	a,(x)
 388  0002 a49b          	and	a,#155
 389  0004 f7            	ld	(x),a
 390                     ; 200   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 392  0005 7b06          	ld	a,(OFST+6,sp)
 393  0007 1a07          	or	a,(OFST+7,sp)
 394  0009 fa            	or	a,(x)
 395  000a f7            	ld	(x),a
 396                     ; 203   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 398  000b e601          	ld	a,(1,x)
 399  000d a47f          	and	a,#127
 400  000f e701          	ld	(1,x),a
 401                     ; 206   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 403  0011 e601          	ld	a,(1,x)
 404  0013 1a08          	or	a,(OFST+8,sp)
 405  0015 e701          	ld	(1,x),a
 406                     ; 207 }
 409  0017 85            	popw	x
 410  0018 87            	retf	
 476                     ; 216 void ADC_Cmd(ADC_TypeDef* ADCx,
 476                     ; 217              FunctionalState NewState)
 476                     ; 218 {
 477                     .text:	section	.text,new
 478  0000               f_ADC_Cmd:
 480  0000 89            	pushw	x
 481       00000000      OFST:	set	0
 484                     ; 220   assert_param(IS_FUNCTIONAL_STATE(NewState));
 486                     ; 222   if (NewState != DISABLE)
 488  0001 7b06          	ld	a,(OFST+6,sp)
 489  0003 2705          	jreq	L142
 490                     ; 225     ADCx->CR1 |= ADC_CR1_ADON;
 492  0005 f6            	ld	a,(x)
 493  0006 aa01          	or	a,#1
 495  0008 2005          	jra	L342
 496  000a               L142:
 497                     ; 230     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 499  000a 1e01          	ldw	x,(OFST+1,sp)
 500  000c f6            	ld	a,(x)
 501  000d a4fe          	and	a,#254
 502  000f               L342:
 503  000f f7            	ld	(x),a
 504                     ; 232 }
 507  0010 85            	popw	x
 508  0011 87            	retf	
 545                     ; 239 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 545                     ; 240 {
 546                     .text:	section	.text,new
 547  0000               f_ADC_SoftwareStartConv:
 551                     ; 242   ADCx->CR1 |= ADC_CR1_START;
 553  0000 f6            	ld	a,(x)
 554  0001 aa02          	or	a,#2
 555  0003 f7            	ld	(x),a
 556                     ; 243 }
 559  0004 87            	retf	
 686                     ; 261 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 686                     ; 262                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 686                     ; 263                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 686                     ; 264 {
 687                     .text:	section	.text,new
 688  0000               f_ADC_ExternalTrigConfig:
 690  0000 89            	pushw	x
 691       00000000      OFST:	set	0
 694                     ; 266   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 696                     ; 267   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 698                     ; 270   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 700  0001 e601          	ld	a,(1,x)
 701  0003 a487          	and	a,#135
 702  0005 e701          	ld	(1,x),a
 703                     ; 274   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 703                     ; 275                           (uint8_t)ADC_ExtEventSelection);
 705  0007 7b07          	ld	a,(OFST+7,sp)
 706  0009 1a06          	or	a,(OFST+6,sp)
 707  000b ea01          	or	a,(1,x)
 708  000d e701          	ld	(1,x),a
 709                     ; 276 }
 712  000f 85            	popw	x
 713  0010 87            	retf	
1026                     ; 339 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1026                     ; 340                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1026                     ; 341 {
1027                     .text:	section	.text,new
1028  0000               f_ADC_AnalogWatchdogChannelSelect:
1030  0000 89            	pushw	x
1031       00000000      OFST:	set	0
1034                     ; 343   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1036                     ; 346   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1038  0001 e602          	ld	a,(2,x)
1039  0003 a4e0          	and	a,#224
1040  0005 e702          	ld	(2,x),a
1041                     ; 349   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1043  0007 e602          	ld	a,(2,x)
1044  0009 1a06          	or	a,(OFST+6,sp)
1045  000b e702          	ld	(2,x),a
1046                     ; 350 }
1049  000d 85            	popw	x
1050  000e 87            	retf	
1101                     ; 361 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1101                     ; 362 {
1102                     .text:	section	.text,new
1103  0000               f_ADC_AnalogWatchdogThresholdsConfig:
1105  0000 89            	pushw	x
1106       00000000      OFST:	set	0
1109                     ; 364   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1111                     ; 365   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1113                     ; 368   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1115  0001 7b06          	ld	a,(OFST+6,sp)
1116  0003 1e01          	ldw	x,(OFST+1,sp)
1117  0005 e706          	ld	(6,x),a
1118                     ; 369   ADCx->HTRL = (uint8_t)(HighThreshold);
1120  0007 7b07          	ld	a,(OFST+7,sp)
1121  0009 e707          	ld	(7,x),a
1122                     ; 372   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1124  000b 7b08          	ld	a,(OFST+8,sp)
1125  000d e708          	ld	(8,x),a
1126                     ; 373   ADCx->LTRL = (uint8_t)(LowThreshold);
1128  000f 7b09          	ld	a,(OFST+9,sp)
1129  0011 e709          	ld	(9,x),a
1130                     ; 374 }
1133  0013 85            	popw	x
1134  0014 87            	retf	
1196                     ; 412 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1196                     ; 413                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1196                     ; 414                               uint16_t HighThreshold,
1196                     ; 415                               uint16_t LowThreshold)
1196                     ; 416 {
1197                     .text:	section	.text,new
1198  0000               f_ADC_AnalogWatchdogConfig:
1200  0000 89            	pushw	x
1201       00000000      OFST:	set	0
1204                     ; 418   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1206                     ; 419   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1208                     ; 420   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1210                     ; 423   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1212  0001 e602          	ld	a,(2,x)
1213  0003 a4e0          	and	a,#224
1214  0005 e702          	ld	(2,x),a
1215                     ; 426   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1217  0007 e602          	ld	a,(2,x)
1218  0009 1a06          	or	a,(OFST+6,sp)
1219  000b e702          	ld	(2,x),a
1220                     ; 429   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1222  000d 7b07          	ld	a,(OFST+7,sp)
1223  000f 1e01          	ldw	x,(OFST+1,sp)
1224  0011 e706          	ld	(6,x),a
1225                     ; 430   ADCx->HTRL = (uint8_t)(HighThreshold);
1227  0013 7b08          	ld	a,(OFST+8,sp)
1228  0015 e707          	ld	(7,x),a
1229                     ; 433   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1231  0017 7b09          	ld	a,(OFST+9,sp)
1232  0019 e708          	ld	(8,x),a
1233                     ; 434   ADCx->LTRL = (uint8_t)LowThreshold;
1235  001b 7b0a          	ld	a,(OFST+10,sp)
1236  001d e709          	ld	(9,x),a
1237                     ; 435 }
1240  001f 85            	popw	x
1241  0020 87            	retf	
1275                     ; 474 void ADC_TempSensorCmd(FunctionalState NewState)
1275                     ; 475 {
1276                     .text:	section	.text,new
1277  0000               f_ADC_TempSensorCmd:
1281                     ; 477   assert_param(IS_FUNCTIONAL_STATE(NewState));
1283                     ; 479   if (NewState != DISABLE)
1285  0000 4d            	tnz	a
1286  0001 2705          	jreq	L165
1287                     ; 482     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1289  0003 721a534e      	bset	21326,#5
1292  0007 87            	retf	
1293  0008               L165:
1294                     ; 487     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1296  0008 721b534e      	bres	21326,#5
1297                     ; 489 }
1300  000c 87            	retf	
1334                     ; 497 void ADC_VrefintCmd(FunctionalState NewState)
1334                     ; 498 {
1335                     .text:	section	.text,new
1336  0000               f_ADC_VrefintCmd:
1340                     ; 500   assert_param(IS_FUNCTIONAL_STATE(NewState));
1342                     ; 502   if (NewState != DISABLE)
1344  0000 4d            	tnz	a
1345  0001 2705          	jreq	L306
1346                     ; 505     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1348  0003 7218534e      	bset	21326,#4
1351  0007 87            	retf	
1352  0008               L306:
1353                     ; 510     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1355  0008 7219534e      	bres	21326,#4
1356                     ; 512 }
1359  000c 87            	retf	
1668                     ; 583 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1668                     ; 584 {
1669                     .text:	section	.text,new
1670  0000               f_ADC_ChannelCmd:
1672  0000 89            	pushw	x
1673  0001 88            	push	a
1674       00000001      OFST:	set	1
1677                     ; 585   uint8_t regindex = 0;
1679  0002 0f01          	clr	(OFST+0,sp)
1680                     ; 587   assert_param(IS_FUNCTIONAL_STATE(NewState));
1682                     ; 589   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1684  0004 7b07          	ld	a,(OFST+6,sp)
1685  0006 6b01          	ld	(OFST+0,sp),a
1686                     ; 591   if (NewState != DISABLE)
1688  0008 0d09          	tnz	(OFST+8,sp)
1689  000a 270d          	jreq	L157
1690                     ; 594     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1692  000c 01            	rrwa	x,a
1693  000d 1b01          	add	a,(OFST+0,sp)
1694  000f 2401          	jrnc	L23
1695  0011 5c            	incw	x
1696  0012               L23:
1697  0012 02            	rlwa	x,a
1698  0013 e60a          	ld	a,(10,x)
1699  0015 1a08          	or	a,(OFST+7,sp)
1701  0017 2010          	jra	L357
1702  0019               L157:
1703                     ; 599     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1705  0019 7b02          	ld	a,(OFST+1,sp)
1706  001b 97            	ld	xl,a
1707  001c 7b03          	ld	a,(OFST+2,sp)
1708  001e 1b01          	add	a,(OFST+0,sp)
1709  0020 2401          	jrnc	L43
1710  0022 5c            	incw	x
1711  0023               L43:
1712  0023 02            	rlwa	x,a
1713  0024 7b08          	ld	a,(OFST+7,sp)
1714  0026 43            	cpl	a
1715  0027 e40a          	and	a,(10,x)
1716  0029               L357:
1717  0029 e70a          	ld	(10,x),a
1718                     ; 601 }
1721  002b 5b03          	addw	sp,#3
1722  002d 87            	retf	
1871                     ; 625 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1871                     ; 626                             ADC_Group_TypeDef ADC_GroupChannels,
1871                     ; 627                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1871                     ; 628 {
1872                     .text:	section	.text,new
1873  0000               f_ADC_SamplingTimeConfig:
1875  0000 89            	pushw	x
1876       00000000      OFST:	set	0
1879                     ; 630   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1881                     ; 631   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1883                     ; 633   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1885  0001 7b06          	ld	a,(OFST+6,sp)
1886  0003 2712          	jreq	L1401
1887                     ; 636     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1889  0005 e602          	ld	a,(2,x)
1890  0007 a41f          	and	a,#31
1891  0009 e702          	ld	(2,x),a
1892                     ; 637     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1894  000b 7b07          	ld	a,(OFST+7,sp)
1895  000d 4e            	swap	a
1896  000e 48            	sll	a
1897  000f a4e0          	and	a,#224
1898  0011 ea02          	or	a,(2,x)
1899  0013 e702          	ld	(2,x),a
1901  0015 200e          	jra	L3401
1902  0017               L1401:
1903                     ; 642     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1905  0017 1e01          	ldw	x,(OFST+1,sp)
1906  0019 e601          	ld	a,(1,x)
1907  001b a4f8          	and	a,#248
1908  001d e701          	ld	(1,x),a
1909                     ; 643     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1911  001f e601          	ld	a,(1,x)
1912  0021 1a07          	or	a,(OFST+7,sp)
1913  0023 e701          	ld	(1,x),a
1914  0025               L3401:
1915                     ; 645 }
1918  0025 85            	popw	x
1919  0026 87            	retf	
1983                     ; 691 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
1983                     ; 692                               FunctionalState NewState)
1983                     ; 693 {
1984                     .text:	section	.text,new
1985  0000               f_ADC_SchmittTriggerConfig:
1987  0000 89            	pushw	x
1988  0001 88            	push	a
1989       00000001      OFST:	set	1
1992                     ; 694   uint8_t regindex = 0;
1994  0002 0f01          	clr	(OFST+0,sp)
1995                     ; 696   assert_param(IS_FUNCTIONAL_STATE(NewState));
1997                     ; 698   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1999  0004 7b07          	ld	a,(OFST+6,sp)
2000  0006 6b01          	ld	(OFST+0,sp),a
2001                     ; 700   if (NewState != DISABLE)
2003  0008 0d09          	tnz	(OFST+8,sp)
2004  000a 270e          	jreq	L7701
2005                     ; 703     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2007  000c 01            	rrwa	x,a
2008  000d 1b01          	add	a,(OFST+0,sp)
2009  000f 2401          	jrnc	L24
2010  0011 5c            	incw	x
2011  0012               L24:
2012  0012 02            	rlwa	x,a
2013  0013 7b08          	ld	a,(OFST+7,sp)
2014  0015 43            	cpl	a
2015  0016 e40e          	and	a,(14,x)
2017  0018 200f          	jra	L1011
2018  001a               L7701:
2019                     ; 708     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2021  001a 7b02          	ld	a,(OFST+1,sp)
2022  001c 97            	ld	xl,a
2023  001d 7b03          	ld	a,(OFST+2,sp)
2024  001f 1b01          	add	a,(OFST+0,sp)
2025  0021 2401          	jrnc	L44
2026  0023 5c            	incw	x
2027  0024               L44:
2028  0024 02            	rlwa	x,a
2029  0025 e60e          	ld	a,(14,x)
2030  0027 1a08          	or	a,(OFST+7,sp)
2031  0029               L1011:
2032  0029 e70e          	ld	(14,x),a
2033                     ; 710 }
2036  002b 5b03          	addw	sp,#3
2037  002d 87            	retf	
2081                     ; 717 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2081                     ; 718 {
2082                     .text:	section	.text,new
2083  0000               f_ADC_GetConversionValue:
2085  0000 89            	pushw	x
2086  0001 89            	pushw	x
2087       00000002      OFST:	set	2
2090                     ; 719   uint16_t tmpreg = 0;
2092                     ; 722   tmpreg = (uint16_t)(ADCx->DRH);
2094  0002 1e03          	ldw	x,(OFST+1,sp)
2095  0004 e604          	ld	a,(4,x)
2096  0006 97            	ld	xl,a
2097                     ; 723   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2099  0007 1603          	ldw	y,(OFST+1,sp)
2100  0009 90e605        	ld	a,(5,y)
2101  000c 02            	rlwa	x,a
2102                     ; 726   return (uint16_t)(tmpreg) ;
2106  000d 5b04          	addw	sp,#4
2107  000f 87            	retf	
2153                     ; 760 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2153                     ; 761 {
2154                     .text:	section	.text,new
2155  0000               f_ADC_DMACmd:
2157  0000 89            	pushw	x
2158       00000000      OFST:	set	0
2161                     ; 763   assert_param(IS_FUNCTIONAL_STATE(NewState));
2163                     ; 765   if (NewState != DISABLE)
2165  0001 7b06          	ld	a,(OFST+6,sp)
2166  0003 2706          	jreq	L1511
2167                     ; 768     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2169  0005 e60a          	ld	a,(10,x)
2170  0007 a47f          	and	a,#127
2172  0009 2006          	jra	L3511
2173  000b               L1511:
2174                     ; 773     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2176  000b 1e01          	ldw	x,(OFST+1,sp)
2177  000d e60a          	ld	a,(10,x)
2178  000f aa80          	or	a,#128
2179  0011               L3511:
2180  0011 e70a          	ld	(10,x),a
2181                     ; 775 }
2184  0013 85            	popw	x
2185  0014 87            	retf	
2268                     ; 831 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2268                     ; 832 {
2269                     .text:	section	.text,new
2270  0000               f_ADC_ITConfig:
2272  0000 89            	pushw	x
2273       00000000      OFST:	set	0
2276                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2278                     ; 835   assert_param(IS_ADC_IT(ADC_IT));
2280                     ; 837   if (NewState != DISABLE)
2282  0001 7b07          	ld	a,(OFST+7,sp)
2283  0003 2705          	jreq	L7121
2284                     ; 840     ADCx->CR1 |= (uint8_t) ADC_IT;
2286  0005 f6            	ld	a,(x)
2287  0006 1a06          	or	a,(OFST+6,sp)
2289  0008 2006          	jra	L1221
2290  000a               L7121:
2291                     ; 845     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2293  000a 1e01          	ldw	x,(OFST+1,sp)
2294  000c 7b06          	ld	a,(OFST+6,sp)
2295  000e 43            	cpl	a
2296  000f f4            	and	a,(x)
2297  0010               L1221:
2298  0010 f7            	ld	(x),a
2299                     ; 847 }
2302  0011 85            	popw	x
2303  0012 87            	retf	
2407                     ; 859 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2407                     ; 860 {
2408                     .text:	section	.text,new
2409  0000               f_ADC_GetFlagStatus:
2411  0000 89            	pushw	x
2412  0001 88            	push	a
2413       00000001      OFST:	set	1
2416                     ; 861   FlagStatus flagstatus = RESET;
2418  0002 0f01          	clr	(OFST+0,sp)
2419                     ; 864   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2421                     ; 867   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2423  0004 e603          	ld	a,(3,x)
2424  0006 1507          	bcp	a,(OFST+6,sp)
2425  0008 2704          	jreq	L5721
2426                     ; 870     flagstatus = SET;
2428  000a a601          	ld	a,#1
2430  000c 2001          	jra	L7721
2431  000e               L5721:
2432                     ; 875     flagstatus = RESET;
2434  000e 4f            	clr	a
2435  000f               L7721:
2436                     ; 879   return  flagstatus;
2440  000f 5b03          	addw	sp,#3
2441  0011 87            	retf	
2487                     ; 892 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2487                     ; 893                    ADC_FLAG_TypeDef ADC_FLAG)
2487                     ; 894 {
2488                     .text:	section	.text,new
2489  0000               f_ADC_ClearFlag:
2491  0000 89            	pushw	x
2492       00000000      OFST:	set	0
2495                     ; 896   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2497                     ; 899   ADCx->SR = (uint8_t)~ADC_FLAG;
2499  0001 7b06          	ld	a,(OFST+6,sp)
2500  0003 43            	cpl	a
2501  0004 1e01          	ldw	x,(OFST+1,sp)
2502  0006 e703          	ld	(3,x),a
2503                     ; 900 }
2506  0008 85            	popw	x
2507  0009 87            	retf	
2578                     ; 912 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2578                     ; 913                          ADC_IT_TypeDef ADC_IT)
2578                     ; 914 {
2579                     .text:	section	.text,new
2580  0000               f_ADC_GetITStatus:
2582  0000 89            	pushw	x
2583  0001 5203          	subw	sp,#3
2584       00000003      OFST:	set	3
2587                     ; 915   ITStatus itstatus = RESET;
2589                     ; 916   uint8_t itmask = 0, enablestatus = 0;
2593                     ; 919   assert_param(IS_ADC_GET_IT(ADC_IT));
2595                     ; 922   itmask = (uint8_t)(ADC_IT >> 3);
2597  0003 7b09          	ld	a,(OFST+6,sp)
2598  0005 44            	srl	a
2599  0006 44            	srl	a
2600  0007 44            	srl	a
2601  0008 6b03          	ld	(OFST+0,sp),a
2602                     ; 923   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2602                     ; 924                                 (uint8_t)(itmask & (uint8_t)0x03));
2604  000a a403          	and	a,#3
2605  000c 6b01          	ld	(OFST-2,sp),a
2606  000e 7b03          	ld	a,(OFST+0,sp)
2607  0010 a410          	and	a,#16
2608  0012 44            	srl	a
2609  0013 44            	srl	a
2610  0014 1a01          	or	a,(OFST-2,sp)
2611  0016 6b03          	ld	(OFST+0,sp),a
2612                     ; 927   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2614  0018 1e04          	ldw	x,(OFST+1,sp)
2615  001a f6            	ld	a,(x)
2616  001b 1409          	and	a,(OFST+6,sp)
2617  001d 6b02          	ld	(OFST-1,sp),a
2618                     ; 930   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2620  001f e603          	ld	a,(3,x)
2621  0021 1503          	bcp	a,(OFST+0,sp)
2622  0023 2708          	jreq	L1631
2624  0025 7b02          	ld	a,(OFST-1,sp)
2625  0027 2704          	jreq	L1631
2626                     ; 933     itstatus = SET;
2628  0029 a601          	ld	a,#1
2630  002b 2001          	jra	L3631
2631  002d               L1631:
2632                     ; 938     itstatus = RESET;
2634  002d 4f            	clr	a
2635  002e               L3631:
2636                     ; 942   return  itstatus;
2640  002e 5b05          	addw	sp,#5
2641  0030 87            	retf	
2695                     ; 955 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2695                     ; 956                            ADC_IT_TypeDef ADC_IT)
2695                     ; 957 {
2696                     .text:	section	.text,new
2697  0000               f_ADC_ClearITPendingBit:
2699  0000 89            	pushw	x
2700  0001 89            	pushw	x
2701       00000002      OFST:	set	2
2704                     ; 958   uint8_t itmask = 0;
2706  0002 0f02          	clr	(OFST+0,sp)
2707                     ; 961   assert_param(IS_ADC_IT(ADC_IT));
2709                     ; 964   itmask = (uint8_t)(ADC_IT >> 3);
2711  0004 7b08          	ld	a,(OFST+6,sp)
2712  0006 44            	srl	a
2713  0007 44            	srl	a
2714  0008 44            	srl	a
2715  0009 6b02          	ld	(OFST+0,sp),a
2716                     ; 965   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2716                     ; 966                                  (uint8_t)(itmask & (uint8_t)0x03));
2718  000b a403          	and	a,#3
2719  000d 6b01          	ld	(OFST-1,sp),a
2720  000f 7b02          	ld	a,(OFST+0,sp)
2721  0011 a410          	and	a,#16
2722  0013 44            	srl	a
2723  0014 44            	srl	a
2724  0015 1a01          	or	a,(OFST-1,sp)
2725  0017 6b02          	ld	(OFST+0,sp),a
2726                     ; 969   ADCx->SR = (uint8_t)~itmask;
2728  0019 43            	cpl	a
2729  001a 1e03          	ldw	x,(OFST+1,sp)
2730  001c e703          	ld	(3,x),a
2731                     ; 970 }
2734  001e 5b04          	addw	sp,#4
2735  0020 87            	retf	
2747                     	xdef	f_ADC_ClearITPendingBit
2748                     	xdef	f_ADC_GetITStatus
2749                     	xdef	f_ADC_ClearFlag
2750                     	xdef	f_ADC_GetFlagStatus
2751                     	xdef	f_ADC_ITConfig
2752                     	xdef	f_ADC_DMACmd
2753                     	xdef	f_ADC_GetConversionValue
2754                     	xdef	f_ADC_SchmittTriggerConfig
2755                     	xdef	f_ADC_SamplingTimeConfig
2756                     	xdef	f_ADC_ChannelCmd
2757                     	xdef	f_ADC_VrefintCmd
2758                     	xdef	f_ADC_TempSensorCmd
2759                     	xdef	f_ADC_AnalogWatchdogConfig
2760                     	xdef	f_ADC_AnalogWatchdogThresholdsConfig
2761                     	xdef	f_ADC_AnalogWatchdogChannelSelect
2762                     	xdef	f_ADC_ExternalTrigConfig
2763                     	xdef	f_ADC_SoftwareStartConv
2764                     	xdef	f_ADC_Cmd
2765                     	xdef	f_ADC_Init
2766                     	xdef	f_ADC_DeInit
2785                     	end
