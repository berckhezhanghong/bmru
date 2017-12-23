#include "stm8l15x.h"
#include "general_oper.h"
#include "setx_acq.h"
#include "setx_uart.h"






#define LED_GPIO_PORT  GPIOD
#define LED_GPIO_PIN  GPIO_Pin_0

#define LED1_GPIO_PORT  GPIOA
#define LED1_GPIO_PIN  GPIO_Pin_3


void main(void)
{
	unsigned int u16data[6];
	uint32 u32Freq;

	CLK_HSICmd(ENABLE);
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);

	/* Initialize LEDs mounted on STM8L152X-EVAL board */
	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(LED1_GPIO_PORT, LED1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	// TemperTaskInit();
	UpUartInit();

	while (1)
	{
		/* Toggle LEDs */
		GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PIN);
		GPIO_ToggleBits(LED1_GPIO_PORT, LED1_GPIO_PIN);
		UsDelay(100);

		
		// UpUartSend("hello world\r\n", 13);


		// TemperTask();
	}
}
