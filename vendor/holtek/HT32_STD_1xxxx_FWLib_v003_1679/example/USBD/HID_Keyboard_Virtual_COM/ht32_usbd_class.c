/*********************************************************************************************************//**
 * @file    USBD/HID_Keyboard_Virtual_COM/ht32_usbd_class.c
 * @version $Rev:: 1325         $
 * @date    $Date:: 2018-07-15 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup HID_Keyboard_Virtual_COM
  * @{
  */


/* Private types -------------------------------------------------------------------------------------------*/
typedef __PACKED_H struct
{
  u8 modifier;
  u8 reserved;
  u8 keycode[6];
} __PACKED_F KeyboardReport_TypeDef;

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

#define HID_LED_1_MASK      (0x1)
#define HID_LED_2_MASK      (0x2)
#define HID_LED_3_MASK      (0x4)
#define HID_LED_1_BIT       (0)
#define HID_LED_2_BIT       (1)
#define HID_LED_3_BIT       (2)

#define CLASS_REQ_20_SET_LINE_CODING        (0x20)
#define CLASS_REQ_21_GET_LINE_CODING        (0x21)
#define CLASS_REQ_22_SET_CONTROL_LINE_STATE (0x22)

#define CDC_INF_NUM                         (11)
#define CDC_EPT_IN_LENGTH                   (_EP2LEN)
#define CDC_EPT                             (USBD_EPT2)

/* Private function prototypes -----------------------------------------------------------------------------*/
static void USBDClass_MainRoutine(u32 uPara);
static void USBDClass_CDC_ZLPProcess(void);
static void USBDClass_ReportProcess(void);
static void USBDClass_EPT1INProcess(void);
static void USBDClass_CDC_Rx(void);

//static void USBDClass_Reset(u32 uPara);
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

