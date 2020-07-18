/*********************************************************************************************************//**
 * @file    CMP/ComparatorInterrupt/main.c
 * @version $Rev:: 3874         $
 * @date    $Date:: 2019-05-10 #$
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

/** @addtogroup ComparatorInterrupt
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CMP_Configuration(void);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  /* LED1 Init                                                                                              */
  HT32F_DVB_LEDInit(HT_LED1);

  CMP_Configuration();

  /* Enable CMP0                                                                                            */
  CMP_UnprotectConfig(HT_CMP0);
  CMP_Cmd(HT_CMP0, ENABLE);

  /* Infinite loop                                                                                          */
  while (1)
  {
  }

}

/*********************************************************************************************************//**
  * @brief  Comparator configuration.
  * @retval None
  ***********************************************************************************************************/
void CMP_Configuration(void)
{
  CMP_InitTypeDef CMP_IniStruct;

  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO  = 1;
  CKCUClock.Bit.CMP   = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  /* Config CMP0 pins function                                                                              */
  AFIO_GPxConfig(HTCFG_CP_AFIO_PORT, HTCFG_CP_AFIO_PIN , AFIO_MODE_3);

  /*--------------------------------------------------------------------------------------------------------*/
  /* Set CMP0 Control Reg:                                                                                  */
  /*  1. Setting comparator internal 6-bit/8-bit scaler reference voltage output.                           */
  /*  2. Setting scaler reference voltage source comes from VDDA.                                           */
  /*  3. Enable scaler for comparator voltage reference.                                                    */
  /*  4. Enable scaler output to CN pin.                                                                    */
  /*  5. Setting CVREF = 31 * (VDDA - VSSA) / ((2 ^ n) - 1), n represent the bits of the scaler             */
  /*--------------------------------------------------------------------------------------------------------*/

  CMP_UnprotectConfig(HT_CMP0);
  CMP_StructInit(&CMP_IniStruct);
  CMP_IniStruct.CMP_InvInputSelection = CMP_SCALER_CN_IN;
  CMP_IniStruct.CMP_ScalerSource      = CMP_SCALER_SRC_VDDA;
  CMP_IniStruct.CMP_ScalerEnable      = CMP_SCALER_ENABLE;
  CMP_IniStruct.CMP_ScalerOutputBuf   = CMP_SCALER_OBUF_ENABLE;
  CMP_Init(HT_CMP0, &CMP_IniStruct);

  /* CVREF = 31 * (VDDA - VSSA) / ((2 ^ n) - 1), n represent the bits of the scaler                         */
  CMP_SetScalerValue(HT_CMP0, 31);

  /* Setting CMP0's Interrupt                                                                               */
  CMP_IntConfig(HT_CMP0, CMP_INT_RE | CMP_INT_FE, ENABLE);

  /*Setting the specified CMP rising/falling edge detection.                                                */
  CMP_EdgeDetectConfig(HT_CMP0, CMP_RE_Detect | CMP_FE_Detect, ENABLE);

  #if (LIBCFG_NVIC_CMP_DAC)
  NVIC_EnableIRQ(COMP_DAC_IRQn);
  #else
  NVIC_EnableIRQ(COMP_IRQn);
  #endif
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
