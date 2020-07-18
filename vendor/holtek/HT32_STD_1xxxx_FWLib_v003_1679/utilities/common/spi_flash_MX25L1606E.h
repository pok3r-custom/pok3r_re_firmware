/*********************************************************************************************************//**
 * @file    spi_flash_MX25L1606E.h
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   The header file of MX25L1606E.
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
#ifndef __SPI_FLASH_MX25L1606E_H
#define __SPI_FLASH_MX25L1606E_H

#ifdef __cplusplus
 extern "C" {
#endif

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup SPI_FLASH_AUTO SPI_FLASH_AUTO
  * @brief The SPI Flash Driver with auto detection function.
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Constants SPI_FLASH_AUTO exported constants
  * @{
  */
#define MX25L1606E_CMD_JEDECID           (0x9F)  /*!< Read JEDEC ID instruction                             */

#define MX25L1606E_CMD_CE                (0x60)  /*!< Chip Erase instruction                                */
#define MX25L1606E_CMD_SE                (0x20)  /*!< Sector Erase instruction                              */
#define MX25L1606E_CMD_READ              (0x0B)  /*!< Read Data instruction                                 */
#define MX25L1606E_CMD_DREAD             (0x3B)  /*!< Read Data instruction                                 */
#define MX25L1606E_CMD_WRSR              (0x01)  /*!< Write Status Register instruction                     */
#define MX25L1606E_CMD_WREN              (0x06)  /*!< Write enable instruction                              */
#define MX25L1606E_CMD_WRDI              (0x04)  /*!< Write disable instruction                             */
#define MX25L1606E_CMD_RDSR              (0x05)  /*!< Read Status Register instruction                      */

#define MX25L1606E_CMD_WRITE             (0x02)  /*!< Program the selected page instruction                 */

#define MX25L1606E_JEDEC_ID              (0xC22000)
#define MX25L1606E_JEDEC_IDMASK          (0xFFFF00)

#define MX25L1606E_PAGESIZE              (256)
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Functions SPI_FLASH_AUTO exported functions
  * @{
  */
void MX25L1606E_PageWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte);
void MX25L1606E_BufferWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte);
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

#ifdef __cplusplus
}
#endif

#endif /* __SPI_FLASH_MX25L1606E_H -------------------------------------------------------------------------*/
