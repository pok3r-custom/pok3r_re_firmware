/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/usb_bulk_only_transport.c
 * @version $Rev:: 553          $
 * @date    $Date:: 2017-07-18 #$
 * @brief   The Bulk Only Transport (BOT).
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
#include "ram_disk.h"
#if (BOT_SD_DISK0==1)
#include "sd_disk.h"
#endif

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
typedef __PACKED_H struct _BM_FLAG_TYPEBIT
{
  u8 Reserved  :6,
     Obsolete  :1,
     Direction :1;
} __PACKED_F BOT_CBW_bmFlag_TypeBit;

typedef __PACKED_H struct
{
  u32 dCBWSignature;
  u32 dCBWTag;
  u32 dCBWDataTransferLength;
  BOT_CBW_bmFlag_TypeBit bmCBWFlags;
  u8  bCBWLUN;
  u8  bCBWCBLength;
  u8  CBWCB[16];
  u8  Reserved[33];
} __PACKED_F BOT_CBW_TypeDef;

typedef __PACKED_H struct
{
  u32 dCSWSignature;
  u32 dCSWTag;
  u32 dCSWDataResidue;
  u8  bCSWStatus;
} __PACKED_F BOT_CSW_TypeDef;

/* Private constants ---------------------------------------------------------------------------------------*/
#define _BOT_CBW_SIGNATURE          (0x43425355)
#define _BOT_CSW_SIGNATURE          (0x53425355)
#define _BOT_CBW_PACKET_LENGTH      (31)
#define _BOT_CSW_PACKET_LENGTH      (13)

#define _BOT_MAX_CB_LENGTH          (16)

#if (BOT_LUN_NUM > 15)
#error "The LUN must be 0 through 15."
#endif

/* Private function prototypes -----------------------------------------------------------------------------*/
static void _BOT_CBWProcess(void);
static void _BOT_StallEPT(BOT_STALL_Enum Dir);

/* Private macro -------------------------------------------------------------------------------------------*/
#define IS_WAIT_RESET_RECOVERY      (gUSBCore.Info.uIsDiscardClearFeature)
#define GET_MEDIA(lun)              (&gMediaInfo[lun])

/* Global variables ----------------------------------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------------------------------------*/
static u32 guMaxLUN = (BOT_LUN_NUM - 1);
static BOT_State_Enum gBOTState;
__ALIGN4 static BOT_CBW_TypeDef gCBW;
__ALIGN4 static BOT_CSW_TypeDef gCSW;

static BOT_Media_TypeDef gMediaInfo[BOT_LUN_NUM] =
{
  #if (BOT_RAM_DISK0 == 1)
  {
    RAMDISK0_ID,
    { RAMDISK0_BlockCount, RAMDISK0_BlockSize, RAMDISK0_AddressMode},
    NULL,
    (pReadFun)RAMDISK_Read,
    (pWriteFun)RAMDISK_Write,
    (pGetStatusFun)RAMDISK_GetStatus,
    (pUnmountFun)RAMDISK_Unmount,
    NULL,
    NULL,
  },
  #endif
  #if (BOT_RAM_DISK1 == 1)
  {
    RAMDISK1_ID,
    {RAMDISK1_BlockCount, RAMDISK1_BlockSize, RAMDISK1_AddressMode},
    NULL,
    (pReadFun)RAMDISK_Read,
    (pWriteFun)RAMDISK_Write,
    (pGetStatusFun)RAMDISK_GetStatus,
    (pUnmountFun)RAMDISK_Unmount,
    NULL,
    NULL,
  },
  #endif
  #if (BOT_SD_DISK0 == 1)
  {
    SDDISK0_ID,
    {(u32)NULL, (u32)NULL, (u32)NULL},
    (pInit)SDDISK_GetStatus,
    (pReadFun)SDDISK_Read,
    (pWriteFun)SDDISK_Write,
    (pGetStatusFun)SDDISK_GetStatus,
    (pUnmountFun)SDDISK_Unmount,
    NULL,
    NULL,
  },
  #endif
};

