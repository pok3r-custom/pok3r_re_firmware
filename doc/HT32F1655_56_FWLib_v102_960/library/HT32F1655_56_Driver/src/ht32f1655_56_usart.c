/*********************************************************************************************************//**
 * @file    ht32f1655_56_usart.c
 * @version $Rev:: 921          $
 * @date    $Date:: 2015-09-16 #$
 * @brief   This file provides all the USART firmware functions.
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
 * <h2><center>Copyright (C) 2014 Holtek Semiconductor Inc. All rights reserved</center></h2>
 ************************************************************************************************************/

/* Includes ------------------------------------------------------------------------------------------------*/
#include "ht32f1655_56_usart.h"

/** @addtogroup HT32F1655_56_Peripheral_Driver HT32F1655/1656 Peripheral Driver
  * @{
  */

/** @defgroup  USART USART
  * @brief USART driver modules
  * @{
  */


/* Private constants ---------------------------------------------------------------------------------------*/
/** @defgroup USART_Private_Define USART private definitions
  * @{
  */
#define LCR_CLEAR_Mask            ((u32)0xFFFFFFE0)
#define MDR_CLEAR_Mask            ((u32)0xFFFFFFFC)
#define FCR_RFITL_CLEAR_Mask      ((u32)0xFFFFFF3F)
#define FCR_TFITL_CLEAR_Mask      ((u32)0xFFFFFFCF)
#define TRSM_CLEAR_Mask           ((u32)0xFFFFFFFB)
#define TPR_TG_Mask               ((u32)0xFFFF00FF)
#define RCR_ILPDVSR_Mask          ((u32)0xFFFF00FF)
#define TPR_RTOIC_Mask            ((u32)0xFFFFFF80)
#define DLR_BR_Mask               ((u32)0xFFFF0000)
#define RS485CR_ADDM_Mask         ((u32)0xFFFF00FF)

#define USART_IRDA_ON             ((u32)0x00000001)
#define USART_IRDA_OFF            ((u32)0xFFFFFFFE)

#define USART_BREAK_ON            ((u32)0x00000040)
#define USART_BREAK_OFF           ((u32)0xFFFFFFBF)

#define USART_TIMEOUT_ON          ((u32)0x00000080)
#define USART_TIMEOUT_OFF         ((u32)0xFFFFFF7F)

#define USART_SPE_ON              ((u32)0x00000020)
#define USART_SPE_OFF             ((u32)0xFFFFFFDF)

#define USART_TXEN_ON             ((u32)0x00000100)
#define USART_TXEN_OFF            ((u32)0xFFFFFEFF)

#define USART_RXEN_ON             ((u32)0x00000200)
#define USART_RXEN_OFF            ((u32)0xFFFFFDFF)

#define USART_TXINV_ON            ((u32)0x00000010)
#define USART_TXINV_OFF           ((u32)0xFFFFFFEF)

#define USART_RXINV_ON            ((u32)0x00000020)
#define USART_RXINV_OFF           ((u32)0xFFFFFFDF)

#define USART_HFCEN_ON            ((u32)0x00000004)
#define USART_HFCEN_OFF           ((u32)0xFFFFFFFB)

#define USART_TxPDMA_ON           ((u32)0x00000010)
#define USART_TxPDMA_OFF          ((u32)0xFFFFFFEF)

#define USART_RxPDMA_ON           ((u32)0x00000020)
#define USART_RxPDMA_OFF          ((u32)0xFFFFFFDF)

#define USART_RS485NMM_ON         ((u32)0x00000002)
#define USART_RS485NMM_OFF        ((u32)0xFFFFFFFD)

#define USART_RS485AAD_ON         ((u32)0x00000004)
#define USART_RS485AAD_OFF        ((u32)0xFFFFFFFB)
/**
  * @}
  */

/* Global functions ----------------------------------------------------------------------------------------*/
/** @defgroup USART_Exported_Functions USART exported functions
  * @{
  */
