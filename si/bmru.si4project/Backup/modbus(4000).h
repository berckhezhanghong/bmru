/*********************************************************************
* 内容摘要：       // modbus的头文件
*			  // 
* 其它说明：       // 
* 当前版本：       // v1.00.001
* 作	者： 		  // berck.he
* 完成日期： // 2017.12.16
* 修改记录1：// 
*	 修改日期：
*	 版 本 号：
*	 修 改 人：
*	 修改内容： 
* 修改记录1:
**********************************************************************/

#ifndef _MODBUS_H_
#define _MODBUS_H_


/* 头文件包含 */

#include "basicdatatype.h"


/* 宏定义 */


#define CMD_TYPE_READ 				0x03 // 读取AI
#define CMD_TYPE_SET_S 				0x06 // 设置单个
#define CMD_TYPE_SET_M 				0x10 // 设置多个


#define MODBUS_USER_DATA_MAX_LONG	64
#define ONE_FRAME_MAX_REG_NUM		24 // 一次最多操作的寄存器个数




/* 数据结构定义 */

// 接收到的协议信息
typedef struct tProtocolInfoDef
{
    uint8 u8ID; // 地址
    uint8 u8CommandCode; // 命令码
    uint16 u16RegisterStartAddr; // 寄存器起始地址
    uint16 u16RegisterNum; // 寄存器数目
    uint8 *pu8Data; // 数据
    uint16 u16DataLen; // 数据长度
}tProtocolInfoDef;

// 发送的协议信息
typedef struct tSendProtocolInfoDef
{
    uint8 u8ID; // 地址
    uint8 u8CommandCode; // 命令码
    uint16 u16RegisterStartAddr; // 寄存器起始地址
    uint16 u16RegisterNum; // 寄存器数目
    uint8 pu8Data[MODBUS_USER_DATA_MAX_LONG]; // 数据
    uint16 u16DataLen; // 数据长度
}tSendProtocolInfoDef;



/* 函数声明 */
// modbus的CRC校验
uint16  CalCRC(uint8 *pu8Data, uint16 u16Len);
uint8 CRCCheck(uint8 *pu8Data, uint16 u16Len);

sint16 ModbusParse(uint8 *pu8RecBuf, uint16 u16RecLen, tProtocolInfoDef *ptProtocolInfo);
sint16 ModbusBuild(tSendProtocolInfoDef tSendProtocolInfo, uint8 *pu8SendBuf, uint16 *pu16sendLen);

#endif /* _MODBUS_H_ */
