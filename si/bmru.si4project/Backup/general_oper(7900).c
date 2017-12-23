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
* ���������� //u16ð������
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //uint16 *pu16Data ��ֵ
* ��������� //uint16 u16Num ����
* ��������� //��
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.01
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
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
* ���������� //u32ð������
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //uint32 *pu32Data ��ֵ
* ��������� //uint16 u16Num ����
* ��������� //��
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.01
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
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
* ���������� //floatð������
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //uint32 *pu32Data ��ֵ
* ��������� //uint16 u16Num ����
* ��������� //��
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.01
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
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
* ���������� //��ƽ��
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //uint16 arr[] ��ֵ
* ��������� //uint16 n ����
* ��������� //��
* ���ز����� //uint16
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.01
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
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
* ���������� //��ƽ��
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //uint32 arr[] ��ֵ
* ��������� //uint16 n ����
* ��������� //��
* ���ز����� //sint32
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.01
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
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
* ���������� //��ƽ��
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //uint32 arr[] ��ֵ
* ��������� //uint16 n ����
* ��������� //��
* ���ز����� //sint32
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.01
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
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
* ��������:�������л�ȡ32λ����
* ���ʵı�:
* �޸ĵı�:
* �������:pu8In:��ȡ���ݵ�����Դ
* �������:
* �� �� ֵ:uint32���������
* ����˵��:
* �޸ļ�¼1:
*    �޸�����:
*    �� �� ��:
*    �� �� ��:
*    �޸�����:
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
* ��������:��32λ���ݴ�������
* �������:u32Data:��Ҫ�ŵ�����
* �������:pu8In����ֺ�����ݷ���ָ��
* �� �� ֵ:
* ����˵��:
* �޸ļ�¼1:
*    �޸�����:
*    �� �� ��:
*    �� �� ��:
*    �޸�����:
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
* ��������:�������л�ȡ������
* ���ʵı�:
* �޸ĵı�:
* �������:pu8In:��ȡ���ݵ�����Դ
* �������:
* �� �� ֵ:float���������
* ����˵��:
* �޸ļ�¼1:
*    �޸�����:
*    �� �� ��:
*    �� �� ��:
*    �޸�����:
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