/*********************************************************************************************************//**
 * @brief Deinitialize registers of the USART peripheral by resetting USART.
 * @param USARTx: Parameter to select the UxART peripheral.
 * @retval None
 ************************************************************************************************************/
void USART_DeInit(HT_USART_TypeDef* USARTx)
{
  RSTCU_PeripReset_TypeDef RSTCUReset = {{0}};

  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));

  if (USARTx == HT_USART0)
  {
    RSTCUReset.Bit.USART0 = 1;
  }
  else if (USARTx == HT_USART1)
  {
    RSTCUReset.Bit.USART1 = 1;
  }
  else if (USARTx == HT_UART0)
  {
    RSTCUReset.Bit.UART0 = 1;
  }
  else
  {
    RSTCUReset.Bit.UART1 = 1;
  }

  RSTCU_PeripReset(RSTCUReset, ENABLE);
}

/*********************************************************************************************************//**
 * @brief Initialize the USARTx peripheral according to the specified parameters in the USART_InitStruct.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_InitStruct: pointer to a USART_InitTypeDef structure that contains the configuration
 *        information for the specified USART peripheral.
 * @retval None
 ************************************************************************************************************/
void USART_Init(HT_USART_TypeDef* USARTx, USART_InitTypeDef* USART_InitStruct)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_BAUDRATE(USART_InitStruct->USART_BaudRate));
  Assert_Param(IS_USART_WORD_LENGTH(USART_InitStruct->USART_WordLength));
  Assert_Param(IS_USART_STOPBITS(USART_InitStruct->USART_StopBits));
  Assert_Param(IS_USART_PARITY(USART_InitStruct->USART_Parity));
  Assert_Param(IS_USART_MODE(USART_InitStruct->USART_Mode));

  USARTx->LCR = (USARTx->LCR & LCR_CLEAR_Mask) | USART_InitStruct->USART_StopBits |
                 USART_InitStruct->USART_WordLength | USART_InitStruct->USART_Parity;

  USARTx->MDR = (USARTx->MDR & MDR_CLEAR_Mask) | USART_InitStruct->USART_Mode;

  USARTx->DLR = CKCU_GetUSARTClockFreq() / (u32)USART_InitStruct->USART_BaudRate;
}

/*********************************************************************************************************//**
 * @brief Fill each USART_InitStruct member with its default value.
 * @param USART_InitStruct: pointer to a USART_InitTypeDef structure which will be initialized.
 * @retval None
 ************************************************************************************************************/
void USART_StructInit(USART_InitTypeDef* USART_InitStruct)
{
  /* USART_InitStruct members default value                                                                 */
  USART_InitStruct->USART_BaudRate = 9600;
  USART_InitStruct->USART_WordLength = USART_WORDLENGTH_8B;
  USART_InitStruct->USART_StopBits = USART_STOPBITS_1;
  USART_InitStruct->USART_Parity = USART_PARITY_NO;
  USART_InitStruct->USART_Mode = USART_MODE_NORMAL;
}

/*********************************************************************************************************//**
 * @brief Initialize clock of the USARTx peripheral according to the specified parameters
 *        in the USART_ClockInitStruct.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_SynClock_InitStruct: pointer to a USART_SynClock_InitTypeDef structure that contains
 *        the configuration information for the specified USART peripheral.
 * @retval None
 ************************************************************************************************************/
void USART_SynClockInit(HT_USART_TypeDef* USARTx, USART_SynClock_InitTypeDef* USART_SynClock_InitStruct)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_SYNCHRONOUS_CLOCK(USART_SynClock_InitStruct->USART_ClockEnable));
  Assert_Param(IS_USART_SYNCHRONOUS_PHASE(USART_SynClock_InitStruct->USART_ClockPhase));
  Assert_Param(IS_USART_SYNCHRONOUS_POLARITY(USART_SynClock_InitStruct->USART_ClockPolarity));
  Assert_Param(IS_USART_TRANSFER_MODE(USART_SynClock_InitStruct->USART_TransferSelectMode));

  USARTx->SCR = USART_SynClock_InitStruct->USART_ClockEnable | USART_SynClock_InitStruct->USART_ClockPhase |
                USART_SynClock_InitStruct->USART_ClockPolarity;

  USARTx->MDR = (USARTx->MDR & TRSM_CLEAR_Mask) | USART_SynClock_InitStruct->USART_TransferSelectMode;
}

