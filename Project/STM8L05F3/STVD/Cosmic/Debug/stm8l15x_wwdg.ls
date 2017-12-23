   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  49                     ; 119 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  49                     ; 120 {
  50                     .text:	section	.text,new
  51  0000               f_WWDG_Init:
  53  0000 89            	pushw	x
  54       00000000      OFST:	set	0
  57                     ; 122   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  59                     ; 124   WWDG->WR = WWDG_WR_RESET_VALUE;
  61  0001 357f50d4      	mov	20692,#127
  62                     ; 125   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  64  0005 9e            	ld	a,xh
  65  0006 aa80          	or	a,#128
  66  0008 c750d3        	ld	20691,a
  67                     ; 126   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  69  000b 7b02          	ld	a,(OFST+2,sp)
  70  000d a47f          	and	a,#127
  71  000f c750d4        	ld	20692,a
  72                     ; 127 }
  75  0012 85            	popw	x
  76  0013 87            	retf	
 117                     ; 135 void WWDG_SetWindowValue(uint8_t WindowValue)
 117                     ; 136 {
 118                     .text:	section	.text,new
 119  0000               f_WWDG_SetWindowValue:
 121  0000 88            	push	a
 122       00000001      OFST:	set	1
 125                     ; 137   __IO uint8_t tmpreg = 0;
 127  0001 0f01          	clr	(OFST+0,sp)
 128                     ; 140   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 130                     ; 143   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 132  0003 a47f          	and	a,#127
 133  0005 1a01          	or	a,(OFST+0,sp)
 134  0007 6b01          	ld	(OFST+0,sp),a
 135                     ; 146   WWDG->WR = tmpreg;
 137  0009 7b01          	ld	a,(OFST+0,sp)
 138  000b c750d4        	ld	20692,a
 139                     ; 147 }
 142  000e 84            	pop	a
 143  000f 87            	retf	
 174                     ; 156 void WWDG_SetCounter(uint8_t Counter)
 174                     ; 157 {
 175                     .text:	section	.text,new
 176  0000               f_WWDG_SetCounter:
 180                     ; 159   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 182                     ; 163   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 184  0000 a47f          	and	a,#127
 185  0002 c750d3        	ld	20691,a
 186                     ; 164 }
 189  0005 87            	retf	
 220                     ; 187 void WWDG_Enable(uint8_t Counter)
 220                     ; 188 {
 221                     .text:	section	.text,new
 222  0000               f_WWDG_Enable:
 226                     ; 190   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 228                     ; 191   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 230  0000 aa80          	or	a,#128
 231  0002 c750d3        	ld	20691,a
 232                     ; 192 }
 235  0005 87            	retf	
 257                     ; 216 uint8_t WWDG_GetCounter(void)
 257                     ; 217 {
 258                     .text:	section	.text,new
 259  0000               f_WWDG_GetCounter:
 263                     ; 218   return(WWDG->CR);
 265  0000 c650d3        	ld	a,20691
 268  0003 87            	retf	
 290                     ; 226 void WWDG_SWReset(void)
 290                     ; 227 {
 291                     .text:	section	.text,new
 292  0000               f_WWDG_SWReset:
 296                     ; 228   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 298  0000 358050d3      	mov	20691,#128
 299                     ; 229 }
 302  0004 87            	retf	
 314                     	xdef	f_WWDG_SWReset
 315                     	xdef	f_WWDG_GetCounter
 316                     	xdef	f_WWDG_Enable
 317                     	xdef	f_WWDG_SetCounter
 318                     	xdef	f_WWDG_SetWindowValue
 319                     	xdef	f_WWDG_Init
 338                     	end
