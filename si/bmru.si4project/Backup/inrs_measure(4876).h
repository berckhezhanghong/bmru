
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "stm8l15x.h"


#define		ADC_VREF		5000
#define		ADC_DATA_MAX	4096

#define		SETX_ADCIN1				0
#define		SETX_ADCIN2				1
#define		SETX_ADCIN3				2
#define		SETX_ADCIN4				3
#define		SETX_ADCIN_GND			4
#define		SETX_ADCIN_REF1V2		5

void Delay(__IO uint16_t nCount);
void acq_init(unsigned char u8ADC_chan);
unsigned int adc_general_acq(unsigned char u8ADC_chan);

#endif /* __SETX_ACQ_H */
