/*********************************************************************
* 内容摘要： //定义通用超时函数使用的结构体与提供的对外的函数
*			 // 
* 其它说明： // 
* 当前版本： // v1.00.001
* 作	者： // 
* 完成日期： // 2017.03.24
* 修改记录1：// 
*	 修改日期：
*	 版 本 号：
*	 修 改 人：
*	 修改内容： 
* 修改记录2:
**********************************************************************/

#ifndef __TIMEOUT_H_
#define __TIMEOUT_H_


/* 头文件包含 */
#include "basicdatatype.h"


#ifdef __cplusplus
extern "C" {
#endif

/* 宏定义 */
#define SWITCH_ON		1
#define SWITCH_OFF		0



/* 数据结构定义 */

//Ms精度的时间结构体
typedef struct tMsTimeDef
{
    uint32 u32Second;
    uint16 u16Msecond;
}tMsTimeDef;


//超时函数控制结构体
typedef struct tMsTimeoutDef
{
	uint8 u8TimerSwitch;
	tMsTimeDef tTimeStart;
	tMsTimeDef tTimeLen;
}tMsTimeoutDef;



/* 函数声明 */
sint32 TimeoutInit(void); //超时这一部分功能初始化
sint32 GetPowerOnTimer(tMsTimeDef *ptMsTime);
sint32 InitMsTimeout(tMsTimeoutDef *ptMsTime, uint32 u32MSecLen);
sint32 InitLongMsTimeout(tMsTimeoutDef *ptMsTimeout, tMsTimeDef tMsTime);
uint32 IsMsTimeout(tMsTimeoutDef *ptMsTime);
sint32 ReadMsTimeOutSwitch(tMsTimeoutDef *ptMsTime);
sint32 SetMsTimeOutSwitch(tMsTimeoutDef *ptMsTime, uint8 u8Switch);
sint32 TimeoutMsDelay(uint32 u32Ms);


#ifdef __cplusplus
}
#endif

#endif /* __TIMEOUT_H_ */