/*********************************************************************************************************//**
 * @brief Fill each USART_SynClockInitStruct member with its default value.
 * @param USART_SynClock_InitStruct: pointer to a USART_SynClock_InitTypeDef structure which will be initialized.
 * @retval None
 ************************************************************************************************************/
void USART_SynClockStructInit(USART_SynClock_InitTypeDef* USART_SynClock_InitStruct)
{
  /* USART_ClockInitStruct members default value                                                            */
  USART_SynClock_InitStruct->USART_ClockEnable =  USART_SYN_CLOCK_DISABLE;
  USART_SynClock_InitStruct->USART_ClockPhase = USART_SYN_CLOCK_PHASE_FIRST;
  USART_SynClock_InitStruct->USART_ClockPolarity = USART_SYN_CLOCK_POLARITY_LOW;
  USART_SynClock_InitStruct->USART_TransferSelectMode = USART_LSB_FIRST;
}

/*********************************************************************************************************//**
 * @brief USART SendData from Tx.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param Data: the data to be transmitted.
 * @retval None
 ************************************************************************************************************/
void USART_SendData(HT_USART_TypeDef* USARTx, u16 Data)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_DATA(Data));

  USARTx->RBR = Data;
}

/*********************************************************************************************************//**
 * @brief USART ReceiveData from Rx.
 * @param USARTx: Parameter to select the USART peripheral.
 * @return The received data.
 ************************************************************************************************************/
u16 USART_ReceiveData(HT_USART_TypeDef* USARTx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));

  return (u16)(USARTx->RBR);
}

/*********************************************************************************************************//**
 * @brief Set the specified USART guard time.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_GuardTime: Specify the guard time.
 * @retval None
 ************************************************************************************************************/
void USART_SetGuardTime(HT_USART_TypeDef* USARTx, u32 USART_GuardTime)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_GUARD_TIME(USART_GuardTime));

  USARTx->TPR = (USARTx->TPR & TPR_TG_Mask) | (USART_GuardTime << 0x08);
}

/*********************************************************************************************************//**
 * @brief Get LINE Status flags.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_FLAG: Specify the flag to check.
 *   This parameter can be one of the following values:
 *         @arg USART_LSR_RFDR
 *         @arg USART_LSR_OEI
 *         @arg USART_LSR_PEI
 *         @arg USART_LSR_FEI
 *         @arg USART_LSR_BII
 *         @arg USART_LSR_THRE
 *         @arg USART_LSR_TE
 *         @arg USART_LSR_ERR
 *         @arg USART_LSR_RSADDEF
 * @return  The new state of USART_FLAG (SET or RESET).
 ************************************************************************************************************/
FlagStatus USART_GetLineStatus(HT_USART_TypeDef* USARTx, u32 USART_FLAG)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_LSR_FLAG(USART_FLAG));

  if ((USARTx->LSR & USART_FLAG) != (u32)RESET)
  {
    return (SET);
  }
  else
  {
    return (RESET);
  }
}

/*********************************************************************************************************//**
 * @brief Return the status of specified USART FIFO.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_FIFODirection: specify the FIFO that is to be check.
 *   This parameter can be one of the following values:
 *     @arg USART_FIFO_TX           : USART Tx FIFO
 *     @arg USART_FIFO_RX           : USART Rx FIFO
 * @retval The number of data in Tx FIFO or Rx FIFO.
 ************************************************************************************************************/
u8 USART_GetFIFOStatus(HT_USART_TypeDef* USARTx, u32 USART_FIFODirection)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_FIFO_DIRECTION(USART_FIFODirection));

  if (USART_FIFODirection == USART_FIFO_TX)
  {
    return (u8)(USARTx->FSR & 0x1f);
  }
  else
  {
    return (u8)((USARTx->FSR & 0x1f00) >> 8);
  }
}

