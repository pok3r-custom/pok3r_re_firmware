/*********************************************************************************************************//**
 * @file    USBD/USB_UAC_Sound/ht32_usbd_descriptor.c
 * @version $Rev:: 2478         $
 * @date    $Date:: 2017-12-30 #$
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

/** @addtogroup USB_UAC_Sound
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
#define DESC_BMATTR_REMOTE_WAKEUP     (1)
#define DESC_BMAXPOWER                (100)
// </h>

/*----------------------------------------------------------------------------------------------------------*/
/* USB Configuration Descriptor definition. DO NOT MODIFY.                                                  */
/*----------------------------------------------------------------------------------------------------------*/
#define DESC_BMATTRIBUTES        (0x80 | (DESC_BMATTR_SELF_POWER << 6) | (DESC_BMATTR_REMOTE_WAKEUP << 5))
#define DESC_TOTAL_LEN           DESC_H2B((DESC_LEN_CONFN_T + RETARGET_DLEN))

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
  DESC_TOTAL_LEN,             // wTotalLength        2 Total length of data returned for this configuration
  0x02 + RETARGET_INF,        // bNumberInterface    1 Number of interfaces supported by this configuration
  0x01,                       // bConfigurationValue 1 Value to use as an argument to the SetConfiguration()
  0x00,                       // iConfiguration      1 Index of string descriptor describing this configuration
  DESC_BMATTRIBUTES,          // bmAttributes        1 Configuration characteristics
                              //                        D6: Self-powered, D5: RemoteWakeup
  DESC_POWER(DESC_BMAXPOWER), // bMaxPower           1 Maximum power consumption of the USB device (2 mA units)

  /*--------------------------------------------------------------------------------------------------------*/
  /* IAD to associate the two UAC interfaces                                                                */
  /*--------------------------------------------------------------------------------------------------------*/
  8,                          // bLength             1 Size of this descriptor in bytes
  11,                         // bDescriptorType     1 Descriptor Type
  0,                          // bFirstInterface     1
  2,                          // bInterfaceCount     1
  1,                          // bFunctionClass      1
  1,                          // bFunctionSubClass   1
  0,                          // bFunctionProtocol   1
  0x00,                       // iFunction           1 Index of string descriptor describing this function.

  /*--------------------------------------------------------------------------------------------------------*/
  /* Interface descriptor                                                                                   */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_INF,               // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_04_INF,           // bDescriptorType     1 INTERFACE Descriptor Type
  0x00,                       // bInterfaceNumber    1 Number of this interface (Zero-based 0)
  0x00,                       // bAlternateSetting   1 Value used to select this alternate setting
  0,                          // bNumEndpoints       1 Number of endpoints used by this interface
  DESC_CLASS_01_AUDIO,        // bInterfaceClass     1 Class code (assigned by USB-IF)
  UAC_SUBCLASS_01_AUDIOCTRL,  // bInterfaceSubClass  1 Subclass code (assigned by USB-IF)
  UAC_PROTOCOL_00_UNDEFINED,  // bInterfaceProtocol  1 Protocol code (assigned by USB)
  0x00,                       // iInterface          1 Index of string descriptor describing this interface

  /*--------------------------------------------------------------------------------------------------------*/
  /* Class-specific AC Interface Descriptor                                                                 */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  9,                          // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_24_CS_INTERFACE,  // bDescriptorType     1 CS_INTERFACE Descriptor type
  DESC_SUBTYPE_01_HEADER,     // bDescriptorSubtype  1 HEADER Descriptor type
  DESC_H2B(0x0100),           // bcdADC              2 Audio Device Class Specification Release Number
  DESC_H2B(0x0027),           // wTotalLength        2 Total number of bytes returned for this descriptor
  0x01,                       // bInCollection       1 Number of AudioStreaming and MIDIStreaming interfaces
  0x01,                       // baInterfaceNr       1 Interface number of the n interface

  /*--------------------------------------------------------------------------------------------------------*/
  /* Input Terminal Descriptor                                                                              */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_0C_UAC_IN_TERML,   // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_24_CS_INTERFACE,  // bDescriptorType     1 CS_INTERFACE Descriptor type
  DESC_SUBTYPE_02_IN_TERML,   // bDescriptorSubtype  1 INPUT_TERMINAL Descriptor type
  IT_ID,                      // bTerminalID         1 Constant ID of the Terminal within the audio function
  DESC_H2B(0x0101),           // wTerminalType       2 Constant characterizing the type of Terminal
  0x00,                       // bAssocTerminal      1 ID of the Output Terminal to associated with this
  0x01,                       // bNrChannels         1 Number of logical output channels in the Terminal¡¦s output audio channel cluster
  DESC_H2B(0x0000),           // wChannelConfig      2 Describes the spatial location of the logical channels
  0x00,                       // iChannelNames       1 Index of a string descriptor for first logic channel
  0x00,                       // iTerminal           1 Index of a string descriptor for the Input Terminal

  /*--------------------------------------------------------------------------------------------------------*/
  /* Feature Unit Descriptor                                                                                */
  /*--------------------------------------------------------------------------------------------------------*/
                               /* Field            Size Description                                         */
                               /*---------------------------------------------------------------------------*/
  9,                           // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_24_CS_INTERFACE,   // bDescriptorType     1 CS_INTERFACE Descriptor type
  DESC_SUBTYPE_06_FEATURE_UNIT,// bDescriptorSubtype  1 FEATURE_UNIT Descriptor type
  FU_ID,                       // bUnitID             1 Constant ID of the Unit within the audio function
  IT_ID,                       // bSourceID           1 ID of the Unit or Terminal to which this Feature Unit is connected
  0x01,                        // bControlSize        1 Size in bytes of an element of the bmaControls() array
  0x01,                        // bmaControls(0)      1 A bit set to 1 indicates that the mentioned Control is supported for master channel n
  0x00,                        // bmaControls(1)      1
  0x00,                        // iFeature            1 Index of a string descriptor for the Feature Unit

  /*--------------------------------------------------------------------------------------------------------*/
  /* Output Terminal Descriptor                                                                             */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_09_UAC_OUT_TERML,  // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_24_CS_INTERFACE,  // bDescriptorType     1 CS_INTERFACE Descriptor type
  DESC_SUBTYPE_03_OUT_TERML,  // bDescriptorSubtype  1 INPUT_TERMINAL Descriptor type
  OT_ID,                      // bTerminalID         1 Constant ID of the Terminal within the audio function
  DESC_H2B(0x0301),           // wTerminalType       2 Constant characterizing the type of Terminal
  0x00,                       // bAssocTerminal      1 ID of the Output Terminal to associated with this
  0x02,                       // bSourceID           1 ID of the Unit or Terminal to which this Terminal is connected
  0x00,                       // iTerminal           1 Index of a string descriptor for the Input Terminal

  /*--------------------------------------------------------------------------------------------------------*/
  /* Interface descriptor                                                                                   */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_INF,               // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_04_INF,           // bDescriptorType     1 INTERFACE Descriptor Type
  0x01,                       // bInterfaceNumber    1 Number of this interface (Zero-based 0)
  0x00,                       // bAlternateSetting   1 Value used to select this alternate setting
  0,                          // bNumEndpoints       1 Number of endpoints used by this interface
  DESC_CLASS_01_AUDIO,        // bInterfaceClass     1 Class code (assigned by USB-IF)
  UAC_SUBCLASS_02_AUDIOSTREAM,// bInterfaceSubClass  1 Subclass code (assigned by USB-IF)
  UAC_PROTOCOL_00_UNDEFINED,  // bInterfaceProtocol  1 Protocol code (assigned by USB)
  0x00,                       // iInterface          1 Index of string descriptor describing this interface

  /*--------------------------------------------------------------------------------------------------------*/
  /* Interface descriptor                                                                                   */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_INF,               // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_04_INF,           // bDescriptorType     1 INTERFACE Descriptor Type
  0x01,                       // bInterfaceNumber    1 Number of this interface (Zero-based 0)
  0x01,                       // bAlternateSetting   1 Value used to select this alternate setting
  1,                          // bNumEndpoints       1 Number of endpoints used by this interface
  DESC_CLASS_01_AUDIO,        // bInterfaceClass     1 Class code (assigned by USB-IF)
  UAC_SUBCLASS_02_AUDIOSTREAM,// bInterfaceSubClass  1 Subclass code (assigned by USB-IF)
  UAC_PROTOCOL_00_UNDEFINED,  // bInterfaceProtocol  1 Protocol code (assigned by USB)
  0x00,                       // iInterface          1 Index of string descriptor describing this interface

  /*--------------------------------------------------------------------------------------------------------*/
  /* Audio Streaming Interface Descriptor                                                                   */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_07_UAC_STREAMING,  // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_24_CS_INTERFACE,  // bDescriptorType     1 CS_INTERFACE Descriptor type
  DESC_SUBTYPE_01_AS_GERERAL, // bDescriptorSubtype  1 AS_GENERAL Descriptor type
  0x01,                       // bTerminalLink       1 The Terminal ID of the Terminal to which the endpoint of this interface is connected
  0x01,                       // bDelay              1 Delay introduced by the data path
  DESC_H2B(0x0002),           // wFormatTag          2 The Audio Data Format that has to be used to communicate with this interface

  /*--------------------------------------------------------------------------------------------------------*/
  /* Audio Type I Format Interface Descriptor                                                               */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  0x0B,                       // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_24_CS_INTERFACE,  // bDescriptorType     1 CS_INTERFACE Descriptor type
  DESC_SUBTYPE_02_FORMAT_TYPE,// bDescriptorSubtype  1 AS_GENERAL Descriptor type
  0x01,                       // bFormatType         1
  0x02,                       // bNrChannels         1
  0x02,                       // bSubFrameSize       1
  16,                         // bBitResolution      1
  0x01,                       // bSamFreqType        1
  0x80,                       // tSamFreq            3
  0xBB,
  0x00,

  /*--------------------------------------------------------------------------------------------------------*/
  /* Endpoint Standard Descriptor                                                                           */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_09_UAC_STD_EPT,    // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_05_EPT,           // bDescriptorType     1 ENDPOINT Descriptor Type
  0x04,                       // bEndpointAddress    1 The address of the endpoint
                              //                        Bit 3..0: The endpoint number
                              //                        Bit 6..4: Reserved
                              //                        Bit 7   : Direction (0 = Out/1 = In)
  0x09,                       // bmAttribute         1 Endpoint Attribute
                              //                        Bit 1..0: Transfer type
                              //                                  00 = Control
                              //                                  01 = Isochronous
                              //                                  10 = Bulk
                              //                                  11 = Interrupt
                              //                        Bit 3..2: Synchronization type
                              //                                  01 = Asynchronous
                              //                                  10 = Adaptive
                              //                                  11 = Synchronous
                              //                        All other reserved
  DESC_H2B(_EP4LEN),          // wMaxPacketSize      2 Maximum packet size
  0x01,                       // bInterval           1 Interval for polling endpoint
  0x00,                       // bRefresh            1 Reset to 0.
  0x00,                       // bSynchAddress       1 The address of the endpoint used to communicate synchronization information

  /*--------------------------------------------------------------------------------------------------------*/
  /* Endpoint Audio Streaming Descriptor                                                                    */
  /*--------------------------------------------------------------------------------------------------------*/
                              /* Field            Size Description                                          */
                              /*----------------------------------------------------------------------------*/
  DESC_LEN_07_UAC_STREAM_EPT, // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_25_CS_EPT,        // bDescriptorType     1 ENDPOINT Descriptor Type
  DESC_SUBTYPE_01_EP_GERERAL, // bDescriptorSubtype  1 EP_GENERAL descriptor subtype.
  0x00,                       // bmAttribute         1 Endpoint Attribute
  0x00,                       // bLockDelayUnits     1 Indicates the units used for the wLockDelay field
  0x00,                       // wLockDelay          1 Indicates the time it takes this endpoint to reliably lock its internal clock recovery circuitry.
  0x00,

  #ifdef RETARGET_IS_USB
    #include "ht32_retarget_desc.h"
  #endif

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
  DESC_STRLEN(14),            // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_03_STR,           // bDescriptorType     1 STRING Descriptor Type
  DESC_CHAR('U'),             // bString             N UNICODE encoded string
  DESC_CHAR('S'),
  DESC_CHAR('B'),
  DESC_CHAR('-'),
  DESC_CHAR('A'),
  DESC_CHAR('U'),
  DESC_CHAR('D'),
  DESC_CHAR('I'),
  DESC_CHAR('O'),
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
  DESC_STRLEN(12),            // bLength             1 Size of this descriptor in bytes
  DESC_TYPE_03_STR,           // bDescriptorType     1 STRING Descriptor Type
  DESC_CHAR('S'),             // bString             N UNICODE encoded string
  DESC_CHAR('N'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('0'),
  DESC_CHAR('6'),
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
