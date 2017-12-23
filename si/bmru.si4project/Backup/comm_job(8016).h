/*
 * do_job.h
 *
 * Created: 2017-08-02 09:26:07
 *  Author: Administrator
 */ 
#include "basicdatatype.h"
#include "protocol.h"


#ifndef COMM_JOB_H_
#define COMM_JOB_H_


/*cid1�궨��*/
#define CID1_81 		0x81

/*cid1Ϊ81��cid2�궨��*/
#define CID1_81_CID2_01 0x01
#define CID1_81_CID2_02 0x02
#define CID1_81_CID2_03 0x03
#define CID1_81_CID2_04 0x04
#define CID1_81_CID2_10 0x10
#define CID1_81_CID2_20 0x20
#define CID1_81_CID2_21 0x21
#define CID1_81_CID2_31 0x31

/*Э�鴦����
 *���������2����1Ϊ�ṹ��T_order_info������cid1��cid2�Ϳ������ݵ����ݣ�2ΪT_rtn_info��ָ�룬��������rtnֵ���Լ������������ݣ��Լ����ݳ���
 *���������0��ʾ������-1��ʾ����
 */
sint32 Action(T_order_info Order_info, T_rtn_info* Rtn_info);


#endif