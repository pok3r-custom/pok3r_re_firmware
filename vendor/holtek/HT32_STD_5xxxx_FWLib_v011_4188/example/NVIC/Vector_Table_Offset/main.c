/*********************************************************************************************************//**
 * @file    NVIC/Vector_Table_Offset/main.c
 * @version $Rev:: 2925         $
 * @date    $Date:: 2018-07-27 #$
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

/** @addtogroup NVIC_Examples NVIC
  * @{
  */

/** @addtogroup Vector_Table_Offset
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
#define VECTOR_BASED_ADDRESS    (0x20000000)
#define TOTAL_VECTOR            (64)
#define SYSTICK_VECTOR_COUNT    (15)

/* Private function prototypes -----------------------------------------------------------------------------*/
void InitVector(void);
void SysTick_HandlerExtra(void);

/* Global variables ----------------------------------------------------------------------------------------*/

u32 *RAMVector = (u32 *)VECTOR_BASED_ADDRESS;

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  /* Initialize LEDs                                                                                        */
  HT32F_DVB_LEDInit(HT_LED1);
  HT32F_DVB_LEDInit(HT_LED2);
  HT32F_DVB_LEDInit(HT_LED3);

  InitVector();

  // Must be 64 word (256 Bytes) aligned, 0x00 (0), 0x100 (256), 0x200 (512)
  NVIC_SetVectorTable(NVIC_VECTTABLE_RAM, VECTOR_BASED_ADDRESS);

  /* Generate SysTick Interrupt                                                                             */
  SysTick_Config(0xFFFFFF);

  while (1);
}

/*********************************************************************************************************//**
  * @brief  Init vector.
  * @retval None
  ***********************************************************************************************************/
void InitVector(void)
{
  s32 i = 0;

  for( i = TOTAL_VECTOR - 1; i >= 0; i--)
  {
    RAMVector[i] =  rw(i * 4);
  }

  RAMVector[SYSTICK_VECTOR_COUNT] = (u32)&SysTick_HandlerExtra;
}

/*********************************************************************************************************//**
 * @brief   This function handles SysTick Handler.
 * @retval  None
 ************************************************************************************************************/
void SysTick_HandlerExtra(void)
{
  /* Toggle LEDs */
  HT32F_DVB_LEDToggle(HT_LED1);
  HT32F_DVB_LEDToggle(HT_LED2);
  HT32F_DVB_LEDToggle(HT_LED3);
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
