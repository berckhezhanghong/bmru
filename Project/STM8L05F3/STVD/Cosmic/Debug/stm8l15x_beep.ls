   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  33                     ; 92 void BEEP_DeInit(void)
  33                     ; 93 {
  34                     .text:	section	.text,new
  35  0000               f_BEEP_DeInit:
  39                     ; 94   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  41  0000 725f50f0      	clr	20720
  42                     ; 95   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  44  0004 351f50f3      	mov	20723,#31
  45                     ; 96 }
  48  0008 87            	retf	
 112                     ; 105 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 112                     ; 106 {
 113                     .text:	section	.text,new
 114  0000               f_BEEP_Init:
 116  0000 88            	push	a
 117       00000000      OFST:	set	0
 120                     ; 109   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 122                     ; 112   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 124  0001 c650f3        	ld	a,20723
 125  0004 a41f          	and	a,#31
 126  0006 a11f          	cp	a,#31
 127  0008 260c          	jrne	L15
 128                     ; 114     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 130  000a c650f3        	ld	a,20723
 131  000d a4e0          	and	a,#224
 132  000f c750f3        	ld	20723,a
 133                     ; 115     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 135  0012 721050f3      	bset	20723,#0
 136  0016               L15:
 137                     ; 119   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 139  0016 c650f3        	ld	a,20723
 140  0019 a43f          	and	a,#63
 141  001b c750f3        	ld	20723,a
 142                     ; 120   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 144  001e c650f3        	ld	a,20723
 145  0021 1a01          	or	a,(OFST+1,sp)
 146  0023 c750f3        	ld	20723,a
 147                     ; 122 }
 150  0026 84            	pop	a
 151  0027 87            	retf	
 205                     ; 130 void BEEP_Cmd(FunctionalState NewState)
 205                     ; 131 {
 206                     .text:	section	.text,new
 207  0000               f_BEEP_Cmd:
 211                     ; 133   assert_param(IS_FUNCTIONAL_STATE(NewState));
 213                     ; 135   if (NewState != DISABLE)
 215  0000 4d            	tnz	a
 216  0001 2705          	jreq	L101
 217                     ; 138     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 219  0003 721a50f3      	bset	20723,#5
 222  0007 87            	retf	
 223  0008               L101:
 224                     ; 143     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 226  0008 721b50f3      	bres	20723,#5
 227                     ; 145 }
 230  000c 87            	retf	
 265                     ; 178 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 265                     ; 179 {
 266                     .text:	section	.text,new
 267  0000               f_BEEP_LSClockToTIMConnectCmd:
 271                     ; 181   assert_param(IS_FUNCTIONAL_STATE(NewState));
 273                     ; 183   if (NewState != DISABLE)
 275  0000 4d            	tnz	a
 276  0001 2705          	jreq	L321
 277                     ; 186     BEEP->CSR1 |= BEEP_CSR1_MSR;
 279  0003 721050f0      	bset	20720,#0
 282  0007 87            	retf	
 283  0008               L321:
 284                     ; 191     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 286  0008 721150f0      	bres	20720,#0
 287                     ; 193 }
 290  000c 87            	retf	
 336                     .const:	section	.text
 337  0000               L61:
 338  0000 000003e8      	dc.l	1000
 339                     ; 207 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 339                     ; 208 {
 340                     .text:	section	.text,new
 341  0000               f_BEEP_LSICalibrationConfig:
 343  0000 5206          	subw	sp,#6
 344       00000006      OFST:	set	6
 347                     ; 213   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 349                     ; 215   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 351  0002 96            	ldw	x,sp
 352  0003 1c000a        	addw	x,#OFST+4
 353  0006 8d000000      	callf	d_ltor
 355  000a ae0000        	ldw	x,#L61
 356  000d 8d000000      	callf	d_ludv
 358  0011 be02          	ldw	x,c_lreg+2
 359  0013 1f03          	ldw	(OFST-3,sp),x
 360                     ; 219   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 362  0015 c650f3        	ld	a,20723
 363  0018 a4e0          	and	a,#224
 364  001a c750f3        	ld	20723,a
 365                     ; 221   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 367  001d 54            	srlw	x
 368  001e 54            	srlw	x
 369  001f 54            	srlw	x
 370  0020 1f05          	ldw	(OFST-1,sp),x
 371                     ; 223   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 373  0022 58            	sllw	x
 374  0023 58            	sllw	x
 375  0024 58            	sllw	x
 376  0025 1f01          	ldw	(OFST-5,sp),x
 377  0027 1e03          	ldw	x,(OFST-3,sp)
 378  0029 72f001        	subw	x,(OFST-5,sp)
 379  002c 1605          	ldw	y,(OFST-1,sp)
 380  002e 9058          	sllw	y
 381  0030 905c          	incw	y
 382  0032 8d000000      	callf	d_imul
 384  0036 1605          	ldw	y,(OFST-1,sp)
 385  0038 9058          	sllw	y
 386  003a 9058          	sllw	y
 387  003c 9058          	sllw	y
 388  003e bf01          	ldw	c_x+1,x
 389  0040 90b301        	cpw	y,c_x+1
 390  0043 7b06          	ld	a,(OFST+0,sp)
 391  0045 2504          	jrult	L741
 392                     ; 225     BEEP->CSR2 |= (uint8_t)(A - 2U);
 394  0047 a002          	sub	a,#2
 396  0049 2001          	jra	L151
 397  004b               L741:
 398                     ; 229     BEEP->CSR2 |= (uint8_t)(A - 1U);
 400  004b 4a            	dec	a
 401  004c               L151:
 402  004c ca50f3        	or	a,20723
 403  004f c750f3        	ld	20723,a
 404                     ; 231 }
 407  0052 5b06          	addw	sp,#6
 408  0054 87            	retf	
 420                     	xdef	f_BEEP_LSICalibrationConfig
 421                     	xdef	f_BEEP_LSClockToTIMConnectCmd
 422                     	xdef	f_BEEP_Cmd
 423                     	xdef	f_BEEP_Init
 424                     	xdef	f_BEEP_DeInit
 425                     	xref.b	c_lreg
 426                     	xref.b	c_x
 445                     	xref	d_imul
 446                     	xref	d_ludv
 447                     	xref	d_ltor
 448                     	end
