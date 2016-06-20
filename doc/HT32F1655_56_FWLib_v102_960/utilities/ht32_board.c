/*********************************************************************************************************//**
 * @file    ht32_board.c
 * @version $Rev:: 923          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   HT32 target board related file.
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#ifdef USE_HT32F1755_2755_DVB
  #include "HT32_board/ht32f1765_dvb.c"
#elif defined USE_HT32F1656_DVB
  #include "HT32_board/ht32f1656_dvb.c"
#elif defined USE_HT32F1654_DVB
  #include "HT32_board/ht32f1654_dvb.c"
#elif defined USE_HT32F1765_SK
  #include "HT32_board/ht32f1765_sk.c"
#elif defined USE_HT32F1656_SK
  #include "HT32_board/ht32f1656_sk.c"
#elif defined USE_HT32F1654_SK
  #include "HT32_board/ht32f1654_sk.c"
#else
 #error "Please select board by define USE_HT32FXXXX_XXX in project."
#endif
