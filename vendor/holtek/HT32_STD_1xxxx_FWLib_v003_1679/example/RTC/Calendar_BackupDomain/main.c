/*********************************************************************************************************//**
 * @file    RTC/Calendar_BackupDomain/main.c
 * @version $Rev:: 615          $
 * @date    $Date:: 2015-12-07 #$
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

/** @addtogroup Calendar_BackupDomain
  * @{
  */

/* Private typedef -----------------------------------------------------------------------------------------*/
typedef struct
{
  u32 year;
  u32 month;
  u32 day;
  u32 hour;
  u32 minute;
  u32 second;
}Time_T;

/* Private define ------------------------------------------------------------------------------------------*/
#define PWRCU_BAKREG_0_RTC_KEY        (PWRCU_BAKREG_0)  /* Backup Register 0                                */
#define PWRCU_BAKREG_1_RTC_SECOND     (PWRCU_BAKREG_1)  /* Backup Register 1                                */

/* Private variables ---------------------------------------------------------------------------------------*/
u8 Day_Per_Month[13] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

/* Global variables ----------------------------------------------------------------------------------------*/
Time_T DateTime, CurTime;
vu8 CK_SECOND_Flag = 0;

/* Private function prototypes -----------------------------------------------------------------------------*/
void RTC_Configuration(void);
void AP_Time_Init(Time_T* InitTime);
void AP_Time_Show(void);
u8 AP_Time_Adjust(Time_T* AdjustTime);
u8 AP_Time_Count(Time_T* CurrentTime);
static bool IsLeapYear(u32 year);

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
  *     The RTC is located in the Backup Domain. And the isolation is enabled when backup domain
  *     reset. Therefore you have to disable isolation via PWRCU_CheckReadyAccessed() function.
  *   - Initizlize LED1.
  *   - Configures USART: 115200 8-N-1
  *   - Enable NVIC RTC interrupt.
  *   - Check the Backup Domain reset flag.
  *     Print "Power On Reset occurred!" when the first time this program is executed.
  *   - Check the PWRCU_BAKREG_0 register.
  *     - If PWRCU_BAKREG_0 register value is not correct or not yet programmed.
  *       (when the first time the program is executed)
  *       - RTC Configuration via RTC_Configuration function.
  *         The RTC counter will restart when match event occurred.
  *       - Initialize the time values entred by the user on the Hyperterminal via AP_Time_Init() function
  *         or set by software directly.
  *       - Adjust time with 2014.1.1 00:00:00 and then store the sum of second to PWRCU_BAKREG_1 register.
  *         That is done through AP_Time_Adjust() function.
  *       - Enable RTC.
  *       - Write 0xAA55A5A5 to PWRCU_BAKREG_0 register.
  *     - If PWRCU_BAKREG_0 register value is correct.
  *       It means that the RTC had already configured.
  *   - Display the current time via AP_Time_Show() function.
  *     - Current time is sum of the RTC counter value and the init time stored in PWRCU_BAKREG_1 register.
  *       That is done through AP_Time_Count() function.
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

  /* Initialize LED1                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);

  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  /* NVIC configuration                                                                                     */
  NVIC_EnableIRQ(RTC_IRQn);

  /* Check the Power On Reset flag is set or not                                                            */
  if (PWRCU_GetFlagStatus() == PWRCU_FLAG_BAKPOR)
  {
    printf("\r\nPower On Reset occurred!\r\n");
  }

  if (PWRCU_ReadBackupRegister((PWRCU_BAKREG_Enum) PWRCU_BAKREG_0_RTC_KEY) != 0xAA55A5A5)
  {
    /* Backup data register value is not correct or not yet programmed
     (when the first time the program is executed) */

    printf("\r\nRTC not yet configured!\r\n");

    /* RTC Configuration                                                                                    */
    RTC_Configuration();

    /* Initialize the time values entred by the user on the COM1 (using Hyperterminal) or software settings*/
    #if 1
    AP_Time_Init(&DateTime);
    #else
    DateTime.year   = 2014;
    DateTime.month  = 1;
    DateTime.day    = 1;
    DateTime.hour   = 0;
    DateTime.minute = 0;
    DateTime.second = 0;
    #endif

    /* Adjust time and store into RTC counter                                                               */
    if (!AP_Time_Adjust(&DateTime))
    {
      printf("\r\nAdjust time error!\r\n");
      while (1);
    }

    /* Enable RTC                                                                                           */
    RTC_Cmd(ENABLE);

    PWRCU_WriteBackupRegister((PWRCU_BAKREG_Enum) PWRCU_BAKREG_0_RTC_KEY, 0xAA55A5A5);
  }
  else
  {
    printf("\r\nNo need to configure RTC!\r\n");
  }

  while (1)
  {
    /* If 1s has passed                                                                                     */
    if (CK_SECOND_Flag)
    {
      CK_SECOND_Flag = 0;

      /*
        Display current time.
        Current time is sum of the RTC counter value and the init time.
      */
      AP_Time_Show();
    }
  }
}

