/*********************************************************************************************************//**
 * @file    MCTM/PWMOut_PDMA/main.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/
// <<< Use Configuration Wizard in Context Menu >>>

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32.h"
#include "ht32_board.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup MCTM_Examples MCTM
  * @{
  */

/** @addtogroup PWMOut_PDMA
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void PDMA_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
MCTM_TimeBaseInitTypeDef MCTM_TimeBaseInitStructure;
MCTM_OutputInitTypeDef MCTM_OutputInitStructure;
PDMACH_InitTypeDef PDMACH_InitStructure;

u32 CCR_Buffer[3] = {24576, 16384, 8192};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */

  PDMA_Configuration();               /* PDMA Related configure                                             */

  /* MCTM Time Base configuration                                                                           */
  MCTM_TimeBaseInitStructure.CounterReload = 32767;
  MCTM_TimeBaseInitStructure.Prescaler = 0;
  MCTM_TimeBaseInitStructure.RepetitionCounter = 2;
  MCTM_TimeBaseInitStructure.CounterMode = MCTM_CNT_MODE_UP;
  MCTM_TimeBaseInitStructure.PSCReloadTime = MCTM_PSC_RLD_IMMEDIATE;
  MCTM_TimeBaseInit(HT_MCTM1, &MCTM_TimeBaseInitStructure);

  /* MCTM Channel 0 output configuration                                                                    */
  MCTM_OutputInitStructure.Channel = MCTM_CH_0;
  MCTM_OutputInitStructure.OutputMode = MCTM_OM_PWM1;
  MCTM_OutputInitStructure.Control = MCTM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.ControlN = MCTM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.Polarity = MCTM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.PolarityN = MCTM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  MCTM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  MCTM_OutputInitStructure.Compare = 256;
  MCTM_OutputInit(HT_MCTM1, &MCTM_OutputInitStructure);

  /* MCTM Update Event 1 PDMA request enable                                                                */
  MCTM_PDMAConfig(HT_MCTM1, MCTM_PDMA_UEV1, ENABLE);

  /* MCTM Channel Main Output enable                                                                        */
  MCTM_CHMOECmd(HT_MCTM1, ENABLE);

  /* MCTM counter enable                                                                                    */
  MCTM_Cmd(HT_MCTM1, ENABLE);

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
//    <q12> I2C0   <q13> I2C1
//    <q23> I2S
//    <q22> SCI
//    <q14> SPI0   <q15> SPI1
//    <q18> UART0  <q19> UART1
//    <q16> USART0 <q17> USART1
//    <q3>  USB
//  </h>
//  <h> IO
//    <q7> GPIO Port A <q8>  GPIO Port B <q9>  GPIO Port C <q10>  GPIO Port D <q11>  GPIO Port E
//    <q20> AFIO
//    <q21> EXTI
//  </h>
//  <h> System
//    <q34> ADC
//    <q4>  CKREF
//    <q6>  CRC
//    <q32> OPA/CMP0 <q33> OPA/CMP1
//    <q2>  PDMA
//    <q27> PWRCU
//  </h>
//  <h> Timer
//    <q30> BFTM0 <q31> BFTM1
//    <q28> GPTM0 <q29> GPTM1
//    <q24> MCTM0 <q25> MCTM1
//    <q27> RTC   <q26> WDT
//  </h>
//</e>
*/
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.PDMA       = 1;
  CKCUClock.Bit.USBD       = 0;
  CKCUClock.Bit.CKREF      = 0;
  CKCUClock.Bit.EBI        = 0;
  CKCUClock.Bit.CRC        = 0;
  CKCUClock.Bit.PA         = 0;
  CKCUClock.Bit.PB         = 0;
  CKCUClock.Bit.PC         = 0;
  CKCUClock.Bit.PD         = 0;
  CKCUClock.Bit.PE         = 0;
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
  CKCUClock.Bit.SCI        = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 0;
  CKCUClock.Bit.MCTM1      = 1;
  CKCUClock.Bit.WDT        = 0;
  CKCUClock.Bit.BKP        = 0;
  CKCUClock.Bit.GPTM0      = 0;
  CKCUClock.Bit.GPTM1      = 0;
  CKCUClock.Bit.BFTM0      = 0;
  CKCUClock.Bit.BFTM1      = 0;
  CKCUClock.Bit.OPA0       = 0;
  CKCUClock.Bit.OPA1       = 0;
  CKCUClock.Bit.ADC        = 0;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif
}

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  /* Configure MCTM Channel output pin                                                                      */
  AFIO_GPEConfig(AFIO_PIN_1 | AFIO_PIN_2, AFIO_MODE_4);
}

/*********************************************************************************************************//**
  * @brief  Configure the PDMA.
  * @retval None
  ***********************************************************************************************************/
void PDMA_Configuration(void)
{
  /* PDMA configuration                                                                                     */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)CCR_Buffer;
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)&(HT_MCTM1->CH0CCR);
  PDMACH_InitStructure.PDMACH_BlkCnt = 3;
  PDMACH_InitStructure.PDMACH_BlkLen = 1;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = VH_PRIO;
  PDMACH_InitStructure.PDMACH_AdrMod = SRC_ADR_LIN_INC | DST_ADR_FIX | AUTO_RELOAD;
  PDMA_Config(PDMA_CH3, &PDMACH_InitStructure);

  /* Enable PDMA Channel 3                                                                                  */
  PDMA_EnaCmd(PDMA_CH3, ENABLE);
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
