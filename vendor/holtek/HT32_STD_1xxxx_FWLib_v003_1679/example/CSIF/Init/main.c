/*********************************************************************************************************//**
 * @file    CSIF/Init/main.c
 * @version $Rev:: 204          $
 * @date    $Date:: 2017-06-20 #$
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

/** @addtogroup CSIF_Examples CSIF
  * @{
  */

/** @addtogroup CSIF_Init
  * @{
  */

/* Private constants ---------------------------------------------------------------------------------------*/
#define Capture_Width     64
#define Capture_Height    64

#define Capture_Size      Capture_Width * Capture_Height

/* Private function prototypes -----------------------------------------------------------------------------*/
void NVIC_Configuration(void);
void CKCU_Configuration(void);
void GPIO_Configuration(void);
void USART_Configuration(void);

void CSIF_Configuration(void);
void PDMA_Configuration(void);

/* Private variables ---------------------------------------------------------------------------------------*/
CSIF_BasicInitTypeDef CSIF_BasicInitStructure;
CSIF_WindowInitTypeDef CSIF_WindowInitStructure;
CSIF_SubSampleInitTypeDef CSIF_SubSampleInitStructure;

PDMACH_InitTypeDef PDMACH_InitStructure;

vu8 CaptureFinished = 0;
vu32 Rx_Buffer[Capture_Size] = {0};

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  Main program.
  * @retval None
  ***********************************************************************************************************/
int main(void)
{
  NVIC_Configuration();               /* NVIC configuration                                                 */
  CKCU_Configuration();               /* System Related configuration                                       */
  GPIO_Configuration();               /* GPIO Related configure                                             */

  CSIF_Configuration();               /* CSIF configure                                                     */

  while (1)
  {
    /* PDMA configure                                                                                       */
    PDMA_Configuration();

    /* Enable CSIF to capture                                                                               */
    CSIF_Cmd(ENABLE);

    /* Wait for CSIF captures finish and PDMA transfers completely                                          */
    while (!CaptureFinished);

    /* Disable CSIF to capture                                                                              */
    CSIF_Cmd(DISABLE);
  }

}

/*********************************************************************************************************//**
  * @brief  Configures NVIC interrupts.
  * @retval None
  ***********************************************************************************************************/
void NVIC_Configuration(void)
{
  /* Enable PDMA NVIC interrupt                                                                             */
  NVIC_EnableIRQ(PDMACH0_IRQn);
  /* Enable CSIF NVIC interrupt                                                                             */
  NVIC_EnableIRQ(CSIF_IRQn);
}

/*********************************************************************************************************//**
  * @brief  Configures the system clocks.
  * @retval None
  ***********************************************************************************************************/
