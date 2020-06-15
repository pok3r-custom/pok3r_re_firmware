/*********************************************************************************************************//**
 * @file    ht32_op.c
 * @version V1.03
 * @date    2019-03-05
 * @brief   The option byre settings of HT32 Series.
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

/* How to use-----------------------------------------------------------------------------------------------*/
/*
    Step1: Modify the Option Bytes values below.
           OB_PP0 ~ OB_PP3
           OB_CP0 ~ OB_CP1
           WDT_OPT

    Step2: Make sure the FLASH_OPT = 1. It designed to disable Flash Option byte setting (when FLASH_OPT = 0).

    Notice: If the Output format is set to "Raw binary" (in Output Converter of IAR Project Options), the 
            conversion time may be too long (since the address is from main flash to option bytes, 0x0 to 
            0x1ff0xxxx, 512 MB). Please change the Output format to "Intel Extended hex" and use third party 
            Hex to Bin tool to convert binary file if need.
*/

/* Settings ------------------------------------------------------------------------------------------------*/
#define FLASH_OPT (0)             /*!< 1: Enable Option Bytes setting, 0: Disable Flash Option Bytes setting*/

/* !!! Note: One OB_PP bit for setting n Pages. Check FMC chapter of User Manual for detailed.              */
#define OB_PP0    (0x00000000)    /*!< Main Flash Page Erase/Program Protection                             */
#define OB_PP1    (0x00000000)    /*!< Main Flash Page Erase/Program Protection                             */
#define OB_PP2    (0x00000000)    /*!< Main Flash Page Erase/Program Protection                             */
#define OB_PP3    (0x00000000)    /*!< Main Flash Page Erase/Program Protection                             */
#define OB_CP0    (0)             /*!< Flash Security Protection                                            */
#define OB_CP1    (0)             /*!< Option Byte Erase/Program Protection                                 */

/* !!! Note: Only the devices below supported Bootloader waiting time options.                              */
/*                                Supported Device List:                                                    */
/*                                  HT32F1755, HT32F1765                                                    */
/*                                  HT32F1653, HT32F1654, HT32F1655, HT32F1656                              */
/*                                  HT32F12345, HT32F12365, HT32F12366                                      */
/*                                  HT32F52220, HT32F52230, HT32F52231, HT32F52241, HT32F52243, HT32F52253  */
/*                                  HT32F52331, HT32F52341, HT32F52342, HT32F52352                          */
/*                                  HT32F50220, HT32F50230, HT32F50231, HT32F50241                          */
/*                                  HT32F0008                                                               */
#define BOOT_OPT  (0)             /*!< Bootloader Options. 1: Enable, 0: Disable                            */
#define BOOTOPTV  (1500)          /*!< Bootloader waiting time based on ms.                                 */
                                  /*!< Range 1500 ~ 14200 ms, Steps: 50)                                    */

/* !!! Note: The device below does not support Watchdog Timer Enable by Flash Option Bytes.                 */
/*                                Not Supported Device List:                                                */
/*                                  HT32F1755, HT32F1765                                                    */
/*                                  HT32F1653, HT32F1654, HT32F1655, HT32F1656                              */
/*                                  HT32F12345, HT32F12366                                                  */
/*                                  HT32F52220, HT32F52230, HT32F52231, HT32F52241, HT32F52243, HT32F52253  */
/*                                  HT32F52331, HT32F52341, HT32F52342, HT32F52352                          */
#define WDT_OPT   (0)             /*!< Watchdog Timer Enable: WDT will be enabled immediately when MCU is   */
                                  /*!<                        power on reset or system reset and can be     */
                                  /*!<                        disabled by firmware.                         */
                                  /*!<                        The default timeout period of WDT is 8s.      */
/* Address of OB_WDT:                                                                                       */
/*   0x1FF003F0: HT32F50220, HT32F50230, HT32F50231, HT32F50241, HT32F0008.                                 */
/*   0x1FF0002C: Others except device in the Not Supported Device List and above 5 devices.                 */

#define WRITERCK_OPT    (0)             /*!< Program  Writer checksum into Option Byte                      */
#define WRITERCK_CODE   (0xFFFFFFFF)    /*!< Writer checksum: code                                          */
#define WRITERCK_DATA   (0xFFFFFFFF)    /*!< Writer checksum: data                                          */
#define WRITERCK_CODEOP (0xFFFFFFFF)    /*!< Writer checksum: code + option                                 */


