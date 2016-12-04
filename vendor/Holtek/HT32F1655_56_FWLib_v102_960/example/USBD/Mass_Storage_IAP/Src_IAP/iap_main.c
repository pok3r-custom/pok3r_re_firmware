/*********************************************************************************************************//**
 * @file    USBD/Mass_Storage_IAP/Src_IAP/iap_main.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   The main program of USB Device Mass Storage IAP example.
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
#include "ht32_board.h"
#include "ht32_usbd_core.h"
#include "iap_ht32_usbd_class.h"
#include "iap_ht32_usbd_descriptor.h"
#include "iap_handler.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup USBD_Examples USBD
  * @{
  */

/** @addtogroup USBD_Mass_Storage_IAP USBD Mass Storage IAP
  * @{
  */

/** @addtogroup Mass_Storage_IAP IAP
  * @{
  */


/* Global variables ----------------------------------------------------------------------------------------*/
__ALIGN4 USBDCore_TypeDef gUSBCore;
USBD_Driver_TypeDef gUSBDriver;
u32 gIsLowPowerAllowed = TRUE;

/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void Suspend(u32 uPara);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_Configuration();               /* System Related configuration                                       */

  /*--------------------------------------------------------------------------------------------------------*/
  /* Use BOOT0 to decide start user application or IAP mode.                                                */
  /* Modify it if you want to use another GPIO pin.                                                         */
  /*--------------------------------------------------------------------------------------------------------*/
  #if 1
  if ((HT_FLASH->VMCR & 0x1) == 0x1)     /* The value of BOOT0 will be sampled to the VMCR                  */
                                         /* register of FMC after reset.                                    */
  #else
  /*--------------------------------------------------------------------------------------------------------*/
  /* Example that using Key1 to decide start user application or IAP mode.                                  */
  /* Key1 = Release: User application, Key1 = Pressed: IAP mode,                                            */
  /*--------------------------------------------------------------------------------------------------------*/
  GPIO_DirectionConfig(KEY1_BUTTON_GPIO_PORT, KEY1_BUTTON_GPIO_PIN, GPIO_DIR_IN);
  GPIO_InputConfig(KEY1_BUTTON_GPIO_PORT, KEY1_BUTTON_GPIO_PIN, ENABLE);
  if (GPIO_ReadInBit(KEY1_BUTTON_GPIO_PORT , KEY1_BUTTON_GPIO_PIN))
  #endif
  {
    /*------------------------------------------------------------------------------------------------------*/
    /* Check the register of FMC to decide start user application or IAP mode. User's application can       */
    /* set SBVT1 as BOOT_MODE_IAP and trigger a reset to start IAP mode. SBVT registers only reset by       */
    /* Power-on-reset.                                                                                      */
    /*------------------------------------------------------------------------------------------------------*/
    if (HT_FLASH->SBVT[1] != BOOT_MODE_IAP)
    {
      /*----------------------------------------------------------------------------------------------------*/
      /* Start user application when                                                                        */
      /*   1. GPIO = 1 and                                                                                  */
      /*   2. SBVT != BOOT_MODE_IAP and                                                                     */
      /*   3. SP and PC of user's application is in range                                                   */
      /*----------------------------------------------------------------------------------------------------*/
      IAP_Go(IAP_FLASH_START);        /* Never returned except SP or PC is not in range                     */
    }
  }

  /*--------------------------------------------------------------------------------------------------------*/
  /* Start IAP mode                                                                                         */
  /*   1. GPIO = 0 or                                                                                       */
  /*   2. SBVT == BOOT_MODE_IAP                                                                             */
  /*--------------------------------------------------------------------------------------------------------*/

  USBDDesc_Init(&gUSBCore.Device.Desc);

  gUSBCore.pDriver = (u32 *)&gUSBDriver;

  gUSBCore.Power.CallBack_Suspend.func  = Suspend;
  //gUSBCore.Power.CallBack_Suspend.uPara = (u32)NULL;

  USBDClass_Init(&gUSBCore.Class);

  USBDCore_Init(&gUSBCore);

  NVIC_EnableIRQ(USB_IRQn);

  HT32F_DVB_USBConnect();

  while (1)
  {
    USBDCore_MainRoutine(&gUSBCore);
    IAP_Handler();
  }
}