/*********************************************************************************************************//**
 * @brief Get Modem status.
 * @param USARTx: Parameter to select the USART peripheral.
 * @retval The current status of Modem Status Register.
 ************************************************************************************************************/
u8 USART_GetModemStatus(HT_USART_TypeDef* USARTx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));

  return (u8)(USARTx->MSR);
}

/*********************************************************************************************************//**
 * @brief Force pin DTR/RTS to low or high state.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_ModemPin: Specify the USART modem pin to be forced.
 *   This parameter can be one of the following values:
 *         @arg USART_MODEM_DTR
 *         @arg USART_MODEM_RTS
 * @param USART_ModemState: the USART modem pin state.
 *   This parameter can be one of the following values:
 *         @arg USART_MODEMSTATE_HIGH
 *         @arg USART_MODEMSTATE_LOW
 * @retval None
 ************************************************************************************************************/
void USART_ForceModemPinState(HT_USART_TypeDef* USARTx, u32 USART_ModemPin, u32 USART_ModemState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_MODEM_PIN(USART_ModemPin));
  Assert_Param(IS_USART_MODEM_STATE(USART_ModemState));

  if (USART_ModemState != USART_MODEMSTATE_HIGH)
  {
    USARTx->MCR |= USART_MODEMSTATE_LOW << USART_ModemPin;
  }
  else
  {
    USARTx->MCR &= ~(USART_MODEMSTATE_HIGH << USART_ModemPin);
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART IrDA interface.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_IrDACmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->ICR |= USART_IRDA_ON;
  }
  else
  {
    USARTx->ICR &= USART_IRDA_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Configure the USART IrDA interface.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_IrDAMode: Specify the USART IrDA mode.
 *   This parameter can be one of the following values:
 *         @arg USART_IRDA_LOWPOWER
 *         @arg USART_IRDA_NORMAL
 * @retval None
 ************************************************************************************************************/
void USART_IrDAConfig(HT_USART_TypeDef* USARTx, u32 USART_IrDAMode)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_IRDA_MODE(USART_IrDAMode));

  if (USART_IrDAMode != USART_IRDA_NORMAL)
  {
    USARTx->ICR |= USART_IRDA_LOWPOWER;
  }
  else
  {
    USARTx->ICR &= USART_IRDA_NORMAL;
  }
}

/*********************************************************************************************************//**
 * @brief Set the specified USART IrDA prescaler.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_IrDAPrescaler: Specify the USART IrDA prescaler.
 * @retval None
 ************************************************************************************************************/
void USART_SetIrDAPrescaler(HT_USART_TypeDef* USARTx, u32 USART_IrDAPrescaler)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_IRDA_PRESCALER(USART_IrDAPrescaler));

  USARTx->ICR = (USARTx->ICR & RCR_ILPDVSR_Mask) | (USART_IrDAPrescaler << 0x08);
}

/*********************************************************************************************************//**
 * @brief Enable the IrDA transmitter or receiver.
 * @param USARTx: Parameter to select the USART peripheral, x can be 0 or 1.
 * @param USART_IrDADirection: Specify the USART IrDA direction select.
 *   This parameter can be one of the following values:
 *         @arg USART_IRDA_TX
 *         @arg USART_IRDA_RX
 * @retval None
 ************************************************************************************************************/
void USART_IrDADirectionConfig(HT_USART_TypeDef* USARTx, u32 USART_IrDADirection)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_IRDA_DIRECTION(USART_IrDADirection));

  if (USART_IrDADirection != USART_IRDA_RX)
  {
    USARTx->ICR |= USART_IRDA_TX;
  }
  else
  {
    USARTx->ICR &= USART_IRDA_RX;
  }
}

/*********************************************************************************************************//**
 * @brief Configure the polarity of RS485 transmitter enable signal.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_RS485Polarity: Specify the polarity of USART RS485 Tx enable signal.
 *   This parameter can be one of the following values:
 *         @arg USART_RS485POL_LOW
 *         @arg USART_RS485POL_HIGH
 * @retval None
 ************************************************************************************************************/
