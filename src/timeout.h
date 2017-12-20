/*********************************************************************
* ����ժҪ�� //����ͨ�ó�ʱ����ʹ�õĽṹ�����ṩ�Ķ���ĺ���
*			 // 
* ����˵���� // 
* ��ǰ�汾�� // v1.00.001
* ��	�ߣ� // 
* ������ڣ� // 2017.03.24
* �޸ļ�¼1��// 
*	 �޸����ڣ�
*	 �� �� �ţ�
*	 �� �� �ˣ�
*	 �޸����ݣ� 
* �޸ļ�¼2:
**********************************************************************/

#ifndef __TIMEOUT_H_
#define __TIMEOUT_H_


/* ͷ�ļ����� */
#include "basicdatatype.h"


#ifdef __cplusplus
extern "C" {
#endif

/* �궨�� */
#define SWITCH_ON		1
#define SWITCH_OFF		0



/* ���ݽṹ���� */

//Ms���ȵ�ʱ��ṹ��
typedef struct tMsTimeDef
{
    uint32 u32Second;
    uint16 u16Msecond;
}tMsTimeDef;


//��ʱ�������ƽṹ��
typedef struct tMsTimeoutDef
{
	uint8 u8TimerSwitch;
	tMsTimeDef tTimeStart;
	tMsTimeDef tTimeLen;
}tMsTimeoutDef;



/* �������� */
sint32 TimeoutInit(void); //��ʱ��һ���ֹ��ܳ�ʼ��
sint32 GetPowerOnTimer(tMsTimeDef *ptMsTime);
sint32 InitMsTimeout(tMsTimeoutDef *ptMsTime, uint32 u32MSecLen);
sint32 InitLongMsTimeout(tMsTimeoutDef *ptMsTimeout, tMsTimeDef tMsTime);
uint32 IsMsTimeout(tMsTimeoutDef *ptMsTime);
sint32 ReadMsTimeOutSwitch(tMsTimeoutDef *ptMsTime);
sint32 SetMsTimeOutSwitch(tMsTimeoutDef *ptMsTime, uint8 u8Switch);
sint32 TimeoutMsDelay(uint32 u32Ms);


#ifdef __cplusplus
}
#endif

#endif /* __TIMEOUT_H_ */
