
#include "setx_acq.h"

/**
  * @brief  Inserts a delay time.
  * @param  nCount: specifies the delay time length.
  * @retval None
  */
void Delay(__IO uint16_t nCount)
{
  /* Decrement nCount value */
  while (nCount != 0)
  {
    nCount--;
  }
}


void acq_init(unsigned char u8ADC_chan)
{
	 /* Enable ADC1 clock */
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);

	/* Initialise and configure ADC1 */
	ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_2);
	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);

	/* Enable ADC1 */
	ADC_Cmd(ADC1, ENABLE);

	if(SETX_ADCIN1 == u8ADC_chan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_18, ENABLE);
	}
	else if(SETX_ADCIN2 == u8ADC_chan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);
	}
	else if(SETX_ADCIN3 == u8ADC_chan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_16, ENABLE);
	}
	else if(SETX_ADCIN4 == u8ADC_chan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_14, ENABLE);
	}
	else if(SETX_ADCIN_GND == u8ADC_chan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
	}
	else if(SETX_ADCIN_REF1V2 == u8ADC_chan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_13, ENABLE);
	}

	ADC_SoftwareStartConv(ADC1);
}


unsigned int adc_general_acq(unsigned char u8ADC_chan)
{
	unsigned int u16ADC_data;
	unsigned int u16volt_data;

	acq_init(u8ADC_chan);

	Delay(0x1000);
  	
    while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
    u16ADC_data = ADC_GetConversionValue(ADC1);
    ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
    ADC_ClearITPendingBit(ADC1, ADC_FLAG_EOC);

    ADC_Cmd(ADC1, DISABLE);

    u16volt_data = (unsigned int)(((unsigned long int)u16ADC_data) * ADC_VREF / ADC_DATA_MAX);

    return u16volt_data;
}
