// 
#ifndef __VERSION_H__
#define __VERSION_H__

#ifdef __cplusplus
extern "C" {
#endif


#define		SOFTWARE_VERSION	0x0103




uint16 GetAppVersion(uint8 *pu8Str);
uint16 GetBootVersion(uint8 *pu8Str);
uint16 GetHardwareVersion(uint8 *pu8Str);


#ifdef __cplusplus
}
#endif

#endif //#ifndef __VERSION_H__

