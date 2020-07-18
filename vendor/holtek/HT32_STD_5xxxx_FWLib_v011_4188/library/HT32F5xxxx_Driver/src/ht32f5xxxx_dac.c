/*********************************************************************************************************//**
 * @file    ht32f5xxxx_dac.c
 * @version $Rev:: 4180         $
 * @date    $Date:: 2019-08-03 #$
 * @brief   This file provides all the DAC firmware functions.
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
#include "ht32f5xxxx_dac.h"

/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
  * @{
  */

/** @defgroup DAC DAC
  * @brief DAC driver modules
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup DAC_Exported_Functions DAC exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitialize the DAC peripheral registers to their default reset values.
 * @retval None
 ************************************************************************************************************/
void DAC_DeInit(void)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};
  RSTCUReset.Bit.DAC = 1;
  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Configure the DAC conversion mode.
 * @param ModeSel: specify the conversion mode
 *   This parameter can be one of the following values:
 *     @arg ASYNC_MODE : asynchronous conversion mode
 *     @arg SYNC_MODE  : synchronous conversion mode
 * @retval None
 ************************************************************************************************************/
void DAC_ModeConfig(u8 ModeSel)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_CONVERSION_MODE(ModeSel));

  HT_DAC->CFGR = ModeSel;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specified DAC interrupts.
 * @param DAC_Int: specify the DAC interrupt sources that is to be enabled or disabled.
 *   This parameter can be any combination of the following values:
 *     @arg DAC_INT_DOR0IE :
 *     @arg DAC_INT_DOR1IE :
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void DAC_IntConfig(u32 DAC_Int, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_INT(DAC_Int));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    HT_DAC->IER |= DAC_Int;
  }
  else
  {
    HT_DAC->IER &= ~DAC_Int;
  }
}

/*********************************************************************************************************//**
 * @brief Get the specified DAC interrupt flag.
 * @param DAC_Flag: specify the interrupt flag.
 *   This parameter can one of the following values:
 *     @arg DAC_FLAG_DOR0IF :
 *     @arg DAC_FLAG_DOR1IF :
 * @retval SET or RESET
 ************************************************************************************************************/
FlagStatus DAC_GetFlagStatus(u32 DAC_Flag)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_FLAG(DAC_Flag));

  if ((HT_DAC->ISR & DAC_Flag) != RESET)
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
 * @brief Clear the specified DAC interrupt flag.
 * @param DAC_Flag: specify the interrupt flag.
 *   This parameter can be one of the following values:
 *     @arg DAC_FLAG_DOR0IF :
 *     @arg DAC_FLAG_DOR1IF :
 * @retval None
 ************************************************************************************************************/
void DAC_ClearFlag(u32 DAC_Flag)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_FLAG(DAC_Flag));

  HT_DAC->ISR |= DAC_Flag;
}

/*********************************************************************************************************//**
 * @brief Configure the specified DAC channel reference voltage.
 * @param DAC_Ch: DAC_CH0 ~ DAC_CH1
 * @param RefSel: DAC reference voltage source
 *   This parameter can be one of the following values:
 *     @arg DAC_REFERENCE_VDDA : VDDA
 *     @arg DAC_REFERENCE_VREF : VREF
 * @retval None
 ************************************************************************************************************/
void DAC_ReferenceConfig(u8 DAC_Ch, u32 RefSel)
{
  vu32 *CHxCR = (vu32 *)((u32)&HT_DAC->CH0CR + (DAC_Ch * 0x20));

  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_CHANNEL(DAC_Ch));
  Assert_Param(IS_DAC_REFERENCE(RefSel));

  *CHxCR = (*CHxCR & ~(3UL << 14)) | RefSel;
}

/*********************************************************************************************************//**
 * @brief Configure the specified DAC channel resolution.
 * @param DAC_Ch: DAC_CH0 ~ DAC_CH1
 * @param ResoSel: DAC Channel Resolution
 *   This parameter can be one of the following values:
 *     @arg DAC_RESOLUTION_8BIT  : 8-bit resolution
 *     @arg DAC_RESOLUTION_12BIT : 12-bit resolution
 * @retval None
 ************************************************************************************************************/
void DAC_ResolutionConfig(u8 DAC_Ch, u32 ResoSel)
{
  vu32 *CHxCR = (vu32 *)((u32)&HT_DAC->CH0CR + (DAC_Ch * 0x20));

  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_CHANNEL(DAC_Ch));
  Assert_Param(IS_DAC_RESOLUTION(ResoSel));

  *CHxCR = (*CHxCR & ~(1UL << 2)) | ResoSel;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specified DAC Channel output buffer.
 * @param DAC_Ch: DAC_CH0 ~ DAC_CH1
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void DAC_OutBufCmd(u8 DAC_Ch, ControlStatus NewState)
{
  vu32 *CHxCR = (vu32 *)((u32)&HT_DAC->CH0CR + (DAC_Ch * 0x20));

  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_CHANNEL(DAC_Ch));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    *CHxCR = (*CHxCR & ~(3UL << 6)) | (2UL << 6);
  }
  else
  {
    *CHxCR = (*CHxCR & ~(3UL << 6)) | (1UL << 6);
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the specified DAC channel.
 * @param DAC_Ch: DAC_CH0 ~ DAC_CH1
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void DAC_Cmd(u8 DAC_Ch, ControlStatus NewState)
{
  vu32 *CHxCR = (vu32 *)((u32)&HT_DAC->CH0CR + (DAC_Ch * 0x20));

  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_CHANNEL(DAC_Ch));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    SetBit_BB((u32)&*CHxCR, 0);
  }
  else
  {
    ResetBit_BB((u32)&*CHxCR, 0);
  }
}

/*********************************************************************************************************//**
 * @brief Set the data holding register value for the specified DAC channel.
 * @param DAC_Ch: DAC_CH0 ~ DAC_CH1
 * @param Data: next conversion data.
 * @retval None
 ************************************************************************************************************/
void DAC_SetData(u8 DAC_Ch, u32 Data)
{
  vu32 *CHxDHR = (vu32 *)((u32)&HT_DAC->CH0DHR + (DAC_Ch * 0x20));

  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_CHANNEL(DAC_Ch));

  *CHxDHR = Data;
}

/*********************************************************************************************************//**
 * @brief Return the data output register value of the specified DAC channel.
 * @param DAC_Ch: DAC_CH0 ~ DAC_CH1
 * @return The selected DAC channel data output value.
 ************************************************************************************************************/
u16 DAC_GetOutData(u8 DAC_Ch)
{
  vu32 *CHxDOR = (vu32 *)((u32)&HT_DAC->CH0DOR + (DAC_Ch * 0x20));

  /* Check the parameters                                                                                   */
  Assert_Param(IS_DAC_CHANNEL(DAC_Ch));

  return ((u16)*CHxDOR);
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
