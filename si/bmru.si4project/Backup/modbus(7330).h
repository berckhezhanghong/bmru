/*********************************************************************
* ����ժҪ�� //main��ͷ�ļ�
*			 // 
* ����˵���� // 
* ��ǰ�汾�� // v1.00.001
* ��	�ߣ� // ���º�.ztenv
* ������ڣ� // 2017.07.19
* �޸ļ�¼1��// 
*	 �޸����ڣ�
*	 �� �� �ţ�
*	 �� �� �ˣ�
*	 �޸����ݣ� 
* �޸ļ�¼2:
**********************************************************************/

#ifndef MODBUS_H_
#define MODBUS_H_


/* ͷ�ļ����� */

#include "basicdatatype.h"
#include "transfer.h"



/* �궨�� */
#define TYPE_DO_READ 	0x01 // ��ȡDO
#define TYPE_DI_READ 	0x02 // ��ȡDI
#define TYPE_AO_READ 	0x03 // ��ȡAO
#define TYPE_AI_READ 	0x04 // ��ȡAI
#define TYPE_DO_SET  	0x05 // ���õ���DO
#define TYPE_AO_SET  	0x06 // ���õ���AO


#define ID_DEVIATION  	20 // ����ģ���ID��Э����ƫ��10����SBUS��ID����


/* ���ݽṹ���� */

// ���յ���Э����Ϣ
typedef struct tProtocolInfoDef
{
    uint16 u16ID; // ��ַ
    uint8 u8CommandCode; // ������
    uint16 u16RegisterStartAddr; // �Ĵ�����ʼ��ַ
    uint16 u16RegisterNum; // �Ĵ�����Ŀ
    void *pvData; // ����
    //uint8 pu8Data[100]; // ����
    uint16 u16DataLen; // ���ݳ���
    tMsTimeDef tRecTime; // ���յ����ݰ���ʱ��
}tProtocolInfoDef;

// ���͵�Э����Ϣ
typedef struct tSendProtocolInfoDef
{
    uint16 u16ID; // ��ַ
    uint8 u8CommandCode; // ������
    uint16 u16RegisterStartAddr; // �Ĵ�����ʼ��ַ
    uint16 u16RegisterNum; // �Ĵ�����Ŀ ����δʹ��
    void *pvData; // ���� ����δʹ��
    //uint8 pu8Data[100]; // ����
    uint16 u16DataLen; // ���ݳ���
    tMsTimeDef tRecTime; // ���յ����ݰ���ʱ��
}tSendProtocolInfoDef;

// modbus���������Ϣ
typedef struct tModbusDriverDef
{
    uint32 u32Size; // �˽ṹ��Ĵ�С
    sint32 (*ModbusParse)(tModbusRecDataNodeDef *ptModbusDataRec, tProtocolInfoDef *ptProtocolInfo); // Э�����ݽ���
    sint32 (*ModbusBuild)(tSendProtocolInfoDef *ptSendProtocolInfo, tModbusSendDataNodeDef *ptModbusDataSend); // Э�����ݽ���
}tModbusDriverDef;



/* �������� */

sint32 ModbusDriverInit(void);
tModbusDriverDef *GetModbusDriverPara(void);
sint32 ModbusParse(tModbusRecDataNodeDef *ptModbusDataRec, tProtocolInfoDef *ptProtocolInfo);
sint32 ModbusBuild(tSendProtocolInfoDef *ptSendProtocolInfo, tModbusSendDataNodeDef *ptModbusDataSend);

// modbus��CRCУ��
uint16  CalCRC(uint8 *pu8Data, uint16 u16Len);
uint8 CRCCheck(uint8 *pu8Data, uint16 u16Len);

#endif /* MODBUS_H_ */
