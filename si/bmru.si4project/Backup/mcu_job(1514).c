// 
// 
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "mcu_job.h"



// ȫ�ֱ���
static uint8 McuRstFlag = 0;
static uint8 McuBootloaderFlag = 0;


// ����ʵ��

/*����ϵͳʱ��
 *����������ṹ��Time_data
 *�����������
 *���ز�����0Ϊ�ɹ���-1Ϊʧ��
 */
sint32 SetMcuTime(tMcuTimeDef TMcuTime)
{
	return 0;
}



/*��ȡϵͳʱ��
 *���������T_time_data��ָ��
 *����������ṹ��Time_data
 *���ز�����0Ϊ�ɹ���-1Ϊʧ��
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
		while(1); // �ȴ����Ź�����
	}

	if(McuBootloaderFlag)
	{
		SaveBefRst();
		JumpToBootloader();
	}
}
