// 
// 
#include <asf.h>
#include "basicdatatype.h"
#include "version.h"



// 全局变量



// 函数实现
uint16 get_app_version(uint8 *pu8str)
{
	sprintf((char *)pu8str, "app ver:%u.%02u-%s %s", (SOFTWARE_VERSION / 0x100), (SOFTWARE_VERSION % 0x100), __DATE__, __TIME__);

	return strlen((char *)pu8str) + 1;
}


uint16 get_boot_version(uint8 *pu8str)
{
	#define		BOOT_VERSION	0x0101

	
	sprintf((char *)pu8str, "boot ver:%u.%02u", (BOOT_VERSION / 0x100), (BOOT_VERSION % 0x100));

	return strlen((char *)pu8str) + 1;
}


#define HARDWARE_VER0			PIN_PA30
#define HARDWARE_VER1			PIN_PA31
uint16 get_hardware_version(uint8 *pu8str)
{
	struct port_config pin_conf;
	uint8 u8ver;
	
	port_get_config_defaults(&pin_conf);

	port_pin_set_config(HARDWARE_VER0, &pin_conf);
	port_pin_set_config(HARDWARE_VER1, &pin_conf);

	u8ver = port_pin_get_input_level(HARDWARE_VER0) + port_pin_get_input_level(HARDWARE_VER1) * 2;

	sprintf((char *)pu8str, "hardware ver:1.%u", u8ver);

	return strlen((char *)pu8str) + 1;
}
