/*
 * protocol.c
 *
 * Created: 2017-08-02 09:25:13
 *  Author: Administrator
 */ 
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "protocol.h"
#include "comm_job.h"

#define length_of_soi 1
#define length_of_ver 1
#define length_of_addr 4
#define length_of_scid 1
#define length_of_cid1 1
#define length_of_cid2 1
#define length_of_rtn 1
#define length_of_length 2
#define length_of_chksum 2
#define length_of_eoi 1
#define ver_to_length 10




T_order_info Order_info;
T_change_pack_hex Change_pack_hex;


T_rtn_info Rtn_info;
T_rtn_pack cur_rtn_pack;
T_rtn_pack_hex Rtn_pack_hex;

extern tspi_rec_ctrl_def tspi_rec_ctrl;
extern tspi_send_ctrl_def tspi_send_ctrl;



const uint16 crctab[] = {
	0x0000,0x1021,0x2042,0x3063,0x4084,0x50A5,0x60C6,0x70E7,
	0x8018,0x9129,0xA14A,0xB16B,0xC18C,0xD1AD,0xE1CE,0xF1EF,
	0x1231,0x0210,0x3273,0x2252,0x52B5,0x4294,0x72F7,0x62D6,
	0x9339,0x8318,0xB37B,0xA35A,0xD3BD,0xC39C,0xF3FF,0xE3DE,
	0x2462,0x3443,0x0420,0x1401,0x64E6,0x74C7,0x44A4,0x5485,
	0xA56A,0xB54B,0x8528,0x9509,0xE5EE,0xF5CF,0xC5AC,0xD58D,
	0x3653,0x2672,0x1611,0x0630,0x76D7,0x66F6,0x5695,0x46B4,
	0xB75B,0xA77A,0x9719,0x8738,0xF7DF,0xE7FE,0xD79D,0xC7BC,
	0x48C4,0x58E5,0x6886,0x78A7,0x0840,0x1861,0x2802,0x3823,
	0xC9CC,0xD9ED,0xE98E,0xF9AF,0x8948,0x9969,0xA90A,0xB92B,
	0x5AF5,0x4AD4,0x7AB7,0x6A96,0x1A71,0x0A50,0x3A33,0x2A12,
	0xDBFD,0xCBDC,0xFBBF,0xEB9E,0x9B79,0x8B58,0xBB3B,0xAB1A,
	0x6CA6,0x7C87,0x4CE4,0x5CC5,0x2C22,0x3C03,0x0C60,0x1C41,
	0xEDAE,0xFD8F,0xCDEC,0xDDCD,0xAD2A,0xBD0B,0x8D68,0x9D49,
	0x7E97,0x6EB6,0x5ED5,0x4EF4,0x3E13,0x2E32,0x1E51,0x0E70,
	0xFF9F,0xEFBE,0xDFDD,0xCFFC,0xBF1B,0xAF3A,0x9F59,0x8F78,
	0x9188,0x81A9,0xB1CA,0xA1EB,0xD10C,0xC12D,0xF14E,0xE16F,
	0x1080,0x00A1,0x30C2,0x20E3,0x5004,0x4025,0x7046,0x6067,
	0x83B9,0x9398,0xA3FB,0xB3DA,0xC33D,0xD31C,0xE37F,0xF35E,
	0x02B1,0x1290,0x22F3,0x32D2,0x4235,0x5214,0x6277,0x7256,
	0xB5EA,0xA5CB,0x95A8,0x8589,0xF56E,0xE54F,0xD52C,0xC50D,
	0x34E2,0x24C3,0x14A0,0x0481,0x7466,0x6447,0x5424,0x4405,
	0xA7DB,0xB7FA,0x8799,0x97B8,0xE75F,0xF77E,0xC71D,0xD73C,
	0x26D3,0x36F2,0x0691,0x16B0,0x6657,0x7676,0x4615,0x5634,
	0xD94C,0xC96D,0xF90E,0xE92F,0x99C8,0x89E9,0xB98A,0xA9AB,
	0x5844,0x4865,0x7806,0x6827,0x18C0,0x08E1,0x3882,0x28A3,
	0xCB7D,0xDB5C,0xEB3F,0xFB1E,0x8BF9,0x9BD8,0xABBB,0xBB9A,
	0x4A75,0x5A54,0x6A37,0x7A16,0x0AF1,0x1AD0,0x2AB3,0x3A92,
	0xFD2E,0xED0F,0xDD6C,0xCD4D,0xBDAA,0xAD8B,0x9DE8,0x8DC9,
	0x7C26,0x6C07,0x5C64,0x4C45,0x3CA2,0x2C83,0x1CE0,0x0CC1,
	0xEF1F,0xFF3E,0xCF5D,0xDF7C,0xAF9B,0xBFBA,0x8FD9,0x9FF8,
	0x6E17,0x7E36,0x4E55,0x5E74,0x2E93,0x3EB2,0x0ED1,0x1EF0
};
  

