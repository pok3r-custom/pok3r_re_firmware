/*********************************************************************************************************//**
 * @file    CKCU/Clock_Configuration/main.c
 * @version $Rev:: 929          $
 * @date    $Date:: 2017-11-13 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup CKCU_Examples CKCU
  * @{
  */

/** @addtogroup Clock_Configuration
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
//#define SYSCLK_8MHz
//#define SYSCLK_24MHz
#define SYSCLK_48MHz
//#define SYSCLK_72MHz
//#define SYSCLK_96MHz  /* Only for HT32F123xxx   */

/* Private constants ---------------------------------------------------------------------------------------*/
#define DELAY_TIME    0x1FFFF

/* Private function prototypes -----------------------------------------------------------------------------*/
void SysClockConfig_8MHz(void);
void SysClockConfig_24MHz(void);
void SysClockConfig_48MHz(void);
void SysClockConfig_72MHz(void);
void SysClockConfig_96MHz(void);
static void _Delay(vu32 count);

/* Private variables ---------------------------------------------------------------------------------------*/
CKCU_ClocksTypeDef ClockFreq;
CKCU_CKOUTInitTypeDef CKOUTInit;
CKCU_PLLInitTypeDef PLLInit;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  /*
      Configure the system clock in startup file (startup_ht32fxxxx.s)
      by calling SystemInit function. Please refer to system_ht32fxxxx.c.
  */

  /*
      If no system clock is configured, HSI is the system clock by default.
  */

  /*
      Configure system clock frequency and HCLK prescaler.
      External 8MHz crystal is used to drive the system clock.
  */

#ifdef SYSCLK_8MHz
  SysClockConfig_8MHz();
#elif defined SYSCLK_24MHz
  SysClockConfig_24MHz();
#elif defined SYSCLK_48MHz
  SysClockConfig_48MHz();
#elif defined SYSCLK_72MHz
    SysClockConfig_72MHz();
#elif defined SYSCLK_96MHz
  #if defined(USE_HT32F12365_66) || defined(USE_HT32F12345) 
    SysClockConfig_96MHz();
  #else
    #error "This example code does not apply to the chip you selected."
  #endif
#endif

  /* Get the current clocks setting */
  CKCU_GetClocksFrequency(&ClockFreq);

  /* Configures NVIC to enable clock ready interrupt */
  NVIC_EnableIRQ(CKRDY_IRQn);

  /* Enable HSE clock monitor & interrupt, once HSE is failed the NMI exception will occur */
  CKCU_CKMCmd(ENABLE);
  CKCU_IntConfig(CKCU_INT_CKSIE, ENABLE);

  /* Output HSE on CKOUT pin */
  CKCUClock.Bit.AFIO       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_8, AFIO_MODE_15);
  CKOUTInit.CKOUTSRC = CKCU_CKOUTSRC_HCLK_DIV16;
  CKCU_CKOUTConfig(&CKOUTInit);

  /* Initialize LEDs */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  while (1)
  {
    /* Toggle LED1 */
    HT32F_DVB_LEDToggle(HT_LED1);
    _Delay(DELAY_TIME);

    /* Toggle LED2 */
    HT32F_DVB_LEDToggle(HT_LED2);
    _Delay(DELAY_TIME);

    /* Toggle LED3 */
    HT32F_DVB_LEDToggle(HT_LED3);
    _Delay(DELAY_TIME);
  }
}

/*********************************************************************************************************//**
  * @brief Configure HSE as system clock source and set HCLK prescaler.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_8MHz(void)
{
  ErrStatus ClockStatus;

  /* Reset CKCU, SYSCLK = HSI */
  CKCU_DeInit();

  /* Enable HSE */
  CKCU_HSECmd(ENABLE);

  /* Wait until HSE is ready or time-out */
  ClockStatus = CKCU_WaitHSEReady();

  if(ClockStatus == SUCCESS)
  {
    /* PLL configuration, PLLCLK = 8 MHz */
    PLLInit.ClockSource = CKCU_PLLSRC_HSE;
    PLLInit.CFG = CKCU_PLL_8M_64M;
    PLLInit.BYPASSCmd = DISABLE;
    CKCU_PLLInit(&PLLInit);

    CKCU_PLLCmd(ENABLE);

    /* Wait until PLL is ready */
    while(CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY) == RESET);

    /* FLASH wait state configuration */
    FLASH_SetWaitState(FLASH_WAITSTATE_0);  /* FLASH zero wait clock */

    /* HCLK = SYSCLK/8 */
    CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV8);

    /* Configure PLL as system clock */
    ClockStatus = CKCU_SysClockConfig(CKCU_SW_PLL);

    if(ClockStatus != SUCCESS)
    {
      while(1);
    }
  }
  else
  {
    /* HSE is failed. User can handle this situation here. */
    while(1);
  }
}

