#include <stdio.h>
#include "stm8l15x.h"
#include "inrs_measure.h"
#include "debug.h"





#define KPULSE_GPIO_PORT  	GPIOB
#define KPULSE_GPIO_PIN  	GPIO_Pin_7

#define SW_CTRL_GPIO_PORT  	GPIOA
#define SW_CTRL_GPIO_PIN  	GPIO_Pin_2


tInRsCtrlDef tInRsCtrl;


	




static sint8 BatSelect(uint8 u8Chan)
{
	switch(u8Chan)
	{
		case 0: // bat1
		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 0);
		break;

		case 1: // bat2
		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 1);
		break;

		default:
		break;
	}
}


#define FRAME2_ADC_ACQ_NUM  (16)	// 预放电脉冲数

static sint8 InrsVoltGet(uint16 *pu16CurrAd, uint16 *pu16VoltAd)
{
	uint16 u16VoltAd[2][FRAME2_ADC_ACQ_NUM];
	uint8 i;
	
	for(i = 0; i < FRAME2_ADC_ACQ_NUM; i ++)
	{
		// 放电电流
		u16VoltAd[0][i] = AdcGeneralAcq(CHAN_REBACK_CURRENT);
		// 放电电压
		u16VoltAd[1][i] = AdcGeneralAcq(CHAN_REBACK_VOLT);
		UsDelay(400);
	}

	*pu16CurrAd = U16Filter(&u16VoltAd[0][0], FRAME2_ADC_ACQ_NUM);
	*pu16VoltAd = U16Filter(&u16VoltAd[1][0], FRAME2_ADC_ACQ_NUM);
}


#define FRAME1_KPULSE_NUM  	(10 * 2)	// 预放电脉冲数
#define FRAME2_KPULSE_NUM  	(10 * 2)	// 预放电脉冲数

static sint8 InrsMesureAct(void)
{
	uint8 i, j;
	uint16 u16AdData[BATTERY_MAX_NUM][2][2][FRAME2_KPULSE_NUM / 2]; // 放电电流及反弹电压的AD采集值[节数][脉冲高低][电流电压][放电脉冲次数]
	float fInRs[FRAME2_KPULSE_NUM / 2]; // 内阻值[放电脉冲次数]

	for(j = 0; j < FRAME1_KPULSE_NUM; j ++)
	{
		GPIO_ToggleBits(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN);
		MsDelay(13);
	}

#if 1
	// 内阻测量
	for(i = 0; i < BATTERY_MAX_NUM; i ++)
	{
		BatSelect(i);
		for(j = 0; j < FRAME2_KPULSE_NUM; j ++)
		{
			GPIO_ToggleBits(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN);
			MsDelay(3);
			InrsVoltGet(&u16AdData[i][j % 2][0][j / 2], &u16AdData[i][j % 2][1][j / 2]);
		}
	}

	BatSelect(0);

	// 计算内阻值
	for(i = 0; i < BATTERY_MAX_NUM; i ++)
	{
		for(j = 0; j < (FRAME2_KPULSE_NUM / 2); j ++)
		{
			fInRs[j] = ((float)(u16AdData[i][0][1][j] - u16AdData[i][1][1][j]) / \
								(float)(u16AdData[i][0][0][j] - u16AdData[i][1][0][j])) * INRS_VREF_RS_12V;

			#if DEBUG_PRINTF
			fInRs[j] =99.99;
			sprintf((char *)DebugBuf, "bat%u+:%u,%u,%f\r\n", (uint16)(i+1), u16AdData[i][0][1][j], u16AdData[i][0][0][j]);
			DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
			sprintf((char *)DebugBuf, "bat%u+:%f\r\n", (uint16)(i+1), fInRs[j]);
			DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
			
			sprintf((char *)DebugBuf, "bat%u-:%u,%u,%f\r\n", (uint16)(i+1), u16AdData[i][1][1][j], u16AdData[i][1][0][j]);
			DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
			sprintf((char *)DebugBuf, "bat%u-:%f\r\n", (uint16)(i+1), fInRs[j]);
			DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
			#endif
		}
		tInRsCtrl.fInRsAvr[i] =  FloatFilter(&fInRs[0], (FRAME2_KPULSE_NUM / 2));
		
		#if DEBUG_PRINTF
		sprintf((char *)DebugBuf, "bat%u:%f\r\n", (uint16)(i+1), tInRsCtrl.fInRsAvr[i]);
		DebugStrOutput(DEBUG_LEVEL_INFO, DebugBuf);
		#endif
	}

#endif

	return 0;
}


sint8 InrsMesurejob(void)
{
	uint16 u16Data;
	uint16 u16Data1;
	
	if(tInRsCtrl.u8InRsSampleFlag)
	{
		tInRsCtrl.u8InRsSampleFlag = 0;
		InrsMesureAct();
	}

	return 0;
}


sint8 InrsMesureInit(void)
{
	tInRsCtrl.u8InRsSampleFlag = 1;

	GPIO_Init(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
	GPIO_Init(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
}





