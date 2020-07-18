/*********************************************************************************************************//**
 * @file    TM/PWMInput/ht32f5xxxx_01_it.c
 * @version $Rev:: 2970         $
 * @date    $Date:: 2018-08-03 #$
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
 * <h2><center>Copyright (C) Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup TM_Examples TM
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
const u16 u16Prescarler = 20;

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
  #if 1

  static vu32 gIsContinue = 0;
  /*--------------------------------------------------------------------------------------------------------*/
  /* For development FW, MCU run into the while loop when the hardfault occurred.                           */
  /* 1. Stack Checking                                                                                      */
  /*    When a hard fault exception occurs, MCU push following register into the stack (main or process     */
  /*    stack). Confirm R13(SP) value in the Register Window and typing it to the Memory Windows, you can   */
  /*    check following register, especially the PC value (indicate the last instruction before hard fault).*/
  /*    SP + 0x00    0x04    0x08    0x0C    0x10    0x14    0x18    0x1C                                   */
  /*           R0      R1      R2      R3     R12      LR      PC    xPSR                                   */
  while (gIsContinue == 0)
  {
  }
  /* 2. Step Out to Find the Clue                                                                           */
  /*    Change the variable "gIsContinue" to any other value than zero in a Local or Watch Window, then     */
  /*    step out the HardFault_Handler to reach the first instruction after the instruction which caused    */
  /*    the hard fault.                                                                                     */
  /*--------------------------------------------------------------------------------------------------------*/

  #else

  /*--------------------------------------------------------------------------------------------------------*/
  /* For production FW, you shall consider to reboot the system when hardfault occurred.                    */
  /*--------------------------------------------------------------------------------------------------------*/
  NVIC_SystemReset();

  #endif
}

/*********************************************************************************************************//**
 * @brief   This function handles SVCall exception.
 * @retval  None
 ************************************************************************************************************/
void SVC_Handler(void)
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
 * @brief   This function handles GPTM0 interrupt.
 * @retval  None
 ************************************************************************************************************/
void GPTM0_IRQHandler(void)
{
  if (TM_GetIntStatus(HT_GPTM0, TM_INT_UEV) != RESET)
  {
    /* Reset wFrequency and wDutyCycle                                                                      */
    TM_ClearIntPendingBit(HT_GPTM0, TM_INT_UEV);
    wDutyCycle = 0;
    wFrequency = 0;
    CaptureValue = 0;
  }
  else if (TM_GetIntStatus(HT_GPTM0, TM_INT_CH1CC) != RESET)
  {
    /* Compute wFrequency and wDutyCycle                                                                    */

    /* Clear GPTM1 Capture compare interrupt pending bit                                                    */
    TM_ClearIntPendingBit(HT_GPTM0, TM_INT_CH1CC);

    /* Get the Input Capture value                                                                          */
    CaptureValue = TM_GetCaptureCompare1(HT_GPTM0) ;

    if (CaptureValue != 0)
    {
      u16 u16CaptureValue=CaptureValue;
      /* Duty cycle computation                                                                             */
      wDutyCycle = ((TM_GetCaptureCompare0(HT_GPTM0)) << 16) / CaptureValue;
      wDutyCycle *= 100;
      
      /* wFrequency computation.We want to get achieve three decimal places, so a magnification of 1000     */
      wFrequency = ((unsigned long long)SystemCoreClock * 1000)
        / (u16CaptureValue * u16Prescarler + SLAVE_RESTART_LATENCY);
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
