#include "stm8l15x.h"
#include "general_oper.h"


static uint16 u16ReferAdcValue = 0;

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




/**********************************************************************
* 功能描述： //u16冒泡排序
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint16 *pu16Data 数值
* 输入参数： //uint16 u16Num 数量
* 输出参数： //无
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.01
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
void U16BubbleSort(uint16 *pu16Data, uint16 u16Num)
{
	uint16 i;
	uint16 j;
	uint16 u16Tmp;

    for(i = 0; i < u16Num - 1; i ++)
    {
        for(j = 0; j < u16Num -i -1; j ++)
        {
            if(pu16Data[j + 1] < pu16Data[j])
            {
				u16Tmp = pu16Data[j + 1];
				pu16Data[j + 1] = pu16Data[j];
				pu16Data[j] = u16Tmp;
			}
        }
    }
}


/**********************************************************************
* 功能描述： //u32冒泡排序
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint32 *pu32Data 数值
* 输入参数： //uint16 u16Num 数量
* 输出参数： //无
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.01
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
void S32BubbleSort(sint32 *ps32Data, uint16 u16Num)
{
	uint16 i;
	uint16 j;
	sint32 s32Tmp;

    for(i = 0; i < u16Num - 1; i ++)
    {
        for(j = 0; j < u16Num -i -1; j ++)
        {
            if(ps32Data[j + 1] < ps32Data[j])
            {
				s32Tmp = ps32Data[j + 1];
				ps32Data[j + 1] = ps32Data[j];
				ps32Data[j] = s32Tmp;
			}
        }
    }
}


/**********************************************************************
* 功能描述： //float冒泡排序
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint32 *pu32Data 数值
* 输入参数： //uint16 u16Num 数量
* 输出参数： //无
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.01
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
void fBubbleSort(float *pfData, uint16 u16Num)
{
	uint16 i;
	uint16 j;
	float fTmp;

    for(i = 0; i < u16Num - 1; i ++)
    {
        for(j = 0; j < u16Num -i -1; j ++)
        {
            if(pfData[j + 1] < pfData[j])
            {
				fTmp = pfData[j + 1];
				pfData[j + 1] = pfData[j];
				pfData[j] = fTmp;
			}
        }
    }
}



/**********************************************************************
* 功能描述： //求平均
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint16 arr[] 数值
* 输入参数： //uint16 n 数量
* 输出参数： //无
* 返回参数： //uint16
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.01
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
uint16 U16Average(uint16 arr[], uint16 n)
{
	uint16 i;
	uint32 u32Tmp;

	u32Tmp = 0;
    for(i = 0; i < n; i ++)
    {
		u32Tmp += (uint32)arr[i];
    }

	return (uint16)(u32Tmp / n);
}

/**********************************************************************
* 功能描述： //求平均
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint32 arr[] 数值
* 输入参数： //uint16 n 数量
* 输出参数： //无
* 返回参数： //sint32
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.01
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
sint32 S32Average(sint32 arr[], uint16 n)
{
	uint16 i;
	sint32 s32Tmp;

	s32Tmp = 0;
    for(i = 0; i < n; i ++)
    {
		s32Tmp += arr[i];
    }

	return (s32Tmp / n);
}



/**********************************************************************
* 功能描述： //求平均
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint32 arr[] 数值
* 输入参数： //uint16 n 数量
* 输出参数： //无
* 返回参数： //sint32
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.01
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
float fAverage(float arr[], uint16 n)
{
	uint16 i;
	float fTmp;

	fTmp = 0;
    for(i = 0; i < n; i ++)
    {
		fTmp += arr[i];
    }

	return (fTmp / n);
}



uint16 U16Filter(uint16 *pu16Data, uint8 u8Num)
{
	uint16 u16Data;
	
	U16BubbleSort(pu16Data, u8Num);
	u16Data = U16Average(pu16Data, (uint16)u8Num);
	
	return u16Data;
}


float FloatFilter(float *pf16Data, uint8 u8Num)
{
	float fData;
	
	fBubbleSort(pf16Data, u8Num);
	fData = fAverage(pf16Data, (uint16)u8Num);
	
	return fData;
}


uint16 PubGetU16(unsigned char *pu8In)
{
	// return (pu8In[0] << 8 | pu8In[1]);
	return *((uint16 *)pu8In);
}

void PubPutU16(uint8 *pu8Data, uint16 u16Data)
{

	pu8Data[0] = (u16Data >> 8) & 0x00FF ;
	pu8Data[1] = u16Data & 0x00FF ;
}


sint16 PubGetS16(unsigned char *pu8In)
{
	// return (pu8In[0] << 8 | pu8In[1]);
	return *((sint16 *)pu8In);
}

void PubPutS16(uint8 *pu8Data, sint16 s16Data)
{

	pu8Data[0] = (s16Data >> 8) & 0x00FF ;
	pu8Data[1] = s16Data & 0x00FF ;
}

/**********************************************************************
* 功能描述:从数组中获取32位数据
* 访问的表:
* 修改的表:
* 输入参数:pu8In:提取数据的数组源
* 输出参数:
* 返 回 值:uint32：输出数据
* 其它说明:
* 修改记录1:
*    修改日期:
*    版 本 号:
*    修 改 人:
*    修改内容:
***********************************************************************/
uint32 PubGetU32(unsigned char *pu8In)
{
#ifdef SAIER_LITTLE_ENDIAN
	return ((((uint32)pu8In[3]) << 24) | (((uint32)pu8In[2]) << 16) | (((uint32)pu8In[1]) << 8) | ((uint32)pu8In[0]));
#else
	return ((((uint32)pu8In[0]) << 24) | (((uint32)pu8In[1]) << 16) | (((uint32)pu8In[2]) << 8) | ((uint32)pu8In[3]));
#endif
}


