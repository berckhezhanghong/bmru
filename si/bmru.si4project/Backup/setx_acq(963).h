
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "basicdatatype.h"
#include "temperature.h"
#include "inrs_measure.h"



#define BATTERY_MAX_NUM			2
#define BATTERY_MAX_NUM			2

#define CALIB_MAX_NUM			2

#define VOLT_SAMPLE_INTERVAL				(3000)  // 电压采集间隔
#define VOLT_SAMPLE_INTERVAL_INIT			(3000)  // 初始化电压采集间隔


#define	CHAN_BAT1_VOLT			SETX_ADCIN2
#define	CHAN_BAT2_VOLT			SETX_ADCIN3



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
	uint8 u8SampleSta; // 当前采样状态（状态机)
	tMsTimeoutDef tVolSampleTimeout; // 电压采集超时，定时1s
	uint8 u8SampleFlag; // 需要立即开始电压采集的标记
	uint32 u32SampleCnt[BATTERY_MAX_NUM];
	uint32 u32FailCnt[BATTERY_MAX_NUM]; // 电压采集连续失败次数
	uint32 u32ErrorCode; // 错误码
	uint8 u8VoltOk; // 已经采集到电压，或已经确认电压采集故障
	tCalibrateParaDef *tCalibratePara;
}tVolSampleCtrlDef;



// 蓄电池信息
typedef struct tBatteryInfoDef
{
    uint32 u32Size; // 此结构体的大小
    tCellInfoDef tCellData[BATTERY_MAX_NUM]; // 单体信息
    tVolSampleCtrlDef tVolSampleCtrl; // 电压采集控制
}tBatteryInfoDef;


// 函数申明
sint8 AcqInit(void);
sint8 AcqDoJob(void);


#endif /* __SETX_ACQ_H */
