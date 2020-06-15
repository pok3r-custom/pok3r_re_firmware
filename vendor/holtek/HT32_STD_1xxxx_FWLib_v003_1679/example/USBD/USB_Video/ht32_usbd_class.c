/*********************************************************************************************************//**
 * @file    USBD/USB_Video/ht32_usbd_class.c
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

/** @addtogroup USB_Video
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define PTC_INCREASE_VALUE    ((DESC_CLOCK_FREQUENCY / 100) * (DESC_FRAME_INTERVAL / 100))
#define SCR_INCREASE_VALUE    (DESC_CLOCK_FREQUENCY / 1000)
#define SOF_FRAME_END         (DESC_FRAME_INTERVAL  / 10000)
#define PAYLOAD_HEADER_LEN    12

/* Private function prototypes -----------------------------------------------------------------------------*/
static void USBDClass_MainRoutine(u32 uPara);

static void USBDClass_EPT4InProcess(void);

//static void USBDClass_Reset(u32 uPara);
static void USBDClass_StartOfFrame(u32 uPara);

//static void USBDClass_Standard_GetDescriptor(USBDCore_Device_TypeDef *pDev);
static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev);
//static void USBDClass_Standard_GetInterface(USBDCore_Device_TypeDef *pDev);
static void USBDClass_Request(USBDCore_Device_TypeDef *pDev);
static void USBDClass_SET_CUR(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_CUR(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_MIN(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_MAX(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_RES(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_LEN(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_INFO(USBDCore_Device_TypeDef *pDev);
static void USBDClass_GET_DEF(USBDCore_Device_TypeDef *pDev);

static void USBDClass_Endpoint1(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint2(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn);
static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint5(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint6(USBD_EPTn_Enum EPTn);
//static void USBDClass_Endpoint7(USBD_EPTn_Enum EPTn);

/* Global variables ----------------------------------------------------------------------------------------*/
USBDClass_UVC_Control USBDClassUVCControl;

/* Private variables ---------------------------------------------------------------------------------------*/
__ALIGN4 vu8 gInputDataBuffer[_EP4LEN] = {0xFF};
static vu8 TransferTemp;

static u8   UVC_bDevicePowerMode   = 0xA0;          /* Power Mode                                           */
static vu8  UVC_bRequestErrorCode  = NO_ERROR;      /* Error Code                                           */

static u32 UVC_wBrightnessCur     = 0x0037;         /* ProcessingUnit Brightness Current                    */
static u32 UVC_wBrightnessDef     = 0xFFDF;         /* ProcessingUnit Brightness Default                    */
static u32 UVC_wBrightnessMin     = 0x0082;         /* ProcessingUnit Brightness Minimum                    */
static u32 UVC_wBrightnessMax     = 0x007e;         /* ProcessingUnit Brightness Maximum                    */
static u32 UVC_wBrightnessRes     = 0x0001;         /* ProcessingUnit Brightness Resolution                 */

static vu8  UVC_wBrightnessCur_temp     = 0x00;     /* SelectorUnit temp selected input pin                 */

static vu8 SET_INTERFACE_Flag = 0;
static vu8 EP4_Flag = 0;
static vu32 EP4_Return_Len;
static vu32 SOF_Count = 0;
static vu32 Img_Tranfer_Count = 0;
static vu8 Frame_End = 0;
static vu8 IMAGE_Y = 0 ,IMAGE_U = 0x80 ,IMAGE_V = 0x80;

__ALIGN4 static UVC_VIDEO_PROBE_AND_COMMIT_CONTROL UVC_vsVideoProbe =
{
  0x0000,                 // bitfield indicating what fields shall be kept fixed
  0x01,                   // Video format index from a format descriptor
  0x01,                   // Video frame index from a frame descriptor
  DESC_FRAME_INTERVAL,    // Frame interval in 100 ns units
  0x0000,                 // Key frame rate in key-frame per video-frame units
  0x0000,                 // PFrame rate i PFrame/key frame units
  0x0000,                 // Compression quality control in abstract units (0..10000)
  0x0000,                 // Window size for average bit rate control
  0x0000,                 // int. VS interface latency in ms from capture to presentation
  DESC_FRAME_BUF_SIZE,    // maximum video frame or codec specific segment size in bytes
  (u32)_EP4LEN,           // max. bytes the device can transmit/receive in single payload transfer
#if (UVC_VERSION ==  0x0110)
  0x00000000,             // device clock frequency in Hz for specified format
  0x00,                   // bitfield control
  0x00,                   // preferred payload format version for specified bFormatIndex
  0x00,                   // minimum payload format version for specified bFormatIndex
  0x00                    // maximum payload format version for specified bFormatIndex
#endif
};

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

  pClass->CallBack_StartOfFrame.func = USBDClass_StartOfFrame;
  pClass->CallBack_StartOfFrame.uPara = (u32)NULL;


  //pClass->CallBack_ClassGetDescriptor = USBDClass_Standard_GetDescriptor;
  pClass->CallBack_ClassSetInterface = USBDClass_Standard_SetInterface;
  //pClass->CallBack_ClassGetInterface = USBDClass_Standard_GetInterface;

  pClass->CallBack_ClassRequest = USBDClass_Request;
  pClass->CallBack_EPTn[1] = USBDClass_Endpoint1;
  //pClass->CallBack_EPTn[2] = USBDClass_Endpoint2;
  //pClass->CallBack_EPTn[3] = USBDClass_Endpoint3;
  pClass->CallBack_EPTn[4] = USBDClass_Endpoint4;
  //pClass->CallBack_EPTn[5] = USBDClass_Endpoint5;
  //pClass->CallBack_EPTn[6] = USBDClass_Endpoint6;
  //pClass->CallBack_EPTn[7] = USBDClass_Endpoint7;

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
  //USBDClass_EPT4InProcess();
  u32 i;
  if (Frame_End)
  {
    for (i = 0; i < (_EP4LEN-12) / 4; i++)
    {
      gInputDataBuffer[12 + i * 4] = IMAGE_Y;
      gInputDataBuffer[12 + i * 4 + 1] = IMAGE_U;
      gInputDataBuffer[12 + i * 4 + 2] = IMAGE_Y;
      gInputDataBuffer[12 + i * 4 + 3] = IMAGE_V;
    }
    Frame_End = 0;
    IMAGE_Y += 0x10;
    if (IMAGE_Y >= 0xF0)
    {
      IMAGE_Y = 0x10;
      IMAGE_U += 0x10;
      if (IMAGE_U >= 0xF0)
      {
        IMAGE_U = 0x80;
        IMAGE_V += 0x10;
        if (IMAGE_V >= 0xF0)
          IMAGE_V = 0x80;
      }
    }
  }

  return;
}

/*********************************************************************************************************//**
  * @brief  USB Class Endpoint 4 In Process for application.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_EPT4InProcess(void)
{
  u32 temp, temp_transfer;
  u32 TempCount;
  u32 *ptr;

  if (EP4_Flag)
  {
    //temp = (gInputDataBuffer[9] << 24) | (gInputDataBuffer[8] << 16) | (gInputDataBuffer[7] << 8) | gInputDataBuffer[6];
    ptr = (u32 *)(&gInputDataBuffer[6]);
    temp = *ptr;
    temp += SCR_INCREASE_VALUE;
    gInputDataBuffer[6] = temp;
    gInputDataBuffer[7] = temp >> 8;
    gInputDataBuffer[8] = temp >> 16;
    gInputDataBuffer[9] = temp >> 24;

    if (SOF_Count < (SOF_FRAME_END + 1))
    {
      if (Img_Tranfer_Count < DESC_FRAME_BUF_SIZE)
      {
        temp_transfer = (DESC_FRAME_BUF_SIZE-Img_Tranfer_Count);
        if (temp_transfer > _EP4LEN)
        {
          EP4_Return_Len = USBDCore_EPTWriteINData(USBD_EPT4, (u32 *)gInputDataBuffer,_EP4LEN);
          TempCount = (EP4_Return_Len-PAYLOAD_HEADER_LEN);
          Img_Tranfer_Count += TempCount;
        }
        else
        {
          switch (gInputDataBuffer[1])
          {
            case 0x8C:
              gInputDataBuffer[1] = 0x8E;
              EP4_Return_Len = USBDCore_EPTWriteINData(USBD_EPT4, (u32 *)gInputDataBuffer, temp_transfer + PAYLOAD_HEADER_LEN);
              gInputDataBuffer[1] = 0x8C;
              break;
            case 0x8D:
              gInputDataBuffer[1] = 0x8F;
              EP4_Return_Len = USBDCore_EPTWriteINData(USBD_EPT4, (u32 *)gInputDataBuffer, temp_transfer + PAYLOAD_HEADER_LEN);
              gInputDataBuffer[1] = 0x8D;
              break;
            default:
              gInputDataBuffer[1] = 0x8C;
              break;
          }
          TempCount = (EP4_Return_Len-PAYLOAD_HEADER_LEN);
          Img_Tranfer_Count += TempCount;
        }
      }
      else
      {
        USBDCore_EPTWriteINData(USBD_EPT4, (u32 *)gInputDataBuffer, PAYLOAD_HEADER_LEN);
      }
    }
    else
    {
      Frame_End = 1;
      Img_Tranfer_Count = 0;
      switch (gInputDataBuffer[1])
      {
        case 0x8C:
          gInputDataBuffer[1] = 0x8D;
          break;
        case 0x8D:
          gInputDataBuffer[1] = 0x8C;
          break;
        default:
          gInputDataBuffer[1] = 0x8C;
          break;
      }
      USBDCore_EPTWriteINData(USBD_EPT4, (u32 *)gInputDataBuffer, PAYLOAD_HEADER_LEN);
    }
    EP4_Flag = 0;
  }
  else
  {
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
#endif

/*********************************************************************************************************//**
  * @brief  USB Class Start of Frame.
  * @param  uPara: Parameter for Class Start of Frame.
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_StartOfFrame(u32 uPara)
{
  u16 temp;
  u32 temp_long;
  u32 *ptr;

  if (SET_INTERFACE_Flag)
    SOF_Count++;

  temp = (gInputDataBuffer[11] << 8 );
  temp |= gInputDataBuffer[10];
  temp++;
  temp &= 0x07FF;
  gInputDataBuffer[10] = temp;
  gInputDataBuffer[11] = temp >> 8;

  if (SOF_Count > (SOF_FRAME_END + 1))
  {
    SOF_Count = 0;
  }
  else if (SOF_Count == SOF_FRAME_END)
  {

    //temp_long = (gInputDataBuffer[5] << 24) | (gInputDataBuffer[4] << 16) | (gInputDataBuffer[3] << 8) | gInputDataBuffer[2];
    ptr = (u32 *)(&(gInputDataBuffer[2]));
    temp_long = *ptr;
    temp_long += PTC_INCREASE_VALUE;
    gInputDataBuffer[2] = temp_long;
    gInputDataBuffer[3] = temp_long >> 8;
    gInputDataBuffer[4] = temp_long >> 16;
    gInputDataBuffer[5] = temp_long >> 24;
  }
  API_USB_CLR_SOF_INT();
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Request(USBDCore_Device_TypeDef *pDev)
{
  u8 USBCmd = *((u8 *)(&(pDev->Request.bRequest)));
  u16 len = *((u16 *)(&(pDev->Request.wLength)));

  if (len == 0)
  {
    return;
  }
  switch (USBCmd)
  {
    case CLASS_REQ_01_SET_CUR:
      USBDClass_SET_CUR(pDev);
      break;
    case CLASS_REQ_81_GET_CUR:
      USBDClass_GET_CUR(pDev);
      break;
    case CLASS_REQ_82_GET_MIN:
      USBDClass_GET_MIN(pDev);
      break;
    case CLASS_REQ_83_GET_MAX:
      USBDClass_GET_MAX(pDev);
      break;
    case CLASS_REQ_84_GET_RES:
      USBDClass_GET_RES(pDev);
      break;
    case CLASS_REQ_85_GET_LEN:
      USBDClass_GET_LEN(pDev);
      break;
    case CLASS_REQ_86_GET_INFO:
      USBDClass_GET_INFO(pDev);
      break;
    case CLASS_REQ_87_GET_DEF:
      USBDClass_GET_DEF(pDev);
      break;

    // others not support
    default:
      break;
  }
  return;
}

/*********************************************************************************************************//**
  * @brief  USB Device Class Standard Request - SET_INTERFACE.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_Standard_SetInterface(USBDCore_Device_TypeDef *pDev)
{
  pDev->Transfer.sByteLength = 0;
  pDev->Transfer.Action= USB_ACTION_DATAIN;
}

#if 0
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
  * @brief  Set_Brightness_Control.
  * @param  value: Parameter for Class Reset.
  * @retval None
  ***********************************************************************************************************/
static void Set_Brightness_Control(u32 value)
{
  if ((UVC_wBrightnessCur_temp >= UVC_wBrightnessMin) && (UVC_wBrightnessCur_temp <= UVC_wBrightnessMax))
  {
    UVC_wBrightnessCur = UVC_wBrightnessCur_temp;
    UVC_bRequestErrorCode = NO_ERROR;
  }
  else
    UVC_bRequestErrorCode = OUT_OF_RANGE;
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
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:
          switch (USBValueH)                    //switch request control
          {
            case VC_VIDEO_POWER_MODE_CONTROL:   //Set Power Mode Control
              pDev->Transfer.pData = (uc8*)&UVC_bDevicePowerMode;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case IT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case OT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UVC_wBrightnessCur_temp;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAOUT;

              pDev->Transfer.CallBack_OUT.func = Set_Brightness_Control;
              pDev->Transfer.CallBack_OUT.uPara = 0;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {               // select the  selector control
        case VS_PROBE_CONTROL :
        case VS_COMMIT_CONTROL:
          pDev->Transfer.pData = (uc8*)&UVC_vsVideoProbe;
          pDev->Transfer.sByteLength = sizeof(UVC_VIDEO_PROBE_AND_COMMIT_CONTROL);
          pDev->Transfer.Action = USB_ACTION_DATAOUT;

          UVC_bRequestErrorCode = NO_ERROR;
          break;
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
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
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:
          switch (USBValueH)                    //switch request control
          {
            case VC_VIDEO_POWER_MODE_CONTROL:   //Set Power Mode Control
              pDev->Transfer.pData = (uc8*)&UVC_bDevicePowerMode;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case IT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case OT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UVC_wBrightnessCur;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {               // select the  selector control
        case VS_PROBE_CONTROL :
        case VS_COMMIT_CONTROL:
          UVC_vsVideoProbe.wKeyFrameRate = 0;
          UVC_vsVideoProbe.wPFrameRate = 0;
          UVC_vsVideoProbe.wCompQuality = 0;
          UVC_vsVideoProbe.wCompWindowSize = 0;
          UVC_vsVideoProbe.dwMaxPayloadTransferSize = _EP4LEN;//0x01F4;//0x0C00;
          pDev->Transfer.pData = (uc8*)&UVC_vsVideoProbe;
          pDev->Transfer.sByteLength = sizeof(UVC_VIDEO_PROBE_AND_COMMIT_CONTROL);
          pDev->Transfer.Action = USB_ACTION_DATAIN;

          UVC_bRequestErrorCode = NO_ERROR;
          break;
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
      break;
  }
}


/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GET MIN Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_MIN(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));
  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case IT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case OT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UVC_wBrightnessMin;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {               // select the  selector control
        case VS_PROBE_CONTROL:
          UVC_vsVideoProbe.wKeyFrameRate = 0;
          UVC_vsVideoProbe.wPFrameRate = 0;
          UVC_vsVideoProbe.wCompQuality = 0;
          UVC_vsVideoProbe.wCompWindowSize = 0;
          pDev->Transfer.pData = (uc8*)&UVC_vsVideoProbe;
          pDev->Transfer.sByteLength = pDev->Request.wLength;
          pDev->Transfer.Action = USB_ACTION_DATAIN;

          UVC_bRequestErrorCode = NO_ERROR;
          break;
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
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
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case IT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case OT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UVC_wBrightnessMax;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {               // select the  selector control
        case VS_PROBE_CONTROL:
          UVC_vsVideoProbe.wKeyFrameRate = 0;
          UVC_vsVideoProbe.wPFrameRate = 0;
          UVC_vsVideoProbe.wCompQuality = 0;
          UVC_vsVideoProbe.wCompWindowSize = 0;
          pDev->Transfer.pData = (uc8*)&UVC_vsVideoProbe;
          pDev->Transfer.sByteLength = pDev->Request.wLength;
          pDev->Transfer.Action = USB_ACTION_DATAIN;

          UVC_bRequestErrorCode = NO_ERROR;
          break;
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
      break;
  }
}
/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GET RES Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_RES(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));
  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case IT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case OT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UVC_wBrightnessRes; //must be 1
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {               // select the  selector control
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
      break;
  }
}
/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GET LEN Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_LEN(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));
  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              UVC_bRequestErrorCode = INVALID_REQUEST;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {               // select the  selector control
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
      break;
  }
}
/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GET INFO Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_INFO(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));
  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case CONTROL_ID:
          switch (USBValueH)                    //switch request control
          {
            case VC_VIDEO_POWER_MODE_CONTROL:   //Set Power Mode Control
              TransferTemp = (SUPPORTS_GET | SUPPORTS_SET);
              pDev->Transfer.pData = (uc8*)&TransferTemp;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            case VC_REQUEST_ERROR_CODE_CONTROL:
              TransferTemp = (SUPPORTS_GET);
              pDev->Transfer.pData = (uc8*)&TransferTemp;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case IT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case OT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              TransferTemp = (SUPPORTS_GET | SUPPORTS_SET);
              pDev->Transfer.pData = (uc8*)&TransferTemp;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
      break;
  }
}
/*********************************************************************************************************//**
  * @brief  USB Device Class Request - GET DEF Request.
  * @param  pDev: pointer of USB Device
  * @retval None
  ***********************************************************************************************************/
static void USBDClass_GET_DEF(USBDCore_Device_TypeDef *pDev)
{
  u16 USBIndex = *((u16 *)(&(pDev->Request.wIndex)));
  u8 USBValueH = *((u8 *)(&(pDev->Request.wValueH)));
  switch ((USBIndex & 0x00FF))                  //switch interface
  {
    case VC_INTERFACE_NUM:                      //VideoControl Interface
      switch ((USBIndex & 0xFF00) >> 8)         //switch ID
      {
        case IT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case OT_ID:
          switch (USBValueH)                    //switch request control
          {
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        case PU_ID:
          switch (USBValueH)                    //switch request control
          {
            case PU_BRIGHTNESS_CONTROL:
              pDev->Transfer.pData = (uc8*)&UVC_wBrightnessDef;
              pDev->Transfer.sByteLength = pDev->Request.wLength;
              pDev->Transfer.Action = USB_ACTION_DATAIN;

              UVC_bRequestErrorCode = NO_ERROR;
              break;
            default:
              UVC_bRequestErrorCode = INVALID_CONTROL;
              break;
          }
          break;
        default:
          UVC_bRequestErrorCode = INVALID_UNIT;
          break;
      }
      break;
    case VS_INTERFACE_NUM:  //VideoStreaming Interface
      switch (USBValueH)
      {
        default:
          UVC_bRequestErrorCode = INVALID_CONTROL;
          break;
      }
      break;

    // others not support
    default:
      UVC_bRequestErrorCode = UNKNOWN;
      break;
  }
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
/*static void USBDClass_Endpoint3(USBD_EPTn_Enum EPTn)
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
static void USBDClass_Endpoint4(USBD_EPTn_Enum EPTn)
{
  EP4_Flag = 1;
  SET_INTERFACE_Flag = 1;
  USBDClass_EPT4InProcess();
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
