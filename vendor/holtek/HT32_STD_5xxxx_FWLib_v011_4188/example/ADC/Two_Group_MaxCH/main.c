/*********************************************************************************************************//**
 * @file    ADC/Two_Group_MaxCH/main.c
 * @version $Rev:: 4033         $
 * @date    $Date:: 2019-07-12 #$
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

#include "adc_group.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup ADC_Examples ADC
  * @{
  */

/** @addtogroup Two_Group_MaxCH
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void ADC_Configuration(void);
void TM_Configuration(void);
void PDMA_Configuration(void);

void ADC_TriggerConfig_Software(void);
void ADC_TriggerConfig_TM(void);

void ADC_Test_MainRoutine(void);
void ADC_Test_MainRoutine_Softwre(void);
void ADC_Test_MainRoutine_TM(void);
void ADC_Test_ShowResult(void);

void ADC_Group_SoftwareStart(void);
void ADC_Group1Config(void);
void ADC_Group2Config(void);
void ADC_GroupProcess(void);

void NVIC_Configuration(void);
void CKCU_Configuration(void);
void SysTick_Configuration(void);

/* Global variables ----------------------------------------------------------------------------------------*/
vu32 uADCGroupState = 1;    // 0: Stop, 1: Group 1, 2: Group 2.
vu32 uADCGroupFinish = 0;   // 0: Not finish, 2: Finished.

u32 uADCData[16];

u32 uTimeTick500ms = 4;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  NVIC_Configuration();               /* NVIC configuration                                                 */
  CKCU_Configuration();               /* System Related configuration                                       */
  SysTick_Configuration();            /* SysTick configuration                                              */
  #if (ENABLE_DEBUG_PRINTF == 1)
  RETARGET_Configuration();           /* Retarget Related configuration                                     */
  #endif
  #if (ENABLE_DEBUG_IO == 1)
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  #endif

  ADC_Configuration();                /* ADC configuration                                                  */

  #if (ADC_GROUP_DATA_MODE == ADC_GROUP_DATA_MODE_DMA)
  PDMA_Configuration();
  #endif

  #if (ADC_GROUP_TRIGGER_MODE == ADC_GROUP_TRIGGER_MODE_SW)
  ADC_TriggerConfig_Software();
  #endif

  #if (ADC_GROUP_TRIGGER_MODE == ADC_GROUP_TRIGGER_MODE_TM)
  TM_Configuration();
  ADC_TriggerConfig_TM();
  #endif

  while (1)
  {
    ADC_Test_MainRoutine();
  }

}

/*********************************************************************************************************//**
  * @brief  Configure the ADC
  * @retval None
  ***********************************************************************************************************/
