/*********************************************************************************************************//**
 * @file    IAP/IAP_UI/Src_IAP/iap_xmodem.c
 * @version $Rev:: 329          $
 * @date    $Date:: 2017-06-29 #$
 * @brief   This file contains xmodem transmission protocol.
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
#include "iap_xmodem.h"
#include "iap_buffer.h"
#include "iap_crc16.h"
#include "iap_handler.h"

/** @addtogroup HT32_Series_Peripheral_Examples HT32 Peripheral Examples
  * @{
  */

/** @addtogroup IAP_Examples IAP
  * @{
  */

/** @addtogroup UI_mode UI mode
  * @{
  */

/** @addtogroup UI_mode_IAP IAP
  * @{
  */


/* Settings ------------------------------------------------------------------------------------------------*/
/*----------------------------------------------------------------------------------------------------------*/
/* Increase XMODEM_ACK_CNT to speed up, but may cause transfer error on USB to UART cable.                  */
/*----------------------------------------------------------------------------------------------------------*/
#define XMODEM_ACK_CNT                  (40)

/* Private constants ---------------------------------------------------------------------------------------*/
#define SOH                             (0x1)
#define EOT                             (0x4)
#define ACK                             (0x6)
#define NAK                             (0x15)
#define CANCEL                          (0x18)
#define CANCEL3TIME                     ("\x18\x18\x18")

#define XMODEM_C_DELAY                  (0xFFFFF)

/* Private macro -------------------------------------------------------------------------------------------*/
#define WriteByte                       SERIAL_PutChar

/* Global functions ----------------------------------------------------------------------------------------*/
/*********************************************************************************************************//**
  * @brief  The Xmodem transmission function.
  * @param  bptr: Buffer address for save data
  * @param  saddr: Program/compare start address
  * @param  eaddr: Program/compare end address
  * @param  mode: Program/compare mode
  *         @arg PROGRAM_MODE:  Program the received data into the main Flash
  *         @arg COMPARE_MODE:  Compare the received data with the main Flash
  * @retval X_SSUCCESS: The transmission is successful
  * @retval X_SUSERCANCEL: Received CANCEL (0x18) command from Host
  * @retval X_SPACKET_NUM_ERROR: Packet number is not correct
  * @retval X_CRC_ERROR: CRC error
  * @retval X_VERIFY_ERROR: Compare error
  ***********************************************************************************************************/
u32 xmodem(u8 *bptr, u32 saddr, u32 eaddr, u32 mode)
{
  u32 i = 0;
  u16 crcWord;
  u8 packetNo = 1;
  u32 startPacket = 1;

  while (1)
  {
    if (!IS_BUFFER_EMPTY())
    {
      bptr[1] = ReadBuffer();

      if (bptr[1] == SOH)
      {
        /*--------------------------------------------------------------------------------------------------*/
        /*  bptr[0]: Reserved (Let Data word aligned)                                                       */
        /*  bptr[1]: Start of frame (SOH)                                                                   */
        /*  bptr[2]: Packet number                                                                          */
        /*  bptr[3]: Complement of packet number                                                            */
        /*  bptr[4~131]: Data                                                                               */
        /*  bptr[132~133]: CRC16                                                                            */
        /*--------------------------------------------------------------------------------------------------*/
        for (i = 2; i < 134; i++)
        {
          bptr[i] = ReadBuffer();
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Discard repeat package silently                                                                  */
        /*--------------------------------------------------------------------------------------------------*/
        if ((bptr[2] == packetNo - 1) && (bptr[2] + bptr[3] == 0xFF))
        {
          continue;
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Check packet number                                                                              */
        /*--------------------------------------------------------------------------------------------------*/
        if ((bptr[2] != packetNo) || (bptr[2] + bptr[3] != 0xFF))
        {
          iapSendString(CANCEL3TIME);
          return X_SPACKET_NUM_ERROR;
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Check CRC value of Xmodem packet                                                                 */
        /*--------------------------------------------------------------------------------------------------*/
        crcWord = (bptr[132] << 8) | bptr[133];

        if (crcWord != CRC16(0, (u8 *)(&(bptr[4])), 128))
        {
          iapSendString(CANCEL3TIME);
          return X_CRC_ERROR;
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Send numerous ACK after first packet to speed up Xmodem                                          */
        /*--------------------------------------------------------------------------------------------------*/
        if (startPacket)
        {
          for (i = 0; i < XMODEM_ACK_CNT; i++)
          {
            WriteByte(ACK);
          }
          startPacket = 0;            /* Stop 'C' sending                                                   */
        }

        /*--------------------------------------------------------------------------------------------------*/
        /* Send back ACK to start next packet                                                               */
        /*--------------------------------------------------------------------------------------------------*/
        WriteByte(ACK);
        packetNo++;

        if (mode == XMODEM_PROGRAM)
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Start Flash programming                                                                        */
          /*------------------------------------------------------------------------------------------------*/
          for (i = 4; i < 132; i += 4)
          {
            if (*(u32 *)(bptr + i) != 0xFFFFFFFF && (saddr <= eaddr))
            {
              FLASH_State Result;
              Result = FLASH_ProgramWordData(saddr, *(u32 *)(bptr + i));
              if(Result != FLASH_COMPLETE)
              {
                iapSendString(CANCEL3TIME);
                return X_PROGRAM_ERROR;
              }
            }
            saddr += 4;
          }
        }
        else
        {
          /*------------------------------------------------------------------------------------------------*/
          /* Start Flash verification                                                                       */
          /*------------------------------------------------------------------------------------------------*/
          for (i = 4; i < 132; i += 4)
          {
            if (saddr <= eaddr)
            {
              if (*(u32 *)(bptr + i) != rw(saddr))
              {
                iapSendString(CANCEL3TIME);
                return X_VERIFY_ERROR;
              }
            }
            saddr += 4;
          }
        }
      }
      else if (bptr[1] == EOT)            /* Transmission is finished                                       */
      {
        WriteByte(ACK);
        break;
      }
      else if (bptr[1] == CANCEL)         /* User cancel the transmission                                   */
      {
        return X_SUSERCANCEL;
      }
    }
    else
    {
      if (startPacket)
      {
        if ((i & XMODEM_C_DELAY) == 0)
        {
          WriteByte('C');
        }
        i++;
      }
    }
  }

  return X_SSUCCESS;
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

/**
  * @}
  */
