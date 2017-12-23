   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Generator V4.2.4 - 19 Dec 2007
   3                     ; Optimizer V4.2.4 - 18 Dec 2007
  44                     ; 21 void main(void)
  44                     ; 22 {	
  45                     .text:	section	.text,new
  46  0000               f_main:
  50                     ; 23 	McuInit();
  52  0000 8d000000      	callf	f_McuInit
  54                     ; 25 	TimeoutInit();
  56  0004 8d000000      	callf	f_TimeoutInit
  58                     ; 26 	UpUartInit();
  60  0008 8d000000      	callf	f_UpUartInit
  62                     ; 27 	DebugInit();
  64  000c 8d000000      	callf	f_DebugInit
  66                     ; 30 	AcqInit();
  68  0010 8d000000      	callf	f_AcqInit
  70                     ; 31 	TemperTaskInit();
  72  0014 8d000000      	callf	f_TemperTaskInit
  74                     ; 33 	TimeoutMsDelay(2);
  76  0018 ae0002        	ldw	x,#2
  77  001b 89            	pushw	x
  78  001c 5f            	clrw	x
  79  001d 89            	pushw	x
  80  001e 8d000000      	callf	f_TimeoutMsDelay
  82  0022 5b04          	addw	sp,#4
  83                     ; 34 	InrsMesureInit();
  85  0024 8d000000      	callf	f_InrsMesureInit
  87                     ; 36 	TimeoutMsDelay(4000);
  89  0028 ae0fa0        	ldw	x,#4000
  90  002b 89            	pushw	x
  91  002c 5f            	clrw	x
  92  002d 89            	pushw	x
  93  002e 8d000000      	callf	f_TimeoutMsDelay
  95  0032 5b04          	addw	sp,#4
  96                     ; 38 	AdcCaliInit();
  98  0034 8d000000      	callf	f_AdcCaliInit
 100  0038               L12:
 101                     ; 59 		InrsMesurejob();
 103  0038 8d000000      	callf	f_InrsMesurejob
 105                     ; 62 		McuJob();
 107  003c 8d000000      	callf	f_McuJob
 110  0040 20f6          	jra	L12
 122                     	xdef	f_main
 123                     	xref	f_UpUartInit
 124                     	xref	f_AcqInit
 125                     	xref	f_InrsMesureInit
 126                     	xref	f_InrsMesurejob
 127                     	xref	f_TemperTaskInit
 128                     	xref	f_DebugInit
 129                     	xref	f_AdcCaliInit
 130                     	xref	f_McuJob
 131                     	xref	f_McuInit
 132                     	xref	f_TimeoutMsDelay
 133                     	xref	f_TimeoutInit
 152                     	end
