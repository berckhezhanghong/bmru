/*********************************************************************
* 内容摘要： // 调试使用的函数
*            //
* 其它说明： //
* 当前版本： // v1.00.001
* 作    者： //
* 完成日期： // 2015.06.26
* 修改记录1：//
*    修改日期：
*    版 本 号：
*    修 改 人：
*    修改内容：
* 修改记录2:
**********************************************************************/


/* 头文件包含 */
#include <string.h>
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "debug.h"
#include "setx_uart.h"




/* 定义全局变量 */
tDebugParaDef tDebugPara;

uint8  DebugBuf[DEBUG_PRINTF_BUFFER_LEN];//打印buffer


/* 函数实现 */

/**********************************************************************
* 功能描述： // 获取调试信息参数
* 访问的表： //无
* 修改的表： //无
* 输入参数： //无
* 输出参数： //无
* 输出参数： //无
* 返回参数： //tDebugParaDef *调试信息参数
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2012.07.19
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
tDebugParaDef *GetDebugPara(void)
{
	return &tDebugPara;
}


/**********************************************************************
* 功能描述： // 调试功能初始化
* 访问的表： //无
* 修改的表： //无
* 输入参数： //无
* 输出参数： //无
* 输出参数： //无
* 返回参数： //sint8 成功0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2015.12.10
*   版 本 号：v1.04
*   修 改 人：
*   修改内容：
***********************************************************************/
sint8 DebugInit(void)
{
	tDebugPara.u8DebugSwitch = DEBUG_SWITCH_ON; // 代码调试时ON,发行版本为OFF
	tDebugPara.u8DebugLevel = DEBUG_LEVEL_4;  // 默认调试输出数据

	// 注意，不管开关是否打开，调试输出都初始硬件化一下，
	// 这样在运行过程中可以通过命令打开或关闭调试输出
	if(CONSOLE_PORT_UART0 == CONSOLE_PORT)
	{
		// 如果用uart1做调试，在正常流程中uart已经打开，无需再操作
		;
	}
	else if(CONSOLE_PORT_UART1 == CONSOLE_PORT)
	{

	}
	
    return 0;
}

/**********************************************************************
* 功能描述： // 输出字符串debug信息
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint8 u8DebugLevel 日志输出等级
* 输入参数： //uint8 *pu8Str 要输出的字符串
* 输出参数： //无
* 返回参数： //sint8 成功0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
sint8 DebugStrOutput(uint8 u8DebugLevel, const uint8 *pu8Str)
{
    if(NULL == pu8Str)
    {
        return -1;
    }

	if(!tDebugPara.u8DebugSwitch)
	{
		// 调试开关关闭
		return 0;
	}

	if(tDebugPara.u8DebugLevel < u8DebugLevel)
	{
		// 不在输出等级范围内
		return 0;
	}

	if(CONSOLE_PORT_UART0 == CONSOLE_PORT)
	{
		UpUartSendStr(pu8Str, strlen(pu8Str));
	}
	else if(CONSOLE_PORT_UART1 == CONSOLE_PORT)
	{

	}

	return 0;
}

