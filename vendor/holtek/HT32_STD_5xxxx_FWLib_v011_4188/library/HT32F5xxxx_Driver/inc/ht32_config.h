/*********************************************************************************************************//**
 * @file    ht32_config.h
 * @version $Rev:: 4035         $
 * @date    $Date:: 2019-07-15 #$
 * @brief   Configuration file of HT32.
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
/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32_CONFIG_H
#define __HT32_CONFIG_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Settings ------------------------------------------------------------------------------------------------*/
#ifdef USE_HT32F59999_SK
  #define USE_HT32F52352_SK
#endif
#ifdef USE_HT32F59999
  #define USE_HT32F52342_52
#endif
#ifdef USE_MEM_HT32F59999
  #define USE_MEM_HT32F52352
#endif

#ifdef USE_HT32F52142_SK
  #define USE_HT32F0008_SK
#endif
#ifdef USE_HT32F52142
  #define USE_HT32F0008
#endif
#ifdef USE_MEM_HT32F52142
  #define USE_MEM_HT32F0008
#endif

#ifdef USE_HT32F61352_DVB
  #define USE_HT32F0006_DVB
#endif
#ifdef USE_HT32F61352
  #define USE_HT32F0006
#endif
#ifdef USE_MEM_HT32F61352
  #define USE_MEM_HT32F0006
#endif

#ifdef USE_HT50F32002_SK
  #define USE_HT32F50230_SK
#endif
#ifdef USE_HT50F32002
  #define USE_HT32F50220_30
#endif
#ifdef USE_MEM_HT50F32002
  #define USE_MEM_HT32F50230
#endif

#ifdef USE_HT50F32003_SK
  #define USE_HT32F52352_SK
#endif
#ifdef USE_HT50F32003
  #define USE_HT32F52342_52
#endif
#ifdef USE_MEM_HT50F32003
  #define USE_MEM_HT32F52352
#endif

#ifdef __cplusplus
}
#endif

#endif
