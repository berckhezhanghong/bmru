/*********************************************************************
* 内容摘要： //main的头文件
*			 // 
* 其它说明： // 
* 当前版本： // v1.00.001
* 作	者： // 何章宏.ztenv
* 完成日期： // 2017.07.19
* 修改记录1：// 
*	 修改日期：
*	 版 本 号：
*	 修 改 人：
*	 修改内容： 
* 修改记录2:
**********************************************************************/

#ifndef MODBUS_H_
#define MODBUS_H_


/* 头文件包含 */

#include "basicdatatype.h"
#include "transfer.h"



/* 宏定义 */
#define TYPE_DO_READ 	0x01 // 读取DO
#define TYPE_DI_READ 	0x02 // 读取DI
#define TYPE_AO_READ 	0x03 // 读取AO
#define TYPE_AI_READ 	0x04 // 读取AI
#define TYPE_DO_SET  	0x05 // 设置单个DO
#define TYPE_AO_SET  	0x06 // 设置单个AO


#define ID_DEVIATION  	20 // 内阻模块的ID在协议中偏移10，与SBUS的ID分离


/* 数据结构定义 */

// 接收到的协议信息
typedef struct tProtocolInfoDef
{
    uint16 u16ID; // 地址
    uint8 u8CommandCode; // 命令码
    uint16 u16RegisterStartAddr; // 寄存器起始地址
    uint16 u16RegisterNum; // 寄存器数目
    void *pvData; // 数据
    //uint8 pu8Data[100]; // 数据
    uint16 u16DataLen; // 数据长度
    tMsTimeDef tRecTime; // 接收到数据包的时间
}tProtocolInfoDef;

// 发送的协议信息
typedef struct tSendProtocolInfoDef
{
    uint16 u16ID; // 地址
    uint8 u8CommandCode; // 命令码
    uint16 u16RegisterStartAddr; // 寄存器起始地址
    uint16 u16RegisterNum; // 寄存器数目 保留未使用
    void *pvData; // 数据 保留未使用
    //uint8 pu8Data[100]; // 数据
    uint16 u16DataLen; // 数据长度
    tMsTimeDef tRecTime; // 接收到数据包的时间
}tSendProtocolInfoDef;

// modbus驱动相关信息
typedef struct tModbusDriverDef
{
    uint32 u32Size; // 此结构体的大小
    sint32 (*ModbusParse)(tModbusRecDataNodeDef *ptModbusDataRec, tProtocolInfoDef *ptProtocolInfo); // 协议数据解析
    sint32 (*ModbusBuild)(tSendProtocolInfoDef *ptSendProtocolInfo, tModbusSendDataNodeDef *ptModbusDataSend); // 协议数据解析
}tModbusDriverDef;



/* 函数声明 */

sint32 ModbusDriverInit(void);
tModbusDriverDef *GetModbusDriverPara(void);
sint32 ModbusParse(tModbusRecDataNodeDef *ptModbusDataRec, tProtocolInfoDef *ptProtocolInfo);
sint32 ModbusBuild(tSendProtocolInfoDef *ptSendProtocolInfo, tModbusSendDataNodeDef *ptModbusDataSend);

// modbus的CRC校验
uint16  CalCRC(uint8 *pu8Data, uint16 u16Len);
uint8 CRCCheck(uint8 *pu8Data, uint16 u16Len);

#endif /* MODBUS_H_ */
