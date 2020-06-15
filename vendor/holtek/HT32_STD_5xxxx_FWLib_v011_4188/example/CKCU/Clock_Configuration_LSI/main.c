/*********************************************************************************************************//**
 * @file    CKCU/Clock_Configuration_LSI/main.c
 * @version $Rev:: 1396         $
 * @date    $Date:: 2017-06-21 #$
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

/** @addtogroup CKCU_Examples CKCU
  * @{
  */

/** @addtogroup Clock_Configuration_LSI
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define HTCFG_CKCU_CKOUT    (0)
#define HTCFG_USE_HSE       (1)

/* Private constants ---------------------------------------------------------------------------------------*/
#define DELAY_TIME          (32000)
#define DELAY_TIME_LSI      (100)

/* Private function prototypes -----------------------------------------------------------------------------*/
#if (LIBCFG_NO_PLL==1)
#else
void SysClockConfig_PLL(void);
#endif

void SysClockConfig_HSI(void);
void SysClockConfig_HSE(void);
void SysClockConfig_LSI(void);

static void __Delay(vu32 count);

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  int i;

  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.AFIO       = 1;
  //CKCUClock.Bit.USB      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  #if (HTCFG_CKCU_CKOUT == 1)
  {
  CKCU_CKOUTInitTypeDef CKOUTInit;
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_9, AFIO_MODE_15);
  CKOUTInit.CKOUTSRC = CKCU_CKOUTSRC_HCLK_DIV16;
  CKCU_CKOUTConfig(&CKOUTInit);
  }
  #endif

  #if (LIBCFG_RTC_LSI_LOAD_TRIM)
  RTC_LSILoadTrimData();
  #endif

  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);

  while (1)
  {
    /* Setting System Clock as high speed                                                                   */
    #if (LIBCFG_NO_PLL == 1)

    #if (HTCFG_USE_HSE==1)
    SysClockConfig_HSE();
    #else
    SysClockConfig_HSI();
    #endif

    #else
    SysClockConfig_PLL();
    #endif

    for (i = 0; i < 300; i++)
    {
      /* Toggle LED1                                                                                        */
      HT32F_DVB_LEDToggle(HT_LED1);
      __Delay(DELAY_TIME);
    }
    HT32F_DVB_LEDOff(HT_LED1);

    SysClockConfig_LSI();

    for (i = 0; i < 100; i++)
    {
      /* Toggle LED2                                                                                        */
      HT32F_DVB_LEDToggle(HT_LED2);
      __Delay(DELAY_TIME_LSI);
    }
    HT32F_DVB_LEDOff(HT_LED2);
  }
}

#if (LIBCFG_NO_PLL==1)
#else
/*********************************************************************************************************//**
  * @brief Configure system clock as PLL.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_PLL(void)
{
  #if (HTCFG_USE_HSE == 1)
  /* Enable HSE                                                                                             */
  CKCU_HSECmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSERDY) != SET);
  #else
  /* Enable HSI                                                                                             */
  CKCU_HSICmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSIRDY) != SET);
  #endif

  CKCU_PLLCmd(ENABLE);

  /* Wait until PLL is ready                                                                                */
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY) == RESET);

  #if (LIBCFG_NO_FMC_WAIT_STATUS)
  #else
  /* FLASH wait state configuration                                                                         */
  FLASH_SetWaitState(HTCFG_FLASH_MAX_WAIT);  /* FLASH wait clock                                            */
  #endif

  /* Recovery CK_AHB prescaler setting if need                                                              */
  //CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV1);                      /* set CK_AHB prescaler                   */

  /* Configure PLL as system clock                                                                          */
  CKCU_SysClockConfig(CKCU_SW_PLL);

  /*--------------------------------------------------------------------------------------------------------*/
  /* If your application uses USB or CKREF function, you need recovery it when the system exit LSI mode.    */
  /*--------------------------------------------------------------------------------------------------------*/
  #if 0
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  //CKCUClock.Bit.USBD  = 1;
  //CKCUClock.Bit.CKREF = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  }
  #endif
}
#endif

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

  /*--------------------------------------------------------------------------------------------------------*/
  /* If your application uses USB or CKREF function, you need turn it off, otherwise the PLL can't disable. */
  /* Remember to recovery it when the system exit LSI low speed mode.                                       */
  /*--------------------------------------------------------------------------------------------------------*/
  #if 0
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  //CKCUClock.Bit.USBD  = 1;
  //CKCUClock.Bit.CKREF = 1;
  CKCU_PeripClockConfig(CKCUClock, DISABLE);
  }
  #endif

  #if (LIBCFG_NO_PLL==1)
  #else
  CKCU_PLLCmd(DISABLE);                                           /* Disable PLL                            */
  #endif

  CKCU_HSECmd(DISABLE);                                           /* Disable HSE                            */
}

