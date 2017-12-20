   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  68                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  68                     ; 129 {
  70                     .text:	section	.text,new
  71  0000               _IWDG_WriteAccessCmd:
  75                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  77                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  79  0000 c750e0        	ld	20704,a
  80                     ; 133 }
  83  0003 81            	ret	
 173                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 173                     ; 149 {
 174                     .text:	section	.text,new
 175  0000               _IWDG_SetPrescaler:
 179                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 181                     ; 152   IWDG->PR = IWDG_Prescaler;
 183  0000 c750e1        	ld	20705,a
 184                     ; 153 }
 187  0003 81            	ret	
 221                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 221                     ; 163 {
 222                     .text:	section	.text,new
 223  0000               _IWDG_SetReload:
 227                     ; 164   IWDG->RLR = IWDG_Reload;
 229  0000 c750e2        	ld	20706,a
 230                     ; 165 }
 233  0003 81            	ret	
 256                     ; 173 void IWDG_ReloadCounter(void)
 256                     ; 174 {
 257                     .text:	section	.text,new
 258  0000               _IWDG_ReloadCounter:
 262                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 264  0000 35aa50e0      	mov	20704,#170
 265                     ; 176 }
 268  0004 81            	ret	
 291                     ; 199 void IWDG_Enable(void)
 291                     ; 200 {
 292                     .text:	section	.text,new
 293  0000               _IWDG_Enable:
 297                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 299  0000 35cc50e0      	mov	20704,#204
 300                     ; 202 }
 303  0004 81            	ret	
 316                     	xdef	_IWDG_Enable
 317                     	xdef	_IWDG_ReloadCounter
 318                     	xdef	_IWDG_SetReload
 319                     	xdef	_IWDG_SetPrescaler
 320                     	xdef	_IWDG_WriteAccessCmd
 339                     	end
