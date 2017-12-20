
#ifndef __SETX_ACQ_H
#define __SETX_ACQ_H

#include "stm8l15x.h"

// 单体信息
typedef struct tCellInfoDef
{
	uint16 u16Voltage[VOLTAGE_SAMPLE_NUM]; // 电压
	sint16 s16Temp[VOLTAGE_SAMPLE_NUM]; // 温度
	float fInRs; // 内阻
	float fInRsTemp; // 暂存的内阻测量结果
	uint16 u16VoltageAvr; // 滤波求的的平均电压
	sint16 s16TempBuf[TEMPERATURE_FILTER_NUM];
}tCellInfoDef;

// 电压采样控制
typedef struct tVolSampleCtrlDef
{
	tMsTimeoutDef tVolSampleTimeout; // 电压采集超时，定时1s
	uint32 u32SampleCnt;
	uint8 u8FailCnt[BATTERY_MAX_NUM]; // 电压采集连续失败次数
	sint32 s32Ref1; // 参考电压1的采集值
	sint32 s32Ref2; // 参考电压2的采集值 ,AGND 经过ADC转换得到的可能是负值
	tAdjustParaDef tAdjustPara;
	uint32 u32ErrorCode; // 错误码
	uint8 u8VolOk; // 已经采集到电压，或已经确认电压采集故障
	uint8 u8SampleFlag; // 需要立即开始电压采集的标记
	tCalibrateParaDef *ptCalibratePara;
}tVolSampleCtrlDef;


// 温度采样控制
typedef struct tTempSampleCtrlDef
{
	uint8 u8Ds18b20Status[TEMPRATURE_MAX_NUM]; // 温度传感器的状态
	uint8 u8TempSampleStatus;  // 温度传感器的采样状态机
	tMsTimeoutDef tTempSampleTimeout; // 温度采样超时
	tMsTimeoutDef tDSConvertTimeout; // 等待DS18B20转换超时
	uint8 u8FailCnt[TEMPRATURE_MAX_NUM]; // 温度采集连续失败次数
	uint32 u32ErrorCode; // 错误码
	uint8 u8TempOk; // 已经采集到温度，或已经确认温度采集故障
	uint8 u8SampleFlag; // 需要立即开始温度采集的标记
}tTempSampleCtrlDef;



// 蓄电池信息
typedef struct tBatteryInfoDef
{
    uint32 u32Size; // 此结构体的大小
    uint8 u8SampleStatus; // 当前采样状态（状态机)
    tCellInfoDef tCellData[BATTERY_MAX_NUM]; // 单体信息
    tVolSampleCtrlDef tVolSampleCtrl; // 电压采集控制
    tTempSampleCtrlDef tTempSampleCtrl; // 温度采集控制
}tBatteryInfoDef;


#define		ADC_VREF		5000
#define		ADC_DATA_MAX	4096

#define		SETX_ADCIN1				0
#define		SETX_ADCIN2				1
#define		SETX_ADCIN3				2
#define		SETX_ADCIN4				3
#define		SETX_ADCIN_GND			4
#define		SETX_ADCIN_REF1V2		5

void Delay(__IO uint16_t nCount);
void AcqInit(unsigned char u8ADC_chan);
unsigned int AdcGeneralAcq(unsigned char u8ADC_chan);

#endif /* __SETX_ACQ_H */
