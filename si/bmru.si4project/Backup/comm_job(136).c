// 
#include "comm_job.h"
#include "protocol.h"
#include "version.h"
#include "ai_job.h"
#include "dio_job.h"
#include "mcu_job.h"


extern tai_infoDef tai_info;
extern tdio_staDef tdio_sta;


static sint32 do_CID1_81_CID2_01_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	if (NULL == buf)
	{
		return -1;
	}
	sint32 data_info_length = 0;
	sint32 APP_VER_length = 0, BOOT_VER_length = 0, HARDWARE_VER_length = 0;
	
	/*返回应用程序版本信息的长度，版本信息以'\0'结尾，'\0'也算入长度*/
	APP_VER_length = (sint32)get_app_version(buf);
	
	/*返回boot版本信息的长度，版本信息以'\0'结尾，'\0'也算入长度*/
	BOOT_VER_length = (sint32)get_boot_version(&(buf[APP_VER_length]));
	
	/*返回硬件版本信息的长度，版本信息以'\0'结尾，'\0'也算入长度*/
	HARDWARE_VER_length = (sint32)get_hardware_version(&(buf[APP_VER_length + BOOT_VER_length]));	

	data_info_length = 	HARDWARE_VER_length + BOOT_VER_length + APP_VER_length;
	
	return data_info_length;
}


static sint32 do_CID1_81_CID2_02_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	if (NULL == buf)
	{
		return -1;
	}
	sint32 iVal = 0;
	sint32 data_info_length = 0;
	
	iVal = set_rst_flag(1);
	if(-1 == iVal)
	{
		(*Rtn) = 0x08;
	}
	
	return data_info_length;
}



static sint32 do_CID1_81_CID2_03_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	if (NULL == buf)
	{
		return -1;
	}
	sint32 iVal = 0;
	sint32 data_info_length = 0;
	tmcu_timedef tmcu_time = {0};
		
	tmcu_time.year	 = (uint32)(Order_info.data[0]) + 2000;
	tmcu_time.month  = Order_info.data[1];
	tmcu_time.day	 = Order_info.data[2];
	tmcu_time.hour   = Order_info.data[3];
	tmcu_time.minute = Order_info.data[4];
	tmcu_time.second = Order_info.data[5];
	iVal = set_mcu_time(tmcu_time);
	if(-1 == iVal)
	{
		(*Rtn) = 0x08;
	}
	
	return data_info_length;
}


static sint32 do_CID1_81_CID2_04_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	if (NULL == buf)
	{
		return -1;
	}
	sint32 data_info_length = 0;
	tmcu_timedef tmcu_time = {0};
	sint32 iVal = 0;
		
	iVal = get_mcu_time(&tmcu_time);
	if(-1 == iVal)
	{
		return -1;
	}
	
	buf[0] = (uint8)((tmcu_time.year - 2000) & 0x000000ff);
	data_info_length = data_info_length + 1;
	buf[1] = tmcu_time.month;
	data_info_length = data_info_length + 1;
	buf[2] = tmcu_time.day;
	data_info_length = data_info_length + 1;	
	buf[3] = tmcu_time.hour;
	data_info_length = data_info_length + 1;
	buf[4] = tmcu_time.minute;
	data_info_length = data_info_length + 1;
	buf[5] = tmcu_time.second;
	data_info_length = data_info_length + 1;	
	
	return data_info_length;
}


static sint32 do_CID1_81_CID2_10_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	sint32 s32ai_data;
	uint32 i, j;
	
	if (NULL == buf)
	{
		return -1;
	}
	
	i = 0;
	buf[i] = 0;
	buf[i + 1] = SETX_AI_MAX_NUM;
	i += 2;
	buf[i] = 0;
	buf[i + 1] = SETX_DI_MAX_NUM;
	i += 2;
	
	for(j = 0; j < SETX_AI_MAX_NUM; j++)
	{
		s32ai_data = tai_info.u16volt[j];
		
		buf[i] = (uint8)((s32ai_data >> 24) & 0x000000ff);
		i ++;
		buf[i] = (uint8)((s32ai_data >> 16) & 0x000000ff);
		i ++;
		buf[i] = (uint8)((s32ai_data >>  8) & 0x000000ff);
		i ++;
		buf[i] = (uint8)(s32ai_data & 0x000000ff);
		i ++;
	}
	
	for(j = 0; j < SETX_DI_MAX_NUM; j++)
	{
		buf[i] = tdio_sta.tdi_sta.u8di_sta[j];
		i ++;
	}
	
	return i;
}



