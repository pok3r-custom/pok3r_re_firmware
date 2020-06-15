/*********************************************************************************************************//**
 * @file    DAC_Dual16/DAC_2CH_Convert/main.c
 * @version $Rev:: 3386         $
 * @date    $Date:: 2019-02-12 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup DAC_Dual16_example DAC_Dual16
  * @{
  */

/** @addtogroup DAC_2CH_Convert
  * @{
  */

/* Settings ------------------------------------------------------------------------------------------------*/
#define R_CHANNEL_OUT_MILLI_V        (1650)       /* 1.65v                                                  */
#define L_CHANNEL_OUT_MILLI_V        (1100)       /* 1.10v                                                  */

/* Private constants ---------------------------------------------------------------------------------------*/
#define R_CHANNEL_CONV_DATA          ((R_CHANNEL_OUT_MILLI_V * 65535)/3300)
#define L_CHANNEL_CONV_DATA          ((L_CHANNEL_OUT_MILLI_V * 65535)/3300)

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /* Enable peripherals clocks of DAC, AFIO                                                                 */
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.DAC        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Config AFIO mode as DAC function                                                                       */
  AFIO_GPxConfig(GPIO_PC, AFIO_PIN_1, AFIO_MODE_2);     /* PC1 set as R-channel Output                      */
  AFIO_GPxConfig(GPIO_PC, AFIO_PIN_2, AFIO_MODE_2);     /* PC2 set as L-channel Output                      */

  /* DAC data from software                                                                                 */
  DACD16_DataSourceConfig(HT_DACDUAL16, DAC_CH_R, DATA_FROM_UC);     /* R-channel's Data from software      */
  DACD16_DataSourceConfig(HT_DACDUAL16, DAC_CH_L, DATA_FROM_UC);     /* L-channel's Data from software      */

  /* Set DAC Data                                                                                           */
  DACD16_SetChannelData(HT_DACDUAL16, DAC_CH_R, R_CHANNEL_CONV_DATA);     /* R-channel Ouput 3.3v/2 = 1.65v */
  DACD16_SetChannelData(HT_DACDUAL16, DAC_CH_L, L_CHANNEL_CONV_DATA);     /* L-channel Ouput 3.3v/3 = 1.1v  */

  /* Start conversion                                                                                       */
  DACD16_SoftwareStartConvCmd(HT_DACDUAL16, DAC_CH_R);
  DACD16_SoftwareStartConvCmd(HT_DACDUAL16, DAC_CH_L);

  while (1);
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
