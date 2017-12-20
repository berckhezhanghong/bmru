// 
// 
#include <asf.h>
#include "basicdatatype.h"
#include "mcu_job.h"



// 全局变量
static uint8 mcu_rst_flag = 0;
static uint8 mcu_bootloader_flag = 0;


// 函数实现

/*设置系统时间
 *输入参数：结构体Time_data
 *输出参数：无
 *返回参数：0为成功，-1为失败
 */
sint32 set_mcu_time(tmcu_timedef tmcu_time)
{
	return 0;
}



/*获取系统时间
 *输入参数：T_time_data型指针
 *输出参数：结构体Time_data
 *返回参数：0为成功，-1为失败
 */
sint32 get_mcu_time(tmcu_timedef *ptmcu_time)
{
	if(NULL == ptmcu_time)
	{
		return -1;
	}
	
	return 0;
}



sint32 set_rst_flag(uint8 u8flag)
{
	u8flag = 1;
	
	return 0;
}


sint32 set_bootloader_flag(uint8 u8flag)
{
	mcu_bootloader_flag = 1;
	
	return 0;
}


static void save_bef_rst(void)
{
	return ;
}


static void jump_to_bootloader(void)
{
	return ;
}


void mcu_job(void)
{
	if(mcu_rst_flag)
	{
		save_bef_rst();
		while(1); // 等待看门狗重启
	}

	if(mcu_bootloader_flag)
	{
		save_bef_rst();
		jump_to_bootloader();
	}
}
