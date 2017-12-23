// 
#include <stdlib.h>
#include "comm_job.h"
#include "protocol.h"
#include "setx_uart.h"
#include "version.h"
#include "mcu_job.h"
#include "modbus.h"



extern tMcuCtrlDef tMcuCtrl;

extern tUartRecCtrlDef tUartRecCtrl;
extern tUartSendCtrlDef tUartSendCtrl;

static tProtocolInfoDef tProtocolInfo;
static tSendProtocolInfoDef tSendProtocolInfo;

#define	ACQ_REG_START			0x0000 
#define	SYS_REG_START			0x0048
#define	DO_REG_START			0x0200
#define	ACQ_AUX_REG_START		0x0200 
#define	PWD_REG_START			0x0300 
#define	SYSC_REG_START			0x0301
#define	VOLT_CALI_REG_START		0x0322
#define	INRS_CALI_REG_START		0x0354

#define	ACQ_REG_NUM				12 // �ɼ����� /ֻ��
#define	SYS_REG_NUM				13 // ϵͳ���� /ֻ��
#define	DO_REG_NUM				1  // DO /ֻ����д
#define	ACQ_AUX_REG_NUM			5  // ����ɼ��������ݣ��궨ʱʹ�� /ֻ��
#define	PWD_REG_NUM				1  // ���� /ֻд
#define	SYSC_REG_NUM			13 // ϵͳ���� /�ɶ�д ͬSYS_REG_NUM
#define	VOLT_CALI_REG_NUM		10 // ��ѹУ׼���� /�ɶ�д ͬSYS_REG_NUM
#define	INRS_CALI_REG_NUM		8  // ����У׼���� /�ɶ�д ͬSYS_REG_NUM


//0x0000~0x000B
uint16 u16AcqRegTable[ACQ_REG_NUM];
//0x0048~0x0054
uint16 u16SysRegTable[SYS_REG_NUM];
//0x0200
uint16 u16DORegTable[DO_REG_NUM];
//0x0100~0x0104
uint16 u16ACqAuxRegTable[ACQ_AUX_REG_NUM];
//0x0300
uint16 u16PwdRegTable[PWD_REG_NUM];
//0x0301~0x030D
uint16 u16SyscRegTable[SYSC_REG_NUM];
//0x0322~0x032B
uint16 u16VoltCaliRegTable[VOLT_CALI_REG_NUM];
//0x0354~0x035B
uint16 u16InrsCaliRegTable[INRS_CALI_REG_NUM];


#define	REG_TABLE0_START	ACQ_REG_START
#define	REG_TABLE1_START	SYS_REG_START
#define	REG_TABLE2_START	DO_REG_START			
#define	REG_TABLE3_START	ACQ_AUX_REG_START		 
#define	REG_TABLE4_START	PWD_REG_START			 
#define	REG_TABLE5_START	SYSC_REG_START			
#define	REG_TABLE6_START	VOLT_CALI_REG_START		
#define	REG_TABLE7_START	INRS_CALI_REG_START		

#define	REG_TABLE0_NUM		ACQ_REG_NUM	
#define	REG_TABLE1_NUM		SYS_REG_NUM				
#define	REG_TABLE2_NUM 		DO_REG_NUM				
#define	REG_TABLE3_NUM		ACQ_AUX_REG_NUM		
#define	REG_TABLE4_NUM		PWD_REG_NUM				
#define	REG_TABLE5_NUM		SYSC_REG_NUM			
#define	REG_TABLE6_NUM		VOLT_CALI_REG_NUM		
#define	REG_TABLE7_NUM		INRS_CALI_REG_NUM





static uint8* RegCheck(uint8 u8Cmd, uint16 u16Reg, uint16 u16Num)
{
	return NULL;
}


static sint16 AppDeal(tProtocolInfoDef tProtocolInfo, tSendProtocolInfoDef *ptSendProtocolInfo)
{

	uint8 *pu8Addr = NULL;
	sint16 s16Ret;

	if(NULL == ptSendProtocolInfo)
	{
		return -1;
	}

	ptSendProtocolInfo->u8ID = tProtocolInfo.u8ID;
	ptSendProtocolInfo->u8CommandCode = tProtocolInfo.u8CommandCode;
	
	switch(tProtocolInfo.u8CommandCode)
	{
		case CMD_TYPE_READ:
		{
			pu8Addr = RegCheck(tProtocolInfo.u8CommandCode, tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum);
			if(NULL != pu8Addr)
			{
				// memcpy(ptSendProtocolInfo->pu8Data, pu8Addr, (tProtocolInfo.u16RegisterNum * 2));
			}
			else
			{
				s16Ret = -1;
			}
			break;
		}
		
		case CMD_TYPE_SET_S:
		{		


			break;
		}
		
		case CMD_TYPE_SET_M:
		{


			break;
		}

		default:
		{
			//debug ���
			#ifdef DEBUG_PRINTF
		    DebugStrOutput(DEBUG_LEVEL_ERROR, "command type error\r\n");
		    #endif

			s16Ret = -1;
			break;
		}
	}

	return -1;
}


sint16 CommDoJob(void)
{
	sint16 s16Ret;
	
	if(UART_RCV_STA_OVER == tUartRecCtrl.u8RecSta)
	{
		s16Ret = ModbusParse(tUartRecCtrl.u8Buf, tUartRecCtrl.u16Len, &tProtocolInfo);

		if((0 == s16Ret) && (tMcuCtrl.u8DevID == tProtocolInfo.u8ID))
		{
			s16Ret = AppDeal(tProtocolInfo, &tSendProtocolInfo);
			if(0 == s16Ret)
			{
				ModbusBuild(tSendProtocolInfo, tUartSendCtrl.u8Buf, &tUartSendCtrl.u16Len);
				tUartSendCtrl.u8SendSta = UART_SEND_STA_WAITING;
			}
		}
	}
	
	return 0;
}
