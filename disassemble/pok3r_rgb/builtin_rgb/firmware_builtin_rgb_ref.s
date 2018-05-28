.syntax unified
.cpu cortex-m3
.text
.thumb


            vectors:
/*0x0000*/  .word 0x20000740
/*0x0004*/  .word reset
/*0x0008*/  .word generic_fault
/*0x000c*/  .word generic_fault
/*0x0010*/  .word generic_fault
/*0x0014*/  .word generic_fault
/*0x0018*/  .word generic_fault


            .thumb_func
            entry:
/*0x001c*/      ldr.w sp, [pc, #0xc] /* data_2c */
/*0x0020*/      bl sram_init

            .thumb_func
            call_24:
/*0x0024*/      ldr r0, [pc, #0] /* data_28 */
/*0x0026*/      bx r0 /* main */

            data_28:
/*0x0028*/  .word main
            data_2c:
/*0x002c*/  .word 0x20000740


            .thumb_func
            load_jump_fw:
/*0x0030*/      ldr r1, [r0]
/*0x0032*/      mov sp, r1
/*0x0034*/      ldr r1, [r0, #4]
/*0x0036*/      bx r1

            .thumb_func
            call_38:
/*0x0038*/      str r1, [r0, #0xc]
/*0x003a*/      bx lr

/*0x003c*/  .word systick_intr


            .thumb_func
            memcpy:
/*0x0040*/      orr.w r3, r0, r1
/*0x0044*/      lsls r3, r3, #0x1e
/*0x0046*/      beq jump_50
/*0x0048*/      b jump_5e
            jump_4a:
/*0x004a*/      ldm r1!, {r3}
/*0x004c*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x004e*/      stm r0!, {r3}
            jump_50:
/*0x0050*/      cmp r2, #4
/*0x0052*/      bhs jump_4a
/*0x0054*/      b jump_5e
            jump_56:
/*0x0056*/      ldrb r3, [r1], #1
/*0x005a*/      strb r3, [r0], #1
            jump_5e:
/*0x005e*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x0060*/      bhs jump_56
/*0x0062*/      bx lr

            .thumb_func
            mem_set:
/*0x0064*/      uxtb r2, r2
/*0x0066*/      b jump_6c
            jump_68:
/*0x0068*/      strb r2, [r0], #1
            jump_6c:
/*0x006c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x006e*/      bhs jump_68
/*0x0070*/      bx lr

            .thumb_func
            mem_zero:
/*0x0072*/      movs r2, #0
/*0x0074*/      b mem_set

            .thumb_func
            mem_set2:
/*0x0076*/      push {r4, lr}
/*0x0078*/      mov r3, r2
/*0x007a*/      mov r2, r1
/*0x007c*/      mov r4, r0
/*0x007e*/      mov r1, r3
/*0x0080*/      bl mem_set
/*0x0084*/      mov r0, r4
/*0x0086*/      pop {r4, pc}

            .thumb_func
            sram_init:
/*0x0088*/      ldr r4, [pc, #0x18] /* data_a4 */
/*0x008a*/      ldr r5, [pc, #0x1c] /* data_a8 */
/*0x008c*/      b jump_9c
            jump_8e:
/*0x008e*/      ldr r0, [r4, #0xc]
/*0x0090*/      orr r3, r0, #1
/*0x0094*/      ldm.w r4, {r0, r1, r2}
/*0x0098*/      blx r3
/*0x009a*/      adds r4, #0x10
            jump_9c:
/*0x009c*/      cmp r4, r5
/*0x009e*/      blo jump_8e
/*0x00a0*/      bl call_24

            data_a4:
/*0x00a4*/  .word data_2230
            data_a8:
/*0x00a8*/  .word data_2250


            .thumb_func
            call_ac:
/*0x00ac*/      push {r4, lr}
/*0x00ae*/      movs r2, #0
/*0x00b0*/      cmp r0, #7
/*0x00b2*/      bls jump_ba
/*0x00b4*/      movs r2, #1
/*0x00b6*/      subs r0, #8
/*0x00b8*/      uxtb r0, r0
            jump_ba:
/*0x00ba*/      lsls r3, r2, #2
/*0x00bc*/      ldr r2, [pc, #0x14] /* data_d4 */
/*0x00be*/      add r2, r3
/*0x00c0*/      ldr r3, [r2]
/*0x00c2*/      lsls r0, r0, #2
/*0x00c4*/      movs r4, #0xf
/*0x00c6*/      lsls r4, r0
/*0x00c8*/      bics r3, r4
/*0x00ca*/      lsls r1, r0
/*0x00cc*/      orrs r1, r3
/*0x00ce*/      str r1, [r2]
/*0x00d0*/      pop {r4, pc}

/*0x00d2*/  .byte 0x00
/*0x00d3*/  .byte 0x00

            data_d4:
/*0x00d4*/  .word 0x40022000


            .thumb_func
            bftm_set_counter:
/*0x00d8*/      str r1, [r0, #8]
/*0x00da*/      bx lr

            .thumb_func
            call_dc:
/*0x00dc*/      str r1, [r0, #0x28]
/*0x00de*/      bx lr

            .thumb_func
            call_e0:
/*0x00e0*/      str r1, [r0, #0x24]
/*0x00e2*/      bx lr

/*0x00e4*/  .word bftm0_intr
/*0x00e8*/  .word bftm1_intr
/*0x00ec*/  .word generic_intr
/*0x00f0*/  .word generic_intr


            .thumb_func
            bftm_clear:
/*0x00f4*/      ldr r1, [r0, #4]
/*0x00f6*/      bic r1, r1, #1
/*0x00fa*/      str r1, [r0, #4]
/*0x00fc*/      dsb sy
/*0x0100*/      bx lr

            .thumb_func
            call_102:
/*0x0102*/      add.w r0, r0, r0, lsl #2
/*0x0106*/      lsls r0, r0, #2
            jump_108:
/*0x0108*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x010a*/      bhs jump_108
/*0x010c*/      bx lr

            .thumb_func
            systick_intr:
/*0x010e*/      bx lr
            jump_110:
/*0x0110*/      b.w jump_151c

/*0x0114*/  .word usb_intr


            .thumb_func
            reset:
/*0x0118*/      ldr r0, [pc, #0xc] /* data_128 */
/*0x011a*/      blx r0 /* call_15f4 */
/*0x011c*/      ldr r0, [pc, #0xc] /* data_12c */
/*0x011e*/      blx r0 /* call_f8c */
/*0x0120*/      ldr r0, [pc, #0xc] /* data_130 */
/*0x0122*/      bx r0 /* entry */

            .thumb_func
            generic_fault:
/*0x0124*/      b generic_fault

            .thumb_func
            generic_intr:
/*0x0126*/      b generic_intr

            data_128:
/*0x0128*/  .word call_15f4
            data_12c:
/*0x012c*/  .word call_f8c
            data_130:
/*0x0130*/  .word entry


            .thumb_func
            bftm0_intr:
/*0x0134*/      ldr r0, [pc, #0x24] /* data_15c */
/*0x0136*/      push {r4, lr}
/*0x0138*/      ldr r1, [r0]
/*0x013a*/      cbz r1, jump_142
/*0x013c*/      ldr r1, [r0]
/*0x013e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0140*/      str r1, [r0]
            jump_142:
/*0x0142*/      ldr r1, [r0, #4]
/*0x0144*/      cbz r1, jump_14c
/*0x0146*/      ldr r1, [r0, #4]
/*0x0148*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x014a*/      str r1, [r0, #4]
            jump_14c:
/*0x014c*/      ldr r0, [pc, #0x10] /* data_160 */
/*0x014e*/      bl bftm_clear
/*0x0152*/      pop.w {r4, lr}
/*0x0156*/      b.w jump_b9c

/*0x015a*/  .byte 0x00
/*0x015b*/  .byte 0x00

            data_15c:
/*0x015c*/  .word 0x200002ec
            data_160:
/*0x0160*/  .word 0x40076000


            .thumb_func
            bftm1_intr:
/*0x0164*/      push {r4, lr}
/*0x0166*/      ldr r0, [pc, #0x4c] /* data_1b4 */
/*0x0168*/      bl bftm_clear
/*0x016c*/      ldr r4, [pc, #0x48] /* data_1b8 */
/*0x016e*/      ldr r0, [r4, #4]
/*0x0170*/      ldrh r1, [r0, #4]
/*0x0172*/      ldr r0, [r0]
/*0x0174*/      uxth r1, r1
/*0x0176*/      bl call_e0
/*0x017a*/      movs r0, #0xa
/*0x017c*/      bl call_102
/*0x0180*/      movs r0, #2
/*0x0182*/      bl call_1844
/*0x0186*/      ldr r1, [pc, #0x34] /* data_1bc */
/*0x0188*/      mov.w r0, #0x8000
/*0x018c*/      str r0, [r1, #0x24]
/*0x018e*/      ldr r0, [pc, #0x30] /* data_1c0 */
/*0x0190*/      ldrb r1, [r4, #1]
/*0x0192*/      add.w r0, r0, r1, lsl #3
/*0x0196*/      str r0, [r4, #4]
/*0x0198*/      ldrh r1, [r0, #4]
/*0x019a*/      ldr r0, [r0]
/*0x019c*/      uxth r1, r1
/*0x019e*/      bl call_dc
/*0x01a2*/      ldrb r0, [r4, #1]
/*0x01a4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x01a6*/      and r0, r0, #7
/*0x01aa*/      strb r0, [r4, #1]
/*0x01ac*/      pop.w {r4, lr}
/*0x01b0*/      b.w call_f00

            data_1b4:
/*0x01b4*/  .word 0x40077000
            data_1b8:
/*0x01b8*/  .word 0x20000010
            data_1bc:
/*0x01bc*/  .word 0x400b0000
            data_1c0:
/*0x01c0*/  .word 0x00002074 /* possible pointer */


            .thumb_func
            call_1c4:
/*0x01c4*/      cmp r1, #0
/*0x01c6*/      ldr r1, [r0]
/*0x01c8*/      beq jump_1d0
/*0x01ca*/      orr r1, r1, #4
/*0x01ce*/      b jump_1d4
            jump_1d0:
/*0x01d0*/      bic r1, r1, #4
            jump_1d4:
/*0x01d4*/      str r1, [r0]
/*0x01d6*/      bx lr

            .thumb_func
            bftm_set_mien:
/*0x01d8*/      cmp r1, #0
/*0x01da*/      ldr r1, [r0]
/*0x01dc*/      beq jump_1e4
/*0x01de*/      orr r1, r1, #1
/*0x01e2*/      b jump_1e8
            jump_1e4:
/*0x01e4*/      bic r1, r1, #1
            jump_1e8:
/*0x01e8*/      str r1, [r0]
/*0x01ea*/      bx lr

            .thumb_func
            call_1ec:
/*0x01ec*/      lsls r0, r0, #3
/*0x01ee*/      lsrs r3, r1, #3
/*0x01f0*/      add.w r0, r0, r3, lsl #2
/*0x01f4*/      ldr r3, [pc, #0x18] /* data_210 */
/*0x01f6*/      push {r4, lr}
/*0x01f8*/      add r0, r3
/*0x01fa*/      lsls r1, r1, #0x1d
/*0x01fc*/      ldr r3, [r0]
/*0x01fe*/      lsrs r1, r1, #0x1b
/*0x0200*/      movs r4, #0xf
/*0x0202*/      lsls r4, r1
/*0x0204*/      bics r3, r4
/*0x0206*/      lsls r2, r1
/*0x0208*/      orrs r3, r2
/*0x020a*/      str r3, [r0]
/*0x020c*/      pop {r4, pc}

/*0x020e*/  .byte 0x00
/*0x020f*/  .byte 0x00

            data_210:
/*0x0210*/  .word 0x40022020


            .thumb_func
            call_214:
/*0x0214*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0218*/      mov.w r5, #0x4000
/*0x021c*/      movs r4, #0
/*0x021e*/      lsls r0, r5, #2
/*0x0220*/      mov r2, r4
/*0x0222*/      mov r8, r0
/*0x0224*/      movs r3, #1
/*0x0226*/      mov r1, r5
/*0x0228*/      bl ckcu_clocks_enable
/*0x022c*/      ldr r6, [pc, #0x94] /* data_2c4 */
/*0x022e*/      movs r2, #0
/*0x0230*/      mov r1, r5
/*0x0232*/      mov r0, r6
/*0x0234*/      bl call_3a0
/*0x0238*/      lsls r7, r5, #1
/*0x023a*/      movs r2, #0
/*0x023c*/      mov r1, r7
/*0x023e*/      mov r0, r6
/*0x0240*/      bl call_3a0
/*0x0244*/      movs r2, #2
/*0x0246*/      mov r1, r5
/*0x0248*/      mov r0, r6
/*0x024a*/      bl call_3c0
/*0x024e*/      movs r2, #2
/*0x0250*/      mov r1, r7
/*0x0252*/      mov r0, r6
/*0x0254*/      bl call_3c0
/*0x0258*/      asrs r5, r5, #3
/*0x025a*/      movs r2, #0
/*0x025c*/      mov r1, r5
/*0x025e*/      mov r0, r6
/*0x0260*/      bl call_3a0
/*0x0264*/      movs r2, #2
/*0x0266*/      mov r1, r5
/*0x0268*/      mov r0, r6
/*0x026a*/      bl call_3c0
/*0x026e*/      movs r2, #1
/*0x0270*/      movs r1, #0xb
/*0x0272*/      movs r0, #0
/*0x0274*/      bl call_1ec
/*0x0278*/      movs r2, #1
/*0x027a*/      movs r1, #0xd
/*0x027c*/      movs r0, #2
/*0x027e*/      bl call_1ec
/*0x0282*/      movs r2, #1
/*0x0284*/      movs r1, #0xe
/*0x0286*/      movs r0, #2
/*0x0288*/      bl call_1ec
/*0x028c*/      movs r2, #1
/*0x028e*/      movs r1, #0xf
/*0x0290*/      movs r0, #2
/*0x0292*/      bl call_1ec
/*0x0296*/      ldr r0, [pc, #0x30] /* data_2c8 */
/*0x0298*/      ldr r0, [r0, #4]
/*0x029a*/      lsls r0, r0, #0x15
/*0x029c*/      bmi jump_2b2
/*0x029e*/      movs r2, #1
/*0x02a0*/      movs r1, #0xe
/*0x02a2*/      mov r0, r2
/*0x02a4*/      bl call_1ec
/*0x02a8*/      movs r2, #1
/*0x02aa*/      movs r1, #0xf
/*0x02ac*/      mov r0, r2
/*0x02ae*/      bl call_1ec
            jump_2b2:
/*0x02b2*/      mov r1, r4
/*0x02b4*/      movs r3, #0
/*0x02b6*/      mov r2, r4
/*0x02b8*/      mov r0, r8
/*0x02ba*/      bl ckcu_clocks_enable
/*0x02be*/      movs r0, #1
/*0x02c0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_2c4:
/*0x02c4*/  .word 0x400b0000
            data_2c8:
/*0x02c8*/  .word 0x40088000


            .thumb_func
            ckcu_clocks_enable:
/*0x02cc*/      push {r4, r5, r6, r7, lr}
/*0x02ce*/      ldr r7, [pc, #0x1c] /* data_2ec */
/*0x02d0*/      ldr r4, [r7, #0x24]
/*0x02d2*/      ldr r5, [r7, #0x2c]
/*0x02d4*/      ldr r6, [r7, #0x30]
/*0x02d6*/      bics r4, r0
/*0x02d8*/      bics r5, r1
/*0x02da*/      bics r6, r2
/*0x02dc*/      cbz r3, jump_2e4
/*0x02de*/      orrs r4, r0
/*0x02e0*/      orrs r5, r1
/*0x02e2*/      orrs r6, r2
            jump_2e4:
/*0x02e4*/      str r4, [r7, #0x24]
/*0x02e6*/      str r5, [r7, #0x2c]
/*0x02e8*/      str r6, [r7, #0x30]
/*0x02ea*/      pop {r4, r5, r6, r7, pc}

            data_2ec:
/*0x02ec*/  .word 0x40088000


            .thumb_func
            ckcu_set_usb_prescaler:
/*0x02f0*/      ldr r1, [pc, #0xc] /* data_300 */
/*0x02f2*/      ldr r2, [r1]
/*0x02f4*/      bic r2, r2, #0xc00000
/*0x02f8*/      orr.w r0, r2, r0, lsl #22
/*0x02fc*/      str r0, [r1]
/*0x02fe*/      bx lr

            data_300:
/*0x0300*/  .word 0x40088000


            .thumb_func
            flash_page_erase:
/*0x0304*/      ldr r1, [pc, #8] /* data_310 */
/*0x0306*/      str r0, [r1]
/*0x0308*/      movs r0, #8
/*0x030a*/      str r0, [r1, #0xc]
/*0x030c*/      b.w flash_commit

            data_310:
/*0x0310*/  .word 0x40080000


            .thumb_func
            flash_commit:
/*0x0314*/      ldr r1, [pc, #0x44] /* data_35c */
/*0x0316*/      ldr r0, [pc, #0x40] /* data_358 */
/*0x0318*/      ldr r2, [r1, #0x14]
/*0x031a*/      orr r2, r2, #2
/*0x031e*/      str r2, [r1, #0x14]
/*0x0320*/      movs r2, #0x14
/*0x0322*/      str r2, [r1, #0x10]
/*0x0324*/      b jump_330
            jump_326:
/*0x0326*/      ldr r2, [r1, #0x10]
/*0x0328*/      ubfx r2, r2, #2, #2
/*0x032c*/      cmp r2, #3
/*0x032e*/      beq jump_334
            jump_330:
/*0x0330*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0332*/      bhs jump_326
            jump_334:
/*0x0334*/      ldr r2, [r1, #0x18]
/*0x0336*/      ldr r3, [r1, #0x18]
/*0x0338*/      bic r3, r3, #2
/*0x033c*/      str r3, [r1, #0x18]
/*0x033e*/      lsls r1, r2, #0xe
/*0x0340*/      bpl jump_346
/*0x0342*/      movs r0, #2
/*0x0344*/      bx lr
            jump_346:
/*0x0346*/      lsls r1, r2, #0x1e
/*0x0348*/      bpl jump_34e
/*0x034a*/      movs r0, #1
/*0x034c*/      bx lr
            jump_34e:
/*0x034e*/      cbz r0, jump_354
/*0x0350*/      movs r0, #0
/*0x0352*/      bx lr
            jump_354:
/*0x0354*/      movs r0, #3
/*0x0356*/      bx lr

            data_358:
/*0x0358*/  .word 0x000fffff
            data_35c:
/*0x035c*/  .word 0x40080000

            jump_360:
/*0x0360*/      and r2, r0, #7
/*0x0364*/      push {r4, lr}
/*0x0366*/      ldr r3, [pc, #0x24] /* data_38c */
/*0x0368*/      lsrs r0, r0, #3
/*0x036a*/      add.w r4, r3, r2, lsl #6
/*0x036e*/      lsls r0, r0, #1
/*0x0370*/      movs r2, #3
/*0x0372*/      b jump_384
            jump_374:
/*0x0374*/      strh.w r1, [r4, r0, lsl #1]
/*0x0378*/      adds r0, #0x12
/*0x037a*/      uxtb r0, r0
/*0x037c*/      cmp r0, #0x1f
/*0x037e*/      bls jump_384
/*0x0380*/      subs r0, #0x1f
/*0x0382*/      uxtb r0, r0
            jump_384:
/*0x0384*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x0386*/      uxtb r2, r2
/*0x0388*/      bhs jump_374
/*0x038a*/      pop {r4, pc}

            data_38c:
/*0x038c*/  .word 0x200000ec


            .thumb_func
            call_390:
/*0x0390*/      cmp r2, #0
/*0x0392*/      ldr r2, [r0]
/*0x0394*/      beq jump_39a
/*0x0396*/      orrs r2, r1
/*0x0398*/      b jump_39c
            jump_39a:
/*0x039a*/      bics r2, r1
            jump_39c:
/*0x039c*/      str r2, [r0]
/*0x039e*/      bx lr

            .thumb_func
            call_3a0:
/*0x03a0*/      cmp r2, #0
/*0x03a2*/      ldr r2, [r0, #4]
/*0x03a4*/      beq jump_3aa
/*0x03a6*/      orrs r2, r1
/*0x03a8*/      b jump_3ac
            jump_3aa:
/*0x03aa*/      bics r2, r1
            jump_3ac:
/*0x03ac*/      str r2, [r0, #4]
/*0x03ae*/      bx lr

            .thumb_func
            call_3b0:
/*0x03b0*/      cmp r2, #0
/*0x03b2*/      ldr r2, [r0, #0x10]
/*0x03b4*/      beq jump_3ba
/*0x03b6*/      orrs r2, r1
/*0x03b8*/      b jump_3bc
            jump_3ba:
/*0x03ba*/      bics r2, r1
            jump_3bc:
/*0x03bc*/      str r2, [r0, #0x10]
/*0x03be*/      bx lr

            .thumb_func
            call_3c0:
/*0x03c0*/      cbz r2, jump_3d4
/*0x03c2*/      cmp r2, #1
/*0x03c4*/      beq jump_3da
/*0x03c6*/      ldr r2, [r0, #8]
/*0x03c8*/      bics r2, r1
            jump_3ca:
/*0x03ca*/      str r2, [r0, #8]
/*0x03cc*/      ldr r2, [r0, #0xc]
/*0x03ce*/      bics r2, r1
/*0x03d0*/      str r2, [r0, #0xc]
/*0x03d2*/      bx lr
            jump_3d4:
/*0x03d4*/      ldr r2, [r0, #8]
/*0x03d6*/      orrs r2, r1
/*0x03d8*/      b jump_3ca
            jump_3da:
/*0x03da*/      ldr r2, [r0, #0xc]
/*0x03dc*/      orrs r2, r1
/*0x03de*/      str r2, [r0, #0xc]
/*0x03e0*/      ldr r2, [r0, #8]
/*0x03e2*/      bics r2, r1
/*0x03e4*/      str r2, [r0, #8]
/*0x03e6*/      bx lr

            .thumb_func
            call_3e8:
/*0x03e8*/      cbz r2, jump_3ee
/*0x03ea*/      str r1, [r0, #0x24]
/*0x03ec*/      bx lr
            jump_3ee:
/*0x03ee*/      str r1, [r0, #0x28]
/*0x03f0*/      bx lr

            .thumb_func
            call_3f2:
/*0x03f2*/      lsls r0, r0, #0xe
/*0x03f4*/      sxth r0, r0
/*0x03f6*/      lsrs r1, r0, #0x10
/*0x03f8*/      movs r0, #0x29
/*0x03fa*/      b.w jump_360

/*0x03fe*/  .byte 0x70
/*0x03ff*/  .byte 0x47
            read_400_data:
/*0x0400*/  .byte 0x04
/*0x0401*/  .byte 0x00
/*0x0402*/  .byte 0x00
/*0x0403*/  .byte 0x00
/*0x0404*/  .byte 0x00
/*0x0405*/  .byte 0x00
/*0x0406*/  .byte 0x00
/*0x0407*/  .byte 0x00
/*0x0408*/  .byte 0xd9
/*0x0409*/  .byte 0x04
/*0x040a*/  .byte 0x67
/*0x040b*/  .byte 0x11
/*0x040c*/  .byte 0x00
/*0x040d*/  .byte 0x00
/*0x040e*/  .byte 0x04
/*0x040f*/  .byte 0x03
/*0x0410*/  .byte 0xff
/*0x0411*/  .byte 0xff
/*0x0412*/  .byte 0xff
/*0x0413*/  .byte 0xff
/*0x0414*/  .byte 0x01
/*0x0415*/  .byte 0x00
/*0x0416*/  .byte 0x00
/*0x0417*/  .byte 0x00
/*0x0418*/  .byte 0xff
/*0x0419*/  .byte 0xff
/*0x041a*/  .byte 0xff
/*0x041b*/  .byte 0xff
/*0x041c*/  .byte 0x41
/*0x041d*/  .byte 0x00
/*0x041e*/  .byte 0x00
/*0x041f*/  .byte 0x00
/*0x0420*/  .byte 0x00
/*0x0421*/  .byte 0x04
/*0x0422*/  .byte 0x33
/*0x0423*/  .byte 0x00
/*0x0424*/  .byte 0x00
/*0x0425*/  .byte 0x04
/*0x0426*/  .byte 0x4b
/*0x0427*/  .byte 0x42
/*0x0428*/  .byte 0x30
/*0x0429*/  .byte 0x31
/*0x042a*/  .byte 0x36
/*0x042b*/  .byte 0x37
/*0x042c*/  .byte 0x00
/*0x042d*/  .byte 0x00
/*0x042e*/  .byte 0x00
/*0x042f*/  .byte 0x00
/*0x0430*/  .byte 0xff
/*0x0431*/  .byte 0xff
/*0x0432*/  .byte 0xff
/*0x0433*/  .byte 0xff
/*0x0434*/  .byte 0x04
/*0x0435*/  .byte 0x03
/*0x0436*/  .byte 0x09
/*0x0437*/  .byte 0x04
/*0x0438*/  .byte 0x00
/*0x0439*/  .byte 0x00
/*0x043a*/  .byte 0x00
/*0x043b*/  .byte 0x00
/*0x043c*/  .byte 0x00
/*0x043d*/  .byte 0x00
/*0x043e*/  .byte 0x00
/*0x043f*/  .byte 0x30
/*0x0440*/  .byte 0x01
/*0x0441*/  .byte 0x00
/*0x0442*/  .byte 0x00
/*0x0443*/  .byte 0x34


            .thumb_func
            call_444:
/*0x0444*/      cmp r1, #0
/*0x0446*/      ldr r1, [r0, #0x10]
/*0x0448*/      beq jump_450
/*0x044a*/      orr r1, r1, #1
/*0x044e*/      b jump_454
            jump_450:
/*0x0450*/      bic r1, r1, #1
            jump_454:
/*0x0454*/      str r1, [r0, #0x10]
/*0x0456*/      bx lr

            .thumb_func
            call_458:
/*0x0458*/      push {r4, r5, r6, r7, lr}
/*0x045a*/      ldrb r3, [r1]
/*0x045c*/      ldr r7, [r0, #0x50]
/*0x045e*/      add.w r4, r0, r3, lsl #2
/*0x0462*/      add.w r2, r4, #0x40
/*0x0466*/      add.w r5, r4, #0x90
/*0x046a*/      add.w r6, r4, #0xa0
/*0x046e*/      lsls r3, r3, #1
/*0x0470*/      movs r4, #1
/*0x0472*/      lsls r4, r3
/*0x0474*/      mvns r4, r4
/*0x0476*/      ands r7, r4
/*0x0478*/      str r7, [r0, #0x50]
/*0x047a*/      ldr r7, [r0, #0x54]
/*0x047c*/      ands r7, r4
/*0x047e*/      str r7, [r0, #0x54]
/*0x0480*/      ldr r4, [r0, #0x54]
/*0x0482*/      ldrb r7, [r1, #5]
/*0x0484*/      lsls r7, r3
/*0x0486*/      orrs r4, r7
/*0x0488*/      str r4, [r0, #0x54]
/*0x048a*/      ldr r4, [r2]
/*0x048c*/      movw r7, #0x107
/*0x0490*/      bics r4, r7
/*0x0492*/      str r4, [r2]
/*0x0494*/      ldr r4, [r2]
/*0x0496*/      ldrh r7, [r1, #2]
/*0x0498*/      orrs r4, r7
/*0x049a*/      str r4, [r2]
/*0x049c*/      ldrh r2, [r1, #6]
/*0x049e*/      str r2, [r5]
/*0x04a0*/      ldrh r2, [r1, #8]
/*0x04a2*/      str r2, [r6]
/*0x04a4*/      ldr r2, [r0, #0x50]
/*0x04a6*/      ldrb r1, [r1, #4]
/*0x04a8*/      lsls r1, r3
/*0x04aa*/      orrs r2, r1
/*0x04ac*/      str r2, [r0, #0x50]
/*0x04ae*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_4b0:
/*0x04b0*/      ldrh r2, [r1]
/*0x04b2*/      str.w r2, [r0, #0x88]
/*0x04b6*/      ldrh r2, [r1, #2]
/*0x04b8*/      str.w r2, [r0, #0x84]
/*0x04bc*/      ldr r2, [r0]
/*0x04be*/      bic r2, r2, #0x30000
/*0x04c2*/      str r2, [r0]
/*0x04c4*/      ldr r2, [r0]
/*0x04c6*/      bic r2, r2, #0x1000000
/*0x04ca*/      str r2, [r0]
/*0x04cc*/      ldr r2, [r0]
/*0x04ce*/      ldr r3, [r1, #4]
/*0x04d0*/      orrs r2, r3
/*0x04d2*/      str r2, [r0]
/*0x04d4*/      ldrh r1, [r1, #8]
/*0x04d6*/      str r1, [r0, #0x78]
/*0x04d8*/      bx lr

/*0x04da*/  .byte 0x00
/*0x04db*/  .byte 0x00


            .thumb_func
            call_4dc:
/*0x04dc*/      ldr r2, [pc, #0x70] /* data_550 */
/*0x04de*/      push {r4, lr}
/*0x04e0*/      ldrb r2, [r2, r0]
/*0x04e2*/      cmp r2, #0xe8
/*0x04e4*/      beq jump_54a
/*0x04e6*/      sub.w r0, r2, #0xe0
/*0x04ea*/      movs r4, #1
/*0x04ec*/      ldr r3, [pc, #0x64] /* data_554 */
/*0x04ee*/      cmp r0, #7
/*0x04f0*/      bhi jump_50c
/*0x04f2*/      and r0, r2, #7
/*0x04f6*/      mov r2, r3
/*0x04f8*/      lsl.w r0, r4, r0
/*0x04fc*/      ldrb r2, [r2]
/*0x04fe*/      uxtb r0, r0
/*0x0500*/      cbz r1, jump_506
/*0x0502*/      orrs r2, r0
/*0x0504*/      b jump_508
            jump_506:
/*0x0506*/      bics r2, r0
            jump_508:
/*0x0508*/      strb r2, [r3]
/*0x050a*/      b jump_53c
            jump_50c:
/*0x050c*/      cmp r2, #0x91
/*0x050e*/      bhi jump_54a
/*0x0510*/      mov.w r0, #0
/*0x0514*/      cbz r1, jump_52e
            jump_516:
/*0x0516*/      adds r1, r3, r0
/*0x0518*/      ldrb r1, [r1, #2]
/*0x051a*/      cbz r1, jump_528
/*0x051c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x051e*/      uxtb r0, r0
/*0x0520*/      cmp r0, #6
/*0x0522*/      blo jump_516
/*0x0524*/      movs r0, #0
/*0x0526*/      pop {r4, pc}
            jump_528:
/*0x0528*/      add r0, r3
/*0x052a*/      strb r2, [r0, #2]
/*0x052c*/      b jump_53c
            jump_52e:
/*0x052e*/      adds r1, r3, r0
/*0x0530*/      ldrb r1, [r1, #2]
/*0x0532*/      cmp r1, r2
/*0x0534*/      bne jump_542
/*0x0536*/      add r0, r3
/*0x0538*/      movs r1, #0
/*0x053a*/      strb r1, [r0, #2]
            jump_53c:
/*0x053c*/      ldr r0, [pc, #0x18] /* data_558 */
/*0x053e*/      strb r4, [r0]
/*0x0540*/      b jump_54a
            jump_542:
/*0x0542*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0544*/      uxtb r0, r0
/*0x0546*/      cmp r0, #6
/*0x0548*/      blo jump_52e
            jump_54a:
/*0x054a*/      movs r0, #1
/*0x054c*/      pop {r4, pc}

/*0x054e*/  .byte 0x00
/*0x054f*/  .byte 0x00

            data_550:
/*0x0550*/  .word 0x00001f84 /* possible pointer */
            data_554:
/*0x0554*/  .word 0x20000038
            data_558:
/*0x0558*/  .word 0x2000001c


            .thumb_func
            call_55c:
/*0x055c*/      push {r4, lr}
/*0x055e*/      ldr r4, [pc, #0x60] /* data_5c0 */
/*0x0560*/      cbz r0, jump_590
/*0x0562*/      movs r1, #0
/*0x0564*/      mov r0, r4
/*0x0566*/      bl bftm_set_mien
/*0x056a*/      movs r1, #0
/*0x056c*/      mov r0, r4
/*0x056e*/      bl call_1c4
/*0x0572*/      mov r0, r4
/*0x0574*/      bl bftm_clear
/*0x0578*/      movs r0, #0x29
/*0x057a*/      bl nvic_disable_intr
/*0x057e*/      bl call_6f4
/*0x0582*/      movs r0, #1
/*0x0584*/      bl call_c68
/*0x0588*/      pop.w {r4, lr}
/*0x058c*/      b.w jump_d90
            jump_590:
/*0x0590*/      movs r0, #0
/*0x0592*/      bl call_c68
/*0x0596*/      movs r1, #0
/*0x0598*/      mov r0, r4
/*0x059a*/      bl bftm_set_counter
/*0x059e*/      mov r0, r4
/*0x05a0*/      bl bftm_clear
/*0x05a4*/      movs r1, #1
/*0x05a6*/      mov r0, r4
/*0x05a8*/      bl call_1c4
/*0x05ac*/      movs r1, #1
/*0x05ae*/      mov r0, r4
/*0x05b0*/      bl bftm_set_mien
/*0x05b4*/      ldr r1, [pc, #0xc] /* data_5c4 */
/*0x05b6*/      mov.w r0, #0x200
/*0x05ba*/      str.w r0, [r1, #0x100]
/*0x05be*/      pop {r4, pc}

            data_5c0:
/*0x05c0*/  .word 0x40076000
            data_5c4:
/*0x05c4*/  .word 0xe000e004


            .thumb_func
            call_5c8:
/*0x05c8*/      push {r4, lr}
/*0x05ca*/      movs r0, #0
/*0x05cc*/      mov.w r2, #0x10000
/*0x05d0*/      movs r3, #1
/*0x05d2*/      mov r1, r0
/*0x05d4*/      bl ckcu_clocks_enable
/*0x05d8*/      pop.w {r4, lr}
/*0x05dc*/      movw r1, #0x8c9f
/*0x05e0*/      ldr r0, [pc, #4] /* data_5e8 */
/*0x05e2*/      b.w call_38

/*0x05e6*/  .byte 0x00
/*0x05e7*/  .byte 0x00

            data_5e8:
/*0x05e8*/  .word 0x40076000


            .thumb_func
            call_5ec:
/*0x05ec*/      ldr r1, [pc, #0x70] /* data_660 */
/*0x05ee*/      push {r4, lr}
/*0x05f0*/      ldr r0, [r1]
/*0x05f2*/      movw r2, #0xf8ff
/*0x05f6*/      ands r0, r2
/*0x05f8*/      ldr r2, [pc, #0x68] /* data_664 */
/*0x05fa*/      orr r0, r0, #0x300
/*0x05fe*/      orrs r0, r2
/*0x0600*/      str r0, [r1]
/*0x0602*/      movs r2, #0
/*0x0604*/      mov r1, r2
/*0x0606*/      movs r0, #3
/*0x0608*/      bl call_67e
/*0x060c*/      mov r1, r0
/*0x060e*/      movs r0, #0x2b
/*0x0610*/      bl call_6b0
/*0x0614*/      movs r2, #0
/*0x0616*/      mov r1, r2
/*0x0618*/      movs r0, #3
/*0x061a*/      bl call_67e
/*0x061e*/      mov r1, r0
/*0x0620*/      movs r0, #0x2c
/*0x0622*/      bl call_6b0
/*0x0626*/      movs r2, #0
/*0x0628*/      movs r1, #1
/*0x062a*/      movs r0, #3
/*0x062c*/      bl call_67e
/*0x0630*/      mov r1, r0
/*0x0632*/      movs r0, #0x2a
/*0x0634*/      bl call_6b0
/*0x0638*/      movs r2, #0
/*0x063a*/      movs r1, #2
/*0x063c*/      movs r0, #3
/*0x063e*/      bl call_67e
/*0x0642*/      mov r1, r0
/*0x0644*/      movs r0, #0x29
/*0x0646*/      bl call_6b0
/*0x064a*/      movs r2, #0
/*0x064c*/      movs r1, #2
/*0x064e*/      movs r0, #3
/*0x0650*/      bl call_67e
/*0x0654*/      mov r1, r0
/*0x0656*/      pop.w {r4, lr}
/*0x065a*/      movs r0, #0x35
/*0x065c*/      b.w call_6b0

            data_660:
/*0x0660*/  .word 0xe000ed0c
            data_664:
/*0x0664*/  .word 0x05fa0000


            .thumb_func
            nvic_disable_intr:
/*0x0668*/      and r2, r0, #0x1f
/*0x066c*/      movs r1, #1
/*0x066e*/      lsls r1, r2
/*0x0670*/      lsrs r0, r0, #5
/*0x0672*/      lsls r0, r0, #2
/*0x0674*/      add.w r0, r0, #-0x1fff2000
/*0x0678*/      str.w r1, [r0, #0x180]
/*0x067c*/      bx lr

            .thumb_func
            call_67e:
/*0x067e*/      push {r4, r5, lr}
/*0x0680*/      and r3, r0, #7
/*0x0684*/      rsb.w r4, r3, #7
/*0x0688*/      cmp r4, #4
/*0x068a*/      bls jump_68e
/*0x068c*/      movs r4, #4
            jump_68e:
/*0x068e*/      adds r0, r3, #4
/*0x0690*/      cmp r0, #7
/*0x0692*/      bhs jump_698
/*0x0694*/      movs r3, #0
/*0x0696*/      b jump_69a
            jump_698:
/*0x0698*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_69a:
/*0x069a*/      movs r5, #1
/*0x069c*/      lsl.w r0, r5, r4
/*0x06a0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x06a2*/      ands r0, r1
/*0x06a4*/      lsls r0, r3
/*0x06a6*/      lsls r5, r3
/*0x06a8*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x06aa*/      ands r5, r2
/*0x06ac*/      orrs r0, r5
/*0x06ae*/      pop {r4, r5, pc}

            .thumb_func
            call_6b0:
/*0x06b0*/      lsls r1, r1, #0x1c
/*0x06b2*/      lsrs r1, r1, #0x18
/*0x06b4*/      cmp r0, #0
/*0x06b6*/      bge jump_6c6
/*0x06b8*/      and r0, r0, #0xf
/*0x06bc*/      add.w r0, r0, #-0x1fff2000
/*0x06c0*/      strb.w r1, [r0, #0xd14]
/*0x06c4*/      bx lr
            jump_6c6:
/*0x06c6*/      add.w r0, r0, #-0x1fff2000
/*0x06ca*/      strb.w r1, [r0, #0x400]
/*0x06ce*/      bx lr

            .thumb_func
            call_6d0:
/*0x06d0*/      push {r4, lr}
/*0x06d2*/      mov.w r2, #0x200
/*0x06d6*/      movs r1, #0
/*0x06d8*/      lsls r0, r2, #9
/*0x06da*/      movs r3, #1
/*0x06dc*/      bl ckcu_clocks_enable
/*0x06e0*/      movs r2, #1
/*0x06e2*/      pop.w {r4, lr}
/*0x06e6*/      mov r1, r2
/*0x06e8*/      ldr r0, [pc, #4] /* data_6f0 */
/*0x06ea*/      b.w call_3b0

/*0x06ee*/  .byte 0x00
/*0x06ef*/  .byte 0x00

            data_6f0:
/*0x06f0*/  .word 0x400b4000


            .thumb_func
            call_6f4:
/*0x06f4*/      movs r2, #0
/*0x06f6*/      mov r1, r2
/*0x06f8*/      movs r0, #2
/*0x06fa*/      b.w call_1ec

            .thumb_func
            call_6fe:
/*0x06fe*/      movs r2, #4
/*0x0700*/      movs r1, #0
/*0x0702*/      movs r0, #2
/*0x0704*/      b.w call_1ec

            .thumb_func
            call_708:
/*0x0708*/      push {r4, r5, r6, lr}
/*0x070a*/      ldr r1, [pc, #0x34] /* data_740 */
/*0x070c*/      ldr r4, [r1]
/*0x070e*/      ldr r5, [pc, #0x30] /* data_740 */
/*0x0710*/      adds r5, #0x48
/*0x0712*/      ldr r3, [r5]
/*0x0714*/      movs r2, #1
/*0x0716*/      str r2, [r1]
/*0x0718*/      movs r2, #0
/*0x071a*/      str r2, [r5]
/*0x071c*/      ldr r6, [pc, #0x24] /* data_744 */
/*0x071e*/      str.w r2, [r6, #0x9c]
/*0x0722*/      str.w r2, [r6, #0x8c]
/*0x0726*/      str r4, [r1]
/*0x0728*/      ldr r1, [pc, #0x1c] /* data_748 */
/*0x072a*/      ldr r2, [r1]
/*0x072c*/      orr r2, r2, #4
/*0x0730*/      str r2, [r1]
/*0x0732*/      cbz r0, jump_73a
/*0x0734*/      wfi 
            jump_736:
/*0x0736*/      str r3, [r5]
/*0x0738*/      pop {r4, r5, r6, pc}
            jump_73a:
/*0x073a*/      wfe 
/*0x073c*/      b jump_736

/*0x073e*/  .byte 0x00
/*0x073f*/  .byte 0x00

            data_740:
/*0x0740*/  .word 0x43100618
            data_744:
/*0x0744*/  .word 0x42d42000
            data_748:
/*0x0748*/  .word 0xe000ed10

            jump_74c:
/*0x074c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x0750*/      ldr r4, [pc, #0x38] /* data_78c */
/*0x0752*/      ldr r7, [r4]
/*0x0754*/      ldr r5, [pc, #0x34] /* data_78c */
/*0x0756*/      adds r5, #0x48
/*0x0758*/      ldr r6, [r5]
/*0x075a*/      mov.w sb, #1
/*0x075e*/      str.w sb, [r4]
/*0x0762*/      mov.w r8, #0
/*0x0766*/      str.w r8, [r5]
/*0x076a*/      bl call_ad0
/*0x076e*/      ldr r0, [pc, #0x20] /* data_790 */
/*0x0770*/      str.w r8, [r0, #0x9c]
/*0x0774*/      str.w sb, [r0, #0x8c]
/*0x0778*/      str r7, [r4]
/*0x077a*/      ldr r0, [pc, #0x18] /* data_794 */
/*0x077c*/      ldr r1, [r0]
/*0x077e*/      orr r1, r1, #4
/*0x0782*/      str r1, [r0]
/*0x0784*/      wfe 
/*0x0786*/      str r6, [r5]
/*0x0788*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_78c:
/*0x078c*/  .word 0x43100618
            data_790:
/*0x0790*/  .word 0x42d42000
            data_794:
/*0x0794*/  .word 0xe000ed10


            .thumb_func
            call_798:
/*0x0798*/      ldr r1, [pc, #0x10] /* data_7ac */
/*0x079a*/      ldr r2, [r1]
/*0x079c*/      bic r2, r2, #4
/*0x07a0*/      str r2, [r1]
/*0x07a2*/      cbz r0, jump_7a8
/*0x07a4*/      wfi 
/*0x07a6*/      bx lr
            jump_7a8:
/*0x07a8*/      wfe 
/*0x07aa*/      bx lr

            data_7ac:
/*0x07ac*/  .word 0xe000ed10


            .thumb_func
            decrypt_packet:
/*0x07b0*/      push {r4, r5, r6, r7, lr}
/*0x07b2*/      sub sp, #0x100
/*0x07b4*/      mov r4, r0
/*0x07b6*/      mov r5, r1
/*0x07b8*/      mov r0, sp
/*0x07ba*/      bl generate
/*0x07be*/      movs r2, #0
/*0x07c0*/      mov r3, r2
/*0x07c2*/      mov r1, sp
/*0x07c4*/      b jump_7e4
            jump_7c6:
/*0x07c6*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x07c8*/      uxtb r2, r2
/*0x07ca*/      ldrb r0, [r1, r2]
/*0x07cc*/      add r3, r0
/*0x07ce*/      uxtb r3, r3
/*0x07d0*/      ldrb r6, [r1, r3]
/*0x07d2*/      strb r6, [r1, r2]
/*0x07d4*/      strb r0, [r1, r3]
/*0x07d6*/      add r0, r6
/*0x07d8*/      uxtb r0, r0
/*0x07da*/      ldrb r7, [r4]
/*0x07dc*/      ldrb r0, [r1, r0]
/*0x07de*/      eors r7, r0
/*0x07e0*/      strb r7, [r4], #1
            jump_7e4:
/*0x07e4*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x07e6*/      bhs jump_7c6
/*0x07e8*/      add sp, #0x100
/*0x07ea*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            flash_write_buffer:
/*0x07ec*/      push {r4, r5, r6, lr}
/*0x07ee*/      lsrs r2, r2, #2
/*0x07f0*/      movs r4, #4
/*0x07f2*/      ldr r3, [pc, #0x18] /* data_80c */
/*0x07f4*/      movs r5, #0x14
/*0x07f6*/      b jump_804
            jump_7f8:
/*0x07f8*/      str r4, [r3, #0xc]
/*0x07fa*/      str r0, [r3]
/*0x07fc*/      ldm r1!, {r6}
/*0x07fe*/      str r6, [r3, #4]
/*0x0800*/      str r5, [r3, #0x10]
/*0x0802*/      .short 0x1d00 /* adds r0, r0, #4 */ 
            jump_804:
/*0x0804*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x0806*/      bhs jump_7f8
/*0x0808*/      pop {r4, r5, r6, pc}

/*0x080a*/  .byte 0x00
/*0x080b*/  .byte 0x00

            data_80c:
/*0x080c*/  .word 0x40080000


            .thumb_func
            handle_frame:
/*0x0810*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0814*/      ldr r5, [pc, #0x1c4] /* data_9dc */
/*0x0816*/      ldrb r0, [r5]
/*0x0818*/      cmp r0, #1
/*0x081a*/      bne jump_8fe
/*0x081c*/      ldr r6, [pc, #0x1c0] /* data_9e0 */
/*0x081e*/      movs r4, #0
/*0x0820*/      mov r0, r6
/*0x0822*/      ldrb r1, [r6]
/*0x0824*/      ldrb r0, [r0, #1]
/*0x0826*/      mov ip, r4
/*0x0828*/      cmp r1, #0x10
/*0x082a*/      beq jump_84c
/*0x082c*/      mov r2, r6
/*0x082e*/      mov.w lr, #0xcc00
/*0x0832*/      ldr r3, [r2, #4]
/*0x0834*/      mov.w r2, #0x3400
/*0x0838*/      add.w r7, r3, #0x3000
/*0x083c*/      cmp r1, #0x1d
/*0x083e*/      beq jump_8d0
/*0x0840*/      bgt jump_856
/*0x0842*/      cmp r1, #0x11
/*0x0844*/      beq jump_860
/*0x0846*/      cmp r1, #0x12
/*0x0848*/      bne jump_92c
/*0x084a*/      b jump_866
            jump_84c:
/*0x084c*/      cmp r0, #2
/*0x084e*/      bne jump_92c
/*0x0850*/      str.w ip, [r6, #4]
/*0x0854*/      b jump_962
            jump_856:
/*0x0856*/      cmp r1, #0x1e
/*0x0858*/      beq jump_94c
/*0x085a*/      cmp r1, #0x1f
/*0x085c*/      bne jump_92c
/*0x085e*/      b jump_984
            jump_860:
/*0x0860*/      bl reset_builtin
/*0x0864*/      b jump_96c
            jump_866:
/*0x0866*/      mov.w r3, #0x400
/*0x086a*/      cmp r0, #0x20
/*0x086c*/      blo jump_88c
/*0x086e*/      sub.w r1, r0, #0x1f
/*0x0872*/      rsb r1, r1, r1, lsl #4
/*0x0876*/      cmp.w r3, r1, lsl #2
/*0x087a*/      blt jump_88c
/*0x087c*/      rsb r0, r0, r0, lsl #4
/*0x0880*/      mov.w r1, #0x2880
/*0x0884*/      add.w r0, r1, r0, lsl #2
/*0x0888*/      movs r1, #0x3c
/*0x088a*/      b jump_966
            jump_88c:
/*0x088c*/      cbz r0, jump_898
/*0x088e*/      cmp r0, #1
/*0x0890*/      beq jump_8c0
/*0x0892*/      cmp r0, #2
/*0x0894*/      bne jump_92c
/*0x0896*/      b jump_8c8
            jump_898:
/*0x0898*/      ldrb r2, [r3]
/*0x089a*/      mov r0, r3
/*0x089c*/      cmp r2, #4
/*0x089e*/      beq jump_8bc
/*0x08a0*/      movs r2, #0x20
/*0x08a2*/      mov r1, r3
/*0x08a4*/      adds r0, r6, #4
/*0x08a6*/      bl memcpy
/*0x08aa*/      ldr r0, [pc, #0x138] /* data_9e4 */
/*0x08ac*/      ldr.w r1, [r0, #0x180]
/*0x08b0*/      str r1, [r6, #0x24]
/*0x08b2*/      ldr.w r0, [r0, #0x18c]
/*0x08b6*/      movs r1, #0x28
/*0x08b8*/      str r0, [r6, #0x28]
/*0x08ba*/      b jump_964
            jump_8bc:
/*0x08bc*/      movs r1, #0x34
/*0x08be*/      b jump_966
            jump_8c0:
/*0x08c0*/      movs r1, #4
/*0x08c2*/      mov.w r0, #0x3c00
/*0x08c6*/      b jump_966
            jump_8c8:
/*0x08c8*/      strb.w ip, [r6, #4]
/*0x08cc*/      movs r1, #1
/*0x08ce*/      b jump_964
            jump_8d0:
/*0x08d0*/      lsls r1, r3, #0x1e
/*0x08d2*/      bne jump_9c8
/*0x08d4*/      ldr r1, [r6, #8]
/*0x08d6*/      cbz r1, jump_92c
/*0x08d8*/      lsls r4, r1, #0x1e
/*0x08da*/      bne jump_9c8
/*0x08dc*/      add r3, r1
/*0x08de*/      cmp r3, lr
/*0x08e0*/      bhi jump_9c8
/*0x08e2*/      str r7, [r6, #4]
/*0x08e4*/      cbz r0, jump_8f0
/*0x08e6*/      cmp r0, #1
/*0x08e8*/      beq jump_930
/*0x08ea*/      cmp r0, #2
/*0x08ec*/      bne jump_9c8
/*0x08ee*/      b jump_930
            jump_8f0:
/*0x08f0*/      adds r0, r7, r1
/*0x08f2*/      str.w ip, [r6, #8]
/*0x08f6*/      strd r7, r0, [r6, #0xc]
/*0x08fa*/      mov r0, r7
/*0x08fc*/      b jump_91a
            jump_8fe:
/*0x08fe*/      b jump_980
            jump_900:
/*0x0900*/      bl flash_page_erase
/*0x0904*/      cbnz r0, jump_920
/*0x0906*/      bl call_1618
/*0x090a*/      ldr r0, [r6, #8]
/*0x090c*/      add.w r0, r0, #0x400
/*0x0910*/      str r0, [r6, #8]
/*0x0912*/      ldr r0, [r6, #0xc]
/*0x0914*/      add.w r0, r0, #0x400
/*0x0918*/      str r0, [r6, #0xc]
            jump_91a:
/*0x091a*/      ldr r1, [r6, #0x10]
/*0x091c*/      cmp r0, r1
/*0x091e*/      blo jump_900
            jump_920:
/*0x0920*/      ldr r0, [r6, #4]
/*0x0922*/      movs r1, #8
/*0x0924*/      sub.w r0, r0, #0x3000
/*0x0928*/      str r0, [r6, #4]
/*0x092a*/      b jump_964
            jump_92c:
/*0x092c*/      b jump_9c8

/*0x092e*/  .byte 0x0d
/*0x092f*/  .byte 0xe0

            jump_930:
/*0x0930*/      cmp r7, r2
/*0x0932*/      blo jump_9c8
/*0x0934*/      cmp.w r1, #0x1000
/*0x0938*/      blo jump_9c8
/*0x093a*/      cmp r0, #2
/*0x093c*/      beq jump_948
/*0x093e*/      movs r2, #0
            jump_940:
/*0x0940*/      mov r0, r7
/*0x0942*/      bl firmware_check
/*0x0946*/      b jump_960
            jump_948:
/*0x0948*/      movs r2, #1
/*0x094a*/      b jump_940
            jump_94c:
/*0x094c*/      cbz r0, jump_95c
/*0x094e*/      cmp r0, #1
/*0x0950*/      bne jump_9c8
/*0x0952*/      cmp r3, lr
/*0x0954*/      bhs jump_9c8
/*0x0956*/      lsls r0, r3, #0x1e
/*0x0958*/      bne jump_9c8
/*0x095a*/      str r7, [r5, #4]
            jump_95c:
/*0x095c*/      ldr r0, [r5, #4]
/*0x095e*/      b jump_9c2
            jump_960:
/*0x0960*/      str r0, [r6, #4]
            jump_962:
/*0x0962*/      movs r1, #4
            jump_964:
/*0x0964*/      adds r0, r6, #4
            jump_966:
/*0x0966*/      bl flash_read_packet
/*0x096a*/      movs r4, #1
            jump_96c:
/*0x096c*/      ldrb r0, [r5]
/*0x096e*/      cmp r0, #1
/*0x0970*/      bne jump_980
/*0x0972*/      cbz r4, jump_9c8
/*0x0974*/      movs r1, #0x3c
/*0x0976*/      adds r0, r6, #4
            jump_978:
/*0x0978*/      bl mem_zero
/*0x097c*/      movs r0, #2
/*0x097e*/      strb r0, [r5]
            jump_980:
/*0x0980*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_984:
/*0x0984*/      cbz r0, jump_9c8
/*0x0986*/      lsls r1, r0, #0x1e
/*0x0988*/      bne jump_9c8
/*0x098a*/      cmp r0, #0x3c
/*0x098c*/      bhi jump_9c8
/*0x098e*/      ldr r1, [r5, #4]
/*0x0990*/      adds r3, r0, r1
/*0x0992*/      cmp.w r3, #0xfc00
/*0x0996*/      bhi jump_9c8
/*0x0998*/      cmp r1, r2
/*0x099a*/      bhs jump_9a2
/*0x099c*/      cmp r3, r2
/*0x099e*/      bhi jump_9c8
/*0x09a0*/      b jump_9aa
            jump_9a2:
/*0x09a2*/      mov r1, r0
/*0x09a4*/      adds r0, r6, #4
/*0x09a6*/      bl decrypt_packet
            jump_9aa:
/*0x09aa*/      ldrb r2, [r6, #1]
/*0x09ac*/      adds r1, r6, #4
/*0x09ae*/      ldr r0, [r5, #4]
/*0x09b0*/      bl flash_write_buffer
/*0x09b4*/      ldrb r0, [r6, #1]
/*0x09b6*/      ldr r1, [r5, #4]
/*0x09b8*/      add r0, r1
/*0x09ba*/      movw r1, #0x21e
/*0x09be*/      str r0, [r5, #4]
/*0x09c0*/      strh r1, [r6]
            jump_9c2:
/*0x09c2*/      sub.w r0, r0, #0x3000
/*0x09c6*/      b jump_960
            jump_9c8:
/*0x09c8*/      ldr r0, [r6]
/*0x09ca*/      str r0, [r6, #4]
/*0x09cc*/      movw r0, #0xaaff
/*0x09d0*/      str r0, [r6]
/*0x09d2*/      ldr r0, [pc, #0xc] /* data_9e0 */
/*0x09d4*/      movs r1, #0x38
/*0x09d6*/      adds r0, #8
/*0x09d8*/      b jump_978

/*0x09da*/  .byte 0x00
/*0x09db*/  .byte 0x00

            data_9dc:
/*0x09dc*/  .word 0x20000004
            data_9e0:
/*0x09e0*/  .word 0x20000084
            data_9e4:
/*0x09e4*/  .word 0x40080000


            .thumb_func
            reset_builtin:
/*0x09e8*/      push {r4, lr}
/*0x09ea*/      ldr r1, [pc, #0x6c] /* data_a58 */
/*0x09ec*/      cbz r0, jump_a0a
/*0x09ee*/      cmp r0, #1
/*0x09f0*/      beq jump_a0e
/*0x09f2*/      cmp r0, #2
/*0x09f4*/      bne jump_a56
/*0x09f6*/      movs r0, #0x35
/*0x09f8*/      bl nvic_disable_intr
/*0x09fc*/      movs r0, #0
/*0x09fe*/      bl call_1264
/*0x0a02*/      pop.w {r4, lr}
/*0x0a06*/      b.w jump_74c
            jump_a0a:
/*0x0a0a*/      ldr r0, [pc, #0x50] /* data_a5c */
/*0x0a0c*/      b jump_a12
            jump_a0e:
/*0x0a0e*/      ldr r0, [pc, #0x4c] /* data_a5c */
/*0x0a10*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_a12:
/*0x0a12*/      str r0, [r1]
/*0x0a14*/      movs r1, #0
/*0x0a16*/      mov.w r0, #0x10000
/*0x0a1a*/      movs r3, #1
/*0x0a1c*/      mov r2, r1
/*0x0a1e*/      bl ckcu_clocks_enable
/*0x0a22*/      ldr r1, [pc, #0x3c] /* data_a60 */
/*0x0a24*/      mov.w r0, #0x200
/*0x0a28*/      str r0, [r1, #0x24]
/*0x0a2a*/      movs r0, #0x35
/*0x0a2c*/      bl nvic_disable_intr
/*0x0a30*/      movs r0, #0
/*0x0a32*/      bl call_1264
/*0x0a36*/      movw r0, #0x4e20
/*0x0a3a*/      bl call_102
/*0x0a3e*/      dsb sy
/*0x0a42*/      ldr r0, [pc, #0x20] /* data_a64 */
/*0x0a44*/      ldr r1, [r0]
/*0x0a46*/      ldr r2, [pc, #0x20] /* data_a68 */
/*0x0a48*/      and r1, r1, #0x700
/*0x0a4c*/      orrs r1, r2
/*0x0a4e*/      str r1, [r0]
/*0x0a50*/      dsb sy
            jump_a54:
/*0x0a54*/      b jump_a54
            jump_a56:
/*0x0a56*/      pop {r4, pc}

            data_a58:
/*0x0a58*/  .word 0x20003ffc
            data_a5c:
/*0x0a5c*/  .word 0x55aafaf5
            data_a60:
/*0x0a60*/  .word 0x400b0000
            data_a64:
/*0x0a64*/  .word 0xe000ed0c
            data_a68:
/*0x0a68*/  .word 0x05fa0004


            .thumb_func
            flash_read_packet:
/*0x0a6c*/      push {r4, r5, r6, lr}
/*0x0a6e*/      mov r4, r1
/*0x0a70*/      ldr r2, [pc, #0x24] /* data_a98 */
/*0x0a72*/      mov r1, r0
/*0x0a74*/      movs r0, #2
/*0x0a76*/      strb r0, [r2]
/*0x0a78*/      ldr r0, [pc, #0x20] /* data_a9c */
/*0x0a7a*/      subs r5, r0, #4
/*0x0a7c*/      cmp r1, r0
/*0x0a7e*/      beq jump_a88
/*0x0a80*/      mov r2, r4
/*0x0a82*/      adds r0, r5, #4
/*0x0a84*/      bl memcpy
            jump_a88:
/*0x0a88*/      adds r0, r5, r4
/*0x0a8a*/      rsb.w r1, r4, #0x3c
/*0x0a8e*/      pop.w {r4, r5, r6, lr}
/*0x0a92*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x0a94*/      b.w mem_zero

            data_a98:
/*0x0a98*/  .word 0x20000004
            data_a9c:
/*0x0a9c*/  .word 0x20000088

            jump_aa0:
/*0x0aa0*/      push {r4, r5, r6, r7, lr}
/*0x0aa2*/      ldr r7, [pc, #0x28] /* data_acc */
/*0x0aa4*/      ldr.w r4, [r7, #0x104]
/*0x0aa8*/      ldr.w r5, [r7, #0x108]
/*0x0aac*/      ldr.w r6, [r7, #0x10c]
/*0x0ab0*/      bics r4, r0
/*0x0ab2*/      bics r5, r1
/*0x0ab4*/      bics r6, r2
/*0x0ab6*/      cbz r3, jump_abe
/*0x0ab8*/      orrs r4, r0
/*0x0aba*/      orrs r5, r1
/*0x0abc*/      orrs r6, r2
            jump_abe:
/*0x0abe*/      str.w r4, [r7, #0x104]
/*0x0ac2*/      str.w r5, [r7, #0x108]
/*0x0ac6*/      str.w r6, [r7, #0x10c]
/*0x0aca*/      pop {r4, r5, r6, r7, pc}

            data_acc:
/*0x0acc*/  .word 0x40088000


            .thumb_func
            call_ad0:
/*0x0ad0*/      ldr r2, [pc, #0x1c] /* data_af0 */
/*0x0ad2*/      movs r1, #0
/*0x0ad4*/      mov.w r0, #0x1c20
/*0x0ad8*/      str.w r1, [r2, #0x108]
            jump_adc:
/*0x0adc*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0ade*/      bhs jump_adc
/*0x0ae0*/      movs r0, #1
/*0x0ae2*/      str.w r0, [r2, #0x108]
/*0x0ae6*/      ldr r0, [pc, #0xc] /* data_af4 */
            jump_ae8:
/*0x0ae8*/      ldr r1, [r0, #8]
/*0x0aea*/      lsls r1, r1, #0x1a
/*0x0aec*/      bpl jump_ae8
/*0x0aee*/      bx lr

            data_af0:
/*0x0af0*/  .word 0x42d40000
            data_af4:
/*0x0af4*/  .word 0x40088000


            .thumb_func
            call_af8:
/*0x0af8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0afc*/      movs r7, #0xa
/*0x0afe*/      ldr r5, [pc, #0x58] /* data_b58 */
/*0x0b00*/      b jump_b4e
            jump_b02:
/*0x0b02*/      ldr r1, [pc, #0x54] /* data_b58 */
/*0x0b04*/      add.w r0, r7, r7, lsl #1
/*0x0b08*/      add r0, r1
/*0x0b0a*/      ldrb r1, [r5, #-0x1]!
/*0x0b0e*/      ldrb r0, [r0, #2]
/*0x0b10*/      eors r0, r1
/*0x0b12*/      movs.w r8, r0
/*0x0b16*/      beq jump_b4e
/*0x0b18*/      movs r4, #0x80
/*0x0b1a*/      movs r6, #8
/*0x0b1c*/      b jump_b48
            jump_b1e:
/*0x0b1e*/      tst.w r8, r4
/*0x0b22*/      beq jump_b46
/*0x0b24*/      ldrb r0, [r5]
/*0x0b26*/      eors r0, r4
/*0x0b28*/      strb r0, [r5]
/*0x0b2a*/      tst r0, r4
/*0x0b2c*/      bne jump_b32
/*0x0b2e*/      movs r1, #1
/*0x0b30*/      b jump_b34
            jump_b32:
/*0x0b32*/      movs r1, #0
            jump_b34:
/*0x0b34*/      add.w r0, r6, r7, lsl #3
/*0x0b38*/      uxtb r0, r0
/*0x0b3a*/      bl call_4dc
/*0x0b3e*/      cbnz r0, jump_b46
/*0x0b40*/      ldrb r0, [r5]
/*0x0b42*/      eors r0, r4
/*0x0b44*/      strb r0, [r5]
            jump_b46:
/*0x0b46*/      lsrs r4, r4, #1
            jump_b48:
/*0x0b48*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x0b4a*/      uxtb r6, r6
/*0x0b4c*/      bhs jump_b1e
            jump_b4e:
/*0x0b4e*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x0b50*/      uxtb r7, r7
/*0x0b52*/      bhs jump_b02
/*0x0b54*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_b58:
/*0x0b58*/  .word 0x200000ce


            .thumb_func
            call_b5c:
/*0x0b5c*/      push {r4, r5, r6, lr}
/*0x0b5e*/      movs r4, #2
/*0x0b60*/      ldr r5, [pc, #0x34] /* data_b98 */
/*0x0b62*/      mov.w r6, #0x1f4
            jump_b66:
/*0x0b66*/      bl call_1738
/*0x0b6a*/      movs r1, #0xa
/*0x0b6c*/      b jump_b76
            jump_b6e:
/*0x0b6e*/      add.w r0, r1, r1, lsl #1
/*0x0b72*/      ldrb r0, [r5, r0]
/*0x0b74*/      cbnz r0, jump_b7c
            jump_b76:
/*0x0b76*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0b78*/      uxtb r1, r1
/*0x0b7a*/      bhs jump_b6e
            jump_b7c:
/*0x0b7c*/      cmp r1, #0xff
/*0x0b7e*/      beq jump_b86
/*0x0b80*/      cmp r4, #0
/*0x0b82*/      bne jump_b66
            jump_b84:
/*0x0b84*/      pop {r4, r5, r6, pc}
            jump_b86:
/*0x0b86*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0b88*/      ands r4, r4, #0xff
/*0x0b8c*/      beq jump_b84
/*0x0b8e*/      mov r0, r6
/*0x0b90*/      bl call_102
/*0x0b94*/      b jump_b66

/*0x0b96*/  .byte 0x00
/*0x0b97*/  .byte 0x00

            data_b98:
/*0x0b98*/  .word 0x200000ce

            jump_b9c:
/*0x0b9c*/      ldr r1, [pc, #0x10] /* data_bb0 */
/*0x0b9e*/      ldrb r0, [r1]
/*0x0ba0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0ba2*/      strb r0, [r1]
/*0x0ba4*/      lsls r0, r0, #0x1e
/*0x0ba6*/      bne jump_bac
/*0x0ba8*/      b.w call_1738
            jump_bac:
/*0x0bac*/      bx lr

/*0x0bae*/  .byte 0x00
/*0x0baf*/  .byte 0x00

            data_bb0:
/*0x0bb0*/  .word 0x2000000c


            .thumb_func
            call_bb4:
/*0x0bb4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0bb8*/      movs r6, #0
/*0x0bba*/      mov r1, r6
/*0x0bbc*/      mov.w r0, #0xf0000
/*0x0bc0*/      movs r3, #1
/*0x0bc2*/      mov r2, r6
/*0x0bc4*/      bl ckcu_clocks_enable
/*0x0bc8*/      movs r4, #8
/*0x0bca*/      b jump_bfc
            jump_bcc:
/*0x0bcc*/      ldr r0, [pc, #0x90] /* data_c60 */
/*0x0bce*/      movs r2, #0
/*0x0bd0*/      add.w r1, r0, r4, lsl #3
/*0x0bd4*/      ldrh r5, [r1, #4]
/*0x0bd6*/      ldr r0, [r1]
/*0x0bd8*/      uxth r1, r5
/*0x0bda*/      mov r7, r0
/*0x0bdc*/      bl call_3c0
/*0x0be0*/      uxth r1, r5
/*0x0be2*/      mov r0, r7
/*0x0be4*/      movs r2, #1
/*0x0be6*/      bl call_3a0
/*0x0bea*/      ldr r0, [pc, #0x74] /* data_c60 */
/*0x0bec*/      adds r0, #0x40
/*0x0bee*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x0bf2*/      add.w r0, r0, r4, lsl #1
/*0x0bf6*/      ldrb r0, [r0, #1]
/*0x0bf8*/      bl call_ac
            jump_bfc:
/*0x0bfc*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0bfe*/      uxtb r4, r4
/*0x0c00*/      bhs jump_bcc
/*0x0c02*/      movs r4, #0xa
/*0x0c04*/      b jump_c2e
            jump_c06:
/*0x0c06*/      ldr r0, [pc, #0x58] /* data_c60 */
/*0x0c08*/      adds r0, #0x50
/*0x0c0a*/      add.w r1, r0, r4, lsl #3
/*0x0c0e*/      ldrh r5, [r1, #4]
/*0x0c10*/      ldr r7, [r1]
/*0x0c12*/      uxth r1, r5
/*0x0c14*/      mov r0, r7
/*0x0c16*/      bl call_e0
/*0x0c1a*/      uxth r1, r5
/*0x0c1c*/      mov r0, r7
/*0x0c1e*/      movs r2, #0
/*0x0c20*/      bl call_3b0
/*0x0c24*/      uxth r1, r5
/*0x0c26*/      mov r0, r7
/*0x0c28*/      movs r2, #1
/*0x0c2a*/      bl call_390
            jump_c2e:
/*0x0c2e*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0c30*/      uxtb r4, r4
/*0x0c32*/      bhs jump_c06
/*0x0c34*/      movs r2, #0xff
/*0x0c36*/      movs r1, #0xa
/*0x0c38*/      ldr r0, [pc, #0x28] /* data_c64 */
/*0x0c3a*/      bl mem_set
/*0x0c3e*/      ldr r0, [pc, #0x24] /* data_c64 */
/*0x0c40*/      movs r1, #0xa
/*0x0c42*/      adds r0, #0xa
/*0x0c44*/      movs r2, #0xff
/*0x0c46*/      b jump_c54
            jump_c48:
/*0x0c48*/      strb r6, [r0], #1
/*0x0c4c*/      strb r2, [r0], #1
/*0x0c50*/      strb r2, [r0], #1
            jump_c54:
/*0x0c54*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0c56*/      uxtb r1, r1
/*0x0c58*/      bhs jump_c48
/*0x0c5a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x0c5e*/  .byte 0x00
/*0x0c5f*/  .byte 0x00

            data_c60:
/*0x0c60*/  .word 0x00001fd4 /* possible pointer */
            data_c64:
/*0x0c64*/  .word 0x200000c4


            .thumb_func
            call_c68:
/*0x0c68*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0c6c*/      movs r7, r0
/*0x0c6e*/      mov.w r4, #0xa
/*0x0c72*/      beq jump_c7c
/*0x0c74*/      movs r0, #0
            jump_c76:
/*0x0c76*/      mov r8, r0
/*0x0c78*/      ldr r5, [pc, #0x50] /* data_ccc */
/*0x0c7a*/      b jump_ca0
            jump_c7c:
/*0x0c7c*/      movs r0, #1
/*0x0c7e*/      b jump_c76
            jump_c80:
/*0x0c80*/      add.w r6, r5, r4, lsl #3
/*0x0c84*/      mov r2, r8
/*0x0c86*/      ldrh r0, [r6, #4]
/*0x0c88*/      uxth r1, r0
/*0x0c8a*/      ldr.w r0, [r5, r4, lsl #3]
/*0x0c8e*/      bl call_3e8
/*0x0c92*/      ldrh r0, [r6, #4]
/*0x0c94*/      movs r2, #1
/*0x0c96*/      uxth r1, r0
/*0x0c98*/      ldr.w r0, [r5, r4, lsl #3]
/*0x0c9c*/      bl call_390
            jump_ca0:
/*0x0ca0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0ca2*/      uxtb r4, r4
/*0x0ca4*/      bhs jump_c80
/*0x0ca6*/      cbz r7, jump_cba
/*0x0ca8*/      movs r2, #0
            jump_caa:
/*0x0caa*/      ldr r4, [pc, #0x24] /* data_cd0 */
/*0x0cac*/      movs r1, #0x10
/*0x0cae*/      mov r0, r4
/*0x0cb0*/      bl call_3b0
/*0x0cb4*/      cbz r7, jump_cbe
/*0x0cb6*/      movs r2, #1
/*0x0cb8*/      b jump_cc0
            jump_cba:
/*0x0cba*/      movs r2, #1
/*0x0cbc*/      b jump_caa
            jump_cbe:
/*0x0cbe*/      movs r2, #0
            jump_cc0:
/*0x0cc0*/      mov r0, r4
/*0x0cc2*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0cc6*/      movs r1, #0x10
/*0x0cc8*/      b.w call_3e8

            data_ccc:
/*0x0ccc*/  .word 0x00002024 /* possible pointer */
            data_cd0:
/*0x0cd0*/  .word 0x400b0000


            .thumb_func
            call_cd4:
/*0x0cd4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0cd8*/      movs r1, #0
/*0x0cda*/      mov.w r2, #0x20000
/*0x0cde*/      mov.w r0, #0x70000
/*0x0ce2*/      movs r3, #1
/*0x0ce4*/      bl ckcu_clocks_enable
/*0x0ce8*/      movw r1, #0xea60
/*0x0cec*/      ldr r0, [pc, #0x90] /* data_d80 */
/*0x0cee*/      bl call_38
/*0x0cf2*/      ldr r4, [pc, #0x90] /* data_d84 */
/*0x0cf4*/      movs r1, #2
/*0x0cf6*/      mov r0, r4
/*0x0cf8*/      bl call_e0
/*0x0cfc*/      movs r2, #1
/*0x0cfe*/      movs r1, #2
/*0x0d00*/      mov r0, r4
/*0x0d02*/      bl call_3b0
/*0x0d06*/      movs r2, #1
/*0x0d08*/      movs r1, #2
/*0x0d0a*/      mov r0, r4
/*0x0d0c*/      bl call_390
/*0x0d10*/      movs r1, #4
/*0x0d12*/      mov r0, r4
/*0x0d14*/      bl call_e0
/*0x0d18*/      ldr r6, [pc, #0x6c] /* data_d88 */
/*0x0d1a*/      mov.w r5, #0x4000
/*0x0d1e*/      mov r1, r5
/*0x0d20*/      mov r0, r6
/*0x0d22*/      bl call_e0
/*0x0d26*/      lsls r7, r5, #1
/*0x0d28*/      mov r1, r7
/*0x0d2a*/      mov r0, r6
/*0x0d2c*/      bl call_e0
/*0x0d30*/      movs r2, #1
/*0x0d32*/      movs r1, #4
/*0x0d34*/      mov r0, r4
/*0x0d36*/      bl call_3b0
/*0x0d3a*/      movs r2, #1
/*0x0d3c*/      mov r1, r5
/*0x0d3e*/      mov r0, r6
/*0x0d40*/      bl call_3b0
/*0x0d44*/      movs r2, #1
/*0x0d46*/      mov r1, r7
/*0x0d48*/      mov r0, r6
/*0x0d4a*/      bl call_3b0
/*0x0d4e*/      movs r2, #1
/*0x0d50*/      movs r1, #4
/*0x0d52*/      mov r0, r4
/*0x0d54*/      bl call_390
/*0x0d58*/      movs r2, #1
/*0x0d5a*/      mov r1, r5
/*0x0d5c*/      mov r0, r6
/*0x0d5e*/      bl call_390
/*0x0d62*/      movs r2, #1
/*0x0d64*/      mov r1, r7
/*0x0d66*/      mov r0, r6
/*0x0d68*/      bl call_390
/*0x0d6c*/      movs r2, #1
/*0x0d6e*/      mov r1, r2
/*0x0d70*/      ldr r0, [pc, #0x18] /* data_d8c */
/*0x0d72*/      bl call_3a0
/*0x0d76*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0d7a*/      b.w jump_17f0

/*0x0d7e*/  .byte 0x00
/*0x0d7f*/  .byte 0x00

            data_d80:
/*0x0d80*/  .word 0x40077000
            data_d84:
/*0x0d84*/  .word 0x400b4000
            data_d88:
/*0x0d88*/  .word 0x400b0000
            data_d8c:
/*0x0d8c*/  .word 0x400b2000

            jump_d90:
/*0x0d90*/      push {r4, r5, r6, lr}
/*0x0d92*/      ldr r4, [pc, #0x60] /* data_df4 */
/*0x0d94*/      movs r1, #0
/*0x0d96*/      mov r0, r4
/*0x0d98*/      bl bftm_set_mien
/*0x0d9c*/      movs r1, #0
/*0x0d9e*/      mov r0, r4
/*0x0da0*/      bl call_1c4
/*0x0da4*/      mov r0, r4
/*0x0da6*/      bl bftm_clear
/*0x0daa*/      ldr r1, [pc, #0x4c] /* data_df8 */
/*0x0dac*/      asrs r0, r4, #0x14
/*0x0dae*/      str.w r0, [r1, #0x180]
/*0x0db2*/      movs r1, #0
/*0x0db4*/      ldr r0, [pc, #0x44] /* data_dfc */
/*0x0db6*/      bl call_444
/*0x0dba*/      ldr r1, [pc, #0x44] /* data_e00 */
/*0x0dbc*/      movs r0, #2
/*0x0dbe*/      str r0, [r1, #0x24]
/*0x0dc0*/      ldr r4, [pc, #0x40] /* data_e04 */
/*0x0dc2*/      movs r5, #8
/*0x0dc4*/      b jump_dec
            jump_dc6:
/*0x0dc6*/      ldrh r0, [r4, #4]
/*0x0dc8*/      movs r2, #0
/*0x0dca*/      uxth r1, r0
/*0x0dcc*/      ldr r0, [r4]
/*0x0dce*/      bl call_390
/*0x0dd2*/      ldrh r0, [r4, #4]
/*0x0dd4*/      movs r2, #1
/*0x0dd6*/      uxth r1, r0
/*0x0dd8*/      ldr r0, [r4]
/*0x0dda*/      bl call_3a0
/*0x0dde*/      ldrh r0, [r4, #4]
/*0x0de0*/      movs r2, #2
/*0x0de2*/      uxth r1, r0
/*0x0de4*/      ldr r0, [r4]
/*0x0de6*/      bl call_3c0
/*0x0dea*/      adds r4, #8
            jump_dec:
/*0x0dec*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0dee*/      uxtb r5, r5
/*0x0df0*/      bhs jump_dc6
/*0x0df2*/      pop {r4, r5, r6, pc}

            data_df4:
/*0x0df4*/  .word 0x40077000
            data_df8:
/*0x0df8*/  .word 0xe000e004
            data_dfc:
/*0x0dfc*/  .word 0x4006f000
            data_e00:
/*0x0e00*/  .word 0x400b4000
            data_e04:
/*0x0e04*/  .word 0x00002074 /* possible pointer */


            .thumb_func
            call_e08:
/*0x0e08*/      push {r4, r5, r6, lr}
/*0x0e0a*/      ldr r4, [pc, #0x8c] /* data_e98 */
/*0x0e0c*/      movs r5, #8
/*0x0e0e*/      b jump_e34
            jump_e10:
/*0x0e10*/      ldrh r0, [r4, #4]
/*0x0e12*/      uxth r1, r0
/*0x0e14*/      ldr r0, [r4]
/*0x0e16*/      bl call_e0
/*0x0e1a*/      ldrh r0, [r4, #4]
/*0x0e1c*/      movs r2, #1
/*0x0e1e*/      uxth r1, r0
/*0x0e20*/      ldr r0, [r4]
/*0x0e22*/      bl call_3b0
/*0x0e26*/      ldrh r0, [r4, #4]
/*0x0e28*/      movs r2, #1
/*0x0e2a*/      uxth r1, r0
/*0x0e2c*/      ldr r0, [r4]
/*0x0e2e*/      bl call_390
/*0x0e32*/      adds r4, #8
            jump_e34:
/*0x0e34*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0e36*/      uxtb r5, r5
/*0x0e38*/      bhs jump_e10
/*0x0e3a*/      ldr r1, [pc, #0x60] /* data_e9c */
/*0x0e3c*/      movs r0, #2
/*0x0e3e*/      str r0, [r1, #0x28]
/*0x0e40*/      lsls r1, r0, #8
/*0x0e42*/      ldr r0, [pc, #0x5c] /* data_ea0 */
/*0x0e44*/      bl mem_zero
/*0x0e48*/      ldr r1, [pc, #0x58] /* data_ea4 */
/*0x0e4a*/      movs r0, #0
/*0x0e4c*/      strb r0, [r1, #1]
/*0x0e4e*/      movs r0, #0x64
/*0x0e50*/      bl call_102
/*0x0e54*/      bl call_f00
/*0x0e58*/      movs r0, #2
/*0x0e5a*/      bl call_1844
/*0x0e5e*/      ldr r1, [pc, #0x48] /* data_ea8 */
/*0x0e60*/      mov.w r0, #0x8000
/*0x0e64*/      str r0, [r1, #0x24]
/*0x0e66*/      movs r1, #1
/*0x0e68*/      ldr r0, [pc, #0x40] /* data_eac */
/*0x0e6a*/      bl call_444
/*0x0e6e*/      ldr r4, [pc, #0x40] /* data_eb0 */
/*0x0e70*/      movs r1, #0
/*0x0e72*/      mov r0, r4
/*0x0e74*/      bl bftm_set_counter
/*0x0e78*/      mov r0, r4
/*0x0e7a*/      bl bftm_clear
/*0x0e7e*/      movs r1, #1
/*0x0e80*/      mov r0, r4
/*0x0e82*/      bl call_1c4
/*0x0e86*/      movs r1, #1
/*0x0e88*/      mov r0, r4
/*0x0e8a*/      bl bftm_set_mien
/*0x0e8e*/      ldr r1, [pc, #0x24] /* data_eb4 */
/*0x0e90*/      asrs r0, r4, #0x14
/*0x0e92*/      str.w r0, [r1, #0x100]
/*0x0e96*/      pop {r4, r5, r6, pc}

            data_e98:
/*0x0e98*/  .word 0x00002074 /* possible pointer */
            data_e9c:
/*0x0e9c*/  .word 0x400b4000
            data_ea0:
/*0x0ea0*/  .word 0x200000ec
            data_ea4:
/*0x0ea4*/  .word 0x20000010
            data_ea8:
/*0x0ea8*/  .word 0x400b0000
            data_eac:
/*0x0eac*/  .word 0x4006f000
            data_eb0:
/*0x0eb0*/  .word 0x40077000
            data_eb4:
/*0x0eb4*/  .word 0xe000e004


            .thumb_func
            call_eb8:
/*0x0eb8*/      push {r4, r5, lr}
/*0x0eba*/      movs r0, #0x12
/*0x0ebc*/      bl call_1844
/*0x0ec0*/      movs r1, #0xa
/*0x0ec2*/      mov.w r0, #0x300
/*0x0ec6*/      bl call_1874
/*0x0eca*/      movs r1, #2
/*0x0ecc*/      movs r0, #0
/*0x0ece*/      bl call_1874
/*0x0ed2*/      ldr r4, [pc, #0x24] /* data_ef8 */
/*0x0ed4*/      mov.w r0, #0x4000
/*0x0ed8*/      str r0, [r4, #0x28]
/*0x0eda*/      lsls r5, r0, #1
/*0x0edc*/      str r5, [r4, #0x24]
/*0x0ede*/      movs r1, #8
/*0x0ee0*/      mov.w r0, #0xc00
/*0x0ee4*/      bl call_1874
/*0x0ee8*/      ldr r1, [pc, #0x10] /* data_efc */
/*0x0eea*/      movs r0, #4
/*0x0eec*/      str r0, [r1, #0x24]
/*0x0eee*/      str r5, [r4, #0x28]
/*0x0ef0*/      nop 
/*0x0ef2*/      nop 
/*0x0ef4*/      str r5, [r4, #0x24]
/*0x0ef6*/      pop {r4, r5, pc}

            data_ef8:
/*0x0ef8*/  .word 0x400b0000
            data_efc:
/*0x0efc*/  .word 0x400b4000


            .thumb_func
            call_f00:
/*0x0f00*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x0f04*/      ldr r1, [pc, #0x78] /* data_f80 */
/*0x0f06*/      ldr r0, [pc, #0x74] /* data_f7c */
/*0x0f08*/      movs r5, #0x10
/*0x0f0a*/      ldrb r2, [r1, #1]
/*0x0f0c*/      movs r7, #4
/*0x0f0e*/      add.w r4, r0, r2, lsl #6
/*0x0f12*/      ldrb r0, [r1]
/*0x0f14*/      ldr.w sl, [pc, #0x6c] /* data_f84 */
/*0x0f18*/      ldr r6, [pc, #0x6c] /* data_f88 */
/*0x0f1a*/      mov.w fp, #0x4000
/*0x0f1e*/      adds r4, #0x3e
/*0x0f20*/      cbz r0, jump_f30
/*0x0f22*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0f24*/      ands r0, r0, #0xff
/*0x0f28*/      strb r0, [r1]
/*0x0f2a*/      bne jump_f30
/*0x0f2c*/      bl call_eb8
            jump_f30:
/*0x0f30*/      mov sb, r7
            jump_f32:
/*0x0f32*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0f34*/      uxtb r5, r5
/*0x0f36*/      blo jump_f72
/*0x0f38*/      mov.w r8, #0x8000
/*0x0f3c*/      str.w r8, [r6, #0x28]
/*0x0f40*/      ldrh r0, [r4]
/*0x0f42*/      subs r7, r4, #2
/*0x0f44*/      movs r1, #0xa
/*0x0f46*/      bl call_1874
/*0x0f4a*/      ldrh r0, [r7]
/*0x0f4c*/      movs r1, #9
/*0x0f4e*/      ubfx r7, r0, #6, #1
/*0x0f52*/      .short 0x1f24 /* subs r4, r4, #4 */ 
/*0x0f54*/      bl call_1874
/*0x0f58*/      mov r0, fp
/*0x0f5a*/      str.w fp, [r6, #0x28]
/*0x0f5e*/      str.w r8, [r6, #0x24]
/*0x0f62*/      mov r1, sb
/*0x0f64*/      mov r2, sl
/*0x0f66*/      cbz r7, jump_f6c
/*0x0f68*/      str r1, [r2, #0x24]
/*0x0f6a*/      b jump_f6e
            jump_f6c:
/*0x0f6c*/      str r1, [r2, #0x28]
            jump_f6e:
/*0x0f6e*/      str r0, [r6, #0x24]
/*0x0f70*/      b jump_f32
            jump_f72:
/*0x0f72*/      str.w sb, [sl, #0x24]
/*0x0f76*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

/*0x0f7a*/  .byte 0x00
/*0x0f7b*/  .byte 0x00

            data_f7c:
/*0x0f7c*/  .word 0x200000ec
            data_f80:
/*0x0f80*/  .word 0x20000010
            data_f84:
/*0x0f84*/  .word 0x400b4000
            data_f88:
/*0x0f88*/  .word 0x400b0000


            .thumb_func
            call_f8c:
/*0x0f8c*/      ldr r0, [pc, #0x50] /* data_fe0 */
/*0x0f8e*/      movs r1, #1
/*0x0f90*/      str.w r1, [r0, #0x300]
/*0x0f94*/      ldr r2, [pc, #0x4c] /* data_fe4 */
/*0x0f96*/      str.w r1, [r2, #0xa8]
            jump_f9a:
/*0x0f9a*/      ldr.w r3, [r2, #0x108]
/*0x0f9e*/      cmp r3, #0
/*0x0fa0*/      beq jump_f9a
/*0x0fa2*/      movs r3, #0
/*0x0fa4*/      str r3, [r2, #0x20]
/*0x0fa6*/      mov.w r3, #0x9000000
/*0x0faa*/      str r3, [r0, #0x18]
/*0x0fac*/      str.w r1, [r2, #0xa4]
            jump_fb0:
/*0x0fb0*/      ldr.w r3, [r2, #0x104]
/*0x0fb4*/      cmp r3, #0
/*0x0fb6*/      beq jump_fb0
/*0x0fb8*/      ldr r2, [pc, #0x2c] /* data_fe8 */
/*0x0fba*/      ldr.w r3, [r2, #0x200]
/*0x0fbe*/      bic r3, r3, #7
/*0x0fc2*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x0fc4*/      str.w r3, [r2, #0x200]
/*0x0fc8*/      str r1, [r0, #0x20]
/*0x0fca*/      ldr r2, [r0, #4]
/*0x0fcc*/      bic r2, r2, #3
/*0x0fd0*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x0fd2*/      str r2, [r0, #4]
            jump_fd4:
/*0x0fd4*/      ldr r2, [r0, #0x34]
/*0x0fd6*/      cmp.w r1, r2, lsr #30
/*0x0fda*/      bne jump_fd4
/*0x0fdc*/      bx lr

/*0x0fde*/  .byte 0x00
/*0x0fdf*/  .byte 0x00

            data_fe0:
/*0x0fe0*/  .word 0x40088000
            data_fe4:
/*0x0fe4*/  .word 0x43100000
            data_fe8:
/*0x0fe8*/  .word 0x40080000


            .thumb_func
            call_fec:
/*0x0fec*/      ldr r0, [pc, #0x10] /* data_1000 */
/*0x0fee*/      movs r1, #0
/*0x0ff0*/      add.w r2, r0, #8
/*0x0ff4*/      str r1, [r0, #0x1c]
/*0x0ff6*/      str r1, [r0, #0x20]
/*0x0ff8*/      strb r1, [r2, #1]
/*0x0ffa*/      str.w r1, [r0, #0x15]
/*0x0ffe*/      bx lr

            data_1000:
/*0x1000*/  .word 0x2000001c


            .thumb_func
            call_1004:
/*0x1004*/      ldr r0, [pc, #0x18] /* data_1020 */
/*0x1006*/      push {lr}
/*0x1008*/      ldr r1, [pc, #0x14] /* data_1020 */
/*0x100a*/      movs r3, #1
/*0x100c*/      strb r3, [r0]
/*0x100e*/      adds r1, #0xc
/*0x1010*/      movs r0, #2
/*0x1012*/      strb r0, [r1]
/*0x1014*/      bl call_fec
/*0x1018*/      ldr r0, [pc, #4] /* data_1020 */
/*0x101a*/      subs r0, #8
/*0x101c*/      strb r3, [r0, #4]
/*0x101e*/      pop {pc}

            data_1020:
/*0x1020*/  .word 0x20000024


            .thumb_func
            call_1024:
/*0x1024*/      ldrb.w r0, [r0, #0x34]
/*0x1028*/      ubfx r0, r0, #1, #1
/*0x102c*/      bx lr

/*0x102e*/  .byte 0x00
/*0x102f*/  .byte 0x00

            jump_1030:
/*0x1030*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1034*/      mov r4, r0
/*0x1036*/      bl call_1474
/*0x103a*/      mov r5, r0
/*0x103c*/      ldr r6, [pc, #0x158] /* data_1198 */
/*0x103e*/      lsls r0, r0, #0x1e
/*0x1040*/      bpl jump_104e
/*0x1042*/      ldr r0, [r6, #4]
/*0x1044*/      cbz r0, jump_1048
/*0x1046*/      blx r0
            jump_1048:
/*0x1048*/      movs r0, #2
/*0x104a*/      bl call_11d0
            jump_104e:
/*0x104e*/      lsls r0, r5, #0x1b
/*0x1050*/      bpl jump_1072
/*0x1052*/      movs r0, #0x10
/*0x1054*/      bl call_11d0
/*0x1058*/      ldrb.w r0, [r4, #0x32]
/*0x105c*/      cmp r0, #2
/*0x105e*/      blo jump_1072
/*0x1060*/      bl call_1484
/*0x1064*/      ldrb.w r0, [r4, #0x32]
/*0x1068*/      strb.w r0, [r4, #0x33]
/*0x106c*/      movs r0, #3
/*0x106e*/      strb.w r0, [r4, #0x32]
            jump_1072:
/*0x1072*/      lsls r0, r5, #0x1d
/*0x1074*/      mov.w r7, #0
/*0x1078*/      bpl jump_10be
/*0x107a*/      subs r0, r7, #1
/*0x107c*/      str r0, [r4, #0x20]
/*0x107e*/      strb.w r7, [r4, #0x30]
/*0x1082*/      strb.w r7, [r4, #0x31]
/*0x1086*/      ldrb.w r0, [r4, #0x34]
/*0x108a*/      bic r0, r0, #2
/*0x108e*/      strb.w r0, [r4, #0x34]
/*0x1092*/      movs r0, #4
/*0x1094*/      strb.w r0, [r4, #0x32]
/*0x1098*/      str r7, [r4, #0x38]
/*0x109a*/      bl call_1280
/*0x109e*/      bl call_1494
/*0x10a2*/      ldr r1, [pc, #0xf8] /* data_119c */
/*0x10a4*/      movs r0, #0
/*0x10a6*/      bl call_133c
/*0x10aa*/      ldr r0, [pc, #0xf0] /* data_119c */
/*0x10ac*/      ldr r0, [r0]
/*0x10ae*/      bl call_1444
/*0x10b2*/      ldr r0, [r6]
/*0x10b4*/      cbz r0, jump_10b8
/*0x10b6*/      blx r0
            jump_10b8:
/*0x10b8*/      movs r0, #4
/*0x10ba*/      bl call_11d0
            jump_10be:
/*0x10be*/      lsls r0, r5, #0x1c
/*0x10c0*/      bpl jump_10d4
/*0x10c2*/      bl call_1494
/*0x10c6*/      ldrb.w r0, [r4, #0x33]
/*0x10ca*/      strb.w r0, [r4, #0x32]
/*0x10ce*/      movs r0, #8
/*0x10d0*/      bl call_11d0
            jump_10d4:
/*0x10d4*/      lsls r0, r5, #0x17
/*0x10d6*/      mov.w r8, #0x100
/*0x10da*/      bpl jump_1158
/*0x10dc*/      movs r0, #0
/*0x10de*/      bl call_131c
/*0x10e2*/      mov r5, r0
/*0x10e4*/      lsls r0, r0, #0x16
/*0x10e6*/      bpl jump_10fe
/*0x10e8*/      mov r0, r4
/*0x10ea*/      bl call_15b4
/*0x10ee*/      mov r0, r4
/*0x10f0*/      bl call_1b40
/*0x10f4*/      mov.w r1, #0x200
/*0x10f8*/      movs r0, #0
/*0x10fa*/      bl call_12ac
            jump_10fe:
/*0x10fe*/      lsls r0, r5, #0x1e
/*0x1100*/      bpl jump_1140
/*0x1102*/      movs r1, #2
/*0x1104*/      movs r0, #0
/*0x1106*/      bl call_12ac
/*0x110a*/      ldr r0, [r4, #0x20]
/*0x110c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x110e*/      beq jump_1140
/*0x1110*/      ldrb.w r0, [r4, #0x24]
/*0x1114*/      cmp r0, #2
/*0x1116*/      bne jump_1140
/*0x1118*/      movs r2, #0x40
/*0x111a*/      movs r0, #0
/*0x111c*/      ldr r1, [r4, #0x1c]
/*0x111e*/      bl call_139c
/*0x1122*/      ldr r1, [r4, #0x1c]
/*0x1124*/      add r1, r0
/*0x1126*/      str r1, [r4, #0x1c]
/*0x1128*/      ldr r1, [r4, #0x20]
/*0x112a*/      subs r0, r1, r0
/*0x112c*/      str r0, [r4, #0x20]
/*0x112e*/      bne jump_1140
/*0x1130*/      movs r0, #1
/*0x1132*/      strb.w r0, [r4, #0x24]
/*0x1136*/      ldr r1, [r4, #0x28]
/*0x1138*/      cbz r1, jump_1140
/*0x113a*/      ldr r0, [r4, #0x2c]
/*0x113c*/      blx r1
/*0x113e*/      str r7, [r4, #0x28]
            jump_1140:
/*0x1140*/      lsls r0, r5, #0x1b
/*0x1142*/      bpl jump_1152
/*0x1144*/      mov r0, r4
/*0x1146*/      bl call_1afc
/*0x114a*/      movs r1, #0x10
/*0x114c*/      movs r0, #0
/*0x114e*/      bl call_12ac
            jump_1152:
/*0x1152*/      mov r0, r8
/*0x1154*/      bl call_11d0
            jump_1158:
/*0x1158*/      mov r4, r8
            jump_115a:
/*0x115a*/      bl call_1474
/*0x115e*/      bl call_1454
/*0x1162*/      mov r5, r0
/*0x1164*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1166*/      beq jump_1192
/*0x1168*/      mov r0, r5
/*0x116a*/      bl call_131c
/*0x116e*/      tst.w r0, #0x12
/*0x1172*/      beq jump_115a
/*0x1174*/      movs r1, #0x12
/*0x1176*/      mov r0, r5
/*0x1178*/      bl call_12ac
/*0x117c*/      lsl.w r0, r4, r5
/*0x1180*/      bl call_11d0
/*0x1184*/      ldr r0, [r6, #0x18]
/*0x1186*/      cmp r0, #0
/*0x1188*/      beq jump_115a
/*0x118a*/      mov r1, r0
/*0x118c*/      mov r0, r5
/*0x118e*/      blx r1
/*0x1190*/      b jump_115a
            jump_1192:
/*0x1192*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x1196*/  .byte 0x00
/*0x1197*/  .byte 0x00

            data_1198:
/*0x1198*/  .word 0x00002214 /* possible pointer */
            data_119c:
/*0x119c*/  .word 0x20000040


            .thumb_func
            call_11a0:
/*0x11a0*/      movs r1, #2
/*0x11a2*/      strb.w r1, [r0, #0x32]
/*0x11a6*/      ldr r0, [pc, #4] /* data_11ac */
/*0x11a8*/      b.w jump_110

            data_11ac:
/*0x11ac*/  .word 0x20000040


            .thumb_func
            call_11b0:
/*0x11b0*/      ldrb.w r0, [r0, #0x32]
/*0x11b4*/      cmp r0, #3
/*0x11b6*/      beq jump_11bc
/*0x11b8*/      movs r0, #0
/*0x11ba*/      bx lr
            jump_11bc:
/*0x11bc*/      movs r0, #1
/*0x11be*/      bx lr

            .thumb_func
            call_11c0:
/*0x11c0*/      push {r4, lr}
/*0x11c2*/      bl call_1494
/*0x11c6*/      pop.w {r4, lr}
/*0x11ca*/      b.w jump_15c4

/*0x11ce*/  .byte 0x00
/*0x11cf*/  .byte 0x00


            .thumb_func
            call_11d0:
/*0x11d0*/      ldr r1, [pc, #4] /* data_11d8 */
/*0x11d2*/      str r0, [r1, #8]
/*0x11d4*/      bx lr

/*0x11d6*/  .byte 0x00
/*0x11d7*/  .byte 0x00

            data_11d8:
/*0x11d8*/  .word 0x400a8000


            .thumb_func
            call_11dc:
/*0x11dc*/      push {r4, lr}
/*0x11de*/      movs r1, #0
/*0x11e0*/      mov.w r0, #0x400
/*0x11e4*/      movs r2, #0x40
/*0x11e6*/      movs r3, #1
/*0x11e8*/      bl ckcu_clocks_enable
/*0x11ec*/      movs r0, #2
/*0x11ee*/      bl ckcu_set_usb_prescaler
/*0x11f2*/      ldr r4, [pc, #0x48] /* data_123c */
/*0x11f4*/      ldr r0, [pc, #0x40] /* data_1238 */
/*0x11f6*/      str r0, [r4, #8]
/*0x11f8*/      subs r0, #0x5c
/*0x11fa*/      str r0, [r4, #0xc]
/*0x11fc*/      subs r0, #0xd4
/*0x11fe*/      str r0, [r4, #0x10]
/*0x1200*/      movs r0, #2
/*0x1202*/      str r0, [r4, #0x14]
/*0x1204*/      bl call_1004
/*0x1208*/      mov r0, r4
/*0x120a*/      bl call_11a0
/*0x120e*/      ldr r1, [pc, #0x30] /* data_1240 */
/*0x1210*/      mov.w r0, #0x200000
/*0x1214*/      str.w r0, [r1, #0x100]
/*0x1218*/      movs r0, #1
/*0x121a*/      bl call_1264
/*0x121e*/      movs r0, #0xfa
/*0x1220*/      bl call_102
/*0x1224*/      ldrb.w r0, [r4, #0x34]
/*0x1228*/      pop.w {r4, lr}
/*0x122c*/      and r1, r0, #1
/*0x1230*/      ldr r0, [pc, #0x10] /* data_1244 */
/*0x1232*/      b.w jump_14a4

/*0x1236*/  .byte 0x00
/*0x1237*/  .byte 0x00

            data_1238:
/*0x1238*/  .word 0x000021e4 /* possible pointer */
            data_123c:
/*0x123c*/  .word 0x20000304
            data_1240:
/*0x1240*/  .word 0xe000e004
            data_1244:
/*0x1244*/  .word 0x20000040


            .thumb_func
            call_1248:
/*0x1248*/      ldr r1, [pc, #0x14] /* data_1260 */
/*0x124a*/      cmp r0, #1
/*0x124c*/      ldr r0, [r1]
/*0x124e*/      beq jump_1258
/*0x1250*/      bic r0, r0, #0x800
            jump_1254:
/*0x1254*/      str r0, [r1]
/*0x1256*/      bx lr
            jump_1258:
/*0x1258*/      orr r0, r0, #0x800
/*0x125c*/      b jump_1254

/*0x125e*/  .byte 0x00
/*0x125f*/  .byte 0x00

            data_1260:
/*0x1260*/  .word 0x400a8000


            .thumb_func
            call_1264:
/*0x1264*/      ldr r1, [pc, #0x14] /* data_127c */
/*0x1266*/      cmp r0, #1
/*0x1268*/      ldr r0, [r1]
/*0x126a*/      beq jump_1274
/*0x126c*/      bic r0, r0, #0x400
            jump_1270:
/*0x1270*/      str r0, [r1]
/*0x1272*/      bx lr
            jump_1274:
/*0x1274*/      orr r0, r0, #0x400
/*0x1278*/      b jump_1270

/*0x127a*/  .byte 0x00
/*0x127b*/  .byte 0x00

            data_127c:
/*0x127c*/  .word 0x400a8000


            .thumb_func
            call_1280:
/*0x1280*/      movs r1, #0
/*0x1282*/      movs r0, #0x20
/*0x1284*/      movs r3, #1
/*0x1286*/      mov r2, r1
/*0x1288*/      b.w jump_aa0

            .thumb_func
            call_128c:
/*0x128c*/      push {r4, lr}
/*0x128e*/      bl call_1d64
/*0x1292*/      ldr r1, [r0]
/*0x1294*/      and r1, r1, #9
/*0x1298*/      str r1, [r0]
/*0x129a*/      pop {r4, pc}

            .thumb_func
            call_129c:
/*0x129c*/      push {r4, lr}
/*0x129e*/      bl call_1d64
/*0x12a2*/      ldr r1, [r0]
/*0x12a4*/      and r1, r1, #0x24
/*0x12a8*/      str r1, [r0]
/*0x12aa*/      pop {r4, pc}

            .thumb_func
            call_12ac:
/*0x12ac*/      push {r4, lr}
/*0x12ae*/      mov r4, r1
/*0x12b0*/      bl call_1d64
/*0x12b4*/      str r4, [r0, #8]
/*0x12b6*/      pop {r4, pc}

            .thumb_func
            call_12b8:
/*0x12b8*/      push {r4, lr}
/*0x12ba*/      bl call_1d64
/*0x12be*/      ldr r0, [r0, #0x10]
/*0x12c0*/      ldr r1, [pc, #8] /* data_12cc */
/*0x12c2*/      ubfx r0, r0, #0, #0xa
/*0x12c6*/      add r0, r1
/*0x12c8*/      pop {r4, pc}

/*0x12ca*/  .byte 0x00
/*0x12cb*/  .byte 0x00

            data_12cc:
/*0x12cc*/  .word 0x400aa000


            .thumb_func
            call_12d0:
/*0x12d0*/      push {r4, r5, r6, lr}
/*0x12d2*/      mov r5, r0
/*0x12d4*/      bl call_1d64
/*0x12d8*/      mov r4, r0
/*0x12da*/      mov r0, r5
/*0x12dc*/      bl call_12f4
/*0x12e0*/      ldr r1, [r4, #0x10]
/*0x12e2*/      ubfx r1, r1, #0, #0xa
/*0x12e6*/      add r0, r1
/*0x12e8*/      ldr r1, [pc, #4] /* data_12f0 */
/*0x12ea*/      add r0, r1
/*0x12ec*/      pop {r4, r5, r6, pc}

/*0x12ee*/  .byte 0x00
/*0x12ef*/  .byte 0x00

            data_12f0:
/*0x12f0*/  .word 0x400aa000


            .thumb_func
            call_12f4:
/*0x12f4*/      push {r4, lr}
/*0x12f6*/      bl call_1d64
/*0x12fa*/      ldr r0, [r0, #0x10]
/*0x12fc*/      ubfx r0, r0, #0xa, #0xa
/*0x1300*/      pop {r4, pc}

            .thumb_func
            call_1302:
/*0x1302*/      push {r4, lr}
/*0x1304*/      bl call_1d64
/*0x1308*/      ldr r1, [r0, #0x10]
/*0x130a*/      ldr r0, [r0]
/*0x130c*/      lsls r1, r1, #3
/*0x130e*/      bpl jump_1316
/*0x1310*/      ubfx r0, r0, #2, #1
/*0x1314*/      pop {r4, pc}
            jump_1316:
/*0x1316*/      ubfx r0, r0, #5, #1
/*0x131a*/      pop {r4, pc}

            .thumb_func
            call_131c:
/*0x131c*/      push {r4, lr}
/*0x131e*/      bl call_1d64
/*0x1322*/      ldr r1, [r0, #4]
/*0x1324*/      ldr r0, [r0, #8]
/*0x1326*/      ands r0, r1
/*0x1328*/      pop {r4, pc}

            .thumb_func
            call_132a:
/*0x132a*/      push {r4, lr}
/*0x132c*/      mov r4, r1
/*0x132e*/      bl call_1d64
/*0x1332*/      ldr r0, [r0, #0xc]
/*0x1334*/      lsrs r0, r4
/*0x1336*/      ubfx r0, r0, #0, #9
/*0x133a*/      pop {r4, pc}

            .thumb_func
            call_133c:
/*0x133c*/      push {r4, r5, r6, lr}
/*0x133e*/      mov r4, r1
/*0x1340*/      mov r5, r0
/*0x1342*/      bl call_1d64
/*0x1346*/      add.w r1, r4, r5, lsl #3
/*0x134a*/      ldr r2, [r1, #4]
/*0x134c*/      str r2, [r0, #0x10]
/*0x134e*/      ldr r1, [r1, #8]
/*0x1350*/      str r1, [r0, #4]
/*0x1352*/      mov.w r1, #-1
/*0x1356*/      str r1, [r0, #8]
/*0x1358*/      mov r0, r5
/*0x135a*/      pop.w {r4, r5, r6, lr}
/*0x135e*/      b.w jump_13cc

            .thumb_func
            call_1362:
/*0x1362*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1366*/      mov r6, r2
/*0x1368*/      mov r7, r1
/*0x136a*/      movs r5, r0
/*0x136c*/      beq jump_1392
/*0x136e*/      movs r1, #0
            jump_1370:
/*0x1370*/      bl call_132a
/*0x1374*/      mov r4, r0
/*0x1376*/      cmp r0, r6
/*0x1378*/      bhi jump_138c
/*0x137a*/      mov r0, r5
/*0x137c*/      cbz r5, jump_1396
/*0x137e*/      bl call_12b8
            jump_1382:
/*0x1382*/      adds r1, r4, #3
/*0x1384*/      lsrs r2, r1, #2
/*0x1386*/      mov r1, r7
/*0x1388*/      bl call_1d54
            jump_138c:
/*0x138c*/      mov r0, r4
/*0x138e*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_1392:
/*0x1392*/      movs r1, #0x10
/*0x1394*/      b jump_1370
            jump_1396:
/*0x1396*/      bl call_12d0
/*0x139a*/      b jump_1382

            .thumb_func
            call_139c:
/*0x139c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x13a0*/      mov r5, r2
/*0x13a2*/      mov r6, r1
/*0x13a4*/      mov r7, r0
/*0x13a6*/      bl call_1d64
/*0x13aa*/      mov r4, r0
/*0x13ac*/      movs r0, #0
/*0x13ae*/      cbz r5, jump_13c0
/*0x13b0*/      mov r2, r5
/*0x13b2*/      mov r1, r6
/*0x13b4*/      mov r0, r7
/*0x13b6*/      bl call_1362
/*0x13ba*/      cbnz r0, jump_13c0
/*0x13bc*/      cmp r5, #0
/*0x13be*/      bne jump_13c8
            jump_13c0:
/*0x13c0*/      ldr r1, [r4]
/*0x13c2*/      and r1, r1, #0x10
/*0x13c6*/      str r1, [r4]
            jump_13c8:
/*0x13c8*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_13cc:
/*0x13cc*/      push {r4, lr}
/*0x13ce*/      bl call_1d64
/*0x13d2*/      ldr r1, [r0]
/*0x13d4*/      and r1, r1, #0x19
/*0x13d8*/      str r1, [r0]
/*0x13da*/      pop {r4, pc}
            jump_13dc:
/*0x13dc*/      push {r4, lr}
/*0x13de*/      bl call_1d64
/*0x13e2*/      movs r1, #4
/*0x13e4*/      str r1, [r0]
/*0x13e6*/      pop {r4, pc}

            .thumb_func
            call_13e8:
/*0x13e8*/      push {r4, lr}
/*0x13ea*/      bl call_1d64
/*0x13ee*/      movs r1, #0x40
/*0x13f0*/      str r1, [r0, #8]
/*0x13f2*/      ldr r2, [r0]
/*0x13f4*/      movs r1, #0x24
/*0x13f6*/      bics r1, r2
/*0x13f8*/      str r1, [r0]
/*0x13fa*/      pop {r4, pc}

            .thumb_func
            call_13fc:
/*0x13fc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1400*/      mov r4, r2
/*0x1402*/      mov r8, r1
/*0x1404*/      mov r7, r0
/*0x1406*/      bl call_12f4
/*0x140a*/      mov r6, r0
/*0x140c*/      mov r0, r7
/*0x140e*/      bl call_1d64
/*0x1412*/      mov r5, r0
/*0x1414*/      movs r1, #0
/*0x1416*/      mov r0, r7
/*0x1418*/      bl call_132a
/*0x141c*/      cmp r4, r6
/*0x141e*/      bhi jump_1422
/*0x1420*/      cbz r0, jump_1428
            jump_1422:
/*0x1422*/      movs r0, #0
            jump_1424:
/*0x1424*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_1428:
/*0x1428*/      mov r0, r7
/*0x142a*/      bl call_12b8
/*0x142e*/      mov r1, r0
/*0x1430*/      adds r0, r4, #3
/*0x1432*/      lsrs r2, r0, #2
/*0x1434*/      mov r0, r8
/*0x1436*/      bl call_1d54
/*0x143a*/      str r4, [r5, #0xc]
/*0x143c*/      movs r0, #2
/*0x143e*/      str r0, [r5]
/*0x1440*/      mov r0, r4
/*0x1442*/      b jump_1424

            .thumb_func
            call_1444:
/*0x1444*/      ldr r1, [pc, #8] /* data_1450 */
/*0x1446*/      ldr r2, [r1, #4]
/*0x1448*/      orrs r2, r0
/*0x144a*/      str r2, [r1, #4]
/*0x144c*/      bx lr

/*0x144e*/  .byte 0x00
/*0x144f*/  .byte 0x00

            data_1450:
/*0x1450*/  .word 0x400a8000


            .thumb_func
            call_1454:
/*0x1454*/      mov r3, r0
/*0x1456*/      movs r1, #7
            jump_1458:
/*0x1458*/      add.w r2, r1, #8
/*0x145c*/      lsr.w r0, r3, r2
/*0x1460*/      lsls r2, r0, #0x1f
/*0x1462*/      beq jump_1468
/*0x1464*/      sxtb r0, r1
/*0x1466*/      bx lr
            jump_1468:
/*0x1468*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x146a*/      cmp r1, #0
/*0x146c*/      bgt jump_1458
/*0x146e*/      mov.w r0, #-1
/*0x1472*/      bx lr

            .thumb_func
            call_1474:
/*0x1474*/      ldr r0, [pc, #8] /* data_1480 */
/*0x1476*/      ldr r1, [r0, #4]
/*0x1478*/      ldr r0, [r0, #8]
/*0x147a*/      ands r0, r1
/*0x147c*/      bx lr

/*0x147e*/  .byte 0x00
/*0x147f*/  .byte 0x00

            data_1480:
/*0x1480*/  .word 0x400a8000


            .thumb_func
            call_1484:
/*0x1484*/      ldr r0, [pc, #8] /* data_1490 */
/*0x1486*/      ldr r1, [r0]
/*0x1488*/      orr r1, r1, #0xc
/*0x148c*/      str r1, [r0]
/*0x148e*/      bx lr

            data_1490:
/*0x1490*/  .word 0x400a8000


            .thumb_func
            call_1494:
/*0x1494*/      ldr r0, [pc, #8] /* data_14a0 */
/*0x1496*/      ldr r1, [r0]
/*0x1498*/      and r1, r1, #0x400
/*0x149c*/      str r1, [r0]
/*0x149e*/      bx lr

            data_14a0:
/*0x14a0*/  .word 0x400a8000

            jump_14a4:
/*0x14a4*/      push {r4, lr}
/*0x14a6*/      mov r4, r0
/*0x14a8*/      ldr r0, [pc, #0x68] /* data_1514 */
/*0x14aa*/      ldr r2, [r0]
/*0x14ac*/      cmp r2, #1
/*0x14ae*/      bne jump_1510
/*0x14b0*/      movs r2, #0
/*0x14b2*/      str r2, [r0]
/*0x14b4*/      ldr r0, [pc, #0x60] /* data_1518 */
/*0x14b6*/      ldr r2, [r0]
/*0x14b8*/      lsls r3, r2, #0x19
/*0x14ba*/      mov.w r2, #-1
/*0x14be*/      bpl jump_14da
/*0x14c0*/      movw r3, #0x40c
/*0x14c4*/      str r3, [r0]
/*0x14c6*/      str r2, [r0, #8]
/*0x14c8*/      cbnz r1, jump_14d0
/*0x14ca*/      movs r0, #0
/*0x14cc*/      bl call_708
            jump_14d0:
/*0x14d0*/      ldr r0, [r4]
/*0x14d2*/      pop.w {r4, lr}
/*0x14d6*/      b.w call_1444
            jump_14da:
/*0x14da*/      movw r3, #0xc0c
/*0x14de*/      str r3, [r0]
/*0x14e0*/      str r2, [r0, #8]
/*0x14e2*/      cbnz r1, jump_14ea
/*0x14e4*/      movs r0, #0
/*0x14e6*/      bl call_708
            jump_14ea:
/*0x14ea*/      movs r0, #0
/*0x14ec*/      bl call_1248
/*0x14f0*/      ldr r0, [r4]
/*0x14f2*/      bl call_1444
/*0x14f6*/      movs r0, #0
/*0x14f8*/      bl call_1264
/*0x14fc*/      movs r1, #0xc8
/*0x14fe*/      movs r0, #0
            jump_1500:
/*0x1500*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1502*/      cmp r0, r1
/*0x1504*/      blo jump_1500
/*0x1506*/      pop.w {r4, lr}
/*0x150a*/      movs r0, #1
/*0x150c*/      b.w call_1264
            jump_1510:
/*0x1510*/      pop {r4, pc}

/*0x1512*/  .byte 0x00
/*0x1513*/  .byte 0x00

            data_1514:
/*0x1514*/  .word 0x20000000
            data_1518:
/*0x1518*/  .word 0x400a8000

            jump_151c:
/*0x151c*/      movw r1, #0x111d
/*0x1520*/      str r1, [r0]
/*0x1522*/      ldr r1, [pc, #0x28] /* data_154c */
/*0x1524*/      str r1, [r0, #4]
/*0x1526*/      movw r1, #0x212
/*0x152a*/      str r1, [r0, #8]
/*0x152c*/      ldr r1, [pc, #0x20] /* data_1550 */
/*0x152e*/      str r1, [r0, #0xc]
/*0x1530*/      ldr r2, [pc, #0x20] /* data_1554 */
/*0x1532*/      movs r1, #0x10
/*0x1534*/      strd r1, r2, [r0, #0x10]
/*0x1538*/      str r1, [r0, #0x18]
/*0x153a*/      ldr r1, [pc, #0x1c] /* data_1558 */
/*0x153c*/      str r1, [r0, #0x1c]
/*0x153e*/      movs r1, #0
/*0x1540*/      str r1, [r0, #0x20]
/*0x1542*/      ldr r1, [pc, #0x18] /* data_155c */
/*0x1544*/      str r1, [r0, #0x24]
/*0x1546*/      movs r1, #2
/*0x1548*/      str r1, [r0, #0x28]
/*0x154a*/      bx lr

            data_154c:
/*0x154c*/  .word 0x80010008
            data_1550:
/*0x1550*/  .word 0x91002088
            data_1554:
/*0x1554*/  .word 0x92010090
            data_1558:
/*0x1558*/  .word 0x930100d0
            data_155c:
/*0x155c*/  .word 0x84010110


            .thumb_func
            get_event:
/*0x1560*/      push {r4, lr}
/*0x1562*/      ldr r4, [pc, #0x48] /* data_15ac */
/*0x1564*/      ldrb.w r0, [r4, #0x32]
/*0x1568*/      cmp r0, #3
/*0x156a*/      bne jump_1570
/*0x156c*/      bl call_1d74
            jump_1570:
/*0x1570*/      ldr r1, [pc, #0x3c] /* data_15b0 */
/*0x1572*/      ldrb r0, [r1, #4]
/*0x1574*/      cbz r0, jump_1596
/*0x1576*/      cmp r0, #1
/*0x1578*/      beq jump_158e
/*0x157a*/      cmp r0, #2
/*0x157c*/      bne jump_159e
/*0x157e*/      ldrb.w r0, [r4, #0x32]
/*0x1582*/      cmp r0, #6
/*0x1584*/      bne jump_158a
/*0x1586*/      bl call_18bc
            jump_158a:
/*0x158a*/      movs r0, #2
/*0x158c*/      pop {r4, pc}
            jump_158e:
/*0x158e*/      movs r0, #0
/*0x1590*/      strb r0, [r1, #4]
/*0x1592*/      movs r0, #3
/*0x1594*/      pop {r4, pc}
            jump_1596:
/*0x1596*/      ldrb.w r0, [r4, #0x32]
/*0x159a*/      cmp r0, #6
/*0x159c*/      beq jump_15a2
            jump_159e:
/*0x159e*/      movs r0, #0
/*0x15a0*/      pop {r4, pc}
            jump_15a2:
/*0x15a2*/      movs r0, #2
/*0x15a4*/      strb r0, [r1, #4]
/*0x15a6*/      movs r0, #1
/*0x15a8*/      pop {r4, pc}

/*0x15aa*/  .byte 0x00
/*0x15ab*/  .byte 0x00

            data_15ac:
/*0x15ac*/  .word 0x20000304
            data_15b0:
/*0x15b0*/  .word 0x2000001c


            .thumb_func
            call_15b4:
/*0x15b4*/      ldr r1, [pc, #8] /* data_15c0 */
/*0x15b6*/      ldr r2, [r1]
/*0x15b8*/      str r2, [r0]
/*0x15ba*/      ldr r1, [r1, #4]
/*0x15bc*/      str r1, [r0, #4]
/*0x15be*/      bx lr

            data_15c0:
/*0x15c0*/  .word 0x400aa000

            jump_15c4:
/*0x15c4*/      ldr r0, [pc, #8] /* data_15d0 */
/*0x15c6*/      ldr r1, [r0]
/*0x15c8*/      orr r1, r1, #0x20
/*0x15cc*/      str r1, [r0]
/*0x15ce*/      bx lr

            data_15d0:
/*0x15d0*/  .word 0x400a8000


            .thumb_func
            call_15d4:
/*0x15d4*/      ldr r1, [pc, #0xc] /* data_15e4 */
/*0x15d6*/      ldr r2, [r1]
/*0x15d8*/      orr r2, r2, #0x100
/*0x15dc*/      str r2, [r1]
/*0x15de*/      str r0, [r1, #0x10]
/*0x15e0*/      bx lr

/*0x15e2*/  .byte 0x00
/*0x15e3*/  .byte 0x00

            data_15e4:
/*0x15e4*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x15e8*/      ldr r0, [pc, #4] /* data_15f0 */
/*0x15ea*/      b.w jump_1030

/*0x15ee*/  .byte 0x00
/*0x15ef*/  .byte 0x00

            data_15f0:
/*0x15f0*/  .word 0x20000304


            .thumb_func
            call_15f4:
/*0x15f4*/      ldr r0, [pc, #0x14] /* data_160c */
/*0x15f6*/      ldr r1, [r0, #0x30]
/*0x15f8*/      orr r1, r1, #0x10
/*0x15fc*/      str r1, [r0, #0x30]
/*0x15fe*/      ldr r0, [pc, #0x10] /* data_1610 */
/*0x1600*/      movw r1, #0x5fff
/*0x1604*/      str r1, [r0, #8]
/*0x1606*/      ldr r1, [pc, #0xc] /* data_1614 */
/*0x1608*/      str r1, [r0, #4]
/*0x160a*/      bx lr

            data_160c:
/*0x160c*/  .word 0x40088000
            data_1610:
/*0x1610*/  .word 0x40068000
            data_1614:
/*0x1614*/  .word 0x0001afff


            .thumb_func
            call_1618:
/*0x1618*/      ldr r1, [pc, #8] /* data_1624 */
/*0x161a*/      ldr r0, [pc, #4] /* data_1620 */
/*0x161c*/      str r0, [r1]
/*0x161e*/      bx lr

            data_1620:
/*0x1620*/  .word 0x5fa00001
            data_1624:
/*0x1624*/  .word 0x40068000


            .thumb_func
            generate:
/*0x1628*/      push {r4, r5, r6, lr}
/*0x162a*/      movs r1, #0
            jump_162c:
/*0x162c*/      strb r1, [r0], #1
/*0x1630*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1632*/      cmp r1, #0xff
/*0x1634*/      bls jump_162c
/*0x1636*/      movs r3, #0
/*0x1638*/      ldr r5, [pc, #0x28] /* data_1664 */
/*0x163a*/      mov r2, r3
/*0x163c*/      mov r1, r3
/*0x163e*/      sub.w r0, r0, #0x100
            jump_1642:
/*0x1642*/      ldrb r6, [r5, r2]
/*0x1644*/      ldrb r4, [r0, r1]
/*0x1646*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1648*/      add r3, r4
/*0x164a*/      add r3, r6
/*0x164c*/      uxtb r3, r3
/*0x164e*/      uxtb r2, r2
/*0x1650*/      ldrb r6, [r0, r3]
/*0x1652*/      strb r6, [r0, r1]
/*0x1654*/      strb r4, [r0, r3]
/*0x1656*/      cmp r2, #8
/*0x1658*/      blo jump_165c
/*0x165a*/      movs r2, #0
            jump_165c:
/*0x165c*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x165e*/      cmp r1, #0xff
/*0x1660*/      bls jump_1642
/*0x1662*/      pop {r4, r5, r6, pc}

            data_1664:
/*0x1664*/  .word 0x00001f44 /* possible pointer */


            .thumb_func
            firmware_check:
/*0x1668*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x166c*/      mov r6, r0
/*0x166e*/      movw r0, #0x3bf8
/*0x1672*/      sub sp, #0x104
/*0x1674*/      ldr r0, [r0]
/*0x1676*/      mov sb, r2
/*0x1678*/      mov r5, r1
/*0x167a*/      cmp.w r0, #0x3040000
/*0x167e*/      bne jump_168a
/*0x1680*/      movw r0, #0x3bfc
/*0x1684*/      ldrb r0, [r0]
/*0x1686*/      cmp r0, #1
/*0x1688*/      beq jump_1692
            jump_168a:
/*0x168a*/      movs r0, #0
            jump_168c:
/*0x168c*/      add sp, #0x104
/*0x168e*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_1692:
/*0x1692*/      ldr.w sl, [pc, #0xa0] /* data_1734 */
/*0x1696*/      mov.w r8, #0
/*0x169a*/      movw fp, #0x3bff
/*0x169e*/      cmp.w sb, #0
/*0x16a2*/      beq jump_171e
/*0x16a4*/      movs r1, #0
/*0x16a6*/      mov.w r0, #0x2000
/*0x16aa*/      movs r3, #1
/*0x16ac*/      mov r2, r1
/*0x16ae*/      bl ckcu_clocks_enable
/*0x16b2*/      mov.w r1, #-1
/*0x16b6*/      str.w r1, [sl, #4]
/*0x16ba*/      movs r1, #0xe6
/*0x16bc*/      str.w r1, [sl]
/*0x16c0*/      b jump_171e
            jump_16c2:
/*0x16c2*/      ldrb.w r0, [fp]
/*0x16c6*/      cmp r0, r5
/*0x16c8*/      bls jump_16cc
/*0x16ca*/      mov r0, r5
            jump_16cc:
/*0x16cc*/      uxtb r4, r0
/*0x16ce*/      subs r5, r5, r4
/*0x16d0*/      mov r0, sp
/*0x16d2*/      bl generate
/*0x16d6*/      movs r1, #0
/*0x16d8*/      mov r0, r1
/*0x16da*/      b jump_1718
            jump_16dc:
/*0x16dc*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x16de*/      uxtb r1, r1
/*0x16e0*/      ldrb.w r2, [sp, r1]
/*0x16e4*/      add r0, r2
/*0x16e6*/      uxtb r0, r0
/*0x16e8*/      ldrb.w ip, [sp, r0]
/*0x16ec*/      strb.w ip, [sp, r1]
/*0x16f0*/      strb.w r2, [sp, r0]
/*0x16f4*/      add r2, ip
/*0x16f6*/      uxtb r2, r2
/*0x16f8*/      ldrb r7, [r6]
/*0x16fa*/      ldrb.w r2, [sp, r2]
/*0x16fe*/      eors r7, r2
/*0x1700*/      cmp.w sb, #0
/*0x1704*/      beq jump_170c
/*0x1706*/      strb.w r7, [sl, #0xc]
/*0x170a*/      b jump_1716
            jump_170c:
/*0x170c*/      subs r2, r1, #1
/*0x170e*/      lsls r2, r2, #0x1e
/*0x1710*/      lsrs r2, r2, #0x1b
/*0x1712*/      lsls r7, r2
/*0x1714*/      add r8, r7
            jump_1716:
/*0x1716*/      .short 0x1c76 /* adds r6, r6, #1 */ 
            jump_1718:
/*0x1718*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x171a*/      uxtb r4, r4
/*0x171c*/      bhs jump_16dc
            jump_171e:
/*0x171e*/      cmp r5, #0
/*0x1720*/      bne jump_16c2
/*0x1722*/      cmp.w sb, #0
/*0x1726*/      beq jump_172e
/*0x1728*/      ldr.w r0, [sl, #8]
/*0x172c*/      b jump_168c
            jump_172e:
/*0x172e*/      mov r0, r8
/*0x1730*/      b jump_168c

/*0x1732*/  .byte 0x00
/*0x1733*/  .byte 0x00

            data_1734:
/*0x1734*/  .word 0x4008a000


            .thumb_func
            call_1738:
/*0x1738*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x173c*/      ldr r4, [pc, #0xa0] /* data_17e0 */
/*0x173e*/      ldr r5, [pc, #0xa4] /* data_17e4 */
/*0x1740*/      ldr.w r8, [pc, #0xa4] /* data_17e8 */
/*0x1744*/      ldr r7, [pc, #0xa4] /* data_17ec */
/*0x1746*/      movs r6, #0xa
            jump_1748:
/*0x1748*/      ldrd r0, r1, [r5]
/*0x174c*/      str r1, [r0, #0x28]
/*0x174e*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x1750*/      uxtb r6, r6
/*0x1752*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x1754*/      nop 
/*0x1756*/      nop 
/*0x1758*/      movs r0, #0xff
/*0x175a*/      ldr r1, [r7, #0x1c]
/*0x175c*/      lsls r1, r1, #0x16
/*0x175e*/      bmi jump_1762
/*0x1760*/      movs r0, #0xfe
            jump_1762:
/*0x1762*/      ldr.w r2, [r8, #0x1c]
/*0x1766*/      mov r1, r8
/*0x1768*/      lsls r2, r2, #0x1a
/*0x176a*/      bmi jump_1770
/*0x176c*/      bic r0, r0, #2
            jump_1770:
/*0x1770*/      ldr r2, [r1, #0x1c]
/*0x1772*/      lsls r2, r2, #0x19
/*0x1774*/      bmi jump_177a
/*0x1776*/      bic r0, r0, #4
            jump_177a:
/*0x177a*/      ldr r1, [r1, #0x1c]
/*0x177c*/      lsls r1, r1, #0x18
/*0x177e*/      bmi jump_1784
/*0x1780*/      bic r0, r0, #8
            jump_1784:
/*0x1784*/      ldr r1, [r7, #0x1c]
/*0x1786*/      lsls r1, r1, #0x14
/*0x1788*/      bmi jump_178e
/*0x178a*/      bic r0, r0, #0x10
            jump_178e:
/*0x178e*/      ldr r1, [r7, #0x1c]
/*0x1790*/      lsls r1, r1, #0x12
/*0x1792*/      bmi jump_1798
/*0x1794*/      bic r0, r0, #0x20
            jump_1798:
/*0x1798*/      ldr r1, [r7, #0x1c]
/*0x179a*/      lsls r1, r1, #0x11
/*0x179c*/      bmi jump_17a2
/*0x179e*/      bic r0, r0, #0x40
            jump_17a2:
/*0x17a2*/      ldr r1, [r7, #0x1c]
/*0x17a4*/      lsls r1, r1, #0x10
/*0x17a6*/      bmi jump_17ac
/*0x17a8*/      bic r0, r0, #0x80
            jump_17ac:
/*0x17ac*/      ldrd r1, r2, [r5]
/*0x17b0*/      str r2, [r1, #0x24]
/*0x17b2*/      ldrb r1, [r4, #1]
/*0x17b4*/      cmp r1, r0
/*0x17b6*/      beq jump_17be
/*0x17b8*/      strb r0, [r4, #1]
/*0x17ba*/      movs r0, #3
/*0x17bc*/      b jump_17ca
            jump_17be:
/*0x17be*/      ldrb r0, [r4]
/*0x17c0*/      cbz r0, jump_17cc
/*0x17c2*/      cmp r0, #1
/*0x17c4*/      bne jump_17c8
/*0x17c6*/      strb r1, [r4, #2]
            jump_17c8:
/*0x17c8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_17ca:
/*0x17ca*/      strb r0, [r4]
            jump_17cc:
/*0x17cc*/      cmp r6, #0
/*0x17ce*/      beq jump_17da
/*0x17d0*/      movs r0, #5
/*0x17d2*/      bl call_102
/*0x17d6*/      subs r5, #8
/*0x17d8*/      b jump_1748
            jump_17da:
/*0x17da*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x17de*/  .byte 0x00
/*0x17df*/  .byte 0x00

            data_17e0:
/*0x17e0*/  .word 0x200000ec
            data_17e4:
/*0x17e4*/  .word 0x0000206c /* possible pointer */
            data_17e8:
/*0x17e8*/  .word 0x400b0000
            data_17ec:
/*0x17ec*/  .word 0x400b4000

            jump_17f0:
/*0x17f0*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x17f2*/      ldr r0, [pc, #0x44] /* data_1838 */
/*0x17f4*/      ldr r0, [r0]
/*0x17f6*/      ldr r1, [pc, #0x44] /* data_183c */
/*0x17f8*/      ldr r6, [pc, #0x44] /* data_1840 */
/*0x17fa*/      udiv r4, r0, r1
/*0x17fe*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x1800*/      strh.w r4, [sp]
/*0x1804*/      movs r5, #0
/*0x1806*/      strh.w r5, [sp, #2]
/*0x180a*/      mov r1, sp
/*0x180c*/      mov r0, r6
/*0x180e*/      bl call_4b0
/*0x1812*/      strb.w r5, [sp]
/*0x1816*/      movs r0, #7
/*0x1818*/      strh.w r0, [sp, #2]
/*0x181c*/      movs r0, #1
/*0x181e*/      strb.w r0, [sp, #4]
/*0x1822*/      strb.w r5, [sp, #5]
/*0x1826*/      lsrs r0, r4, #1
/*0x1828*/      strh.w r0, [sp, #6]
/*0x182c*/      mov r1, sp
/*0x182e*/      mov r0, r6
/*0x1830*/      bl call_458
/*0x1834*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x1836*/  .byte 0x00
/*0x1837*/  .byte 0x00

            data_1838:
/*0x1838*/  .word 0x20000018
            data_183c:
/*0x183c*/  .word 0x00dbba00
            data_1840:
/*0x1840*/  .word 0x4006f000


            .thumb_func
            call_1844:
/*0x1844*/      push {r4, lr}
/*0x1846*/      ldr r1, [pc, #0x28] /* data_1870 */
/*0x1848*/      mov.w r4, #0x8000
/*0x184c*/      str r4, [r1, #0x28]
/*0x184e*/      nop 
/*0x1850*/      nop 
/*0x1852*/      str r4, [r1, #0x24]
/*0x1854*/      mov.w r2, #0x4000
/*0x1858*/      b jump_1864
            jump_185a:
/*0x185a*/      str r2, [r1, #0x28]
/*0x185c*/      nop 
/*0x185e*/      nop 
/*0x1860*/      str r2, [r1, #0x24]
/*0x1862*/      nop 
            jump_1864:
/*0x1864*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x1866*/      uxtb r0, r0
/*0x1868*/      bhs jump_185a
/*0x186a*/      str r4, [r1, #0x28]
/*0x186c*/      pop {r4, pc}

/*0x186e*/  .byte 0x00
/*0x186f*/  .byte 0x00

            data_1870:
/*0x1870*/  .word 0x400b0000


            .thumb_func
            call_1874:
/*0x1874*/      push {r4, r5, r6, r7, lr}
/*0x1876*/      movs r2, #4
/*0x1878*/      ldr r3, [pc, #0x24] /* data_18a0 */
/*0x187a*/      lsls r4, r2, #0xc
/*0x187c*/      ldr r5, [pc, #0x24] /* data_18a4 */
/*0x187e*/      movw r6, #0xffff
/*0x1882*/      b jump_1898
            jump_1884:
/*0x1884*/      nop 
/*0x1886*/      str r4, [r5, #0x28]
/*0x1888*/      lsls r7, r0, #0x10
/*0x188a*/      bpl jump_1890
/*0x188c*/      str r2, [r3, #0x24]
/*0x188e*/      b jump_1892
            jump_1890:
/*0x1890*/      str r2, [r3, #0x28]
            jump_1892:
/*0x1892*/      str r4, [r5, #0x24]
/*0x1894*/      and.w r0, r6, r0, lsl #1
            jump_1898:
/*0x1898*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x189a*/      uxtb r1, r1
/*0x189c*/      bhs jump_1884
/*0x189e*/      pop {r4, r5, r6, r7, pc}

            data_18a0:
/*0x18a0*/  .word 0x400b4000
            data_18a4:
/*0x18a4*/  .word 0x400b0000


            .thumb_func
            loc_18a8:
/*0x18a8*/      movs r1, #1
/*0x18aa*/      lsls r1, r0
/*0x18ac*/      ldr r0, [pc, #8] /* data_18b8 */
/*0x18ae*/      ldrb r2, [r0, #5]
/*0x18b0*/      orrs r1, r2
/*0x18b2*/      strb r1, [r0, #5]
/*0x18b4*/      bx lr

/*0x18b6*/  .byte 0x00
/*0x18b7*/  .byte 0x00

            data_18b8:
/*0x18b8*/  .word 0x2000001c


            .thumb_func
            call_18bc:
/*0x18bc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x18c0*/      ldr r0, [pc, #0xcc] /* data_1990 */
/*0x18c2*/      ldrb r1, [r0]
/*0x18c4*/      movs r4, #0
/*0x18c6*/      sub.w r5, r0, #0xa
/*0x18ca*/      cmp r1, #1
/*0x18cc*/      bne jump_18da
/*0x18ce*/      strb r4, [r0]
/*0x18d0*/      ldrb r0, [r5, #0x10]
/*0x18d2*/      and r0, r0, #7
/*0x18d6*/      bl call_3f2
            jump_18da:
/*0x18da*/      ldr r6, [pc, #0xb8] /* data_1994 */
/*0x18dc*/      ldr r7, [pc, #0xb8] /* data_1998 */
/*0x18de*/      ldrb r0, [r6]
/*0x18e0*/      cbz r0, jump_18ee
/*0x18e2*/      cmp r0, #2
/*0x18e4*/      beq jump_1918
/*0x18e6*/      cmp r0, #4
/*0x18e8*/      beq jump_18ee
/*0x18ea*/      cmp r0, #5
/*0x18ec*/      bne jump_192a
            jump_18ee:
/*0x18ee*/      ldrb r0, [r5, #5]
/*0x18f0*/      lsls r0, r0, #0x1b
/*0x18f2*/      bpl jump_192a
/*0x18f4*/      movs r0, #1
/*0x18f6*/      strb r0, [r6]
/*0x18f8*/      movs r2, #0x40
/*0x18fa*/      ldr r1, [pc, #0xa0] /* data_199c */
/*0x18fc*/      movs r0, #4
/*0x18fe*/      bl call_139c
/*0x1902*/      ldr r2, [pc, #0x98] /* data_199c */
/*0x1904*/      rsb.w r1, r0, #0x40
/*0x1908*/      add r0, r2
/*0x190a*/      bl mem_zero
/*0x190e*/      ldrb r0, [r5, #5]
/*0x1910*/      bic r0, r0, #0x10
/*0x1914*/      strb r0, [r5, #5]
/*0x1916*/      b jump_192a
            jump_1918:
/*0x1918*/      ldr r0, [r7, #0x50]
/*0x191a*/      lsls r0, r0, #0x1e
/*0x191c*/      bpl jump_192a
/*0x191e*/      movs r2, #0x40
/*0x1920*/      ldr r1, [pc, #0x78] /* data_199c */
/*0x1922*/      movs r0, #3
/*0x1924*/      bl call_13fc
/*0x1928*/      strb r4, [r6]
            jump_192a:
/*0x192a*/      ldr r0, [r7, #0x28]
/*0x192c*/      lsls r0, r0, #0x1e
/*0x192e*/      bpl jump_1960
/*0x1930*/      ldrb r0, [r5]
/*0x1932*/      cbz r0, jump_1938
/*0x1934*/      strb r4, [r5]
/*0x1936*/      b jump_1954
            jump_1938:
/*0x1938*/      ldr r1, [pc, #0x64] /* data_19a0 */
/*0x193a*/      ldr r0, [r1]
/*0x193c*/      cbnz r0, jump_1960
/*0x193e*/      add.w r0, r1, #0xc
/*0x1942*/      ldr r0, [r0]
/*0x1944*/      cbz r0, jump_1960
/*0x1946*/      mov.w r2, #0xfa0
/*0x194a*/      muls r0, r2, r0
/*0x194c*/      asrs r2, r2, #3
/*0x194e*/      udiv r0, r0, r2
/*0x1952*/      str r0, [r1]
            jump_1954:
/*0x1954*/      ldr r1, [pc, #0x38] /* data_1990 */
/*0x1956*/      movs r2, #8
/*0x1958*/      adds r1, #0x12
/*0x195a*/      movs r0, #1
/*0x195c*/      bl call_13fc
            jump_1960:
/*0x1960*/      ldr r0, [r7, #0x3c]
/*0x1962*/      lsls r0, r0, #0x1e
/*0x1964*/      bpl jump_198c
/*0x1966*/      ldrb r0, [r5, #2]
/*0x1968*/      cbz r0, jump_1974
/*0x196a*/      ldr r1, [pc, #0x24] /* data_1990 */
/*0x196c*/      movs r2, #5
/*0x196e*/      strb r4, [r5, #2]
/*0x1970*/      adds r1, #0xa
/*0x1972*/      b jump_1982
            jump_1974:
/*0x1974*/      ldrb r0, [r5, #1]
/*0x1976*/      cmp r0, #0
/*0x1978*/      beq jump_198c
/*0x197a*/      ldr r1, [pc, #0x14] /* data_1990 */
/*0x197c*/      movs r2, #2
/*0x197e*/      strb r4, [r5, #1]
/*0x1980*/      .short 0x1e89 /* subs r1, r1, #2 */ 
            jump_1982:
/*0x1982*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x1986*/      movs r0, #2
/*0x1988*/      b.w call_13fc
            jump_198c:
/*0x198c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_1990:
/*0x1990*/  .word 0x20000026
            data_1994:
/*0x1994*/  .word 0x20000004
            data_1998:
/*0x1998*/  .word 0x400a8000
            data_199c:
/*0x199c*/  .word 0x20000084
            data_19a0:
/*0x19a0*/  .word 0x200002ec


            .thumb_func
            loc_19a4:
/*0x19a4*/      push {r4, r5, r6, r7, lr}
/*0x19a6*/      ldrh r1, [r0]
/*0x19a8*/      mov.w r6, #0x100
/*0x19ac*/      movw r5, #0x921
/*0x19b0*/      lsls r7, r6, #1
/*0x19b2*/      movs r2, #1
/*0x19b4*/      ldr r4, [pc, #0xc8] /* data_1a80 */
/*0x19b6*/      subw r3, r1, #0x921
/*0x19ba*/      cmp r1, r5
/*0x19bc*/      beq jump_1a2e
/*0x19be*/      bgt jump_19dc
/*0x19c0*/      adds.w r1, r3, #0x780
/*0x19c4*/      beq jump_19ee
/*0x19c6*/      cmp r1, r6
/*0x19c8*/      beq jump_1a22
/*0x19ca*/      cmp r1, r7
/*0x19cc*/      bne jump_1a50
/*0x19ce*/      ldrh r1, [r0, #4]
/*0x19d0*/      cmp r1, #0
/*0x19d2*/      bne jump_1a50
/*0x19d4*/      ldr r1, [pc, #0xac] /* data_1a84 */
/*0x19d6*/      strd r1, r2, [r0, #0x1c]
/*0x19da*/      b jump_1a7a
            jump_19dc:
/*0x19dc*/      movs r5, #0
/*0x19de*/      cmp r3, r6
/*0x19e0*/      beq jump_1a54
/*0x19e2*/      cmp r3, r7
/*0x19e4*/      bne jump_1a50
/*0x19e6*/      ldrh r3, [r0, #4]
/*0x19e8*/      ldrb r1, [r0, #2]
/*0x19ea*/      cbz r3, jump_1a52
/*0x19ec*/      b jump_1a78
            jump_19ee:
/*0x19ee*/      ldrb r5, [r0, #3]
/*0x19f0*/      ldrb r3, [r0, #2]
/*0x19f2*/      ldrh r4, [r0, #6]
/*0x19f4*/      ldrh r1, [r0, #4]
/*0x19f6*/      cmp r5, #1
/*0x19f8*/      bne jump_1a50
/*0x19fa*/      cbz r1, jump_1a12
/*0x19fc*/      cmp r1, #1
/*0x19fe*/      beq jump_1a50
/*0x1a00*/      cmp r1, #2
/*0x1a02*/      bne jump_1a50
/*0x1a04*/      cmp r3, #1
/*0x1a06*/      beq jump_1a18
/*0x1a08*/      cmp r3, #2
/*0x1a0a*/      bne jump_1a50
/*0x1a0c*/      ldr r1, [pc, #0x74] /* data_1a84 */
/*0x1a0e*/      adds r1, #0x11
/*0x1a10*/      b jump_1a1c
            jump_1a12:
/*0x1a12*/      ldr r1, [pc, #0x70] /* data_1a84 */
/*0x1a14*/      adds r1, #0x19
/*0x1a16*/      b jump_1a1c
            jump_1a18:
/*0x1a18*/      ldr r1, [pc, #0x68] /* data_1a84 */
/*0x1a1a*/      .short 0x1d49 /* adds r1, r1, #5 */ 
            jump_1a1c:
/*0x1a1c*/      strd r1, r4, [r0, #0x1c]
/*0x1a20*/      b jump_1a7a
            jump_1a22:
/*0x1a22*/      ldrh r1, [r0, #4]
/*0x1a24*/      cmp r1, #0
/*0x1a26*/      bne jump_1a50
/*0x1a28*/      strd r4, r2, [r0, #0x1c]
/*0x1a2c*/      b jump_1a7a
            jump_1a2e:
/*0x1a2e*/      ldrb r2, [r0, #3]
/*0x1a30*/      ldrh r3, [r0, #6]
/*0x1a32*/      ldrh r1, [r0, #4]
/*0x1a34*/      str r3, [r0, #0x20]
/*0x1a36*/      cmp r2, #2
/*0x1a38*/      bne jump_1a50
/*0x1a3a*/      cmp r1, #0
/*0x1a3c*/      bne jump_1a50
/*0x1a3e*/      ldr r2, [pc, #0x44] /* data_1a84 */
/*0x1a40*/      adds r2, #0xd
/*0x1a42*/      str r2, [r0, #0x1c]
/*0x1a44*/      ldr r2, [pc, #0x40] /* data_1a88 */
/*0x1a46*/      strd r2, r1, [r0, #0x28]
/*0x1a4a*/      movs r1, #2
/*0x1a4c*/      strb.w r1, [r0, #0x24]
            jump_1a50:
/*0x1a50*/      pop {r4, r5, r6, r7, pc}
            jump_1a52:
/*0x1a52*/      b jump_1a72
            jump_1a54:
/*0x1a54*/      ldrh r3, [r0, #4]
/*0x1a56*/      ldrb r1, [r0, #3]
/*0x1a58*/      cmp r3, #0
/*0x1a5a*/      bne jump_1a50
/*0x1a5c*/      mov.w r3, #0xfa0
/*0x1a60*/      str r1, [r4]
/*0x1a62*/      muls r1, r3, r1
/*0x1a64*/      asrs r3, r3, #3
/*0x1a66*/      udiv r1, r1, r3
/*0x1a6a*/      ldr r3, [pc, #0x14] /* data_1a80 */
/*0x1a6c*/      subs r3, #0xc
/*0x1a6e*/      str r1, [r3]
/*0x1a70*/      b jump_1a78
            jump_1a72:
/*0x1a72*/      ldr r3, [pc, #0x10] /* data_1a84 */
/*0x1a74*/      .short 0x1edb /* subs r3, r3, #3 */ 
/*0x1a76*/      strb r1, [r3, #3]
            jump_1a78:
/*0x1a78*/      str r5, [r0, #0x20]
            jump_1a7a:
/*0x1a7a*/      strb.w r2, [r0, #0x24]
/*0x1a7e*/      b jump_1a50

            data_1a80:
/*0x1a80*/  .word 0x200002f8
            data_1a84:
/*0x1a84*/  .word 0x2000001f
            data_1a88:
/*0x1a88*/  .word 0x00001a8d /* possible pointer */


            .thumb_func
            loc_1a8c:
/*0x1a8c*/      ldr r2, [pc, #4] /* data_1a94 */
/*0x1a8e*/      movs r1, #1
/*0x1a90*/      strb r1, [r2, r0]
/*0x1a92*/      bx lr

            data_1a94:
/*0x1a94*/  .word 0x20000026


            .thumb_func
            loc_1a98:
/*0x1a98*/      ldrb r2, [r0, #3]
/*0x1a9a*/      ldrh r1, [r0, #4]
/*0x1a9c*/      movs r3, #1
/*0x1a9e*/      cmp r2, #0x21
/*0x1aa0*/      beq jump_1ab2
/*0x1aa2*/      cmp r2, #0x22
/*0x1aa4*/      bne jump_1aea
/*0x1aa6*/      cbz r1, jump_1ad4
/*0x1aa8*/      cmp r1, #1
/*0x1aaa*/      beq jump_1adc
/*0x1aac*/      cmp r1, #2
/*0x1aae*/      bne jump_1ae6
/*0x1ab0*/      b jump_1aec
            jump_1ab2:
/*0x1ab2*/      cbz r1, jump_1abe
/*0x1ab4*/      cmp r1, #1
/*0x1ab6*/      beq jump_1ac4
/*0x1ab8*/      cmp r1, #2
/*0x1aba*/      bne jump_1aca
/*0x1abc*/      b jump_1ace
            jump_1abe:
/*0x1abe*/      ldr r1, [r0, #0xc]
/*0x1ac0*/      adds r1, #9
/*0x1ac2*/      b jump_1ac8
            jump_1ac4:
/*0x1ac4*/      ldr r1, [r0, #0xc]
/*0x1ac6*/      adds r1, #0x22
            jump_1ac8:
/*0x1ac8*/      str r1, [r0, #0x1c]
            jump_1aca:
/*0x1aca*/      movs r1, #9
/*0x1acc*/      b jump_1ae4
            jump_1ace:
/*0x1ace*/      ldr r1, [r0, #0xc]
/*0x1ad0*/      adds r1, #0x42
/*0x1ad2*/      b jump_1ac8
            jump_1ad4:
/*0x1ad4*/      ldr r1, [pc, #0x20] /* data_1af8 */
/*0x1ad6*/      str r1, [r0, #0x1c]
/*0x1ad8*/      movs r1, #0x40
/*0x1ada*/      b jump_1ae4
            jump_1adc:
/*0x1adc*/      ldr r1, [pc, #0x18] /* data_1af8 */
/*0x1ade*/      subs r1, #0x8c
/*0x1ae0*/      str r1, [r0, #0x1c]
/*0x1ae2*/      movs r1, #0x22
            jump_1ae4:
/*0x1ae4*/      str r1, [r0, #0x20]
            jump_1ae6:
/*0x1ae6*/      strb.w r3, [r0, #0x24]
            jump_1aea:
/*0x1aea*/      bx lr
            jump_1aec:
/*0x1aec*/      ldr r1, [pc, #8] /* data_1af8 */
/*0x1aee*/      subs r1, #0x68
/*0x1af0*/      str r1, [r0, #0x1c]
/*0x1af2*/      movs r1, #0x65
/*0x1af4*/      b jump_1ae4

/*0x1af6*/  .byte 0x00
/*0x1af7*/  .byte 0x00

            data_1af8:
/*0x1af8*/  .word 0x00002148 /* possible pointer */


            .thumb_func
            call_1afc:
/*0x1afc*/      push {r4, r5, r6, lr}
/*0x1afe*/      mov r4, r0
/*0x1b00*/      movs r0, #0
/*0x1b02*/      bl call_12f4
/*0x1b06*/      mov r5, r0
/*0x1b08*/      ldr r0, [r4, #0x20]
/*0x1b0a*/      adds r1, r0, #1
/*0x1b0c*/      beq jump_1b3c
/*0x1b0e*/      ldrb.w r1, [r4, #0x24]
/*0x1b12*/      cmp r1, #1
/*0x1b14*/      bne jump_1b3c
/*0x1b16*/      cmp r0, r5
/*0x1b18*/      blo jump_1b20
/*0x1b1a*/      subs r0, r0, r5
/*0x1b1c*/      str r0, [r4, #0x20]
/*0x1b1e*/      b jump_1b2c
            jump_1b20:
/*0x1b20*/      mov r5, r0
/*0x1b22*/      movs r0, #0
/*0x1b24*/      str r0, [r4, #0x20]
/*0x1b26*/      movs r0, #2
/*0x1b28*/      strb.w r0, [r4, #0x24]
            jump_1b2c:
/*0x1b2c*/      mov r2, r5
/*0x1b2e*/      movs r0, #0
/*0x1b30*/      ldr r1, [r4, #0x1c]
/*0x1b32*/      bl call_13fc
/*0x1b36*/      ldr r0, [r4, #0x1c]
/*0x1b38*/      add r0, r5
/*0x1b3a*/      str r0, [r4, #0x1c]
            jump_1b3c:
/*0x1b3c*/      pop {r4, r5, r6, pc}

/*0x1b3e*/  .byte 0x00
/*0x1b3f*/  .byte 0x00


            .thumb_func
            call_1b40:
/*0x1b40*/      push {r4, lr}
/*0x1b42*/      mov r4, r0
/*0x1b44*/      movs r0, #0
/*0x1b46*/      strb.w r0, [r4, #0x24]
/*0x1b4a*/      str r0, [r4, #0x20]
/*0x1b4c*/      ldrb r0, [r4]
/*0x1b4e*/      ands r0, r0, #0x60
/*0x1b52*/      beq jump_1b5a
/*0x1b54*/      cmp r0, #0x20
/*0x1b56*/      bne jump_1b6c
/*0x1b58*/      b jump_1b62
            jump_1b5a:
/*0x1b5a*/      mov r0, r4
/*0x1b5c*/      bl call_1be0
/*0x1b60*/      b jump_1b6c
            jump_1b62:
/*0x1b62*/      ldr r0, [pc, #0x40] /* data_1ba4 */
/*0x1b64*/      ldr r1, [r0, #0x14]
/*0x1b66*/      cbz r1, jump_1b6c
/*0x1b68*/      mov r0, r4
/*0x1b6a*/      blx r1
            jump_1b6c:
/*0x1b6c*/      ldrb.w r0, [r4, #0x24]
/*0x1b70*/      cmp r0, #1
/*0x1b72*/      beq jump_1b82
/*0x1b74*/      cmp r0, #2
/*0x1b76*/      beq jump_1b96
/*0x1b78*/      pop.w {r4, lr}
/*0x1b7c*/      movs r0, #0
/*0x1b7e*/      b.w jump_13dc
            jump_1b82:
/*0x1b82*/      ldrh r0, [r4, #6]
/*0x1b84*/      ldr r1, [r4, #0x20]
/*0x1b86*/      cmp r1, r0
/*0x1b88*/      ble jump_1b8c
/*0x1b8a*/      str r0, [r4, #0x20]
            jump_1b8c:
/*0x1b8c*/      mov r0, r4
/*0x1b8e*/      pop.w {r4, lr}
/*0x1b92*/      b.w call_1afc
            jump_1b96:
/*0x1b96*/      movs r2, #0
/*0x1b98*/      pop.w {r4, lr}
/*0x1b9c*/      mov r1, r2
/*0x1b9e*/      mov r0, r2
/*0x1ba0*/      b.w call_13fc

            data_1ba4:
/*0x1ba4*/  .word 0x00002214 /* possible pointer */

            jump_1ba8:
/*0x1ba8*/      push {r4, lr}
/*0x1baa*/      mov r4, r0
/*0x1bac*/      movs r0, #0
/*0x1bae*/      strb r0, [r4, #0x19]
/*0x1bb0*/      cbz r1, jump_1bc6
/*0x1bb2*/      cmp r1, #1
/*0x1bb4*/      beq jump_1bca
/*0x1bb6*/      cmp r1, #2
/*0x1bb8*/      bne jump_1bdc
/*0x1bba*/      ldrb r0, [r4, #4]
/*0x1bbc*/      and r0, r0, #0xf
/*0x1bc0*/      bl call_1302
/*0x1bc4*/      b jump_1bca
            jump_1bc6:
/*0x1bc6*/      ldrb.w r0, [r4, #0x34]
            jump_1bca:
/*0x1bca*/      strb r0, [r4, #0x18]
/*0x1bcc*/      add.w r0, r4, #0x18
/*0x1bd0*/      str r0, [r4, #0x1c]
/*0x1bd2*/      movs r0, #2
/*0x1bd4*/      str r0, [r4, #0x20]
/*0x1bd6*/      movs r0, #1
/*0x1bd8*/      strb.w r0, [r4, #0x24]
            jump_1bdc:
/*0x1bdc*/      pop {r4, pc}

/*0x1bde*/  .byte 0x00
/*0x1bdf*/  .byte 0x00


            .thumb_func
            call_1be0:
/*0x1be0*/      push {r4, r5, r6, lr}
/*0x1be2*/      mov r4, r0
/*0x1be4*/      ldrh r0, [r0]
/*0x1be6*/      movs r5, #1
/*0x1be8*/      cmp.w r0, #0x500
/*0x1bec*/      beq jump_1c8e
/*0x1bee*/      bgt jump_1c32
/*0x1bf0*/      cmp.w r0, #0x100
/*0x1bf4*/      beq jump_1c80
/*0x1bf6*/      bgt jump_1c10
/*0x1bf8*/      cmp r0, #0x80
/*0x1bfa*/      beq jump_1c78
/*0x1bfc*/      cmp r0, #0x81
/*0x1bfe*/      beq jump_1c7c
/*0x1c00*/      cmp r0, #0x82
/*0x1c02*/      bne jump_1cd2
/*0x1c04*/      movs r1, #2
            jump_1c06:
/*0x1c06*/      mov r0, r4
/*0x1c08*/      pop.w {r4, r5, r6, lr}
/*0x1c0c*/      b.w jump_1ba8
            jump_1c10:
/*0x1c10*/      cmp.w r0, #0x102
/*0x1c14*/      beq jump_1c84
/*0x1c16*/      cmp.w r0, #0x300
/*0x1c1a*/      beq jump_1c88
/*0x1c1c*/      sub.w r0, r0, #0x300
/*0x1c20*/      subs r0, #2
/*0x1c22*/      bne jump_1cd2
/*0x1c24*/      movs r2, #1
            jump_1c26:
/*0x1c26*/      movs r1, #2
            jump_1c28:
/*0x1c28*/      mov r0, r4
/*0x1c2a*/      pop.w {r4, r5, r6, lr}
/*0x1c2e*/      b.w jump_1d08
            jump_1c32:
/*0x1c32*/      ldr r1, [pc, #0xcc] /* data_1d00 */
/*0x1c34*/      cmp.w r0, #0x900
/*0x1c38*/      beq jump_1cd8
/*0x1c3a*/      bgt jump_1c5c
/*0x1c3c*/      cmp.w r0, #0x680
/*0x1c40*/      beq jump_1c9c
/*0x1c42*/      sub.w r0, r0, #0x600
/*0x1c46*/      subs r0, #0x81
/*0x1c48*/      beq jump_1cd4
/*0x1c4a*/      sub.w r0, r0, #0x100
/*0x1c4e*/      subs r0, #0xff
/*0x1c50*/      bne jump_1cd2
/*0x1c52*/      add.w r0, r4, #0x30
/*0x1c56*/      strd r0, r5, [r4, #0x1c]
/*0x1c5a*/      b jump_1cce
            jump_1c5c:
/*0x1c5c*/      sub.w r0, r0, #0xa00
/*0x1c60*/      subs r0, #0x81
/*0x1c62*/      beq jump_1cfa
/*0x1c64*/      cmp r0, #0x80
/*0x1c66*/      bne jump_1cd2
/*0x1c68*/      ldr r0, [r1, #0xc]
            jump_1c6a:
/*0x1c6a*/      cmp r0, #0
/*0x1c6c*/      beq jump_1cd2
/*0x1c6e*/      mov r1, r0
/*0x1c70*/      mov r0, r4
/*0x1c72*/      pop.w {r4, r5, r6, lr}
/*0x1c76*/      bx r1
            jump_1c78:
/*0x1c78*/      movs r1, #0
/*0x1c7a*/      b jump_1c06
            jump_1c7c:
/*0x1c7c*/      movs r1, #1
/*0x1c7e*/      b jump_1c06
            jump_1c80:
/*0x1c80*/      movs r2, #0
/*0x1c82*/      b jump_1c8a
            jump_1c84:
/*0x1c84*/      movs r2, #0
/*0x1c86*/      b jump_1c26
            jump_1c88:
/*0x1c88*/      movs r2, #1
            jump_1c8a:
/*0x1c8a*/      movs r1, #0
/*0x1c8c*/      b jump_1c28
            jump_1c8e:
/*0x1c8e*/      ldrb r0, [r4, #2]
/*0x1c90*/      bl call_15d4
/*0x1c94*/      strb.w r5, [r4, #0x24]
/*0x1c98*/      movs r0, #5
/*0x1c9a*/      b jump_1cf4
            jump_1c9c:
/*0x1c9c*/      ldrb r0, [r4, #3]
/*0x1c9e*/      cmp r0, #1
/*0x1ca0*/      beq jump_1cc2
/*0x1ca2*/      cmp r0, #2
/*0x1ca4*/      beq jump_1cc6
/*0x1ca6*/      cmp r0, #3
/*0x1ca8*/      bne jump_1cd2
/*0x1caa*/      ldrb r0, [r4, #2]
/*0x1cac*/      ldr r1, [r4, #0x14]
/*0x1cae*/      cmp r1, r0
/*0x1cb0*/      bls jump_1cd2
/*0x1cb2*/      ldr r1, [r4, #0x10]
/*0x1cb4*/      ldr.w r0, [r1, r0, lsl #2]
/*0x1cb8*/      cmp r0, #0
/*0x1cba*/      beq jump_1cd2
            jump_1cbc:
/*0x1cbc*/      str r0, [r4, #0x1c]
/*0x1cbe*/      ldrb r0, [r0]
/*0x1cc0*/      b jump_1ccc
            jump_1cc2:
/*0x1cc2*/      ldr r0, [r4, #8]
/*0x1cc4*/      b jump_1cbc
            jump_1cc6:
/*0x1cc6*/      ldr r0, [r4, #0xc]
/*0x1cc8*/      str r0, [r4, #0x1c]
/*0x1cca*/      ldrh r0, [r0, #2]
            jump_1ccc:
/*0x1ccc*/      str r0, [r4, #0x20]
            jump_1cce:
/*0x1cce*/      strb.w r5, [r4, #0x24]
            jump_1cd2:
/*0x1cd2*/      pop {r4, r5, r6, pc}
            jump_1cd4:
/*0x1cd4*/      ldr r0, [r1, #8]
/*0x1cd6*/      b jump_1c6a
            jump_1cd8:
/*0x1cd8*/      ldrb r0, [r4, #2]
/*0x1cda*/      strb.w r0, [r4, #0x30]
/*0x1cde*/      strb.w r5, [r4, #0x24]
/*0x1ce2*/      movs r5, #1
            jump_1ce4:
/*0x1ce4*/      ldr r1, [pc, #0x1c] /* data_1d04 */
/*0x1ce6*/      sxtb r0, r5
/*0x1ce8*/      bl call_133c
/*0x1cec*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x1cee*/      cmp r5, #8
/*0x1cf0*/      blo jump_1ce4
/*0x1cf2*/      movs r0, #6
            jump_1cf4:
/*0x1cf4*/      strb.w r0, [r4, #0x32]
/*0x1cf8*/      pop {r4, r5, r6, pc}
            jump_1cfa:
/*0x1cfa*/      ldr r0, [r1, #0x10]
/*0x1cfc*/      b jump_1c6a

/*0x1cfe*/  .byte 0x00
/*0x1cff*/  .byte 0x00

            data_1d00:
/*0x1d00*/  .word 0x00002214 /* possible pointer */
            data_1d04:
/*0x1d04*/  .word 0x20000040

            jump_1d08:
/*0x1d08*/      push {r4, r5, r6, lr}
/*0x1d0a*/      mov r4, r0
/*0x1d0c*/      movs r6, #1
/*0x1d0e*/      cbz r1, jump_1d2a
/*0x1d10*/      cmp r1, #2
/*0x1d12*/      bne jump_1d28
/*0x1d14*/      ldrb r0, [r4, #4]
/*0x1d16*/      ands r5, r0, #0xf
/*0x1d1a*/      beq jump_1d24
/*0x1d1c*/      cbz r2, jump_1d40
/*0x1d1e*/      mov r0, r5
/*0x1d20*/      bl call_13e8
            jump_1d24:
/*0x1d24*/      strb.w r6, [r4, #0x24]
            jump_1d28:
/*0x1d28*/      pop {r4, r5, r6, pc}
            jump_1d2a:
/*0x1d2a*/      ldrb r0, [r4, #2]
/*0x1d2c*/      cmp r0, #1
/*0x1d2e*/      bne jump_1d28
/*0x1d30*/      ldrb r0, [r4, #0x34]!
/*0x1d34*/      bfi r0, r2, #1, #1
/*0x1d38*/      strb r0, [r4], #-0x10
/*0x1d3c*/      strb r6, [r4]
/*0x1d3e*/      pop {r4, r5, r6, pc}
            jump_1d40:
/*0x1d40*/      ldr r0, [r4, #0x38]
/*0x1d42*/      cmp r0, #0
/*0x1d44*/      bne jump_1d24
/*0x1d46*/      mov r0, r5
/*0x1d48*/      bl call_129c
/*0x1d4c*/      mov r0, r5
/*0x1d4e*/      bl call_128c
/*0x1d52*/      b jump_1d24

            .thumb_func
            call_1d54:
/*0x1d54*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1d56*/      bmi jump_1d62
/*0x1d58*/      ldr.w r3, [r0, r2, lsl #2]
/*0x1d5c*/      str.w r3, [r1, r2, lsl #2]
/*0x1d60*/      b call_1d54
            jump_1d62:
/*0x1d62*/      bx lr

            .thumb_func
            call_1d64:
/*0x1d64*/      ldr r1, [pc, #8] /* data_1d70 */
/*0x1d66*/      add.w r0, r0, r0, lsl #2
/*0x1d6a*/      add.w r0, r1, r0, lsl #2
/*0x1d6e*/      bx lr

            data_1d70:
/*0x1d70*/  .word 0x400a8014


            .thumb_func
            call_1d74:
/*0x1d74*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1d78*/      movs r7, #0
/*0x1d7a*/      mov.w r1, #0x8000
/*0x1d7e*/      mov r2, r7
/*0x1d80*/      mov sl, r1
/*0x1d82*/      movs r3, #1
/*0x1d84*/      mov r0, r2
/*0x1d86*/      bl ckcu_clocks_enable
/*0x1d8a*/      ldr r0, [pc, #0x90] /* data_1e1c */
/*0x1d8c*/      bl call_1024
/*0x1d90*/      ldr r5, [pc, #0x8c] /* data_1e20 */
/*0x1d92*/      mov r4, r0
/*0x1d94*/      movw r6, #0xeae0
/*0x1d98*/      cmp r0, #1
/*0x1d9a*/      bne jump_1daa
/*0x1d9c*/      ldr r0, [r5, #0x54]
/*0x1d9e*/      orrs r0, r6
/*0x1da0*/      str r0, [r5, #0x54]
/*0x1da2*/      str r6, [r5, #0x58]
/*0x1da4*/      ldr r0, [r5, #0x50]
/*0x1da6*/      orrs r0, r6
/*0x1da8*/      str r0, [r5, #0x50]
            jump_1daa:
/*0x1daa*/      ldr.w r8, [pc, #0x70] /* data_1e1c */
/*0x1dae*/      ldrb.w r0, [r8, #0x32]
/*0x1db2*/      cmp r0, #3
/*0x1db4*/      bne jump_1df4
/*0x1db6*/      ldr.w sb, [pc, #0x6c] /* data_1e24 */
/*0x1dba*/      ldr.w r0, [sb]
/*0x1dbe*/      tst.w r0, #0xc0
/*0x1dc2*/      beq jump_1df4
/*0x1dc4*/      movs r0, #1
/*0x1dc6*/      bl call_55c
/*0x1dca*/      ldr r1, [pc, #0x5c] /* data_1e28 */
/*0x1dcc*/      strb r7, [r1, #4]
/*0x1dce*/      ldrb.w r0, [r8, #0x32]
/*0x1dd2*/      cmp r0, #3
/*0x1dd4*/      bne jump_1df4
/*0x1dd6*/      ldr.w r0, [sb]
/*0x1dda*/      tst.w r0, #0xc0
/*0x1dde*/      beq jump_1df4
/*0x1de0*/      bl call_1618
/*0x1de4*/      mov.w r0, #0x3e8
/*0x1de8*/      bl call_102
/*0x1dec*/      str r6, [r5, #0x58]
/*0x1dee*/      movs r0, #0
/*0x1df0*/      bl call_708
            jump_1df4:
/*0x1df4*/      ldr r0, [r5, #0x58]
/*0x1df6*/      tst r0, r6
/*0x1df8*/      beq jump_1e0c
/*0x1dfa*/      cmp r4, #1
/*0x1dfc*/      bne jump_1e0c
/*0x1dfe*/      ldr r0, [pc, #0x1c] /* data_1e1c */
/*0x1e00*/      bl call_11b0
/*0x1e04*/      cmp r0, #1
/*0x1e06*/      bne jump_1e0c
/*0x1e08*/      bl call_11c0
            jump_1e0c:
/*0x1e0c*/      mov r2, r7
/*0x1e0e*/      mov r1, sl
/*0x1e10*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1e14*/      movs r3, #0
/*0x1e16*/      mov r0, r2
/*0x1e18*/      b.w ckcu_clocks_enable

            data_1e1c:
/*0x1e1c*/  .word 0x20000304
            data_1e20:
/*0x1e20*/  .word 0x40024000
            data_1e24:
/*0x1e24*/  .word 0x400a8000
            data_1e28:
/*0x1e28*/  .word 0x2000001c


            .thumb_func
            loc_1e2c:
/*0x1e2c*/      b jump_1e34
            jump_1e2e:
/*0x1e2e*/      ldm r0!, {r3}
/*0x1e30*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x1e32*/      stm r1!, {r3}
            jump_1e34:
/*0x1e34*/      cmp r2, #0
/*0x1e36*/      bne jump_1e2e
/*0x1e38*/      bx lr

            .thumb_func
            loc_1e3a:
/*0x1e3a*/      movs r0, #0
/*0x1e3c*/      b jump_1e42
            jump_1e3e:
/*0x1e3e*/      stm r1!, {r0}
/*0x1e40*/      .short 0x1f12 /* subs r2, r2, #4 */ 
            jump_1e42:
/*0x1e42*/      cmp r2, #0
/*0x1e44*/      bne jump_1e3e
/*0x1e46*/      bx lr

            .thumb_func
            check_fw_sp_pc:
/*0x1e48*/      mov.w r0, #0x3400
/*0x1e4c*/      ldr r1, [r0]
/*0x1e4e*/      sub.w r1, r1, #0x20000000
/*0x1e52*/      cmp.w r1, #0x4000
/*0x1e56*/      bhi jump_1ea2
/*0x1e58*/      adds r1, r0, #4
/*0x1e5a*/      ldr r1, [r1]
/*0x1e5c*/      sub.w r1, r1, #0x3400
/*0x1e60*/      cmp.w r1, #0xc800
/*0x1e64*/      bhs jump_1ea2
/*0x1e66*/      movw r1, #0x3bf8
/*0x1e6a*/      ldr r1, [r1]
/*0x1e6c*/      cmp.w r1, #0x3040000
/*0x1e70*/      bne jump_1ea2
/*0x1e72*/      mov.w r1, #0x3000
/*0x1e76*/      ldr.w r1, [r1, #0xb0]
/*0x1e7a*/      ubfx r2, r1, #0, #0x12
/*0x1e7e*/      sub.w r3, r2, #0x5a00
/*0x1e82*/      subs r3, #0xa5
/*0x1e84*/      bne jump_1ea2
/*0x1e86*/      lsrs r2, r1, #0x12
/*0x1e88*/      cmp r2, #0xe
/*0x1e8a*/      bhi jump_1ea2
/*0x1e8c*/      movw r1, #0x3078
/*0x1e90*/      b jump_1e9a
            jump_1e92:
/*0x1e92*/      ldr r3, [r1]
/*0x1e94*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x1e96*/      beq jump_1ea2
/*0x1e98*/      .short 0x1d09 /* adds r1, r1, #4 */ 
            jump_1e9a:
/*0x1e9a*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1e9c*/      bhs jump_1e92
/*0x1e9e*/      b.w load_jump_fw
            jump_1ea2:
/*0x1ea2*/      bx lr

            .thumb_func
            main:
/*0x1ea4*/      ldr r0, [pc, #0x90] /* data_1f38 */
/*0x1ea6*/      ldr r3, [r0]
/*0x1ea8*/      ldr r2, [pc, #0x90] /* data_1f3c */
/*0x1eaa*/      adds r1, r2, #5
/*0x1eac*/      cmp r3, r2
/*0x1eae*/      blo jump_1eb6
/*0x1eb0*/      ldr r3, [r0]
/*0x1eb2*/      cmp r3, r1
/*0x1eb4*/      bls jump_1eba
            jump_1eb6:
/*0x1eb6*/      str r2, [r0]
/*0x1eb8*/      b jump_1ec6
            jump_1eba:
/*0x1eba*/      ldr r2, [r0]
/*0x1ebc*/      cmp r2, r1
/*0x1ebe*/      bhs jump_1ec6
/*0x1ec0*/      ldr r2, [r0]
/*0x1ec2*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1ec4*/      b jump_1eb6
            jump_1ec6:
/*0x1ec6*/      ldr r0, [r0]
/*0x1ec8*/      cmp r0, r1
/*0x1eca*/      beq jump_1ed0
/*0x1ecc*/      bl check_fw_sp_pc
            jump_1ed0:
/*0x1ed0*/      bl call_5ec
/*0x1ed4*/      bl call_214
/*0x1ed8*/      bl call_bb4
/*0x1edc*/      bl call_6d0
/*0x1ee0*/      bl call_cd4
/*0x1ee4*/      bl call_5c8
/*0x1ee8*/      movs r0, #1
/*0x1eea*/      bl call_55c
/*0x1eee*/      bl call_11dc
/*0x1ef2*/      ldr r4, [pc, #0x4c] /* data_1f40 */
            jump_1ef4:
/*0x1ef4*/      bl get_event
/*0x1ef8*/      cmp r0, #1
/*0x1efa*/      beq jump_1f0c
/*0x1efc*/      cmp r0, #2
/*0x1efe*/      beq jump_1f20
/*0x1f00*/      cmp r0, #3
/*0x1f02*/      bne jump_1f32
/*0x1f04*/      movs r0, #1
/*0x1f06*/      bl call_55c
/*0x1f0a*/      b jump_1f32
            jump_1f0c:
/*0x1f0c*/      movs r0, #0
/*0x1f0e*/      bl call_55c
/*0x1f12*/      bl call_e08
/*0x1f16*/      bl call_6fe
/*0x1f1a*/      movs r0, #0
/*0x1f1c*/      bl call_b5c
            jump_1f20:
/*0x1f20*/      bl handle_frame
/*0x1f24*/      bl call_af8
/*0x1f28*/      ldrb r0, [r4]
/*0x1f2a*/      cbnz r0, jump_1f32
/*0x1f2c*/      movs r0, #1
/*0x1f2e*/      bl call_798
            jump_1f32:
/*0x1f32*/      bl call_1618
/*0x1f36*/      b jump_1ef4

            data_1f38:
/*0x1f38*/  .word 0x20003ffc
            data_1f3c:
/*0x1f3c*/  .word 0x55aafaf0
            data_1f40:
/*0x1f40*/  .word 0x20000004

/*0x1f44*/  .byte 0x01
/*0x1f45*/  .byte 0x23
/*0x1f46*/  .byte 0x45
/*0x1f47*/  .byte 0x67
/*0x1f48*/  .byte 0x89
/*0x1f49*/  .byte 0xab
/*0x1f4a*/  .byte 0xcd
/*0x1f4b*/  .byte 0xef
/*0x1f4c*/  .byte 0x08
/*0x1f4d*/  .byte 0x09
/*0x1f4e*/  .byte 0x0a
/*0x1f4f*/  .byte 0x0b
/*0x1f50*/  .byte 0x0c
/*0x1f51*/  .byte 0x0d
/*0x1f52*/  .byte 0x0e
/*0x1f53*/  .byte 0x0f
/*0x1f54*/  .byte 0x10
/*0x1f55*/  .byte 0x11
/*0x1f56*/  .byte 0x12
/*0x1f57*/  .byte 0x13
/*0x1f58*/  .byte 0x14
/*0x1f59*/  .byte 0x15
/*0x1f5a*/  .byte 0x16
/*0x1f5b*/  .byte 0x17
/*0x1f5c*/  .byte 0x18
/*0x1f5d*/  .byte 0x19
/*0x1f5e*/  .byte 0x1a
/*0x1f5f*/  .byte 0x1b
/*0x1f60*/  .byte 0x1c
/*0x1f61*/  .byte 0x1d
/*0x1f62*/  .byte 0x1e
/*0x1f63*/  .byte 0x1f
/*0x1f64*/  .byte 0x20
/*0x1f65*/  .byte 0x21
/*0x1f66*/  .byte 0x22
/*0x1f67*/  .byte 0x23
/*0x1f68*/  .byte 0x24
/*0x1f69*/  .byte 0x25
/*0x1f6a*/  .byte 0x26
/*0x1f6b*/  .byte 0x27
/*0x1f6c*/  .byte 0x28
/*0x1f6d*/  .byte 0x29
/*0x1f6e*/  .byte 0x2a
/*0x1f6f*/  .byte 0x2b
/*0x1f70*/  .byte 0x2c
/*0x1f71*/  .byte 0x2d
/*0x1f72*/  .byte 0x2e
/*0x1f73*/  .byte 0x2f
/*0x1f74*/  .byte 0x30
/*0x1f75*/  .byte 0x31
/*0x1f76*/  .byte 0x32
/*0x1f77*/  .byte 0x33
/*0x1f78*/  .byte 0x34
/*0x1f79*/  .byte 0x35
/*0x1f7a*/  .byte 0x36
/*0x1f7b*/  .byte 0x37
/*0x1f7c*/  .byte 0x38
/*0x1f7d*/  .byte 0x39
/*0x1f7e*/  .byte 0x3a
/*0x1f7f*/  .byte 0x3b
/*0x1f80*/  .byte 0x3c
/*0x1f81*/  .byte 0x3d
/*0x1f82*/  .byte 0x3e
/*0x1f83*/  .byte 0x3f
/*0x1f84*/  .byte 0x29
/*0x1f85*/  .byte 0x1e
/*0x1f86*/  .byte 0x1f
/*0x1f87*/  .byte 0x20
/*0x1f88*/  .byte 0x21
/*0x1f89*/  .byte 0x22
/*0x1f8a*/  .byte 0x23
/*0x1f8b*/  .byte 0x24
/*0x1f8c*/  .byte 0x2b
/*0x1f8d*/  .byte 0x14
/*0x1f8e*/  .byte 0x1a
/*0x1f8f*/  .byte 0x08
/*0x1f90*/  .byte 0x15
/*0x1f91*/  .byte 0x17
/*0x1f92*/  .byte 0x1c
/*0x1f93*/  .byte 0x18
/*0x1f94*/  .byte 0x39
/*0x1f95*/  .byte 0x04
/*0x1f96*/  .byte 0x16
/*0x1f97*/  .byte 0x07
/*0x1f98*/  .byte 0x09
/*0x1f99*/  .byte 0x0a
/*0x1f9a*/  .byte 0x0b
/*0x1f9b*/  .byte 0x0d
/*0x1f9c*/  .byte 0xe1
/*0x1f9d*/  .byte 0x1d
/*0x1f9e*/  .byte 0x1b
/*0x1f9f*/  .byte 0x06
/*0x1fa0*/  .byte 0x19
/*0x1fa1*/  .byte 0x05
/*0x1fa2*/  .byte 0x11
/*0x1fa3*/  .byte 0x10
/*0x1fa4*/  .byte 0xe0
/*0x1fa5*/  .byte 0xe3
/*0x1fa6*/  .byte 0xe2
/*0x1fa7*/  .byte 0x25
/*0x1fa8*/  .byte 0x26
/*0x1fa9*/  .byte 0x27
/*0x1faa*/  .byte 0x2d
/*0x1fab*/  .byte 0x2a
/*0x1fac*/  .byte 0x64
/*0x1fad*/  .byte 0x00
/*0x1fae*/  .byte 0x2e
/*0x1faf*/  .byte 0x0c
/*0x1fb0*/  .byte 0x12
/*0x1fb1*/  .byte 0x13
/*0x1fb2*/  .byte 0x2f
/*0x1fb3*/  .byte 0x31
/*0x1fb4*/  .byte 0x00
/*0x1fb5*/  .byte 0x00
/*0x1fb6*/  .byte 0x30
/*0x1fb7*/  .byte 0x0e
/*0x1fb8*/  .byte 0x0f
/*0x1fb9*/  .byte 0x33
/*0x1fba*/  .byte 0x34
/*0x1fbb*/  .byte 0x28
/*0x1fbc*/  .byte 0x00
/*0x1fbd*/  .byte 0x00
/*0x1fbe*/  .byte 0x2c
/*0x1fbf*/  .byte 0x36
/*0x1fc0*/  .byte 0x37
/*0x1fc1*/  .byte 0x38
/*0x1fc2*/  .byte 0xe5
/*0x1fc3*/  .byte 0x35
/*0x1fc4*/  .byte 0x00
/*0x1fc5*/  .byte 0x00
/*0x1fc6*/  .byte 0x00
/*0x1fc7*/  .byte 0xe6
/*0x1fc8*/  .byte 0xe7
/*0x1fc9*/  .byte 0x65
/*0x1fca*/  .byte 0x00
/*0x1fcb*/  .byte 0xe4
/*0x1fcc*/  .byte 0xc0
/*0x1fcd*/  .byte 0xc1
/*0x1fce*/  .byte 0xc2
/*0x1fcf*/  .byte 0xc3
/*0x1fd0*/  .byte 0x00
/*0x1fd1*/  .byte 0x00
/*0x1fd2*/  .byte 0x00
/*0x1fd3*/  .byte 0x00
            gpio_map_3:
/*0x1fd4*/  .byte 0x00
/*0x1fd5*/  .byte 0x40
/*0x1fd6*/  .byte 0x0b
/*0x1fd7*/  .byte 0x40
/*0x1fd8*/  .byte 0x00
/*0x1fd9*/  .byte 0x02
/*0x1fda*/  .byte 0x00
/*0x1fdb*/  .byte 0x00
/*0x1fdc*/  .byte 0x00
/*0x1fdd*/  .byte 0x00
/*0x1fde*/  .byte 0x0b
/*0x1fdf*/  .byte 0x40
/*0x1fe0*/  .byte 0x20
/*0x1fe1*/  .byte 0x00
/*0x1fe2*/  .byte 0x00
/*0x1fe3*/  .byte 0x00
/*0x1fe4*/  .byte 0x00
/*0x1fe5*/  .byte 0x00
/*0x1fe6*/  .byte 0x0b
/*0x1fe7*/  .byte 0x40
/*0x1fe8*/  .byte 0x40
/*0x1fe9*/  .byte 0x00
/*0x1fea*/  .byte 0x00
/*0x1feb*/  .byte 0x00
/*0x1fec*/  .byte 0x00
/*0x1fed*/  .byte 0x00
/*0x1fee*/  .byte 0x0b
/*0x1fef*/  .byte 0x40
/*0x1ff0*/  .byte 0x80
/*0x1ff1*/  .byte 0x00
/*0x1ff2*/  .byte 0x00
/*0x1ff3*/  .byte 0x00
/*0x1ff4*/  .byte 0x00
/*0x1ff5*/  .byte 0x40
/*0x1ff6*/  .byte 0x0b
/*0x1ff7*/  .byte 0x40
/*0x1ff8*/  .byte 0x00
/*0x1ff9*/  .byte 0x08
/*0x1ffa*/  .byte 0x00
/*0x1ffb*/  .byte 0x00
/*0x1ffc*/  .byte 0x00
/*0x1ffd*/  .byte 0x40
/*0x1ffe*/  .byte 0x0b
/*0x1fff*/  .byte 0x40
/*0x2000*/  .byte 0x00
/*0x2001*/  .byte 0x20
/*0x2002*/  .byte 0x00
/*0x2003*/  .byte 0x00
/*0x2004*/  .byte 0x00
/*0x2005*/  .byte 0x40
/*0x2006*/  .byte 0x0b
/*0x2007*/  .byte 0x40
/*0x2008*/  .byte 0x00
/*0x2009*/  .byte 0x40
/*0x200a*/  .byte 0x00
/*0x200b*/  .byte 0x00
/*0x200c*/  .byte 0x00
/*0x200d*/  .byte 0x40
/*0x200e*/  .byte 0x0b
/*0x200f*/  .byte 0x40
/*0x2010*/  .byte 0x00
/*0x2011*/  .byte 0x80
/*0x2012*/  .byte 0x00
/*0x2013*/  .byte 0x00
/*0x2014*/  .byte 0x02
/*0x2015*/  .byte 0x09
/*0x2016*/  .byte 0x00
/*0x2017*/  .byte 0x05
/*0x2018*/  .byte 0x00
/*0x2019*/  .byte 0x06
/*0x201a*/  .byte 0x00
/*0x201b*/  .byte 0x07
/*0x201c*/  .byte 0x02
/*0x201d*/  .byte 0x0b
/*0x201e*/  .byte 0x02
/*0x201f*/  .byte 0x0d
/*0x2020*/  .byte 0x02
/*0x2021*/  .byte 0x0e
/*0x2022*/  .byte 0x02
/*0x2023*/  .byte 0x0f
            gpio_map_2:
/*0x2024*/  .byte 0x00
/*0x2025*/  .byte 0x40
/*0x2026*/  .byte 0x0b
/*0x2027*/  .byte 0x40
/*0x2028*/  .byte 0x10
/*0x2029*/  .byte 0x00
/*0x202a*/  .byte 0x00
/*0x202b*/  .byte 0x00
/*0x202c*/  .byte 0x00
/*0x202d*/  .byte 0x20
/*0x202e*/  .byte 0x0b
/*0x202f*/  .byte 0x40
/*0x2030*/  .byte 0x40
/*0x2031*/  .byte 0x00
/*0x2032*/  .byte 0x00
/*0x2033*/  .byte 0x00
/*0x2034*/  .byte 0x00
/*0x2035*/  .byte 0x60
/*0x2036*/  .byte 0x0b
/*0x2037*/  .byte 0x40
/*0x2038*/  .byte 0x01
/*0x2039*/  .byte 0x00
/*0x203a*/  .byte 0x00
/*0x203b*/  .byte 0x00
/*0x203c*/  .byte 0x00
/*0x203d*/  .byte 0x20
/*0x203e*/  .byte 0x0b
/*0x203f*/  .byte 0x40
/*0x2040*/  .byte 0x00
/*0x2041*/  .byte 0x08
/*0x2042*/  .byte 0x00
/*0x2043*/  .byte 0x00
/*0x2044*/  .byte 0x00
/*0x2045*/  .byte 0x00
/*0x2046*/  .byte 0x0b
/*0x2047*/  .byte 0x40
/*0x2048*/  .byte 0x00
/*0x2049*/  .byte 0x08
/*0x204a*/  .byte 0x00
/*0x204b*/  .byte 0x00
/*0x204c*/  .byte 0x00
/*0x204d*/  .byte 0x00
/*0x204e*/  .byte 0x0b
/*0x204f*/  .byte 0x40
/*0x2050*/  .byte 0x01
/*0x2051*/  .byte 0x00
/*0x2052*/  .byte 0x00
/*0x2053*/  .byte 0x00
/*0x2054*/  .byte 0x00
/*0x2055*/  .byte 0x00
/*0x2056*/  .byte 0x0b
/*0x2057*/  .byte 0x40
/*0x2058*/  .byte 0x02
/*0x2059*/  .byte 0x00
/*0x205a*/  .byte 0x00
/*0x205b*/  .byte 0x00
/*0x205c*/  .byte 0x00
/*0x205d*/  .byte 0x00
/*0x205e*/  .byte 0x0b
/*0x205f*/  .byte 0x40
/*0x2060*/  .byte 0x04
/*0x2061*/  .byte 0x00
/*0x2062*/  .byte 0x00
/*0x2063*/  .byte 0x00
/*0x2064*/  .byte 0x00
/*0x2065*/  .byte 0x00
/*0x2066*/  .byte 0x0b
/*0x2067*/  .byte 0x40
/*0x2068*/  .byte 0x08
/*0x2069*/  .byte 0x00
/*0x206a*/  .byte 0x00
/*0x206b*/  .byte 0x00
/*0x206c*/  .byte 0x00
/*0x206d*/  .byte 0x00
/*0x206e*/  .byte 0x0b
/*0x206f*/  .byte 0x40
/*0x2070*/  .byte 0x10
/*0x2071*/  .byte 0x00
/*0x2072*/  .byte 0x00
/*0x2073*/  .byte 0x00
            gpio_map_1:
/*0x2074*/  .byte 0x00
/*0x2075*/  .byte 0x40
/*0x2076*/  .byte 0x0b
/*0x2077*/  .byte 0x40
/*0x2078*/  .byte 0x00
/*0x2079*/  .byte 0x01
/*0x207a*/  .byte 0x00
/*0x207b*/  .byte 0x00
/*0x207c*/  .byte 0x00
/*0x207d*/  .byte 0x40
/*0x207e*/  .byte 0x0b
/*0x207f*/  .byte 0x40
/*0x2080*/  .byte 0x80
/*0x2081*/  .byte 0x00
/*0x2082*/  .byte 0x00
/*0x2083*/  .byte 0x00
/*0x2084*/  .byte 0x00
/*0x2085*/  .byte 0x20
/*0x2086*/  .byte 0x0b
/*0x2087*/  .byte 0x40
/*0x2088*/  .byte 0x20
/*0x2089*/  .byte 0x00
/*0x208a*/  .byte 0x00
/*0x208b*/  .byte 0x00
/*0x208c*/  .byte 0x00
/*0x208d*/  .byte 0x20
/*0x208e*/  .byte 0x0b
/*0x208f*/  .byte 0x40
/*0x2090*/  .byte 0x10
/*0x2091*/  .byte 0x00
/*0x2092*/  .byte 0x00
/*0x2093*/  .byte 0x00
/*0x2094*/  .byte 0x00
/*0x2095*/  .byte 0x20
/*0x2096*/  .byte 0x0b
/*0x2097*/  .byte 0x40
/*0x2098*/  .byte 0x08
/*0x2099*/  .byte 0x00
/*0x209a*/  .byte 0x00
/*0x209b*/  .byte 0x00
/*0x209c*/  .byte 0x00
/*0x209d*/  .byte 0x20
/*0x209e*/  .byte 0x0b
/*0x209f*/  .byte 0x40
/*0x20a0*/  .byte 0x04
/*0x20a1*/  .byte 0x00
/*0x20a2*/  .byte 0x00
/*0x20a3*/  .byte 0x00
/*0x20a4*/  .byte 0x00
/*0x20a5*/  .byte 0x40
/*0x20a6*/  .byte 0x0b
/*0x20a7*/  .byte 0x40
/*0x20a8*/  .byte 0x40
/*0x20a9*/  .byte 0x00
/*0x20aa*/  .byte 0x00
/*0x20ab*/  .byte 0x00
/*0x20ac*/  .byte 0x00
/*0x20ad*/  .byte 0x40
/*0x20ae*/  .byte 0x0b
/*0x20af*/  .byte 0x40
/*0x20b0*/  .byte 0x20
/*0x20b1*/  .byte 0x00
/*0x20b2*/  .byte 0x00
/*0x20b3*/  .byte 0x00
/*0x20b4*/  .byte 0x34
/*0x20b5*/  .byte 0x04
/*0x20b6*/  .byte 0x00
/*0x20b7*/  .byte 0x00
/*0x20b8*/  .byte 0xf8
/*0x20b9*/  .byte 0x21
/*0x20ba*/  .byte 0x00
/*0x20bb*/  .byte 0x00
            usb_report1_desc:
/*0x20bc*/  .byte 0x06
/*0x20bd*/  .byte 0x00
/*0x20be*/  .byte 0xff
/*0x20bf*/  .byte 0x09
/*0x20c0*/  .byte 0x01
/*0x20c1*/  .byte 0xa1
/*0x20c2*/  .byte 0x01
/*0x20c3*/  .byte 0x09
/*0x20c4*/  .byte 0x02
/*0x20c5*/  .byte 0x15
/*0x20c6*/  .byte 0x00
/*0x20c7*/  .byte 0x26
/*0x20c8*/  .byte 0xff
/*0x20c9*/  .byte 0x00
/*0x20ca*/  .byte 0x75
/*0x20cb*/  .byte 0x08
/*0x20cc*/  .byte 0x95
/*0x20cd*/  .byte 0x40
/*0x20ce*/  .byte 0x81
/*0x20cf*/  .byte 0x02
/*0x20d0*/  .byte 0x09
/*0x20d1*/  .byte 0x03
/*0x20d2*/  .byte 0x15
/*0x20d3*/  .byte 0x00
/*0x20d4*/  .byte 0x26
/*0x20d5*/  .byte 0xff
/*0x20d6*/  .byte 0x00
/*0x20d7*/  .byte 0x75
/*0x20d8*/  .byte 0x08
/*0x20d9*/  .byte 0x95
/*0x20da*/  .byte 0x40
/*0x20db*/  .byte 0x91
/*0x20dc*/  .byte 0x02
/*0x20dd*/  .byte 0xc0
/*0x20de*/  .byte 0x00
/*0x20df*/  .byte 0x00
/*0x20e0*/  .byte 0x05
/*0x20e1*/  .byte 0x01
/*0x20e2*/  .byte 0x09
/*0x20e3*/  .byte 0x80
/*0x20e4*/  .byte 0xa1
/*0x20e5*/  .byte 0x01
/*0x20e6*/  .byte 0x85
/*0x20e7*/  .byte 0x01
/*0x20e8*/  .byte 0x19
/*0x20e9*/  .byte 0x81
/*0x20ea*/  .byte 0x29
/*0x20eb*/  .byte 0x83
            usb_report2_desc:
/*0x20ec*/  .byte 0x15
/*0x20ed*/  .byte 0x00
/*0x20ee*/  .byte 0x25
/*0x20ef*/  .byte 0x01
/*0x20f0*/  .byte 0x95
/*0x20f1*/  .byte 0x03
/*0x20f2*/  .byte 0x75
/*0x20f3*/  .byte 0x01
/*0x20f4*/  .byte 0x81
/*0x20f5*/  .byte 0x02
/*0x20f6*/  .byte 0x95
/*0x20f7*/  .byte 0x01
/*0x20f8*/  .byte 0x75
/*0x20f9*/  .byte 0x05
/*0x20fa*/  .byte 0x81
/*0x20fb*/  .byte 0x01
/*0x20fc*/  .byte 0xc0
/*0x20fd*/  .byte 0x05
/*0x20fe*/  .byte 0x0c
/*0x20ff*/  .byte 0x09
/*0x2100*/  .byte 0x01
/*0x2101*/  .byte 0xa1
/*0x2102*/  .byte 0x01
/*0x2103*/  .byte 0x85
/*0x2104*/  .byte 0x02
/*0x2105*/  .byte 0x15
/*0x2106*/  .byte 0x00
/*0x2107*/  .byte 0x25
/*0x2108*/  .byte 0x01
/*0x2109*/  .byte 0x95
/*0x210a*/  .byte 0x12
/*0x210b*/  .byte 0x75
/*0x210c*/  .byte 0x01
/*0x210d*/  .byte 0x0a
/*0x210e*/  .byte 0x83
/*0x210f*/  .byte 0x01
/*0x2110*/  .byte 0x0a
/*0x2111*/  .byte 0x8a
/*0x2112*/  .byte 0x01
/*0x2113*/  .byte 0x0a
/*0x2114*/  .byte 0x92
/*0x2115*/  .byte 0x01
/*0x2116*/  .byte 0x0a
/*0x2117*/  .byte 0x94
/*0x2118*/  .byte 0x01
/*0x2119*/  .byte 0x09
/*0x211a*/  .byte 0xcd
/*0x211b*/  .byte 0x09
/*0x211c*/  .byte 0xb7
/*0x211d*/  .byte 0x09
/*0x211e*/  .byte 0xb6
/*0x211f*/  .byte 0x09
/*0x2120*/  .byte 0xb5
/*0x2121*/  .byte 0x09
/*0x2122*/  .byte 0xe2
/*0x2123*/  .byte 0x09
/*0x2124*/  .byte 0xea
/*0x2125*/  .byte 0x09
/*0x2126*/  .byte 0xe9
/*0x2127*/  .byte 0x0a
/*0x2128*/  .byte 0x21
/*0x2129*/  .byte 0x02
/*0x212a*/  .byte 0x0a
/*0x212b*/  .byte 0x23
/*0x212c*/  .byte 0x02
/*0x212d*/  .byte 0x0a
/*0x212e*/  .byte 0x24
/*0x212f*/  .byte 0x02
/*0x2130*/  .byte 0x0a
/*0x2131*/  .byte 0x25
/*0x2132*/  .byte 0x02
/*0x2133*/  .byte 0x0a
/*0x2134*/  .byte 0x26
/*0x2135*/  .byte 0x02
/*0x2136*/  .byte 0x0a
/*0x2137*/  .byte 0x27
/*0x2138*/  .byte 0x02
/*0x2139*/  .byte 0x0a
/*0x213a*/  .byte 0x2a
/*0x213b*/  .byte 0x02
/*0x213c*/  .byte 0x81
/*0x213d*/  .byte 0x02
/*0x213e*/  .byte 0x95
/*0x213f*/  .byte 0x01
/*0x2140*/  .byte 0x75
/*0x2141*/  .byte 0x0e
/*0x2142*/  .byte 0x81
/*0x2143*/  .byte 0x01
/*0x2144*/  .byte 0xc0
/*0x2145*/  .byte 0x00
/*0x2146*/  .byte 0x00
/*0x2147*/  .byte 0x00
            usb_report0_desc:
/*0x2148*/  .byte 0x05
/*0x2149*/  .byte 0x01
/*0x214a*/  .byte 0x09
/*0x214b*/  .byte 0x06
/*0x214c*/  .byte 0xa1
/*0x214d*/  .byte 0x01
/*0x214e*/  .byte 0x05
/*0x214f*/  .byte 0x07
/*0x2150*/  .byte 0x19
/*0x2151*/  .byte 0xe0
/*0x2152*/  .byte 0x29
/*0x2153*/  .byte 0xe7
/*0x2154*/  .byte 0x15
/*0x2155*/  .byte 0x00
/*0x2156*/  .byte 0x25
/*0x2157*/  .byte 0x01
/*0x2158*/  .byte 0x75
/*0x2159*/  .byte 0x01
/*0x215a*/  .byte 0x95
/*0x215b*/  .byte 0x08
/*0x215c*/  .byte 0x81
/*0x215d*/  .byte 0x02
/*0x215e*/  .byte 0x95
/*0x215f*/  .byte 0x01
/*0x2160*/  .byte 0x75
/*0x2161*/  .byte 0x08
/*0x2162*/  .byte 0x81
/*0x2163*/  .byte 0x03
/*0x2164*/  .byte 0x95
/*0x2165*/  .byte 0x03
/*0x2166*/  .byte 0x75
/*0x2167*/  .byte 0x01
/*0x2168*/  .byte 0x05
/*0x2169*/  .byte 0x08
/*0x216a*/  .byte 0x19
/*0x216b*/  .byte 0x01
/*0x216c*/  .byte 0x29
/*0x216d*/  .byte 0x03
/*0x216e*/  .byte 0x91
/*0x216f*/  .byte 0x02
/*0x2170*/  .byte 0x95
/*0x2171*/  .byte 0x01
/*0x2172*/  .byte 0x75
/*0x2173*/  .byte 0x05
/*0x2174*/  .byte 0x91
/*0x2175*/  .byte 0x03
/*0x2176*/  .byte 0x95
/*0x2177*/  .byte 0x06
/*0x2178*/  .byte 0x75
/*0x2179*/  .byte 0x08
/*0x217a*/  .byte 0x15
/*0x217b*/  .byte 0x00
/*0x217c*/  .byte 0x26
/*0x217d*/  .byte 0xa4
/*0x217e*/  .byte 0x00
/*0x217f*/  .byte 0x05
/*0x2180*/  .byte 0x07
/*0x2181*/  .byte 0x19
/*0x2182*/  .byte 0x00
/*0x2183*/  .byte 0x29
/*0x2184*/  .byte 0xa4
/*0x2185*/  .byte 0x81
/*0x2186*/  .byte 0x00
/*0x2187*/  .byte 0xc0
            usb_descriptors:
/*0x2188*/  .byte 0x09
/*0x2189*/  .byte 0x02
/*0x218a*/  .byte 0x5b
/*0x218b*/  .byte 0x00
/*0x218c*/  .byte 0x03
/*0x218d*/  .byte 0x01
/*0x218e*/  .byte 0x00
/*0x218f*/  .byte 0xa0
/*0x2190*/  .byte 0x32
/*0x2191*/  .byte 0x09
/*0x2192*/  .byte 0x04
/*0x2193*/  .byte 0x00
/*0x2194*/  .byte 0x00
/*0x2195*/  .byte 0x01
/*0x2196*/  .byte 0x03
/*0x2197*/  .byte 0x01
/*0x2198*/  .byte 0x01
/*0x2199*/  .byte 0x00
/*0x219a*/  .byte 0x09
/*0x219b*/  .byte 0x21
/*0x219c*/  .byte 0x11
/*0x219d*/  .byte 0x01
/*0x219e*/  .byte 0x00
/*0x219f*/  .byte 0x01
/*0x21a0*/  .byte 0x22
/*0x21a1*/  .byte 0x40
/*0x21a2*/  .byte 0x00
/*0x21a3*/  .byte 0x07
/*0x21a4*/  .byte 0x05
/*0x21a5*/  .byte 0x81
/*0x21a6*/  .byte 0x03
/*0x21a7*/  .byte 0x08
/*0x21a8*/  .byte 0x00
/*0x21a9*/  .byte 0x01
/*0x21aa*/  .byte 0x09
/*0x21ab*/  .byte 0x04
/*0x21ac*/  .byte 0x01
/*0x21ad*/  .byte 0x00
/*0x21ae*/  .byte 0x02
/*0x21af*/  .byte 0x03
/*0x21b0*/  .byte 0x00
/*0x21b1*/  .byte 0x00
/*0x21b2*/  .byte 0x00
/*0x21b3*/  .byte 0x09
/*0x21b4*/  .byte 0x21
/*0x21b5*/  .byte 0x11
/*0x21b6*/  .byte 0x01
/*0x21b7*/  .byte 0x00
/*0x21b8*/  .byte 0x01
/*0x21b9*/  .byte 0x22
/*0x21ba*/  .byte 0x22
/*0x21bb*/  .byte 0x00
/*0x21bc*/  .byte 0x07
/*0x21bd*/  .byte 0x05
/*0x21be*/  .byte 0x83
/*0x21bf*/  .byte 0x03
/*0x21c0*/  .byte 0x40
/*0x21c1*/  .byte 0x00
/*0x21c2*/  .byte 0x01
/*0x21c3*/  .byte 0x07
/*0x21c4*/  .byte 0x05
/*0x21c5*/  .byte 0x04
/*0x21c6*/  .byte 0x03
/*0x21c7*/  .byte 0x40
/*0x21c8*/  .byte 0x00
/*0x21c9*/  .byte 0x01
/*0x21ca*/  .byte 0x09
/*0x21cb*/  .byte 0x04
/*0x21cc*/  .byte 0x02
/*0x21cd*/  .byte 0x00
/*0x21ce*/  .byte 0x01
/*0x21cf*/  .byte 0x03
/*0x21d0*/  .byte 0x00
/*0x21d1*/  .byte 0x00
/*0x21d2*/  .byte 0x00
/*0x21d3*/  .byte 0x09
/*0x21d4*/  .byte 0x21
/*0x21d5*/  .byte 0x11
/*0x21d6*/  .byte 0x01
/*0x21d7*/  .byte 0x00
/*0x21d8*/  .byte 0x01
/*0x21d9*/  .byte 0x22
/*0x21da*/  .byte 0x65
/*0x21db*/  .byte 0x00
/*0x21dc*/  .byte 0x07
/*0x21dd*/  .byte 0x05
/*0x21de*/  .byte 0x82
/*0x21df*/  .byte 0x03
/*0x21e0*/  .byte 0x40
/*0x21e1*/  .byte 0x00
/*0x21e2*/  .byte 0x01
/*0x21e3*/  .byte 0x00
/*0x21e4*/  .byte 0x12
/*0x21e5*/  .byte 0x01
/*0x21e6*/  .byte 0x10
/*0x21e7*/  .byte 0x01
/*0x21e8*/  .byte 0x00
/*0x21e9*/  .byte 0x00
/*0x21ea*/  .byte 0x00
/*0x21eb*/  .byte 0x40
/*0x21ec*/  .byte 0xd9
/*0x21ed*/  .byte 0x04
/*0x21ee*/  .byte 0x67
/*0x21ef*/  .byte 0x11
/*0x21f0*/  .byte 0x03
/*0x21f1*/  .byte 0x11
/*0x21f2*/  .byte 0x00
/*0x21f3*/  .byte 0x01
/*0x21f4*/  .byte 0x00
/*0x21f5*/  .byte 0x01
/*0x21f6*/  .byte 0x00
/*0x21f7*/  .byte 0x00
/*0x21f8*/  .byte 0x18
/*0x21f9*/  .byte 0x03
/*0x21fa*/  .byte 0x55
/*0x21fb*/  .byte 0x00
/*0x21fc*/  .byte 0x53
/*0x21fd*/  .byte 0x00
/*0x21fe*/  .byte 0x42
/*0x21ff*/  .byte 0x00
/*0x2200*/  .byte 0x2d
/*0x2201*/  .byte 0x00
/*0x2202*/  .byte 0x48
/*0x2203*/  .byte 0x00
/*0x2204*/  .byte 0x49
/*0x2205*/  .byte 0x00
/*0x2206*/  .byte 0x44
/*0x2207*/  .byte 0x00
/*0x2208*/  .byte 0x20
/*0x2209*/  .byte 0x00
/*0x220a*/  .byte 0x49
/*0x220b*/  .byte 0x00
/*0x220c*/  .byte 0x41
/*0x220d*/  .byte 0x00
/*0x220e*/  .byte 0x50
/*0x220f*/  .byte 0x00
/*0x2210*/  .byte 0x00
/*0x2211*/  .byte 0x00
/*0x2212*/  .byte 0x00
/*0x2213*/  .byte 0x00
/*0x2214*/  .byte 0x05
/*0x2215*/  .byte 0x10
/*0x2216*/  .byte 0x00
/*0x2217*/  .byte 0x00
/*0x2218*/  .byte 0x00
/*0x2219*/  .byte 0x00
/*0x221a*/  .byte 0x00
/*0x221b*/  .byte 0x00
/*0x221c*/  .byte 0x99
/*0x221d*/  .byte 0x1a
/*0x221e*/  .byte 0x00
/*0x221f*/  .byte 0x00
/*0x2220*/  .byte 0x00
/*0x2221*/  .byte 0x00
/*0x2222*/  .byte 0x00
/*0x2223*/  .byte 0x00
/*0x2224*/  .byte 0x00
/*0x2225*/  .byte 0x00
/*0x2226*/  .byte 0x00
/*0x2227*/  .byte 0x00
/*0x2228*/  .byte 0xa5
/*0x2229*/  .byte 0x19
/*0x222a*/  .byte 0x00
/*0x222b*/  .byte 0x00
/*0x222c*/  .byte 0xa9
/*0x222d*/  .byte 0x18
/*0x222e*/  .byte 0x00
/*0x222f*/  .byte 0x00
            data_2230:
/*0x2230*/  .byte 0x50
/*0x2231*/  .byte 0x22
/*0x2232*/  .byte 0x00
/*0x2233*/  .byte 0x00
/*0x2234*/  .byte 0x00
/*0x2235*/  .byte 0x00
/*0x2236*/  .byte 0x00
/*0x2237*/  .byte 0x20
/*0x2238*/  .byte 0x40
/*0x2239*/  .byte 0x00
/*0x223a*/  .byte 0x00
/*0x223b*/  .byte 0x00
/*0x223c*/  .byte 0x2c
/*0x223d*/  .byte 0x1e
/*0x223e*/  .byte 0x00
/*0x223f*/  .byte 0x00
/*0x2240*/  .byte 0x90
/*0x2241*/  .byte 0x22
/*0x2242*/  .byte 0x00
/*0x2243*/  .byte 0x00
/*0x2244*/  .byte 0x40
/*0x2245*/  .byte 0x00
/*0x2246*/  .byte 0x00
/*0x2247*/  .byte 0x20
/*0x2248*/  .byte 0x00
/*0x2249*/  .byte 0x07
/*0x224a*/  .byte 0x00
/*0x224b*/  .byte 0x00
/*0x224c*/  .byte 0x3a
/*0x224d*/  .byte 0x1e
/*0x224e*/  .byte 0x00
/*0x224f*/  .byte 0x00
            data_2250:
/*0x2250*/  .byte 0x01
/*0x2251*/  .byte 0x00
/*0x2252*/  .byte 0x00
/*0x2253*/  .byte 0x00
/*0x2254*/  .byte 0x00
/*0x2255*/  .byte 0x00
/*0x2256*/  .byte 0x00
/*0x2257*/  .byte 0x00
/*0x2258*/  .byte 0x00
/*0x2259*/  .byte 0x30
/*0x225a*/  .byte 0x00
/*0x225b*/  .byte 0x00
/*0x225c*/  .byte 0x00
/*0x225d*/  .byte 0x00
/*0x225e*/  .byte 0x00
/*0x225f*/  .byte 0x00
/*0x2260*/  .byte 0xff
/*0x2261*/  .byte 0x00
/*0x2262*/  .byte 0x00
/*0x2263*/  .byte 0x00
/*0x2264*/  .byte 0xac
/*0x2265*/  .byte 0x20
/*0x2266*/  .byte 0x00
/*0x2267*/  .byte 0x00
/*0x2268*/  .byte 0x00
/*0x2269*/  .byte 0xa2
/*0x226a*/  .byte 0x4a
/*0x226b*/  .byte 0x04
/*0x226c*/  .byte 0x00
/*0x226d*/  .byte 0x00
/*0x226e*/  .byte 0x00
/*0x226f*/  .byte 0x00
/*0x2270*/  .byte 0x00
/*0x2271*/  .byte 0x00
/*0x2272*/  .byte 0x00
/*0x2273*/  .byte 0x00
/*0x2274*/  .byte 0x00
/*0x2275*/  .byte 0x00
/*0x2276*/  .byte 0x00
/*0x2277*/  .byte 0x00
/*0x2278*/  .byte 0x00
/*0x2279*/  .byte 0x00
/*0x227a*/  .byte 0x00
/*0x227b*/  .byte 0x00
/*0x227c*/  .byte 0x00
/*0x227d*/  .byte 0x00
/*0x227e*/  .byte 0x00
/*0x227f*/  .byte 0x00
/*0x2280*/  .byte 0x00
/*0x2281*/  .byte 0x00
/*0x2282*/  .byte 0x00
/*0x2283*/  .byte 0x00
/*0x2284*/  .byte 0x00
/*0x2285*/  .byte 0x00
/*0x2286*/  .byte 0x00
/*0x2287*/  .byte 0x00
/*0x2288*/  .byte 0x00
/*0x2289*/  .byte 0x00
/*0x228a*/  .byte 0x00
/*0x228b*/  .byte 0x00
/*0x228c*/  .byte 0x00
/*0x228d*/  .byte 0x00
/*0x228e*/  .byte 0x00
/*0x228f*/  .byte 0x00
