
#ifndef __INRS_MEASURE_H
#define __INRS_MEASURE_H

#include "basicdatatype.h"
#include "timeout.h"
#include "general_oper.h"




#define		CHAN_REBACK_CURRENT		SETX_ADCIN4
#define		CHAN_REBACK_VOLT		SETX_ADCIN1

#define INRS_VREF_RS_2V				(11.0)	 // 2Vģ��,����������ص���,11mŷ,�ֱ���0.1uŷ
#define INRS_VREF_RS_12V			(100.0)	 // 12Vģ��,����������ص���,100mŷ,�ֱ���0.1uŷ
#define INRS_MAX_RS					(255.0)	 // �������������,255mŷ,�ֱ���1uŷ
#define INRS_MIN_RS					(0.05)	 // ���������С����,255mŷ,�ֱ���1uŷ




// �����������
typedef struct tInRsCtrlDef
{
	float fInRsAvr[BATTERY_MAX_NUM]; // ��ƽ���������ֵ[����]
	uint8 u8InRsSampleFlag; // �յ��������������ô˱�־
	uint8 u8SampleMode; // ����ģʽ���㲥����ʽ�����뵥������
	tMsTimeoutDef tInRsSampleIntervalTimeout; // ���������ȫ�����ʱ, ��ֹƵ������
	tMsTimeoutDef tInRsSampleSequenceTimeout; // �յ��㲥������������ID���β����ĳ�ʱ
	uint8 u8FailCnt[BATTERY_MAX_NUM]; // �����������ʧ�ܴ���
	uint32 u32ErrorCode; // ������
	uint8 u8InRsMeasureCheckSta;
}tInRsCtrlDef;



sint8 InrsMesurejob(void);
sint8 InrsMesureInit(void);


#endif /* __INRS_MEASURE_H */
