#include <stdio.h>
#include <string.h>
#include "stm8l15x.h"
#include "mcu_job.h"
#include "general_oper.h"
#include "setx_acq.h"
#include "setx_uart.h"
#include "comm_job.h"
#include "debug.h"







extern tTempSampleCtrlDef tTempSampleCtrl;



void main(void)
{	
	McuInit();
	
	TimeoutInit();
	UpUartInit();
	DebugInit();

	
	AcqInit();
	TemperTaskInit();

	TimeoutMsDelay(2);
	InrsMesureInit();
	
	TimeoutMsDelay(4000);
	
	AdcCaliInit();
	
	
	while (1)
	{
		// volt acq
		// AcqDoJob();

		// temperature acq
		// TemperTask();
		
		// uart recv
		// UpUartRcvDoJob();

		// protocol deal
		// CommDoJob();

		// uart send
		// UpUartSendDoJob();

		// inrs job
		InrsMesurejob();

		// mcu & system job
		McuJob();
	}
}
