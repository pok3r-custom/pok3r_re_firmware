/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/usb_scsi_block_command.c
 * @version $Rev:: 330          $
 * @date    $Date:: 2016-04-14 #$
 * @brief   The SCSI Block Command (SBC-3 & SPC-4).
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
#include "ht32.h"
#include "ht32_usbd_core.h"
#include "usb_bulk_only_transport.h"
#include "usb_scsi_block_command.h"
#include "usb_scsi.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup Mass_Storage
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
typedef void (*pFunction)(BOT_Media_TypeDef *pMedia, u8 *pCB);

typedef enum
{
  SBC_SUCCESS        = 0,
  SBC_CMD_NOTSUPPORT = 2,
  SBC_ERROR          = 3,
} SBC_CBWState_Enum;

typedef struct
{
  u32 uAddress;
  u32 uLength;
  SBC_CBWState_Enum CommandStatus;
} SBCInfo_Typedef;

/* Private constants ---------------------------------------------------------------------------------------*/
#define SBC_CMD_COUNT           (10)

#define _LENGTH_VITAL_PRODUCT                     (sizeof(guSBC_VitalProductData))
#define _LENGTH_INQUIRYDATA                       (sizeof(SBC_InquiryData_TypeDef))
#define _LENGTH_SENSE_DATA                        (sizeof(SBC_SenseData_TypeDef))
#define _LENGTH_READFORMATCAP_DATA                (sizeof(guSBC_ReadFormatCapacityData))
#define _LENGTH_READCAP10_DATA                    (sizeof(guSBC_ReadCapacity10Data))

