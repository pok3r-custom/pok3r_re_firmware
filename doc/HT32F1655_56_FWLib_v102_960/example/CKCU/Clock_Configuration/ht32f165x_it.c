/*********************************************************************************************************//**
 * @file    CKCU/Clock_Configuration/ht32f165x_it.c
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

/** @addtogroup CKCU_Examples CKCU
  * @{
  */

/** @addtogroup Clock_Configuration
  * @{
  */


/* Private variables ---------------------------------------------------------------------------------------*/
extern CKCU_PLLInitTypeDef PLLInit;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
 * @brief   This function handles NMI exception.
 * @retval  None
 ************************************************************************************************************/
void NMI_Handler(void)
{
  /* This interrupt is generated when HSE failed                                                            */
  if (CKCU_GetIntStatus(CKCU_INT_CKS))
  {
    /*  HSI is configured as system clock source now, both HSE & PLL clock ready
    flags are cleared by hardware. But PLL frequency setting are not changed. */

    /* After Clearing the clock stuck interrupt flag, hardware selects HSI as PLL clock source              */
    CKCU_ClearIntFlag(CKCU_INT_CKS);

    /* Enable HSE ready interrupt. Once HSE clock recover,
       the HSE ready interrupt is generated. */
    CKCU_IntConfig(CKCU_INT_HSERDYIE, ENABLE);
  }

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
 * @brief   This function handles Clock Ready interrupt.
 * @retval  None
 ************************************************************************************************************/
void CKRDY_IRQHandler(void)
{
  /* This interrupt is generated when HSE recovered                                                         */
  if (CKCU_GetClockReadyStatus(CKCU_FLAG_HSERDY))
  {
    /* Clear HSE ready interrupt flag                                                                       */
    CKCU_ClearIntFlag(CKCU_INT_HSERDY);

    /* Check on HSE clock ready flag                                                                        */
    while (!CKCU_GetClockReadyStatus(CKCU_FLAG_HSERDY));

    /* Reconfigure HSE as PLL clock source because hardware selects HSI as PLL clock source after clearing  */
    /* CKSF automatically                                                                                   */
    PLLInit.ClockSource = CKCU_PLLSRC_HSE;
    CKCU_PLLInit(&PLLInit);

    /* Wait for PLL clock ready flag                                                                        */
    while (!CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY));

    /* Configure PLL as system clock                                                                        */
    CKCU_SysClockConfig(CKCU_SW_PLL);
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
