/*********************************************************************************************************//**
 * @file    ht32f1655_56_pdma.c
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all the PDMA firmware functions.
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

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56_pdma.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @defgroup PDMA PDMA
  * @brief PDMA driver modules
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup PDMA_Exported_Functions PDMA exported functions
  * @{
  */
/*********************************************************************************************************//**
  * @brief  Configure specific PDMA channel
  * @param  PDMA_Ch: PDMA_CH0 ~ PDMACH7
  * @param  PDMACH_InitStruct: pointer to a PDMACH_InitTypeDef structure that contains the configuration
  * @retval None
  ***********************************************************************************************************/
void PDMA_Config(u32 PDMA_Ch, PDMACH_InitTypeDef *PDMACH_InitStruct)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_Ch * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_Ch));
  Assert_Param(IS_PDMA_WIDTH(PDMACH_InitStruct->PDMACH_DataSize));
  Assert_Param(IS_PDMA_PRIO(PDMACH_InitStruct->PDMACH_Priority));
  Assert_Param(IS_PDMA_ADR_MOD(PDMACH_InitStruct->PDMACH_AdrMod));
  Assert_Param(IS_PDMA_BLK_CNT(PDMACH_InitStruct->PDMACH_BlkCnt));
  Assert_Param(IS_PDMA_BLK_LEN(PDMACH_InitStruct->PDMACH_BlkLen));

  /* PDMA channel x configuration                                                                           */
  PDMACHx->CR = (PDMACH_InitStruct->PDMACH_DataSize | PDMACH_InitStruct->PDMACH_Priority | PDMACH_InitStruct->PDMACH_AdrMod);

  PDMACHx->SADR = PDMACH_InitStruct->PDMACH_SrcAddr;

  PDMACHx->DADR = PDMACH_InitStruct->PDMACH_DstAddr;

  PDMACHx->TSR = (PDMACH_InitStruct->PDMACH_BlkCnt << 16) | PDMACH_InitStruct->PDMACH_BlkLen;
}

/*********************************************************************************************************//**
  * @brief  PDMA_TranSizeConfig
  * @param  PDMA_Ch: PDMA_CH0 ~ PDMACH7
  * @param  BlkCnt: Number of blocks for a transfer
  * @param  BlkLen: Number of data for a block
  * @retval None
  ***********************************************************************************************************/
void PDMA_TranSizeConfig(u32 PDMA_Ch, u32 BlkCnt, u32 BlkLen)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_Ch * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_Ch));
  Assert_Param(IS_PDMA_BLK_CNT(BlkCnt));
  Assert_Param(IS_PDMA_BLK_LEN(BlkLen));

  /* transfer size configuration                                                                            */
  PDMACHx->TSR = ((BlkCnt << 16) | BlkLen);
}

/*********************************************************************************************************//**
  * @brief  Enable the specific PDMA channel interrupts
  * @param  PDMA_Ch: PDMA_CH0 ~ PDMACH7
  * @param  PDMA_Int: PDMA_INT_GE, PDMA_INT_BE, PDMA_INT_HT, PDMA_INT_TC, PDMA_INT_TE
  * @param  NewState: This parameter can be ENABLE or DISABLE.
  * @retval None
  ***********************************************************************************************************/
void PDMA_IntConig(u32 PDMA_Ch, u32 PDMA_Int, ControlStatus NewState)
{
  u32 *PdmaIntEnReg = (PDMA_Ch < 6) ? ((u32 *)(&HT_PDMA->IER0)) : ((u32 *)(&HT_PDMA->IER1));
  u32 BitShift = (PDMA_Ch < 6) ? (PDMA_Ch * 5) : ((PDMA_Ch - 6) * 5);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_Ch));
  Assert_Param(IS_PDMA_INT(PDMA_Int));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    *PdmaIntEnReg |= (PDMA_Int << BitShift);
  }
  else
  {
    *PdmaIntEnReg &= ~(PDMA_Int << BitShift);
  }
}

/*********************************************************************************************************//**
  * @brief  Enable a specific PDMA channel
  * @param  PDMA_Ch: PDMA_CH0 ~ PDMACH7
  * @param  NewState: This parameter can be ENABLE or DISABLE.
  * @retval None
  ***********************************************************************************************************/
void PDMA_EnaCmd(u32 PDMA_Ch, ControlStatus NewState)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_Ch * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_Ch));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    SetBit_BB((u32)(&PDMACHx->CR), 0);
  }
  else
  {
    ResetBit_BB((u32)(&PDMACHx->CR), 0);
  }
}

/*********************************************************************************************************//**
  * @brief  Software trigger a specific PDMA channel
  * @param  PDMA_Ch: PDMA_CH0 ~ PDMACH7
  * @param  NewState: This parameter can be ENABLE or DISABLE.
  * @retval None
  ***********************************************************************************************************/
void PDMA_SwTrigCmd(u32 PDMA_Ch, ControlStatus NewState)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_Ch * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_Ch));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    SetBit_BB((u32)(&PDMACHx->CR), 1);
  }
  else
  {
    ResetBit_BB((u32)(&PDMACHx->CR), 1);
  }
}

/*********************************************************************************************************//**
  * @brief  Get the specific PDMA channel interrupt flag
  * @param  PDMA_Ch: PDMA_CH0 ~ PDMACH7
  * @param  PDMA_Flag: PDMA_FLAG_GE, PDMA_FLAG_BE, PDMA_FLAG_HT, PDMA_FLAG_TC, PDMA_FLAG_TE
  * @retval SET or RESET
  ***********************************************************************************************************/
FlagStatus PDMA_GetFlagStatus(u32 PDMA_Ch, u32 PDMA_Flag)
{
  u32 *PdmaIntStatReg = (PDMA_Ch < 6) ? ((u32 *)(&HT_PDMA->ISR0)) : ((u32 *)(&HT_PDMA->ISR1));
  u32 BitShift = (PDMA_Ch < 6) ? (PDMA_Ch * 5) : ((PDMA_Ch - 6) * 5);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_Ch));
  Assert_Param(IS_PDMA_FLAG(PDMA_Flag));

  if ((*PdmaIntStatReg & (PDMA_Flag << BitShift)) != RESET)
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
  * @brief  Clear the specific PDMA channel interrupt flags
  * @param  PDMA_Ch: PDMA_CH0 ~ PDMACH7
  * @param  PDMA_Flag: PDMA_FLAG_GE, PDMA_FLAG_BE, PDMA_FLAG_HT, PDMA_FLAG_TC, PDMA_FLAG_TE
  * @retval None
  ***********************************************************************************************************/
void PDMA_ClearFlag(u32 PDMA_Ch, u32 PDMA_Flag)
{
  u32 *PdmaIntStatClrReg = (PDMA_Ch < 6) ? ((u32 *)(&HT_PDMA->ISCR0)) : ((u32 *)(&HT_PDMA->ISCR1));
  u32 BitShift = (PDMA_Ch < 6) ? (PDMA_Ch * 5) : ((PDMA_Ch - 6) * 5);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_Ch));
  Assert_Param(IS_PDMA_CLEAR_FLAG(PDMA_Flag));

  *PdmaIntStatClrReg |= (PDMA_Flag << BitShift);
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
