/*********************************************************************************************************//**
 * @file    Mono_LCD/8CHAR_14SEG_Demo/main.c
 * @version $Rev:: 4179         $
 * @date    $Date:: 2019-08-03 #$
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
#include "ht32_board_config.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup Mono_LCD_Examples Mono_LCD
  * @{
  */

/** @addtogroup 8CHAR_14SEG_Demo
  * @{
  */

/* Settings ------------------------------------------------------------------------------------------------*/
#define DELAY_COUNTER               600000

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void show_number(u8 seg_n, u8 number);

/* Global functions ----------------------------------------------------------------------------------------*/
vu32 isUpdateDisplayFinish;

/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  int number = 0;
  vu32 delay;
  LCD_InitTypeDef LCD_InitStructure;
  NVIC_Configuration();
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configuration                                         */

  /* LCDCLK config */
  CKCU_LCDClockConfig(CKCU_LCDSRC_LSI);

  /* LCD initialization */
  LCD_InitStructure.LCD_Divider = LCD_Divider_17;     //16+1 = 17 (LCDDIV = 1)
  LCD_InitStructure.LCD_Prescaler = LCD_Prescaler_16; //2^4 = 16 (LCDPS = 4)
  LCD_InitStructure.LCD_Duty = LCD_Duty_1_4;          //LCD_Mode_QuarterDuty_ThirdBias; //LCDPS = 4, LCDDIV = 1, 1/4 duty, LCDCLK = 32KHz -> frame rate = 30.12Hz
  LCD_InitStructure.LCD_Bias = LCD_Bias_1_3;
  LCD_InitStructure.LCD_VoltageSource = LCD_VoltageSource_Internal;
  LCD_InitStructure.LCD_Waveform = LCD_Type_A_Waveform;
  LCD_DriverInit(&LCD_InitStructure);

  /* Charge pump config */
  LCD_ChargePumpConfig(LCD_ChargePump_2V65);
  while(LCD_GetFlagStatus(LCD_FLAG_RDY) == RESET);      //wait for charge pump ready

  /* LCD Interrupt */
  LCD_ClearFlag(LCD_CLR_UDD | LCD_CLR_SOF);
  LCD_IntConfig(LCD_INT_UDD | LCD_INT_SOF, ENABLE);

  /* Enable LCD */
  LCD_Cmd(ENABLE);

  while(1)
  {
    number > 9 ? number = 0: number;
    show_number(1, number);
    show_number(2, number);
    show_number(3, number);
    show_number(4, number);
    show_number(5, number);
    show_number(6, number);
    show_number(7, number);
    show_number(8, number);
    show_number(9, number);
    LCD_SetUpdateDisplayRequest();
    isUpdateDisplayFinish = FALSE;
    delay = DELAY_COUNTER;
    while((isUpdateDisplayFinish == FALSE) || (delay != 0))
    {
      __nop();
      delay--;
    }
    number++;
  }
}
/*********************************************************************************************************//**
  * @brief  Configure the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{ 0 }};
  CKCUClock.Bit.LCDC          = 1;
  CKCUClock.Bit.LCDR          = 1;
  CKCUClock.Bit.PA            = 1;
  CKCUClock.Bit.AFIO          = 1;
  CKCUClock.Bit.BFTM0         = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Configure the NVIC vector table.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  NVIC_EnableIRQ(LCD_IRQn);
}

#if (ENABLE_CKOUT == 1)
/*********************************************************************************************************//**
  * @brief  Configure the debug output clock.
  * @retval None
  ***********************************************************************************************************/
void CKOUTConfig(void)
{
  CKCU_CKOUTInitTypeDef CKOUTInit;

  AFIO_GPAConfig(AFIO_PIN_9, AFIO_MODE_15);
  CKOUTInit.CKOUTSRC = CKCU_CKOUTSRC_HCLKC_DIV16;
  CKCU_CKOUTConfig(&CKOUTInit);
}
#endif

