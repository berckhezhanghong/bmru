/***********************************************************************
* Description:基本数据类型定义
* Others:
* Version:1.0
* Author:berck
* Date:2010-08-02
* 
* History 1:
*     Date: 
* 	  Version:
*     Author: 
*     Modification:  
* History 2:
**********************************************************************/
#ifndef __BASIC_DATA_TYPE_H__
#define __BASIC_DATA_TYPE_H__

#ifdef __cplusplus
extern "C" {
#endif

#define OFFICIAL_VERSION //
#define EMBED_VERSION //

#ifndef NULL 
#define NULL (void *)0
#endif

#ifndef bool
#define bool unsigned int
#endif

#ifndef TRUE 
#define TRUE 1
#endif

#ifndef FALSE 
#define FALSE 0
#endif 

#ifndef true 
#define true 1
#endif

#ifndef false 
#define false 0
#endif 

#define ARM_CM0

#ifdef ARM_CM0 
typedef signed char              sint8; //s8
typedef unsigned char            uint8; //u8

typedef signed int               sint16; //s16
typedef unsigned int             uint16; //u16

typedef signed long			     sint32; //s32
typedef unsigned long		     uint32; //u32

typedef	long double              float80; //f80
#endif //#ifdef ARM_CM0

#ifdef ARM9 
typedef signed char              sint8; //s8
typedef unsigned char            uint8; //u8

typedef signed short             sint16; //s16
typedef unsigned short           uint16; //u16

typedef signed int               sint32; //s32
typedef unsigned int             uint32; //u32

typedef signed long long         sint64; //s64
typedef unsigned long long       uint64; //u64

typedef	long double              float80; //f80
#endif //#ifdef ARM9 

#ifdef MPC8XX
#endif //#ifdef MPC8XX

#ifdef MPC82XX
#endif //#ifdef MPC8XX

#ifdef MEGA128
#endif //#ifdef MEGA128

#ifdef ARM7
#endif //#ifdef ARM7

#ifdef C51 //8 bit mcu
typedef	signed char              sint8;
typedef	unsigned char            uint8;

typedef	signed short             sint16;
typedef	unsigned short           uint16;

typedef	signed long              sint32;
typedef	unsigned long            uint32;
typedef	long double              float80;
#endif //#ifdef C51

#ifdef PIC
typedef	signed char              sint8;
typedef	unsigned char            uint8;

typedef	signed short             sint16;
typedef	unsigned short           uint16;

typedef	signed short long        sint24;
typedef	unsigned short long      uint24;

typedef	signed long              sint32;
typedef	unsigned long            uint32;
typedef	long double              float80;
#endif //#ifdef PIC

#ifdef I386EX 
typedef	signed char              sint8;
typedef	unsigned char            uint8;

typedef	signed short int         sint16;
typedef	unsigned short int       uint16;

typedef	signed long int          sint32;
typedef	unsigned long int        uint32;

typedef	long double              float80;
#endif //#ifdef I386EX 

#ifdef __cplusplus
}
#endif

#endif //#ifndef __BASIC_DATA_TYPE_H__