void ADC_Configuration(void)
{
  {
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
    CKCUClock.Bit.AFIO       = 1;
    CKCUClock.Bit.ADC        = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  /* Configure GPIO/AFIO mode as ADC function                                                               */
  AFIO_GPxConfig(HTCFG_ADCCH0_GPIO_ID, HTCFG_ADCCH0_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH1_GPIO_ID, HTCFG_ADCCH1_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH2_GPIO_ID, HTCFG_ADCCH2_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH3_GPIO_ID, HTCFG_ADCCH3_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH4_GPIO_ID, HTCFG_ADCCH4_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH5_GPIO_ID, HTCFG_ADCCH5_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH6_GPIO_ID, HTCFG_ADCCH6_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH7_GPIO_ID, HTCFG_ADCCH7_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH8_GPIO_ID, HTCFG_ADCCH8_AFIO_PIN, AFIO_FUN_ADC);
  AFIO_GPxConfig(HTCFG_ADCCH9_GPIO_ID, HTCFG_ADCCH9_AFIO_PIN, AFIO_FUN_ADC);
  //AFIO_GPxConfig(HTCFG_ADCCH10_GPIO_ID, HTCFG_ADCCH10_AFIO_PIN, AFIO_FUN_ADC);
  //AFIO_GPxConfig(HTCFG_ADCCH11_GPIO_ID, HTCFG_ADCCH11_AFIO_PIN, AFIO_FUN_ADC);
  //AFIO_GPxConfig(HTCFG_ADCCH12_GPIO_ID, HTCFG_ADCCH12_AFIO_PIN, AFIO_FUN_ADC);
  //AFIO_GPxConfig(HTCFG_ADCCH13_GPIO_ID, HTCFG_ADCCH13_AFIO_PIN, AFIO_FUN_ADC);
  //AFIO_GPxConfig(HTCFG_ADCCH14_GPIO_ID, HTCFG_ADCCH14_AFIO_PIN, AFIO_FUN_ADC);
  //AFIO_GPxConfig(HTCFG_ADCCH15_GPIO_ID, HTCFG_ADCCH15_AFIO_PIN, AFIO_FUN_ADC);

  /* ADCLK frequency is set to CK_AHB / 1                                                                   */
  #if (ENABLE_DEBUG_IO == 1)
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV64);
  #else
  CKCU_SetADCPrescaler(CKCU_ADCPRE_DIV3);
  #endif

  /* One Shot Mode                                                                                          */
  ADC_RegularGroupConfig(HT_ADC, ONE_SHOT_MODE, ADC_GROUP_LIST_LENGTH, 0);

  ADC_Group1Config();

  /* Set sampling time as 1.5 + 36 ADCCLK, Conversion = 12.5 + 1.5 + 36 = 50 ADCCLK                         */
  ADC_SamplingTimeConfig(HT_ADC, 36);

  /* Enable ADC cycle end of conversion interrupt                                                           */
  ADC_IntConfig(HT_ADC, ADC_INT_CYCLE_EOC, ENABLE);

  #if (ENABLE_DEBUG_IO == 1)
  ADC_IntConfig(HT_ADC, ADC_INT_SINGLE_EOC, ENABLE);
  #endif

  NVIC_EnableIRQ(ADC_IRQn);

  #if (ADC_GROUP_DATA_MODE == ADC_GROUP_DATA_MODE_DMA)
  /* Issue ADC DMA request when cycle end of conversion occur                                               */
  ADC_PDMAConfig(HT_ADC, ADC_PDMA_REGULAR_CYCLE, ENABLE);
  #endif

  ADC_Cmd(HT_ADC, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Timer Configuration.
  * @retval None
  ***********************************************************************************************************/
void TM_Configuration(void)
{
  TM_TimeBaseInitTypeDef TimeBaseInit;
  TM_OutputInitTypeDef OutInit;
  {
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
    CKCUClock.Bit.GPTM0      = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }

  /* Configure xxTM Channel 0 to trigger ADC start of conversion every 2 second                             */
  TimeBaseInit.CounterMode = TM_CNT_MODE_UP;
  TimeBaseInit.CounterReload = 40000 - 1;                 // 40000/20000 = 2 S;
  TimeBaseInit.Prescaler = (SystemCoreClock / 20000) - 1; // GPTM Clock is 20K
  TimeBaseInit.PSCReloadTime = TM_PSC_RLD_IMMEDIATE;
  TM_TimeBaseInit(HT_GPTM0, &TimeBaseInit);

  OutInit.Channel = TM_CH_0;
  OutInit.OutputMode = TM_OM_PWM2;
  OutInit.Control = TM_CHCTL_ENABLE;
  OutInit.Polarity = TM_CHP_NONINVERTED;
  OutInit.Compare = 20000 - 1;
  TM_OutputInit(HT_GPTM0, &OutInit);

  TM_IntConfig(HT_GPTM0, TM_INT_CH0CC, ENABLE);
  //NVIC_EnableIRQ(GPTM0_IRQn);
}

#if (LIBCFG_PDMA)
/*********************************************************************************************************//**
  * @brief  Configure PDMA for ADC data.
  * @retval None
  ***********************************************************************************************************/
void PDMA_Configuration(void)
{
  PDMACH_InitTypeDef PDMACH_InitStructure;
  {
    CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
    CKCUClock.Bit.PDMA      = 1;
    CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }
  /* Configure PDMA channel to move ADC result from ADC->DR[0] to SRAM                                      */
  PDMACH_InitStructure.PDMACH_SrcAddr = (u32)&HT_ADC->DR[0];
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)uADCData;
  PDMACH_InitStructure.PDMACH_BlkCnt = 2;
  PDMACH_InitStructure.PDMACH_BlkLen = ADC_GROUP_LIST_LENGTH;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = VH_PRIO;
  PDMACH_InitStructure.PDMACH_AdrMod = SRC_ADR_CIR_INC | DST_ADR_LIN_INC | AUTO_RELOAD;
  PDMA_Config(PDMA_CH0, &PDMACH_InitStructure);
  PDMA_EnaCmd(PDMA_CH0, ENABLE);

  PDMA_IntConfig(PDMA_CH0, (PDMA_INT_GE | PDMA_INT_TC), ENABLE);

  NVIC_EnableIRQ(PDMACH0_1_IRQn);
}
#endif

/*********************************************************************************************************//**
  * @brief  Configure ADC trigger source as software.
  * @retval None
  ***********************************************************************************************************/
void ADC_TriggerConfig_Software(void)
{
  ADC_RegularTrigConfig(HT_ADC, ADC_TRIG_SOFTWARE);
}

/*********************************************************************************************************//**
  * @brief  Configure ADC trigger source as Timer.
  * @retval None
  ***********************************************************************************************************/
void ADC_TriggerConfig_TM(void)
{
  ADC_RegularTrigConfig(HT_ADC, ADC_TRIGGER_TM_SOURCE);
  TM_Cmd(HT_GPTM0, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  ADC group main routine
  * @retval None
  ***********************************************************************************************************/
void ADC_Test_MainRoutine(void)
{
  #if (ADC_GROUP_TRIGGER_MODE == ADC_GROUP_TRIGGER_MODE_SW)
  ADC_Test_MainRoutine_Softwre();
  #endif

  #if (ADC_GROUP_TRIGGER_MODE == ADC_GROUP_TRIGGER_MODE_TM)
  ADC_Test_MainRoutine_TM();
  #endif
}

/*********************************************************************************************************//**
  * @brief  ADC Group main routine - Software trigger every 2 second and show the result.
  * @retval None
  ***********************************************************************************************************/
void ADC_Test_MainRoutine_Softwre(void)
{
  if (uTimeTick500ms >= 4)
  {
    uTimeTick500ms = 0;

    ADC_Group_SoftwareStart();
  }

  if (uADCGroupFinish == ADC_GROUP_FINISH)
  {
    uADCGroupFinish = 0;
    ADC_Test_ShowResult();
  }
}

/*********************************************************************************************************//**
  * @brief  ADC Group main routine - Timer trigger every 2 second and show the result.
  * @retval None
  ***********************************************************************************************************/
void ADC_Test_MainRoutine_TM(void)
{
  if (uADCGroupFinish == ADC_GROUP_FINISH)
  {
    uADCGroupFinish = 0;
    ADC_Test_ShowResult();
  }
}

/*********************************************************************************************************//**
  * @brief  Show ADC Result.
  * @retval None
  ***********************************************************************************************************/
void ADC_Test_ShowResult(void)
{
  uADCData[0] &= 0x00000FFF;
  uADCData[1] &= 0x00000FFF;
  uADCData[2] &= 0x00000FFF;
  uADCData[3] &= 0x00000FFF;
  uADCData[4] &= 0x00000FFF;
  uADCData[5] &= 0x00000FFF;
  uADCData[6] &= 0x00000FFF;
  uADCData[7] &= 0x00000FFF;
  uADCData[8] &= 0x00000FFF;
  uADCData[9] &= 0x00000FFF;
  uADCData[10] &= 0x00000FFF;
  uADCData[11] &= 0x00000FFF;
  uADCData[12] &= 0x00000FFF;
  uADCData[13] &= 0x00000FFF;
  uADCData[14] &= 0x00000FFF;
  uADCData[15] &= 0x00000FFF;

  #if (ENABLE_DEBUG_PRINTF == 1)
  printf("\r\nADC Result\r\n");
  printf("ADC Data0 = %d\r\n", uADCData[0]);
  printf("ADC Data1 = %d\r\n", uADCData[1]);
  printf("ADC Data2 = %d\r\n", uADCData[2]);
  printf("ADC Data3 = %d\r\n", uADCData[3]);
  printf("ADC Data4 = %d\r\n", uADCData[4]);
  printf("ADC Data5 = %d\r\n", uADCData[5]);
  printf("ADC Data6 = %d\r\n", uADCData[6]);
  printf("ADC Data7 = %d\r\n", uADCData[7]);
  printf("ADC Data8 = %d\r\n", uADCData[8]);
  printf("ADC Data9 = %d\r\n", uADCData[9]);
  printf("ADC Data10 = %d\r\n", uADCData[10]);
  printf("ADC Data11 = %d\r\n", uADCData[11]);
  printf("ADC Data12 = %d\r\n", uADCData[12]);
  printf("ADC Data13 = %d\r\n", uADCData[13]);
  printf("ADC Data14 = %d\r\n", uADCData[14]);
  printf("ADC Data15 = %d\r\n", uADCData[15]);
  #endif
}

/*********************************************************************************************************//**
  * @brief  Software trigger of ADC Group
  * @retval None
  ***********************************************************************************************************/
void ADC_Group_SoftwareStart(void)
{
  uADCGroupFinish = 0;
  ADC_SoftwareStartConvCmd(HT_ADC, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Configure ADC conversion list as group 1.
  * @retval None
  ***********************************************************************************************************/
void ADC_Group1Config(void)
{
  HT_ADC->LST[0] = (ADC_GROUP1_LIST0 << 0)  | \
                   (ADC_GROUP1_LIST1 << 8)  | \
                   (ADC_GROUP1_LIST2 << 16) | \
                   (ADC_GROUP1_LIST3 << 24);
  HT_ADC->LST[1] = (ADC_GROUP1_LIST4 << 0)  | \
                   (ADC_GROUP1_LIST5 << 8)  | \
                   (ADC_GROUP1_LIST6 << 16) | \
                   (ADC_GROUP1_LIST7 << 24);

  HT_ADC->CR &= ~(0x00070700);
  HT_ADC->CR |= ((u32)(0 - 1) << 16) | ((u32)(ADC_GROUP_LIST_LENGTH - 1) << 8);

  #if 0
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST0, 0);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST1, 1);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST2, 2);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST3, 3);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST4, 4);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST5, 5);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST6, 6);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP1_LIST7, 7);
  ADC_RegularGroupConfig(HT_ADC, ONE_SHOT_MODE, ADC_GROUP_LIST_LENGTH, 0);
  #endif
}

