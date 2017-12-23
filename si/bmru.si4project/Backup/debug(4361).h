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

#ifndef DEBUG_H_
#define DEBUG_H_

/* 头文件包含 */
#include "basicdatatype.h"

/* 宏定义 */

#define DEBUG_PRINTF                1 // 打印代码编译开关
#define DEBUG_PRINTF_BUFFER_LEN     60  //打印缓冲区长度


#define CONSOLE_PORT_UART0			11
#define CONSOLE_PORT_UART1			12


#define CONSOLE_PORT				CONSOLE_PORT_UART0

#define DEBUG_SWITCH_ON				1 // 调试输出开关
#define DEBUG_SWITCH_OFF			0 // 调试输出开关

#define DEBUG_LEVEL_0				0 // 调试输出等级0,即部署出
#define DEBUG_LEVEL_1				1 // 调试输出等级1,即强制输出等级，用于在代码调试时输出指定的调试信息，
									  // 而又不想其它的东西输出太多，干扰视线，正式版本中不应有此级别输出
#define DEBUG_LEVEL_2				2 // 调试输出等级2,输出重要信息
#define DEBUG_LEVEL_3				3 // 调试输出等级3,输出数据
#define DEBUG_LEVEL_4				4 // 调试输出等级4,输出调试信息


/* 数据结构定义 */

// 单体信息
typedef struct tDebugParaDef
{
	uint8 u8DebugSwitch; // 调试输出开关
    uint8 u8DebugLevel; // 调试输出等级
}tDebugParaDef;


/* 函数声明 */
extern uint8 DebugBuf[DEBUG_PRINTF_BUFFER_LEN]; // 打印buffer

extern tDebugParaDef *GetDebugPara(void);

extern sint8 DebugInit(void);

extern sint8 DebugStrOutput(const uint8 u8DebugLevel, const uint8 *pu8Str);

#endif /* DEBUG_H_ */
