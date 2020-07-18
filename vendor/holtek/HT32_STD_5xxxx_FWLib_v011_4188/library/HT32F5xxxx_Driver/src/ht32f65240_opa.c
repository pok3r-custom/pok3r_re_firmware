  /*********************************************************************************************************//**
 * @file    ht32f65240_opa.c
 * @version $Rev:: 3794         $
 * @date    $Date:: 2019-04-25 #$
 * @brief   This file provides all the OPA firmware functions.
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
#include "ht32f65240_opa.h"

/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
  * @{
  */

/** @defgroup  OPA OPA
  * @brief OPA driver modules
  * @{
  */


/* Private define ------------------------------------------------------------------------------------------*/
/** @defgroup OPA_Private_Define OPA private definitions
  * @{
  */
#define OPA_ENABLE                    (0x00000001ul)
#define OPA_CANCELLATION_MODE         (0x00000004ul)
/**
  * @}
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup OPA_Exported_Functions OPA exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitialize the OPA peripheral registers to their default reset values.
 * @retval None
 ************************************************************************************************************/
void OPA_DeInit(void)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};

  RSTCUReset.Bit.OPA = 1;
  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Configure the OPA peripheral as OPA mode and fill the cancellation value.
 * @param HT_OPAn: where OPA is the selected OPA from the OPA peripherals, x can be 0 or 1.
 * @param mode: Specify the HT_OPAn peripheral mode
 *   This parameter can be any combination of the following values:
 *     @arg OPA_MODE  : Operational Amplifier mode
 * @param cancellation: Specify the input offset voltage cancellation value .
 * @retval None
************************************************************************************************************/
void OPA_Config(HT_OPA_TypeDef* HT_OPAn, u32 mode, u32 cancellation)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_OPA_ALL_PERIPH(HT_OPAn));
  Assert_Param(IS_OPA_MODE(mode));
  Assert_Param(IS_OPA_IOVC(cancellation));

  HT_OPAn->CR = (HT_OPAn->CR & OPA_ENABLE) | mode;
  HT_OPAn->OFVCR = cancellation;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specified OPA peripheral.
 * @param HT_OPAn: where HT_OPAn is the selected OPA from the OPA peripherals, x can be 0 or 1.
 * @param  NewState: new state of the HT_OPAn peripheral.
 *   This parameter can be: ENABLE or DISABLE.
 * @retval None
************************************************************************************************************/
void OPA_Cmd(HT_OPA_TypeDef* HT_OPAn, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_OPA_ALL_PERIPH(HT_OPAn));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    /* Enable the selected HT_OPAn peripheral                                                               */
    HT_OPAn->CR |= OPA_ENABLE;
  }
  else
  {
    /* Disable the selected HT_OPAn peripheral                                                              */
    HT_OPAn->CR &= ~(u32)OPA_ENABLE;
  }
}

/*********************************************************************************************************//**
 * @brief Configure the OPA peripheral as cancellation mode and select the source of reference input.
 * @param HT_OPAn: where HT_OPAn is the selected OPA from the OPA peripherals, x can be 0 or 1.
 * @param OPA_REF_INPUT: Specify the the source of reference input.
 *   This parameter can be any combination of the following values:
 *     @arg OPA_NEGATIVE_INPUT
 *     @arg OPA_POSITIVE_INPUT
 * @retval None
************************************************************************************************************/
void OPA_CancellationModeConfig(HT_OPA_TypeDef* HT_OPAn, u16 OPA_REF_INPUT)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_OPA_ALL_PERIPH(HT_OPAn));
  Assert_Param(IS_OPA_REF(OPA_REF_INPUT));

  HT_OPAn->CR = (HT_OPAn->CR & OPA_ENABLE) | OPA_CANCELLATION_MODE | OPA_REF_INPUT;
}

/*********************************************************************************************************//**
 * @brief Set input offset voltage cancellation value.
 * @param HT_OPAn: where HT_OPAn is the selected OPA from the OPA peripherals, x can be 0 or 1.
 * @param cancellation: Specify the input offset voltage cancellation value .
 * @retval None
************************************************************************************************************/
void OPA_SetCancellationVaule(HT_OPA_TypeDef* HT_OPAn, u32 cancellation)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_OPA_ALL_PERIPH(HT_OPAn));
  Assert_Param(IS_OPA_IOVC(cancellation));

  HT_OPAn->OFVCR = cancellation;
}

/*********************************************************************************************************//**
 * @brief Get input offset voltage cancellation value.
 * @param HT_OPAn: where HT_OPAn is the selected OPA from the OPA peripherals, x can be 0 or 1.
 * @retval The input offset voltage cancellation value.
************************************************************************************************************/
u32 OPA_GetCancellationVaule(HT_OPA_TypeDef* HT_OPAn)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_OPA_ALL_PERIPH(HT_OPAn));

  return HT_OPAn->OFVCR;
}

#if 0
/*********************************************************************************************************//**
 * @brief Get the output status of HT_OPAn.
 * @param HT_OPAn: where HT_OPAn is the selected OPA from the OPA peripherals, x can be 0 or 1.
 * @retval SET or RESET
************************************************************************************************************/
FlagStatus OPA_GetOutputStatus(HT_OPA_TypeDef* HT_OPAn)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_CMP_OP_ALL_PERIPH(HT_OPAn));

  if ((HT_OPAn->CR & 0x00000100) != 0x0)
  {
    return SET ;
  }
  else
  {
    return RESET ;
  }
}
#endif
/**
  * @}
  */


/**
  * @}
  */

/**
  * @}
  */
