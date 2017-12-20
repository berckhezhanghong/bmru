
#include "setx_uart.h"



void UpUartInit(void)
{
	
	USART_Init(USART1, 9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_Rx | USART_Mode_Tx));

 	USART_ClockInit(USART1, USART_Clock_Disable, USART_CPOL_Low, USART_CPHA_1Edge, USART_LastBit_Disable);
}


uint16 UpUartSend(uint8 *pu8Data, uint16 u16Len)
{
	uint16 i;

	for(i = 0; i < u16Len; i++)
	{
		USART_SendData8(USART1, *(pu8Data + i));
	}

	return i;
}


