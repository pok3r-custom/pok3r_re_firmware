/*********************************************************************************************************//**
 * @file    RTC/Time_BackupDomain/main.c
 * @version $Rev:: 1480         $
 * @date    $Date:: 2018-11-12 #$
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

/** @addtogroup RTC_Examples RTC
  * @{
  */

/** @addtogroup Time_BackupDomain
  * @{
  */


/* Private function prototypes -----------------------------------------------------------------------------*/
void RTC_Configuration(void);
u32 Time_Regulate(void);
void Time_Display(u32 wTimeVar);
u32 ScanUnsignedDecimal(void);

/* Private variables ---------------------------------------------------------------------------------------*/
vu32 gwTimeDisplay = 0;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  * @note At this stage the microcontroller clock setting is already configured,
  *       this is done through SystemInit() function which is called from startup
  *       file (startup_ht32fxxxx.s) before branching to application main.
  *       To reconfigure the default setting of SystemInit() function, refer to
  *       system_ht32fxxxx.c file
  * @details Main program as following:
  *   - Enable RTC PCLK and waits until it can be accessed.
  *     The RTC is located in backup domain.
  *     And the isolation is enabled when backup domain reset,
  *     Therefore you have to disable isolation via PWRCU_CheckReadyAccessed() API.
  *   - Init LED1 and USART.
  *   - Enable NVIC RTC interrupt.
  *   - Check the PWRCU flags and PWRCU_BAKREG_0 register.
  *     - Print Backup Domain Power On Reset information
  *       when the first time the program is executed.
  *     - If PWRCU_BAKREG_0 register value is not correct or not yet programmed
  *       (when the first time the program is executed).
  *       - RTC Configuration via RTC_Configuration function.
  *         The RTC counter will restart when match event occurred.
  *       - Adjust time by values entered by the user on the hyperterminal
  *         via Time_Regulate function. Then store the init time to PWRCU_BAKREG_1.
  *       - Set RTC Compare Register(RTC->CMP) as (86400 - PWRCU_BAKREG_1).
  *         Restart RTC Counter when Time is 23:59:59.
  *       - Write 0xA5A5 to PWRCU_BAKREG_0.
  *       - Enable RTC
  *     - If PWRCU_BAKREG_0 register value correct:
  *       this means that the RTC is configured and the time is displayed on HyperTerminal.
  *   - Display current time in infinite loop.
  *     Current time is sum of the RTC counter value and the init time(stored in PWRCU_BAKREG_1 register).
  *     The init time (PWRCU_BAKREG_1 register) will be cleared and the RTC Compare Register(RTC->CMP)
  *     will be set to 86400 if the RTC Match flag(CMFLAG) is set. Refer to RTC_IRQHandler.
  *
  ***********************************************************************************************************/
int main(void)
{
  /* Enable Backup Domain PCLK and waits until it can be accessed                                           */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.BKP        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  if (PWRCU_CheckReadyAccessed() != PWRCU_OK)
  {
    while (1);
  }

  /* Init LED1 and USART                                                                                    */
  HT32F_DVB_LEDInit(HT_LED1);

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  /* Enable NVIC RTC interrupt                                                                              */
  NVIC_EnableIRQ(RTC_IRQn);

  /* Check if the Power On Reset flag is set                                                                */
  if (PWRCU_GetFlagStatus() == PWRCU_FLAG_BAKPOR)
  {
    printf("\r\n\n Power On Reset occurred....");
  }

  if (PWRCU_ReadBackupRegister(PWRCU_BAKREG_0) != 0xA55A)
  {
    u32 wInitTime = 0;
    /* Backup data register value is not correct or not yet programmed (when
       the first time the program is executed) */

    printf("\r\n\n RTC not yet configured....");

    /* RTC Configuration                                                                                    */
    RTC_Configuration();

    printf("\r\n RTC configured....");

    /* Adjust time by values entered by the user on the hyperterminal,
       Then store the init time to PWRCU_BAKREG_1. */
    wInitTime = Time_Regulate();
    PWRCU_WriteBackupRegister(PWRCU_BAKREG_1, wInitTime);

    /* Reset RTC Counter when Time is 23:59:59                                                              */
    RTC_SetCompare(86400 - wInitTime);

    PWRCU_WriteBackupRegister(PWRCU_BAKREG_0, 0xA55A);

    /* Enable RTC                                                                                           */
    RTC_Cmd(ENABLE);
  }
  else
  {
    printf("\r\n No need to configure RTC....");
  }

  /* Display current time in infinite loop                                                                  */
  printf("\r\n");

  while (1)
  {
    /* If 1s has passed                                                                                     */
    if (gwTimeDisplay == 1)
    {
      /* Display current time.
         Current time is sum of the RTC counter value and the init time(stored in PWRCU_BAKREG_1 register).
         The init time (PWRCU_BAKREG_1 register) will be clear if the RTC Match flag(CMFLAG) is set.
         Refer to RTC_IRQHandler. */
      Time_Display(RTC_GetCounter() + PWRCU_ReadBackupRegister(PWRCU_BAKREG_1));
      gwTimeDisplay = 0;
    }
  }
}

