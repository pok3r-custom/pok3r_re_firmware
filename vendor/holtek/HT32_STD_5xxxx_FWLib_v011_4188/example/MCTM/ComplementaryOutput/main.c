/*********************************************************************************************************//**
 * @file    MCTM/ComplementaryOutput/main.c
 * @version $Rev:: 2320         $
 * @date    $Date:: 2017-12-11 #$
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
// <<< Use Configuration Wizard in Context Menu >>>

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup MCTM_Examples MCTM
  * @{
  */

/** @addtogroup ComplementaryOutput
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void GPIO_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
TM_TimeBaseInitTypeDef MCTM_TimeBaseInitStructure;
TM_OutputInitTypeDef MCTM_OutputInitStructure;
MCTM_CHBRKCTRInitTypeDef MCTM_CHBRKCTRInitStructure;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */

  /* MCTM Time Base configuration                                                                           */
  MCTM_TimeBaseInitStructure.CounterReload = HTCFG_MCTM_RELOAD - 1;
  MCTM_TimeBaseInitStructure.Prescaler = 0;
  MCTM_TimeBaseInitStructure.RepetitionCounter = 0;
  MCTM_TimeBaseInitStructure.CounterMode = TM_CNT_MODE_UP;
  MCTM_TimeBaseInitStructure.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_MCTM0, &MCTM_TimeBaseInitStructure);

  /* MCTM Channel 0, 1, 2 output configuration                                                              */
  MCTM_OutputInitStructure.Channel = TM_CH_0;
  MCTM_OutputInitStructure.OutputMode = TM_OM_PWM1;
  MCTM_OutputInitStructure.Control = TM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.ControlN = TM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.Polarity = TM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.PolarityN = TM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  MCTM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  MCTM_OutputInitStructure.Compare = HTCFG_MCTM_RELOAD * 3 / 4;
  TM_OutputInit(HT_MCTM0, &MCTM_OutputInitStructure);

  MCTM_OutputInitStructure.Channel = TM_CH_1;
  MCTM_OutputInitStructure.Compare = HTCFG_MCTM_RELOAD * 1 / 2;
  TM_OutputInit(HT_MCTM0, &MCTM_OutputInitStructure);

  MCTM_OutputInitStructure.Channel = TM_CH_2;
  MCTM_OutputInitStructure.Compare = HTCFG_MCTM_RELOAD * 1 / 4;
  TM_OutputInit(HT_MCTM0, &MCTM_OutputInitStructure);

  /* MCTM Off State, lock, Break, Automatic Output enable, dead time configuration                          */
  MCTM_CHBRKCTRInitStructure.OSSRState = MCTM_OSSR_STATE_ENABLE;
  MCTM_CHBRKCTRInitStructure.OSSIState = MCTM_OSSI_STATE_ENABLE;
  MCTM_CHBRKCTRInitStructure.LockLevel = MCTM_LOCK_LEVEL_2;
  MCTM_CHBRKCTRInitStructure.Break0 = MCTM_BREAK_ENABLE;
  MCTM_CHBRKCTRInitStructure.Break0Polarity = MCTM_BREAK_POLARITY_LOW;
  MCTM_CHBRKCTRInitStructure.AutomaticOutput = MCTM_CHAOE_ENABLE;
  MCTM_CHBRKCTRInitStructure.DeadTime = HTCFG_MCTM_DEAD_TIME;
  MCTM_CHBRKCTRInitStructure.BreakFilter = 0;
  MCTM_CHBRKCTRConfig(HT_MCTM0, &MCTM_CHBRKCTRInitStructure);

  /* MCTM counter enable                                                                                    */
  TM_Cmd(HT_MCTM0, ENABLE);

  /* MCTM Channel Main Output enable                                                                        */
  MCTM_CHMOECmd(HT_MCTM0, ENABLE);


  while (1);
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
/*
//<e0> Enable Peripheral Clock
//  <h> Communication
//    <q5> EBI
//    <q11> I2C0   <q12> I2C1
//    <q23> I2S
//    <q21> SCI0 <q22> SCI1
//    <q13> SPI0   <q14> SPI1
//    <q17> UART0  <q18> UART1
//    <q15> USART0 <q16> USART1
//    <q3>  USB
//  </h>
//  <h> IO
//    <q7> GPIO Port A <q8>  GPIO Port B <q9>  GPIO Port C <q10>  GPIO Port D
//    <q19> AFIO
//    <q20> EXTI
//  </h>
//  <h> System
//    <q32> ADC
//    <q4>  CKREF
//    <q6>  CRC
//    <q31> CMP
//    <q2>  PDMA
//    <q26> PWRCU
//  </h>
//  <h> Timer
//    <q29> BFTM0 <q30> BFTM1
//    <q33> SCTM0 <q34> SCTM1 <q35> SCTM2 <q36> SCTM3
//    <q27> GPTM0 <q28> GPTM1
//    <q24> MCTM0
//    <q26> RTC   <q25> WDT
//  </h>
//</e>
*/
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.PDMA       = 0;
  CKCUClock.Bit.USBD       = 0;
  CKCUClock.Bit.CKREF      = 0;
  CKCUClock.Bit.EBI        = 0;
  CKCUClock.Bit.CRC        = 0;
  CKCUClock.Bit.PA         = 0;
  CKCUClock.Bit.PB         = 0;
  CKCUClock.Bit.PC         = 0;
  CKCUClock.Bit.PD         = 0;
  CKCUClock.Bit.I2C0       = 0;
  CKCUClock.Bit.I2C1       = 0;
  CKCUClock.Bit.SPI0       = 0;
  CKCUClock.Bit.SPI1       = 0;
  CKCUClock.Bit.USART0     = 0;
  CKCUClock.Bit.USART1     = 0;
  CKCUClock.Bit.UART0      = 0;
  CKCUClock.Bit.UART1      = 0;
  CKCUClock.Bit.AFIO       = 1;
  CKCUClock.Bit.EXTI       = 0;
  CKCUClock.Bit.SCI0       = 0;
  CKCUClock.Bit.SCI1       = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 1;
  CKCUClock.Bit.WDT        = 0;
  CKCUClock.Bit.BKP        = 0;
  CKCUClock.Bit.GPTM0      = 0;
  CKCUClock.Bit.GPTM1      = 0;
  CKCUClock.Bit.BFTM0      = 0;
  CKCUClock.Bit.BFTM1      = 0;
  CKCUClock.Bit.CMP        = 0;
  CKCUClock.Bit.ADC        = 0;
  CKCUClock.Bit.SCTM0      = 0;
  CKCUClock.Bit.SCTM1      = 0;
  CKCUClock.Bit.SCTM2      = 0;
  CKCUClock.Bit.SCTM3      = 0;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif
}

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  /* Configure MCTM Channel 0 output pin                                                                    */
  AFIO_GPxConfig(HTCFG_MCTM_CHANNED0_GPIO_ID, HTCFG_MCTM_CHANNED0_AFIO_PIN, AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CHANNED0N_GPIO_ID, HTCFG_MCTM_CHANNED0N_AFIO_PIN, AFIO_MODE_4);
  /* Configure MCTM Channel 1 output pin                                                                    */
  AFIO_GPxConfig(HTCFG_MCTM_CHANNED1_GPIO_ID, HTCFG_MCTM_CHANNED1_AFIO_PIN, AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CHANNED1N_GPIO_ID, HTCFG_MCTM_CHANNED1N_AFIO_PIN, AFIO_MODE_4);
  /* Configure MCTM Channel 2 output pin                                                                    */
  AFIO_GPxConfig(HTCFG_MCTM_CHANNED2_GPIO_ID, HTCFG_MCTM_CHANNED2_AFIO_PIN, AFIO_MODE_4);
  AFIO_GPxConfig(HTCFG_MCTM_CHANNED2N_GPIO_ID, HTCFG_MCTM_CHANNED2N_AFIO_PIN, AFIO_MODE_4);

  /* Configure MCTM Break pin                                                                               */
  AFIO_GPxConfig(HTCFG_MCTM_BREAK_GPIO_ID, HTCFG_MCTM_BREAK_AFIO_PIN, AFIO_MODE_4);
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