/* Private function prototypes -----------------------------------------------------------------------------*/
static void _SBC_CMDInquiry(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDRequestSense(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDTestUnitReady(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDRead10(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDWrite10(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDReadCapacity10(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDReadFormatCapacity(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDReadModeSense6(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDPreventAllowMediumRemoval(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_CMDLoadUnload(BOT_Media_TypeDef *pMedia, u8 *pCB);
static void _SBC_GetAddress(u8 *pCB, u32 uBlockSize);
static u32 _SBC_FindCommand(u8 uCommand);

/* Private macro -------------------------------------------------------------------------------------------*/
#define BE2LE32(bytes)    ((bytes[0] << 24) | (bytes[1] << 16) | (bytes[2] << 8) | (bytes[3] << 0))
#define BE2LE16(bytes)    ((bytes[0] <<  8) | (bytes[1] <<  0))

/* Private variables ---------------------------------------------------------------------------------------*/
static SBCInfo_Typedef gSBCInfo;

static uc8 gSBCCMDTable[SBC_CMD_COUNT] =
{
  SBC_CMD_TEST_UNIT_READY,
  SBC_CMD_READ_10,
  SBC_CMD_WRITE_10,
  SBC_CMD_REQUEST_SENSE,
  SBC_CMD_INQUIRY,
  SBC_CMD_READ_FORMAT_CAPACITIES,
  SBC_CMD_READ_CAPACITY_10,
  SBC_CMD_MODE_SENSE_06,
  SBC_CMD_PREVENT_ALLOW_MEDIUM_REMOVAL,
  SBC_CMD_LOAD_UNLOAD,
  //SBC_CMD_ADD_OTHER_COMMAND_HERE,
};

static const pFunction gpFSBCMDHandler[SBC_CMD_COUNT] =
{
  (pFunction)_SBC_CMDTestUnitReady,
  (pFunction)_SBC_CMDRead10,
  (pFunction)_SBC_CMDWrite10,
  (pFunction)_SBC_CMDRequestSense,
  (pFunction)_SBC_CMDInquiry,
  (pFunction)_SBC_CMDReadFormatCapacity,
  (pFunction)_SBC_CMDReadCapacity10,
  (pFunction)_SBC_CMDReadModeSense6,
  (pFunction)_SBC_CMDPreventAllowMediumRemoval,
  (pFunction)_SBC_CMDLoadUnload,
  //(pFunction)_ADD_OTHER_COMMAND_FUNCTION_HERE,
};

#if (USBDCORE_DEBUG == 1)
static u8 guSBCCMDString[SBC_CMD_COUNT][5] =
{
  "TUR",
  "R10",
  "W10",
  "RSE",
  "INQ",
  "RFC",
  "RC10",
  "MS6",
  "PMR",
  //"_OTHER_COMMAND",
};
#endif

/*----------------------------------------------------------------------------------------------------------*/
/* SBC Related data                                                                                         */
/*----------------------------------------------------------------------------------------------------------*/
__ALIGN4 static uc8 guSBC_VitalProductData[] =
{
  0x00, 0x00, 0x00, 0x00, 0x00
};

__ALIGN4 static u8 guSBC_ReadFormatCapacityData[] =
{
  0x00,
  0x00,
  0x00,
  0x08,                                 /* Capacity List Length                                             */
  0x00, 0x00, 0x00, 0x00,               /* Block Count                                                      */
  0x02,                                 /* Descriptor Code: 0x02 for Formatted Media                        */
  0x00, 0x00, 0x00,                     /* Logical Block Length In Bytes                                    */
};

__ALIGN4 static u8 guSBC_ReadCapacity10Data[] =
{
  0x00, 0x00, 0x00, 0x00,               /* Returned Logical Block Address                                   */
  0x00, 0x00, 0x00, 0x00,               /* Logical Block Length In Bytes                                    */
};

__ALIGN4 static const SBC_InquiryData_TypeDef gSBC_InquiryData[BOT_LUN_NUM] =
{
  #if (BOT_RAM_DISK0 == 1)
  {
    SBC_DIRECT_ACCESS_BLOCK_DEVICE,     /*  0 [4:0] Peripheral Device Type                                  */
    SBC_PERIPHERAL_DEVICE_CONNECTED,    /*    [7:5] Peripheral Qualifier                                    */
    SBC_RESERVED_VALUE,                 /*  1 [6:0] Reserved                                                */
    SBC_REMOVEABLE_MEDIUM,              /*    [7:7] Removable Medium (0: Not removable, 1: Removable)       */
    SBC_SPC_VERSION_4,                  /*  2 [7:0] SPC Version                                             */
    0x2,                                /*  3 [3:0] Response data format, only 0x2 is valid                 */
    0,                                  /*    [4:4] Hierarchical addressing (0: Not support, 1: Support)    */
    0,                                  /*    [5:5] Normal ACA Supported (0: Not support, 1: Support)       */
    0,                                  /*    [7:6] Obsolete                                                */
    _LENGTH_INQUIRY_DATAn,              /*  4 [7:0] Additional length (n - 4, which start from 0)           */
    0,                                  /*  5 [0:0] Protection information (0: Not support, 1: Support)     */
    0,                                  /*    [2:1] Reserved                                                */
    0,                                  /*    [3:3] Third-Party Copy supported (0: Not support, 1: Support) */
    SBC_TPGS_NONE,                      /*    [5:4] Target Port Group Support                               */
    0,                                  /*    [6:6] Access Control Coordinator (0: No, 1: Yes)              */
    0,                                  /*    [7:7] SCC Supported (0: Not support, 1: Support)              */
    0,                                  /*  6 [0:0] Unused feature                                          */
    0,                                  /*    [3:1] Obsolete                                                */
    0,                                  /*    [4:4] Multi-Port (0: No, 1: Yes)                              */
    0,                                  /*    [5:5] VS is Not Defined in SPC-4 specification                */
    0,                                  /*    [6:6] Embedded enclosure services component (0: No, 1: Yes)   */
    0,                                  /*    [7:7] Obsolete                                                */
    0,                                  /*  7 [0:0] VS is Not Defined in SPC-4 specification                */
    0,                                  /*    [1:1] Command management model (0: Not support, 1: Support)   */
    0,                                  /*    [3:2] Obsolete                                                */
    0,                                  /*    [5:4] Unused feature                                          */
    0,                                  /*    [7:6] Obsolete                                                */
    {'H','O','L','T','E','K',' ',' '},  /*  8 ~ 15  T10 Vendor identification                               */
    {'M','a','s','s',' ','S','t','o',   /* 16 ~ 31 Product identification                                   */
     'r','a','g','e','1',' ',' ',' '},
    {'0','.','0','1'},                  /* 32 ~ 35 Product Revision Level                                   */
    #if 0
    {'','','','','','','',''            /* 36 ~ 55 Vendor specific data                                     */
     '','','','','','','',''
     '','','',''},
    0,                                  /* 56 [7:0] Unused feature                                          */
    0,                                  /* 57 [7:0] Reserved                                                */
    {SBC_VERSION_DESCRIPTOR_SBC_3},     /* 58 ~ 73  Version Descriptor 1 ~ 8                                */
    {0},                                /* 74 ~ 95   Reserved                                               */
    #endif
  },
  #endif
  #if (BOT_RAM_DISK1 == 1)
  {
    SBC_DIRECT_ACCESS_BLOCK_DEVICE,     /*  0 [4:0] Peripheral Device Type                                  */
    SBC_PERIPHERAL_DEVICE_CONNECTED,    /*    [7:5] Peripheral Qualifier                                    */
    SBC_RESERVED_VALUE,                 /*  1 [6:0] Reserved                                                */
    SBC_REMOVEABLE_MEDIUM,              /*    [7:7] Removable Medium (0: Not removable, 1: Removable)       */
    SBC_SPC_VERSION_4,                  /*  2 [7:0] SPC Version                                             */
    0x2,                                /*  3 [3:0] Response data format, only 0x2 is valid                 */
    0,                                  /*    [4:4] Hierarchical addressing (0: Not support, 1: Support)    */
    0,                                  /*    [5:5] Normal ACA Supported (0: Not support, 1: Support)       */
    0,                                  /*    [7:6] Obsolete                                                */
    _LENGTH_INQUIRY_DATAn,              /*  4 [7:0] Additional length (n - 4, which n start from 0)         */
    0,                                  /*  5 [0:0] Protection information (0: Not support, 1: Support)     */
    0,                                  /*    [2:1] Reserved                                                */
    0,                                  /*    [3:3] Third-Party Copy supported (0: Not support, 1: Support) */
    SBC_TPGS_NONE,                      /*    [5:4] Target Port Group Support                               */
    0,                                  /*    [6:6] Access Control Coordinator (0: No, 1: Yes)              */
    0,                                  /*    [7:7] SCC Supported (0: Not support, 1: Support)              */
    0,                                  /*  6 [0:0] Unused feature                                          */
    0,                                  /*    [3:1] Obsolete                                                */
    0,                                  /*    [4:4] Multi-Port (0: No, 1: Yes)                              */
    0,                                  /*    [5:5] VS is Not Defined in SPC-4 specification                */
    0,                                  /*    [6:6] Embedded enclosure services component (0: No, 1: Yes)   */
    0,                                  /*    [7:7] Obsolete                                                */
    0,                                  /*  7 [0:0] VS is Not Defined in SPC-4 specification                */
    0,                                  /*    [1:1] Command management model (0: Not support, 1: Support)   */
    0,                                  /*    [3:2] Obsolete                                                */
    0,                                  /*    [5:4] Unused feature                                          */
    0,                                  /*    [7:6] Obsolete                                                */
    {'H','O','L','T','E','K',' ',' '},  /*  8 ~ 15  T10 Vendor identification                               */
    {'M','a','s','s',' ','S','t','o',   /* 16 ~ 31  Product identification                                  */
     'r','a','g','e','2',' ',' ',' '},
    {'0','.','0','1'},                  /* 32 ~ 35  Product Revision Level                                  */
    #if 0
    {'','','','','','','',''            /* 36 ~ 55  Vendor specific data                                    */
     '','','','','','','',''
     '','','',''},
    0,                                  /* 56 [7:0] Unused feature                                          */
    0,                                  /* 57 [7:0] Reserved                                                */
    {SBC_VERSION_DESCRIPTOR_SBC_3},     /* 58 ~ 73  Version Descriptor 1 ~ 8                                */
    {0},                                /* 74 ~ 95  Reserved                                                */
    #endif
  },
  #endif
  #if (BOT_SD_DISK0 == 1)
  {
    SBC_DIRECT_ACCESS_BLOCK_DEVICE,     /*  0 [4:0] Peripheral Device Type                                  */
    SBC_PERIPHERAL_DEVICE_CONNECTED,    /*    [7:5] Peripheral Qualifier                                    */
    SBC_RESERVED_VALUE,                 /*  1 [6:0] Reserved                                                */
    SBC_REMOVEABLE_MEDIUM,              /*    [7:7] Removable Medium (0: Not removable, 1: Removable)       */
    SBC_SPC_VERSION_4,                  /*  2 [7:0] SPC Version                                             */
    0x2,                                /*  3 [3:0] Response data format, only 0x2 is valid                 */
    0,                                  /*    [4:4] Hierarchical addressing (0: Not support, 1: Support)    */
    0,                                  /*    [5:5] Normal ACA Supported (0: Not support, 1: Support)       */
    0,                                  /*    [7:6] Obsolete                                                */
    _LENGTH_INQUIRY_DATAn,              /*  4 [7:0] Additional length (n - 4, which start from 0)           */
    0,                                  /*  5 [0:0] Protection information (0: Not support, 1: Support)     */
    0,                                  /*    [2:1] Reserved                                                */
    0,                                  /*    [3:3] Third-Party Copy supported (0: Not support, 1: Support) */
    SBC_TPGS_NONE,                      /*    [5:4] Target Port Group Support                               */
    0,                                  /*    [6:6] Access Control Coordinator (0: No, 1: Yes)              */
    0,                                  /*    [7:7] SCC Supported (0: Not support, 1: Support)              */
    0,                                  /*  6 [0:0] Unused feature                                          */
    0,                                  /*    [3:1] Obsolete                                                */
    0,                                  /*    [4:4] Multi-Port (0: No, 1: Yes)                              */
    0,                                  /*    [5:5] VS is Not Defined in SPC-4 specification                */
    0,                                  /*    [6:6] Embedded enclosure services component (0: No, 1: Yes)   */
    0,                                  /*    [7:7] Obsolete                                                */
    0,                                  /*  7 [0:0] VS is Not Defined in SPC-4 specification                */
    0,                                  /*    [1:1] Command management model (0: Not support, 1: Support)   */
    0,                                  /*    [3:2] Obsolete                                                */
    0,                                  /*    [5:4] Unused feature                                          */
    0,                                  /*    [7:6] Obsolete                                                */
    {'H','O','L','T','E','K',' ',' '},  /*  8 ~ 15  T10 Vendor identification                               */
    {'M','a','s','s',' ','S','t','o',   /* 16 ~ 31 Product identification                                   */
     'r','a','g','e',' ','S','D',' '},
    {'0','.','0','1'},                  /* 32 ~ 35 Product Revision Level                                   */
    #if 0
    {'','','','','','','',''            /* 36 ~ 55 Vendor specific data                                     */
     '','','','','','','',''
     '','','',''},
    0,                                  /* 56 [7:0] Unused feature                                          */
    0,                                  /* 57 [7:0] Reserved                                                */
    {SBC_VERSION_DESCRIPTOR_SBC_3},     /* 58 ~ 73  Version Descriptor 1 ~ 8                                */
    {0},                                /* 74 ~ 95   Reserved                                               */
    #endif
  },
  #endif
};

__ALIGN4 static SBC_SenseData_TypeDef gSBC_SenseData[BOT_LUN_NUM] =
{
  #if (BOT_RAM_DISK0 == 1)
  {
    SENSE_DATA_FIXED_CURRENT,           /*  0 [6:0] Response Code                                           */
    0,                                  /*    [7:7] Valid                                                   */
    0,                                  /*  1 [7:0] Obsolete                                                */
    SK_NO_SENSE,                        /*  2 [3:0] Sense Key                                               */
    0,                                  /*    [4:4] ILI                                                     */
    0,                                  /*    [5:5] EOM                                                     */
    0,                                  /*    [6:6] Sense Key                                               */
    0,                                  /*    [7:7] Filemark                                                */
    {0, 0, 0, 0},                       /*  3 ~ 6   Information                                             */
    _LENGTH_SENSE_DATAn,                /*  7 [7:0] Addition Sense Length (0 - 7, which n start from 0)     */
    {0, 0, 0, 0},                       /*  8 ~ 11  Command Specific Information                            */
    0,                                  /* 12 [7:0] Addition Sense Code                                     */
    0,                                  /* 13 [7:0] Addition Sense Qualifier                                */
    0,                                  /* 14 [6:0] Field Replaceable Unit Code                             */
    0,                                  /* 15 [6:0] Response Code                                           */
    0,                                  /*    [7:7] Sense Key Specific Valid                                */
    {0, 0}                              /* 16 ~ 17  Sense Key Specific                                      */
  },
  #endif
  #if (BOT_RAM_DISK1 == 1)
  {
    SENSE_DATA_FIXED_CURRENT,           /*  0 [6:0] Response Code                                           */
    0,                                  /*    [7:7] Valid                                                   */
    0,                                  /*  1 [7:0] Obsolete                                                */
    SK_NO_SENSE,                        /*  2 [3:0] Sense Key                                               */
    0,                                  /*    [4:4] ILI                                                     */
    0,                                  /*    [5:5] EOM                                                     */
    0,                                  /*    [6:6] Sense Key                                               */
    0,                                  /*    [7:7] Filemark                                                */
    {0, 0, 0, 0},                       /*  3 ~ 6   Information                                             */
    _LENGTH_SENSE_DATAn,                /*  7 [7:0] Addition Sense Length (0 - 7, which n start from 0)     */
    {0, 0, 0, 0},                       /*  8 ~ 11  Command Specific Information                            */
    0,                                  /* 12 [7:0] Addition Sense Code                                     */
    0,                                  /* 13 [7:0] Addition Sense Qualifier                                */
    0,                                  /* 14 [6:0] Field Replaceable Unit Code                             */
    0,                                  /* 15 [6:0] Response Code                                           */
    0,                                  /*    [7:7] Sense Key Specific Valid                                */
    {0, 0}                              /* 16 ~ 17  Sense Key Specific                                      */
  },
  #endif
  #if (BOT_SD_DISK0 == 1)
  {
    SENSE_DATA_FIXED_CURRENT,           /*  0 [6:0] Response Code                                           */
    0,                                  /*    [7:7] Valid                                                   */
    0,                                  /*  1 [7:0] Obsolete                                                */
    SK_NO_SENSE,                        /*  2 [3:0] Sense Key                                               */
    0,                                  /*    [4:4] ILI                                                     */
    0,                                  /*    [5:5] EOM                                                     */
    0,                                  /*    [6:6] Sense Key                                               */
    0,                                  /*    [7:7] Filemark                                                */
    {0, 0, 0, 0},                       /*  3 ~ 6   Information                                             */
    _LENGTH_SENSE_DATAn,                /*  7 [7:0] Addition Sense Length (0 - 7, which n start from 0)     */
    {0, 0, 0, 0},                       /*  8 ~ 11  Command Specific Information                            */
    0,                                  /* 12 [7:0] Addition Sense Code                                     */
    0,                                  /* 13 [7:0] Addition Sense Qualifier                                */
    0,                                  /* 14 [6:0] Field Replaceable Unit Code                             */
    0,                                  /* 15 [6:0] Response Code                                           */
    0,                                  /*    [7:7] Sense Key Specific Valid                                */
    {0, 0}                              /* 16 ~ 17  Sense Key Specific                                      */
  }
  #endif
};

/* Global Function -----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  SCSI Block Command initialization.
  * @param  pMedia: Target Media
  * @param  uLun: Logic Unit Number
  * @retval None
  ***********************************************************************************************************/
void SBC_Init(BOT_Media_TypeDef *pMedia, u32 uLun)
{
  pMedia->pSBC_InquiryData = (u8 *)(&gSBC_InquiryData[uLun]);
  pMedia->pSBC_SenseData = (u8 *)(&gSBC_SenseData[uLun]);

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI BLock Command Handler.
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
void SBC_CMDHandler(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  #if (USBDCORE_DEBUG == 1)
  u8 uCommand = *pCB;
  #endif
  u32 uCommandIndex;
  gSBCInfo.CommandStatus = SBC_SUCCESS;
  gSBCInfo.uLength = 0;

  uCommandIndex = _SBC_FindCommand(*pCB);
  __DBG_USBPrintf("%06ld [%02x]", __DBG_USBCount, uCommand);

  if (uCommandIndex != SBC_CMD_COUNT && gpFSBCMDHandler[uCommandIndex] != NULL)
  {
    __DBG_USBPrintf("S_%s\r\n", guSBCCMDString[uCommandIndex]);
    (*gpFSBCMDHandler[uCommandIndex])(pMedia, pCB);
  }
  else
  {
    SBC_UpdateSenseData(pMedia, SK_ILLEGAL_REQUEST, ASC_INVALID_COMMAND);
    gSBCInfo.CommandStatus = SBC_CMD_NOTSUPPORT;
  }

  if (gSBCInfo.CommandStatus != SBC_SUCCESS)
  {
    BOT_ErrorHandler(BOT_STALL_BYDIR, BOT_CSW_STATUS_FAILED);
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  SBC Data IN related command.
  * @param  pMedia: Target Media
  * @param  pCB: buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
void SBC_DataIN(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  u32 uCommand = pCB[0];
  switch (uCommand)
  {
    case SBC_CMD_READ_10:
    {
      _SBC_CMDRead10(pMedia, pCB);
      break;
    }
    /*
    case OTHER_SBC_COMMAND:
    {
      break;
    }
    */
    default:
    {
      SBC_UpdateSenseData(pMedia, SK_ILLEGAL_REQUEST, ASC_INVALID_FIELED_IN_COMMAND);
      gSBCInfo.CommandStatus = SBC_CMD_NOTSUPPORT;
      break;
    }
  }

  if (gSBCInfo.CommandStatus != SBC_SUCCESS)
  {
    BOT_ErrorHandler(BOT_STALL_BYDIR, BOT_CSW_STATUS_FAILED);
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  SBC Data OUT related command.
  * @param  pMedia: Target Media
  * @param  pCB: buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
void SBC_DataOUT(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  u32 uCommand = pCB[0];
  switch (uCommand)
  {
    case SBC_CMD_WRITE_10:
    {
      _SBC_CMDWrite10(pMedia, pCB);
      break;
    }
    /*
    case OTHER_SBC_COMMAND:
    {
      break;
    }
    */
    default:
    {
      SBC_UpdateSenseData(pMedia, SK_ILLEGAL_REQUEST, ASC_INVALID_FIELED_IN_COMMAND);
      gSBCInfo.CommandStatus = SBC_CMD_NOTSUPPORT;
      break;
    }
  }

  if (gSBCInfo.CommandStatus != SBC_SUCCESS)
  {
    BOT_ErrorHandler(BOT_STALL_BYDIR, BOT_CSW_STATUS_FAILED);
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  Update sense data for Request Sense SCSI command.
  * @param  pMedia: Target Media to update sense data
  * @param  uSenseKey: Indicates generic information describing an error or exception condition.
  * @param  uAdditionalSenseCode: Indicates further information related to the error or exception
  *         condition reported in the SENSE KEY field.
  * @retval None
  ***********************************************************************************************************/
void SBC_UpdateSenseData(BOT_Media_TypeDef *pMedia, u8 uSenseKey, u8 uAdditionalSenseCode)
{
  SBC_SenseData_TypeDef *pSenseData = (SBC_SenseData_TypeDef *)pMedia->pSBC_SenseData;

  pSenseData->SenseKey = uSenseKey;
  pSenseData->AdditionalSenseCode = uAdditionalSenseCode;

  return;
}

/* Private functions ---------------------------------------------------------------------------------------*/

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SPC-4) - Inquiry (0x12).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDInquiry(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  u8 *pBuffer;
  SBC_CMDInquiry_TypeDef *pCMD = (SBC_CMDInquiry_TypeDef *)pCB;
  u32 uLength = BE2LE16(pCMD->AllocationLength);

  if (BOT_CheckCBWParameter(BOT_DIR_IN, uLength) == FALSE)
  {
    return;
  }

  if (pCMD->EVPD == 1)
  {
    pBuffer = (u8 *)guSBC_VitalProductData;
    uLength = _LENGTH_VITAL_PRODUCT;
  }
  else
  {
    pBuffer = (u8 *)(pMedia->pSBC_InquiryData);
    uLength = (uLength <= _LENGTH_INQUIRYDATA) ? uLength : _LENGTH_INQUIRYDATA;
  }

  BOT_WriteINData(pBuffer, uLength, BOT_STATE_DATAIN_LAST);

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SPC-4) - Request Sense (0x03).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDRequestSense(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  SBC_CMDRequestSense_TypeDef *pCMD = (SBC_CMDRequestSense_TypeDef *)pCB;
  u32 uLength = BE2LE16(pCMD->AllocationLength);
  if (BOT_CheckCBWParameter(BOT_DIR_IN, uLength) == FALSE)
  {
    return;
  }

  uLength = (uLength <= _LENGTH_SENSE_DATA) ? uLength : _LENGTH_SENSE_DATA;
  BOT_WriteINData((u8 *)(pMedia->pSBC_SenseData), uLength, BOT_STATE_DATAIN_LAST);
  SBC_UpdateSenseData(pMedia, SK_NO_SENSE, 0x0);

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SPC-4) - Test Unit Ready (0x00).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDTestUnitReady(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  BOT_CSW_STATUS_Enum status = BOT_CSW_STATUS_PASSED;
  if (BOT_CheckCBWParameter(BOT_DIR_NONE, 0) == FALSE)
  {
    return;
  }

  if (pMedia->GetStatus(pMedia->uId, &(pMedia->Size)) == FALSE)
  {
    SBC_UpdateSenseData(pMedia, SK_NOT_READY, ASC_MEDIUM_NOT_PRESENT);
    status = BOT_CSW_STATUS_FAILED;
  }

  BOT_SendCSW(status);

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SBC-3) - Read 10 (0x28).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDRead10(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  u32 uLen;
  u32 uAddr;
  u32 uBlkCnt;
  u8 *pBuffer;
  BOT_State_Enum status = BOT_STATE_DATAIN;

  /*--------------------------------------------------------------------------------------------------------*/
  /* When receive SBC Read 10 command, get address from CB and read first block of data. Send the data to   */
  /* USB Buffer for IN transmission. The BOT state machine will call this function again when IN data       */
  /* transmission is finished.                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
  if (gSBCInfo.uLength == 0)
  {
    _SBC_GetAddress(pCB, pMedia->Size.uBlockSize);
    if (BOT_CheckCBWParameter(BOT_DIR_IN, gSBCInfo.uLength) == FALSE)
    {
      return;
    }
    uAddr = gSBCInfo.uAddress;
    uBlkCnt = gSBCInfo.uLength / pMedia->Size.uBlockSize;
    if ((uAddr + uBlkCnt) > pMedia->Size.uBlockCount)
    {
      SBC_UpdateSenseData(pMedia, SK_ILLEGAL_REQUEST, ASC_ADDRESS_OUT_OF_RANGE);
      gSBCInfo.CommandStatus = SBC_ERROR;
      return;
    }
    if (pMedia->Size.uAddressMode == BOT_ADDR_MODE_BYTE)
    {
      gSBCInfo.uAddress *= pMedia->Size.uBlockSize;
    }
  }

  uAddr = gSBCInfo.uAddress;
  uLen = (gSBCInfo.uLength > BOT_MAX_PACKET_SIZE) ? BOT_MAX_PACKET_SIZE : gSBCInfo.uLength;


  /*--------------------------------------------------------------------------------------------------------*/
  /* Set state as BOT_STATE_DATAIN_LAST which cause the BOT state machine send CSW to Host when IN data     */
  /* transmission is finished.                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
  if ((gSBCInfo.uLength - uLen) == 0)
  {
    status = BOT_STATE_DATAIN_LAST;
  }

  ACC_LED_ON();

  if (pMedia->Read(pMedia->uId, &pBuffer, uAddr, uLen) != FALSE)
  {
    BOT_WriteINData(pBuffer, uLen, status);
    gSBCInfo.uLength  -= uLen;
    if (pMedia->Size.uAddressMode == BOT_ADDR_MODE_BYTE)
    {
      gSBCInfo.uAddress += uLen;
    }
    else
    {
      if ((gSBCInfo.uLength % pMedia->Size.uBlockSize) == 0)
      {
        gSBCInfo.uAddress++;
      }
    }
  }
  else
  {
    SBC_UpdateSenseData(pMedia, SK_NOT_READY, ASC_UNRECOVERED_READ_ERROR);
    gSBCInfo.CommandStatus = SBC_ERROR;
  }

  ACC_LED_OFF();

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SBC-3) - Write 10 (0x2A).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDWrite10(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  u32 uBuffer[64/4];
  u32 uLen;
  u32 uAddr;
  u32 uBlkCnt;

  /*--------------------------------------------------------------------------------------------------------*/
  /* When receive SBC Write 10 command, get address from CB and set state as OUT, then the BOT state machine*/
  /* will call this function when next OUT data is received.                                                */
  /*--------------------------------------------------------------------------------------------------------*/
  if (gSBCInfo.uLength == 0)
  {
    _SBC_GetAddress(pCB, pMedia->Size.uBlockSize);
    if (BOT_CheckCBWParameter(BOT_DIR_OUT, gSBCInfo.uLength) == TRUE)
    {
      /*----------------------------------------------------------------------------------------------------*/
      /* Read OUT data with zero length to inform USB Device peripheral that process of CBW OUT             */
      /* data is finished. The USB Device will send ACK to Host when received next OUT data                 */
      /*----------------------------------------------------------------------------------------------------*/
      BOT_ReadOUTData((u8 *)NULL, USB_DISCARD_OUT_DATA);
    }
    uAddr = gSBCInfo.uAddress;
    uBlkCnt = gSBCInfo.uLength / pMedia->Size.uBlockSize;
    if ((uAddr + uBlkCnt) > pMedia->Size.uBlockCount)
    {
      SBC_UpdateSenseData(pMedia, SK_ILLEGAL_REQUEST, ASC_ADDRESS_OUT_OF_RANGE);
      gSBCInfo.CommandStatus = SBC_ERROR;
    }
    if (pMedia->Size.uAddressMode == BOT_ADDR_MODE_BYTE)
    {
      gSBCInfo.uAddress *= pMedia->Size.uBlockSize;
    }
    return;
  }

  uAddr = gSBCInfo.uAddress;
  uLen = USBDCore_EPTGetTransferCount(BOT_OUT_EPT, USBD_CNTB0);

  BOT_ReadOUTData((u8 *)&uBuffer, uLen);
  if (gSBCInfo.uLength - uLen != 0)
  {
    BOT_ReadOUTData((u8 *)NULL, USB_DISCARD_OUT_DATA);
  }

  ACC_LED_ON();

  if (pMedia->Write(pMedia->uId, (u8 *)&uBuffer, uAddr, uLen) != FALSE)
  {
    gSBCInfo.uLength  -= uLen;
    if (pMedia->Size.uAddressMode == BOT_ADDR_MODE_BYTE)
    {
      gSBCInfo.uAddress += uLen;
    }
    else
    {
      if ((gSBCInfo.uLength % pMedia->Size.uBlockSize) == 0)
      {
        gSBCInfo.uAddress++;
      }
    }
  }
  else
  {
    SBC_UpdateSenseData(pMedia, SK_NOT_READY, ASC_WRITE_PROTECTED);
    gSBCInfo.CommandStatus = SBC_ERROR;
  }

  ACC_LED_OFF();

  /*--------------------------------------------------------------------------------------------------------*/
  /* Send CSW when all data is received.                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
  if (gSBCInfo.uLength == 0)
  {
    BOT_SendCSW(BOT_CSW_STATUS_PASSED);
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SBC-3) - Ready Capacity 10 (0x25).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDReadCapacity10(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  u32 uLen = _LENGTH_READCAP10_DATA;
  s32 i;

  if (BOT_CheckCBWParameter(BOT_DIR_IN, uLen) == FALSE)
  {
    return;
  }

  for (i = 3; i >= 0; i--)
  {
    guSBC_ReadCapacity10Data[i] = (u8)((pMedia->Size.uBlockCount - 1) >> (24 - i * 8));
    guSBC_ReadCapacity10Data[i + 4] = (u8)(pMedia->Size.uBlockSize >> (24 - i * 8));
  }

  BOT_WriteINData(guSBC_ReadCapacity10Data, uLen, BOT_STATE_DATAIN_LAST);

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (MMC) - Read Format Capacity (0x23).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDReadFormatCapacity(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  SBC_CMDTypical_TypeDef *pCMD = (SBC_CMDTypical_TypeDef *)pCB;
  u32 uLen = BE2LE16(pCMD->AllocationLength);

  if (BOT_CheckCBWParameter(BOT_DIR_IN, uLen) == FALSE)
  {
    return;
  }

  guSBC_ReadFormatCapacityData[4] = (u8)(pMedia->Size.uBlockCount >> 24);
  guSBC_ReadFormatCapacityData[5] = (u8)(pMedia->Size.uBlockCount >> 16);
  guSBC_ReadFormatCapacityData[6] = (u8)(pMedia->Size.uBlockCount >> 8);
  guSBC_ReadFormatCapacityData[7] = (u8)(pMedia->Size.uBlockCount);

  guSBC_ReadFormatCapacityData[9]  = (u8)(pMedia->Size.uBlockSize >> 16);
  guSBC_ReadFormatCapacityData[10] = (u8)(pMedia->Size.uBlockSize >> 8);
  guSBC_ReadFormatCapacityData[11] = (u8)(pMedia->Size.uBlockSize);

  uLen = (uLen <= _LENGTH_READFORMATCAP_DATA) ? uLen : _LENGTH_READFORMATCAP_DATA;
  BOT_WriteINData(guSBC_ReadFormatCapacityData, uLen, BOT_STATE_DATAIN_LAST);

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SPC-4) - Read Mode Sense 6 (0x1A).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDReadModeSense6(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  SBC_CMDModeSecse6_TypeDef *pCMD = (SBC_CMDModeSecse6_TypeDef *)pCB;
  u32 uLen = pCMD->AllocationLength;
  u8 uModeSense6Data[4] = {3, 0, 0, 0};

  if (BOT_CheckCBWParameter(BOT_DIR_IN, uLen) == FALSE)
  {
    return;
  }

  uLen = (uLen <= sizeof(uModeSense6Data)) ? uLen : sizeof(uModeSense6Data);
  BOT_WriteINData(uModeSense6Data, uLen, BOT_STATE_DATAIN_LAST);

  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SBC-3) - Prevent Allow Medium Removal (0x1E).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDPreventAllowMediumRemoval(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  BOT_SendCSW(BOT_CSW_STATUS_PASSED);
  return;
}

/*********************************************************************************************************//**
  * @brief  SCSI Block Command (SBC-3) - Load Unload (0x1B).
  * @param  pMedia: Target Media
  * @param  pCB: Buffer pointer of command block (CB)
  * @retval None
  ***********************************************************************************************************/
static void _SBC_CMDLoadUnload(BOT_Media_TypeDef *pMedia, u8 *pCB)
{
  if (pMedia->Unmount != NULL)
  {
    pMedia->Unmount(pMedia->uId);
  }

  BOT_SendCSW(BOT_CSW_STATUS_PASSED);
  return;
}

/*********************************************************************************************************//**
  * @brief  Get address information from CB.
  * @param  pCB: Buffer pointer of command block (CB)
  * @param  uBlockSize: Block size of specify media
  * @retval None
  ***********************************************************************************************************/
static void _SBC_GetAddress(u8 *pCB, u32 uBlockSize)
{
  u8 *pLogicalBlockAddress = &pCB[2];
  u8 *pTransferLength;

  gSBCInfo.uAddress = BE2LE32(pLogicalBlockAddress);

  switch (*pCB)
  {
    case SBC_CMD_READ_10:
    case SBC_CMD_WRITE_10:
    //case SBC_CMD_VERIFY_10:
    {
      pTransferLength = &pCB[7];
      gSBCInfo.uLength = BE2LE16(pTransferLength) * uBlockSize;
      break;
    }
    #if 0
    case SBC_CMD_READ_12:
    case SBC_CMD_WRITE_12:
    {
      pTransferLength = &pCB[6];
      gSBCInfo.uLength = BE2LE32(pTransferLength) * uBlockSize;
      break;
    }
    #endif
    default:
    {
      break;
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  Find SCSI command.
  * @param  uCommand: Command value
  * @retval i: Command index
  ***********************************************************************************************************/
static u32 _SBC_FindCommand(u8 uCommand)
{
  s32 i;

  for (i = SBC_CMD_COUNT - 1; i >= 0; i--)
  {
    if (uCommand == gSBCCMDTable[i])
    {
      return i;
    }
  }

  return SBC_CMD_COUNT;
}


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
