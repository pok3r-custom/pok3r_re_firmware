.syntax unified
.cpu cortex-m3
.text
.thumb


            vectors:
/*0x0000*/  .word 0x20000628
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
            start:
/*0x0024*/      ldr r0, [pc, #0] /* data_28 */
/*0x0026*/      bx r0 /* main */

            data_28:
/*0x0028*/  .word main
            data_2c:
/*0x002c*/  .word 0x20000628


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
/*0x00a0*/      bl start

            data_a4:
/*0x00a4*/  .word data_21e0
            data_a8:
/*0x00a8*/  .word data_2200


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
            call_d8:
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
            call_f4:
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
            call_10e:
/*0x010e*/      bx lr

            .thumb_func
            systick_intr:
/*0x0110*/      bx lr

/*0x0112*/  .byte 0x70
/*0x0113*/  .byte 0x47

/*0x0114*/  .word usb_intr


            .thumb_func
            reset:
/*0x0118*/      ldr r0, [pc, #0xc] /* data_128 */
/*0x011a*/      blx r0 /* call_15fc */
/*0x011c*/      ldr r0, [pc, #0xc] /* data_12c */
/*0x011e*/      blx r0 /* call_f94 */
/*0x0120*/      ldr r0, [pc, #0xc] /* data_130 */
/*0x0122*/      bx r0 /* entry */

            .thumb_func
            generic_fault:
/*0x0124*/      b generic_fault

            .thumb_func
            generic_intr:
/*0x0126*/      b generic_intr

            data_128:
/*0x0128*/  .word call_15fc
            data_12c:
/*0x012c*/  .word call_f94
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
/*0x014e*/      bl call_f4
/*0x0152*/      pop.w {r4, lr}
/*0x0156*/      b.w jump_b78

/*0x015a*/  .byte 0x00
/*0x015b*/  .byte 0x00

            data_15c:
/*0x015c*/  .word 0x200001d4
            data_160:
/*0x0160*/  .word 0x40076000


            .thumb_func
            bftm1_intr:
/*0x0164*/      push {r4, lr}
/*0x0166*/      ldr r0, [pc, #0x4c] /* data_1b4 */
/*0x0168*/      bl call_f4
/*0x016c*/      ldr r4, [pc, #0x48] /* data_1b8 */
/*0x016e*/      ldr r0, [r4, #4]
/*0x0170*/      ldrh r1, [r0, #4]
/*0x0172*/      ldr r0, [r0]
/*0x0174*/      uxth r1, r1
/*0x0176*/      bl call_e0
/*0x017a*/      movs r0, #0xa
/*0x017c*/      bl call_102
/*0x0180*/      movs r0, #2
/*0x0182*/      bl call_1850
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
/*0x01b0*/      b.w call_f10

            data_1b4:
/*0x01b4*/  .word 0x40077000
            data_1b8:
/*0x01b8*/  .word 0x20000014
            data_1bc:
/*0x01bc*/  .word 0x400b0000
            data_1c0:
/*0x01c0*/  .word gpio_map_3


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
/*0x0234*/      bl call_370
/*0x0238*/      lsls r7, r5, #1
/*0x023a*/      movs r2, #0
/*0x023c*/      mov r1, r7
/*0x023e*/      mov r0, r6
/*0x0240*/      bl call_370
/*0x0244*/      movs r2, #2
/*0x0246*/      mov r1, r5
/*0x0248*/      mov r0, r6
/*0x024a*/      bl call_390
/*0x024e*/      movs r2, #2
/*0x0250*/      mov r1, r7
/*0x0252*/      mov r0, r6
/*0x0254*/      bl call_390
/*0x0258*/      asrs r5, r5, #3
/*0x025a*/      movs r2, #0
/*0x025c*/      mov r1, r5
/*0x025e*/      mov r0, r6
/*0x0260*/      bl call_370
/*0x0264*/      movs r2, #2
/*0x0266*/      mov r1, r5
/*0x0268*/      mov r0, r6
/*0x026a*/      bl call_390
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


            .thumb_func
            call_360:
/*0x0360*/      cmp r2, #0
/*0x0362*/      ldr r2, [r0]
/*0x0364*/      beq jump_36a
/*0x0366*/      orrs r2, r1
/*0x0368*/      b jump_36c
            jump_36a:
/*0x036a*/      bics r2, r1
            jump_36c:
/*0x036c*/      str r2, [r0]
/*0x036e*/      bx lr

            .thumb_func
            call_370:
/*0x0370*/      cmp r2, #0
/*0x0372*/      ldr r2, [r0, #4]
/*0x0374*/      beq jump_37a
/*0x0376*/      orrs r2, r1
/*0x0378*/      b jump_37c
            jump_37a:
/*0x037a*/      bics r2, r1
            jump_37c:
/*0x037c*/      str r2, [r0, #4]
/*0x037e*/      bx lr

            .thumb_func
            call_380:
/*0x0380*/      cmp r2, #0
/*0x0382*/      ldr r2, [r0, #0x10]
/*0x0384*/      beq jump_38a
/*0x0386*/      orrs r2, r1
/*0x0388*/      b jump_38c
            jump_38a:
/*0x038a*/      bics r2, r1
            jump_38c:
/*0x038c*/      str r2, [r0, #0x10]
/*0x038e*/      bx lr

            .thumb_func
            call_390:
/*0x0390*/      cbz r2, jump_3a4
/*0x0392*/      cmp r2, #1
/*0x0394*/      beq jump_3aa
/*0x0396*/      ldr r2, [r0, #8]
/*0x0398*/      bics r2, r1
            jump_39a:
/*0x039a*/      str r2, [r0, #8]
/*0x039c*/      ldr r2, [r0, #0xc]
/*0x039e*/      bics r2, r1
/*0x03a0*/      str r2, [r0, #0xc]
/*0x03a2*/      bx lr
            jump_3a4:
/*0x03a4*/      ldr r2, [r0, #8]
/*0x03a6*/      orrs r2, r1
/*0x03a8*/      b jump_39a
            jump_3aa:
/*0x03aa*/      ldr r2, [r0, #0xc]
/*0x03ac*/      orrs r2, r1
/*0x03ae*/      str r2, [r0, #0xc]
/*0x03b0*/      ldr r2, [r0, #8]
/*0x03b2*/      bics r2, r1
/*0x03b4*/      str r2, [r0, #8]
/*0x03b6*/      bx lr

            .thumb_func
            call_3b8:
/*0x03b8*/      cbz r2, jump_3be
/*0x03ba*/      str r1, [r0, #0x24]
/*0x03bc*/      bx lr
            jump_3be:
/*0x03be*/      str r1, [r0, #0x28]
/*0x03c0*/      bx lr

            .thumb_func
            call_3c2:
/*0x03c2*/      cmp r1, #0
/*0x03c4*/      ldr r1, [r0, #0x10]
/*0x03c6*/      beq jump_3ce
/*0x03c8*/      orr r1, r1, #1
/*0x03cc*/      b jump_3d2
            jump_3ce:
/*0x03ce*/      bic r1, r1, #1
            jump_3d2:
/*0x03d2*/      str r1, [r0, #0x10]
/*0x03d4*/      bx lr

            .thumb_func
            call_3d6:
/*0x03d6*/      ldrh r2, [r1]
/*0x03d8*/      str.w r2, [r0, #0x88]
/*0x03dc*/      ldrh r2, [r1, #2]
/*0x03de*/      str.w r2, [r0, #0x84]
/*0x03e2*/      ldr r2, [r0]
/*0x03e4*/      bic r2, r2, #0x30000
/*0x03e8*/      str r2, [r0]
/*0x03ea*/      ldr r2, [r0]
/*0x03ec*/      bic r2, r2, #0x1000000
/*0x03f0*/      str r2, [r0]
/*0x03f2*/      ldr r2, [r0]
/*0x03f4*/      ldr r3, [r1, #4]
/*0x03f6*/      orrs r2, r3
/*0x03f8*/      str r2, [r0]
/*0x03fa*/      ldrh r1, [r1, #8]
/*0x03fc*/      str r1, [r0, #0x78]
/*0x03fe*/      bx lr

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
/*0x040a*/  .byte 0x00
/*0x040b*/  .byte 0x12
/*0x040c*/  .byte 0x80
/*0x040d*/  .byte 0x20
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
/*0x041c*/  .byte 0x2e
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
/*0x042b*/  .byte 0x30
/*0x042c*/  .byte 0x00
/*0x042d*/  .byte 0x00
/*0x042e*/  .byte 0x00
/*0x042f*/  .byte 0x00
/*0x0430*/  .byte 0xff
/*0x0431*/  .byte 0xff
/*0x0432*/  .byte 0xff
/*0x0433*/  .byte 0xff

            jump_434:
/*0x0434*/      b.w jump_1524

/*0x0438*/  .byte 0x04
/*0x0439*/  .byte 0x03
/*0x043a*/  .byte 0x09
/*0x043b*/  .byte 0x04
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
/*0x0444*/      push {r4, r5, r6, r7, lr}
/*0x0446*/      ldrb r3, [r1]
/*0x0448*/      ldr r7, [r0, #0x50]
/*0x044a*/      add.w r4, r0, r3, lsl #2
/*0x044e*/      add.w r2, r4, #0x40
/*0x0452*/      add.w r5, r4, #0x90
/*0x0456*/      add.w r6, r4, #0xa0
/*0x045a*/      lsls r3, r3, #1
/*0x045c*/      movs r4, #1
/*0x045e*/      lsls r4, r3
/*0x0460*/      mvns r4, r4
/*0x0462*/      ands r7, r4
/*0x0464*/      str r7, [r0, #0x50]
/*0x0466*/      ldr r7, [r0, #0x54]
/*0x0468*/      ands r7, r4
/*0x046a*/      str r7, [r0, #0x54]
/*0x046c*/      ldr r4, [r0, #0x54]
/*0x046e*/      ldrb r7, [r1, #5]
/*0x0470*/      lsls r7, r3
/*0x0472*/      orrs r4, r7
/*0x0474*/      str r4, [r0, #0x54]
/*0x0476*/      ldr r4, [r2]
/*0x0478*/      movw r7, #0x107
/*0x047c*/      bics r4, r7
/*0x047e*/      str r4, [r2]
/*0x0480*/      ldr r4, [r2]
/*0x0482*/      ldrh r7, [r1, #2]
/*0x0484*/      orrs r4, r7
/*0x0486*/      str r4, [r2]
/*0x0488*/      ldrh r2, [r1, #6]
/*0x048a*/      str r2, [r5]
/*0x048c*/      ldrh r2, [r1, #8]
/*0x048e*/      str r2, [r6]
/*0x0490*/      ldr r2, [r0, #0x50]
/*0x0492*/      ldrb r1, [r1, #4]
/*0x0494*/      lsls r1, r3
/*0x0496*/      orrs r2, r1
/*0x0498*/      str r2, [r0, #0x50]
/*0x049a*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_49c:
/*0x049c*/      ldr r2, [pc, #0x70] /* data_510 */
/*0x049e*/      push {r4, lr}
/*0x04a0*/      ldrb r2, [r2, r0]
/*0x04a2*/      cmp r2, #0xe8
/*0x04a4*/      beq jump_50a
/*0x04a6*/      sub.w r0, r2, #0xe0
/*0x04aa*/      movs r4, #1
/*0x04ac*/      ldr r3, [pc, #0x64] /* data_514 */
/*0x04ae*/      cmp r0, #7
/*0x04b0*/      bhi jump_4cc
/*0x04b2*/      and r0, r2, #7
/*0x04b6*/      mov r2, r3
/*0x04b8*/      lsl.w r0, r4, r0
/*0x04bc*/      ldrb r2, [r2]
/*0x04be*/      uxtb r0, r0
/*0x04c0*/      cbz r1, jump_4c6
/*0x04c2*/      orrs r2, r0
/*0x04c4*/      b jump_4c8
            jump_4c6:
/*0x04c6*/      bics r2, r0
            jump_4c8:
/*0x04c8*/      strb r2, [r3]
/*0x04ca*/      b jump_4fc
            jump_4cc:
/*0x04cc*/      cmp r2, #0x91
/*0x04ce*/      bhi jump_50a
/*0x04d0*/      mov.w r0, #0
/*0x04d4*/      cbz r1, jump_4ee
            jump_4d6:
/*0x04d6*/      adds r1, r3, r0
/*0x04d8*/      ldrb r1, [r1, #2]
/*0x04da*/      cbz r1, jump_4e8
/*0x04dc*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x04de*/      uxtb r0, r0
/*0x04e0*/      cmp r0, #6
/*0x04e2*/      blo jump_4d6
/*0x04e4*/      movs r0, #0
/*0x04e6*/      pop {r4, pc}
            jump_4e8:
/*0x04e8*/      add r0, r3
/*0x04ea*/      strb r2, [r0, #2]
/*0x04ec*/      b jump_4fc
            jump_4ee:
/*0x04ee*/      adds r1, r3, r0
/*0x04f0*/      ldrb r1, [r1, #2]
/*0x04f2*/      cmp r1, r2
/*0x04f4*/      bne jump_502
/*0x04f6*/      add r0, r3
/*0x04f8*/      movs r1, #0
/*0x04fa*/      strb r1, [r0, #2]
            jump_4fc:
/*0x04fc*/      ldr r0, [pc, #0x18] /* data_518 */
/*0x04fe*/      strb r4, [r0]
/*0x0500*/      b jump_50a
            jump_502:
/*0x0502*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0504*/      uxtb r0, r0
/*0x0506*/      cmp r0, #6
/*0x0508*/      blo jump_4ee
            jump_50a:
/*0x050a*/      movs r0, #1
/*0x050c*/      pop {r4, pc}

/*0x050e*/  .byte 0x00
/*0x050f*/  .byte 0x00

            data_510:
/*0x0510*/  .word data_1f94
            data_514:
/*0x0514*/  .word 0x2000003c
            data_518:
/*0x0518*/  .word 0x20000020


            .thumb_func
            call_51c:
/*0x051c*/      push {r4, lr}
/*0x051e*/      ldr r4, [pc, #0x60] /* data_580 */
/*0x0520*/      cbz r0, jump_550
/*0x0522*/      movs r1, #0
/*0x0524*/      mov r0, r4
/*0x0526*/      bl call_1d8
/*0x052a*/      movs r1, #0
/*0x052c*/      mov r0, r4
/*0x052e*/      bl call_1c4
/*0x0532*/      mov r0, r4
/*0x0534*/      bl call_f4
/*0x0538*/      movs r0, #0x29
/*0x053a*/      bl call_628
/*0x053e*/      bl call_6a0
/*0x0542*/      movs r0, #1
/*0x0544*/      bl call_c44
/*0x0548*/      pop.w {r4, lr}
/*0x054c*/      b.w jump_d3c
            jump_550:
/*0x0550*/      movs r0, #0
/*0x0552*/      bl call_c44
/*0x0556*/      movs r1, #0
/*0x0558*/      mov r0, r4
/*0x055a*/      bl call_d8
/*0x055e*/      mov r0, r4
/*0x0560*/      bl call_f4
/*0x0564*/      movs r1, #1
/*0x0566*/      mov r0, r4
/*0x0568*/      bl call_1c4
/*0x056c*/      movs r1, #1
/*0x056e*/      mov r0, r4
/*0x0570*/      bl call_1d8
/*0x0574*/      ldr r1, [pc, #0xc] /* data_584 */
/*0x0576*/      mov.w r0, #0x200
/*0x057a*/      str.w r0, [r1, #0x100]
/*0x057e*/      pop {r4, pc}

            data_580:
/*0x0580*/  .word 0x40076000
            data_584:
/*0x0584*/  .word 0xe000e004


            .thumb_func
            call_588:
/*0x0588*/      push {r4, lr}
/*0x058a*/      movs r0, #0
/*0x058c*/      mov.w r2, #0x10000
/*0x0590*/      movs r3, #1
/*0x0592*/      mov r1, r0
/*0x0594*/      bl call_2cc
/*0x0598*/      pop.w {r4, lr}
/*0x059c*/      movw r1, #0x8c9f
/*0x05a0*/      ldr r0, [pc, #4] /* data_5a8 */
/*0x05a2*/      b.w call_38

/*0x05a6*/  .byte 0x00
/*0x05a7*/  .byte 0x00

            data_5a8:
/*0x05a8*/  .word 0x40076000


            .thumb_func
            call_5ac:
/*0x05ac*/      ldr r1, [pc, #0x70] /* data_620 */
/*0x05ae*/      push {r4, lr}
/*0x05b0*/      ldr r0, [r1]
/*0x05b2*/      movw r2, #0xf8ff
/*0x05b6*/      ands r0, r2
/*0x05b8*/      ldr r2, [pc, #0x68] /* data_624 */
/*0x05ba*/      orr r0, r0, #0x300
/*0x05be*/      orrs r0, r2
/*0x05c0*/      str r0, [r1]
/*0x05c2*/      movs r2, #0
/*0x05c4*/      mov r1, r2
/*0x05c6*/      movs r0, #3
/*0x05c8*/      bl call_63e
/*0x05cc*/      mov r1, r0
/*0x05ce*/      movs r0, #0x2b
/*0x05d0*/      bl call_670
/*0x05d4*/      movs r2, #0
/*0x05d6*/      mov r1, r2
/*0x05d8*/      movs r0, #3
/*0x05da*/      bl call_63e
/*0x05de*/      mov r1, r0
/*0x05e0*/      movs r0, #0x2c
/*0x05e2*/      bl call_670
/*0x05e6*/      movs r2, #0
/*0x05e8*/      movs r1, #1
/*0x05ea*/      movs r0, #3
/*0x05ec*/      bl call_63e
/*0x05f0*/      mov r1, r0
/*0x05f2*/      movs r0, #0x2a
/*0x05f4*/      bl call_670
/*0x05f8*/      movs r2, #0
/*0x05fa*/      movs r1, #2
/*0x05fc*/      movs r0, #3
/*0x05fe*/      bl call_63e
/*0x0602*/      mov r1, r0
/*0x0604*/      movs r0, #0x29
/*0x0606*/      bl call_670
/*0x060a*/      movs r2, #0
/*0x060c*/      movs r1, #2
/*0x060e*/      movs r0, #3
/*0x0610*/      bl call_63e
/*0x0614*/      mov r1, r0
/*0x0616*/      pop.w {r4, lr}
/*0x061a*/      movs r0, #0x35
/*0x061c*/      b.w call_670

            data_620:
/*0x0620*/  .word 0xe000ed0c
            data_624:
/*0x0624*/  .word 0x05fa0000


            .thumb_func
            call_628:
/*0x0628*/      and r2, r0, #0x1f
/*0x062c*/      movs r1, #1
/*0x062e*/      lsls r1, r2
/*0x0630*/      lsrs r0, r0, #5
/*0x0632*/      lsls r0, r0, #2
/*0x0634*/      add.w r0, r0, #-0x1fff2000
/*0x0638*/      str.w r1, [r0, #0x180]
/*0x063c*/      bx lr

            .thumb_func
            call_63e:
/*0x063e*/      push {r4, r5, lr}
/*0x0640*/      and r3, r0, #7
/*0x0644*/      rsb.w r4, r3, #7
/*0x0648*/      cmp r4, #4
/*0x064a*/      bls jump_64e
/*0x064c*/      movs r4, #4
            jump_64e:
/*0x064e*/      adds r0, r3, #4
/*0x0650*/      cmp r0, #7
/*0x0652*/      bhs jump_658
/*0x0654*/      movs r3, #0
/*0x0656*/      b jump_65a
            jump_658:
/*0x0658*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_65a:
/*0x065a*/      movs r5, #1
/*0x065c*/      lsl.w r0, r5, r4
/*0x0660*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0662*/      ands r0, r1
/*0x0664*/      lsls r0, r3
/*0x0666*/      lsls r5, r3
/*0x0668*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x066a*/      ands r5, r2
/*0x066c*/      orrs r0, r5
/*0x066e*/      pop {r4, r5, pc}

            .thumb_func
            call_670:
/*0x0670*/      lsls r1, r1, #0x1c
/*0x0672*/      lsrs r1, r1, #0x18
/*0x0674*/      cmp r0, #0
/*0x0676*/      bge jump_686
/*0x0678*/      and r0, r0, #0xf
/*0x067c*/      add.w r0, r0, #-0x1fff2000
/*0x0680*/      strb.w r1, [r0, #0xd14]
/*0x0684*/      bx lr
            jump_686:
/*0x0686*/      add.w r0, r0, #-0x1fff2000
/*0x068a*/      strb.w r1, [r0, #0x400]
/*0x068e*/      bx lr

            .thumb_func
            call_690:
/*0x0690*/      mov.w r2, #0x200
/*0x0694*/      movs r1, #0
/*0x0696*/      lsls r0, r2, #9
/*0x0698*/      movs r3, #1
/*0x069a*/      b.w call_2cc

/*0x069e*/  .byte 0x00
/*0x069f*/  .byte 0x00


            .thumb_func
            call_6a0:
/*0x06a0*/      push {r4, lr}
/*0x06a2*/      movs r2, #0
/*0x06a4*/      movs r1, #1
/*0x06a6*/      ldr r0, [pc, #0x14] /* data_6bc */
/*0x06a8*/      bl call_390
/*0x06ac*/      movs r2, #0
/*0x06ae*/      pop.w {r4, lr}
/*0x06b2*/      mov r1, r2
/*0x06b4*/      movs r0, #2
/*0x06b6*/      b.w call_1ec

/*0x06ba*/  .byte 0x00
/*0x06bb*/  .byte 0x00

            data_6bc:
/*0x06bc*/  .word 0x400b4000


            .thumb_func
            call_6c0:
/*0x06c0*/      push {r4, lr}
/*0x06c2*/      movs r2, #2
/*0x06c4*/      movs r1, #1
/*0x06c6*/      ldr r0, [pc, #0x14] /* data_6dc */
/*0x06c8*/      bl call_390
/*0x06cc*/      movs r2, #4
/*0x06ce*/      movs r1, #0
/*0x06d0*/      pop.w {r4, lr}
/*0x06d4*/      movs r0, #2
/*0x06d6*/      b.w call_1ec

/*0x06da*/  .byte 0x00
/*0x06db*/  .byte 0x00

            data_6dc:
/*0x06dc*/  .word 0x400b4000


            .thumb_func
            call_6e0:
/*0x06e0*/      push {r4, r5, r6, lr}
/*0x06e2*/      ldr r1, [pc, #0x34] /* data_718 */
/*0x06e4*/      ldr r4, [r1]
/*0x06e6*/      ldr r5, [pc, #0x30] /* data_718 */
/*0x06e8*/      adds r5, #0x48
/*0x06ea*/      ldr r3, [r5]
/*0x06ec*/      movs r2, #1
/*0x06ee*/      str r2, [r1]
/*0x06f0*/      movs r2, #0
/*0x06f2*/      str r2, [r5]
/*0x06f4*/      ldr r6, [pc, #0x24] /* data_71c */
/*0x06f6*/      str.w r2, [r6, #0x9c]
/*0x06fa*/      str.w r2, [r6, #0x8c]
/*0x06fe*/      str r4, [r1]
/*0x0700*/      ldr r1, [pc, #0x1c] /* data_720 */
/*0x0702*/      ldr r2, [r1]
/*0x0704*/      orr r2, r2, #4
/*0x0708*/      str r2, [r1]
/*0x070a*/      cbz r0, jump_712
/*0x070c*/      wfi 
            jump_70e:
/*0x070e*/      str r3, [r5]
/*0x0710*/      pop {r4, r5, r6, pc}
            jump_712:
/*0x0712*/      wfe 
/*0x0714*/      b jump_70e

/*0x0716*/  .byte 0x00
/*0x0717*/  .byte 0x00

            data_718:
/*0x0718*/  .word 0x43100618
            data_71c:
/*0x071c*/  .word 0x42d42000
            data_720:
/*0x0720*/  .word 0xe000ed10

            jump_724:
/*0x0724*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x0728*/      ldr r4, [pc, #0x38] /* data_764 */
/*0x072a*/      ldr r7, [r4]
/*0x072c*/      ldr r5, [pc, #0x34] /* data_764 */
/*0x072e*/      adds r5, #0x48
/*0x0730*/      ldr r6, [r5]
/*0x0732*/      mov.w sb, #1
/*0x0736*/      str.w sb, [r4]
/*0x073a*/      mov.w r8, #0
/*0x073e*/      str.w r8, [r5]
/*0x0742*/      bl call_aa8
/*0x0746*/      ldr r0, [pc, #0x20] /* data_768 */
/*0x0748*/      str.w r8, [r0, #0x9c]
/*0x074c*/      str.w sb, [r0, #0x8c]
/*0x0750*/      str r7, [r4]
/*0x0752*/      ldr r0, [pc, #0x18] /* data_76c */
/*0x0754*/      ldr r1, [r0]
/*0x0756*/      orr r1, r1, #4
/*0x075a*/      str r1, [r0]
/*0x075c*/      wfe 
/*0x075e*/      str r6, [r5]
/*0x0760*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_764:
/*0x0764*/  .word 0x43100618
            data_768:
/*0x0768*/  .word 0x42d42000
            data_76c:
/*0x076c*/  .word 0xe000ed10


            .thumb_func
            call_770:
/*0x0770*/      ldr r1, [pc, #0x10] /* data_784 */
/*0x0772*/      ldr r2, [r1]
/*0x0774*/      bic r2, r2, #4
/*0x0778*/      str r2, [r1]
/*0x077a*/      cbz r0, jump_780
/*0x077c*/      wfi 
/*0x077e*/      bx lr
            jump_780:
/*0x0780*/      wfe 
/*0x0782*/      bx lr

            data_784:
/*0x0784*/  .word 0xe000ed10


            .thumb_func
            call_788:
/*0x0788*/      push {r4, r5, r6, r7, lr}
/*0x078a*/      sub sp, #0x100
/*0x078c*/      mov r4, r0
/*0x078e*/      mov r5, r1
/*0x0790*/      mov r0, sp
/*0x0792*/      bl call_1630
/*0x0796*/      movs r2, #0
/*0x0798*/      mov r3, r2
/*0x079a*/      mov r1, sp
/*0x079c*/      b jump_7bc
            jump_79e:
/*0x079e*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x07a0*/      uxtb r2, r2
/*0x07a2*/      ldrb r0, [r1, r2]
/*0x07a4*/      add r3, r0
/*0x07a6*/      uxtb r3, r3
/*0x07a8*/      ldrb r6, [r1, r3]
/*0x07aa*/      strb r6, [r1, r2]
/*0x07ac*/      strb r0, [r1, r3]
/*0x07ae*/      add r0, r6
/*0x07b0*/      uxtb r0, r0
/*0x07b2*/      ldrb r7, [r4]
/*0x07b4*/      ldrb r0, [r1, r0]
/*0x07b6*/      eors r7, r0
/*0x07b8*/      strb r7, [r4], #1
            jump_7bc:
/*0x07bc*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x07be*/      bhs jump_79e
/*0x07c0*/      add sp, #0x100
/*0x07c2*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_7c4:
/*0x07c4*/      push {r4, r5, r6, lr}
/*0x07c6*/      lsrs r2, r2, #2
/*0x07c8*/      movs r4, #4
/*0x07ca*/      ldr r3, [pc, #0x18] /* data_7e4 */
/*0x07cc*/      movs r5, #0x14
/*0x07ce*/      b jump_7dc
            jump_7d0:
/*0x07d0*/      str r4, [r3, #0xc]
/*0x07d2*/      str r0, [r3]
/*0x07d4*/      ldm r1!, {r6}
/*0x07d6*/      str r6, [r3, #4]
/*0x07d8*/      str r5, [r3, #0x10]
/*0x07da*/      .short 0x1d00 /* adds r0, r0, #4 */ 
            jump_7dc:
/*0x07dc*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x07de*/      bhs jump_7d0
/*0x07e0*/      pop {r4, r5, r6, pc}

/*0x07e2*/  .byte 0x00
/*0x07e3*/  .byte 0x00

            data_7e4:
/*0x07e4*/  .word 0x40080000


            .thumb_func
            handle_frame:
/*0x07e8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x07ec*/      ldr r5, [pc, #0x1c4] /* data_9b4 */
/*0x07ee*/      ldrb r0, [r5]
/*0x07f0*/      cmp r0, #1
/*0x07f2*/      bne jump_8d6
/*0x07f4*/      ldr r6, [pc, #0x1c0] /* data_9b8 */
/*0x07f6*/      movs r4, #0
/*0x07f8*/      mov r0, r6
/*0x07fa*/      ldrb r1, [r6]
/*0x07fc*/      ldrb r0, [r0, #1]
/*0x07fe*/      mov ip, r4
/*0x0800*/      cmp r1, #0x10
/*0x0802*/      beq jump_824
/*0x0804*/      mov r2, r6
/*0x0806*/      mov.w lr, #0xcc00
/*0x080a*/      ldr r3, [r2, #4]
/*0x080c*/      mov.w r2, #0x3400
/*0x0810*/      add.w r7, r3, #0x3000
/*0x0814*/      cmp r1, #0x1d
/*0x0816*/      beq jump_8a8
/*0x0818*/      bgt jump_82e
/*0x081a*/      cmp r1, #0x11
/*0x081c*/      beq jump_838
/*0x081e*/      cmp r1, #0x12
/*0x0820*/      bne jump_904
/*0x0822*/      b jump_83e
            jump_824:
/*0x0824*/      cmp r0, #2
/*0x0826*/      bne jump_904
/*0x0828*/      str.w ip, [r6, #4]
/*0x082c*/      b jump_93a
            jump_82e:
/*0x082e*/      cmp r1, #0x1e
/*0x0830*/      beq jump_924
/*0x0832*/      cmp r1, #0x1f
/*0x0834*/      bne jump_904
/*0x0836*/      b jump_95c
            jump_838:
/*0x0838*/      bl call_9c0
/*0x083c*/      b jump_944
            jump_83e:
/*0x083e*/      mov.w r3, #0x400
/*0x0842*/      cmp r0, #0x20
/*0x0844*/      blo jump_864
/*0x0846*/      sub.w r1, r0, #0x1f
/*0x084a*/      rsb r1, r1, r1, lsl #4
/*0x084e*/      cmp.w r3, r1, lsl #2
/*0x0852*/      blt jump_864
/*0x0854*/      rsb r0, r0, r0, lsl #4
/*0x0858*/      mov.w r1, #0x2880
/*0x085c*/      add.w r0, r1, r0, lsl #2
/*0x0860*/      movs r1, #0x3c
/*0x0862*/      b jump_93e
            jump_864:
/*0x0864*/      cbz r0, jump_870
/*0x0866*/      cmp r0, #1
/*0x0868*/      beq jump_898
/*0x086a*/      cmp r0, #2
/*0x086c*/      bne jump_904
/*0x086e*/      b jump_8a0
            jump_870:
/*0x0870*/      ldrb r2, [r3]
/*0x0872*/      mov r0, r3
/*0x0874*/      cmp r2, #4
/*0x0876*/      beq jump_894
/*0x0878*/      movs r2, #0x20
/*0x087a*/      mov r1, r3
/*0x087c*/      adds r0, r6, #4
/*0x087e*/      bl memcpy
/*0x0882*/      ldr r0, [pc, #0x138] /* data_9bc */
/*0x0884*/      ldr.w r1, [r0, #0x180]
/*0x0888*/      str r1, [r6, #0x24]
/*0x088a*/      ldr.w r0, [r0, #0x18c]
/*0x088e*/      movs r1, #0x28
/*0x0890*/      str r0, [r6, #0x28]
/*0x0892*/      b jump_93c
            jump_894:
/*0x0894*/      movs r1, #0x34
/*0x0896*/      b jump_93e
            jump_898:
/*0x0898*/      movs r1, #4
/*0x089a*/      mov.w r0, #0x3c00
/*0x089e*/      b jump_93e
            jump_8a0:
/*0x08a0*/      strb.w ip, [r6, #4]
/*0x08a4*/      movs r1, #1
/*0x08a6*/      b jump_93c
            jump_8a8:
/*0x08a8*/      lsls r1, r3, #0x1e
/*0x08aa*/      bne jump_9a0
/*0x08ac*/      ldr r1, [r6, #8]
/*0x08ae*/      cbz r1, jump_904
/*0x08b0*/      lsls r4, r1, #0x1e
/*0x08b2*/      bne jump_9a0
/*0x08b4*/      add r3, r1
/*0x08b6*/      cmp r3, lr
/*0x08b8*/      bhi jump_9a0
/*0x08ba*/      str r7, [r6, #4]
/*0x08bc*/      cbz r0, jump_8c8
/*0x08be*/      cmp r0, #1
/*0x08c0*/      beq jump_908
/*0x08c2*/      cmp r0, #2
/*0x08c4*/      bne jump_9a0
/*0x08c6*/      b jump_908
            jump_8c8:
/*0x08c8*/      adds r0, r7, r1
/*0x08ca*/      str.w ip, [r6, #8]
/*0x08ce*/      strd r7, r0, [r6, #0xc]
/*0x08d2*/      mov r0, r7
/*0x08d4*/      b jump_8f2
            jump_8d6:
/*0x08d6*/      b jump_958
            jump_8d8:
/*0x08d8*/      bl call_304
/*0x08dc*/      cbnz r0, jump_8f8
/*0x08de*/      bl watchdog_reload_timer
/*0x08e2*/      ldr r0, [r6, #8]
/*0x08e4*/      add.w r0, r0, #0x400
/*0x08e8*/      str r0, [r6, #8]
/*0x08ea*/      ldr r0, [r6, #0xc]
/*0x08ec*/      add.w r0, r0, #0x400
/*0x08f0*/      str r0, [r6, #0xc]
            jump_8f2:
/*0x08f2*/      ldr r1, [r6, #0x10]
/*0x08f4*/      cmp r0, r1
/*0x08f6*/      blo jump_8d8
            jump_8f8:
/*0x08f8*/      ldr r0, [r6, #4]
/*0x08fa*/      movs r1, #8
/*0x08fc*/      sub.w r0, r0, #0x3000
/*0x0900*/      str r0, [r6, #4]
/*0x0902*/      b jump_93c
            jump_904:
/*0x0904*/      b jump_9a0

/*0x0906*/  .byte 0x0d
/*0x0907*/  .byte 0xe0

            jump_908:
/*0x0908*/      cmp r7, r2
/*0x090a*/      blo jump_9a0
/*0x090c*/      cmp.w r1, #0x1000
/*0x0910*/      blo jump_9a0
/*0x0912*/      cmp r0, #2
/*0x0914*/      beq jump_920
/*0x0916*/      movs r2, #0
            jump_918:
/*0x0918*/      mov r0, r7
/*0x091a*/      bl call_1670
/*0x091e*/      b jump_938
            jump_920:
/*0x0920*/      movs r2, #1
/*0x0922*/      b jump_918
            jump_924:
/*0x0924*/      cbz r0, jump_934
/*0x0926*/      cmp r0, #1
/*0x0928*/      bne jump_9a0
/*0x092a*/      cmp r3, lr
/*0x092c*/      bhs jump_9a0
/*0x092e*/      lsls r0, r3, #0x1e
/*0x0930*/      bne jump_9a0
/*0x0932*/      str r7, [r5, #4]
            jump_934:
/*0x0934*/      ldr r0, [r5, #4]
/*0x0936*/      b jump_99a
            jump_938:
/*0x0938*/      str r0, [r6, #4]
            jump_93a:
/*0x093a*/      movs r1, #4
            jump_93c:
/*0x093c*/      adds r0, r6, #4
            jump_93e:
/*0x093e*/      bl call_a44
/*0x0942*/      movs r4, #1
            jump_944:
/*0x0944*/      ldrb r0, [r5]
/*0x0946*/      cmp r0, #1
/*0x0948*/      bne jump_958
/*0x094a*/      cbz r4, jump_9a0
/*0x094c*/      movs r1, #0x3c
/*0x094e*/      adds r0, r6, #4
            jump_950:
/*0x0950*/      bl mem_zero
/*0x0954*/      movs r0, #2
/*0x0956*/      strb r0, [r5]
            jump_958:
/*0x0958*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_95c:
/*0x095c*/      cbz r0, jump_9a0
/*0x095e*/      lsls r1, r0, #0x1e
/*0x0960*/      bne jump_9a0
/*0x0962*/      cmp r0, #0x3c
/*0x0964*/      bhi jump_9a0
/*0x0966*/      ldr r1, [r5, #4]
/*0x0968*/      adds r3, r0, r1
/*0x096a*/      cmp.w r3, #0xfc00
/*0x096e*/      bhi jump_9a0
/*0x0970*/      cmp r1, r2
/*0x0972*/      bhs jump_97a
/*0x0974*/      cmp r3, r2
/*0x0976*/      bhi jump_9a0
/*0x0978*/      b jump_982
            jump_97a:
/*0x097a*/      mov r1, r0
/*0x097c*/      adds r0, r6, #4
/*0x097e*/      bl call_788
            jump_982:
/*0x0982*/      ldrb r2, [r6, #1]
/*0x0984*/      adds r1, r6, #4
/*0x0986*/      ldr r0, [r5, #4]
/*0x0988*/      bl call_7c4
/*0x098c*/      ldrb r0, [r6, #1]
/*0x098e*/      ldr r1, [r5, #4]
/*0x0990*/      add r0, r1
/*0x0992*/      movw r1, #0x21e
/*0x0996*/      str r0, [r5, #4]
/*0x0998*/      strh r1, [r6]
            jump_99a:
/*0x099a*/      sub.w r0, r0, #0x3000
/*0x099e*/      b jump_938
            jump_9a0:
/*0x09a0*/      ldr r0, [r6]
/*0x09a2*/      str r0, [r6, #4]
/*0x09a4*/      movw r0, #0xaaff
/*0x09a8*/      str r0, [r6]
/*0x09aa*/      ldr r0, [pc, #0xc] /* data_9b8 */
/*0x09ac*/      movs r1, #0x38
/*0x09ae*/      adds r0, #8
/*0x09b0*/      b jump_950

/*0x09b2*/  .byte 0x00
/*0x09b3*/  .byte 0x00

            data_9b4:
/*0x09b4*/  .word 0x20000004
            data_9b8:
/*0x09b8*/  .word 0x20000088
            data_9bc:
/*0x09bc*/  .word 0x40080000


            .thumb_func
            call_9c0:
/*0x09c0*/      push {r4, lr}
/*0x09c2*/      ldr r1, [pc, #0x6c] /* data_a30 */
/*0x09c4*/      cbz r0, jump_9e2
/*0x09c6*/      cmp r0, #1
/*0x09c8*/      beq jump_9e6
/*0x09ca*/      cmp r0, #2
/*0x09cc*/      bne jump_a2e
/*0x09ce*/      movs r0, #0x35
/*0x09d0*/      bl call_628
/*0x09d4*/      movs r0, #0
/*0x09d6*/      bl call_126c
/*0x09da*/      pop.w {r4, lr}
/*0x09de*/      b.w jump_724
            jump_9e2:
/*0x09e2*/      ldr r0, [pc, #0x50] /* data_a34 */
/*0x09e4*/      b jump_9ea
            jump_9e6:
/*0x09e6*/      ldr r0, [pc, #0x4c] /* data_a34 */
/*0x09e8*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_9ea:
/*0x09ea*/      str r0, [r1]
/*0x09ec*/      movs r1, #0
/*0x09ee*/      mov.w r0, #0x10000
/*0x09f2*/      movs r3, #1
/*0x09f4*/      mov r2, r1
/*0x09f6*/      bl call_2cc
/*0x09fa*/      ldr r1, [pc, #0x3c] /* data_a38 */
/*0x09fc*/      mov.w r0, #0x200
/*0x0a00*/      str r0, [r1, #0x24]
/*0x0a02*/      movs r0, #0x35
/*0x0a04*/      bl call_628
/*0x0a08*/      movs r0, #0
/*0x0a0a*/      bl call_126c
/*0x0a0e*/      movw r0, #0x4e20
/*0x0a12*/      bl call_102
/*0x0a16*/      dsb sy
/*0x0a1a*/      ldr r0, [pc, #0x20] /* data_a3c */
/*0x0a1c*/      ldr r1, [r0]
/*0x0a1e*/      ldr r2, [pc, #0x20] /* data_a40 */
/*0x0a20*/      and r1, r1, #0x700
/*0x0a24*/      orrs r1, r2
/*0x0a26*/      str r1, [r0]
/*0x0a28*/      dsb sy
            jump_a2c:
/*0x0a2c*/      b jump_a2c
            jump_a2e:
/*0x0a2e*/      pop {r4, pc}

            data_a30:
/*0x0a30*/  .word 0x20003ffc
            data_a34:
/*0x0a34*/  .word 0x55aafaf5
            data_a38:
/*0x0a38*/  .word 0x400b0000
            data_a3c:
/*0x0a3c*/  .word 0xe000ed0c
            data_a40:
/*0x0a40*/  .word 0x05fa0004


            .thumb_func
            call_a44:
/*0x0a44*/      push {r4, r5, r6, lr}
/*0x0a46*/      mov r4, r1
/*0x0a48*/      ldr r2, [pc, #0x24] /* data_a70 */
/*0x0a4a*/      mov r1, r0
/*0x0a4c*/      movs r0, #2
/*0x0a4e*/      strb r0, [r2]
/*0x0a50*/      ldr r0, [pc, #0x20] /* data_a74 */
/*0x0a52*/      subs r5, r0, #4
/*0x0a54*/      cmp r1, r0
/*0x0a56*/      beq jump_a60
/*0x0a58*/      mov r2, r4
/*0x0a5a*/      adds r0, r5, #4
/*0x0a5c*/      bl memcpy
            jump_a60:
/*0x0a60*/      adds r0, r5, r4
/*0x0a62*/      rsb.w r1, r4, #0x3c
/*0x0a66*/      pop.w {r4, r5, r6, lr}
/*0x0a6a*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x0a6c*/      b.w mem_zero

            data_a70:
/*0x0a70*/  .word 0x20000004
            data_a74:
/*0x0a74*/  .word 0x2000008c

            jump_a78:
/*0x0a78*/      push {r4, r5, r6, r7, lr}
/*0x0a7a*/      ldr r7, [pc, #0x28] /* data_aa4 */
/*0x0a7c*/      ldr.w r4, [r7, #0x104]
/*0x0a80*/      ldr.w r5, [r7, #0x108]
/*0x0a84*/      ldr.w r6, [r7, #0x10c]
/*0x0a88*/      bics r4, r0
/*0x0a8a*/      bics r5, r1
/*0x0a8c*/      bics r6, r2
/*0x0a8e*/      cbz r3, jump_a96
/*0x0a90*/      orrs r4, r0
/*0x0a92*/      orrs r5, r1
/*0x0a94*/      orrs r6, r2
            jump_a96:
/*0x0a96*/      str.w r4, [r7, #0x104]
/*0x0a9a*/      str.w r5, [r7, #0x108]
/*0x0a9e*/      str.w r6, [r7, #0x10c]
/*0x0aa2*/      pop {r4, r5, r6, r7, pc}

            data_aa4:
/*0x0aa4*/  .word 0x40088000


            .thumb_func
            call_aa8:
/*0x0aa8*/      ldr r2, [pc, #0x1c] /* data_ac8 */
/*0x0aaa*/      movs r1, #0
/*0x0aac*/      mov.w r0, #0x1c20
/*0x0ab0*/      str.w r1, [r2, #0x108]
            jump_ab4:
/*0x0ab4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0ab6*/      bhs jump_ab4
/*0x0ab8*/      movs r0, #1
/*0x0aba*/      str.w r0, [r2, #0x108]
/*0x0abe*/      ldr r0, [pc, #0xc] /* data_acc */
            jump_ac0:
/*0x0ac0*/      ldr r1, [r0, #8]
/*0x0ac2*/      lsls r1, r1, #0x1a
/*0x0ac4*/      bpl jump_ac0
/*0x0ac6*/      bx lr

            data_ac8:
/*0x0ac8*/  .word 0x42d40000
            data_acc:
/*0x0acc*/  .word 0x40088000


            .thumb_func
            call_ad0:
/*0x0ad0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0ad4*/      movs r7, #4
/*0x0ad6*/      ldr r5, [pc, #0x58] /* data_b30 */
/*0x0ad8*/      b jump_b26
            jump_ada:
/*0x0ada*/      ldr r1, [pc, #0x58] /* data_b34 */
/*0x0adc*/      add.w r0, r7, r7, lsl #1
/*0x0ae0*/      add r0, r1
/*0x0ae2*/      ldrb r1, [r5, #-0x1]!
/*0x0ae6*/      ldrb r0, [r0, #2]
/*0x0ae8*/      eors r0, r1
/*0x0aea*/      movs.w r8, r0
/*0x0aee*/      beq jump_b26
/*0x0af0*/      movs r4, #0x80
/*0x0af2*/      movs r6, #8
/*0x0af4*/      b jump_b20
            jump_af6:
/*0x0af6*/      tst.w r8, r4
/*0x0afa*/      beq jump_b1e
/*0x0afc*/      ldrb r0, [r5]
/*0x0afe*/      eors r0, r4
/*0x0b00*/      strb r0, [r5]
/*0x0b02*/      tst r0, r4
/*0x0b04*/      bne jump_b0a
/*0x0b06*/      movs r1, #1
/*0x0b08*/      b jump_b0c
            jump_b0a:
/*0x0b0a*/      movs r1, #0
            jump_b0c:
/*0x0b0c*/      add.w r0, r6, r7, lsl #3
/*0x0b10*/      uxtb r0, r0
/*0x0b12*/      bl call_49c
/*0x0b16*/      cbnz r0, jump_b1e
/*0x0b18*/      ldrb r0, [r5]
/*0x0b1a*/      eors r0, r4
/*0x0b1c*/      strb r0, [r5]
            jump_b1e:
/*0x0b1e*/      lsrs r4, r4, #1
            jump_b20:
/*0x0b20*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x0b22*/      uxtb r6, r6
/*0x0b24*/      bhs jump_af6
            jump_b26:
/*0x0b26*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x0b28*/      uxtb r7, r7
/*0x0b2a*/      bhs jump_ada
/*0x0b2c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_b30:
/*0x0b30*/  .word 0x20000011
            data_b34:
/*0x0b34*/  .word 0x200000c8


            .thumb_func
            call_b38:
/*0x0b38*/      push {r4, r5, r6, lr}
/*0x0b3a*/      movs r4, #2
/*0x0b3c*/      ldr r5, [pc, #0x34] /* data_b74 */
/*0x0b3e*/      mov.w r6, #0x1f4
            jump_b42:
/*0x0b42*/      bl call_1744
/*0x0b46*/      movs r1, #4
/*0x0b48*/      b jump_b52
            jump_b4a:
/*0x0b4a*/      add.w r0, r1, r1, lsl #1
/*0x0b4e*/      ldrb r0, [r5, r0]
/*0x0b50*/      cbnz r0, jump_b58
            jump_b52:
/*0x0b52*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0b54*/      uxtb r1, r1
/*0x0b56*/      bhs jump_b4a
            jump_b58:
/*0x0b58*/      cmp r1, #0xff
/*0x0b5a*/      beq jump_b62
/*0x0b5c*/      cmp r4, #0
/*0x0b5e*/      bne jump_b42
            jump_b60:
/*0x0b60*/      pop {r4, r5, r6, pc}
            jump_b62:
/*0x0b62*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0b64*/      ands r4, r4, #0xff
/*0x0b68*/      beq jump_b60
/*0x0b6a*/      mov r0, r6
/*0x0b6c*/      bl call_102
/*0x0b70*/      b jump_b42

/*0x0b72*/  .byte 0x00
/*0x0b73*/  .byte 0x00

            data_b74:
/*0x0b74*/  .word 0x200000c8

            jump_b78:
/*0x0b78*/      ldr r1, [pc, #0x10] /* data_b8c */
/*0x0b7a*/      ldrb r0, [r1]
/*0x0b7c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0b7e*/      strb r0, [r1]
/*0x0b80*/      lsls r0, r0, #0x1e
/*0x0b82*/      bne jump_b88
/*0x0b84*/      b.w call_1744
            jump_b88:
/*0x0b88*/      bx lr

/*0x0b8a*/  .byte 0x00
/*0x0b8b*/  .byte 0x00

            data_b8c:
/*0x0b8c*/  .word 0x2000000c


            .thumb_func
            call_b90:
/*0x0b90*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0b94*/      movs r6, #0
/*0x0b96*/      mov r1, r6
/*0x0b98*/      mov.w r0, #0xd0000
/*0x0b9c*/      movs r3, #1
/*0x0b9e*/      mov r2, r6
/*0x0ba0*/      bl call_2cc
/*0x0ba4*/      movs r4, #8
/*0x0ba6*/      b jump_bd8
            jump_ba8:
/*0x0ba8*/      ldr r0, [pc, #0x8c] /* data_c38 */
/*0x0baa*/      movs r2, #0
/*0x0bac*/      add.w r1, r0, r4, lsl #3
/*0x0bb0*/      ldr r0, [r1]
/*0x0bb2*/      ldrh r5, [r1, #4]
/*0x0bb4*/      mov r7, r0
/*0x0bb6*/      uxth r1, r5
/*0x0bb8*/      bl call_390
/*0x0bbc*/      uxth r1, r5
/*0x0bbe*/      mov r0, r7
/*0x0bc0*/      movs r2, #1
/*0x0bc2*/      bl call_370
/*0x0bc6*/      ldr r0, [pc, #0x70] /* data_c38 */
/*0x0bc8*/      adds r0, #0x40
/*0x0bca*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x0bce*/      add.w r0, r0, r4, lsl #1
/*0x0bd2*/      ldrb r0, [r0, #1]
/*0x0bd4*/      bl call_ac
            jump_bd8:
/*0x0bd8*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0bda*/      uxtb r4, r4
/*0x0bdc*/      bhs jump_ba8
/*0x0bde*/      movs r4, #4
/*0x0be0*/      b jump_c0a
            jump_be2:
/*0x0be2*/      ldr r0, [pc, #0x54] /* data_c38 */
/*0x0be4*/      adds r0, #0x50
/*0x0be6*/      add.w r1, r0, r4, lsl #3
/*0x0bea*/      ldr r7, [r1]
/*0x0bec*/      ldrh r5, [r1, #4]
/*0x0bee*/      mov r0, r7
/*0x0bf0*/      uxth r1, r5
/*0x0bf2*/      bl call_e0
/*0x0bf6*/      uxth r1, r5
/*0x0bf8*/      mov r0, r7
/*0x0bfa*/      movs r2, #0
/*0x0bfc*/      bl call_380
/*0x0c00*/      uxth r1, r5
/*0x0c02*/      mov r0, r7
/*0x0c04*/      movs r2, #1
/*0x0c06*/      bl call_360
            jump_c0a:
/*0x0c0a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0c0c*/      uxtb r4, r4
/*0x0c0e*/      bhs jump_be2
/*0x0c10*/      movs r2, #0xff
/*0x0c12*/      movs r1, #4
/*0x0c14*/      ldr r0, [pc, #0x24] /* data_c3c */
/*0x0c16*/      bl mem_set
/*0x0c1a*/      movs r1, #4
/*0x0c1c*/      ldr r0, [pc, #0x20] /* data_c40 */
/*0x0c1e*/      movs r2, #0xff
/*0x0c20*/      b jump_c2e
            jump_c22:
/*0x0c22*/      strb r6, [r0], #1
/*0x0c26*/      strb r2, [r0], #1
/*0x0c2a*/      strb r2, [r0], #1
            jump_c2e:
/*0x0c2e*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0c30*/      uxtb r1, r1
/*0x0c32*/      bhs jump_c22
/*0x0c34*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_c38:
/*0x0c38*/  .word gpio_map_1
            data_c3c:
/*0x0c3c*/  .word 0x2000000d
            data_c40:
/*0x0c40*/  .word 0x200000c8


            .thumb_func
            call_c44:
/*0x0c44*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0c48*/      movs r4, #4
/*0x0c4a*/      cbz r0, jump_c52
/*0x0c4c*/      movs r7, #0
            jump_c4e:
/*0x0c4e*/      ldr r6, [pc, #0x2c] /* data_c7c */
/*0x0c50*/      b jump_c72
            jump_c52:
/*0x0c52*/      movs r7, #1
/*0x0c54*/      b jump_c4e
            jump_c56:
/*0x0c56*/      add.w r5, r6, r4, lsl #3
/*0x0c5a*/      mov r2, r7
/*0x0c5c*/      ldrh r0, [r5, #4]
/*0x0c5e*/      uxth r1, r0
/*0x0c60*/      ldr r0, [r5]
/*0x0c62*/      bl call_3b8
/*0x0c66*/      ldrh r0, [r5, #4]
/*0x0c68*/      movs r2, #1
/*0x0c6a*/      uxth r1, r0
/*0x0c6c*/      ldr r0, [r5]
/*0x0c6e*/      bl call_360
            jump_c72:
/*0x0c72*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0c74*/      uxtb r4, r4
/*0x0c76*/      bhs jump_c56
/*0x0c78*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_c7c:
/*0x0c7c*/  .word gpio_map_2


            .thumb_func
            call_c80:
/*0x0c80*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0c84*/      movs r1, #0
/*0x0c86*/      mov.w r2, #0x20000
/*0x0c8a*/      mov.w r0, #0x70000
/*0x0c8e*/      movs r3, #1
/*0x0c90*/      bl call_2cc
/*0x0c94*/      movw r1, #0xea60
/*0x0c98*/      ldr r0, [pc, #0x90] /* data_d2c */
/*0x0c9a*/      bl call_38
/*0x0c9e*/      ldr r4, [pc, #0x90] /* data_d30 */
/*0x0ca0*/      movs r1, #2
/*0x0ca2*/      mov r0, r4
/*0x0ca4*/      bl call_e0
/*0x0ca8*/      movs r2, #0
/*0x0caa*/      movs r1, #2
/*0x0cac*/      mov r0, r4
/*0x0cae*/      bl call_380
/*0x0cb2*/      movs r2, #1
/*0x0cb4*/      movs r1, #2
/*0x0cb6*/      mov r0, r4
/*0x0cb8*/      bl call_360
/*0x0cbc*/      movs r1, #4
/*0x0cbe*/      mov r0, r4
/*0x0cc0*/      bl call_e0
/*0x0cc4*/      ldr r6, [pc, #0x6c] /* data_d34 */
/*0x0cc6*/      mov.w r5, #0x4000
/*0x0cca*/      mov r1, r5
/*0x0ccc*/      mov r0, r6
/*0x0cce*/      bl call_e0
/*0x0cd2*/      lsls r7, r5, #1
/*0x0cd4*/      mov r1, r7
/*0x0cd6*/      mov r0, r6
/*0x0cd8*/      bl call_e0
/*0x0cdc*/      movs r2, #0
/*0x0cde*/      movs r1, #4
/*0x0ce0*/      mov r0, r4
/*0x0ce2*/      bl call_380
/*0x0ce6*/      movs r2, #0
/*0x0ce8*/      mov r1, r5
/*0x0cea*/      mov r0, r6
/*0x0cec*/      bl call_380
/*0x0cf0*/      movs r2, #0
/*0x0cf2*/      mov r1, r7
/*0x0cf4*/      mov r0, r6
/*0x0cf6*/      bl call_380
/*0x0cfa*/      movs r2, #1
/*0x0cfc*/      movs r1, #4
/*0x0cfe*/      mov r0, r4
/*0x0d00*/      bl call_360
/*0x0d04*/      movs r2, #1
/*0x0d06*/      mov r1, r5
/*0x0d08*/      mov r0, r6
/*0x0d0a*/      bl call_360
/*0x0d0e*/      movs r2, #1
/*0x0d10*/      mov r1, r7
/*0x0d12*/      mov r0, r6
/*0x0d14*/      bl call_360
/*0x0d18*/      movs r2, #1
/*0x0d1a*/      mov r1, r2
/*0x0d1c*/      ldr r0, [pc, #0x18] /* data_d38 */
/*0x0d1e*/      bl call_370
/*0x0d22*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0d26*/      b.w jump_17fc

/*0x0d2a*/  .byte 0x00
/*0x0d2b*/  .byte 0x00

            data_d2c:
/*0x0d2c*/  .word 0x40077000
            data_d30:
/*0x0d30*/  .word 0x400b4000
            data_d34:
/*0x0d34*/  .word 0x400b0000
            data_d38:
/*0x0d38*/  .word 0x400b2000

            jump_d3c:
/*0x0d3c*/      push {r4, r5, r6, lr}
/*0x0d3e*/      ldr r4, [pc, #0x84] /* data_dc4 */
/*0x0d40*/      movs r1, #0
/*0x0d42*/      mov r0, r4
/*0x0d44*/      bl call_1d8
/*0x0d48*/      movs r1, #0
/*0x0d4a*/      mov r0, r4
/*0x0d4c*/      bl call_1c4
/*0x0d50*/      mov r0, r4
/*0x0d52*/      bl call_f4
/*0x0d56*/      ldr r1, [pc, #0x70] /* data_dc8 */
/*0x0d58*/      asrs r0, r4, #0x14
/*0x0d5a*/      str.w r0, [r1, #0x180]
/*0x0d5e*/      movs r1, #0
/*0x0d60*/      ldr r0, [pc, #0x68] /* data_dcc */
/*0x0d62*/      bl call_3c2
/*0x0d66*/      ldr r6, [pc, #0x68] /* data_dd0 */
/*0x0d68*/      movs r0, #2
/*0x0d6a*/      str r0, [r6, #0x24]
/*0x0d6c*/      ldr r4, [pc, #0x64] /* data_dd4 */
/*0x0d6e*/      movs r5, #8
/*0x0d70*/      b jump_d98
            jump_d72:
/*0x0d72*/      ldrh r0, [r4, #4]
/*0x0d74*/      movs r2, #0
/*0x0d76*/      uxth r1, r0
/*0x0d78*/      ldr r0, [r4]
/*0x0d7a*/      bl call_360
/*0x0d7e*/      ldrh r0, [r4, #4]
/*0x0d80*/      movs r2, #1
/*0x0d82*/      uxth r1, r0
/*0x0d84*/      ldr r0, [r4]
/*0x0d86*/      bl call_370
/*0x0d8a*/      ldrh r0, [r4, #4]
/*0x0d8c*/      movs r2, #2
/*0x0d8e*/      uxth r1, r0
/*0x0d90*/      ldr r0, [r4]
/*0x0d92*/      bl call_390
/*0x0d96*/      adds r4, #8
            jump_d98:
/*0x0d98*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0d9a*/      uxtb r5, r5
/*0x0d9c*/      bhs jump_d72
/*0x0d9e*/      movs r2, #1
/*0x0da0*/      movs r1, #4
/*0x0da2*/      mov r0, r6
/*0x0da4*/      bl call_380
/*0x0da8*/      ldr r4, [pc, #0x2c] /* data_dd8 */
/*0x0daa*/      movs r2, #1
/*0x0dac*/      lsls r1, r2, #0xe
/*0x0dae*/      mov r0, r4
/*0x0db0*/      bl call_380
/*0x0db4*/      mov r0, r4
/*0x0db6*/      pop.w {r4, r5, r6, lr}
/*0x0dba*/      movs r2, #1
/*0x0dbc*/      lsls r1, r2, #0xf
/*0x0dbe*/      b.w call_380

/*0x0dc2*/  .byte 0x00
/*0x0dc3*/  .byte 0x00

            data_dc4:
/*0x0dc4*/  .word 0x40077000
            data_dc8:
/*0x0dc8*/  .word 0xe000e004
            data_dcc:
/*0x0dcc*/  .word 0x4006f000
            data_dd0:
/*0x0dd0*/  .word 0x400b4000
            data_dd4:
/*0x0dd4*/  .word gpio_map_3
            data_dd8:
/*0x0dd8*/  .word 0x400b0000


            .thumb_func
            call_ddc:
/*0x0ddc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0de0*/      ldr r4, [pc, #0xcc] /* data_eb0 */
/*0x0de2*/      movs r5, #8
/*0x0de4*/      b jump_e0a
            jump_de6:
/*0x0de6*/      ldrh r0, [r4, #4]
/*0x0de8*/      uxth r1, r0
/*0x0dea*/      ldr r0, [r4]
/*0x0dec*/      bl call_e0
/*0x0df0*/      ldrh r0, [r4, #4]
/*0x0df2*/      movs r2, #1
/*0x0df4*/      uxth r1, r0
/*0x0df6*/      ldr r0, [r4]
/*0x0df8*/      bl call_380
/*0x0dfc*/      ldrh r0, [r4, #4]
/*0x0dfe*/      movs r2, #1
/*0x0e00*/      uxth r1, r0
/*0x0e02*/      ldr r0, [r4]
/*0x0e04*/      bl call_360
/*0x0e08*/      adds r4, #8
            jump_e0a:
/*0x0e0a*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0e0c*/      uxtb r5, r5
/*0x0e0e*/      bhs jump_de6
/*0x0e10*/      ldr r5, [pc, #0xa0] /* data_eb4 */
/*0x0e12*/      movs r1, #4
/*0x0e14*/      mov r0, r5
/*0x0e16*/      bl call_e0
/*0x0e1a*/      ldr r6, [pc, #0x9c] /* data_eb8 */
/*0x0e1c*/      mov.w r7, #0x4000
/*0x0e20*/      mov r1, r7
/*0x0e22*/      mov r0, r6
/*0x0e24*/      bl call_e0
/*0x0e28*/      lsls r4, r7, #1
/*0x0e2a*/      mov r1, r4
/*0x0e2c*/      mov r0, r6
/*0x0e2e*/      bl call_e0
/*0x0e32*/      movs r2, #0
/*0x0e34*/      movs r1, #4
/*0x0e36*/      mov r0, r5
/*0x0e38*/      bl call_380
/*0x0e3c*/      movs r2, #0
/*0x0e3e*/      mov r1, r7
/*0x0e40*/      mov r0, r6
/*0x0e42*/      bl call_380
/*0x0e46*/      movs r2, #0
/*0x0e48*/      mov r1, r4
/*0x0e4a*/      mov r0, r6
/*0x0e4c*/      bl call_380
/*0x0e50*/      movw r0, #0x2710
/*0x0e54*/      bl call_102
/*0x0e58*/      movs r0, #2
/*0x0e5a*/      str r0, [r5, #0x28]
/*0x0e5c*/      lsls r1, r0, #7
/*0x0e5e*/      ldr r0, [pc, #0x5c] /* data_ebc */
/*0x0e60*/      bl mem_zero
/*0x0e64*/      ldr r1, [pc, #0x58] /* data_ec0 */
/*0x0e66*/      movs r0, #0
/*0x0e68*/      strb r0, [r1, #1]
/*0x0e6a*/      movs r0, #0x64
/*0x0e6c*/      bl call_102
/*0x0e70*/      bl call_f10
/*0x0e74*/      movs r0, #2
/*0x0e76*/      bl call_1850
/*0x0e7a*/      str r4, [r6, #0x24]
/*0x0e7c*/      movs r1, #1
/*0x0e7e*/      ldr r0, [pc, #0x44] /* data_ec4 */
/*0x0e80*/      bl call_3c2
/*0x0e84*/      ldr r4, [pc, #0x40] /* data_ec8 */
/*0x0e86*/      movs r1, #0
/*0x0e88*/      mov r0, r4
/*0x0e8a*/      bl call_d8
/*0x0e8e*/      mov r0, r4
/*0x0e90*/      bl call_f4
/*0x0e94*/      movs r1, #1
/*0x0e96*/      mov r0, r4
/*0x0e98*/      bl call_1c4
/*0x0e9c*/      movs r1, #1
/*0x0e9e*/      mov r0, r4
/*0x0ea0*/      bl call_1d8
/*0x0ea4*/      ldr r1, [pc, #0x24] /* data_ecc */
/*0x0ea6*/      asrs r0, r4, #0x14
/*0x0ea8*/      str.w r0, [r1, #0x100]
/*0x0eac*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_eb0:
/*0x0eb0*/  .word gpio_map_3
            data_eb4:
/*0x0eb4*/  .word 0x400b4000
            data_eb8:
/*0x0eb8*/  .word 0x400b0000
            data_ebc:
/*0x0ebc*/  .word 0x200000d4
            data_ec0:
/*0x0ec0*/  .word 0x20000014
            data_ec4:
/*0x0ec4*/  .word 0x4006f000
            data_ec8:
/*0x0ec8*/  .word 0x40077000
            data_ecc:
/*0x0ecc*/  .word 0xe000e004


            .thumb_func
            call_ed0:
/*0x0ed0*/      push {r4, r5, lr}
/*0x0ed2*/      movs r0, #0x12
/*0x0ed4*/      bl call_1850
/*0x0ed8*/      movs r1, #2
/*0x0eda*/      movs r0, #0
/*0x0edc*/      bl call_1880
/*0x0ee0*/      ldr r4, [pc, #0x24] /* data_f08 */
/*0x0ee2*/      mov.w r0, #0x4000
/*0x0ee6*/      str r0, [r4, #0x28]
/*0x0ee8*/      lsls r5, r0, #1
/*0x0eea*/      str r5, [r4, #0x24]
/*0x0eec*/      movs r1, #8
/*0x0eee*/      mov.w r0, #0xc00
/*0x0ef2*/      bl call_1880
/*0x0ef6*/      ldr r1, [pc, #0x14] /* data_f0c */
/*0x0ef8*/      movs r0, #4
/*0x0efa*/      str r0, [r1, #0x24]
/*0x0efc*/      str r5, [r4, #0x28]
/*0x0efe*/      nop 
/*0x0f00*/      nop 
/*0x0f02*/      str r5, [r4, #0x24]
/*0x0f04*/      pop {r4, r5, pc}

/*0x0f06*/  .byte 0x00
/*0x0f07*/  .byte 0x00

            data_f08:
/*0x0f08*/  .word 0x400b0000
            data_f0c:
/*0x0f0c*/  .word 0x400b4000


            .thumb_func
            call_f10:
/*0x0f10*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x0f14*/      ldr r1, [pc, #0x70] /* data_f88 */
/*0x0f16*/      ldr r0, [pc, #0x6c] /* data_f84 */
/*0x0f18*/      movs r4, #0x10
/*0x0f1a*/      ldrb r2, [r1, #1]
/*0x0f1c*/      movs r6, #4
/*0x0f1e*/      add.w r5, r0, r2, lsl #5
/*0x0f22*/      ldrb r0, [r1]
/*0x0f24*/      ldr r7, [pc, #0x64] /* data_f8c */
/*0x0f26*/      ldr.w fp, [pc, #0x68] /* data_f90 */
/*0x0f2a*/      adds r5, #0x1e
/*0x0f2c*/      cbz r0, jump_f3c
/*0x0f2e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0f30*/      ands r0, r0, #0xff
/*0x0f34*/      strb r0, [r1]
/*0x0f36*/      bne jump_f3c
/*0x0f38*/      bl call_ed0
            jump_f3c:
/*0x0f3c*/      mov sb, r6
/*0x0f3e*/      mov r6, fp
/*0x0f40*/      mov.w r8, #0x8000
/*0x0f44*/      mov sl, r7
/*0x0f46*/      mov.w fp, #0x4000
            jump_f4a:
/*0x0f4a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0f4c*/      uxtb r4, r4
/*0x0f4e*/      blo jump_f7c
/*0x0f50*/      str.w r8, [r6, #0x28]
/*0x0f54*/      ldrh r0, [r5], #-2
/*0x0f58*/      movs r1, #9
/*0x0f5a*/      ubfx r7, r0, #6, #1
/*0x0f5e*/      bl call_1880
/*0x0f62*/      mov r0, fp
/*0x0f64*/      str.w fp, [r6, #0x28]
/*0x0f68*/      str.w r8, [r6, #0x24]
/*0x0f6c*/      mov r1, sb
/*0x0f6e*/      mov r2, sl
/*0x0f70*/      cbz r7, jump_f76
/*0x0f72*/      str r1, [r2, #0x24]
/*0x0f74*/      b jump_f78
            jump_f76:
/*0x0f76*/      str r1, [r2, #0x28]
            jump_f78:
/*0x0f78*/      str r0, [r6, #0x24]
/*0x0f7a*/      b jump_f4a
            jump_f7c:
/*0x0f7c*/      str.w sb, [sl, #0x24]
/*0x0f80*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

            data_f84:
/*0x0f84*/  .word 0x200000d4
            data_f88:
/*0x0f88*/  .word 0x20000014
            data_f8c:
/*0x0f8c*/  .word 0x400b4000
            data_f90:
/*0x0f90*/  .word 0x400b0000


            .thumb_func
            call_f94:
/*0x0f94*/      ldr r0, [pc, #0x50] /* data_fe8 */
/*0x0f96*/      movs r1, #1
/*0x0f98*/      str.w r1, [r0, #0x300]
/*0x0f9c*/      ldr r2, [pc, #0x4c] /* data_fec */
/*0x0f9e*/      str.w r1, [r2, #0xa8]
            jump_fa2:
/*0x0fa2*/      ldr.w r3, [r2, #0x108]
/*0x0fa6*/      cmp r3, #0
/*0x0fa8*/      beq jump_fa2
/*0x0faa*/      movs r3, #0
/*0x0fac*/      str r3, [r2, #0x20]
/*0x0fae*/      mov.w r3, #0x9000000
/*0x0fb2*/      str r3, [r0, #0x18]
/*0x0fb4*/      str.w r1, [r2, #0xa4]
            jump_fb8:
/*0x0fb8*/      ldr.w r3, [r2, #0x104]
/*0x0fbc*/      cmp r3, #0
/*0x0fbe*/      beq jump_fb8
/*0x0fc0*/      ldr r2, [pc, #0x2c] /* data_ff0 */
/*0x0fc2*/      ldr.w r3, [r2, #0x200]
/*0x0fc6*/      bic r3, r3, #7
/*0x0fca*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x0fcc*/      str.w r3, [r2, #0x200]
/*0x0fd0*/      str r1, [r0, #0x20]
/*0x0fd2*/      ldr r2, [r0, #4]
/*0x0fd4*/      bic r2, r2, #3
/*0x0fd8*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x0fda*/      str r2, [r0, #4]
            jump_fdc:
/*0x0fdc*/      ldr r2, [r0, #0x34]
/*0x0fde*/      cmp.w r1, r2, lsr #30
/*0x0fe2*/      bne jump_fdc
/*0x0fe4*/      bx lr

/*0x0fe6*/  .byte 0x00
/*0x0fe7*/  .byte 0x00

            data_fe8:
/*0x0fe8*/  .word 0x40088000
            data_fec:
/*0x0fec*/  .word 0x43100000
            data_ff0:
/*0x0ff0*/  .word 0x40080000


            .thumb_func
            call_ff4:
/*0x0ff4*/      ldr r0, [pc, #0x10] /* data_1008 */
/*0x0ff6*/      movs r1, #0
/*0x0ff8*/      add.w r2, r0, #8
/*0x0ffc*/      str r1, [r0, #0x1c]
/*0x0ffe*/      str r1, [r0, #0x20]
/*0x1000*/      strb r1, [r2, #1]
/*0x1002*/      str.w r1, [r0, #0x15]
/*0x1006*/      bx lr

            data_1008:
/*0x1008*/  .word 0x20000020


            .thumb_func
            loc_100c:
/*0x100c*/      ldr r0, [pc, #0x18] /* data_1028 */
/*0x100e*/      push {lr}
/*0x1010*/      ldr r1, [pc, #0x14] /* data_1028 */
/*0x1012*/      movs r3, #1
/*0x1014*/      strb r3, [r0]
/*0x1016*/      adds r1, #0xc
/*0x1018*/      movs r0, #2
/*0x101a*/      strb r0, [r1]
/*0x101c*/      bl call_ff4
/*0x1020*/      ldr r0, [pc, #4] /* data_1028 */
/*0x1022*/      subs r0, #8
/*0x1024*/      strb r3, [r0, #4]
/*0x1026*/      pop {pc}

            data_1028:
/*0x1028*/  .word 0x20000028


            .thumb_func
            call_102c:
/*0x102c*/      ldrb.w r0, [r0, #0x34]
/*0x1030*/      ubfx r0, r0, #1, #1
/*0x1034*/      bx lr

/*0x1036*/  .byte 0x00
/*0x1037*/  .byte 0x00

            jump_1038:
/*0x1038*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x103c*/      mov r4, r0
/*0x103e*/      bl call_147c
/*0x1042*/      mov r5, r0
/*0x1044*/      ldr r6, [pc, #0x158] /* data_11a0 */
/*0x1046*/      lsls r0, r0, #0x1e
/*0x1048*/      bpl jump_1056
/*0x104a*/      ldr r0, [r6, #4]
/*0x104c*/      cbz r0, jump_1050
/*0x104e*/      blx r0
            jump_1050:
/*0x1050*/      movs r0, #2
/*0x1052*/      bl call_11d8
            jump_1056:
/*0x1056*/      lsls r0, r5, #0x1b
/*0x1058*/      bpl jump_107a
/*0x105a*/      movs r0, #0x10
/*0x105c*/      bl call_11d8
/*0x1060*/      ldrb.w r0, [r4, #0x32]
/*0x1064*/      cmp r0, #2
/*0x1066*/      blo jump_107a
/*0x1068*/      bl call_148c
/*0x106c*/      ldrb.w r0, [r4, #0x32]
/*0x1070*/      strb.w r0, [r4, #0x33]
/*0x1074*/      movs r0, #3
/*0x1076*/      strb.w r0, [r4, #0x32]
            jump_107a:
/*0x107a*/      lsls r0, r5, #0x1d
/*0x107c*/      mov.w r7, #0
/*0x1080*/      bpl jump_10c6
/*0x1082*/      subs r0, r7, #1
/*0x1084*/      str r0, [r4, #0x20]
/*0x1086*/      strb.w r7, [r4, #0x30]
/*0x108a*/      strb.w r7, [r4, #0x31]
/*0x108e*/      ldrb.w r0, [r4, #0x34]
/*0x1092*/      bic r0, r0, #2
/*0x1096*/      strb.w r0, [r4, #0x34]
/*0x109a*/      movs r0, #4
/*0x109c*/      strb.w r0, [r4, #0x32]
/*0x10a0*/      str r7, [r4, #0x38]
/*0x10a2*/      bl call_1288
/*0x10a6*/      bl call_149c
/*0x10aa*/      ldr r1, [pc, #0xf8] /* data_11a4 */
/*0x10ac*/      movs r0, #0
/*0x10ae*/      bl call_1344
/*0x10b2*/      ldr r0, [pc, #0xf0] /* data_11a4 */
/*0x10b4*/      ldr r0, [r0]
/*0x10b6*/      bl call_144c
/*0x10ba*/      ldr r0, [r6]
/*0x10bc*/      cbz r0, jump_10c0
/*0x10be*/      blx r0
            jump_10c0:
/*0x10c0*/      movs r0, #4
/*0x10c2*/      bl call_11d8
            jump_10c6:
/*0x10c6*/      lsls r0, r5, #0x1c
/*0x10c8*/      bpl jump_10dc
/*0x10ca*/      bl call_149c
/*0x10ce*/      ldrb.w r0, [r4, #0x33]
/*0x10d2*/      strb.w r0, [r4, #0x32]
/*0x10d6*/      movs r0, #8
/*0x10d8*/      bl call_11d8
            jump_10dc:
/*0x10dc*/      lsls r0, r5, #0x17
/*0x10de*/      mov.w r8, #0x100
/*0x10e2*/      bpl jump_1160
/*0x10e4*/      movs r0, #0
/*0x10e6*/      bl call_1324
/*0x10ea*/      mov r5, r0
/*0x10ec*/      lsls r0, r0, #0x16
/*0x10ee*/      bpl jump_1106
/*0x10f0*/      mov r0, r4
/*0x10f2*/      bl call_15bc
/*0x10f6*/      mov r0, r4
/*0x10f8*/      bl call_1b4c
/*0x10fc*/      mov.w r1, #0x200
/*0x1100*/      movs r0, #0
/*0x1102*/      bl call_12b4
            jump_1106:
/*0x1106*/      lsls r0, r5, #0x1e
/*0x1108*/      bpl jump_1148
/*0x110a*/      movs r1, #2
/*0x110c*/      movs r0, #0
/*0x110e*/      bl call_12b4
/*0x1112*/      ldr r0, [r4, #0x20]
/*0x1114*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1116*/      beq jump_1148
/*0x1118*/      ldrb.w r0, [r4, #0x24]
/*0x111c*/      cmp r0, #2
/*0x111e*/      bne jump_1148
/*0x1120*/      movs r2, #0x40
/*0x1122*/      movs r0, #0
/*0x1124*/      ldr r1, [r4, #0x1c]
/*0x1126*/      bl call_13a4
/*0x112a*/      ldr r1, [r4, #0x1c]
/*0x112c*/      add r1, r0
/*0x112e*/      str r1, [r4, #0x1c]
/*0x1130*/      ldr r1, [r4, #0x20]
/*0x1132*/      subs r0, r1, r0
/*0x1134*/      str r0, [r4, #0x20]
/*0x1136*/      bne jump_1148
/*0x1138*/      movs r0, #1
/*0x113a*/      strb.w r0, [r4, #0x24]
/*0x113e*/      ldr r1, [r4, #0x28]
/*0x1140*/      cbz r1, jump_1148
/*0x1142*/      ldr r0, [r4, #0x2c]
/*0x1144*/      blx r1
/*0x1146*/      str r7, [r4, #0x28]
            jump_1148:
/*0x1148*/      lsls r0, r5, #0x1b
/*0x114a*/      bpl jump_115a
/*0x114c*/      mov r0, r4
/*0x114e*/      bl call_1b08
/*0x1152*/      movs r1, #0x10
/*0x1154*/      movs r0, #0
/*0x1156*/      bl call_12b4
            jump_115a:
/*0x115a*/      mov r0, r8
/*0x115c*/      bl call_11d8
            jump_1160:
/*0x1160*/      mov r4, r8
            jump_1162:
/*0x1162*/      bl call_147c
/*0x1166*/      bl call_145c
/*0x116a*/      mov r5, r0
/*0x116c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x116e*/      beq jump_119a
/*0x1170*/      mov r0, r5
/*0x1172*/      bl call_1324
/*0x1176*/      tst.w r0, #0x12
/*0x117a*/      beq jump_1162
/*0x117c*/      movs r1, #0x12
/*0x117e*/      mov r0, r5
/*0x1180*/      bl call_12b4
/*0x1184*/      lsl.w r0, r4, r5
/*0x1188*/      bl call_11d8
/*0x118c*/      ldr r0, [r6, #0x18]
/*0x118e*/      cmp r0, #0
/*0x1190*/      beq jump_1162
/*0x1192*/      mov r1, r0
/*0x1194*/      mov r0, r5
/*0x1196*/      blx r1
/*0x1198*/      b jump_1162
            jump_119a:
/*0x119a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x119e*/  .byte 0x00
/*0x119f*/  .byte 0x00

            data_11a0:
/*0x11a0*/  .word data_21c4
            data_11a4:
/*0x11a4*/  .word 0x20000044


            .thumb_func
            call_11a8:
/*0x11a8*/      movs r1, #2
/*0x11aa*/      strb.w r1, [r0, #0x32]
/*0x11ae*/      ldr r0, [pc, #4] /* data_11b4 */
/*0x11b0*/      b.w jump_434

            data_11b4:
/*0x11b4*/  .word 0x20000044


            .thumb_func
            call_11b8:
/*0x11b8*/      ldrb.w r0, [r0, #0x32]
/*0x11bc*/      cmp r0, #3
/*0x11be*/      beq jump_11c4
/*0x11c0*/      movs r0, #0
/*0x11c2*/      bx lr
            jump_11c4:
/*0x11c4*/      movs r0, #1
/*0x11c6*/      bx lr

            .thumb_func
            call_11c8:
/*0x11c8*/      push {r4, lr}
/*0x11ca*/      bl call_149c
/*0x11ce*/      pop.w {r4, lr}
/*0x11d2*/      b.w jump_15cc

/*0x11d6*/  .byte 0x00
/*0x11d7*/  .byte 0x00


            .thumb_func
            call_11d8:
/*0x11d8*/      ldr r1, [pc, #4] /* data_11e0 */
/*0x11da*/      str r0, [r1, #8]
/*0x11dc*/      bx lr

/*0x11de*/  .byte 0x00
/*0x11df*/  .byte 0x00

            data_11e0:
/*0x11e0*/  .word 0x400a8000


            .thumb_func
            call_11e4:
/*0x11e4*/      push {r4, lr}
/*0x11e6*/      movs r1, #0
/*0x11e8*/      mov.w r0, #0x400
/*0x11ec*/      movs r2, #0x40
/*0x11ee*/      movs r3, #1
/*0x11f0*/      bl call_2cc
/*0x11f4*/      movs r0, #2
/*0x11f6*/      bl call_2f0
/*0x11fa*/      ldr r4, [pc, #0x48] /* data_1244 */
/*0x11fc*/      ldr r0, [pc, #0x40] /* data_1240 */
/*0x11fe*/      str r0, [r4, #8]
/*0x1200*/      subs r0, #0x5c
/*0x1202*/      str r0, [r4, #0xc]
/*0x1204*/      subs r0, #0xd4
/*0x1206*/      str r0, [r4, #0x10]
/*0x1208*/      movs r0, #2
/*0x120a*/      str r0, [r4, #0x14]
/*0x120c*/      bl loc_100c
/*0x1210*/      mov r0, r4
/*0x1212*/      bl call_11a8
/*0x1216*/      ldr r1, [pc, #0x30] /* data_1248 */
/*0x1218*/      mov.w r0, #0x200000
/*0x121c*/      str.w r0, [r1, #0x100]
/*0x1220*/      movs r0, #1
/*0x1222*/      bl call_126c
/*0x1226*/      movs r0, #0xfa
/*0x1228*/      bl call_102
/*0x122c*/      ldrb.w r0, [r4, #0x34]
/*0x1230*/      pop.w {r4, lr}
/*0x1234*/      and r1, r0, #1
/*0x1238*/      ldr r0, [pc, #0x10] /* data_124c */
/*0x123a*/      b.w jump_14ac

/*0x123e*/  .byte 0x00
/*0x123f*/  .byte 0x00

            data_1240:
/*0x1240*/  .word data_2194
            data_1244:
/*0x1244*/  .word 0x200001ec
            data_1248:
/*0x1248*/  .word 0xe000e004
            data_124c:
/*0x124c*/  .word 0x20000044


            .thumb_func
            call_1250:
/*0x1250*/      ldr r1, [pc, #0x14] /* data_1268 */
/*0x1252*/      cmp r0, #1
/*0x1254*/      ldr r0, [r1]
/*0x1256*/      beq jump_1260
/*0x1258*/      bic r0, r0, #0x800
            jump_125c:
/*0x125c*/      str r0, [r1]
/*0x125e*/      bx lr
            jump_1260:
/*0x1260*/      orr r0, r0, #0x800
/*0x1264*/      b jump_125c

/*0x1266*/  .byte 0x00
/*0x1267*/  .byte 0x00

            data_1268:
/*0x1268*/  .word 0x400a8000


            .thumb_func
            call_126c:
/*0x126c*/      ldr r1, [pc, #0x14] /* data_1284 */
/*0x126e*/      cmp r0, #1
/*0x1270*/      ldr r0, [r1]
/*0x1272*/      beq jump_127c
/*0x1274*/      bic r0, r0, #0x400
            jump_1278:
/*0x1278*/      str r0, [r1]
/*0x127a*/      bx lr
            jump_127c:
/*0x127c*/      orr r0, r0, #0x400
/*0x1280*/      b jump_1278

/*0x1282*/  .byte 0x00
/*0x1283*/  .byte 0x00

            data_1284:
/*0x1284*/  .word 0x400a8000


            .thumb_func
            call_1288:
/*0x1288*/      movs r1, #0
/*0x128a*/      movs r0, #0x20
/*0x128c*/      movs r3, #1
/*0x128e*/      mov r2, r1
/*0x1290*/      b.w jump_a78

            .thumb_func
            call_1294:
/*0x1294*/      push {r4, lr}
/*0x1296*/      bl call_1d70
/*0x129a*/      ldr r1, [r0]
/*0x129c*/      and r1, r1, #9
/*0x12a0*/      str r1, [r0]
/*0x12a2*/      pop {r4, pc}

            .thumb_func
            call_12a4:
/*0x12a4*/      push {r4, lr}
/*0x12a6*/      bl call_1d70
/*0x12aa*/      ldr r1, [r0]
/*0x12ac*/      and r1, r1, #0x24
/*0x12b0*/      str r1, [r0]
/*0x12b2*/      pop {r4, pc}

            .thumb_func
            call_12b4:
/*0x12b4*/      push {r4, lr}
/*0x12b6*/      mov r4, r1
/*0x12b8*/      bl call_1d70
/*0x12bc*/      str r4, [r0, #8]
/*0x12be*/      pop {r4, pc}

            .thumb_func
            call_12c0:
/*0x12c0*/      push {r4, lr}
/*0x12c2*/      bl call_1d70
/*0x12c6*/      ldr r0, [r0, #0x10]
/*0x12c8*/      ldr r1, [pc, #8] /* data_12d4 */
/*0x12ca*/      ubfx r0, r0, #0, #0xa
/*0x12ce*/      add r0, r1
/*0x12d0*/      pop {r4, pc}

/*0x12d2*/  .byte 0x00
/*0x12d3*/  .byte 0x00

            data_12d4:
/*0x12d4*/  .word 0x400aa000


            .thumb_func
            call_12d8:
/*0x12d8*/      push {r4, r5, r6, lr}
/*0x12da*/      mov r5, r0
/*0x12dc*/      bl call_1d70
/*0x12e0*/      mov r4, r0
/*0x12e2*/      mov r0, r5
/*0x12e4*/      bl call_12fc
/*0x12e8*/      ldr r1, [r4, #0x10]
/*0x12ea*/      ubfx r1, r1, #0, #0xa
/*0x12ee*/      add r0, r1
/*0x12f0*/      ldr r1, [pc, #4] /* data_12f8 */
/*0x12f2*/      add r0, r1
/*0x12f4*/      pop {r4, r5, r6, pc}

/*0x12f6*/  .byte 0x00
/*0x12f7*/  .byte 0x00

            data_12f8:
/*0x12f8*/  .word 0x400aa000


            .thumb_func
            call_12fc:
/*0x12fc*/      push {r4, lr}
/*0x12fe*/      bl call_1d70
/*0x1302*/      ldr r0, [r0, #0x10]
/*0x1304*/      ubfx r0, r0, #0xa, #0xa
/*0x1308*/      pop {r4, pc}

            .thumb_func
            call_130a:
/*0x130a*/      push {r4, lr}
/*0x130c*/      bl call_1d70
/*0x1310*/      ldr r1, [r0, #0x10]
/*0x1312*/      ldr r0, [r0]
/*0x1314*/      lsls r1, r1, #3
/*0x1316*/      bpl jump_131e
/*0x1318*/      ubfx r0, r0, #2, #1
/*0x131c*/      pop {r4, pc}
            jump_131e:
/*0x131e*/      ubfx r0, r0, #5, #1
/*0x1322*/      pop {r4, pc}

            .thumb_func
            call_1324:
/*0x1324*/      push {r4, lr}
/*0x1326*/      bl call_1d70
/*0x132a*/      ldr r1, [r0, #4]
/*0x132c*/      ldr r0, [r0, #8]
/*0x132e*/      ands r0, r1
/*0x1330*/      pop {r4, pc}

            .thumb_func
            call_1332:
/*0x1332*/      push {r4, lr}
/*0x1334*/      mov r4, r1
/*0x1336*/      bl call_1d70
/*0x133a*/      ldr r0, [r0, #0xc]
/*0x133c*/      lsrs r0, r4
/*0x133e*/      ubfx r0, r0, #0, #9
/*0x1342*/      pop {r4, pc}

            .thumb_func
            call_1344:
/*0x1344*/      push {r4, r5, r6, lr}
/*0x1346*/      mov r4, r1
/*0x1348*/      mov r5, r0
/*0x134a*/      bl call_1d70
/*0x134e*/      add.w r1, r4, r5, lsl #3
/*0x1352*/      ldr r2, [r1, #4]
/*0x1354*/      str r2, [r0, #0x10]
/*0x1356*/      ldr r1, [r1, #8]
/*0x1358*/      str r1, [r0, #4]
/*0x135a*/      mov.w r1, #-1
/*0x135e*/      str r1, [r0, #8]
/*0x1360*/      mov r0, r5
/*0x1362*/      pop.w {r4, r5, r6, lr}
/*0x1366*/      b.w jump_13d4

            .thumb_func
            call_136a:
/*0x136a*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x136e*/      mov r6, r2
/*0x1370*/      mov r7, r1
/*0x1372*/      movs r5, r0
/*0x1374*/      beq jump_139a
/*0x1376*/      movs r1, #0
            jump_1378:
/*0x1378*/      bl call_1332
/*0x137c*/      mov r4, r0
/*0x137e*/      cmp r0, r6
/*0x1380*/      bhi jump_1394
/*0x1382*/      mov r0, r5
/*0x1384*/      cbz r5, jump_139e
/*0x1386*/      bl call_12c0
            jump_138a:
/*0x138a*/      adds r1, r4, #3
/*0x138c*/      lsrs r2, r1, #2
/*0x138e*/      mov r1, r7
/*0x1390*/      bl call_1d60
            jump_1394:
/*0x1394*/      mov r0, r4
/*0x1396*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_139a:
/*0x139a*/      movs r1, #0x10
/*0x139c*/      b jump_1378
            jump_139e:
/*0x139e*/      bl call_12d8
/*0x13a2*/      b jump_138a

            .thumb_func
            call_13a4:
/*0x13a4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x13a8*/      mov r5, r2
/*0x13aa*/      mov r6, r1
/*0x13ac*/      mov r7, r0
/*0x13ae*/      bl call_1d70
/*0x13b2*/      mov r4, r0
/*0x13b4*/      movs r0, #0
/*0x13b6*/      cbz r5, jump_13c8
/*0x13b8*/      mov r2, r5
/*0x13ba*/      mov r1, r6
/*0x13bc*/      mov r0, r7
/*0x13be*/      bl call_136a
/*0x13c2*/      cbnz r0, jump_13c8
/*0x13c4*/      cmp r5, #0
/*0x13c6*/      bne jump_13d0
            jump_13c8:
/*0x13c8*/      ldr r1, [r4]
/*0x13ca*/      and r1, r1, #0x10
/*0x13ce*/      str r1, [r4]
            jump_13d0:
/*0x13d0*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_13d4:
/*0x13d4*/      push {r4, lr}
/*0x13d6*/      bl call_1d70
/*0x13da*/      ldr r1, [r0]
/*0x13dc*/      and r1, r1, #0x19
/*0x13e0*/      str r1, [r0]
/*0x13e2*/      pop {r4, pc}
            jump_13e4:
/*0x13e4*/      push {r4, lr}
/*0x13e6*/      bl call_1d70
/*0x13ea*/      movs r1, #4
/*0x13ec*/      str r1, [r0]
/*0x13ee*/      pop {r4, pc}

            .thumb_func
            call_13f0:
/*0x13f0*/      push {r4, lr}
/*0x13f2*/      bl call_1d70
/*0x13f6*/      movs r1, #0x40
/*0x13f8*/      str r1, [r0, #8]
/*0x13fa*/      ldr r2, [r0]
/*0x13fc*/      movs r1, #0x24
/*0x13fe*/      bics r1, r2
/*0x1400*/      str r1, [r0]
/*0x1402*/      pop {r4, pc}

            .thumb_func
            call_1404:
/*0x1404*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1408*/      mov r4, r2
/*0x140a*/      mov r8, r1
/*0x140c*/      mov r7, r0
/*0x140e*/      bl call_12fc
/*0x1412*/      mov r6, r0
/*0x1414*/      mov r0, r7
/*0x1416*/      bl call_1d70
/*0x141a*/      mov r5, r0
/*0x141c*/      movs r1, #0
/*0x141e*/      mov r0, r7
/*0x1420*/      bl call_1332
/*0x1424*/      cmp r4, r6
/*0x1426*/      bhi jump_142a
/*0x1428*/      cbz r0, jump_1430
            jump_142a:
/*0x142a*/      movs r0, #0
            jump_142c:
/*0x142c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_1430:
/*0x1430*/      mov r0, r7
/*0x1432*/      bl call_12c0
/*0x1436*/      mov r1, r0
/*0x1438*/      adds r0, r4, #3
/*0x143a*/      lsrs r2, r0, #2
/*0x143c*/      mov r0, r8
/*0x143e*/      bl call_1d60
/*0x1442*/      str r4, [r5, #0xc]
/*0x1444*/      movs r0, #2
/*0x1446*/      str r0, [r5]
/*0x1448*/      mov r0, r4
/*0x144a*/      b jump_142c

            .thumb_func
            call_144c:
/*0x144c*/      ldr r1, [pc, #8] /* data_1458 */
/*0x144e*/      ldr r2, [r1, #4]
/*0x1450*/      orrs r2, r0
/*0x1452*/      str r2, [r1, #4]
/*0x1454*/      bx lr

/*0x1456*/  .byte 0x00
/*0x1457*/  .byte 0x00

            data_1458:
/*0x1458*/  .word 0x400a8000


            .thumb_func
            call_145c:
/*0x145c*/      mov r3, r0
/*0x145e*/      movs r1, #7
            jump_1460:
/*0x1460*/      add.w r2, r1, #8
/*0x1464*/      lsr.w r0, r3, r2
/*0x1468*/      lsls r2, r0, #0x1f
/*0x146a*/      beq jump_1470
/*0x146c*/      sxtb r0, r1
/*0x146e*/      bx lr
            jump_1470:
/*0x1470*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x1472*/      cmp r1, #0
/*0x1474*/      bgt jump_1460
/*0x1476*/      mov.w r0, #-1
/*0x147a*/      bx lr

            .thumb_func
            call_147c:
/*0x147c*/      ldr r0, [pc, #8] /* data_1488 */
/*0x147e*/      ldr r1, [r0, #4]
/*0x1480*/      ldr r0, [r0, #8]
/*0x1482*/      ands r0, r1
/*0x1484*/      bx lr

/*0x1486*/  .byte 0x00
/*0x1487*/  .byte 0x00

            data_1488:
/*0x1488*/  .word 0x400a8000


            .thumb_func
            call_148c:
/*0x148c*/      ldr r0, [pc, #8] /* data_1498 */
/*0x148e*/      ldr r1, [r0]
/*0x1490*/      orr r1, r1, #0xc
/*0x1494*/      str r1, [r0]
/*0x1496*/      bx lr

            data_1498:
/*0x1498*/  .word 0x400a8000


            .thumb_func
            call_149c:
/*0x149c*/      ldr r0, [pc, #8] /* data_14a8 */
/*0x149e*/      ldr r1, [r0]
/*0x14a0*/      and r1, r1, #0x400
/*0x14a4*/      str r1, [r0]
/*0x14a6*/      bx lr

            data_14a8:
/*0x14a8*/  .word 0x400a8000

            jump_14ac:
/*0x14ac*/      push {r4, lr}
/*0x14ae*/      mov r4, r0
/*0x14b0*/      ldr r0, [pc, #0x68] /* data_151c */
/*0x14b2*/      ldr r2, [r0]
/*0x14b4*/      cmp r2, #1
/*0x14b6*/      bne jump_1518
/*0x14b8*/      movs r2, #0
/*0x14ba*/      str r2, [r0]
/*0x14bc*/      ldr r0, [pc, #0x60] /* data_1520 */
/*0x14be*/      ldr r2, [r0]
/*0x14c0*/      lsls r3, r2, #0x19
/*0x14c2*/      mov.w r2, #-1
/*0x14c6*/      bpl jump_14e2
/*0x14c8*/      movw r3, #0x40c
/*0x14cc*/      str r3, [r0]
/*0x14ce*/      str r2, [r0, #8]
/*0x14d0*/      cbnz r1, jump_14d8
/*0x14d2*/      movs r0, #0
/*0x14d4*/      bl call_6e0
            jump_14d8:
/*0x14d8*/      ldr r0, [r4]
/*0x14da*/      pop.w {r4, lr}
/*0x14de*/      b.w call_144c
            jump_14e2:
/*0x14e2*/      movw r3, #0xc0c
/*0x14e6*/      str r3, [r0]
/*0x14e8*/      str r2, [r0, #8]
/*0x14ea*/      cbnz r1, jump_14f2
/*0x14ec*/      movs r0, #0
/*0x14ee*/      bl call_6e0
            jump_14f2:
/*0x14f2*/      movs r0, #0
/*0x14f4*/      bl call_1250
/*0x14f8*/      ldr r0, [r4]
/*0x14fa*/      bl call_144c
/*0x14fe*/      movs r0, #0
/*0x1500*/      bl call_126c
/*0x1504*/      movs r1, #0xc8
/*0x1506*/      movs r0, #0
            jump_1508:
/*0x1508*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x150a*/      cmp r0, r1
/*0x150c*/      blo jump_1508
/*0x150e*/      pop.w {r4, lr}
/*0x1512*/      movs r0, #1
/*0x1514*/      b.w call_126c
            jump_1518:
/*0x1518*/      pop {r4, pc}

/*0x151a*/  .byte 0x00
/*0x151b*/  .byte 0x00

            data_151c:
/*0x151c*/  .word 0x20000000
            data_1520:
/*0x1520*/  .word 0x400a8000

            jump_1524:
/*0x1524*/      movw r1, #0x111d
/*0x1528*/      str r1, [r0]
/*0x152a*/      ldr r1, [pc, #0x28] /* data_1554 */
/*0x152c*/      str r1, [r0, #4]
/*0x152e*/      movw r1, #0x212
/*0x1532*/      str r1, [r0, #8]
/*0x1534*/      ldr r1, [pc, #0x20] /* data_1558 */
/*0x1536*/      str r1, [r0, #0xc]
/*0x1538*/      ldr r2, [pc, #0x20] /* data_155c */
/*0x153a*/      movs r1, #0x10
/*0x153c*/      strd r1, r2, [r0, #0x10]
/*0x1540*/      str r1, [r0, #0x18]
/*0x1542*/      ldr r1, [pc, #0x1c] /* data_1560 */
/*0x1544*/      str r1, [r0, #0x1c]
/*0x1546*/      movs r1, #0
/*0x1548*/      str r1, [r0, #0x20]
/*0x154a*/      ldr r1, [pc, #0x18] /* data_1564 */
/*0x154c*/      str r1, [r0, #0x24]
/*0x154e*/      movs r1, #2
/*0x1550*/      str r1, [r0, #0x28]
/*0x1552*/      bx lr

            data_1554:
/*0x1554*/  .word 0x80010008
            data_1558:
/*0x1558*/  .word 0x91002088
            data_155c:
/*0x155c*/  .word 0x92010090
            data_1560:
/*0x1560*/  .word 0x930100d0
            data_1564:
/*0x1564*/  .word 0x84010110


            .thumb_func
            call_1568:
/*0x1568*/      push {r4, lr}
/*0x156a*/      ldr r4, [pc, #0x48] /* data_15b4 */
/*0x156c*/      ldrb.w r0, [r4, #0x32]
/*0x1570*/      cmp r0, #3
/*0x1572*/      bne jump_1578
/*0x1574*/      bl call_1d80
            jump_1578:
/*0x1578*/      ldr r1, [pc, #0x3c] /* data_15b8 */
/*0x157a*/      ldrb r0, [r1, #4]
/*0x157c*/      cbz r0, jump_159e
/*0x157e*/      cmp r0, #1
/*0x1580*/      beq jump_1596
/*0x1582*/      cmp r0, #2
/*0x1584*/      bne jump_15a6
/*0x1586*/      ldrb.w r0, [r4, #0x32]
/*0x158a*/      cmp r0, #6
/*0x158c*/      bne jump_1592
/*0x158e*/      bl call_18c8
            jump_1592:
/*0x1592*/      movs r0, #2
/*0x1594*/      pop {r4, pc}
            jump_1596:
/*0x1596*/      movs r0, #0
/*0x1598*/      strb r0, [r1, #4]
/*0x159a*/      movs r0, #3
/*0x159c*/      pop {r4, pc}
            jump_159e:
/*0x159e*/      ldrb.w r0, [r4, #0x32]
/*0x15a2*/      cmp r0, #6
/*0x15a4*/      beq jump_15aa
            jump_15a6:
/*0x15a6*/      movs r0, #0
/*0x15a8*/      pop {r4, pc}
            jump_15aa:
/*0x15aa*/      movs r0, #2
/*0x15ac*/      strb r0, [r1, #4]
/*0x15ae*/      movs r0, #1
/*0x15b0*/      pop {r4, pc}

/*0x15b2*/  .byte 0x00
/*0x15b3*/  .byte 0x00

            data_15b4:
/*0x15b4*/  .word 0x200001ec
            data_15b8:
/*0x15b8*/  .word 0x20000020


            .thumb_func
            call_15bc:
/*0x15bc*/      ldr r1, [pc, #8] /* data_15c8 */
/*0x15be*/      ldr r2, [r1]
/*0x15c0*/      str r2, [r0]
/*0x15c2*/      ldr r1, [r1, #4]
/*0x15c4*/      str r1, [r0, #4]
/*0x15c6*/      bx lr

            data_15c8:
/*0x15c8*/  .word 0x400aa000

            jump_15cc:
/*0x15cc*/      ldr r0, [pc, #8] /* data_15d8 */
/*0x15ce*/      ldr r1, [r0]
/*0x15d0*/      orr r1, r1, #0x20
/*0x15d4*/      str r1, [r0]
/*0x15d6*/      bx lr

            data_15d8:
/*0x15d8*/  .word 0x400a8000


            .thumb_func
            call_15dc:
/*0x15dc*/      ldr r1, [pc, #0xc] /* data_15ec */
/*0x15de*/      ldr r2, [r1]
/*0x15e0*/      orr r2, r2, #0x100
/*0x15e4*/      str r2, [r1]
/*0x15e6*/      str r0, [r1, #0x10]
/*0x15e8*/      bx lr

/*0x15ea*/  .byte 0x00
/*0x15eb*/  .byte 0x00

            data_15ec:
/*0x15ec*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x15f0*/      ldr r0, [pc, #4] /* data_15f8 */
/*0x15f2*/      b.w jump_1038

/*0x15f6*/  .byte 0x00
/*0x15f7*/  .byte 0x00

            data_15f8:
/*0x15f8*/  .word 0x200001ec


            .thumb_func
            call_15fc:
/*0x15fc*/      ldr r0, [pc, #0x14] /* data_1614 */
/*0x15fe*/      ldr r1, [r0, #0x30]
/*0x1600*/      orr r1, r1, #0x10
/*0x1604*/      str r1, [r0, #0x30]
/*0x1606*/      ldr r0, [pc, #0x10] /* data_1618 */
/*0x1608*/      movw r1, #0x5fff
/*0x160c*/      str r1, [r0, #8]
/*0x160e*/      ldr r1, [pc, #0xc] /* data_161c */
/*0x1610*/      str r1, [r0, #4]
/*0x1612*/      bx lr

            data_1614:
/*0x1614*/  .word 0x40088000
            data_1618:
/*0x1618*/  .word 0x40068000
            data_161c:
/*0x161c*/  .word 0x0001afff


            .thumb_func
            watchdog_reload_timer:
/*0x1620*/      ldr r1, [pc, #8] /* data_162c */
/*0x1622*/      ldr r0, [pc, #4] /* data_1628 */
/*0x1624*/      str r0, [r1]
/*0x1626*/      bx lr

            data_1628:
/*0x1628*/  .word 0x5fa00001
            data_162c:
/*0x162c*/  .word 0x40068000


            .thumb_func
            call_1630:
/*0x1630*/      push {r4, r5, r6, lr}
/*0x1632*/      movs r1, #0
            jump_1634:
/*0x1634*/      strb r1, [r0], #1
/*0x1638*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x163a*/      cmp r1, #0xff
/*0x163c*/      bls jump_1634
/*0x163e*/      movs r3, #0
/*0x1640*/      ldr r5, [pc, #0x28] /* data_166c */
/*0x1642*/      mov r2, r3
/*0x1644*/      mov r1, r3
/*0x1646*/      sub.w r0, r0, #0x100
            jump_164a:
/*0x164a*/      ldrb r6, [r5, r2]
/*0x164c*/      ldrb r4, [r0, r1]
/*0x164e*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1650*/      add r3, r4
/*0x1652*/      add r3, r6
/*0x1654*/      uxtb r3, r3
/*0x1656*/      uxtb r2, r2
/*0x1658*/      ldrb r6, [r0, r3]
/*0x165a*/      strb r6, [r0, r1]
/*0x165c*/      strb r4, [r0, r3]
/*0x165e*/      cmp r2, #8
/*0x1660*/      blo jump_1664
/*0x1662*/      movs r2, #0
            jump_1664:
/*0x1664*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1666*/      cmp r1, #0xff
/*0x1668*/      bls jump_164a
/*0x166a*/      pop {r4, r5, r6, pc}

            data_166c:
/*0x166c*/  .word data_1f54


            .thumb_func
            call_1670:
/*0x1670*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x1674*/      mov r6, r0
/*0x1676*/      movw r0, #0x3bf8
/*0x167a*/      mov r5, r1
/*0x167c*/      ldr r0, [r0]
/*0x167e*/      ldr r1, [pc, #0xbc] /* data_173c */
/*0x1680*/      sub sp, #0x104
/*0x1682*/      mov sb, r2
/*0x1684*/      cmp r0, r1
/*0x1686*/      bne jump_1692
/*0x1688*/      movw r0, #0x3bfc
/*0x168c*/      ldrb r0, [r0]
/*0x168e*/      cmp r0, #1
/*0x1690*/      beq jump_169a
            jump_1692:
/*0x1692*/      movs r0, #0
            jump_1694:
/*0x1694*/      add sp, #0x104
/*0x1696*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_169a:
/*0x169a*/      ldr.w sl, [pc, #0xa4] /* data_1740 */
/*0x169e*/      mov.w r8, #0
/*0x16a2*/      movw fp, #0x3bff
/*0x16a6*/      cmp.w sb, #0
/*0x16aa*/      beq jump_1726
/*0x16ac*/      movs r1, #0
/*0x16ae*/      mov.w r0, #0x2000
/*0x16b2*/      movs r3, #1
/*0x16b4*/      mov r2, r1
/*0x16b6*/      bl call_2cc
/*0x16ba*/      mov.w r1, #-1
/*0x16be*/      str.w r1, [sl, #4]
/*0x16c2*/      movs r1, #0xe6
/*0x16c4*/      str.w r1, [sl]
/*0x16c8*/      b jump_1726
            jump_16ca:
/*0x16ca*/      ldrb.w r0, [fp]
/*0x16ce*/      cmp r0, r5
/*0x16d0*/      bls jump_16d4
/*0x16d2*/      mov r0, r5
            jump_16d4:
/*0x16d4*/      uxtb r4, r0
/*0x16d6*/      subs r5, r5, r4
/*0x16d8*/      mov r0, sp
/*0x16da*/      bl call_1630
/*0x16de*/      movs r1, #0
/*0x16e0*/      mov r0, r1
/*0x16e2*/      b jump_1720
            jump_16e4:
/*0x16e4*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x16e6*/      uxtb r1, r1
/*0x16e8*/      ldrb.w r2, [sp, r1]
/*0x16ec*/      add r0, r2
/*0x16ee*/      uxtb r0, r0
/*0x16f0*/      ldrb.w ip, [sp, r0]
/*0x16f4*/      strb.w ip, [sp, r1]
/*0x16f8*/      strb.w r2, [sp, r0]
/*0x16fc*/      add r2, ip
/*0x16fe*/      uxtb r2, r2
/*0x1700*/      ldrb r7, [r6]
/*0x1702*/      ldrb.w r2, [sp, r2]
/*0x1706*/      eors r7, r2
/*0x1708*/      cmp.w sb, #0
/*0x170c*/      beq jump_1714
/*0x170e*/      strb.w r7, [sl, #0xc]
/*0x1712*/      b jump_171e
            jump_1714:
/*0x1714*/      subs r2, r1, #1
/*0x1716*/      lsls r2, r2, #0x1e
/*0x1718*/      lsrs r2, r2, #0x1b
/*0x171a*/      lsls r7, r2
/*0x171c*/      add r8, r7
            jump_171e:
/*0x171e*/      .short 0x1c76 /* adds r6, r6, #1 */ 
            jump_1720:
/*0x1720*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x1722*/      uxtb r4, r4
/*0x1724*/      bhs jump_16e4
            jump_1726:
/*0x1726*/      cmp r5, #0
/*0x1728*/      bne jump_16ca
/*0x172a*/      cmp.w sb, #0
/*0x172e*/      beq jump_1736
/*0x1730*/      ldr.w r0, [sl, #8]
/*0x1734*/      b jump_1694
            jump_1736:
/*0x1736*/      mov r0, r8
/*0x1738*/      b jump_1694

/*0x173a*/  .byte 0x00
/*0x173b*/  .byte 0x00

            data_173c:
/*0x173c*/  .word 0x03042080
            data_1740:
/*0x1740*/  .word 0x4008a000


            .thumb_func
            call_1744:
/*0x1744*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1748*/      ldr r4, [pc, #0xa0] /* data_17ec */
/*0x174a*/      ldr r5, [pc, #0xa4] /* data_17f0 */
/*0x174c*/      ldr.w r8, [pc, #0xa4] /* data_17f4 */
/*0x1750*/      ldr r7, [pc, #0xa4] /* data_17f8 */
/*0x1752*/      movs r6, #4
            jump_1754:
/*0x1754*/      ldr r1, [r5]
/*0x1756*/      ldr r0, [r5, #4]
/*0x1758*/      str r0, [r1, #0x28]
/*0x175a*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x175c*/      uxtb r6, r6
/*0x175e*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x1760*/      nop 
/*0x1762*/      nop 
/*0x1764*/      movs r0, #0xff
/*0x1766*/      ldr r1, [r7, #0x1c]
/*0x1768*/      lsls r1, r1, #0x16
/*0x176a*/      bmi jump_176e
/*0x176c*/      movs r0, #0xfe
            jump_176e:
/*0x176e*/      ldr.w r2, [r8, #0x1c]
/*0x1772*/      mov r1, r8
/*0x1774*/      lsls r2, r2, #0x1a
/*0x1776*/      bmi jump_177c
/*0x1778*/      bic r0, r0, #2
            jump_177c:
/*0x177c*/      ldr r2, [r1, #0x1c]
/*0x177e*/      lsls r2, r2, #0x19
/*0x1780*/      bmi jump_1786
/*0x1782*/      bic r0, r0, #4
            jump_1786:
/*0x1786*/      ldr r1, [r1, #0x1c]
/*0x1788*/      lsls r1, r1, #0x18
/*0x178a*/      bmi jump_1790
/*0x178c*/      bic r0, r0, #8
            jump_1790:
/*0x1790*/      ldr r1, [r7, #0x1c]
/*0x1792*/      lsls r1, r1, #0x14
/*0x1794*/      bmi jump_179a
/*0x1796*/      bic r0, r0, #0x10
            jump_179a:
/*0x179a*/      ldr r1, [r7, #0x1c]
/*0x179c*/      lsls r1, r1, #0x12
/*0x179e*/      bmi jump_17a4
/*0x17a0*/      bic r0, r0, #0x20
            jump_17a4:
/*0x17a4*/      ldr r1, [r7, #0x1c]
/*0x17a6*/      lsls r1, r1, #0x11
/*0x17a8*/      bmi jump_17ae
/*0x17aa*/      bic r0, r0, #0x40
            jump_17ae:
/*0x17ae*/      ldr r1, [r7, #0x1c]
/*0x17b0*/      lsls r1, r1, #0x10
/*0x17b2*/      bmi jump_17b8
/*0x17b4*/      bic r0, r0, #0x80
            jump_17b8:
/*0x17b8*/      ldr r2, [r5]
/*0x17ba*/      ldr r1, [r5, #4]
/*0x17bc*/      str r1, [r2, #0x24]
/*0x17be*/      ldrb r1, [r4, #1]
/*0x17c0*/      cmp r1, r0
/*0x17c2*/      beq jump_17ca
/*0x17c4*/      strb r0, [r4, #1]
/*0x17c6*/      movs r0, #3
/*0x17c8*/      b jump_17d6
            jump_17ca:
/*0x17ca*/      ldrb r0, [r4]
/*0x17cc*/      cbz r0, jump_17d8
/*0x17ce*/      cmp r0, #1
/*0x17d0*/      bne jump_17d4
/*0x17d2*/      strb r1, [r4, #2]
            jump_17d4:
/*0x17d4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_17d6:
/*0x17d6*/      strb r0, [r4]
            jump_17d8:
/*0x17d8*/      cmp r6, #0
/*0x17da*/      beq jump_17e6
/*0x17dc*/      movs r0, #5
/*0x17de*/      bl call_102
/*0x17e2*/      subs r5, #8
/*0x17e4*/      b jump_1754
            jump_17e6:
/*0x17e6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x17ea*/  .byte 0x00
/*0x17eb*/  .byte 0x00

            data_17ec:
/*0x17ec*/  .word 0x200000d4
            data_17f0:
/*0x17f0*/  .word data_201c
            data_17f4:
/*0x17f4*/  .word 0x400b0000
            data_17f8:
/*0x17f8*/  .word 0x400b4000

            jump_17fc:
/*0x17fc*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x17fe*/      ldr r0, [pc, #0x44] /* data_1844 */
/*0x1800*/      ldr r0, [r0]
/*0x1802*/      ldr r1, [pc, #0x44] /* data_1848 */
/*0x1804*/      ldr r6, [pc, #0x44] /* data_184c */
/*0x1806*/      udiv r4, r0, r1
/*0x180a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x180c*/      strh.w r4, [sp]
/*0x1810*/      movs r5, #0
/*0x1812*/      strh.w r5, [sp, #2]
/*0x1816*/      mov r1, sp
/*0x1818*/      mov r0, r6
/*0x181a*/      bl call_3d6
/*0x181e*/      strb.w r5, [sp]
/*0x1822*/      movs r0, #7
/*0x1824*/      strh.w r0, [sp, #2]
/*0x1828*/      movs r0, #1
/*0x182a*/      strb.w r0, [sp, #4]
/*0x182e*/      strb.w r5, [sp, #5]
/*0x1832*/      lsrs r0, r4, #1
/*0x1834*/      strh.w r0, [sp, #6]
/*0x1838*/      mov r1, sp
/*0x183a*/      mov r0, r6
/*0x183c*/      bl call_444
/*0x1840*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x1842*/  .byte 0x00
/*0x1843*/  .byte 0x00

            data_1844:
/*0x1844*/  .word 0x2000001c
            data_1848:
/*0x1848*/  .word 0x00dbba00
            data_184c:
/*0x184c*/  .word 0x4006f000


            .thumb_func
            call_1850:
/*0x1850*/      push {r4, lr}
/*0x1852*/      ldr r1, [pc, #0x28] /* data_187c */
/*0x1854*/      mov.w r4, #0x8000
/*0x1858*/      str r4, [r1, #0x28]
/*0x185a*/      nop 
/*0x185c*/      nop 
/*0x185e*/      str r4, [r1, #0x24]
/*0x1860*/      mov.w r2, #0x4000
/*0x1864*/      b jump_1870
            jump_1866:
/*0x1866*/      str r2, [r1, #0x28]
/*0x1868*/      nop 
/*0x186a*/      nop 
/*0x186c*/      str r2, [r1, #0x24]
/*0x186e*/      nop 
            jump_1870:
/*0x1870*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x1872*/      uxtb r0, r0
/*0x1874*/      bhs jump_1866
/*0x1876*/      str r4, [r1, #0x28]
/*0x1878*/      pop {r4, pc}

/*0x187a*/  .byte 0x00
/*0x187b*/  .byte 0x00

            data_187c:
/*0x187c*/  .word 0x400b0000


            .thumb_func
            call_1880:
/*0x1880*/      push {r4, r5, r6, r7, lr}
/*0x1882*/      movs r2, #4
/*0x1884*/      ldr r3, [pc, #0x24] /* data_18ac */
/*0x1886*/      lsls r4, r2, #0xc
/*0x1888*/      ldr r5, [pc, #0x24] /* data_18b0 */
/*0x188a*/      movw r6, #0xffff
/*0x188e*/      b jump_18a4
            jump_1890:
/*0x1890*/      nop 
/*0x1892*/      str r4, [r5, #0x28]
/*0x1894*/      lsls r7, r0, #0x10
/*0x1896*/      bpl jump_189c
/*0x1898*/      str r2, [r3, #0x24]
/*0x189a*/      b jump_189e
            jump_189c:
/*0x189c*/      str r2, [r3, #0x28]
            jump_189e:
/*0x189e*/      str r4, [r5, #0x24]
/*0x18a0*/      and.w r0, r6, r0, lsl #1
            jump_18a4:
/*0x18a4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x18a6*/      uxtb r1, r1
/*0x18a8*/      bhs jump_1890
/*0x18aa*/      pop {r4, r5, r6, r7, pc}

            data_18ac:
/*0x18ac*/  .word 0x400b4000
            data_18b0:
/*0x18b0*/  .word 0x400b0000


            .thumb_func
            loc_18b4:
/*0x18b4*/      movs r1, #1
/*0x18b6*/      lsls r1, r0
/*0x18b8*/      ldr r0, [pc, #8] /* data_18c4 */
/*0x18ba*/      ldrb r2, [r0, #5]
/*0x18bc*/      orrs r1, r2
/*0x18be*/      strb r1, [r0, #5]
/*0x18c0*/      bx lr

/*0x18c2*/  .byte 0x00
/*0x18c3*/  .byte 0x00

            data_18c4:
/*0x18c4*/  .word 0x20000020


            .thumb_func
            call_18c8:
/*0x18c8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x18cc*/      ldr r0, [pc, #0xcc] /* data_199c */
/*0x18ce*/      ldrb r1, [r0]
/*0x18d0*/      movs r4, #0
/*0x18d2*/      sub.w r5, r0, #0xa
/*0x18d6*/      cmp r1, #1
/*0x18d8*/      bne jump_18e6
/*0x18da*/      strb r4, [r0]
/*0x18dc*/      ldrb r0, [r5, #0x10]
/*0x18de*/      and r0, r0, #7
/*0x18e2*/      bl call_10e
            jump_18e6:
/*0x18e6*/      ldr r6, [pc, #0xb8] /* data_19a0 */
/*0x18e8*/      ldr r7, [pc, #0xb8] /* data_19a4 */
/*0x18ea*/      ldrb r0, [r6]
/*0x18ec*/      cbz r0, jump_18fa
/*0x18ee*/      cmp r0, #2
/*0x18f0*/      beq jump_1924
/*0x18f2*/      cmp r0, #4
/*0x18f4*/      beq jump_18fa
/*0x18f6*/      cmp r0, #5
/*0x18f8*/      bne jump_1936
            jump_18fa:
/*0x18fa*/      ldrb r0, [r5, #5]
/*0x18fc*/      lsls r0, r0, #0x1b
/*0x18fe*/      bpl jump_1936
/*0x1900*/      movs r0, #1
/*0x1902*/      strb r0, [r6]
/*0x1904*/      movs r2, #0x40
/*0x1906*/      ldr r1, [pc, #0xa0] /* data_19a8 */
/*0x1908*/      movs r0, #4
/*0x190a*/      bl call_13a4
/*0x190e*/      ldr r2, [pc, #0x98] /* data_19a8 */
/*0x1910*/      rsb.w r1, r0, #0x40
/*0x1914*/      add r0, r2
/*0x1916*/      bl mem_zero
/*0x191a*/      ldrb r0, [r5, #5]
/*0x191c*/      bic r0, r0, #0x10
/*0x1920*/      strb r0, [r5, #5]
/*0x1922*/      b jump_1936
            jump_1924:
/*0x1924*/      ldr r0, [r7, #0x50]
/*0x1926*/      lsls r0, r0, #0x1e
/*0x1928*/      bpl jump_1936
/*0x192a*/      movs r2, #0x40
/*0x192c*/      ldr r1, [pc, #0x78] /* data_19a8 */
/*0x192e*/      movs r0, #3
/*0x1930*/      bl call_1404
/*0x1934*/      strb r4, [r6]
            jump_1936:
/*0x1936*/      ldr r0, [r7, #0x28]
/*0x1938*/      lsls r0, r0, #0x1e
/*0x193a*/      bpl jump_196c
/*0x193c*/      ldrb r0, [r5]
/*0x193e*/      cbz r0, jump_1944
/*0x1940*/      strb r4, [r5]
/*0x1942*/      b jump_1960
            jump_1944:
/*0x1944*/      ldr r1, [pc, #0x64] /* data_19ac */
/*0x1946*/      ldr r0, [r1]
/*0x1948*/      cbnz r0, jump_196c
/*0x194a*/      add.w r0, r1, #0xc
/*0x194e*/      ldr r0, [r0]
/*0x1950*/      cbz r0, jump_196c
/*0x1952*/      mov.w r2, #0xfa0
/*0x1956*/      muls r0, r2, r0
/*0x1958*/      asrs r2, r2, #3
/*0x195a*/      udiv r0, r0, r2
/*0x195e*/      str r0, [r1]
            jump_1960:
/*0x1960*/      ldr r1, [pc, #0x38] /* data_199c */
/*0x1962*/      movs r2, #8
/*0x1964*/      adds r1, #0x12
/*0x1966*/      movs r0, #1
/*0x1968*/      bl call_1404
            jump_196c:
/*0x196c*/      ldr r0, [r7, #0x3c]
/*0x196e*/      lsls r0, r0, #0x1e
/*0x1970*/      bpl jump_1998
/*0x1972*/      ldrb r0, [r5, #2]
/*0x1974*/      cbz r0, jump_1980
/*0x1976*/      ldr r1, [pc, #0x24] /* data_199c */
/*0x1978*/      movs r2, #5
/*0x197a*/      strb r4, [r5, #2]
/*0x197c*/      adds r1, #0xa
/*0x197e*/      b jump_198e
            jump_1980:
/*0x1980*/      ldrb r0, [r5, #1]
/*0x1982*/      cmp r0, #0
/*0x1984*/      beq jump_1998
/*0x1986*/      ldr r1, [pc, #0x14] /* data_199c */
/*0x1988*/      movs r2, #2
/*0x198a*/      strb r4, [r5, #1]
/*0x198c*/      .short 0x1e89 /* subs r1, r1, #2 */ 
            jump_198e:
/*0x198e*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x1992*/      movs r0, #2
/*0x1994*/      b.w call_1404
            jump_1998:
/*0x1998*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_199c:
/*0x199c*/  .word 0x2000002a
            data_19a0:
/*0x19a0*/  .word 0x20000004
            data_19a4:
/*0x19a4*/  .word 0x400a8000
            data_19a8:
/*0x19a8*/  .word 0x20000088
            data_19ac:
/*0x19ac*/  .word 0x200001d4


            .thumb_func
            loc_19b0:
/*0x19b0*/      push {r4, r5, r6, r7, lr}
/*0x19b2*/      ldrh r1, [r0]
/*0x19b4*/      mov.w r6, #0x100
/*0x19b8*/      movw r5, #0x921
/*0x19bc*/      lsls r7, r6, #1
/*0x19be*/      movs r2, #1
/*0x19c0*/      ldr r4, [pc, #0xc8] /* data_1a8c */
/*0x19c2*/      subw r3, r1, #0x921
/*0x19c6*/      cmp r1, r5
/*0x19c8*/      beq jump_1a3a
/*0x19ca*/      bgt jump_19e8
/*0x19cc*/      adds.w r1, r3, #0x780
/*0x19d0*/      beq jump_19fa
/*0x19d2*/      cmp r1, r6
/*0x19d4*/      beq jump_1a2e
/*0x19d6*/      cmp r1, r7
/*0x19d8*/      bne jump_1a5c
/*0x19da*/      ldrh r1, [r0, #4]
/*0x19dc*/      cmp r1, #0
/*0x19de*/      bne jump_1a5c
/*0x19e0*/      ldr r1, [pc, #0xac] /* data_1a90 */
/*0x19e2*/      strd r1, r2, [r0, #0x1c]
/*0x19e6*/      b jump_1a86
            jump_19e8:
/*0x19e8*/      movs r5, #0
/*0x19ea*/      cmp r3, r6
/*0x19ec*/      beq jump_1a60
/*0x19ee*/      cmp r3, r7
/*0x19f0*/      bne jump_1a5c
/*0x19f2*/      ldrh r3, [r0, #4]
/*0x19f4*/      ldrb r1, [r0, #2]
/*0x19f6*/      cbz r3, jump_1a5e
/*0x19f8*/      b jump_1a84
            jump_19fa:
/*0x19fa*/      ldrb r5, [r0, #3]
/*0x19fc*/      ldrb r3, [r0, #2]
/*0x19fe*/      ldrh r4, [r0, #6]
/*0x1a00*/      ldrh r1, [r0, #4]
/*0x1a02*/      cmp r5, #1
/*0x1a04*/      bne jump_1a5c
/*0x1a06*/      cbz r1, jump_1a1e
/*0x1a08*/      cmp r1, #1
/*0x1a0a*/      beq jump_1a5c
/*0x1a0c*/      cmp r1, #2
/*0x1a0e*/      bne jump_1a5c
/*0x1a10*/      cmp r3, #1
/*0x1a12*/      beq jump_1a24
/*0x1a14*/      cmp r3, #2
/*0x1a16*/      bne jump_1a5c
/*0x1a18*/      ldr r1, [pc, #0x74] /* data_1a90 */
/*0x1a1a*/      adds r1, #0x11
/*0x1a1c*/      b jump_1a28
            jump_1a1e:
/*0x1a1e*/      ldr r1, [pc, #0x70] /* data_1a90 */
/*0x1a20*/      adds r1, #0x19
/*0x1a22*/      b jump_1a28
            jump_1a24:
/*0x1a24*/      ldr r1, [pc, #0x68] /* data_1a90 */
/*0x1a26*/      .short 0x1d49 /* adds r1, r1, #5 */ 
            jump_1a28:
/*0x1a28*/      strd r1, r4, [r0, #0x1c]
/*0x1a2c*/      b jump_1a86
            jump_1a2e:
/*0x1a2e*/      ldrh r1, [r0, #4]
/*0x1a30*/      cmp r1, #0
/*0x1a32*/      bne jump_1a5c
/*0x1a34*/      strd r4, r2, [r0, #0x1c]
/*0x1a38*/      b jump_1a86
            jump_1a3a:
/*0x1a3a*/      ldrb r2, [r0, #3]
/*0x1a3c*/      ldrh r3, [r0, #6]
/*0x1a3e*/      ldrh r1, [r0, #4]
/*0x1a40*/      str r3, [r0, #0x20]
/*0x1a42*/      cmp r2, #2
/*0x1a44*/      bne jump_1a5c
/*0x1a46*/      cmp r1, #0
/*0x1a48*/      bne jump_1a5c
/*0x1a4a*/      ldr r2, [pc, #0x44] /* data_1a90 */
/*0x1a4c*/      adds r2, #0xd
/*0x1a4e*/      str r2, [r0, #0x1c]
/*0x1a50*/      ldr r2, [pc, #0x40] /* data_1a94 */
/*0x1a52*/      strd r2, r1, [r0, #0x28]
/*0x1a56*/      movs r1, #2
/*0x1a58*/      strb.w r1, [r0, #0x24]
            jump_1a5c:
/*0x1a5c*/      pop {r4, r5, r6, r7, pc}
            jump_1a5e:
/*0x1a5e*/      b jump_1a7e
            jump_1a60:
/*0x1a60*/      ldrh r3, [r0, #4]
/*0x1a62*/      ldrb r1, [r0, #3]
/*0x1a64*/      cmp r3, #0
/*0x1a66*/      bne jump_1a5c
/*0x1a68*/      mov.w r3, #0xfa0
/*0x1a6c*/      str r1, [r4]
/*0x1a6e*/      muls r1, r3, r1
/*0x1a70*/      asrs r3, r3, #3
/*0x1a72*/      udiv r1, r1, r3
/*0x1a76*/      ldr r3, [pc, #0x14] /* data_1a8c */
/*0x1a78*/      subs r3, #0xc
/*0x1a7a*/      str r1, [r3]
/*0x1a7c*/      b jump_1a84
            jump_1a7e:
/*0x1a7e*/      ldr r3, [pc, #0x10] /* data_1a90 */
/*0x1a80*/      .short 0x1edb /* subs r3, r3, #3 */ 
/*0x1a82*/      strb r1, [r3, #3]
            jump_1a84:
/*0x1a84*/      str r5, [r0, #0x20]
            jump_1a86:
/*0x1a86*/      strb.w r2, [r0, #0x24]
/*0x1a8a*/      b jump_1a5c

            data_1a8c:
/*0x1a8c*/  .word 0x200001e0
            data_1a90:
/*0x1a90*/  .word 0x20000023
            data_1a94:
/*0x1a94*/  .word 0x00001a99 /* possible pointer */


            .thumb_func
            orphan_1a98:
/*0x1a98*/      ldr r2, [pc, #4] /* data_1aa0 */
/*0x1a9a*/      movs r1, #1
/*0x1a9c*/      strb r1, [r2, r0]
/*0x1a9e*/      bx lr

            data_1aa0:
/*0x1aa0*/  .word 0x2000002a


            .thumb_func
            loc_1aa4:
/*0x1aa4*/      ldrb r2, [r0, #3]
/*0x1aa6*/      ldrh r1, [r0, #4]
/*0x1aa8*/      movs r3, #1
/*0x1aaa*/      cmp r2, #0x21
/*0x1aac*/      beq jump_1abe
/*0x1aae*/      cmp r2, #0x22
/*0x1ab0*/      bne jump_1af6
/*0x1ab2*/      cbz r1, jump_1ae0
/*0x1ab4*/      cmp r1, #1
/*0x1ab6*/      beq jump_1ae8
/*0x1ab8*/      cmp r1, #2
/*0x1aba*/      bne jump_1af2
/*0x1abc*/      b jump_1af8
            jump_1abe:
/*0x1abe*/      cbz r1, jump_1aca
/*0x1ac0*/      cmp r1, #1
/*0x1ac2*/      beq jump_1ad0
/*0x1ac4*/      cmp r1, #2
/*0x1ac6*/      bne jump_1ad6
/*0x1ac8*/      b jump_1ada
            jump_1aca:
/*0x1aca*/      ldr r1, [r0, #0xc]
/*0x1acc*/      adds r1, #9
/*0x1ace*/      b jump_1ad4
            jump_1ad0:
/*0x1ad0*/      ldr r1, [r0, #0xc]
/*0x1ad2*/      adds r1, #0x22
            jump_1ad4:
/*0x1ad4*/      str r1, [r0, #0x1c]
            jump_1ad6:
/*0x1ad6*/      movs r1, #9
/*0x1ad8*/      b jump_1af0
            jump_1ada:
/*0x1ada*/      ldr r1, [r0, #0xc]
/*0x1adc*/      adds r1, #0x42
/*0x1ade*/      b jump_1ad4
            jump_1ae0:
/*0x1ae0*/      ldr r1, [pc, #0x20] /* data_1b04 */
/*0x1ae2*/      str r1, [r0, #0x1c]
/*0x1ae4*/      movs r1, #0x40
/*0x1ae6*/      b jump_1af0
            jump_1ae8:
/*0x1ae8*/      ldr r1, [pc, #0x18] /* data_1b04 */
/*0x1aea*/      subs r1, #0x8c
/*0x1aec*/      str r1, [r0, #0x1c]
/*0x1aee*/      movs r1, #0x22
            jump_1af0:
/*0x1af0*/      str r1, [r0, #0x20]
            jump_1af2:
/*0x1af2*/      strb.w r3, [r0, #0x24]
            jump_1af6:
/*0x1af6*/      bx lr
            jump_1af8:
/*0x1af8*/      ldr r1, [pc, #8] /* data_1b04 */
/*0x1afa*/      subs r1, #0x68
/*0x1afc*/      str r1, [r0, #0x1c]
/*0x1afe*/      movs r1, #0x65
/*0x1b00*/      b jump_1af0

/*0x1b02*/  .byte 0x00
/*0x1b03*/  .byte 0x00

            data_1b04:
/*0x1b04*/  .word 0x000020f8 /* possible pointer */


            .thumb_func
            call_1b08:
/*0x1b08*/      push {r4, r5, r6, lr}
/*0x1b0a*/      mov r4, r0
/*0x1b0c*/      movs r0, #0
/*0x1b0e*/      bl call_12fc
/*0x1b12*/      mov r5, r0
/*0x1b14*/      ldr r0, [r4, #0x20]
/*0x1b16*/      adds r1, r0, #1
/*0x1b18*/      beq jump_1b48
/*0x1b1a*/      ldrb.w r1, [r4, #0x24]
/*0x1b1e*/      cmp r1, #1
/*0x1b20*/      bne jump_1b48
/*0x1b22*/      cmp r0, r5
/*0x1b24*/      blo jump_1b2c
/*0x1b26*/      subs r0, r0, r5
/*0x1b28*/      str r0, [r4, #0x20]
/*0x1b2a*/      b jump_1b38
            jump_1b2c:
/*0x1b2c*/      mov r5, r0
/*0x1b2e*/      movs r0, #0
/*0x1b30*/      str r0, [r4, #0x20]
/*0x1b32*/      movs r0, #2
/*0x1b34*/      strb.w r0, [r4, #0x24]
            jump_1b38:
/*0x1b38*/      mov r2, r5
/*0x1b3a*/      movs r0, #0
/*0x1b3c*/      ldr r1, [r4, #0x1c]
/*0x1b3e*/      bl call_1404
/*0x1b42*/      ldr r0, [r4, #0x1c]
/*0x1b44*/      add r0, r5
/*0x1b46*/      str r0, [r4, #0x1c]
            jump_1b48:
/*0x1b48*/      pop {r4, r5, r6, pc}

/*0x1b4a*/  .byte 0x00
/*0x1b4b*/  .byte 0x00


            .thumb_func
            call_1b4c:
/*0x1b4c*/      push {r4, lr}
/*0x1b4e*/      mov r4, r0
/*0x1b50*/      movs r0, #0
/*0x1b52*/      strb.w r0, [r4, #0x24]
/*0x1b56*/      str r0, [r4, #0x20]
/*0x1b58*/      ldrb r0, [r4]
/*0x1b5a*/      ands r0, r0, #0x60
/*0x1b5e*/      beq jump_1b66
/*0x1b60*/      cmp r0, #0x20
/*0x1b62*/      bne jump_1b78
/*0x1b64*/      b jump_1b6e
            jump_1b66:
/*0x1b66*/      mov r0, r4
/*0x1b68*/      bl call_1bec
/*0x1b6c*/      b jump_1b78
            jump_1b6e:
/*0x1b6e*/      ldr r0, [pc, #0x40] /* data_1bb0 */
/*0x1b70*/      ldr r1, [r0, #0x14]
/*0x1b72*/      cbz r1, jump_1b78
/*0x1b74*/      mov r0, r4
/*0x1b76*/      blx r1
            jump_1b78:
/*0x1b78*/      ldrb.w r0, [r4, #0x24]
/*0x1b7c*/      cmp r0, #1
/*0x1b7e*/      beq jump_1b8e
/*0x1b80*/      cmp r0, #2
/*0x1b82*/      beq jump_1ba2
/*0x1b84*/      pop.w {r4, lr}
/*0x1b88*/      movs r0, #0
/*0x1b8a*/      b.w jump_13e4
            jump_1b8e:
/*0x1b8e*/      ldrh r0, [r4, #6]
/*0x1b90*/      ldr r1, [r4, #0x20]
/*0x1b92*/      cmp r1, r0
/*0x1b94*/      ble jump_1b98
/*0x1b96*/      str r0, [r4, #0x20]
            jump_1b98:
/*0x1b98*/      mov r0, r4
/*0x1b9a*/      pop.w {r4, lr}
/*0x1b9e*/      b.w call_1b08
            jump_1ba2:
/*0x1ba2*/      movs r2, #0
/*0x1ba4*/      pop.w {r4, lr}
/*0x1ba8*/      mov r1, r2
/*0x1baa*/      mov r0, r2
/*0x1bac*/      b.w call_1404

            data_1bb0:
/*0x1bb0*/  .word data_21c4

            jump_1bb4:
/*0x1bb4*/      push {r4, lr}
/*0x1bb6*/      mov r4, r0
/*0x1bb8*/      movs r0, #0
/*0x1bba*/      strb r0, [r4, #0x19]
/*0x1bbc*/      cbz r1, jump_1bd2
/*0x1bbe*/      cmp r1, #1
/*0x1bc0*/      beq jump_1bd6
/*0x1bc2*/      cmp r1, #2
/*0x1bc4*/      bne jump_1be8
/*0x1bc6*/      ldrb r0, [r4, #4]
/*0x1bc8*/      and r0, r0, #0xf
/*0x1bcc*/      bl call_130a
/*0x1bd0*/      b jump_1bd6
            jump_1bd2:
/*0x1bd2*/      ldrb.w r0, [r4, #0x34]
            jump_1bd6:
/*0x1bd6*/      strb r0, [r4, #0x18]
/*0x1bd8*/      add.w r0, r4, #0x18
/*0x1bdc*/      str r0, [r4, #0x1c]
/*0x1bde*/      movs r0, #2
/*0x1be0*/      str r0, [r4, #0x20]
/*0x1be2*/      movs r0, #1
/*0x1be4*/      strb.w r0, [r4, #0x24]
            jump_1be8:
/*0x1be8*/      pop {r4, pc}

/*0x1bea*/  .byte 0x00
/*0x1beb*/  .byte 0x00


            .thumb_func
            call_1bec:
/*0x1bec*/      push {r4, r5, r6, lr}
/*0x1bee*/      mov r4, r0
/*0x1bf0*/      ldrh r0, [r0]
/*0x1bf2*/      movs r5, #1
/*0x1bf4*/      cmp.w r0, #0x500
/*0x1bf8*/      beq jump_1c9a
/*0x1bfa*/      bgt jump_1c3e
/*0x1bfc*/      cmp.w r0, #0x100
/*0x1c00*/      beq jump_1c8c
/*0x1c02*/      bgt jump_1c1c
/*0x1c04*/      cmp r0, #0x80
/*0x1c06*/      beq jump_1c84
/*0x1c08*/      cmp r0, #0x81
/*0x1c0a*/      beq jump_1c88
/*0x1c0c*/      cmp r0, #0x82
/*0x1c0e*/      bne jump_1cde
/*0x1c10*/      movs r1, #2
            jump_1c12:
/*0x1c12*/      mov r0, r4
/*0x1c14*/      pop.w {r4, r5, r6, lr}
/*0x1c18*/      b.w jump_1bb4
            jump_1c1c:
/*0x1c1c*/      cmp.w r0, #0x102
/*0x1c20*/      beq jump_1c90
/*0x1c22*/      cmp.w r0, #0x300
/*0x1c26*/      beq jump_1c94
/*0x1c28*/      sub.w r0, r0, #0x300
/*0x1c2c*/      subs r0, #2
/*0x1c2e*/      bne jump_1cde
/*0x1c30*/      movs r2, #1
            jump_1c32:
/*0x1c32*/      movs r1, #2
            jump_1c34:
/*0x1c34*/      mov r0, r4
/*0x1c36*/      pop.w {r4, r5, r6, lr}
/*0x1c3a*/      b.w jump_1d14
            jump_1c3e:
/*0x1c3e*/      ldr r1, [pc, #0xcc] /* data_1d0c */
/*0x1c40*/      cmp.w r0, #0x900
/*0x1c44*/      beq jump_1ce4
/*0x1c46*/      bgt jump_1c68
/*0x1c48*/      cmp.w r0, #0x680
/*0x1c4c*/      beq jump_1ca8
/*0x1c4e*/      sub.w r0, r0, #0x600
/*0x1c52*/      subs r0, #0x81
/*0x1c54*/      beq jump_1ce0
/*0x1c56*/      sub.w r0, r0, #0x100
/*0x1c5a*/      subs r0, #0xff
/*0x1c5c*/      bne jump_1cde
/*0x1c5e*/      add.w r0, r4, #0x30
/*0x1c62*/      strd r0, r5, [r4, #0x1c]
/*0x1c66*/      b jump_1cda
            jump_1c68:
/*0x1c68*/      sub.w r0, r0, #0xa00
/*0x1c6c*/      subs r0, #0x81
/*0x1c6e*/      beq jump_1d06
/*0x1c70*/      cmp r0, #0x80
/*0x1c72*/      bne jump_1cde
/*0x1c74*/      ldr r0, [r1, #0xc]
            jump_1c76:
/*0x1c76*/      cmp r0, #0
/*0x1c78*/      beq jump_1cde
/*0x1c7a*/      mov r1, r0
/*0x1c7c*/      mov r0, r4
/*0x1c7e*/      pop.w {r4, r5, r6, lr}
/*0x1c82*/      bx r1
            jump_1c84:
/*0x1c84*/      movs r1, #0
/*0x1c86*/      b jump_1c12
            jump_1c88:
/*0x1c88*/      movs r1, #1
/*0x1c8a*/      b jump_1c12
            jump_1c8c:
/*0x1c8c*/      movs r2, #0
/*0x1c8e*/      b jump_1c96
            jump_1c90:
/*0x1c90*/      movs r2, #0
/*0x1c92*/      b jump_1c32
            jump_1c94:
/*0x1c94*/      movs r2, #1
            jump_1c96:
/*0x1c96*/      movs r1, #0
/*0x1c98*/      b jump_1c34
            jump_1c9a:
/*0x1c9a*/      ldrb r0, [r4, #2]
/*0x1c9c*/      bl call_15dc
/*0x1ca0*/      strb.w r5, [r4, #0x24]
/*0x1ca4*/      movs r0, #5
/*0x1ca6*/      b jump_1d00
            jump_1ca8:
/*0x1ca8*/      ldrb r0, [r4, #3]
/*0x1caa*/      cmp r0, #1
/*0x1cac*/      beq jump_1cce
/*0x1cae*/      cmp r0, #2
/*0x1cb0*/      beq jump_1cd2
/*0x1cb2*/      cmp r0, #3
/*0x1cb4*/      bne jump_1cde
/*0x1cb6*/      ldrb r0, [r4, #2]
/*0x1cb8*/      ldr r1, [r4, #0x14]
/*0x1cba*/      cmp r1, r0
/*0x1cbc*/      bls jump_1cde
/*0x1cbe*/      ldr r1, [r4, #0x10]
/*0x1cc0*/      ldr.w r0, [r1, r0, lsl #2]
/*0x1cc4*/      cmp r0, #0
/*0x1cc6*/      beq jump_1cde
            jump_1cc8:
/*0x1cc8*/      str r0, [r4, #0x1c]
/*0x1cca*/      ldrb r0, [r0]
/*0x1ccc*/      b jump_1cd8
            jump_1cce:
/*0x1cce*/      ldr r0, [r4, #8]
/*0x1cd0*/      b jump_1cc8
            jump_1cd2:
/*0x1cd2*/      ldr r0, [r4, #0xc]
/*0x1cd4*/      str r0, [r4, #0x1c]
/*0x1cd6*/      ldrh r0, [r0, #2]
            jump_1cd8:
/*0x1cd8*/      str r0, [r4, #0x20]
            jump_1cda:
/*0x1cda*/      strb.w r5, [r4, #0x24]
            jump_1cde:
/*0x1cde*/      pop {r4, r5, r6, pc}
            jump_1ce0:
/*0x1ce0*/      ldr r0, [r1, #8]
/*0x1ce2*/      b jump_1c76
            jump_1ce4:
/*0x1ce4*/      ldrb r0, [r4, #2]
/*0x1ce6*/      strb.w r0, [r4, #0x30]
/*0x1cea*/      strb.w r5, [r4, #0x24]
/*0x1cee*/      movs r5, #1
            jump_1cf0:
/*0x1cf0*/      ldr r1, [pc, #0x1c] /* data_1d10 */
/*0x1cf2*/      sxtb r0, r5
/*0x1cf4*/      bl call_1344
/*0x1cf8*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x1cfa*/      cmp r5, #8
/*0x1cfc*/      blo jump_1cf0
/*0x1cfe*/      movs r0, #6
            jump_1d00:
/*0x1d00*/      strb.w r0, [r4, #0x32]
/*0x1d04*/      pop {r4, r5, r6, pc}
            jump_1d06:
/*0x1d06*/      ldr r0, [r1, #0x10]
/*0x1d08*/      b jump_1c76

/*0x1d0a*/  .byte 0x00
/*0x1d0b*/  .byte 0x00

            data_1d0c:
/*0x1d0c*/  .word data_21c4
            data_1d10:
/*0x1d10*/  .word 0x20000044

            jump_1d14:
/*0x1d14*/      push {r4, r5, r6, lr}
/*0x1d16*/      mov r4, r0
/*0x1d18*/      movs r6, #1
/*0x1d1a*/      cbz r1, jump_1d36
/*0x1d1c*/      cmp r1, #2
/*0x1d1e*/      bne jump_1d34
/*0x1d20*/      ldrb r0, [r4, #4]
/*0x1d22*/      ands r5, r0, #0xf
/*0x1d26*/      beq jump_1d30
/*0x1d28*/      cbz r2, jump_1d4c
/*0x1d2a*/      mov r0, r5
/*0x1d2c*/      bl call_13f0
            jump_1d30:
/*0x1d30*/      strb.w r6, [r4, #0x24]
            jump_1d34:
/*0x1d34*/      pop {r4, r5, r6, pc}
            jump_1d36:
/*0x1d36*/      ldrb r0, [r4, #2]
/*0x1d38*/      cmp r0, #1
/*0x1d3a*/      bne jump_1d34
/*0x1d3c*/      ldrb r0, [r4, #0x34]!
/*0x1d40*/      bfi r0, r2, #1, #1
/*0x1d44*/      strb r0, [r4], #-0x10
/*0x1d48*/      strb r6, [r4]
/*0x1d4a*/      pop {r4, r5, r6, pc}
            jump_1d4c:
/*0x1d4c*/      ldr r0, [r4, #0x38]
/*0x1d4e*/      cmp r0, #0
/*0x1d50*/      bne jump_1d30
/*0x1d52*/      mov r0, r5
/*0x1d54*/      bl call_12a4
/*0x1d58*/      mov r0, r5
/*0x1d5a*/      bl call_1294
/*0x1d5e*/      b jump_1d30

            .thumb_func
            call_1d60:
/*0x1d60*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1d62*/      bmi jump_1d6e
/*0x1d64*/      ldr.w r3, [r0, r2, lsl #2]
/*0x1d68*/      str.w r3, [r1, r2, lsl #2]
/*0x1d6c*/      b call_1d60
            jump_1d6e:
/*0x1d6e*/      bx lr

            .thumb_func
            call_1d70:
/*0x1d70*/      ldr r1, [pc, #8] /* data_1d7c */
/*0x1d72*/      add.w r0, r0, r0, lsl #2
/*0x1d76*/      add.w r0, r1, r0, lsl #2
/*0x1d7a*/      bx lr

            data_1d7c:
/*0x1d7c*/  .word 0x400a8014


            .thumb_func
            call_1d80:
/*0x1d80*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1d84*/      movs r7, #0
/*0x1d86*/      mov.w r1, #0x8000
/*0x1d8a*/      mov r2, r7
/*0x1d8c*/      mov sl, r1
/*0x1d8e*/      movs r3, #1
/*0x1d90*/      mov r0, r2
/*0x1d92*/      bl call_2cc
/*0x1d96*/      ldr r0, [pc, #0x90] /* data_1e28 */
/*0x1d98*/      bl call_102c
/*0x1d9c*/      ldr r5, [pc, #0x8c] /* data_1e2c */
/*0x1d9e*/      mov r4, r0
/*0x1da0*/      movw r6, #0xeae0
/*0x1da4*/      cmp r0, #1
/*0x1da6*/      bne jump_1db6
/*0x1da8*/      ldr r0, [r5, #0x54]
/*0x1daa*/      orrs r0, r6
/*0x1dac*/      str r0, [r5, #0x54]
/*0x1dae*/      str r6, [r5, #0x58]
/*0x1db0*/      ldr r0, [r5, #0x50]
/*0x1db2*/      orrs r0, r6
/*0x1db4*/      str r0, [r5, #0x50]
            jump_1db6:
/*0x1db6*/      ldr.w r8, [pc, #0x70] /* data_1e28 */
/*0x1dba*/      ldrb.w r0, [r8, #0x32]
/*0x1dbe*/      cmp r0, #3
/*0x1dc0*/      bne jump_1e00
/*0x1dc2*/      ldr.w sb, [pc, #0x6c] /* data_1e30 */
/*0x1dc6*/      ldr.w r0, [sb]
/*0x1dca*/      tst.w r0, #0xc0
/*0x1dce*/      beq jump_1e00
/*0x1dd0*/      movs r0, #1
/*0x1dd2*/      bl call_51c
/*0x1dd6*/      ldr r1, [pc, #0x5c] /* data_1e34 */
/*0x1dd8*/      strb r7, [r1, #4]
/*0x1dda*/      ldrb.w r0, [r8, #0x32]
/*0x1dde*/      cmp r0, #3
/*0x1de0*/      bne jump_1e00
/*0x1de2*/      ldr.w r0, [sb]
/*0x1de6*/      tst.w r0, #0xc0
/*0x1dea*/      beq jump_1e00
/*0x1dec*/      bl watchdog_reload_timer
/*0x1df0*/      mov.w r0, #0x3e8
/*0x1df4*/      bl call_102
/*0x1df8*/      str r6, [r5, #0x58]
/*0x1dfa*/      movs r0, #0
/*0x1dfc*/      bl call_6e0
            jump_1e00:
/*0x1e00*/      ldr r0, [r5, #0x58]
/*0x1e02*/      tst r0, r6
/*0x1e04*/      beq jump_1e18
/*0x1e06*/      cmp r4, #1
/*0x1e08*/      bne jump_1e18
/*0x1e0a*/      ldr r0, [pc, #0x1c] /* data_1e28 */
/*0x1e0c*/      bl call_11b8
/*0x1e10*/      cmp r0, #1
/*0x1e12*/      bne jump_1e18
/*0x1e14*/      bl call_11c8
            jump_1e18:
/*0x1e18*/      mov r2, r7
/*0x1e1a*/      mov r1, sl
/*0x1e1c*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1e20*/      movs r3, #0
/*0x1e22*/      mov r0, r2
/*0x1e24*/      b.w call_2cc

            data_1e28:
/*0x1e28*/  .word 0x200001ec
            data_1e2c:
/*0x1e2c*/  .word 0x40024000
            data_1e30:
/*0x1e30*/  .word 0x400a8000
            data_1e34:
/*0x1e34*/  .word 0x20000020

/*0x1e38*/  .byte 0x02
/*0x1e39*/  .byte 0xe0
/*0x1e3a*/  .byte 0x08
/*0x1e3b*/  .byte 0xc8
/*0x1e3c*/  .byte 0x12
/*0x1e3d*/  .byte 0x1f
/*0x1e3e*/  .byte 0x08
/*0x1e3f*/  .byte 0xc1
/*0x1e40*/  .byte 0x00
/*0x1e41*/  .byte 0x2a
/*0x1e42*/  .byte 0xfa
/*0x1e43*/  .byte 0xd1
/*0x1e44*/  .byte 0x70
/*0x1e45*/  .byte 0x47
/*0x1e46*/  .byte 0x00
/*0x1e47*/  .byte 0x20
/*0x1e48*/  .byte 0x01
/*0x1e49*/  .byte 0xe0
/*0x1e4a*/  .byte 0x01
/*0x1e4b*/  .byte 0xc1
/*0x1e4c*/  .byte 0x12
/*0x1e4d*/  .byte 0x1f
/*0x1e4e*/  .byte 0x00
/*0x1e4f*/  .byte 0x2a
/*0x1e50*/  .byte 0xfb
/*0x1e51*/  .byte 0xd1
/*0x1e52*/  .byte 0x70
/*0x1e53*/  .byte 0x47


            .thumb_func
            call_1e54:
/*0x1e54*/      mov.w r0, #0x3400
/*0x1e58*/      ldr r1, [r0]
/*0x1e5a*/      sub.w r1, r1, #0x20000000
/*0x1e5e*/      cmp.w r1, #0x4000
/*0x1e62*/      bhi jump_1eae
/*0x1e64*/      adds r1, r0, #4
/*0x1e66*/      ldr r1, [r1]
/*0x1e68*/      sub.w r1, r1, #0x3400
/*0x1e6c*/      cmp.w r1, #0xc800
/*0x1e70*/      bhs jump_1eae
/*0x1e72*/      movw r1, #0x3bf8
/*0x1e76*/      ldr r1, [r1]
/*0x1e78*/      ldr r2, [pc, #0x34] /* data_1eb0 */
/*0x1e7a*/      cmp r1, r2
/*0x1e7c*/      bne jump_1eae
/*0x1e7e*/      mov.w r1, #0x3000
/*0x1e82*/      ldr.w r1, [r1, #0xb0]
/*0x1e86*/      ubfx r2, r1, #0, #0x12
/*0x1e8a*/      sub.w r3, r2, #0x5a00
/*0x1e8e*/      subs r3, #0xa5
/*0x1e90*/      bne jump_1eae
/*0x1e92*/      lsrs r2, r1, #0x12
/*0x1e94*/      cmp r2, #0xe
/*0x1e96*/      bhi jump_1eae
/*0x1e98*/      movw r1, #0x3078
/*0x1e9c*/      b jump_1ea6
            jump_1e9e:
/*0x1e9e*/      ldr r3, [r1]
/*0x1ea0*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x1ea2*/      beq jump_1eae
/*0x1ea4*/      .short 0x1d09 /* adds r1, r1, #4 */ 
            jump_1ea6:
/*0x1ea6*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1ea8*/      bhs jump_1e9e
/*0x1eaa*/      b.w load_jump_fw
            jump_1eae:
/*0x1eae*/      bx lr

            data_1eb0:
/*0x1eb0*/  .word 0x03042080


            .thumb_func
            main:
/*0x1eb4*/      ldr r0, [pc, #0x90] /* data_1f48 */
/*0x1eb6*/      ldr r3, [r0]
/*0x1eb8*/      ldr r2, [pc, #0x90] /* data_1f4c */
/*0x1eba*/      adds r1, r2, #5
/*0x1ebc*/      cmp r3, r2
/*0x1ebe*/      blo jump_1ec6
/*0x1ec0*/      ldr r3, [r0]
/*0x1ec2*/      cmp r3, r1
/*0x1ec4*/      bls jump_1eca
            jump_1ec6:
/*0x1ec6*/      str r2, [r0]
/*0x1ec8*/      b jump_1ed6
            jump_1eca:
/*0x1eca*/      ldr r2, [r0]
/*0x1ecc*/      cmp r2, r1
/*0x1ece*/      bhs jump_1ed6
/*0x1ed0*/      ldr r2, [r0]
/*0x1ed2*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1ed4*/      b jump_1ec6
            jump_1ed6:
/*0x1ed6*/      ldr r0, [r0]
/*0x1ed8*/      cmp r0, r1
/*0x1eda*/      beq jump_1ee0
/*0x1edc*/      bl call_1e54
            jump_1ee0:
/*0x1ee0*/      bl call_5ac
/*0x1ee4*/      bl call_214
/*0x1ee8*/      bl call_b90
/*0x1eec*/      bl call_690
/*0x1ef0*/      bl call_c80
/*0x1ef4*/      bl call_588
/*0x1ef8*/      movs r0, #1
/*0x1efa*/      bl call_51c
/*0x1efe*/      bl call_11e4
/*0x1f02*/      ldr r4, [pc, #0x4c] /* data_1f50 */
            jump_1f04:
/*0x1f04*/      bl call_1568
/*0x1f08*/      cmp r0, #1
/*0x1f0a*/      beq jump_1f1c
/*0x1f0c*/      cmp r0, #2
/*0x1f0e*/      beq jump_1f30
/*0x1f10*/      cmp r0, #3
/*0x1f12*/      bne jump_1f42
/*0x1f14*/      movs r0, #1
/*0x1f16*/      bl call_51c
/*0x1f1a*/      b jump_1f42
            jump_1f1c:
/*0x1f1c*/      movs r0, #0
/*0x1f1e*/      bl call_51c
/*0x1f22*/      bl call_ddc
/*0x1f26*/      bl call_6c0
/*0x1f2a*/      movs r0, #0
/*0x1f2c*/      bl call_b38
            jump_1f30:
/*0x1f30*/      bl handle_frame
/*0x1f34*/      bl call_ad0
/*0x1f38*/      ldrb r0, [r4]
/*0x1f3a*/      cbnz r0, jump_1f42
/*0x1f3c*/      movs r0, #1
/*0x1f3e*/      bl call_770
            jump_1f42:
/*0x1f42*/      bl watchdog_reload_timer
/*0x1f46*/      b jump_1f04

            data_1f48:
/*0x1f48*/  .word 0x20003ffc
            data_1f4c:
/*0x1f4c*/  .word 0x55aafaf0
            data_1f50:
/*0x1f50*/  .word 0x20000004

            data_1f54:
/*0x1f54*/  .byte 0x01
/*0x1f55*/  .byte 0x23
/*0x1f56*/  .byte 0x45
/*0x1f57*/  .byte 0x67
/*0x1f58*/  .byte 0x89
/*0x1f59*/  .byte 0xab
/*0x1f5a*/  .byte 0xcd
/*0x1f5b*/  .byte 0xef
/*0x1f5c*/  .byte 0x08
/*0x1f5d*/  .byte 0x09
/*0x1f5e*/  .byte 0x0a
/*0x1f5f*/  .byte 0x0b
/*0x1f60*/  .byte 0x0c
/*0x1f61*/  .byte 0x0d
/*0x1f62*/  .byte 0x0e
/*0x1f63*/  .byte 0x0f
/*0x1f64*/  .byte 0x10
/*0x1f65*/  .byte 0x11
/*0x1f66*/  .byte 0x12
/*0x1f67*/  .byte 0x13
/*0x1f68*/  .byte 0x14
/*0x1f69*/  .byte 0x15
/*0x1f6a*/  .byte 0x16
/*0x1f6b*/  .byte 0x17
/*0x1f6c*/  .byte 0x18
/*0x1f6d*/  .byte 0x19
/*0x1f6e*/  .byte 0x1a
/*0x1f6f*/  .byte 0x1b
/*0x1f70*/  .byte 0x1c
/*0x1f71*/  .byte 0x1d
/*0x1f72*/  .byte 0x1e
/*0x1f73*/  .byte 0x1f
/*0x1f74*/  .byte 0x20
/*0x1f75*/  .byte 0x21
/*0x1f76*/  .byte 0x22
/*0x1f77*/  .byte 0x23
/*0x1f78*/  .byte 0x24
/*0x1f79*/  .byte 0x25
/*0x1f7a*/  .byte 0x26
/*0x1f7b*/  .byte 0x27
/*0x1f7c*/  .byte 0x28
/*0x1f7d*/  .byte 0x29
/*0x1f7e*/  .byte 0x2a
/*0x1f7f*/  .byte 0x2b
/*0x1f80*/  .byte 0x2c
/*0x1f81*/  .byte 0x2d
/*0x1f82*/  .byte 0x2e
/*0x1f83*/  .byte 0x2f
/*0x1f84*/  .byte 0x30
/*0x1f85*/  .byte 0x31
/*0x1f86*/  .byte 0x32
/*0x1f87*/  .byte 0x33
/*0x1f88*/  .byte 0x34
/*0x1f89*/  .byte 0x35
/*0x1f8a*/  .byte 0x36
/*0x1f8b*/  .byte 0x37
/*0x1f8c*/  .byte 0x38
/*0x1f8d*/  .byte 0x39
/*0x1f8e*/  .byte 0x3a
/*0x1f8f*/  .byte 0x3b
/*0x1f90*/  .byte 0x3c
/*0x1f91*/  .byte 0x3d
/*0x1f92*/  .byte 0x3e
/*0x1f93*/  .byte 0x3f
            data_1f94:
/*0x1f94*/  .byte 0x62
/*0x1f95*/  .byte 0x59
/*0x1f96*/  .byte 0x5c
/*0x1f97*/  .byte 0x5f
/*0x1f98*/  .byte 0x53
/*0x1f99*/  .byte 0xe8
/*0x1f9a*/  .byte 0x00
/*0x1f9b*/  .byte 0x00
/*0x1f9c*/  .byte 0xc0
/*0x1f9d*/  .byte 0x5a
/*0x1f9e*/  .byte 0x5d
/*0x1f9f*/  .byte 0x60
/*0x1fa0*/  .byte 0x54
/*0x1fa1*/  .byte 0x2b
/*0x1fa2*/  .byte 0x00
/*0x1fa3*/  .byte 0x00
/*0x1fa4*/  .byte 0x63
/*0x1fa5*/  .byte 0x5b
/*0x1fa6*/  .byte 0x5e
/*0x1fa7*/  .byte 0x61
/*0x1fa8*/  .byte 0x55
/*0x1fa9*/  .byte 0x2e
/*0x1faa*/  .byte 0x00
/*0x1fab*/  .byte 0x00
/*0x1fac*/  .byte 0x58
/*0x1fad*/  .byte 0x00
/*0x1fae*/  .byte 0x57
/*0x1faf*/  .byte 0x00
/*0x1fb0*/  .byte 0x56
/*0x1fb1*/  .byte 0x2a
/*0x1fb2*/  .byte 0x00
/*0x1fb3*/  .byte 0x00

            gpio_map_1:
/*0x1fb4*/  .word 0x400b4000
/*0x1fb8*/  .word 0x00000200 /* possible pointer */
/*0x1fbc*/  .word 0x400b0000
/*0x1fc0*/  .word 0x00000020 /* possible pointer */
/*0x1fc4*/  .word 0x400b0000
/*0x1fc8*/  .word 0x00000040 /* possible pointer */
/*0x1fcc*/  .word 0x400b0000
/*0x1fd0*/  .word 0x00000080 /* possible pointer */
/*0x1fd4*/  .word 0x400b4000
/*0x1fd8*/  .word 0x00000800 /* possible pointer */
/*0x1fdc*/  .word 0x400b4000
/*0x1fe0*/  .word 0x00002000 /* possible pointer */
/*0x1fe4*/  .word 0x400b4000
/*0x1fe8*/  .word 0x00004000
/*0x1fec*/  .word 0x400b4000
/*0x1ff0*/  .word 0x00008000

/*0x1ff4*/  .byte 0x02
/*0x1ff5*/  .byte 0x09
/*0x1ff6*/  .byte 0x00
/*0x1ff7*/  .byte 0x05
/*0x1ff8*/  .byte 0x00
/*0x1ff9*/  .byte 0x06
/*0x1ffa*/  .byte 0x00
/*0x1ffb*/  .byte 0x07
/*0x1ffc*/  .byte 0x02
/*0x1ffd*/  .byte 0x0b
/*0x1ffe*/  .byte 0x02
/*0x1fff*/  .byte 0x0d
/*0x2000*/  .byte 0x02
/*0x2001*/  .byte 0x0e
/*0x2002*/  .byte 0x02
/*0x2003*/  .byte 0x0f

            gpio_map_2:
/*0x2004*/  .word 0x400b0000
/*0x2008*/  .word 0x00000001 /* possible pointer */
/*0x200c*/  .word 0x400b0000
/*0x2010*/  .word 0x00000002 /* possible pointer */
/*0x2014*/  .word 0x400b6000
/*0x2018*/  .word 0x00000001 /* possible pointer */
            data_201c:
/*0x201c*/  .word 0x400b0000
/*0x2020*/  .word 0x00000400 /* possible pointer */
            gpio_map_3:
/*0x2024*/  .word 0x400b4000
/*0x2028*/  .word 0x00000100 /* possible pointer */
/*0x202c*/  .word 0x400b4000
/*0x2030*/  .word 0x00000080 /* possible pointer */
/*0x2034*/  .word 0x400b2000
/*0x2038*/  .word 0x00000020 /* possible pointer */
/*0x203c*/  .word 0x400b2000
/*0x2040*/  .word 0x00000010 /* possible pointer */
/*0x2044*/  .word 0x400b2000
/*0x2048*/  .word 0x00000008 /* possible pointer */
/*0x204c*/  .word 0x400b2000
/*0x2050*/  .word 0x00000004 /* possible pointer */
/*0x2054*/  .word 0x400b4000
/*0x2058*/  .word 0x00000040 /* possible pointer */
/*0x205c*/  .word 0x400b4000
/*0x2060*/  .word 0x00000020 /* possible pointer */

/*0x2064*/  .byte 0x38
/*0x2065*/  .byte 0x04
/*0x2066*/  .byte 0x00
/*0x2067*/  .byte 0x00
/*0x2068*/  .byte 0xa8
/*0x2069*/  .byte 0x21
/*0x206a*/  .byte 0x00
/*0x206b*/  .byte 0x00
/*0x206c*/  .byte 0x06
/*0x206d*/  .byte 0x00
/*0x206e*/  .byte 0xff
/*0x206f*/  .byte 0x09
/*0x2070*/  .byte 0x01
/*0x2071*/  .byte 0xa1
/*0x2072*/  .byte 0x01
/*0x2073*/  .byte 0x09
/*0x2074*/  .byte 0x02
/*0x2075*/  .byte 0x15
/*0x2076*/  .byte 0x00
/*0x2077*/  .byte 0x26
/*0x2078*/  .byte 0xff
/*0x2079*/  .byte 0x00
/*0x207a*/  .byte 0x75
/*0x207b*/  .byte 0x08
/*0x207c*/  .byte 0x95
/*0x207d*/  .byte 0x40
/*0x207e*/  .byte 0x81
/*0x207f*/  .byte 0x02
/*0x2080*/  .byte 0x09
/*0x2081*/  .byte 0x03
/*0x2082*/  .byte 0x15
/*0x2083*/  .byte 0x00
/*0x2084*/  .byte 0x26
/*0x2085*/  .byte 0xff
/*0x2086*/  .byte 0x00
/*0x2087*/  .byte 0x75
/*0x2088*/  .byte 0x08
/*0x2089*/  .byte 0x95
/*0x208a*/  .byte 0x40
/*0x208b*/  .byte 0x91
/*0x208c*/  .byte 0x02
/*0x208d*/  .byte 0xc0
/*0x208e*/  .byte 0x00
/*0x208f*/  .byte 0x00
/*0x2090*/  .byte 0x05
/*0x2091*/  .byte 0x01
/*0x2092*/  .byte 0x09
/*0x2093*/  .byte 0x80
/*0x2094*/  .byte 0xa1
/*0x2095*/  .byte 0x01
/*0x2096*/  .byte 0x85
/*0x2097*/  .byte 0x01
/*0x2098*/  .byte 0x19
/*0x2099*/  .byte 0x81
/*0x209a*/  .byte 0x29
/*0x209b*/  .byte 0x83
/*0x209c*/  .byte 0x15
/*0x209d*/  .byte 0x00
/*0x209e*/  .byte 0x25
/*0x209f*/  .byte 0x01
/*0x20a0*/  .byte 0x95
/*0x20a1*/  .byte 0x03
/*0x20a2*/  .byte 0x75
/*0x20a3*/  .byte 0x01
/*0x20a4*/  .byte 0x81
/*0x20a5*/  .byte 0x02
/*0x20a6*/  .byte 0x95
/*0x20a7*/  .byte 0x01
/*0x20a8*/  .byte 0x75
/*0x20a9*/  .byte 0x05
/*0x20aa*/  .byte 0x81
/*0x20ab*/  .byte 0x01
/*0x20ac*/  .byte 0xc0
/*0x20ad*/  .byte 0x05
/*0x20ae*/  .byte 0x0c
/*0x20af*/  .byte 0x09
/*0x20b0*/  .byte 0x01
/*0x20b1*/  .byte 0xa1
/*0x20b2*/  .byte 0x01
/*0x20b3*/  .byte 0x85
/*0x20b4*/  .byte 0x02
/*0x20b5*/  .byte 0x15
/*0x20b6*/  .byte 0x00
/*0x20b7*/  .byte 0x25
/*0x20b8*/  .byte 0x01
/*0x20b9*/  .byte 0x95
/*0x20ba*/  .byte 0x12
/*0x20bb*/  .byte 0x75
/*0x20bc*/  .byte 0x01
/*0x20bd*/  .byte 0x0a
/*0x20be*/  .byte 0x83
/*0x20bf*/  .byte 0x01
/*0x20c0*/  .byte 0x0a
/*0x20c1*/  .byte 0x8a
/*0x20c2*/  .byte 0x01
/*0x20c3*/  .byte 0x0a
/*0x20c4*/  .byte 0x92
/*0x20c5*/  .byte 0x01
/*0x20c6*/  .byte 0x0a
/*0x20c7*/  .byte 0x94
/*0x20c8*/  .byte 0x01
/*0x20c9*/  .byte 0x09
/*0x20ca*/  .byte 0xcd
/*0x20cb*/  .byte 0x09
/*0x20cc*/  .byte 0xb7
/*0x20cd*/  .byte 0x09
/*0x20ce*/  .byte 0xb6
/*0x20cf*/  .byte 0x09
/*0x20d0*/  .byte 0xb5
/*0x20d1*/  .byte 0x09
/*0x20d2*/  .byte 0xe2
/*0x20d3*/  .byte 0x09
/*0x20d4*/  .byte 0xea
/*0x20d5*/  .byte 0x09
/*0x20d6*/  .byte 0xe9
/*0x20d7*/  .byte 0x0a
/*0x20d8*/  .byte 0x21
/*0x20d9*/  .byte 0x02
/*0x20da*/  .byte 0x0a
/*0x20db*/  .byte 0x23
/*0x20dc*/  .byte 0x02
/*0x20dd*/  .byte 0x0a
/*0x20de*/  .byte 0x24
/*0x20df*/  .byte 0x02
/*0x20e0*/  .byte 0x0a
/*0x20e1*/  .byte 0x25
/*0x20e2*/  .byte 0x02
/*0x20e3*/  .byte 0x0a
/*0x20e4*/  .byte 0x26
/*0x20e5*/  .byte 0x02
/*0x20e6*/  .byte 0x0a
/*0x20e7*/  .byte 0x27
/*0x20e8*/  .byte 0x02
/*0x20e9*/  .byte 0x0a
/*0x20ea*/  .byte 0x2a
/*0x20eb*/  .byte 0x02
/*0x20ec*/  .byte 0x81
/*0x20ed*/  .byte 0x02
/*0x20ee*/  .byte 0x95
/*0x20ef*/  .byte 0x01
/*0x20f0*/  .byte 0x75
/*0x20f1*/  .byte 0x0e
/*0x20f2*/  .byte 0x81
/*0x20f3*/  .byte 0x01
/*0x20f4*/  .byte 0xc0
/*0x20f5*/  .byte 0x00
/*0x20f6*/  .byte 0x00
/*0x20f7*/  .byte 0x00
/*0x20f8*/  .byte 0x05
/*0x20f9*/  .byte 0x01
/*0x20fa*/  .byte 0x09
/*0x20fb*/  .byte 0x06
/*0x20fc*/  .byte 0xa1
/*0x20fd*/  .byte 0x01
/*0x20fe*/  .byte 0x05
/*0x20ff*/  .byte 0x07
/*0x2100*/  .byte 0x19
/*0x2101*/  .byte 0xe0
/*0x2102*/  .byte 0x29
/*0x2103*/  .byte 0xe7
/*0x2104*/  .byte 0x15
/*0x2105*/  .byte 0x00
/*0x2106*/  .byte 0x25
/*0x2107*/  .byte 0x01
/*0x2108*/  .byte 0x75
/*0x2109*/  .byte 0x01
/*0x210a*/  .byte 0x95
/*0x210b*/  .byte 0x08
/*0x210c*/  .byte 0x81
/*0x210d*/  .byte 0x02
/*0x210e*/  .byte 0x95
/*0x210f*/  .byte 0x01
/*0x2110*/  .byte 0x75
/*0x2111*/  .byte 0x08
/*0x2112*/  .byte 0x81
/*0x2113*/  .byte 0x03
/*0x2114*/  .byte 0x95
/*0x2115*/  .byte 0x03
/*0x2116*/  .byte 0x75
/*0x2117*/  .byte 0x01
/*0x2118*/  .byte 0x05
/*0x2119*/  .byte 0x08
/*0x211a*/  .byte 0x19
/*0x211b*/  .byte 0x01
/*0x211c*/  .byte 0x29
/*0x211d*/  .byte 0x03
/*0x211e*/  .byte 0x91
/*0x211f*/  .byte 0x02
/*0x2120*/  .byte 0x95
/*0x2121*/  .byte 0x01
/*0x2122*/  .byte 0x75
/*0x2123*/  .byte 0x05
/*0x2124*/  .byte 0x91
/*0x2125*/  .byte 0x03
/*0x2126*/  .byte 0x95
/*0x2127*/  .byte 0x06
/*0x2128*/  .byte 0x75
/*0x2129*/  .byte 0x08
/*0x212a*/  .byte 0x15
/*0x212b*/  .byte 0x00
/*0x212c*/  .byte 0x26
/*0x212d*/  .byte 0xa4
/*0x212e*/  .byte 0x00
/*0x212f*/  .byte 0x05
/*0x2130*/  .byte 0x07
/*0x2131*/  .byte 0x19
/*0x2132*/  .byte 0x00
/*0x2133*/  .byte 0x29
/*0x2134*/  .byte 0xa4
/*0x2135*/  .byte 0x81
/*0x2136*/  .byte 0x00
/*0x2137*/  .byte 0xc0
/*0x2138*/  .byte 0x09
/*0x2139*/  .byte 0x02
/*0x213a*/  .byte 0x5b
/*0x213b*/  .byte 0x00
/*0x213c*/  .byte 0x03
/*0x213d*/  .byte 0x01
/*0x213e*/  .byte 0x00
/*0x213f*/  .byte 0xa0
/*0x2140*/  .byte 0x32
/*0x2141*/  .byte 0x09
/*0x2142*/  .byte 0x04
/*0x2143*/  .byte 0x00
/*0x2144*/  .byte 0x00
/*0x2145*/  .byte 0x01
/*0x2146*/  .byte 0x03
/*0x2147*/  .byte 0x01
/*0x2148*/  .byte 0x01
/*0x2149*/  .byte 0x00
/*0x214a*/  .byte 0x09
/*0x214b*/  .byte 0x21
/*0x214c*/  .byte 0x11
/*0x214d*/  .byte 0x01
/*0x214e*/  .byte 0x00
/*0x214f*/  .byte 0x01
/*0x2150*/  .byte 0x22
/*0x2151*/  .byte 0x40
/*0x2152*/  .byte 0x00
/*0x2153*/  .byte 0x07
/*0x2154*/  .byte 0x05
/*0x2155*/  .byte 0x81
/*0x2156*/  .byte 0x03
/*0x2157*/  .byte 0x08
/*0x2158*/  .byte 0x00
/*0x2159*/  .byte 0x01
/*0x215a*/  .byte 0x09
/*0x215b*/  .byte 0x04
/*0x215c*/  .byte 0x01
/*0x215d*/  .byte 0x00
/*0x215e*/  .byte 0x02
/*0x215f*/  .byte 0x03
/*0x2160*/  .byte 0x00
/*0x2161*/  .byte 0x00
/*0x2162*/  .byte 0x00
/*0x2163*/  .byte 0x09
/*0x2164*/  .byte 0x21
/*0x2165*/  .byte 0x11
/*0x2166*/  .byte 0x01
/*0x2167*/  .byte 0x00
/*0x2168*/  .byte 0x01
/*0x2169*/  .byte 0x22
/*0x216a*/  .byte 0x22
/*0x216b*/  .byte 0x00
/*0x216c*/  .byte 0x07
/*0x216d*/  .byte 0x05
/*0x216e*/  .byte 0x83
/*0x216f*/  .byte 0x03
/*0x2170*/  .byte 0x40
/*0x2171*/  .byte 0x00
/*0x2172*/  .byte 0x01
/*0x2173*/  .byte 0x07
/*0x2174*/  .byte 0x05
/*0x2175*/  .byte 0x04
/*0x2176*/  .byte 0x03
/*0x2177*/  .byte 0x40
/*0x2178*/  .byte 0x00
/*0x2179*/  .byte 0x01
/*0x217a*/  .byte 0x09
/*0x217b*/  .byte 0x04
/*0x217c*/  .byte 0x02
/*0x217d*/  .byte 0x00
/*0x217e*/  .byte 0x01
/*0x217f*/  .byte 0x03
/*0x2180*/  .byte 0x00
/*0x2181*/  .byte 0x00
/*0x2182*/  .byte 0x00
/*0x2183*/  .byte 0x09
/*0x2184*/  .byte 0x21
/*0x2185*/  .byte 0x11
/*0x2186*/  .byte 0x01
/*0x2187*/  .byte 0x00
/*0x2188*/  .byte 0x01
/*0x2189*/  .byte 0x22
/*0x218a*/  .byte 0x65
/*0x218b*/  .byte 0x00
/*0x218c*/  .byte 0x07
/*0x218d*/  .byte 0x05
/*0x218e*/  .byte 0x82
/*0x218f*/  .byte 0x03
/*0x2190*/  .byte 0x40
/*0x2191*/  .byte 0x00
/*0x2192*/  .byte 0x01
/*0x2193*/  .byte 0x00
            data_2194:
/*0x2194*/  .byte 0x12
/*0x2195*/  .byte 0x01
/*0x2196*/  .byte 0x10
/*0x2197*/  .byte 0x01
/*0x2198*/  .byte 0x00
/*0x2199*/  .byte 0x00
/*0x219a*/  .byte 0x00
/*0x219b*/  .byte 0x40
/*0x219c*/  .byte 0xd9
/*0x219d*/  .byte 0x04
/*0x219e*/  .byte 0x00
/*0x219f*/  .byte 0x12
/*0x21a0*/  .byte 0x00
/*0x21a1*/  .byte 0x11
/*0x21a2*/  .byte 0x00
/*0x21a3*/  .byte 0x01
/*0x21a4*/  .byte 0x00
/*0x21a5*/  .byte 0x01
/*0x21a6*/  .byte 0x00
/*0x21a7*/  .byte 0x00
/*0x21a8*/  .byte 0x18
/*0x21a9*/  .byte 0x03
/*0x21aa*/  .byte 0x55
/*0x21ab*/  .byte 0x00
/*0x21ac*/  .byte 0x53
/*0x21ad*/  .byte 0x00
/*0x21ae*/  .byte 0x42
/*0x21af*/  .byte 0x00
/*0x21b0*/  .byte 0x2d
/*0x21b1*/  .byte 0x00
/*0x21b2*/  .byte 0x48
/*0x21b3*/  .byte 0x00
/*0x21b4*/  .byte 0x49
/*0x21b5*/  .byte 0x00
/*0x21b6*/  .byte 0x44
/*0x21b7*/  .byte 0x00
/*0x21b8*/  .byte 0x20
/*0x21b9*/  .byte 0x00
/*0x21ba*/  .byte 0x49
/*0x21bb*/  .byte 0x00
/*0x21bc*/  .byte 0x41
/*0x21bd*/  .byte 0x00
/*0x21be*/  .byte 0x50
/*0x21bf*/  .byte 0x00
/*0x21c0*/  .byte 0x00
/*0x21c1*/  .byte 0x00
/*0x21c2*/  .byte 0x00
/*0x21c3*/  .byte 0x00

            data_21c4:
/*0x21c4*/  .word loc_100c

/*0x21c8*/  .byte 0x00
/*0x21c9*/  .byte 0x00
/*0x21ca*/  .byte 0x00
/*0x21cb*/  .byte 0x00

/*0x21cc*/  .word loc_1aa4

/*0x21d0*/  .byte 0x00
/*0x21d1*/  .byte 0x00
/*0x21d2*/  .byte 0x00
/*0x21d3*/  .byte 0x00
/*0x21d4*/  .byte 0x00
/*0x21d5*/  .byte 0x00
/*0x21d6*/  .byte 0x00
/*0x21d7*/  .byte 0x00

/*0x21d8*/  .word loc_19b0
/*0x21dc*/  .word loc_18b4

            data_21e0:
/*0x21e0*/  .byte 0x00
/*0x21e1*/  .byte 0x22
/*0x21e2*/  .byte 0x00
/*0x21e3*/  .byte 0x00
/*0x21e4*/  .byte 0x00
/*0x21e5*/  .byte 0x00
/*0x21e6*/  .byte 0x00
/*0x21e7*/  .byte 0x20
/*0x21e8*/  .byte 0x44
/*0x21e9*/  .byte 0x00
/*0x21ea*/  .byte 0x00
/*0x21eb*/  .byte 0x00
/*0x21ec*/  .byte 0x38
/*0x21ed*/  .byte 0x1e
/*0x21ee*/  .byte 0x00
/*0x21ef*/  .byte 0x00
/*0x21f0*/  .byte 0x44
/*0x21f1*/  .byte 0x22
/*0x21f2*/  .byte 0x00
/*0x21f3*/  .byte 0x00
/*0x21f4*/  .byte 0x44
/*0x21f5*/  .byte 0x00
/*0x21f6*/  .byte 0x00
/*0x21f7*/  .byte 0x20
/*0x21f8*/  .byte 0xe4
/*0x21f9*/  .byte 0x05
/*0x21fa*/  .byte 0x00
/*0x21fb*/  .byte 0x00
/*0x21fc*/  .byte 0x46
/*0x21fd*/  .byte 0x1e
/*0x21fe*/  .byte 0x00
/*0x21ff*/  .byte 0x00
            data_2200:
/*0x2200*/  .byte 0x01
/*0x2201*/  .byte 0x00
/*0x2202*/  .byte 0x00
/*0x2203*/  .byte 0x00
/*0x2204*/  .byte 0x00
/*0x2205*/  .byte 0x00
/*0x2206*/  .byte 0x00
/*0x2207*/  .byte 0x00
/*0x2208*/  .byte 0x00
/*0x2209*/  .byte 0x30
/*0x220a*/  .byte 0x00
/*0x220b*/  .byte 0x00
/*0x220c*/  .byte 0x00
/*0x220d*/  .byte 0x00
/*0x220e*/  .byte 0x00
/*0x220f*/  .byte 0x00
/*0x2210*/  .byte 0x00
/*0x2211*/  .byte 0x00
/*0x2212*/  .byte 0x00
/*0x2213*/  .byte 0x00
/*0x2214*/  .byte 0xff
/*0x2215*/  .byte 0x00
/*0x2216*/  .byte 0x00
/*0x2217*/  .byte 0x00
/*0x2218*/  .byte 0x5c
/*0x2219*/  .byte 0x20
/*0x221a*/  .byte 0x00
/*0x221b*/  .byte 0x00
/*0x221c*/  .byte 0x00
/*0x221d*/  .byte 0xa2
/*0x221e*/  .byte 0x4a
/*0x221f*/  .byte 0x04
/*0x2220*/  .byte 0x00
/*0x2221*/  .byte 0x00
/*0x2222*/  .byte 0x00
/*0x2223*/  .byte 0x00
/*0x2224*/  .byte 0x00
/*0x2225*/  .byte 0x00
/*0x2226*/  .byte 0x00
/*0x2227*/  .byte 0x00
/*0x2228*/  .byte 0x00
/*0x2229*/  .byte 0x00
/*0x222a*/  .byte 0x00
/*0x222b*/  .byte 0x00
/*0x222c*/  .byte 0x00
/*0x222d*/  .byte 0x00
/*0x222e*/  .byte 0x00
/*0x222f*/  .byte 0x00
/*0x2230*/  .byte 0x00
/*0x2231*/  .byte 0x00
/*0x2232*/  .byte 0x00
/*0x2233*/  .byte 0x00
/*0x2234*/  .byte 0x00
/*0x2235*/  .byte 0x00
/*0x2236*/  .byte 0x00
/*0x2237*/  .byte 0x00
/*0x2238*/  .byte 0x00
/*0x2239*/  .byte 0x00
/*0x223a*/  .byte 0x00
/*0x223b*/  .byte 0x00
/*0x223c*/  .byte 0x00
/*0x223d*/  .byte 0x00
/*0x223e*/  .byte 0x00
/*0x223f*/  .byte 0x00
/*0x2240*/  .byte 0x00
/*0x2241*/  .byte 0x00
/*0x2242*/  .byte 0x00
/*0x2243*/  .byte 0x00