/*********************************************************************************************************//**
  * @brief  Initialize time by values entered on the Hyperterminal.
    * @param  InitTime: pointer to Time_T structure that will store the configuration values.
  * @retval None
  ***********************************************************************************************************/
void AP_Time_Init(Time_T* InitTime)
{
  bool leapyear;
  u32 val;

  printf("\r\n");
  printf("------------------------------\r\n");
  printf("Time Settings\r\n");

  /* Year setting range: 2014 ~ 2050                                                                        */
  while (1)
  {
    printf("Year  : ");
    scanf("%d", &val);
    if ((val >= 2014) && (val <= 2050))
    {
        InitTime->year = val;
        printf("%d\r\n", InitTime->year);
        break;
    }
    else
    {
        printf("Invalid\r\n");
    }
  }

  /* Month setting range: 1 ~ 12                                                                            */
  while (1)
  {
    printf("Month : ");
    scanf("%d", &val);
    if ((val > 0) && (val <= 12) )
    {
      InitTime->month = val;
      printf("%d\r\n", InitTime->month);
      break;
    }
    else
    {
      printf("Invalid\r\n");
    }
  }

  /* Day setting range: 1 ~ 31                                                                              */
  leapyear = IsLeapYear(InitTime->year);
  while (1)
  {
    printf("Day   : ");
    scanf("%d", &val);
    if ((val > 0) && (val <= Day_Per_Month[InitTime->month]) )  // Feb, 1~28
    {
      InitTime->day = val;
      printf("%d\r\n", InitTime->day);
      break;
    }
    else
    {
      if ((leapyear == TRUE) && (InitTime->month == 2) )
      {
        if (val == 29)
        {
          InitTime->day = val;
          printf("%d\r\n", InitTime->day);
          break;
        }
        else
        {
          printf("Invalid\r\n");
        }
      }
      else
      {
        printf("Invalid\r\n");
      }
    }
  }

  /* Hour setting range: 0 ~ 23                                                                             */
  while (1)
  {
    printf("Hour  : ");
    scanf("%d", &val);
    if (val <= 23)
    {
      InitTime->hour = val;
      printf("%d\r\n", InitTime->hour);
      break;
    }
    else
    {
      printf("Invalid\r\n");
    }
  }

  /* Minute setting range: 0 ~ 59                                                                           */
  while (1)
  {
    printf("Minute: ");
    scanf("%d", &val);
    if (val <= 59)
    {
      InitTime->minute = val;
      printf("%d\r\n", InitTime->minute);
      break;
    }
    else
    {
      printf("Invalid\r\n");
    }
  }

  /* Second setting range: 0 ~ 59                                                                           */
  while (1)
  {
    printf("Second: ");
    scanf("%d", &val);
    if (val <= 59)
    {
      InitTime->second = val;
      printf("%d\r\n", InitTime->second);
      break;
    }
    else
    {
      printf("Invalid\r\n");
    }
  }
  printf("\r\n");
}

/*********************************************************************************************************//**
  * @brief  Adjust time according to 2014.1.1 00:00:00 and store the sum of second to PWRCU_BAKREG_1 register.
  * @param  AdjustTime: pointer to Time_T structure that contains the previously configuration values.
  * @retval The status of the time adjustment, 0 (Fail) or 1 (Success)
  ***********************************************************************************************************/
