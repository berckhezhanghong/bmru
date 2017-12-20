#include "stm8l15x.h"
#include "setx_acq.h"
#include "general_oper.h"




#define LED_GPIO_PORT  GPIOD
#define LED_GPIO_PINS  GPIO_Pin_0

void main(void)
{
	unsigned int u16data[6];

	/* Initialize LEDs mounted on STM8L152X-EVAL board */
	GPIO_Init(LED_GPIO_PORT, LED_GPIO_PINS, GPIO_Mode_Out_PP_Low_Fast);
	TemperTaskInit();

	while (1)
	{
		/* Toggle LEDs */
		GPIO_ToggleBits(LED_GPIO_PORT, LED_GPIO_PINS);
		MsDelay(10);

		//u16data[0] = AdcGeneralAcq(0);
		//u16data[1] = AdcGeneralAcq(1);
		//u16data[2] = AdcGeneralAcq(2);
		//u16data[3] = AdcGeneralAcq(3);
		//u16data[4] = AdcGeneralAcq(4);
		// u16data[5] = AdcGeneralAcq(5);
		// TemperTask();
	}
}
