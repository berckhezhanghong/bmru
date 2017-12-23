/*********************************************************************
* 内容摘要： // 温度采集
*            // 
* 其它说明： // 
* 当前版本： // v1.00.001
* 作    者： // 
* 完成日期： // 2017.03.24
* 修改记录1：// 
*    修改日期：
*    版 本 号：
*    修 改 人：
*    修改内容： 
* 修改记录2:
**********************************************************************/

#ifndef TEMPERATURE_H_
#define TEMPERATURE_H_


/* 头文件包含 */
#include "basicdatatype.h"
#include "timeout.h"
#include "debug.h"



/* 宏定义 */
#define TEMPRATURE_MAX_NUM		2 //两路温度，回风口与出风口
#define TEMPER_SAMPLE_NUM		1 //
#define TEMPER_FAIL_MAXTIMES	20 // 连续失败认为传感器故障

#define TEMP_ERROR_VALUE		-2730

#define DS18B20_STATUS_IDLE					0 // 18b20空闲
#define DS18B20_STATUS_CONVERTING			1 // 18b20正在转换，等待转换完成方可读取数据

#define DS1820_STATUS_OK		1
#define DS1820_STATUS_ERROR		2

#define TEMPER_FILTER_MAX_VARIATION		60 // 相邻的两次温度采集最大变化量为6°
#define TEMPERATURE_FILTER_NUM			5

#define TEMPER_SAMPLE_INTERVAL				(3000)  // 温度采集间隔
#define TEMPER_SAMPLE_INTERVAL_INIT			(3000)  // 初始化温度采集间隔
#define TEMPER_CONVERT_TIME					(1000) // 1000ms 等待温度传感器转换完成



/* 数据结构定义 */

typedef struct tTemperReadDef
{
	sint16 s16Temp; // 温度
	uint8 u8Status; // 状态
}tTemperReadDef;


typedef struct tTemperDataDef
{
	sint16 s16Temp[TEMPER_SAMPLE_NUM]; // 温度
	sint16 s16TempBuf[TEMPERATURE_FILTER_NUM];
}tTemperDataDef;


// 温度采样控制
typedef struct tTempSampleCtrlDef
{
	tTemperDataDef tTemperData[TEMPRATURE_MAX_NUM];
	uint8 u8Ds18b20Status[TEMPRATURE_MAX_NUM]; // 温度传感器的状态,成功或失败
	uint8 u8TempSampleStatus;  // 温度传感器的采样状态机
	tMsTimeoutDef tTempSampleTimeout; // 温度采样超时
	tMsTimeoutDef tDSConvertTimeout; // 等待DS18B20转换超时
	uint8 u8FailCnt[TEMPRATURE_MAX_NUM]; // 温度采集连续失败次数
	uint32 u32ErrorCode; // 错误码
	uint8 u8TempOk; // 已经采集到温度，或已经确认温度采集故障
	uint8 u8SampleFlag; // 需要立即开始温度采集的标记
}tTempSampleCtrlDef;


/* 函数声明 */

// 温度采集任务
sint8 TemperTask(void);
// 获取温度值及状态
tTempSampleCtrlDef *GetTemperInfo(void);
// 温度采集任务初始化
sint8 TemperTaskInit(void);


#endif /* TEMPERATURE_H_ */