u8 AP_Time_Adjust(Time_T* AdjustTime)
{
  u32 i, temp, secsum = 0;

  temp = AdjustTime->year - 1;
  for (i = 0; i < (AdjustTime->year - 2014); i++)
  {
    if (IsLeapYear(temp--) == TRUE)
    {
      secsum += (366 * 86400);
    }
    else
    {
      secsum += (365 * 86400);
    }
  }

  temp = 1;
  for (i = 0; i < (AdjustTime->month - 1); i++)
  {
    if (temp == 2)
    {
      if (IsLeapYear(AdjustTime->year) == TRUE)
        secsum += (29 * 86400);
      else
        secsum += (28 * 86400);
    }
    else
    {
      secsum += (Day_Per_Month[temp] * 86400);
    }
    temp++;
  }

  secsum += ((AdjustTime->day - 1) * 86400);
  secsum += (AdjustTime->hour * 3600 );
  secsum += (AdjustTime->minute * 60);
  secsum += (AdjustTime->second);

  PWRCU_WriteBackupRegister((PWRCU_BAKREG_Enum) PWRCU_BAKREG_1_RTC_SECOND, secsum);
  if (PWRCU_ReadBackupRegister((PWRCU_BAKREG_Enum) PWRCU_BAKREG_1_RTC_SECOND) != secsum)
  {
    return 0;
  }

  return 1;
}

/*********************************************************************************************************//**
  * @brief  Shows the current time YYYY.MM.DD HH:MM:SS on the Hyperterminal.
  * @retval None
  ***********************************************************************************************************/
void AP_Time_Show(void)
{
  AP_Time_Count(&CurTime);

  printf("\r%04d.%02d.%02d %02d:%02d:%02d",
                  CurTime.year,
                  CurTime.month,
                  CurTime.day,
                  CurTime.hour,
                  CurTime.minute,
                  CurTime.second);
}

/*********************************************************************************************************//**
  * @brief  Calculate the current time.
  * @param  CurrentTime: pointer to Time_T structure that contains the current time values.
  * @retval The status of the time calculation, 0 (Fail) or 1 (Success)
  ***********************************************************************************************************/
u8 AP_Time_Count(Time_T* CurrentTime)
{
  u32 i, secsum = 0, temp = 0;

  secsum = PWRCU_ReadBackupRegister((PWRCU_BAKREG_Enum) PWRCU_BAKREG_1_RTC_SECOND);
  secsum += RTC_GetCounter();

  temp = 0;
  while (secsum >= (365 * 86400))
  {
    if (IsLeapYear(2014 + temp))
    {
      if (secsum >= (366 * 86400))
      {
        temp++;
        secsum -= (366 * 86400);
      }
      else
      {
        break;
      }
    }
    else
    {
      temp++;
      secsum -= (365 * 86400);
    }
  }
  CurrentTime->year = 2014 + temp;

  for (i = 1; i <= 12; i++)
  {
    if (secsum >= (Day_Per_Month[i] * 86400))
    {
      if (i == 2)  // February
      {
        if (IsLeapYear(CurrentTime->year))
        {
          if (secsum >= (29 * 86400))
            secsum -= (29 * 86400);
          else
            break;
        }
        else
        {
          secsum -= (28 * 86400);
        }
      }
      else
      {
        secsum -= (Day_Per_Month[i] * 86400);
      }
    }
    else
    {
      break;
    }
  }
  CurrentTime->month = i;

  CurrentTime->day = secsum / 86400 + 1;
  secsum -= ((CurrentTime->day - 1) * 86400);

  CurrentTime->hour = secsum / 3600;
  CurrentTime->minute = (secsum % 3600) / 60;
  CurrentTime->second = (secsum % 3600) % 60;

  return 1;
}

/*********************************************************************************************************//**
 * @brief Configures RTC.
 * @retval None
 * @details RTC configuration as following:
 *  - S/W reset the Backup Domain.
 *  - Configure Low Speed External clock (LSE).
 *    - The LSE use fast startup mode. Shortly startup time but higher power consumption.
 *    - Enable the LSE. Waits till LSE is ready.
 *  - Configure RTC.
 *    - Select LSE as RTC Clock Source.
 *    - Enable the RTC Second interrupt.
 *    - RTC prescaler = 32768 to generate 1 second interrupt.
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

  RTC_IntConfig(RTC_INT_CSEC, ENABLE);
  RTC_SetPrescaler(RTC_RPRE_32768);

  /* Restart counter when match event occurred                                                              */
  RTC_CMPCLRCmd(ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Determine if a year is a leap year or not.
    * @param  year: a specific year.
  * @retval The status of the leap year check, TRUE or FALSE.
  ***********************************************************************************************************/
static bool IsLeapYear(u32 year)
{
  if (((year % 4 == 0) && (year % 100 != 0) ) || (year % 400 == 0) )
    return TRUE;
  else
    return FALSE;
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
