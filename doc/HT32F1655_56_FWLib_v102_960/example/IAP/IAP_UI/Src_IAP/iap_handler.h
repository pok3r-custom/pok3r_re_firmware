/*********************************************************************************************************//**
 * @file    IAP/IAP_UI/Src_IAP/iap_handler.h
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The header file of IAP Handler.
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

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __IAP_HANDLER_H
#define __IAP_HANDLER_H

/* Includes ------------------------------------------------------------------------------------------------*/

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup UI_mode UI mode
  * @{
  */

/** @addtogroup UI_mode_IAP IAP
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define HT32F1655           (0)
#define HT32F1656           (1)

#define IAP_CHIP            (HT32F1656)

/* Exported constants --------------------------------------------------------------------------------------*/
#if IAP_CHIP == HT32F1655
#define IAP_CHIP_NAME       "HT32F1655"
#define IAP_FLASH_END       (128 * 1024 - 1)            /* 128 KB                                           */
#define IAP_SRAM_SIZE       (32 * 1024)                 /* 32  KB                                           */
#define IAP_FLASH_SIZE      "128000"                    /* 128 - 3 KB                                       */
#define IAP_PPBIT           "64"
#endif

#if IAP_CHIP == HT32F1656
#define IAP_CHIP_NAME       "HT32F1656"
#define IAP_FLASH_END       (255 * 1024 - 1)            /* 255 KB                                           */
#define IAP_SRAM_SIZE       (32 * 1024)                 /* 32  KB                                           */
#define IAP_FLASH_SIZE      "258048"                    /* 255 - 3 KB                                       */
#define IAP_PPBIT           "128"
#endif

#define IAP_FLASH_START     (1024 * 3)                  /* 3 KB                                             */
#define IAP_START           ("3072")                    /* 3 KB                                             */
#define IAP_SRAM_START      (0x20000000)
#define IAP_SRAM_END        (IAP_SRAM_START + IAP_SRAM_SIZE)

#define IAP_OB_START        (0x1FF00000)
#define IAP_OB_END          (IAP_OB_START + 1024 - 1)   /* 1 KB, 0x1FF003FF                                 */
#define IAP_DATA_START      (0x1FF00050)

#define IAP_GO_EXEC         (0)
#define IAP_GO_EXIT         (1)
#define IAP_GO_RESET        (2)

/* Exported functions --------------------------------------------------------------------------------------*/
u32 IAP_Go(u32 type);
void IAP_Handler(void);
void iapSendString(u8 *String);


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __IAP_HANDLER_H ----------------------------------------------------------------------------------*/
