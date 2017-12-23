// 
// 
#include <asf.h>
#include "basicdatatype.h"
#include "mcu_job.h"



// ȫ�ֱ���
static uint8 mcu_rst_flag = 0;
static uint8 mcu_bootloader_flag = 0;


// ����ʵ��

/*����ϵͳʱ��
 *����������ṹ��Time_data
 *�����������
 *���ز�����0Ϊ�ɹ���-1Ϊʧ��
 */
sint32 set_mcu_time(tmcu_timedef tmcu_time)
{
	return 0;
}



/*��ȡϵͳʱ��
 *���������T_time_data��ָ��
 *����������ṹ��Time_data
 *���ز�����0Ϊ�ɹ���-1Ϊʧ��
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
		while(1); // �ȴ����Ź�����
	}

	if(mcu_bootloader_flag)
	{
		save_bef_rst();
		jump_to_bootloader();
	}
}
