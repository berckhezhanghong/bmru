/*********************************************************************
* 内容摘要： // 超时相关控制
*            // 
* 其它说明： // 
* 当前版本： // v1.00.001
* 作    者： // 
* 完成日期： // 2017.07.24
* 修改记录1：// 
*    修改日期：
*    版 本 号：
*    修 改 人：
*    修改内容： 
* 修改记录2:
**********************************************************************/

/* 头文件包含 */
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "timeout.h"


/*定义全局变量 */
static uint32 u32TimerCount;
/* 函数实现 */

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
// 计数器满，中断计数更高位
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
* 功能描述： //初始化超时功能
* 访问的表： //无
* 修改的表： //无
* 输入参数： //无
* 输出参数： //无
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
***********************************************************************/
sint32 TimeoutInit(void)
{
	u32TimerCount = 0;
	
	ConfigureTc();
	
	return 0;
}


/**********************************************************************
* 功能描述： //获取上电时间
* 访问的表： //无
* 修改的表： //无
* 输入参数： //无
* 输出参数： //uint64 上电时间，单位MS
* 返回参数： //sint32 成功0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
***********************************************************************/
sint32 GetPowerOnTimer(tMsTimeDef *ptMsTime)
{
	uint8 u16TimerValue;
    uint32 u32CountValue;
    
    u16TimerValue = TIM4_GetCounter();
    u32CountValue = GetTimerCount();
	
	ptMsTime->u32Second = u32CountValue / (1000 / TIMEOUT_TIMER_PERIOD);
	ptMsTime->u16Msecond = (u32CountValue % (1000 / TIMEOUT_TIMER_PERIOD)) * TIMEOUT_TIMER_PERIOD + u16TimerValue;
	
	return 0;
}



/**********************************************************************
* 功能描述： //初始化定时器,最长49天
* 访问的表： //无
* 修改的表： //无
* 输入参数： //tMsTimeOutDef *ptMsTime 定时参数
*			 //uint32 u32MSecLen 定时时间长度
* 输出参数： //无
* 返回参数： //sint32 成功0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
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
* 功能描述： //初始化定时器,最长136年
* 访问的表： //无
* 修改的表： //无
* 输入参数： //tMsTimeOutDef *ptMsTime 定时参数
*			 //tMsTimeDef tMsTime 定时长度
* 输出参数： //无
* 返回参数： //sint32 成功0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
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
* 功能描述： //读取定时器开启状态
* 访问的表： //无
* 修改的表： //无
* 输入参数： //tMsTimeOutDef *ptMsTime 定时参数
* 输出参数： //无
* 返回参数： //sint32 成功0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
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
* 功能描述： //设置定时器开启状态
* 访问的表： //无
* 修改的表： //无
* 输入参数： //tMsTimeOutDef *ptMsTime 定时参数
*			 //uint8 u8Switch 开关状态
* 输出参数： //无
* 返回参数： //sint32 成功0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
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
* 功能描述： //检查定时器时间是否到
* 访问的表： //无
* 修改的表： //无
* 输入参数： //tMsTimeOutDef *ptMsTime 定时参数
* 输出参数： //无
* 返回参数： //uint32 时间到 1 未到 0
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
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

	if(SWITCH_OFF == ptMsTimeout->u8TimerSwitch)//开关必须打开才能判断超时
	{
		return 0;
	}


	u32Tmp =  (uint32)ptMsTimeout->tTimeLen.u16Msecond + (uint32)ptMsTimeout->tTimeStart.u16Msecond;
	if(999 < u32Tmp) // 毫秒有进位
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
* 功能描述： //使用超时定时器的Ms延时
* 访问的表： //无
* 修改的表： //无
* 输入参数： //tMsTimeOutDef *ptMsTime 定时参数
* 输出参数： //无
* 返回参数： //sint32 参数错误返回-1，超时时间到返回1，否则返回0
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2017.03.24
*   版 本 号：v1.00.001
*   修 改 人：  
*   修改内容：
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