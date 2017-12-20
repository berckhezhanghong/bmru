// 
// 
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "mcu_job.h"



// 全局变量
static uint8 McuRstFlag = 0;
static uint8 McuBootloaderFlag = 0;


// 函数实现

/*设置系统时间
 *输入参数：结构体Time_data
 *输出参数：无
 *返回参数：0为成功，-1为失败
 */
sint32 SetMcuTime(tMcuTimeDef TMcuTime)
{
	return 0;
}



/*获取系统时间
 *输入参数：T_time_data型指针
 *输出参数：结构体Time_data
 *返回参数：0为成功，-1为失败
 */
sint32 GetMcuTime(tMcuTimeDef *pTMcuTime)
{
	if(NULL == pTMcuTime)
	{
		return -1;
	}
	
	return 0;
}



sint32 SetRstFlag(uint8 u8Flag)
{
	u8Flag = 1;
	
	return 0;
}


sint32 SetBootloaderFlag(uint8 u8Flag)
{
	McuBootloaderFlag = 1;
	
	return 0;
}


static void SaveBefRst(void)
{
	return ;
}


static void JumpToBootloader(void)
{
	return ;
}


void McuJob(void)
{
	if(McuRstFlag)
	{
		SaveBefRst();
		while(1); // 等待看门狗重启
	}

	if(McuBootloaderFlag)
	{
		SaveBefRst();
		JumpToBootloader();
	}
}
