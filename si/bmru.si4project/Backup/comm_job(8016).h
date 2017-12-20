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


/*cid1宏定义*/
#define CID1_81 		0x81

/*cid1为81的cid2宏定义*/
#define CID1_81_CID2_01 0x01
#define CID1_81_CID2_02 0x02
#define CID1_81_CID2_03 0x03
#define CID1_81_CID2_04 0x04
#define CID1_81_CID2_10 0x10
#define CID1_81_CID2_20 0x20
#define CID1_81_CID2_21 0x21
#define CID1_81_CID2_31 0x31

/*协议处理函数
 *输入参数：2个，1为结构体T_order_info，包含cid1，cid2和控制数据等内容，2为T_rtn_info型指针，用来接收rtn值，以及测量到的数据，以及数据长度
 *输出参数：0表示正常，-1表示出错
 */
sint32 Action(T_order_info Order_info, T_rtn_info* Rtn_info);


#endif