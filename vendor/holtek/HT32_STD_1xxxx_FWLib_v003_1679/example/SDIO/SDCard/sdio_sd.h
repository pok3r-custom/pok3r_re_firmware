/*********************************************************************************************************//**
 * @file    SDIO/SDCard/sdio_sd.h
 * @version $Rev:: 544          $
 * @date    $Date:: 2017-07-17 #$
 * @brief   The header file of sdio_sd.
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
#ifndef __SDIO_SD_H
#define __SDIO_SD_H

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

/** @addtogroup SDIO_SD SDIO_SD
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup SDIO_SD_Exported_Types SDIO_SD exported types
  * @{
  */

/**
 * @brief Definition of SDIO specific & standard error
 */
typedef enum
{
  /* SDIO specific error                                                                                    */
  SD_CMD_CRC_FAIL                    = (1), /*!< Command response received (but CRC check failed)           */
  SD_DATA_CRC_FAIL                   = (2), /*!< Data block sent/received (CRC check Failed)                */
  SD_CMD_RSP_TIMEOUT                 = (3), /*!< Command response timeout                                   */
  SD_DATA_TIMEOUT                    = (4), /*!< Data time out                                              */
  SD_TX_UNDERRUN                     = (5), /*!< Transmit FIFO under-run                                    */
  SD_RX_OVERRUN                      = (6), /*!< Receive FIFO over-run                                      */
  SD_START_BIT_ERR                   = (7), /*!< Start bit not detected on all data signals in widE bus mode */
  SD_CMD_OUT_OF_RANGE                = (8), /*!< CMD's argument was out of range                            */
  SD_ADDR_MISALIGNED                 = (9), /*!< Misaligned address                                         */
  SD_BLOCK_LEN_ERR                   = (10), /*!< Transferred block length is not allowed for the card or the number of transferred bytes does not match the block length */
  SD_ERASE_SEQ_ERR                   = (11), /*!< An error in the sequence of erase command occurs          */
  SD_BAD_ERASE_PARAM                 = (12), /*!< An Invalid selection for erase groups                     */
  SD_WRITE_PROT_VIOLATION            = (13), /*!< Attempt to program a write protect block                  */
  SD_LOCK_UNLOCK_FAILED              = (14), /*!< Sequence or password error has been detected in unlock command or if there was an attempt to access a locked card */
  SD_COM_CRC_FAILED                  = (15), /*!< CRC check of the previous command failed                  */
  SD_ILLEGAL_CMD                     = (16), /*!< Command is not legal for the card state                   */
  SD_CARD_ECC_FAILED                 = (17), /*!< Card internal ECC was applied but failed to correct the data */
  SD_CC_ERROR                        = (18), /*!< Internal card controller error                            */
  SD_GENERAL_UNKNOWN_ERROR           = (19), /*!< General or Unknown error                                  */
  SD_STREAM_READ_UNDERRUN            = (20), /*!< The card could not sustain data transfer in stream read operation */
  SD_STREAM_WRITE_OVERRUN            = (21), /*!< The card could not sustain data programming in stream mode */
  SD_CID_CSD_OVERWRITE               = (22), /*!< CID/CSD overwrite error                                   */
  SD_WP_ERASE_SKIP                   = (23), /*!< only partial address space was erased                     */
  SD_CARD_ECC_DISABLED               = (24), /*!< Command has been executed without using internal ECC      */
  SD_ERASE_RESET                     = (25), /*!< Erase sequence was cleared before executing because an out of erase sequence command was received */
  SD_AKE_SEQ_ERROR                   = (26), /*!< Error in sequence of authentication                       */
  SD_INVALID_VOLTRANGE               = (27),
  SD_ADDR_OUT_OF_RANGE               = (28),
  SD_SWITCH_ERROR                    = (29),
  SD_SDIO_DISABLED                   = (30),
  SD_SDIO_FUNCTION_BUSY              = (31),
  SD_SDIO_FUNCTION_FAILED            = (32),
  SD_SDIO_UNKNOWN_FUNCTION           = (33),

  /* SDIO standard error                                                                                    */
  SD_INTERNAL_ERROR,
  SD_NOT_CONFIGURED,
  SD_REQUEST_PENDING,
  SD_REQUEST_NOT_APPLICABLE,
  SD_INVALID_PARAMETER,
  SD_UNSUPPORTED_FEATURE,
  SD_UNSUPPORTED_HW,
  SD_ERROR,
  SD_OK = 0
} SD_Error;

/**
 * @brief  SD Card States
 */
