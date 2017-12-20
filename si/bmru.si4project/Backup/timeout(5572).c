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
#include <asf.h>
#include "basicdatatype.h"
#include "timeout.h"


/*����ȫ�ֱ��� */
static uint32 u32TimerCount;
static struct tc_module tc_instance;


#define TC_COUNT_VALUE 			55535
#define TC_TIMEOUT_INSTANT 		TC3

/* ����ʵ�� */

static uint32 GetTimerCount(void)
{
    return u32TimerCount;
}


// �����������жϼ�������λ
//! [callback_funcs]
static void tc_callback_to_second(struct tc_module *const module_inst)
{
	u32TimerCount ++; 
}
//! [callback_funcs]


//! [setup]
static void configure_tc(void)
{
	//! [setup_config]
	struct tc_config config_tc;
	//! [setup_config]
	//! [setup_config_defaults]
	tc_get_config_defaults(&config_tc);
	//! [setup_config_defaults]

	//! [setup_change_config]
	config_tc.counter_size = TC_COUNTER_SIZE_16BIT;
	config_tc.clock_source = GCLK_GENERATOR_1;
	config_tc.clock_prescaler = TC_CLOCK_PRESCALER_DIV16;
	// config_tc.counter_16_bit.period = 100;
	// config_tc.counter_16_bit.compare_capture_channel[0] = 50;
	// config_tc.counter_16_bit.compare_capture_channel[1] = 54;
	//! [setup_change_config]

	//! [setup_set_config]
	tc_init(&tc_instance, TC_TIMEOUT_INSTANT, &config_tc);
	//! [setup_set_config]

	//! [setup_enable]
	tc_enable(&tc_instance);
	//! [setup_enable]
}

static void configure_tc_callbacks(void)
{
	//! [setup_register_callback]
	tc_register_callback(&tc_instance, tc_callback_to_second,
			TC_CALLBACK_OVERFLOW);
	#if 0
	tc_register_callback(&tc_instance, tc_callback_to_second,
			TC_CALLBACK_CC_CHANNEL0);
	tc_register_callback(&tc_instance, tc_callback_to_second,
			TC_CALLBACK_CC_CHANNEL1);
	#endif
	//! [setup_register_callback]

	//! [setup_enable_callback]
	tc_enable_callback(&tc_instance, TC_CALLBACK_OVERFLOW);
	// tc_enable_callback(&tc_instance, TC_CALLBACK_CC_CHANNEL0);
	// tc_enable_callback(&tc_instance, TC_CALLBACK_CC_CHANNEL1);
	//! [setup_enable_callback]
}


/**********************************************************************
* ���������� //��ʼ����ʱ����
* ���ʵı� //��
* �޸ĵı� //��
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
	
	configure_tc();
	configure_tc_callbacks();
	
	return 0;
}


/**********************************************************************
* ���������� //��ȡ�ϵ�ʱ��
* ���ʵı� //��
* �޸ĵı� //��
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
	uint16 u16Tmp1;
	uint32 u32Tmp1;
    uint32 u32Tmp2;
    
   	// HT_TMR0->TMRIE &= 0xFE;	
    u32Tmp1 = tc_get_count_value(&tc_instance);
    if(0x10000 > u32Tmp1)
    {
    	u16Tmp1 = u32Tmp1;
    }
    else
    {
    	while(1);
    }
    u32Tmp2 = GetTimerCount();
    
		
    // HT_TMR0->TMRIE |= 0x01;	
    
	ptMsTime->u32Second = u32Tmp2 * 60 + u16Tmp1 / 1000;
	ptMsTime->u16Msecond = u16Tmp1 % 1000;
	
	return 0;
}



/**********************************************************************
* ���������� //��ʼ����ʱ��,�49��
* ���ʵı� //��
* �޸ĵı� //��
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
* ���ʵı� //��
* �޸ĵı� //��
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
* ���ʵı� //��
* �޸ĵı� //��
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
* ���ʵı� //��
* �޸ĵı� //��
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
* ���ʵı� //��
* �޸ĵı� //��
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
* ���ʵı� //��
* �޸ĵı� //��
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
sint32 MsDelay(uint32 u32Ms)
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
