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
	uint16 u16Data;

	McuInit();
	
	TimeoutInit();
	UpUartInit();
	DebugInit();
	
	TemperTaskInit();
	AdcCaliInit();
	InrsMesureInit();
	
	TimeoutMsDelay(3000);

	InrsMesurejob();
	
	while (1)
	{
		InrsMesurejob();
		
	#if 0
		/* Toggle LEDs */
		TimeoutMsDelay(500);
		GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PIN);
		//GPIO_WriteBit(LED_GPIO_PORT, LED_GPIO_PIN, 0);
		GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PIN);
		TimeoutMsDelay(500);
	// #endif

	

		UpUartRcvDoJob();
		CommDoJob();
		UpUartSendDoJob();


//#if 0

		// AcqDoJob();
		
		u16Data = VREFINT_Factory_CONV;
		sprintf(DebugBuf, "vvx volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
		
		u16Data = AdcGeneralAcq(SETX_ADCIN_REF1V2);
		sprintf(DebugBuf, "vv0 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);


		//TimeoutMsDelay(1000);

		u16Data = AdcGeneralAcq(SETX_ADCIN2);
		sprintf(DebugBuf, "vv1 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);


		//TimeoutMsDelay(1000);

		u16Data = AdcGeneralAcq(SETX_ADCIN3);
		sprintf(DebugBuf, "vv2 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);

		//TimeoutMsDelay(1000);
	
		u16Data = AdcGeneralAcq(SETX_ADCIN_VREFINT);
		sprintf(DebugBuf, "vv3 volt: %u.%uV\r\n\r\n\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);

		//TimeoutMsDelay(3000);
#endif

		//TemperTask();

		
	}
}
