/*********************************************************************************************************//**
 * @file    CKCU/HSI_AutoTrim_By_USB/ht32_usbd_class.c
 * @version $Rev:: 2638         $
 * @date    $Date:: 2018-02-28 #$
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

/** @addtogroup CKCU_Examples CKCU
  * @{
  */

/** @addtogroup HSI_AutoTrim_By_USB
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define CLASS_DESC_OFFSET                   (18)

#define CLASS_REQ_01_GET_RPOT               (u16)(0x1 << 8)
#define CLASS_REQ_02_GET_IDLE               (u16)(0x2 << 8)
#define CLASS_REQ_03_GET_PTCO               (u16)(0x3 << 8)
#define CLASS_REQ_09_SET_RPOT               (u16)(0x9 << 8)
#define CLASS_REQ_0A_SET_IDLE               (u16)(0xA << 8)
#define CLASS_REQ_0B_SET_PTCO               (u16)(0xB << 8)

#define HID_RPOT_TYPE_01_INPUT              (0x01)
#define HID_RPOT_TYPE_02_OUTPUT             (0x02)
#define HID_RPOT_TYPE_03_FEATURE            (0x03)

/* Private function prototypes -----------------------------------------------------------------------------*/
static void USBDClass_MainRoutine(u32 uPara);
static void USBDClass_ReportProcess(void);
static void USBDClass_EPT1INProcess(void);
static void USBDClass_EPT2OUTProcess(void);

static void USBDClass_Reset(u32 uPara);
//static void USBDClass_StartOfFrame(u32 uPara);

