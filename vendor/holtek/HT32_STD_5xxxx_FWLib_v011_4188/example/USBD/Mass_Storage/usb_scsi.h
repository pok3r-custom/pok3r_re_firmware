/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage/usb_scsi.h
 * @version $Rev:: 330          $
 * @date    $Date:: 2016-04-14 #$
 * @brief   The header file of SCSI Block Command (SBC-3 & SPC-4).
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
#ifndef __USB_SCSI_H
#define __USB_SCSI_H

/* Includes ------------------------------------------------------------------------------------------------*/

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup Mass_Storage
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/

/*----------------------------------------------------------------------------------------------------------*/
/* SBC Data type define                                                                                     */
/*----------------------------------------------------------------------------------------------------------*/
typedef __PACKED_H struct
{
  u8 PeripheralDeviceType :5,
     PeripheralQualifier  :3;
  u8 _Reserved1 :7,
     RMB        :1;
  u8 Version;
  u8 ResponseDataFormat :4,
     HISUP              :1,
     NORMACA            :1,
     _Obsolete1         :2;
  u8 AdditionalLength;
  u8 Protect    :1,
     _Reserved2 :2,
     b3PC       :1,
     TPGS       :2,
     ACC        :1,
     SCCS       :1;
  u8 _Unused1   :1,
     _Obsolete2 :3,
     MultiP     :1,
     VS         :1,
     EncServ    :1,
     _Obsolete3 :1;
  u8 VS2        :1,
     CmdQue     :1,
     _Obsolete4 :2,
     _Unused2   :2,
     _Obsolete5 :2;
  u8 VendorID[8];
  u8 ProductID[16];
  u8 ProductRevisionLevel[4];
  #if 0
  u8 VendorSpecific[20];
  u8 _Unused3;
  u8 _Reserved3;
  u16 VersionDescriptors[8];
  u8 _Reserved4[22];
  #endif
} __PACKED_F SBC_InquiryData_TypeDef;

typedef __PACKED_H struct
{
  u8 ResponseCode:7,
     Valid       :1;
  u8 _Obsolete;
  u8 SenseKey  :4,
     _Reserved :1,
     ILI       :1,
     EOM       :1,
     Filemark  :1;
  u8 Information[4];
  u8 AdditionalSenseLength;
  u8 CommandSpecificInformation[4];
  u8 AdditionalSenseCode;
  u8 AdditionalSenseCodeQualifier;
  u8 FieldReplaceableUnitCode;
  u8 SenseKeySpecific0 :7,
     SKSV              :1;
  u8 SenseKeySpecific23[2];
} __PACKED_F SBC_SenseData_TypeDef;

typedef __PACKED_H struct {
  u32 LogicalBlockAddress;
  u32 pLogicalBlockLength;
} __PACKED_F SBC_Capacity10Data_TypeDef;

/*----------------------------------------------------------------------------------------------------------*/
/* SBC Command type define                                                                                  */
/*----------------------------------------------------------------------------------------------------------*/
typedef __PACKED_H struct
{
  u8 Reserved1;
  u8 Reserved2;
  u8 LogicalBlockAddress[4];
  u8 Reserved3;
  u8 AllocationLength[2];
  u8 Reserved4;
} __PACKED_F SBC_CMDTypical_TypeDef;

typedef __PACKED_H struct
{
  u8 OperationCode;
  u8 Obsolete1 :1,
     FUA_NV    :1,
     Reserved1 :1,
     FUA       :1,
     DPO       :1,
     RdProtect :3;
  u8 LogicalBlockAddress[4];
  u8 GroupNumber :5,
     Reserved2   :3;
  u8 TransferLength[2];
  u8 Control;
} __PACKED_F SBC_CMDRead10_TypeDef;

typedef __PACKED_H struct
{
  u8 OperationCode;
  u8 Obsolete1 :1,
     FUA_NV    :1,
     Reserved1 :1,
     FUA       :1,
     DPO       :1,
     WrProtect :3;
  u8 LogicalBlockAddress[4];
  u8 GroupNumber :5,
     Reserved2   :3;
  u8 TransferLength[2];
  u8 Control;
} __PACKED_F SBC_CMDWrite10_TypeDef;

typedef __PACKED_H struct
{
  u8 OperationCode;
  u8 EVPD      :1,
     Reserved1 :7;
  u8 PageCode;
  u8 AllocationLength[2];
  u8 Control;
} __PACKED_F SBC_CMDInquiry_TypeDef;

typedef __PACKED_H struct
{
  u8 OperationCode;
  u8 DESC      :1,
     Reserved1 :7;
  u8 Reserved2;
  u8 AllocationLength[2];
  u8 Control;
} __PACKED_F SBC_CMDRequestSense_TypeDef;

typedef __PACKED_H struct
{
  u8 OperationCode;
  u8 Reserved1 :3,
     DBD       :1,
     Reserved2 :4;
  u8 PageCode  :6,
     PC        :2;
  u8 SubPageCode;
  u8 AllocationLength;
  u8 Control;
} __PACKED_F SBC_CMDModeSecse6_TypeDef;