/*********************************************************************************************************//**
  * @brief  Configure ADC conversion list as group 2.
  * @retval None
  ***********************************************************************************************************/
void ADC_Group2Config(void)
{
  HT_ADC->LST[0] = (ADC_GROUP2_LIST0 << 0)  | \
                   (ADC_GROUP2_LIST1 << 8)  | \
                   (ADC_GROUP2_LIST2 << 16) | \
                   (ADC_GROUP2_LIST3 << 24);
  HT_ADC->LST[1] = (ADC_GROUP2_LIST4 << 0)  | \
                   (ADC_GROUP2_LIST5 << 8)  | \
                   (ADC_GROUP2_LIST6 << 16) | \
                   (ADC_GROUP2_LIST7 << 24);

  HT_ADC->CR &= ~(0x00070700);
  HT_ADC->CR |= ((u32)(0 - 1) << 16) | ((u32)(ADC_GROUP_LIST_LENGTH - 1) << 8);

  #if 0
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST0, 0);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST1, 1);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST2, 2);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST3, 3);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST4, 4);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST5, 5);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST6, 6);
  ADC_RegularChannelConfig(HT_ADC, ADC_GROUP2_LIST7, 7);
  ADC_RegularGroupConfig(HT_ADC, ONE_SHOT_MODE, ADC_GROUP_LIST_LENGTH, 0);
  #endif
}

