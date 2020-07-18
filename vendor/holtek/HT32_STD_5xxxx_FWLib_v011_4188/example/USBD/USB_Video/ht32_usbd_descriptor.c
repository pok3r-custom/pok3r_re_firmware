/*********************************************************************************************************//**
 * @file    USBD/USB_Video/ht32_usbd_descriptor.c
 * @version $Rev:: 2395         $
 * @date    $Date:: 2017-12-21 #$
 * @brief   The USB Descriptor.
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_usbd_core.h"
#include "ht32_usbd_class.h"
#include "ht32_usbd_descriptor.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USB_Video
  * @{
  */


/*----------------------------------------------------------------------------------------------------------*/
/* USB Device descriptor setting                                                                            */
/*----------------------------------------------------------------------------------------------------------*/
// <h> USB Device descriptor setting
//   <o0> USB Specification Release number (bcdUSB)
//      <0x0200=> USB 2.0
//      <0x0110=> USB 1.1
//      <0x0100=> USB 1.0
//   <o1> USB Class code (assigned by the USB-IF)
//      <0x00=> Use class information in the Interface Descriptors (0x00)
//      <0x02=> Communications and CDC Control (CDC, 0x02)
//      <0xDC=> Diagnostic Device (0xDC)
//      <0xEF=> Miscellaneous (0xEF)
//      <0xFF=> Vendor Specific (0xFF)
//   <o2> USB Subclass code (assigned by the USB-IF) <0x0-0xFF:1>
//   <o3> USB Protocol code (assigned by the USB-IF) <0x0-0xFF:1>
//   <o4> USB Vendor ID <0x0-0xFFFF:1>
//   <o5> USB Product ID <0x0-0xFFFF:1>
//   <o6> USB Device Version <0x0-0xFFFF:1>
//   <o7.0> USB String descriptor - Manufacturer
//   <o8.0> USB String descriptor - Product
//   <o9.0> USB String descriptor - Device serial number
//   <o10> USB Number of possible configurations <0-255:1>
#define DESC_BCDUSB               (0x0110)
#define DESC_BDEVCLASS            (0xEF)
#define DESC_BDEVSUBCLASS         (0x02)
#define DESC_BDEVPROTOCOL         (0x01)
#define DESC_IDVENDOR             (0x04D9)
#define DESC_IDPRODUCT            (0x8008)
#define DESC_BCDDEVICE            (0x0100)
#define DESC_IMANUFACTURE         (1)
#define DESC_IPRODUCT             (1)
#define DESC_ISERIALNUM           (1)
#define DESC_INUMCONFN            (1)
// </h>

/*----------------------------------------------------------------------------------------------------------*/
/* USB Device Descriptor definition. DO NOT MODIFY.                                                         */
/*----------------------------------------------------------------------------------------------------------*/
#if (DESC_BDEVCLASS == 0x0 & DESC_BDEVSUBCLASS != 0x0)
#error "DESC_BDEVSUBCLASS must be reset to zero when the DESC_BDEVCLASS is equal to zero."
#endif
#define DESC_WMAXPACKETSIZE0      (_EP0LEN)
#define DESC_STR_MAN              (1 * DESC_IMANUFACTURE)
#define DESC_STR_PRD              (2 * DESC_IPRODUCT)
#define DESC_STR_SER              (3 * DESC_ISERIALNUM)
#define DESC_NUM_STRING           (1 + 3)

