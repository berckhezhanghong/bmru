
#include "string.h"
#include "setx_uart.h"
#include "general_oper.h"
#include "timeout.h"



tUartRecCtrlDef tUartRecCtrl;
tUartSendCtrlDef tUartSendCtrl;
tMsTimeoutDef  tUartRcvMsTimeout;



#define SETX_UP_UART				USART1

#define UP_UART_GPIO_PORT  			GPIOC
#define UP_UART_GPIO_TX_PIN  		GPIO_Pin_5
#define UP_UART_GPIO_RX_PIN  		GPIO_Pin_6

#define UP_UART_BAUTRATE			9600

#define	UP_UART_RCV_FRAME_TIMEOUT	((1000 * 10 * 5) / UP_UART_BAUTRATE)


void UpUartInit(void)
{
	memset(&tUartRecCtrl, 0, sizeof(tUartRecCtrlDef));
	memset(&tUartSendCtrl, 0, sizeof(tUartSendCtrlDef));
	
	SYSCFG_REMAPDeInit();
	SYSCFG_REMAPPinConfig(REMAP_Pin_USART1TxRxPortC, ENABLE);
    CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
    GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, GPIO_Mode_Out_PP_High_Fast);//TXD
    GPIO_Init(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, GPIO_Mode_In_PU_No_IT);//RXD
    GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_TX_PIN, ENABLE);
    GPIO_ExternalPullUpConfig(UP_UART_GPIO_PORT, UP_UART_GPIO_RX_PIN, ENABLE);

    USART_DeInit(SETX_UP_UART);
	
	USART_Init(SETX_UP_UART, UP_UART_BAUTRATE, USART_WordLength_8b, USART_StopBits_1, USART_Parity_No, (USART_Mode_Rx | USART_Mode_Tx));

	USART_ITConfig(SETX_UP_UART, USART_IT_RXNE, ENABLE);
    USART_Cmd(SETX_UP_UART, ENABLE); 
    enableInterrupts();
}

INTERRUPT void UP_UART_RX_IRQHandler(void)
{
	if(SET == USART_GetITStatus(SETX_UP_UART, USART_IT_RXNE)) 
	{
		if(UART_RCV_MAX_LONG > tUartRecCtrl.u16Len)
		{
			
			tUartRecCtrl.u8Buf[tUartRecCtrl.u16Len] = USART_ReceiveData8(SETX_UP_UART);
			InitMsTimeout(&tUartRcvMsTimeout, UP_UART_RCV_FRAME_TIMEOUT);
			tUartRecCtrl.u8RecSta = UART_RCV_STA_RCVING;
			tUartRecCtrl.u16Len ++;
		}
		else
		{
			tUartRecCtrl.u8RecSta = UART_RCV_STA_ERROR;
		}
	}
}


uint16 UpUartSendStr(uint8 *pu8Data, uint16 u16Len)
{
	uint16 i;

	for(i = 0; i < u16Len; i++)
	{
		USART_SendData8(SETX_UP_UART, *(pu8Data + i));
		/* 等待传输结束 */
        while(USART_GetFlagStatus(SETX_UP_UART, USART_FLAG_TC) == RESET);
	}

	return i;
}



sint16 UpUartRcvDoJob(void)
{
	if(UART_RCV_STA_RCVING == tUartRecCtrl.u8RecSta)
	{
		if(IsMsTimeout(&tUartRcvMsTimeout))
		{
			USART_ITConfig(SETX_UP_UART, USART_IT_RXNE, DISABLE);
			tUartRecCtrl.u8RecSta = UART_RCV_STA_OVER;
		}
	}

	return 0;
}



sint16 UpUartSendDoJob(void)
{
	uint16 i;
	
	if(UART_SEND_STA_WAITING == tUartSendCtrl.u8SendSta)
	{	
		tUartSendCtrl.u8SendSta = UART_SEND_STA_SENDING;
		for(i = 0; i < tUartSendCtrl.u16Len; i++)
		{
			USART_SendData8(SETX_UP_UART, tUartSendCtrl.u8Buf[i]);
			/* 等待传输结束 */
	        while(USART_GetFlagStatus(SETX_UP_UART, USART_FLAG_TC) == RESET);
		}
		tUartSendCtrl.u8SendSta = UART_SEND_STA_IDLE;

		USART_ITConfig(SETX_UP_UART, USART_IT_RXNE, ENABLE);
	}
	
	return 0;
}
