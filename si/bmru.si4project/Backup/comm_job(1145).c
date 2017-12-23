// 
#include <string.h>
#include <stdlib.h>
#include "comm_job.h"
#include "protocol.h"
#include "setx_uart.h"
#include "version.h"
#include "mcu_job.h"
#include "modbus.h"
#include "general_oper.h"




extern tMcuCtrlDef tMcuCtrl;

extern tUartRecCtrlDef tUartRecCtrl;
extern tUartSendCtrlDef tUartSendCtrl;


static tProtocolInfoDef tProtocolInfo;
static tSendProtocolInfoDef tSendProtocolInfo;
static uint8 u8PasswordOK = 0;


#define	PASSWORD_VALUE		0x96A5

#define	ACQ_REG_START			0x0000 
#define	SYS_REG_START			0x0048
#define	DO_REG_START			0x0200
#define	ACQ_AUX_REG_START		0x0100 
#define	PWD_REG_START			0x0300 
#define	SYSC_REG_START			0x0301
#define	VOLT_CALI_REG_START		0x0322
#define	INRS_CALI_REG_START		0x0354

#define	ACQ_REG_NUM				12 // 采集数据 /只读
#define	SYS_REG_NUM				13 // 系统参数 /只读
#define	DO_REG_NUM				1  // DO /只单个写
#define	ACQ_AUX_REG_NUM			5  // 内阻采集辅助数据，标定时使用 /只读
#define	PWD_REG_NUM				1  // 密码 /只写
#define	SYSC_REG_NUM			13 // 系统参数 /可读写 同SYS_REG_NUM
#define	VOLT_CALI_REG_NUM		10 // 电压校准参数 /可读写 同SYS_REG_NUM
#define	INRS_CALI_REG_NUM		8  // 内阻校准参数 /可读写 同SYS_REG_NUM

//0x0000~0x000B R
uint16 u16AcqRegTable[ACQ_REG_NUM];
//0x0048~0x0054 R
uint16 u16SysRegTable[SYS_REG_NUM];
//0x0200 W
uint16 u16DORegTable[DO_REG_NUM];
//0x0100~0x0104 R
uint16 u16ACqAuxRegTable[ACQ_AUX_REG_NUM];
//0x0300 W
uint16 u16PwdRegTable[PWD_REG_NUM];
//0x0301~0x030D RW
uint16 u16SyscRegTable[SYSC_REG_NUM];
//0x0322~0x032B RW
uint16 u16VoltCaliRegTable[VOLT_CALI_REG_NUM];
//0x0354~0x035B RW
uint16 u16InrsCaliRegTable[INRS_CALI_REG_NUM];


sint8 DoCtrl(uint16 u16Reg, uint16 u16RegNum, uint8 *pu8Data)
{
	sint8 s8Ret;
	uint8 i;
	
	for(i = 0; i < u16RegNum; i++)
	{
		
	}
	
	return s8Ret;
}


sint8 RegDownSyn(uint16 u16Reg, uint16 u16RegNum, uint8 *pu8Data)
{
	return 0;
}


// 执行设置与控制操作
sint8 CtrlAct(uint16 u16Reg, uint16 u16RegNum, uint8 *pu8Data)
{
	sint8 s8Ret;

	// 提取密码
	if(PWD_REG_START == u16Reg)
	{
		if(PASSWORD_VALUE == *((uint16 *)pu8Data))
		{
			u8PasswordOK = 1;
		}

		// 该条协议只验证密码
		if(1 == u16RegNum)
		{
			return 0;
		}
	}

	// DO控制
	if((DO_REG_START <= u16Reg) && ((DO_REG_START + DO_REG_NUM) > (u16Reg + u16RegNum)))
	{
		s8Ret = DoCtrl(u16Reg, pu8Data);

		return s8Ret;
	}

	// 参数设置
	if(SYSC_REG_START < (u16Reg + u16RegNum))
	{
		if(1 == u8PasswordOK)
		{
			u8PasswordOK = 0;
			s8Ret = RegDownSyn(u16Reg, u16RegNum, pu8Data);
			return s8Ret;
		}
		else
		{
			return -1;
		}
	}

	
}


