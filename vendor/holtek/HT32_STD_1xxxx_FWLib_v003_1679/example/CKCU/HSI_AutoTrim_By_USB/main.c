/*********************************************************************************************************//**
 * @file    CKCU/HSI_AutoTrim_By_USB/main.c
 * @version $Rev:: 1218         $
 * @date    $Date:: 2018-04-16 #$
 * @brief   The main program of USB Device HID example.
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
#include "ht32_usbd_core.h"
#include "ht32_usbd_class.h"
#include "ht32_usbd_descriptor.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup CKCU_Examples CKCU
  * @{
  */

/** @addtogroup HSI_AutoTrim_By_USB
  * @{
  */

typedef struct{
  u16 Header;
  u16 TrimValue;
}SaveAutoTrim_TypeDef;

#define SAVE_AUTO_TRIM_ADDRESS            (0x1FF00050)
#define SAVE_AUTO_TRIM_HEAD_KEY           (0x5A5A)

/* Global variables ----------------------------------------------------------------------------------------*/
__ALIGN4 USBDCore_TypeDef gUSBCore;
USBD_Driver_TypeDef gUSBDriver;
u32 gIsLowPowerAllowed = TRUE;
bool bISTrimSaved = FALSE;
u32 gTrimValue;

/* Private function prototypes -----------------------------------------------------------------------------*/
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void USB_Configuration(void);
void USBPLL_Configuration(void);
void Suspend(u32 uPara);
void CKCU_LoadTrimValue(void);
void UpdateAutoTrimValue(void);
void SysClockConfig_HSI(void);
void CKCU_CKOutConfiguration(void);
void SysClockConfig_PLL(void);
#if (ENABLE_CKOUT == 1)
void CKOUTConfig(void);
#endif

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_Configuration();               /* System Related configuration                                       */
  SysClockConfig_HSI();               /* Switch system clock source to HSI                                  */
  SysClockConfig_PLL();               /* PLL Related configuration                                          */
  GPIO_Configuration();               /* GPIO Related configuration                                         */
  RETARGET_Configuration();           /* Retarget Related configuration                                     */
  USB_Configuration();                /* USB Related configuration                                          */

  CKCU_LoadTrimValue();
  #if (ENABLE_CKOUT == 1)
  CKOUTConfig();
  #endif
  HT32F_DVB_USBConnect();
  while (1)
  {
    USBDCore_MainRoutine(&gUSBCore);  /* USB core main routine                                              */
    UpdateAutoTrimValue();            /* Update auto-trim value                                             */
  }
}

/*********************************************************************************************************//**
  * @brief Configure system clock as PLL.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_PLL(void)
{
  CKCU_PLLInitTypeDef PLL_InitStruct;

  #if (HTCFG_USE_HSE == 1)
  /* Enable HSE                                                                                             */
  CKCU_HSECmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSERDY) != SET);
  #else
  /* Enable HSI                                                                                             */
  CKCU_HSICmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSIRDY) != SET);
  #endif

  /* Inital PLL                                                                                             */
  PLL_InitStruct.BYPASSCmd = DISABLE;
  #if (LIBCDG_CKCU_PLL_144M)
  PLL_InitStruct.CFG = CKCU_PLL_8M_144M;
  #else
  PLL_InitStruct.CFG = CKCU_PLL_8M_96M;
  #endif
  PLL_InitStruct.ClockSource = CKCU_PLLSRC_HSI; /* Switch the system clock source to HSI clock.             */
  CKCU_PLLInit(&PLL_InitStruct);

  /* Enable PLL                                                                                             */
  CKCU_PLLCmd(ENABLE);

  /* Wait until PLL is ready                                                                                */
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY) == RESET);

  /* FLASH wait state configuration                                                                         */
  if (PLL_InitStruct.CFG == CKCU_PLL_8M_96M)
  {
    FLASH_SetWaitState(FLASH_WAITSTATE_3);  /* System Clock 96Mhz. FLASH wait clock                           */
    CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV1);  /* set CK_AHB prescaler                                        */
  }
  else
  {
    FLASH_SetWaitState(FLASH_WAITSTATE_2);    /* System Clock 72Mhz.FLASH wait clock                         */
    CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV2);  /* set CK_AHB prescaler                                        */
  }


  /* Configure PLL as system clock                                                                          */
  CKCU_SysClockConfig(CKCU_SW_PLL);
}

/*********************************************************************************************************//**
  * @brief Configure system clock as HSI.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_HSI(void)
{
  /* Enable HSI                                                                                             */
  CKCU_HSICmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSIRDY) != SET);

  /* Configure HSI as system clock                                                                          */
  CKCU_SysClockConfig(CKCU_SW_HSI);
  CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV1);                        /* set CK_AHB prescaler                   */

  #if (LIBCFG_NO_FMC_WAIT_STATUS)
  #else
  /* FLASH wait state configuration                                                                         */
  FLASH_SetWaitState(FLASH_WAITSTATE_0);     /* FLASH wait clock                                            */
  #endif

  CKCU_PLLCmd(DISABLE);                                           /* Disable PLL                            */
  CKCU_HSECmd(DISABLE);                                           /* Disable HSE                            */
}

