/*********************************************************************************************************//**
 * @file    ht32_board.h
 * @version $Rev:: 3968         $
 * @date    $Date:: 2019-06-10 #$
 * @brief   HT32 target board definition file.
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
#ifndef __HT32_BOARD_H
#define __HT32_BOARD_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_config.h"
#ifdef USE_HT32F52352_SK
  #include "HT32_board/ht32f52352_sk.h"
#elif defined USE_HT32F52341_SK
  #include "HT32_board/ht32f52341_sk.h"
#elif defined USE_HT32F52241_SK
  #include "HT32_board/ht32f52241_sk.h"
#elif defined USE_HT32F52230_SK
  #include "HT32_board/ht32f52230_sk.h"
#elif defined USE_HT32F52253_SK
  #include "HT32_board/ht32f52253_sk.h"
#elif defined USE_HT32F5826_SK
  #include "HT32_board/ht32f5826_sk.h"
#elif defined USE_HT32F0008_SK
  #include "HT32_board/ht32f0008_sk.h"
#elif defined USE_HT32F50230_SK
  #include "HT32_board/ht32f50230_sk.h"
#elif defined USE_HT32F50241_SK
  #include "HT32_board/ht32f50241_sk.h"
#elif defined USE_HT32F52354_SK
  #include "HT32_board/ht32f52354_sk.h"
#elif defined USE_HT32F0006_DVB
  #include "HT32_board/ht32f0006_dvb.h"
#elif defined USE_HT32F52367_SK
  #include "HT32_board/ht32f52367_sk.h"
#elif defined USE_HT32F65240_DVB
  #include "HT32_board/ht32f65240_dvb.h"
#elif defined USE_HT32F57341_SK
  #include "HT32_board/ht32f57341_sk.h"
#elif defined USE_HT32F57352_SK
  #include "HT32_board/ht32f57352_sk.h"
#elif defined USE_HT32F50343_SK
  #include "HT32_board/ht32f50343_sk.h"
#else
 #error "Please select board by define USE_HT32FXXXX_XXX in project."
#endif

#ifdef __cplusplus
}
#endif

#endif
