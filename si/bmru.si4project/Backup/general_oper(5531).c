#include "stm8l15x.h"
#include "general_oper.h"


void UsDelay(uint16 u16MsCount)
{	
	while (u16MsCount != 0)
	{
		u16MsCount--;
		nop();
		nop();
		nop();
		nop();
		nop();
		nop();
		nop();
	}
}


void MsDelay(uint16 u16MsCount)
{
	while (u16MsCount != 0)
	{
		u16MsCount--;
		UsDelay(1190);
	}
}


void AdcInit(unsigned char u8AdcChan)
{
	 /* Enable ADC1 clock */
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);

	/* Initialise and configure ADC1 */
	ADC_Init(ADC1, ADC_ConversionMode_Single, ADC_Resolution_12Bit, ADC_Prescaler_2);
	ADC_SamplingTimeConfig(ADC1, ADC_Group_SlowChannels, ADC_SamplingTime_384Cycles);

	/* Enable ADC1 */
	ADC_Cmd(ADC1, ENABLE);

	if(SETX_ADCIN1 == u8AdcChan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_18, ENABLE);
	}
	else if(SETX_ADCIN2 == u8AdcChan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_17, ENABLE);
	}
	else if(SETX_ADCIN3 == u8AdcChan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_16, ENABLE);
	}
	else if(SETX_ADCIN4 == u8AdcChan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_14, ENABLE);
	}
	else if(SETX_ADCIN_GND == u8AdcChan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_15, ENABLE);
	}
	else if(SETX_ADCIN_REF1V2 == u8AdcChan)
	{
		ADC_ChannelCmd(ADC1, ADC_Channel_13, ENABLE);
	}
	else if(SETX_ADCIN_VREFINT == u8AdcChan)
	{
		ADC_VrefintCmd(ENABLE);
		ADC_ChannelCmd(ADC1, ADC_Channel_Vrefint, ENABLE);
	}

	UsDelay(0x1000);
	
	ADC_SoftwareStartConv(ADC1);
}


unsigned int AdcGeneralAcq(unsigned char u8AdcChan)
{
	unsigned int u16AdcData;
	unsigned int u16VoltData;

	AdcInit(u8AdcChan);
  	
    while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
    u16AdcData = ADC_GetConversionValue(ADC1);
    ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
    ADC_ClearITPendingBit(ADC1, ADC_FLAG_EOC);

    ADC_Cmd(ADC1, DISABLE);
    ADC_DeInit(ADC1);

    u16VoltData = (unsigned int)(((unsigned long int)u16AdcData) * ADC_VREF / ADC_DATA_MAX);
    // u16VoltData = u16AdcData;

    return u16VoltData;
}