/*----------------------------------------------------------------------------------------------------------*/
/* DO NOT MODIFY                                                                                            */
/*----------------------------------------------------------------------------------------------------------*/
#define OPT_RES   (0xFFFFFFFF)

#if (OB_PP0 == 0 && OB_PP1 == 0 && OB_PP2 == 0 && OB_PP3 == 0 && OB_CP0 == 0 && OB_CP1 == 0)
  #define OPT_CK (0xFFFFFFFF)
#else
  #define OPT_CK ((unsigned long)(~OB_PP0 + ~OB_PP1 + ~OB_PP2 + ~OB_PP3 + ~(OB_CP0 | OB_CP1 << 1)))
#endif

#if (BOOT_OPT == 1)
  #define OPT_BOOT_WAIT     (0xFFFFFF00 | ((BOOTOPTV - 1500)/50))
#else
  #define OPT_BOOT_WAIT     (0xFFFFFFFF)
#endif

#if (WDT_OPT == 1)
  #if defined(USE_HT32F1653_54)  || \
      defined(USE_HT32F1655_56)  || \
      defined(USE_HT32F12345)    || \
      defined(USE_HT32F12365_66) || \
      defined(USE_HT32F52220_30) || \
      defined(USE_HT32F52231_41) || \
      defined(USE_HT32F52331_41) || \
      defined(USE_HT32F52342_52) || \
      defined(USE_HT32F52243_53)
    #error "The selected MCU (by USE_HT32Fxxxxx) of this project does not support Watchdog Timer Enable (WDT_OPT = 1)!"
  #endif
#endif

#if (WDT_OPT == 1)
  #define OB_WDT            (0xFFFF7A92)
#else
  #define OB_WDT            (0xFFFFFFFF)
#endif

  #if defined(USE_HT32F1653_54)  || \
      defined(USE_HT32F1655_56)  || \
      defined(USE_HT32F12345)    || \
      defined(USE_HT32F12365_66) || \
      defined(USE_HT32F52220_30) || \
      defined(USE_HT32F52231_41) || \
      defined(USE_HT32F52331_41) || \
      defined(USE_HT32F52342_52) || \
      defined(USE_HT32F52243_53) || \
      defined(USE_HT32F50220_30) || \
      defined(USE_HT32F50231_41) || \
      defined(USE_HT32F0008)
  #define OPT_2C    OPT_BOOT_WAIT
#else
  #if (BOOT_OPT == 1)
    #error "The selected MCU (by USE_HT32Fxxxxx) of this project does not support Bootloader waiting option (BOOT_OPT = 1)!"
  #endif
  #define OPT_2C    OB_WDT
#endif

  #if (WRITERCK_OPT == 1)
    #define OPTCK_CODE     WRITERCK_CODE
    #define OPTCK_DATA     WRITERCK_DATA
    #define OPTCK_CODEOP   WRITERCK_CODEOP
  #else
    #define OPTCK_CODE     (0xFFFFFFFF)
    #define OPTCK_DATA     (0xFFFFFFFF)
    #define OPTCK_CODEOP   (0xFFFFFFFF)
  #endif



#if (FLASH_OPT == 1)

  __root const unsigned long HT32Option[15] @ "HT32_OPTIONS" = {
    ~OB_PP0,                            // 0x1FF00000
    ~OB_PP1,                            // 0x1FF00004
    ~OB_PP2,                            // 0x1FF00008
    ~OB_PP3,                            // 0x1FF0000C
    ~(OB_CP0 | OB_CP1 << 1),            // 0x1FF00010
    OPT_RES,                            // 0x1FF00014
    OPT_RES,                            // 0x1FF00018
    OPT_RES,                            // 0x1FF0001C
    OPT_CK,                             // 0x1FF00020
    OPT_RES,                            // 0x1FF00024
    OPT_RES,                            // 0x1FF00028
    OPT_2C,                             // 0x1FF0002C
    OPTCK_CODE,                         // 0x1FF00030
    OPTCK_DATA,                         // 0x1FF00034
    OPTCK_CODEOP,                       // 0x1FF00038
  };

  #if (WDT_OPT == 1)
  #if defined(USE_HT32F50220_30) || \
      defined(USE_HT32F50231_41) || \
      defined(USE_HT32F0008)
  __root const unsigned long HT32Option_WDT[1] @ "HT32_OPTIONS_WDT" = {
    OB_WDT,                             // 0x1FF003F0
  };
  #endif
  #endif

#endif
