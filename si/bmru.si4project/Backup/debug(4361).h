/*********************************************************************
* ����ժҪ�� // ����ʹ�õĺ���
*            //
* ����˵���� //
* ��ǰ�汾�� // v1.00.001
* ��    �ߣ� //
* ������ڣ� // 2015.06.26
* �޸ļ�¼1��//
*    �޸����ڣ�
*    �� �� �ţ�
*    �� �� �ˣ�
*    �޸����ݣ�
* �޸ļ�¼2:
**********************************************************************/

#ifndef DEBUG_H_
#define DEBUG_H_

/* ͷ�ļ����� */
#include "basicdatatype.h"

/* �궨�� */

#define DEBUG_PRINTF                1 // ��ӡ������뿪��
#define DEBUG_PRINTF_BUFFER_LEN     60  //��ӡ����������


#define CONSOLE_PORT_UART0			11
#define CONSOLE_PORT_UART1			12


#define CONSOLE_PORT				CONSOLE_PORT_UART0

#define DEBUG_SWITCH_ON				1 // �����������
#define DEBUG_SWITCH_OFF			0 // �����������

#define DEBUG_LEVEL_0				0 // ��������ȼ�0,�������
#define DEBUG_LEVEL_1				1 // ��������ȼ�1,��ǿ������ȼ��������ڴ������ʱ���ָ���ĵ�����Ϣ��
									  // ���ֲ��������Ķ������̫�࣬�������ߣ���ʽ�汾�в�Ӧ�д˼������
#define DEBUG_LEVEL_2				2 // ��������ȼ�2,�����Ҫ��Ϣ
#define DEBUG_LEVEL_3				3 // ��������ȼ�3,�������
#define DEBUG_LEVEL_4				4 // ��������ȼ�4,���������Ϣ


/* ���ݽṹ���� */

// ������Ϣ
typedef struct tDebugParaDef
{
	uint8 u8DebugSwitch; // �����������
    uint8 u8DebugLevel; // ��������ȼ�
}tDebugParaDef;


/* �������� */
extern uint8 DebugBuf[DEBUG_PRINTF_BUFFER_LEN]; // ��ӡbuffer

extern tDebugParaDef *GetDebugPara(void);

extern sint8 DebugInit(void);

extern sint8 DebugStrOutput(const uint8 u8DebugLevel, const uint8 *pu8Str);

#endif /* DEBUG_H_ */
