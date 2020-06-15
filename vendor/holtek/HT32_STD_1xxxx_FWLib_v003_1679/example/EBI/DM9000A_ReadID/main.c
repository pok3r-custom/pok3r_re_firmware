/*********************************************************************************************************//**
 * @file    EBI/DM9000A_ReadID/main.c
 * @version $Rev:: 427          $
 * @date    $Date:: 2017-07-04 #$
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

#include "dm9000a.c"
#include "dm9000a.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup EBI_Examples EBI
  * @{
  */

/** @addtogroup DM9000A_ReadID
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
#define MAC_ADDR0   0xF0
#define MAC_ADDR1   0xF1
#define MAC_ADDR2   0xF2
#define MAC_ADDR3   0xF3
#define MAC_ADDR4   0xF4
#define MAC_ADDR5   0xF5

/* Private function prototypes -----------------------------------------------------------------------------*/
static void NVIC_Configuration(void);
static void CKCU_Configuration(void);
#if (ENABLE_CKOUT == 1)
void CKOUTConfig(void);
#endif

/* Private variables ---------------------------------------------------------------------------------------*/
DM9000_TypeDef DM9000Info;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  u32 uResult;

  NVIC_Configuration();               /* NVIC configuration                                                 */
  CKCU_Configuration();               /* System Related configuration                                       */
  RETARGET_Configuration();           /* Retarget Related configuration                                     */

  /*--------------------------------------------------------------------------------------------------------*/
  /* Set PB9 as EBI_CS0 function, to prevent LCD drive the EBI bus.                                         */
  /*--------------------------------------------------------------------------------------------------------*/
  HT32F_DVB_GPxConfig(LCD_EBI_CS_GPIO_ID, LCD_EBI_CS_AFIO_PIN, LCD_EBI_CS_AFIO_MODE);

  DM9000Info.uMACAddress[0] = MAC_ADDR0;
  DM9000Info.uMACAddress[1] = MAC_ADDR1;
  DM9000Info.uMACAddress[2] = MAC_ADDR2;
  DM9000Info.uMACAddress[3] = MAC_ADDR3;
  DM9000Info.uMACAddress[4] = MAC_ADDR4;
  DM9000Info.uMACAddress[5] = MAC_ADDR5;
  DM9000Info.SpeedMode = DM9000_AUTO;

  printf("\r\nInit DM9000A....\r\n");
  uResult = dm9000_init(&DM9000Info);

  if (uResult == 0)
  {
    printf("Init DM9000A Successful!\r\n\r\n");
  }
  else
  {
    printf("Init DM9000A Failed!\r\n\r\n");
  }

  while (1)                           /* Infinite loop                                                      */
  {
  }
}

/* Private functions ---------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Configure the NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
static void NVIC_Configuration(void)
{
  NVIC_SetVectorTable(NVIC_VECTTABLE_FLASH, 0x0);     /* Set the Vector Table base location at 0x00000000   */
}

/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
static void CKCU_Configuration(void)
{
#if 1
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.USART0     = 1;
  CKCUClock.Bit.USART1     = 1;
  CKCUClock.Bit.UART0      = 1;
  CKCUClock.Bit.UART1      = 1;
  CKCUClock.Bit.AFIO       = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
#endif

#if (ENABLE_CKOUT == 1)
  CKOUTConfig();
#endif
}

#if (ENABLE_CKOUT == 1)
/*********************************************************************************************************//**
  * @brief  Configure the debug output clock.
  * @retval None
  ***********************************************************************************************************/
static void CKOUTConfig(void)
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
