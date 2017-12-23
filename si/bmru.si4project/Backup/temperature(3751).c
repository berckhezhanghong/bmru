/*********************************************************************
* 内容摘要： // 温度采集部分功能代码
*            //
* 其它说明： //
* 当前版本： // v1.00.001
* 作    者： //
* 完成日期： // 2015.04.20
* 修改记录1：//
*    修改日期：
*    版 本 号：
*    修 改 人：
*    修改内容：
* 修改记录2:
**********************************************************************/

/* 头文件包含 */
#include <string.h>
// #include <intrins.h>
#include "stm8l15x.h"
#include "general_oper.h"
#include "timeout.h"
#include "debug.h"
#include "temperature.h"


#define  DS18B20    1        //定义使用DS18B20芯片

#define TEMPER_GPIO_PORT  			GPIOC
#define TEMPER1_GPIO_PIN  			GPIO_Pin_0
#define TEMPER2_GPIO_PIN  			GPIO_Pin_1
#define TEMPER_POWER_GPIO_PIN  		GPIO_Pin_4

#define PIN_DIR_INPUT  				0
#define PIN_DIR_OUTPUT  			1


// temper1: 
// temper2: 
// temper power

/* 定义全局变量 */
tTempSampleCtrlDef tTempSampleCtrl;

extern uint8 DebugBuf[DEBUG_PRINTF_BUFFER_LEN];

/* 函数实现 */
static void Pin_temper1_Dir(uint8 u8Type)
{
	if(PIN_DIR_INPUT == u8Type)
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
	}
	else
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	}
}


static void Pin_temper2_Dir(uint8 u8Type)
{
	if(PIN_DIR_INPUT == u8Type)
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
	}
	else
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	}
}


static void Pin_temper1_Write(uint8 u8Data)
{
	if(0 == u8Data)
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
	}
	else
	{
		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, 1);
	}
}


static void Pin_temper2_Write(uint8 u8Data)
{
	if(0 == u8Data)
	{
		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, 0);
	}
	else
	{
		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, 1);
	}
}


static uint8 Pin_temper1_Read(void)
{
	if(0 == GPIO_ReadInputDataBit(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN))
	{
		return 0;         //
	}
	else
	{
		return 1;         //
	}
}


static uint8 Pin_temper2_Read(void)
{
	if(0 == GPIO_ReadInputDataBit(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN))
	{
		return 0;         //
	}
	else
	{
		return 1;         //
	}
}


static void TemperPowerCtrl(uint8 u8Type)
{
	if(0 == u8Type)
	{
		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, 1);
	}
	else
	{
		GPIO_WriteBit(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, 0);
	}

}



/**********************************************************************
* 功能描述： // 温度传感器的crc校验
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint8* pRead 待校验的数据
* 输出参数： //无
* 返回参数： //uint8 0 表示校验正确，其它表示校验错误
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.03
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
static uint8 TempCRCResult(uint8* pRead)
{
	uint8 i;
	uint8 j;
	uint8 CrcData=0;
	uint8 *pbTmp=NULL;
	uint8  pabDataBuff[9];

	pbTmp=pRead;
	for(i=0;i<9;i++)	/*包括CRC值共9个字节*/
	{
		pabDataBuff[i]=*pbTmp;
		pbTmp++;
		for(j=0;j<8;j++)
		/*按照传感器CRC生成多项式X8+X5+X4+1,对读取得9个字节，进行校验*/
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
	/*返回校验值，根据CRC检验原理，此处最后生成的值应为0*/
}


