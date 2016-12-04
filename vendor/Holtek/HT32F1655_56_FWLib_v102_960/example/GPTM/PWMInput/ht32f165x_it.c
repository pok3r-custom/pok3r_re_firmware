/*********************************************************************************************************//**
 * @file    GPTM/PWMInput/ht32f165x_it.c
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

/** @addtogroup GPTM_Examples GPTM
  * @{
  */

/** @addtogroup PWMInput
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define SLAVE_RESTART_LATENCY   2

/* Private variables ---------------------------------------------------------------------------------------*/
vu16 CaptureValue = 0;
vu32 wDutyCycle = 0;       /*!< Duty Cycle in 16.16 fix point format                                        */
vu32 wFrequency = 0;       /*!< Frequency in 32.0 fix point format                                          */

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
 * @brief   This function handles General Purpose Timer 1 interrupt.
 * @retval  None
 * @details In GPTM1 interrupt service routine:
 *  - If the external signal under the minimum frequency,
 *    - GPTM1 Update Event interrupt occurred. Reset wFrequency and wDutyCycle.
 *  - Otherwise,
 *    - The rising edge will trigger Channel1 Capture Event,
 *      GPTM1 Channel1 Capture interrupt occurred.
 *    - Compute wFrequency and wDutyCycle.
 *
 ************************************************************************************************************/
void GPTM1_IRQHandler(void)
{
  if (GPTM_GetIntStatus(HT_GPTM1, GPTM_INT_UEV) != RESET)
  {
    /* Reset wFrequency and wDutyCycle                                                                      */
    GPTM_ClearIntPendingBit(HT_GPTM1, GPTM_INT_UEV);
    wDutyCycle = 0;
    wFrequency = 0;
    CaptureValue = 0;
  }
  else if (GPTM_GetIntStatus(HT_GPTM1, GPTM_INT_CH1CC) != RESET)
  {
    /* Compute wFrequency and wDutyCycle                                                                    */

    /* Clear GPTM1 Capture compare interrupt pending bit                                                    */
    GPTM_ClearIntPendingBit(HT_GPTM1, GPTM_INT_CH1CC);

    /* Get the Input Capture value                                                                          */
    CaptureValue = GPTM_GetCaptureCompare1(HT_GPTM1) + SLAVE_RESTART_LATENCY;

    if (CaptureValue != 0)
    {
      /* Duty cycle computation                                                                             */
      wDutyCycle = ((GPTM_GetCaptureCompare0(HT_GPTM1) + SLAVE_RESTART_LATENCY) << 16) / CaptureValue;
      wDutyCycle *= 100;

      /* wFrequency computation                                                                             */
      wFrequency = 72000000ul / CaptureValue;
    }
    else
    {
      wDutyCycle = 0;
      wFrequency = 0;
    }
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
