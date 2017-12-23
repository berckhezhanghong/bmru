/*********************************************************************
* ����ժҪ�� // �¶Ȳɼ����ֹ��ܴ���
*            //
* ����˵���� //
* ��ǰ�汾�� // v1.00.001
* ��    �ߣ� //
* ������ڣ� // 2015.06.20
* �޸ļ�¼1��//
*    �޸����ڣ�
*    �� �� �ţ�
*    �� �� �ˣ�
*    �޸����ݣ�
* �޸ļ�¼2:
**********************************************************************/

/* ͷ�ļ����� */
#include <device.h>
#include "ds18b20.h"
#include "dataacq.h"


#define  DS18B20    1        //����ʹ��DS18B20оƬ


/* ����ȫ�ֱ��� */




/* ����ʵ�� */

/**********************************************************************
* ���������� // �¶ȴ�������crcУ��
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //uint8* pRead ��У�������
* ��������� //��
* ���ز����� //uint8 0 ��ʾУ����ȷ��������ʾУ�����
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.03
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
uint8 TempCRCResult(uint8* pRead)
{
	uint8 i;
	uint8 j;
	uint8 CrcData=0;
	uint8 *pbTmp=NULL;
	uint8  pabDataBuff[9];

	pbTmp=pRead;
	for(i=0;i<9;i++)	/*����CRCֵ��9���ֽ�*/
	{
		pabDataBuff[i]=*pbTmp;
		pbTmp++;
		for(j=0;j<8;j++)
		/*���մ�����CRC���ɶ���ʽX8+X5+X4+1,�Զ�ȡ��9���ֽڣ�����У��*/
		{
			if((CrcData^pabDataBuff[i])&0x01)
			{
				CrcData=CrcData^0x18;
				CrcData>>=1;
				CrcData=CrcData|0x80;
			}
			else
			{
				CrcData>>=1;
			}
			pabDataBuff[i]>>=1;
		}
	}
	return CrcData;
	/*����У��ֵ������CRC����ԭ�����˴�������ɵ�ֵӦΪ0*/
}


