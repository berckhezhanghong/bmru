#include <stdio.h>
#include <string.h>
#include "stm8l15x.h"
#include "general_oper.h"
#include "setx_acq.h"
#include "setx_uart.h"
#include "debug.h"


#if 1
#define LED_GPIO_PORT  GPIOD
#define LED_GPIO_PIN  GPIO_Pin_0

#define LED1_GPIO_PORT  GPIOA
#define LED1_GPIO_PIN  GPIO_Pin_3
#endif

#if 0
#define LED_GPIO_PORT  GPIOC
#define LED_GPIO_PIN  GPIO_Pin_5

#define LED1_GPIO_PORT  GPIOC
#define LED1_GPIO_PIN  GPIO_Pin_6
#endif


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
	// UpUartInit();
	DebugInit();
	
	AcqInit();
	TemperTaskInit();
	

	

	while (1)
	{
		/* Toggle LEDs */
		TimeoutMsDelay(500);
		GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PIN);
		//GPIO_WriteBit(LED_GPIO_PORT, LED_GPIO_PIN, 0);
		GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PIN);
		TimeoutMsDelay(500);

		
		// AcqDoJob();


		// DebugStrOutput(DEBUG_LEVEL_3, "cycle\r\n");
		// UpUartSendStr("cycle1\r\n", 8);
		//TemperTask();
	}
}
