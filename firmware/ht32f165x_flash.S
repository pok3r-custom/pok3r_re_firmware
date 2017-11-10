/***************************************************************************
 *   Copyright (C) 2017 by Charlie Waters                                  *
 *   cawiii@me.com                                                         *
 *                                                                         *
 *   This program is free software; you can redistribute it and/or modify  *
 *   it under the terms of the GNU General Public License as published by  *
 *   the Free Software Foundation; either version 2 of the License, or     *
 *   (at your option) any later version.                                   *
 *                                                                         *
 *   This program is distributed in the hope that it will be useful,       *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with this program; if not, write to the                         *
 *   Free Software Foundation, Inc.,                                       *
 *   51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.           *
 ***************************************************************************/

.text
.syntax unified
.cpu cortex-m3
.thumb
.thumb_func
.global ht32_flash_write

/* Params:
* r0 - target address (in), status (out)
* r1 - buffer start
* r2 - buffer end
* Clobbered:
* r3
* r4
* r5
*/

#define FMC_REG_BASE        0x40080000
#define FMC_REG_TADR        0x00
#define FMC_REG_WRDR        0x04
#define FMC_REG_OCMR        0x0C
#define FMC_REG_OPCR        0x10

#define FMC_CMD_WORD_PROG   0x4

#define FMC_OPM_MASK        0x1E
#define FMC_COMMIT          0x14
#define FMC_FINISHED        0x1C

ht32_flash_write:
    ldr r4, HT32_FMC_BASE
    movs r3, #FMC_FINISHED
write_loop:
    cmp r1, r2
    bge write_end

    str r0, [r4, #FMC_REG_TADR] /* target address */

    ldr r5, [r1]                /* read word from buffer */
    str r5, [r4, #FMC_REG_WRDR] /* write data */

    movs r5, #FMC_CMD_WORD_PROG
    str r5, [r4, #FMC_REG_OCMR] /* word program command /*

    movs r5, #FMC_COMMIT
    str r5, [r4, #FMC_REG_OPCR] /* commit flash command */

wait:
    ldr r5, [r4, #FMC_REG_OPCR]
    and r5, #FMC_OPM_MASK
    cmp r5, r3
    bne wait

    adds r0, #4  /* increment target address */
    adds r1, #4  /* increment buffer address */
    b write_loop
write_end:
    movs r0, #0
    bkpt #0

HT32_FMC_BASE:  .word FMC_REG_BASE
