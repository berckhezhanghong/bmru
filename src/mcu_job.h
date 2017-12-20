#include "timeout.h"

// 
#ifndef __MCU_JOB_H__
#define __MCU_JOB_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct tMcuTimeDef{
	uint32 year;
	uint8 month;
	uint8 day;
	uint8 hour;
	uint8 minute;
	uint8 second;
}tMcuTimeDef;

// MCU¿ØÖÆ
typedef struct tMcuCtrlDef
{
	uint8 u8DevID;
	tMsTimeoutDef tLedTimeout; // 
}tMcuCtrlDef;




sint8 McuInit(void);
sint8 SetMcuTime(tMcuTimeDef TMcuTime);
sint8 GetMcuTime(tMcuTimeDef *pTMcuTime);
sint8 SetRstFlag(uint8 u8Flag);
sint8 SetBootloaderFlag(uint8 u8Flag);
sint8 McuJob(void);


#ifdef __cplusplus
}
#endif

#endif //#ifndef __MCU_JOB_H__