typedef enum
{
  SD_CARD_READY                  = ((u32)0x00000001),
  SD_CARD_IDENTIFICATION         = ((u32)0x00000002),
  SD_CARD_STANDBY                = ((u32)0x00000003),
  SD_CARD_TRANSFER               = ((u32)0x00000004),
  SD_CARD_SENDING                = ((u32)0x00000005),
  SD_CARD_RECEIVING              = ((u32)0x00000006),
  SD_CARD_PROGRAMMING            = ((u32)0x00000007),
  SD_CARD_DISCONNECTED           = ((u32)0x00000008),
  SD_CARD_ERROR                  = ((u32)0x000000FF)
} SDCardState;

/**
 * @brief Card Specific Data: CSD Register
 */
typedef struct
{
  __IO u8  CSDStruct;            /*!< CSD structure                                                         */
  __IO u8  SysSpecVersion;       /*!< System specification version                                          */
  __IO u8  Reserved1;            /*!< Reserved                                                              */
  __IO u8  TAAC;                 /*!< Data read access-time 1                                               */
  __IO u8  NSAC;                 /*!< Data read access-time 2 in CLK cycles                                 */
  __IO u8  MaxBusClkFrec;        /*!< Max. bus clock frequency                                              */
  __IO u16 CardComdClasses;      /*!< Card command classes                                                  */
  __IO u8  RdBlockLen;           /*!< Max. read data block length                                           */
  __IO u8  PartBlockRead;        /*!< Partial blocks for read allowed                                       */
  __IO u8  WrBlockMisalign;      /*!< Write block misalignment                                              */
  __IO u8  RdBlockMisalign;      /*!< Read block misalignment                                               */
  __IO u8  DSRImpl;              /*!< DSR implemented                                                       */
  __IO u8  Reserved2;            /*!< Reserved                                                              */
  __IO u32 DeviceSize;           /*!< Device Size                                                           */
  __IO u8  MaxRdCurrentVDDMin;   /*!< Max. read current @ VDD min                                           */
  __IO u8  MaxRdCurrentVDDMax;   /*!< Max. read current @ VDD max                                           */
  __IO u8  MaxWrCurrentVDDMin;   /*!< Max. write current @ VDD min                                          */
  __IO u8  MaxWrCurrentVDDMax;   /*!< Max. write current @ VDD max                                          */
  __IO u8  DeviceSizeMul;        /*!< Device size multiplier                                                */
  __IO u8  EraseGrSize;          /*!< Erase group size                                                      */
  __IO u8  EraseGrMul;           /*!< Erase group size multiplier                                           */
  __IO u8  WrProtectGrSize;      /*!< Write protect group size                                              */
  __IO u8  WrProtectGrEnable;    /*!< Write protect group enable                                            */
  __IO u8  ManDeflECC;           /*!< Manufacturer default ECC                                              */
  __IO u8  WrSpeedFact;          /*!< Write speed factor                                                    */
  __IO u8  MaxWrBlockLen;        /*!< Max. write data block length                                          */
  __IO u8  WriteBlockPaPartial;  /*!< Partial blocks for write allowed                                      */
  __IO u8  Reserved3;            /*!< Reserded                                                              */
  __IO u8  ContentProtectAppli;  /*!< Content protection application                                        */
  __IO u8  FileFormatGrouop;     /*!< File format group                                                     */
  __IO u8  CopyFlag;             /*!< Copy flag (OTP)                                                       */
  __IO u8  PermWrProtect;        /*!< Permanent write protection                                            */
  __IO u8  TempWrProtect;        /*!< Temporary write protection                                            */
  __IO u8  FileFormat;           /*!< File Format                                                           */
  __IO u8  ECC;                  /*!< ECC code                                                              */
  __IO u8  CSD_CRC;              /*!< CSD CRC                                                               */
  __IO u8  Reserved4;            /*!< always 1                                                              */
} SD_CSD;

/**
 * @brief Card Identification Data: CID Register
 */
typedef struct
{
  __IO u8  ManufacturerID;       /*!< Manufacturer ID                                                       */
  __IO u16 OEM_AppliID;          /*!< OEM/Application ID                                                    */
  __IO u32 ProdName1;            /*!< Product Name part1                                                    */
  __IO u8  ProdName2;            /*!< Product Name part2                                                    */
  __IO u8  ProdRev;              /*!< Product Revision                                                      */
  __IO u32 ProdSN;               /*!< Product Serial Number                                                 */
  __IO u8  Reserved1;            /*!< Reserved1                                                             */
  __IO u16 ManufactDate;         /*!< Manufacturing Date                                                    */
  __IO u8  CID_CRC;              /*!< CID CRC                                                               */
  __IO u8  Reserved2;            /*!< always 1                                                              */
} SD_CID;

