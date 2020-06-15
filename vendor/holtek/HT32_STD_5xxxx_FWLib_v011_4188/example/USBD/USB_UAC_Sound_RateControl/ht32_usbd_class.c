/*********************************************************************************************************//**
 * @file    USBD/USB_UAC_Sound_RateControl/ht32_usbd_class.c
 * @version $Rev:: 3331         $
 * @date    $Date:: 2018-12-25 #$
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
#include "ht32_board.h"
#include "ht32_usbd_core.h"
#include "ht32_usbd_class.h"
#include "main.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USB_UAC_Sound_RateControl
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
__ALIGN4 vu8 UAC_bMuteControl      = 0x00;           /* Power Mode                                          */
__ALIGN4 static u16 UAC_sVolumeControl   = 0x0000;
__ALIGN4 static u8 UAC_bBassControl      = 0x0000;

/* Private function prototypes -----------------------------------------------------------------------------*/
static void USBDClass_MainRoutine(u32 uPara);

//static void USBDClass_Reset(u32 uPara);
//static void USBDClass_StartOfFrame(u32 uPara);

static void USBDClass_Standard_GetDescriptor(USBDCore_Device_TypeDef *pDev);
static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_GetInterface(USBDCore_Device_TypeDef *pDev);

static void USBDClass_Request(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SET_CUR(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_CUR(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SET_MIN(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_MIN(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SET_MAX(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_MAX(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SET_RES(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_RES(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SET_MEM(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_MEM(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_STAT(USBDCore_Device_TypeDef *pDev);

//static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint5(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint6(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint7(USBD_EPTn_Enum EPTn);

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

  pClass->CallBack_ClassGetDescriptor = USBDClass_Standard_GetDescriptor;
  pClass->CallBack_ClassSetInterface = USBDClass_Standard_SetInterface;
  //pClass->CallBack_ClassGetInterface = USBDClass_Standard_GetInterface;

  pClass->CallBack_ClassRequest = USBDClass_Request;
  //pClass->CallBack_EPTn[1] = USBDClass_Endpoint1;
  //pClass->CallBack_EPTn[2] = USBDClass_Endpoint2;
  //pClass->CallBack_EPTn[3] = USBDClass_Endpoint3;
  pClass->CallBack_EPTn[4] = USBDClass_Endpoint4;
  //pClass->CallBack_EPTn[5] = USBDClass_Endpoint5;
  //pClass->CallBack_EPTn[6] = USBDClass_Endpoint6;
  //pClass->CallBack_EPTn[7] = USBDClass_Endpoint7;

  #ifdef RETARGET_IS_USB
  pClass->CallBack_EPTn[RETARGET_RX_EPT] = SERIAL_USBDClass_RXHandler;
  #endif

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
  u8 USBCmd = *((u8 *)(&(pDev->Request.bRequest)));
  u16 len = *((u16 *)(&(pDev->Request.wLength)));

#ifdef RETARGET_IS_USB
  SERIAL_USBDClass_Request(pDev);
#endif

  if (len == 0)
  {
    return;
  }
  switch (USBCmd)
  {
    case CLASS_REQ_00_CODE_UNDEFINED:
      break;
    case CLASS_REQ_01_SET_CUR:
      USBDClass_SET_CUR(pDev);
      break;
    case CLASS_REQ_81_GET_CUR:
      USBDClass_GET_CUR(pDev);
      break;
    case CLASS_REQ_02_SET_MIN:
      USBDClass_SET_MIN(pDev);
      break;
    case CLASS_REQ_82_GET_MIN:
      USBDClass_GET_MIN(pDev);
      break;
    case CLASS_REQ_03_SET_MAX:
      USBDClass_SET_MAX(pDev);
      break;
    case CLASS_REQ_83_GET_MAX:
      USBDClass_GET_MAX(pDev);
      break;
    case CLASS_REQ_04_SET_RES:
      USBDClass_SET_RES(pDev);
      break;
    case CLASS_REQ_84_GET_RES:
      USBDClass_GET_RES(pDev);
      break;
    case CLASS_REQ_85_SET_MEM:
      USBDClass_SET_MEM(pDev);
      break;
    case CLASS_REQ_85_GET_MEM:
      USBDClass_GET_MEM(pDev);
      break;
    case CLASS_REQ_FF_GET_STAT:
    USBDClass_GET_STAT(pDev);
      break;

    // others not support
    default:
      break;
  }
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Standard Request - GET_DESCRIPTOR
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Standard_GetDescriptor(USBDCore_Device_TypeDef *pDev)
{
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Standard Request - SET_INTERFACE
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev)
{
  pDev->Transfer.sByteLength = 0;
  pDev->Transfer.Action= USB_ACTION_DATAIN;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Set CUR Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SET_CUR(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case MUTE_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bMuteControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Get CUR Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_CUR(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case MUTE_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bMuteControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Set MIN Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SET_MIN(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Get MIN Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_MIN(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Set MAX Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SET_MAX(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Get MAX Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_MAX(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Set RES Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SET_RES(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Get RES Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_RES(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));

  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case  AC_INTERFACE_NUM:
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:

          break;
        case IT_ID:

          break;
        case FU_ID:
          switch (USBValueH)
          {
            case VOLUME_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_sVolumeControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
            case BASS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UAC_bBassControl;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;
              break;
          }
          break;
        case OT_ID:

          break;
        default:

          break;
      }
      break;
    case  AS_INTERFACE_NUM:
      break;
  }
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Set MEM Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SET_MEM(USBDCore_Device_TypeDef *pDev)
{
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Get MEM Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_MEM(USBDCore_Device_TypeDef *pDev)
{
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Get STAT Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_STAT(USBDCore_Device_TypeDef *pDev)
{
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
/*
static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn)
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
static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn)
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
__ALIGN4 u32 Buf[48];
static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn)
{
  /* Read Receive data.                                                                                     */
  u32 len = USBDCore_EPTReadOUTData(EPTn, (u32 *)Buf, _EP4LEN);
  if (len != _EP4LEN)
  {
    printf("\r\nLen Error\r\n");
  }
  else
  {
    I2S_BufferWrite(Buf);
  }

  return;
}


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
