/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/spi_sd.h
 * @version $Rev:: 2825         $
 * @date    $Date:: 2018-05-29 #$
 * @brief   The header file of SD Memory card driver.
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
#ifndef __SPI_SD_H
#define __SPI_SD_H

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup Mass_Storage
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define SD_SPI_PORT                       (SD_SPI)
#define SD_SPI_DIV                        (SystemCoreClock/400000)    /* Fixed 400 kHz                      */
#define SD_SPI_DIV_HIGHSPEED              (2)                         /* Maximum Speed. SystemCoreClock/2   */
#define SD_BLOCK_SIZE                     (512)

#define SD_CS_PORT                        (SD_SPI_SEL_PORT)
#define SD_CS_PIN                         (SD_SPI_SEL_GPIO_PIN)

//#define SD_CD_PORT                        (HT_GPIOA)
//#define SD_CD_PIN                         (GPIO_PIN_1)

#define SD_DEBUG                          (0)

#define SDHC_SUPPORT                      (1)

#define SD_INIT_CNT                       (100)     /* For SD_Init                                          */
#define SD_IDLE_CNT                       (100)     /* For SD_SetIdleStateSPI                               */
#define SD_GETRSP_CNT                     (0xFFFF)  /* For SD_GetResponse                                   */
#define SD_GETDRSP_CNT                    (500)     /* SD_GetDataResponse                                   */
#define SD_CHECK_VER                      (0xFFFF)

/* Exported types ------------------------------------------------------------------------------------------*/
typedef struct
{
  u8  CSDStruct;            /* CSD structure                                                                */
  u8  SysSpecVersion;       /* System specification version                                                 */
  u8  Reserved1;            /* Reserved                                                                     */
  u8  TAAC;                 /* Data read access-time 1                                                      */
  u8  NSAC;                 /* Data read access-time 2 in CLK cycles                                        */
  u8  MaxBusClkFrec;        /* Max. bus clock frequency                                                     */
  u16 CardComdClasses;      /* Card command classes                                                         */
  u8  RdBlockLen;           /* Max. read data block length                                                  */
  u8  PartBlockRead;        /* Partial blocks for read allowed                                              */
  u8  WrBlockMisalign;      /* Write block misalignment                                                     */
  u8  RdBlockMisalign;      /* Read block misalignment                                                      */
  u8  DSRImpl;              /* DSR implemented                                                              */
  u8  Reserved2;            /* Reserved                                                                     */
  u16 DeviceSize;           /* Device Size                                                                  */
  u8  MaxRdCurrentVDDMin;   /* Max. read current @ VDD min                                                  */
  u8  MaxRdCurrentVDDMax;   /* Max. read current @ VDD max                                                  */
  u8  MaxWrCurrentVDDMin;   /* Max. write current @ VDD min                                                 */
  u8  MaxWrCurrentVDDMax;   /* Max. write current @ VDD max                                                 */
  u8  DeviceSizeMul;        /* Device size multiplier                                                       */
  u8  EraseGrSize;          /* Erase group size                                                             */
  u8  EraseGrMul;           /* Erase group size multiplier                                                  */
  u8  WrProtectGrSize;      /* Write protect group size                                                     */
  u8  WrProtectGrEnable;    /* Write protect group enable                                                   */
  u8  ManDeflECC;           /* Manufacturer default ECC                                                     */
  u8  WrSpeedFact;          /* Write speed factor                                                           */
  u8  MaxWrBlockLen;        /* Max. write data block length                                                 */
  u8  WriteBlockPaPartial;  /* Partial blocks for write allowed                                             */
  u8  Reserved3;            /* Reserved                                                                     */
  u8  ContentProtectAppli;  /* Content protection application                                               */
  u8  FileFormatGrouop;     /* File format group                                                            */
  u8  CopyFlag;             /* Copy flag (OTP)                                                              */
  u8  PermWrProtect;        /* Permanent write protection                                                   */
  u8  TempWrProtect;        /* Temporary write protection                                                   */
  u8  FileFormat;           /* File Format                                                                  */
  u8  ECC;                  /* ECC code                                                                     */
  u8  msd_CRC;              /* CRC                                                                          */
  u8  Reserved4;            /* always 1                                                                     */
} SD_CSD_TypeDef;

typedef struct
{
  u8  ManufacturerID;      /* ManufacturerID                                                                */
  u16 OEM_AppliID;         /* OEM/Application ID                                                            */
  u32 ProdName1;           /* Product Name part1                                                            */
  u8  ProdName2;           /* Product Name part2                                                            */
  u8  ProdRev;             /* Product Revision                                                              */
  u32 ProdSN;              /* Product Serial Number                                                         */
  u8  Reserved1;           /* Reserved1                                                                     */
  u16 ManufactDate;        /* Manufacturing Date                                                            */
  u8  msd_CRC;             /* CRC                                                                           */
  u8  Reserved2;           /* always 1                                                                      */
} SD_CID_TypeDef;

/* Exported constants --------------------------------------------------------------------------------------*/
#define SD_RESPONSE_NOERR                 (0x00)
#define SD_IN_IDLE_STATE                  (0x01)
#define SD_ERASE_RESET                    (0x02)
#define SD_ILLEGAL_COMMAND                (0x04)
#define SD_COM_CRC_ERR                    (0x08)
#define SD_ERASE_SEQUENCE_ERR             (0x10)
#define SD_ADDRESS_ERR                    (0x20)
#define SD_PARAMETER_ERR                  (0x40)
#define SD_RESPONSE_ERR                   (0xFF)

/* Exported macro ------------------------------------------------------------------------------------------*/
#define SD_CS_ACTIVE()                    (SD_CS_PORT->RR = SD_CS_PIN)
#define SD_CS_INACTIVE()                  (SD_CS_PORT->SRR = SD_CS_PIN)
#define SD_CD_READ()                      (0)

/* Exported variables --------------------------------------------------------------------------------------*/
extern u32 uSD_IsSDHC;

/* Exported functions --------------------------------------------------------------------------------------*/
u32 SD_Init(void);
u32 SD_ReadBlock(u8* pBuf, u32 uReadAddr, u32 uReadSize);
u32 SD_ReadMultipleBlock(u8* pBuf, u32 uReadAddr, u32 uWriteSize);
u32 SD_WriteBlock(u8* pBuf, u32 uWritedAddr, u32 uWriteSize);
u32 SD_WriteMultipleBlock(u8* pBuf, u32 uWritedAddr, u32 uWriteSize);
u32 SD_GetCSDRegister(SD_CSD_TypeDef* SD_CSD);
u32 SD_GetCIDRegister(SD_CID_TypeDef* SD_CID);
u32 SD_IsWriteBusy(void);
u32 SD_IsReadBusy(void);
u32 SD_IsCardDetected(void);


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __SPI_SD_H ---------------------------------------------------------------------------------------*/