/*********************************************************************************************************//**
  * @brief  Configure the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  AFIO_GPxConfig(HTCFG_LCD_COM0_GPIO_ID,  HTCFG_LCD_COM0_AFIO_PIN,  AFIO_FUN_LCD);   //COM0
  AFIO_GPxConfig(HTCFG_LCD_COM1_GPIO_ID,  HTCFG_LCD_COM1_AFIO_PIN,  AFIO_FUN_LCD);   //COM1
  AFIO_GPxConfig(HTCFG_LCD_COM2_GPIO_ID,  HTCFG_LCD_COM2_AFIO_PIN,  AFIO_FUN_LCD);   //COM2
  AFIO_GPxConfig(HTCFG_LCD_COM3_GPIO_ID,  HTCFG_LCD_COM3_AFIO_PIN,  AFIO_FUN_LCD);   //COM3

  AFIO_GPxConfig(HTCFG_LCD_SEG0_GPIO_ID,  HTCFG_LCD_SEG0_AFIO_PIN,  AFIO_FUN_LCD);   //SEG0
  AFIO_GPxConfig(HTCFG_LCD_SEG1_GPIO_ID,  HTCFG_LCD_SEG1_AFIO_PIN,  AFIO_FUN_LCD);   //SEG1
  AFIO_GPxConfig(HTCFG_LCD_SEG2_GPIO_ID,  HTCFG_LCD_SEG2_AFIO_PIN,  AFIO_FUN_LCD);   //SEG2
  AFIO_GPxConfig(HTCFG_LCD_SEG3_GPIO_ID,  HTCFG_LCD_SEG3_AFIO_PIN,  AFIO_FUN_LCD);   //SEG3
  AFIO_GPxConfig(HTCFG_LCD_SEG4_GPIO_ID,  HTCFG_LCD_SEG4_AFIO_PIN,  AFIO_FUN_LCD);   //SEG4
  AFIO_GPxConfig(HTCFG_LCD_SEG5_GPIO_ID,  HTCFG_LCD_SEG5_AFIO_PIN,  AFIO_FUN_LCD);   //SEG5
  AFIO_GPxConfig(HTCFG_LCD_SEG6_GPIO_ID,  HTCFG_LCD_SEG6_AFIO_PIN,  AFIO_FUN_LCD);   //SEG6
  AFIO_GPxConfig(HTCFG_LCD_SEG7_GPIO_ID,  HTCFG_LCD_SEG7_AFIO_PIN,  AFIO_FUN_LCD);   //SEG7
  AFIO_GPxConfig(HTCFG_LCD_SEG8_GPIO_ID,  HTCFG_LCD_SEG8_AFIO_PIN,  AFIO_FUN_LCD);   //SEG8
  AFIO_GPxConfig(HTCFG_LCD_SEG9_GPIO_ID,  HTCFG_LCD_SEG9_AFIO_PIN,  AFIO_FUN_LCD);   //SEG9
  AFIO_GPxConfig(HTCFG_LCD_SEG10_GPIO_ID, HTCFG_LCD_SEG10_AFIO_PIN, AFIO_FUN_LCD);   //SEG10
  AFIO_GPxConfig(HTCFG_LCD_SEG11_GPIO_ID, HTCFG_LCD_SEG11_AFIO_PIN, AFIO_FUN_LCD);   //SEG11
  AFIO_GPxConfig(HTCFG_LCD_SEG12_GPIO_ID, HTCFG_LCD_SEG12_AFIO_PIN, AFIO_FUN_LCD);   //SEG12
  AFIO_GPxConfig(HTCFG_LCD_SEG13_GPIO_ID, HTCFG_LCD_SEG13_AFIO_PIN, AFIO_FUN_LCD);   //SEG13
  AFIO_GPxConfig(HTCFG_LCD_SEG14_GPIO_ID, HTCFG_LCD_SEG14_AFIO_PIN, AFIO_FUN_LCD);   //SEG14
  AFIO_GPxConfig(HTCFG_LCD_SEG15_GPIO_ID, HTCFG_LCD_SEG15_AFIO_PIN, AFIO_FUN_LCD);   //SEG15
  AFIO_GPxConfig(HTCFG_LCD_SEG16_GPIO_ID, HTCFG_LCD_SEG16_AFIO_PIN, AFIO_FUN_LCD);   //SEG16
  AFIO_GPxConfig(HTCFG_LCD_SEG17_GPIO_ID, HTCFG_LCD_SEG17_AFIO_PIN, AFIO_FUN_LCD);   //SEG17
  AFIO_GPxConfig(HTCFG_LCD_SEG18_GPIO_ID, HTCFG_LCD_SEG18_AFIO_PIN, AFIO_FUN_LCD);   //SEG18
  AFIO_GPxConfig(HTCFG_LCD_SEG19_GPIO_ID, HTCFG_LCD_SEG19_AFIO_PIN, AFIO_FUN_LCD);   //SEG19
  AFIO_GPxConfig(HTCFG_LCD_SEG20_GPIO_ID, HTCFG_LCD_SEG20_AFIO_PIN, AFIO_FUN_LCD);   //SEG20
  AFIO_GPxConfig(HTCFG_LCD_SEG21_GPIO_ID, HTCFG_LCD_SEG21_AFIO_PIN, AFIO_FUN_LCD);   //SEG21
  AFIO_GPxConfig(HTCFG_LCD_SEG22_GPIO_ID, HTCFG_LCD_SEG22_AFIO_PIN, AFIO_FUN_LCD);   //SEG22
  AFIO_GPxConfig(HTCFG_LCD_SEG23_GPIO_ID, HTCFG_LCD_SEG23_AFIO_PIN, AFIO_FUN_LCD);   //SEG23
  AFIO_GPxConfig(HTCFG_LCD_SEG24_GPIO_ID, HTCFG_LCD_SEG24_AFIO_PIN, AFIO_FUN_LCD);   //SEG24
  AFIO_GPxConfig(HTCFG_LCD_SEG25_GPIO_ID, HTCFG_LCD_SEG25_AFIO_PIN, AFIO_FUN_LCD);   //SEG25
  AFIO_GPxConfig(HTCFG_LCD_SEG26_GPIO_ID, HTCFG_LCD_SEG26_AFIO_PIN, AFIO_FUN_LCD);   //SEG26
  AFIO_GPxConfig(HTCFG_LCD_SEG27_GPIO_ID, HTCFG_LCD_SEG27_AFIO_PIN, AFIO_FUN_LCD);   //SEG27
  AFIO_GPxConfig(HTCFG_LCD_SEG28_GPIO_ID, HTCFG_LCD_SEG28_AFIO_PIN, AFIO_FUN_LCD);   //SEG28
  #if defined(HTCFG_LCD_SEG32_MODE)
  AFIO_GPxConfig(HTCFG_LCD_SEG29_GPIO_ID, HTCFG_LCD_SEG29_AFIO_PIN, AFIO_FUN_LCD);   //SEG29
  AFIO_GPxConfig(HTCFG_LCD_SEG30_GPIO_ID, HTCFG_LCD_SEG30_AFIO_PIN, AFIO_FUN_LCD);   //SEG30
  AFIO_GPxConfig(HTCFG_LCD_SEG31_GPIO_ID, HTCFG_LCD_SEG31_AFIO_PIN, AFIO_FUN_LCD);   //SEG31
  #endif
}

/*********************************************************************************************************//**
  * @brief Show number.
  * @param seg_n: Number's position.
  * @param number: Number.
  * @retval None
  ***********************************************************************************************************/