/**
 * @brief SD Card Status
 */
typedef struct
{
  __IO u8  DataBusWidth;
  __IO u8  SecuredMode;
  __IO u16 SDCardType;
  __IO u32 ProtectedAreaSize;
  __IO u8  SpeedClass;
  __IO u8  PerformanceMove;
  __IO u8  AUSize;
  __IO u16 EraseSize;
  __IO u8  EraseTimeout;
  __IO u8  EraseOffset;
} SD_CardStatus;

/**
 * @brief SD Card information
 */
typedef struct
{
  SD_CSD SD_csd;
  SD_CID SD_cid;
  SD_CardStatus CardStatus;
  u32 CardCapacity;
  u16 CardBlockSize;
  u32 CardBlankValue;
  u16 RCA;
  u8 CardType;
} SD_CardInfo;
/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup SDIO_SD_Exported_Constants SDIO_SD exported constants
  * @{
  */
/* SDIO Commands Index                                                                                      */
#define CMD0_GO_IDLE_STATE                          ( 0UL << 8)
#define CMD1_SEND_OP_COND                           ( 1UL << 8)
#define CMD2_ALL_SEND_CID                           ( 2UL << 8)
#define CMD3_SEND_RELATIVE_ADDR                     ( 3UL << 8) /* SDIO_SEND_REL_ADDR for SD Card           */
#define CMD4_SET_DSR                                ( 4UL << 8)
#define CMD5_IO_SEND_OP_COND                        ( 5UL << 8)
#define CMD6_SWITCH_FUNC                            ( 6UL << 8)
#define CMD7_SELECT_DESELECT_CARD                   ( 7UL << 8)
#define CMD8_SEND_IF_COND                           ( 8UL << 8)
#define CMD9_SEND_CSD                               ( 9UL << 8)
#define CMD10_SEND_CID                              (10UL << 8)
#define CMD11_READ_DAT_UNTIL_STO                    (11UL << 8) /* SD Card doesn't support it               */
#define CMD12_STOP_TRANSMISSION                     (12UL << 8)
#define CMD13_SEND_STATUS                           (13UL << 8)
#define CMD14_HS_BUSTEST_READ                       (14UL << 8)
#define CMD15_GO_INACTIVE_STATE                     (15UL << 8)
#define CMD16_SET_BLOCKLEN                          (16UL << 8)
#define CMD17_READ_SINGLE_BLOCK                     (17UL << 8)
#define CMD18_READ_MULTIPLE_BLOCK                   (18UL << 8)
#define CMD19_HS_BUSTEST_WRITE                      (19UL << 8)
#define CMD20_SPEED_CLASS_CONTROL                   (20UL << 8) /* SD Card doesn't support it               */
#define CMD23_SET_BLOCK_COUNT                       (23UL << 8) /* SD Card doesn't support it               */
#define CMD24_WRITE_BLOCK                           (24UL << 8)
#define CMD25_WRITE_MULTIPLE_BLOCK                  (25UL << 8)
#define CMD26_PROG_CID                              (26UL << 8) /* reserved for manufacturers               */
#define CMD27_PROG_CSD                              (27UL << 8)
#define CMD28_SET_WRITE_PROT                        (28UL << 8)
#define CMD29_CLR_WRITE_PROT                        (29UL << 8)
#define CMD30_SEND_WRITE_PROT                       (30UL << 8)
#define CMD32_ERASE_WR_BLK_START                    (32UL << 8) /* For SD card only                         */
#define CMD33_ERASE_WR_BLK_END                      (33UL << 8) /* For SD card only                         */
#define CMD36_ERASE_GRP_END                         (36UL << 8) /* For MMC card only, spec 3.31             */
#define CMD38_ERASE                                 (38UL << 8)
#define CMD39_FAST_IO                               (39UL << 8) /* SD Card doesn't support it               */
#define CMD40_GO_IRQ_STATE                          (40UL << 8) /* SD Card doesn't support it               */
#define CMD42_LOCK_UNLOCK                           (42UL << 8)
#define CMD55_APP_CMD                               (55UL << 8)
#define CMD56_GEN_CMD                               (56UL << 8)
#define CMD64_NO_CMD                                (64UL << 8)

/* SD Card Specific Commands                                                                                */
#define ACMD6_SET_BUS_WIDTH                         ( 6UL << 8)
#define ACMD13_SD_STATUS                            (13UL << 8)
#define ACMD22_SEND_NUM_WR_BLOCKS                   (22UL << 8)
#define ACMD23_SET_WR_BLK_ERASE_COUNT               (23UL << 8)
#define ACMD41_SD_SEND_OP_COND                      (41UL << 8)
#define ACMD42_SET_CLR_CARD_DETECT                  (42UL << 8)
#define ACMD51_SEND_SCR                             (51UL << 8)
#define ACMD52_SDIO_RW_DIRECT                       (52UL << 8) /* For SD I/O Card only                     */
#define ACMD53_SDIO_RW_EXTENDED                     (53UL << 8) /* For SD I/O Card only                     */

/* SD Card Specific Security Commands                                                                       */
#define ACMD43_SD_APP_GET_MKB                       (43UL << 8) /* For SD Card only                         */
#define ACMD44_SD_APP_GET_MID                       (44UL << 8) /* For SD Card only                         */
#define ACMD45_SD_APP_SET_CER_RN1                   (45UL << 8) /* For SD Card only                         */
#define ACMD46_SD_APP_GET_CER_RN2                   (46UL << 8) /* For SD Card only                         */
#define ACMD47_SD_APP_SET_CER_RES2                  (47UL << 8) /* For SD Card only                         */
#define ACMD48_SD_APP_GET_CER_RES1                  (48UL << 8) /* For SD Card only                         */
#define ACMD18_SD_APP_SECURE_READ_MULTIPLE_BLOCK    (18UL << 8) /* For SD Card only                         */
#define ACMD25_SD_APP_SECURE_WRITE_MULTIPLE_BLOCK   (25UL << 8) /* For SD Card only                         */
#define ACMD38_SD_APP_SECURE_ERASE                  (38UL << 8) /* For SD Card only                         */
#define ACMD49_SD_APP_CHANGE_SECURE_AREA            (49UL << 8) /* For SD Card only                         */
#define ACMD48_SD_APP_SECURE_WRITE_MKB              (48UL << 8) /* For SD Card only                         */

/* Supported Memory Cards                                                                                   */
#define SDIO_STD_CAPACITY_SD_CARD_V1_1              (0UL)
#define SDIO_STD_CAPACITY_SD_CARD_V2_0              (1UL)
#define SDIO_HIGH_CAPACITY_SD_CARD                  (2UL)
#define SDIO_MULTIMEDIA_CARD                        (3UL)
#define SDIO_SECURE_DIGITAL_IO_CARD                 (4UL)
#define SDIO_HIGH_SPEED_MULTIMEDIA_CARD             (5UL)
#define SDIO_SECURE_DIGITAL_IO_COMBO_CARD           (6UL)
#define SDIO_HIGH_CAPACITY_MMC_CARD                 (7UL)

/* Bus mode                                                                                                 */
#define SD_1BIT_BUS_MODE                            (0UL)
#define SD_4BIT_BUS_MODE                            (2UL)

/* Speed mode                                                                                               */
#define SD_DEFAULT_SPEED                            (0UL)
#define SD_HIGH_SPEED                               (1UL)
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup SDIO_SD_Exported_Functions SDIO_SD exported functions
  * @{
  */
bool SD_Detect(void);
SD_Error SD_Init(SD_CardInfo *cardinfo);
SD_Error SD_PowerON(SD_CardInfo *cardinfo);
SD_Error SD_InitializeCards(SD_CardInfo *cardinfo);
SD_Error SD_SelectDeselect(u32 addr);
SD_Error SD_BusModeConfig(SD_CardInfo *cardinfo, u32 BusMode);
SD_Error SD_GetSDStatus(SD_CardInfo *cardinfo);
SD_Error SD_ReadBlock(SD_CardInfo *cardinfo, u32 ReadAddr, u32 *readbuff, u16 BlockSize);
SD_Error SD_ReadMultiBlocks(SD_CardInfo *cardinfo, u32 ReadAddr, u32 *readbuff, u16 BlockSize, u16 BlockCount);
SD_Error SD_Erase(SD_CardInfo *cardinfo, u32 startaddr, u32 endaddr);
SD_Error SD_WriteBlock(SD_CardInfo *cardinfo, u32 WriteAddr, u32 *writebuff, u16 BlockSize);
SD_Error SD_WriteMultiBlocks(SD_CardInfo *cardinfo, u32 WriteAddr, u32 *writebuff, u16 BlockSize, u16 BlockCount);
SD_Error SD_InterruptService(void);
SD_Error SD_GetCSDRegister(SD_CardInfo *cardinfo);
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

#endif /* __SDIO_SD_H --------------------------------------------------------------------------------------*/