/**********************************************************************
* 功能描述： // 单总线写一个字节
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint8 u8Channal 传感器通道
* 输入参数： //uint8 u8Status 写入的字节
* 输出参数： //无
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.03
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
static sint32 OneWireByteWrite(uint8 u8Channal, uint8 u8Status)
{
	uint8 i;
	uint8 u8Tmp;

	if(0 == u8Channal)
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	}
	else if(1 == u8Channal)
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	}
	
	for(i = 0; i < 8; i++)
	{
		u8Tmp = u8Status >> i;
		u8Tmp &= 0x01;
		// 第1个温度传感器
		if(0 == u8Channal)
		{
			Pin_temper1_Write(0);
			if(u8Tmp)
			{
				UsDelay(10);
				Pin_temper1_Write(1);
				UsDelay(80);
			}
			else
			{
				UsDelay(80);
				Pin_temper1_Write(1);
				UsDelay(10);
			}
		}
		else if(1 == u8Channal)
		{
			Pin_temper2_Write(0);
			if(u8Tmp)
			{
				UsDelay(10);
				Pin_temper2_Write(1);
				UsDelay(80);
			}
			else
			{
				UsDelay(80);
				Pin_temper2_Write(1);
				UsDelay(10);
			}
		}
		
	}

    return 0;
}


/**********************************************************************
* 功能描述： // 单总线读一个字节
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint8 u8Channal 传感器通道
* 输出参数： //无
* 返回参数： //uint8 读出的字节
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.03
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
static uint8 OneWireByteRead(uint8 u8Channal)
{
	uint8 i;

	uint8 u8Value;
	uint8 u8Tmp;

	u8Value = 0;

	if(0 == u8Channal)
	{
		for (i = 0; i < 8; i ++)
		{
			GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
			Pin_temper1_Write(0);
			nop();
			nop();
			UsDelay(1);
			Pin_temper1_Write(1);
			nop();
			nop();
			UsDelay(1);
			
			GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
			u8Tmp = Pin_temper1_Read();
			if (u8Tmp)
			{
				u8Value |= 1 << i;
			}
			UsDelay(80);
		}
	}

	else if(1 == u8Channal)
	{
		for (i = 0; i < 8; i ++)
		{
			GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
			Pin_temper2_Write(0);
			nop();
			nop();
			UsDelay(1);
			Pin_temper2_Write(1);
			nop();
			nop();

			GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
			u8Tmp = Pin_temper2_Read();
			if (u8Tmp)
			{
				u8Value |= 1 << i;
			}
			UsDelay(80);
		}
	}

	return u8Value;
}


/**********************************************************************
* 功能描述： // 软重启所有温度传感器
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint8 u8Channal 传感器通道
* 输出参数： //无
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.04
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
static uint8 OneWireReset(uint8 u8Channal)
{
	uint8 u8Result;

	if(0 == u8Channal)
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
		Pin_temper1_Write(0);
		UsDelay(750);

		Pin_temper1_Write(1);
		UsDelay(50);

		GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
		u8Result = Pin_temper1_Read();
		UsDelay(500);
	}
	
	else if(1 == u8Channal)
	{
		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
		Pin_temper2_Write(0);
		UsDelay(750);

		Pin_temper2_Write(1);
		UsDelay(50);

		GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_In_PU_No_IT);
		u8Result = Pin_temper2_Read();
		UsDelay(500);
	}
	
	else
	{
		u8Result = 0xff;
	}

	return u8Result;
}


/**********************************************************************
* 功能描述： // 启动所有温度传感器开始采集
* 访问的表： //无
* 修改的表： //无
* 输入参数： //无
* 输出参数： //无
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.04
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
static sint32 Ds18B20StartAllConvert(void)
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
* 功能描述： // 从单总线中读取一个传感器的转换数据
* 访问的表： //无
* 修改的表： //无
* 输入参数： //uint8 u8Channal 传感器通道
* 输入参数： //tTemperReadDef *ptTemperRead 读取结果
* 输出参数： //读取的温度值与传感器状态
* 返回参数： //成功 0 失败 -1
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.04
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
static sint16 Ds18B20Read(uint8 u8Channal, tTemperReadDef *ptTemperRead)
{
    uint8 pu8Value[10] = {0};
	uint8 u8LSB;
	uint8 u8MSB;
	sint16 s16Tmp = 0;

	uint8 i;

	OneWireReset(u8Channal);
	OneWireByteWrite(u8Channal, 0xcc);
    OneWireByteWrite(u8Channal ,0xbe);

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
		else if(u8MSB == 0x1f) //negative value
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



static sint16 TemperFilter(sint16 *ps16TempBuf, sint16 s16Temp, sint16 s16TempCurrent, uint8 u8Sta)
{
	uint8 i;
	sint16 s16Variation;
	
	if(NULL == ps16TempBuf)
	{
		return TEMP_ERROR_VALUE;
	}

	// 采集失败直接返回
	if(TEMP_ERROR_VALUE == s16Temp)
	{
		return TEMP_ERROR_VALUE;
	}

	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
	{
		if(DS1820_STATUS_OK != u8Sta)
		{
			ps16TempBuf[i - 1] = s16Temp;
		}
		else
		{
			ps16TempBuf[i - 1] = ps16TempBuf[i];
		}
		
	}
	ps16TempBuf[TEMPERATURE_FILTER_NUM - 1] = s16Temp;

	for(i = 1; i < TEMPERATURE_FILTER_NUM; i ++)
	{
		// 采集异常值不参入比较
		if((TEMP_ERROR_VALUE == ps16TempBuf[i]) || (TEMP_ERROR_VALUE == ps16TempBuf[i - 1]))
		{
			continue;
		}
		else
		{
			s16Variation = ps16TempBuf[i] - ps16TempBuf[i - 1];

			// 有跳变，值不更新
			if(((0 - TEMPER_FILTER_MAX_VARIATION) > s16Variation) || 
			   (TEMPER_FILTER_MAX_VARIATION < s16Variation))
			{
				return s16TempCurrent;
			}
		}
	}

	return s16Temp;
}


#define  TEMPER_ERROR_85			850
#define  TEMPER_ERROR_85_FLP		200
#define  TEMPER_ERROR_85_FLN		(-200)
// 出现突变的85度，认为是采集失败的
uint8 temper_85_err_check(sint16 s16temp, sint16 s16temp_last)
{
	sint16 s16data;

	s16data = s16temp - s16temp_last;
	
	if((TEMPER_ERROR_85 == s16temp) && 
	   ((TEMPER_ERROR_85_FLP < s16data) || (TEMPER_ERROR_85_FLN > s16data)))
	{
		return 0;
	}
	else
	{
		return 1;
	}
}


/**********************************************************************
* 功能描述： // 读取所有传感器温度
* 访问的表： //无
* 修改的表： //无
* 输入参数： //tBatteryInfoDef *ptBatteryInfo 电池信息
* 输出参数： //无
* 返回参数： //
* 其它说明： //无
* 修改记录1：//无
*   修改日期：2013.07.04
*   版 本 号：v1.00.001
*   修 改 人：
*   修改内容：
***********************************************************************/
static sint32 Ds18B20ReadAll(void)
{
	tTemperReadDef tTemperRead;
	uint8 i, j;

	sint32 s32Ret;

	for(i = 0; i < TEMPRATURE_MAX_NUM; i ++)
	{
		tTemperRead.s16Temp = - 2730;
		s32Ret = Ds18B20Read(i, &tTemperRead);

		#if DEBUG_PRINTF
		//debug 输出采集到的电压
		sprintf((char *)DebugBuf, "temperature%u:%d\r\n", (uint16)i, tTemperRead.s16Temp);
		DebugStrOutput(DEBUG_LEVEL_3, DebugBuf);
		#endif
			
		if((0 == s32Ret)&& 
		   (temper_85_err_check(tTemperRead.s16Temp, tTempSampleCtrl.tTemperData[i].s16Temp[TEMPER_SAMPLE_NUM - 1])))
		{
			// 温度滤波
			tTemperRead.s16Temp = TemperFilter(tTempSampleCtrl.tTemperData[i].s16TempBuf, tTemperRead.s16Temp, 
											   tTempSampleCtrl.tTemperData[i].s16Temp[TEMPER_SAMPLE_NUM - 1], 
											   tTempSampleCtrl.u8Ds18b20Status[i]);
			
			for(j = 1; j < TEMPER_SAMPLE_NUM; j ++)
			{
				tTempSampleCtrl.tTemperData[i].s16Temp[j - 1] = tTempSampleCtrl.tTemperData[i].s16Temp[j];
			}
			tTempSampleCtrl.tTemperData[i].s16Temp[TEMPER_SAMPLE_NUM - 1] = tTemperRead.s16Temp;

			tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_OK;
			tTempSampleCtrl.u8FailCnt[i] = 0;

			// 每个温度传感器占1Byte，全0表示无故障
			if(0 == i)
			{
				tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
			}
			else if(1 == i)
			{
				tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
			}
		}
		else if(0 != s32Ret)
		{
			tTempSampleCtrl.u8FailCnt[i] ++;
			if(TEMPER_FAIL_MAXTIMES < tTempSampleCtrl.u8FailCnt[i])
			{
				for(j = 1; j < TEMPER_SAMPLE_NUM; j ++)
				{
					tTempSampleCtrl.tTemperData[i].s16Temp[j - 1] = tTempSampleCtrl.tTemperData[i].s16Temp[j];
				}
				tTempSampleCtrl.tTemperData[i].s16Temp[TEMPER_SAMPLE_NUM - 1] = TEMP_ERROR_VALUE;

				tTempSampleCtrl.u8Ds18b20Status[i] = DS1820_STATUS_ERROR;
				// 置失败次数到最大，避免一直往上加溢出
				tTempSampleCtrl.u8FailCnt[i] = TEMPER_FAIL_MAXTIMES;

				// 每个温度传感器占1Byte，全0表示无故障
				if(0 == i)
				{
					tTempSampleCtrl.u32ErrorCode &= 0xffffff00;
					tTempSampleCtrl.u32ErrorCode |= 0x00000001;
				}
				else if(1 == i)
				{
					tTempSampleCtrl.u32ErrorCode &= 0xffff00ff;
					tTempSampleCtrl.u32ErrorCode |= 0x00000100;
				}
			}
		}
	}

	// Pin_temper1_Write(0);
	// Pin_temper2_Write(0);

	return 0;
}


