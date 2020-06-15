/*********************************************************************************************************//**
 * @file    spi_flash_auto.h
 * @version $Rev:: 5            $
 * @date    $Date:: 2017-05-11 #$
 * @brief   The header file of SPI Flash driver.
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
#ifndef __SPI_FLASH_AUTO_H
#define __SPI_FLASH_AUTO_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_board.h"

/** @addtogroup Utilities
  * @{
  */

/** @addtogroup Common
  * @{
  */

/** @addtogroup SPI_FLASH_AUTO SPI_FLASH_AUTO
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Settings SPI_FLASH_AUTO settings
  * @{
  */
#define SPI_FALSH_NUM                   (2)
#define SPI_READ_CMD_NUM                (1)
#define DUAL_READ_ENABLE                (1)
/**
  * @}
  */

/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Types SPI_FLASH_AUTO exported types
  * @{
  */
typedef struct
{
  uc8 ChipErase;
  uc8 SectorErase;
  uc8 Write;
  uc8 Read;
  uc8 DualRead;
  uc8 WriteStatus;
  uc8 ReadStatus;
  uc8 WriteEnable;
  uc8 WriteDisable;
} SPI_Flash_Cmd_TypeDef;

typedef u32  (*ReadID_TypeDef)          (void);
typedef s32  (*GetSize_TypeDef)         (u32 ID);
typedef void (*ChipErase_TypeDef)       (void);
typedef void (*SectorErase_TypeDef)     (u32 SectorAddr);
typedef void (*BufferWrite_TypeDef)     (u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte);
typedef void (*BufferRead_TypeDef)      (u8* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte);
typedef void (*BufferDualRead_TypeDef)  (u16* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte);
typedef void (*WriteStatus_TypeDef)     (u8 Value);
typedef void (*WriteEnable_TypeDef)     (void);
typedef void (*WriteDisable_TypeDef)    (void);
typedef void (*WaitForWriteEnd_TypeDef) (void);

typedef struct
{
  ReadID_TypeDef          ReadID;
  GetSize_TypeDef         GetSize;
  ChipErase_TypeDef       ChipErase;
  SectorErase_TypeDef     SectorErase;
  BufferWrite_TypeDef     BufferWrite;
  BufferRead_TypeDef      BufferRead;
  BufferDualRead_TypeDef  BufferDualRead;
  WriteStatus_TypeDef     WriteStatus;
  WriteEnable_TypeDef     WriteEnable;
  WriteDisable_TypeDef    WriteDisable;
  WaitForWriteEnd_TypeDef WaitForWriteEnd;
  SPI_Flash_Cmd_TypeDef   Cmd;
  u32                     uFlashID;
  u32                     uFlashIDMask;
  s32                     sFlashSize;
} SPI_Flash_TypeDef;
/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Constants SPI_FLASH_AUTO exported constants
  * @{
  */
#define SPI_FLASH_CMD_JEDECID_0         (0x9F)  /*!< Read JEDEC ID instruction                              */
#define SPI_FLASH_BUSY_FLAG             (0x01)  /*!< Write operation in progress                            */
#define SPI_FLASH_DUMMY_BYTE            (0x00)
#define SPI_FLASH_CMD_NULL              (0)
/**
  * @}
  */

/* Exported macro ------------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Macros SPI_FLASH_AUTO exported macros
  * @{
  */
#define SPI_FLASH_SEL_ACTIVE()      GPIO_ClearOutBits(GPIO_PORT[FLASH_SPI_SEL_GPIO_ID], FLASH_SPI_SEL_GPIO_PIN)
#define SPI_FLASH_SEL_INACTIVE()    GPIO_SetOutBits(GPIO_PORT[FLASH_SPI_SEL_GPIO_ID], FLASH_SPI_SEL_GPIO_PIN)
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup SPI_FLASH_AUTO_Exported_Functions SPI_FLASH_AUTO exported functions
  * @{
  */
u32 SPI_FLASH_Init(void);
u32 SPI_FLASH_ReadJEDECID(void);
s32 SPI_FLASH_GetSize(void);
void SPI_FLASH_ChipErase(void);
void SPI_FLASH_SectorErase(u32 SectorAddr);

void SPI_FLASH_BufferWrite(u8* WriteBuffer, u32 WriteAddr, u32 NumOfWriteByte);
void SPI_FLASH_BufferRead(u8* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte);
void SPI_FLASH_BufferDualRead(u16* ReadBuffer, u32 ReadAddr, u32 NumOfReadByte);
void SPI_FLASH_WriteStatus(u32 Value);
void SPI_FLASH_WriteEnable(void);
void SPI_FLASH_WriteDisable(void);
void SPI_FLASH_WaitForWriteEnd(void);

void SPI_FLASH_CacheWrite(uc8 *buf, u32 uAddress);
void SPI_FLASH_CacheSync(void);
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

#endif /* __SPI_FLASH_AUTO_H -------------------------------------------------------------------------------*/