static uint32 do_CID1_81_CID2_20_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	uint16 i;
	
	if (NULL == buf)
	{
		return -1;
	}
	sint32 data_info_length = 0;
	uint32 pulse_width = 0;
	uint16 channel_num = 0;
	uint8 u8type = 0;
	sint32 iVal = 0;

	i = 0;
	channel_num = ((Order_info.data[i] << 8) | Order_info.data[i + 1]) - 1;
	i += 2;
	u8type		= Order_info.data[i];
	i ++;
	pulse_width = (Order_info.data[i] << 24) | (Order_info.data[i + 1] << 16) | (Order_info.data[i + 2] << 8) | Order_info.data[i + 3];
	i += 4;
	
	iVal = (sint32)do_ctrl((uint8)channel_num, u8type, pulse_width);
	if(-1 == iVal)
	{
		(*Rtn) = 0x08;
	}
	
	return data_info_length;
}



static sint32 do_CID1_81_CID2_21_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	uint16 i;
	
	if (NULL == buf)
	{
		return -1;
	}
	sint32 data_info_length = 0;
	sint32 AI_data = 0;
	uint16 channel_num = 0;
	sint32 iVal = 0;

	i = 0;
	channel_num = (Order_info.data[i] << 8) | Order_info.data[i + 1];
	i += 2;
	AI_data = (Order_info.data[i] << 24) | (Order_info.data[i + 1] << 16) | (Order_info.data[i + 2] << 8) | Order_info.data[i + 3];
	i += 4;
	
	iVal = (sint32)ao_ctrl((uint8)channel_num, AI_data);
	if(-1 == iVal)
	{
		(*Rtn) = 0x08;
	}
		
	return data_info_length;
}


static sint32 do_CID1_81_CID2_31_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	if (NULL == buf)
	{
		return -1;
	}
	sint32 data_info_length = 0;
	uint8 enter_model = 0;
	sint32 iVal = 0;
	
	enter_model = Order_info.data[0];

	iVal = set_bootloader_flag(enter_model);
	if(-1 == iVal)
	{
		(*Rtn) = 0x08;
	}	

	return data_info_length;
}

static sint32 do_cid1_81_job(T_order_info Order_info, uint8* buf,uint8* Rtn)
{
	if (NULL == buf)
	{
		return -1;
	}
	sint32 data_info_length = 0;
	
	switch(Order_info.CID2)
	{
	case CID1_81_CID2_01:
		data_info_length = do_CID1_81_CID2_01_job(Order_info, buf, Rtn);
		break;
	case CID1_81_CID2_02:
		data_info_length = do_CID1_81_CID2_02_job(Order_info, buf, Rtn);
		break;
	case CID1_81_CID2_03:
		data_info_length = do_CID1_81_CID2_03_job(Order_info, buf, Rtn);
		break;
	case CID1_81_CID2_04:
		data_info_length = do_CID1_81_CID2_04_job(Order_info, buf, Rtn);
		break;
	case CID1_81_CID2_10:
		data_info_length = do_CID1_81_CID2_10_job(Order_info, buf, Rtn);
		break;
	case CID1_81_CID2_20:
		data_info_length = do_CID1_81_CID2_20_job(Order_info, buf, Rtn);
		break;
	case CID1_81_CID2_21:
		data_info_length = do_CID1_81_CID2_21_job(Order_info, buf, Rtn);
		break;
	case CID1_81_CID2_31:
		data_info_length = do_CID1_81_CID2_31_job(Order_info, buf, Rtn);
		break;
	default:
		*Rtn = 0x04;
		break;
	}
	return data_info_length;
}


sint32 Action(T_order_info Order_info, T_rtn_info* Rtn_info)
{
	if(NULL == Rtn_info)
	{
		return -1;
	}
	
	uint8 buf[SPI_SEND_MAX_LONG] = {0};
	uint32 i = 0;
	sint32 data_info_length = 0;
	uint8 Rtn = 0x00;
	
	switch (Order_info.CID1)
	{
	case CID1_81:
		data_info_length = do_cid1_81_job(Order_info, buf, &Rtn);
		break;
	default :
		return -1;
		break;
	}
	if(-1 == data_info_length)
	{
		return -1;
	}
	
	Rtn_info->data_length = data_info_length;
	
	for(i = 0;i < Rtn_info->data_length;i++)
	{
		Rtn_info->data[i] = buf[i];
	}
	Rtn_info->Ver  = Order_info.CID2;
	Rtn_info->Addr = Order_info.Addr;
	Rtn_info->SCID = Order_info.SCID;
	Rtn_info->CID1 = Order_info.CID1;
	Rtn_info->RTN  = Rtn;
	
	return 0;
}
