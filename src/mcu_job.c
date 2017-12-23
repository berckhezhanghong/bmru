// 
// 
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "mcu_job.h"




// ȫ�ֱ���
tMcuCtrlDef tMcuCtrl;

static uint8 McuRstFlag = 0;
static uint8 McuBootloaderFlag = 0;


#define LED_RUN_GPIO_PORT  		GPIOD
#define LED_RUN_GPIO_PIN 		GPIO_Pin_0

#define LED_ALARM_GPIO_PORT  	GPIOA
#define LED_ALARM_GPIO_PIN  	GPIO_Pin_3


sint8 McuInit(void)
{
	CLK_HSICmd(ENABLE);
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);    

	GPIO_Init(LED_RUN_GPIO_PORT, LED_RUN_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(LED_ALARM_GPIO_PORT, LED_ALARM_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);

	InitMsTimeout(&tMcuCtrl.tLedTimeout, 500);
	
	return 0;
}

// ����ʵ��

/*����ϵͳʱ��
 *����������ṹ��Time_data
 *�����������
 *���ز�����0Ϊ�ɹ���-1Ϊʧ��
 */
sint8 SetMcuTime(tMcuTimeDef TMcuTime)
{
	return 0;
}



/*��ȡϵͳʱ��
 *���������T_time_data��ָ��
 *����������ṹ��Time_data
 *���ز�����0Ϊ�ɹ���-1Ϊʧ��
 */
sint8 GetMcuTime(tMcuTimeDef *pTMcuTime)
{
	if(NULL == pTMcuTime)
	{
		return -1;
	}
	
	return 0;
}



sint8 SetRstFlag(uint8 u8Flag)
{
	u8Flag = 1;
	
	return 0;
}


sint8 SetBootloaderFlag(uint8 u8Flag)
{
	McuBootloaderFlag = 1;
	
	return 0;
}


static void SaveBefRst(void)
{
	return ;
}


static void JumpToBootloader(void)
{
	return ;
}


sint8 McuJob(void)
{
	if(McuRstFlag)
	{
		SaveBefRst();
		while(1); // �ȴ����Ź�����
	}

	if(McuBootloaderFlag)
	{
		SaveBefRst();
		JumpToBootloader();
	}

	// run led
	if(IsMsTimeout(&tMcuCtrl.tLedTimeout))
	{
		InitMsTimeout(&tMcuCtrl.tLedTimeout, 500);

		// Toggle LED
		GPIO_ToggleBits(LED_RUN_GPIO_PORT, LED_RUN_GPIO_PIN);
	}
}
