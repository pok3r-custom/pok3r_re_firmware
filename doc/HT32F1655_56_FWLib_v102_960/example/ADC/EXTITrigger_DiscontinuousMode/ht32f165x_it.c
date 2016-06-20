/*********************************************************************************************************//**
 * @file    ADC/EXTITrigger_DiscontinuousMode/ht32f165x_it.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all interrupt service routine.
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
#include "ht32.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup ADC_Examples ADC
  * @{
  */

/** @addtogroup EXTITrigger_DiscontinuousMode
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
u32 gADC_Result[3];
u32 gADC_ResultIndex = 0;
volatile bool gADC_CycleEndOfConversion;
volatile bool gADC_SubGroupEndOfConversion;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
 * @brief   This function handles NMI exception.
 * @retval  None
 ************************************************************************************************************/
void NMI_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles Hard Fault exception.
 * @retval  None
 ************************************************************************************************************/
void HardFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Memory Manage exception.
 * @retval  None
 ************************************************************************************************************/
void MemManage_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Bus Fault exception.
 * @retval  None
 ************************************************************************************************************/
void BusFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles Usage Fault exception.
 * @retval  None
 ************************************************************************************************************/
void UsageFault_Handler(void)
{
  while (1);
}

/*********************************************************************************************************//**
 * @brief   This function handles SVCall exception.
 * @retval  None
 ************************************************************************************************************/
void SVC_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles Debug Monitor exception.
 * @retval  None
 ************************************************************************************************************/
void DebugMon_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles PendSVC exception.
 * @retval  None
 ************************************************************************************************************/
void PendSV_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles SysTick Handler.
 * @retval  None
 ************************************************************************************************************/
void SysTick_Handler(void)
{
}

/*********************************************************************************************************//**
 * @brief   This function handles ADC interrupt.
 * @retval  None
 ************************************************************************************************************/
void ADC_IRQHandler(void)
{
  /* Clear EXTI Channel 1 flag                                                                              */
  EXTI_ClearEdgeFlag(EXTI_CHANNEL_1);

  if (ADC_GetIntStatus(HT_ADC, ADC_FLAG_CYCLE_EOC))
  { /* Get the last sub group ADC result                                                                    */
    ADC_ClearIntPendingBit(HT_ADC, ADC_FLAG_CYCLE_EOC | ADC_FLAG_SUB_GROUP_EOC);
    gADC_CycleEndOfConversion = TRUE;
    gADC_Result[gADC_ResultIndex] = HT_ADC->DR[gADC_ResultIndex] & 0x0FFF;
    gADC_ResultIndex = 0; /* Reset the ADC result index                                                     */
  }
  else
  { /* Get the sub group ADC result                                                                         */
    ADC_ClearIntPendingBit(HT_ADC, ADC_FLAG_SUB_GROUP_EOC);
    gADC_SubGroupEndOfConversion = TRUE;
    gADC_Result[gADC_ResultIndex] = HT_ADC->DR[gADC_ResultIndex] & 0x0FFF;
    gADC_ResultIndex++;
    gADC_Result[gADC_ResultIndex] = HT_ADC->DR[gADC_ResultIndex] & 0x0FFF;
    gADC_ResultIndex++;
  }
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
