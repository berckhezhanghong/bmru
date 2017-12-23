
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "basicdatatype.h"
#include "temperature.h"


#define BATTERY_MAX_NUM			2
#define BATTERY_MAX_NUM			2

#define CALIB_MAX_NUM	2


// 校准参数
typedef struct tCalibrateParaDef
{
	float  fSlope[CALIB_MAX_NUM]; // 斜率
	sint16 s16Intercept[CALIB_MAX_NUM]; // 截距
}tCalibrateParaDef;

// 单体信息
typedef struct tCellInfoDef
{
	uint16 u16Voltage; // 电压
	sint16 s16Temp; // 温度
	float fInRs; // 内阻
	float fInRsTemp; // 暂存的内阻测量结果
	uint16 u16VoltageAvr; // 滤波求的的平均电压
	sint16 s16TempBuf[TEMPERATURE_FILTER_NUM];
}tCellInfoDef;

// 电压采样控制
typedef struct tVolSampleCtrlDef
{
	tMsTimeoutDef tVolSampleTimeout; // 电压采集超时，定时1s
	uint8 u8SampleFlag; // 需要立即开始电压采集的标记
	uint32 u32SampleCnt;
	uint8 u8FailCnt[BATTERY_MAX_NUM]; // 电压采集连续失败次数
	uint32 u32ErrorCode; // 错误码
	uint8 u8VoltOk; // 已经采集到电压，或已经确认电压采集故障
	tCalibrateParaDef *tCalibratePara;
}tVolSampleCtrlDef;



// 蓄电池信息
typedef struct tBatteryInfoDef
{
    uint32 u32Size; // 此结构体的大小
    uint8 u8SampleStatus; // 当前采样状态（状态机)
    tCellInfoDef tCellData[BATTERY_MAX_NUM]; // 单体信息
    tVolSampleCtrlDef tVolSampleCtrl; // 电压采集控制
    tTempSampleCtrlDef *ptTempSampleCtrl; // 温度采集控制
}tBatteryInfoDef;


#endif /* __SETX_ACQ_H */
