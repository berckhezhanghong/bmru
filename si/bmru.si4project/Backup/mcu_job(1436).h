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



sint32 SetMcuTime(tMcuTimeDef TMcuTime);
sint32 GetMcuTime(tMcuTimeDef *pTMcuTime);
sint32 SetRstFlag(uint8 u8Flag);
sint32 SetBootloaderFlag(uint8 u8Flag);
void McuJob(void);


#ifdef __cplusplus
}
#endif

#endif //#ifndef __MCU_JOB_H__

