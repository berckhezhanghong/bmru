/*********************************************************************
* ����ժҪ�� // ��ʱ��ؿ���
*            // 
* ����˵���� // 
* ��ǰ�汾�� // v1.00.001
* ��    �ߣ� // 
* ������ڣ� // 2017.07.24
* �޸ļ�¼1��// 
*    �޸����ڣ�
*    �� �� �ţ�
*    �� �� �ˣ�
*    �޸����ݣ� 
* �޸ļ�¼2:
**********************************************************************/

/* ͷ�ļ����� */
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "timeout.h"


/*����ȫ�ֱ��� */
static uint32 u32TimerCount;
/* ����ʵ�� */

static uint32 GetTimerCount(void)
{
    return u32TimerCount;
}


INTERRUPT void TIM4_OVF_RQHandler(void)
{
	TIM4_ClearITPendingBit((TIM4_IT_Update | TIM4_IT_Trigger));
	u32TimerCount ++;
}


#define	TIMEOUT_TIMER_PERIOD		200
// �����������жϼ�������λ
static void ConfigureTc(void)
{
	CLK_PeripheralClockConfig(CLK_Peripheral_TIM4, ENABLE);
    TIM4_DeInit();
    TIM4_TimeBaseInit(TIM4_Prescaler_16384, TIMEOUT_TIMER_PERIOD);
    TIM4_ARRPreloadConfig(ENABLE);
    TIM4_ITConfig(TIM1_IT_Update, ENABLE);
    TIM4_Cmd(ENABLE);
    enableInterrupts();
}


