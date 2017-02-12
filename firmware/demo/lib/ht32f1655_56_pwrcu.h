/*********************************************************************************************************//**
 * @file    ht32f1655_56_pwrcu.h
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The header file of the Power Control Unit library.
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Define to prevent recursive inclusion -------------------------------------------------------------------*/
#ifndef __HT32F1655_56_PWRCU_H
#define __HT32F1655_56_PWRCU_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @addtogroup PWRCU
  * @{
  */


/* Exported types ------------------------------------------------------------------------------------------*/
/** @defgroup PWRCU_Exported_Types PWRCU exported types
  * @{
  */

/**
 * @brief Status of Power control unit
 */
typedef enum
{
  PWRCU_OK = 0,                     /*!< Ready for access or backup domain power on reset is released       */
  PWRCU_TIMEOUT,                    /*!< Time out                                                           */
  PWRCU_ERROR                       /*!< Error                                                              */
} PWRCU_Status;
/**
 * @brief DMOS status
 */
typedef enum
{
  PWRCU_DMOS_STS_ON = 0,            /*!< DMOS on                                                            */
  PWRCU_DMOS_STS_OFF,               /*!< DMOS off                                                           */
  PWRCU_DMOS_STS_OFF_BY_BODRESET    /*!< DMOS off caused by brow out reset                                  */
} PWRCU_DMOSStatus;
/**
 * @brief LVD level selection
 */
typedef enum
{
  PWRCU_LVDS_2V7 = 0x00000000,      /*!< LVD level is 2.7 V                                                 */
  PWRCU_LVDS_2V8 = 0x00020000,      /*!< LVD level is 2.8 V                                                 */
  PWRCU_LVDS_2V9 = 0x00040000,      /*!< LVD level is 2.9 V                                                 */
  PWRCU_LVDS_3V =  0x00060000,      /*!< LVD level is 3.0 V                                                 */
  PWRCU_LVDS_3V1 = 0x00400000,      /*!< LVD level is 3.1 V                                                 */
  PWRCU_LVDS_3V2 = 0x00420000,      /*!< LVD level is 3.2 V                                                 */
  PWRCU_LVDS_3V4 = 0x00440000,      /*!< LVD level is 3.4 V                                                 */
  PWRCU_LVDS_3V5 = 0x00460000       /*!< LVD level is 3.5 V                                                 */
} PWRCU_LVDS_Enum;
/**
 * @brief BOD reset or interrupt selection
 */
typedef enum
{
  PWRCU_BODRIS_RESET = 0,  /*!< Reset the whole chip                                                        */
  PWRCU_BODRIS_INT   = 1,  /*!< Assert interrupt                                                            */
} PWRCU_BODRIS_Enum;
/**
 * @brief Sleep entry instruction selection
 */
typedef enum
{
  PWRCU_SLEEP_ENTRY_WFE = 0,          /*!< Sleep then wait for event                                        */
  PWRCU_SLEEP_ENTRY_WFI               /*!< Sleep then wait for interrupt                                    */
} PWRCU_SLEEP_ENTRY_Enum;
/**
 * @brief Backup register selection
 */
typedef enum
{
  PWRCU_BAKREG_0 = 0,
  PWRCU_BAKREG_1,
  PWRCU_BAKREG_2,
  PWRCU_BAKREG_3,
  PWRCU_BAKREG_4,
  PWRCU_BAKREG_5,
  PWRCU_BAKREG_6,
  PWRCU_BAKREG_7,
  PWRCU_BAKREG_8,
  PWRCU_BAKREG_9
} PWRCU_BAKREG_Enum;
/**
 * @brief Vdd18 power good source selection
 */
typedef enum
{
  PWRCU_V18RDYSC_BKISO = 0, /*!< Vdd18 power good source come from BK_ISO bit in CKCU unit                  */
  PWRCU_V18RDYSC_V18POR     /*!< Vdd18 power good source come from Vdd18 power on reset                     */
} PWRCU_V18RDYSC_Enum;
/**
 * @brief HSI ready counter bit length selection
 */
typedef enum
{
  PWRCU_HSIRCBL_4 = 0,  /*!< 4 bits                                                                         */
  PWRCU_HSIRCBL_5,      /*!< 5 bits                                                                         */
  PWRCU_HSIRCBL_6,      /*!< 5 bits                                                                         */
  PWRCU_HSIRCBL_7       /*!< 7 bits (Default)                                                               */
} PWRCU_HSIRCBL_Enum;
/**
  * @}
  */

/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup PWRCU_Exported_Constants PWRCU exported constants
  * @{
  */

/* Definitions of PWRCU_FLAG                                                                                */
#define PWRCU_FLAG_BAKPOR       0x0001  /*!< Backup domain power on reset flag                              */
#define PWRCU_FLAG_PD           0x0002  /*!< Power-Down flag                                                */
#define PWRCU_FLAG_WUP          0x0100  /*!< External WAKEUP pin flag                                       */

/* check PWRCU_LVDS parameter                                                                               */
#define IS_PWRCU_LVDS(x)        ((x == PWRCU_LVDS_2V7) || (x == PWRCU_LVDS_2V8) || \
                                 (x == PWRCU_LVDS_2V9) || (x == PWRCU_LVDS_3V)  || \
                                 (x == PWRCU_LVDS_3V1) || (x == PWRCU_LVDS_3V2) || \
                                 (x == PWRCU_LVDS_3V4) || (x == PWRCU_LVDS_3V5))

/* check PWRCU_BODRIS parameter                                                                             */
#define IS_PWRCU_BODRIS(x)      ((x == PWRCU_BODRIS_RESET) || (x == PWRCU_BODRIS_INT))

/* check PWRCU_HSIRCBL parameter                                                                            */
#define IS_PWRCU_HSIRCBL(x)     (x <= 3)

/* check PWRCU_SLEEP_ENTRY parameter                                                                        */
#define IS_PWRCU_SLEEP_ENTRY(x) ((x == PWRCU_SLEEP_ENTRY_WFI) || (x == PWRCU_SLEEP_ENTRY_WFE))

/* check PWRCU_BAKREG parameter                                                                             */
#define IS_PWRCU_BAKREG(x)      (x < 10)

/* check PWRCU_V18RDY_SRC parameter                                                                         */
#define IS_PWRCU_V18RDYSC(x)    ((x == PWRCU_V18RDYSC_BKISO) || (x == PWRCU_V18RDYSC_V18POR))
/**
  * @}
  */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup PWRCU_Exported_Functions PWRCU exported functions
  * @{
  */
void PWRCU_DeInit(void);
PWRCU_Status PWRCU_CheckReadyAccessed(void);
u16 PWRCU_GetFlagStatus(void);
u32 PWRCU_ReadBackupRegister(PWRCU_BAKREG_Enum BAKREGx);
void PWRCU_WriteBackupRegister(PWRCU_BAKREG_Enum BAKREGx, u32 DATA);
void PWRCU_Sleep(PWRCU_SLEEP_ENTRY_Enum SleepEntry);
void PWRCU_DeepSleep1(PWRCU_SLEEP_ENTRY_Enum SleepEntry);
void PWRCU_DeepSleep2(PWRCU_SLEEP_ENTRY_Enum SleepEntry);
void PWRCU_PowerDown(void);
void PWRCU_SetLVDS(PWRCU_LVDS_Enum Level);
void PWRCU_LVDCmd(ControlStatus NewState);
void PWRCU_BODCmd(ControlStatus NewState);
void PWRCU_BODRISConfig(PWRCU_BODRIS_Enum Selection);
FlagStatus PWRCU_GetLVDFlagStatus(void);
FlagStatus PWRCU_GetBODFlagStatus(void);
PWRCU_DMOSStatus PWRCU_GetDMOSStatus(void);
void PWRCU_DMOSCmd(ControlStatus NewState);
void PWRCU_V18RDYSourceConfig(PWRCU_V18RDYSC_Enum Sel);
void PWRCU_LVDIntWakeupConfig(ControlStatus NewState);
void PWRCU_LVDEventWakeupConfig(ControlStatus NewState);
void PWRCU_WakeupPinCmd(ControlStatus NewState);
void PWRCU_WakeupPinIntConfig(ControlStatus NewState);
void PWRCU_HSIReadyCounterBitLengthConfig(PWRCU_HSIRCBL_Enum BitLength);
/**
  * @}
  */


/**
  * @}
  */

/**
  * @}
  */

#ifdef __cplusplus
}
#endif

#endif