/*********************************************************************************************************//**
 * @brief Configures the RTC.
 * @retval None
 * @details RTC configuration as following:
 *  - S/W reset backup domain.
 *  - Configure Low Speed External clock (LSE).
 *    - The LSE use fast startup mode.
 *      Shortly startup time but higher power consumption.
 *    - Enable the LSE.
 *    - Waits till LSE is ready.
 *  - Configure RTC.
 *    - Select LSE as RTC Clock Source.
 *    - Enable the RTC Second interrupt.
 *    - RTC prescaler = 32768 to generate 1 second interrupt.
 *    - Enable clear RTC counter by match function.
 *
 ************************************************************************************************************/
void RTC_Configuration(void)
{
  /* Reset Backup Domain                                                                                    */
  PWRCU_DeInit();

  /* Configure Low Speed External clock (LSE)                                                             */
  RTC_LSESMConfig(RTC_LSESM_FAST);
  RTC_LSECmd(ENABLE);
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_LSERDY) == RESET);
  RTC_ClockSourceConfig(RTC_SRC_LSE);

  /* Configure the RTC                                                                                      */
  RTC_IntConfig(RTC_INT_CSEC, ENABLE);
  RTC_SetPrescaler(RTC_RPRE_32768);

  /* Restart counter when match event occurred                                                              */
  RTC_CMPCLRCmd(ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Returns the time entered by user, using Hyperterminal.
  * @return Enter time, unit is second within a day.
  ***********************************************************************************************************/
u32 Time_Regulate(void)
{
  u32 Tmp_HH = 0xFF, Tmp_MM = 0xFF, Tmp_SS = 0xFF;

  printf("\r\n==============Time Settings=====================================");
  printf("\r\n  Please Set Hours");
  printf("\r\n");
  do
  {
    Tmp_HH = ScanUnsignedDecimal();
  } while (Tmp_HH > 23);
  printf(":  %u", (unsigned int)Tmp_HH);

  printf("\r\n  Please Set Minutes");
  printf("\r\n");
  do
  {
    Tmp_MM = ScanUnsignedDecimal();
  } while (Tmp_MM > 59);
  printf(":  %u", (unsigned int)Tmp_MM);

  printf("\r\n  Please Set Seconds");
  printf("\r\n");
  do
  {
    Tmp_SS = ScanUnsignedDecimal();
  } while (Tmp_SS > 59);
  printf(":  %u", (unsigned int)Tmp_SS);

  return((Tmp_HH * 3600 + Tmp_MM * 60 + Tmp_SS));
}

/*********************************************************************************************************//**
  * @brief  Displays the input time.
  * @param  wTimeVar: Displays time.
  * @retval None
  ***********************************************************************************************************/
void Time_Display(u32 wTimeVar)
{
  u32 THH = 0, TMM = 0, TSS = 0;

  /* Compute  hours                                                                                         */
  THH = wTimeVar/3600;
  /* Compute minutes                                                                                        */
  TMM = (wTimeVar % 3600)/60;
  /* Compute seconds                                                                                        */
  TSS = (wTimeVar % 3600)% 60;

  printf("Time: %02u:%02u:%02u\r", (unsigned int)THH, (unsigned int)TMM, (unsigned int)TSS);
}

/*********************************************************************************************************//**
  * @brief  Scan an unsigned decimal number.
  * @return An unsigned decimal value.
  ***********************************************************************************************************/
u32 ScanUnsignedDecimal(void)
{
  u8 bChar = 0;
  u32 wNbr = 0;
  while (1)
  {
    bChar = getchar();
    if ((bChar >= '0') && (bChar <= '9'))
    {
      wNbr = (wNbr * 10) + (bChar - '0');
    }
    else
    {
      break;
    }

  }
  return wNbr;
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