static void USBDClass_Standard_GetDescriptor(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_GetInterface(USBDCore_Device_TypeDef *pDev);
static void USBDClass_Request(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GetReport(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GetIdle(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GetProtocol(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SetReport(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SetIdle(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SetProtocol(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SetReportCallBack(u32 para);
static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint5(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint6(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint7(USBD_EPTn_Enum EPTn);

/* Private variables ---------------------------------------------------------------------------------------*/
/* USB HID Report Descriptor                                                                                */
__ALIGN4 static uc8 USB_HID_ReportDesc[] = {
    0x06, 0x00, 0xff,              // USAGE_PAGE (Vendor Defined Page 1)
    0x09, 0x01,                    // USAGE (Vendor Usage 1)
    0xa1, 0x01,                    // COLLECTION (Application)

    0x09, 0x02,                    //   USAGE (Vendor Usage 2)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x26, 0xff, 0x00,              //   LOGICAL_MAXIMUM (255)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x95, 0x40,                    //   REPORT_COUNT (64)
    0x81, 0x02,                    //   INPUT (Data, Var, Abs)

    0x09, 0x03,                    //   USAGE (Vendor Usage 3)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x26, 0xff, 0x00,              //   LOGICAL_MAXIMUM (255)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x95, 0x40,                    //   REPORT_COUNT (64)
    0x91, 0x02,                    //   OUTPUT (Data, Var, Abs)

    0x09, 0x04,                    //   USAGE (Vendor Usage 4)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x26, 0xff, 0x00,              //   LOGICAL_MAXIMUM (255)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x95, 0x40,                    //   REPORT_COUNT (64)
    0xb1, 0x02,                    //   FEATURE (Data, Var, Abs)

    0xc0                           // END_COLLECTION
};

__ALIGN4 static u8 gInputReportBuffer[64];
__ALIGN4 static u8 gOutputReportBuffer[64];
__ALIGN4 static u8 gFeatureReportBuffer[64];
static vu32 gIsSetOutputReport = 0;
static vu32 gOutputReportLen = 0;
static vu32 gEP2Len = 0;

static vu32 gIsEP2OUTReady = FALSE;
static vu32 gIsEP1INEmpty = TRUE;
static u32 gIsReadyToLoopBack = FALSE;

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

  pClass->CallBack_Reset.func = USBDClass_Reset;
  //pClass->CallBack_Reset.uPara = (u32)NULL;

  //pClass->CallBack_StartOfFrame.func = USBDClass_StartOfFrame;
  //pClass->CallBack_StartOfFrame.uPara = (u32)NULL;

  pClass->CallBack_ClassGetDescriptor = USBDClass_Standard_GetDescriptor;
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
  USBDClass_ReportProcess();
  USBDClass_EPT1INProcess();
  USBDClass_EPT2OUTProcess();

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Report Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_ReportProcess(void)
{
  s32 i;
  if (gIsSetOutputReport == TRUE)
  {
    for (i = gOutputReportLen - 1; i >= 0; i--)
    {
      gInputReportBuffer[i] = gOutputReportBuffer[i];
    }
    gIsSetOutputReport = FALSE;
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint 1 IN Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_EPT1INProcess(void)
{
  s32 i;
  u32 len;
  if (gIsReadyToLoopBack == TRUE)
  {
    if (gIsEP1INEmpty == TRUE)
    {
      gIsEP1INEmpty = gIsReadyToLoopBack = FALSE;
      for (i = gEP2Len - 1; i >= 0; i--)
      {
        gInputReportBuffer[i] = gOutputReportBuffer[i];
      }
      len = USBDCore_EPTGetBufferLen(USBD_EPT1);
      USBDCore_EPTWriteINData(USBD_EPT1, (u32 *)gInputReportBuffer, len);
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint 2 OUT Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_EPT2OUTProcess(void)
{
  if (gIsEP2OUTReady == TRUE)
  {
    gEP2Len = USBDCore_EPTReadOUTData(USBD_EPT2, (u32 *)gOutputReportBuffer, 64);

    __DBG_USBPrintf("%06ld EP2OUT\t[%02d]\r\n", ++__DBG_USBCount, (int)gEP2Len);
    __DBG_USBDump((uc8 *)gOutputReportBuffer, gEP2Len);

    gIsEP2OUTReady = FALSE;
    gIsReadyToLoopBack = TRUE;
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Reset.
  * @param  uPara: Parameter for Class Reset.
  * @retval None
  ***********************************************************************************************************/

static void USBDClass_Reset(u32 uPara)
{
  static u32 isFirstReset = TRUE;
  /* Just for once.                                                                                         */
  if(isFirstReset)
  {
    /*
      1. HSI Trimming is enabled.
      2. Enable Auto Trimming Controller.
      3. Auto Trimming Manual by usb's SOF.
    */
    u32 uTemp = HT_CKCU->HSICR;
    isFirstReset = FALSE;
    uTemp &= 0xFFFFFFEF;
    uTemp |= 0x23;
    HT_CKCU->HSICR = uTemp;
  }
}

#if 0
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
    /* | 01_Get Report        | 80_Device-to-Host       | 20_Class Request    | 1_Interface | 01A1h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_01_GET_RPOT | REQ_DIR_01_D2H | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld GET RPOT\t[%02d][%02d]\r\n", __DBG_USBCount, pDev->Request.wValueH, pDev->Request.wLength );
      USBDClass_GetReport(pDev);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* | 02_Get Idle          | 80_Device-to-Host       | 20_Class Request    | 1_Interface | 02A1h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_02_GET_IDLE | REQ_DIR_01_D2H | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld GET IDLE\r\n", __DBG_USBCount);
      USBDClass_GetIdle(pDev);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* | 03_Get Protocol      | 80_Device-to-Host       | 20_Class Request    | 1_Interface | 03A1h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_03_GET_PTCO | REQ_DIR_01_D2H | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld GET PTCO\r\n", __DBG_USBCount);
      USBDClass_GetProtocol(pDev);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* | 09_Set Report        | 00_Host-to-Device       | 20_Class Request    | 1_Interface | 0921h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_09_SET_RPOT | REQ_DIR_00_H2D | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld SET RPOT\t[%02d][%02d]\r\n", __DBG_USBCount, pDev->Request.wValueH, pDev->Request.wLength);
      USBDClass_SetReport(pDev);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* | 0A_Set Idle          | 00_Host-to-Device       | 20_Class Request    | 1_Interface | 0A21h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_0A_SET_IDLE | REQ_DIR_00_H2D | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld SET IDLE\r\n", __DBG_USBCount);
      USBDClass_SetIdle(pDev);
      break;
    }
    /*------------------------------------------------------------------------------------------------------*/
    /* | 0B_Set Protocol      | 00_Host-to-Device       | 20_Class Request    | 1_Interface | 0B21h         */
    /*------------------------------------------------------------------------------------------------------*/
    case (CLASS_REQ_0B_SET_PTCO | REQ_DIR_00_H2D | REQ_TYPE_01_CLS | REQ_REC_01_INF):
    {
      __DBG_USBPrintf("%06ld SET PTCO\r\n", __DBG_USBCount);
      USBDClass_SetProtocol(pDev);
      break;
    }
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
  u32 type = pDev->Request.wValueH;

  switch (type)
  {
    case DESC_TYPE_21_HID:
    {
      pDev->Transfer.pData = (uc8 *)((pDev->Desc.pConfnDesc) + CLASS_DESC_OFFSET);
      pDev->Transfer.sByteLength = DESC_LEN_HID;
      pDev->Transfer.Action = USB_ACTION_DATAIN;
      break;
    }
    case DESC_TYPE_22_RPOT:
    {
      pDev->Transfer.pData = (uc8 *)(USB_HID_ReportDesc);
      pDev->Transfer.sByteLength = DESC_LEN_RPOT;
      pDev->Transfer.Action = USB_ACTION_DATAIN;
      break;
    }
    case DESC_TYPE_23_PHY:
    {
      break;
    }
  } /* switch (type)                                                                                        */

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
  * @brief  USB Device Class Request - GET_REPORT
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GetReport(USBDCore_Device_TypeDef *pDev)
{
  u32 value = pDev->Request.wValueH;
  u32 len = pDev->Request.wLength;

  switch (value)
  {
    case HID_RPOT_TYPE_01_INPUT:
    {
      pDev->Transfer.pData = (uc8 *)&(gInputReportBuffer);
      pDev->Transfer.sByteLength = len;
      pDev->Transfer.Action= USB_ACTION_DATAIN;
      break;
    }
    case HID_RPOT_TYPE_03_FEATURE:
    {
      pDev->Transfer.pData = (uc8 *)&(gFeatureReportBuffer);
      pDev->Transfer.sByteLength = len;
      pDev->Transfer.Action= USB_ACTION_DATAIN;
      break;
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GET_IDLE
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GetIdle(USBDCore_Device_TypeDef *pDev)
{
  /* Add your own GET_IDLE function here....
     For example....

  u32 uReportID  = pDev->Request.wValueL;
  u32 uInterface = pDev->Request.wIndex;

  pDev->Transfer.pData = (uc8 *)&(__IDLE_DURATION_BUFFER[uReportID]);
  pDev->Transfer.sByteLength = 1;
  pDev->Transfer.Action= USB_ACTION_DATAIN;

  */
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GET_PROTOCOL
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GetProtocol(USBDCore_Device_TypeDef *pDev)
{
  /* Add your own GET_PROTOCOL function here....
     For example....

  u32 uInterface = pDev->Request.wIndex;

  pDev->Transfer.pData = (uc8 *)&(__PROTOCOL_BUFFER__);
  pDev->Transfer.sByteLength = 1;
  pDev->Transfer.Action= USB_ACTION_DATAIN;

  */
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - SET_REPORT
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SetReport(USBDCore_Device_TypeDef *pDev)
{
  u32 value = pDev->Request.wValueH;
  u32 len = pDev->Request.wLength;
  switch (value)
  {
    case HID_RPOT_TYPE_02_OUTPUT:
    {
      pDev->Transfer.pData = (uc8 *)&(gOutputReportBuffer);
      pDev->Transfer.sByteLength = len;
      pDev->Transfer.Action= USB_ACTION_DATAOUT;
      pDev->Transfer.CallBack_OUT.func = USBDClass_SetReportCallBack;
      pDev->Transfer.CallBack_OUT.uPara = len;
      break;
    }
    case HID_RPOT_TYPE_03_FEATURE:
    {
      pDev->Transfer.pData = (uc8 *)&(gFeatureReportBuffer);
      pDev->Transfer.sByteLength = len;
      pDev->Transfer.Action= USB_ACTION_DATAOUT;
      break;
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - SET_IDLE
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SetIdle(USBDCore_Device_TypeDef *pDev)
{
  /* Add your own SET_IDLE function here....
     For example....

  u32 uReportID     = pDev->Request.wValueL;
  u32 uIdleDuration = pDev->Request.wValueH;
  u32 uInterface    = pDev->Request.wIndex;

  __IDLE_DURATION_BUFFER[uReportID] = uIdleDuration;

  */
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request - SET_PROTOCOL
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SetProtocol(USBDCore_Device_TypeDef *pDev)
{
  /* Add your own SET_PROTOCOL function here....
     For example....

  u32 uInterface = pDev->Request.wIndex;
  u32 uProtocol  = pDev->Request.wValueL;

  __PROTOCOL_BUFFER = uProtocol;

  */
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device SET_REPORT call Back function
  * @param  uPara: Parameter for SET_REPORT call back function (SET_REPORT wLength)
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_SetReportCallBack(u32 uPara)
{
  gIsSetOutputReport = TRUE;
  gOutputReportLen = uPara;

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
  gIsEP1INEmpty = TRUE;

  __DBG_USBPrintf("%06ld EP1IN\t[%02d]\r\n", ++__DBG_USBCount, (int)USBDCore_EPTGetBufferLen(EPTn));
  __DBG_USBDump((uc8 *)gInputReportBuffer, USBDCore_EPTGetBufferLen(EPTn));

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
  gIsEP2OUTReady = TRUE;

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
