   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  34                     ; 52 INTERRUPT_HANDLER(NonHandledInterrupt,0)
  34                     ; 53 {
  35                     .text:	section	.text,new
  36  0000               f_NonHandledInterrupt:
  41                     ; 57 }
  44  0000 80            	iret	
  66                     ; 67 INTERRUPT_HANDLER_TRAP(TRAP_IRQHandler)
  66                     ; 68 {
  67                     .text:	section	.text,new
  68  0000               f_TRAP_IRQHandler:
  73                     ; 72 }
  76  0000 80            	iret	
  98                     ; 78 INTERRUPT_HANDLER(FLASH_IRQHandler,1)
  98                     ; 79 {
  99                     .text:	section	.text,new
 100  0000               f_FLASH_IRQHandler:
 105                     ; 83 }
 108  0000 80            	iret	
 131                     ; 89 INTERRUPT_HANDLER(DMA1_CHANNEL0_1_IRQHandler,2)
 131                     ; 90 {
 132                     .text:	section	.text,new
 133  0000               f_DMA1_CHANNEL0_1_IRQHandler:
 138                     ; 94 }
 141  0000 80            	iret	
 164                     ; 100 INTERRUPT_HANDLER(DMA1_CHANNEL2_3_IRQHandler,3)
 164                     ; 101 {
 165                     .text:	section	.text,new
 166  0000               f_DMA1_CHANNEL2_3_IRQHandler:
 171                     ; 105 }
 174  0000 80            	iret	
 197                     ; 111 INTERRUPT_HANDLER(RTC_CSSLSE_IRQHandler,4)
 197                     ; 112 {
 198                     .text:	section	.text,new
 199  0000               f_RTC_CSSLSE_IRQHandler:
 204                     ; 116 }
 207  0000 80            	iret	
 230                     ; 122 INTERRUPT_HANDLER(EXTIE_F_PVD_IRQHandler,5)
 230                     ; 123 {
 231                     .text:	section	.text,new
 232  0000               f_EXTIE_F_PVD_IRQHandler:
 237                     ; 127 }
 240  0000 80            	iret	
 262                     ; 134 INTERRUPT_HANDLER(EXTIB_G_IRQHandler,6)
 262                     ; 135 {
 263                     .text:	section	.text,new
 264  0000               f_EXTIB_G_IRQHandler:
 269                     ; 139 }
 272  0000 80            	iret	
 294                     ; 146 INTERRUPT_HANDLER(EXTID_H_IRQHandler,7)
 294                     ; 147 {
 295                     .text:	section	.text,new
 296  0000               f_EXTID_H_IRQHandler:
 301                     ; 151 }
 304  0000 80            	iret	
 326                     ; 158 INTERRUPT_HANDLER(EXTI0_IRQHandler,8)
 326                     ; 159 {
 327                     .text:	section	.text,new
 328  0000               f_EXTI0_IRQHandler:
 333                     ; 163 }
 336  0000 80            	iret	
 358                     ; 170 INTERRUPT_HANDLER(EXTI1_IRQHandler,9)
 358                     ; 171 {
 359                     .text:	section	.text,new
 360  0000               f_EXTI1_IRQHandler:
 365                     ; 175 }
 368  0000 80            	iret	
 390                     ; 182 INTERRUPT_HANDLER(EXTI2_IRQHandler,10)
 390                     ; 183 {
 391                     .text:	section	.text,new
 392  0000               f_EXTI2_IRQHandler:
 397                     ; 187 }
 400  0000 80            	iret	
 422                     ; 194 INTERRUPT_HANDLER(EXTI3_IRQHandler,11)
 422                     ; 195 {
 423                     .text:	section	.text,new
 424  0000               f_EXTI3_IRQHandler:
 429                     ; 199 }
 432  0000 80            	iret	
 454                     ; 206 INTERRUPT_HANDLER(EXTI4_IRQHandler,12)
 454                     ; 207 {
 455                     .text:	section	.text,new
 456  0000               f_EXTI4_IRQHandler:
 461                     ; 211 }
 464  0000 80            	iret	
 486                     ; 218 INTERRUPT_HANDLER(EXTI5_IRQHandler,13)
 486                     ; 219 {
 487                     .text:	section	.text,new
 488  0000               f_EXTI5_IRQHandler:
 493                     ; 223 }
 496  0000 80            	iret	
 518                     ; 230 INTERRUPT_HANDLER(EXTI6_IRQHandler,14)
 518                     ; 231 {
 519                     .text:	section	.text,new
 520  0000               f_EXTI6_IRQHandler:
 525                     ; 235 }
 528  0000 80            	iret	
 550                     ; 242 INTERRUPT_HANDLER(EXTI7_IRQHandler,15)
 550                     ; 243 {
 551                     .text:	section	.text,new
 552  0000               f_EXTI7_IRQHandler:
 557                     ; 247 }
 560  0000 80            	iret	
 582                     ; 253 INTERRUPT_HANDLER(LCD_AES_IRQHandler,16)
 582                     ; 254 {
 583                     .text:	section	.text,new
 584  0000               f_LCD_AES_IRQHandler:
 589                     ; 258 }
 592  0000 80            	iret	
 615                     ; 264 INTERRUPT_HANDLER(SWITCH_CSS_BREAK_DAC_IRQHandler,17)
 615                     ; 265 {
 616                     .text:	section	.text,new
 617  0000               f_SWITCH_CSS_BREAK_DAC_IRQHandler:
 622                     ; 269 }
 625  0000 80            	iret	
 648                     ; 276 INTERRUPT_HANDLER(ADC1_COMP_IRQHandler,18)
 648                     ; 277 {
 649                     .text:	section	.text,new
 650  0000               f_ADC1_COMP_IRQHandler:
 655                     ; 281 }
 658  0000 80            	iret	
 682                     ; 288 INTERRUPT_HANDLER(TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler,19)
 682                     ; 289 {
 683                     .text:	section	.text,new
 684  0000               f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler:
 689                     ; 293 }
 692  0000 80            	iret	
 715                     ; 300 INTERRUPT_HANDLER(TIM2_CC_USART2_RX_IRQHandler,20)
 715                     ; 301 {
 716                     .text:	section	.text,new
 717  0000               f_TIM2_CC_USART2_RX_IRQHandler:
 722                     ; 305 }
 725  0000 80            	iret	
 749                     ; 313 INTERRUPT_HANDLER(TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler,21)
 749                     ; 314 {
 750                     .text:	section	.text,new
 751  0000               f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler:
 756                     ; 318 }
 759  0000 80            	iret	
 782                     ; 324 INTERRUPT_HANDLER(TIM3_CC_USART3_RX_IRQHandler,22)
 782                     ; 325 {
 783                     .text:	section	.text,new
 784  0000               f_TIM3_CC_USART3_RX_IRQHandler:
 789                     ; 329 }
 792  0000 80            	iret	
 815                     ; 335 INTERRUPT_HANDLER(TIM1_UPD_OVF_TRG_COM_IRQHandler,23)
 815                     ; 336 {
 816                     .text:	section	.text,new
 817  0000               f_TIM1_UPD_OVF_TRG_COM_IRQHandler:
 822                     ; 340 }
 825  0000 80            	iret	
 847                     ; 346 INTERRUPT_HANDLER(TIM1_CC_IRQHandler,24)
 847                     ; 347 {
 848                     .text:	section	.text,new
 849  0000               f_TIM1_CC_IRQHandler:
 854                     ; 351 }
 857  0000 80            	iret	
 880                     ; 358 INTERRUPT_HANDLER(TIM4_UPD_OVF_TRG_IRQHandler,25)
 880                     ; 359 {
 881                     .text:	section	.text,new
 882  0000               f_TIM4_UPD_OVF_TRG_IRQHandler:
 887                     ; 363 }
 890  0000 80            	iret	
 912                     ; 369 INTERRUPT_HANDLER(SPI1_IRQHandler,26)
 912                     ; 370 {
 913                     .text:	section	.text,new
 914  0000               f_SPI1_IRQHandler:
 919                     ; 374 }
 922  0000 80            	iret	
 946                     ; 381 INTERRUPT_HANDLER(USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler,27)
 946                     ; 382 {
 947                     .text:	section	.text,new
 948  0000               f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler:
 953                     ; 386 }
 956  0000 80            	iret	
 979                     ; 393 INTERRUPT_HANDLER(USART1_RX_TIM5_CC_IRQHandler,28)
 979                     ; 394 {
 980                     .text:	section	.text,new
 981  0000               f_USART1_RX_TIM5_CC_IRQHandler:
 986                     ; 398 }
 989  0000 80            	iret	
