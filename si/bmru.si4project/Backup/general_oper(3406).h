
#ifndef __GENERAL_OPER_H
#define __GENERAL_OPER_H

#include "basicdatatype.h"




#define		ADC_VREF		5000
#define		ADC_DATA_MAX	4096

#define		SETX_ADCIN1				0
#define		SETX_ADCIN2				1
#define		SETX_ADCIN3				2
#define		SETX_ADCIN4				3
#define		SETX_ADCIN_GND			4
#define		SETX_ADCIN_REF1V2		5	



// У׼����
typedef struct tCalibrateParaDef
{
	float  fSlope; // б��
	sint16 s16Intercept; // �ؾ�
}tCalibrateParaDef;


void MsDelay(uint16 u16MsCount);
void UsDelay(uint16 u16MsCount);
void AdcInit(unsigned char u8ADC_chan);
unsigned int AdcGeneralAcq(unsigned char u8ADC_chan);

#endif /* __GENERAL_OPER_H */