/*********************************************************************************************************//**
  * @brief  ADC Grpup process of Interrupt Handler (CPU reads ADC result).
  * @retval None
  ***********************************************************************************************************/
void ADC_GroupProcess(void)
{
  #if (ENABLE_DEBUG_IO == 1)
  if (ADC_GetFlagStatus(HT_ADC, ADC_FLAG_SINGLE_EOC))
  {
    ADC_ClearIntPendingBit(HT_ADC, ADC_FLAG_SINGLE_EOC);
    HT32F_DVB_LEDToggle(HT_LED2);
    //HT_GPIOA->DOUTR ^= (1 << 14);
  }
  #endif

  if (ADC_GetFlagStatus(HT_ADC, ADC_FLAG_CYCLE_EOC))
  {
    ADC_ClearIntPendingBit(HT_ADC, ADC_FLAG_CYCLE_EOC);
    if (uADCGroupState == 1)
    {
      uADCGroupState = 2;

      #if (ADC_GROUP_DATA_MODE == ADC_GROUP_DATA_MODE_CPU)
      uADCData[0] = HT_ADC->DR[0];
      uADCData[1] = HT_ADC->DR[1];
      uADCData[2] = HT_ADC->DR[2];
      uADCData[3] = HT_ADC->DR[3];
      uADCData[4] = HT_ADC->DR[4];
      uADCData[5] = HT_ADC->DR[5];
      uADCData[6] = HT_ADC->DR[6];
      uADCData[7] = HT_ADC->DR[7];
      #endif

      ADC_Group2Config();

      // Trigger ADC by Software when group 1 conversion is finished
      ADC_RegularTrigConfig(HT_ADC, ADC_TRIG_SOFTWARE);
      ADC_SoftwareStartConvCmd(HT_ADC, ENABLE);
    }
    else
    {
      uADCGroupState = 1;

      #if (ADC_GROUP_DATA_MODE == ADC_GROUP_DATA_MODE_CPU)
      uADCData[8] = HT_ADC->DR[0];
      uADCData[9] = HT_ADC->DR[1];
      uADCData[10] = HT_ADC->DR[2];
      uADCData[11] = HT_ADC->DR[3];
      uADCData[12] = HT_ADC->DR[4];
      uADCData[13] = HT_ADC->DR[5];
      uADCData[14] = HT_ADC->DR[6];
      uADCData[15] = HT_ADC->DR[7];			

      uADCGroupFinish = ADC_GROUP_FINISH;
      #endif

      ADC_Group1Config();

      // Restore the trigger sourrce when group 2 conversion is finished
      #if (ADC_GROUP_TRIGGER_MODE == ADC_GROUP_TRIGGER_MODE_TM)
      ADC_RegularTrigConfig(HT_ADC, ADC_TRIGGER_TM_SOURCE);
      #endif

      #if (ENABLE_DEBUG_IO == 1)
      HT32F_DVB_LEDToggle(HT_LED1);
      #endif
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, 0x0);     /* Set the Vector Table base location at 0x00000000   */
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
  CKCUClock.Bit.USART0     = 1;
  CKCUClock.Bit.USART1     = 1;
  CKCUClock.Bit.UART0      = 1;
  CKCUClock.Bit.UART1      = 1;
  CKCUClock.Bit.AFIO       = 0;
  CKCUClock.Bit.EXTI       = 0;
  CKCUClock.Bit.SCI0       = 0;
  CKCUClock.Bit.SCI1       = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 0;
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
  * @brief  SysTick Configuration.
  * @retval R1DESCRIPTION
  ***********************************************************************************************************/
void SysTick_Configuration(void)
{
  SYSTICK_ClockSourceConfig(SYSTICK_SRC_STCLK);         /* Default : CK_SYS/8                               */
  SYSTICK_SetReloadValue(SystemCoreClock / 8 / 2);      /* (CK_SYS/8/2) = 500ms                             */
  SYSTICK_IntConfig(ENABLE);                            /* Enable SYSTICK Interrupt                         */
  SYSTICK_CounterCmd(SYSTICK_COUNTER_CLEAR);
  SYSTICK_CounterCmd(SYSTICK_COUNTER_ENABLE);
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

/* Private functions ---------------------------------------------------------------------------------------*/


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
