/*********************************************************************************************************//**
 * @file    IAP/IAP_Text/Src_IAP/iap_handler.h
 * @version $Rev:: 755          $
 * @date    $Date:: 2017-08-29 #$
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
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
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

/** @addtogroup Text_mode Text mode
  * @{
  */

/** @addtogroup Text_mode_IAP IAP
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/
#define IAP_APFLASH_SIZE        (LIBCFG_FLASH_SIZE)
#define IAP_APFLASH_END         (IAP_APFLASH_SIZE - 1)

#define IAP_APSRAM_SIZE         (LIBCFG_RAM_SIZE)
#define IAP_APSRAM_END          (HT_SRAM_BASE + IAP_APSRAM_SIZE)


/* Exported functions --------------------------------------------------------------------------------------*/
void IAP_Go(void);
void IAP_Handler(void);


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

#endif
