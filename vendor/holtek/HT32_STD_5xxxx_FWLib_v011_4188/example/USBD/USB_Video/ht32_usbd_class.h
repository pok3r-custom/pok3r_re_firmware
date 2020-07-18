/*********************************************************************************************************//**
 * @file    USBD/USB_Video/ht32_usbd_class.h
 * @version $Rev:: 675          $
 * @date    $Date:: 2016-05-25 #$
 * @brief   The header file of USB Device Class.
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
#ifndef __HT32_USBD_CLASS_H
#define __HT32_USBD_CLASS_H

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32_usbd_core.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USB_Video
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/

/* For ht32_usbd_descriptor.c                                                                               */
#define COMMUNICATION_INF_CLASS           (0x0E)
#define COMMUNICATION_INF_SUBCLASS        (0x01)
#define COMMUNICATION_INF_PTCO            (0x00)

#define DATA_INF_CLASS                    DESC_CLASS_0A_CDC_DATA
#define DATA_INF_SUBCLASS                 CDC_SUBCLASS_NULL
#define DATA_INF_PTCO                     CDC_PROTOCOL_NULL

#define IAD_LEN_INF                       (0x08)
#define UVC_LEN_INF                       (0x0D)
#define IT_LEN                            (0x12)
#define OT_UNIT_LEN                       (0x09)
#define PU_LEN                            (0x0B)
#define UVC_LEN_EPT                       (0x05)
#define VS_HEADER_LEN                     (0x0E)
#define VS_FORMAT_LEN                     (0x1B)
#define VS_FRAME_LEN                      (0x1E)
#define VS_STILL_ILEN                     (0x0A)
#define VS_COLOR_FORMAT_LEN               (0x06)

#define VC_TotalLength                    (u16)(UVC_LEN_INF + IT_LEN + OT_UNIT_LEN + PU_LEN)
#define VS_TotalLength                    (u16)(VS_HEADER_LEN + VS_FORMAT_LEN + VS_FRAME_LEN + VS_STILL_ILEN \
                                            + VS_COLOR_FORMAT_LEN)

/* Video related definition                                                                                 */
#define CONTROL_ID  (0x00)
/*#define CT_ID       (0x01)
#define IT_ID       (0x02)
#define OT_ID       (0x03)
#define SU_ID       (0x04)
#define PU_ID       (0x05)*/
#define IT_ID       (0x01)
#define OT_ID       (0x05)
#define PU_ID       (0x03)

#define VC_INTERFACE_NUM  (0x00)
#define VS_INTERFACE_NUM  (0x01)

/* Video interface class code                                                                               */
#define CC_VIDEO    (0x0E)

/* Video interface subclass codes                                                                           */
#define SC_UNDEFINED                  (0x00)
#define SC_VIDEOCONTROL               (0x01)
#define SC_VIDEOSTREAMING             (0x02)
#define SC_VIDEO_INTERFACE_COLLECTION (0x03)

/* Video interface protocol codes                                                                           */
#define PC_PROTOCOL_UNDEFINED         (0x00)

/* Video class-specific descriptor types                                                                    */
#define CS_UNDEFINED        (0x20)
#define CS_DEVICE           (0x21)
#define CS_CONFIGURATION    (0x22)
#define CS_SRTING           (0x23)
#define CS_INTERFACE        (0x24)
#define CS_ENDPOINT         (0x25)

/* Video Class-specific Request Codes                                                                       */
#define CLASS_REQ_00_RC_UNDEFINED   (0x00)
#define CLASS_REQ_01_SET_CUR        (0x01)
#define CLASS_REQ_81_GET_CUR        (0x81)
#define CLASS_REQ_82_GET_MIN        (0x82)
#define CLASS_REQ_83_GET_MAX        (0x83)
#define CLASS_REQ_84_GET_RES        (0x84)
#define CLASS_REQ_85_GET_LEN        (0x85)
#define CLASS_REQ_86_GET_INFO       (0x86)
#define CLASS_REQ_87_GET_DEF        (0x87)

/* VideoControl Interface Control Selectors                                                                 */
#define VC_CONTROL_UNDEFINED          (0x00)
#define VC_VIDEO_POWER_MODE_CONTROL   (0x01)
#define VC_REQUEST_ERROR_CODE_CONTROL (0x02)
#define Reserved                      (0x03)

/* Selector Unit Control Selectors                                                                          */
#define SU_CONTROL_UNDEFINED          (0x00)
#define SU_INPUT_SELECT_CONTROL       (0x01)