/*----------------------------------------------------------------------------------------------------------*/
/* USB Device descriptor                                                                                    */
/*----------------------------------------------------------------------------------------------------------*/
__ALIGN4 static uc8 guUSB_DeviceDesc[] =
{
  /*--------------------------------------------------------------------------------------------------------*/
  /* Device descriptor                                                                                      */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_DEV,               // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_01_DEV,           // bDescriptorType     1 DEVICE Descriptor Type
  DESC_H2B(DESC_BCDUSB),      // bcdUSB              2 USB Specification Release Number
  DESC_BDEVCLASS,             // bDeviceClass        1 Class code (assigned by the USB-IF)
  DESC_BDEVSUBCLASS,          // bDeviceSubClass     1 Subclass code (assigned by the USB-IF)
  DESC_BDEVPROTOCOL,          // bDeviceProtocol     1 Protocol code (assigned by the USB-IF)
  DESC_WMAXPACKETSIZE0,       // wMaxPacketSize0     1 Maximum packet size for endpoint zero
  DESC_H2B(DESC_IDVENDOR),    // idVendor            2 Vendor ID (assigned by USB-IF)
  DESC_H2B(DESC_IDPRODUCT),   // idProduct           2 Product ID (assigned by manufacturer)
  DESC_H2B(DESC_BCDDEVICE),   // bcdDevice           2 Device release number
  DESC_STR_MAN,               // iManufacturer       1 Index of string descriptor (Manufacturer)
  DESC_STR_PRD,               // iProduct            1 Index of string descriptor (Product)
  DESC_STR_SER,               // iSerialNumber       1 Index of string descriptor (Serial Number)
  DESC_INUMCONFN,             // iNumConfigurations  1 Number of possible configuration
};


/*----------------------------------------------------------------------------------------------------------*/
/* USB Configuration descriptor setting                                                                     */
/*----------------------------------------------------------------------------------------------------------*/
// <h> USB Configuration descriptor setting
//   <o0.0> Self-powered
//     <i> Bit 6 of bmAttributes
//   <o1.0> Remote Wakeup
//     <i> Bit 5 of bmAttributes
//   <o2> USB Device maximum power (mA) < 2-512:2>
#define DESC_BMATTR_SELF_POWER        (0)
#define DESC_BMATTR_REMOTE_WAKEUP     (0)
#define DESC_BMAXPOWER                (250)
// </h>

/*----------------------------------------------------------------------------------------------------------*/
/* USB Configuration Descriptor definition. DO NOT MODIFY.                                                  */
/*----------------------------------------------------------------------------------------------------------*/
#define DESC_W2B(Val)            ((u8)(Val & 0x000000FF)), ((u8)((Val & 0x0000FF00) >> 8)), ((u8)((Val & 0x00FF0000) >> 16)), ((u8)((Val & 0xFF000000) >> 24))
#define DESC_BMATTRIBUTES        (0x80 | (DESC_BMATTR_SELF_POWER << 6) | (DESC_BMATTR_REMOTE_WAKEUP << 5))

