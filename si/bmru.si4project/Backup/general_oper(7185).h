
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "stm8l15x.h"

// ������Ϣ
typedef struct tCellInfoDef
{
	uint16 u16Voltage[VOLTAGE_SAMPLE_NUM]; // ��ѹ
	sint16 s16Temp[VOLTAGE_SAMPLE_NUM]; // �¶�
	float fInRs; // ����
	float fInRsTemp; // �ݴ������������
	uint16 u16VoltageAvr; // �˲���ĵ�ƽ����ѹ
	sint16 s16TempBuf[TEMPERATURE_FILTER_NUM];
}tCellInfoDef;

// ��ѹ��������
typedef struct tVolSampleCtrlDef
{
	tMsTimeoutDef tVolSampleTimeout; // ��ѹ�ɼ���ʱ����ʱ1s
	uint32 u32SampleCnt;
	uint8 u8FailCnt[BATTERY_MAX_NUM]; // ��ѹ�ɼ�����ʧ�ܴ���
	sint32 s32Ref1; // �ο���ѹ1�Ĳɼ�ֵ
	sint32 s32Ref2; // �ο���ѹ2�Ĳɼ�ֵ ,AGND ����ADCת���õ��Ŀ����Ǹ�ֵ
	tAdjustParaDef tAdjustPara;
	uint32 u32ErrorCode; // ������
	uint8 u8VolOk; // �Ѿ��ɼ�����ѹ�����Ѿ�ȷ�ϵ�ѹ�ɼ�����
	uint8 u8SampleFlag; // ��Ҫ������ʼ��ѹ�ɼ��ı��
	tCalibrateParaDef *ptCalibratePara;
}tVolSampleCtrlDef;


// �¶Ȳ�������
typedef struct tTempSampleCtrlDef
{
	uint8 u8Ds18b20Status[TEMPRATURE_MAX_NUM]; // �¶ȴ�������״̬
	uint8 u8TempSampleStatus;  // �¶ȴ������Ĳ���״̬��
	tMsTimeoutDef tTempSampleTimeout; // �¶Ȳ�����ʱ
	tMsTimeoutDef tDSConvertTimeout; // �ȴ�DS18B20ת����ʱ
	uint8 u8FailCnt[TEMPRATURE_MAX_NUM]; // �¶Ȳɼ�����ʧ�ܴ���
	uint32 u32ErrorCode; // ������
	uint8 u8TempOk; // �Ѿ��ɼ����¶ȣ����Ѿ�ȷ���¶Ȳɼ�����
	uint8 u8SampleFlag; // ��Ҫ������ʼ�¶Ȳɼ��ı��
}tTempSampleCtrlDef;



// ������Ϣ
typedef struct tBatteryInfoDef
{
    uint32 u32Size; // �˽ṹ��Ĵ�С
    uint8 u8SampleStatus; // ��ǰ����״̬��״̬��)
    tCellInfoDef tCellData[BATTERY_MAX_NUM]; // ������Ϣ
    tVolSampleCtrlDef tVolSampleCtrl; // ��ѹ�ɼ�����
    tTempSampleCtrlDef tTempSampleCtrl; // �¶Ȳɼ�����
}tBatteryInfoDef;


#define		ADC_VREF		5000
#define		ADC_DATA_MAX	4096

#define		SETX_ADCIN1				0
#define		SETX_ADCIN2				1
#define		SETX_ADCIN3				2
#define		SETX_ADCIN4				3
#define		SETX_ADCIN_GND			4
#define		SETX_ADCIN_REF1V2		5

void Delay(__IO uint16_t nCount);
void AcqInit(unsigned char u8ADC_chan);
unsigned int AdcGeneralAcq(unsigned char u8ADC_chan);

#endif /* __SETX_ACQ_H */
