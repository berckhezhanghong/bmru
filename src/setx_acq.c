#include <stdio.h>
#include <string.h>
#include "stm8l15x.h"
#include "setx_acq.h"
#include "timeout.h"
#include "debug.h"


tVolSampleCtrlDef tVolSampleCtrl;
extern uint8  DebugBuf[DEBUG_PRINTF_BUFFER_LEN];



sint8 AcqInit(void)
{
	memset(&tVolSampleCtrl, 0, sizeof(tVolSampleCtrlDef));
	InitMsTimeout(&tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL_INIT);
}



sint8 AcqDoJob(void)
{
	uint16 u16Volt;
	
	if(IsMsTimeout(&tVolSampleCtrl.tVolSampleTimeout) || 
	   tVolSampleCtrl.u8SampleFlag)
	{
		InitMsTimeout(&tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL);
		tVolSampleCtrl.u8SampleFlag = 0;
		tVolSampleCtrl.u8SampleSta = 1;
	}

	switch(tVolSampleCtrl.u8SampleSta)
	{
		case 0:
		break;

		case 1:
		tVolSampleCtrl.u16Voltage[0] = AdcGeneralAcq(CHAN_BAT1_VOLT);
		tVolSampleCtrl.u8SampleSta ++;
		
		tVolSampleCtrl.u32SampleCnt[0] ++;
		tVolSampleCtrl.u32FailCnt[0] = 0;

		#if DEBUG_PRINTF
		sprintf(DebugBuf, "bat1 volt: %u.%uV\r\n", tVolSampleCtrl.u16Voltage[0] / 1000, tVolSampleCtrl.u16Voltage[0] % 1000);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
		#endif
		break;
	
		case 2:
		tVolSampleCtrl.u16Voltage[1] = AdcGeneralAcq(CHAN_BAT2_VOLT);
		tVolSampleCtrl.u8SampleSta = 0;

		tVolSampleCtrl.u32SampleCnt[1] ++;
		tVolSampleCtrl.u32FailCnt[1] = 0;
		tVolSampleCtrl.u8VoltOk = 1;

		#if DEBUG_PRINTF
		sprintf(DebugBuf, "bat2 volt: %u.%uV\r\n", tVolSampleCtrl.u16Voltage[1] / 1000, tVolSampleCtrl.u16Voltage[1] % 1000);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
		#endif
		break;

		default:
		break;
	}

	return 0;
}
