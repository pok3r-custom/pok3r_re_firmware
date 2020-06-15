/*********************************************************************************************************//**
 * @file    spi_flash_common.h
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   The header file of common function for SPI Flash.
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
#ifndef __SPI_FLASH_COMMON_H
#define __SPI_FLASH_COMMON_H

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


/* Settings ------------------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Settings SPI_FLASH_AUTO settings
  * @{
  */
#define SPI_FALSH_NUM                   (2)
#define SPI_READ_CMD_NUM                (1)
/**
  * @}
  */

/* Exported variables --------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Variables SPI_FLASH_AUTO exported variables
  * @{
  */
extern s32 sSPI_FLASH_Index;
extern s32 sSPI_FLASH_Size;
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Functions SPI_FLASH_AUTO exported functions
  * @{
  */
u32  SPI_FLASH_ReadJEDECID_0(void);
void SPI_FLASH_ChipErase_0(void);
void SPI_FLASH_SectorErase_0(u32 SectorAddr);
void SPI_FLASH_BufferWrite_0(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte);
void SPI_FLASH_BufferRead_0(u8* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte);
void SPI_FLASH_BufferDualRead_0(u16* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte);
void SPI_FLASH_WriteStatus_0(u8 Value);
void SPI_FLASH_WriteEnable_0(void);
void SPI_FLASH_WriteDisable_0(void);
void SPI_FLASH_WaitForWriteEnd_0(void);
u16  SPI_FLASH_SendByte_0(u8 byte);
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

#endif /* __SPI_FLASH_COMMON_H -----------------------------------------------------------------------------*/
