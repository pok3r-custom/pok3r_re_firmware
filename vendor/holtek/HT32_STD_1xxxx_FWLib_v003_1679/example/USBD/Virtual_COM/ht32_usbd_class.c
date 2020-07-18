/*********************************************************************************************************//**
 * @file    USBD/Virtual_COM/ht32_usbd_class.c
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
#include "ht32_usbd_class.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup Virtual_COM
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define CLASS_REQ_20_SET_LINE_CODING        (0x20)
#define CLASS_REQ_21_GET_LINE_CODING        (0x21)
#define CLASS_REQ_22_SET_CONTROL_LINE_STATE (0x22)

/* Private variables ---------------------------------------------------------------------------------------*/
__ALIGN4 static u8 gInputDataBuffer[64];
__ALIGN4 static u8 gOutputDataBuffer[64];
static vu32 gIsEP3OUT = 0;
static vu32 gEP3Len = 0;
static USBDClass_VCP_LINE_CODING USBDClassVCPLineCoding;

/* Private function prototypes -----------------------------------------------------------------------------*/
static void USBDClass_MainRoutine(u32 uPara);
static void USBDClass_EPT1INProcess(void);

//static void USBDClass_Reset(u32 uPara);
//static void USBDClass_StartOfFrame(u32 uPara);

//static void USBDClass_Standard_GetDescriptor(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_GetInterface(USBDCore_Device_TypeDef *pDev);

static void USBDClass_Request(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SetLineCoding(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GetLineCoding(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SetControlLineState(USBDCore_Device_TypeDef *pDev);
static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn);
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

  //pClass->CallBack_ClassGetDescriptor = USBDClass_Standard_GetDescriptor
  //pClass->CallBack_ClassSetInterface = USBDClass_Standard_SetInterface;
  //pClass->CallBack_ClassGetInterface = USBDClass_Standard_GetInterface;

  pClass->CallBack_ClassRequest = USBDClass_Request;
  pClass->CallBack_EPTn[1] = USBDClass_Endpoint1;
  pClass->CallBack_EPTn[2] = USBDClass_Endpoint2;
  pClass->CallBack_EPTn[3] = USBDClass_Endpoint3;
  //pClass->CallBack_EPTn[4] = USBDClass_Endpoint4;
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
  USBDClass_EPT1INProcess();
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint 1 IN Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_EPT1INProcess(void)
{
  s32 i;
  if (gIsEP3OUT == 1)
  {
    for (i = gEP3Len - 1; i >= 0; i--)
    {
      gInputDataBuffer[i] = gOutputDataBuffer[i];
    }
    gIsEP3OUT = 0;
    USBDCore_EPTWriteINData(USBD_EPT1, (u32 *)gInputDataBuffer, gEP3Len);
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
  u8 USBCmd = *((u8 *)(&(pDev->Request.bRequest)));
  u16 len = *((u16 *)(&(pDev->Request.wLength)));

#ifdef RETARGET_IS_USB
  SERIAL_USBDClass_Request(pDev);
#endif

  switch (USBCmd)
  {
    case CLASS_REQ_22_SET_CONTROL_LINE_STATE:
    {
      if (len == 0)
      {
        USBDClass_SetControlLineState(pDev);
      }
      break;
    }
    case CLASS_REQ_20_SET_LINE_CODING:
    {
      USBDClass_SetLineCoding(pDev);
      break;
    }
    case CLASS_REQ_21_GET_LINE_CODING:
    {
      USBDClass_GetLineCoding(pDev);
      break;
    }
    // others not support
    default:
    {
      break;
    }
  }
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Set Line Coding
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SetLineCoding(USBDCore_Device_TypeDef *pDev)
{
  pDev->Transfer.pData = (uc8*)&USBDClassVCPLineCoding;
  pDev->Transfer.sByteLength = (sizeof(USBDClassVCPLineCoding) > pDev->Request.wLength) ? (pDev->Request.wLength) : (sizeof(USBDClassVCPLineCoding));
  pDev->Transfer.Action = USB_ACTION_DATAOUT;
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Get Line Coding
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GetLineCoding(USBDCore_Device_TypeDef *pDev)
{
  pDev->Transfer.pData = (uc8*)&USBDClassVCPLineCoding;
  pDev->Transfer.sByteLength = (sizeof(USBDClassVCPLineCoding) > pDev->Request.wLength) ? (pDev->Request.wLength) : (sizeof(USBDClassVCPLineCoding));
  pDev->Transfer.Action = USB_ACTION_DATAIN;
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - Set Control Line State
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SetControlLineState(USBDCore_Device_TypeDef *pDev)
{
  pDev->Transfer.pData = 0;
  pDev->Transfer.sByteLength = 0;
  pDev->Transfer.Action = USB_ACTION_DATAOUT;

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
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn)
{
  /* Read Receive data.                                                                                     */
  gEP3Len = USBDCore_EPTReadOUTData(EPTn, (u32 *)gOutputDataBuffer, 64);
  gIsEP3OUT = 1;

  __DBG_USBPrintf("%06ld EP3OUT\t[%02d]", ++__DBG_USBCount, (int)gEP3Len);
  __DBG_USBDump((uc8 *)gOutputDataBuffer, gEP3Len);

  return;
}

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