/*********************************************************************************************************//**
  * @brief  Update auto-trim value.
  * @retval None
  ***********************************************************************************************************/
void UpdateAutoTrimValue(void)
{
  /* 
    1. Check HSI auto-trim is ready.
    2. Check the Trim Value has saved to SAVE_AUTO_TRIM_ADDRESS. Avoid write to flash frequently. 
  */
  if(bISTrimSaved == TRUE)
  {
    return;
  }
  if (CKCU_HSIAutoTrimIsReady() == TRUE)
  {
    FLASH_State FLASHState;
    u32 uBuffer = 0;
    SaveAutoTrim_TypeDef *pSaveTrim = (SaveAutoTrim_TypeDef*)&uBuffer;
    pSaveTrim->TrimValue = (HT_CKCU->HSICR & 0x00FF0000) >> 16;
    pSaveTrim->Header = SAVE_AUTO_TRIM_HEAD_KEY;
    printf("Detect a new Trim Value...\r\n\t\t\tTrim Value : 0x%03X\r\n",pSaveTrim->TrimValue);
    printf("Save the new Trim Value...\r\n");

    if(gTrimValue == pSaveTrim->TrimValue)
    {
      /*If Trim Value isn't changed,The system will not write Trim value to data area. 
        The purpose is to reduce flash writes frequently.                                                      */
      FLASHState = FLASH_COMPLETE;
    }
    else
    {
      /* Write Trim Value to data area.                                                                        */
      FLASHState = FLASH_EraseOptionByte();
      if(FLASHState != FLASH_COMPLETE)
      {
        printf("\t\t\tErrase error : %d",FLASHState);
        bISTrimSaved = FALSE;
        return ;
      }
      FLASHState = FLASH_ProgramWordData(SAVE_AUTO_TRIM_ADDRESS, uBuffer);
    }
    if(FLASHState != FLASH_COMPLETE)
    {
      printf("\t\t\tProgram error : %d",FLASHState);
      bISTrimSaved = FALSE;
    }
    else
    {
      printf("\t\t\tFinish\r\n");
      bISTrimSaved = TRUE;
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_LoadTrimValue(void)
{
  SaveAutoTrim_TypeDef *pSaveTrim;

  /* Getting  the trim value from SAVE_AUTO_TRIM_ADDRESS                                                         */
  u32 uTrimValue = rw(SAVE_AUTO_TRIM_ADDRESS);

  pSaveTrim = (SaveAutoTrim_TypeDef*)&uTrimValue;
  /* Check the trim value is valid                                                                               */
  if(pSaveTrim->Header != SAVE_AUTO_TRIM_HEAD_KEY)
  {
  /* the trim value isn't valid                                                                                  */
    gTrimValue = 0;
    return;
  }
  else
  {
  /* the trim value is valid, then reload the trim value to HSICR                                                */
    printf("Load the Trim Value...\r\n\t\t\tTrim Value : 0x%03X\r\n",pSaveTrim->TrimValue);
    gTrimValue = pSaveTrim->TrimValue;
    HT_CKCU->HSICR = ((pSaveTrim->TrimValue << 16) | (1ul << 4) | (1ul << 0));
  }
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.USBD                  = 1;
  CKCUClock.Bit.AFIO                  = 1;
  CKCUClock.Bit.EXTI                  = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif

  /*--------------------------------------------------------------------------------------------------------*/
  /* Set USB Clock as PLL / HTCFG_USBPRE_DIV                                                                               */
  /*--------------------------------------------------------------------------------------------------------*/
  CKCU_SetUSBPrescaler(HTCFG_USBPRE_DIV);
}

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  HT32F_DVB_PBInit(BUTTON_KEY1, BUTTON_MODE_GPIO);
  /*--------------------------------------------------------------------------------------------------------*/
  /* Configure EXTI for Remote Wakeup                                                                       */
  /*--------------------------------------------------------------------------------------------------------*/
  AFIO_EXTISourceConfig((AFIO_EXTI_CH_Enum)KEY1_BUTTON_EXTI_CHANNEL, (AFIO_ESS_Enum)KEY1_BUTTON_GPIO_ID);
}

/*********************************************************************************************************//**
  * @brief  Configure USB.
  * @retval None
  ***********************************************************************************************************/
void USB_Configuration(void)
{
  #if (LIBCFG_CKCU_USB_PLL)
  USBPLL_Configuration();
  #endif

  gUSBCore.pDriver = (u32 *)&gUSBDriver;                /* Initiate memory pointer of USB driver            */
  gUSBCore.Power.CallBack_Suspend.func  = Suspend;      /* Install suspend call back function into USB core */
  //gUSBCore.Power.CallBack_Suspend.uPara = (u32)NULL;

  USBDDesc_Init(&gUSBCore.Device.Desc);                 /* Initiate memory pointer of descriptor            */
  USBDClass_Init(&gUSBCore.Class);                      /* Initiate USB Class layer                         */
  USBDCore_Init(&gUSBCore);                             /* Initiate USB Core layer                          */

  #if 0
  CKCU_HSIAutoTrimClkConfig(CKCU_ATC_USB);
  CKCU_HSIAutoTrimCmd(ENABLE);
  #endif

  NVIC_EnableIRQ(USB_IRQn);                             /* Enable USB device interrupt                      */
}

#if (LIBCFG_CKCU_USB_PLL)
/*********************************************************************************************************//**
 * @brief  Configure USB PLL
 * @retval None
 ************************************************************************************************************/
void USBPLL_Configuration(void)
{
  CKCU_PLLInitTypeDef PLLInit;

  //PLLInit.ClockSource = CKCU_PLLSRC_HSE;
  PLLInit.ClockSource = CKCU_PLLSRC_HSI;
  PLLInit.CFG = CKCU_USBPLL_8M_48M;
  PLLInit.BYPASSCmd = DISABLE;
  CKCU_USBPLLInit(&PLLInit);
  CKCU_USBPLLCmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_USBPLLRDY) == RESET);
  CKCU_USBClockConfig(CKCU_CKUSBPLL);
}
#endif