void CKCU_Configuration(void)
{
  CKCU_PeripClockConfig_TypeDef CKCUClock = {{0}};

  CKCUClock.Bit.AFIO         = 1;
  CKCUClock.Bit.PDMA         = 1;
  CKCUClock.Bit.CSIF         = 1;
  CKCU_PeripClockConfig(CKCUClock, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Configures the GPIO ports.
  * @retval None
  ***********************************************************************************************************/
void GPIO_Configuration(void)
{
  /*  Configure CSIF PCK, MCK pin                                                                           */
  AFIO_GPxConfig(GPIO_PE, AFIO_PIN_10 | AFIO_PIN_11, AFIO_MODE_12);
  /*  Configure CSIF HSYNC, VSYNC pin                                                                       */
  AFIO_GPxConfig(GPIO_PE, AFIO_PIN_9 | AFIO_PIN_8, AFIO_MODE_12);
  /*  Configure CSIF D0 ~ D3 pin                                                                            */
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_0 | AFIO_PIN_1 | AFIO_PIN_2 | AFIO_PIN_3, AFIO_MODE_12);
  /*  Configure CSIF D4 ~ D5 pin                                                                            */
  AFIO_GPxConfig(GPIO_PD, AFIO_PIN_5 | AFIO_PIN_4, AFIO_MODE_12);
  /*  Configure CSIF D6 ~ D7 pin                                                                            */
  AFIO_GPxConfig(GPIO_PA, AFIO_PIN_6 | AFIO_PIN_7, AFIO_MODE_12);
}

/*********************************************************************************************************//**
  * @brief  Configures CSIF.
  * @retval None
  ***********************************************************************************************************/
void CSIF_Configuration(void)
{
  /*  CSIF Basic Configuration                                                                              */
  CSIF_BasicInitStructure.CSIF_Format = CSIF_FORMAT_YUV422;
  CSIF_BasicInitStructure.CSIF_VSYNCType = CSIF_VSYNCTYPE_OVERLAP;
  CSIF_BasicInitStructure.CSIF_HSYNCType = CSIF_HSYNCTYPE_DISCONTINUOUS;
  CSIF_BasicInitStructure.CSIF_SampleEdge = CSIF_SAMPLEEDGE_RISING;
  CSIF_BasicInitStructure.CSIF_VSYNCPolarity = CSIF_VSYNCPOLARITY_HIGH;
  CSIF_BasicInitStructure.CSIF_HSYNCPolarity = CSIF_HSYNCPOLARITY_HIGH;
  CSIF_BasicInitStructure.CSIF_LineDelay = 0;
  CSIF_BasicInitStructure.CSIF_FrameDelay = 0;
  CSIF_BasicInitStructure.CSIF_ImageWidth = 320;
  CSIF_BasicInitStructure.CSIF_ImageHeight = 240;
  CSIF_BasicInit(&CSIF_BasicInitStructure);

  /*  CSIF Winodw Configuration                                                                             */
  CSIF_WindowInitStructure.CSIF_Window = CSIF_WINDOW_ENABLE;
  CSIF_WindowInitStructure.CSIF_HorizontalStartPoint = 30;
  CSIF_WindowInitStructure.CSIF_VerticalStartPoint = 20;
  CSIF_WindowInitStructure.CSIF_WindowWidth = Capture_Width;
  CSIF_WindowInitStructure.CSIF_WindowHeight = Capture_Height;
  CSIF_WindowInit(&CSIF_WindowInitStructure);

  /*  CSIF Sub-Sample Configuration                                                                         */
  CSIF_SubSampleInitStructure.CSIF_SubSample = CSIF_SUBSAMPLE_ENABLE;
  CSIF_SubSampleInitStructure.CSIF_ColumnSkipMaskLength = 2;
  CSIF_SubSampleInitStructure.CSIF_RowSkipMaskLength = 2;
  CSIF_SubSampleInitStructure.CSIF_ColumnSkipMask = 0x1;
  CSIF_SubSampleInitStructure.CSIF_RowSkipMask = 0x1;
  CSIF_SubSampleInit(&CSIF_SubSampleInitStructure);

  CSIF_SetMasterClockPrescaler(6);  /* CSIF Master clock: PLL/6 = 24 MHz                                    */
  /* Enable CSIF Master clock                                                                               */
  CSIF_MasterClockCmd(ENABLE);

  /* Enable CSIF Bad Frame interrupt                                                                        */
  CSIF_IntConfig(CSIF_INT_BADFRAME, ENABLE);
}

/*********************************************************************************************************//**
  * @brief  Configures PDMA.
  * @retval None
  ***********************************************************************************************************/
void PDMA_Configuration(void)
{
  /* PDAM configuration                                                                                     */
  PDMACH_InitStructure.PDMACH_SrcAddr = 0x400CC020;
  PDMACH_InitStructure.PDMACH_DstAddr = (u32)Rx_Buffer;
  PDMACH_InitStructure.PDMACH_BlkCnt = Capture_Size/32;
  PDMACH_InitStructure.PDMACH_BlkLen = 8;
  PDMACH_InitStructure.PDMACH_DataSize = WIDTH_32BIT;
  PDMACH_InitStructure.PDMACH_Priority = VH_PRIO;
  PDMACH_InitStructure.PDMACH_AdrMod = SRC_ADR_CIR_INC | DST_ADR_LIN_INC;
  PDMA_Config(PDMA_CH0, &PDMACH_InitStructure);

  /* Enable PDAM Transfer Complete interrupt                                                                */
  PDMA_IntConfig(PDMA_CH0, PDMA_INT_TC | PDMA_INT_GE, ENABLE);
  /* Enable PDAM Channel 0                                                                                  */
  PDMA_EnaCmd(PDMA_CH0, ENABLE);
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
