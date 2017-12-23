   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  68                     ; 128 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  68                     ; 129 {
  69                     .text:	section	.text,new
  70  0000               f_IWDG_WriteAccessCmd:
  74                     ; 131   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  76                     ; 132   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  78  0000 c750e0        	ld	20704,a
  79                     ; 133 }
  82  0003 87            	retf	
 171                     ; 148 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 171                     ; 149 {
 172                     .text:	section	.text,new
 173  0000               f_IWDG_SetPrescaler:
 177                     ; 151   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 179                     ; 152   IWDG->PR = IWDG_Prescaler;
 181  0000 c750e1        	ld	20705,a
 182                     ; 153 }
 185  0003 87            	retf	
 216                     ; 162 void IWDG_SetReload(uint8_t IWDG_Reload)
 216                     ; 163 {
 217                     .text:	section	.text,new
 218  0000               f_IWDG_SetReload:
 222                     ; 164   IWDG->RLR = IWDG_Reload;
 224  0000 c750e2        	ld	20706,a
 225                     ; 165 }
 228  0003 87            	retf	
 250                     ; 173 void IWDG_ReloadCounter(void)
 250                     ; 174 {
 251                     .text:	section	.text,new
 252  0000               f_IWDG_ReloadCounter:
 256                     ; 175   IWDG->KR = IWDG_KEY_REFRESH;
 258  0000 35aa50e0      	mov	20704,#170
 259                     ; 176 }
 262  0004 87            	retf	
 284                     ; 199 void IWDG_Enable(void)
 284                     ; 200 {
 285                     .text:	section	.text,new
 286  0000               f_IWDG_Enable:
 290                     ; 201   IWDG->KR = IWDG_KEY_ENABLE;
 292  0000 35cc50e0      	mov	20704,#204
 293                     ; 202 }
 296  0004 87            	retf	
 308                     	xdef	f_IWDG_Enable
 309                     	xdef	f_IWDG_ReloadCounter
 310                     	xdef	f_IWDG_SetReload
 311                     	xdef	f_IWDG_SetPrescaler
 312                     	xdef	f_IWDG_WriteAccessCmd
 331                     	end
