
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "stm8l15x.h"


#define		ADC_VREF		5000
#define		ADC_DATA_MAX	4096

#if 0
/* 数据结构定义 */
typedef enum {
	SETX_ADCIN1 = 0,
	SETX_ADCIN2,
	SETX_ADCIN3,
	SETX_ADCIN4,
	SETX_ADCIN_GND,
	SETX_ADCIN_REF1V2,
	SETX_ADCIN_MAX_NUM
}setx_adcin_index_def;
#endif

void acq_init(void);
unsigned int adc_general_acq(void);

#endif /* __SETX_ACQ_H */
