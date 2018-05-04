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
/*0x00a4*/      movs r2, #0xb4
/*0x00a6*/      movs r0, r0
            data_a8:
/*0x00a8*/      movs r2, #0xd4
/*0x00aa*/      movs r0, r0

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
/*0x0110*/      b.w jump_15a0

/*0x0114*/  .word usb_intr


            .thumb_func
            reset:
/*0x0118*/      ldr r0, [pc, #0xc] /* data_128 */
/*0x011a*/      blx r0 /* call_1678 */
/*0x011c*/      ldr r0, [pc, #0xc] /* data_12c */
/*0x011e*/      blx r0 /* call_1010 */
/*0x0120*/      ldr r0, [pc, #0xc] /* data_130 */
/*0x0122*/      bx r0 /* entry */

            .thumb_func
            generic_fault:
/*0x0124*/      b generic_fault

            .thumb_func
            generic_intr:
/*0x0126*/      b generic_intr

            data_128:
/*0x0128*/  .word call_1678
            data_12c:
/*0x012c*/  .word call_1010
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
/*0x0156*/      b.w jump_bb4

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
/*0x0182*/      bl call_18c8
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
/*0x01b0*/      b.w call_f84

            data_1b4:
/*0x01b4*/  .word 0x40077000
            data_1b8:
/*0x01b8*/  .word 0x20000010
            data_1bc:
/*0x01bc*/  .word 0x400b0000
            data_1c0:
/*0x01c0*/  .word 0x000020f8 /* possible pointer */


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
            call_1d8:
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
/*0x0228*/      bl call_2cc
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
/*0x02ba*/      bl call_2cc
/*0x02be*/      movs r0, #1
/*0x02c0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_2c4:
/*0x02c4*/  .word 0x400b0000
            data_2c8:
/*0x02c8*/  .word 0x40088000


            .thumb_func
            call_2cc:
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
            call_2f0:
/*0x02f0*/      ldr r1, [pc, #0xc] /* data_300 */
/*0x02f2*/      ldr r2, [r1]
/*0x02f4*/      bic r2, r2, #0xc00000
/*0x02f8*/      orr.w r0, r2, r0, lsl #22
/*0x02fc*/      str r0, [r1]
/*0x02fe*/      bx lr

            data_300:
/*0x0300*/  .word 0x40088000


            .thumb_func
            call_304:
/*0x0304*/      ldr r1, [pc, #8] /* data_310 */
/*0x0306*/      str r0, [r1]
/*0x0308*/      movs r0, #8
/*0x030a*/      str r0, [r1, #0xc]
/*0x030c*/      b.w jump_314

            data_310:
/*0x0310*/  .word 0x40080000

            jump_314:
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
/*0x040a*/  .byte 0x07
/*0x040b*/  .byte 0x12
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
/*0x041c*/  .byte 0x42
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
/*0x0429*/  .byte 0x32
/*0x042a*/  .byte 0x30
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
/*0x0550*/  .word 0x00002008 /* possible pointer */
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
/*0x0566*/      bl call_1d8
/*0x056a*/      movs r1, #0
/*0x056c*/      mov r0, r4
/*0x056e*/      bl call_1c4
/*0x0572*/      mov r0, r4
/*0x0574*/      bl bftm_clear
/*0x0578*/      movs r0, #0x29
/*0x057a*/      bl call_668
/*0x057e*/      bl call_6e0
/*0x0582*/      movs r0, #1
/*0x0584*/      bl call_c80
/*0x0588*/      pop.w {r4, lr}
/*0x058c*/      b.w jump_da8
            jump_590:
/*0x0590*/      movs r0, #0
/*0x0592*/      bl call_c80
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
/*0x05b0*/      bl call_1d8
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
/*0x05d4*/      bl call_2cc
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
            call_668:
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
/*0x06d0*/      mov.w r2, #0x200
/*0x06d4*/      movs r1, #0
/*0x06d6*/      lsls r0, r2, #9
/*0x06d8*/      movs r3, #1
/*0x06da*/      b.w call_2cc

/*0x06de*/  .byte 0x00
/*0x06df*/  .byte 0x00


            .thumb_func
            call_6e0:
/*0x06e0*/      push {r4, lr}
/*0x06e2*/      movs r2, #0
/*0x06e4*/      movs r1, #1
/*0x06e6*/      ldr r0, [pc, #0x14] /* data_6fc */
/*0x06e8*/      bl call_3c0
/*0x06ec*/      movs r2, #0
/*0x06ee*/      pop.w {r4, lr}
/*0x06f2*/      mov r1, r2
/*0x06f4*/      movs r0, #2
/*0x06f6*/      b.w call_1ec

/*0x06fa*/  .byte 0x00
/*0x06fb*/  .byte 0x00

            data_6fc:
/*0x06fc*/  .word 0x400b4000


            .thumb_func
            call_700:
/*0x0700*/      push {r4, lr}
/*0x0702*/      movs r2, #2
/*0x0704*/      movs r1, #1
/*0x0706*/      ldr r0, [pc, #0x14] /* data_71c */
/*0x0708*/      bl call_3c0
/*0x070c*/      movs r2, #4
/*0x070e*/      movs r1, #0
/*0x0710*/      pop.w {r4, lr}
/*0x0714*/      movs r0, #2
/*0x0716*/      b.w call_1ec

/*0x071a*/  .byte 0x00
/*0x071b*/  .byte 0x00

            data_71c:
/*0x071c*/  .word 0x400b4000


            .thumb_func
            call_720:
/*0x0720*/      push {r4, r5, r6, lr}
/*0x0722*/      ldr r1, [pc, #0x34] /* data_758 */
/*0x0724*/      ldr r4, [r1]
/*0x0726*/      ldr r5, [pc, #0x30] /* data_758 */
/*0x0728*/      adds r5, #0x48
/*0x072a*/      ldr r3, [r5]
/*0x072c*/      movs r2, #1
/*0x072e*/      str r2, [r1]
/*0x0730*/      movs r2, #0
/*0x0732*/      str r2, [r5]
/*0x0734*/      ldr r6, [pc, #0x24] /* data_75c */
/*0x0736*/      str.w r2, [r6, #0x9c]
/*0x073a*/      str.w r2, [r6, #0x8c]
/*0x073e*/      str r4, [r1]
/*0x0740*/      ldr r1, [pc, #0x1c] /* data_760 */
/*0x0742*/      ldr r2, [r1]
/*0x0744*/      orr r2, r2, #4
/*0x0748*/      str r2, [r1]
/*0x074a*/      cbz r0, jump_752
/*0x074c*/      wfi 
            jump_74e:
/*0x074e*/      str r3, [r5]
/*0x0750*/      pop {r4, r5, r6, pc}
            jump_752:
/*0x0752*/      wfe 
/*0x0754*/      b jump_74e

/*0x0756*/  .byte 0x00
/*0x0757*/  .byte 0x00

            data_758:
/*0x0758*/  .word 0x43100618
            data_75c:
/*0x075c*/  .word 0x42d42000
            data_760:
/*0x0760*/  .word 0xe000ed10

            jump_764:
/*0x0764*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x0768*/      ldr r4, [pc, #0x38] /* data_7a4 */
/*0x076a*/      ldr r7, [r4]
/*0x076c*/      ldr r5, [pc, #0x34] /* data_7a4 */
/*0x076e*/      adds r5, #0x48
/*0x0770*/      ldr r6, [r5]
/*0x0772*/      mov.w sb, #1
/*0x0776*/      str.w sb, [r4]
/*0x077a*/      mov.w r8, #0
/*0x077e*/      str.w r8, [r5]
/*0x0782*/      bl call_ae8
/*0x0786*/      ldr r0, [pc, #0x20] /* data_7a8 */
/*0x0788*/      str.w r8, [r0, #0x9c]
/*0x078c*/      str.w sb, [r0, #0x8c]
/*0x0790*/      str r7, [r4]
/*0x0792*/      ldr r0, [pc, #0x18] /* data_7ac */
/*0x0794*/      ldr r1, [r0]
/*0x0796*/      orr r1, r1, #4
/*0x079a*/      str r1, [r0]
/*0x079c*/      wfe 
/*0x079e*/      str r6, [r5]
/*0x07a0*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_7a4:
/*0x07a4*/  .word 0x43100618
            data_7a8:
/*0x07a8*/  .word 0x42d42000
            data_7ac:
/*0x07ac*/  .word 0xe000ed10


            .thumb_func
            call_7b0:
/*0x07b0*/      ldr r1, [pc, #0x10] /* data_7c4 */
/*0x07b2*/      ldr r2, [r1]
/*0x07b4*/      bic r2, r2, #4
/*0x07b8*/      str r2, [r1]
/*0x07ba*/      cbz r0, jump_7c0
/*0x07bc*/      wfi 
/*0x07be*/      bx lr
            jump_7c0:
/*0x07c0*/      wfe 
/*0x07c2*/      bx lr

            data_7c4:
/*0x07c4*/  .word 0xe000ed10


            .thumb_func
            call_7c8:
/*0x07c8*/      push {r4, r5, r6, r7, lr}
/*0x07ca*/      sub sp, #0x100
/*0x07cc*/      mov r4, r0
/*0x07ce*/      mov r5, r1
/*0x07d0*/      mov r0, sp
/*0x07d2*/      bl call_16ac
/*0x07d6*/      movs r2, #0
/*0x07d8*/      mov r3, r2
/*0x07da*/      mov r1, sp
/*0x07dc*/      b jump_7fc
            jump_7de:
/*0x07de*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x07e0*/      uxtb r2, r2
/*0x07e2*/      ldrb r0, [r1, r2]
/*0x07e4*/      add r3, r0
/*0x07e6*/      uxtb r3, r3
/*0x07e8*/      ldrb r6, [r1, r3]
/*0x07ea*/      strb r6, [r1, r2]
/*0x07ec*/      strb r0, [r1, r3]
/*0x07ee*/      add r0, r6
/*0x07f0*/      uxtb r0, r0
/*0x07f2*/      ldrb r7, [r4]
/*0x07f4*/      ldrb r0, [r1, r0]
/*0x07f6*/      eors r7, r0
/*0x07f8*/      strb r7, [r4], #1
            jump_7fc:
/*0x07fc*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x07fe*/      bhs jump_7de
/*0x0800*/      add sp, #0x100
/*0x0802*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_804:
/*0x0804*/      push {r4, r5, r6, lr}
/*0x0806*/      lsrs r2, r2, #2
/*0x0808*/      movs r4, #4
/*0x080a*/      ldr r3, [pc, #0x18] /* data_824 */
/*0x080c*/      movs r5, #0x14
/*0x080e*/      b jump_81c
            jump_810:
/*0x0810*/      str r4, [r3, #0xc]
/*0x0812*/      str r0, [r3]
/*0x0814*/      ldm r1!, {r6}
/*0x0816*/      str r6, [r3, #4]
/*0x0818*/      str r5, [r3, #0x10]
/*0x081a*/      .short 0x1d00 /* adds r0, r0, #4 */ 
            jump_81c:
/*0x081c*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x081e*/      bhs jump_810
/*0x0820*/      pop {r4, r5, r6, pc}

/*0x0822*/  .byte 0x00
/*0x0823*/  .byte 0x00

            data_824:
/*0x0824*/  .word 0x40080000


            .thumb_func
            call_828:
/*0x0828*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x082c*/      ldr r5, [pc, #0x1c4] /* data_9f4 */
/*0x082e*/      ldrb r0, [r5]
/*0x0830*/      cmp r0, #1
/*0x0832*/      bne jump_916
/*0x0834*/      ldr r6, [pc, #0x1c0] /* data_9f8 */
/*0x0836*/      movs r4, #0
/*0x0838*/      mov r0, r6
/*0x083a*/      ldrb r1, [r6]
/*0x083c*/      ldrb r0, [r0, #1]
/*0x083e*/      mov ip, r4
/*0x0840*/      cmp r1, #0x10
/*0x0842*/      beq jump_864
/*0x0844*/      mov r2, r6
/*0x0846*/      mov.w lr, #0xcc00
/*0x084a*/      ldr r3, [r2, #4]
/*0x084c*/      mov.w r2, #0x3400
/*0x0850*/      add.w r7, r3, #0x3000
/*0x0854*/      cmp r1, #0x1d
/*0x0856*/      beq jump_8e8
/*0x0858*/      bgt jump_86e
/*0x085a*/      cmp r1, #0x11
/*0x085c*/      beq jump_878
/*0x085e*/      cmp r1, #0x12
/*0x0860*/      bne jump_944
/*0x0862*/      b jump_87e
            jump_864:
/*0x0864*/      cmp r0, #2
/*0x0866*/      bne jump_944
/*0x0868*/      str.w ip, [r6, #4]
/*0x086c*/      b jump_97a
            jump_86e:
/*0x086e*/      cmp r1, #0x1e
/*0x0870*/      beq jump_964
/*0x0872*/      cmp r1, #0x1f
/*0x0874*/      bne jump_944
/*0x0876*/      b jump_99c
            jump_878:
/*0x0878*/      bl call_a00
/*0x087c*/      b jump_984
            jump_87e:
/*0x087e*/      mov.w r3, #0x400
/*0x0882*/      cmp r0, #0x20
/*0x0884*/      blo jump_8a4
/*0x0886*/      sub.w r1, r0, #0x1f
/*0x088a*/      rsb r1, r1, r1, lsl #4
/*0x088e*/      cmp.w r3, r1, lsl #2
/*0x0892*/      blt jump_8a4
/*0x0894*/      rsb r0, r0, r0, lsl #4
/*0x0898*/      mov.w r1, #0x2880
/*0x089c*/      add.w r0, r1, r0, lsl #2
/*0x08a0*/      movs r1, #0x3c
/*0x08a2*/      b jump_97e
            jump_8a4:
/*0x08a4*/      cbz r0, jump_8b0
/*0x08a6*/      cmp r0, #1
/*0x08a8*/      beq jump_8d8
/*0x08aa*/      cmp r0, #2
/*0x08ac*/      bne jump_944
/*0x08ae*/      b jump_8e0
            jump_8b0:
/*0x08b0*/      ldrb r2, [r3]
/*0x08b2*/      mov r0, r3
/*0x08b4*/      cmp r2, #4
/*0x08b6*/      beq jump_8d4
/*0x08b8*/      movs r2, #0x20
/*0x08ba*/      mov r1, r3
/*0x08bc*/      adds r0, r6, #4
/*0x08be*/      bl memcpy
/*0x08c2*/      ldr r0, [pc, #0x138] /* data_9fc */
/*0x08c4*/      ldr.w r1, [r0, #0x180]
/*0x08c8*/      str r1, [r6, #0x24]
/*0x08ca*/      ldr.w r0, [r0, #0x18c]
/*0x08ce*/      movs r1, #0x28
/*0x08d0*/      str r0, [r6, #0x28]
/*0x08d2*/      b jump_97c
            jump_8d4:
/*0x08d4*/      movs r1, #0x34
/*0x08d6*/      b jump_97e
            jump_8d8:
/*0x08d8*/      movs r1, #4
/*0x08da*/      mov.w r0, #0x3c00
/*0x08de*/      b jump_97e
            jump_8e0:
/*0x08e0*/      strb.w ip, [r6, #4]
/*0x08e4*/      movs r1, #1
/*0x08e6*/      b jump_97c
            jump_8e8:
/*0x08e8*/      lsls r1, r3, #0x1e
/*0x08ea*/      bne jump_9e0
/*0x08ec*/      ldr r1, [r6, #8]
/*0x08ee*/      cbz r1, jump_944
/*0x08f0*/      lsls r4, r1, #0x1e
/*0x08f2*/      bne jump_9e0
/*0x08f4*/      add r3, r1
/*0x08f6*/      cmp r3, lr
/*0x08f8*/      bhi jump_9e0
/*0x08fa*/      str r7, [r6, #4]
/*0x08fc*/      cbz r0, jump_908
/*0x08fe*/      cmp r0, #1
/*0x0900*/      beq jump_948
/*0x0902*/      cmp r0, #2
/*0x0904*/      bne jump_9e0
/*0x0906*/      b jump_948
            jump_908:
/*0x0908*/      adds r0, r7, r1
/*0x090a*/      str.w ip, [r6, #8]
/*0x090e*/      strd r7, r0, [r6, #0xc]
/*0x0912*/      mov r0, r7
/*0x0914*/      b jump_932
            jump_916:
/*0x0916*/      b jump_998
            jump_918:
/*0x0918*/      bl call_304
/*0x091c*/      cbnz r0, jump_938
/*0x091e*/      bl call_169c
/*0x0922*/      ldr r0, [r6, #8]
/*0x0924*/      add.w r0, r0, #0x400
/*0x0928*/      str r0, [r6, #8]
/*0x092a*/      ldr r0, [r6, #0xc]
/*0x092c*/      add.w r0, r0, #0x400
/*0x0930*/      str r0, [r6, #0xc]
            jump_932:
/*0x0932*/      ldr r1, [r6, #0x10]
/*0x0934*/      cmp r0, r1
/*0x0936*/      blo jump_918
            jump_938:
/*0x0938*/      ldr r0, [r6, #4]
/*0x093a*/      movs r1, #8
/*0x093c*/      sub.w r0, r0, #0x3000
/*0x0940*/      str r0, [r6, #4]
/*0x0942*/      b jump_97c
            jump_944:
/*0x0944*/      b jump_9e0

/*0x0946*/  .byte 0x0d
/*0x0947*/  .byte 0xe0

            jump_948:
/*0x0948*/      cmp r7, r2
/*0x094a*/      blo jump_9e0
/*0x094c*/      cmp.w r1, #0x1000
/*0x0950*/      blo jump_9e0
/*0x0952*/      cmp r0, #2
/*0x0954*/      beq jump_960
/*0x0956*/      movs r2, #0
            jump_958:
/*0x0958*/      mov r0, r7
/*0x095a*/      bl call_16ec
/*0x095e*/      b jump_978
            jump_960:
/*0x0960*/      movs r2, #1
/*0x0962*/      b jump_958
            jump_964:
/*0x0964*/      cbz r0, jump_974
/*0x0966*/      cmp r0, #1
/*0x0968*/      bne jump_9e0
/*0x096a*/      cmp r3, lr
/*0x096c*/      bhs jump_9e0
/*0x096e*/      lsls r0, r3, #0x1e
/*0x0970*/      bne jump_9e0
/*0x0972*/      str r7, [r5, #4]
            jump_974:
/*0x0974*/      ldr r0, [r5, #4]
/*0x0976*/      b jump_9da
            jump_978:
/*0x0978*/      str r0, [r6, #4]
            jump_97a:
/*0x097a*/      movs r1, #4
            jump_97c:
/*0x097c*/      adds r0, r6, #4
            jump_97e:
/*0x097e*/      bl call_a84
/*0x0982*/      movs r4, #1
            jump_984:
/*0x0984*/      ldrb r0, [r5]
/*0x0986*/      cmp r0, #1
/*0x0988*/      bne jump_998
/*0x098a*/      cbz r4, jump_9e0
/*0x098c*/      movs r1, #0x3c
/*0x098e*/      adds r0, r6, #4
            jump_990:
/*0x0990*/      bl mem_zero
/*0x0994*/      movs r0, #2
/*0x0996*/      strb r0, [r5]
            jump_998:
/*0x0998*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_99c:
/*0x099c*/      cbz r0, jump_9e0
/*0x099e*/      lsls r1, r0, #0x1e
/*0x09a0*/      bne jump_9e0
/*0x09a2*/      cmp r0, #0x3c
/*0x09a4*/      bhi jump_9e0
/*0x09a6*/      ldr r1, [r5, #4]
/*0x09a8*/      adds r3, r0, r1
/*0x09aa*/      cmp.w r3, #0xfc00
/*0x09ae*/      bhi jump_9e0
/*0x09b0*/      cmp r1, r2
/*0x09b2*/      bhs jump_9ba
/*0x09b4*/      cmp r3, r2
/*0x09b6*/      bhi jump_9e0
/*0x09b8*/      b jump_9c2
            jump_9ba:
/*0x09ba*/      mov r1, r0
/*0x09bc*/      adds r0, r6, #4
/*0x09be*/      bl call_7c8
            jump_9c2:
/*0x09c2*/      ldrb r2, [r6, #1]
/*0x09c4*/      adds r1, r6, #4
/*0x09c6*/      ldr r0, [r5, #4]
/*0x09c8*/      bl call_804
/*0x09cc*/      ldrb r0, [r6, #1]
/*0x09ce*/      ldr r1, [r5, #4]
/*0x09d0*/      add r0, r1
/*0x09d2*/      movw r1, #0x21e
/*0x09d6*/      str r0, [r5, #4]
/*0x09d8*/      strh r1, [r6]
            jump_9da:
/*0x09da*/      sub.w r0, r0, #0x3000
/*0x09de*/      b jump_978
            jump_9e0:
/*0x09e0*/      ldr r0, [r6]
/*0x09e2*/      str r0, [r6, #4]
/*0x09e4*/      movw r0, #0xaaff
/*0x09e8*/      str r0, [r6]
/*0x09ea*/      ldr r0, [pc, #0xc] /* data_9f8 */
/*0x09ec*/      movs r1, #0x38
/*0x09ee*/      adds r0, #8
/*0x09f0*/      b jump_990

/*0x09f2*/  .byte 0x00
/*0x09f3*/  .byte 0x00

            data_9f4:
/*0x09f4*/  .word 0x20000004
            data_9f8:
/*0x09f8*/  .word 0x20000084
            data_9fc:
/*0x09fc*/  .word 0x40080000


            .thumb_func
            call_a00:
/*0x0a00*/      push {r4, lr}
/*0x0a02*/      ldr r1, [pc, #0x6c] /* data_a70 */
/*0x0a04*/      cbz r0, jump_a22
/*0x0a06*/      cmp r0, #1
/*0x0a08*/      beq jump_a26
/*0x0a0a*/      cmp r0, #2
/*0x0a0c*/      bne jump_a6e
/*0x0a0e*/      movs r0, #0x35
/*0x0a10*/      bl call_668
/*0x0a14*/      movs r0, #0
/*0x0a16*/      bl call_12e8
/*0x0a1a*/      pop.w {r4, lr}
/*0x0a1e*/      b.w jump_764
            jump_a22:
/*0x0a22*/      ldr r0, [pc, #0x50] /* data_a74 */
/*0x0a24*/      b jump_a2a
            jump_a26:
/*0x0a26*/      ldr r0, [pc, #0x4c] /* data_a74 */
/*0x0a28*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_a2a:
/*0x0a2a*/      str r0, [r1]
/*0x0a2c*/      movs r1, #0
/*0x0a2e*/      mov.w r0, #0x10000
/*0x0a32*/      movs r3, #1
/*0x0a34*/      mov r2, r1
/*0x0a36*/      bl call_2cc
/*0x0a3a*/      ldr r1, [pc, #0x3c] /* data_a78 */
/*0x0a3c*/      mov.w r0, #0x200
/*0x0a40*/      str r0, [r1, #0x24]
/*0x0a42*/      movs r0, #0x35
/*0x0a44*/      bl call_668
/*0x0a48*/      movs r0, #0
/*0x0a4a*/      bl call_12e8
/*0x0a4e*/      movw r0, #0x4e20
/*0x0a52*/      bl call_102
/*0x0a56*/      dsb sy
/*0x0a5a*/      ldr r0, [pc, #0x20] /* data_a7c */
/*0x0a5c*/      ldr r1, [r0]
/*0x0a5e*/      ldr r2, [pc, #0x20] /* data_a80 */
/*0x0a60*/      and r1, r1, #0x700
/*0x0a64*/      orrs r1, r2
/*0x0a66*/      str r1, [r0]
/*0x0a68*/      dsb sy
            jump_a6c:
/*0x0a6c*/      b jump_a6c
            jump_a6e:
/*0x0a6e*/      pop {r4, pc}

            data_a70:
/*0x0a70*/  .word 0x20003ffc
            data_a74:
/*0x0a74*/  .word 0x55aafaf5
            data_a78:
/*0x0a78*/  .word 0x400b0000
            data_a7c:
/*0x0a7c*/  .word 0xe000ed0c
            data_a80:
/*0x0a80*/  .word 0x05fa0004


            .thumb_func
            call_a84:
/*0x0a84*/      push {r4, r5, r6, lr}
/*0x0a86*/      mov r4, r1
/*0x0a88*/      ldr r2, [pc, #0x24] /* data_ab0 */
/*0x0a8a*/      mov r1, r0
/*0x0a8c*/      movs r0, #2
/*0x0a8e*/      strb r0, [r2]
/*0x0a90*/      ldr r0, [pc, #0x20] /* data_ab4 */
/*0x0a92*/      subs r5, r0, #4
/*0x0a94*/      cmp r1, r0
/*0x0a96*/      beq jump_aa0
/*0x0a98*/      mov r2, r4
/*0x0a9a*/      adds r0, r5, #4
/*0x0a9c*/      bl memcpy
            jump_aa0:
/*0x0aa0*/      adds r0, r5, r4
/*0x0aa2*/      rsb.w r1, r4, #0x3c
/*0x0aa6*/      pop.w {r4, r5, r6, lr}
/*0x0aaa*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x0aac*/      b.w mem_zero

            data_ab0:
/*0x0ab0*/  .word 0x20000004
            data_ab4:
/*0x0ab4*/  .word 0x20000088

            jump_ab8:
/*0x0ab8*/      push {r4, r5, r6, r7, lr}
/*0x0aba*/      ldr r7, [pc, #0x28] /* data_ae4 */
/*0x0abc*/      ldr.w r4, [r7, #0x104]
/*0x0ac0*/      ldr.w r5, [r7, #0x108]
/*0x0ac4*/      ldr.w r6, [r7, #0x10c]
/*0x0ac8*/      bics r4, r0
/*0x0aca*/      bics r5, r1
/*0x0acc*/      bics r6, r2
/*0x0ace*/      cbz r3, jump_ad6
/*0x0ad0*/      orrs r4, r0
/*0x0ad2*/      orrs r5, r1
/*0x0ad4*/      orrs r6, r2
            jump_ad6:
/*0x0ad6*/      str.w r4, [r7, #0x104]
/*0x0ada*/      str.w r5, [r7, #0x108]
/*0x0ade*/      str.w r6, [r7, #0x10c]
/*0x0ae2*/      pop {r4, r5, r6, r7, pc}

            data_ae4:
/*0x0ae4*/  .word 0x40088000


            .thumb_func
            call_ae8:
/*0x0ae8*/      ldr r2, [pc, #0x1c] /* data_b08 */
/*0x0aea*/      movs r1, #0
/*0x0aec*/      mov.w r0, #0x1c20
/*0x0af0*/      str.w r1, [r2, #0x108]
            jump_af4:
/*0x0af4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0af6*/      bhs jump_af4
/*0x0af8*/      movs r0, #1
/*0x0afa*/      str.w r0, [r2, #0x108]
/*0x0afe*/      ldr r0, [pc, #0xc] /* data_b0c */
            jump_b00:
/*0x0b00*/      ldr r1, [r0, #8]
/*0x0b02*/      lsls r1, r1, #0x1a
/*0x0b04*/      bpl jump_b00
/*0x0b06*/      bx lr

            data_b08:
/*0x0b08*/  .word 0x42d40000
            data_b0c:
/*0x0b0c*/  .word 0x40088000


            .thumb_func
            call_b10:
/*0x0b10*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0b14*/      movs r7, #0xa
/*0x0b16*/      ldr r5, [pc, #0x58] /* data_b70 */
/*0x0b18*/      b jump_b66
            jump_b1a:
/*0x0b1a*/      ldr r1, [pc, #0x54] /* data_b70 */
/*0x0b1c*/      add.w r0, r7, r7, lsl #1
/*0x0b20*/      add r0, r1
/*0x0b22*/      ldrb r1, [r5, #-0x1]!
/*0x0b26*/      ldrb r0, [r0, #2]
/*0x0b28*/      eors r0, r1
/*0x0b2a*/      movs.w r8, r0
/*0x0b2e*/      beq jump_b66
/*0x0b30*/      movs r4, #0x80
/*0x0b32*/      movs r6, #8
/*0x0b34*/      b jump_b60
            jump_b36:
/*0x0b36*/      tst.w r8, r4
/*0x0b3a*/      beq jump_b5e
/*0x0b3c*/      ldrb r0, [r5]
/*0x0b3e*/      eors r0, r4
/*0x0b40*/      strb r0, [r5]
/*0x0b42*/      tst r0, r4
/*0x0b44*/      bne jump_b4a
/*0x0b46*/      movs r1, #1
/*0x0b48*/      b jump_b4c
            jump_b4a:
/*0x0b4a*/      movs r1, #0
            jump_b4c:
/*0x0b4c*/      add.w r0, r6, r7, lsl #3
/*0x0b50*/      uxtb r0, r0
/*0x0b52*/      bl call_4dc
/*0x0b56*/      cbnz r0, jump_b5e
/*0x0b58*/      ldrb r0, [r5]
/*0x0b5a*/      eors r0, r4
/*0x0b5c*/      strb r0, [r5]
            jump_b5e:
/*0x0b5e*/      lsrs r4, r4, #1
            jump_b60:
/*0x0b60*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x0b62*/      uxtb r6, r6
/*0x0b64*/      bhs jump_b36
            jump_b66:
/*0x0b66*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x0b68*/      uxtb r7, r7
/*0x0b6a*/      bhs jump_b1a
/*0x0b6c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_b70:
/*0x0b70*/  .word 0x200000ce


            .thumb_func
            call_b74:
/*0x0b74*/      push {r4, r5, r6, lr}
/*0x0b76*/      movs r4, #2
/*0x0b78*/      ldr r5, [pc, #0x34] /* data_bb0 */
/*0x0b7a*/      mov.w r6, #0x1f4
            jump_b7e:
/*0x0b7e*/      bl call_17bc
/*0x0b82*/      movs r1, #0xa
/*0x0b84*/      b jump_b8e
            jump_b86:
/*0x0b86*/      add.w r0, r1, r1, lsl #1
/*0x0b8a*/      ldrb r0, [r5, r0]
/*0x0b8c*/      cbnz r0, jump_b94
            jump_b8e:
/*0x0b8e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0b90*/      uxtb r1, r1
/*0x0b92*/      bhs jump_b86
            jump_b94:
/*0x0b94*/      cmp r1, #0xff
/*0x0b96*/      beq jump_b9e
/*0x0b98*/      cmp r4, #0
/*0x0b9a*/      bne jump_b7e
            jump_b9c:
/*0x0b9c*/      pop {r4, r5, r6, pc}
            jump_b9e:
/*0x0b9e*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0ba0*/      ands r4, r4, #0xff
/*0x0ba4*/      beq jump_b9c
/*0x0ba6*/      mov r0, r6
/*0x0ba8*/      bl call_102
/*0x0bac*/      b jump_b7e

/*0x0bae*/  .byte 0x00
/*0x0baf*/  .byte 0x00

            data_bb0:
/*0x0bb0*/  .word 0x200000ce

            jump_bb4:
/*0x0bb4*/      ldr r1, [pc, #0x10] /* data_bc8 */
/*0x0bb6*/      ldrb r0, [r1]
/*0x0bb8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0bba*/      strb r0, [r1]
/*0x0bbc*/      lsls r0, r0, #0x1e
/*0x0bbe*/      bne jump_bc4
/*0x0bc0*/      b.w call_17bc
            jump_bc4:
/*0x0bc4*/      bx lr

/*0x0bc6*/  .byte 0x00
/*0x0bc7*/  .byte 0x00

            data_bc8:
/*0x0bc8*/  .word 0x2000000c


            .thumb_func
            call_bcc:
/*0x0bcc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0bd0*/      movs r6, #0
/*0x0bd2*/      mov r1, r6
/*0x0bd4*/      mov.w r0, #0xf0000
/*0x0bd8*/      movs r3, #1
/*0x0bda*/      mov r2, r6
/*0x0bdc*/      bl call_2cc
/*0x0be0*/      movs r4, #8
/*0x0be2*/      b jump_c14
            jump_be4:
/*0x0be4*/      ldr r0, [pc, #0x90] /* data_c78 */
/*0x0be6*/      movs r2, #0
/*0x0be8*/      add.w r1, r0, r4, lsl #3
/*0x0bec*/      ldrh r5, [r1, #4]
/*0x0bee*/      ldr r0, [r1]
/*0x0bf0*/      uxth r1, r5
/*0x0bf2*/      mov r7, r0
/*0x0bf4*/      bl call_3c0
/*0x0bf8*/      uxth r1, r5
/*0x0bfa*/      mov r0, r7
/*0x0bfc*/      movs r2, #1
/*0x0bfe*/      bl call_3a0
/*0x0c02*/      ldr r0, [pc, #0x74] /* data_c78 */
/*0x0c04*/      adds r0, #0x40
/*0x0c06*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x0c0a*/      add.w r0, r0, r4, lsl #1
/*0x0c0e*/      ldrb r0, [r0, #1]
/*0x0c10*/      bl call_ac
            jump_c14:
/*0x0c14*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0c16*/      uxtb r4, r4
/*0x0c18*/      bhs jump_be4
/*0x0c1a*/      movs r4, #0xa
/*0x0c1c*/      b jump_c46
            jump_c1e:
/*0x0c1e*/      ldr r0, [pc, #0x58] /* data_c78 */
/*0x0c20*/      adds r0, #0x50
/*0x0c22*/      add.w r1, r0, r4, lsl #3
/*0x0c26*/      ldrh r5, [r1, #4]
/*0x0c28*/      ldr r7, [r1]
/*0x0c2a*/      uxth r1, r5
/*0x0c2c*/      mov r0, r7
/*0x0c2e*/      bl call_e0
/*0x0c32*/      uxth r1, r5
/*0x0c34*/      mov r0, r7
/*0x0c36*/      movs r2, #0
/*0x0c38*/      bl call_3b0
/*0x0c3c*/      uxth r1, r5
/*0x0c3e*/      mov r0, r7
/*0x0c40*/      movs r2, #1
/*0x0c42*/      bl call_390
            jump_c46:
/*0x0c46*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0c48*/      uxtb r4, r4
/*0x0c4a*/      bhs jump_c1e
/*0x0c4c*/      movs r2, #0xff
/*0x0c4e*/      movs r1, #0xa
/*0x0c50*/      ldr r0, [pc, #0x28] /* data_c7c */
/*0x0c52*/      bl mem_set
/*0x0c56*/      ldr r0, [pc, #0x24] /* data_c7c */
/*0x0c58*/      movs r1, #0xa
/*0x0c5a*/      adds r0, #0xa
/*0x0c5c*/      movs r2, #0xff
/*0x0c5e*/      b jump_c6c
            jump_c60:
/*0x0c60*/      strb r6, [r0], #1
/*0x0c64*/      strb r2, [r0], #1
/*0x0c68*/      strb r2, [r0], #1
            jump_c6c:
/*0x0c6c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0c6e*/      uxtb r1, r1
/*0x0c70*/      bhs jump_c60
/*0x0c72*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x0c76*/  .byte 0x00
/*0x0c77*/  .byte 0x00

            data_c78:
/*0x0c78*/  .word 0x00002058 /* possible pointer */
            data_c7c:
/*0x0c7c*/  .word 0x200000c4


            .thumb_func
            call_c80:
/*0x0c80*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0c84*/      movs r7, r0
/*0x0c86*/      mov.w r4, #0xa
/*0x0c8a*/      beq jump_c94
/*0x0c8c*/      movs r0, #0
            jump_c8e:
/*0x0c8e*/      mov r8, r0
/*0x0c90*/      ldr r5, [pc, #0x50] /* data_ce4 */
/*0x0c92*/      b jump_cb8
            jump_c94:
/*0x0c94*/      movs r0, #1
/*0x0c96*/      b jump_c8e
            jump_c98:
/*0x0c98*/      add.w r6, r5, r4, lsl #3
/*0x0c9c*/      mov r2, r8
/*0x0c9e*/      ldrh r0, [r6, #4]
/*0x0ca0*/      uxth r1, r0
/*0x0ca2*/      ldr.w r0, [r5, r4, lsl #3]
/*0x0ca6*/      bl call_3e8
/*0x0caa*/      ldrh r0, [r6, #4]
/*0x0cac*/      movs r2, #1
/*0x0cae*/      uxth r1, r0
/*0x0cb0*/      ldr.w r0, [r5, r4, lsl #3]
/*0x0cb4*/      bl call_390
            jump_cb8:
/*0x0cb8*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0cba*/      uxtb r4, r4
/*0x0cbc*/      bhs jump_c98
/*0x0cbe*/      cbz r7, jump_cd2
/*0x0cc0*/      movs r2, #0
            jump_cc2:
/*0x0cc2*/      ldr r4, [pc, #0x24] /* data_ce8 */
/*0x0cc4*/      movs r1, #0x10
/*0x0cc6*/      mov r0, r4
/*0x0cc8*/      bl call_3b0
/*0x0ccc*/      cbz r7, jump_cd6
/*0x0cce*/      movs r2, #1
/*0x0cd0*/      b jump_cd8
            jump_cd2:
/*0x0cd2*/      movs r2, #1
/*0x0cd4*/      b jump_cc2
            jump_cd6:
/*0x0cd6*/      movs r2, #0
            jump_cd8:
/*0x0cd8*/      mov r0, r4
/*0x0cda*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0cde*/      movs r1, #0x10
/*0x0ce0*/      b.w call_3e8

            data_ce4:
/*0x0ce4*/  .word 0x000020a8 /* possible pointer */
            data_ce8:
/*0x0ce8*/  .word 0x400b0000


            .thumb_func
            call_cec:
/*0x0cec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0cf0*/      movs r1, #0
/*0x0cf2*/      mov.w r2, #0x20000
/*0x0cf6*/      mov.w r0, #0x70000
/*0x0cfa*/      movs r3, #1
/*0x0cfc*/      bl call_2cc
/*0x0d00*/      movw r1, #0xea60
/*0x0d04*/      ldr r0, [pc, #0x90] /* data_d98 */
/*0x0d06*/      bl call_38
/*0x0d0a*/      ldr r4, [pc, #0x90] /* data_d9c */
/*0x0d0c*/      movs r1, #2
/*0x0d0e*/      mov r0, r4
/*0x0d10*/      bl call_e0
/*0x0d14*/      movs r2, #0
/*0x0d16*/      movs r1, #2
/*0x0d18*/      mov r0, r4
/*0x0d1a*/      bl call_3b0
/*0x0d1e*/      movs r2, #1
/*0x0d20*/      movs r1, #2
/*0x0d22*/      mov r0, r4
/*0x0d24*/      bl call_390
/*0x0d28*/      movs r1, #4
/*0x0d2a*/      mov r0, r4
/*0x0d2c*/      bl call_e0
/*0x0d30*/      ldr r6, [pc, #0x6c] /* data_da0 */
/*0x0d32*/      mov.w r5, #0x4000
/*0x0d36*/      mov r1, r5
/*0x0d38*/      mov r0, r6
/*0x0d3a*/      bl call_e0
/*0x0d3e*/      lsls r7, r5, #1
/*0x0d40*/      mov r1, r7
/*0x0d42*/      mov r0, r6
/*0x0d44*/      bl call_e0
/*0x0d48*/      movs r2, #0
/*0x0d4a*/      movs r1, #4
/*0x0d4c*/      mov r0, r4
/*0x0d4e*/      bl call_3b0
/*0x0d52*/      movs r2, #0
/*0x0d54*/      mov r1, r5
/*0x0d56*/      mov r0, r6
/*0x0d58*/      bl call_3b0
/*0x0d5c*/      movs r2, #0
/*0x0d5e*/      mov r1, r7
/*0x0d60*/      mov r0, r6
/*0x0d62*/      bl call_3b0
/*0x0d66*/      movs r2, #1
/*0x0d68*/      movs r1, #4
/*0x0d6a*/      mov r0, r4
/*0x0d6c*/      bl call_390
/*0x0d70*/      movs r2, #1
/*0x0d72*/      mov r1, r5
/*0x0d74*/      mov r0, r6
/*0x0d76*/      bl call_390
/*0x0d7a*/      movs r2, #1
/*0x0d7c*/      mov r1, r7
/*0x0d7e*/      mov r0, r6
/*0x0d80*/      bl call_390
/*0x0d84*/      movs r2, #1
/*0x0d86*/      mov r1, r2
/*0x0d88*/      ldr r0, [pc, #0x18] /* data_da4 */
/*0x0d8a*/      bl call_3a0
/*0x0d8e*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0d92*/      b.w jump_1874

/*0x0d96*/  .byte 0x00
/*0x0d97*/  .byte 0x00

            data_d98:
/*0x0d98*/  .word 0x40077000
            data_d9c:
/*0x0d9c*/  .word 0x400b4000
            data_da0:
/*0x0da0*/  .word 0x400b0000
            data_da4:
/*0x0da4*/  .word 0x400b2000

            jump_da8:
/*0x0da8*/      push {r4, r5, r6, lr}
/*0x0daa*/      ldr r4, [pc, #0x84] /* data_e30 */
/*0x0dac*/      movs r1, #0
/*0x0dae*/      mov r0, r4
/*0x0db0*/      bl call_1d8
/*0x0db4*/      movs r1, #0
/*0x0db6*/      mov r0, r4
/*0x0db8*/      bl call_1c4
/*0x0dbc*/      mov r0, r4
/*0x0dbe*/      bl bftm_clear
/*0x0dc2*/      ldr r1, [pc, #0x70] /* data_e34 */
/*0x0dc4*/      asrs r0, r4, #0x14
/*0x0dc6*/      str.w r0, [r1, #0x180]
/*0x0dca*/      movs r1, #0
/*0x0dcc*/      ldr r0, [pc, #0x68] /* data_e38 */
/*0x0dce*/      bl call_444
/*0x0dd2*/      ldr r6, [pc, #0x68] /* data_e3c */
/*0x0dd4*/      movs r0, #2
/*0x0dd6*/      str r0, [r6, #0x24]
/*0x0dd8*/      ldr r4, [pc, #0x64] /* data_e40 */
/*0x0dda*/      movs r5, #8
/*0x0ddc*/      b jump_e04
            jump_dde:
/*0x0dde*/      ldrh r0, [r4, #4]
/*0x0de0*/      movs r2, #0
/*0x0de2*/      uxth r1, r0
/*0x0de4*/      ldr r0, [r4]
/*0x0de6*/      bl call_390
/*0x0dea*/      ldrh r0, [r4, #4]
/*0x0dec*/      movs r2, #1
/*0x0dee*/      uxth r1, r0
/*0x0df0*/      ldr r0, [r4]
/*0x0df2*/      bl call_3a0
/*0x0df6*/      ldrh r0, [r4, #4]
/*0x0df8*/      movs r2, #2
/*0x0dfa*/      uxth r1, r0
/*0x0dfc*/      ldr r0, [r4]
/*0x0dfe*/      bl call_3c0
/*0x0e02*/      adds r4, #8
            jump_e04:
/*0x0e04*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0e06*/      uxtb r5, r5
/*0x0e08*/      bhs jump_dde
/*0x0e0a*/      movs r2, #1
/*0x0e0c*/      movs r1, #4
/*0x0e0e*/      mov r0, r6
/*0x0e10*/      bl call_3b0
/*0x0e14*/      ldr r4, [pc, #0x2c] /* data_e44 */
/*0x0e16*/      movs r2, #1
/*0x0e18*/      lsls r1, r2, #0xe
/*0x0e1a*/      mov r0, r4
/*0x0e1c*/      bl call_3b0
/*0x0e20*/      mov r0, r4
/*0x0e22*/      pop.w {r4, r5, r6, lr}
/*0x0e26*/      movs r2, #1
/*0x0e28*/      lsls r1, r2, #0xf
/*0x0e2a*/      b.w call_3b0

/*0x0e2e*/  .byte 0x00
/*0x0e2f*/  .byte 0x00

            data_e30:
/*0x0e30*/  .word 0x40077000
            data_e34:
/*0x0e34*/  .word 0xe000e004
            data_e38:
/*0x0e38*/  .word 0x4006f000
            data_e3c:
/*0x0e3c*/  .word 0x400b4000
            data_e40:
/*0x0e40*/  .word 0x000020f8 /* possible pointer */
            data_e44:
/*0x0e44*/  .word 0x400b0000


            .thumb_func
            call_e48:
/*0x0e48*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0e4c*/      ldr r4, [pc, #0xcc] /* data_f1c */
/*0x0e4e*/      movs r5, #8
/*0x0e50*/      b jump_e76
            jump_e52:
/*0x0e52*/      ldrh r0, [r4, #4]
/*0x0e54*/      uxth r1, r0
/*0x0e56*/      ldr r0, [r4]
/*0x0e58*/      bl call_e0
/*0x0e5c*/      ldrh r0, [r4, #4]
/*0x0e5e*/      movs r2, #1
/*0x0e60*/      uxth r1, r0
/*0x0e62*/      ldr r0, [r4]
/*0x0e64*/      bl call_3b0
/*0x0e68*/      ldrh r0, [r4, #4]
/*0x0e6a*/      movs r2, #1
/*0x0e6c*/      uxth r1, r0
/*0x0e6e*/      ldr r0, [r4]
/*0x0e70*/      bl call_390
/*0x0e74*/      adds r4, #8
            jump_e76:
/*0x0e76*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0e78*/      uxtb r5, r5
/*0x0e7a*/      bhs jump_e52
/*0x0e7c*/      ldr r5, [pc, #0xa0] /* data_f20 */
/*0x0e7e*/      movs r1, #4
/*0x0e80*/      mov r0, r5
/*0x0e82*/      bl call_e0
/*0x0e86*/      ldr r6, [pc, #0x9c] /* data_f24 */
/*0x0e88*/      mov.w r7, #0x4000
/*0x0e8c*/      mov r1, r7
/*0x0e8e*/      mov r0, r6
/*0x0e90*/      bl call_e0
/*0x0e94*/      lsls r4, r7, #1
/*0x0e96*/      mov r1, r4
/*0x0e98*/      mov r0, r6
/*0x0e9a*/      bl call_e0
/*0x0e9e*/      movs r2, #0
/*0x0ea0*/      movs r1, #4
/*0x0ea2*/      mov r0, r5
/*0x0ea4*/      bl call_3b0
/*0x0ea8*/      movs r2, #0
/*0x0eaa*/      mov r1, r7
/*0x0eac*/      mov r0, r6
/*0x0eae*/      bl call_3b0
/*0x0eb2*/      movs r2, #0
/*0x0eb4*/      mov r1, r4
/*0x0eb6*/      mov r0, r6
/*0x0eb8*/      bl call_3b0
/*0x0ebc*/      movw r0, #0x2710
/*0x0ec0*/      bl call_102
/*0x0ec4*/      movs r0, #2
/*0x0ec6*/      str r0, [r5, #0x28]
/*0x0ec8*/      lsls r1, r0, #8
/*0x0eca*/      ldr r0, [pc, #0x5c] /* data_f28 */
/*0x0ecc*/      bl mem_zero
/*0x0ed0*/      ldr r1, [pc, #0x58] /* data_f2c */
/*0x0ed2*/      movs r0, #0
/*0x0ed4*/      strb r0, [r1, #1]
/*0x0ed6*/      movs r0, #0x64
/*0x0ed8*/      bl call_102
/*0x0edc*/      bl call_f84
/*0x0ee0*/      movs r0, #2
/*0x0ee2*/      bl call_18c8
/*0x0ee6*/      str r4, [r6, #0x24]
/*0x0ee8*/      movs r1, #1
/*0x0eea*/      ldr r0, [pc, #0x44] /* data_f30 */
/*0x0eec*/      bl call_444
/*0x0ef0*/      ldr r4, [pc, #0x40] /* data_f34 */
/*0x0ef2*/      movs r1, #0
/*0x0ef4*/      mov r0, r4
/*0x0ef6*/      bl bftm_set_counter
/*0x0efa*/      mov r0, r4
/*0x0efc*/      bl bftm_clear
/*0x0f00*/      movs r1, #1
/*0x0f02*/      mov r0, r4
/*0x0f04*/      bl call_1c4
/*0x0f08*/      movs r1, #1
/*0x0f0a*/      mov r0, r4
/*0x0f0c*/      bl call_1d8
/*0x0f10*/      ldr r1, [pc, #0x24] /* data_f38 */
/*0x0f12*/      asrs r0, r4, #0x14
/*0x0f14*/      str.w r0, [r1, #0x100]
/*0x0f18*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_f1c:
/*0x0f1c*/  .word 0x000020f8 /* possible pointer */
            data_f20:
/*0x0f20*/  .word 0x400b4000
            data_f24:
/*0x0f24*/  .word 0x400b0000
            data_f28:
/*0x0f28*/  .word 0x200000ec
            data_f2c:
/*0x0f2c*/  .word 0x20000010
            data_f30:
/*0x0f30*/  .word 0x4006f000
            data_f34:
/*0x0f34*/  .word 0x40077000
            data_f38:
/*0x0f38*/  .word 0xe000e004


            .thumb_func
            call_f3c:
/*0x0f3c*/      push {r4, r5, lr}
/*0x0f3e*/      movs r0, #0x12
/*0x0f40*/      bl call_18c8
/*0x0f44*/      movs r1, #0xa
/*0x0f46*/      mov.w r0, #0x300
/*0x0f4a*/      bl call_18f8
/*0x0f4e*/      movs r1, #2
/*0x0f50*/      movs r0, #0
/*0x0f52*/      bl call_18f8
/*0x0f56*/      ldr r4, [pc, #0x24] /* data_f7c */
/*0x0f58*/      mov.w r0, #0x4000
/*0x0f5c*/      str r0, [r4, #0x28]
/*0x0f5e*/      lsls r5, r0, #1
/*0x0f60*/      str r5, [r4, #0x24]
/*0x0f62*/      movs r1, #8
/*0x0f64*/      mov.w r0, #0xc00
/*0x0f68*/      bl call_18f8
/*0x0f6c*/      ldr r1, [pc, #0x10] /* data_f80 */
/*0x0f6e*/      movs r0, #4
/*0x0f70*/      str r0, [r1, #0x24]
/*0x0f72*/      str r5, [r4, #0x28]
/*0x0f74*/      nop 
/*0x0f76*/      nop 
/*0x0f78*/      str r5, [r4, #0x24]
/*0x0f7a*/      pop {r4, r5, pc}

            data_f7c:
/*0x0f7c*/  .word 0x400b0000
            data_f80:
/*0x0f80*/  .word 0x400b4000


            .thumb_func
            call_f84:
/*0x0f84*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x0f88*/      ldr r1, [pc, #0x78] /* data_1004 */
/*0x0f8a*/      ldr r0, [pc, #0x74] /* data_1000 */
/*0x0f8c*/      movs r5, #0x10
/*0x0f8e*/      ldrb r2, [r1, #1]
/*0x0f90*/      movs r7, #4
/*0x0f92*/      add.w r4, r0, r2, lsl #6
/*0x0f96*/      ldrb r0, [r1]
/*0x0f98*/      ldr.w sl, [pc, #0x6c] /* data_1008 */
/*0x0f9c*/      ldr r6, [pc, #0x6c] /* data_100c */
/*0x0f9e*/      mov.w fp, #0x4000
/*0x0fa2*/      adds r4, #0x3e
/*0x0fa4*/      cbz r0, jump_fb4
/*0x0fa6*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0fa8*/      ands r0, r0, #0xff
/*0x0fac*/      strb r0, [r1]
/*0x0fae*/      bne jump_fb4
/*0x0fb0*/      bl call_f3c
            jump_fb4:
/*0x0fb4*/      mov sb, r7
            jump_fb6:
/*0x0fb6*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0fb8*/      uxtb r5, r5
/*0x0fba*/      blo jump_ff6
/*0x0fbc*/      mov.w r8, #0x8000
/*0x0fc0*/      str.w r8, [r6, #0x28]
/*0x0fc4*/      ldrh r0, [r4]
/*0x0fc6*/      subs r7, r4, #2
/*0x0fc8*/      movs r1, #0xa
/*0x0fca*/      bl call_18f8
/*0x0fce*/      ldrh r0, [r7]
/*0x0fd0*/      movs r1, #9
/*0x0fd2*/      ubfx r7, r0, #6, #1
/*0x0fd6*/      .short 0x1f24 /* subs r4, r4, #4 */ 
/*0x0fd8*/      bl call_18f8
/*0x0fdc*/      mov r0, fp
/*0x0fde*/      str.w fp, [r6, #0x28]
/*0x0fe2*/      str.w r8, [r6, #0x24]
/*0x0fe6*/      mov r1, sb
/*0x0fe8*/      mov r2, sl
/*0x0fea*/      cbz r7, jump_ff0
/*0x0fec*/      str r1, [r2, #0x24]
/*0x0fee*/      b jump_ff2
            jump_ff0:
/*0x0ff0*/      str r1, [r2, #0x28]
            jump_ff2:
/*0x0ff2*/      str r0, [r6, #0x24]
/*0x0ff4*/      b jump_fb6
            jump_ff6:
/*0x0ff6*/      str.w sb, [sl, #0x24]
/*0x0ffa*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

/*0x0ffe*/  .byte 0x00
/*0x0fff*/  .byte 0x00

            data_1000:
/*0x1000*/  .word 0x200000ec
            data_1004:
/*0x1004*/  .word 0x20000010
            data_1008:
/*0x1008*/  .word 0x400b4000
            data_100c:
/*0x100c*/  .word 0x400b0000


            .thumb_func
            call_1010:
/*0x1010*/      ldr r0, [pc, #0x50] /* data_1064 */
/*0x1012*/      movs r1, #1
/*0x1014*/      str.w r1, [r0, #0x300]
/*0x1018*/      ldr r2, [pc, #0x4c] /* data_1068 */
/*0x101a*/      str.w r1, [r2, #0xa8]
            jump_101e:
/*0x101e*/      ldr.w r3, [r2, #0x108]
/*0x1022*/      cmp r3, #0
/*0x1024*/      beq jump_101e
/*0x1026*/      movs r3, #0
/*0x1028*/      str r3, [r2, #0x20]
/*0x102a*/      mov.w r3, #0x9000000
/*0x102e*/      str r3, [r0, #0x18]
/*0x1030*/      str.w r1, [r2, #0xa4]
            jump_1034:
/*0x1034*/      ldr.w r3, [r2, #0x104]
/*0x1038*/      cmp r3, #0
/*0x103a*/      beq jump_1034
/*0x103c*/      ldr r2, [pc, #0x2c] /* data_106c */
/*0x103e*/      ldr.w r3, [r2, #0x200]
/*0x1042*/      bic r3, r3, #7
/*0x1046*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x1048*/      str.w r3, [r2, #0x200]
/*0x104c*/      str r1, [r0, #0x20]
/*0x104e*/      ldr r2, [r0, #4]
/*0x1050*/      bic r2, r2, #3
/*0x1054*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1056*/      str r2, [r0, #4]
            jump_1058:
/*0x1058*/      ldr r2, [r0, #0x34]
/*0x105a*/      cmp.w r1, r2, lsr #30
/*0x105e*/      bne jump_1058
/*0x1060*/      bx lr

/*0x1062*/  .byte 0x00
/*0x1063*/  .byte 0x00

            data_1064:
/*0x1064*/  .word 0x40088000
            data_1068:
/*0x1068*/  .word 0x43100000
            data_106c:
/*0x106c*/  .word 0x40080000


            .thumb_func
            call_1070:
/*0x1070*/      ldr r0, [pc, #0x10] /* data_1084 */
/*0x1072*/      movs r1, #0
/*0x1074*/      add.w r2, r0, #8
/*0x1078*/      str r1, [r0, #0x1c]
/*0x107a*/      str r1, [r0, #0x20]
/*0x107c*/      strb r1, [r2, #1]
/*0x107e*/      str.w r1, [r0, #0x15]
/*0x1082*/      bx lr

            data_1084:
/*0x1084*/  .word 0x2000001c


            .thumb_func
            call_1088:
/*0x1088*/      ldr r0, [pc, #0x18] /* data_10a4 */
/*0x108a*/      push {lr}
/*0x108c*/      ldr r1, [pc, #0x14] /* data_10a4 */
/*0x108e*/      movs r3, #1
/*0x1090*/      strb r3, [r0]
/*0x1092*/      adds r1, #0xc
/*0x1094*/      movs r0, #2
/*0x1096*/      strb r0, [r1]
/*0x1098*/      bl call_1070
/*0x109c*/      ldr r0, [pc, #4] /* data_10a4 */
/*0x109e*/      subs r0, #8
/*0x10a0*/      strb r3, [r0, #4]
/*0x10a2*/      pop {pc}

            data_10a4:
/*0x10a4*/  .word 0x20000024


            .thumb_func
            call_10a8:
/*0x10a8*/      ldrb.w r0, [r0, #0x34]
/*0x10ac*/      ubfx r0, r0, #1, #1
/*0x10b0*/      bx lr

/*0x10b2*/  .byte 0x00
/*0x10b3*/  .byte 0x00

            jump_10b4:
/*0x10b4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x10b8*/      mov r4, r0
/*0x10ba*/      bl call_14f8
/*0x10be*/      mov r5, r0
/*0x10c0*/      ldr r6, [pc, #0x158] /* data_121c */
/*0x10c2*/      lsls r0, r0, #0x1e
/*0x10c4*/      bpl jump_10d2
/*0x10c6*/      ldr r0, [r6, #4]
/*0x10c8*/      cbz r0, jump_10cc
/*0x10ca*/      blx r0
            jump_10cc:
/*0x10cc*/      movs r0, #2
/*0x10ce*/      bl call_1254
            jump_10d2:
/*0x10d2*/      lsls r0, r5, #0x1b
/*0x10d4*/      bpl jump_10f6
/*0x10d6*/      movs r0, #0x10
/*0x10d8*/      bl call_1254
/*0x10dc*/      ldrb.w r0, [r4, #0x32]
/*0x10e0*/      cmp r0, #2
/*0x10e2*/      blo jump_10f6
/*0x10e4*/      bl call_1508
/*0x10e8*/      ldrb.w r0, [r4, #0x32]
/*0x10ec*/      strb.w r0, [r4, #0x33]
/*0x10f0*/      movs r0, #3
/*0x10f2*/      strb.w r0, [r4, #0x32]
            jump_10f6:
/*0x10f6*/      lsls r0, r5, #0x1d
/*0x10f8*/      mov.w r7, #0
/*0x10fc*/      bpl jump_1142
/*0x10fe*/      subs r0, r7, #1
/*0x1100*/      str r0, [r4, #0x20]
/*0x1102*/      strb.w r7, [r4, #0x30]
/*0x1106*/      strb.w r7, [r4, #0x31]
/*0x110a*/      ldrb.w r0, [r4, #0x34]
/*0x110e*/      bic r0, r0, #2
/*0x1112*/      strb.w r0, [r4, #0x34]
/*0x1116*/      movs r0, #4
/*0x1118*/      strb.w r0, [r4, #0x32]
/*0x111c*/      str r7, [r4, #0x38]
/*0x111e*/      bl call_1304
/*0x1122*/      bl call_1518
/*0x1126*/      ldr r1, [pc, #0xf8] /* data_1220 */
/*0x1128*/      movs r0, #0
/*0x112a*/      bl call_13c0
/*0x112e*/      ldr r0, [pc, #0xf0] /* data_1220 */
/*0x1130*/      ldr r0, [r0]
/*0x1132*/      bl call_14c8
/*0x1136*/      ldr r0, [r6]
/*0x1138*/      cbz r0, jump_113c
/*0x113a*/      blx r0
            jump_113c:
/*0x113c*/      movs r0, #4
/*0x113e*/      bl call_1254
            jump_1142:
/*0x1142*/      lsls r0, r5, #0x1c
/*0x1144*/      bpl jump_1158
/*0x1146*/      bl call_1518
/*0x114a*/      ldrb.w r0, [r4, #0x33]
/*0x114e*/      strb.w r0, [r4, #0x32]
/*0x1152*/      movs r0, #8
/*0x1154*/      bl call_1254
            jump_1158:
/*0x1158*/      lsls r0, r5, #0x17
/*0x115a*/      mov.w r8, #0x100
/*0x115e*/      bpl jump_11dc
/*0x1160*/      movs r0, #0
/*0x1162*/      bl call_13a0
/*0x1166*/      mov r5, r0
/*0x1168*/      lsls r0, r0, #0x16
/*0x116a*/      bpl jump_1182
/*0x116c*/      mov r0, r4
/*0x116e*/      bl call_1638
/*0x1172*/      mov r0, r4
/*0x1174*/      bl call_1bc4
/*0x1178*/      mov.w r1, #0x200
/*0x117c*/      movs r0, #0
/*0x117e*/      bl call_1330
            jump_1182:
/*0x1182*/      lsls r0, r5, #0x1e
/*0x1184*/      bpl jump_11c4
/*0x1186*/      movs r1, #2
/*0x1188*/      movs r0, #0
/*0x118a*/      bl call_1330
/*0x118e*/      ldr r0, [r4, #0x20]
/*0x1190*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1192*/      beq jump_11c4
/*0x1194*/      ldrb.w r0, [r4, #0x24]
/*0x1198*/      cmp r0, #2
/*0x119a*/      bne jump_11c4
/*0x119c*/      movs r2, #0x40
/*0x119e*/      movs r0, #0
/*0x11a0*/      ldr r1, [r4, #0x1c]
/*0x11a2*/      bl call_1420
/*0x11a6*/      ldr r1, [r4, #0x1c]
/*0x11a8*/      add r1, r0
/*0x11aa*/      str r1, [r4, #0x1c]
/*0x11ac*/      ldr r1, [r4, #0x20]
/*0x11ae*/      subs r0, r1, r0
/*0x11b0*/      str r0, [r4, #0x20]
/*0x11b2*/      bne jump_11c4
/*0x11b4*/      movs r0, #1
/*0x11b6*/      strb.w r0, [r4, #0x24]
/*0x11ba*/      ldr r1, [r4, #0x28]
/*0x11bc*/      cbz r1, jump_11c4
/*0x11be*/      ldr r0, [r4, #0x2c]
/*0x11c0*/      blx r1
/*0x11c2*/      str r7, [r4, #0x28]
            jump_11c4:
/*0x11c4*/      lsls r0, r5, #0x1b
/*0x11c6*/      bpl jump_11d6
/*0x11c8*/      mov r0, r4
/*0x11ca*/      bl call_1b80
/*0x11ce*/      movs r1, #0x10
/*0x11d0*/      movs r0, #0
/*0x11d2*/      bl call_1330
            jump_11d6:
/*0x11d6*/      mov r0, r8
/*0x11d8*/      bl call_1254
            jump_11dc:
/*0x11dc*/      mov r4, r8
            jump_11de:
/*0x11de*/      bl call_14f8
/*0x11e2*/      bl call_14d8
/*0x11e6*/      mov r5, r0
/*0x11e8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x11ea*/      beq jump_1216
/*0x11ec*/      mov r0, r5
/*0x11ee*/      bl call_13a0
/*0x11f2*/      tst.w r0, #0x12
/*0x11f6*/      beq jump_11de
/*0x11f8*/      movs r1, #0x12
/*0x11fa*/      mov r0, r5
/*0x11fc*/      bl call_1330
/*0x1200*/      lsl.w r0, r4, r5
/*0x1204*/      bl call_1254
/*0x1208*/      ldr r0, [r6, #0x18]
/*0x120a*/      cmp r0, #0
/*0x120c*/      beq jump_11de
/*0x120e*/      mov r1, r0
/*0x1210*/      mov r0, r5
/*0x1212*/      blx r1
/*0x1214*/      b jump_11de
            jump_1216:
/*0x1216*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x121a*/  .byte 0x00
/*0x121b*/  .byte 0x00

            data_121c:
/*0x121c*/  .word 0x00002298 /* possible pointer */
            data_1220:
/*0x1220*/  .word 0x20000040


            .thumb_func
            call_1224:
/*0x1224*/      movs r1, #2
/*0x1226*/      strb.w r1, [r0, #0x32]
/*0x122a*/      ldr r0, [pc, #4] /* data_1230 */
/*0x122c*/      b.w jump_110

            data_1230:
/*0x1230*/  .word 0x20000040


            .thumb_func
            call_1234:
/*0x1234*/      ldrb.w r0, [r0, #0x32]
/*0x1238*/      cmp r0, #3
/*0x123a*/      beq jump_1240
/*0x123c*/      movs r0, #0
/*0x123e*/      bx lr
            jump_1240:
/*0x1240*/      movs r0, #1
/*0x1242*/      bx lr

            .thumb_func
            call_1244:
/*0x1244*/      push {r4, lr}
/*0x1246*/      bl call_1518
/*0x124a*/      pop.w {r4, lr}
/*0x124e*/      b.w jump_1648

/*0x1252*/  .byte 0x00
/*0x1253*/  .byte 0x00


            .thumb_func
            call_1254:
/*0x1254*/      ldr r1, [pc, #4] /* data_125c */
/*0x1256*/      str r0, [r1, #8]
/*0x1258*/      bx lr

/*0x125a*/  .byte 0x00
/*0x125b*/  .byte 0x00

            data_125c:
/*0x125c*/  .word 0x400a8000


            .thumb_func
            call_1260:
/*0x1260*/      push {r4, lr}
/*0x1262*/      movs r1, #0
/*0x1264*/      mov.w r0, #0x400
/*0x1268*/      movs r2, #0x40
/*0x126a*/      movs r3, #1
/*0x126c*/      bl call_2cc
/*0x1270*/      movs r0, #2
/*0x1272*/      bl call_2f0
/*0x1276*/      ldr r4, [pc, #0x48] /* data_12c0 */
/*0x1278*/      ldr r0, [pc, #0x40] /* data_12bc */
/*0x127a*/      str r0, [r4, #8]
/*0x127c*/      subs r0, #0x5c
/*0x127e*/      str r0, [r4, #0xc]
/*0x1280*/      subs r0, #0xd4
/*0x1282*/      str r0, [r4, #0x10]
/*0x1284*/      movs r0, #2
/*0x1286*/      str r0, [r4, #0x14]
/*0x1288*/      bl call_1088
/*0x128c*/      mov r0, r4
/*0x128e*/      bl call_1224
/*0x1292*/      ldr r1, [pc, #0x30] /* data_12c4 */
/*0x1294*/      mov.w r0, #0x200000
/*0x1298*/      str.w r0, [r1, #0x100]
/*0x129c*/      movs r0, #1
/*0x129e*/      bl call_12e8
/*0x12a2*/      movs r0, #0xfa
/*0x12a4*/      bl call_102
/*0x12a8*/      ldrb.w r0, [r4, #0x34]
/*0x12ac*/      pop.w {r4, lr}
/*0x12b0*/      and r1, r0, #1
/*0x12b4*/      ldr r0, [pc, #0x10] /* data_12c8 */
/*0x12b6*/      b.w jump_1528

/*0x12ba*/  .byte 0x00
/*0x12bb*/  .byte 0x00

            data_12bc:
/*0x12bc*/  .word 0x00002268 /* possible pointer */
            data_12c0:
/*0x12c0*/  .word 0x20000304
            data_12c4:
/*0x12c4*/  .word 0xe000e004
            data_12c8:
/*0x12c8*/  .word 0x20000040


            .thumb_func
            call_12cc:
/*0x12cc*/      ldr r1, [pc, #0x14] /* data_12e4 */
/*0x12ce*/      cmp r0, #1
/*0x12d0*/      ldr r0, [r1]
/*0x12d2*/      beq jump_12dc
/*0x12d4*/      bic r0, r0, #0x800
            jump_12d8:
/*0x12d8*/      str r0, [r1]
/*0x12da*/      bx lr
            jump_12dc:
/*0x12dc*/      orr r0, r0, #0x800
/*0x12e0*/      b jump_12d8

/*0x12e2*/  .byte 0x00
/*0x12e3*/  .byte 0x00

            data_12e4:
/*0x12e4*/  .word 0x400a8000


            .thumb_func
            call_12e8:
/*0x12e8*/      ldr r1, [pc, #0x14] /* data_1300 */
/*0x12ea*/      cmp r0, #1
/*0x12ec*/      ldr r0, [r1]
/*0x12ee*/      beq jump_12f8
/*0x12f0*/      bic r0, r0, #0x400
            jump_12f4:
/*0x12f4*/      str r0, [r1]
/*0x12f6*/      bx lr
            jump_12f8:
/*0x12f8*/      orr r0, r0, #0x400
/*0x12fc*/      b jump_12f4

/*0x12fe*/  .byte 0x00
/*0x12ff*/  .byte 0x00

            data_1300:
/*0x1300*/  .word 0x400a8000


            .thumb_func
            call_1304:
/*0x1304*/      movs r1, #0
/*0x1306*/      movs r0, #0x20
/*0x1308*/      movs r3, #1
/*0x130a*/      mov r2, r1
/*0x130c*/      b.w jump_ab8

            .thumb_func
            call_1310:
/*0x1310*/      push {r4, lr}
/*0x1312*/      bl call_1de8
/*0x1316*/      ldr r1, [r0]
/*0x1318*/      and r1, r1, #9
/*0x131c*/      str r1, [r0]
/*0x131e*/      pop {r4, pc}

            .thumb_func
            call_1320:
/*0x1320*/      push {r4, lr}
/*0x1322*/      bl call_1de8
/*0x1326*/      ldr r1, [r0]
/*0x1328*/      and r1, r1, #0x24
/*0x132c*/      str r1, [r0]
/*0x132e*/      pop {r4, pc}

            .thumb_func
            call_1330:
/*0x1330*/      push {r4, lr}
/*0x1332*/      mov r4, r1
/*0x1334*/      bl call_1de8
/*0x1338*/      str r4, [r0, #8]
/*0x133a*/      pop {r4, pc}

            .thumb_func
            call_133c:
/*0x133c*/      push {r4, lr}
/*0x133e*/      bl call_1de8
/*0x1342*/      ldr r0, [r0, #0x10]
/*0x1344*/      ldr r1, [pc, #8] /* data_1350 */
/*0x1346*/      ubfx r0, r0, #0, #0xa
/*0x134a*/      add r0, r1
/*0x134c*/      pop {r4, pc}

/*0x134e*/  .byte 0x00
/*0x134f*/  .byte 0x00

            data_1350:
/*0x1350*/  .word 0x400aa000


            .thumb_func
            call_1354:
/*0x1354*/      push {r4, r5, r6, lr}
/*0x1356*/      mov r5, r0
/*0x1358*/      bl call_1de8
/*0x135c*/      mov r4, r0
/*0x135e*/      mov r0, r5
/*0x1360*/      bl call_1378
/*0x1364*/      ldr r1, [r4, #0x10]
/*0x1366*/      ubfx r1, r1, #0, #0xa
/*0x136a*/      add r0, r1
/*0x136c*/      ldr r1, [pc, #4] /* data_1374 */
/*0x136e*/      add r0, r1
/*0x1370*/      pop {r4, r5, r6, pc}

/*0x1372*/  .byte 0x00
/*0x1373*/  .byte 0x00

            data_1374:
/*0x1374*/  .word 0x400aa000


            .thumb_func
            call_1378:
/*0x1378*/      push {r4, lr}
/*0x137a*/      bl call_1de8
/*0x137e*/      ldr r0, [r0, #0x10]
/*0x1380*/      ubfx r0, r0, #0xa, #0xa
/*0x1384*/      pop {r4, pc}

            .thumb_func
            call_1386:
/*0x1386*/      push {r4, lr}
/*0x1388*/      bl call_1de8
/*0x138c*/      ldr r1, [r0, #0x10]
/*0x138e*/      ldr r0, [r0]
/*0x1390*/      lsls r1, r1, #3
/*0x1392*/      bpl jump_139a
/*0x1394*/      ubfx r0, r0, #2, #1
/*0x1398*/      pop {r4, pc}
            jump_139a:
/*0x139a*/      ubfx r0, r0, #5, #1
/*0x139e*/      pop {r4, pc}

            .thumb_func
            call_13a0:
/*0x13a0*/      push {r4, lr}
/*0x13a2*/      bl call_1de8
/*0x13a6*/      ldr r1, [r0, #4]
/*0x13a8*/      ldr r0, [r0, #8]
/*0x13aa*/      ands r0, r1
/*0x13ac*/      pop {r4, pc}

            .thumb_func
            call_13ae:
/*0x13ae*/      push {r4, lr}
/*0x13b0*/      mov r4, r1
/*0x13b2*/      bl call_1de8
/*0x13b6*/      ldr r0, [r0, #0xc]
/*0x13b8*/      lsrs r0, r4
/*0x13ba*/      ubfx r0, r0, #0, #9
/*0x13be*/      pop {r4, pc}

            .thumb_func
            call_13c0:
/*0x13c0*/      push {r4, r5, r6, lr}
/*0x13c2*/      mov r4, r1
/*0x13c4*/      mov r5, r0
/*0x13c6*/      bl call_1de8
/*0x13ca*/      add.w r1, r4, r5, lsl #3
/*0x13ce*/      ldr r2, [r1, #4]
/*0x13d0*/      str r2, [r0, #0x10]
/*0x13d2*/      ldr r1, [r1, #8]
/*0x13d4*/      str r1, [r0, #4]
/*0x13d6*/      mov.w r1, #-1
/*0x13da*/      str r1, [r0, #8]
/*0x13dc*/      mov r0, r5
/*0x13de*/      pop.w {r4, r5, r6, lr}
/*0x13e2*/      b.w jump_1450

            .thumb_func
            call_13e6:
/*0x13e6*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x13ea*/      mov r6, r2
/*0x13ec*/      mov r7, r1
/*0x13ee*/      movs r5, r0
/*0x13f0*/      beq jump_1416
/*0x13f2*/      movs r1, #0
            jump_13f4:
/*0x13f4*/      bl call_13ae
/*0x13f8*/      mov r4, r0
/*0x13fa*/      cmp r0, r6
/*0x13fc*/      bhi jump_1410
/*0x13fe*/      mov r0, r5
/*0x1400*/      cbz r5, jump_141a
/*0x1402*/      bl call_133c
            jump_1406:
/*0x1406*/      adds r1, r4, #3
/*0x1408*/      lsrs r2, r1, #2
/*0x140a*/      mov r1, r7
/*0x140c*/      bl call_1dd8
            jump_1410:
/*0x1410*/      mov r0, r4
/*0x1412*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_1416:
/*0x1416*/      movs r1, #0x10
/*0x1418*/      b jump_13f4
            jump_141a:
/*0x141a*/      bl call_1354
/*0x141e*/      b jump_1406

            .thumb_func
            call_1420:
/*0x1420*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1424*/      mov r5, r2
/*0x1426*/      mov r6, r1
/*0x1428*/      mov r7, r0
/*0x142a*/      bl call_1de8
/*0x142e*/      mov r4, r0
/*0x1430*/      movs r0, #0
/*0x1432*/      cbz r5, jump_1444
/*0x1434*/      mov r2, r5
/*0x1436*/      mov r1, r6
/*0x1438*/      mov r0, r7
/*0x143a*/      bl call_13e6
/*0x143e*/      cbnz r0, jump_1444
/*0x1440*/      cmp r5, #0
/*0x1442*/      bne jump_144c
            jump_1444:
/*0x1444*/      ldr r1, [r4]
/*0x1446*/      and r1, r1, #0x10
/*0x144a*/      str r1, [r4]
            jump_144c:
/*0x144c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_1450:
/*0x1450*/      push {r4, lr}
/*0x1452*/      bl call_1de8
/*0x1456*/      ldr r1, [r0]
/*0x1458*/      and r1, r1, #0x19
/*0x145c*/      str r1, [r0]
/*0x145e*/      pop {r4, pc}
            jump_1460:
/*0x1460*/      push {r4, lr}
/*0x1462*/      bl call_1de8
/*0x1466*/      movs r1, #4
/*0x1468*/      str r1, [r0]
/*0x146a*/      pop {r4, pc}

            .thumb_func
            call_146c:
/*0x146c*/      push {r4, lr}
/*0x146e*/      bl call_1de8
/*0x1472*/      movs r1, #0x40
/*0x1474*/      str r1, [r0, #8]
/*0x1476*/      ldr r2, [r0]
/*0x1478*/      movs r1, #0x24
/*0x147a*/      bics r1, r2
/*0x147c*/      str r1, [r0]
/*0x147e*/      pop {r4, pc}

            .thumb_func
            call_1480:
/*0x1480*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1484*/      mov r4, r2
/*0x1486*/      mov r8, r1
/*0x1488*/      mov r7, r0
/*0x148a*/      bl call_1378
/*0x148e*/      mov r6, r0
/*0x1490*/      mov r0, r7
/*0x1492*/      bl call_1de8
/*0x1496*/      mov r5, r0
/*0x1498*/      movs r1, #0
/*0x149a*/      mov r0, r7
/*0x149c*/      bl call_13ae
/*0x14a0*/      cmp r4, r6
/*0x14a2*/      bhi jump_14a6
/*0x14a4*/      cbz r0, jump_14ac
            jump_14a6:
/*0x14a6*/      movs r0, #0
            jump_14a8:
/*0x14a8*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_14ac:
/*0x14ac*/      mov r0, r7
/*0x14ae*/      bl call_133c
/*0x14b2*/      mov r1, r0
/*0x14b4*/      adds r0, r4, #3
/*0x14b6*/      lsrs r2, r0, #2
/*0x14b8*/      mov r0, r8
/*0x14ba*/      bl call_1dd8
/*0x14be*/      str r4, [r5, #0xc]
/*0x14c0*/      movs r0, #2
/*0x14c2*/      str r0, [r5]
/*0x14c4*/      mov r0, r4
/*0x14c6*/      b jump_14a8

            .thumb_func
            call_14c8:
/*0x14c8*/      ldr r1, [pc, #8] /* data_14d4 */
/*0x14ca*/      ldr r2, [r1, #4]
/*0x14cc*/      orrs r2, r0
/*0x14ce*/      str r2, [r1, #4]
/*0x14d0*/      bx lr

/*0x14d2*/  .byte 0x00
/*0x14d3*/  .byte 0x00

            data_14d4:
/*0x14d4*/  .word 0x400a8000


            .thumb_func
            call_14d8:
/*0x14d8*/      mov r3, r0
/*0x14da*/      movs r1, #7
            jump_14dc:
/*0x14dc*/      add.w r2, r1, #8
/*0x14e0*/      lsr.w r0, r3, r2
/*0x14e4*/      lsls r2, r0, #0x1f
/*0x14e6*/      beq jump_14ec
/*0x14e8*/      sxtb r0, r1
/*0x14ea*/      bx lr
            jump_14ec:
/*0x14ec*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x14ee*/      cmp r1, #0
/*0x14f0*/      bgt jump_14dc
/*0x14f2*/      mov.w r0, #-1
/*0x14f6*/      bx lr

            .thumb_func
            call_14f8:
/*0x14f8*/      ldr r0, [pc, #8] /* data_1504 */
/*0x14fa*/      ldr r1, [r0, #4]
/*0x14fc*/      ldr r0, [r0, #8]
/*0x14fe*/      ands r0, r1
/*0x1500*/      bx lr

/*0x1502*/  .byte 0x00
/*0x1503*/  .byte 0x00

            data_1504:
/*0x1504*/  .word 0x400a8000


            .thumb_func
            call_1508:
/*0x1508*/      ldr r0, [pc, #8] /* data_1514 */
/*0x150a*/      ldr r1, [r0]
/*0x150c*/      orr r1, r1, #0xc
/*0x1510*/      str r1, [r0]
/*0x1512*/      bx lr

            data_1514:
/*0x1514*/  .word 0x400a8000


            .thumb_func
            call_1518:
/*0x1518*/      ldr r0, [pc, #8] /* data_1524 */
/*0x151a*/      ldr r1, [r0]
/*0x151c*/      and r1, r1, #0x400
/*0x1520*/      str r1, [r0]
/*0x1522*/      bx lr

            data_1524:
/*0x1524*/  .word 0x400a8000

            jump_1528:
/*0x1528*/      push {r4, lr}
/*0x152a*/      mov r4, r0
/*0x152c*/      ldr r0, [pc, #0x68] /* data_1598 */
/*0x152e*/      ldr r2, [r0]
/*0x1530*/      cmp r2, #1
/*0x1532*/      bne jump_1594
/*0x1534*/      movs r2, #0
/*0x1536*/      str r2, [r0]
/*0x1538*/      ldr r0, [pc, #0x60] /* data_159c */
/*0x153a*/      ldr r2, [r0]
/*0x153c*/      lsls r3, r2, #0x19
/*0x153e*/      mov.w r2, #-1
/*0x1542*/      bpl jump_155e
/*0x1544*/      movw r3, #0x40c
/*0x1548*/      str r3, [r0]
/*0x154a*/      str r2, [r0, #8]
/*0x154c*/      cbnz r1, jump_1554
/*0x154e*/      movs r0, #0
/*0x1550*/      bl call_720
            jump_1554:
/*0x1554*/      ldr r0, [r4]
/*0x1556*/      pop.w {r4, lr}
/*0x155a*/      b.w call_14c8
            jump_155e:
/*0x155e*/      movw r3, #0xc0c
/*0x1562*/      str r3, [r0]
/*0x1564*/      str r2, [r0, #8]
/*0x1566*/      cbnz r1, jump_156e
/*0x1568*/      movs r0, #0
/*0x156a*/      bl call_720
            jump_156e:
/*0x156e*/      movs r0, #0
/*0x1570*/      bl call_12cc
/*0x1574*/      ldr r0, [r4]
/*0x1576*/      bl call_14c8
/*0x157a*/      movs r0, #0
/*0x157c*/      bl call_12e8
/*0x1580*/      movs r1, #0xc8
/*0x1582*/      movs r0, #0
            jump_1584:
/*0x1584*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1586*/      cmp r0, r1
/*0x1588*/      blo jump_1584
/*0x158a*/      pop.w {r4, lr}
/*0x158e*/      movs r0, #1
/*0x1590*/      b.w call_12e8
            jump_1594:
/*0x1594*/      pop {r4, pc}

/*0x1596*/  .byte 0x00
/*0x1597*/  .byte 0x00

            data_1598:
/*0x1598*/  .word 0x20000000
            data_159c:
/*0x159c*/  .word 0x400a8000

            jump_15a0:
/*0x15a0*/      movw r1, #0x111d
/*0x15a4*/      str r1, [r0]
/*0x15a6*/      ldr r1, [pc, #0x28] /* data_15d0 */
/*0x15a8*/      str r1, [r0, #4]
/*0x15aa*/      movw r1, #0x212
/*0x15ae*/      str r1, [r0, #8]
/*0x15b0*/      ldr r1, [pc, #0x20] /* data_15d4 */
/*0x15b2*/      str r1, [r0, #0xc]
/*0x15b4*/      ldr r2, [pc, #0x20] /* data_15d8 */
/*0x15b6*/      movs r1, #0x10
/*0x15b8*/      strd r1, r2, [r0, #0x10]
/*0x15bc*/      str r1, [r0, #0x18]
/*0x15be*/      ldr r1, [pc, #0x1c] /* data_15dc */
/*0x15c0*/      str r1, [r0, #0x1c]
/*0x15c2*/      movs r1, #0
/*0x15c4*/      str r1, [r0, #0x20]
/*0x15c6*/      ldr r1, [pc, #0x18] /* data_15e0 */
/*0x15c8*/      str r1, [r0, #0x24]
/*0x15ca*/      movs r1, #2
/*0x15cc*/      str r1, [r0, #0x28]
/*0x15ce*/      bx lr

            data_15d0:
/*0x15d0*/  .word 0x80010008
            data_15d4:
/*0x15d4*/  .word 0x91002088
            data_15d8:
/*0x15d8*/  .word 0x92010090
            data_15dc:
/*0x15dc*/  .word 0x930100d0
            data_15e0:
/*0x15e0*/  .word 0x84010110


            .thumb_func
            call_15e4:
/*0x15e4*/      push {r4, lr}
/*0x15e6*/      ldr r4, [pc, #0x48] /* data_1630 */
/*0x15e8*/      ldrb.w r0, [r4, #0x32]
/*0x15ec*/      cmp r0, #3
/*0x15ee*/      bne jump_15f4
/*0x15f0*/      bl call_1df8
            jump_15f4:
/*0x15f4*/      ldr r1, [pc, #0x3c] /* data_1634 */
/*0x15f6*/      ldrb r0, [r1, #4]
/*0x15f8*/      cbz r0, jump_161a
/*0x15fa*/      cmp r0, #1
/*0x15fc*/      beq jump_1612
/*0x15fe*/      cmp r0, #2
/*0x1600*/      bne jump_1622
/*0x1602*/      ldrb.w r0, [r4, #0x32]
/*0x1606*/      cmp r0, #6
/*0x1608*/      bne jump_160e
/*0x160a*/      bl call_1940
            jump_160e:
/*0x160e*/      movs r0, #2
/*0x1610*/      pop {r4, pc}
            jump_1612:
/*0x1612*/      movs r0, #0
/*0x1614*/      strb r0, [r1, #4]
/*0x1616*/      movs r0, #3
/*0x1618*/      pop {r4, pc}
            jump_161a:
/*0x161a*/      ldrb.w r0, [r4, #0x32]
/*0x161e*/      cmp r0, #6
/*0x1620*/      beq jump_1626
            jump_1622:
/*0x1622*/      movs r0, #0
/*0x1624*/      pop {r4, pc}
            jump_1626:
/*0x1626*/      movs r0, #2
/*0x1628*/      strb r0, [r1, #4]
/*0x162a*/      movs r0, #1
/*0x162c*/      pop {r4, pc}

/*0x162e*/  .byte 0x00
/*0x162f*/  .byte 0x00

            data_1630:
/*0x1630*/  .word 0x20000304
            data_1634:
/*0x1634*/  .word 0x2000001c


            .thumb_func
            call_1638:
/*0x1638*/      ldr r1, [pc, #8] /* data_1644 */
/*0x163a*/      ldr r2, [r1]
/*0x163c*/      str r2, [r0]
/*0x163e*/      ldr r1, [r1, #4]
/*0x1640*/      str r1, [r0, #4]
/*0x1642*/      bx lr

            data_1644:
/*0x1644*/  .word 0x400aa000

            jump_1648:
/*0x1648*/      ldr r0, [pc, #8] /* data_1654 */
/*0x164a*/      ldr r1, [r0]
/*0x164c*/      orr r1, r1, #0x20
/*0x1650*/      str r1, [r0]
/*0x1652*/      bx lr

            data_1654:
/*0x1654*/  .word 0x400a8000


            .thumb_func
            call_1658:
/*0x1658*/      ldr r1, [pc, #0xc] /* data_1668 */
/*0x165a*/      ldr r2, [r1]
/*0x165c*/      orr r2, r2, #0x100
/*0x1660*/      str r2, [r1]
/*0x1662*/      str r0, [r1, #0x10]
/*0x1664*/      bx lr

/*0x1666*/  .byte 0x00
/*0x1667*/  .byte 0x00

            data_1668:
/*0x1668*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x166c*/      ldr r0, [pc, #4] /* data_1674 */
/*0x166e*/      b.w jump_10b4

/*0x1672*/  .byte 0x00
/*0x1673*/  .byte 0x00

            data_1674:
/*0x1674*/  .word 0x20000304


            .thumb_func
            call_1678:
/*0x1678*/      ldr r0, [pc, #0x14] /* data_1690 */
/*0x167a*/      ldr r1, [r0, #0x30]
/*0x167c*/      orr r1, r1, #0x10
/*0x1680*/      str r1, [r0, #0x30]
/*0x1682*/      ldr r0, [pc, #0x10] /* data_1694 */
/*0x1684*/      movw r1, #0x5fff
/*0x1688*/      str r1, [r0, #8]
/*0x168a*/      ldr r1, [pc, #0xc] /* data_1698 */
/*0x168c*/      str r1, [r0, #4]
/*0x168e*/      bx lr

            data_1690:
/*0x1690*/  .word 0x40088000
            data_1694:
/*0x1694*/  .word 0x40068000
            data_1698:
/*0x1698*/  .word 0x0001afff


            .thumb_func
            call_169c:
/*0x169c*/      ldr r1, [pc, #8] /* data_16a8 */
/*0x169e*/      ldr r0, [pc, #4] /* data_16a4 */
/*0x16a0*/      str r0, [r1]
/*0x16a2*/      bx lr

            data_16a4:
/*0x16a4*/  .word 0x5fa00001
            data_16a8:
/*0x16a8*/  .word 0x40068000


            .thumb_func
            call_16ac:
/*0x16ac*/      push {r4, r5, r6, lr}
/*0x16ae*/      movs r1, #0
            jump_16b0:
/*0x16b0*/      strb r1, [r0], #1
/*0x16b4*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x16b6*/      cmp r1, #0xff
/*0x16b8*/      bls jump_16b0
/*0x16ba*/      movs r3, #0
/*0x16bc*/      ldr r5, [pc, #0x28] /* data_16e8 */
/*0x16be*/      mov r2, r3
/*0x16c0*/      mov r1, r3
/*0x16c2*/      sub.w r0, r0, #0x100
            jump_16c6:
/*0x16c6*/      ldrb r6, [r5, r2]
/*0x16c8*/      ldrb r4, [r0, r1]
/*0x16ca*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x16cc*/      add r3, r4
/*0x16ce*/      add r3, r6
/*0x16d0*/      uxtb r3, r3
/*0x16d2*/      uxtb r2, r2
/*0x16d4*/      ldrb r6, [r0, r3]
/*0x16d6*/      strb r6, [r0, r1]
/*0x16d8*/      strb r4, [r0, r3]
/*0x16da*/      cmp r2, #8
/*0x16dc*/      blo jump_16e0
/*0x16de*/      movs r2, #0
            jump_16e0:
/*0x16e0*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x16e2*/      cmp r1, #0xff
/*0x16e4*/      bls jump_16c6
/*0x16e6*/      pop {r4, r5, r6, pc}

            data_16e8:
/*0x16e8*/  .word 0x00001fc8 /* possible pointer */


            .thumb_func
            call_16ec:
/*0x16ec*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x16f0*/      mov r6, r0
/*0x16f2*/      movw r0, #0x3bf8
/*0x16f6*/      sub sp, #0x104
/*0x16f8*/      ldr r0, [r0]
/*0x16fa*/      mov sb, r2
/*0x16fc*/      mov r5, r1
/*0x16fe*/      cmp.w r0, #0x3040000
/*0x1702*/      bne jump_170e
/*0x1704*/      movw r0, #0x3bfc
/*0x1708*/      ldrb r0, [r0]
/*0x170a*/      cmp r0, #1
/*0x170c*/      beq jump_1716
            jump_170e:
/*0x170e*/      movs r0, #0
            jump_1710:
/*0x1710*/      add sp, #0x104
/*0x1712*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_1716:
/*0x1716*/      ldr.w sl, [pc, #0xa0] /* data_17b8 */
/*0x171a*/      mov.w r8, #0
/*0x171e*/      movw fp, #0x3bff
/*0x1722*/      cmp.w sb, #0
/*0x1726*/      beq jump_17a2
/*0x1728*/      movs r1, #0
/*0x172a*/      mov.w r0, #0x2000
/*0x172e*/      movs r3, #1
/*0x1730*/      mov r2, r1
/*0x1732*/      bl call_2cc
/*0x1736*/      mov.w r1, #-1
/*0x173a*/      str.w r1, [sl, #4]
/*0x173e*/      movs r1, #0xe6
/*0x1740*/      str.w r1, [sl]
/*0x1744*/      b jump_17a2
            jump_1746:
/*0x1746*/      ldrb.w r0, [fp]
/*0x174a*/      cmp r0, r5
/*0x174c*/      bls jump_1750
/*0x174e*/      mov r0, r5
            jump_1750:
/*0x1750*/      uxtb r4, r0
/*0x1752*/      subs r5, r5, r4
/*0x1754*/      mov r0, sp
/*0x1756*/      bl call_16ac
/*0x175a*/      movs r1, #0
/*0x175c*/      mov r0, r1
/*0x175e*/      b jump_179c
            jump_1760:
/*0x1760*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1762*/      uxtb r1, r1
/*0x1764*/      ldrb.w r2, [sp, r1]
/*0x1768*/      add r0, r2
/*0x176a*/      uxtb r0, r0
/*0x176c*/      ldrb.w ip, [sp, r0]
/*0x1770*/      strb.w ip, [sp, r1]
/*0x1774*/      strb.w r2, [sp, r0]
/*0x1778*/      add r2, ip
/*0x177a*/      uxtb r2, r2
/*0x177c*/      ldrb r7, [r6]
/*0x177e*/      ldrb.w r2, [sp, r2]
/*0x1782*/      eors r7, r2
/*0x1784*/      cmp.w sb, #0
/*0x1788*/      beq jump_1790
/*0x178a*/      strb.w r7, [sl, #0xc]
/*0x178e*/      b jump_179a
            jump_1790:
/*0x1790*/      subs r2, r1, #1
/*0x1792*/      lsls r2, r2, #0x1e
/*0x1794*/      lsrs r2, r2, #0x1b
/*0x1796*/      lsls r7, r2
/*0x1798*/      add r8, r7
            jump_179a:
/*0x179a*/      .short 0x1c76 /* adds r6, r6, #1 */ 
            jump_179c:
/*0x179c*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x179e*/      uxtb r4, r4
/*0x17a0*/      bhs jump_1760
            jump_17a2:
/*0x17a2*/      cmp r5, #0
/*0x17a4*/      bne jump_1746
/*0x17a6*/      cmp.w sb, #0
/*0x17aa*/      beq jump_17b2
/*0x17ac*/      ldr.w r0, [sl, #8]
/*0x17b0*/      b jump_1710
            jump_17b2:
/*0x17b2*/      mov r0, r8
/*0x17b4*/      b jump_1710

/*0x17b6*/  .byte 0x00
/*0x17b7*/  .byte 0x00

            data_17b8:
/*0x17b8*/  .word 0x4008a000


            .thumb_func
            call_17bc:
/*0x17bc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x17c0*/      ldr r4, [pc, #0xa0] /* data_1864 */
/*0x17c2*/      ldr r5, [pc, #0xa4] /* data_1868 */
/*0x17c4*/      ldr.w r8, [pc, #0xa4] /* data_186c */
/*0x17c8*/      ldr r7, [pc, #0xa4] /* data_1870 */
/*0x17ca*/      movs r6, #0xa
            jump_17cc:
/*0x17cc*/      ldrd r0, r1, [r5]
/*0x17d0*/      str r1, [r0, #0x28]
/*0x17d2*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x17d4*/      uxtb r6, r6
/*0x17d6*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x17d8*/      nop 
/*0x17da*/      nop 
/*0x17dc*/      movs r0, #0xff
/*0x17de*/      ldr r1, [r7, #0x1c]
/*0x17e0*/      lsls r1, r1, #0x16
/*0x17e2*/      bmi jump_17e6
/*0x17e4*/      movs r0, #0xfe
            jump_17e6:
/*0x17e6*/      ldr.w r2, [r8, #0x1c]
/*0x17ea*/      mov r1, r8
/*0x17ec*/      lsls r2, r2, #0x1a
/*0x17ee*/      bmi jump_17f4
/*0x17f0*/      bic r0, r0, #2
            jump_17f4:
/*0x17f4*/      ldr r2, [r1, #0x1c]
/*0x17f6*/      lsls r2, r2, #0x19
/*0x17f8*/      bmi jump_17fe
/*0x17fa*/      bic r0, r0, #4
            jump_17fe:
/*0x17fe*/      ldr r1, [r1, #0x1c]
/*0x1800*/      lsls r1, r1, #0x18
/*0x1802*/      bmi jump_1808
/*0x1804*/      bic r0, r0, #8
            jump_1808:
/*0x1808*/      ldr r1, [r7, #0x1c]
/*0x180a*/      lsls r1, r1, #0x14
/*0x180c*/      bmi jump_1812
/*0x180e*/      bic r0, r0, #0x10
            jump_1812:
/*0x1812*/      ldr r1, [r7, #0x1c]
/*0x1814*/      lsls r1, r1, #0x12
/*0x1816*/      bmi jump_181c
/*0x1818*/      bic r0, r0, #0x20
            jump_181c:
/*0x181c*/      ldr r1, [r7, #0x1c]
/*0x181e*/      lsls r1, r1, #0x11
/*0x1820*/      bmi jump_1826
/*0x1822*/      bic r0, r0, #0x40
            jump_1826:
/*0x1826*/      ldr r1, [r7, #0x1c]
/*0x1828*/      lsls r1, r1, #0x10
/*0x182a*/      bmi jump_1830
/*0x182c*/      bic r0, r0, #0x80
            jump_1830:
/*0x1830*/      ldrd r1, r2, [r5]
/*0x1834*/      str r2, [r1, #0x24]
/*0x1836*/      ldrb r1, [r4, #1]
/*0x1838*/      cmp r1, r0
/*0x183a*/      beq jump_1842
/*0x183c*/      strb r0, [r4, #1]
/*0x183e*/      movs r0, #3
/*0x1840*/      b jump_184e
            jump_1842:
/*0x1842*/      ldrb r0, [r4]
/*0x1844*/      cbz r0, jump_1850
/*0x1846*/      cmp r0, #1
/*0x1848*/      bne jump_184c
/*0x184a*/      strb r1, [r4, #2]
            jump_184c:
/*0x184c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_184e:
/*0x184e*/      strb r0, [r4]
            jump_1850:
/*0x1850*/      cmp r6, #0
/*0x1852*/      beq jump_185e
/*0x1854*/      movs r0, #5
/*0x1856*/      bl call_102
/*0x185a*/      subs r5, #8
/*0x185c*/      b jump_17cc
            jump_185e:
/*0x185e*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x1862*/  .byte 0x00
/*0x1863*/  .byte 0x00

            data_1864:
/*0x1864*/  .word 0x200000ec
            data_1868:
/*0x1868*/  .word 0x000020f0 /* possible pointer */
            data_186c:
/*0x186c*/  .word 0x400b0000
            data_1870:
/*0x1870*/  .word 0x400b4000

            jump_1874:
/*0x1874*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x1876*/      ldr r0, [pc, #0x44] /* data_18bc */
/*0x1878*/      ldr r0, [r0]
/*0x187a*/      ldr r1, [pc, #0x44] /* data_18c0 */
/*0x187c*/      ldr r6, [pc, #0x44] /* data_18c4 */
/*0x187e*/      udiv r4, r0, r1
/*0x1882*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x1884*/      strh.w r4, [sp]
/*0x1888*/      movs r5, #0
/*0x188a*/      strh.w r5, [sp, #2]
/*0x188e*/      mov r1, sp
/*0x1890*/      mov r0, r6
/*0x1892*/      bl call_4b0
/*0x1896*/      strb.w r5, [sp]
/*0x189a*/      movs r0, #7
/*0x189c*/      strh.w r0, [sp, #2]
/*0x18a0*/      movs r0, #1
/*0x18a2*/      strb.w r0, [sp, #4]
/*0x18a6*/      strb.w r5, [sp, #5]
/*0x18aa*/      lsrs r0, r4, #1
/*0x18ac*/      strh.w r0, [sp, #6]
/*0x18b0*/      mov r1, sp
/*0x18b2*/      mov r0, r6
/*0x18b4*/      bl call_458
/*0x18b8*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x18ba*/  .byte 0x00
/*0x18bb*/  .byte 0x00

            data_18bc:
/*0x18bc*/  .word 0x20000018
            data_18c0:
/*0x18c0*/  .word 0x00dbba00
            data_18c4:
/*0x18c4*/  .word 0x4006f000


            .thumb_func
            call_18c8:
/*0x18c8*/      push {r4, lr}
/*0x18ca*/      ldr r1, [pc, #0x28] /* data_18f4 */
/*0x18cc*/      mov.w r4, #0x8000
/*0x18d0*/      str r4, [r1, #0x28]
/*0x18d2*/      nop 
/*0x18d4*/      nop 
/*0x18d6*/      str r4, [r1, #0x24]
/*0x18d8*/      mov.w r2, #0x4000
/*0x18dc*/      b jump_18e8
            jump_18de:
/*0x18de*/      str r2, [r1, #0x28]
/*0x18e0*/      nop 
/*0x18e2*/      nop 
/*0x18e4*/      str r2, [r1, #0x24]
/*0x18e6*/      nop 
            jump_18e8:
/*0x18e8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x18ea*/      uxtb r0, r0
/*0x18ec*/      bhs jump_18de
/*0x18ee*/      str r4, [r1, #0x28]
/*0x18f0*/      pop {r4, pc}

/*0x18f2*/  .byte 0x00
/*0x18f3*/  .byte 0x00

            data_18f4:
/*0x18f4*/  .word 0x400b0000


            .thumb_func
            call_18f8:
/*0x18f8*/      push {r4, r5, r6, r7, lr}
/*0x18fa*/      movs r2, #4
/*0x18fc*/      ldr r3, [pc, #0x24] /* data_1924 */
/*0x18fe*/      lsls r4, r2, #0xc
/*0x1900*/      ldr r5, [pc, #0x24] /* data_1928 */
/*0x1902*/      movw r6, #0xffff
/*0x1906*/      b jump_191c
            jump_1908:
/*0x1908*/      nop 
/*0x190a*/      str r4, [r5, #0x28]
/*0x190c*/      lsls r7, r0, #0x10
/*0x190e*/      bpl jump_1914
/*0x1910*/      str r2, [r3, #0x24]
/*0x1912*/      b jump_1916
            jump_1914:
/*0x1914*/      str r2, [r3, #0x28]
            jump_1916:
/*0x1916*/      str r4, [r5, #0x24]
/*0x1918*/      and.w r0, r6, r0, lsl #1
            jump_191c:
/*0x191c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x191e*/      uxtb r1, r1
/*0x1920*/      bhs jump_1908
/*0x1922*/      pop {r4, r5, r6, r7, pc}

            data_1924:
/*0x1924*/  .word 0x400b4000
            data_1928:
/*0x1928*/  .word 0x400b0000


            .thumb_func
            function_192c:
/*0x192c*/      movs r1, #1
/*0x192e*/      lsls r1, r0
/*0x1930*/      ldr r0, [pc, #8] /* data_193c */
/*0x1932*/      ldrb r2, [r0, #5]
/*0x1934*/      orrs r1, r2
/*0x1936*/      strb r1, [r0, #5]
/*0x1938*/      bx lr

/*0x193a*/  .byte 0x00
/*0x193b*/  .byte 0x00

            data_193c:
/*0x193c*/  .word 0x2000001c


            .thumb_func
            call_1940:
/*0x1940*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1944*/      ldr r0, [pc, #0xcc] /* data_1a14 */
/*0x1946*/      ldrb r1, [r0]
/*0x1948*/      movs r4, #0
/*0x194a*/      sub.w r5, r0, #0xa
/*0x194e*/      cmp r1, #1
/*0x1950*/      bne jump_195e
/*0x1952*/      strb r4, [r0]
/*0x1954*/      ldrb r0, [r5, #0x10]
/*0x1956*/      and r0, r0, #7
/*0x195a*/      bl call_3f2
            jump_195e:
/*0x195e*/      ldr r6, [pc, #0xb8] /* data_1a18 */
/*0x1960*/      ldr r7, [pc, #0xb8] /* data_1a1c */
/*0x1962*/      ldrb r0, [r6]
/*0x1964*/      cbz r0, jump_1972
/*0x1966*/      cmp r0, #2
/*0x1968*/      beq jump_199c
/*0x196a*/      cmp r0, #4
/*0x196c*/      beq jump_1972
/*0x196e*/      cmp r0, #5
/*0x1970*/      bne jump_19ae
            jump_1972:
/*0x1972*/      ldrb r0, [r5, #5]
/*0x1974*/      lsls r0, r0, #0x1b
/*0x1976*/      bpl jump_19ae
/*0x1978*/      movs r0, #1
/*0x197a*/      strb r0, [r6]
/*0x197c*/      movs r2, #0x40
/*0x197e*/      ldr r1, [pc, #0xa0] /* data_1a20 */
/*0x1980*/      movs r0, #4
/*0x1982*/      bl call_1420
/*0x1986*/      ldr r2, [pc, #0x98] /* data_1a20 */
/*0x1988*/      rsb.w r1, r0, #0x40
/*0x198c*/      add r0, r2
/*0x198e*/      bl mem_zero
/*0x1992*/      ldrb r0, [r5, #5]
/*0x1994*/      bic r0, r0, #0x10
/*0x1998*/      strb r0, [r5, #5]
/*0x199a*/      b jump_19ae
            jump_199c:
/*0x199c*/      ldr r0, [r7, #0x50]
/*0x199e*/      lsls r0, r0, #0x1e
/*0x19a0*/      bpl jump_19ae
/*0x19a2*/      movs r2, #0x40
/*0x19a4*/      ldr r1, [pc, #0x78] /* data_1a20 */
/*0x19a6*/      movs r0, #3
/*0x19a8*/      bl call_1480
/*0x19ac*/      strb r4, [r6]
            jump_19ae:
/*0x19ae*/      ldr r0, [r7, #0x28]
/*0x19b0*/      lsls r0, r0, #0x1e
/*0x19b2*/      bpl jump_19e4
/*0x19b4*/      ldrb r0, [r5]
/*0x19b6*/      cbz r0, jump_19bc
/*0x19b8*/      strb r4, [r5]
/*0x19ba*/      b jump_19d8
            jump_19bc:
/*0x19bc*/      ldr r1, [pc, #0x64] /* data_1a24 */
/*0x19be*/      ldr r0, [r1]
/*0x19c0*/      cbnz r0, jump_19e4
/*0x19c2*/      add.w r0, r1, #0xc
/*0x19c6*/      ldr r0, [r0]
/*0x19c8*/      cbz r0, jump_19e4
/*0x19ca*/      mov.w r2, #0xfa0
/*0x19ce*/      muls r0, r2, r0
/*0x19d0*/      asrs r2, r2, #3
/*0x19d2*/      udiv r0, r0, r2
/*0x19d6*/      str r0, [r1]
            jump_19d8:
/*0x19d8*/      ldr r1, [pc, #0x38] /* data_1a14 */
/*0x19da*/      movs r2, #8
/*0x19dc*/      adds r1, #0x12
/*0x19de*/      movs r0, #1
/*0x19e0*/      bl call_1480
            jump_19e4:
/*0x19e4*/      ldr r0, [r7, #0x3c]
/*0x19e6*/      lsls r0, r0, #0x1e
/*0x19e8*/      bpl jump_1a10
/*0x19ea*/      ldrb r0, [r5, #2]
/*0x19ec*/      cbz r0, jump_19f8
/*0x19ee*/      ldr r1, [pc, #0x24] /* data_1a14 */
/*0x19f0*/      movs r2, #5
/*0x19f2*/      strb r4, [r5, #2]
/*0x19f4*/      adds r1, #0xa
/*0x19f6*/      b jump_1a06
            jump_19f8:
/*0x19f8*/      ldrb r0, [r5, #1]
/*0x19fa*/      cmp r0, #0
/*0x19fc*/      beq jump_1a10
/*0x19fe*/      ldr r1, [pc, #0x14] /* data_1a14 */
/*0x1a00*/      movs r2, #2
/*0x1a02*/      strb r4, [r5, #1]
/*0x1a04*/      .short 0x1e89 /* subs r1, r1, #2 */ 
            jump_1a06:
/*0x1a06*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x1a0a*/      movs r0, #2
/*0x1a0c*/      b.w call_1480
            jump_1a10:
/*0x1a10*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_1a14:
/*0x1a14*/  .word 0x20000026
            data_1a18:
/*0x1a18*/  .word 0x20000004
            data_1a1c:
/*0x1a1c*/  .word 0x400a8000
            data_1a20:
/*0x1a20*/  .word 0x20000084
            data_1a24:
/*0x1a24*/  .word 0x200002ec


            .thumb_func
            function_1a28:
/*0x1a28*/      push {r4, r5, r6, r7, lr}
/*0x1a2a*/      ldrh r1, [r0]
/*0x1a2c*/      mov.w r6, #0x100
/*0x1a30*/      movw r5, #0x921
/*0x1a34*/      lsls r7, r6, #1
/*0x1a36*/      movs r2, #1
/*0x1a38*/      ldr r4, [pc, #0xc8] /* data_1b04 */
/*0x1a3a*/      subw r3, r1, #0x921
/*0x1a3e*/      cmp r1, r5
/*0x1a40*/      beq jump_1ab2
/*0x1a42*/      bgt jump_1a60
/*0x1a44*/      adds.w r1, r3, #0x780
/*0x1a48*/      beq jump_1a72
/*0x1a4a*/      cmp r1, r6
/*0x1a4c*/      beq jump_1aa6
/*0x1a4e*/      cmp r1, r7
/*0x1a50*/      bne jump_1ad4
/*0x1a52*/      ldrh r1, [r0, #4]
/*0x1a54*/      cmp r1, #0
/*0x1a56*/      bne jump_1ad4
/*0x1a58*/      ldr r1, [pc, #0xac] /* data_1b08 */
/*0x1a5a*/      strd r1, r2, [r0, #0x1c]
/*0x1a5e*/      b jump_1afe
            jump_1a60:
/*0x1a60*/      movs r5, #0
/*0x1a62*/      cmp r3, r6
/*0x1a64*/      beq jump_1ad8
/*0x1a66*/      cmp r3, r7
/*0x1a68*/      bne jump_1ad4
/*0x1a6a*/      ldrh r3, [r0, #4]
/*0x1a6c*/      ldrb r1, [r0, #2]
/*0x1a6e*/      cbz r3, jump_1ad6
/*0x1a70*/      b jump_1afc
            jump_1a72:
/*0x1a72*/      ldrb r5, [r0, #3]
/*0x1a74*/      ldrb r3, [r0, #2]
/*0x1a76*/      ldrh r4, [r0, #6]
/*0x1a78*/      ldrh r1, [r0, #4]
/*0x1a7a*/      cmp r5, #1
/*0x1a7c*/      bne jump_1ad4
/*0x1a7e*/      cbz r1, jump_1a96
/*0x1a80*/      cmp r1, #1
/*0x1a82*/      beq jump_1ad4
/*0x1a84*/      cmp r1, #2
/*0x1a86*/      bne jump_1ad4
/*0x1a88*/      cmp r3, #1
/*0x1a8a*/      beq jump_1a9c
/*0x1a8c*/      cmp r3, #2
/*0x1a8e*/      bne jump_1ad4
/*0x1a90*/      ldr r1, [pc, #0x74] /* data_1b08 */
/*0x1a92*/      adds r1, #0x11
/*0x1a94*/      b jump_1aa0
            jump_1a96:
/*0x1a96*/      ldr r1, [pc, #0x70] /* data_1b08 */
/*0x1a98*/      adds r1, #0x19
/*0x1a9a*/      b jump_1aa0
            jump_1a9c:
/*0x1a9c*/      ldr r1, [pc, #0x68] /* data_1b08 */
/*0x1a9e*/      .short 0x1d49 /* adds r1, r1, #5 */ 
            jump_1aa0:
/*0x1aa0*/      strd r1, r4, [r0, #0x1c]
/*0x1aa4*/      b jump_1afe
            jump_1aa6:
/*0x1aa6*/      ldrh r1, [r0, #4]
/*0x1aa8*/      cmp r1, #0
/*0x1aaa*/      bne jump_1ad4
/*0x1aac*/      strd r4, r2, [r0, #0x1c]
/*0x1ab0*/      b jump_1afe
            jump_1ab2:
/*0x1ab2*/      ldrb r2, [r0, #3]
/*0x1ab4*/      ldrh r3, [r0, #6]
/*0x1ab6*/      ldrh r1, [r0, #4]
/*0x1ab8*/      str r3, [r0, #0x20]
/*0x1aba*/      cmp r2, #2
/*0x1abc*/      bne jump_1ad4
/*0x1abe*/      cmp r1, #0
/*0x1ac0*/      bne jump_1ad4
/*0x1ac2*/      ldr r2, [pc, #0x44] /* data_1b08 */
/*0x1ac4*/      adds r2, #0xd
/*0x1ac6*/      str r2, [r0, #0x1c]
/*0x1ac8*/      ldr r2, [pc, #0x40] /* data_1b0c */
/*0x1aca*/      strd r2, r1, [r0, #0x28]
/*0x1ace*/      movs r1, #2
/*0x1ad0*/      strb.w r1, [r0, #0x24]
            jump_1ad4:
/*0x1ad4*/      pop {r4, r5, r6, r7, pc}
            jump_1ad6:
/*0x1ad6*/      b jump_1af6
            jump_1ad8:
/*0x1ad8*/      ldrh r3, [r0, #4]
/*0x1ada*/      ldrb r1, [r0, #3]
/*0x1adc*/      cmp r3, #0
/*0x1ade*/      bne jump_1ad4
/*0x1ae0*/      mov.w r3, #0xfa0
/*0x1ae4*/      str r1, [r4]
/*0x1ae6*/      muls r1, r3, r1
/*0x1ae8*/      asrs r3, r3, #3
/*0x1aea*/      udiv r1, r1, r3
/*0x1aee*/      ldr r3, [pc, #0x14] /* data_1b04 */
/*0x1af0*/      subs r3, #0xc
/*0x1af2*/      str r1, [r3]
/*0x1af4*/      b jump_1afc
            jump_1af6:
/*0x1af6*/      ldr r3, [pc, #0x10] /* data_1b08 */
/*0x1af8*/      .short 0x1edb /* subs r3, r3, #3 */ 
/*0x1afa*/      strb r1, [r3, #3]
            jump_1afc:
/*0x1afc*/      str r5, [r0, #0x20]
            jump_1afe:
/*0x1afe*/      strb.w r2, [r0, #0x24]
/*0x1b02*/      b jump_1ad4

            data_1b04:
/*0x1b04*/  .word 0x200002f8
            data_1b08:
/*0x1b08*/  .word 0x2000001f
            data_1b0c:
/*0x1b0c*/  .word 0x00001b11 /* possible pointer */


            .thumb_func
            function_1b10:
/*0x1b10*/      ldr r2, [pc, #4] /* data_1b18 */
/*0x1b12*/      movs r1, #1
/*0x1b14*/      strb r1, [r2, r0]
/*0x1b16*/      bx lr

            data_1b18:
/*0x1b18*/  .word 0x20000026


            .thumb_func
            function_1b1c:
/*0x1b1c*/      ldrb r2, [r0, #3]
/*0x1b1e*/      ldrh r1, [r0, #4]
/*0x1b20*/      movs r3, #1
/*0x1b22*/      cmp r2, #0x21
/*0x1b24*/      beq jump_1b36
/*0x1b26*/      cmp r2, #0x22
/*0x1b28*/      bne jump_1b6e
/*0x1b2a*/      cbz r1, jump_1b58
/*0x1b2c*/      cmp r1, #1
/*0x1b2e*/      beq jump_1b60
/*0x1b30*/      cmp r1, #2
/*0x1b32*/      bne jump_1b6a
/*0x1b34*/      b jump_1b70
            jump_1b36:
/*0x1b36*/      cbz r1, jump_1b42
/*0x1b38*/      cmp r1, #1
/*0x1b3a*/      beq jump_1b48
/*0x1b3c*/      cmp r1, #2
/*0x1b3e*/      bne jump_1b4e
/*0x1b40*/      b jump_1b52
            jump_1b42:
/*0x1b42*/      ldr r1, [r0, #0xc]
/*0x1b44*/      adds r1, #0x12
/*0x1b46*/      b jump_1b4c
            jump_1b48:
/*0x1b48*/      ldr r1, [r0, #0xc]
/*0x1b4a*/      adds r1, #0x2b
            jump_1b4c:
/*0x1b4c*/      str r1, [r0, #0x1c]
            jump_1b4e:
/*0x1b4e*/      movs r1, #9
/*0x1b50*/      b jump_1b68
            jump_1b52:
/*0x1b52*/      ldr r1, [r0, #0xc]
/*0x1b54*/      adds r1, #0x4b
/*0x1b56*/      b jump_1b4c
            jump_1b58:
/*0x1b58*/      ldr r1, [pc, #0x20] /* data_1b7c */
/*0x1b5a*/      str r1, [r0, #0x1c]
/*0x1b5c*/      movs r1, #0x40
/*0x1b5e*/      b jump_1b68
            jump_1b60:
/*0x1b60*/      ldr r1, [pc, #0x18] /* data_1b7c */
/*0x1b62*/      subs r1, #0x8c
/*0x1b64*/      str r1, [r0, #0x1c]
/*0x1b66*/      movs r1, #0x22
            jump_1b68:
/*0x1b68*/      str r1, [r0, #0x20]
            jump_1b6a:
/*0x1b6a*/      strb.w r3, [r0, #0x24]
            jump_1b6e:
/*0x1b6e*/      bx lr
            jump_1b70:
/*0x1b70*/      ldr r1, [pc, #8] /* data_1b7c */
/*0x1b72*/      subs r1, #0x68
/*0x1b74*/      str r1, [r0, #0x1c]
/*0x1b76*/      movs r1, #0x65
/*0x1b78*/      b jump_1b68

/*0x1b7a*/  .byte 0x00
/*0x1b7b*/  .byte 0x00

            data_1b7c:
/*0x1b7c*/  .word 0x000021cc /* possible pointer */


            .thumb_func
            call_1b80:
/*0x1b80*/      push {r4, r5, r6, lr}
/*0x1b82*/      mov r4, r0
/*0x1b84*/      movs r0, #0
/*0x1b86*/      bl call_1378
/*0x1b8a*/      mov r5, r0
/*0x1b8c*/      ldr r0, [r4, #0x20]
/*0x1b8e*/      adds r1, r0, #1
/*0x1b90*/      beq jump_1bc0
/*0x1b92*/      ldrb.w r1, [r4, #0x24]
/*0x1b96*/      cmp r1, #1
/*0x1b98*/      bne jump_1bc0
/*0x1b9a*/      cmp r0, r5
/*0x1b9c*/      blo jump_1ba4
/*0x1b9e*/      subs r0, r0, r5
/*0x1ba0*/      str r0, [r4, #0x20]
/*0x1ba2*/      b jump_1bb0
            jump_1ba4:
/*0x1ba4*/      mov r5, r0
/*0x1ba6*/      movs r0, #0
/*0x1ba8*/      str r0, [r4, #0x20]
/*0x1baa*/      movs r0, #2
/*0x1bac*/      strb.w r0, [r4, #0x24]
            jump_1bb0:
/*0x1bb0*/      mov r2, r5
/*0x1bb2*/      movs r0, #0
/*0x1bb4*/      ldr r1, [r4, #0x1c]
/*0x1bb6*/      bl call_1480
/*0x1bba*/      ldr r0, [r4, #0x1c]
/*0x1bbc*/      add r0, r5
/*0x1bbe*/      str r0, [r4, #0x1c]
            jump_1bc0:
/*0x1bc0*/      pop {r4, r5, r6, pc}

/*0x1bc2*/  .byte 0x00
/*0x1bc3*/  .byte 0x00


            .thumb_func
            call_1bc4:
/*0x1bc4*/      push {r4, lr}
/*0x1bc6*/      mov r4, r0
/*0x1bc8*/      movs r0, #0
/*0x1bca*/      strb.w r0, [r4, #0x24]
/*0x1bce*/      str r0, [r4, #0x20]
/*0x1bd0*/      ldrb r0, [r4]
/*0x1bd2*/      ands r0, r0, #0x60
/*0x1bd6*/      beq jump_1bde
/*0x1bd8*/      cmp r0, #0x20
/*0x1bda*/      bne jump_1bf0
/*0x1bdc*/      b jump_1be6
            jump_1bde:
/*0x1bde*/      mov r0, r4
/*0x1be0*/      bl call_1c64
/*0x1be4*/      b jump_1bf0
            jump_1be6:
/*0x1be6*/      ldr r0, [pc, #0x40] /* data_1c28 */
/*0x1be8*/      ldr r1, [r0, #0x14]
/*0x1bea*/      cbz r1, jump_1bf0
/*0x1bec*/      mov r0, r4
/*0x1bee*/      blx r1
            jump_1bf0:
/*0x1bf0*/      ldrb.w r0, [r4, #0x24]
/*0x1bf4*/      cmp r0, #1
/*0x1bf6*/      beq jump_1c06
/*0x1bf8*/      cmp r0, #2
/*0x1bfa*/      beq jump_1c1a
/*0x1bfc*/      pop.w {r4, lr}
/*0x1c00*/      movs r0, #0
/*0x1c02*/      b.w jump_1460
            jump_1c06:
/*0x1c06*/      ldrh r0, [r4, #6]
/*0x1c08*/      ldr r1, [r4, #0x20]
/*0x1c0a*/      cmp r1, r0
/*0x1c0c*/      ble jump_1c10
/*0x1c0e*/      str r0, [r4, #0x20]
            jump_1c10:
/*0x1c10*/      mov r0, r4
/*0x1c12*/      pop.w {r4, lr}
/*0x1c16*/      b.w call_1b80
            jump_1c1a:
/*0x1c1a*/      movs r2, #0
/*0x1c1c*/      pop.w {r4, lr}
/*0x1c20*/      mov r1, r2
/*0x1c22*/      mov r0, r2
/*0x1c24*/      b.w call_1480

            data_1c28:
/*0x1c28*/  .word 0x00002298 /* possible pointer */

            jump_1c2c:
/*0x1c2c*/      push {r4, lr}
/*0x1c2e*/      mov r4, r0
/*0x1c30*/      movs r0, #0
/*0x1c32*/      strb r0, [r4, #0x19]
/*0x1c34*/      cbz r1, jump_1c4a
/*0x1c36*/      cmp r1, #1
/*0x1c38*/      beq jump_1c4e
/*0x1c3a*/      cmp r1, #2
/*0x1c3c*/      bne jump_1c60
/*0x1c3e*/      ldrb r0, [r4, #4]
/*0x1c40*/      and r0, r0, #0xf
/*0x1c44*/      bl call_1386
/*0x1c48*/      b jump_1c4e
            jump_1c4a:
/*0x1c4a*/      ldrb.w r0, [r4, #0x34]
            jump_1c4e:
/*0x1c4e*/      strb r0, [r4, #0x18]
/*0x1c50*/      add.w r0, r4, #0x18
/*0x1c54*/      str r0, [r4, #0x1c]
/*0x1c56*/      movs r0, #2
/*0x1c58*/      str r0, [r4, #0x20]
/*0x1c5a*/      movs r0, #1
/*0x1c5c*/      strb.w r0, [r4, #0x24]
            jump_1c60:
/*0x1c60*/      pop {r4, pc}

/*0x1c62*/  .byte 0x00
/*0x1c63*/  .byte 0x00


            .thumb_func
            call_1c64:
/*0x1c64*/      push {r4, r5, r6, lr}
/*0x1c66*/      mov r4, r0
/*0x1c68*/      ldrh r0, [r0]
/*0x1c6a*/      movs r5, #1
/*0x1c6c*/      cmp.w r0, #0x500
/*0x1c70*/      beq jump_1d12
/*0x1c72*/      bgt jump_1cb6
/*0x1c74*/      cmp.w r0, #0x100
/*0x1c78*/      beq jump_1d04
/*0x1c7a*/      bgt jump_1c94
/*0x1c7c*/      cmp r0, #0x80
/*0x1c7e*/      beq jump_1cfc
/*0x1c80*/      cmp r0, #0x81
/*0x1c82*/      beq jump_1d00
/*0x1c84*/      cmp r0, #0x82
/*0x1c86*/      bne jump_1d56
/*0x1c88*/      movs r1, #2
            jump_1c8a:
/*0x1c8a*/      mov r0, r4
/*0x1c8c*/      pop.w {r4, r5, r6, lr}
/*0x1c90*/      b.w jump_1c2c
            jump_1c94:
/*0x1c94*/      cmp.w r0, #0x102
/*0x1c98*/      beq jump_1d08
/*0x1c9a*/      cmp.w r0, #0x300
/*0x1c9e*/      beq jump_1d0c
/*0x1ca0*/      sub.w r0, r0, #0x300
/*0x1ca4*/      subs r0, #2
/*0x1ca6*/      bne jump_1d56
/*0x1ca8*/      movs r2, #1
            jump_1caa:
/*0x1caa*/      movs r1, #2
            jump_1cac:
/*0x1cac*/      mov r0, r4
/*0x1cae*/      pop.w {r4, r5, r6, lr}
/*0x1cb2*/      b.w jump_1d8c
            jump_1cb6:
/*0x1cb6*/      ldr r1, [pc, #0xcc] /* data_1d84 */
/*0x1cb8*/      cmp.w r0, #0x900
/*0x1cbc*/      beq jump_1d5c
/*0x1cbe*/      bgt jump_1ce0
/*0x1cc0*/      cmp.w r0, #0x680
/*0x1cc4*/      beq jump_1d20
/*0x1cc6*/      sub.w r0, r0, #0x600
/*0x1cca*/      subs r0, #0x81
/*0x1ccc*/      beq jump_1d58
/*0x1cce*/      sub.w r0, r0, #0x100
/*0x1cd2*/      subs r0, #0xff
/*0x1cd4*/      bne jump_1d56
/*0x1cd6*/      add.w r0, r4, #0x30
/*0x1cda*/      strd r0, r5, [r4, #0x1c]
/*0x1cde*/      b jump_1d52
            jump_1ce0:
/*0x1ce0*/      sub.w r0, r0, #0xa00
/*0x1ce4*/      subs r0, #0x81
/*0x1ce6*/      beq jump_1d7e
/*0x1ce8*/      cmp r0, #0x80
/*0x1cea*/      bne jump_1d56
/*0x1cec*/      ldr r0, [r1, #0xc]
            jump_1cee:
/*0x1cee*/      cmp r0, #0
/*0x1cf0*/      beq jump_1d56
/*0x1cf2*/      mov r1, r0
/*0x1cf4*/      mov r0, r4
/*0x1cf6*/      pop.w {r4, r5, r6, lr}
/*0x1cfa*/      bx r1
            jump_1cfc:
/*0x1cfc*/      movs r1, #0
/*0x1cfe*/      b jump_1c8a
            jump_1d00:
/*0x1d00*/      movs r1, #1
/*0x1d02*/      b jump_1c8a
            jump_1d04:
/*0x1d04*/      movs r2, #0
/*0x1d06*/      b jump_1d0e
            jump_1d08:
/*0x1d08*/      movs r2, #0
/*0x1d0a*/      b jump_1caa
            jump_1d0c:
/*0x1d0c*/      movs r2, #1
            jump_1d0e:
/*0x1d0e*/      movs r1, #0
/*0x1d10*/      b jump_1cac
            jump_1d12:
/*0x1d12*/      ldrb r0, [r4, #2]
/*0x1d14*/      bl call_1658
/*0x1d18*/      strb.w r5, [r4, #0x24]
/*0x1d1c*/      movs r0, #5
/*0x1d1e*/      b jump_1d78
            jump_1d20:
/*0x1d20*/      ldrb r0, [r4, #3]
/*0x1d22*/      cmp r0, #1
/*0x1d24*/      beq jump_1d46
/*0x1d26*/      cmp r0, #2
/*0x1d28*/      beq jump_1d4a
/*0x1d2a*/      cmp r0, #3
/*0x1d2c*/      bne jump_1d56
/*0x1d2e*/      ldrb r0, [r4, #2]
/*0x1d30*/      ldr r1, [r4, #0x14]
/*0x1d32*/      cmp r1, r0
/*0x1d34*/      bls jump_1d56
/*0x1d36*/      ldr r1, [r4, #0x10]
/*0x1d38*/      ldr.w r0, [r1, r0, lsl #2]
/*0x1d3c*/      cmp r0, #0
/*0x1d3e*/      beq jump_1d56
            jump_1d40:
/*0x1d40*/      str r0, [r4, #0x1c]
/*0x1d42*/      ldrb r0, [r0]
/*0x1d44*/      b jump_1d50
            jump_1d46:
/*0x1d46*/      ldr r0, [r4, #8]
/*0x1d48*/      b jump_1d40
            jump_1d4a:
/*0x1d4a*/      ldr r0, [r4, #0xc]
/*0x1d4c*/      str r0, [r4, #0x1c]
/*0x1d4e*/      ldrh r0, [r0, #2]
            jump_1d50:
/*0x1d50*/      str r0, [r4, #0x20]
            jump_1d52:
/*0x1d52*/      strb.w r5, [r4, #0x24]
            jump_1d56:
/*0x1d56*/      pop {r4, r5, r6, pc}
            jump_1d58:
/*0x1d58*/      ldr r0, [r1, #8]
/*0x1d5a*/      b jump_1cee
            jump_1d5c:
/*0x1d5c*/      ldrb r0, [r4, #2]
/*0x1d5e*/      strb.w r0, [r4, #0x30]
/*0x1d62*/      strb.w r5, [r4, #0x24]
/*0x1d66*/      movs r5, #1
            jump_1d68:
/*0x1d68*/      ldr r1, [pc, #0x1c] /* data_1d88 */
/*0x1d6a*/      sxtb r0, r5
/*0x1d6c*/      bl call_13c0
/*0x1d70*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x1d72*/      cmp r5, #8
/*0x1d74*/      blo jump_1d68
/*0x1d76*/      movs r0, #6
            jump_1d78:
/*0x1d78*/      strb.w r0, [r4, #0x32]
/*0x1d7c*/      pop {r4, r5, r6, pc}
            jump_1d7e:
/*0x1d7e*/      ldr r0, [r1, #0x10]
/*0x1d80*/      b jump_1cee

/*0x1d82*/  .byte 0x00
/*0x1d83*/  .byte 0x00

            data_1d84:
/*0x1d84*/  .word 0x00002298 /* possible pointer */
            data_1d88:
/*0x1d88*/  .word 0x20000040

            jump_1d8c:
/*0x1d8c*/      push {r4, r5, r6, lr}
/*0x1d8e*/      mov r4, r0
/*0x1d90*/      movs r6, #1
/*0x1d92*/      cbz r1, jump_1dae
/*0x1d94*/      cmp r1, #2
/*0x1d96*/      bne jump_1dac
/*0x1d98*/      ldrb r0, [r4, #4]
/*0x1d9a*/      ands r5, r0, #0xf
/*0x1d9e*/      beq jump_1da8
/*0x1da0*/      cbz r2, jump_1dc4
/*0x1da2*/      mov r0, r5
/*0x1da4*/      bl call_146c
            jump_1da8:
/*0x1da8*/      strb.w r6, [r4, #0x24]
            jump_1dac:
/*0x1dac*/      pop {r4, r5, r6, pc}
            jump_1dae:
/*0x1dae*/      ldrb r0, [r4, #2]
/*0x1db0*/      cmp r0, #1
/*0x1db2*/      bne jump_1dac
/*0x1db4*/      ldrb r0, [r4, #0x34]!
/*0x1db8*/      bfi r0, r2, #1, #1
/*0x1dbc*/      strb r0, [r4], #-0x10
/*0x1dc0*/      strb r6, [r4]
/*0x1dc2*/      pop {r4, r5, r6, pc}
            jump_1dc4:
/*0x1dc4*/      ldr r0, [r4, #0x38]
/*0x1dc6*/      cmp r0, #0
/*0x1dc8*/      bne jump_1da8
/*0x1dca*/      mov r0, r5
/*0x1dcc*/      bl call_1320
/*0x1dd0*/      mov r0, r5
/*0x1dd2*/      bl call_1310
/*0x1dd6*/      b jump_1da8

            .thumb_func
            call_1dd8:
/*0x1dd8*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1dda*/      bmi jump_1de6
/*0x1ddc*/      ldr.w r3, [r0, r2, lsl #2]
/*0x1de0*/      str.w r3, [r1, r2, lsl #2]
/*0x1de4*/      b call_1dd8
            jump_1de6:
/*0x1de6*/      bx lr

            .thumb_func
            call_1de8:
/*0x1de8*/      ldr r1, [pc, #8] /* data_1df4 */
/*0x1dea*/      add.w r0, r0, r0, lsl #2
/*0x1dee*/      add.w r0, r1, r0, lsl #2
/*0x1df2*/      bx lr

            data_1df4:
/*0x1df4*/  .word 0x400a8014


            .thumb_func
            call_1df8:
/*0x1df8*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1dfc*/      movs r7, #0
/*0x1dfe*/      mov.w r1, #0x8000
/*0x1e02*/      mov r2, r7
/*0x1e04*/      mov sl, r1
/*0x1e06*/      movs r3, #1
/*0x1e08*/      mov r0, r2
/*0x1e0a*/      bl call_2cc
/*0x1e0e*/      ldr r0, [pc, #0x90] /* data_1ea0 */
/*0x1e10*/      bl call_10a8
/*0x1e14*/      ldr r5, [pc, #0x8c] /* data_1ea4 */
/*0x1e16*/      mov r4, r0
/*0x1e18*/      movw r6, #0xeae0
/*0x1e1c*/      cmp r0, #1
/*0x1e1e*/      bne jump_1e2e
/*0x1e20*/      ldr r0, [r5, #0x54]
/*0x1e22*/      orrs r0, r6
/*0x1e24*/      str r0, [r5, #0x54]
/*0x1e26*/      str r6, [r5, #0x58]
/*0x1e28*/      ldr r0, [r5, #0x50]
/*0x1e2a*/      orrs r0, r6
/*0x1e2c*/      str r0, [r5, #0x50]
            jump_1e2e:
/*0x1e2e*/      ldr.w r8, [pc, #0x70] /* data_1ea0 */
/*0x1e32*/      ldrb.w r0, [r8, #0x32]
/*0x1e36*/      cmp r0, #3
/*0x1e38*/      bne jump_1e78
/*0x1e3a*/      ldr.w sb, [pc, #0x6c] /* data_1ea8 */
/*0x1e3e*/      ldr.w r0, [sb]
/*0x1e42*/      tst.w r0, #0xc0
/*0x1e46*/      beq jump_1e78
/*0x1e48*/      movs r0, #1
/*0x1e4a*/      bl call_55c
/*0x1e4e*/      ldr r1, [pc, #0x5c] /* data_1eac */
/*0x1e50*/      strb r7, [r1, #4]
/*0x1e52*/      ldrb.w r0, [r8, #0x32]
/*0x1e56*/      cmp r0, #3
/*0x1e58*/      bne jump_1e78
/*0x1e5a*/      ldr.w r0, [sb]
/*0x1e5e*/      tst.w r0, #0xc0
/*0x1e62*/      beq jump_1e78
/*0x1e64*/      bl call_169c
/*0x1e68*/      mov.w r0, #0x3e8
/*0x1e6c*/      bl call_102
/*0x1e70*/      str r6, [r5, #0x58]
/*0x1e72*/      movs r0, #0
/*0x1e74*/      bl call_720
            jump_1e78:
/*0x1e78*/      ldr r0, [r5, #0x58]
/*0x1e7a*/      tst r0, r6
/*0x1e7c*/      beq jump_1e90
/*0x1e7e*/      cmp r4, #1
/*0x1e80*/      bne jump_1e90
/*0x1e82*/      ldr r0, [pc, #0x1c] /* data_1ea0 */
/*0x1e84*/      bl call_1234
/*0x1e88*/      cmp r0, #1
/*0x1e8a*/      bne jump_1e90
/*0x1e8c*/      bl call_1244
            jump_1e90:
/*0x1e90*/      mov r2, r7
/*0x1e92*/      mov r1, sl
/*0x1e94*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1e98*/      movs r3, #0
/*0x1e9a*/      mov r0, r2
/*0x1e9c*/      b.w call_2cc

            data_1ea0:
/*0x1ea0*/  .word 0x20000304
            data_1ea4:
/*0x1ea4*/  .word 0x40024000
            data_1ea8:
/*0x1ea8*/  .word 0x400a8000
            data_1eac:
/*0x1eac*/  .word 0x2000001c


            .thumb_func
            function_1eb0:
/*0x1eb0*/      b jump_1eb8
            jump_1eb2:
/*0x1eb2*/      ldm r0!, {r3}
/*0x1eb4*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x1eb6*/      stm r1!, {r3}
            jump_1eb8:
/*0x1eb8*/      cmp r2, #0
/*0x1eba*/      bne jump_1eb2
/*0x1ebc*/      bx lr

            .thumb_func
            function_1ebe:
/*0x1ebe*/      movs r0, #0
/*0x1ec0*/      b jump_1ec6
            jump_1ec2:
/*0x1ec2*/      stm r1!, {r0}
/*0x1ec4*/      .short 0x1f12 /* subs r2, r2, #4 */ 
            jump_1ec6:
/*0x1ec6*/      cmp r2, #0
/*0x1ec8*/      bne jump_1ec2
/*0x1eca*/      bx lr

            .thumb_func
            call_1ecc:
/*0x1ecc*/      mov.w r0, #0x3400
/*0x1ed0*/      ldr r1, [r0]
/*0x1ed2*/      sub.w r1, r1, #0x20000000
/*0x1ed6*/      cmp.w r1, #0x4000
/*0x1eda*/      bhi jump_1f26
/*0x1edc*/      adds r1, r0, #4
/*0x1ede*/      ldr r1, [r1]
/*0x1ee0*/      sub.w r1, r1, #0x3400
/*0x1ee4*/      cmp.w r1, #0xc800
/*0x1ee8*/      bhs jump_1f26
/*0x1eea*/      movw r1, #0x3bf8
/*0x1eee*/      ldr r1, [r1]
/*0x1ef0*/      cmp.w r1, #0x3040000
/*0x1ef4*/      bne jump_1f26
/*0x1ef6*/      mov.w r1, #0x3000
/*0x1efa*/      ldr.w r1, [r1, #0xb0]
/*0x1efe*/      ubfx r2, r1, #0, #0x12
/*0x1f02*/      sub.w r3, r2, #0x5a00
/*0x1f06*/      subs r3, #0xa5
/*0x1f08*/      bne jump_1f26
/*0x1f0a*/      lsrs r2, r1, #0x12
/*0x1f0c*/      cmp r2, #0xe
/*0x1f0e*/      bhi jump_1f26
/*0x1f10*/      movw r1, #0x3078
/*0x1f14*/      b jump_1f1e
            jump_1f16:
/*0x1f16*/      ldr r3, [r1]
/*0x1f18*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x1f1a*/      beq jump_1f26
/*0x1f1c*/      .short 0x1d09 /* adds r1, r1, #4 */ 
            jump_1f1e:
/*0x1f1e*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1f20*/      bhs jump_1f16
/*0x1f22*/      b.w load_jump_fw
            jump_1f26:
/*0x1f26*/      bx lr

            .thumb_func
            main:
/*0x1f28*/      ldr r0, [pc, #0x90] /* data_1fbc */
/*0x1f2a*/      ldr r3, [r0]
/*0x1f2c*/      ldr r2, [pc, #0x90] /* data_1fc0 */
/*0x1f2e*/      adds r1, r2, #5
/*0x1f30*/      cmp r3, r2
/*0x1f32*/      blo jump_1f3a
/*0x1f34*/      ldr r3, [r0]
/*0x1f36*/      cmp r3, r1
/*0x1f38*/      bls jump_1f3e
            jump_1f3a:
/*0x1f3a*/      str r2, [r0]
/*0x1f3c*/      b jump_1f4a
            jump_1f3e:
/*0x1f3e*/      ldr r2, [r0]
/*0x1f40*/      cmp r2, r1
/*0x1f42*/      bhs jump_1f4a
/*0x1f44*/      ldr r2, [r0]
/*0x1f46*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1f48*/      b jump_1f3a
            jump_1f4a:
/*0x1f4a*/      ldr r0, [r0]
/*0x1f4c*/      cmp r0, r1
/*0x1f4e*/      beq jump_1f54
/*0x1f50*/      bl call_1ecc
            jump_1f54:
/*0x1f54*/      bl call_5ec
/*0x1f58*/      bl call_214
/*0x1f5c*/      bl call_bcc
/*0x1f60*/      bl call_6d0
/*0x1f64*/      bl call_cec
/*0x1f68*/      bl call_5c8
/*0x1f6c*/      movs r0, #1
/*0x1f6e*/      bl call_55c
/*0x1f72*/      bl call_1260
/*0x1f76*/      ldr r4, [pc, #0x4c] /* data_1fc4 */
            jump_1f78:
/*0x1f78*/      bl call_15e4
/*0x1f7c*/      cmp r0, #1
/*0x1f7e*/      beq jump_1f90
/*0x1f80*/      cmp r0, #2
/*0x1f82*/      beq jump_1fa4
/*0x1f84*/      cmp r0, #3
/*0x1f86*/      bne jump_1fb6
/*0x1f88*/      movs r0, #1
/*0x1f8a*/      bl call_55c
/*0x1f8e*/      b jump_1fb6
            jump_1f90:
/*0x1f90*/      movs r0, #0
/*0x1f92*/      bl call_55c
/*0x1f96*/      bl call_e48
/*0x1f9a*/      bl call_700
/*0x1f9e*/      movs r0, #0
/*0x1fa0*/      bl call_b74
            jump_1fa4:
/*0x1fa4*/      bl call_828
/*0x1fa8*/      bl call_b10
/*0x1fac*/      ldrb r0, [r4]
/*0x1fae*/      cbnz r0, jump_1fb6
/*0x1fb0*/      movs r0, #1
/*0x1fb2*/      bl call_7b0
            jump_1fb6:
/*0x1fb6*/      bl call_169c
/*0x1fba*/      b jump_1f78

            data_1fbc:
/*0x1fbc*/  .word 0x20003ffc
            data_1fc0:
/*0x1fc0*/  .word 0x55aafaf0
            data_1fc4:
/*0x1fc4*/  .word 0x20000004

            data_1fc8:
/*0x1fc8*/  .byte 0x01
/*0x1fc9*/  .byte 0x23
/*0x1fca*/  .byte 0x45
/*0x1fcb*/  .byte 0x67
/*0x1fcc*/  .byte 0x89
/*0x1fcd*/  .byte 0xab
/*0x1fce*/  .byte 0xcd
/*0x1fcf*/  .byte 0xef
/*0x1fd0*/  .byte 0x08
/*0x1fd1*/  .byte 0x09
/*0x1fd2*/  .byte 0x0a
/*0x1fd3*/  .byte 0x0b
/*0x1fd4*/  .byte 0x0c
/*0x1fd5*/  .byte 0x0d
/*0x1fd6*/  .byte 0x0e
/*0x1fd7*/  .byte 0x0f
/*0x1fd8*/  .byte 0x10
/*0x1fd9*/  .byte 0x11
/*0x1fda*/  .byte 0x12
/*0x1fdb*/  .byte 0x13
/*0x1fdc*/  .byte 0x14
/*0x1fdd*/  .byte 0x15
/*0x1fde*/  .byte 0x16
/*0x1fdf*/  .byte 0x17
/*0x1fe0*/  .byte 0x18
/*0x1fe1*/  .byte 0x19
/*0x1fe2*/  .byte 0x1a
/*0x1fe3*/  .byte 0x1b
/*0x1fe4*/  .byte 0x1c
/*0x1fe5*/  .byte 0x1d
/*0x1fe6*/  .byte 0x1e
/*0x1fe7*/  .byte 0x1f
/*0x1fe8*/  .byte 0x20
/*0x1fe9*/  .byte 0x21
/*0x1fea*/  .byte 0x22
/*0x1feb*/  .byte 0x23
/*0x1fec*/  .byte 0x24
/*0x1fed*/  .byte 0x25
/*0x1fee*/  .byte 0x26
/*0x1fef*/  .byte 0x27
/*0x1ff0*/  .byte 0x28
/*0x1ff1*/  .byte 0x29
/*0x1ff2*/  .byte 0x2a
/*0x1ff3*/  .byte 0x2b
/*0x1ff4*/  .byte 0x2c
/*0x1ff5*/  .byte 0x2d
/*0x1ff6*/  .byte 0x2e
/*0x1ff7*/  .byte 0x2f
/*0x1ff8*/  .byte 0x30
/*0x1ff9*/  .byte 0x31
/*0x1ffa*/  .byte 0x32
/*0x1ffb*/  .byte 0x33
/*0x1ffc*/  .byte 0x34
/*0x1ffd*/  .byte 0x35
/*0x1ffe*/  .byte 0x36
/*0x1fff*/  .byte 0x37
/*0x2000*/  .byte 0x38
/*0x2001*/  .byte 0x39
/*0x2002*/  .byte 0x3a
/*0x2003*/  .byte 0x3b
/*0x2004*/  .byte 0x3c
/*0x2005*/  .byte 0x3d
/*0x2006*/  .byte 0x3e
/*0x2007*/  .byte 0x3f
/*0x2008*/  .byte 0x29
/*0x2009*/  .byte 0x1e
/*0x200a*/  .byte 0x1f
/*0x200b*/  .byte 0x20
/*0x200c*/  .byte 0x21
/*0x200d*/  .byte 0x22
/*0x200e*/  .byte 0x23
/*0x200f*/  .byte 0x24
/*0x2010*/  .byte 0x2b
/*0x2011*/  .byte 0x14
/*0x2012*/  .byte 0x1a
/*0x2013*/  .byte 0x08
/*0x2014*/  .byte 0x15
/*0x2015*/  .byte 0x17
/*0x2016*/  .byte 0x1c
/*0x2017*/  .byte 0x18
/*0x2018*/  .byte 0x39
/*0x2019*/  .byte 0x04
/*0x201a*/  .byte 0x16
/*0x201b*/  .byte 0x07
/*0x201c*/  .byte 0x09
/*0x201d*/  .byte 0x0a
/*0x201e*/  .byte 0x0b
/*0x201f*/  .byte 0x0d
/*0x2020*/  .byte 0xe1
/*0x2021*/  .byte 0x1d
/*0x2022*/  .byte 0x1b
/*0x2023*/  .byte 0x06
/*0x2024*/  .byte 0x19
/*0x2025*/  .byte 0x05
/*0x2026*/  .byte 0x11
/*0x2027*/  .byte 0x10
/*0x2028*/  .byte 0xe0
/*0x2029*/  .byte 0xe3
/*0x202a*/  .byte 0xe2
/*0x202b*/  .byte 0x25
/*0x202c*/  .byte 0x26
/*0x202d*/  .byte 0x27
/*0x202e*/  .byte 0x2d
/*0x202f*/  .byte 0x2a
/*0x2030*/  .byte 0x64
/*0x2031*/  .byte 0x00
/*0x2032*/  .byte 0x2e
/*0x2033*/  .byte 0x0c
/*0x2034*/  .byte 0x12
/*0x2035*/  .byte 0x13
/*0x2036*/  .byte 0x2f
/*0x2037*/  .byte 0x31
/*0x2038*/  .byte 0x00
/*0x2039*/  .byte 0x32
/*0x203a*/  .byte 0x30
/*0x203b*/  .byte 0x0e
/*0x203c*/  .byte 0x0f
/*0x203d*/  .byte 0x33
/*0x203e*/  .byte 0x34
/*0x203f*/  .byte 0x28
/*0x2040*/  .byte 0x00
/*0x2041*/  .byte 0x00
/*0x2042*/  .byte 0x2c
/*0x2043*/  .byte 0x36
/*0x2044*/  .byte 0x37
/*0x2045*/  .byte 0x38
/*0x2046*/  .byte 0xe5
/*0x2047*/  .byte 0x35
/*0x2048*/  .byte 0x00
/*0x2049*/  .byte 0x00
/*0x204a*/  .byte 0x00
/*0x204b*/  .byte 0xe6
/*0x204c*/  .byte 0xe7
/*0x204d*/  .byte 0x65
/*0x204e*/  .byte 0x00
/*0x204f*/  .byte 0xe4
/*0x2050*/  .byte 0xc0
/*0x2051*/  .byte 0xc1
/*0x2052*/  .byte 0xc2
/*0x2053*/  .byte 0xc3
/*0x2054*/  .byte 0x00
/*0x2055*/  .byte 0x00
/*0x2056*/  .byte 0x00
/*0x2057*/  .byte 0x00
/*0x2058*/  .byte 0x00
/*0x2059*/  .byte 0x40
/*0x205a*/  .byte 0x0b
/*0x205b*/  .byte 0x40
/*0x205c*/  .byte 0x00
/*0x205d*/  .byte 0x02
/*0x205e*/  .byte 0x00
/*0x205f*/  .byte 0x00
/*0x2060*/  .byte 0x00
/*0x2061*/  .byte 0x00
/*0x2062*/  .byte 0x0b
/*0x2063*/  .byte 0x40
/*0x2064*/  .byte 0x20
/*0x2065*/  .byte 0x00
/*0x2066*/  .byte 0x00
/*0x2067*/  .byte 0x00
/*0x2068*/  .byte 0x00
/*0x2069*/  .byte 0x00
/*0x206a*/  .byte 0x0b
/*0x206b*/  .byte 0x40
/*0x206c*/  .byte 0x40
/*0x206d*/  .byte 0x00
/*0x206e*/  .byte 0x00
/*0x206f*/  .byte 0x00
/*0x2070*/  .byte 0x00
/*0x2071*/  .byte 0x00
/*0x2072*/  .byte 0x0b
/*0x2073*/  .byte 0x40
/*0x2074*/  .byte 0x80
/*0x2075*/  .byte 0x00
/*0x2076*/  .byte 0x00
/*0x2077*/  .byte 0x00
/*0x2078*/  .byte 0x00
/*0x2079*/  .byte 0x40
/*0x207a*/  .byte 0x0b
/*0x207b*/  .byte 0x40
/*0x207c*/  .byte 0x00
/*0x207d*/  .byte 0x08
/*0x207e*/  .byte 0x00
/*0x207f*/  .byte 0x00
/*0x2080*/  .byte 0x00
/*0x2081*/  .byte 0x40
/*0x2082*/  .byte 0x0b
/*0x2083*/  .byte 0x40
/*0x2084*/  .byte 0x00
/*0x2085*/  .byte 0x20
/*0x2086*/  .byte 0x00
/*0x2087*/  .byte 0x00
/*0x2088*/  .byte 0x00
/*0x2089*/  .byte 0x40
/*0x208a*/  .byte 0x0b
/*0x208b*/  .byte 0x40
/*0x208c*/  .byte 0x00
/*0x208d*/  .byte 0x40
/*0x208e*/  .byte 0x00
/*0x208f*/  .byte 0x00
/*0x2090*/  .byte 0x00
/*0x2091*/  .byte 0x40
/*0x2092*/  .byte 0x0b
/*0x2093*/  .byte 0x40
/*0x2094*/  .byte 0x00
/*0x2095*/  .byte 0x80
/*0x2096*/  .byte 0x00
/*0x2097*/  .byte 0x00
/*0x2098*/  .byte 0x02
/*0x2099*/  .byte 0x09
/*0x209a*/  .byte 0x00
/*0x209b*/  .byte 0x05
/*0x209c*/  .byte 0x00
/*0x209d*/  .byte 0x06
/*0x209e*/  .byte 0x00
/*0x209f*/  .byte 0x07
/*0x20a0*/  .byte 0x02
/*0x20a1*/  .byte 0x0b
/*0x20a2*/  .byte 0x02
/*0x20a3*/  .byte 0x0d
/*0x20a4*/  .byte 0x02
/*0x20a5*/  .byte 0x0e
/*0x20a6*/  .byte 0x02
/*0x20a7*/  .byte 0x0f
/*0x20a8*/  .byte 0x00
/*0x20a9*/  .byte 0x40
/*0x20aa*/  .byte 0x0b
/*0x20ab*/  .byte 0x40
/*0x20ac*/  .byte 0x10
/*0x20ad*/  .byte 0x00
/*0x20ae*/  .byte 0x00
/*0x20af*/  .byte 0x00
/*0x20b0*/  .byte 0x00
/*0x20b1*/  .byte 0x20
/*0x20b2*/  .byte 0x0b
/*0x20b3*/  .byte 0x40
/*0x20b4*/  .byte 0x40
/*0x20b5*/  .byte 0x00
/*0x20b6*/  .byte 0x00
/*0x20b7*/  .byte 0x00
/*0x20b8*/  .byte 0x00
/*0x20b9*/  .byte 0x60
/*0x20ba*/  .byte 0x0b
/*0x20bb*/  .byte 0x40
/*0x20bc*/  .byte 0x01
/*0x20bd*/  .byte 0x00
/*0x20be*/  .byte 0x00
/*0x20bf*/  .byte 0x00
/*0x20c0*/  .byte 0x00
/*0x20c1*/  .byte 0x20
/*0x20c2*/  .byte 0x0b
/*0x20c3*/  .byte 0x40
/*0x20c4*/  .byte 0x00
/*0x20c5*/  .byte 0x08
/*0x20c6*/  .byte 0x00
/*0x20c7*/  .byte 0x00
/*0x20c8*/  .byte 0x00
/*0x20c9*/  .byte 0x00
/*0x20ca*/  .byte 0x0b
/*0x20cb*/  .byte 0x40
/*0x20cc*/  .byte 0x00
/*0x20cd*/  .byte 0x08
/*0x20ce*/  .byte 0x00
/*0x20cf*/  .byte 0x00
/*0x20d0*/  .byte 0x00
/*0x20d1*/  .byte 0x00
/*0x20d2*/  .byte 0x0b
/*0x20d3*/  .byte 0x40
/*0x20d4*/  .byte 0x01
/*0x20d5*/  .byte 0x00
/*0x20d6*/  .byte 0x00
/*0x20d7*/  .byte 0x00
/*0x20d8*/  .byte 0x00
/*0x20d9*/  .byte 0x00
/*0x20da*/  .byte 0x0b
/*0x20db*/  .byte 0x40
/*0x20dc*/  .byte 0x02
/*0x20dd*/  .byte 0x00
/*0x20de*/  .byte 0x00
/*0x20df*/  .byte 0x00
/*0x20e0*/  .byte 0x00
/*0x20e1*/  .byte 0x00
/*0x20e2*/  .byte 0x0b
/*0x20e3*/  .byte 0x40
/*0x20e4*/  .byte 0x04
/*0x20e5*/  .byte 0x00
/*0x20e6*/  .byte 0x00
/*0x20e7*/  .byte 0x00
/*0x20e8*/  .byte 0x00
/*0x20e9*/  .byte 0x00
/*0x20ea*/  .byte 0x0b
/*0x20eb*/  .byte 0x40
/*0x20ec*/  .byte 0x08
/*0x20ed*/  .byte 0x00
/*0x20ee*/  .byte 0x00
/*0x20ef*/  .byte 0x00
/*0x20f0*/  .byte 0x00
/*0x20f1*/  .byte 0x00
/*0x20f2*/  .byte 0x0b
/*0x20f3*/  .byte 0x40
/*0x20f4*/  .byte 0x10
/*0x20f5*/  .byte 0x00
/*0x20f6*/  .byte 0x00
/*0x20f7*/  .byte 0x00
/*0x20f8*/  .byte 0x00
/*0x20f9*/  .byte 0x40
/*0x20fa*/  .byte 0x0b
/*0x20fb*/  .byte 0x40
/*0x20fc*/  .byte 0x00
/*0x20fd*/  .byte 0x01
/*0x20fe*/  .byte 0x00
/*0x20ff*/  .byte 0x00
/*0x2100*/  .byte 0x00
/*0x2101*/  .byte 0x40
/*0x2102*/  .byte 0x0b
/*0x2103*/  .byte 0x40
/*0x2104*/  .byte 0x80
/*0x2105*/  .byte 0x00
/*0x2106*/  .byte 0x00
/*0x2107*/  .byte 0x00
/*0x2108*/  .byte 0x00
/*0x2109*/  .byte 0x20
/*0x210a*/  .byte 0x0b
/*0x210b*/  .byte 0x40
/*0x210c*/  .byte 0x20
/*0x210d*/  .byte 0x00
/*0x210e*/  .byte 0x00
/*0x210f*/  .byte 0x00
/*0x2110*/  .byte 0x00
/*0x2111*/  .byte 0x20
/*0x2112*/  .byte 0x0b
/*0x2113*/  .byte 0x40
/*0x2114*/  .byte 0x10
/*0x2115*/  .byte 0x00
/*0x2116*/  .byte 0x00
/*0x2117*/  .byte 0x00
/*0x2118*/  .byte 0x00
/*0x2119*/  .byte 0x20
/*0x211a*/  .byte 0x0b
/*0x211b*/  .byte 0x40
/*0x211c*/  .byte 0x08
/*0x211d*/  .byte 0x00
/*0x211e*/  .byte 0x00
/*0x211f*/  .byte 0x00
/*0x2120*/  .byte 0x00
/*0x2121*/  .byte 0x20
/*0x2122*/  .byte 0x0b
/*0x2123*/  .byte 0x40
/*0x2124*/  .byte 0x04
/*0x2125*/  .byte 0x00
/*0x2126*/  .byte 0x00
/*0x2127*/  .byte 0x00
/*0x2128*/  .byte 0x00
/*0x2129*/  .byte 0x40
/*0x212a*/  .byte 0x0b
/*0x212b*/  .byte 0x40
/*0x212c*/  .byte 0x40
/*0x212d*/  .byte 0x00
/*0x212e*/  .byte 0x00
/*0x212f*/  .byte 0x00
/*0x2130*/  .byte 0x00
/*0x2131*/  .byte 0x40
/*0x2132*/  .byte 0x0b
/*0x2133*/  .byte 0x40
/*0x2134*/  .byte 0x20
/*0x2135*/  .byte 0x00
/*0x2136*/  .byte 0x00
/*0x2137*/  .byte 0x00
/*0x2138*/  .byte 0x34
/*0x2139*/  .byte 0x04
/*0x213a*/  .byte 0x00
/*0x213b*/  .byte 0x00
/*0x213c*/  .byte 0x7c
/*0x213d*/  .byte 0x22
/*0x213e*/  .byte 0x00
/*0x213f*/  .byte 0x00
/*0x2140*/  .byte 0x06
/*0x2141*/  .byte 0x00
/*0x2142*/  .byte 0xff
/*0x2143*/  .byte 0x09
/*0x2144*/  .byte 0x01
/*0x2145*/  .byte 0xa1
/*0x2146*/  .byte 0x01
/*0x2147*/  .byte 0x09
/*0x2148*/  .byte 0x02
/*0x2149*/  .byte 0x15
/*0x214a*/  .byte 0x00
/*0x214b*/  .byte 0x26
/*0x214c*/  .byte 0xff
/*0x214d*/  .byte 0x00
/*0x214e*/  .byte 0x75
/*0x214f*/  .byte 0x08
/*0x2150*/  .byte 0x95
/*0x2151*/  .byte 0x40
/*0x2152*/  .byte 0x81
/*0x2153*/  .byte 0x02
/*0x2154*/  .byte 0x09
/*0x2155*/  .byte 0x03
/*0x2156*/  .byte 0x15
/*0x2157*/  .byte 0x00
/*0x2158*/  .byte 0x26
/*0x2159*/  .byte 0xff
/*0x215a*/  .byte 0x00
/*0x215b*/  .byte 0x75
/*0x215c*/  .byte 0x08
/*0x215d*/  .byte 0x95
/*0x215e*/  .byte 0x40
/*0x215f*/  .byte 0x91
/*0x2160*/  .byte 0x02
/*0x2161*/  .byte 0xc0
/*0x2162*/  .byte 0x00
/*0x2163*/  .byte 0x00
/*0x2164*/  .byte 0x05
/*0x2165*/  .byte 0x01
/*0x2166*/  .byte 0x09
/*0x2167*/  .byte 0x80
/*0x2168*/  .byte 0xa1
/*0x2169*/  .byte 0x01
/*0x216a*/  .byte 0x85
/*0x216b*/  .byte 0x01
/*0x216c*/  .byte 0x19
/*0x216d*/  .byte 0x81
/*0x216e*/  .byte 0x29
/*0x216f*/  .byte 0x83
/*0x2170*/  .byte 0x15
/*0x2171*/  .byte 0x00
/*0x2172*/  .byte 0x25
/*0x2173*/  .byte 0x01
/*0x2174*/  .byte 0x95
/*0x2175*/  .byte 0x03
/*0x2176*/  .byte 0x75
/*0x2177*/  .byte 0x01
/*0x2178*/  .byte 0x81
/*0x2179*/  .byte 0x02
/*0x217a*/  .byte 0x95
/*0x217b*/  .byte 0x01
/*0x217c*/  .byte 0x75
/*0x217d*/  .byte 0x05
/*0x217e*/  .byte 0x81
/*0x217f*/  .byte 0x01
/*0x2180*/  .byte 0xc0
/*0x2181*/  .byte 0x05
/*0x2182*/  .byte 0x0c
/*0x2183*/  .byte 0x09
/*0x2184*/  .byte 0x01
/*0x2185*/  .byte 0xa1
/*0x2186*/  .byte 0x01
/*0x2187*/  .byte 0x85
/*0x2188*/  .byte 0x02
/*0x2189*/  .byte 0x15
/*0x218a*/  .byte 0x00
/*0x218b*/  .byte 0x25
/*0x218c*/  .byte 0x01
/*0x218d*/  .byte 0x95
/*0x218e*/  .byte 0x12
/*0x218f*/  .byte 0x75
/*0x2190*/  .byte 0x01
/*0x2191*/  .byte 0x0a
/*0x2192*/  .byte 0x83
/*0x2193*/  .byte 0x01
/*0x2194*/  .byte 0x0a
/*0x2195*/  .byte 0x8a
/*0x2196*/  .byte 0x01
/*0x2197*/  .byte 0x0a
/*0x2198*/  .byte 0x92
/*0x2199*/  .byte 0x01
/*0x219a*/  .byte 0x0a
/*0x219b*/  .byte 0x94
/*0x219c*/  .byte 0x01
/*0x219d*/  .byte 0x09
/*0x219e*/  .byte 0xcd
/*0x219f*/  .byte 0x09
/*0x21a0*/  .byte 0xb7
/*0x21a1*/  .byte 0x09
/*0x21a2*/  .byte 0xb6
/*0x21a3*/  .byte 0x09
/*0x21a4*/  .byte 0xb5
/*0x21a5*/  .byte 0x09
/*0x21a6*/  .byte 0xe2
/*0x21a7*/  .byte 0x09
/*0x21a8*/  .byte 0xea
/*0x21a9*/  .byte 0x09
/*0x21aa*/  .byte 0xe9
/*0x21ab*/  .byte 0x0a
/*0x21ac*/  .byte 0x21
/*0x21ad*/  .byte 0x02
/*0x21ae*/  .byte 0x0a
/*0x21af*/  .byte 0x23
/*0x21b0*/  .byte 0x02
/*0x21b1*/  .byte 0x0a
/*0x21b2*/  .byte 0x24
/*0x21b3*/  .byte 0x02
/*0x21b4*/  .byte 0x0a
/*0x21b5*/  .byte 0x25
/*0x21b6*/  .byte 0x02
/*0x21b7*/  .byte 0x0a
/*0x21b8*/  .byte 0x26
/*0x21b9*/  .byte 0x02
/*0x21ba*/  .byte 0x0a
/*0x21bb*/  .byte 0x27
/*0x21bc*/  .byte 0x02
/*0x21bd*/  .byte 0x0a
/*0x21be*/  .byte 0x2a
/*0x21bf*/  .byte 0x02
/*0x21c0*/  .byte 0x81
/*0x21c1*/  .byte 0x02
/*0x21c2*/  .byte 0x95
/*0x21c3*/  .byte 0x01
/*0x21c4*/  .byte 0x75
/*0x21c5*/  .byte 0x0e
/*0x21c6*/  .byte 0x81
/*0x21c7*/  .byte 0x01
/*0x21c8*/  .byte 0xc0
/*0x21c9*/  .byte 0x00
/*0x21ca*/  .byte 0x00
/*0x21cb*/  .byte 0x00
/*0x21cc*/  .byte 0x05
/*0x21cd*/  .byte 0x01
/*0x21ce*/  .byte 0x09
/*0x21cf*/  .byte 0x06
/*0x21d0*/  .byte 0xa1
/*0x21d1*/  .byte 0x01
/*0x21d2*/  .byte 0x05
/*0x21d3*/  .byte 0x07
/*0x21d4*/  .byte 0x19
/*0x21d5*/  .byte 0xe0
/*0x21d6*/  .byte 0x29
/*0x21d7*/  .byte 0xe7
/*0x21d8*/  .byte 0x15
/*0x21d9*/  .byte 0x00
/*0x21da*/  .byte 0x25
/*0x21db*/  .byte 0x01
/*0x21dc*/  .byte 0x75
/*0x21dd*/  .byte 0x01
/*0x21de*/  .byte 0x95
/*0x21df*/  .byte 0x08
/*0x21e0*/  .byte 0x81
/*0x21e1*/  .byte 0x02
/*0x21e2*/  .byte 0x95
/*0x21e3*/  .byte 0x01
/*0x21e4*/  .byte 0x75
/*0x21e5*/  .byte 0x08
/*0x21e6*/  .byte 0x81
/*0x21e7*/  .byte 0x03
/*0x21e8*/  .byte 0x95
/*0x21e9*/  .byte 0x03
/*0x21ea*/  .byte 0x75
/*0x21eb*/  .byte 0x01
/*0x21ec*/  .byte 0x05
/*0x21ed*/  .byte 0x08
/*0x21ee*/  .byte 0x19
/*0x21ef*/  .byte 0x01
/*0x21f0*/  .byte 0x29
/*0x21f1*/  .byte 0x03
/*0x21f2*/  .byte 0x91
/*0x21f3*/  .byte 0x02
/*0x21f4*/  .byte 0x95
/*0x21f5*/  .byte 0x01
/*0x21f6*/  .byte 0x75
/*0x21f7*/  .byte 0x05
/*0x21f8*/  .byte 0x91
/*0x21f9*/  .byte 0x03
/*0x21fa*/  .byte 0x95
/*0x21fb*/  .byte 0x06
/*0x21fc*/  .byte 0x75
/*0x21fd*/  .byte 0x08
/*0x21fe*/  .byte 0x15
/*0x21ff*/  .byte 0x00
/*0x2200*/  .byte 0x26
/*0x2201*/  .byte 0xa4
/*0x2202*/  .byte 0x00
/*0x2203*/  .byte 0x05
/*0x2204*/  .byte 0x07
/*0x2205*/  .byte 0x19
/*0x2206*/  .byte 0x00
/*0x2207*/  .byte 0x29
/*0x2208*/  .byte 0xa4
/*0x2209*/  .byte 0x81
/*0x220a*/  .byte 0x00
/*0x220b*/  .byte 0xc0
/*0x220c*/  .byte 0x09
/*0x220d*/  .byte 0x02
/*0x220e*/  .byte 0x5b
/*0x220f*/  .byte 0x00
/*0x2210*/  .byte 0x03
/*0x2211*/  .byte 0x01
/*0x2212*/  .byte 0x00
/*0x2213*/  .byte 0xa0
/*0x2214*/  .byte 0x32
/*0x2215*/  .byte 0x09
/*0x2216*/  .byte 0x04
/*0x2217*/  .byte 0x00
/*0x2218*/  .byte 0x00
/*0x2219*/  .byte 0x01
/*0x221a*/  .byte 0x03
/*0x221b*/  .byte 0x01
/*0x221c*/  .byte 0x01
/*0x221d*/  .byte 0x00
/*0x221e*/  .byte 0x09
/*0x221f*/  .byte 0x21
/*0x2220*/  .byte 0x11
/*0x2221*/  .byte 0x01
/*0x2222*/  .byte 0x00
/*0x2223*/  .byte 0x01
/*0x2224*/  .byte 0x22
/*0x2225*/  .byte 0x40
/*0x2226*/  .byte 0x00
/*0x2227*/  .byte 0x07
/*0x2228*/  .byte 0x05
/*0x2229*/  .byte 0x81
/*0x222a*/  .byte 0x03
/*0x222b*/  .byte 0x08
/*0x222c*/  .byte 0x00
/*0x222d*/  .byte 0x01
/*0x222e*/  .byte 0x09
/*0x222f*/  .byte 0x04
/*0x2230*/  .byte 0x01
/*0x2231*/  .byte 0x00
/*0x2232*/  .byte 0x02
/*0x2233*/  .byte 0x03
/*0x2234*/  .byte 0x00
/*0x2235*/  .byte 0x00
/*0x2236*/  .byte 0x00
/*0x2237*/  .byte 0x09
/*0x2238*/  .byte 0x21
/*0x2239*/  .byte 0x11
/*0x223a*/  .byte 0x01
/*0x223b*/  .byte 0x00
/*0x223c*/  .byte 0x01
/*0x223d*/  .byte 0x22
/*0x223e*/  .byte 0x22
/*0x223f*/  .byte 0x00
/*0x2240*/  .byte 0x07
/*0x2241*/  .byte 0x05
/*0x2242*/  .byte 0x83
/*0x2243*/  .byte 0x03
/*0x2244*/  .byte 0x40
/*0x2245*/  .byte 0x00
/*0x2246*/  .byte 0x01
/*0x2247*/  .byte 0x07
/*0x2248*/  .byte 0x05
/*0x2249*/  .byte 0x04
/*0x224a*/  .byte 0x03
/*0x224b*/  .byte 0x40
/*0x224c*/  .byte 0x00
/*0x224d*/  .byte 0x01
/*0x224e*/  .byte 0x09
/*0x224f*/  .byte 0x04
/*0x2250*/  .byte 0x02
/*0x2251*/  .byte 0x00
/*0x2252*/  .byte 0x01
/*0x2253*/  .byte 0x03
/*0x2254*/  .byte 0x00
/*0x2255*/  .byte 0x00
/*0x2256*/  .byte 0x00
/*0x2257*/  .byte 0x09
/*0x2258*/  .byte 0x21
/*0x2259*/  .byte 0x11
/*0x225a*/  .byte 0x01
/*0x225b*/  .byte 0x00
/*0x225c*/  .byte 0x01
/*0x225d*/  .byte 0x22
/*0x225e*/  .byte 0x65
/*0x225f*/  .byte 0x00
/*0x2260*/  .byte 0x07
/*0x2261*/  .byte 0x05
/*0x2262*/  .byte 0x82
/*0x2263*/  .byte 0x03
/*0x2264*/  .byte 0x40
/*0x2265*/  .byte 0x00
/*0x2266*/  .byte 0x01
/*0x2267*/  .byte 0x00
/*0x2268*/  .byte 0x12
/*0x2269*/  .byte 0x01
/*0x226a*/  .byte 0x10
/*0x226b*/  .byte 0x01
/*0x226c*/  .byte 0x00
/*0x226d*/  .byte 0x00
/*0x226e*/  .byte 0x00
/*0x226f*/  .byte 0x40
/*0x2270*/  .byte 0xd9
/*0x2271*/  .byte 0x04
/*0x2272*/  .byte 0x07
/*0x2273*/  .byte 0x12
/*0x2274*/  .byte 0x01
/*0x2275*/  .byte 0x11
/*0x2276*/  .byte 0x00
/*0x2277*/  .byte 0x01
/*0x2278*/  .byte 0x00
/*0x2279*/  .byte 0x01
/*0x227a*/  .byte 0x00
/*0x227b*/  .byte 0x00
/*0x227c*/  .byte 0x18
/*0x227d*/  .byte 0x03
/*0x227e*/  .byte 0x55
/*0x227f*/  .byte 0x00
/*0x2280*/  .byte 0x53
/*0x2281*/  .byte 0x00
/*0x2282*/  .byte 0x42
/*0x2283*/  .byte 0x00
/*0x2284*/  .byte 0x2d
/*0x2285*/  .byte 0x00
/*0x2286*/  .byte 0x48
/*0x2287*/  .byte 0x00
/*0x2288*/  .byte 0x49
/*0x2289*/  .byte 0x00
/*0x228a*/  .byte 0x44
/*0x228b*/  .byte 0x00
/*0x228c*/  .byte 0x20
/*0x228d*/  .byte 0x00
/*0x228e*/  .byte 0x49
/*0x228f*/  .byte 0x00
/*0x2290*/  .byte 0x41
/*0x2291*/  .byte 0x00
/*0x2292*/  .byte 0x50
/*0x2293*/  .byte 0x00
/*0x2294*/  .byte 0x00
/*0x2295*/  .byte 0x00
/*0x2296*/  .byte 0x00
/*0x2297*/  .byte 0x00
/*0x2298*/  .byte 0x89
/*0x2299*/  .byte 0x10
/*0x229a*/  .byte 0x00
/*0x229b*/  .byte 0x00
/*0x229c*/  .byte 0x00
/*0x229d*/  .byte 0x00
/*0x229e*/  .byte 0x00
/*0x229f*/  .byte 0x00
/*0x22a0*/  .byte 0x1d
/*0x22a1*/  .byte 0x1b
/*0x22a2*/  .byte 0x00
/*0x22a3*/  .byte 0x00
/*0x22a4*/  .byte 0x00
/*0x22a5*/  .byte 0x00
/*0x22a6*/  .byte 0x00
/*0x22a7*/  .byte 0x00
/*0x22a8*/  .byte 0x00
/*0x22a9*/  .byte 0x00
/*0x22aa*/  .byte 0x00
/*0x22ab*/  .byte 0x00
/*0x22ac*/  .byte 0x29
/*0x22ad*/  .byte 0x1a
/*0x22ae*/  .byte 0x00
/*0x22af*/  .byte 0x00
/*0x22b0*/  .byte 0x2d
/*0x22b1*/  .byte 0x19
/*0x22b2*/  .byte 0x00
/*0x22b3*/  .byte 0x00
/*0x22b4*/  .byte 0xd4
/*0x22b5*/  .byte 0x22
/*0x22b6*/  .byte 0x00
/*0x22b7*/  .byte 0x00
/*0x22b8*/  .byte 0x00
/*0x22b9*/  .byte 0x00
/*0x22ba*/  .byte 0x00
/*0x22bb*/  .byte 0x20
/*0x22bc*/  .byte 0x40
/*0x22bd*/  .byte 0x00
/*0x22be*/  .byte 0x00
/*0x22bf*/  .byte 0x00
/*0x22c0*/  .byte 0xb0
/*0x22c1*/  .byte 0x1e
/*0x22c2*/  .byte 0x00
/*0x22c3*/  .byte 0x00
/*0x22c4*/  .byte 0x14
/*0x22c5*/  .byte 0x23
/*0x22c6*/  .byte 0x00
/*0x22c7*/  .byte 0x00
/*0x22c8*/  .byte 0x40
/*0x22c9*/  .byte 0x00
/*0x22ca*/  .byte 0x00
/*0x22cb*/  .byte 0x20
/*0x22cc*/  .byte 0x00
/*0x22cd*/  .byte 0x07
/*0x22ce*/  .byte 0x00
/*0x22cf*/  .byte 0x00
/*0x22d0*/  .byte 0xbe
/*0x22d1*/  .byte 0x1e
/*0x22d2*/  .byte 0x00
/*0x22d3*/  .byte 0x00
/*0x22d4*/  .byte 0x01
/*0x22d5*/  .byte 0x00
/*0x22d6*/  .byte 0x00
/*0x22d7*/  .byte 0x00
/*0x22d8*/  .byte 0x00
/*0x22d9*/  .byte 0x00
/*0x22da*/  .byte 0x00
/*0x22db*/  .byte 0x00
/*0x22dc*/  .byte 0x00
/*0x22dd*/  .byte 0x30
/*0x22de*/  .byte 0x00
/*0x22df*/  .byte 0x00
/*0x22e0*/  .byte 0x00
/*0x22e1*/  .byte 0x00
/*0x22e2*/  .byte 0x00
/*0x22e3*/  .byte 0x00
/*0x22e4*/  .byte 0xff
/*0x22e5*/  .byte 0x00
/*0x22e6*/  .byte 0x00
/*0x22e7*/  .byte 0x00
/*0x22e8*/  .byte 0x30
/*0x22e9*/  .byte 0x21
/*0x22ea*/  .byte 0x00
/*0x22eb*/  .byte 0x00
/*0x22ec*/  .byte 0x00
/*0x22ed*/  .byte 0xa2
/*0x22ee*/  .byte 0x4a
/*0x22ef*/  .byte 0x04
/*0x22f0*/  .byte 0x00
/*0x22f1*/  .byte 0x00
/*0x22f2*/  .byte 0x00
/*0x22f3*/  .byte 0x00
/*0x22f4*/  .byte 0x00
/*0x22f5*/  .byte 0x00
/*0x22f6*/  .byte 0x00
/*0x22f7*/  .byte 0x00
/*0x22f8*/  .byte 0x00
/*0x22f9*/  .byte 0x00
/*0x22fa*/  .byte 0x00
/*0x22fb*/  .byte 0x00
/*0x22fc*/  .byte 0x00
/*0x22fd*/  .byte 0x00
/*0x22fe*/  .byte 0x00
/*0x22ff*/  .byte 0x00
/*0x2300*/  .byte 0x00
/*0x2301*/  .byte 0x00
/*0x2302*/  .byte 0x00
/*0x2303*/  .byte 0x00
/*0x2304*/  .byte 0x00
/*0x2305*/  .byte 0x00
/*0x2306*/  .byte 0x00
/*0x2307*/  .byte 0x00
/*0x2308*/  .byte 0x00
/*0x2309*/  .byte 0x00
/*0x230a*/  .byte 0x00
/*0x230b*/  .byte 0x00
/*0x230c*/  .byte 0x00
/*0x230d*/  .byte 0x00
/*0x230e*/  .byte 0x00
/*0x230f*/  .byte 0x00
/*0x2310*/  .byte 0x00
/*0x2311*/  .byte 0x00
/*0x2312*/  .byte 0x00
/*0x2313*/  .byte 0x00
