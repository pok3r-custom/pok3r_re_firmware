/*********************************************************************************************************//**
 * @file    ht32f5xxxx_pdma.c
 * @version $Rev:: 3875         $
 * @date    $Date:: 2019-05-10 #$
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
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f5xxxx_pdma.h"

/** @addtogroup HT32F5xxxx_Peripheral_Driver HT32F5xxxx Peripheral Driver
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
 * @brief Configure specific PDMA channel
 * @param PDMA_CHn: PDMA_CH0 ~ PDMA_CH5
 * @param PDMACH_InitStruct: pointer to a PDMACH_InitTypeDef structure.
 * @retval None
 ************************************************************************************************************/
void PDMA_Config(u32 PDMA_CHn, PDMACH_InitTypeDef *PDMACH_InitStruct)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_CHn * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_CHn));
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
 * @brief PDMA_TranSizeConfig
 * @param PDMA_CHn: PDMA_CH0 ~ PDMA_CH5
 * @param BlkCnt: Number of blocks for a transfer
 * @param BlkLen: Number of data for a block
 * @retval None
 ************************************************************************************************************/
void PDMA_TranSizeConfig(u32 PDMA_CHn, u32 BlkCnt, u32 BlkLen)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_CHn * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_CHn));
  Assert_Param(IS_PDMA_BLK_CNT(BlkCnt));
  Assert_Param(IS_PDMA_BLK_LEN(BlkLen));

  /* transfer size configuration                                                                            */
  PDMACHx->TSR = ((BlkCnt << 16) | BlkLen);
}

/*********************************************************************************************************//**
 * @brief Enable the specific PDMA channel interrupts
 * @param PDMA_CHn: PDMA_CH0 ~ PDMA_CH5
 * @param PDMA_INT_x: PDMA_INT_GE, PDMA_INT_BE, PDMA_INT_HT, PDMA_INT_TC, PDMA_INT_TE
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PDMA_IntConfig(u32 PDMA_CHn, u32 PDMA_INT_x, ControlStatus NewState)
{
  u32 uRegTmp = 0;

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_CHn));
  Assert_Param(IS_PDMA_INT(PDMA_INT_x));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  #if (LIBCFG_PDMA_CH3FIX)
  if (PDMA_CHn == PDMA_CH3)
  {
    if (PDMA_INT_x & PDMA_INT_BE)
    {
      uRegTmp |= (PDMA_INT_BE << (PDMA_CH2 * 5));
    }
    if (PDMA_INT_x & PDMA_INT_HT)
    {
      uRegTmp |= (PDMA_INT_HT << (PDMA_CH2 * 5));
    }
  }
  #endif

  if (NewState != DISABLE)
  {
    HT_PDMA->IER |= ((PDMA_INT_x << (PDMA_CHn * 5)) | uRegTmp);
  }
  else
  {
    HT_PDMA->IER &= ~(PDMA_INT_x << (PDMA_CHn * 5));
  }
}

/*********************************************************************************************************//**
 * @brief Enable a specific PDMA channel
 * @param PDMA_CHn: PDMA_CH0 ~ PDMA_CH5
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PDMA_EnaCmd(u32 PDMA_CHn, ControlStatus NewState)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_CHn * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_CHn));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    PDMACHx->CR |= (1UL);
  }
  else
  {
    PDMACHx->CR &= ~(1UL);
  }
}

/*********************************************************************************************************//**
 * @brief Software trigger a specific PDMA channel
 * @param PDMA_CHn: PDMA_CH0 ~ PDMA_CH5
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void PDMA_SwTrigCmd(u32 PDMA_CHn, ControlStatus NewState)
{
  HT_PDMACH_TypeDef *PDMACHx = (HT_PDMACH_TypeDef *)(HT_PDMA_BASE + PDMA_CHn * 6 * 4);

  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_CHn));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    PDMACHx->CR |= (1UL << 1);
  }
  else
  {
    PDMACHx->CR &= ~(1UL << 1);
  }
}

/*********************************************************************************************************//**
 * @brief Get the specific PDMA channel interrupt flag
 * @param PDMA_CHn: PDMA_CH0 ~ PDMA_CH5
 * @param PDMA_FLAG_x: PDMA_FLAG_GE, PDMA_FLAG_BE, PDMA_FLAG_HT, PDMA_FLAG_TC, PDMA_FLAG_TE
 * @retval SET or RESET
 ************************************************************************************************************/
FlagStatus PDMA_GetFlagStatus(u32 PDMA_CHn, u32 PDMA_FLAG_x)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_CHn));
  Assert_Param(IS_PDMA_FLAG(PDMA_FLAG_x));

  if (HT_PDMA->ISR & (PDMA_FLAG_x << PDMA_CHn * 5))
  {
    return SET;
  }
  else
  {
    return RESET;
  }
}

/*********************************************************************************************************//**
 * @brief Clear the specific PDMA channel interrupt flags
 * @param PDMA_CHn: PDMA_CH0 ~ PDMA_CH5
 * @param PDMA_FLAG_x: PDMA_FLAG_GE, PDMA_FLAG_BE, PDMA_FLAG_HT, PDMA_FLAG_TC, PDMA_FLAG_TE
 * @retval None
 ************************************************************************************************************/
void PDMA_ClearFlag(u32 PDMA_CHn, u32 PDMA_FLAG_x)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_PDMA_CH(PDMA_CHn));
  Assert_Param(IS_PDMA_CLEAR_FLAG(PDMA_FLAG_x));

  HT_PDMA->ISCR |= (PDMA_FLAG_x << PDMA_CHn * 5);
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