/*********************************************************************************************************//**
  * @brief Configure system clock as 24 MHz and set HCLK prescaler.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_24MHz(void)
{
  ErrStatus ClockStatus;

  /* Reset CKCU, SYSCLK = HSI */
  CKCU_DeInit();

  /* Enable HSE */
  CKCU_HSECmd(ENABLE);

  /* Wait until HSE is ready or time-out */
  ClockStatus = CKCU_WaitHSEReady();

  if(ClockStatus == SUCCESS)
  {
    /* PLL configuration, PLLCLK = 96 MHz */
    PLLInit.ClockSource = CKCU_PLLSRC_HSE;
    PLLInit.CFG = CKCU_PLL_8M_96M;
    PLLInit.BYPASSCmd = DISABLE;
    CKCU_PLLInit(&PLLInit);

    CKCU_PLLCmd(ENABLE);

    /* Wait until PLL is ready */
    while(CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY) == RESET);

    /* FLASH wait state configuration */
    FLASH_SetWaitState(FLASH_WAITSTATE_0);  /* FLASH zero wait clock */

    /* HCLK = SYSCLK/4 */
    CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV4);

    /* Configure PLL as system clock */
    ClockStatus = CKCU_SysClockConfig(CKCU_SW_PLL);

    if(ClockStatus != SUCCESS)
    {
      while(1);
    }
  }
  else
  {
    /* HSE is failed. User can handle this situation here. */
    while(1);
  }
}

/*********************************************************************************************************//**
  * @brief Configure system clock as 48 MHz and set HCLK prescaler.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_48MHz(void)
{
  ErrStatus ClockStatus;

  /* Reset CKCU, SYSCLK = HSI */
  CKCU_DeInit();

  /* Enable HSE */
  CKCU_HSECmd(ENABLE);

  /* Wait until HSE is ready or time-out */
  ClockStatus = CKCU_WaitHSEReady();

  if(ClockStatus == SUCCESS)
  {
    /* PLL configuration, PLLCLK = 96 MHz */
    PLLInit.ClockSource = CKCU_PLLSRC_HSE;
    PLLInit.CFG = CKCU_PLL_8M_96M;
    PLLInit.BYPASSCmd = DISABLE;
    CKCU_PLLInit(&PLLInit);

    CKCU_PLLCmd(ENABLE);

    /* Wait until PLL is ready */
    while(CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY) == RESET);

    /* FLASH wait state configuration */
    FLASH_SetWaitState(FLASH_WAITSTATE_1);  /* FLASH one wait clock */

    /* HCLK = SYSCLK/2 */
    CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV2);

    /* Configure PLL as system clock */
    ClockStatus = CKCU_SysClockConfig(CKCU_SW_PLL);

    if(ClockStatus != SUCCESS)
    {
      while(1);
    }
  }
  else
  {
    /* HSE is failed. User can handle this situation here. */
    while(1);
  }
}

/*********************************************************************************************************//**
  * @brief Configure system clock as 72 MHz and set HCLK prescaler.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_72MHz(void)
{
  ErrStatus ClockStatus;

  /* Reset CKCU, SYSCLK = HSI */
  CKCU_DeInit();

  /* Enable HSE */
  CKCU_HSECmd(ENABLE);

  /* Wait until HSE is ready or time-out */
  ClockStatus = CKCU_WaitHSEReady();

  if(ClockStatus == SUCCESS)
  {
    /* PLL configuration, PLLCLK = 144 MHz */
    PLLInit.ClockSource = CKCU_PLLSRC_HSE;
    PLLInit.CFG = CKCU_PLL_8M_72M;
    PLLInit.BYPASSCmd = DISABLE;
    CKCU_PLLInit(&PLLInit);

    CKCU_PLLCmd(ENABLE);

    /* Wait until PLL is ready */
    while(CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY) == RESET);

    /* FLASH wait state configuration */
    FLASH_SetWaitState(FLASH_WAITSTATE_2);  /* FLASH two wait clock */

    /* HCLK = SYSCLK/2 */
    CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV1);

    /* Configure PLL as system clock */
    ClockStatus = CKCU_SysClockConfig(CKCU_SW_PLL);

    if(ClockStatus != SUCCESS)
    {
      while(1);
    }
  }
  else
  {
    /* HSE is failed. User can handle this situation here. */
    while(1);
  }
}

/*********************************************************************************************************//**
  * @brief Configure system clock as 96 MHz and set HCLK prescaler.
  * @retval None
  ***********************************************************************************************************/
void SysClockConfig_96MHz(void)
{
  ErrStatus ClockStatus;

  /* Reset CKCU, SYSCLK = HSI */
  CKCU_DeInit();

  /* Enable HSE */
  CKCU_HSECmd(ENABLE);

  /* Wait until HSE is ready or time-out */
  ClockStatus = CKCU_WaitHSEReady();

  if(ClockStatus == SUCCESS)
  {
    /* PLL configuration, PLLCLK = 96 MHz */
    PLLInit.ClockSource = CKCU_PLLSRC_HSE;
    PLLInit.CFG = CKCU_PLL_8M_96M;
    PLLInit.BYPASSCmd = DISABLE;
    CKCU_PLLInit(&PLLInit);

    CKCU_PLLCmd(ENABLE);

    /* Wait until PLL is ready */
    while(CKCU_GetClockReadyStatus(CKCU_FLAG_PLLRDY) == RESET);

    /* FLASH wait state configuration */
    FLASH_SetWaitState(FLASH_WAITSTATE_3);  /* FLASH two wait clock */

    /* HCLK = SYSCLK/1 */
    CKCU_SetHCLKPrescaler(CKCU_SYSCLK_DIV1);

    /* Configure PLL as system clock */
    ClockStatus = CKCU_SysClockConfig(CKCU_SW_PLL);

    if(ClockStatus != SUCCESS)
    {
      while(1);
    }
  }
  else
  {
    /* HSE is failed. User can handle this situation here. */
    while(1);
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

/* Private functions ---------------------------------------------------------------------------------------*/
static void _Delay(vu32 count)
{
  while(count--);
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
