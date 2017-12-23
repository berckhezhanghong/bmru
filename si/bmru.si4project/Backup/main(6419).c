#include <stdio.h>
#include <string.h>
#include "stm8l15x.h"
#include "mcu_job.h"
#include "general_oper.h"
#include "setx_acq.h"
#include "setx_uart.h"
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
	InrsMesureInit();
	
	TimeoutMsDelay(10000);

	InrsMesurejob();
	
	while (1)
	{
	#if 0
		/* Toggle LEDs */
		TimeoutMsDelay(500);
		GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PIN);
		//GPIO_WriteBit(LED_GPIO_PORT, LED_GPIO_PIN, 0);
		GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PIN);
		TimeoutMsDelay(500);
	#endif


#if 1	
		// AcqDoJob();
		
		u16Data = VREFINT_Factory_CONV;
		sprintf(DebugBuf, "vvx volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
		
		u16Data = AdcGeneralAcq(SETX_ADCIN_REF1V2);
		sprintf(DebugBuf, "vv0 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);


		//TimeoutMsDelay(1000);

		u16Data = AdcGeneralAcq(SETX_ADCIN2);
		sprintf(DebugBuf, "vv1 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);


		//TimeoutMsDelay(1000);

		u16Data = AdcGeneralAcq(SETX_ADCIN3);
		sprintf(DebugBuf, "vv2 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);

		//TimeoutMsDelay(1000);
	
		u16Data = AdcGeneralAcq(SETX_ADCIN_VREFINT);
		sprintf(DebugBuf, "vv3 volt: %u.%uV\r\n\r\n\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);

		//TimeoutMsDelay(3000);
#endif

		//TemperTask();

		
	}
}
