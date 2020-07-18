/*********************************************************************************************************//**
 * @file    PDMA/SoftwareTrigger/main.c
 * @version $Rev:: 160          $
 * @date    $Date:: 2017-06-14 #$
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

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup PDMA_Examples PDMA
  * @{
  */

/** @addtogroup SoftwareTrigger
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
uc8 PdmaCh0SrcBuf[8] = { 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08 };
u8 PdmaCh0DstBuf[8];

u16 PdmaCh1DstBuf[4];

u32 PdmaCh2SrcBuf[2] = { 0x01234567, 0x89ABCDEF };
u32 PdmaCh2DstBuf[6];

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  PDMACH_InitTypeDef PDMACH_InitStructure;
  u32 i, j, err = 0;

  /*
     Configures the system clock in startup file (startup_ht32fxxxx.s)
     by calling SystemInit function. Please refer to system_ht32fxxxx.c.
  */

  CKCUClock.Bit.PDMA       = 1;
  CKCUClock.Bit.GPTM0      = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
  HT_GPTM0->CNTR = 0x55AA;

  /* ch0: FLASH to SRAM, linear increment to linear decrement, 8-bit */
  PDMACH_InitStructure.PDMACH_SrcAddr   = (u32)(&PdmaCh0SrcBuf[0]);
  PDMACH_InitStructure.PDMACH_DstAddr   = (u32)(&PdmaCh0DstBuf[7]);
  PDMACH_InitStructure.PDMACH_AdrMod    = SRC_ADR_LIN_INC | DST_ADR_LIN_DEC;
  PDMACH_InitStructure.PDMACH_Priority  = M_PRIO;
  PDMACH_InitStructure.PDMACH_BlkCnt    = 2;
  PDMACH_InitStructure.PDMACH_BlkLen    = 4;
  PDMACH_InitStructure.PDMACH_DataSize  = WIDTH_8BIT;
  PDMA_Config(PDMA_CH0, &PDMACH_InitStructure);
  
  PDMA_IntConfig(PDMA_CH0, (PDMA_INT_GE | PDMA_INT_TC), ENABLE);
  PDMA_EnaCmd(PDMA_CH0, ENABLE);  
  
  PDMA_SwTrigCmd(PDMA_CH0, ENABLE);
  while (PDMA_GetFlagStatus(PDMA_CH0, PDMA_FLAG_TC) != SET);
  PDMA_ClearFlag(PDMA_CH0, PDMA_INT_GE);

  for (i=0; i<8; i++)
  {
    if (PdmaCh0DstBuf[7-i] != PdmaCh0SrcBuf[i])
      err++;
  }

  while (err != 0);

  /* ch1: Register to SRAM, fixed address to linear increment, 16-bit */
  PDMACH_InitStructure.PDMACH_SrcAddr   = (u32)(&HT_GPTM0->CNTR);
  PDMACH_InitStructure.PDMACH_DstAddr   = (u32)(&PdmaCh1DstBuf[0]);
  PDMACH_InitStructure.PDMACH_AdrMod    = SRC_ADR_FIX | DST_ADR_LIN_INC;
  PDMACH_InitStructure.PDMACH_Priority  = H_PRIO;
  PDMACH_InitStructure.PDMACH_BlkCnt    = 4;
  PDMACH_InitStructure.PDMACH_BlkLen    = 1;
  PDMACH_InitStructure.PDMACH_DataSize  = WIDTH_16BIT;
  PDMA_Config(PDMA_CH1, &PDMACH_InitStructure);
  
  PDMA_IntConfig(PDMA_CH1, (PDMA_INT_GE | PDMA_INT_TC), ENABLE);
  PDMA_EnaCmd(PDMA_CH1, ENABLE);

  PDMA_SwTrigCmd(PDMA_CH1, ENABLE);
  while (PDMA_GetFlagStatus(PDMA_CH1, PDMA_FLAG_TC) != SET);
  PDMA_ClearFlag(PDMA_CH1, PDMA_INT_GE);

  for (i=0; i<4; i++)
  {
    if (PdmaCh1DstBuf[i] != HT_GPTM0->CNTR)
      err++;
  }

  while (err != 0);

  /* ch2: SRAM to SRAM, circular increment to linear increment, 32-bit */
  PDMACH_InitStructure.PDMACH_SrcAddr   = (u32)(&PdmaCh2SrcBuf[0]);
  PDMACH_InitStructure.PDMACH_DstAddr   = (u32)(&PdmaCh2DstBuf[0]);
  PDMACH_InitStructure.PDMACH_AdrMod    = SRC_ADR_CIR_INC | DST_ADR_LIN_INC;
  PDMACH_InitStructure.PDMACH_Priority  = L_PRIO;
  PDMACH_InitStructure.PDMACH_BlkCnt    = 3;
  PDMACH_InitStructure.PDMACH_BlkLen    = 2;
  PDMACH_InitStructure.PDMACH_DataSize  = WIDTH_32BIT;
  PDMA_Config(PDMA_CH2, &PDMACH_InitStructure);
  
  PDMA_IntConfig(PDMA_CH2, (PDMA_INT_GE | PDMA_INT_TC), ENABLE);
  PDMA_EnaCmd(PDMA_CH2, ENABLE);

  PDMA_SwTrigCmd(PDMA_CH2, ENABLE);
  while (PDMA_GetFlagStatus(PDMA_CH2, PDMA_FLAG_TC) != SET);
  PDMA_ClearFlag(PDMA_CH2, PDMA_INT_GE);

  for (i=0; i<3; i++)
  {
    for (j=0; j<2; j++)
    {
      if (PdmaCh2DstBuf[j] != PdmaCh2SrcBuf[j])
        err++;
    }
  }

  while (err != 0);
  
  while(1);
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