#define REMOTE_WAKEUP      (1)
/*********************************************************************************************************//**
  * @brief  Suspend call back function which enter DeepSleep1
  * @param  uPara: Parameter for Call back function
  * @retval None
  ***********************************************************************************************************/
void Suspend(u32 uPara)
{
  #if (REMOTE_WAKEUP == 1)
  u32 IsRemoteWakeupAllowed;
  #endif
  if (gIsLowPowerAllowed)
  {

    #if (REMOTE_WAKEUP == 1)
    /* Disable EXTI interrupt to prevent interrupt occurred after wakeup                                    */
    EXTI_IntConfig(KEY1_BUTTON_EXTI_CHANNEL, DISABLE);
    IsRemoteWakeupAllowed = USBDCore_GetRemoteWakeUpFeature(&gUSBCore);

    if (IsRemoteWakeupAllowed == TRUE)
    {
      /* Enable EXTI wake event and clear wakeup flag                                                       */
      EXTI_WakeupEventConfig(KEY1_BUTTON_EXTI_CHANNEL, EXTI_WAKEUP_LOW_LEVEL, ENABLE);
      EXTI_ClearWakeupFlag(KEY1_BUTTON_EXTI_CHANNEL);
    }
    #endif

    __DBG_USBPrintf("%06ld >DEEPSLEEP\r\n", ++__DBG_USBCount);

    // Add your procedure here which disable related IO to reduce power consumption
    // ..................
    //

    /* For Bus powered device, you must enter DeepSleep1 when device has been suspended. For self-powered   */
    /* device, you may decide to enter DeepSleep1 or not depended on your application.                      */

    /* For the convenient during debugging and evaluation stage, the USBDCore_LowPower() is map to a null   */
    /* function by default. In the real product, you must map this function to the low power function of    */
    /* firmware library by setting USBDCORE_ENABLE_LOW_POWER as 1 (in the ht32fxxxx_usbdconf.h file).       */
    USBDCore_LowPower();

    // Add your procedure here which recovery related IO for application
    // ..................
    //

    __DBG_USBPrintf("%06ld <DEEPSLEEP\r\n", ++__DBG_USBCount);

    #if (REMOTE_WAKEUP == 1)
    if (EXTI_GetWakeupFlagStatus(KEY1_BUTTON_EXTI_CHANNEL) == SET)
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
      EXTI_WakeupEventConfig(KEY1_BUTTON_EXTI_CHANNEL, EXTI_WAKEUP_LOW_LEVEL, DISABLE);
      EXTI_ClearWakeupFlag(KEY1_BUTTON_EXTI_CHANNEL);
    }

    /* Clear EXTI edge flag and enable EXTI interrupt                                                       */
    EXTI_ClearEdgeFlag(KEY1_BUTTON_EXTI_CHANNEL);
    EXTI_IntConfig(KEY1_BUTTON_EXTI_CHANNEL, ENABLE);
    #endif
  }

  return;
}

#if (ENABLE_CKOUT == 1)
/*********************************************************************************************************//**
  * @brief  Configure the debug output clock.
  * @retval None
  ***********************************************************************************************************/
void CKOUTConfig(void)
{
  CKCU_CKOUTInitTypeDef CKOUTInit;
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_8, AFIO_MODE_15);
  CKOUTInit.CKOUTSRC = CKCU_CKOUTSRC_HCLK_DIV16;
  CKCU_CKOUTConfig(&CKOUTInit);
}
#endif

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
