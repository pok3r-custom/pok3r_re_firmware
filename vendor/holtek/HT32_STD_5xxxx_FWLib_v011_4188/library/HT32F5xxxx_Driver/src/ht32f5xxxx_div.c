/*********************************************************************************************************//**
 * @file    ht32f5xxxx_div.c
 * @version $Rev:: 1704         $
 * @date    $Date:: 2017-08-17 #$
 * @brief   This file provides all the DIV firmware functions.
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
#include "ht32f5xxxx_div.h"

/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
  * @{
  */

/** @defgroup DIV DIV
  * @brief DIV driver modules
  * @{
  */

/* Private constants ---------------------------------------------------------------------------------------*/
#define DIVCR_START     (0x00000001)
#define DIVCR_ZEF       (0x00000004)
#define DIVCR_COM       (0x00000008)


/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup DIV_Exported_Functions DIV exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitialize the DIV peripheral registers to their default reset values.
 * @retval None
 ************************************************************************************************************/
void DIV_DeInit(void)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};

  RSTCUReset.Bit.DIV = 1;
  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Calculate the Quotient of dividend/divisor.
 * @param dividend
 * @param divisor
 * @retval The quotient of dividend/divisor
 ************************************************************************************************************/
s32 DIV_Div32(s32 dividend, s32 divisor)
{
  HT_DIV->DDR = dividend;
  HT_DIV->DSR = divisor;
  HT_DIV->CR = DIVCR_START;

  while((HT_DIV->CR & DIVCR_COM) != DIVCR_COM);

  #if (DIV_ENABLE_DIVIDE_BY_ZERO_CHECK == 1)
  {
    if ((HT_DIV->CR & DIVCR_ZEF) == DIVCR_ZEF)
    {
      while(1);
    }
  }
  #endif

  return (HT_DIV->QTR);
}

/*********************************************************************************************************//**
 * @brief  Calculate the remainder of dividend/divisor.
 * @param dividend
 * @param divisor
 * @retval The remainder of dividend/divisor
 ************************************************************************************************************/
s32 DIV_Mod(s32 dividend, s32 divisor)
{
  DIV_Div32(dividend, divisor);

  return (HT_DIV->RMR);
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
