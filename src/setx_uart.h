
#ifndef __SETX_UART_H
#define __SETX_UART_H

#include "stm8l15x.h"
#include "basicdatatype.h"



#define	UART_RCV_MAX_LONG	64
#define	UART_SEND_MAX_LONG	64

#define	UART_RCV_STA_IDLE		0x00
#define	UART_RCV_STA_RCVING		0x01
#define	UART_RCV_STA_OVER		0x02
#define	UART_RCV_STA_ERROR		0x03


#define	UART_SEND_STA_IDLE		0x00
#define	UART_SEND_STA_WAITING	0x01
#define	UART_SEND_STA_SENDING	0x02
#define	UART_SEND_STA_ERROR		0x03



typedef struct tUartRecCtrlDef {
	uint8 u8Buf[UART_RCV_MAX_LONG];
	uint16 u16Len;
	uint8 u8RecSta;
}tUartRecCtrlDef;



typedef struct tUartSendCtrlDef {
	uint8 u8Buf[UART_SEND_MAX_LONG];
	uint16 u16Len;
	uint8 u8SendSta;
}tUartSendCtrlDef;


void UpUartInit(void);
sint16 UpUartRcvDoJob(void);
sint16 UpUartSendDoJob(void);



#endif /* __SETX_UART_H */