/* Processing Unit Control Selectors                                                                        */
#define PU_CONTROL_UNDEFINED          (0x00)
#define PU_BRIGHTNESS_CONTROL         (0x02)

/*                                                                                                          */
#define VS_CONTROL_UNDEFINED          (0x00)
#define VS_PROBE_CONTROL              (0x01)
#define VS_COMMIT_CONTROL             (0x02)

/* Request Error Code Control                                                                               */
#define NO_ERROR          (0x00)
#define NOT_READY         (0x01)
#define WRONG_STATE       (0x02)
#define POWER             (0x03)
#define OUT_OF_RANGE      (0x04)
#define INVALID_UNIT      (0x05)
#define INVALID_CONTROL   (0x06)
#define INVALID_REQUEST   (0x07)
#define UNKNOWN           (0xFF)

#define SUPPORTS_GET          (0x01)
#define SUPPORTS_SET          (0x02)
#define STATE_DISABLED        (0x04)
#define AUTOUPDATE_CONTROL    (0x08)
#define ASYNCHRONOUS_CONTROL  (0x10)


#define DESC_IMAGE_WIDTH        320
#define DESC_IMAGE_HEIGHT       240
#define FRAME_FPS               (((_EP4LEN-12) * 1000) / (DESC_IMAGE_WIDTH * DESC_IMAGE_HEIGHT * 2))//488000

#define DESC_IMAGE_MINBITRATE   DESC_IMAGE_WIDTH * DESC_IMAGE_HEIGHT * 2
#define DESC_IMAGE_MAXBITRATE   DESC_IMAGE_WIDTH * DESC_IMAGE_HEIGHT * 2 * 30
#define DESC_FRAME_BUF_SIZE     DESC_IMAGE_WIDTH * DESC_IMAGE_HEIGHT * 2

#define DESC_FRAME_INTERVAL     (10000000 / FRAME_FPS)

#define DESC_CLOCK_FREQUENCY    15000000UL

/* Exported types ------------------------------------------------------------------------------------------*/
typedef __PACKED_H struct __UVC_VIDEO_PROBE_ANDCOMMIT_CONTROL {
  u16 bmHint;                             // bitfield indicating what fields shall be kept fixed
  u8  bFormatIndex;                       // Video format index from a format descriptor
  u8  bFrameIndex;                        // Video frame index from a frame descriptor
  u32 dwFrameInterval;                    // Frame interval in 100 ns units
  u16 wKeyFrameRate;                      // Key frame rate in key-frame per video-frame units
  u16 wPFrameRate;                        // PFrame rate i PFrame/key frame units
  u16 wCompQuality;                       // Compression quality control in abstract units (0..10000)
  u16 wCompWindowSize;                    // Window size for average bit rate control
  u16 wDelay;                             // int. VS interface latency in ms from capture to presentation
  u32 dwMaxVideoFrameSize;                // maximum video frame or codec specific segment size in bytes
  u32 dwMaxPayloadTransferSize;           // max. bytes the device can transmit/receive in single payload transfer
#if (UVC_VERSION == 0x0110)
  u32 dwClockFrequency;                   // device clock frequency in Hz for specified format
  u8  bmFraminInfo;                       // bitfield control
  u8  bPreferedVersion;                   // preferred payload format version for specified bFormatIndex
  u8  bMinVersion;                        // minimum payload format version for specified bFormatIndex
  u8  bMaxVersion;                        // maximum payload format version for specified bFormatIndex
#endif
} __PACKED_F UVC_VIDEO_PROBE_AND_COMMIT_CONTROL;


typedef struct _UVC_REQUEST
{
  u8  bSet_CUR;
  u8  bGet_CUR;
  u16  bGet_MIN;
  u16  bGet_MAX;
  u8  bGet_RES;
  u8  bGet_LEN;
  u8  bGet_INFO;
  u16   bGet_DEF;
}UVC_Request;

typedef struct _UVC_CONTROL
{
  UVC_Request SELECTOR_CONTROL;
  UVC_Request BRIGHTNESS_CONTROL;
  UVC_Request POWER_MODE_CONTROL;
  UVC_Request REQUEST_ERROR_CODE_CONTROL;
  UVC_Request VIDEO_PROBE_CONTROL;
  UVC_Request VIDEO_COMMIT_CONTROL;
}USBDClass_UVC_Control;

/* Exported functions --------------------------------------------------------------------------------------*/
void USBDClass_Init(USBDCore_Class_TypeDef *pClass);


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __HT32_USBD_CLASS_H ------------------------------------------------------------------------------*/
