/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage_IAP/ht32_board_config.h
 * @version $Rev:: 2113         $
 * @date    $Date:: 2017-11-13 #$
 * @brief   The header file of board configuration.
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
#ifndef __HT32_BOARD_CONFIG_H
#define __HT32_BOARD_CONFIG_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Settings ------------------------------------------------------------------------------------------------*/
#define IAP_FLASH_SIZE                (LIBCFG_FLASH_SIZE)
#define IAP_CODE_SIZE                 (1024 * 8)

#define IAP_APFLASH_START             (IAP_CODE_SIZE + 0)
#define IAP_APSRAM_START              (HT_SRAM_BASE)

#define BOOT_MODE_AP                  (0x55AAFAF0)
#define BOOT_MODE_IAP                 (0x55AAFAF5)
#define BOOT_MODE                     ((*((u32 volatile *) (HT_SRAM_BASE))))
#define IAP_MODE                      ((*((u32 volatile *) (HT_SRAM_BASE + 0x4))))

#ifdef __cplusplus
}
#endif

#endif
