// 
// 
#include "stdio.h"
#include "stm8l15x.h"
#include "basicdatatype.h"
#include "version.h"



// 全局变量



// 函数实现
uint16 GetAppVersion(uint8 *pu8Str)
{
	sprintf((char *)pu8Str, "app ver:%u.%02u-%s %s", (SOFTWARE_VERSION / 0x100), (SOFTWARE_VERSION % 0x100), __DATE__, __TIME__);

	return strlen((char *)pu8Str) + 1;
}


uint16 GetBootVersion(uint8 *pu8Str)
{
	#define		BOOT_VERSION	0x0101

	
	sprintf((char *)pu8Str, "boot ver:%u.%02u", (BOOT_VERSION / 0x100), (BOOT_VERSION % 0x100));

	return strlen((char *)pu8Str) + 1;
}


uint16 GetHardwareVersion(uint8 *pu8Str)
{
	uint8 u8ver;

	u8ver = 0;

	sprintf((char *)pu8Str, "hardware ver:1.%u", u8ver);

	return strlen((char *)pu8Str) + 1;
}
