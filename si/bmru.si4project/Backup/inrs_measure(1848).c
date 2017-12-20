#include "stm8l15x.h"
#include "inrs_measure.h"





#define KPULSE_GPIO_PORT  	GPIOB
#define KPULSE_GPIO_PIN  	GPIO_Pin_7

#define SW_CTRL_GPIO_PORT  	GPIOA
#define SW_CTRL_GPIO_PIN  	GPIO_Pin_2


tInRsCtrlDef tInRsCtrl;


	




static sint8 BatSelect(uint8 u8Chan)
{
	switch(u8Chan)
	{
		case 0: // 放电电流
		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 0);
		break;

		case 1: // 反弹电压
		GPIO_WriteBit(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PIN, 1);
		break;

		default:
		break;
	}
}


static sint8 InrsVoltGet(uint8 u8Chan)
{
	switch(u8Chan)
	{
		case 0: // 放电电流
		AdcGeneralAcq(CHAN_REBACK_CURRENT);
		break;

		case 1: // 反弹电压
		AdcGeneralAcq(CHAN_REBACK_VOLT);
		break;
	}
}


#define FRAME1_KPULSE_NUM  	(10 * 2)	// 预放电脉冲数
#define FRAME2_KPULSE_NUM  	(10 * 2)	// 预放电脉冲数
#define FRAME2_ADC_ACQ_NUM  (16)	// 预放电脉冲数

static sint8 InrsMesureAct(void)
{
	uint8 i, j;
	uint16 u16VoltAd[BATTERY_MAX_NUM][2][2][FRAME2_KPULSE_NUM]; // 放电电流及反弹电压的AD采集值[节数][脉冲高低][电流电压][放电脉冲次数]
	uint16 u16InRs[BATTERY_MAX_NUM][FRAME2_ADC_ACQ_NUM]; // 内阻值[节数][放电脉冲次数]
	uint16 u16InRsAvr[BATTERY_MAX_NUM]; // 求平均后的内阻值[节数]

	for(j = 0; j < FRAME1_KPULSE_NUM; j ++)
	{
		GPIO_ToggleBits(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN);
		MsDelay(16);
	}

#if 0
	// 第一节测量BATTERY_MAX_NUM
	for(i = 0; i < FRAME2_KPULSE_NUM; i ++)
	{
		BatSelect(0);
		for(j = 0; j < FRAME2_KPULSE_NUM; j ++)
		{
			GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PIN);
			MsDelay(3);
			u16VoltAd[i][j % 2][0][j / 2] = InrsVoltGet(0);
			u16VoltAd[i][j % 2][1][j / 2] = InrsVoltGet(1);
			MsDelay(3);
		}
	}
#endif

	

	return 0;
}


sint8 InrsMesureDojob(void)
{
	if(tInRsCtrl.u8InRsSampleFlag)
	{
		InrsMesureAct();
	}
}


sint8 InrsMesureInit(void)
{
	tInRsCtrl.u8InRsSampleFlag = 1;

	GPIO_Init(KPULSE_GPIO_PORT, KPULSE_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	// GPIO_Init(SW_CTRL_GPIO_PORT, SW_CTRL_GPIO_PORT, GPIO_Mode_Out_PP_Low_Fast);
}





