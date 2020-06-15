/*********************************************************************************************************//**
 * @file    ht32_rand.c
 * @version $Rev:: 1381         $
 * @date    $Date:: 2018-08-15 #$
 * @brief   The rundom number function.
 *************************************************************************************************************
 * @attention
 *
 * Firmware Disclaimer Information
 *
 * 1. The customer hereby acknowledges and agrees that the program technical documentation, including the
 *    code, which is supplied by Holtek Semiconductor Inc., (hereinafter referred to as "HOLTEK") is the
 *    proprietary and confidential intellectual property of HOLTEK, and is protected by copyright law and
 *    other intellectual property laws.
 *
 * 2. The customer hereby acknowledges and agrees that the program technical documentation, including the
 *    code, is confidential information belonging to HOLTEK, and must not be disclosed to any third parties
 *    other than HOLTEK and the customer.
 *
 * 3. The program technical documentation, including the code, is provided "as is" and for customer reference
 *    only. After delivery by HOLTEK, the customer shall use the program technical documentation, including
 *    the code, at their own risk. HOLTEK disclaims any expressed, implied or statutory warranties, including
 *    the warranties of merchantability, satisfactory quality and fitness for a particular purpose.
 *
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include <stdlib.h>

/* Global variables ----------------------------------------------------------------------------------------*/
__ALIGN4 static uc32 RandData[] =
{
  0x4fffe92d, 0xb0844948, 0x94016a4c, 0x94006b0c,
  0xf4446a4c, 0x624c3440, 0x4d446b0c, 0x630c432c,
  0x2135ea4f, 0xf004688c, 0xf5a40480, 0x608c4479,
  0x2403ea42, 0x4402ea44, 0x6403ea44, 0xea42610c,
  0xea442402, 0xea444403, 0x614c6403, 0x0282eb01,
  0x67142417, 0x0283eb01, 0x22016714, 0x2100f8c1,
  0xf042688a, 0x608a0280, 0x90c4f8df, 0x2004f8d9,
  0x4a309202, 0x93036853, 0x73fff64f, 0x3004f8c9,
  0xf8d96053, 0x69d7601c, 0x2104f8d1, 0x0201f042,
  0x2104f8c1, 0x2134f8d1, 0xd5fb0752, 0x2fb0f851,
  0x0b0ff002, 0xf002684a, 0x688a0e0f, 0x0a0ff002,
  0xf00268ca, 0x690a050f, 0x040ff002, 0xf002694a,
  0x698a030f, 0xf00269c9, 0xf8d0020f, 0xf8d9c000,
  0x44c4801c, 0xeb064466, 0x4f164607, 0xf8d76006,
  0xea4bc01c, 0xeb06180e, 0xea4f460c, 0xea4c2c0a,
  0xea483505, 0xea480805, 0xea444404, 0xea435303,
  0xea426202, 0x9a057101, 0x44114431, 0x98026001,
  0x0004f8c9, 0x60789803, 0x99014803, 0x99006241,
  0xb0086301, 0x8ff0e8bd, 0x40088000, 0x01000040,
  0x400b0000, 0x400b2000
};

__ALIGN4 static uc32 RandData2[] =
{
  0x4604b510, 0x18406800, 0x46216020, 0x68084a03,
  0x4a034350, 0x60081880, 0xbd100840, 0x41c64e6d,
  0x00003039
};

typedef void (*Randinit_TypeDef) (u32 *, u32, u32, u32);
u32 (*Rand_Get)(u32 *, u32);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Rand init.
  * @param  uSeed
  * @param  uCount
  * @param  a
  * @param  b
  * @retval none
  ***********************************************************************************************************/
void Rand_Init(u32 *uSeed, u32 uCount, u32 a, u32 b)
{
  Randinit_TypeDef Randinit = (Randinit_TypeDef)((u32)RandData | 0x1);
  Rand_Get = (u32 (*)(u32 *, u32))((u32)RandData2 | 0x1);
  Randinit(uSeed, uCount, a, b);
}
