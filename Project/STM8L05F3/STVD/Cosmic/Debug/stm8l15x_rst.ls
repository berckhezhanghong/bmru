   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
 114                     ; 99 FlagStatus RST_GetFlagStatus(RST_FLAG_TypeDef RST_Flag)
 114                     ; 100 {
 116                     .text:	section	.text,new
 117  0000               _RST_GetFlagStatus:
 121                     ; 102   assert_param(IS_RST_FLAG(RST_Flag));
 123                     ; 105   return((FlagStatus)(((uint8_t)(RST->SR & RST_Flag) == (uint8_t)0x00) ? RESET : SET));
 125  0000 c450b1        	and	a,20657
 126  0003 2702          	jreq	L01
 127  0005 a601          	ld	a,#1
 128  0007               L01:
 131  0007 81            	ret	
 166                     ; 120 void RST_ClearFlag(RST_FLAG_TypeDef RST_Flag)
 166                     ; 121 {
 167                     .text:	section	.text,new
 168  0000               _RST_ClearFlag:
 172                     ; 123   assert_param(IS_RST_FLAG(RST_Flag));
 174                     ; 125   RST->SR = (uint8_t)RST_Flag;
 176  0000 c750b1        	ld	20657,a
 177                     ; 126 }
 180  0003 81            	ret	
 203                     ; 149 void RST_GPOutputEnable(void)
 203                     ; 150 {
 204                     .text:	section	.text,new
 205  0000               _RST_GPOutputEnable:
 209                     ; 152   RST->CR = RST_CR_MASK;
 211  0000 35d050b0      	mov	20656,#208
 212                     ; 153 }
 215  0004 81            	ret	
 228                     	xdef	_RST_GPOutputEnable
 229                     	xdef	_RST_ClearFlag
 230                     	xdef	_RST_GetFlagStatus
 249                     	end
