
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "basicdatatype.h"
#include "temperature.h"


#define BATTERY_MAX_NUM			2
#define BATTERY_MAX_NUM			2

#define CALIB_MAX_NUM	2


// У׼����
typedef struct tCalibrateParaDef
{
	float  fSlope[CALIB_MAX_NUM]; // б��
	sint16 s16Intercept[CALIB_MAX_NUM]; // �ؾ�
}tCalibrateParaDef;

// ������Ϣ
typedef struct tCellInfoDef
{
	uint16 u16Voltage; // ��ѹ
	sint16 s16Temp; // �¶�
	float fInRs; // ����
	float fInRsTemp; // �ݴ������������
	uint16 u16VoltageAvr; // �˲���ĵ�ƽ����ѹ
	sint16 s16TempBuf[TEMPERATURE_FILTER_NUM];
}tCellInfoDef;

// ��ѹ��������
typedef struct tVolSampleCtrlDef
{
	tMsTimeoutDef tVolSampleTimeout; // ��ѹ�ɼ���ʱ����ʱ1s
	uint8 u8SampleFlag; // ��Ҫ������ʼ��ѹ�ɼ��ı��
	uint32 u32SampleCnt;
	uint8 u8FailCnt[BATTERY_MAX_NUM]; // ��ѹ�ɼ�����ʧ�ܴ���
	uint32 u32ErrorCode; // ������
	uint8 u8VoltOk; // �Ѿ��ɼ�����ѹ�����Ѿ�ȷ�ϵ�ѹ�ɼ�����
	tCalibrateParaDef *tCalibratePara;
}tVolSampleCtrlDef;



// ������Ϣ
typedef struct tBatteryInfoDef
{
    uint32 u32Size; // �˽ṹ��Ĵ�С
    uint8 u8SampleStatus; // ��ǰ����״̬��״̬��)
    tCellInfoDef tCellData[BATTERY_MAX_NUM]; // ������Ϣ
    tVolSampleCtrlDef tVolSampleCtrl; // ��ѹ�ɼ�����
    tTempSampleCtrlDef *ptTempSampleCtrl; // �¶Ȳɼ�����
}tBatteryInfoDef;


#endif /* __SETX_ACQ_H */