void USART_RS485TxEnablePolarityConfig(HT_USART_TypeDef* USARTx, u32 USART_RS485Polarity)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_RS485_POLARITY(USART_RS485Polarity));

  if (USART_RS485Polarity != USART_RS485POLARITY_HIGH)
  {
    USARTx->RCR |= USART_RS485POLARITY_LOW;
  }
  else
  {
    USARTx->RCR &= USART_RS485POLARITY_HIGH;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable forcing Tx pin to logic 0.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_ForceBreakCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->LCR |= USART_BREAK_ON;
  }
  else
  {
    USARTx->LCR &= USART_BREAK_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART interrupts.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_IER: Specify if the USART interrupt source to be enabled or disabled.
 *   This parameter can be one of the following values:
 *         @arg USART_IER_MSIE
 *         @arg USART_IER_RLSIE
 *         @arg USART_IER_THREIE
 *         @arg USART_IER_RDAIE
 *         @arg USART_IER_ENON
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_IntConfig(HT_USART_TypeDef* USARTx, u32 USART_IER, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->IER |= USART_IER;
  }
  else
  {
    USARTx->IER &= ~USART_IER;
  }
}

/*********************************************************************************************************//**
 * @brief Get Interrupt ID value.
 * @param USARTx: Parameter to select the USART peripheral.
 * @retval The interrupt ID of USART.
 *          @arg USART_IID_RLS
 *          @arg USART_IID_RDA
 *          @arg USART_IID_CTI
 *          @arg USART_IID_THRE
 *          @arg USART_IID_MS
 *          @arg USART_IID_NON
 ************************************************************************************************************/
u8 USART_GetIntID(HT_USART_TypeDef* USARTx)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));

  return (u8)(USARTx->IIR);
}

/*********************************************************************************************************//**
 * @brief Configure the Rx FIFO Interrupt Trigger Level.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_RFITL: Specify the USART Rx FIFO interrupt trigger level.
 *   This parameter can be one of the following values:
 *          @arg USART_RFITL_01
 *          @arg USART_RFITL_04
 *          @arg USART_RFITL_08
 *          @arg USART_RFITL_14
 * @retval None
 ************************************************************************************************************/
void USART_RFITLConfig(HT_USART_TypeDef* USARTx, u32 USART_RFITL)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_RFITL(USART_RFITL));

  USARTx->FCR = (USARTx->FCR & FCR_RFITL_CLEAR_Mask) | USART_RFITL;
}

/*********************************************************************************************************//**
 * @brief Configure the Tx FIFO Interrupt Trigger Level.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_TFITL: Specify the USART Tx FIFO interrupt trigger level.
 *   This parameter can be one of the following values:
 *         @arg USART_TFITL_00
 *         @arg USART_TFITL_02
 *         @arg USART_TFITL_04
 *         @arg USART_TFITL_08
 * @retval None
 ************************************************************************************************************/
void USART_TFITLConfig(HT_USART_TypeDef* USARTx, u32 USART_TFITL)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_TFITL(USART_TFITL));

  USARTx->FCR = (USARTx->FCR & FCR_TFITL_CLEAR_Mask) | USART_TFITL;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable time out interrupt of the USART.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_TimeOutIntConfig(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->TPR |= USART_TIMEOUT_ON;
  }
  else
  {
    USARTx->TPR &= USART_TIMEOUT_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Set the USART FIFO time-out value.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_TimeOut: Specify the time-out value.
 * @retval None
 ************************************************************************************************************/
void USART_SetTimeOutValue(HT_USART_TypeDef* USARTx, u32 USART_TimeOut)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_TIMEOUT(USART_TimeOut));

  USARTx->TPR = (USARTx->TPR & RCR_ILPDVSR_Mask) | USART_TimeOut;
}