1012                     ; 405 INTERRUPT_HANDLER(I2C1_SPI2_IRQHandler,29)
1012                     ; 406 {
1013                     .text:	section	.text,new
1014  0000               f_I2C1_SPI2_IRQHandler:
1019                     ; 410 }
1022  0000 80            	iret	
1034                     	xdef	f_I2C1_SPI2_IRQHandler
1035                     	xdef	f_USART1_RX_TIM5_CC_IRQHandler
1036                     	xdef	f_USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQHandler
1037                     	xdef	f_SPI1_IRQHandler
1038                     	xdef	f_TIM4_UPD_OVF_TRG_IRQHandler
1039                     	xdef	f_TIM1_CC_IRQHandler
1040                     	xdef	f_TIM1_UPD_OVF_TRG_COM_IRQHandler
1041                     	xdef	f_TIM3_CC_USART3_RX_IRQHandler
1042                     	xdef	f_TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQHandler
1043                     	xdef	f_TIM2_CC_USART2_RX_IRQHandler
1044                     	xdef	f_TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQHandler
1045                     	xdef	f_ADC1_COMP_IRQHandler
1046                     	xdef	f_SWITCH_CSS_BREAK_DAC_IRQHandler
1047                     	xdef	f_LCD_AES_IRQHandler
1048                     	xdef	f_EXTI7_IRQHandler
1049                     	xdef	f_EXTI6_IRQHandler
1050                     	xdef	f_EXTI5_IRQHandler
1051                     	xdef	f_EXTI4_IRQHandler
1052                     	xdef	f_EXTI3_IRQHandler
1053                     	xdef	f_EXTI2_IRQHandler
1054                     	xdef	f_EXTI1_IRQHandler
1055                     	xdef	f_EXTI0_IRQHandler
1056                     	xdef	f_EXTID_H_IRQHandler
1057                     	xdef	f_EXTIB_G_IRQHandler
1058                     	xdef	f_EXTIE_F_PVD_IRQHandler
1059                     	xdef	f_RTC_CSSLSE_IRQHandler
1060                     	xdef	f_DMA1_CHANNEL2_3_IRQHandler
1061                     	xdef	f_DMA1_CHANNEL0_1_IRQHandler
1062                     	xdef	f_FLASH_IRQHandler
1063                     	xdef	f_TRAP_IRQHandler
1064                     	xdef	f_NonHandledInterrupt
1083                     	end
