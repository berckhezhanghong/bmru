// 
#ifndef __VERSION_H__
#define __VERSION_H__

#ifdef __cplusplus
extern "C" {
#endif


#define		SOFTWARE_VERSION	0x0103




uint16 get_app_version(uint8 *pu8str);
uint16 get_boot_version(uint8 *pu8str);
uint16 get_hardware_version(uint8 *pu8str);


#ifdef __cplusplus
}
#endif

#endif //#ifndef __VERSION_H__

