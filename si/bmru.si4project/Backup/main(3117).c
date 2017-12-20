#include <stdio.h>
#include <string.h>
#include "stm8l15x.h"
#include "general_oper.h"
#include "setx_acq.h"
#include "setx_uart.h"
#include "debug.h"


#define LED_GPIO_PORT  GPIOD
#define LED_GPIO_PIN  GPIO_Pin_0

#define LED1_GPIO_PORT  GPIOA
#define LED1_GPIO_PIN  GPIO_Pin_3




extern tTempSampleCtrlDef tTempSampleCtrl;



void main(void)
{
	uint16 u16Data;
	
	CLK_HSICmd(ENABLE);
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	while(CLK_GetFlagStatus(CLK_FLAG_HSIRDY) == RESET);    

	/* Initialize LEDs mounted on STM8L152X-EVAL board */
	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(LED1_GPIO_PORT, LED1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	TimeoutInit();
	UpUartInit();
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

		u16Data = AdcGeneralAcq(SETX_ADCIN_VREFINT);
		sprintf(DebugBuf, "bat2 volt: %u.%uV\r\n", u16Data / 1000, u16Data % 1000);
		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);

		//TemperTask();
	}
}