/* Global Function -----------------------------------------------------------------------------------------*/

/*********************************************************************************************************//**
  * @brief  BOT Initialization.
  * @retval None
  ***********************************************************************************************************/
void BOT_Init(void)
{
  s32 i;

  gCSW.dCSWSignature = _BOT_CSW_SIGNATURE;

  for (i = BOT_LUN_NUM - 1; i >= 0; i--)
  {
    SBC_Init(GET_MEDIA(i), i);

    /*------------------------------------------------------------------------------------------------------*/
    /* Init Media if init function is not NULL. The media size will returned by init function               */
    /*------------------------------------------------------------------------------------------------------*/
    if (gMediaInfo[i].Init != NULL)
    {
      gMediaInfo[i].Init(gMediaInfo[i].uId, &(gMediaInfo[i].Size));
    }
  }

  BOT_Reset();

  return;
}

/*********************************************************************************************************//**
  * @brief  BOT Reset function.
  * @retval None
  ***********************************************************************************************************/
void BOT_Reset(void)
{
  extern USBDCore_TypeDef gUSBCore;

  gBOTState = BOT_STATE_IDLE;
  IS_WAIT_RESET_RECOVERY = FALSE;

  return;
}

/*********************************************************************************************************//**
  * @brief  Get Maximum Logical Unit Number (LUN).
  * @retval guMaxLUN: Address of Maximum LUN
  ***********************************************************************************************************/
uc8 *BOT_GetMaxLUNAddress(void)
{
  return ((uc8 *)&guMaxLUN);
}

/*********************************************************************************************************//**
  * @brief  BOT OUT Process.
  * @retval None
  ***********************************************************************************************************/