// 检查寄存器的合法性
static uint8* RegCheck(uint8 u8Cmd, uint16 u16Reg, uint16 u16Num)
{
	uint8 *pu8Reg = NULL;
	
	switch(u8Cmd)
	{
		case CMD_TYPE_READ:
		{
			if((ACQ_REG_START <= u16Reg) && ((ACQ_REG_START + ACQ_REG_NUM) > (u16Reg + u16Num))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - ACQ_REG_START]);
			}
			else if((SYS_REG_START <= u16Reg) && ((SYS_REG_START + SYS_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - SYS_REG_START]);
			}
			else if((ACQ_AUX_REG_START <= u16Reg) && ((ACQ_AUX_REG_START + ACQ_AUX_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - ACQ_AUX_REG_START]);
			}
			else if((SYSC_REG_START <= u16Reg) && ((SYSC_REG_START + SYSC_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - SYSC_REG_START]);
			}
			else if((VOLT_CALI_REG_START <= u16Reg) && ((VOLT_CALI_REG_START + VOLT_CALI_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - VOLT_CALI_REG_START]);
			}
			else if((INRS_CALI_REG_START <= u16Reg) && ((INRS_CALI_REG_START + INRS_CALI_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - INRS_CALI_REG_START]);
			}
			break;
		}
		
		case CMD_TYPE_SET_S:
		case CMD_TYPE_SET_M:
		{	
			if((DO_REG_START <= u16Reg) && ((DO_REG_START + DO_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - DO_REG_START]);
			}
			else if((PWD_REG_START <= u16Reg) && ((PWD_REG_START + (PWD_REG_NUM + SYSC_REG_NUM)) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - PWD_REG_START]);
			}
			else if((VOLT_CALI_REG_START <= u16Reg) && ((VOLT_CALI_REG_START + VOLT_CALI_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - VOLT_CALI_REG_START]);
			}
			else if((INRS_CALI_REG_START <= u16Reg) && ((INRS_CALI_REG_START + INRS_CALI_REG_NUM) > (u16Reg + u16Num)))
			{
				pu8Reg = (uint8 *)(&u16AcqRegTable[u16Reg - INRS_CALI_REG_START]);
			}
			break;
		}

		default:
		{

			pu8Reg = NULL;
			break;
		}
	}

	return pu8Reg;
}


static sint16 AppDeal(tProtocolInfoDef tProtocolInfo, tSendProtocolInfoDef *ptSendProtocolInfo)
{

	uint8 *pu8Addr = NULL;
	sint16 s16Ret;
	uint16 i;

	if(NULL == ptSendProtocolInfo)
	{
		return -1;
	}

	ptSendProtocolInfo->u8ID = tProtocolInfo.u8ID;
	ptSendProtocolInfo->u8CommandCode = tProtocolInfo.u8CommandCode;
	ptSendProtocolInfo->u16DataLen = 0;
	
	switch(tProtocolInfo.u8CommandCode)
	{
		case CMD_TYPE_READ:
		{
			pu8Addr = RegCheck(tProtocolInfo.u8CommandCode, tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum);
			if(NULL != pu8Addr)
			{
				i = 0;
				PubPutU16(ptSendProtocolInfo->pu8Data, (tProtocolInfo.u16RegisterNum * 2));
				i += 2;
				memcpy((ptSendProtocolInfo->pu8Data + i), pu8Addr, (tProtocolInfo.u16RegisterNum * 2));
				i += (tProtocolInfo.u16RegisterNum * 2);
				ptSendProtocolInfo->u16DataLen = i;
				s16Ret = 0;
			}
			else
			{
				s16Ret = -1;
			}
			break;
		}
		
		case CMD_TYPE_SET_S:
		{		
			pu8Addr = RegCheck(tProtocolInfo.u8CommandCode, tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum);
			if(NULL != pu8Addr)
			{
				if(0 <= CtrlAct(tProtocolInfo.u16RegisterStartAddr, 1, tProtocolInfo.pu8Data))
				{
					i = 0;
					PubPutU16(ptSendProtocolInfo->pu8Data, tProtocolInfo.u16RegisterStartAddr);
					i += 2;
					memcpy((ptSendProtocolInfo->pu8Data + i), tProtocolInfo.pu8Data, 2);
					i += 2;
					ptSendProtocolInfo->u16DataLen = i;
					s16Ret = 0;
				}
				else
				{
					s16Ret = -1;
				}
			}
			else
			{
				s16Ret = -1;
			}
			break;
		}
		
		case CMD_TYPE_SET_M:
		{		
			pu8Addr = RegCheck(tProtocolInfo.u8CommandCode, tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum);
			if(NULL != pu8Addr)
			{
				if(0 <= CtrlAct(tProtocolInfo.u16RegisterStartAddr, tProtocolInfo.u16RegisterNum, tProtocolInfo.pu8Data))
				{
					i = 0;
					PubPutU16(ptSendProtocolInfo->pu8Data, tProtocolInfo.u16RegisterStartAddr);
					i += 2;
					PubPutU16((ptSendProtocolInfo->pu8Data + 2), tProtocolInfo.u16RegisterNum);
					i += 2;
					ptSendProtocolInfo->u16DataLen = i;
					s16Ret = 0;
				}
				else
				{
					s16Ret = -1;
				}
			}
			else
			{
				s16Ret = -1;
			}
			break;
		}

		default:
		{
			//debug 输出
			#ifdef DEBUG_PRINTF
		    DebugStrOutput(DEBUG_LEVEL_ERROR, "command type error\r\n");
		    #endif

			s16Ret = -1;
			break;
		}
	}

	return s16Ret;
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