/*crc校验*/
static uint16 CRC(uint8 *fp, uint16 wLen)
{
	if(NULL == fp)
	{
		return -1;
	}
	uint16 u16crcTemp = 0;
	uint16 i;
	uint8 u8num;
	for (i = 0; i < wLen; i++)
	{
		u8num = ((u16crcTemp >> 8) ^ (*(fp++))) & 0xff;
		u16crcTemp = crctab[u8num] ^ (u16crcTemp << 8);
	}
	return u16crcTemp;
}

/*16位数据高低字节转换*/
static uint16 swap16Big2Little(uint16 val)
{
	uint16 u16temp1 = 0, u16temp2 = 0;
	u16temp1 = ((val & 0x00ff) << 8) & 0xff00;
	u16temp2 = ((val & 0xff00) >> 8) & 0x00ff;
	val = u16temp1 | u16temp2;
	return val;
}

/*32位数据高低字节转换*/
static uint32 swap32Big2Little(uint32 val)
{
	uint16 u16temp1 = 0, u16temp2 = 0;
	u16temp1 = (val >> 16) & 0xffff;
	u16temp1 = swap16Big2Little(u16temp1);
	u16temp2 = val & 0xffff;
	u16temp2 =  swap16Big2Little(u16temp2);
	val = (u16temp2 << 16) | u16temp1;
	return val;
}

/*计算lchksum*/
static uint8 calcLchecksum(uint16 length)
{
	uint8 u8temp = 0;
	u8temp = (uint8)((length >> 8) & 0x000f) | (uint8)((length >> 4) & 0x000f) | (uint8)(length & 0x000f);
	u8temp = ~u8temp;
	u8temp = u8temp + 1;
	u8temp = u8temp & 0x0f;
	return u8temp;
}

/*获取lchksum*/
static uint8 getLchecksum(uint16 length)
{
	uint8 u8temp = 0;
	u8temp = ((length >> 12) & 0x000f);
	return u8temp;
}

/*获取lenid*/
static uint16 getLenid(uint16 length)
{
	uint16 u16temp = 0;
	u16temp = length & 0x0fff;
	return u16temp;
}

/*组协议的过程遇到0x14，0x7e，0x0d进行换码操作，所以在解包的过程中遇到0x14要进行反换码操作*/
static sint32 data_rechange(uint8* origin_hexgroup, const uint32 origin_length, T_change_pack_hex* Change_Pack_Hex)
{
	if(NULL == origin_hexgroup)
	{
		return -1;
	}
	if(NULL == Change_Pack_Hex)
	{
		return -1;
	}
	
	uint32 i = 0;
	Change_Pack_Hex->hexgroup[0] = protocol_head;
	Change_Pack_Hex->length = 1;
	for (i = 1; i < origin_length - 1; i++, Change_Pack_Hex->length++)
	{
		if ((origin_hexgroup[i] == protocol_change) || (origin_hexgroup[i] == protocol_head) || (origin_hexgroup[i] == protocol_tail))
		{
			i++;
			Change_Pack_Hex->hexgroup[Change_Pack_Hex->length] = ~origin_hexgroup[i];
		}
		else
		{
			Change_Pack_Hex->hexgroup[Change_Pack_Hex->length] = origin_hexgroup[i];
		}
	}
	Change_Pack_Hex->hexgroup[Change_Pack_Hex->length] = protocol_tail;
	Change_Pack_Hex->length = Change_Pack_Hex->length + 1;

	return 0;
}


