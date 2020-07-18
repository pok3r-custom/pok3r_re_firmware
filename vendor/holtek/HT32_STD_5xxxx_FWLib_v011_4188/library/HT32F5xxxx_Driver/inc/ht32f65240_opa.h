/*********************************************************************************************************//**
 * @file    ht32f65240_opa.h
 * @version $Rev:: 3766         $
 * @date    $Date:: 2019-04-14 #$
 * @brief   The header file of the OPA library.
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
#ifndef __HT32F65240_OPA_H
#define __HT32F65240_OPA_H

#ifdef __cplusplus
 extern "C" {
#endif

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"

/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
  * @{
  */

/** @addtogroup OPA
  * @{
  */


/* Exported constants --------------------------------------------------------------------------------------*/
/** @defgroup OPA_Exported_Constants OPA exported constants
  * @{
  */

/* OPA Control                                                                                              */
/** @defgroup OPA_Mode Definitions of OPA modes
  * @{
  */
#define OPA_MODE              (0x00000000ul)

#define IS_OPA_MODE(MODE) ((MODE == OP_MODE) || (MODE == 0x01))
/**
  * @}
  */

/** @defgroup CMP_OP_CancelationRef Definitions the cancelation reference input of CMP_OP
  * @{
  */
#define OPA_NEGATIVE_INPUT         (0x00000000ul)
#define OPA_POSITIVE_INPUT         (0x00000008ul)

#define IS_OPA_REF(REF) ((REF == OPA_NEGATIVE_INPUT ) || (REF == OPA_POSITIVE_INPUT))
/**
  * @}
  */

/* OPA Input Offset Voltage Cancellation                                                                    */
/** @defgroup OPA_Input_Offset Definitions of OPA input offset
  * @{
  */
#define OPA_IOVC_MIN               (0x00000000ul)
#define OPA_IOVC_CENTER            (0x00000020ul)
#define OPA_IOVC_MAX               (0x0000003Ful)

#define IS_OPA_IOVC(IOVC)          (IOVC <= 63 )
/**
  * @}
  */

/* OPA BASE                                                                                                 */
/**
 * @brief Used to check parameter of the OPAx.
 */
#define IS_OPA_ALL_PERIPH(PERIPH) ((PERIPH == HT_OPA0) || (PERIPH == HT_OPA1))
/**
  * @}
 */

/* Exported functions --------------------------------------------------------------------------------------*/
/** @defgroup OPA_Exported_Functions OPA exported functions
  * @{
  */
void OPA_DeInit(void);
void OPA_Config(HT_OPA_TypeDef* HT_OPAn, u32 mode, u32 cancellation);
void OPA_Cmd(HT_OPA_TypeDef* HT_OPAn, ControlStatus NewState);
void OPA_CancellationModeConfig(HT_OPA_TypeDef* HT_OPAn, u16 OPA_REF_INPUT);
void OPA_SetCancellationVaule(HT_OPA_TypeDef* HT_OPAn, u32 cancellation);
u32 OPA_GetCancellationVaule(HT_OPA_TypeDef* HT_OPAn);
//FlagStatus OPA_GetOutputStatus(HT_OPA_TypeDef* HT_OPAn);
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