/**********************************************************************
* ���������� //��ʼ����ʱ����
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //��
* ��������� //��
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
sint32 TimeoutInit(void)
{
	u32TimerCount = 0;
	
	ConfigureTc();
	
	return 0;
}


/**********************************************************************
* ���������� //��ȡ�ϵ�ʱ��
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //��
* ��������� //uint64 �ϵ�ʱ�䣬��λMS
* ���ز����� //sint32 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
sint32 GetPowerOnTimer(tMsTimeDef *ptMsTime)
{
	uint8 u16TimerValue;
    uint32 u32CountValue;
    
    u16TimerValue = TIM4_GetCounter();
    u32CountValue = GetTimerCount();
	
	ptMsTime->u32Second = u32CountValue / (1000 / TIMEOUT_TIMER_PERIOD);
	ptMsTime->u16Msecond = (u32CountValue % (1000 / TIMEOUT_TIMER_PERIOD)) * (1000 / TIMEOUT_TIMER_PERIOD) + u16TimerValue;
	
	return 0;
}



/**********************************************************************
* ���������� //��ʼ����ʱ��,�49��
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //tMsTimeOutDef *ptMsTime ��ʱ����
*			 //uint32 u32MSecLen ��ʱʱ�䳤��
* ��������� //��
* ���ز����� //sint32 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
sint32 InitMsTimeout(tMsTimeoutDef *ptMsTimeout, uint32 u32MSecLen)
{
	
	if(NULL == ptMsTimeout)
	{
		return -1;
	}
	
	GetPowerOnTimer(&ptMsTimeout->tTimeStart);
	ptMsTimeout->tTimeLen.u32Second= u32MSecLen / 1000;
	ptMsTimeout->tTimeLen.u16Msecond= u32MSecLen % 1000;
	ptMsTimeout->u8TimerSwitch = SWITCH_ON;
	
	return 0;
}


/**********************************************************************
* ���������� //��ʼ����ʱ��,�136��
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //tMsTimeOutDef *ptMsTime ��ʱ����
*			 //tMsTimeDef tMsTime ��ʱ����
* ��������� //��
* ���ز����� //sint32 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
sint32 InitLongMsTimeout(tMsTimeoutDef *ptMsTimeout, tMsTimeDef tMsTime)
{
	
	if(NULL == ptMsTimeout)
	{
		return -1;
	}
	
	GetPowerOnTimer(&ptMsTimeout->tTimeStart);
	ptMsTimeout->tTimeLen.u32Second = tMsTime.u32Second;
	ptMsTimeout->tTimeLen.u16Msecond = tMsTime.u16Msecond;
	ptMsTimeout->u8TimerSwitch = SWITCH_ON;
	
	return 0;
}


/**********************************************************************
* ���������� //��ȡ��ʱ������״̬
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //tMsTimeOutDef *ptMsTime ��ʱ����
* ��������� //��
* ���ز����� //sint32 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
sint32 ReadMsTimeOutSwitch(tMsTimeoutDef *ptMsTimeout)
{
	if(NULL == ptMsTimeout)
	{
		return -1;
	}
	if(SWITCH_ON == ptMsTimeout->u8TimerSwitch)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}


/**********************************************************************
* ���������� //���ö�ʱ������״̬
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //tMsTimeOutDef *ptMsTime ��ʱ����
*			 //uint8 u8Switch ����״̬
* ��������� //��
* ���ز����� //sint32 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
sint32 SetMsTimeOutSwitch(tMsTimeoutDef *ptMsTimeout, uint8 u8Switch)
{
	if((NULL == ptMsTimeout) || ((SWITCH_ON != u8Switch) && (SWITCH_OFF != u8Switch)))
	{
		return -1;
	}
	ptMsTimeout->u8TimerSwitch = u8Switch;
	return 0;
}


/**********************************************************************
* ���������� //��鶨ʱ��ʱ���Ƿ�
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //tMsTimeOutDef *ptMsTime ��ʱ����
* ��������� //��
* ���ز����� //uint32 ʱ�䵽 1 δ�� 0
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
uint32 IsMsTimeout(tMsTimeoutDef *ptMsTimeout)
{
	tMsTimeDef tMsTimeTmp1;
	tMsTimeDef tMsTimeTmp2;
	uint32 u32Tmp;
	
	if((NULL == ptMsTimeout))
	{
		return 0;
	}

	if(SWITCH_OFF == ptMsTimeout->u8TimerSwitch)//���ر���򿪲����жϳ�ʱ
	{
		return 0;
	}


	u32Tmp =  (uint32)ptMsTimeout->tTimeLen.u16Msecond + (uint32)ptMsTimeout->tTimeStart.u16Msecond;
	if(999 < u32Tmp) // �����н�λ
	{
		tMsTimeTmp1.u32Second = ptMsTimeout->tTimeStart.u32Second + ptMsTimeout->tTimeLen.u32Second + 1;
	}
	else
	{
		tMsTimeTmp1.u32Second = ptMsTimeout->tTimeStart.u32Second + ptMsTimeout->tTimeLen.u32Second;
	}
	tMsTimeTmp1.u16Msecond = (ptMsTimeout->tTimeStart.u16Msecond + ptMsTimeout->tTimeLen.u16Msecond) % 1000;


	GetPowerOnTimer(&tMsTimeTmp2);
	if(tMsTimeTmp1.u32Second < tMsTimeTmp2.u32Second)
	{
		ptMsTimeout->u8TimerSwitch = SWITCH_OFF;
		return 1;
	}
	else if(tMsTimeTmp1.u32Second == tMsTimeTmp2.u32Second)
	{
		if(tMsTimeTmp1.u16Msecond <= tMsTimeTmp2.u16Msecond)
		{
			ptMsTimeout->u8TimerSwitch = SWITCH_OFF;
			return 1;
		}
	}
	else
	{
		return 0;
	}
    
    return 0;
}


/**********************************************************************
* ���������� //ʹ�ó�ʱ��ʱ����Ms��ʱ
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //tMsTimeOutDef *ptMsTime ��ʱ����
* ��������� //��
* ���ز����� //sint32 �������󷵻�-1����ʱʱ�䵽����1�����򷵻�0
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2017.03.24
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�  
*   �޸����ݣ�
***********************************************************************/
sint32 TimeoutMsDelay(uint32 u32Ms)
{
	tMsTimeoutDef tMsTimeout;

	InitMsTimeout(&tMsTimeout, u32Ms);

	while(1)
	{
		if(1 == IsMsTimeout(&tMsTimeout))
		{
			return 0;
		}
	}
}