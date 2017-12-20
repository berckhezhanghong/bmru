
#ifndef __INRS_MEASURE_H
#define __INRS_MEASURE_H

#include "basicdatatype.h"
#include "timeout.h"
#include "general_oper.h"




#define		CHAN_REBACK_CURRENT		SETX_ADCIN4
#define		CHAN_REBACK_VOLT		SETX_ADCIN1

#define INRS_VREF_RS_2V				(11.0)	 // 2V模块,内阻测量负载电阻,11m欧,分辨率0.1u欧
#define INRS_VREF_RS_12V			(100.0)	 // 12V模块,内阻测量负载电阻,100m欧,分辨率0.1u欧
#define INRS_MAX_RS					(255.0)	 // 内阻测量最大电阻,255m欧,分辨率1u欧
#define INRS_MIN_RS					(0.05)	 // 内阻测量最小电阻,255m欧,分辨率1u欧




// 内阻测量控制
typedef struct tInRsCtrlDef
{
	float fInRsAvr[BATTERY_MAX_NUM]; // 求平均后的内阻值[节数]
	uint8 u8InRsSampleFlag; // 收到内阻测量命令后置此标志
	uint8 u8SampleMode; // 测量模式，广播序列式测量与单个测量
	tMsTimeoutDef tInRsSampleIntervalTimeout; // 内阻测量安全间隔超时, 防止频繁测量
	tMsTimeoutDef tInRsSampleSequenceTimeout; // 收到广播内阻测量命令后按ID依次测量的超时
	uint8 u8FailCnt[BATTERY_MAX_NUM]; // 内阻测量连续失败次数
	uint32 u32ErrorCode; // 错误码
	uint8 u8InRsMeasureCheckSta;
}tInRsCtrlDef;



sint8 InrsMesurejob(void);
sint8 InrsMesureInit(void);


#endif /* __INRS_MEASURE_H */
