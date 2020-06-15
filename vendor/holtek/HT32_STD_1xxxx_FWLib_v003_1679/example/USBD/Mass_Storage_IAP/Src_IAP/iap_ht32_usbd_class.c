/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage_IAP/Src_IAP/iap_ht32_usbd_class.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
 * @brief   The USB Device Class.
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
#include "iap_ht32_usbd_class.h"
#include "iap_usb_bulk_only_transport.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USBD_Mass_Storage_IAP USBD Mass Storage IAP
  * @{
  */

/** @addtogroup Mass_Storage_IAP IAP
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define CLASS_REQ_FE_GET_MAX_LUN            (u16)(0xFE  << 8)
#define CLASS_REQ_FF_BOMSR                  (u16)(0xFF  << 8)

/* Private function prototypes -----------------------------------------------------------------------------*/
static void USBDClass_MainRoutine(u32 uPara);
//static void USBDClass_Reset(u32 uPara);
//static void USBDClass_StartOfFrame(u32 uPara);

//static void USBDClass_Standard_GetDescriptor(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_GetInterface(USBDCore_Device_TypeDef *pDev);

static void USBDClass_Request(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GetMaxLUN(USBDCore_Device_TypeDef *pDev);
static void USBDClass_BulkOnlyMassStorageReset(USBDCore_Device_TypeDef *pDev);

static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint5(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint6(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint7(USBD_EPTn_Enum EPTn);

/* Private variables ---------------------------------------------------------------------------------------*/
static u32 gIsOUTReady = FALSE;
static u32 gIsINEmpty = TRUE;

/* Global Function -----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  USB Class initialization.
  * @param  pClass: pointer of USBDCore_Class_TypeDef
  * @retval None
  ***********************************************************************************************************/
void USBDClass_Init(USBDCore_Class_TypeDef *pClass)
{
  pClass->CallBack_MainRoutine.func = USBDClass_MainRoutine;
  //pClass->CallBack_MainRoutine.uPara = (u32)NULL;

  //pClass->CallBack_Reset.func = USBDClass_Reset;
  //pClass->CallBack_Reset.uPara = (u32)NULL;

  //pClass->CallBack_StartOfFrame.func = USBDClass_StartOfFrame;
  //pClass->CallBack_StartOfFrame.uPara = (u32)NULL;

  //pClass->CallBack_ClassGetDescriptor = USBDClass_Standard_GetDescriptor;
  //pClass->CallBack_ClassSetInterface = USBDClass_Standard_SetInterface;
  //pClass->CallBack_ClassGetInterface = USBDClass_Standard_GetInterface;

  pClass->CallBack_ClassRequest = USBDClass_Request;
  pClass->CallBack_EPTn[1] = USBDClass_Endpoint1;
  pClass->CallBack_EPTn[2] = USBDClass_Endpoint2;
  //pClass->CallBack_EPTn[3] = USBDClass_Endpoint3;
  //pClass->CallBack_EPTn[4] = USBDClass_Endpoint4;
  //pClass->CallBack_EPTn[5] = USBDClass_Endpoint5;
  //pClass->CallBack_EPTn[6] = USBDClass_Endpoint6;
  //pClass->CallBack_EPTn[7] = USBDClass_Endpoint7;

  #ifdef RETARGET_IS_USB
  pClass->CallBack_EPTn[RETARGET_RX_EPT] = SERIAL_USBDClass_RXHandler;
  #endif

  BOT_Init();

  return;
}

/* Private functions ---------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  USB Class main routine.
  * @param  uPara: Parameter for Class main routine
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_MainRoutine(u32 uPara)
{
  if (gIsOUTReady == TRUE)
  {
    gIsOUTReady = FALSE;
    BOT_OUTProcess();
  }

  if (gIsINEmpty == TRUE)
  {
    gIsINEmpty = FALSE;
    BOT_INProcess();
  }

  return;
}

#if 0
/*********************************************************************************************************//**
  * @brief  USB Class Reset.
  * @param  uPara: Parameter for Class Reset.
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Reset(u32 uPara)
{

}
*/

/*********************************************************************************************************//**
  * @brief  USB Class Start of Frame.
  * @param  uPara: Parameter for Class Start of Frame.
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_StartOfFrame(u32 uPara)
{

}
*/
#endif

/*********************************************************************************************************//**
  * @brief  USB Device Class Request
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Request(USBDCore_Device_TypeDef *pDev)
{
  u16 uUSBCmd = *((u16 *)(&(pDev->Request)));

#ifdef RETARGET_IS_USB
  SERIAL_USBDClass_Request(pDev);
#endif

  switch (uUSBCmd)
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* | bRequest             | Data transfer direction | Type                | Recipient   | Data          */
    /*------------------------------------------------------------------------------------------------------*/

    /*------------------------------------------------------------------------------------------------------*/
    /* | FE_Get Max LUN       | 80_Device-to-Host       | 20_Class Request    | 1_Interface | FEA1h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_FE_GET_MAX_LUN | REQ_DIR_01_D2H | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld GET MAX LUN\t[%02d]\r\n", __DBG_USBCount, pDev->Request.wIndex);
      USBDClass_GetMaxLUN(pDev);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* | FF_BOMSR             | 00_Host-to-Device       | 20_Class Request    | 1_Interface | FF21h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_FF_BOMSR | REQ_DIR_00_H2D | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld BOMSR\t[%02d]\r\n", __DBG_USBCount, pDev->Request.wIndex);
      USBDClass_BulkOnlyMassStorageReset(pDev);
      break;
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GetMaxLUN
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GetMaxLUN(USBDCore_Device_TypeDef *pDev)
{
  uc8 *puMaxLun;
#if 1
  u32 uCheck = pDev->Request.wValueL + pDev->Request.wValueH + pDev->Request.wIndex;
  if(uCheck == 0 && pDev->Request.wLength == 1)
#else
  if (pDev->Request.wValueL == 0 &&
     pDev->Request.wValueH == 0 &&
     pDev->Request.wIndex == 0 &&
     pDev->Request.wLength == 1)
#endif
  {
    puMaxLun = BOT_GetMaxLUNAddress();
    pDev->Transfer.pData = puMaxLun;
    pDev->Transfer.sByteLength = 1;
    pDev->Transfer.Action= USB_ACTION_DATAIN;
  }

  return;
}

#if 0
/*********************************************************************************************************//**
  * @brief  USB Device Class Standard Request - SET_INTERFACE
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev)
{

}
*/

/*********************************************************************************************************//**
  * @brief  USB Device Class Standard Request - GET_INTERFACE
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Standard_GetInterface(USBDCore_Device_TypeDef *pDev)
{

}
*/
#endif

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Bulk-Only Mass Storage Reset
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_BulkOnlyMassStorageReset(USBDCore_Device_TypeDef *pDev)
{
#if 1
  u32 uCheck = pDev->Request.wValueL + pDev->Request.wValueH + pDev->Request.wIndex + pDev->Request.wLength;
  if(uCheck == 0)
#else
  if (pDev->Request.wValueL == 0 &&
     pDev->Request.wValueH == 0 &&
     pDev->Request.wIndex == 0 &&
     pDev->Request.wLength == 0)
#endif
  {

    BOT_Reset();

    USBDCore_EPTReset(BOT_IN_EPT);
    USBDCore_EPTReset(BOT_OUT_EPT);

    pDev->Transfer.Action = USB_ACTION_DATAIN;
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn)
{
  //__DBG_USBPrintf("%06ld EP1IN\r\n", ++__DBG_USBCount);
  gIsINEmpty = TRUE;
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn)
{
  //__DBG_USBPrintf("%06ld EP2OUT\r\n", ++__DBG_USBCount);
  gIsOUTReady = TRUE;
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn)
{
  return;
}
*/

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn)
{
  return;
}
*/

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Endpoint5(USBD_EPTn_Enum EPTn)
{
  return;
}
*/

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Endpoint6(USBD_EPTn_Enum EPTn)
{
  return;
}
*/

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Endpoint7(USBD_EPTn_Enum EPTn)
{
  return;
}
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

/**
  * @}
  */
