/*********************************************************************************************************//**
 * @file    TM/PWMOut_PDMA/main.c
 * @version $Rev:: 2457         $
 * @date    $Date:: 2017-12-26 #$
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

/** @addtogroup TM_Examples TM
  * @{
  */

/** @addtogroup PWMOut_PDMA
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void GPIO_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
TM_TimeBaseInitTypeDef MCTM_TimeBaseInitStructure;
TM_OutputInitTypeDef MCTM_OutputInitStructure;
//MCTM_CHBRKCTRInitTypeDef MCTM_CHBRKCTRInitStructure;
PDMACH_InitTypeDef PDMACH_InitStructure;
void PDMA_Configuration(void);
u32 CCR_Buffer[3] = {HTCFG_MCTM_RELOAD * 1 / 2, HTCFG_MCTM_RELOAD * 1 / 4, HTCFG_MCTM_RELOAD * 3 / 4};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */
  PDMA_Configuration();
  /* MCTM/GPTM Time Base configuration                                                                           */
  MCTM_TimeBaseInitStructure.CounterReload = HTCFG_MCTM_RELOAD-1;
  MCTM_TimeBaseInitStructure.Prescaler = 0;
  MCTM_TimeBaseInitStructure.RepetitionCounter = 2;
  MCTM_TimeBaseInitStructure.CounterMode = TM_CNT_MODE_UP;
  MCTM_TimeBaseInitStructure.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HTCFG_MCTM_CHANNEL0, &MCTM_TimeBaseInitStructure);

  /* MCTM/GPTM  Channel 0 output configuration                                                                    */
  MCTM_OutputInitStructure.Channel = TM_CH_0;
  MCTM_OutputInitStructure.OutputMode = TM_OM_PWM1;
  MCTM_OutputInitStructure.Control = TM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.ControlN = TM_CHCTL_ENABLE;
  MCTM_OutputInitStructure.Polarity = TM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.PolarityN = TM_CHP_NONINVERTED;
  MCTM_OutputInitStructure.IdleState = MCTM_OIS_LOW;
  MCTM_OutputInitStructure.IdleStateN = MCTM_OIS_HIGH;
  MCTM_OutputInitStructure.Compare = 0;
  TM_OutputInit(HTCFG_MCTM_CHANNEL0, &MCTM_OutputInitStructure);

  /* MCTM/GPTM  Update Event PDMA request enable                                                                  */
  TM_PDMAConfig(HTCFG_MCTM_CHANNEL0, TM_PDMA_UEV, ENABLE);
  /* MCTM/GPTM  counter enable                                                                                    */
  TM_Cmd(HTCFG_MCTM_CHANNEL0, ENABLE);
#if defined(HT_MCTM0)
  /* MCTM/GPTM  Channel Main Output enable                                                                        */
  MCTM_CHMOECmd(HTCFG_MCTM_CHANNEL0, ENABLE);
#endif

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
//    <q21> I2S
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
//    <q29> ADC
//    <q4>  CKREF
//    <q6>  CRC
//    <q2>  PDMA
//    <q24> PWRCU
//  </h>
//  <h> Timer
//    <q27> BFTM0 <q28> BFTM1
//    <q30> PWM0 <q31> PWM1
//    <q25> GPTM0 <q26> GPTM1
//    <q22> MCTM0
//    <q24> RTC   <q23> WDT
//  </h>
//</e>
*/
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.PDMA       = 1;
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
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 1;
  CKCUClock.Bit.WDT        = 0;
  CKCUClock.Bit.BKP        = 0;
  CKCUClock.Bit.GPTM0      = 1;
  CKCUClock.Bit.GPTM1      = 0;
  CKCUClock.Bit.BFTM0      = 0;
  CKCUClock.Bit.BFTM1      = 0;
  CKCUClock.Bit.ADC        = 0;
  CKCUClock.Bit.PWM0       = 0;
  CKCUClock.Bit.PWM1       = 0;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif
}

/*********************************************************************************************************//**
  * @brief  Configures the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  /* Configure MCTM Channel 0 output pin                                                                    */
  AFIO_GPxConfig(HTCFG_MCTM_CHANNEL0_GPIO_ID, HTCFG_MCTM_CHANNEL0_AFIO_PIN, AFIO_MODE_4);
}
/*********************************************************************************************************//**
  * @brief  Configure the PDMA.
  * @retval None
  ***********************************************************************************************************/
void PDMA_Configuration(void)
{
  /* PDMA configuration                                                                                     */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)CCR_Buffer;
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)&(HTCFG_MCTM_CHANNEL0->CH0CCR);
  PDMACH_InitStructure.PDMACH_BlkCnt = 3;
  PDMACH_InitStructure.PDMACH_BlkLen = 1;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = VH_PRIO;
  PDMACH_InitStructure.PDMACH_AdrMod = SRC_ADR_LIN_INC | DST_ADR_FIX | AUTO_RELOAD;
  PDMA_Config(HTCFG_PDMA_CH, &PDMACH_InitStructure);

  /* Enable PDMA Channel 5                                                                                  */
  PDMA_EnaCmd(HTCFG_PDMA_CH, ENABLE);
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