/*----------------------------------------------------------------------------------------------------------*/
/* USB Configuration Descriptor                                                                             */
/*----------------------------------------------------------------------------------------------------------*/
__ALIGN4 static uc8 guUSB_ConfnDesc[] =
{
  /*--------------------------------------------------------------------------------------------------------*/
  /* Configuration descriptor                                                                               */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_CONFN,             // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_02_CONFN,         // bDescriptorType     1 CONFIGURATION Descriptor Type
  DESC_H2B(DESC_LEN_CONFN_T), // wTotalLength        2 Total length of data returned for this configuration
  0x02,                       // bNumberInterface    1 Number of interfaces supported by this configuration
  0x01,                       // bConfigurationValue 1 Value to use as an argument to the SetConfiguration()
  0x00,                       // iConfiguration      1 Index of string descriptor describing this configuration
  DESC_BMATTRIBUTES,          // bmAttributes        1 Configuration characteristics
                              //                        D6: Self-powered, D5: RemoteWakeup
  DESC_POWER(DESC_BMAXPOWER), // bMaxPower           1 Maximum power consumption of the USB device (2 mA units)

  /*--------------------------------------------------------------------------------------------------------*/
  /* Interface Association descriptor                                                                       */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  IAD_LEN_INF,                // bLength             1 Size of this descriptor in bytes
  0x0B,                       // bDescriptorType     1 Interface association descriptor
  0x00,                       // bFirstInterface     1 Interface number of the first VideoControl
  0x02,                       // bInterfaceCount     1 Number of contiguous VideoStreaming
  0x0E,                       // bFunctionClass      1 CC_VIDEO
  0x03,                       // bFunctionSubClass   1 SC_VIDEO_INTERFACE_COLLECTION
  0x00,                       // bFunctionPrtocol    1 PC_PROTOCOL_UNDEFINED
  0x02,                       // iFunction           1 Index of a string descriptor

  /*--------------------------------------------------------------------------------------------------------*/
  /* Standard VC Interface descriptor                                                                       */
  /*--------------------------------------------------------------------------------------------------------*/
                                /* Field            Size Description                                        */
                                /*--------------------------------------------------------------------------*/
    DESC_LEN_INF,               // bLengthI            1 Size of this descriptor in bytes (9)
    DESC_TYPE_04_INF,           // bDescriptorTypeI    1 INTERFACE descriptor type (4->Interface)
    0x00,                       // bInterfaceNumber    1 Number of interface (Zero-based 0)
    0x00,                       // bAlternateSetting   1 Value used to select alternate setting (0)
    1,                          // bNumEndpoints       1 Number of endpoints use by this interface (1)
    COMMUNICATION_INF_CLASS,    // bInterfaceClass     1 Class code (2)
    COMMUNICATION_INF_SUBCLASS, // bInterfaceSubClass  1 Subclass code (2:abstract control model)
    COMMUNICATION_INF_PTCO,     // bInterfaceProtocol  1 Protocol code (1:AT commands)
    0x02,                       // iInterface          1 Index of string descriptor (Interface) (0 means no support)

  /*--------------------------------------------------------------------------------------------------------*/
  /* Class-specific VC Interface descriptor  VC_Header                                                      */
  /*--------------------------------------------------------------------------------------------------------*/
                                   /* Field            Size Description                                     */
                                   /*-----------------------------------------------------------------------*/
  UVC_LEN_INF,                     // bLength             1 Size of this descriptor, 12 + n
  CS_INTERFACE,                    // bDescriptorType     1 CS_INTERFACE
  0x01,                            // bDescriptorSubtype  1 VC_HEADER
  DESC_H2B(0x0100),                // bcdUVC              2 Revision of class specification
  DESC_H2B(VC_TotalLength),        // wTotalLength        2 Total size of class-specific VideoControl interface
  DESC_W2B(DESC_CLOCK_FREQUENCY),  // dwClockFrequency    4 the device clock frequency in Hz.(15 MHz)
  0x01,                            // bInCollection       1 Number of VideoStreaming interfaces
  0x01,                            // baInterfaceNr(1)    1 VideoStreaming interface 1

  /*--------------------------------------------------------------------------------------------------------*/
  /* input Terminal descriptor                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  IT_LEN,                     // bLength             1 Size of this descriptor, 8 + n
  CS_INTERFACE,               // bDescriptorType     1 CS_INTERFACE
  0x02,                       // bDescriptorSubtype  1 VC_INPUT_TERMINAL
  IT_ID,                      // bTerminalID         1 ID of this input terminal
  DESC_H2B(0x0201),           // wTerminalType       2 COMPOSITE_CONNECTOR
  0x00,                       // bAssocTerminal      1 ID of Output Terminal, 0 -> no association
  0x00,                       // iTerminal           1 Index of string descriptor
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x00,
  0x03,
  0x00,
  0x00,
  0x00,

  /*--------------------------------------------------------------------------------------------------------*/
  /* Output Terminal descriptor                                                                             */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  OT_UNIT_LEN,                // bLength             1 Size of this descriptor, 9 + n
  CS_INTERFACE,               // bDescriptorType     1 CS_INTERFACE
  0x03,                       // bDescriptorSubtype  1 VC_OUTPUT_TERMINAL
  OT_ID,                      // bTerminalID         1 ID of this input terminal
  DESC_H2B(0x0101),           // wTerminalType       2 TT_STREAMING
  0x00,                       // bAssocTerminal      1 ID of Input Terminal, 0 -> no association
  PU_ID,                      // bSourceID           1 Input pin of this unit is connected
  0x00,                       // iTerminal           1 Index of string descriptor

  /*--------------------------------------------------------------------------------------------------------*/
  /* Processing Unit descriptor                                                                             */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  PU_LEN,                     // bLength             1 Size of this descriptor, 10 + n
  CS_INTERFACE,               // bDescriptorType     1 CS_INTERFACE
  0x05,                       // bDescriptorSubtype  1 VC_PROCESSING_UNIT
  PU_ID,                      // bUnitID             1 ID of this unit
  IT_ID,                      // baSourceID          1 ID of t this unit is connected
  DESC_H2B(0x0190),           // wMaxMultiplier      2 Digital Multiplier control is not support
  0x02,                       // bControlSize        1 Size of bmControls field
  DESC_H2B(0x0001),           // bmControls          2 Mentioned control is supported for the video stream
  0x00,                       // iProcessing         1 Index of a string descriptor

  /*--------------------------------------------------------------------------------------------------------*/
  /* Standard Interrupt Endpoint descriptor                                                                 */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_EPT,               // bLength             1 Size of this descriptor, 7
  DESC_TYPE_05_EPT,           // bDescriptorType     1 ENDPOINT
  0x81,                       // bEndpointAddress    1 IN Endpoint 1
  0x03,                       // bmAttributes        1 Must be set 0x03 Interrupt
  DESC_H2B(0x0008),           // wMaxPacketSize      2 Maximum packet size
  0x09,                       // bInterval           1 Interval for polling endpoint for data transfer

  /*--------------------------------------------------------------------------------------------------------*/
  /* Class-specific Interrupt Endpoint descriptor                                                           */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  UVC_LEN_EPT,                // bLength             1 Size of this descriptor, 5
  CS_ENDPOINT,                // bDescriptorType     1 CS_ENDPOINT
  0x03,                       // bDescriptorSubtype  1 EP_INTERRUPT
  DESC_H2B(0x0008),           // wMaxTransferSize    2 Maximum interrupt structure size

  /*--------------------------------------------------------------------------------------------------------*/
  /* Standard VS Interface descriptor                                                                       */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_INF,               // bLength             1 Size of this descriptor, 9
  DESC_TYPE_04_INF,           // bDescriptorType     1 INTERFACE
  0x01,                       // bInterfaceNumber    1 Number of interface
  0x00,                       // bAlternateSetting   1
  0x00,                       // bNumEndpoint        1 Number of endpoints used by this interface
  CC_VIDEO,                   // bInterfaceClass     1 CC_VIDEO
  SC_VIDEOSTREAMING,          // bInterfaceSubClass  1 SC_VIDEOSTREAMING
  PC_PROTOCOL_UNDEFINED,      // bInterdaceProtocol  1 PC_PROTOCOL_UNDEFINED
  0x00,                       // iInterface          1 Index of a string descriptor

  /*--------------------------------------------------------------------------------------------------------*/
  /* Class-specific VS Header descriptor                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  VS_HEADER_LEN,              // bLength             1 Size of this descriptor, 13 + (p * n)
  CS_INTERFACE,               // bDescriptorType     1 CS_INTERFACE
  0x01,                       // bDescriptorSubtype  1 VS_INPUT_HEADER
  0x01,                       // bNumFormats         1 Number of video payload format descriptors
  DESC_H2B(VS_TotalLength),   // wTotalLength        2 Total number of bytes returned for the class-specific
  0x84,                       // bEndpointAddress    1 IN endpoint 4
  0x00,                       // bmInfo              1
  OT_ID,                      // bTerminalLink       1 Output Terminal of this interface is connected
  0x02,                       // bStillCaptureMethod 1 Method 2 select
  0x01,                       // bTriggerSupport     1 hardware triggering is support
  0x00,                       // bTriggerUsage       1 Initiate still image capture
  0x01,                       // bControlSize        1 Size of each bmaControls(x) field
  0x00,                       // bmaControls(1)      1

  /*--------------------------------------------------------------------------------------------------------*/
  /* Class-specific VS Format descriptor                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  VS_FORMAT_LEN,              // bLength             1
  CS_INTERFACE,               // bDescriptorType     1 CS_INTERFACE
  0x04,                       // bDescriptorSubtype  1 VS_FORMAT_UNCOMPRESSED
  0x01,                       // bFormatIndex        1 Index of this format descriptor
  0x01,                       // bNumFrameDescriptor 1 Number of frame descriptor
  0x59, 0x55, 0x59, 0x32,     // guidFormat          16
  0x00, 0x00, 0x10, 0x00,
  0x80, 0x00, 0x00, 0xAA,
  0x00, 0x38, 0x9B, 0x71,
  0x10,                       // bBitsPerPixel       1 Number of bits per pixel
  0x01,                       // bDefaultFrameIndex  1 Optimum Frame Index
  0x00,                       // bAspectRatioX       1 The X dimension of the picture aspect ratio
  0x00,                       // bAspectRatioY       1 The Y dimension of the picture aspect ratio
  0x00,                       // bmInterlaceFlags    1
  0x00,                       // bCopyProtect        1 0: No restrictions

  /*--------------------------------------------------------------------------------------------------------*/
  /* Class-specific VS Frame descriptor                                                                     */
  /*--------------------------------------------------------------------------------------------------------*/
                                    /* Field            Size Description                                    */
                                    /*----------------------------------------------------------------------*/
  VS_FRAME_LEN,                     // bLength             1
  CS_INTERFACE,                     // bDescriptorType     1 CS_INTERFACE
  0x05,                             // bDescriptorSubtype  1 VS_FRAME_UNCOMPRESSED
  0x01,                             // bFrameIndex         1 Index of this frame descriptor
  0x00,                             // bmCapabilities      1 D0: Still image support set
                                    //                       D1: Fixed frame-rate set
  DESC_H2B(DESC_IMAGE_WIDTH),       // wWidth              2 Width of decoded bitmap frame in pixels
  DESC_H2B(DESC_IMAGE_HEIGHT),      // wHeight             2 Height of decoded bitmap frame in pixels
  DESC_W2B(DESC_IMAGE_MINBITRATE),  // dwMinBitRate        4 Minimum bit rate at the longest frame interval in units of bps
  DESC_W2B(DESC_IMAGE_MAXBITRATE),  // dwMaxBitRate        4 Maximum bit rate at the longest frame interval in units of bps
  DESC_W2B(DESC_FRAME_BUF_SIZE),    // dwMaxVideoFrameBufferSize
  DESC_W2B(DESC_FRAME_INTERVAL),    // dwDefaultFrameInterval
  0x01,                             // bFrameIntervalType
  DESC_W2B(DESC_FRAME_INTERVAL),

  /*0x06,                       //bFrameIntervalType
  0x15, 0x16, 0x05, 0x00,  // 30 Hz
  0x20, 0xA1, 0x07, 0x00,  // 20 Hz
  0x2A, 0x2C, 0x0A, 0x00,  // 15 Hz
  0x40, 0x42, 0x0F, 0x00,  // 10 Hz
  0x80, 0x84, 0x1E, 0x00,  // 5 Hz
  0x80, 0x96, 0x98, 0x00,  // 1 Hz*/


  /*--------------------------------------------------------------------------------------------------------*/
  /* VS_Still_Image descriptor                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  VS_STILL_ILEN,
  CS_INTERFACE,
  0x03,
  0x00,
  0x01,
  DESC_H2B(DESC_IMAGE_WIDTH),
  DESC_H2B(DESC_IMAGE_HEIGHT),
  0x00,

  /*--------------------------------------------------------------------------------------------------------*/
  /* VS_Color_Format descriptor                                                                             */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  VS_COLOR_FORMAT_LEN,
  CS_INTERFACE,
  0x0d,
  0x01,
  0x01,
  0x04,

  /*--------------------------------------------------------------------------------------------------------*/
  /* Standard VS Interface descriptor                                                                       */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_INF,               // bLength             1 Size of this descriptor, 9
  DESC_TYPE_04_INF,           // bDescriptorType     1 INTERFACE
  0x01,                       // bInterfaceNumber    1 Number of interface
  0x01,                       // bAlternateSetting   1 Value used to select alternate setting
  0x01,                       // bNumEndpoints       1 Number of endpoints use by this interface
  CC_VIDEO,                   // bInterfaceClass     1 CC_VIDEO
  SC_VIDEOSTREAMING,          // bInterfaceSubClass  1 SC_VIDEOSTREAMING
  PC_PROTOCOL_UNDEFINED,      // bInterdaceProtocol  1 PC_PROTOCOL_UNDEFINED
  0x00,                       // iInterface          1 Index of a string descriptor

  /*--------------------------------------------------------------------------------------------------------*/
  /* Standard VS Isochronous Video Data Endpoint descriptor                                                 */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_EPT,               // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_05_EPT,           // bDescriptorType     1 ENDPOINT Descriptor Type
  0x84,                       // bEndpointAddress    1 The address of the endpoint
                              //                        Bit 3..0: The endpoint number
                              //                        Bit 6..4: Reserved
                              //                        Bit 7   : Direction (0 = Out/1 = In)
  0x05,                       // bmAttribute         1 Endpoint Attribute
                              //                        Bit 1..0: Transfer type
                              //                                  00 = Control
                              //                                  01 = Isochronous
                              //                                  10 = Bulk
                              //                                  11 = Interrupt
                              //                        All other reserved
  DESC_H2B(_EP4LEN),          // wMaxPacketSize      2 Maximum packet size
  0x01,                       // bInterval           1 Interval for polling endpoint
};