/*********************************************************************************************************//**
 * @brief Clear both the write and read point in Tx FIFO or Rx FIFO.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_FIFODirection: Determine TX FIFO or Rx FIFO that is to be reset.
 *   This parameter can be any combination of the following values:
 *     @arg USART_FIFO_TX   : Tx FIFO is to be reset
 *     @arg USART_FIFO_RX   : Rx FIFO is to be reset
 * @retval None
 ************************************************************************************************************/
void USART_FIFOReset(HT_USART_TypeDef* USARTx, u32 USART_FIFODirection)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_FIFO_DIRECTION(USART_FIFODirection));

  USARTx->FCR |= USART_FIFODirection;
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART stick parity function.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_StickParityCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->LCR |= USART_SPE_ON;
  }
  else
  {
    USARTx->LCR &= USART_SPE_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Configure stick parity value of the USART.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_StickParity: Specify stick parity of the USART.
 *   This parameter can be one of the following values
 *         @arg USART_STICK_LOW
 *         @arg USART_STICK_HIGH
 * @retval None
 ************************************************************************************************************/
void USART_StickParityConfig(HT_USART_TypeDef * USARTx, u32 USART_StickParity)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_STICK_PARITY(USART_StickParity));

  if (USART_StickParity != USART_STICK_HIGH)
  {
    USARTx->LCR |= USART_STICK_LOW;
  }
  else
  {
    USARTx->LCR &= USART_STICK_HIGH;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART Tx.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_TxCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->FCR |= USART_TXEN_ON;
  }
  else
  {
    USARTx->FCR &= USART_TXEN_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART Rx.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_RxCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->FCR |= USART_RXEN_ON;
  }
  else
  {
    USARTx->FCR &= USART_RXEN_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable inverting serial output function of IrDA on the specified USART.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_IrDAInvtOutputCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->ICR |= USART_TXINV_ON;
  }
  else
  {
    USARTx->ICR &= USART_TXINV_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable inverting serial input function of IrDA on the specified USART.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_IrDAInvtInputCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->ICR |= USART_RXINV_ON;
  }
  else
  {
    USARTx->ICR &= USART_RXINV_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART hardware flow control.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_HardwareFlowControlCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->MCR |= USART_HFCEN_ON;
  }
  else
  {
    USARTx->MCR &= USART_HFCEN_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART Tx PDMA.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_TxPDMACmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->MDR |= USART_TxPDMA_ON;
  }
  else
  {
    USARTx->MDR &= USART_TxPDMA_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART Rx PDMA.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_RxPDMACmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->MDR |= USART_RxPDMA_ON;
  }
  else
  {
    USARTx->MDR &= USART_RxPDMA_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART RS485 normal multi-drop operation mode.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_RS485NMMCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->RCR |= USART_RS485NMM_ON;
  }
  else
  {
    USARTx->RCR &= USART_RS485NMM_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Enable or Disable the USART RS485 normal multi-drop operation mode.
 * @param USARTx: Parameter to select the USART peripheral. 
 * @param NewState: This parameter can be ENABLE or DISABLE.
 * @retval None
 ************************************************************************************************************/
void USART_RS485AADCmd(HT_USART_TypeDef* USARTx, ControlStatus NewState)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_CONTROL_STATUS(NewState));

  if (NewState != DISABLE)
  {
    USARTx->RCR |= USART_RS485AAD_ON;
  }
  else
  {
    USARTx->RCR &= USART_RS485AAD_OFF;
  }
}

/*********************************************************************************************************//**
 * @brief Set the specified USART RS485 address match value.
 * @param USARTx: Parameter to select the USART peripheral.
 * @param USART_AddressMatchValue: specify the USART RS485 address match value.
 * @retval None
 ************************************************************************************************************/
void USART_SetAddressMatchValue(HT_USART_TypeDef* USARTx, u32 USART_AddressMatchValue)
{
  /* Check the parameters                                                                                   */
  Assert_Param(IS_USART(USARTx));
  Assert_Param(IS_USART_ADDRESS_MATCH_VALUE(USART_AddressMatchValue));

  USARTx->RCR = (USARTx->RCR & RS485CR_ADDM_Mask) | (u32)(USART_AddressMatchValue << 0x08);
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