void show_number(u8 seg_n, u8 number)
{
/* VIM-878 */
/* SEG     0    1    2    3    _  4    5    6    7   _  8    9    10   11  _  12   13  14   15  */
/* COM0    1E   1L   2D   2L   _  3D   3L   4D   4L  _  5D   5L   6D   6L  _  7D   7L  8D   8L  */
/* COM1    1K   1K   2E   2K   _  3E   3K   4E   4K  _  5E   5K   6E   6K  _  7E   7K  8E   8K  */
/* COM2    1J   1J   2F   2J   _  3F   3J   4F   4J  _  5F   5J   6F   6J  _  7F   7J  8F   8J  */
/* COM3    CA1  1I   CA2  2I   _  CA3  3I   CA4  4I  _  CA5  5I   CA6  6I  _  CA7  7I  CA8  8I  */

/* SEG     16   17   18   19   _  20   21   22   23  _  24   25   26   27  _  28   29  30   31   */
/* COM0    1M   DP1  2M   DP2  _  3M   DP3  4M   DP4 _  5M   DP5  6M   DP6 _  7M   DP7 8y   DP8  */
/* COM1    1N   1C   2N   2C   _  3N   3C   4N   4C  _  5N   5C   6N   6C  _  7N   7C  8N   8C   */
/* COM2    1G   1B   2G   2B   _  3G   3B   4G   4B  _  5G   5B   6G   6B  _  7G   7B  8G   8B   */
/* COM3    1H   1A   2H   2A   _  3H   3A   4H   4A  _  5H   5A   6H   6A  _  7H   7A  8H   8A   */
  u32 num[4];

  switch(number)
  {
    case 0:
      num[0]= 0x00001;
      num[1]= 0x20001;
      num[2]= 0x20001;
      num[3]= 0x20000;
      break;
    case 1:
      num[0]= 0x00000;
      num[1]= 0x20000;
      num[2]= 0x20000;
      num[3]= 0x00000;
      break;
    case 2:
      num[0]= 0x00001;
      num[1]= 0x00003;
      num[2]= 0x30000;
      num[3]= 0x20000;
      break;
    case 3:
      num[0]= 0x00001;
      num[1]= 0x20002;
      num[2]= 0x30000;
      num[3]= 0x20000;
      break;
    case 4:
      num[0]= 0x00000;
      num[1]= 0x20002;
      num[2]= 0x30001;
      num[3]= 0x00000;
      break;
    case 5:
      num[0]= 0x00001;
      num[1]= 0x20002;
      num[2]= 0x10001;
      num[3]= 0x20000;
      break;
    case 6:
      num[0]= 0x00001;
      num[1]= 0x20003;
      num[2]= 0x10001;
      num[3]= 0x00000;
      break;
    case 7:
      num[0]= 0x00000;
      num[1]= 0x20000;
      num[2]= 0x20000;
      num[3]= 0x20000;
      break;
    case 8:
      num[0]= 0x00001;
      num[1]= 0x20003;
      num[2]= 0x30001;
      num[3]= 0x20000;
      break;
    case 9:
      num[0]= 0x00000;
      num[1]= 0x20002;
      num[2]= 0x30001;
      num[3]= 0x20000;
      break;
  }

  switch(seg_n)
  {
    case 1:
      HT_LCD->RAM[0] &= 0xfffcfffc;
      HT_LCD->RAM[2] &= 0xfffcfffc;
      HT_LCD->RAM[4] &= 0xfffcfffc;
      HT_LCD->RAM[6] &= 0xfffcfffc;
      HT_LCD->RAM[0] |= num[0];
      HT_LCD->RAM[2] |= num[1];
      HT_LCD->RAM[4] |= num[2];
      HT_LCD->RAM[6] |= num[3];
      break;
    case 2:
      HT_LCD->RAM[0] &= 0xfff3fff3;
      HT_LCD->RAM[2] &= 0xfff3fff3;
      HT_LCD->RAM[4] &= 0xfff3fff3;
      HT_LCD->RAM[6] &= 0xfff3fff3;
      HT_LCD->RAM[0] |= num[0]<<2;
      HT_LCD->RAM[2] |= num[1]<<2;
      HT_LCD->RAM[4] |= num[2]<<2;
      HT_LCD->RAM[6] |= num[3]<<2;
      break;
    case 3:
      HT_LCD->RAM[0] &= 0xffcfffcf;
      HT_LCD->RAM[2] &= 0xffcfffcf;
      HT_LCD->RAM[4] &= 0xffcfffcf;
      HT_LCD->RAM[6] &= 0xffcfffcf;
      HT_LCD->RAM[0] |= num[0]<<4;
      HT_LCD->RAM[2] |= num[1]<<4;
      HT_LCD->RAM[4] |= num[2]<<4;
      HT_LCD->RAM[6] |= num[3]<<4;
      break;
    case 4:
      HT_LCD->RAM[0] &= 0xff3fff3f;
      HT_LCD->RAM[2] &= 0xff3fff3f;
      HT_LCD->RAM[4] &= 0xff3fff3f;
      HT_LCD->RAM[6] &= 0xff3fff3f;
      HT_LCD->RAM[0] |= num[0]<<6;
      HT_LCD->RAM[2] |= num[1]<<6;
      HT_LCD->RAM[4] |= num[2]<<6;
      HT_LCD->RAM[6] |= num[3]<<6;
      break;
    case 5:
      HT_LCD->RAM[0] &= 0xfcfffcff;
      HT_LCD->RAM[2] &= 0xfcfffcff;
      HT_LCD->RAM[4] &= 0xfcfffcff;
      HT_LCD->RAM[6] &= 0xfcfffcff;
      HT_LCD->RAM[0] |= num[0]<<8;
      HT_LCD->RAM[2] |= num[1]<<8;
      HT_LCD->RAM[4] |= num[2]<<8;
      HT_LCD->RAM[6] |= num[3]<<8;
      break;
    case 6:
      HT_LCD->RAM[0] &= 0xf3fff3ff;
      HT_LCD->RAM[2] &= 0xf3fff3ff;
      HT_LCD->RAM[4] &= 0xf3fff3ff;
      HT_LCD->RAM[6] &= 0xf3fff3ff;
      HT_LCD->RAM[0] |= num[0]<<10;
      HT_LCD->RAM[2] |= num[1]<<10;
      HT_LCD->RAM[4] |= num[2]<<10;
      HT_LCD->RAM[6] |= num[3]<<10;
      break;
    case 7:
      HT_LCD->RAM[0] &= 0xcfffcfff;
      HT_LCD->RAM[2] &= 0xcfffcfff;
      HT_LCD->RAM[4] &= 0xcfffcfff;
      HT_LCD->RAM[6] &= 0xcfffcfff;
      HT_LCD->RAM[0] |= num[0]<<12;
      HT_LCD->RAM[2] |= num[1]<<12;
      HT_LCD->RAM[4] |= num[2]<<12;
      HT_LCD->RAM[6] |= num[3]<<12;
      break;
    case 8:
      HT_LCD->RAM[0] &= 0x3fff3fff;
      HT_LCD->RAM[2] &= 0x3fff3fff;
      HT_LCD->RAM[4] &= 0x3fff3fff;
      HT_LCD->RAM[6] &= 0x3fff3fff;
      HT_LCD->RAM[0] |= num[0]<<14;
      HT_LCD->RAM[2] |= num[1]<<14;
      HT_LCD->RAM[4] |= num[2]<<14;
      HT_LCD->RAM[6] |= num[3]<<14;
      break;
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


/**
  * @}
  */

/**
  * @}
  */

/**
  * @}
  */
