/*********************************************************************************************************//**
 * @file    ht32_board.c
 * @version $Rev:: 3968         $
 * @date    $Date:: 2019-06-10 #$
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
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_config.h"
#ifdef USE_HT32F52352_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F52341_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F52241_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F52230_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F52253_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F5826
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F0008_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F50230_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F50241_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F52354_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F0006_DVB
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F52367_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F65240_DVB
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F57341_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F57352_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#elif defined USE_HT32F50343_SK
  #include "HT32_board/ht32f5xxxx_board_01.c"
#else
 #error "Please select board by define USE_HT32FXXXX_XXX in project."
#endif
