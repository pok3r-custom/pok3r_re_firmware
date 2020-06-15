/*********************************************************************************************************//**
 * @file    PWRCU/BackupData/main.c
 * @version $Rev:: 499          $
 * @date    $Date:: 2016-05-06 #$
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

/** @addtogroup PWRCU_Examples PWRCU
  * @{
  */

/** @addtogroup BackupData
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
u8  bDataNum = 10;
u32 BackupData[10] = {
  0x0000A5A5, 0x11111111, 0x22222222, 0x33333333, 0x44444444,
  0x55555555, 0x66666666, 0x77777777, 0x88888888, 0x99999999
};
/* Private function prototypes -----------------------------------------------------------------------------*/
void RTC_Configuration(void);

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
  *   - Enable RTC PCLK.
  *   - Wait till the backup domain could be accessed.
  *   - Set RTC for generating an interrupt per second to toggle LED1
  *   - Init LED1 and USART.
  *   - Enable NVIC RTC interrupt.
  *   - Check the PWRCU flags and PWRCU_BAKREG_0 register.
  *     - Print Backup Domain Power On Reset information
  *       when the first time the program is executed.
  *     - If PWRCU_BAKREG_0 register value is not correct or not yet programmed
  *       (when the first time the program is executed).
  *       - Write BackupData to PWRCU_BAKREG_0~9.
  *   - Print and Check the data of PWRCU_BAKREG_0~9.
  *
  ***********************************************************************************************************/
int main(void)
{
   int i;

  /* Enable RTC clock                                                                                       */
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};
  CKCUClock.Bit.BKP        = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);

  /* Wait for De-isolation, then backup domain could be accessed                                            */
  if (PWRCU_CheckReadyAccessed() != PWRCU_OK)
  {
    while (1);
  }
  /* Init LED1 and USART                                                                                    */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  RETARGET_Configuration();           /* Retarget Related configuration                                     */
  /* Enable NVIC RTC interrupt                                                                              */
  NVIC_EnableIRQ(RTC_IRQn);

  printf("\r\n\n start");

  /* RTC Configuration                                                                                      */
  RTC_Configuration();

  /* Check if the Power On Reset flag is set                                                                */
  if (PWRCU_GetFlagStatus() == PWRCU_FLAG_PWRPOR)
  {
    printf("\r\n\n Backup domain Power On Reset occurred....");
  }

  if (PWRCU_ReadBackupRegister(PWRCU_BAKREG_0) != BackupData[0])
  {

    /* Backup data register value is not correct or not yet programmed (when
       the first time the program is executed) */
    for (i = 0; i < bDataNum; i++)
    {
      PWRCU_WriteBackupRegister((PWRCU_BAKREG_Enum)i, BackupData[i]);
    }
    
    printf("\r\n\n BackupData has been configured....\r\n");
    
    /* Turn on LED2                                                                                         */
    HT32F_DVB_LEDOn(HT_LED2);
  }

  for (i = 0; i < bDataNum; i++)
  {
    printf("\r\nPWRCU_BAKREG_%u = 0x%x   ", i, (unsigned int)PWRCU_ReadBackupRegister((PWRCU_BAKREG_Enum)i));
    if (PWRCU_ReadBackupRegister((PWRCU_BAKREG_Enum)i)!= BackupData[i])
    {
      printf("(Wrong! It should be 0   x%x)\r\n", (unsigned int)BackupData[i]);

       /* Turn on LED3                                                                                      */
      HT32F_DVB_LEDOn(HT_LED3);
    }
  }
  printf("\r\n");
  while (1);
}

/*********************************************************************************************************//**
 * @brief Configures the RTC.
 * @retval None
 * @details RTC configuration as following:
 *  - Configure Low Speed External clock (LSE).
 *    - The LSE use fast startup mode.
 *      Shortly startup time but higher power consumption.
 *    - Enable the LSE.
 *    - Waits till LSE is ready.
 *  - Configure RTC.
 *    - Select LSE as RTC Clock Source.
 *    - RTC prescaler = 32768 to generate 1 second interrupt.
 *    - Enable RTC.
 *    - Enable the RTC Second interrupt.
 ************************************************************************************************************/
void RTC_Configuration(void)
{
  /* Enable the LSE OSC                                                                                     */
  RTC_LSESMConfig(RTC_LSESM_FAST);
  RTC_LSECmd(ENABLE);

  /* Wait till LSE is ready                                                                                 */
  while (CKCU_GetClockReadyStatus(CKCU_FLAG_LSERDY) == RESET);

  /* Select the RTC Clock Source as LSE                                                                     */
  RTC_ClockSourceConfig(RTC_SRC_LSE);

  /* Set the RTC time base to 1s                                                                            */
  RTC_SetPrescaler(RTC_RPRE_32768);

  /* Enable the RTC                                                                                         */
  RTC_Cmd(ENABLE);

  /*Enable CSEC interrupt                                                                                   */
  RTC_IntConfig(RTC_INT_CSEC, ENABLE);
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
