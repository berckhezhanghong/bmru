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


/* ͷ�ļ����� */
#include <device.h>
#include "basicdatatype.h"
#include "debug.h"
#include "timeout.h"
#include "cy8c3866.h"



/* ����ȫ�ֱ��� */
tDebugParaDef tDebugPara;

uint8  DebugBuf[DEBUG_PRINTF_BUFFER_LEN];//��ӡbuffer


/* ����ʵ�� */

/**********************************************************************
* ���������� // ��ȡ������Ϣ����
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //��
* ��������� //��
* ��������� //��
* ���ز����� //tDebugParaDef *������Ϣ����
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2012.07.19
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
tDebugParaDef *GetDebugPara(void)
{
	return &tDebugPara;
}


/**********************************************************************
* ���������� // ���Թ��ܳ�ʼ��
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //��
* ��������� //��
* ��������� //��
* ���ز����� //sint8 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2015.12.10
*   �� �� �ţ�v1.04
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
sint8 DebugInit(void)
{
	tDebugPara.u8DebugSwitch = DEBUG_SWITCH_OFF; // �������ʱON,���а汾ΪOFF
	tDebugPara.u8DebugLevel = DEBUG_LEVEL_0;  // Ĭ�ϵ����������

	// ע�⣬���ܿ����Ƿ�򿪣������������ʼӲ����һ�£�
	// ���������й����п���ͨ������򿪻�رյ������
	if(CONSOLE_PORT_UART1 == CONSOLE_PORT)
	{
		// �����uart1�����ԣ�������������uart�Ѿ��򿪣������ٲ���
		;
	}
	else if(CONSOLE_PORT_UART2 == CONSOLE_PORT)
	{
		// UART_2_Start();
		// UART_2_ClearRxBuffer();
	}
	
    return 0;
}

/**********************************************************************
* ���������� // ����ַ���debug��Ϣ
* ���ʵı� //��
* �޸ĵı� //��
* ��������� //uint8 u8DebugLevel ��־����ȼ�
* ��������� //uint8 *pu8Str Ҫ������ַ���
* ��������� //��
* ���ز����� //sint8 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.06.26
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
sint8 DebugStrOutput(uint8 u8DebugLevel, const uint8 *pu8Str)
{
    if(NULL == pu8Str)
    {
        return -1;
    }

	if(!tDebugPara.u8DebugSwitch)
	{
		// ���Կ��عر�
		return 0;
	}

	if(tDebugPara.u8DebugLevel < u8DebugLevel)
	{
		// ��������ȼ���Χ��
		return 0;
	}

	if(CONSOLE_PORT_UART1 == CONSOLE_PORT)
	{
		#ifndef UART_SEND_DMA_SUPPORT
		RS485TxEn(1);
		#endif
		CyDelayUs(10000);
		UART_1_PutString(pu8Str);
		CyDelayUs(10000);
		#ifndef UART_SEND_DMA_SUPPORT
		RS485TxEn(0);
		#endif
	}
	else if(CONSOLE_PORT_UART2 == CONSOLE_PORT)
	{
		// UART_2_PutString(pu8Str);
	}

	return 0;
}

// #if DEBUG_PRINTF
#if 0
sint8 PrintfPowerOnTimer(uint8 *pu8Name)
{
	tMsTimeDef tMsTime;
	GetPowerOnTimer(&tMsTime);
	sprintf(DebugBuf, "%s time:%ld,%d\r\n", pu8Name, tMsTime.u32Second, tMsTime.u16Msecond);
	DebugStrOutput(DEBUG_LEVEL_1, DebugBuf);

	return 0;
}
#endif

