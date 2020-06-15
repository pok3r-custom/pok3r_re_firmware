/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/usb_bulk_only_transport.h
 * @version $Rev:: 2825         $
 * @date    $Date:: 2018-05-29 #$
 * @brief   The header file of Bulk Only Transport.
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
// <<< Use Configuration Wizard in Context Menu >>>

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __USB_BULK_ONLY_TRANSPORT_H
#define __USB_BULK_ONLY_TRANSPORT_H

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_board.h"

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
#define BOT_IN_EPT                (USBD_EPT1)
#define BOT_OUT_EPT               (USBD_EPT2)
#define BOT_MAX_PACKET_SIZE       (64)

//<o0> Total LUN Count <1-15:1>
//<o1.0> Enable RAM DISK 0
//<o2.0> Enable RAM DISK 1
//<o3.0> Enable SD DISK 0
#define BOT_LUN_NUM               (1)
#define BOT_RAM_DISK0             (1)
#define BOT_RAM_DISK1             (0)
#define BOT_SD_DISK0              (0)

//<e0.0> Enable Access LED indicator
#define ACC_LED                   (0)
#define ACC_LED_ID                (HT_LED2)

/* Exported types ------------------------------------------------------------------------------------------*/
typedef enum
{
  BOT_STATE_IDLE        = 0,
  BOT_STATE_ERROR       = 1,
  BOT_STATE_DATAOUT     = 2,
  BOT_STATE_DATAIN      = 3,
  BOT_STATE_DATAIN_LAST = 4,
  BOT_STATE_SENDCSW     = 5
} BOT_State_Enum;

typedef enum
{
  BOT_CSW_STATUS_PASSED   = 0x00,
  BOT_CSW_STATUS_FAILED   = 0x01,
  BOT_CSW_STATUS_PHASEERR = 0x02
} BOT_CSW_STATUS_Enum;

typedef enum {

  BOT_STALL_OUT   = 0,
  BOT_STALL_IN    = 1,
  BOT_STALL_BOTH  = 2,
  BOT_STALL_BYDIR = 3,
  BOT_STALL_NONE  = 4,
} BOT_STALL_Enum;

typedef enum
{
  BOT_DIR_OUT  = 0x0,
  BOT_DIR_IN   = 0x1,
  BOT_DIR_NONE = 0x2
} BOT_Dir_Enum;

typedef struct
{
  u32 uBlockCount;
  u32 uBlockSize;
  u32 uAddressMode;
} BOT_MediaSize_Typedef;

typedef u32 (*pInit)(u32 uId, BOT_MediaSize_Typedef *pSizeInfo);
typedef u32 (*pGetStatusFun)(u32 uId, BOT_MediaSize_Typedef *pSizeInfo);
typedef u32 (*pReadFun)(u32 uId, u8 **pBuffer, u32 uAddress, u32 uLength);
typedef u32 (*pWriteFun)(u32 uId, u8 * pBuffer, u32 uAddress, u32 uLength);
typedef void (*pUnmountFun)(u32 uId);

typedef struct
{
  u32 uId;
  BOT_MediaSize_Typedef Size;
  pInit Init;
  pReadFun Read;
  pWriteFun Write;
  pGetStatusFun GetStatus;
  pUnmountFun Unmount;
  u8 *pSBC_InquiryData;
  u8 *pSBC_SenseData;
} BOT_Media_TypeDef;

/* Exported constants --------------------------------------------------------------------------------------*/
#define ACC_LED_ON(...)
#define ACC_LED_OFF(...)

#if (ACC_LED == 1)
#undef ACC_LED_ON
#undef ACC_LED_OFF
#define ACC_LED_ON()            (HT32F_DVB_LEDOn(ACC_LED_ID))
#define ACC_LED_OFF()           (HT32F_DVB_LEDOff(ACC_LED_ID))
#endif

#define BOT_ADDR_MODE_BYTE      (0)
#define BOT_ADDR_MODE_BLOCK     (1)

/* Exported functions --------------------------------------------------------------------------------------*/
void BOT_Init(void);
void BOT_Reset(void);
uc8 *BOT_GetMaxLUNAddress(void);
void BOT_OUTProcess(void);
void BOT_INProcess(void);
u32 BOT_CheckCBWParameter(BOT_Dir_Enum DeviceDirection, u32 uDeviceLength);
void BOT_WriteINData(u8 *pBuffer, u32 uLen, BOT_State_Enum status);
void BOT_ReadOUTData(u8 *pBuffer, u32 uLen);
void BOT_SendCSW(BOT_CSW_STATUS_Enum status);
void BOT_ErrorHandler(BOT_STALL_Enum StallEPT, BOT_CSW_STATUS_Enum CSWstatus);


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __USB_BULK_ONLY_TRANSPORT_H ----------------------------------------------------------------------*/
