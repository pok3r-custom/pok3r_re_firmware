/*********************************************************************************************************//**
 * @file    main.h
 * @version $Rev:: 3331         $
 * @date    $Date:: 2018-12-25 #$
 * @brief   The API between application and HT32FXXXX Firmware Library.
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
#ifndef __MAIN_H
#define __MAIN_H

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board_config.h"

#define HALF_BUF_SIZE       (_EP4LEN / 4)
#define BUF_SIZE            (HALF_BUF_SIZE * 2)
#define I2S_BUF_SIZE        (7)
#define I2S_BUF_MID         (4)

extern vu8 AltBuf;
extern u32 TxBuf[2][HALF_BUF_SIZE];
extern vu8 I2SBufLen;
extern vu32 gI2S_RateProcessDownCnt;

bool I2S_IsBufferFull(void);
bool I2S_IsBufferEmpty(void);
u32 I2S_BufferWrite(u32* pFrom);
u32 I2S_BufferRead(u32* pTo);

#endif
