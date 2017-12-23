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
*verΪ�汾��
*addrΪ�豸��ַ
*scidΪԴ�豸��ַ
*cid1Ϊ�豸����
*cid2Ϊ�豸������
*dataΪ�豸������Ӧ������
*/
typedef struct order_info {
	uint8 Ver;
	uint32 Addr;
	uint8 SCID;					//�������SCID
	uint8 CID1;					//�������CID1
	uint8 CID2;					//�������CID2
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
*verΪ�汾��
*addrΪ�豸��ַ
*scidΪԴ�豸��ַ
*cid1Ϊ�豸����
*rtnΪ������
*dataΪ���ص�����
*data_lengthΪ�������ݵĳ��ȣ����ֽ�Ϊ��λ
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
*lengthΪrtn���ĳ���
*hexgroupΪrtn
*/
typedef struct rtn_pack_hex {
	uint32 length;
	uint8 hexgroup[max_rtn_pack_length];
}T_rtn_pack_hex, *PT_rtn_pack_hex;


/*����֡���ݺ���
 *����  ��3��������1Ϊ֡���ݵĵ�ַ������2Ϊ֡���ݳ���,����3Ϊ�ṹ��ָ�룬���ڽ��ս���Ľ��
 *���  ��0Ϊ������ -1Ϊ����
 */
sint32 unpack(uint8* protocol_hexgroup, uint32 length, T_order_info* Order_info);


/*��֯RTN֡���ݺ���
 *����  ��2�����ṹ��PT_rtn_info,�Լ��ṹ��ָ��tspi_send_ctrl_def
 *���  ��0Ϊ������-1Ϊ����
 */
sint32 rtn_to_pack(T_rtn_info rtn_info, tspi_send_ctrl_def *ptspi_send_ctrl);

sint8 protocol_job(void);

#endif
