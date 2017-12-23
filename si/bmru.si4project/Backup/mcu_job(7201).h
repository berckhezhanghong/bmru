// 
#ifndef __MCU_JOB_H__
#define __MCU_JOB_H__

#ifdef __cplusplus
extern "C" {
#endif

typedef struct tmcu_timedef{
	uint32 year;
	uint8 month;
	uint8 day;
	uint8 hour;
	uint8 minute;
	uint8 second;
}tmcu_timedef;



sint32 set_mcu_time(tmcu_timedef tmcu_time);
sint32 get_mcu_time(tmcu_timedef *ptmcu_time);
sint32 set_rst_flag(uint8 u8flag);
sint32 set_bootloader_flag(uint8 u8flag);
void mcu_job(void);


#ifdef __cplusplus
}
#endif

#endif //#ifndef __MCU_JOB_H__

