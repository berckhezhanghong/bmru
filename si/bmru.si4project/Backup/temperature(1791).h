/*********************************************************************
* ����ժҪ�� // �¶Ȳɼ�
*            // 
* ����˵���� // 
* ��ǰ�汾�� // v1.00.001
* ��    �ߣ� // 
* ������ڣ� // 2017.03.24
* �޸ļ�¼1��// 
*    �޸����ڣ�
*    �� �� �ţ�
*    �� �� �ˣ�
*    �޸����ݣ� 
* �޸ļ�¼2:
**********************************************************************/

#ifndef TEMPERATURE_H_
#define TEMPERATURE_H_


/* ͷ�ļ����� */
#include "basicdatatype.h"
#include "timeout.h"
#include "debug.h"



/* �궨�� */
#define TEMPRATURE_MAX_NUM		2 //��·�¶ȣ��ط��������
#define TEMPER_SAMPLE_NUM		1 //
#define TEMPER_FAIL_MAXTIMES	20 // ����ʧ����Ϊ����������

#define TEMP_ERROR_VALUE		-2730

#define DS18B20_STATUS_IDLE					0 // 18b20����
#define DS18B20_STATUS_CONVERTING			1 // 18b20����ת�����ȴ�ת����ɷ��ɶ�ȡ����

#define DS1820_STATUS_OK		1
#define DS1820_STATUS_ERROR		2

#define TEMPER_FILTER_MAX_VARIATION		60 // ���ڵ������¶Ȳɼ����仯��Ϊ6��
#define TEMPERATURE_FILTER_NUM			5

#define TEMPER_SAMPLE_INTERVAL				(3000)  // �¶Ȳɼ����
#define TEMPER_SAMPLE_INTERVAL_INIT			(3000)  // ��ʼ���¶Ȳɼ����
#define TEMPER_CONVERT_TIME					(1000) // 1000ms �ȴ��¶ȴ�����ת�����



/* ���ݽṹ���� */

typedef struct tTemperReadDef
{
	sint16 s16Temp; // �¶�
	uint8 u8Status; // ״̬
}tTemperReadDef;


typedef struct tTemperDataDef
{
	sint16 s16Temp[TEMPER_SAMPLE_NUM]; // �¶�
	sint16 s16TempBuf[TEMPERATURE_FILTER_NUM];
}tTemperDataDef;


// �¶Ȳ�������
typedef struct tTempSampleCtrlDef
{
	tTemperDataDef tTemperData[TEMPRATURE_MAX_NUM];
	uint8 u8Ds18b20Status[TEMPRATURE_MAX_NUM]; // �¶ȴ�������״̬,�ɹ���ʧ��
	uint8 u8TempSampleStatus;  // �¶ȴ������Ĳ���״̬��
	tMsTimeoutDef tTempSampleTimeout; // �¶Ȳ�����ʱ
	tMsTimeoutDef tDSConvertTimeout; // �ȴ�DS18B20ת����ʱ
	uint8 u8FailCnt[TEMPRATURE_MAX_NUM]; // �¶Ȳɼ�����ʧ�ܴ���
	uint32 u32ErrorCode; // ������
	uint8 u8TempOk; // �Ѿ��ɼ����¶ȣ����Ѿ�ȷ���¶Ȳɼ�����
	uint8 u8SampleFlag; // ��Ҫ������ʼ�¶Ȳɼ��ı��
}tTempSampleCtrlDef;


/* �������� */

// �¶Ȳɼ�����
sint8 TemperTask(void);
// ��ȡ�¶�ֵ��״̬
tTempSampleCtrlDef *GetTemperInfo(void);
// �¶Ȳɼ������ʼ��
sint8 TemperTaskInit(void);


#endif /* TEMPERATURE_H_ */