sint32 unpack(uint8* protocol_hexgroup, const uint32 length, T_order_info* Order_Info)
{
	if(NULL == protocol_hexgroup)
	{
		return -1;
	}
	if(NULL == Order_Info)
	{
		return -1;
	}
	
	uint32 u32Command_length = 0, u32iLenid = 0;
	uint16 u16Chksum = 0, u16get_Length = 0,u16get_chksum = 0;
	uint8 u8cLchksum_get = 0, u8cLchksum_calc = 0;
	uint32 i = 0;
	sint32 s32iVal = 0;
	/*帧头帧尾判断*/
	if (protocol_head != protocol_hexgroup[0] || protocol_tail != protocol_hexgroup[length - 1])
	{
		return -1;
	}
	/*反换码操作*/
	s32iVal = data_rechange(protocol_hexgroup, length, &Change_pack_hex);
	if(-1 == s32iVal)
	{
		return -1;
	}
	u32Command_length = Change_pack_hex.length - 14;

	/*chksum校验*/
	u16Chksum = CRC(&(Change_pack_hex.hexgroup[1]), ver_to_length + u32Command_length);
	u16Chksum = u16Chksum & 0x0000ffff;
	u16get_chksum = (Change_pack_hex.hexgroup[Change_pack_hex.length - 3] << 8) | Change_pack_hex.hexgroup[Change_pack_hex.length - 2];
	if (u16Chksum != u16get_chksum)
	{
		return -1;
	}
	/*lchksum校验计算*/
	u16get_Length = (Change_pack_hex.hexgroup[9] << 8) | Change_pack_hex.hexgroup[10];
	u8cLchksum_get = getLchecksum(u16get_Length);
	u8cLchksum_calc = calcLchecksum(u16get_Length);
	if (u8cLchksum_get != u8cLchksum_calc)
	{
		return -1;
	}
	/*长度校验*/
	u32iLenid = getLenid(u16get_Length);
	if (u32Command_length != u32iLenid)
	{
		return -1;
	}

	/*获取相应控制信息*/
	Order_Info->Ver = Change_pack_hex.hexgroup[1];
	Order_Info->Addr = (((((Change_pack_hex.hexgroup[2] << 8) | Change_pack_hex.hexgroup[3]) << 8) | Change_pack_hex.hexgroup[4]) << 8) | Change_pack_hex.hexgroup[5];
	Order_Info->SCID = Change_pack_hex.hexgroup[6];
	Order_Info->CID1 = Change_pack_hex.hexgroup[7];
	Order_Info->CID2 = Change_pack_hex.hexgroup[8];
	Order_Info->length = u32Command_length;
	for (i = 0; i < u32Command_length; i++)
	{
		Order_Info->data[i] = Change_pack_hex.hexgroup[11 + i];
	}
	return 0;
}

/*根据控制信息的字节数计算出length的值*/
static uint16 command_length_to_length(const uint32 command_length)
{
	uint16 u16tmp = 0;
	uint8 u8tmp = 0;
	u16tmp = (uint16)command_length;
	u8tmp = ((uint8)(u16tmp >> 8) & 0x0f) + ((uint8)(u16tmp >> 4) & 0x0f) + ((uint8)u16tmp & 0x0f);
	u8tmp = u8tmp & 0xff;
	u8tmp = ~u8tmp;
	u8tmp = u8tmp + 1;
	u8tmp = u8tmp & 0xff;

	return ((u8tmp & 0x0f) << 12) | (u16tmp & 0x0fff);
}

/*将协议格式转换为单字节16进制数组*/
static sint32 protocol_to_hexgroup(uint8* inprotocolbuf, const uint32 totalbyte, uint8* outhexgroup)
{
	if(NULL == inprotocolbuf)
	{
		return -1;
	}
	if(NULL == outhexgroup)
	{
		return -1;
	}
	uint32 i = 0;
	
	for (i = 0; i < totalbyte; i++)
	{
		outhexgroup[i] = inprotocolbuf[i];
	}
	
	return 0;
}

static sint32 protocol_to_hexgroup_for_short(uint16 inprotocoldata, const uint32 totalbyte, uint8* outhexgroup)
{
	if(NULL == outhexgroup)
	{
		return -1;
	}
	uint8 u8tmp = 0;
	u8tmp = (uint8)inprotocoldata & 0xff;
	outhexgroup[0] = u8tmp;

	u8tmp = (uint8)(inprotocoldata >> 8) & 0xff;
	outhexgroup[1] = u8tmp;
	
	return 0;
}