/*********************************************************************************************************//**
  * @brief  Check AP is valid or not.
  * @retval FALSE or TRUE
  ***********************************************************************************************************/
u32 IAP_isAPValid(void)
{
  u32 SP, PC;
  u32 uResult = TRUE;

  /* Check Stack Point in range                                                                             */
  SP = rw(IAP_FLASH_START);
  if (SP < IAP_SRAM_START || SP > IAP_SRAM_END)
  {
    uResult = FALSE;
  }

  /* Check PC in range                                                                                      */
  PC = rw(IAP_FLASH_START + 0x4);
  if (PC < IAP_FLASH_START || PC > IAP_FLASH_END)
  {
    uResult = FALSE;
  }

  return uResult;
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
  CKCUClock.Bit.PDMA       = 0;
  CKCUClock.Bit.USBD       = 1;
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
  CKCUClock.Bit.EXTI       = 1;
  CKCUClock.Bit.SCI        = 0;
  CKCUClock.Bit.I2S        = 0;
  CKCUClock.Bit.MCTM0      = 0;
  CKCUClock.Bit.MCTM1      = 0;
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

  /*--------------------------------------------------------------------------------------------------------*/
  /* Set USB Clock as PLL / 3                                                                               */
  /*--------------------------------------------------------------------------------------------------------*/
  CKCU_SetUSBPrescaler(CKCU_USBPRE_DIV3);

}

/*********************************************************************************************************//**
  * @brief  Suspend call back function which enter DeepSleep1
  * @param  uPara: Parameter for Call back function
  * @retval None
  ***********************************************************************************************************/
void Suspend(u32 uPara)
{
  u32 IsRemoteWakeupAllowed;

  if (gIsLowPowerAllowed)
  {
    /* Disable EXTI interrupt to prevent interrupt occurred after wakeup                                    */
    EXTI_IntConfig(EXTI_CHANNEL_1, DISABLE);
    IsRemoteWakeupAllowed = USBDCore_GetRemoteWakeUpFeature(&gUSBCore);

    if (IsRemoteWakeupAllowed == TRUE)
    {
      /* Enable EXTI wake event and clear wakeup flag                                                       */
      EXTI_WakeupEventConfig(EXTI_CHANNEL_1, EXTI_WAKEUP_LOW_LEVEL, ENABLE);
      EXTI_ClearWakeupFlag(EXTI_CHANNEL_1);
    }

    __DBG_USBPrintf("%06ld >DEEPSLEEP\r\n", ++__DBG_USBCount);

    // Add your procedure here which disable related IO to reduce power consumption
    // ..................
    //

    /* For Bus powered device, you must enter DeepSleep1 when device has been suspended. For self-powered   */
    /* device, you may decide to enter DeepSleep1 or not depended on you application.                       */

    /* For the convenient during debugging and evaluation stage, the USBDCore_LowPower() is map to a null   */
    /* function by default. In the real product, you must map this function to the low power function of    */
    /* firmware library by setting USBDCORE_ENABLE_LOW_POWER as 1 (in the ht32fxxxx_usbdconf.h file).       */
    USBDCore_LowPower();

    // Add your procedure here which recovery related IO for application
    // ..................
    //

    __DBG_USBPrintf("%06ld <DEEPSLEEP\r\n", ++__DBG_USBCount);

    if (EXTI_GetWakeupFlagStatus(EXTI_CHANNEL_1) == SET)
    {
      __DBG_USBPrintf("%06ld WAKEUP\r\n", ++__DBG_USBCount);
      if (IsRemoteWakeupAllowed == TRUE && USBDCore_IsSuspend(&gUSBCore) == TRUE)
      {
        USBDCore_TriggerRemoteWakeup();
      }
    }

    if (IsRemoteWakeupAllowed == TRUE)
    {
      /* Disable EXTI wake event and clear wakeup flag                                                      */
      EXTI_WakeupEventConfig(EXTI_CHANNEL_1, EXTI_WAKEUP_LOW_LEVEL, DISABLE);
      EXTI_ClearWakeupFlag(EXTI_CHANNEL_1);
    }

    /* Clear EXTI edge flag and enable EXTI interrupt                                                       */
    EXTI_ClearEdgeFlag(EXTI_CHANNEL_1);
    EXTI_IntConfig(EXTI_CHANNEL_1, ENABLE);
  }

  return;
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

/**
  * @}
  */