void BOT_OUTProcess(void)
{
  BOT_Media_TypeDef *pMedia = GET_MEDIA(gCBW.bCBWLUN);

  switch (gBOTState)
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Decode and process CBW                                                                               */
    /*------------------------------------------------------------------------------------------------------*/
    case BOT_STATE_IDLE:
    {
      _BOT_CBWProcess();
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* Data OUT process                                                                                     */
    /*------------------------------------------------------------------------------------------------------*/
    case BOT_STATE_DATAOUT:
    {

      SBC_DataOUT(pMedia, gCBW.CBWCB);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* BOT State machine out of sync, report Phase Error by CSW                                             */
    /*------------------------------------------------------------------------------------------------------*/
    default:
    {
      SBC_UpdateSenseData(pMedia, SK_ILLEGAL_REQUEST, ASC_INVALID_FIELED_IN_COMMAND);
      BOT_ErrorHandler(BOT_STALL_BOTH, BOT_CSW_STATUS_PHASEERR);
      break;
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  BOT IN process.
  * @retval None
  ***********************************************************************************************************/
void BOT_INProcess(void)
{
  BOT_Media_TypeDef *pMedia = GET_MEDIA(gCBW.bCBWLUN);

  switch (gBOTState)
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Data IN process                                                                                      */
    /*------------------------------------------------------------------------------------------------------*/
    case BOT_STATE_DATAIN:
    {
      SBC_DataIN(pMedia, gCBW.CBWCB);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* Last Data IN, send CSW                                                                               */
    /*------------------------------------------------------------------------------------------------------*/
    case BOT_STATE_DATAIN_LAST:
    {
      /* STALL IN Endpoint when last Data IN but Data Residue in CSW is not zero                            */
      if (gCSW.dCSWDataResidue != 0)
      {
        _BOT_StallEPT(BOT_STALL_IN);
      }
      BOT_SendCSW(BOT_CSW_STATUS_PASSED);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* CSW is sent                                                                                          */
    /*------------------------------------------------------------------------------------------------------*/
    case BOT_STATE_SENDCSW:
    //case BOT_STATE_ERROR:
    {
      gBOTState = BOT_STATE_IDLE;
      /*----------------------------------------------------------------------------------------------------*/
      /* Read OUT data with zero length to inform USB Device peripheral that process of CBW OUT             */
      /* data is finished. The USB Device will send ACK to Host when received next CBW OUT data             */
      /*----------------------------------------------------------------------------------------------------*/
      USBDCore_EPTReadOUTData(BOT_OUT_EPT, (u32 *)NULL, USB_DISCARD_OUT_DATA);
      break;
    }
    default:
    {
      break;
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  Check CBW Parameter is valid or not (Cass1 ~ Cass 13).
  * @param  DeviceDirection: Device expects data transfer direction.
  *         @arg BOT_DIR_OUT: Device expects OUT transfer (Host to Device)
  *         @arg BOT_DIR_IN: Device expects IN transfer (Device to Host)
  *         @arg BOT_DIR_NONE: Device expects No transfer
  * @param  uDeviceLength: Device expects data length.
  * @retval Result: TRUE for parameter is valid, FALSE for parameter is invalid.
  ***********************************************************************************************************/
u32 BOT_CheckCBWParameter(BOT_Dir_Enum DeviceDirection, u32 uDeviceLength)
{
  BOT_CSW_STATUS_Enum status = BOT_CSW_STATUS_PASSED;
  BOT_STALL_Enum direction;
  u32 Result;

  __DBG_USBPrintf("%06ld %dH%d %dD%d\r\n", __DBG_USBCount,
                                           gCBW.bmCBWFlags.Direction,
                                           gCBW.dCBWDataTransferLength,
                                           DeviceDirection,
                                           uDeviceLength
                                           );

  /*--------------------------------------------------------------------------------------------------------*/
  /* Case 1 ~ 3                                                                                             */
  /*--------------------------------------------------------------------------------------------------------*/
  if (gCBW.dCBWDataTransferLength == 0)
  {
    if (DeviceDirection == BOT_DIR_NONE)
    {
      /*----------------------------------------------------------------------------------------------------*/
      /* Case 1 (Hn = Dn)                                                                                   */
      /*----------------------------------------------------------------------------------------------------*/
      __DBG_USBPrintf("%06ld CASE1\r\n", __DBG_USBCount);
      gCSW.dCSWDataResidue = 0;
    }
    else
    {
      /*----------------------------------------------------------------------------------------------------*/
      /* Case 2 (Hn < Di) / Case 3 (Hn < Do)                                                                */
      /*----------------------------------------------------------------------------------------------------*/
      direction = BOT_STALL_NONE;
      status = BOT_CSW_STATUS_PHASEERR;
      __DBG_USBPrintf("%06ld CASE2, 3\r\n", __DBG_USBCount);
    }
  }
  /*--------------------------------------------------------------------------------------------------------*/
  /* Case 6 (Hi = Di) / Case 12 (Ho = Do)                                                                   */
  /*--------------------------------------------------------------------------------------------------------*/
  else if (gCBW.dCBWDataTransferLength == uDeviceLength && gCBW.bmCBWFlags.Direction == DeviceDirection)
  {
    gBOTState = (DeviceDirection == BOT_DIR_IN) ? BOT_STATE_DATAIN : BOT_STATE_DATAOUT;
    __DBG_USBPrintf("%06ld CASE6, 12\r\n", __DBG_USBCount);
  }
  /*--------------------------------------------------------------------------------------------------------*/
  /* Case 4, 5, 7, 8                                                                                        */
  /*--------------------------------------------------------------------------------------------------------*/
  else if (gCBW.bmCBWFlags.Direction == BOT_DIR_IN)
  {
    switch (DeviceDirection)
    {
      case BOT_DIR_NONE:
      case BOT_DIR_IN:
      {
        if (gCBW.dCBWDataTransferLength > uDeviceLength)
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Case 4 (Hi > Dn) / Case 5 (Hi > Di)                                                            */
          /*------------------------------------------------------------------------------------------------*/
          direction = BOT_STALL_IN;
          status = BOT_CSW_STATUS_FAILED;
          gCSW.dCSWDataResidue = gCBW.dCBWDataTransferLength - uDeviceLength;
          __DBG_USBPrintf("%06ld CASE4, 5\r\n", __DBG_USBCount);
        }
        else if (gCBW.dCBWDataTransferLength < uDeviceLength)
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Case 7 (Hi < Di)                                                                               */
          /*------------------------------------------------------------------------------------------------*/
          direction = BOT_STALL_IN;
          status = BOT_CSW_STATUS_PHASEERR;
          __DBG_USBPrintf("%06ld CASE7\r\n", __DBG_USBCount);
        }
        break;
      }
      case BOT_DIR_OUT:
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* Case 8 (Hi <> Do)                                                                                */
        /*--------------------------------------------------------------------------------------------------*/
        direction = BOT_STALL_IN;
        status = BOT_CSW_STATUS_PHASEERR;
        __DBG_USBPrintf("%06ld CASE8\r\n", __DBG_USBCount);
        break;
      }
    }
  }
  /*--------------------------------------------------------------------------------------------------------*/
  /* Case 9, 10, 11, 13                                                                                     */
  /*--------------------------------------------------------------------------------------------------------*/
  else if (gCBW.bmCBWFlags.Direction == BOT_DIR_OUT)
  {
    switch (DeviceDirection)
    {
      case BOT_DIR_NONE:
      case BOT_DIR_OUT:
      {
        if (gCBW.dCBWDataTransferLength > uDeviceLength)
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Case 9 (Ho > Dn) / Case 11 (Ho > Do)                                                           */
          /*------------------------------------------------------------------------------------------------*/
          direction = BOT_STALL_OUT;
          status = BOT_CSW_STATUS_FAILED;
          gCSW.dCSWDataResidue = gCBW.dCBWDataTransferLength - uDeviceLength;
          __DBG_USBPrintf("%06ld CASE9, 11\r\n", __DBG_USBCount);
        }
        else if (gCBW.dCBWDataTransferLength < uDeviceLength)
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Case 13 (Ho < Do)                                                                              */
          /*------------------------------------------------------------------------------------------------*/
          direction = BOT_STALL_OUT;
          status = BOT_CSW_STATUS_PHASEERR;
          __DBG_USBPrintf("%06ld CASE13\r\n", __DBG_USBCount);
        }
        break;
      }
      case BOT_DIR_IN:
      {
        /*--------------------------------------------------------------------------------------------------*/
        /* Case 10 (Ho <> Di)                                                                               */
        /*--------------------------------------------------------------------------------------------------*/
        direction = BOT_STALL_OUT;
        status = BOT_CSW_STATUS_PHASEERR;
        __DBG_USBPrintf("%06ld CASE10\r\n", __DBG_USBCount);
        break;
      }
    }
  }

  if (status != BOT_CSW_STATUS_PASSED)
  {
    SBC_UpdateSenseData(GET_MEDIA(gCBW.bCBWLUN), SK_ILLEGAL_REQUEST, ASC_INVALID_FIELED_IN_COMMAND);
    BOT_ErrorHandler(direction, status);
    Result = FALSE;
  }
  else
  {
    Result = TRUE;
  }

  return Result;
}

/*********************************************************************************************************//**
  * @brief  Write BOT IN data and update BOT State/CSW.
  * @param  pBuffer: Source buffer
  * @param  uLen: Length for write IN data
  * @param  status: BOT State after Write IN operation
  *         @arg BOT_STATE_DATAIN: The Data IN operation, BOT state machine will call to SBC read command
  *                                after IN Data transmission is finished.
  *         @arg BOT_STATE_DATAIN_LAST: The last Data IN operation, BOT state machine will send CSW after
  *                                     IN Data transmission is finished.
  * @retval None
  ***********************************************************************************************************/
void BOT_WriteINData(u8 *pBuffer, u32 uLen, BOT_State_Enum status)
{
  __DBG_USBPrintf("%06ld BulkIN\t[%02d]\r\n", __DBG_USBCount, uLen);
  __DBG_USBDump((uc8 *)pBuffer, uLen);

  USBDCore_EPTWriteINData(BOT_IN_EPT, (u32 *)pBuffer, uLen);

  gBOTState = status;
  gCSW.dCSWDataResidue -= uLen;

  return;
}

/*********************************************************************************************************//**
  * @brief  Read BOT OUT data and update CSW.
  * @param  pBuffer: Destination buffer
  * @param  uLen: Length for read OUT data
  * @retval None
  ***********************************************************************************************************/
void BOT_ReadOUTData(u8 *pBuffer, u32 uLen)
{
  gBOTState = BOT_STATE_DATAOUT;

  (uLen == USB_DISCARD_OUT_DATA) ? USBDCore_EPTReadOUTData(BOT_OUT_EPT, (u32 *)pBuffer, uLen) : USBDCore_EPTReadMemory(BOT_OUT_EPT, (u32 *)pBuffer, uLen);

  gCSW.dCSWDataResidue -= uLen;

  __DBG_USBPrintf("%06ld BulkOUT\t[%02d]\r\n", __DBG_USBCount, uLen);
  __DBG_USBDump((uc8 *)pBuffer, uLen);

  return;
}

/*********************************************************************************************************//**
  * @brief  Send CSW.
  * @param  status: bCSWStatus field which define by BOT_CSW_STATUS_Enum
  *         @arg BOT_CSW_STATUS_PASSED: Command passed (Good status)
  *         @arg BOT_CSW_STATUS_FAILED: Command failed
  *         @arg BOT_CSW_STATUS_PHASEERR: Phase error
  * @retval None
  ***********************************************************************************************************/
void BOT_SendCSW(BOT_CSW_STATUS_Enum status)
{
  gCSW.bCSWStatus = status;

  __DBG_USBPrintf("%06ld CSW \t[%x][%d][%d]\r\n", ++__DBG_USBCount, gCSW.dCSWTag, gCSW.dCSWDataResidue, gCSW.bCSWStatus);
  __DBG_USBDump((uc8 *)&gCSW, _BOT_CSW_PACKET_LENGTH);

  /* Wait until last STALL transmission is finished                                                         */
  USBDCore_EPTWaitSTALLSent(BOT_IN_EPT);

  gBOTState = BOT_STATE_SENDCSW;

  USBDCore_EPTWriteINData(BOT_IN_EPT, (u32 *)&gCSW, _BOT_CSW_PACKET_LENGTH);

  return;
}

/*********************************************************************************************************//**
  * @brief  BOT Error handler.
  * @param  StallEPT: Endpoint direction which want to STALL.
  *         @arg BOT_STALL_OUT: OUT Endpoint
  *         @arg BOT_STALL_IN: IN Endpoint
  *         @arg BOT_STALL_BOTH: Both IN and OUT endpoint
  *         @arg BOT_STALL_BYDIR: Depend on CBW direction field (gCBW.bmCBWFlags.Direction)
  * @param  CSWstatus: bCSWStatus field which define by BOT_CSW_STATUS_Enum
  *         @arg BOT_CSW_STATUS_PASSED: Command passed (Good status)
  *         @arg BOT_CSW_STATUS_FAILED: Command failed
  *         @arg BOT_CSW_STATUS_PHASEERR: Phase error
  * @retval None
  ***********************************************************************************************************/
void BOT_ErrorHandler(BOT_STALL_Enum StallEPT, BOT_CSW_STATUS_Enum CSWstatus)
{
  if (StallEPT == BOT_STALL_BYDIR)
  {
    StallEPT = (gCBW.bmCBWFlags.Direction == BOT_DIR_OUT) ? BOT_STALL_OUT : BOT_STALL_IN;
  }
  _BOT_StallEPT(StallEPT);
  BOT_SendCSW(CSWstatus);

  return;
}

/* Private functions ---------------------------------------------------------------------------------------*/

/*********************************************************************************************************//**
  * @brief  Decode and process CBW command.
  * @retval None
  ***********************************************************************************************************/
static void _BOT_CBWProcess(void)
{
  extern USBDCore_TypeDef gUSBCore;
  BOT_Media_TypeDef *pMedia;

  u32 uCBWLen;

  /*--------------------------------------------------------------------------------------------------------*/
  /* Read CBW OUT data from USB Buffer.                                                                     */
  /*--------------------------------------------------------------------------------------------------------*/
  uCBWLen = USBDCore_EPTReadMemory(BOT_OUT_EPT, (u32 *)&gCBW, BOT_MAX_PACKET_SIZE);

  __DBG_USBPrintf("%06ld CBW \t[%x][%d][%d][%d][%d]\r\n", ++__DBG_USBCount, gCBW.dCBWTag, gCBW.dCBWDataTransferLength, gCBW.bmCBWFlags.Direction, gCBW.bCBWLUN, gCBW.bCBWCBLength);
  __DBG_USBDump((uc8 *)&gCBW, uCBWLen);

  gCSW.dCSWTag = gCBW.dCBWTag;

  pMedia = (gCBW.bCBWLUN < BOT_LUN_NUM) ? GET_MEDIA(gCBW.bCBWLUN) : NULL;

  /*--------------------------------------------------------------------------------------------------------*/
  /* Check CBW is valid or not                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
  if (gCBW.dCBWSignature != _BOT_CBW_SIGNATURE || uCBWLen != _BOT_CBW_PACKET_LENGTH)
  {
    _BOT_StallEPT(BOT_STALL_BOTH);
    IS_WAIT_RESET_RECOVERY = TRUE;
    gBOTState = BOT_STATE_ERROR;
    return;
  }

  gCSW.dCSWDataResidue = gCBW.dCBWDataTransferLength;

  /*--------------------------------------------------------------------------------------------------------*/
  /* Check CBW is meaningful or not                                                                         */
  /*--------------------------------------------------------------------------------------------------------*/
  if ((gCBW.bCBWLUN >= BOT_LUN_NUM) || (gCBW.bCBWCBLength < 1) || (gCBW.bCBWCBLength > _BOT_MAX_CB_LENGTH))
  {
    _BOT_StallEPT(BOT_STALL_BOTH);
    IS_WAIT_RESET_RECOVERY = TRUE;
    gBOTState = BOT_STATE_ERROR;
    return;
  }

  API_USB_EPTn_CLR_HALT(BOT_OUT_EPT);
  API_USB_EPTn_CLR_HALT(BOT_IN_EPT);
  SBC_CMDHandler(pMedia, (u8 *)gCBW.CBWCB);

  return;
}

/*********************************************************************************************************//**
  * @brief  STALL specify endpoint.
  * @param  direction: Endpoint direction which want to STALL.
  *         @arg BOT_STALL_OUT: OUT Endpoint
  *         @arg BOT_STALL_IN: IN Endpoint
  *         @arg BOT_STALL_BOTH: Both IN and OUT endpoint
  *         @arg BOT_STALL_NONE: None
  * @retval None
  ***********************************************************************************************************/
static void _BOT_StallEPT(BOT_STALL_Enum direction)
{
  switch (direction)
  {
    case BOT_STALL_IN:
    {
      USBDCore_EPTSetSTALL(BOT_IN_EPT);
      break;
    }
    case BOT_STALL_OUT:
    {
      USBDCore_EPTSetSTALL(BOT_OUT_EPT);
      break;
    }
    case BOT_STALL_BOTH:
    {
      USBDCore_EPTSetSTALL(BOT_IN_EPT);
      USBDCore_EPTSetSTALL(BOT_OUT_EPT);
      break;
    }
    default:
    {
      break;
    }
  }

  return;
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
