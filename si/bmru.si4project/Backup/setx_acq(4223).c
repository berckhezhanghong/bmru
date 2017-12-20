
#include "stm8l15x.h"
#include "setx_acq.h"
#include "timeout.h"

tBatteryInfoDef tBatteryInfo;


sint8 AcqInit(void)
{
	memset(&tBatteryInfo, 0, sizeof(tBatteryInfoDef));
	InitMsTimeout(&tBatteryInfo.tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL_INIT);
}



sint8 AcqDoJob(void)
{
	uint16 u16Volt;
	
	if(IsMsTimeout(&tBatteryInfo.tVolSampleCtrl.tVolSampleTimeout) || 
	   tBatteryInfo.tVolSampleCtrl.u8SampleFlag)
	{
		
		InitMsTimeout(&tBatteryInfo.tVolSampleCtrl.tVolSampleTimeout, VOLT_SAMPLE_INTERVAL);
		tBatteryInfo.tVolSampleCtrl.u8SampleFlag = 0;
		tBatteryInfo.tVolSampleCtrl.u8SampleSta = 1;
		u16Volt = AdcGeneralAcq(CHAN_BAT1_VOLT);
	}
}
