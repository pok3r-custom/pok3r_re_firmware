/*********************************************************************************************************//**
 * @file    ht32_board.h
 * @version $Rev:: 44           $
 * @date    $Date:: 2017-05-24 #$
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
#ifdef USE_HT32F1755_2755_DVB
  #include "HT32_board/ht32f1765_dvb.h"
#elif defined USE_HT32F1765_SK
  #include "HT32_board/ht32f1765_sk.h"
#elif defined USE_HT32F1656_DVB
  #include "HT32_board/ht32f1656_dvb.h"
#elif defined USE_HT32F1654_DVB
  #include "HT32_board/ht32f1654_dvb.h"
#elif defined USE_HT32F1656_SK
  #include "HT32_board/ht32f1656_sk.h"
#elif defined USE_HT32F1654_SK
  #include "HT32_board/ht32f1654_sk.h"
#elif defined USE_HT32F1656_LCD
  #include "HT32_board/ht32f1656_lcd.h"
#elif defined USE_HT32F12366_SK
  #include "HT32_board/ht32f12366_sk.h"
#elif defined USE_HT32F12345_SK
  #include "HT32_board/ht32f12345_sk.h"
#else
 #error "Please select board by define USE_HT32FXXXX_XXX in project."
#endif

#ifdef __cplusplus
}
#endif

#endif