/* Exported constants --------------------------------------------------------------------------------------*/

#define SBC_RESERVED_VALUE                        (0)

/*----------------------------------------------------------------------------------------------------------*/
/* SCSI Block Command - 3   (SBC-3)                                                                         */
/* SCSI Primary Command - 4 (SPC-4)                                                                         */
/*----------------------------------------------------------------------------------------------------------*/
#define SBC_CMD_PREVENT_ALLOW_MEDIUM_REMOVAL      (0x1E)
#define SBC_CMD_LOAD_UNLOAD                       (0x1B)
#define SBC_CMD_READ_CAPACITY_10                  (0x25)
#define SBC_CMD_READ_10                           (0x28)
#define SBC_CMD_WRITE_10                          (0x2A)
#define SBC_CMD_VERIFY_10                         (0x2F)
#define SBC_CMD_READ_12                           (0xA8)
#define SBC_CMD_WRITE_12                          (0xAA)

#define SBC_CMD_TEST_UNIT_READY                   (0x00)
#define SBC_CMD_REQUEST_SENSE                     (0x03)
#define SBC_CMD_INQUIRY                           (0x12)
#define SBC_CMD_MODE_SENSE_06                     (0x1A)
#define SBC_CMD_READ_FORMAT_CAPACITIES            (0x23)

/*----------------------------------------------------------------------------------------------------------*/
/* Const of SCSI_InquiryData_Typedef                                                                        */
/*----------------------------------------------------------------------------------------------------------*/
/* PeripheralDeviceType                                                                                     */
#define SBC_DIRECT_ACCESS_BLOCK_DEVICE            (0x00)
#define SBC_SEQUENTIAL_ACCESS_DEVICE              (0x01)
#define SBC_PRINTER_DEVICE                        (0x02)
#define SBC_PROCESSOR_DEVICE                      (0x03)
#define SBC_WRITE_ONCE_DEVICE                     (0x04)
#define SBC_CD_DVD_DEVICE                         (0x05)
#define SBC_SCANNER_DEVICE                        (0x06)
#define SBC_OPTICAL_MEMORY_DEVICE                 (0x07)
#define SBC_MEDIA_CHANGER_DEVICE                  (0x08)
#define SBC_COMMUNICATION_DEVICE                  (0x09)
#define SBC_STORAGE_ARRAY_CONTROLLER_DEVICE       (0x0C)
#define SBC_ENCLOSURE_SERVICES_DEVICE             (0x0D)
#define SBC_SIMPLIFIED_DIRECT_ACCESS_DEVICE       (0x0E)
#define SBC_OPTICAL_CARD_READER_WRITER_DEVICE     (0x0F)
#define SBC_BRIDGE_CONTROLLER_COMMANDS            (0x10)
#define SBC_OBJECT_BASED_STORAGE_DEVICE           (0x11)
/* PeripheralQualifier                                                                                      */
#define SBC_PERIPHERAL_DEVICE_CONNECTED           (0x00)
#define SBC_PERIPHERAL_DEVICE_NOT_CONNECTED       (0x01)
#define SBC_PERIPHERAL_DEVICE_NOT_SUPPORTED       (0x03)
/* RMB                                                                                                      */
#define SBC_REMOVEABLE_MEDIUM                     (0x01)
#define SBC_NOT_REMOVEABLE_MEDIUM                 (0x00)
/* Version                                                                                                  */
#define SBC_SPC_VERSION_4                         (0x06)
/* TPGS                                                                                                     */
#define SBC_TPGS_NONE                             (0x0)
#define SBC_TPGS_ASYMMETRIC                       (0x1)
#define SBC_TPGS_SYMMETRIC                        (0x2)
#define SBC_TPGS_BOTH                             (0x3)
/* Version descriptor                                                                                       */
#define SBC_VERSION_DESCRIPTOR_SBC_3              (0x04C0)

/*----------------------------------------------------------------------------------------------------------*/
/* Const of SCSI_SenseData_Typedef                                                                          */
/*----------------------------------------------------------------------------------------------------------*/
/* ResponseCode of Sensor Data                                                                              */
#define SENSE_DATA_FIXED_CURRENT                  (0x70)
#define SENSE_DATA_FIXED_DEFERRED                 (0x71)
#define SENSE_DATA_DESCRIPTOR_CURRENT             (0x72)
#define SENSE_DATA_DESCRIPTOR_DEFERRED            (0x73)

/* Exported macro ------------------------------------------------------------------------------------------*/
#define _LENGTH_INQUIRY_DATAn                     (sizeof(SBC_InquiryData_TypeDef) - 1 - 4)
#define _LENGTH_SENSE_DATAn                       (sizeof(SBC_SenseData_TypeDef) - 1 - 7)


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */

#endif /* __USB_SCSI_H -------------------------------------------------------------------------------------*/
