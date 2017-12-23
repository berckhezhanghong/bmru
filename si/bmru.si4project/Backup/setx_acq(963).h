
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "basicdatatype.h"
#include "temperature.h"
#include "inrs_measure.h"



#define BATTERY_MAX_NUM			2
#define BATTERY_MAX_NUM			2

#define CALIB_MAX_NUM			2

#define VOLT_SAMPLE_INTERVAL				(3000)  // ��ѹ�ɼ����
#define VOLT_SAMPLE_INTERVAL_INIT			(3000)  // ��ʼ����ѹ�ɼ����


#define	CHAN_BAT1_VOLT			SETX_ADCIN2
#define	CHAN_BAT2_VOLT			SETX_ADCIN3



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
	uint8 u8SampleSta; // ��ǰ����״̬��״̬��)
	tMsTimeoutDef tVolSampleTimeout; // ��ѹ�ɼ���ʱ����ʱ1s
	uint8 u8SampleFlag; // ��Ҫ������ʼ��ѹ�ɼ��ı��
	uint32 u32SampleCnt[BATTERY_MAX_NUM];
	uint32 u32FailCnt[BATTERY_MAX_NUM]; // ��ѹ�ɼ�����ʧ�ܴ���
	uint32 u32ErrorCode; // ������
	uint8 u8VoltOk; // �Ѿ��ɼ�����ѹ�����Ѿ�ȷ�ϵ�ѹ�ɼ�����
	tCalibrateParaDef *tCalibratePara;
}tVolSampleCtrlDef;



// ������Ϣ
typedef struct tBatteryInfoDef
{
    uint32 u32Size; // �˽ṹ��Ĵ�С
    tCellInfoDef tCellData[BATTERY_MAX_NUM]; // ������Ϣ
    tVolSampleCtrlDef tVolSampleCtrl; // ��ѹ�ɼ�����
}tBatteryInfoDef;


// ��������
sint8 AcqInit(void);
sint8 AcqDoJob(void);


#endif /* __SETX_ACQ_H */
