
#ifndef __GENERAL_OPER_H
#define __GENERAL_OPER_H

#include "basicdatatype.h"


#define MMIO8(addr) (*(volatile uint8_t *)(addr))
#define VREFINT_Factory_CONV  MMIO8(0x004910)


#define BATTERY_MAX_NUM			2

#define		ADC_VREF		3300
#define		ADC_DATA_MAX	4095

#define		SETX_ADCIN1				0
#define		SETX_ADCIN2				1
#define		SETX_ADCIN3				2
#define		SETX_ADCIN4				3
#define		SETX_ADCIN_GND			4
#define		SETX_ADCIN_REF1V2		5	
#define		SETX_ADCIN_VREFINT		6	




// 校准参数
typedef struct tCalibrateParaDef
{
	float  fSlope; // 斜率
	sint16 s16Intercept; // 截距
}tCalibrateParaDef;


void MsDelay(uint16 u16MsCount);
void UsDelay(uint16 u16MsCount);

uint16 U16Filter(uint16 *pu16Data, uint8 u8Num);
float FloatFilter(float *pfData, uint8 u8Num);

uint16 PubGetU16(unsigned char *pu8In);
void PubPutU16(uint8 *pu8Data, uint16 u16Data);
sint16 PubGetS16(unsigned char *pu8In);
void PubPutS16(uint8 *pu8Data, sint16 s16Data);
uint32 PubGetU32(unsigned char *pu8In);
void PubPutU32(uint8 *pu8In, uint32 u32Data);
float PubGetFloat(unsigned char *pu8In);
void PubPutFloat(uint8 *pu8Data, float fData);

uint16 AdcGeneralAcq(unsigned char u8ADC_chan);
void AdcCaliInit(void);


#endif /* __GENERAL_OPER_H */