// 温度采集任务
sint8 TemperTask(void)
{	
	#if 0
	if(DS18B20_STATUS_CONVERTING == tTempSampleCtrl.u8TempSampleStatus)
	{		
		if(IsMsTimeout(&tTempSampleCtrl.tDSConvertTimeout))
		{
			Ds18B20ReadAll();
			
			// 关闭温度传感器电源
			TemperPowerCtrl(0);

			// 温度已经读到数据或已经确定读取失败，可以回复上行数据了
			if(((DS1820_STATUS_OK == tTempSampleCtrl.u8Ds18b20Status[0]) ||
			    (DS1820_STATUS_ERROR == tTempSampleCtrl.u8Ds18b20Status[0])) &&
			   ((DS1820_STATUS_OK == tTempSampleCtrl.u8Ds18b20Status[1]) ||
			    (DS1820_STATUS_ERROR == tTempSampleCtrl.u8Ds18b20Status[1])))
			{
				tTempSampleCtrl.u8TempOk = 1;
			}
			
			tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_IDLE;

		}	
	}
	else if(DS18B20_STATUS_IDLE == tTempSampleCtrl.u8TempSampleStatus)
	{	
		if(IsMsTimeout(&tTempSampleCtrl.tTempSampleTimeout) || 
		   (tTempSampleCtrl.u8SampleFlag))
		{			
			// 打开温度传感器电源			
			TemperPowerCtrl(1);
			MsDelay(5);
			Ds18B20StartAllConvert();
			
			InitMsTimeout(&tTempSampleCtrl.tDSConvertTimeout, TEMPER_CONVERT_TIME);		
			tTempSampleCtrl.u8TempSampleStatus = DS18B20_STATUS_CONVERTING;
			
			InitMsTimeout(&tTempSampleCtrl.tTempSampleTimeout, TEMPER_SAMPLE_INTERVAL);
			tTempSampleCtrl.u8SampleFlag = 0;
		}
	}
	#endif

#if 0
	TemperPowerCtrl(1);
	MsDelay(5);
	Ds18B20StartAllConvert();
	MsDelay(1000);
	Ds18B20ReadAll();
#endif

	GPIO_ToggleBits(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN);
	GPIO_ToggleBits(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN);
	MsDelay(500);
	
	return 0;
}


tTempSampleCtrlDef *GetTemperInfo(void)
{
	return &tTempSampleCtrl;
}


sint8 TemperTaskInit(void)
{
	GPIO_Init(TEMPER_GPIO_PORT, TEMPER_POWER_GPIO_PIN, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(TEMPER_GPIO_PORT, TEMPER1_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
	GPIO_Init(TEMPER_GPIO_PORT, TEMPER2_GPIO_PIN, GPIO_Mode_Out_PP_High_Fast);
		
	memset(&tTempSampleCtrl, 0, sizeof(tTempSampleCtrlDef));

	InitMsTimeout(&tTempSampleCtrl.tTempSampleTimeout, TEMPER_SAMPLE_INTERVAL_INIT);
	tTempSampleCtrl.u8SampleFlag = 0;
	
	return 0;
}