/**********************************************************************
* 功能描述:将32位数据存入数组
* 输入参数:u32Data:需要放的数据
* 输出参数:pu8In：拆分后的数据放置指针
* 返 回 值:
* 其它说明:
* 修改记录1:
*    修改日期:
*    版 本 号:
*    修 改 人:
*    修改内容:
***********************************************************************/
void PubPutU32(uint8 *pu8In, uint32 u32Data)
{
#ifdef SAIER_LITTLE_ENDIAN
	pu8In[3] = (uint8)((u32Data >> 24) & 0x000000ff);
	pu8In[2] = (uint8)((u32Data >> 16) & 0x000000ff);
	pu8In[1] = (uint8)((u32Data >> 8) & 0x000000ff);
	pu8In[0] = (uint8)(u32Data & 0x000000ff);
#else
	pu8In[0] = (uint8)((u32Data >> 24) & 0x000000ff);
	pu8In[1] = (uint8)((u32Data >> 16) & 0x000000ff);
	pu8In[2] = (uint8)((u32Data >> 8) & 0x000000ff);
	pu8In[3] = (uint8)(u32Data & 0x000000ff);
#endif
}


/**********************************************************************
* 功能描述:从数组中获取浮点数
* 访问的表:
* 修改的表:
* 输入参数:pu8In:提取数据的数组源
* 输出参数:
* 返 回 值:float：输出数据
* 其它说明:
* 修改记录1:
*    修改日期:
*    版 本 号:
*    修 改 人:
*    修改内容:
***********************************************************************/
float PubGetFloat(unsigned char *pu8In)
{
	union
	{
		unsigned char u8Tmp[4];
		float fTmp;
	} uData;

#ifdef SAIER_LITTLE_ENDIAN
	uData.u8Tmp[3] = pu8In[3];
	uData.u8Tmp[2] = pu8In[2];
	uData.u8Tmp[1] = pu8In[1];
	uData.u8Tmp[0] = pu8In[0];
#else
	uData.u8Tmp[0] = pu8In[0];
	uData.u8Tmp[1] = pu8In[1];
	uData.u8Tmp[2] = pu8In[2];
	uData.u8Tmp[3] = pu8In[3];
#endif

	return uData.fTmp;
}


void PubPutFloat(uint8 *pu8Data, float fData)
{
	union
	{
		unsigned char u8Data[4];
		float fData;
	} uData;

	uData.fData = fData;

	pu8Data[0] = uData.u8Data[0];
	pu8Data[1] = uData.u8Data[1];
	pu8Data[2] = uData.u8Data[2];
	pu8Data[3] = uData.u8Data[3];
}



static void AdcInit(unsigned char u8AdcChan)
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

	UsDelay(0x100);
	
	ADC_SoftwareStartConv(ADC1);
}


uint16 AdcGeneralAcq(uint8 u8AdcChan)
{
	uint16 u16AdcData;
	uint32 u32VoltData;

	AdcInit(u8AdcChan);
  	
    while (ADC_GetFlagStatus(ADC1, ADC_FLAG_EOC) == RESET);
    u16AdcData = ADC_GetConversionValue(ADC1);
    ADC_ClearFlag(ADC1, ADC_FLAG_EOC);
    ADC_ClearITPendingBit(ADC1, ADC_FLAG_EOC);

    ADC_Cmd(ADC1, DISABLE);
    ADC_DeInit(ADC1);

	u32VoltData = (uint32)u16AdcData;
    u32VoltData = (u16AdcData * 1225) / u16ReferAdcValue;
    
    return (uint16)u32VoltData;
}



void AdcCaliInit(void)
{

	u16ReferAdcValue == AdcGeneralAcq(SETX_ADCIN_REF1V2);
}