/*----------------------------------------------------------------------------------------------------------*/
/* USB String Descriptor                                                                                    */
/*----------------------------------------------------------------------------------------------------------*/
__ALIGN4 static uc8 guUSB_StringDescLANGID[] =
{
  /*--------------------------------------------------------------------------------------------------------*/
  /* LANGID (Index = 0)                                                                                     */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_STRLEN(1),             // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_03_STR,           // bDescriptorType     1 STRING Descriptor Type
  DESC_H2B(0x0409),           // wLANGID[0]          2 LANGID code zero
};

#if (DESC_IMANUFACTURE == 1)
__ALIGN4 static uc8 guUSB_StringDescManufacture[] =
{
  /*--------------------------------------------------------------------------------------------------------*/
  /* Manufacture (Index = 1)                                                                                */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_STRLEN(6),             // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_03_STR,           // bDescriptorType     1 STRING Descriptor Type
  DESC_CHAR('H'),             // bString             N UNICODE encoded string
  DESC_CHAR('O'),
  DESC_CHAR('L'),
  DESC_CHAR('T'),
  DESC_CHAR('E'),
  DESC_CHAR('K'),
};
#endif

#if (DESC_IPRODUCT == 1)
__ALIGN4 static uc8 guUSB_StringDescProduct[] =
{
  /*--------------------------------------------------------------------------------------------------------*/
  /* Product (Index = 2)                                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_STRLEN(12),            // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_03_STR,           // bDescriptorType     1 STRING Descriptor Type
  DESC_CHAR('U'),             // bString             N UNICODE encoded string
  DESC_CHAR('S'),
  DESC_CHAR('B'),
  DESC_CHAR('-'),
  DESC_CHAR('U'),
  DESC_CHAR('V'),
  DESC_CHAR('C'),
  DESC_CHAR(' '),
  DESC_CHAR('D'),
  DESC_CHAR('E'),
  DESC_CHAR('M'),
  DESC_CHAR('O'),
};
#endif


#if (DESC_ISERIALNUM == 1)
__ALIGN4 static u8 guUSB_StringDescSerialNum[] =
{
  /*--------------------------------------------------------------------------------------------------------*/
  /* Serial Number (Index = 3)                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_STRLEN(9),             // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_03_STR,           // bDescriptorType     1 STRING Descriptor Type
  DESC_CHAR('S'),             // bString             N UNICODE encoded string
  DESC_CHAR('N'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('4'),
};
#endif

uc8 *gpStringDesc[DESC_NUM_STRING] =
{

  guUSB_StringDescLANGID,

  #if (DESC_IMANUFACTURE == 1)
  guUSB_StringDescManufacture,
  #else
  NULL,
  #endif

  #if (DESC_IPRODUCT == 1)
  guUSB_StringDescProduct,
  #else
  NULL,
  #endif

  #if (DESC_ISERIALNUM == 1)
  guUSB_StringDescSerialNum
  #else
  NULL,
  #endif

};

/*********************************************************************************************************//**
  * @brief  USB Descriptor pointer initialization.
  * @param  pDesc: pointer of USBDCore_Desc_TypeDef
  * @retval None
  ***********************************************************************************************************/
void USBDDesc_Init(USBDCore_Desc_TypeDef *pDesc)
{
  pDesc->pDeviceDesc = guUSB_DeviceDesc;
  pDesc->pConfnDesc = guUSB_ConfnDesc;
  pDesc->ppStringDesc = gpStringDesc;
  pDesc->uStringDescNumber = DESC_NUM_STRING;

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