static void USBDClass_SetLineCoding(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GetLineCoding(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SetControlLineState(USBDCore_Device_TypeDef *pDev);

static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint5(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint6(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint7(USBD_EPTn_Enum EPTn);

/* Global variables ----------------------------------------------------------------------------------------*/
vu32 gKeyStatus[HID_KEY_COUNT] = {0, 0, 0};

/* Private variables ---------------------------------------------------------------------------------------*/

/* USB HID Report Descriptor                                                                                */
__ALIGN4 static uc8 USB_HID_ReportDesc[] = {
    0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
    0x09, 0x06,                    // USAGE (Keyboard)
    0xa1, 0x01,                    // COLLECTION (Application)

    0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
    0x19, 0xe0,                    //   USAGE_MINIMUM (Keyboard LeftControl)
    0x29, 0xe7,                    //   USAGE_MAXIMUM (Keyboard Right GUI)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0x01,                    //   LOGICAL_MAXIMUM (1)
    0x75, 0x01,                    //   REPORT_SIZE (1)
    0x95, 0x08,                    //   REPORT_COUNT (8)
    0x81, 0x02,                    //   INPUT (Data, Var, Abs)

    0x95, 0x01,                    //   REPORT_COUNT (1)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x81, 0x03,                    //   INPUT (Cnst, Var, Abs)

    0x95, 0x03,                    //   REPORT_COUNT (3)
    0x75, 0x01,                    //   REPORT_SIZE (1)
    0x05, 0x08,                    //   USAGE_PAGE (LEDs)
    0x19, 0x01,                    //   USAGE_MINIMUM (Num Lock)
    0x29, 0x03,                    //   USAGE_MAXIMUM (Kana)
    0x91, 0x02,                    //   OUTPUT (Data, Var, Abs)

    0x95, 0x01,                    //   REPORT_COUNT (1)
    0x75, 0x05,                    //   REPORT_SIZE (5)
    0x91, 0x03,                    //   OUTPUT (Cnst, Var, Abs)

    0x95, 0x06,                    //   REPORT_COUNT (6)
    0x75, 0x08,                    //   REPORT_SIZE (8)
    0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
    0x25, 0x65,                    //   LOGICAL_MAXIMUM (101)
    0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
    0x19, 0x00,                    //   USAGE_MINIMUM (Reserved (no event indicated))
    0x29, 0x65,                    //   USAGE_MAXIMUM (Keyboard Application)
    0x81, 0x00,                    //   INPUT (Data, Ary, Abs)

    0xc0                           // END_COLLECTION
};

static u32 gOutputReportBuffer;
__ALIGN4 static u8 gInputReportBuffer[64];
static vu32 gIsSetOutputReport = FALSE;
static vu32 gIsEP1INEmpty = TRUE;
__ALIGN4 static KeyboardReport_TypeDef gKeyboardReport;
static u32 gIsKeySent = FALSE;

static u32 uIsTerminalOpened = 0; // 2: Terminal is opened
static vu32 gIsCDCEPOUT = 0;
static vu32 gCDCEPOUTLen = 0;
static vu32 gIsCDCEPINEmpty = TRUE;
static u32 gIsZLP_Require = FALSE;
static USBDClass_VCP_LINE_CODING USBDClassVCPLineCoding;

__ALIGN4 static u8 gWelcomMessage[64] = {
  "Holtek HT32 Virtual COM Test\r\n\r\nPress key to test loopback\r\n\r\n"
};
__ALIGN4 static u8 gInputDataBuffer[64];
__ALIGN4 static u8 gOutputDataBuffer[64];
static u32 gIsDataReady = FALSE;

/* Global Function -----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  USB Class initialization.
  * @param  pClass: pointer of USBDCore_Class_TypeDef
  * @retval None
  ***********************************************************************************************************/
void USBDClass_Init(USBDCore_Class_TypeDef *pClass)
{
  s32 i;
  pClass->CallBack_MainRoutine.func = USBDClass_MainRoutine;
  //pClass->CallBack_MainRoutine.uPara = (u32)NULL;

  //pClass->CallBack_Reset.func = USBDClass_Reset;
  //pClass->CallBack_Reset.uPara = (u32)NULL;

  //pClass->CallBack_StartOfFrame.func = USBDClass_StartOfFrame;
  //pClass->CallBack_StartOfFrame.uPara = (u32)NULL;

  pClass->CallBack_ClassGetDescriptor = USBDClass_Standard_GetDescriptor;
  //pClass->CallBack_ClassSetInterface = USBDClass_Standard_SetInterface;
  //pClass->CallBack_ClassGetInterface = USBDClass_Standard_GetInterface;

  pClass->CallBack_ClassRequest = USBDClass_Request;
  pClass->CallBack_EPTn[1] = USBDClass_Endpoint1;
  pClass->CallBack_EPTn[2] = USBDClass_Endpoint2;
  pClass->CallBack_EPTn[3] = USBDClass_Endpoint3;
  pClass->CallBack_EPTn[4] = USBDClass_Endpoint4;
  //pClass->CallBack_EPTn[5] = USBDClass_Endpoint5;
  //pClass->CallBack_EPTn[6] = USBDClass_Endpoint6;
  //pClass->CallBack_EPTn[7] = USBDClass_Endpoint7;

  #ifdef RETARGET_IS_USB
  pClass->CallBack_EPTn[RETARGET_RX_EPT] = SERIAL_USBDClass_RXHandler;
  #endif

  gKeyboardReport.modifier = 0;
  for (i = 5; i >=0; i--)
  {
    gKeyboardReport.keycode[i] = 0;
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class CDC send data.
  * @param  pFrom: Source buffer
  * @param  len: Length for write IN data
  * @retval Total length written by this function
  ***********************************************************************************************************/
s32 USBDClass_CDC_Tx(u32 *pFrom, u32 len)
{
  /* Demo how to send data by Virtual COM IN endpoint                                                       */
  /* !!! For the Bulk endpoint, the data length must be N - 1 or N with ZLP (Zero Length Package).          */
  /* Where N is the max length of endpoint.                                                                 */
  if (gIsCDCEPINEmpty == TRUE)
  {
    gIsCDCEPINEmpty = FALSE;
    USBDCore_EPTWriteINData(CDC_EPT, (u32 *)pFrom, len);
    if (len == CDC_EPT_IN_LENGTH)
    {
      gIsZLP_Require = TRUE; // Data Length = Endpoint maximum Length, need ZLP.
    }
    return len;
  }
  else
  {
    return -1;
  }
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

  /* Demo how to send data after terminal opened                                                            */
  if (uIsTerminalOpened == 2)
  {
    if (USBDClass_CDC_Tx((u32 *)gWelcomMessage, 64) == 64)
    {
      uIsTerminalOpened = 3;
    }
  }

  USBDClass_CDC_ZLPProcess();
  USBDClass_CDC_Rx();

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Report Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_ReportProcess(void)
{
  if (gIsSetOutputReport == TRUE)
  {
    gIsSetOutputReport = FALSE;
    (gOutputReportBuffer & HID_LED_1_MASK) ? HT32F_DVB_LEDOn(HT_LED1) : HT32F_DVB_LEDOff(HT_LED1);
    (gOutputReportBuffer & HID_LED_2_MASK) ? HT32F_DVB_LEDOn(HT_LED2) : HT32F_DVB_LEDOff(HT_LED2);
    (gOutputReportBuffer & HID_LED_3_MASK) ? HT32F_DVB_LEDOn(HT_LED3) : HT32F_DVB_LEDOff(HT_LED3);
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Report Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_CDC_ZLPProcess(void)
{
  u32 *nullptr = 0;
  if (gIsZLP_Require == TRUE && gIsCDCEPINEmpty == TRUE)
  {
    gIsZLP_Require = FALSE;
    gIsCDCEPINEmpty = FALSE;
    USBDCore_EPTWriteINData(USBD_EPT2, (u32 *)nullptr, 0);
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint 1 IN Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_EPT1INProcess(void)
{
  s32 i = 0;

  for (i = 5; i >=0; i--)
  {
    gKeyboardReport.keycode[i] = 0;
  }

  i = 0;
  if (gKeyStatus[HID_KEY_NUMLOCK])
  {
    gKeyStatus[HID_KEY_NUMLOCK] = 0;
    gKeyboardReport.keycode[i++] = 0x53;
  }

  if (gKeyStatus[HID_KEY_CAPSLOCK])
  {
    gKeyStatus[HID_KEY_CAPSLOCK] = 0;
    gKeyboardReport.keycode[i++] = 0x39;
  }

  if (gKeyStatus[HID_KEY_SCROLLLOCK])
  {
    gKeyStatus[HID_KEY_SCROLLLOCK] = 0;
    gKeyboardReport.keycode[i++] = 0x47;
  }

  if (i != 0 && gIsEP1INEmpty == TRUE)
  {
    gIsEP1INEmpty = FALSE;
    USBDCore_EPTWriteINData(USBD_EPT1, (u32 *)&gKeyboardReport, sizeof(gKeyboardReport));
    gIsKeySent = TRUE;
  }
  else if (i == 0 && gIsKeySent == TRUE && gIsEP1INEmpty == TRUE)
  {
    gIsEP1INEmpty = FALSE;
    USBDCore_EPTWriteINData(USBD_EPT1, (u32 *)&gKeyboardReport, sizeof(gKeyboardReport));
    gIsKeySent = FALSE;
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint 1 IN Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_CDC_Rx(void)
{
  s32 i;

  /* Demo how to check Virtual COM OUT data is ready or not                                                 */
  /* gIsCDCEPOUT: 1 - Data is ready. 0 - no Data.                                                           */
  /* gOutputDataBuffer[64]: Data buffer                                                                     */
  if (gIsCDCEPOUT == 1)
  {
    // !!! Add your data process here

    for (i = gCDCEPOUTLen - 1; i >= 0; i--)
    {
      gInputDataBuffer[i] = gOutputDataBuffer[i];
    }
    gIsCDCEPOUT = 0;
    gIsDataReady = TRUE;
  }

  /* Loop Back data to the Tx                                                                               */
  #if 1
  if (gIsDataReady == TRUE)
  {
    if (USBDClass_CDC_Tx((u32 *)gInputDataBuffer, gCDCEPOUTLen) == gCDCEPOUTLen)
    {
      gIsDataReady = FALSE;
    }
  }
  #endif

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
  u32 inf = pDev->Request.wIndex;

#ifdef RETARGET_IS_USB
  SERIAL_USBDClass_Request(pDev);
#endif

  if (inf == CDC_INF_NUM)
  {
    u8 USBCmd2 = *((u8 *)(&(pDev->Request.bRequest)));
    u16 len = *((u16 *)(&(pDev->Request.wLength)));
    switch (USBCmd2)
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
  }

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
      __DBG_USBPrintf("%06ld GET RPOT\t[%02d][%02d]\r\n", __DBG_USBCount, pDev->Request.wValueH, pDev->Request.wLength);
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
  if (uIsTerminalOpened == 1)
  {
    uIsTerminalOpened = 2;
  }

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
  if (pDev->Request.wValueL & 0x1)
  {
    uIsTerminalOpened = 1;
  }
  else
  {
    uIsTerminalOpened = 0;
  }

  pDev->Transfer.pData = 0;
  pDev->Transfer.sByteLength = 0;
  pDev->Transfer.Action = USB_ACTION_DATAOUT;

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
      pDev->Transfer.pData = (uc8 *)&(gOutputReportBuffer); // Buffer at least 4 bytes
      pDev->Transfer.sByteLength = len;
      pDev->Transfer.Action= USB_ACTION_DATAOUT;
      pDev->Transfer.CallBack_OUT.func = USBDClass_SetReportCallBack;
      pDev->Transfer.CallBack_OUT.uPara = len;
      break;
    }
    case HID_RPOT_TYPE_03_FEATURE:
    {
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
  gIsCDCEPINEmpty = TRUE;
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
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint handler
  * @param  EPTn: USB Endpoint number
  *         @arg USBD_EPT0 ~ USBD_EPT7
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn)
{
  /* Read Receive data.                                                                                     */
  gCDCEPOUTLen = USBDCore_EPTReadOUTData(EPTn, (u32 *)gOutputDataBuffer, 64);
  gIsCDCEPOUT = 1;

  __DBG_USBPrintf("%06ld CDC OUT OUT\t[%02d]", ++__DBG_USBCount, (int)gCDCEPOUTLen);
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
