
#include "setx_acq.h"

void acq_init(void)
{
	  /* Enable ADC1 clock */
  CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);
  
  /* Initialise and configure ADC1 */
  ADC_Init(ADC1, ADC_ConversionMode_Continuous, ADC_Resolution_12Bit, ADC_Prescaler_2);
  ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);

  /* Enable ADC1 */
  ADC_Cmd(ADC1, ENABLE);

  ADC_ChannelCmd(ADC1, ADC_Channel_13, ENABLE);

  ADC_SoftwareStartConv(ADC1);
}


unsigned int adc_general_acq(void)
{
	unsigned int u16ADC_data;
	// unsigned int u16volt_data;

	// ADC_Cmd(ADC1, ENABLE);

#if 0	
	switch(eADC_chan)
	{
		case SETX_ADCIN1:
		ADC_ChannelCmd(ADC1, ADC_Channel_18, ENABLE);
		break;
		
		case SETX_ADCIN2:
		ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);
		break;
		
		case SETX_ADCIN3:
		ADC_ChannelCmd(ADC1, ADC_Channel_16, ENABLE);
		break;
		
		case SETX_ADCIN4:
		ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
		break;
		
		case SETX_ADCIN_GND:
		ADC_ChannelCmd(ADC1, ADC_Channel_14, ENABLE);
		break;
		
		case SETX_ADCIN_REF1V2:
		ADC_ChannelCmd(ADC1, ADC_Channel_13, ENABLE);
		break;
		
		default:
		break;
	}
#endif

	// ADC_ChannelCmd(ADC1, ADC_Channel_13, ENABLE);

	// ADC_SoftwareStartConv(ADC1);
  	
    while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
    u16ADC_data = ADC_GetConversionValue(ADC1);

    // u16volt_data = u16ADC_data * ADC_VREF / ADC_DATA_MAX;

    return u16ADC_data;
}