/**********************************************************************
* ���������� // ������дһ���ֽ�
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //uint8 u8Channal ������ͨ��
* ��������� //uint8 u8Status д����ֽ�
* ��������� //��
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.03
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
sint32 OneWireByteWrite(uint8 u8Channal, uint8 u8Status)
{
	uint8 i;
	uint8 u8Tmp;

	for(i = 0; i < 8; i++)
	{
		u8Tmp = u8Status >> i;
		u8Tmp &= 0x01;
		// ��1���¶ȴ�����
		if(0 == u8Channal)
		{
			Pin_temper1_Write(0);
			if(u8Tmp)
			{
				// CyDelayUs(8);
				CyDelayUs(3);
				Pin_temper1_Write(1);
				CyDelayUs(100);
			}
			else
			{
				// CyDelayUs(110);
				CyDelayUs(105);
				Pin_temper1_Write(1);
				CyDelayUs(15);

			}
		}

		#if (4 == TEMPRATURE_MAX_NUM)
		else if(1 == u8Channal)
		{
			Pin_temper2_Write(0);
			if(u8Tmp)
			{
				// CyDelayUs(8);
				CyDelayUs(3);
				Pin_temper2_Write(1);
				CyDelayUs(100);
			}
			else
			{
				// CyDelayUs(110);
				CyDelayUs(105);
				Pin_temper2_Write(1);
				CyDelayUs(15);

			}
		}
		else if(2 == u8Channal)
		{
			Pin_temper3_Write(0);
			if(u8Tmp)
			{
				// CyDelayUs(8);
				CyDelayUs(3);
				Pin_temper3_Write(1);
				CyDelayUs(100);
			}
			else
			{
				// CyDelayUs(110);
				CyDelayUs(105);
				Pin_temper3_Write(1);
				CyDelayUs(15);

			}
		}
		else if(3 == u8Channal)
		{
			Pin_temper4_Write(0);
			if(u8Tmp)
			{
				// CyDelayUs(8);
				CyDelayUs(3);
				Pin_temper4_Write(1);
				CyDelayUs(100);
			}
			else
			{
				// CyDelayUs(110);
				CyDelayUs(105);
				Pin_temper4_Write(1);
				CyDelayUs(15);

			}
		}
		#endif
		
	}

    return 0;
}


/**********************************************************************
* ���������� // �����߶�һ���ֽ�
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //uint8 u8Channal ������ͨ��
* ��������� //��
* ���ز����� //uint8 �������ֽ�
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.03
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
uint8 OneWireByteRead(uint8 u8Channal)
{
	uint8 i;

	uint8 u8Value;
	uint8 u8Tmp;

	u8Value = 0;

	if(0 == u8Channal)
	{
		for (i = 0; i < 8; i ++)
		{
			Pin_temper1_Write(0);
			// CyDelayUs(6);
			CyDelayUs(3);
			Pin_temper1_Write(1);
			// CyDelayUs(8);
			CyDelayUs(5);
			u8Tmp = Pin_temper1_Read();
			if (u8Tmp)
			{
				u8Value |= 1 << i;
			}
			CyDelayUs(80);
		}
	}

	#if (4 == TEMPRATURE_MAX_NUM)
	else if(1 == u8Channal)
	{
		for (i = 0; i < 8; i ++)
		{
			Pin_temper2_Write(0);
			// CyDelayUs(6);
			CyDelayUs(3);
			Pin_temper2_Write(1);
			// CyDelayUs(8);
			CyDelayUs(5);
			u8Tmp = Pin_temper2_Read();
			if (u8Tmp)
			{
				u8Value |= 1 << i;
			}
			CyDelayUs(80);
		}
	}
	else if(2 == u8Channal)
	{
		for (i = 0; i < 8; i ++)
		{
			Pin_temper3_Write(0);
			// CyDelayUs(6);
			CyDelayUs(3);
			Pin_temper3_Write(1);
			// CyDelayUs(8);
			CyDelayUs(5);
			u8Tmp = Pin_temper3_Read();
			if (u8Tmp)
			{
				u8Value |= 1 << i;
			}
			CyDelayUs(80);
		}
	}
	else if(3 == u8Channal)
	{
		for (i = 0; i < 8; i ++)
		{
			Pin_temper4_Write(0);
			// CyDelayUs(6);
			CyDelayUs(3);
			Pin_temper4_Write(1);
			// CyDelayUs(8);
			CyDelayUs(5);
			u8Tmp = Pin_temper4_Read();
			if (u8Tmp)
			{
				u8Value |= 1 << i;
			}
			CyDelayUs(80);
		}
	}
	#endif

	return u8Value;
}


/**********************************************************************
* ���������� // �����������¶ȴ�����
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //uint8 u8Channal ������ͨ��
* ��������� //��
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.04
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
uint8 OneWireReset(uint8 u8Channal)
{
	uint8 u8Result;

	if(0 == u8Channal)
	{
		Pin_temper1_Write(0);
		// CyDelayUs(500);
		CyDelayUs(600);

		Pin_temper1_Write(1);
		CyDelayUs(50);

		u8Result = Pin_temper1_Read();
		CyDelayUs(450);
	}
	
	#if (4 == TEMPRATURE_MAX_NUM)
	else if(1 == u8Channal)
	{
		Pin_temper2_Write(0);
		// CyDelayUs(500);
		CyDelayUs(600);

		Pin_temper2_Write(1);
		CyDelayUs(50);

		u8Result = Pin_temper2_Read();
		CyDelayUs(450);
	}
	else if(2 == u8Channal)
	{
		Pin_temper3_Write(0);
		// CyDelayUs(500);
		CyDelayUs(600);

		Pin_temper3_Write(1);
		CyDelayUs(50);

		u8Result = Pin_temper3_Read();
		CyDelayUs(450);
	}
	else if(3 == u8Channal)
	{
		Pin_temper4_Write(0);
		// CyDelayUs(500);
		CyDelayUs(600);

		Pin_temper4_Write(1);
		CyDelayUs(50);

		u8Result = Pin_temper4_Read();
		CyDelayUs(450);
	}
	#endif
	
	else
	{
		u8Result = 0xff;
	}

	return u8Result;
}


/**********************************************************************
* ���������� // ���������¶ȴ�������ʼ�ɼ�
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //��
* ��������� //��
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.04
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
sint32 Ds18B20StartAllConvert(void)
{
	uint8 i;

	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
	{
		OneWireReset(i);
		OneWireByteWrite(i, 0xcc);
    	OneWireByteWrite(i ,0x44);
	}

	return 0;
}


/**********************************************************************
* ���������� // �ӵ������ж�ȡһ����������ת������
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //uint8 u8Channal ������ͨ��
* ��������� //tTemperReadDef *ptTemperRead ��ȡ���
* ��������� //��ȡ���¶�ֵ�봫����״̬
* ���ز����� //�ɹ� 0 ʧ�� -1
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.04
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
sint16 Ds18B20Read(uint8 u8Channal, tTemperReadDef *ptTemperRead)
{
    uint8 pu8Value[10];
	uint8 u8LSB;
	uint8 u8MSB;
	sint16 s16Tmp = 0;

	uint8 i;

	OneWireReset(u8Channal);
	OneWireByteWrite(u8Channal, 0xcc);
    OneWireByteWrite(u8Channal ,0xbe);

	memset(pu8Value, 0, 10);
	for(i = 0; i < 9; i ++)
	{
		pu8Value[i] = OneWireByteRead(u8Channal);
	}
	if (pu8Value[5] != 0xFF)
	{
		return -1;
	}

	if(!TempCRCResult(pu8Value))
	{
		u8LSB = pu8Value[0];
		u8MSB = pu8Value[1];

#ifdef DS18B20
        u8LSB >>= 3;
        u8LSB &= 0x1F;

        u8LSB = u8LSB | ((u8MSB & 0x07) << 5);

        u8MSB >>= 3;
        u8MSB &= 0x1F;
#endif
		if(u8MSB == 0)
		{
			s16Tmp = u8LSB >> 1;
			s16Tmp *= 10;
			if(u8LSB & 0x01) //LSB represent 0.5
			{
				s16Tmp += 5;
			}
		}
#ifdef DS18B20
		else if(u8MSB == 0x1f)
#else
		else if(u8MSB == 0xff) //negative value
#endif
		{
			u8LSB = (~u8LSB) + 1;
			s16Tmp = u8LSB >> 1;
			s16Tmp *= 10;
			if(u8LSB & 0x01) //LSB represent 0.5
			{
				s16Tmp += 5;
			}
			s16Tmp *= -1;
		}

		if((s16Tmp >= 1000) || (s16Tmp < -550)) //illegal value
		{
			ptTemperRead->u8Status = FALSE;
			return -1;
		}
		else
		{
			ptTemperRead->s16Temp = s16Tmp;
			ptTemperRead->u8Status = TRUE;
		}
	}
	else
	{
		ptTemperRead->u8Status = FALSE;
		return -1;
	}

	return 0;
}



sint16 TemperFilter(sint16 *ps16TempBuf, sint16 s16Temp, sint16 s16TempCurrent)
{
	uint8 i;
	sint16 s16Variation;
	
	if(NULL == ps16TempBuf)
	{
		return TEMP_ERROR_VALUE;
	}

	// �ɼ�ʧ��ֱ�ӷ���
	if(TEMP_ERROR_VALUE == s16Temp)
	{
		return TEMP_ERROR_VALUE;
	}

	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
	{
		ps16TempBuf[i - 1] = ps16TempBuf[i];
	}
	ps16TempBuf[TEMPERATURE_FILTER_NUM - 1] = s16Temp;

	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
	{
		// �ɼ��쳣ֵ������Ƚ�
		if((TEMP_ERROR_VALUE == ps16TempBuf[i]) || (TEMP_ERROR_VALUE == ps16TempBuf[i - 1]))
		{
			continue;
		}
		else
		{
			s16Variation = ps16TempBuf[i] - ps16TempBuf[i - 1];

			// �����䣬ֵ������
			if(((0 - TEMPER_FILTER_MAX_VARIATION) > s16Variation) || 
			   (TEMPER_FILTER_MAX_VARIATION < s16Variation))
			{
				return s16TempCurrent;
			}
		}
	}

	return s16Temp;
}


/**********************************************************************
* ���������� // ��ȡ���д������¶�
* ���ʵı��� //��
* �޸ĵı��� //��
* ��������� //tBatteryInfoDef *ptBatteryInfo �����Ϣ
* ��������� //��
* ���ز����� //
* ����˵���� //��
* �޸ļ�¼1��//��
*   �޸����ڣ�2013.07.04
*   �� �� �ţ�v1.00.001
*   �� �� �ˣ�
*   �޸����ݣ�
***********************************************************************/
sint32 Ds18B20ReadAll(tBatteryInfoDef *ptBatteryInfo)
{
	tTemperReadDef tTemperRead;
	uint8 i, j;

	sint32 s32Ret;

	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
	{
		s32Ret = Ds18B20Read(i, &tTemperRead);

		// �ɼ���85����Ϊ�ǲɼ�ʧ��
		if(850 == tTemperRead.s16Temp)
		{
			s32Ret = -1;
		}
		
		if(0 == s32Ret)
		{
			// �¶��˲�
			tTemperRead.s16Temp = TemperFilter(ptBatteryInfo->tCellData[i].s16TempBuf, tTemperRead.s16Temp, 
											   ptBatteryInfo->tCellData[i].s16Temp[VOLTAGE_SAMPLE_NUM - 1]);
			
			for(j = 1; j < VOLTAGE_SAMPLE_NUM; j ++)
			{
				ptBatteryInfo->tCellData[i].s16Temp[j - 1] = ptBatteryInfo->tCellData[i].s16Temp[j];
			}
			ptBatteryInfo->tCellData[i].s16Temp[VOLTAGE_SAMPLE_NUM - 1] = tTemperRead.s16Temp;

			ptBatteryInfo->tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_OK;
			ptBatteryInfo->tTempSampleCtrl.u8FailCnt[i] = 0;

			// ÿ���¶ȴ�����ռ1Byte��ȫ0��ʾ�޹���
			if(0 == i)
			{
				ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
			}
			#if (4 == TEMPRATURE_MAX_NUM)
			else if(1 == i)
			{
				ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
			}
			else if(2 == i)
			{
				ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0xff00ffff;
			}
			else if(3 == i)
			{
				ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0x00ffffff;
			}
			#endif
		}
		else
		{
			ptBatteryInfo->tTempSampleCtrl.u8FailCnt[i] ++;
			if(TEMPER_FAIL_MAXTIMES < ptBatteryInfo->tTempSampleCtrl.u8FailCnt[i])
			{
				for(j = 1; j < VOLTAGE_SAMPLE_NUM; j ++)
				{
					ptBatteryInfo->tCellData[i].s16Temp[j - 1] = ptBatteryInfo->tCellData[i].s16Temp[j];
				}
				ptBatteryInfo->tCellData[i].s16Temp[VOLTAGE_SAMPLE_NUM - 1] = TEMP_ERROR_VALUE;

				ptBatteryInfo->tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_ERROR;
				// ��ʧ�ܴ�������󣬱���һֱ���ϼ����
				ptBatteryInfo->tTempSampleCtrl.u8FailCnt[i] = TEMPER_FAIL_MAXTIMES;

				// ÿ���¶ȴ�����ռ1Byte��ȫ0��ʾ�޹���
				if(0 == i)
				{
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode |= 0x00000001;
				}
				#if (4 == TEMPRATURE_MAX_NUM)
				else if(1 == i)
				{
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode |= 0x00000100;
				}
				else if(2 == i)
				{
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0xff00ffff;
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode |= 0x000010000;
				}
				else if(3 == i)
				{
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode &= 0x00ffffff;
					ptBatteryInfo->tTempSampleCtrl.u32ErrorCode |= 0x01000000;
				}
				#endif
			}
		}
	}

	Pin_temper1_Write(0);
	#if (4 == TEMPRATURE_MAX_NUM)
	Pin_temper2_Write(0);
	Pin_temper3_Write(0);
	Pin_temper4_Write(0);
	#endif

	return 0;
}