/*********************************************************************************************************//**
  * @brief Configure system clock as HSE.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_HSE(void)
{
  /* Enable HSE                                                                                             */
  CKCU_HSECmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_HSERDY) != SET);

  /* Configure HSE as system clock                                                                          */
  CKCU_SysClockConfig(CKCU_SW_HSE);
  CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV1);                        /* set CK_AHB prescaler                   */

  #if (LIBCFG_NO_FMC_WAIT_STATUS)
  #else
  /* FLASH wait state configuration                                                                         */
  FLASH_SetWaitState(FLASH_WAITSTATE_0);     /* FLASH wait clock                                            */
  #endif

  /*--------------------------------------------------------------------------------------------------------*/
  /* If your application uses USB or CKREF function, you need turn it off, otherwise the PLL can't disable. */
  /* Remember to recovery it when the system exit LSI low speed mode.                                       */
  /*--------------------------------------------------------------------------------------------------------*/
  #if 0
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  //CKCUClock.Bit.USBD  = 1;
  //CKCUClock.Bit.CKREF = 1;
  CKCU_PeripClockConfig(CKCUClock, DISABLE);
  }
  #endif

  #if (LIBCFG_NO_PLL==1)
  #else
  CKCU_PLLCmd(DISABLE);                                           /* Disable PLL                            */
  #endif

  /*--------------------------------------------------------------------------------------------------------*/
  /* !!! Notice: HSI Must be turn on when you do the Flash operations (Erase or Program).                   */
  /*--------------------------------------------------------------------------------------------------------*/
  CKCU_HSICmd(DISABLE);                                           /* Disable HSI                            */
}



/*********************************************************************************************************//**
  * @brief Configure system clock as LSI.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_LSI(void)
{
  CKCU_SysClockConfig(CKCU_SW_LSI);                               /* select CK_SYS source                   */
  CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV1);                        /* set CK_AHB prescaler                   */

  #if (LIBCFG_NO_FMC_WAIT_STATUS)
  #else
  FLASH_SetWaitState(FLASH_WAITSTATE_0);
  #endif

  /*--------------------------------------------------------------------------------------------------------*/
  /* If your application uses USB or CKREF function, you need turn it off, otherwise the PLL can't disable. */
  /* Remember to recovery it when the system exit LSI low speed mode.                                       */
  /*--------------------------------------------------------------------------------------------------------*/
  #if 0
  {
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  //CKCUClock.Bit.USBD  = 1;
  //CKCUClock.Bit.CKREF = 1;
  CKCU_PeripClockConfig(CKCUClock, DISABLE);
  }
  #endif

  #if (LIBCFG_NO_PLL==1)
  #else
  CKCU_PLLCmd(DISABLE);                                           /* Disable PLL                            */
  #endif

  CKCU_HSECmd(DISABLE);                                           /* Disable HSE                            */

  /*--------------------------------------------------------------------------------------------------------*/
  /* !!! Notice: HSI Must be turn on when you do the Flash operations (Erase or Program).                   */
  /*--------------------------------------------------------------------------------------------------------*/
  CKCU_HSICmd(DISABLE);                                           /* Disable HSI                            */
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
/*********************************************************************************************************//**
  * @brief  delay function
  * @param  count: delay count for loop
  * @retval None
  ***********************************************************************************************************/
static void __Delay(vu32 count)
{
  while (count--);
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
