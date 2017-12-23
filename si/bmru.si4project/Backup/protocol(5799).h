/*
 * protocol.h
 *
 * Created: 2017-08-02 09:25:36
 *  Author: Administrator
 */ 
#ifndef PROTOCOL_H_
#define PROTOCOL_H_


#include "basicdatatype.h"
#include "spi_job.h"


#define max_command_length 16
#define max_data_info_length 128
#define max_rtn_pack_length 128
#define max_change_pack_length 256


#define protocol_head 0x7e
#define protocol_tail 0x0d
#define protocol_change 0x14

/*
*ver为版本号
*addr为设备地址
*scid为源设备地址
*cid1为设备类型
*cid2为设备动作码
*data为设备动作对应的数据
*/
typedef struct order_info {
	uint8 Ver;
	uint32 Addr;
	uint8 SCID;					//控制码的SCID
	uint8 CID1;					//控制码的CID1
	uint8 CID2;					//控制码的CID2
	uint8 length;
	uint8 data[max_command_length];		//
}T_order_info, *PT_order_info;

typedef struct change_pack_hex{
	uint32 length;
	uint8 hexgroup[max_data_info_length];
}T_change_pack_hex;



typedef struct rtn_pack {
	uint8 cSoi;
	uint8 cVer;
	uint32 iAddr;
	uint8 cScid;
	uint8 cCid1;
	uint8 cRtn;
	uint16 sLength;
	uint16 sChksum;
	uint8 cEoi;
	uint8 data[max_rtn_pack_length];
}T_rtn_pack, *PT_rtn_pack;

/*
*ver为版本号
*addr为设备地址
*scid为源设备地址
*cid1为设备类型
*rtn为返回码
*data为返回的数据
*data_length为返回数据的长度，以字节为单位
*/
typedef struct rtn_info {
	uint8 Ver;
	uint32 Addr;
	uint8 SCID;
	uint8 CID1;
	uint8 RTN;
	uint8 data[max_rtn_pack_length];
	uint32 data_length;
}T_rtn_info, *PT_rtn_info;

/*
*length为rtn包的长度
*hexgroup为rtn
*/
typedef struct rtn_pack_hex {
	uint32 length;
	uint8 hexgroup[max_rtn_pack_length];
}T_rtn_pack_hex, *PT_rtn_pack_hex;


/*解析帧数据函数
 *输入  ：3个，参数1为帧数据的地址，参数2为帧数据长度,参数3为结构体指针，用于接收解包的结果
 *输出  ：0为正常， -1为出错
 */
sint32 unpack(uint8* protocol_hexgroup, uint32 length, T_order_info* Order_info);


/*组织RTN帧数据函数
 *输入  ：2个，结构体PT_rtn_info,以及结构体指针tspi_send_ctrl_def
 *输出  ：0为正常，-1为出错
 */
sint32 rtn_to_pack(T_rtn_info rtn_info, tspi_send_ctrl_def *ptspi_send_ctrl);

sint8 protocol_job(void);

#endif
