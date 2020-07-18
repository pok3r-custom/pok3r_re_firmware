/*********************************************************************************************************//**
 * @file    CMP/InternalReference/main.c
 * @version $Rev:: 551          $
 * @date    $Date:: 2017-07-17 #$
 * @brief   Main program.
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

/** @addtogroup CMP_Examples CMP
  * @{
  */

/** @addtogroup InternalReference
  * @{
  */


/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CMP_InitTypeDef    CMPInit;

  /* Enable AFIO and CMP PCLK                                                                               */
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.CMP        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  HT32F_DVB_LEDInit(HT_LED1);

  /* Config CMP1 pins function                                                                              */
  AFIO_GPxConfig(GPIO_PB, AFIO_PIN_9 | AFIO_PIN_10 | AFIO_PIN_11, AFIO_MODE_3);

  /* Config CMP1 interrupt function                                                                         */
  CMP_EdgeDetectConfig(HT_CMP1, (CMP_RE_Detect | CMP_FE_Detect), ENABLE);
  CMP_IntConfig(HT_CMP1, CMP_INT_RE, ENABLE);
  CMP_IntConfig(HT_CMP1, CMP_INT_FE, ENABLE);
  NVIC_EnableIRQ(COMP_IRQn);

  /* Config Scaler for CMP                                                                                  */
  CMP_SetScalerValue(HT_CMP1, 0x20);

  /* Disable protect for CMP                                                                                */
  CMP_UnprotectConfig(HT_CMP1);

  /* Config Init for CMP                                                                                    */
  CMPInit.CMP_Wakeup = CMP_WUP_DISABLE;
  CMPInit.CMP_OutputSelection = CMP_TRIG_NONE;
  CMPInit.CMP_ScalerSource = CMP_SCALER_SRC_VDDA;
  CMPInit.CMP_ScalerOutputBuf = CMP_SCALER_OBUF_ENABLE;
  CMPInit.CMP_ScalerEnable = CMP_SCALER_ENABLE;
  CMPInit.CMP_CoutSync = CMP_ASYNC_OUTPUT;
  CMPInit.CMP_OutputPol = CMP_NONINV_OUTPUT;
  CMPInit.CMP_InvInputSelection = CMP_SCALER_CN_IN;
  CMPInit.CMP_Hysteresis = CMP_HIGH_HYSTERESIS;
  CMPInit.CMP_Speed = CMP_LOW_SPEED;
  CMP_Init(HT_CMP1, &CMPInit);

  /* Note: You need to be unprotect CMP before write CR register every time                                 */
  CMP_UnprotectConfig(HT_CMP1);
  CMP_Cmd(HT_CMP1, ENABLE);

  while (1)                           /* Infinite loop                                                      */
  {
  }
}

#if (HT32_LIB_DEBUG == 1)
/*********************************************************************************************************//**
  * @brief  Report both the error name of the source file and the source line number.
  * @param  filename: pointer to the source file name.
  * @param  uline: error line source number.
  * @retval None
  ***********************************************************************************************************/
void assert_error(u8* filename, u32 uline)
{
  /*
     This function is called by IP library that the invalid parameters has been passed to the library API.
     Debug message can be added here.
     Example: printf("Parameter Error: file %s on line %d\r\n", filename, uline);
  */

  while (1)
  {
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