static sint32 protocol_to_hexgroup_for_int(uint32 inprotocoldata, const uint32 totalbyte, uint8* outhexgroup)
{
	if(NULL == outhexgroup)
	{
		return -1;
	}
	uint8 u8tmp = 0;
	u8tmp = (uint8)inprotocoldata & 0xff;
	outhexgroup[0] = u8tmp;
	u8tmp = (uint8)(inprotocoldata >> 8) & 0xff;
	outhexgroup[1] = u8tmp;
	u8tmp = (uint8)(inprotocoldata >> 16) & 0xff;
	outhexgroup[2] = u8tmp;
	u8tmp = (uint8)(inprotocoldata >> 24) & 0xff;
	outhexgroup[3] = u8tmp;
	
	return 0;
}

/*换码操作，遇到0x14，0x7e，0x0d的时候进行换码*/
static sint32 data_change(T_rtn_pack_hex cur_rtn_pack_hex, tspi_send_ctrl_def* Tspi_send_ctrl)
{
	if(NULL == Tspi_send_ctrl)
	{
		return -1;
	}
	
	uint32 i = 0;
	Tspi_send_ctrl->u8buf[0] = protocol_head;
	Tspi_send_ctrl->u16len = 1;
	for (i = 1; i < cur_rtn_pack_hex.length - 1; i++, Tspi_send_ctrl->u16len++)
	{
		if ((cur_rtn_pack_hex.hexgroup[i] == protocol_head) || (cur_rtn_pack_hex.hexgroup[i] == protocol_tail) || (cur_rtn_pack_hex.hexgroup[i] == protocol_change))
		{
			Tspi_send_ctrl->u8buf[Tspi_send_ctrl->u16len] = protocol_change;
			Tspi_send_ctrl->u16len++;
			Tspi_send_ctrl->u8buf[Tspi_send_ctrl->u16len] = ~cur_rtn_pack_hex.hexgroup[i];
		}
		else
		{
			Tspi_send_ctrl->u8buf[Tspi_send_ctrl->u16len] = cur_rtn_pack_hex.hexgroup[i];
		}
	}
	Tspi_send_ctrl->u8buf[Tspi_send_ctrl->u16len] = protocol_tail;
	Tspi_send_ctrl->u16len = Tspi_send_ctrl->u16len + 1;
	return 0;
}

sint32 rtn_to_pack(T_rtn_info rtn_info, tspi_send_ctrl_def* Tspi_send_ctrl)
{
	if(NULL == Tspi_send_ctrl)
	{
		return -1;
	}
	

	uint32 u32length = 0;
	uint32 i = 0;

	/*计算未经换码的协议长度*/
	Rtn_pack_hex.length = ver_to_length + rtn_info.data_length + length_of_chksum + 2;
	
	/*根据系统返回的信息组织未经换码的协议*/
	cur_rtn_pack.cSoi = protocol_head;
	cur_rtn_pack.cVer = rtn_info.Ver;
	cur_rtn_pack.iAddr = rtn_info.Addr;
	cur_rtn_pack.iAddr = swap32Big2Little(cur_rtn_pack.iAddr);
	cur_rtn_pack.cScid = rtn_info.SCID;
	cur_rtn_pack.cCid1 = rtn_info.CID1;
	cur_rtn_pack.cRtn  = rtn_info.RTN;
	cur_rtn_pack.sLength = command_length_to_length(rtn_info.data_length);
	cur_rtn_pack.sLength = swap16Big2Little(cur_rtn_pack.sLength);
	for (i = 0; i < rtn_info.data_length; i++)
	{
		cur_rtn_pack.data[i] = rtn_info.data[i];
	}

	cur_rtn_pack.cEoi = protocol_tail;

	/*将未经换码的协议转换为单字节16进制数组*/
	protocol_to_hexgroup(&(cur_rtn_pack.cSoi), length_of_ver + length_of_soi, &(Rtn_pack_hex.hexgroup[u32length]));
	u32length = u32length + length_of_ver + length_of_soi;
	protocol_to_hexgroup_for_int(cur_rtn_pack.iAddr, length_of_addr , &(Rtn_pack_hex.hexgroup[u32length]));
	u32length = u32length + length_of_addr;
	protocol_to_hexgroup(&(cur_rtn_pack.cScid), length_of_scid + length_of_cid1 + length_of_rtn, &(Rtn_pack_hex.hexgroup[u32length]));
	u32length = u32length + length_of_scid + length_of_cid1 + length_of_rtn;
	protocol_to_hexgroup_for_short(cur_rtn_pack.sLength, length_of_length, &(Rtn_pack_hex.hexgroup[u32length]));
	u32length = u32length + length_of_length;

	protocol_to_hexgroup(cur_rtn_pack.data, rtn_info.data_length, &(Rtn_pack_hex.hexgroup[u32length]));
	u32length = u32length + rtn_info.data_length;
	
	cur_rtn_pack.sChksum  = CRC(&(Rtn_pack_hex.hexgroup[1]), (ver_to_length + rtn_info.data_length));
	cur_rtn_pack.sChksum = swap16Big2Little(cur_rtn_pack.sChksum);

	protocol_to_hexgroup_for_short(cur_rtn_pack.sChksum, length_of_chksum, &(Rtn_pack_hex.hexgroup[u32length]));
	u32length = u32length + length_of_chksum;
	protocol_to_hexgroup(&(cur_rtn_pack.cEoi), length_of_eoi, &(Rtn_pack_hex.hexgroup[u32length]));
	
	/*进行换码操作*/
	data_change(Rtn_pack_hex, Tspi_send_ctrl);
	Tspi_send_ctrl->u8send_sta = SPI_SEND_STA_WAITING;
	
	return 0;
}

