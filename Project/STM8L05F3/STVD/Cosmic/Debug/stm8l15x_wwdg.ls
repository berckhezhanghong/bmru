   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  53                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  53                     ; 120 {
  55                     .text:	section	.text,new
  56  0000               _WWDG_Init:
  58  0000 89            	pushw	x
  59       00000000      OFST:	set	0
  62                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  64                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  66  0001 357f50d4      	mov	20692,#127
  67                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  69  0005 9e            	ld	a,xh
  70  0006 aa80          	or	a,#128
  71  0008 c750d3        	ld	20691,a
  72                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  74  000b 7b02          	ld	a,(OFST+2,sp)
  75  000d a47f          	and	a,#127
  76  000f c750d4        	ld	20692,a
  77                     ; 127 }
  80  0012 85            	popw	x
  81  0013 81            	ret	
 125                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 125                     ; 136 {
 126                     .text:	section	.text,new
 127  0000               _WWDG_SetWindowValue:
 129  0000 88            	push	a
 130       00000001      OFST:	set	1
 133                     ; 137   __IO uint8_t tmpreg = 0;
 135  0001 0f01          	clr	(OFST+0,sp)
 136                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 138                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 140  0003 a47f          	and	a,#127
 141  0005 1a01          	or	a,(OFST+0,sp)
 142  0007 6b01          	ld	(OFST+0,sp),a
 143                     ; 146   WWDG->WR = tmpreg;
 145  0009 7b01          	ld	a,(OFST+0,sp)
 146  000b c750d4        	ld	20692,a
 147                     ; 147 }
 150  000e 84            	pop	a
 151  000f 81            	ret	
 185                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 185                     ; 157 {
 186                     .text:	section	.text,new
 187  0000               _WWDG_SetCounter:
 191                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 193                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 195  0000 a47f          	and	a,#127
 196  0002 c750d3        	ld	20691,a
 197                     ; 164 }
 200  0005 81            	ret	
 234                     ; 187 void WWDG_Enable(uint8_t Counter)
 234                     ; 188 {
 235                     .text:	section	.text,new
 236  0000               _WWDG_Enable:
 240                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 242                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 244  0000 aa80          	or	a,#128
 245  0002 c750d3        	ld	20691,a
 246                     ; 192 }
 249  0005 81            	ret	
 272                     ; 216 uint8_t WWDG_GetCounter(void)
 272                     ; 217 {
 273                     .text:	section	.text,new
 274  0000               _WWDG_GetCounter:
 278                     ; 218   return(WWDG->CR);
 280  0000 c650d3        	ld	a,20691
 283  0003 81            	ret	
 306                     ; 226 void WWDG_SWReset(void)
 306                     ; 227 {
 307                     .text:	section	.text,new
 308  0000               _WWDG_SWReset:
 312                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 314  0000 358050d3      	mov	20691,#128
 315                     ; 229 }
 318  0004 81            	ret	
 331                     	xdef	_WWDG_SWReset
 332                     	xdef	_WWDG_GetCounter
 333                     	xdef	_WWDG_Enable
 334                     	xdef	_WWDG_SetCounter
 335                     	xdef	_WWDG_SetWindowValue
 336                     	xdef	_WWDG_Init
 355                     	end
