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
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "debug.h"



/* ����ȫ�ֱ��� */
tDebugParaDef tDebugPara;

uint8  DebugBuf[DEBUG_PRINTF_BUFFER_LEN];//��ӡbuffer


/* ����ʵ�� */

/**********************************************************************
* ���������� // ��ȡ������Ϣ����
* ���ʵı��� //��
* �޸ĵı��� //��
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
* ���ʵı��� //��
* �޸ĵı��� //��
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
	if(CONSOLE_PORT_UART0 == CONSOLE_PORT)
	{
		// �����uart1�����ԣ�������������uart�Ѿ��򿪣������ٲ���
		;
	}
	else if(CONSOLE_PORT_UART1 == CONSOLE_PORT)
	{

	}
	
    return 0;
}

/**********************************************************************
* ���������� // ����ַ���debug��Ϣ
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //uint8 u8DebugLevel ��־����ȼ�
* ��������� //uint8 *pu8Str Ҫ������ַ���
* ��������� //��
* ���ز����� //sint8 �ɹ�0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�
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

	if(CONSOLE_PORT_UART0 == CONSOLE_PORT)
	{

	}
	else if(CONSOLE_PORT_UART1 == CONSOLE_PORT)
	{

	}

	return 0;
}
