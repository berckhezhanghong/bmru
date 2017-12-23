#include <stdio.h>
#include <string.h>
#include "stm8l15x.h"
#include "general_oper.h"
#include "setx_acq.h"
#include "setx_uart.h"






#define LED_GPIO_PORT  GPIOD
#define LED_GPIO_PIN  GPIO_Pin_0

#define LED1_GPIO_PORT  GPIOA
#define LED1_GPIO_PIN  GPIO_Pin_3

uint8 u8DebugStr[60];

extern tTempSampleCtrlDef tTempSampleCtrl;



void main(void)
{
	CLK_HSICmd(ENABLE);
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);    

	/* Initialize LEDs mounted on STM8L152X-EVAL board */
	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(LED1_GPIO_PORT, LED1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	TimeoutInit();
	TemperTaskInit();
	UpUartInit();

	

	while (1)
	{
		/* Toggle LEDs */
		//GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PIN);
		//GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PIN);
		//TimeoutMsDelay(500);

		
		


		TemperTask();

		sprintf(u8DebugStr, "temper:%d, %d\r\n", tTempSampleCtrl.tTemperData[0].s16Temp[0], tTempSampleCtrl.tTemperData[1].s16Temp[0]);
		UpUartSendStr(u8DebugStr, strlen(u8DebugStr));
	}
}