static uint32 look_for_se(tspi_rec_ctrl_def* Tspi_rec_ctrl, uint8** pu8ptr)
{
	uint32 u32count = 0,u32length = 0;
	
	while(protocol_head != Tspi_rec_ctrl->u8buf[u32count])
	{
		u32count++;
		if(u32count >= Tspi_rec_ctrl->u16len)
		{
			return -1;
		}
	}
	*pu8ptr = &Tspi_rec_ctrl->u8buf[u32count];
	
	while(protocol_tail != Tspi_rec_ctrl->u8buf[u32count])
	{
		u32count++;
		if(u32count >= Tspi_rec_ctrl->u16len)
		{
			return -1;
		}
		
		u32length++;
		if(protocol_head == Tspi_rec_ctrl->u8buf[u32count - 1])
		{
			*pu8ptr = &Tspi_rec_ctrl->u8buf[u32count - 1];
			u32length = 0;
		}
		
	}
	u32length++;
	
	Tspi_rec_ctrl->u8rec_sta = SPI_RCV_STA_IDLE;
	Tspi_rec_ctrl->u16len = 0;
	
	return u32length + 1;
}

static void struct_init(void)
{
	memset(&Order_info, 0, sizeof(T_order_info));
	memset(&Change_pack_hex, 0, sizeof(T_change_pack_hex));
	memset(&Rtn_info, 0, sizeof(T_rtn_info));
	memset(&cur_rtn_pack, 0, sizeof(T_rtn_pack));
	memset(&Rtn_pack_hex, 0, sizeof(T_rtn_pack_hex));
}


sint8 protocol_job(void)
{
	
	uint8 *pu8ptr = NULL;
	sint32 u32len = 0;
	sint32 s32_val = 0;
	
	struct_init();

	if(SPI_RCV_STA_OVER == tspi_rec_ctrl.u8rec_sta)
	{
		u32len = look_for_se(&tspi_rec_ctrl, &pu8ptr);
		if(-1 == u32len)
		{
			tspi_rec_ctrl.u8rec_sta = SPI_RCV_STA_IDLE;
			tspi_rec_ctrl.u16len = 0;
			return -1;
		}
		else
		{
			s32_val = unpack(pu8ptr, u32len, &Order_info);
			if(-1 == s32_val)
			{
				return -1;
			}
			else
			{
				s32_val = Action(Order_info, &Rtn_info);
				if(-1 == s32_val)
				{
					return -1;
				}
				else
				{
					if(SPI_SEND_STA_IDLE == tspi_send_ctrl.u8send_sta)
					{
						rtn_to_pack(Rtn_info, &tspi_send_ctrl);
						memset(tspi_rec_ctrl.u8buf, 0, SPI_RCV_MAX_LONG);
					}
					else
					{
						return -1;
					}
				}
			}
		}
	}

	return 0;
}