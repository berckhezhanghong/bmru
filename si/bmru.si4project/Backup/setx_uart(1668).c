
#include "setx_uart.h"
#include "general_oper.h"


#define SETX_UP_UART			USART2

#define UP_UART_GPIO_PORT  		GPIOC
#define UP_UART_GPIO_TX_PIN  	GPIO_Pin_5
#define UP_UART_GPIO_RX_PIN  	GPIO_Pin_6



void UpUartInit(void)
{
	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortC, ENABLE);
    CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
    GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, GPIO_Mode_Out_PP_High_Fast);//TXD
    GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, GPIO_Mode_In_PU_No_IT);//RXD
    //GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, ENABLE);
    //GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, ENABLE);

    USART_DeInit(USART1);
	
	USART_Init(SETX_UP_UART, 9600, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, USART_Mode_Tx);

 	// USART_ClockInit(SETX_UP_UART, USART_Clock_Disable, USART_CPOL_Low, USART_CPHA_1Edge, USART_LastBit_Disable);

	// USART_ITConfig(USART1, USART_IT_RXNE, ENABLE);
    USART_Cmd(USART1, ENABLE); 
    // enableInterrupts();
	
 	// USART_GetITStatus(USART1, USART_FLAG_TC);
}


uint16 UpUartSend(uint8 *pu8Data, uint16 u16Len)
{
	uint16 i;

	for(i = 0; i < u16Len; i++)
	{
		USART_SendData8(SETX_UP_UART, *(pu8Data + i));
		/* µÈ´ý´«Êä½áÊø */
        // while (USART_GetFlagStatus(USART1, USART_FLAG_TC) == RESET);
        MsDelay(10);
	}

	return i;
}


