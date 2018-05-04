.syntax unified
.cpu cortex-m3
.text
.thumb


            vectors:
/*0x0000*/  .word 0x20000730
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
/*0x002c*/  .word 0x20000730


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
/*0x00a4*/      movs r2, #0x38
/*0x00a6*/      movs r0, r0
            data_a8:
/*0x00a8*/      movs r2, #0x58
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
/*0x0110*/      b.w jump_1570

/*0x0114*/  .word usb_intr


            .thumb_func
            reset:
/*0x0118*/      ldr r0, [pc, #0xc] /* data_128 */
/*0x011a*/      blx r0 /* call_1648 */
/*0x011c*/      ldr r0, [pc, #0xc] /* data_12c */
/*0x011e*/      blx r0 /* call_fe0 */
/*0x0120*/      ldr r0, [pc, #0xc] /* data_130 */
/*0x0122*/      bx r0 /* entry */

            .thumb_func
            generic_fault:
/*0x0124*/      b generic_fault

            .thumb_func
            generic_intr:
/*0x0126*/      b generic_intr

            data_128:
/*0x0128*/  .word call_1648
            data_12c:
/*0x012c*/  .word call_fe0
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
/*0x0156*/      b.w jump_be0

/*0x015a*/  .byte 0x00
/*0x015b*/  .byte 0x00

            data_15c:
/*0x015c*/  .word 0x200002dc
            data_160:
/*0x0160*/  .word 0x40076000


            .thumb_func
            bftm1_intr:
/*0x0164*/      push {r4, r5, r6, lr}
/*0x0166*/      ldr r0, [pc, #0x6c] /* data_1d4 */
/*0x0168*/      bl bftm_clear
/*0x016c*/      ldr r5, [pc, #0x68] /* data_1d8 */
/*0x016e*/      movs r1, #2
/*0x0170*/      mov r0, r5
/*0x0172*/      bl call_e0
/*0x0176*/      movs r0, #0xa
/*0x0178*/      bl call_102
/*0x017c*/      movs r0, #2
/*0x017e*/      bl call_189c
/*0x0182*/      ldr r1, [pc, #0x58] /* data_1dc */
/*0x0184*/      mov.w r0, #0x8000
/*0x0188*/      str r0, [r1, #0x24]
/*0x018a*/      ldr r4, [pc, #0x54] /* data_1e0 */
/*0x018c*/      ldr r6, [pc, #0x54] /* data_1e4 */
/*0x018e*/      ldrb r1, [r4, #2]
/*0x0190*/      strb r1, [r4, #1]
/*0x0192*/      and r2, r1, #1
/*0x0196*/      movs r1, #0x10
/*0x0198*/      mov r0, r6
/*0x019a*/      bl call_3e4
/*0x019e*/      ldrb r0, [r4, #1]
/*0x01a0*/      movs r1, #0x20
/*0x01a2*/      ubfx r2, r0, #1, #1
/*0x01a6*/      mov r0, r6
/*0x01a8*/      bl call_3e4
/*0x01ac*/      ldrb r0, [r4, #1]
/*0x01ae*/      movs r1, #0x40
/*0x01b0*/      ubfx r2, r0, #2, #1
/*0x01b4*/      mov r0, r6
/*0x01b6*/      bl call_3e4
/*0x01ba*/      movs r1, #2
/*0x01bc*/      mov r0, r5
/*0x01be*/      bl call_dc
/*0x01c2*/      ldrb r0, [r4, #2]
/*0x01c4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x01c6*/      and r0, r0, #7
/*0x01ca*/      strb r0, [r4, #2]
/*0x01cc*/      pop.w {r4, r5, r6, lr}
/*0x01d0*/      b.w call_f60

            data_1d4:
/*0x01d4*/  .word 0x40077000
            data_1d8:
/*0x01d8*/  .word 0x400b2000
            data_1dc:
/*0x01dc*/  .word 0x400b0000
            data_1e0:
/*0x01e0*/  .word 0x20000014
            data_1e4:
/*0x01e4*/  .word 0x400b4000


            .thumb_func
            call_1e8:
/*0x01e8*/      cmp r1, #0
/*0x01ea*/      ldr r1, [r0]
/*0x01ec*/      beq jump_1f4
/*0x01ee*/      orr r1, r1, #4
/*0x01f2*/      b jump_1f8
            jump_1f4:
/*0x01f4*/      bic r1, r1, #4
            jump_1f8:
/*0x01f8*/      str r1, [r0]
/*0x01fa*/      bx lr

            .thumb_func
            call_1fc:
/*0x01fc*/      cmp r1, #0
/*0x01fe*/      ldr r1, [r0]
/*0x0200*/      beq jump_208
/*0x0202*/      orr r1, r1, #1
/*0x0206*/      b jump_20c
            jump_208:
/*0x0208*/      bic r1, r1, #1
            jump_20c:
/*0x020c*/      str r1, [r0]
/*0x020e*/      bx lr

            .thumb_func
            call_210:
/*0x0210*/      lsls r0, r0, #3
/*0x0212*/      lsrs r3, r1, #3
/*0x0214*/      add.w r0, r0, r3, lsl #2
/*0x0218*/      ldr r3, [pc, #0x18] /* data_234 */
/*0x021a*/      push {r4, lr}
/*0x021c*/      add r0, r3
/*0x021e*/      lsls r1, r1, #0x1d
/*0x0220*/      ldr r3, [r0]
/*0x0222*/      lsrs r1, r1, #0x1b
/*0x0224*/      movs r4, #0xf
/*0x0226*/      lsls r4, r1
/*0x0228*/      bics r3, r4
/*0x022a*/      lsls r2, r1
/*0x022c*/      orrs r3, r2
/*0x022e*/      str r3, [r0]
/*0x0230*/      pop {r4, pc}

/*0x0232*/  .byte 0x00
/*0x0233*/  .byte 0x00

            data_234:
/*0x0234*/  .word 0x40022020


            .thumb_func
            call_238:
/*0x0238*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x023c*/      mov.w r5, #0x4000
/*0x0240*/      movs r4, #0
/*0x0242*/      lsls r0, r5, #2
/*0x0244*/      mov r2, r4
/*0x0246*/      mov r8, r0
/*0x0248*/      movs r3, #1
/*0x024a*/      mov r1, r5
/*0x024c*/      bl ckcu_clocks_enable
/*0x0250*/      ldr r6, [pc, #0x94] /* data_2e8 */
/*0x0252*/      movs r2, #0
/*0x0254*/      mov r1, r5
/*0x0256*/      mov r0, r6
/*0x0258*/      bl call_3c4
/*0x025c*/      lsls r7, r5, #1
/*0x025e*/      movs r2, #0
/*0x0260*/      mov r1, r7
/*0x0262*/      mov r0, r6
/*0x0264*/      bl call_3c4
/*0x0268*/      movs r2, #2
/*0x026a*/      mov r1, r5
/*0x026c*/      mov r0, r6
/*0x026e*/      bl function_444
/*0x0272*/      movs r2, #2
/*0x0274*/      mov r1, r7
/*0x0276*/      mov r0, r6
/*0x0278*/      bl function_444
/*0x027c*/      asrs r5, r5, #3
/*0x027e*/      movs r2, #0
/*0x0280*/      mov r1, r5
/*0x0282*/      mov r0, r6
/*0x0284*/      bl call_3c4
/*0x0288*/      movs r2, #2
/*0x028a*/      mov r1, r5
/*0x028c*/      mov r0, r6
/*0x028e*/      bl function_444
/*0x0292*/      movs r2, #1
/*0x0294*/      movs r1, #0xb
/*0x0296*/      movs r0, #0
/*0x0298*/      bl call_210
/*0x029c*/      movs r2, #1
/*0x029e*/      movs r1, #0xd
/*0x02a0*/      movs r0, #2
/*0x02a2*/      bl call_210
/*0x02a6*/      movs r2, #1
/*0x02a8*/      movs r1, #0xe
/*0x02aa*/      movs r0, #2
/*0x02ac*/      bl call_210
/*0x02b0*/      movs r2, #1
/*0x02b2*/      movs r1, #0xf
/*0x02b4*/      movs r0, #2
/*0x02b6*/      bl call_210
/*0x02ba*/      ldr r0, [pc, #0x30] /* data_2ec */
/*0x02bc*/      ldr r0, [r0, #4]
/*0x02be*/      lsls r0, r0, #0x15
/*0x02c0*/      bmi jump_2d6
/*0x02c2*/      movs r2, #1
/*0x02c4*/      movs r1, #0xe
/*0x02c6*/      mov r0, r2
/*0x02c8*/      bl call_210
/*0x02cc*/      movs r2, #1
/*0x02ce*/      movs r1, #0xf
/*0x02d0*/      mov r0, r2
/*0x02d2*/      bl call_210
            jump_2d6:
/*0x02d6*/      mov r1, r4
/*0x02d8*/      movs r3, #0
/*0x02da*/      mov r2, r4
/*0x02dc*/      mov r0, r8
/*0x02de*/      bl ckcu_clocks_enable
/*0x02e2*/      movs r0, #1
/*0x02e4*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_2e8:
/*0x02e8*/  .word 0x400b0000
            data_2ec:
/*0x02ec*/  .word 0x40088000


            .thumb_func
            ckcu_clocks_enable:
/*0x02f0*/      push {r4, r5, r6, r7, lr}
/*0x02f2*/      ldr r7, [pc, #0x1c] /* data_310 */
/*0x02f4*/      ldr r4, [r7, #0x24]
/*0x02f6*/      ldr r5, [r7, #0x2c]
/*0x02f8*/      ldr r6, [r7, #0x30]
/*0x02fa*/      bics r4, r0
/*0x02fc*/      bics r5, r1
/*0x02fe*/      bics r6, r2
/*0x0300*/      cbz r3, jump_308
/*0x0302*/      orrs r4, r0
/*0x0304*/      orrs r5, r1
/*0x0306*/      orrs r6, r2
            jump_308:
/*0x0308*/      str r4, [r7, #0x24]
/*0x030a*/      str r5, [r7, #0x2c]
/*0x030c*/      str r6, [r7, #0x30]
/*0x030e*/      pop {r4, r5, r6, r7, pc}

            data_310:
/*0x0310*/  .word 0x40088000


            .thumb_func
            call_314:
/*0x0314*/      ldr r1, [pc, #0xc] /* data_324 */
/*0x0316*/      ldr r2, [r1]
/*0x0318*/      bic r2, r2, #0xc00000
/*0x031c*/      orr.w r0, r2, r0, lsl #22
/*0x0320*/      str r0, [r1]
/*0x0322*/      bx lr

            data_324:
/*0x0324*/  .word 0x40088000


            .thumb_func
            call_328:
/*0x0328*/      ldr r1, [pc, #8] /* data_334 */
/*0x032a*/      str r0, [r1]
/*0x032c*/      movs r0, #8
/*0x032e*/      str r0, [r1, #0xc]
/*0x0330*/      b.w jump_338

            data_334:
/*0x0334*/  .word 0x40080000

            jump_338:
/*0x0338*/      ldr r1, [pc, #0x44] /* data_380 */
/*0x033a*/      ldr r0, [pc, #0x40] /* data_37c */
/*0x033c*/      ldr r2, [r1, #0x14]
/*0x033e*/      orr r2, r2, #2
/*0x0342*/      str r2, [r1, #0x14]
/*0x0344*/      movs r2, #0x14
/*0x0346*/      str r2, [r1, #0x10]
/*0x0348*/      b jump_354
            jump_34a:
/*0x034a*/      ldr r2, [r1, #0x10]
/*0x034c*/      ubfx r2, r2, #2, #2
/*0x0350*/      cmp r2, #3
/*0x0352*/      beq jump_358
            jump_354:
/*0x0354*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0356*/      bhs jump_34a
            jump_358:
/*0x0358*/      ldr r2, [r1, #0x18]
/*0x035a*/      ldr r3, [r1, #0x18]
/*0x035c*/      bic r3, r3, #2
/*0x0360*/      str r3, [r1, #0x18]
/*0x0362*/      lsls r1, r2, #0xe
/*0x0364*/      bpl jump_36a
/*0x0366*/      movs r0, #2
/*0x0368*/      bx lr
            jump_36a:
/*0x036a*/      lsls r1, r2, #0x1e
/*0x036c*/      bpl jump_372
/*0x036e*/      movs r0, #1
/*0x0370*/      bx lr
            jump_372:
/*0x0372*/      cbz r0, jump_378
/*0x0374*/      movs r0, #0
/*0x0376*/      bx lr
            jump_378:
/*0x0378*/      movs r0, #3
/*0x037a*/      bx lr

            data_37c:
/*0x037c*/  .word 0x000fffff
            data_380:
/*0x0380*/  .word 0x40080000

            jump_384:
/*0x0384*/      and r2, r0, #7
/*0x0388*/      push {r4, lr}
/*0x038a*/      ldr r3, [pc, #0x24] /* data_3b0 */
/*0x038c*/      lsrs r0, r0, #3
/*0x038e*/      add.w r4, r3, r2, lsl #6
/*0x0392*/      lsls r0, r0, #1
/*0x0394*/      movs r2, #3
/*0x0396*/      b jump_3a8
            jump_398:
/*0x0398*/      strh.w r1, [r4, r0, lsl #1]
/*0x039c*/      adds r0, #0x10
/*0x039e*/      uxtb r0, r0
/*0x03a0*/      cmp r0, #0x1f
/*0x03a2*/      bls jump_3a8
/*0x03a4*/      subs r0, #0x1f
/*0x03a6*/      uxtb r0, r0
            jump_3a8:
/*0x03a8*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x03aa*/      uxtb r2, r2
/*0x03ac*/      bhs jump_398
/*0x03ae*/      pop {r4, pc}

            data_3b0:
/*0x03b0*/  .word 0x200000da


            .thumb_func
            call_3b4:
/*0x03b4*/      cmp r2, #0
/*0x03b6*/      ldr r2, [r0]
/*0x03b8*/      beq jump_3be
/*0x03ba*/      orrs r2, r1
/*0x03bc*/      b jump_3c0
            jump_3be:
/*0x03be*/      bics r2, r1
            jump_3c0:
/*0x03c0*/      str r2, [r0]
/*0x03c2*/      bx lr

            .thumb_func
            call_3c4:
/*0x03c4*/      cmp r2, #0
/*0x03c6*/      ldr r2, [r0, #4]
/*0x03c8*/      beq jump_3ce
/*0x03ca*/      orrs r2, r1
/*0x03cc*/      b jump_3d0
            jump_3ce:
/*0x03ce*/      bics r2, r1
            jump_3d0:
/*0x03d0*/      str r2, [r0, #4]
/*0x03d2*/      bx lr

            .thumb_func
            call_3d4:
/*0x03d4*/      cmp r2, #0
/*0x03d6*/      ldr r2, [r0, #0x10]
/*0x03d8*/      beq jump_3de
/*0x03da*/      orrs r2, r1
/*0x03dc*/      b jump_3e0
            jump_3de:
/*0x03de*/      bics r2, r1
            jump_3e0:
/*0x03e0*/      str r2, [r0, #0x10]
/*0x03e2*/      bx lr

            .thumb_func
            call_3e4:
/*0x03e4*/      cbz r2, jump_3ea
/*0x03e6*/      str r1, [r0, #0x24]
/*0x03e8*/      bx lr
            jump_3ea:
/*0x03ea*/      str r1, [r0, #0x28]
/*0x03ec*/      bx lr

            .thumb_func
            call_3ee:
/*0x03ee*/      lsls r0, r0, #0xe
/*0x03f0*/      sxth r0, r0
/*0x03f2*/      lsrs r1, r0, #0x10
/*0x03f4*/      movs r0, #8
/*0x03f6*/      b.w jump_384

/*0x03fa*/  .byte 0x70
/*0x03fb*/  .byte 0x47
/*0x03fc*/  .byte 0x04
/*0x03fd*/  .byte 0x03
/*0x03fe*/  .byte 0x09
/*0x03ff*/  .byte 0x04
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
/*0x040a*/  .byte 0x75
/*0x040b*/  .byte 0x11
/*0x040c*/  .byte 0x40
/*0x040d*/  .byte 0x50
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
/*0x042a*/  .byte 0x37
/*0x042b*/  .byte 0x35
/*0x042c*/  .byte 0x00
/*0x042d*/  .byte 0x00
/*0x042e*/  .byte 0x00
/*0x042f*/  .byte 0x00
/*0x0430*/  .byte 0xff
/*0x0431*/  .byte 0xff
/*0x0432*/  .byte 0xff
/*0x0433*/  .byte 0xff
/*0x0434*/  .byte 0x00
/*0x0435*/  .byte 0x00
/*0x0436*/  .byte 0x00
/*0x0437*/  .byte 0x00
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
            function_444:
/*0x0444*/      cbz r2, jump_458
/*0x0446*/      cmp r2, #1
/*0x0448*/      beq jump_45e
/*0x044a*/      ldr r2, [r0, #8]
/*0x044c*/      bics r2, r1
            jump_44e:
/*0x044e*/      str r2, [r0, #8]
/*0x0450*/      ldr r2, [r0, #0xc]
/*0x0452*/      bics r2, r1
/*0x0454*/      str r2, [r0, #0xc]
/*0x0456*/      bx lr
            jump_458:
/*0x0458*/      ldr r2, [r0, #8]
/*0x045a*/      orrs r2, r1
/*0x045c*/      b jump_44e
            jump_45e:
/*0x045e*/      ldr r2, [r0, #0xc]
/*0x0460*/      orrs r2, r1
/*0x0462*/      str r2, [r0, #0xc]
/*0x0464*/      ldr r2, [r0, #8]
/*0x0466*/      bics r2, r1
/*0x0468*/      str r2, [r0, #8]
/*0x046a*/      bx lr

            .thumb_func
            call_46c:
/*0x046c*/      cmp r1, #0
/*0x046e*/      ldr r1, [r0, #0x10]
/*0x0470*/      beq jump_478
/*0x0472*/      orr r1, r1, #1
/*0x0476*/      b jump_47c
            jump_478:
/*0x0478*/      bic r1, r1, #1
            jump_47c:
/*0x047c*/      str r1, [r0, #0x10]
/*0x047e*/      bx lr

            .thumb_func
            call_480:
/*0x0480*/      push {r4, r5, r6, r7, lr}
/*0x0482*/      ldrb r3, [r1]
/*0x0484*/      ldr r7, [r0, #0x50]
/*0x0486*/      add.w r4, r0, r3, lsl #2
/*0x048a*/      add.w r2, r4, #0x40
/*0x048e*/      add.w r5, r4, #0x90
/*0x0492*/      add.w r6, r4, #0xa0
/*0x0496*/      lsls r3, r3, #1
/*0x0498*/      movs r4, #1
/*0x049a*/      lsls r4, r3
/*0x049c*/      mvns r4, r4
/*0x049e*/      ands r7, r4
/*0x04a0*/      str r7, [r0, #0x50]
/*0x04a2*/      ldr r7, [r0, #0x54]
/*0x04a4*/      ands r7, r4
/*0x04a6*/      str r7, [r0, #0x54]
/*0x04a8*/      ldr r4, [r0, #0x54]
/*0x04aa*/      ldrb r7, [r1, #5]
/*0x04ac*/      lsls r7, r3
/*0x04ae*/      orrs r4, r7
/*0x04b0*/      str r4, [r0, #0x54]
/*0x04b2*/      ldr r4, [r2]
/*0x04b4*/      movw r7, #0x107
/*0x04b8*/      bics r4, r7
/*0x04ba*/      str r4, [r2]
/*0x04bc*/      ldr r4, [r2]
/*0x04be*/      ldrh r7, [r1, #2]
/*0x04c0*/      orrs r4, r7
/*0x04c2*/      str r4, [r2]
/*0x04c4*/      ldrh r2, [r1, #6]
/*0x04c6*/      str r2, [r5]
/*0x04c8*/      ldrh r2, [r1, #8]
/*0x04ca*/      str r2, [r6]
/*0x04cc*/      ldr r2, [r0, #0x50]
/*0x04ce*/      ldrb r1, [r1, #4]
/*0x04d0*/      lsls r1, r3
/*0x04d2*/      orrs r2, r1
/*0x04d4*/      str r2, [r0, #0x50]
/*0x04d6*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_4d8:
/*0x04d8*/      ldrh r2, [r1]
/*0x04da*/      str.w r2, [r0, #0x88]
/*0x04de*/      ldrh r2, [r1, #2]
/*0x04e0*/      str.w r2, [r0, #0x84]
/*0x04e4*/      ldr r2, [r0]
/*0x04e6*/      bic r2, r2, #0x30000
/*0x04ea*/      str r2, [r0]
/*0x04ec*/      ldr r2, [r0]
/*0x04ee*/      bic r2, r2, #0x1000000
/*0x04f2*/      str r2, [r0]
/*0x04f4*/      ldr r2, [r0]
/*0x04f6*/      ldr r3, [r1, #4]
/*0x04f8*/      orrs r2, r3
/*0x04fa*/      str r2, [r0]
/*0x04fc*/      ldrh r1, [r1, #8]
/*0x04fe*/      str r1, [r0, #0x78]
/*0x0500*/      bx lr

/*0x0502*/  .byte 0x00
/*0x0503*/  .byte 0x00


            .thumb_func
            call_504:
/*0x0504*/      ldr r2, [pc, #0x70] /* data_578 */
/*0x0506*/      push {r4, lr}
/*0x0508*/      ldrb r2, [r2, r0]
/*0x050a*/      cmp r2, #0xe8
/*0x050c*/      beq jump_572
/*0x050e*/      sub.w r0, r2, #0xe0
/*0x0512*/      movs r4, #1
/*0x0514*/      ldr r3, [pc, #0x64] /* data_57c */
/*0x0516*/      cmp r0, #7
/*0x0518*/      bhi jump_534
/*0x051a*/      and r0, r2, #7
/*0x051e*/      mov r2, r3
/*0x0520*/      lsl.w r0, r4, r0
/*0x0524*/      ldrb r2, [r2]
/*0x0526*/      uxtb r0, r0
/*0x0528*/      cbz r1, jump_52e
/*0x052a*/      orrs r2, r0
/*0x052c*/      b jump_530
            jump_52e:
/*0x052e*/      bics r2, r0
            jump_530:
/*0x0530*/      strb r2, [r3]
/*0x0532*/      b jump_564
            jump_534:
/*0x0534*/      cmp r2, #0x91
/*0x0536*/      bhi jump_572
/*0x0538*/      mov.w r0, #0
/*0x053c*/      cbz r1, jump_556
            jump_53e:
/*0x053e*/      adds r1, r3, r0
/*0x0540*/      ldrb r1, [r1, #2]
/*0x0542*/      cbz r1, jump_550
/*0x0544*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0546*/      uxtb r0, r0
/*0x0548*/      cmp r0, #6
/*0x054a*/      blo jump_53e
/*0x054c*/      movs r0, #0
/*0x054e*/      pop {r4, pc}
            jump_550:
/*0x0550*/      add r0, r3
/*0x0552*/      strb r2, [r0, #2]
/*0x0554*/      b jump_564
            jump_556:
/*0x0556*/      adds r1, r3, r0
/*0x0558*/      ldrb r1, [r1, #2]
/*0x055a*/      cmp r1, r2
/*0x055c*/      bne jump_56a
/*0x055e*/      add r0, r3
/*0x0560*/      movs r1, #0
/*0x0562*/      strb r1, [r0, #2]
            jump_564:
/*0x0564*/      ldr r0, [pc, #0x18] /* data_580 */
/*0x0566*/      strb r4, [r0]
/*0x0568*/      b jump_572
            jump_56a:
/*0x056a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x056c*/      uxtb r0, r0
/*0x056e*/      cmp r0, #6
/*0x0570*/      blo jump_556
            jump_572:
/*0x0572*/      movs r0, #1
/*0x0574*/      pop {r4, pc}

/*0x0576*/  .byte 0x00
/*0x0577*/  .byte 0x00

            data_578:
/*0x0578*/  .word 0x00001fdc /* possible pointer */
            data_57c:
/*0x057c*/  .word 0x20000038
            data_580:
/*0x0580*/  .word 0x2000001c


            .thumb_func
            call_584:
/*0x0584*/      push {r4, lr}
/*0x0586*/      ldr r4, [pc, #0x60] /* data_5e8 */
/*0x0588*/      cbz r0, jump_5b8
/*0x058a*/      movs r1, #0
/*0x058c*/      mov r0, r4
/*0x058e*/      bl call_1fc
/*0x0592*/      movs r1, #0
/*0x0594*/      mov r0, r4
/*0x0596*/      bl call_1e8
/*0x059a*/      mov r0, r4
/*0x059c*/      bl bftm_clear
/*0x05a0*/      movs r0, #0x29
/*0x05a2*/      bl call_690
/*0x05a6*/      bl call_708
/*0x05aa*/      movs r0, #1
/*0x05ac*/      bl call_cac
/*0x05b0*/      pop.w {r4, lr}
/*0x05b4*/      b.w jump_dd8
            jump_5b8:
/*0x05b8*/      movs r0, #0
/*0x05ba*/      bl call_cac
/*0x05be*/      movs r1, #0
/*0x05c0*/      mov r0, r4
/*0x05c2*/      bl bftm_set_counter
/*0x05c6*/      mov r0, r4
/*0x05c8*/      bl bftm_clear
/*0x05cc*/      movs r1, #1
/*0x05ce*/      mov r0, r4
/*0x05d0*/      bl call_1e8
/*0x05d4*/      movs r1, #1
/*0x05d6*/      mov r0, r4
/*0x05d8*/      bl call_1fc
/*0x05dc*/      ldr r1, [pc, #0xc] /* data_5ec */
/*0x05de*/      mov.w r0, #0x200
/*0x05e2*/      str.w r0, [r1, #0x100]
/*0x05e6*/      pop {r4, pc}

            data_5e8:
/*0x05e8*/  .word 0x40076000
            data_5ec:
/*0x05ec*/  .word 0xe000e004


            .thumb_func
            call_5f0:
/*0x05f0*/      push {r4, lr}
/*0x05f2*/      movs r0, #0
/*0x05f4*/      mov.w r2, #0x10000
/*0x05f8*/      movs r3, #1
/*0x05fa*/      mov r1, r0
/*0x05fc*/      bl ckcu_clocks_enable
/*0x0600*/      pop.w {r4, lr}
/*0x0604*/      movw r1, #0x8c9f
/*0x0608*/      ldr r0, [pc, #4] /* data_610 */
/*0x060a*/      b.w call_38

/*0x060e*/  .byte 0x00
/*0x060f*/  .byte 0x00

            data_610:
/*0x0610*/  .word 0x40076000


            .thumb_func
            call_614:
/*0x0614*/      ldr r1, [pc, #0x70] /* data_688 */
/*0x0616*/      push {r4, lr}
/*0x0618*/      ldr r0, [r1]
/*0x061a*/      movw r2, #0xf8ff
/*0x061e*/      ands r0, r2
/*0x0620*/      ldr r2, [pc, #0x68] /* data_68c */
/*0x0622*/      orr r0, r0, #0x300
/*0x0626*/      orrs r0, r2
/*0x0628*/      str r0, [r1]
/*0x062a*/      movs r2, #0
/*0x062c*/      mov r1, r2
/*0x062e*/      movs r0, #3
/*0x0630*/      bl call_6a6
/*0x0634*/      mov r1, r0
/*0x0636*/      movs r0, #0x2b
/*0x0638*/      bl call_6d8
/*0x063c*/      movs r2, #0
/*0x063e*/      mov r1, r2
/*0x0640*/      movs r0, #3
/*0x0642*/      bl call_6a6
/*0x0646*/      mov r1, r0
/*0x0648*/      movs r0, #0x2c
/*0x064a*/      bl call_6d8
/*0x064e*/      movs r2, #0
/*0x0650*/      movs r1, #1
/*0x0652*/      movs r0, #3
/*0x0654*/      bl call_6a6
/*0x0658*/      mov r1, r0
/*0x065a*/      movs r0, #0x2a
/*0x065c*/      bl call_6d8
/*0x0660*/      movs r2, #0
/*0x0662*/      movs r1, #2
/*0x0664*/      movs r0, #3
/*0x0666*/      bl call_6a6
/*0x066a*/      mov r1, r0
/*0x066c*/      movs r0, #0x29
/*0x066e*/      bl call_6d8
/*0x0672*/      movs r2, #0
/*0x0674*/      movs r1, #2
/*0x0676*/      movs r0, #3
/*0x0678*/      bl call_6a6
/*0x067c*/      mov r1, r0
/*0x067e*/      pop.w {r4, lr}
/*0x0682*/      movs r0, #0x35
/*0x0684*/      b.w call_6d8

            data_688:
/*0x0688*/  .word 0xe000ed0c
            data_68c:
/*0x068c*/  .word 0x05fa0000


            .thumb_func
            call_690:
/*0x0690*/      and r2, r0, #0x1f
/*0x0694*/      movs r1, #1
/*0x0696*/      lsls r1, r2
/*0x0698*/      lsrs r0, r0, #5
/*0x069a*/      lsls r0, r0, #2
/*0x069c*/      add.w r0, r0, #-0x1fff2000
/*0x06a0*/      str.w r1, [r0, #0x180]
/*0x06a4*/      bx lr

            .thumb_func
            call_6a6:
/*0x06a6*/      push {r4, r5, lr}
/*0x06a8*/      and r3, r0, #7
/*0x06ac*/      rsb.w r4, r3, #7
/*0x06b0*/      cmp r4, #4
/*0x06b2*/      bls jump_6b6
/*0x06b4*/      movs r4, #4
            jump_6b6:
/*0x06b6*/      adds r0, r3, #4
/*0x06b8*/      cmp r0, #7
/*0x06ba*/      bhs jump_6c0
/*0x06bc*/      movs r3, #0
/*0x06be*/      b jump_6c2
            jump_6c0:
/*0x06c0*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_6c2:
/*0x06c2*/      movs r5, #1
/*0x06c4*/      lsl.w r0, r5, r4
/*0x06c8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x06ca*/      ands r0, r1
/*0x06cc*/      lsls r0, r3
/*0x06ce*/      lsls r5, r3
/*0x06d0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x06d2*/      ands r5, r2
/*0x06d4*/      orrs r0, r5
/*0x06d6*/      pop {r4, r5, pc}

            .thumb_func
            call_6d8:
/*0x06d8*/      lsls r1, r1, #0x1c
/*0x06da*/      lsrs r1, r1, #0x18
/*0x06dc*/      cmp r0, #0
/*0x06de*/      bge jump_6ee
/*0x06e0*/      and r0, r0, #0xf
/*0x06e4*/      add.w r0, r0, #-0x1fff2000
/*0x06e8*/      strb.w r1, [r0, #0xd14]
/*0x06ec*/      bx lr
            jump_6ee:
/*0x06ee*/      add.w r0, r0, #-0x1fff2000
/*0x06f2*/      strb.w r1, [r0, #0x400]
/*0x06f6*/      bx lr

            .thumb_func
            call_6f8:
/*0x06f8*/      mov.w r2, #0x200
/*0x06fc*/      movs r1, #0
/*0x06fe*/      lsls r0, r2, #9
/*0x0700*/      movs r3, #1
/*0x0702*/      b.w ckcu_clocks_enable

/*0x0706*/  .byte 0x00
/*0x0707*/  .byte 0x00


            .thumb_func
            call_708:
/*0x0708*/      push {r4, lr}
/*0x070a*/      movs r2, #0
/*0x070c*/      movs r1, #1
/*0x070e*/      ldr r0, [pc, #0x14] /* data_724 */
/*0x0710*/      bl function_444
/*0x0714*/      movs r2, #0
/*0x0716*/      pop.w {r4, lr}
/*0x071a*/      mov r1, r2
/*0x071c*/      movs r0, #2
/*0x071e*/      b.w call_210

/*0x0722*/  .byte 0x00
/*0x0723*/  .byte 0x00

            data_724:
/*0x0724*/  .word 0x400b4000


            .thumb_func
            call_728:
/*0x0728*/      push {r4, lr}
/*0x072a*/      movs r2, #2
/*0x072c*/      movs r1, #1
/*0x072e*/      ldr r0, [pc, #0x14] /* data_744 */
/*0x0730*/      bl function_444
/*0x0734*/      movs r2, #4
/*0x0736*/      movs r1, #0
/*0x0738*/      pop.w {r4, lr}
/*0x073c*/      movs r0, #2
/*0x073e*/      b.w call_210

/*0x0742*/  .byte 0x00
/*0x0743*/  .byte 0x00

            data_744:
/*0x0744*/  .word 0x400b4000


            .thumb_func
            call_748:
/*0x0748*/      push {r4, r5, r6, lr}
/*0x074a*/      ldr r1, [pc, #0x34] /* data_780 */
/*0x074c*/      ldr r4, [r1]
/*0x074e*/      ldr r5, [pc, #0x30] /* data_780 */
/*0x0750*/      adds r5, #0x48
/*0x0752*/      ldr r3, [r5]
/*0x0754*/      movs r2, #1
/*0x0756*/      str r2, [r1]
/*0x0758*/      movs r2, #0
/*0x075a*/      str r2, [r5]
/*0x075c*/      ldr r6, [pc, #0x24] /* data_784 */
/*0x075e*/      str.w r2, [r6, #0x9c]
/*0x0762*/      str.w r2, [r6, #0x8c]
/*0x0766*/      str r4, [r1]
/*0x0768*/      ldr r1, [pc, #0x1c] /* data_788 */
/*0x076a*/      ldr r2, [r1]
/*0x076c*/      orr r2, r2, #4
/*0x0770*/      str r2, [r1]
/*0x0772*/      cbz r0, jump_77a
/*0x0774*/      wfi 
            jump_776:
/*0x0776*/      str r3, [r5]
/*0x0778*/      pop {r4, r5, r6, pc}
            jump_77a:
/*0x077a*/      wfe 
/*0x077c*/      b jump_776

/*0x077e*/  .byte 0x00
/*0x077f*/  .byte 0x00

            data_780:
/*0x0780*/  .word 0x43100618
            data_784:
/*0x0784*/  .word 0x42d42000
            data_788:
/*0x0788*/  .word 0xe000ed10

            jump_78c:
/*0x078c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x0790*/      ldr r4, [pc, #0x38] /* data_7cc */
/*0x0792*/      ldr r7, [r4]
/*0x0794*/      ldr r5, [pc, #0x34] /* data_7cc */
/*0x0796*/      adds r5, #0x48
/*0x0798*/      ldr r6, [r5]
/*0x079a*/      mov.w sb, #1
/*0x079e*/      str.w sb, [r4]
/*0x07a2*/      mov.w r8, #0
/*0x07a6*/      str.w r8, [r5]
/*0x07aa*/      bl call_b10
/*0x07ae*/      ldr r0, [pc, #0x20] /* data_7d0 */
/*0x07b0*/      str.w r8, [r0, #0x9c]
/*0x07b4*/      str.w sb, [r0, #0x8c]
/*0x07b8*/      str r7, [r4]
/*0x07ba*/      ldr r0, [pc, #0x18] /* data_7d4 */
/*0x07bc*/      ldr r1, [r0]
/*0x07be*/      orr r1, r1, #4
/*0x07c2*/      str r1, [r0]
/*0x07c4*/      wfe 
/*0x07c6*/      str r6, [r5]
/*0x07c8*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_7cc:
/*0x07cc*/  .word 0x43100618
            data_7d0:
/*0x07d0*/  .word 0x42d42000
            data_7d4:
/*0x07d4*/  .word 0xe000ed10


            .thumb_func
            call_7d8:
/*0x07d8*/      ldr r1, [pc, #0x10] /* data_7ec */
/*0x07da*/      ldr r2, [r1]
/*0x07dc*/      bic r2, r2, #4
/*0x07e0*/      str r2, [r1]
/*0x07e2*/      cbz r0, jump_7e8
/*0x07e4*/      wfi 
/*0x07e6*/      bx lr
            jump_7e8:
/*0x07e8*/      wfe 
/*0x07ea*/      bx lr

            data_7ec:
/*0x07ec*/  .word 0xe000ed10


            .thumb_func
            call_7f0:
/*0x07f0*/      push {r4, r5, r6, r7, lr}
/*0x07f2*/      sub sp, #0x100
/*0x07f4*/      mov r4, r0
/*0x07f6*/      mov r5, r1
/*0x07f8*/      mov r0, sp
/*0x07fa*/      bl generate
/*0x07fe*/      movs r2, #0
/*0x0800*/      mov r3, r2
/*0x0802*/      mov r1, sp
/*0x0804*/      b jump_824
            jump_806:
/*0x0806*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x0808*/      uxtb r2, r2
/*0x080a*/      ldrb r0, [r1, r2]
/*0x080c*/      add r3, r0
/*0x080e*/      uxtb r3, r3
/*0x0810*/      ldrb r6, [r1, r3]
/*0x0812*/      strb r6, [r1, r2]
/*0x0814*/      strb r0, [r1, r3]
/*0x0816*/      add r0, r6
/*0x0818*/      uxtb r0, r0
/*0x081a*/      ldrb r7, [r4]
/*0x081c*/      ldrb r0, [r1, r0]
/*0x081e*/      eors r7, r0
/*0x0820*/      strb r7, [r4], #1
            jump_824:
/*0x0824*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0826*/      bhs jump_806
/*0x0828*/      add sp, #0x100
/*0x082a*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_82c:
/*0x082c*/      push {r4, r5, r6, lr}
/*0x082e*/      lsrs r2, r2, #2
/*0x0830*/      movs r4, #4
/*0x0832*/      ldr r3, [pc, #0x18] /* data_84c */
/*0x0834*/      movs r5, #0x14
/*0x0836*/      b jump_844
            jump_838:
/*0x0838*/      str r4, [r3, #0xc]
/*0x083a*/      str r0, [r3]
/*0x083c*/      ldm r1!, {r6}
/*0x083e*/      str r6, [r3, #4]
/*0x0840*/      str r5, [r3, #0x10]
/*0x0842*/      .short 0x1d00 /* adds r0, r0, #4 */ 
            jump_844:
/*0x0844*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x0846*/      bhs jump_838
/*0x0848*/      pop {r4, r5, r6, pc}

/*0x084a*/  .byte 0x00
/*0x084b*/  .byte 0x00

            data_84c:
/*0x084c*/  .word 0x40080000


            .thumb_func
            handle_frame:
/*0x0850*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0854*/      ldr r5, [pc, #0x1c4] /* data_a1c */
/*0x0856*/      ldrb r0, [r5]
/*0x0858*/      cmp r0, #1
/*0x085a*/      bne jump_93e
/*0x085c*/      ldr r6, [pc, #0x1c0] /* data_a20 */
/*0x085e*/      movs r4, #0
/*0x0860*/      mov r0, r6
/*0x0862*/      ldrb r1, [r6]
/*0x0864*/      ldrb r0, [r0, #1]
/*0x0866*/      mov ip, r4
/*0x0868*/      cmp r1, #0x10
/*0x086a*/      beq jump_88c
/*0x086c*/      mov r2, r6
/*0x086e*/      mov.w lr, #0xcc00
/*0x0872*/      ldr r3, [r2, #4]
/*0x0874*/      mov.w r2, #0x3400
/*0x0878*/      add.w r7, r3, #0x3000
/*0x087c*/      cmp r1, #0x1d
/*0x087e*/      beq jump_910
/*0x0880*/      bgt jump_896
/*0x0882*/      cmp r1, #0x11
/*0x0884*/      beq jump_8a0
/*0x0886*/      cmp r1, #0x12
/*0x0888*/      bne jump_96c
/*0x088a*/      b jump_8a6
            jump_88c:
/*0x088c*/      cmp r0, #2
/*0x088e*/      bne jump_96c
/*0x0890*/      str.w ip, [r6, #4]
/*0x0894*/      b jump_9a2
            jump_896:
/*0x0896*/      cmp r1, #0x1e
/*0x0898*/      beq jump_98c
/*0x089a*/      cmp r1, #0x1f
/*0x089c*/      bne jump_96c
/*0x089e*/      b jump_9c4
            jump_8a0:
/*0x08a0*/      bl reset_builtin
/*0x08a4*/      b jump_9ac
            jump_8a6:
/*0x08a6*/      mov.w r3, #0x400
/*0x08aa*/      cmp r0, #0x20
/*0x08ac*/      blo jump_8cc
/*0x08ae*/      sub.w r1, r0, #0x1f
/*0x08b2*/      rsb r1, r1, r1, lsl #4
/*0x08b6*/      cmp.w r3, r1, lsl #2
/*0x08ba*/      blt jump_8cc
/*0x08bc*/      rsb r0, r0, r0, lsl #4
/*0x08c0*/      mov.w r1, #0x2880
/*0x08c4*/      add.w r0, r1, r0, lsl #2
/*0x08c8*/      movs r1, #0x3c
/*0x08ca*/      b jump_9a6
            jump_8cc:
/*0x08cc*/      cbz r0, jump_8d8
/*0x08ce*/      cmp r0, #1
/*0x08d0*/      beq jump_900
/*0x08d2*/      cmp r0, #2
/*0x08d4*/      bne jump_96c
/*0x08d6*/      b jump_908
            jump_8d8:
/*0x08d8*/      ldrb r2, [r3]
/*0x08da*/      mov r0, r3
/*0x08dc*/      cmp r2, #4
/*0x08de*/      beq jump_8fc
/*0x08e0*/      movs r2, #0x20
/*0x08e2*/      mov r1, r3
/*0x08e4*/      adds r0, r6, #4
/*0x08e6*/      bl memcpy
/*0x08ea*/      ldr r0, [pc, #0x138] /* data_a24 */
/*0x08ec*/      ldr.w r1, [r0, #0x180]
/*0x08f0*/      str r1, [r6, #0x24]
/*0x08f2*/      ldr.w r0, [r0, #0x18c]
/*0x08f6*/      movs r1, #0x28
/*0x08f8*/      str r0, [r6, #0x28]
/*0x08fa*/      b jump_9a4
            jump_8fc:
/*0x08fc*/      movs r1, #0x34
/*0x08fe*/      b jump_9a6
            jump_900:
/*0x0900*/      movs r1, #4
/*0x0902*/      mov.w r0, #0x3c00
/*0x0906*/      b jump_9a6
            jump_908:
/*0x0908*/      strb.w ip, [r6, #4]
/*0x090c*/      movs r1, #1
/*0x090e*/      b jump_9a4
            jump_910:
/*0x0910*/      lsls r1, r3, #0x1e
/*0x0912*/      bne jump_a08
/*0x0914*/      ldr r1, [r6, #8]
/*0x0916*/      cbz r1, jump_96c
/*0x0918*/      lsls r4, r1, #0x1e
/*0x091a*/      bne jump_a08
/*0x091c*/      add r3, r1
/*0x091e*/      cmp r3, lr
/*0x0920*/      bhi jump_a08
/*0x0922*/      str r7, [r6, #4]
/*0x0924*/      cbz r0, jump_930
/*0x0926*/      cmp r0, #1
/*0x0928*/      beq jump_970
/*0x092a*/      cmp r0, #2
/*0x092c*/      bne jump_a08
/*0x092e*/      b jump_970
            jump_930:
/*0x0930*/      adds r0, r7, r1
/*0x0932*/      str.w ip, [r6, #8]
/*0x0936*/      strd r7, r0, [r6, #0xc]
/*0x093a*/      mov r0, r7
/*0x093c*/      b jump_95a
            jump_93e:
/*0x093e*/      b jump_9c0
            jump_940:
/*0x0940*/      bl call_328
/*0x0944*/      cbnz r0, jump_960
/*0x0946*/      bl call_166c
/*0x094a*/      ldr r0, [r6, #8]
/*0x094c*/      add.w r0, r0, #0x400
/*0x0950*/      str r0, [r6, #8]
/*0x0952*/      ldr r0, [r6, #0xc]
/*0x0954*/      add.w r0, r0, #0x400
/*0x0958*/      str r0, [r6, #0xc]
            jump_95a:
/*0x095a*/      ldr r1, [r6, #0x10]
/*0x095c*/      cmp r0, r1
/*0x095e*/      blo jump_940
            jump_960:
/*0x0960*/      ldr r0, [r6, #4]
/*0x0962*/      movs r1, #8
/*0x0964*/      sub.w r0, r0, #0x3000
/*0x0968*/      str r0, [r6, #4]
/*0x096a*/      b jump_9a4
            jump_96c:
/*0x096c*/      b jump_a08

/*0x096e*/  .byte 0x0d
/*0x096f*/  .byte 0xe0

            jump_970:
/*0x0970*/      cmp r7, r2
/*0x0972*/      blo jump_a08
/*0x0974*/      cmp.w r1, #0x1000
/*0x0978*/      blo jump_a08
/*0x097a*/      cmp r0, #2
/*0x097c*/      beq jump_988
/*0x097e*/      movs r2, #0
            jump_980:
/*0x0980*/      mov r0, r7
/*0x0982*/      bl firmware_check
/*0x0986*/      b jump_9a0
            jump_988:
/*0x0988*/      movs r2, #1
/*0x098a*/      b jump_980
            jump_98c:
/*0x098c*/      cbz r0, jump_99c
/*0x098e*/      cmp r0, #1
/*0x0990*/      bne jump_a08
/*0x0992*/      cmp r3, lr
/*0x0994*/      bhs jump_a08
/*0x0996*/      lsls r0, r3, #0x1e
/*0x0998*/      bne jump_a08
/*0x099a*/      str r7, [r5, #4]
            jump_99c:
/*0x099c*/      ldr r0, [r5, #4]
/*0x099e*/      b jump_a02
            jump_9a0:
/*0x09a0*/      str r0, [r6, #4]
            jump_9a2:
/*0x09a2*/      movs r1, #4
            jump_9a4:
/*0x09a4*/      adds r0, r6, #4
            jump_9a6:
/*0x09a6*/      bl call_aac
/*0x09aa*/      movs r4, #1
            jump_9ac:
/*0x09ac*/      ldrb r0, [r5]
/*0x09ae*/      cmp r0, #1
/*0x09b0*/      bne jump_9c0
/*0x09b2*/      cbz r4, jump_a08
/*0x09b4*/      movs r1, #0x3c
/*0x09b6*/      adds r0, r6, #4
            jump_9b8:
/*0x09b8*/      bl mem_zero
/*0x09bc*/      movs r0, #2
/*0x09be*/      strb r0, [r5]
            jump_9c0:
/*0x09c0*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_9c4:
/*0x09c4*/      cbz r0, jump_a08
/*0x09c6*/      lsls r1, r0, #0x1e
/*0x09c8*/      bne jump_a08
/*0x09ca*/      cmp r0, #0x3c
/*0x09cc*/      bhi jump_a08
/*0x09ce*/      ldr r1, [r5, #4]
/*0x09d0*/      adds r3, r0, r1
/*0x09d2*/      cmp.w r3, #0xfc00
/*0x09d6*/      bhi jump_a08
/*0x09d8*/      cmp r1, r2
/*0x09da*/      bhs jump_9e2
/*0x09dc*/      cmp r3, r2
/*0x09de*/      bhi jump_a08
/*0x09e0*/      b jump_9ea
            jump_9e2:
/*0x09e2*/      mov r1, r0
/*0x09e4*/      adds r0, r6, #4
/*0x09e6*/      bl call_7f0
            jump_9ea:
/*0x09ea*/      ldrb r2, [r6, #1]
/*0x09ec*/      adds r1, r6, #4
/*0x09ee*/      ldr r0, [r5, #4]
/*0x09f0*/      bl call_82c
/*0x09f4*/      ldrb r0, [r6, #1]
/*0x09f6*/      ldr r1, [r5, #4]
/*0x09f8*/      add r0, r1
/*0x09fa*/      movw r1, #0x21e
/*0x09fe*/      str r0, [r5, #4]
/*0x0a00*/      strh r1, [r6]
            jump_a02:
/*0x0a02*/      sub.w r0, r0, #0x3000
/*0x0a06*/      b jump_9a0
            jump_a08:
/*0x0a08*/      ldr r0, [r6]
/*0x0a0a*/      str r0, [r6, #4]
/*0x0a0c*/      movw r0, #0xaaff
/*0x0a10*/      str r0, [r6]
/*0x0a12*/      ldr r0, [pc, #0xc] /* data_a20 */
/*0x0a14*/      movs r1, #0x38
/*0x0a16*/      adds r0, #8
/*0x0a18*/      b jump_9b8

/*0x0a1a*/  .byte 0x00
/*0x0a1b*/  .byte 0x00

            data_a1c:
/*0x0a1c*/  .word 0x20000004
            data_a20:
/*0x0a20*/  .word 0x20000084
            data_a24:
/*0x0a24*/  .word 0x40080000


            .thumb_func
            reset_builtin:
/*0x0a28*/      push {r4, lr}
/*0x0a2a*/      ldr r1, [pc, #0x6c] /* data_a98 */
/*0x0a2c*/      cbz r0, jump_a4a
/*0x0a2e*/      cmp r0, #1
/*0x0a30*/      beq jump_a4e
/*0x0a32*/      cmp r0, #2
/*0x0a34*/      bne jump_a96
/*0x0a36*/      movs r0, #0x35
/*0x0a38*/      bl call_690
/*0x0a3c*/      movs r0, #0
/*0x0a3e*/      bl call_12b8
/*0x0a42*/      pop.w {r4, lr}
/*0x0a46*/      b.w jump_78c
            jump_a4a:
/*0x0a4a*/      ldr r0, [pc, #0x50] /* data_a9c */
/*0x0a4c*/      b jump_a52
            jump_a4e:
/*0x0a4e*/      ldr r0, [pc, #0x4c] /* data_a9c */
/*0x0a50*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_a52:
/*0x0a52*/      str r0, [r1]
/*0x0a54*/      movs r1, #0
/*0x0a56*/      mov.w r0, #0x10000
/*0x0a5a*/      movs r3, #1
/*0x0a5c*/      mov r2, r1
/*0x0a5e*/      bl ckcu_clocks_enable
/*0x0a62*/      ldr r1, [pc, #0x3c] /* data_aa0 */
/*0x0a64*/      mov.w r0, #0x200
/*0x0a68*/      str r0, [r1, #0x24]
/*0x0a6a*/      movs r0, #0x35

            .thumb_func
            flash_read_packet:
/*0x0a6c*/      bl call_690
/*0x0a70*/      movs r0, #0
/*0x0a72*/      bl call_12b8
/*0x0a76*/      movw r0, #0x4e20
/*0x0a7a*/      bl call_102
/*0x0a7e*/      dsb sy
/*0x0a82*/      ldr r0, [pc, #0x20] /* data_aa4 */
/*0x0a84*/      ldr r1, [r0]
/*0x0a86*/      ldr r2, [pc, #0x20] /* data_aa8 */
/*0x0a88*/      and r1, r1, #0x700
/*0x0a8c*/      orrs r1, r2
/*0x0a8e*/      str r1, [r0]
/*0x0a90*/      dsb sy
            jump_a94:
/*0x0a94*/      b jump_a94
            jump_a96:
/*0x0a96*/      pop {r4, pc}

            data_a98:
/*0x0a98*/  .word 0x20003ffc
            data_a9c:
/*0x0a9c*/  .word 0x55aafaf5
            data_aa0:
/*0x0aa0*/  .word 0x400b0000
            data_aa4:
/*0x0aa4*/  .word 0xe000ed0c
            data_aa8:
/*0x0aa8*/  .word 0x05fa0004


            .thumb_func
            call_aac:
/*0x0aac*/      push {r4, r5, r6, lr}
/*0x0aae*/      mov r4, r1
/*0x0ab0*/      ldr r2, [pc, #0x24] /* data_ad8 */
/*0x0ab2*/      mov r1, r0
/*0x0ab4*/      movs r0, #2
/*0x0ab6*/      strb r0, [r2]
/*0x0ab8*/      ldr r0, [pc, #0x20] /* data_adc */
/*0x0aba*/      subs r5, r0, #4
/*0x0abc*/      cmp r1, r0
/*0x0abe*/      beq jump_ac8
/*0x0ac0*/      mov r2, r4
/*0x0ac2*/      adds r0, r5, #4
/*0x0ac4*/      bl memcpy
            jump_ac8:
/*0x0ac8*/      adds r0, r5, r4
/*0x0aca*/      rsb.w r1, r4, #0x3c
/*0x0ace*/      pop.w {r4, r5, r6, lr}
/*0x0ad2*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x0ad4*/      b.w mem_zero

            data_ad8:
/*0x0ad8*/  .word 0x20000004
            data_adc:
/*0x0adc*/  .word 0x20000088

            jump_ae0:
/*0x0ae0*/      push {r4, r5, r6, r7, lr}
/*0x0ae2*/      ldr r7, [pc, #0x28] /* data_b0c */
/*0x0ae4*/      ldr.w r4, [r7, #0x104]
/*0x0ae8*/      ldr.w r5, [r7, #0x108]
/*0x0aec*/      ldr.w r6, [r7, #0x10c]
/*0x0af0*/      bics r4, r0
/*0x0af2*/      bics r5, r1
/*0x0af4*/      bics r6, r2
/*0x0af6*/      cbz r3, jump_afe
/*0x0af8*/      orrs r4, r0
/*0x0afa*/      orrs r5, r1
/*0x0afc*/      orrs r6, r2
            jump_afe:
/*0x0afe*/      str.w r4, [r7, #0x104]
/*0x0b02*/      str.w r5, [r7, #0x108]
/*0x0b06*/      str.w r6, [r7, #0x10c]
/*0x0b0a*/      pop {r4, r5, r6, r7, pc}

            data_b0c:
/*0x0b0c*/  .word 0x40088000


            .thumb_func
            call_b10:
/*0x0b10*/      ldr r2, [pc, #0x1c] /* data_b30 */
/*0x0b12*/      movs r1, #0
/*0x0b14*/      mov.w r0, #0x1c20
/*0x0b18*/      str.w r1, [r2, #0x108]
            jump_b1c:
/*0x0b1c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0b1e*/      bhs jump_b1c
/*0x0b20*/      movs r0, #1
/*0x0b22*/      str.w r0, [r2, #0x108]
/*0x0b26*/      ldr r0, [pc, #0xc] /* data_b34 */
            jump_b28:
/*0x0b28*/      ldr r1, [r0, #8]
/*0x0b2a*/      lsls r1, r1, #0x1a
/*0x0b2c*/      bpl jump_b28
/*0x0b2e*/      bx lr

            data_b30:
/*0x0b30*/  .word 0x42d40000
            data_b34:
/*0x0b34*/  .word 0x40088000


            .thumb_func
            call_b38:
/*0x0b38*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0b3c*/      movs r7, #7
/*0x0b3e*/      ldr r5, [pc, #0x58] /* data_b98 */
/*0x0b40*/      b jump_b8e
            jump_b42:
/*0x0b42*/      ldr r1, [pc, #0x58] /* data_b9c */
/*0x0b44*/      add.w r0, r7, r7, lsl #1
/*0x0b48*/      add r0, r1
/*0x0b4a*/      ldrb r1, [r5, #-0x1]!
/*0x0b4e*/      ldrb r0, [r0, #2]
/*0x0b50*/      eors r0, r1
/*0x0b52*/      movs.w r8, r0
/*0x0b56*/      beq jump_b8e
/*0x0b58*/      movs r4, #0x80
/*0x0b5a*/      movs r6, #8
/*0x0b5c*/      b jump_b88
            jump_b5e:
/*0x0b5e*/      tst.w r8, r4
/*0x0b62*/      beq jump_b86
/*0x0b64*/      ldrb r0, [r5]
/*0x0b66*/      eors r0, r4
/*0x0b68*/      strb r0, [r5]
/*0x0b6a*/      tst r0, r4
/*0x0b6c*/      bne jump_b72
/*0x0b6e*/      movs r1, #1
/*0x0b70*/      b jump_b74
            jump_b72:
/*0x0b72*/      movs r1, #0
            jump_b74:
/*0x0b74*/      add.w r0, r6, r7, lsl #3
/*0x0b78*/      uxtb r0, r0
/*0x0b7a*/      bl call_504
/*0x0b7e*/      cbnz r0, jump_b86
/*0x0b80*/      ldrb r0, [r5]
/*0x0b82*/      eors r0, r4
/*0x0b84*/      strb r0, [r5]
            jump_b86:
/*0x0b86*/      lsrs r4, r4, #1
            jump_b88:
/*0x0b88*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x0b8a*/      uxtb r6, r6
/*0x0b8c*/      bhs jump_b5e
            jump_b8e:
/*0x0b8e*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x0b90*/      uxtb r7, r7
/*0x0b92*/      bhs jump_b42
/*0x0b94*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_b98:
/*0x0b98*/  .word 0x20000014
            data_b9c:
/*0x0b9c*/  .word 0x200000c4


            .thumb_func
            call_ba0:
/*0x0ba0*/      push {r4, r5, r6, lr}
/*0x0ba2*/      movs r4, #2
/*0x0ba4*/      ldr r5, [pc, #0x34] /* data_bdc */
/*0x0ba6*/      mov.w r6, #0x1f4
            jump_baa:
/*0x0baa*/      bl call_1790
/*0x0bae*/      movs r1, #7
/*0x0bb0*/      b jump_bba
            jump_bb2:
/*0x0bb2*/      add.w r0, r1, r1, lsl #1
/*0x0bb6*/      ldrb r0, [r5, r0]
/*0x0bb8*/      cbnz r0, jump_bc0
            jump_bba:
/*0x0bba*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0bbc*/      uxtb r1, r1
/*0x0bbe*/      bhs jump_bb2
            jump_bc0:
/*0x0bc0*/      cmp r1, #0xff
/*0x0bc2*/      beq jump_bca
/*0x0bc4*/      cmp r4, #0
/*0x0bc6*/      bne jump_baa
            jump_bc8:
/*0x0bc8*/      pop {r4, r5, r6, pc}
            jump_bca:
/*0x0bca*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0bcc*/      ands r4, r4, #0xff
/*0x0bd0*/      beq jump_bc8
/*0x0bd2*/      mov r0, r6
/*0x0bd4*/      bl call_102
/*0x0bd8*/      b jump_baa

/*0x0bda*/  .byte 0x00
/*0x0bdb*/  .byte 0x00

            data_bdc:
/*0x0bdc*/  .word 0x200000c4

            jump_be0:
/*0x0be0*/      ldr r1, [pc, #0x10] /* data_bf4 */
/*0x0be2*/      ldrb r0, [r1]
/*0x0be4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0be6*/      strb r0, [r1]
/*0x0be8*/      lsls r0, r0, #0x1e
/*0x0bea*/      bne jump_bf0
/*0x0bec*/      b.w call_1790
            jump_bf0:
/*0x0bf0*/      bx lr

/*0x0bf2*/  .byte 0x00
/*0x0bf3*/  .byte 0x00

            data_bf4:
/*0x0bf4*/  .word 0x2000000c


            .thumb_func
            call_bf8:
/*0x0bf8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0bfc*/      movs r6, #0
/*0x0bfe*/      mov r1, r6
/*0x0c00*/      mov.w r0, #0xf0000
/*0x0c04*/      movs r3, #1
/*0x0c06*/      mov r2, r6
/*0x0c08*/      bl ckcu_clocks_enable
/*0x0c0c*/      movs r4, #8
/*0x0c0e*/      b jump_c40
            jump_c10:
/*0x0c10*/      ldr r0, [pc, #0x8c] /* data_ca0 */
/*0x0c12*/      movs r2, #0
/*0x0c14*/      add.w r1, r0, r4, lsl #3
/*0x0c18*/      ldrh r5, [r1, #4]
/*0x0c1a*/      ldr r0, [r1]
/*0x0c1c*/      uxth r1, r5
/*0x0c1e*/      mov r7, r0
/*0x0c20*/      bl function_444
/*0x0c24*/      uxth r1, r5
/*0x0c26*/      mov r0, r7
/*0x0c28*/      movs r2, #1
/*0x0c2a*/      bl call_3c4
/*0x0c2e*/      ldr r0, [pc, #0x70] /* data_ca0 */
/*0x0c30*/      adds r0, #0x40
/*0x0c32*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x0c36*/      add.w r0, r0, r4, lsl #1
/*0x0c3a*/      ldrb r0, [r0, #1]
/*0x0c3c*/      bl call_ac
            jump_c40:
/*0x0c40*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0c42*/      uxtb r4, r4
/*0x0c44*/      bhs jump_c10
/*0x0c46*/      movs r4, #7
/*0x0c48*/      b jump_c72
            jump_c4a:
/*0x0c4a*/      ldr r0, [pc, #0x54] /* data_ca0 */
/*0x0c4c*/      adds r0, #0x50
/*0x0c4e*/      add.w r1, r0, r4, lsl #3
/*0x0c52*/      ldrh r5, [r1, #4]
/*0x0c54*/      ldr r7, [r1]
/*0x0c56*/      uxth r1, r5
/*0x0c58*/      mov r0, r7
/*0x0c5a*/      bl call_e0
/*0x0c5e*/      uxth r1, r5
/*0x0c60*/      mov r0, r7
/*0x0c62*/      movs r2, #0
/*0x0c64*/      bl call_3d4
/*0x0c68*/      uxth r1, r5
/*0x0c6a*/      mov r0, r7
/*0x0c6c*/      movs r2, #1
/*0x0c6e*/      bl call_3b4
            jump_c72:
/*0x0c72*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0c74*/      uxtb r4, r4
/*0x0c76*/      bhs jump_c4a
/*0x0c78*/      movs r2, #0xff
/*0x0c7a*/      movs r1, #7
/*0x0c7c*/      ldr r0, [pc, #0x24] /* data_ca4 */
/*0x0c7e*/      bl mem_set
/*0x0c82*/      movs r1, #7
/*0x0c84*/      ldr r0, [pc, #0x20] /* data_ca8 */
/*0x0c86*/      movs r2, #0xff
/*0x0c88*/      b jump_c96
            jump_c8a:
/*0x0c8a*/      strb r6, [r0], #1
/*0x0c8e*/      strb r2, [r0], #1
/*0x0c92*/      strb r2, [r0], #1
            jump_c96:
/*0x0c96*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0c98*/      uxtb r1, r1
/*0x0c9a*/      bhs jump_c8a
/*0x0c9c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_ca0:
/*0x0ca0*/  .word 0x00002014 /* possible pointer */
            data_ca4:
/*0x0ca4*/  .word 0x2000000d
            data_ca8:
/*0x0ca8*/  .word 0x200000c4


            .thumb_func
            call_cac:
/*0x0cac*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0cb0*/      movs r4, #7
/*0x0cb2*/      cbz r0, jump_cba
/*0x0cb4*/      movs r7, #0
            jump_cb6:
/*0x0cb6*/      ldr r5, [pc, #0x30] /* data_ce8 */
/*0x0cb8*/      b jump_cde
            jump_cba:
/*0x0cba*/      movs r7, #1
/*0x0cbc*/      b jump_cb6
            jump_cbe:
/*0x0cbe*/      add.w r6, r5, r4, lsl #3
/*0x0cc2*/      mov r2, r7
/*0x0cc4*/      ldrh r0, [r6, #4]
/*0x0cc6*/      uxth r1, r0
/*0x0cc8*/      ldr.w r0, [r5, r4, lsl #3]
/*0x0ccc*/      bl call_3e4
/*0x0cd0*/      ldrh r0, [r6, #4]
/*0x0cd2*/      movs r2, #1
/*0x0cd4*/      uxth r1, r0
/*0x0cd6*/      ldr.w r0, [r5, r4, lsl #3]
/*0x0cda*/      bl call_3b4
            jump_cde:
/*0x0cde*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0ce0*/      uxtb r4, r4
/*0x0ce2*/      bhs jump_cbe
/*0x0ce4*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_ce8:
/*0x0ce8*/  .word 0x00002064 /* possible pointer */


            .thumb_func
            call_cec:
/*0x0cec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0cf0*/      movs r1, #0
/*0x0cf2*/      mov.w r2, #0x20000
/*0x0cf6*/      mov.w r0, #0x70000
/*0x0cfa*/      movs r3, #1
/*0x0cfc*/      bl ckcu_clocks_enable
/*0x0d00*/      movw r1, #0xea60
/*0x0d04*/      ldr r0, [pc, #0xc0] /* data_dc8 */
/*0x0d06*/      bl call_38
/*0x0d0a*/      ldr r4, [pc, #0xc0] /* data_dcc */
/*0x0d0c*/      movs r1, #2
/*0x0d0e*/      mov r0, r4
/*0x0d10*/      bl call_e0
/*0x0d14*/      movs r2, #0
/*0x0d16*/      movs r1, #2
/*0x0d18*/      mov r0, r4
/*0x0d1a*/      bl call_3d4
/*0x0d1e*/      movs r2, #1
/*0x0d20*/      movs r1, #2
/*0x0d22*/      mov r0, r4
/*0x0d24*/      bl call_3b4
/*0x0d28*/      ldr r6, [pc, #0xa4] /* data_dd0 */
/*0x0d2a*/      asrs r5, r4, #0x16
/*0x0d2c*/      mov r1, r5
/*0x0d2e*/      mov r0, r6
/*0x0d30*/      bl call_e0
/*0x0d34*/      lsls r7, r5, #6
/*0x0d36*/      mov r1, r7
/*0x0d38*/      mov r0, r6
/*0x0d3a*/      bl call_e0
/*0x0d3e*/      mov.w r8, #0x8000
/*0x0d42*/      mov r1, r8
/*0x0d44*/      mov r0, r6
/*0x0d46*/      bl call_e0
/*0x0d4a*/      movs r2, #0
/*0x0d4c*/      mov r1, r5
/*0x0d4e*/      mov r0, r6
/*0x0d50*/      bl call_3d4
/*0x0d54*/      movs r2, #0
/*0x0d56*/      mov r1, r7
/*0x0d58*/      mov r0, r6
/*0x0d5a*/      bl call_3d4
/*0x0d5e*/      movs r2, #0
/*0x0d60*/      mov r1, r8
/*0x0d62*/      mov r0, r6
/*0x0d64*/      bl call_3d4
/*0x0d68*/      movs r2, #1
/*0x0d6a*/      mov r1, r5
/*0x0d6c*/      mov r0, r6
/*0x0d6e*/      bl call_3b4
/*0x0d72*/      movs r2, #1
/*0x0d74*/      mov r1, r7
/*0x0d76*/      mov r0, r6
/*0x0d78*/      bl call_3b4
/*0x0d7c*/      movs r2, #1
/*0x0d7e*/      mov r1, r8
/*0x0d80*/      mov r0, r6
/*0x0d82*/      bl call_3b4
/*0x0d86*/      movs r2, #1
/*0x0d88*/      movs r1, #8
/*0x0d8a*/      mov r0, r4
/*0x0d8c*/      bl call_3c4
/*0x0d90*/      ldr r4, [pc, #0x40] /* data_dd4 */
/*0x0d92*/      movs r5, #4
/*0x0d94*/      b jump_dba
            jump_d96:
/*0x0d96*/      ldrh r0, [r4, #4]
/*0x0d98*/      uxth r1, r0
/*0x0d9a*/      ldr r0, [r4]
/*0x0d9c*/      bl call_e0
/*0x0da0*/      ldrh r0, [r4, #4]
/*0x0da2*/      movs r2, #0
/*0x0da4*/      uxth r1, r0
/*0x0da6*/      ldr r0, [r4]
/*0x0da8*/      bl call_3d4
/*0x0dac*/      ldrh r0, [r4, #4]
/*0x0dae*/      movs r2, #1
/*0x0db0*/      uxth r1, r0
/*0x0db2*/      ldr r0, [r4]
/*0x0db4*/      bl call_3b4
/*0x0db8*/      adds r4, #8
            jump_dba:
/*0x0dba*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x0dbc*/      uxtb r5, r5
/*0x0dbe*/      bhs jump_d96
/*0x0dc0*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0dc4*/      b.w jump_1848

            data_dc8:
/*0x0dc8*/  .word 0x40077000
            data_dcc:
/*0x0dcc*/  .word 0x400b4000
            data_dd0:
/*0x0dd0*/  .word 0x400b0000
            data_dd4:
/*0x0dd4*/  .word 0x0000209c /* possible pointer */

            jump_dd8:
/*0x0dd8*/      push {r4, lr}
/*0x0dda*/      ldr r4, [pc, #0x58] /* data_e34 */
/*0x0ddc*/      movs r1, #0
/*0x0dde*/      mov r0, r4
/*0x0de0*/      bl call_1fc
/*0x0de4*/      movs r1, #0
/*0x0de6*/      mov r0, r4
/*0x0de8*/      bl call_1e8
/*0x0dec*/      mov r0, r4
/*0x0dee*/      bl bftm_clear
/*0x0df2*/      ldr r1, [pc, #0x44] /* data_e38 */
/*0x0df4*/      asrs r0, r4, #0x14
/*0x0df6*/      str.w r0, [r1, #0x180]
/*0x0dfa*/      movs r1, #0
/*0x0dfc*/      ldr r0, [pc, #0x3c] /* data_e3c */
/*0x0dfe*/      bl call_46c
/*0x0e02*/      ldr r1, [pc, #0x3c] /* data_e40 */
/*0x0e04*/      movs r0, #2
/*0x0e06*/      str r0, [r1, #0x28]
/*0x0e08*/      mov r1, r0
/*0x0e0a*/      ldr r0, [pc, #0x38] /* data_e44 */
/*0x0e0c*/      bl call_e0
/*0x0e10*/      ldr r4, [pc, #0x34] /* data_e48 */
/*0x0e12*/      movs r2, #1
/*0x0e14*/      lsls r1, r2, #8
/*0x0e16*/      mov r0, r4
/*0x0e18*/      bl call_3d4
/*0x0e1c*/      movs r2, #1
/*0x0e1e*/      lsls r1, r2, #0xe
/*0x0e20*/      mov r0, r4
/*0x0e22*/      bl call_3d4
/*0x0e26*/      mov r0, r4
/*0x0e28*/      movs r2, #1
/*0x0e2a*/      pop.w {r4, lr}
/*0x0e2e*/      lsls r1, r2, #0xf
/*0x0e30*/      b.w call_3d4

            data_e34:
/*0x0e34*/  .word 0x40077000
            data_e38:
/*0x0e38*/  .word 0xe000e004
            data_e3c:
/*0x0e3c*/  .word 0x4006f000
            data_e40:
/*0x0e40*/  .word 0x400b4000
            data_e44:
/*0x0e44*/  .word 0x400b2000
            data_e48:
/*0x0e48*/  .word 0x400b0000


            .thumb_func
            call_e4c:
/*0x0e4c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0e50*/      movs r1, #2
/*0x0e52*/      ldr r0, [pc, #0xa8] /* data_efc */
/*0x0e54*/      bl call_e0
/*0x0e58*/      ldr r5, [pc, #0xa4] /* data_f00 */
/*0x0e5a*/      mov.w r6, #0x100
/*0x0e5e*/      mov r1, r6
/*0x0e60*/      mov r0, r5
/*0x0e62*/      bl call_e0
/*0x0e66*/      lsls r7, r6, #6
/*0x0e68*/      mov r1, r7
/*0x0e6a*/      mov r0, r5
/*0x0e6c*/      bl call_e0
/*0x0e70*/      lsls r4, r6, #7
/*0x0e72*/      mov r1, r4
/*0x0e74*/      mov r0, r5
/*0x0e76*/      bl call_e0
/*0x0e7a*/      movs r2, #0
/*0x0e7c*/      mov r1, r6
/*0x0e7e*/      mov r0, r5
/*0x0e80*/      bl call_3d4
/*0x0e84*/      movs r2, #0
/*0x0e86*/      mov r1, r7
/*0x0e88*/      mov r0, r5
/*0x0e8a*/      bl call_3d4
/*0x0e8e*/      movs r2, #0
/*0x0e90*/      mov r1, r4
/*0x0e92*/      mov r0, r5
/*0x0e94*/      bl call_3d4
/*0x0e98*/      movw r0, #0x2710
/*0x0e9c*/      bl call_102
/*0x0ea0*/      ldr r3, [pc, #0x60] /* data_f04 */
/*0x0ea2*/      movs r2, #2
/*0x0ea4*/      str r2, [r3, #0x24]
/*0x0ea6*/      lsls r1, r2, #8
/*0x0ea8*/      ldr r0, [pc, #0x5c] /* data_f08 */
/*0x0eaa*/      bl mem_zero
/*0x0eae*/      ldr r1, [pc, #0x5c] /* data_f0c */
/*0x0eb0*/      movs r0, #0
/*0x0eb2*/      strb r0, [r1, #2]
/*0x0eb4*/      movs r0, #0x64
/*0x0eb6*/      bl call_102
/*0x0eba*/      bl call_f60
/*0x0ebe*/      movs r0, #2
/*0x0ec0*/      bl call_189c
/*0x0ec4*/      str r4, [r5, #0x24]
/*0x0ec6*/      movs r1, #1
/*0x0ec8*/      ldr r0, [pc, #0x44] /* data_f10 */
/*0x0eca*/      bl call_46c
/*0x0ece*/      ldr r4, [pc, #0x44] /* data_f14 */
/*0x0ed0*/      movs r1, #0
/*0x0ed2*/      mov r0, r4
/*0x0ed4*/      bl bftm_set_counter
/*0x0ed8*/      mov r0, r4
/*0x0eda*/      bl bftm_clear
/*0x0ede*/      movs r1, #1
/*0x0ee0*/      mov r0, r4
/*0x0ee2*/      bl call_1e8
/*0x0ee6*/      movs r1, #1
/*0x0ee8*/      mov r0, r4
/*0x0eea*/      bl call_1fc
/*0x0eee*/      ldr r1, [pc, #0x28] /* data_f18 */
/*0x0ef0*/      asrs r0, r4, #0x14
/*0x0ef2*/      str.w r0, [r1, #0x100]
/*0x0ef6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x0efa*/  .byte 0x00
/*0x0efb*/  .byte 0x00

            data_efc:
/*0x0efc*/  .word 0x400b2000
            data_f00:
/*0x0f00*/  .word 0x400b0000
            data_f04:
/*0x0f04*/  .word 0x400b4000
            data_f08:
/*0x0f08*/  .word 0x200000da
            data_f0c:
/*0x0f0c*/  .word 0x20000014
            data_f10:
/*0x0f10*/  .word 0x4006f000
            data_f14:
/*0x0f14*/  .word 0x40077000
            data_f18:
/*0x0f18*/  .word 0xe000e004


            .thumb_func
            call_f1c:
/*0x0f1c*/      push {r4, r5, lr}
/*0x0f1e*/      movs r0, #0x12
/*0x0f20*/      bl call_189c
/*0x0f24*/      movs r1, #0xa
/*0x0f26*/      mov.w r0, #0x300
/*0x0f2a*/      bl call_18cc
/*0x0f2e*/      movs r1, #2
/*0x0f30*/      movs r0, #0
/*0x0f32*/      bl call_18cc
/*0x0f36*/      ldr r4, [pc, #0x24] /* data_f5c */
/*0x0f38*/      mov.w r0, #0x4000
/*0x0f3c*/      str r0, [r4, #0x28]
/*0x0f3e*/      lsls r5, r0, #1
/*0x0f40*/      str r5, [r4, #0x24]
/*0x0f42*/      movs r1, #8
/*0x0f44*/      mov.w r0, #0xc00
/*0x0f48*/      bl call_18cc
/*0x0f4c*/      asrs r0, r4, #0x16
/*0x0f4e*/      str r0, [r4, #0x24]
/*0x0f50*/      str r5, [r4, #0x28]
/*0x0f52*/      nop 
/*0x0f54*/      nop 
/*0x0f56*/      str r5, [r4, #0x24]
/*0x0f58*/      pop {r4, r5, pc}

/*0x0f5a*/  .byte 0x00
/*0x0f5b*/  .byte 0x00

            data_f5c:
/*0x0f5c*/  .word 0x400b0000


            .thumb_func
            call_f60:
/*0x0f60*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x0f64*/      ldr r1, [pc, #0x70] /* data_fd8 */
/*0x0f66*/      ldr r0, [pc, #0x6c] /* data_fd4 */
/*0x0f68*/      movs r4, #0x10
/*0x0f6a*/      ldrb r2, [r1, #2]
/*0x0f6c*/      lsls r7, r4, #4
/*0x0f6e*/      add.w r5, r0, r2, lsl #6
/*0x0f72*/      ldrb r0, [r1]
/*0x0f74*/      ldr r6, [pc, #0x64] /* data_fdc */
/*0x0f76*/      mov.w sl, #0x4000
/*0x0f7a*/      adds r5, #0x3e
/*0x0f7c*/      cbz r0, jump_f8c
/*0x0f7e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0f80*/      ands r0, r0, #0xff
/*0x0f84*/      strb r0, [r1]
/*0x0f86*/      bne jump_f8c
/*0x0f88*/      bl call_f1c
            jump_f8c:
/*0x0f8c*/      mov sb, r7
            jump_f8e:
/*0x0f8e*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x0f90*/      uxtb r4, r4
/*0x0f92*/      blo jump_fcc
/*0x0f94*/      mov.w r8, #0x8000
/*0x0f98*/      str.w r8, [r6, #0x28]
/*0x0f9c*/      ldrh r0, [r5]
/*0x0f9e*/      subs r7, r5, #2
/*0x0fa0*/      movs r1, #0xa
/*0x0fa2*/      bl call_18cc
/*0x0fa6*/      ldrh r0, [r7]
/*0x0fa8*/      movs r1, #9
/*0x0faa*/      ubfx r7, r0, #6, #1
/*0x0fae*/      .short 0x1f2d /* subs r5, r5, #4 */ 
/*0x0fb0*/      bl call_18cc
/*0x0fb4*/      mov r0, sl
/*0x0fb6*/      str.w sl, [r6, #0x28]
/*0x0fba*/      str.w r8, [r6, #0x24]
/*0x0fbe*/      mov r1, sb
/*0x0fc0*/      cbz r7, jump_fc6
/*0x0fc2*/      str r1, [r6, #0x24]
/*0x0fc4*/      b jump_fc8
            jump_fc6:
/*0x0fc6*/      str r1, [r6, #0x28]
            jump_fc8:
/*0x0fc8*/      str r0, [r6, #0x24]
/*0x0fca*/      b jump_f8e
            jump_fcc:
/*0x0fcc*/      str.w sb, [r6, #0x24]
/*0x0fd0*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_fd4:
/*0x0fd4*/  .word 0x200000da
            data_fd8:
/*0x0fd8*/  .word 0x20000014
            data_fdc:
/*0x0fdc*/  .word 0x400b0000


            .thumb_func
            call_fe0:
/*0x0fe0*/      ldr r0, [pc, #0x50] /* data_1034 */
/*0x0fe2*/      movs r1, #1
/*0x0fe4*/      str.w r1, [r0, #0x300]
/*0x0fe8*/      ldr r2, [pc, #0x4c] /* data_1038 */
/*0x0fea*/      str.w r1, [r2, #0xa8]
            jump_fee:
/*0x0fee*/      ldr.w r3, [r2, #0x108]
/*0x0ff2*/      cmp r3, #0
/*0x0ff4*/      beq jump_fee
/*0x0ff6*/      movs r3, #0
/*0x0ff8*/      str r3, [r2, #0x20]
/*0x0ffa*/      mov.w r3, #0x9000000
/*0x0ffe*/      str r3, [r0, #0x18]
/*0x1000*/      str.w r1, [r2, #0xa4]
            jump_1004:
/*0x1004*/      ldr.w r3, [r2, #0x104]
/*0x1008*/      cmp r3, #0
/*0x100a*/      beq jump_1004
/*0x100c*/      ldr r2, [pc, #0x2c] /* data_103c */
/*0x100e*/      ldr.w r3, [r2, #0x200]
/*0x1012*/      bic r3, r3, #7
/*0x1016*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x1018*/      str.w r3, [r2, #0x200]
/*0x101c*/      str r1, [r0, #0x20]
/*0x101e*/      ldr r2, [r0, #4]
/*0x1020*/      bic r2, r2, #3
/*0x1024*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1026*/      str r2, [r0, #4]
            jump_1028:
/*0x1028*/      ldr r2, [r0, #0x34]
/*0x102a*/      cmp.w r1, r2, lsr #30
/*0x102e*/      bne jump_1028
/*0x1030*/      bx lr

/*0x1032*/  .byte 0x00
/*0x1033*/  .byte 0x00

            data_1034:
/*0x1034*/  .word 0x40088000
            data_1038:
/*0x1038*/  .word 0x43100000
            data_103c:
/*0x103c*/  .word 0x40080000


            .thumb_func
            call_1040:
/*0x1040*/      ldr r0, [pc, #0x10] /* data_1054 */
/*0x1042*/      movs r1, #0
/*0x1044*/      add.w r2, r0, #8
/*0x1048*/      str r1, [r0, #0x1c]
/*0x104a*/      str r1, [r0, #0x20]
/*0x104c*/      strb r1, [r2, #1]
/*0x104e*/      str.w r1, [r0, #0x15]
/*0x1052*/      bx lr

            data_1054:
/*0x1054*/  .word 0x2000001c


            .thumb_func
            call_1058:
/*0x1058*/      ldr r0, [pc, #0x18] /* data_1074 */
/*0x105a*/      push {lr}
/*0x105c*/      ldr r1, [pc, #0x14] /* data_1074 */
/*0x105e*/      movs r3, #1
/*0x1060*/      strb r3, [r0]
/*0x1062*/      adds r1, #0xc
/*0x1064*/      movs r0, #2
/*0x1066*/      strb r0, [r1]
/*0x1068*/      bl call_1040
/*0x106c*/      ldr r0, [pc, #4] /* data_1074 */
/*0x106e*/      subs r0, #8
/*0x1070*/      strb r3, [r0, #4]
/*0x1072*/      pop {pc}

            data_1074:
/*0x1074*/  .word 0x20000024


            .thumb_func
            call_1078:
/*0x1078*/      ldrb.w r0, [r0, #0x34]
/*0x107c*/      ubfx r0, r0, #1, #1
/*0x1080*/      bx lr

/*0x1082*/  .byte 0x00
/*0x1083*/  .byte 0x00

            jump_1084:
/*0x1084*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1088*/      mov r4, r0
/*0x108a*/      bl call_14c8
/*0x108e*/      mov r5, r0
/*0x1090*/      ldr r6, [pc, #0x158] /* data_11ec */
/*0x1092*/      lsls r0, r0, #0x1e
/*0x1094*/      bpl jump_10a2
/*0x1096*/      ldr r0, [r6, #4]
/*0x1098*/      cbz r0, jump_109c
/*0x109a*/      blx r0
            jump_109c:
/*0x109c*/      movs r0, #2
/*0x109e*/      bl call_1224
            jump_10a2:
/*0x10a2*/      lsls r0, r5, #0x1b
/*0x10a4*/      bpl jump_10c6
/*0x10a6*/      movs r0, #0x10
/*0x10a8*/      bl call_1224
/*0x10ac*/      ldrb.w r0, [r4, #0x32]
/*0x10b0*/      cmp r0, #2
/*0x10b2*/      blo jump_10c6
/*0x10b4*/      bl call_14d8
/*0x10b8*/      ldrb.w r0, [r4, #0x32]
/*0x10bc*/      strb.w r0, [r4, #0x33]
/*0x10c0*/      movs r0, #3
/*0x10c2*/      strb.w r0, [r4, #0x32]
            jump_10c6:
/*0x10c6*/      lsls r0, r5, #0x1d
/*0x10c8*/      mov.w r7, #0
/*0x10cc*/      bpl jump_1112
/*0x10ce*/      subs r0, r7, #1
/*0x10d0*/      str r0, [r4, #0x20]
/*0x10d2*/      strb.w r7, [r4, #0x30]
/*0x10d6*/      strb.w r7, [r4, #0x31]
/*0x10da*/      ldrb.w r0, [r4, #0x34]
/*0x10de*/      bic r0, r0, #2
/*0x10e2*/      strb.w r0, [r4, #0x34]
/*0x10e6*/      movs r0, #4
/*0x10e8*/      strb.w r0, [r4, #0x32]
/*0x10ec*/      str r7, [r4, #0x38]
/*0x10ee*/      bl call_12d4
/*0x10f2*/      bl call_14e8
/*0x10f6*/      ldr r1, [pc, #0xf8] /* data_11f0 */
/*0x10f8*/      movs r0, #0
/*0x10fa*/      bl call_1390
/*0x10fe*/      ldr r0, [pc, #0xf0] /* data_11f0 */
/*0x1100*/      ldr r0, [r0]
/*0x1102*/      bl call_1498
/*0x1106*/      ldr r0, [r6]
/*0x1108*/      cbz r0, jump_110c
/*0x110a*/      blx r0
            jump_110c:
/*0x110c*/      movs r0, #4
/*0x110e*/      bl call_1224
            jump_1112:
/*0x1112*/      lsls r0, r5, #0x1c
/*0x1114*/      bpl jump_1128
/*0x1116*/      bl call_14e8
/*0x111a*/      ldrb.w r0, [r4, #0x33]
/*0x111e*/      strb.w r0, [r4, #0x32]
/*0x1122*/      movs r0, #8
/*0x1124*/      bl call_1224
            jump_1128:
/*0x1128*/      lsls r0, r5, #0x17
/*0x112a*/      mov.w r8, #0x100
/*0x112e*/      bpl jump_11ac
/*0x1130*/      movs r0, #0
/*0x1132*/      bl call_1370
/*0x1136*/      mov r5, r0
/*0x1138*/      lsls r0, r0, #0x16
/*0x113a*/      bpl jump_1152
/*0x113c*/      mov r0, r4
/*0x113e*/      bl call_1608
/*0x1142*/      mov r0, r4
/*0x1144*/      bl call_1b94
/*0x1148*/      mov.w r1, #0x200
/*0x114c*/      movs r0, #0
/*0x114e*/      bl call_1300
            jump_1152:
/*0x1152*/      lsls r0, r5, #0x1e
/*0x1154*/      bpl jump_1194
/*0x1156*/      movs r1, #2
/*0x1158*/      movs r0, #0
/*0x115a*/      bl call_1300
/*0x115e*/      ldr r0, [r4, #0x20]
/*0x1160*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1162*/      beq jump_1194
/*0x1164*/      ldrb.w r0, [r4, #0x24]
/*0x1168*/      cmp r0, #2
/*0x116a*/      bne jump_1194
/*0x116c*/      movs r2, #0x40
/*0x116e*/      movs r0, #0
/*0x1170*/      ldr r1, [r4, #0x1c]
/*0x1172*/      bl call_13f0
/*0x1176*/      ldr r1, [r4, #0x1c]
/*0x1178*/      add r1, r0
/*0x117a*/      str r1, [r4, #0x1c]
/*0x117c*/      ldr r1, [r4, #0x20]
/*0x117e*/      subs r0, r1, r0
/*0x1180*/      str r0, [r4, #0x20]
/*0x1182*/      bne jump_1194
/*0x1184*/      movs r0, #1
/*0x1186*/      strb.w r0, [r4, #0x24]
/*0x118a*/      ldr r1, [r4, #0x28]
/*0x118c*/      cbz r1, jump_1194
/*0x118e*/      ldr r0, [r4, #0x2c]
/*0x1190*/      blx r1
/*0x1192*/      str r7, [r4, #0x28]
            jump_1194:
/*0x1194*/      lsls r0, r5, #0x1b
/*0x1196*/      bpl jump_11a6
/*0x1198*/      mov r0, r4
/*0x119a*/      bl call_1b50
/*0x119e*/      movs r1, #0x10
/*0x11a0*/      movs r0, #0
/*0x11a2*/      bl call_1300
            jump_11a6:
/*0x11a6*/      mov r0, r8
/*0x11a8*/      bl call_1224
            jump_11ac:
/*0x11ac*/      mov r4, r8
            jump_11ae:
/*0x11ae*/      bl call_14c8
/*0x11b2*/      bl call_14a8
/*0x11b6*/      mov r5, r0
/*0x11b8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x11ba*/      beq jump_11e6
/*0x11bc*/      mov r0, r5
/*0x11be*/      bl call_1370
/*0x11c2*/      tst.w r0, #0x12
/*0x11c6*/      beq jump_11ae
/*0x11c8*/      movs r1, #0x12
/*0x11ca*/      mov r0, r5
/*0x11cc*/      bl call_1300
/*0x11d0*/      lsl.w r0, r4, r5
/*0x11d4*/      bl call_1224
/*0x11d8*/      ldr r0, [r6, #0x18]
/*0x11da*/      cmp r0, #0
/*0x11dc*/      beq jump_11ae
/*0x11de*/      mov r1, r0
/*0x11e0*/      mov r0, r5
/*0x11e2*/      blx r1
/*0x11e4*/      b jump_11ae
            jump_11e6:
/*0x11e6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x11ea*/  .byte 0x00
/*0x11eb*/  .byte 0x00

            data_11ec:
/*0x11ec*/  .word 0x0000221c /* possible pointer */
            data_11f0:
/*0x11f0*/  .word 0x20000040


            .thumb_func
            call_11f4:
/*0x11f4*/      movs r1, #2
/*0x11f6*/      strb.w r1, [r0, #0x32]
/*0x11fa*/      ldr r0, [pc, #4] /* data_1200 */
/*0x11fc*/      b.w jump_110

            data_1200:
/*0x1200*/  .word 0x20000040


            .thumb_func
            call_1204:
/*0x1204*/      ldrb.w r0, [r0, #0x32]
/*0x1208*/      cmp r0, #3
/*0x120a*/      beq jump_1210
/*0x120c*/      movs r0, #0
/*0x120e*/      bx lr
            jump_1210:
/*0x1210*/      movs r0, #1
/*0x1212*/      bx lr

            .thumb_func
            call_1214:
/*0x1214*/      push {r4, lr}
/*0x1216*/      bl call_14e8
/*0x121a*/      pop.w {r4, lr}
/*0x121e*/      b.w jump_1618

/*0x1222*/  .byte 0x00
/*0x1223*/  .byte 0x00


            .thumb_func
            call_1224:
/*0x1224*/      ldr r1, [pc, #4] /* data_122c */
/*0x1226*/      str r0, [r1, #8]
/*0x1228*/      bx lr

/*0x122a*/  .byte 0x00
/*0x122b*/  .byte 0x00

            data_122c:
/*0x122c*/  .word 0x400a8000


            .thumb_func
            call_1230:
/*0x1230*/      push {r4, lr}
/*0x1232*/      movs r1, #0
/*0x1234*/      mov.w r0, #0x400
/*0x1238*/      movs r2, #0x40
/*0x123a*/      movs r3, #1
/*0x123c*/      bl ckcu_clocks_enable
/*0x1240*/      movs r0, #2
/*0x1242*/      bl call_314
/*0x1246*/      ldr r4, [pc, #0x48] /* data_1290 */
/*0x1248*/      ldr r0, [pc, #0x40] /* data_128c */
/*0x124a*/      str r0, [r4, #8]
/*0x124c*/      subs r0, #0x5c
/*0x124e*/      str r0, [r4, #0xc]
/*0x1250*/      subs r0, #0xd4
/*0x1252*/      str r0, [r4, #0x10]
/*0x1254*/      movs r0, #2
/*0x1256*/      str r0, [r4, #0x14]
/*0x1258*/      bl call_1058
/*0x125c*/      mov r0, r4
/*0x125e*/      bl call_11f4
/*0x1262*/      ldr r1, [pc, #0x30] /* data_1294 */
/*0x1264*/      mov.w r0, #0x200000
/*0x1268*/      str.w r0, [r1, #0x100]
/*0x126c*/      movs r0, #1
/*0x126e*/      bl call_12b8
/*0x1272*/      movs r0, #0xfa
/*0x1274*/      bl call_102
/*0x1278*/      ldrb.w r0, [r4, #0x34]
/*0x127c*/      pop.w {r4, lr}
/*0x1280*/      and r1, r0, #1
/*0x1284*/      ldr r0, [pc, #0x10] /* data_1298 */
/*0x1286*/      b.w jump_14f8

/*0x128a*/  .byte 0x00
/*0x128b*/  .byte 0x00

            data_128c:
/*0x128c*/  .word 0x000021ec /* possible pointer */
            data_1290:
/*0x1290*/  .word 0x200002f4
            data_1294:
/*0x1294*/  .word 0xe000e004
            data_1298:
/*0x1298*/  .word 0x20000040


            .thumb_func
            call_129c:
/*0x129c*/      ldr r1, [pc, #0x14] /* data_12b4 */
/*0x129e*/      cmp r0, #1
/*0x12a0*/      ldr r0, [r1]
/*0x12a2*/      beq jump_12ac
/*0x12a4*/      bic r0, r0, #0x800
            jump_12a8:
/*0x12a8*/      str r0, [r1]
/*0x12aa*/      bx lr
            jump_12ac:
/*0x12ac*/      orr r0, r0, #0x800
/*0x12b0*/      b jump_12a8

/*0x12b2*/  .byte 0x00
/*0x12b3*/  .byte 0x00

            data_12b4:
/*0x12b4*/  .word 0x400a8000


            .thumb_func
            call_12b8:
/*0x12b8*/      ldr r1, [pc, #0x14] /* data_12d0 */
/*0x12ba*/      cmp r0, #1
/*0x12bc*/      ldr r0, [r1]
/*0x12be*/      beq jump_12c8
/*0x12c0*/      bic r0, r0, #0x400
            jump_12c4:
/*0x12c4*/      str r0, [r1]
/*0x12c6*/      bx lr
            jump_12c8:
/*0x12c8*/      orr r0, r0, #0x400
/*0x12cc*/      b jump_12c4

/*0x12ce*/  .byte 0x00
/*0x12cf*/  .byte 0x00

            data_12d0:
/*0x12d0*/  .word 0x400a8000


            .thumb_func
            call_12d4:
/*0x12d4*/      movs r1, #0
/*0x12d6*/      movs r0, #0x20
/*0x12d8*/      movs r3, #1
/*0x12da*/      mov r2, r1
/*0x12dc*/      b.w jump_ae0

            .thumb_func
            call_12e0:
/*0x12e0*/      push {r4, lr}
/*0x12e2*/      bl call_1db8
/*0x12e6*/      ldr r1, [r0]
/*0x12e8*/      and r1, r1, #9
/*0x12ec*/      str r1, [r0]
/*0x12ee*/      pop {r4, pc}

            .thumb_func
            call_12f0:
/*0x12f0*/      push {r4, lr}
/*0x12f2*/      bl call_1db8
/*0x12f6*/      ldr r1, [r0]
/*0x12f8*/      and r1, r1, #0x24
/*0x12fc*/      str r1, [r0]
/*0x12fe*/      pop {r4, pc}

            .thumb_func
            call_1300:
/*0x1300*/      push {r4, lr}
/*0x1302*/      mov r4, r1
/*0x1304*/      bl call_1db8
/*0x1308*/      str r4, [r0, #8]
/*0x130a*/      pop {r4, pc}

            .thumb_func
            call_130c:
/*0x130c*/      push {r4, lr}
/*0x130e*/      bl call_1db8
/*0x1312*/      ldr r0, [r0, #0x10]
/*0x1314*/      ldr r1, [pc, #8] /* data_1320 */
/*0x1316*/      ubfx r0, r0, #0, #0xa
/*0x131a*/      add r0, r1
/*0x131c*/      pop {r4, pc}

/*0x131e*/  .byte 0x00
/*0x131f*/  .byte 0x00

            data_1320:
/*0x1320*/  .word 0x400aa000


            .thumb_func
            call_1324:
/*0x1324*/      push {r4, r5, r6, lr}
/*0x1326*/      mov r5, r0
/*0x1328*/      bl call_1db8
/*0x132c*/      mov r4, r0
/*0x132e*/      mov r0, r5
/*0x1330*/      bl call_1348
/*0x1334*/      ldr r1, [r4, #0x10]
/*0x1336*/      ubfx r1, r1, #0, #0xa
/*0x133a*/      add r0, r1
/*0x133c*/      ldr r1, [pc, #4] /* data_1344 */
/*0x133e*/      add r0, r1
/*0x1340*/      pop {r4, r5, r6, pc}

/*0x1342*/  .byte 0x00
/*0x1343*/  .byte 0x00

            data_1344:
/*0x1344*/  .word 0x400aa000


            .thumb_func
            call_1348:
/*0x1348*/      push {r4, lr}
/*0x134a*/      bl call_1db8
/*0x134e*/      ldr r0, [r0, #0x10]
/*0x1350*/      ubfx r0, r0, #0xa, #0xa
/*0x1354*/      pop {r4, pc}

            .thumb_func
            call_1356:
/*0x1356*/      push {r4, lr}
/*0x1358*/      bl call_1db8
/*0x135c*/      ldr r1, [r0, #0x10]
/*0x135e*/      ldr r0, [r0]
/*0x1360*/      lsls r1, r1, #3
/*0x1362*/      bpl jump_136a
/*0x1364*/      ubfx r0, r0, #2, #1
/*0x1368*/      pop {r4, pc}
            jump_136a:
/*0x136a*/      ubfx r0, r0, #5, #1
/*0x136e*/      pop {r4, pc}

            .thumb_func
            call_1370:
/*0x1370*/      push {r4, lr}
/*0x1372*/      bl call_1db8
/*0x1376*/      ldr r1, [r0, #4]
/*0x1378*/      ldr r0, [r0, #8]
/*0x137a*/      ands r0, r1
/*0x137c*/      pop {r4, pc}

            .thumb_func
            call_137e:
/*0x137e*/      push {r4, lr}
/*0x1380*/      mov r4, r1
/*0x1382*/      bl call_1db8
/*0x1386*/      ldr r0, [r0, #0xc]
/*0x1388*/      lsrs r0, r4
/*0x138a*/      ubfx r0, r0, #0, #9
/*0x138e*/      pop {r4, pc}

            .thumb_func
            call_1390:
/*0x1390*/      push {r4, r5, r6, lr}
/*0x1392*/      mov r4, r1
/*0x1394*/      mov r5, r0
/*0x1396*/      bl call_1db8
/*0x139a*/      add.w r1, r4, r5, lsl #3
/*0x139e*/      ldr r2, [r1, #4]
/*0x13a0*/      str r2, [r0, #0x10]
/*0x13a2*/      ldr r1, [r1, #8]
/*0x13a4*/      str r1, [r0, #4]
/*0x13a6*/      mov.w r1, #-1
/*0x13aa*/      str r1, [r0, #8]
/*0x13ac*/      mov r0, r5
/*0x13ae*/      pop.w {r4, r5, r6, lr}
/*0x13b2*/      b.w jump_1420

            .thumb_func
            call_13b6:
/*0x13b6*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x13ba*/      mov r6, r2
/*0x13bc*/      mov r7, r1
/*0x13be*/      movs r5, r0
/*0x13c0*/      beq jump_13e6
/*0x13c2*/      movs r1, #0
            jump_13c4:
/*0x13c4*/      bl call_137e
/*0x13c8*/      mov r4, r0
/*0x13ca*/      cmp r0, r6
/*0x13cc*/      bhi jump_13e0
/*0x13ce*/      mov r0, r5
/*0x13d0*/      cbz r5, jump_13ea
/*0x13d2*/      bl call_130c
            jump_13d6:
/*0x13d6*/      adds r1, r4, #3
/*0x13d8*/      lsrs r2, r1, #2
/*0x13da*/      mov r1, r7
/*0x13dc*/      bl call_1da8
            jump_13e0:
/*0x13e0*/      mov r0, r4
/*0x13e2*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_13e6:
/*0x13e6*/      movs r1, #0x10
/*0x13e8*/      b jump_13c4
            jump_13ea:
/*0x13ea*/      bl call_1324
/*0x13ee*/      b jump_13d6

            .thumb_func
            call_13f0:
/*0x13f0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x13f4*/      mov r5, r2
/*0x13f6*/      mov r6, r1
/*0x13f8*/      mov r7, r0
/*0x13fa*/      bl call_1db8
/*0x13fe*/      mov r4, r0
/*0x1400*/      movs r0, #0
/*0x1402*/      cbz r5, jump_1414
/*0x1404*/      mov r2, r5
/*0x1406*/      mov r1, r6
/*0x1408*/      mov r0, r7
/*0x140a*/      bl call_13b6
/*0x140e*/      cbnz r0, jump_1414
/*0x1410*/      cmp r5, #0
/*0x1412*/      bne jump_141c
            jump_1414:
/*0x1414*/      ldr r1, [r4]
/*0x1416*/      and r1, r1, #0x10
/*0x141a*/      str r1, [r4]
            jump_141c:
/*0x141c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_1420:
/*0x1420*/      push {r4, lr}
/*0x1422*/      bl call_1db8
/*0x1426*/      ldr r1, [r0]
/*0x1428*/      and r1, r1, #0x19
/*0x142c*/      str r1, [r0]
/*0x142e*/      pop {r4, pc}
            jump_1430:
/*0x1430*/      push {r4, lr}
/*0x1432*/      bl call_1db8
/*0x1436*/      movs r1, #4
/*0x1438*/      str r1, [r0]
/*0x143a*/      pop {r4, pc}

            .thumb_func
            call_143c:
/*0x143c*/      push {r4, lr}
/*0x143e*/      bl call_1db8
/*0x1442*/      movs r1, #0x40
/*0x1444*/      str r1, [r0, #8]
/*0x1446*/      ldr r2, [r0]
/*0x1448*/      movs r1, #0x24
/*0x144a*/      bics r1, r2
/*0x144c*/      str r1, [r0]
/*0x144e*/      pop {r4, pc}

            .thumb_func
            call_1450:
/*0x1450*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1454*/      mov r4, r2
/*0x1456*/      mov r8, r1
/*0x1458*/      mov r7, r0
/*0x145a*/      bl call_1348
/*0x145e*/      mov r6, r0
/*0x1460*/      mov r0, r7
/*0x1462*/      bl call_1db8
/*0x1466*/      mov r5, r0
/*0x1468*/      movs r1, #0
/*0x146a*/      mov r0, r7
/*0x146c*/      bl call_137e
/*0x1470*/      cmp r4, r6
/*0x1472*/      bhi jump_1476
/*0x1474*/      cbz r0, jump_147c
            jump_1476:
/*0x1476*/      movs r0, #0
            jump_1478:
/*0x1478*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_147c:
/*0x147c*/      mov r0, r7
/*0x147e*/      bl call_130c
/*0x1482*/      mov r1, r0
/*0x1484*/      adds r0, r4, #3
/*0x1486*/      lsrs r2, r0, #2
/*0x1488*/      mov r0, r8
/*0x148a*/      bl call_1da8
/*0x148e*/      str r4, [r5, #0xc]
/*0x1490*/      movs r0, #2
/*0x1492*/      str r0, [r5]
/*0x1494*/      mov r0, r4
/*0x1496*/      b jump_1478

            .thumb_func
            call_1498:
/*0x1498*/      ldr r1, [pc, #8] /* data_14a4 */
/*0x149a*/      ldr r2, [r1, #4]
/*0x149c*/      orrs r2, r0
/*0x149e*/      str r2, [r1, #4]
/*0x14a0*/      bx lr

/*0x14a2*/  .byte 0x00
/*0x14a3*/  .byte 0x00

            data_14a4:
/*0x14a4*/  .word 0x400a8000


            .thumb_func
            call_14a8:
/*0x14a8*/      mov r3, r0
/*0x14aa*/      movs r1, #7
            jump_14ac:
/*0x14ac*/      add.w r2, r1, #8
/*0x14b0*/      lsr.w r0, r3, r2
/*0x14b4*/      lsls r2, r0, #0x1f
/*0x14b6*/      beq jump_14bc
/*0x14b8*/      sxtb r0, r1
/*0x14ba*/      bx lr
            jump_14bc:
/*0x14bc*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x14be*/      cmp r1, #0
/*0x14c0*/      bgt jump_14ac
/*0x14c2*/      mov.w r0, #-1
/*0x14c6*/      bx lr

            .thumb_func
            call_14c8:
/*0x14c8*/      ldr r0, [pc, #8] /* data_14d4 */
/*0x14ca*/      ldr r1, [r0, #4]
/*0x14cc*/      ldr r0, [r0, #8]
/*0x14ce*/      ands r0, r1
/*0x14d0*/      bx lr

/*0x14d2*/  .byte 0x00
/*0x14d3*/  .byte 0x00

            data_14d4:
/*0x14d4*/  .word 0x400a8000


            .thumb_func
            call_14d8:
/*0x14d8*/      ldr r0, [pc, #8] /* data_14e4 */
/*0x14da*/      ldr r1, [r0]
/*0x14dc*/      orr r1, r1, #0xc
/*0x14e0*/      str r1, [r0]
/*0x14e2*/      bx lr

            data_14e4:
/*0x14e4*/  .word 0x400a8000


            .thumb_func
            call_14e8:
/*0x14e8*/      ldr r0, [pc, #8] /* data_14f4 */
/*0x14ea*/      ldr r1, [r0]
/*0x14ec*/      and r1, r1, #0x400
/*0x14f0*/      str r1, [r0]
/*0x14f2*/      bx lr

            data_14f4:
/*0x14f4*/  .word 0x400a8000

            jump_14f8:
/*0x14f8*/      push {r4, lr}
/*0x14fa*/      mov r4, r0
/*0x14fc*/      ldr r0, [pc, #0x68] /* data_1568 */
/*0x14fe*/      ldr r2, [r0]
/*0x1500*/      cmp r2, #1
/*0x1502*/      bne jump_1564
/*0x1504*/      movs r2, #0
/*0x1506*/      str r2, [r0]
/*0x1508*/      ldr r0, [pc, #0x60] /* data_156c */
/*0x150a*/      ldr r2, [r0]
/*0x150c*/      lsls r3, r2, #0x19
/*0x150e*/      mov.w r2, #-1
/*0x1512*/      bpl jump_152e
/*0x1514*/      movw r3, #0x40c
/*0x1518*/      str r3, [r0]
/*0x151a*/      str r2, [r0, #8]
/*0x151c*/      cbnz r1, jump_1524
/*0x151e*/      movs r0, #0
/*0x1520*/      bl call_748
            jump_1524:
/*0x1524*/      ldr r0, [r4]
/*0x1526*/      pop.w {r4, lr}
/*0x152a*/      b.w call_1498
            jump_152e:
/*0x152e*/      movw r3, #0xc0c
/*0x1532*/      str r3, [r0]
/*0x1534*/      str r2, [r0, #8]
/*0x1536*/      cbnz r1, jump_153e
/*0x1538*/      movs r0, #0
/*0x153a*/      bl call_748
            jump_153e:
/*0x153e*/      movs r0, #0
/*0x1540*/      bl call_129c
/*0x1544*/      ldr r0, [r4]
/*0x1546*/      bl call_1498
/*0x154a*/      movs r0, #0
/*0x154c*/      bl call_12b8
/*0x1550*/      movs r1, #0xc8
/*0x1552*/      movs r0, #0
            jump_1554:
/*0x1554*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1556*/      cmp r0, r1
/*0x1558*/      blo jump_1554
/*0x155a*/      pop.w {r4, lr}
/*0x155e*/      movs r0, #1
/*0x1560*/      b.w call_12b8
            jump_1564:
/*0x1564*/      pop {r4, pc}

/*0x1566*/  .byte 0x00
/*0x1567*/  .byte 0x00

            data_1568:
/*0x1568*/  .word 0x20000000
            data_156c:
/*0x156c*/  .word 0x400a8000

            jump_1570:
/*0x1570*/      movw r1, #0x111d
/*0x1574*/      str r1, [r0]
/*0x1576*/      ldr r1, [pc, #0x28] /* data_15a0 */
/*0x1578*/      str r1, [r0, #4]
/*0x157a*/      movw r1, #0x212
/*0x157e*/      str r1, [r0, #8]
/*0x1580*/      ldr r1, [pc, #0x20] /* data_15a4 */
/*0x1582*/      str r1, [r0, #0xc]
/*0x1584*/      ldr r2, [pc, #0x20] /* data_15a8 */
/*0x1586*/      movs r1, #0x10
/*0x1588*/      strd r1, r2, [r0, #0x10]
/*0x158c*/      str r1, [r0, #0x18]
/*0x158e*/      ldr r1, [pc, #0x1c] /* data_15ac */
/*0x1590*/      str r1, [r0, #0x1c]
/*0x1592*/      movs r1, #0
/*0x1594*/      str r1, [r0, #0x20]
/*0x1596*/      ldr r1, [pc, #0x18] /* data_15b0 */
/*0x1598*/      str r1, [r0, #0x24]
/*0x159a*/      movs r1, #2
/*0x159c*/      str r1, [r0, #0x28]
/*0x159e*/      bx lr

            data_15a0:
/*0x15a0*/  .word 0x80010008
            data_15a4:
/*0x15a4*/  .word 0x91002088
            data_15a8:
/*0x15a8*/  .word 0x92010090
            data_15ac:
/*0x15ac*/  .word 0x930100d0
            data_15b0:
/*0x15b0*/  .word 0x84010110


            .thumb_func
            call_15b4:
/*0x15b4*/      push {r4, lr}
/*0x15b6*/      ldr r4, [pc, #0x48] /* data_1600 */
/*0x15b8*/      ldrb.w r0, [r4, #0x32]
/*0x15bc*/      cmp r0, #3
/*0x15be*/      bne jump_15c4
/*0x15c0*/      bl call_1dc8
            jump_15c4:
/*0x15c4*/      ldr r1, [pc, #0x3c] /* data_1604 */
/*0x15c6*/      ldrb r0, [r1, #4]
/*0x15c8*/      cbz r0, jump_15ea
/*0x15ca*/      cmp r0, #1
/*0x15cc*/      beq jump_15e2
/*0x15ce*/      cmp r0, #2
/*0x15d0*/      bne jump_15f2
/*0x15d2*/      ldrb.w r0, [r4, #0x32]
/*0x15d6*/      cmp r0, #6
/*0x15d8*/      bne jump_15de
/*0x15da*/      bl call_1910
            jump_15de:
/*0x15de*/      movs r0, #2
/*0x15e0*/      pop {r4, pc}
            jump_15e2:
/*0x15e2*/      movs r0, #0
/*0x15e4*/      strb r0, [r1, #4]
/*0x15e6*/      movs r0, #3
/*0x15e8*/      pop {r4, pc}
            jump_15ea:
/*0x15ea*/      ldrb.w r0, [r4, #0x32]
/*0x15ee*/      cmp r0, #6
/*0x15f0*/      beq jump_15f6
            jump_15f2:
/*0x15f2*/      movs r0, #0
/*0x15f4*/      pop {r4, pc}
            jump_15f6:
/*0x15f6*/      movs r0, #2
/*0x15f8*/      strb r0, [r1, #4]
/*0x15fa*/      movs r0, #1
/*0x15fc*/      pop {r4, pc}

/*0x15fe*/  .byte 0x00
/*0x15ff*/  .byte 0x00

            data_1600:
/*0x1600*/  .word 0x200002f4
            data_1604:
/*0x1604*/  .word 0x2000001c


            .thumb_func
            call_1608:
/*0x1608*/      ldr r1, [pc, #8] /* data_1614 */
/*0x160a*/      ldr r2, [r1]
/*0x160c*/      str r2, [r0]
/*0x160e*/      ldr r1, [r1, #4]
/*0x1610*/      str r1, [r0, #4]
/*0x1612*/      bx lr

            data_1614:
/*0x1614*/  .word 0x400aa000

            jump_1618:
/*0x1618*/      ldr r0, [pc, #8] /* data_1624 */
/*0x161a*/      ldr r1, [r0]
/*0x161c*/      orr r1, r1, #0x20
/*0x1620*/      str r1, [r0]
/*0x1622*/      bx lr

            data_1624:
/*0x1624*/  .word 0x400a8000


            .thumb_func
            call_1628:
/*0x1628*/      ldr r1, [pc, #0xc] /* data_1638 */
/*0x162a*/      ldr r2, [r1]
/*0x162c*/      orr r2, r2, #0x100
/*0x1630*/      str r2, [r1]
/*0x1632*/      str r0, [r1, #0x10]
/*0x1634*/      bx lr

/*0x1636*/  .byte 0x00
/*0x1637*/  .byte 0x00

            data_1638:
/*0x1638*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x163c*/      ldr r0, [pc, #4] /* data_1644 */
/*0x163e*/      b.w jump_1084

/*0x1642*/  .byte 0x00
/*0x1643*/  .byte 0x00

            data_1644:
/*0x1644*/  .word 0x200002f4


            .thumb_func
            call_1648:
/*0x1648*/      ldr r0, [pc, #0x14] /* data_1660 */
/*0x164a*/      ldr r1, [r0, #0x30]
/*0x164c*/      orr r1, r1, #0x10
/*0x1650*/      str r1, [r0, #0x30]
/*0x1652*/      ldr r0, [pc, #0x10] /* data_1664 */
/*0x1654*/      movw r1, #0x5fff
/*0x1658*/      str r1, [r0, #8]
/*0x165a*/      ldr r1, [pc, #0xc] /* data_1668 */
/*0x165c*/      str r1, [r0, #4]
/*0x165e*/      bx lr

            data_1660:
/*0x1660*/  .word 0x40088000
            data_1664:
/*0x1664*/  .word 0x40068000
            data_1668:
/*0x1668*/  .word 0x0001afff


            .thumb_func
            call_166c:
/*0x166c*/      ldr r1, [pc, #8] /* data_1678 */
/*0x166e*/      ldr r0, [pc, #4] /* data_1674 */
/*0x1670*/      str r0, [r1]
/*0x1672*/      bx lr

            data_1674:
/*0x1674*/  .word 0x5fa00001
            data_1678:
/*0x1678*/  .word 0x40068000


            .thumb_func
            generate:
/*0x167c*/      push {r4, r5, r6, lr}
/*0x167e*/      movs r1, #0
            jump_1680:
/*0x1680*/      strb r1, [r0], #1
/*0x1684*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1686*/      cmp r1, #0xff
/*0x1688*/      bls jump_1680
/*0x168a*/      movs r3, #0
/*0x168c*/      ldr r5, [pc, #0x28] /* data_16b8 */
/*0x168e*/      mov r2, r3
/*0x1690*/      mov r1, r3
/*0x1692*/      sub.w r0, r0, #0x100
            jump_1696:
/*0x1696*/      ldrb r6, [r5, r2]
/*0x1698*/      ldrb r4, [r0, r1]
/*0x169a*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x169c*/      add r3, r4
/*0x169e*/      add r3, r6
/*0x16a0*/      uxtb r3, r3
/*0x16a2*/      uxtb r2, r2
/*0x16a4*/      ldrb r6, [r0, r3]
/*0x16a6*/      strb r6, [r0, r1]
/*0x16a8*/      strb r4, [r0, r3]
/*0x16aa*/      cmp r2, #8
/*0x16ac*/      blo jump_16b0
/*0x16ae*/      movs r2, #0
            jump_16b0:
/*0x16b0*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x16b2*/      cmp r1, #0xff
/*0x16b4*/      bls jump_1696
/*0x16b6*/      pop {r4, r5, r6, pc}

            data_16b8:
/*0x16b8*/  .word 0x00001f9c /* possible pointer */


            .thumb_func
            firmware_check:
/*0x16bc*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x16c0*/      mov r6, r0
/*0x16c2*/      movw r0, #0x3bf8
/*0x16c6*/      mov r5, r1
/*0x16c8*/      ldr r0, [r0]
/*0x16ca*/      ldr r1, [pc, #0xbc] /* data_1788 */
/*0x16cc*/      sub sp, #0x104
/*0x16ce*/      mov sb, r2
/*0x16d0*/      cmp r0, r1
/*0x16d2*/      bne jump_16de
/*0x16d4*/      movw r0, #0x3bfc
/*0x16d8*/      ldrb r0, [r0]
/*0x16da*/      cmp r0, #1
/*0x16dc*/      beq jump_16e6
            jump_16de:
/*0x16de*/      movs r0, #0
            jump_16e0:
/*0x16e0*/      add sp, #0x104
/*0x16e2*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_16e6:
/*0x16e6*/      ldr.w sl, [pc, #0xa4] /* data_178c */
/*0x16ea*/      mov.w r8, #0
/*0x16ee*/      movw fp, #0x3bff
/*0x16f2*/      cmp.w sb, #0
/*0x16f6*/      beq jump_1772
/*0x16f8*/      movs r1, #0
/*0x16fa*/      mov.w r0, #0x2000
/*0x16fe*/      movs r3, #1
/*0x1700*/      mov r2, r1
/*0x1702*/      bl ckcu_clocks_enable
/*0x1706*/      mov.w r1, #-1
/*0x170a*/      str.w r1, [sl, #4]
/*0x170e*/      movs r1, #0xe6
/*0x1710*/      str.w r1, [sl]
/*0x1714*/      b jump_1772
            jump_1716:
/*0x1716*/      ldrb.w r0, [fp]
/*0x171a*/      cmp r0, r5
/*0x171c*/      bls jump_1720
/*0x171e*/      mov r0, r5
            jump_1720:
/*0x1720*/      uxtb r4, r0
/*0x1722*/      subs r5, r5, r4
/*0x1724*/      mov r0, sp
/*0x1726*/      bl generate
/*0x172a*/      movs r1, #0
/*0x172c*/      mov r0, r1
/*0x172e*/      b jump_176c
            jump_1730:
/*0x1730*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1732*/      uxtb r1, r1
/*0x1734*/      ldrb.w r2, [sp, r1]
/*0x1738*/      add r0, r2
/*0x173a*/      uxtb r0, r0
/*0x173c*/      ldrb.w ip, [sp, r0]
/*0x1740*/      strb.w ip, [sp, r1]
/*0x1744*/      strb.w r2, [sp, r0]
/*0x1748*/      add r2, ip
/*0x174a*/      uxtb r2, r2
/*0x174c*/      ldrb r7, [r6]
/*0x174e*/      ldrb.w r2, [sp, r2]
/*0x1752*/      eors r7, r2
/*0x1754*/      cmp.w sb, #0
/*0x1758*/      beq jump_1760
/*0x175a*/      strb.w r7, [sl, #0xc]
/*0x175e*/      b jump_176a
            jump_1760:
/*0x1760*/      subs r2, r1, #1
/*0x1762*/      lsls r2, r2, #0x1e
/*0x1764*/      lsrs r2, r2, #0x1b
/*0x1766*/      lsls r7, r2
/*0x1768*/      add r8, r7
            jump_176a:
/*0x176a*/      .short 0x1c76 /* adds r6, r6, #1 */ 
            jump_176c:
/*0x176c*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x176e*/      uxtb r4, r4
/*0x1770*/      bhs jump_1730
            jump_1772:
/*0x1772*/      cmp r5, #0
/*0x1774*/      bne jump_1716
/*0x1776*/      cmp.w sb, #0
/*0x177a*/      beq jump_1782
/*0x177c*/      ldr.w r0, [sl, #8]
/*0x1780*/      b jump_16e0
            jump_1782:
/*0x1782*/      mov r0, r8
/*0x1784*/      b jump_16e0

/*0x1786*/  .byte 0x00
/*0x1787*/  .byte 0x00

            data_1788:
/*0x1788*/  .word 0x03045040
            data_178c:
/*0x178c*/  .word 0x4008a000


            .thumb_func
            call_1790:
/*0x1790*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1794*/      ldr r4, [pc, #0xa0] /* data_1838 */
/*0x1796*/      ldr r5, [pc, #0xa4] /* data_183c */
/*0x1798*/      ldr.w r8, [pc, #0xa4] /* data_1840 */
/*0x179c*/      ldr r7, [pc, #0xa4] /* data_1844 */
/*0x179e*/      movs r6, #7
            jump_17a0:
/*0x17a0*/      ldrd r0, r1, [r5]
/*0x17a4*/      str r1, [r0, #0x28]
/*0x17a6*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x17a8*/      uxtb r6, r6
/*0x17aa*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x17ac*/      nop 
/*0x17ae*/      nop 
/*0x17b0*/      movs r0, #0xff
/*0x17b2*/      ldr r1, [r7, #0x1c]
/*0x17b4*/      lsls r1, r1, #0x16
/*0x17b6*/      bmi jump_17ba
/*0x17b8*/      movs r0, #0xfe
            jump_17ba:
/*0x17ba*/      ldr.w r2, [r8, #0x1c]
/*0x17be*/      mov r1, r8
/*0x17c0*/      lsls r2, r2, #0x1a
/*0x17c2*/      bmi jump_17c8
/*0x17c4*/      bic r0, r0, #2
            jump_17c8:
/*0x17c8*/      ldr r2, [r1, #0x1c]
/*0x17ca*/      lsls r2, r2, #0x19
/*0x17cc*/      bmi jump_17d2
/*0x17ce*/      bic r0, r0, #4
            jump_17d2:
/*0x17d2*/      ldr r1, [r1, #0x1c]
/*0x17d4*/      lsls r1, r1, #0x18
/*0x17d6*/      bmi jump_17dc
/*0x17d8*/      bic r0, r0, #8
            jump_17dc:
/*0x17dc*/      ldr r1, [r7, #0x1c]
/*0x17de*/      lsls r1, r1, #0x14
/*0x17e0*/      bmi jump_17e6
/*0x17e2*/      bic r0, r0, #0x10
            jump_17e6:
/*0x17e6*/      ldr r1, [r7, #0x1c]
/*0x17e8*/      lsls r1, r1, #0x12
/*0x17ea*/      bmi jump_17f0
/*0x17ec*/      bic r0, r0, #0x20
            jump_17f0:
/*0x17f0*/      ldr r1, [r7, #0x1c]
/*0x17f2*/      lsls r1, r1, #0x11
/*0x17f4*/      bmi jump_17fa
/*0x17f6*/      bic r0, r0, #0x40
            jump_17fa:
/*0x17fa*/      ldr r1, [r7, #0x1c]
/*0x17fc*/      lsls r1, r1, #0x10
/*0x17fe*/      bmi jump_1804
/*0x1800*/      bic r0, r0, #0x80
            jump_1804:
/*0x1804*/      ldrd r1, r2, [r5]
/*0x1808*/      str r2, [r1, #0x24]
/*0x180a*/      ldrb r1, [r4, #1]
/*0x180c*/      cmp r1, r0
/*0x180e*/      beq jump_1816
/*0x1810*/      strb r0, [r4, #1]
/*0x1812*/      movs r0, #3
/*0x1814*/      b jump_1822
            jump_1816:
/*0x1816*/      ldrb r0, [r4]
/*0x1818*/      cbz r0, jump_1824
/*0x181a*/      cmp r0, #1
/*0x181c*/      bne jump_1820
/*0x181e*/      strb r1, [r4, #2]
            jump_1820:
/*0x1820*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_1822:
/*0x1822*/      strb r0, [r4]
            jump_1824:
/*0x1824*/      cmp r6, #0
/*0x1826*/      beq jump_1832
/*0x1828*/      movs r0, #5
/*0x182a*/      bl call_102
/*0x182e*/      subs r5, #8
/*0x1830*/      b jump_17a0
            jump_1832:
/*0x1832*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x1836*/  .byte 0x00
/*0x1837*/  .byte 0x00

            data_1838:
/*0x1838*/  .word 0x200000d9
            data_183c:
/*0x183c*/  .word 0x00002094 /* possible pointer */
            data_1840:
/*0x1840*/  .word 0x400b0000
            data_1844:
/*0x1844*/  .word 0x400b4000

            jump_1848:
/*0x1848*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x184a*/      ldr r0, [pc, #0x44] /* data_1890 */
/*0x184c*/      ldr r0, [r0]
/*0x184e*/      ldr r1, [pc, #0x44] /* data_1894 */
/*0x1850*/      ldr r6, [pc, #0x44] /* data_1898 */
/*0x1852*/      udiv r4, r0, r1
/*0x1856*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x1858*/      strh.w r4, [sp]
/*0x185c*/      movs r5, #0
/*0x185e*/      strh.w r5, [sp, #2]
/*0x1862*/      mov r1, sp
/*0x1864*/      mov r0, r6
/*0x1866*/      bl call_4d8
/*0x186a*/      strb.w r5, [sp]
/*0x186e*/      movs r0, #7
/*0x1870*/      strh.w r0, [sp, #2]
/*0x1874*/      movs r0, #1
/*0x1876*/      strb.w r0, [sp, #4]
/*0x187a*/      strb.w r5, [sp, #5]
/*0x187e*/      lsrs r0, r4, #1
/*0x1880*/      strh.w r0, [sp, #6]
/*0x1884*/      mov r1, sp
/*0x1886*/      mov r0, r6
/*0x1888*/      bl call_480
/*0x188c*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x188e*/  .byte 0x00
/*0x188f*/  .byte 0x00

            data_1890:
/*0x1890*/  .word 0x20000018
            data_1894:
/*0x1894*/  .word 0x00dbba00
            data_1898:
/*0x1898*/  .word 0x4006f000


            .thumb_func
            call_189c:
/*0x189c*/      push {r4, lr}
/*0x189e*/      ldr r1, [pc, #0x28] /* data_18c8 */
/*0x18a0*/      mov.w r4, #0x8000
/*0x18a4*/      str r4, [r1, #0x28]
/*0x18a6*/      nop 
/*0x18a8*/      nop 
/*0x18aa*/      str r4, [r1, #0x24]
/*0x18ac*/      mov.w r2, #0x4000
/*0x18b0*/      b jump_18bc
            jump_18b2:
/*0x18b2*/      str r2, [r1, #0x28]
/*0x18b4*/      nop 
/*0x18b6*/      nop 
/*0x18b8*/      str r2, [r1, #0x24]
/*0x18ba*/      nop 
            jump_18bc:
/*0x18bc*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x18be*/      uxtb r0, r0
/*0x18c0*/      bhs jump_18b2
/*0x18c2*/      str r4, [r1, #0x28]
/*0x18c4*/      pop {r4, pc}

/*0x18c6*/  .byte 0x00
/*0x18c7*/  .byte 0x00

            data_18c8:
/*0x18c8*/  .word 0x400b0000


            .thumb_func
            call_18cc:
/*0x18cc*/      push {r4, r5, r6, lr}
/*0x18ce*/      mov.w r4, #0x100
/*0x18d2*/      lsls r3, r4, #6
/*0x18d4*/      ldr r2, [pc, #0x20] /* data_18f8 */
/*0x18d6*/      movw r5, #0xffff
/*0x18da*/      b jump_18f0
            jump_18dc:
/*0x18dc*/      nop 
/*0x18de*/      str r3, [r2, #0x28]
/*0x18e0*/      lsls r6, r0, #0x10
/*0x18e2*/      bpl jump_18e8
/*0x18e4*/      str r4, [r2, #0x24]
/*0x18e6*/      b jump_18ea
            jump_18e8:
/*0x18e8*/      str r4, [r2, #0x28]
            jump_18ea:
/*0x18ea*/      str r3, [r2, #0x24]
/*0x18ec*/      and.w r0, r5, r0, lsl #1
            jump_18f0:
/*0x18f0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x18f2*/      uxtb r1, r1
/*0x18f4*/      bhs jump_18dc
/*0x18f6*/      pop {r4, r5, r6, pc}

            data_18f8:
/*0x18f8*/  .word 0x400b0000


            .thumb_func
            function_18fc:
/*0x18fc*/      movs r1, #1
/*0x18fe*/      lsls r1, r0
/*0x1900*/      ldr r0, [pc, #8] /* data_190c */
/*0x1902*/      ldrb r2, [r0, #5]
/*0x1904*/      orrs r1, r2
/*0x1906*/      strb r1, [r0, #5]
/*0x1908*/      bx lr

/*0x190a*/  .byte 0x00
/*0x190b*/  .byte 0x00

            data_190c:
/*0x190c*/  .word 0x2000001c


            .thumb_func
            call_1910:
/*0x1910*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1914*/      ldr r0, [pc, #0xcc] /* data_19e4 */
/*0x1916*/      ldrb r1, [r0]
/*0x1918*/      movs r4, #0
/*0x191a*/      sub.w r5, r0, #0xa
/*0x191e*/      cmp r1, #1
/*0x1920*/      bne jump_192e
/*0x1922*/      strb r4, [r0]
/*0x1924*/      ldrb r0, [r5, #0x10]
/*0x1926*/      and r0, r0, #7
/*0x192a*/      bl call_3ee
            jump_192e:
/*0x192e*/      ldr r6, [pc, #0xb8] /* data_19e8 */
/*0x1930*/      ldr r7, [pc, #0xb8] /* data_19ec */
/*0x1932*/      ldrb r0, [r6]
/*0x1934*/      cbz r0, jump_1942
/*0x1936*/      cmp r0, #2
/*0x1938*/      beq jump_196c
/*0x193a*/      cmp r0, #4
/*0x193c*/      beq jump_1942
/*0x193e*/      cmp r0, #5
/*0x1940*/      bne jump_197e
            jump_1942:
/*0x1942*/      ldrb r0, [r5, #5]
/*0x1944*/      lsls r0, r0, #0x1b
/*0x1946*/      bpl jump_197e
/*0x1948*/      movs r0, #1
/*0x194a*/      strb r0, [r6]
/*0x194c*/      movs r2, #0x40
/*0x194e*/      ldr r1, [pc, #0xa0] /* data_19f0 */
/*0x1950*/      movs r0, #4
/*0x1952*/      bl call_13f0
/*0x1956*/      ldr r2, [pc, #0x98] /* data_19f0 */
/*0x1958*/      rsb.w r1, r0, #0x40
/*0x195c*/      add r0, r2
/*0x195e*/      bl mem_zero
/*0x1962*/      ldrb r0, [r5, #5]
/*0x1964*/      bic r0, r0, #0x10
/*0x1968*/      strb r0, [r5, #5]
/*0x196a*/      b jump_197e
            jump_196c:
/*0x196c*/      ldr r0, [r7, #0x50]
/*0x196e*/      lsls r0, r0, #0x1e
/*0x1970*/      bpl jump_197e
/*0x1972*/      movs r2, #0x40
/*0x1974*/      ldr r1, [pc, #0x78] /* data_19f0 */
/*0x1976*/      movs r0, #3
/*0x1978*/      bl call_1450
/*0x197c*/      strb r4, [r6]
            jump_197e:
/*0x197e*/      ldr r0, [r7, #0x28]
/*0x1980*/      lsls r0, r0, #0x1e
/*0x1982*/      bpl jump_19b4
/*0x1984*/      ldrb r0, [r5]
/*0x1986*/      cbz r0, jump_198c
/*0x1988*/      strb r4, [r5]
/*0x198a*/      b jump_19a8
            jump_198c:
/*0x198c*/      ldr r1, [pc, #0x64] /* data_19f4 */
/*0x198e*/      ldr r0, [r1]
/*0x1990*/      cbnz r0, jump_19b4
/*0x1992*/      add.w r0, r1, #0xc
/*0x1996*/      ldr r0, [r0]
/*0x1998*/      cbz r0, jump_19b4
/*0x199a*/      mov.w r2, #0xfa0
/*0x199e*/      muls r0, r2, r0
/*0x19a0*/      asrs r2, r2, #3
/*0x19a2*/      udiv r0, r0, r2
/*0x19a6*/      str r0, [r1]
            jump_19a8:
/*0x19a8*/      ldr r1, [pc, #0x38] /* data_19e4 */
/*0x19aa*/      movs r2, #8
/*0x19ac*/      adds r1, #0x12
/*0x19ae*/      movs r0, #1
/*0x19b0*/      bl call_1450
            jump_19b4:
/*0x19b4*/      ldr r0, [r7, #0x3c]
/*0x19b6*/      lsls r0, r0, #0x1e
/*0x19b8*/      bpl jump_19e0
/*0x19ba*/      ldrb r0, [r5, #2]
/*0x19bc*/      cbz r0, jump_19c8
/*0x19be*/      ldr r1, [pc, #0x24] /* data_19e4 */
/*0x19c0*/      movs r2, #5
/*0x19c2*/      strb r4, [r5, #2]
/*0x19c4*/      adds r1, #0xa
/*0x19c6*/      b jump_19d6
            jump_19c8:
/*0x19c8*/      ldrb r0, [r5, #1]
/*0x19ca*/      cmp r0, #0
/*0x19cc*/      beq jump_19e0
/*0x19ce*/      ldr r1, [pc, #0x14] /* data_19e4 */
/*0x19d0*/      movs r2, #2
/*0x19d2*/      strb r4, [r5, #1]
/*0x19d4*/      .short 0x1e89 /* subs r1, r1, #2 */ 
            jump_19d6:
/*0x19d6*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x19da*/      movs r0, #2
/*0x19dc*/      b.w call_1450
            jump_19e0:
/*0x19e0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_19e4:
/*0x19e4*/  .word 0x20000026
            data_19e8:
/*0x19e8*/  .word 0x20000004
            data_19ec:
/*0x19ec*/  .word 0x400a8000
            data_19f0:
/*0x19f0*/  .word 0x20000084
            data_19f4:
/*0x19f4*/  .word 0x200002dc


            .thumb_func
            function_19f8:
/*0x19f8*/      push {r4, r5, r6, r7, lr}
/*0x19fa*/      ldrh r1, [r0]
/*0x19fc*/      mov.w r6, #0x100
/*0x1a00*/      movw r5, #0x921
/*0x1a04*/      lsls r7, r6, #1
/*0x1a06*/      movs r2, #1
/*0x1a08*/      ldr r4, [pc, #0xc8] /* data_1ad4 */
/*0x1a0a*/      subw r3, r1, #0x921
/*0x1a0e*/      cmp r1, r5
/*0x1a10*/      beq jump_1a82
/*0x1a12*/      bgt jump_1a30
/*0x1a14*/      adds.w r1, r3, #0x780
/*0x1a18*/      beq jump_1a42
/*0x1a1a*/      cmp r1, r6
/*0x1a1c*/      beq jump_1a76
/*0x1a1e*/      cmp r1, r7
/*0x1a20*/      bne jump_1aa4
/*0x1a22*/      ldrh r1, [r0, #4]
/*0x1a24*/      cmp r1, #0
/*0x1a26*/      bne jump_1aa4
/*0x1a28*/      ldr r1, [pc, #0xac] /* data_1ad8 */
/*0x1a2a*/      strd r1, r2, [r0, #0x1c]
/*0x1a2e*/      b jump_1ace
            jump_1a30:
/*0x1a30*/      movs r5, #0
/*0x1a32*/      cmp r3, r6
/*0x1a34*/      beq jump_1aa8
/*0x1a36*/      cmp r3, r7
/*0x1a38*/      bne jump_1aa4
/*0x1a3a*/      ldrh r3, [r0, #4]
/*0x1a3c*/      ldrb r1, [r0, #2]
/*0x1a3e*/      cbz r3, jump_1aa6
/*0x1a40*/      b jump_1acc
            jump_1a42:
/*0x1a42*/      ldrb r5, [r0, #3]
/*0x1a44*/      ldrb r3, [r0, #2]
/*0x1a46*/      ldrh r4, [r0, #6]
/*0x1a48*/      ldrh r1, [r0, #4]
/*0x1a4a*/      cmp r5, #1
/*0x1a4c*/      bne jump_1aa4
/*0x1a4e*/      cbz r1, jump_1a66
/*0x1a50*/      cmp r1, #1
/*0x1a52*/      beq jump_1aa4
/*0x1a54*/      cmp r1, #2
/*0x1a56*/      bne jump_1aa4
/*0x1a58*/      cmp r3, #1
/*0x1a5a*/      beq jump_1a6c
/*0x1a5c*/      cmp r3, #2
/*0x1a5e*/      bne jump_1aa4
/*0x1a60*/      ldr r1, [pc, #0x74] /* data_1ad8 */
/*0x1a62*/      adds r1, #0x11
/*0x1a64*/      b jump_1a70
            jump_1a66:
/*0x1a66*/      ldr r1, [pc, #0x70] /* data_1ad8 */
/*0x1a68*/      adds r1, #0x19
/*0x1a6a*/      b jump_1a70
            jump_1a6c:
/*0x1a6c*/      ldr r1, [pc, #0x68] /* data_1ad8 */
/*0x1a6e*/      .short 0x1d49 /* adds r1, r1, #5 */ 
            jump_1a70:
/*0x1a70*/      strd r1, r4, [r0, #0x1c]
/*0x1a74*/      b jump_1ace
            jump_1a76:
/*0x1a76*/      ldrh r1, [r0, #4]
/*0x1a78*/      cmp r1, #0
/*0x1a7a*/      bne jump_1aa4
/*0x1a7c*/      strd r4, r2, [r0, #0x1c]
/*0x1a80*/      b jump_1ace
            jump_1a82:
/*0x1a82*/      ldrb r2, [r0, #3]
/*0x1a84*/      ldrh r3, [r0, #6]
/*0x1a86*/      ldrh r1, [r0, #4]
/*0x1a88*/      str r3, [r0, #0x20]
/*0x1a8a*/      cmp r2, #2
/*0x1a8c*/      bne jump_1aa4
/*0x1a8e*/      cmp r1, #0
/*0x1a90*/      bne jump_1aa4
/*0x1a92*/      ldr r2, [pc, #0x44] /* data_1ad8 */
/*0x1a94*/      adds r2, #0xd
/*0x1a96*/      str r2, [r0, #0x1c]
/*0x1a98*/      ldr r2, [pc, #0x40] /* data_1adc */
/*0x1a9a*/      strd r2, r1, [r0, #0x28]
/*0x1a9e*/      movs r1, #2
/*0x1aa0*/      strb.w r1, [r0, #0x24]
            jump_1aa4:
/*0x1aa4*/      pop {r4, r5, r6, r7, pc}
            jump_1aa6:
/*0x1aa6*/      b jump_1ac6
            jump_1aa8:
/*0x1aa8*/      ldrh r3, [r0, #4]
/*0x1aaa*/      ldrb r1, [r0, #3]
/*0x1aac*/      cmp r3, #0
/*0x1aae*/      bne jump_1aa4
/*0x1ab0*/      mov.w r3, #0xfa0
/*0x1ab4*/      str r1, [r4]
/*0x1ab6*/      muls r1, r3, r1
/*0x1ab8*/      asrs r3, r3, #3
/*0x1aba*/      udiv r1, r1, r3
/*0x1abe*/      ldr r3, [pc, #0x14] /* data_1ad4 */
/*0x1ac0*/      subs r3, #0xc
/*0x1ac2*/      str r1, [r3]
/*0x1ac4*/      b jump_1acc
            jump_1ac6:
/*0x1ac6*/      ldr r3, [pc, #0x10] /* data_1ad8 */
/*0x1ac8*/      .short 0x1edb /* subs r3, r3, #3 */ 
/*0x1aca*/      strb r1, [r3, #3]
            jump_1acc:
/*0x1acc*/      str r5, [r0, #0x20]
            jump_1ace:
/*0x1ace*/      strb.w r2, [r0, #0x24]
/*0x1ad2*/      b jump_1aa4

            data_1ad4:
/*0x1ad4*/  .word 0x200002e8
            data_1ad8:
/*0x1ad8*/  .word 0x2000001f
            data_1adc:
/*0x1adc*/  .word 0x00001ae1 /* possible pointer */


            .thumb_func
            function_1ae0:
/*0x1ae0*/      ldr r2, [pc, #4] /* data_1ae8 */
/*0x1ae2*/      movs r1, #1
/*0x1ae4*/      strb r1, [r2, r0]
/*0x1ae6*/      bx lr

            data_1ae8:
/*0x1ae8*/  .word 0x20000026


            .thumb_func
            function_1aec:
/*0x1aec*/      ldrb r2, [r0, #3]
/*0x1aee*/      ldrh r1, [r0, #4]
/*0x1af0*/      movs r3, #1
/*0x1af2*/      cmp r2, #0x21
/*0x1af4*/      beq jump_1b06
/*0x1af6*/      cmp r2, #0x22
/*0x1af8*/      bne jump_1b3e
/*0x1afa*/      cbz r1, jump_1b28
/*0x1afc*/      cmp r1, #1
/*0x1afe*/      beq jump_1b30
/*0x1b00*/      cmp r1, #2
/*0x1b02*/      bne jump_1b3a
/*0x1b04*/      b jump_1b40
            jump_1b06:
/*0x1b06*/      cbz r1, jump_1b12
/*0x1b08*/      cmp r1, #1
/*0x1b0a*/      beq jump_1b18
/*0x1b0c*/      cmp r1, #2
/*0x1b0e*/      bne jump_1b1e
/*0x1b10*/      b jump_1b22
            jump_1b12:
/*0x1b12*/      ldr r1, [r0, #0xc]
/*0x1b14*/      adds r1, #0x12
/*0x1b16*/      b jump_1b1c
            jump_1b18:
/*0x1b18*/      ldr r1, [r0, #0xc]
/*0x1b1a*/      adds r1, #0x2b
            jump_1b1c:
/*0x1b1c*/      str r1, [r0, #0x1c]
            jump_1b1e:
/*0x1b1e*/      movs r1, #9
/*0x1b20*/      b jump_1b38
            jump_1b22:
/*0x1b22*/      ldr r1, [r0, #0xc]
/*0x1b24*/      adds r1, #0x4b
/*0x1b26*/      b jump_1b1c
            jump_1b28:
/*0x1b28*/      ldr r1, [pc, #0x20] /* data_1b4c */
/*0x1b2a*/      str r1, [r0, #0x1c]
/*0x1b2c*/      movs r1, #0x40
/*0x1b2e*/      b jump_1b38
            jump_1b30:
/*0x1b30*/      ldr r1, [pc, #0x18] /* data_1b4c */
/*0x1b32*/      subs r1, #0x8c
/*0x1b34*/      str r1, [r0, #0x1c]
/*0x1b36*/      movs r1, #0x22
            jump_1b38:
/*0x1b38*/      str r1, [r0, #0x20]
            jump_1b3a:
/*0x1b3a*/      strb.w r3, [r0, #0x24]
            jump_1b3e:
/*0x1b3e*/      bx lr
            jump_1b40:
/*0x1b40*/      ldr r1, [pc, #8] /* data_1b4c */
/*0x1b42*/      subs r1, #0x68
/*0x1b44*/      str r1, [r0, #0x1c]
/*0x1b46*/      movs r1, #0x65
/*0x1b48*/      b jump_1b38

/*0x1b4a*/  .byte 0x00
/*0x1b4b*/  .byte 0x00

            data_1b4c:
/*0x1b4c*/  .word 0x00002150 /* possible pointer */


            .thumb_func
            call_1b50:
/*0x1b50*/      push {r4, r5, r6, lr}
/*0x1b52*/      mov r4, r0
/*0x1b54*/      movs r0, #0
/*0x1b56*/      bl call_1348
/*0x1b5a*/      mov r5, r0
/*0x1b5c*/      ldr r0, [r4, #0x20]
/*0x1b5e*/      adds r1, r0, #1
/*0x1b60*/      beq jump_1b90
/*0x1b62*/      ldrb.w r1, [r4, #0x24]
/*0x1b66*/      cmp r1, #1
/*0x1b68*/      bne jump_1b90
/*0x1b6a*/      cmp r0, r5
/*0x1b6c*/      blo jump_1b74
/*0x1b6e*/      subs r0, r0, r5
/*0x1b70*/      str r0, [r4, #0x20]
/*0x1b72*/      b jump_1b80
            jump_1b74:
/*0x1b74*/      mov r5, r0
/*0x1b76*/      movs r0, #0
/*0x1b78*/      str r0, [r4, #0x20]
/*0x1b7a*/      movs r0, #2
/*0x1b7c*/      strb.w r0, [r4, #0x24]
            jump_1b80:
/*0x1b80*/      mov r2, r5
/*0x1b82*/      movs r0, #0
/*0x1b84*/      ldr r1, [r4, #0x1c]
/*0x1b86*/      bl call_1450
/*0x1b8a*/      ldr r0, [r4, #0x1c]
/*0x1b8c*/      add r0, r5
/*0x1b8e*/      str r0, [r4, #0x1c]
            jump_1b90:
/*0x1b90*/      pop {r4, r5, r6, pc}

/*0x1b92*/  .byte 0x00
/*0x1b93*/  .byte 0x00


            .thumb_func
            call_1b94:
/*0x1b94*/      push {r4, lr}
/*0x1b96*/      mov r4, r0
/*0x1b98*/      movs r0, #0
/*0x1b9a*/      strb.w r0, [r4, #0x24]
/*0x1b9e*/      str r0, [r4, #0x20]
/*0x1ba0*/      ldrb r0, [r4]
/*0x1ba2*/      ands r0, r0, #0x60
/*0x1ba6*/      beq jump_1bae
/*0x1ba8*/      cmp r0, #0x20
/*0x1baa*/      bne jump_1bc0
/*0x1bac*/      b jump_1bb6
            jump_1bae:
/*0x1bae*/      mov r0, r4
/*0x1bb0*/      bl call_1c34
/*0x1bb4*/      b jump_1bc0
            jump_1bb6:
/*0x1bb6*/      ldr r0, [pc, #0x40] /* data_1bf8 */
/*0x1bb8*/      ldr r1, [r0, #0x14]
/*0x1bba*/      cbz r1, jump_1bc0
/*0x1bbc*/      mov r0, r4
/*0x1bbe*/      blx r1
            jump_1bc0:
/*0x1bc0*/      ldrb.w r0, [r4, #0x24]
/*0x1bc4*/      cmp r0, #1
/*0x1bc6*/      beq jump_1bd6
/*0x1bc8*/      cmp r0, #2
/*0x1bca*/      beq jump_1bea
/*0x1bcc*/      pop.w {r4, lr}
/*0x1bd0*/      movs r0, #0
/*0x1bd2*/      b.w jump_1430
            jump_1bd6:
/*0x1bd6*/      ldrh r0, [r4, #6]
/*0x1bd8*/      ldr r1, [r4, #0x20]
/*0x1bda*/      cmp r1, r0
/*0x1bdc*/      ble jump_1be0
/*0x1bde*/      str r0, [r4, #0x20]
            jump_1be0:
/*0x1be0*/      mov r0, r4
/*0x1be2*/      pop.w {r4, lr}
/*0x1be6*/      b.w call_1b50
            jump_1bea:
/*0x1bea*/      movs r2, #0
/*0x1bec*/      pop.w {r4, lr}
/*0x1bf0*/      mov r1, r2
/*0x1bf2*/      mov r0, r2
/*0x1bf4*/      b.w call_1450

            data_1bf8:
/*0x1bf8*/  .word 0x0000221c /* possible pointer */

            jump_1bfc:
/*0x1bfc*/      push {r4, lr}
/*0x1bfe*/      mov r4, r0
/*0x1c00*/      movs r0, #0
/*0x1c02*/      strb r0, [r4, #0x19]
/*0x1c04*/      cbz r1, jump_1c1a
/*0x1c06*/      cmp r1, #1
/*0x1c08*/      beq jump_1c1e
/*0x1c0a*/      cmp r1, #2
/*0x1c0c*/      bne jump_1c30
/*0x1c0e*/      ldrb r0, [r4, #4]
/*0x1c10*/      and r0, r0, #0xf
/*0x1c14*/      bl call_1356
/*0x1c18*/      b jump_1c1e
            jump_1c1a:
/*0x1c1a*/      ldrb.w r0, [r4, #0x34]
            jump_1c1e:
/*0x1c1e*/      strb r0, [r4, #0x18]
/*0x1c20*/      add.w r0, r4, #0x18
/*0x1c24*/      str r0, [r4, #0x1c]
/*0x1c26*/      movs r0, #2
/*0x1c28*/      str r0, [r4, #0x20]
/*0x1c2a*/      movs r0, #1
/*0x1c2c*/      strb.w r0, [r4, #0x24]
            jump_1c30:
/*0x1c30*/      pop {r4, pc}

/*0x1c32*/  .byte 0x00
/*0x1c33*/  .byte 0x00


            .thumb_func
            call_1c34:
/*0x1c34*/      push {r4, r5, r6, lr}
/*0x1c36*/      mov r4, r0
/*0x1c38*/      ldrh r0, [r0]
/*0x1c3a*/      movs r5, #1
/*0x1c3c*/      cmp.w r0, #0x500
/*0x1c40*/      beq jump_1ce2
/*0x1c42*/      bgt jump_1c86
/*0x1c44*/      cmp.w r0, #0x100
/*0x1c48*/      beq jump_1cd4
/*0x1c4a*/      bgt jump_1c64
/*0x1c4c*/      cmp r0, #0x80
/*0x1c4e*/      beq jump_1ccc
/*0x1c50*/      cmp r0, #0x81
/*0x1c52*/      beq jump_1cd0
/*0x1c54*/      cmp r0, #0x82
/*0x1c56*/      bne jump_1d26
/*0x1c58*/      movs r1, #2
            jump_1c5a:
/*0x1c5a*/      mov r0, r4
/*0x1c5c*/      pop.w {r4, r5, r6, lr}
/*0x1c60*/      b.w jump_1bfc
            jump_1c64:
/*0x1c64*/      cmp.w r0, #0x102
/*0x1c68*/      beq jump_1cd8
/*0x1c6a*/      cmp.w r0, #0x300
/*0x1c6e*/      beq jump_1cdc
/*0x1c70*/      sub.w r0, r0, #0x300
/*0x1c74*/      subs r0, #2
/*0x1c76*/      bne jump_1d26
/*0x1c78*/      movs r2, #1
            jump_1c7a:
/*0x1c7a*/      movs r1, #2
            jump_1c7c:
/*0x1c7c*/      mov r0, r4
/*0x1c7e*/      pop.w {r4, r5, r6, lr}
/*0x1c82*/      b.w jump_1d5c
            jump_1c86:
/*0x1c86*/      ldr r1, [pc, #0xcc] /* data_1d54 */
/*0x1c88*/      cmp.w r0, #0x900
/*0x1c8c*/      beq jump_1d2c
/*0x1c8e*/      bgt jump_1cb0
/*0x1c90*/      cmp.w r0, #0x680
/*0x1c94*/      beq jump_1cf0
/*0x1c96*/      sub.w r0, r0, #0x600
/*0x1c9a*/      subs r0, #0x81
/*0x1c9c*/      beq jump_1d28
/*0x1c9e*/      sub.w r0, r0, #0x100
/*0x1ca2*/      subs r0, #0xff
/*0x1ca4*/      bne jump_1d26
/*0x1ca6*/      add.w r0, r4, #0x30
/*0x1caa*/      strd r0, r5, [r4, #0x1c]
/*0x1cae*/      b jump_1d22
            jump_1cb0:
/*0x1cb0*/      sub.w r0, r0, #0xa00
/*0x1cb4*/      subs r0, #0x81
/*0x1cb6*/      beq jump_1d4e
/*0x1cb8*/      cmp r0, #0x80
/*0x1cba*/      bne jump_1d26
/*0x1cbc*/      ldr r0, [r1, #0xc]
            jump_1cbe:
/*0x1cbe*/      cmp r0, #0
/*0x1cc0*/      beq jump_1d26
/*0x1cc2*/      mov r1, r0
/*0x1cc4*/      mov r0, r4
/*0x1cc6*/      pop.w {r4, r5, r6, lr}
/*0x1cca*/      bx r1
            jump_1ccc:
/*0x1ccc*/      movs r1, #0
/*0x1cce*/      b jump_1c5a
            jump_1cd0:
/*0x1cd0*/      movs r1, #1
/*0x1cd2*/      b jump_1c5a
            jump_1cd4:
/*0x1cd4*/      movs r2, #0
/*0x1cd6*/      b jump_1cde
            jump_1cd8:
/*0x1cd8*/      movs r2, #0
/*0x1cda*/      b jump_1c7a
            jump_1cdc:
/*0x1cdc*/      movs r2, #1
            jump_1cde:
/*0x1cde*/      movs r1, #0
/*0x1ce0*/      b jump_1c7c
            jump_1ce2:
/*0x1ce2*/      ldrb r0, [r4, #2]
/*0x1ce4*/      bl call_1628
/*0x1ce8*/      strb.w r5, [r4, #0x24]
/*0x1cec*/      movs r0, #5
/*0x1cee*/      b jump_1d48
            jump_1cf0:
/*0x1cf0*/      ldrb r0, [r4, #3]
/*0x1cf2*/      cmp r0, #1
/*0x1cf4*/      beq jump_1d16
/*0x1cf6*/      cmp r0, #2
/*0x1cf8*/      beq jump_1d1a
/*0x1cfa*/      cmp r0, #3
/*0x1cfc*/      bne jump_1d26
/*0x1cfe*/      ldrb r0, [r4, #2]
/*0x1d00*/      ldr r1, [r4, #0x14]
/*0x1d02*/      cmp r1, r0
/*0x1d04*/      bls jump_1d26
/*0x1d06*/      ldr r1, [r4, #0x10]
/*0x1d08*/      ldr.w r0, [r1, r0, lsl #2]
/*0x1d0c*/      cmp r0, #0
/*0x1d0e*/      beq jump_1d26
            jump_1d10:
/*0x1d10*/      str r0, [r4, #0x1c]
/*0x1d12*/      ldrb r0, [r0]
/*0x1d14*/      b jump_1d20
            jump_1d16:
/*0x1d16*/      ldr r0, [r4, #8]
/*0x1d18*/      b jump_1d10
            jump_1d1a:
/*0x1d1a*/      ldr r0, [r4, #0xc]
/*0x1d1c*/      str r0, [r4, #0x1c]
/*0x1d1e*/      ldrh r0, [r0, #2]
            jump_1d20:
/*0x1d20*/      str r0, [r4, #0x20]
            jump_1d22:
/*0x1d22*/      strb.w r5, [r4, #0x24]
            jump_1d26:
/*0x1d26*/      pop {r4, r5, r6, pc}
            jump_1d28:
/*0x1d28*/      ldr r0, [r1, #8]
/*0x1d2a*/      b jump_1cbe
            jump_1d2c:
/*0x1d2c*/      ldrb r0, [r4, #2]
/*0x1d2e*/      strb.w r0, [r4, #0x30]
/*0x1d32*/      strb.w r5, [r4, #0x24]
/*0x1d36*/      movs r5, #1
            jump_1d38:
/*0x1d38*/      ldr r1, [pc, #0x1c] /* data_1d58 */
/*0x1d3a*/      sxtb r0, r5
/*0x1d3c*/      bl call_1390
/*0x1d40*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x1d42*/      cmp r5, #8
/*0x1d44*/      blo jump_1d38
/*0x1d46*/      movs r0, #6
            jump_1d48:
/*0x1d48*/      strb.w r0, [r4, #0x32]
/*0x1d4c*/      pop {r4, r5, r6, pc}
            jump_1d4e:
/*0x1d4e*/      ldr r0, [r1, #0x10]
/*0x1d50*/      b jump_1cbe

/*0x1d52*/  .byte 0x00
/*0x1d53*/  .byte 0x00

            data_1d54:
/*0x1d54*/  .word 0x0000221c /* possible pointer */
            data_1d58:
/*0x1d58*/  .word 0x20000040

            jump_1d5c:
/*0x1d5c*/      push {r4, r5, r6, lr}
/*0x1d5e*/      mov r4, r0
/*0x1d60*/      movs r6, #1
/*0x1d62*/      cbz r1, jump_1d7e
/*0x1d64*/      cmp r1, #2
/*0x1d66*/      bne jump_1d7c
/*0x1d68*/      ldrb r0, [r4, #4]
/*0x1d6a*/      ands r5, r0, #0xf
/*0x1d6e*/      beq jump_1d78
/*0x1d70*/      cbz r2, jump_1d94
/*0x1d72*/      mov r0, r5
/*0x1d74*/      bl call_143c
            jump_1d78:
/*0x1d78*/      strb.w r6, [r4, #0x24]
            jump_1d7c:
/*0x1d7c*/      pop {r4, r5, r6, pc}
            jump_1d7e:
/*0x1d7e*/      ldrb r0, [r4, #2]
/*0x1d80*/      cmp r0, #1
/*0x1d82*/      bne jump_1d7c
/*0x1d84*/      ldrb r0, [r4, #0x34]!
/*0x1d88*/      bfi r0, r2, #1, #1
/*0x1d8c*/      strb r0, [r4], #-0x10
/*0x1d90*/      strb r6, [r4]
/*0x1d92*/      pop {r4, r5, r6, pc}
            jump_1d94:
/*0x1d94*/      ldr r0, [r4, #0x38]
/*0x1d96*/      cmp r0, #0
/*0x1d98*/      bne jump_1d78
/*0x1d9a*/      mov r0, r5
/*0x1d9c*/      bl call_12f0
/*0x1da0*/      mov r0, r5
/*0x1da2*/      bl call_12e0
/*0x1da6*/      b jump_1d78

            .thumb_func
            call_1da8:
/*0x1da8*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1daa*/      bmi jump_1db6
/*0x1dac*/      ldr.w r3, [r0, r2, lsl #2]
/*0x1db0*/      str.w r3, [r1, r2, lsl #2]
/*0x1db4*/      b call_1da8
            jump_1db6:
/*0x1db6*/      bx lr

            .thumb_func
            call_1db8:
/*0x1db8*/      ldr r1, [pc, #8] /* data_1dc4 */
/*0x1dba*/      add.w r0, r0, r0, lsl #2
/*0x1dbe*/      add.w r0, r1, r0, lsl #2
/*0x1dc2*/      bx lr

            data_1dc4:
/*0x1dc4*/  .word 0x400a8014


            .thumb_func
            call_1dc8:
/*0x1dc8*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1dcc*/      movs r7, #0
/*0x1dce*/      mov.w r1, #0x8000
/*0x1dd2*/      mov r2, r7
/*0x1dd4*/      mov sl, r1
/*0x1dd6*/      movs r3, #1
/*0x1dd8*/      mov r0, r2
/*0x1dda*/      bl ckcu_clocks_enable
/*0x1dde*/      ldr r0, [pc, #0x90] /* data_1e70 */
/*0x1de0*/      bl call_1078
/*0x1de4*/      ldr r5, [pc, #0x8c] /* data_1e74 */
/*0x1de6*/      mov r4, r0
/*0x1de8*/      movw r6, #0xeae0
/*0x1dec*/      cmp r0, #1
/*0x1dee*/      bne jump_1dfe
/*0x1df0*/      ldr r0, [r5, #0x54]
/*0x1df2*/      orrs r0, r6
/*0x1df4*/      str r0, [r5, #0x54]
/*0x1df6*/      str r6, [r5, #0x58]
/*0x1df8*/      ldr r0, [r5, #0x50]
/*0x1dfa*/      orrs r0, r6
/*0x1dfc*/      str r0, [r5, #0x50]
            jump_1dfe:
/*0x1dfe*/      ldr.w r8, [pc, #0x70] /* data_1e70 */
/*0x1e02*/      ldrb.w r0, [r8, #0x32]
/*0x1e06*/      cmp r0, #3
/*0x1e08*/      bne jump_1e48
/*0x1e0a*/      ldr.w sb, [pc, #0x6c] /* data_1e78 */
/*0x1e0e*/      ldr.w r0, [sb]
/*0x1e12*/      tst.w r0, #0xc0
/*0x1e16*/      beq jump_1e48
/*0x1e18*/      movs r0, #1
/*0x1e1a*/      bl call_584
/*0x1e1e*/      ldr r1, [pc, #0x5c] /* data_1e7c */
/*0x1e20*/      strb r7, [r1, #4]
/*0x1e22*/      ldrb.w r0, [r8, #0x32]
/*0x1e26*/      cmp r0, #3
/*0x1e28*/      bne jump_1e48
/*0x1e2a*/      ldr.w r0, [sb]
/*0x1e2e*/      tst.w r0, #0xc0
/*0x1e32*/      beq jump_1e48
/*0x1e34*/      bl call_166c
/*0x1e38*/      mov.w r0, #0x3e8
/*0x1e3c*/      bl call_102
/*0x1e40*/      str r6, [r5, #0x58]
/*0x1e42*/      movs r0, #0
/*0x1e44*/      bl call_748
            jump_1e48:
/*0x1e48*/      ldr r0, [r5, #0x58]
/*0x1e4a*/      tst r0, r6
/*0x1e4c*/      beq jump_1e60
/*0x1e4e*/      cmp r4, #1
/*0x1e50*/      bne jump_1e60
/*0x1e52*/      ldr r0, [pc, #0x1c] /* data_1e70 */
/*0x1e54*/      bl call_1204
/*0x1e58*/      cmp r0, #1
/*0x1e5a*/      bne jump_1e60
/*0x1e5c*/      bl call_1214
            jump_1e60:
/*0x1e60*/      mov r2, r7
/*0x1e62*/      mov r1, sl
/*0x1e64*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1e68*/      movs r3, #0
/*0x1e6a*/      mov r0, r2
/*0x1e6c*/      b.w ckcu_clocks_enable

            data_1e70:
/*0x1e70*/  .word 0x200002f4
            data_1e74:
/*0x1e74*/  .word 0x40024000
            data_1e78:
/*0x1e78*/  .word 0x400a8000
            data_1e7c:
/*0x1e7c*/  .word 0x2000001c


            .thumb_func
            function_1e80:
/*0x1e80*/      b jump_1e88
            jump_1e82:
/*0x1e82*/      ldm r0!, {r3}
/*0x1e84*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x1e86*/      stm r1!, {r3}
            jump_1e88:
/*0x1e88*/      cmp r2, #0
/*0x1e8a*/      bne jump_1e82
/*0x1e8c*/      bx lr

            .thumb_func
            function_1e8e:
/*0x1e8e*/      movs r0, #0
/*0x1e90*/      b jump_1e96
            jump_1e92:
/*0x1e92*/      stm r1!, {r0}
/*0x1e94*/      .short 0x1f12 /* subs r2, r2, #4 */ 
            jump_1e96:
/*0x1e96*/      cmp r2, #0
/*0x1e98*/      bne jump_1e92
/*0x1e9a*/      bx lr

            .thumb_func
            call_1e9c:
/*0x1e9c*/      mov.w r0, #0x3400
/*0x1ea0*/      ldr r1, [r0]
/*0x1ea2*/      sub.w r1, r1, #0x20000000
/*0x1ea6*/      cmp.w r1, #0x4000
/*0x1eaa*/      bhi jump_1ef6
/*0x1eac*/      adds r1, r0, #4
/*0x1eae*/      ldr r1, [r1]
/*0x1eb0*/      sub.w r1, r1, #0x3400
/*0x1eb4*/      cmp.w r1, #0xc800
/*0x1eb8*/      bhs jump_1ef6
/*0x1eba*/      movw r1, #0x3bf8
/*0x1ebe*/      ldr r1, [r1]
/*0x1ec0*/      ldr r2, [pc, #0x34] /* data_1ef8 */
/*0x1ec2*/      cmp r1, r2
/*0x1ec4*/      bne jump_1ef6
/*0x1ec6*/      mov.w r1, #0x3000
/*0x1eca*/      ldr.w r1, [r1, #0xb0]
/*0x1ece*/      ubfx r2, r1, #0, #0x12
/*0x1ed2*/      sub.w r3, r2, #0x5a00
/*0x1ed6*/      subs r3, #0xa5
/*0x1ed8*/      bne jump_1ef6
/*0x1eda*/      lsrs r2, r1, #0x12
/*0x1edc*/      cmp r2, #0xe
/*0x1ede*/      bhi jump_1ef6
/*0x1ee0*/      movw r1, #0x3078
/*0x1ee4*/      b jump_1eee
            jump_1ee6:
/*0x1ee6*/      ldr r3, [r1]
/*0x1ee8*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x1eea*/      beq jump_1ef6
/*0x1eec*/      .short 0x1d09 /* adds r1, r1, #4 */ 
            jump_1eee:
/*0x1eee*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1ef0*/      bhs jump_1ee6
/*0x1ef2*/      b.w load_jump_fw
            jump_1ef6:
/*0x1ef6*/      bx lr

            data_1ef8:
/*0x1ef8*/  .word 0x03045040


            .thumb_func
            main:
/*0x1efc*/      ldr r0, [pc, #0x90] /* data_1f90 */
/*0x1efe*/      ldr r3, [r0]
/*0x1f00*/      ldr r2, [pc, #0x90] /* data_1f94 */
/*0x1f02*/      adds r1, r2, #5
/*0x1f04*/      cmp r3, r2
/*0x1f06*/      blo jump_1f0e
/*0x1f08*/      ldr r3, [r0]
/*0x1f0a*/      cmp r3, r1
/*0x1f0c*/      bls jump_1f12
            jump_1f0e:
/*0x1f0e*/      str r2, [r0]
/*0x1f10*/      b jump_1f1e
            jump_1f12:
/*0x1f12*/      ldr r2, [r0]
/*0x1f14*/      cmp r2, r1
/*0x1f16*/      bhs jump_1f1e
/*0x1f18*/      ldr r2, [r0]
/*0x1f1a*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x1f1c*/      b jump_1f0e
            jump_1f1e:
/*0x1f1e*/      ldr r0, [r0]
/*0x1f20*/      cmp r0, r1
/*0x1f22*/      beq jump_1f28
/*0x1f24*/      bl call_1e9c
            jump_1f28:
/*0x1f28*/      bl call_614
/*0x1f2c*/      bl call_238
/*0x1f30*/      bl call_bf8
/*0x1f34*/      bl call_6f8
/*0x1f38*/      bl call_cec
/*0x1f3c*/      bl call_5f0
/*0x1f40*/      movs r0, #1
/*0x1f42*/      bl call_584
/*0x1f46*/      bl call_1230
/*0x1f4a*/      ldr r4, [pc, #0x4c] /* data_1f98 */
            jump_1f4c:
/*0x1f4c*/      bl call_15b4
/*0x1f50*/      cmp r0, #1
/*0x1f52*/      beq jump_1f64
/*0x1f54*/      cmp r0, #2
/*0x1f56*/      beq jump_1f78
/*0x1f58*/      cmp r0, #3
/*0x1f5a*/      bne jump_1f8a
/*0x1f5c*/      movs r0, #1
/*0x1f5e*/      bl call_584
/*0x1f62*/      b jump_1f8a
            jump_1f64:
/*0x1f64*/      movs r0, #0
/*0x1f66*/      bl call_584
/*0x1f6a*/      bl call_e4c
/*0x1f6e*/      bl call_728
/*0x1f72*/      movs r0, #0
/*0x1f74*/      bl call_ba0
            jump_1f78:
/*0x1f78*/      bl handle_frame
/*0x1f7c*/      bl call_b38
/*0x1f80*/      ldrb r0, [r4]
/*0x1f82*/      cbnz r0, jump_1f8a
/*0x1f84*/      movs r0, #1
/*0x1f86*/      bl call_7d8
            jump_1f8a:
/*0x1f8a*/      bl call_166c
/*0x1f8e*/      b jump_1f4c

            data_1f90:
/*0x1f90*/  .word 0x20003ffc
            data_1f94:
/*0x1f94*/  .word 0x55aafaf0
            data_1f98:
/*0x1f98*/  .word 0x20000004

/*0x1f9c*/  .byte 0x01
/*0x1f9d*/  .byte 0x23
/*0x1f9e*/  .byte 0x45
/*0x1f9f*/  .byte 0x67
/*0x1fa0*/  .byte 0x89
/*0x1fa1*/  .byte 0xab
/*0x1fa2*/  .byte 0xcd
/*0x1fa3*/  .byte 0xef
/*0x1fa4*/  .byte 0x08
/*0x1fa5*/  .byte 0x09
/*0x1fa6*/  .byte 0x0a
/*0x1fa7*/  .byte 0x0b
/*0x1fa8*/  .byte 0x0c
/*0x1fa9*/  .byte 0x0d
/*0x1faa*/  .byte 0x0e
/*0x1fab*/  .byte 0x0f
/*0x1fac*/  .byte 0x10
/*0x1fad*/  .byte 0x11
/*0x1fae*/  .byte 0x12
/*0x1faf*/  .byte 0x13
/*0x1fb0*/  .byte 0x14
/*0x1fb1*/  .byte 0x15
/*0x1fb2*/  .byte 0x16
/*0x1fb3*/  .byte 0x17
/*0x1fb4*/  .byte 0x18
/*0x1fb5*/  .byte 0x19
/*0x1fb6*/  .byte 0x1a
/*0x1fb7*/  .byte 0x1b
/*0x1fb8*/  .byte 0x1c
/*0x1fb9*/  .byte 0x1d
/*0x1fba*/  .byte 0x1e
/*0x1fbb*/  .byte 0x1f
/*0x1fbc*/  .byte 0x20
/*0x1fbd*/  .byte 0x21
/*0x1fbe*/  .byte 0x22
/*0x1fbf*/  .byte 0x23
/*0x1fc0*/  .byte 0x24
/*0x1fc1*/  .byte 0x25
/*0x1fc2*/  .byte 0x26
/*0x1fc3*/  .byte 0x27
/*0x1fc4*/  .byte 0x28
/*0x1fc5*/  .byte 0x29
/*0x1fc6*/  .byte 0x2a
/*0x1fc7*/  .byte 0x2b
/*0x1fc8*/  .byte 0x2c
/*0x1fc9*/  .byte 0x2d
/*0x1fca*/  .byte 0x2e
/*0x1fcb*/  .byte 0x2f
/*0x1fcc*/  .byte 0x30
/*0x1fcd*/  .byte 0x31
/*0x1fce*/  .byte 0x32
/*0x1fcf*/  .byte 0x33
/*0x1fd0*/  .byte 0x34
/*0x1fd1*/  .byte 0x35
/*0x1fd2*/  .byte 0x36
/*0x1fd3*/  .byte 0x37
/*0x1fd4*/  .byte 0x38
/*0x1fd5*/  .byte 0x39
/*0x1fd6*/  .byte 0x3a
/*0x1fd7*/  .byte 0x3b
/*0x1fd8*/  .byte 0x3c
/*0x1fd9*/  .byte 0x3d
/*0x1fda*/  .byte 0x3e
/*0x1fdb*/  .byte 0x3f
            data_1fdc:
/*0x1fdc*/  .byte 0xc8
/*0x1fdd*/  .byte 0xe6
/*0x1fde*/  .byte 0x29
/*0x1fdf*/  .byte 0x14
/*0x1fe0*/  .byte 0x39
/*0x1fe1*/  .byte 0x04
/*0x1fe2*/  .byte 0xe1
/*0x1fe3*/  .byte 0x1d
/*0x1fe4*/  .byte 0xce
/*0x1fe5*/  .byte 0x65
/*0x1fe6*/  .byte 0x1a
/*0x1fe7*/  .byte 0x08
/*0x1fe8*/  .byte 0x16
/*0x1fe9*/  .byte 0x07
/*0x1fea*/  .byte 0x1b
/*0x1feb*/  .byte 0x06
/*0x1fec*/  .byte 0xe2
/*0x1fed*/  .byte 0xcc
/*0x1fee*/  .byte 0x15
/*0x1fef*/  .byte 0x17
/*0x1ff0*/  .byte 0x09
/*0x1ff1*/  .byte 0x0a
/*0x1ff2*/  .byte 0x19
/*0x1ff3*/  .byte 0x05
/*0x1ff4*/  .byte 0xc9
/*0x1ff5*/  .byte 0xcf
/*0x1ff6*/  .byte 0x1c
/*0x1ff7*/  .byte 0x18
/*0x1ff8*/  .byte 0x0b
/*0x1ff9*/  .byte 0x0d
/*0x1ffa*/  .byte 0x11
/*0x1ffb*/  .byte 0x10
/*0x1ffc*/  .byte 0x28
/*0x1ffd*/  .byte 0xe0
/*0x1ffe*/  .byte 0x0c
/*0x1fff*/  .byte 0x12
/*0x2000*/  .byte 0x0e
/*0x2001*/  .byte 0x0f
/*0x2002*/  .byte 0x36
/*0x2003*/  .byte 0x37
/*0x2004*/  .byte 0x2a
/*0x2005*/  .byte 0xe3
/*0x2006*/  .byte 0x13
/*0x2007*/  .byte 0xe4
/*0x2008*/  .byte 0x33
/*0x2009*/  .byte 0x4c
/*0x200a*/  .byte 0xe8
/*0x200b*/  .byte 0xe5
/*0x200c*/  .byte 0x2c
/*0x200d*/  .byte 0xca
/*0x200e*/  .byte 0xcb
/*0x200f*/  .byte 0x00
/*0x2010*/  .byte 0x00
/*0x2011*/  .byte 0x00
/*0x2012*/  .byte 0x00
/*0x2013*/  .byte 0x00
/*0x2014*/  .byte 0x00
/*0x2015*/  .byte 0x40
/*0x2016*/  .byte 0x0b
/*0x2017*/  .byte 0x40
/*0x2018*/  .byte 0x00
/*0x2019*/  .byte 0x02
/*0x201a*/  .byte 0x00
/*0x201b*/  .byte 0x00
/*0x201c*/  .byte 0x00
/*0x201d*/  .byte 0x00
/*0x201e*/  .byte 0x0b
/*0x201f*/  .byte 0x40
/*0x2020*/  .byte 0x20
/*0x2021*/  .byte 0x00
/*0x2022*/  .byte 0x00
/*0x2023*/  .byte 0x00
/*0x2024*/  .byte 0x00
/*0x2025*/  .byte 0x00
/*0x2026*/  .byte 0x0b
/*0x2027*/  .byte 0x40
/*0x2028*/  .byte 0x40
/*0x2029*/  .byte 0x00
/*0x202a*/  .byte 0x00
/*0x202b*/  .byte 0x00
/*0x202c*/  .byte 0x00
/*0x202d*/  .byte 0x00
/*0x202e*/  .byte 0x0b
/*0x202f*/  .byte 0x40
/*0x2030*/  .byte 0x80
/*0x2031*/  .byte 0x00
/*0x2032*/  .byte 0x00
/*0x2033*/  .byte 0x00
/*0x2034*/  .byte 0x00
/*0x2035*/  .byte 0x40
/*0x2036*/  .byte 0x0b
/*0x2037*/  .byte 0x40
/*0x2038*/  .byte 0x00
/*0x2039*/  .byte 0x08
/*0x203a*/  .byte 0x00
/*0x203b*/  .byte 0x00
/*0x203c*/  .byte 0x00
/*0x203d*/  .byte 0x40
/*0x203e*/  .byte 0x0b
/*0x203f*/  .byte 0x40
/*0x2040*/  .byte 0x00
/*0x2041*/  .byte 0x20
/*0x2042*/  .byte 0x00
/*0x2043*/  .byte 0x00
/*0x2044*/  .byte 0x00
/*0x2045*/  .byte 0x40
/*0x2046*/  .byte 0x0b
/*0x2047*/  .byte 0x40
/*0x2048*/  .byte 0x00
/*0x2049*/  .byte 0x40
/*0x204a*/  .byte 0x00
/*0x204b*/  .byte 0x00
/*0x204c*/  .byte 0x00
/*0x204d*/  .byte 0x40
/*0x204e*/  .byte 0x0b
/*0x204f*/  .byte 0x40
/*0x2050*/  .byte 0x00
/*0x2051*/  .byte 0x80
/*0x2052*/  .byte 0x00
/*0x2053*/  .byte 0x00
/*0x2054*/  .byte 0x02
/*0x2055*/  .byte 0x09
/*0x2056*/  .byte 0x00
/*0x2057*/  .byte 0x05
/*0x2058*/  .byte 0x00
/*0x2059*/  .byte 0x06
/*0x205a*/  .byte 0x00
/*0x205b*/  .byte 0x07
/*0x205c*/  .byte 0x02
/*0x205d*/  .byte 0x0b
/*0x205e*/  .byte 0x02
/*0x205f*/  .byte 0x0d
/*0x2060*/  .byte 0x02
/*0x2061*/  .byte 0x0e
/*0x2062*/  .byte 0x02
/*0x2063*/  .byte 0x0f
/*0x2064*/  .byte 0x00
/*0x2065*/  .byte 0x00
/*0x2066*/  .byte 0x0b
/*0x2067*/  .byte 0x40
/*0x2068*/  .byte 0x10
/*0x2069*/  .byte 0x00
/*0x206a*/  .byte 0x00
/*0x206b*/  .byte 0x00
/*0x206c*/  .byte 0x00
/*0x206d*/  .byte 0x20
/*0x206e*/  .byte 0x0b
/*0x206f*/  .byte 0x40
/*0x2070*/  .byte 0x00
/*0x2071*/  .byte 0x04
/*0x2072*/  .byte 0x00
/*0x2073*/  .byte 0x00
/*0x2074*/  .byte 0x00
/*0x2075*/  .byte 0x60
/*0x2076*/  .byte 0x0b
/*0x2077*/  .byte 0x40
/*0x2078*/  .byte 0x01
/*0x2079*/  .byte 0x00
/*0x207a*/  .byte 0x00
/*0x207b*/  .byte 0x00
/*0x207c*/  .byte 0x00
/*0x207d*/  .byte 0x20
/*0x207e*/  .byte 0x0b
/*0x207f*/  .byte 0x40
/*0x2080*/  .byte 0x00
/*0x2081*/  .byte 0x08
/*0x2082*/  .byte 0x00
/*0x2083*/  .byte 0x00
/*0x2084*/  .byte 0x00
/*0x2085*/  .byte 0x00
/*0x2086*/  .byte 0x0b
/*0x2087*/  .byte 0x40
/*0x2088*/  .byte 0x00
/*0x2089*/  .byte 0x08
/*0x208a*/  .byte 0x00
/*0x208b*/  .byte 0x00
/*0x208c*/  .byte 0x00
/*0x208d*/  .byte 0x00
/*0x208e*/  .byte 0x0b
/*0x208f*/  .byte 0x40
/*0x2090*/  .byte 0x01
/*0x2091*/  .byte 0x00
/*0x2092*/  .byte 0x00
/*0x2093*/  .byte 0x00
/*0x2094*/  .byte 0x00
/*0x2095*/  .byte 0x00
/*0x2096*/  .byte 0x0b
/*0x2097*/  .byte 0x40
/*0x2098*/  .byte 0x02
/*0x2099*/  .byte 0x00
/*0x209a*/  .byte 0x00
/*0x209b*/  .byte 0x00
/*0x209c*/  .byte 0x00
/*0x209d*/  .byte 0x40
/*0x209e*/  .byte 0x0b
/*0x209f*/  .byte 0x40
/*0x20a0*/  .byte 0x10
/*0x20a1*/  .byte 0x00
/*0x20a2*/  .byte 0x00
/*0x20a3*/  .byte 0x00
/*0x20a4*/  .byte 0x00
/*0x20a5*/  .byte 0x40
/*0x20a6*/  .byte 0x0b
/*0x20a7*/  .byte 0x40
/*0x20a8*/  .byte 0x20
/*0x20a9*/  .byte 0x00
/*0x20aa*/  .byte 0x00
/*0x20ab*/  .byte 0x00
/*0x20ac*/  .byte 0x00
/*0x20ad*/  .byte 0x40
/*0x20ae*/  .byte 0x0b
/*0x20af*/  .byte 0x40
/*0x20b0*/  .byte 0x40
/*0x20b1*/  .byte 0x00
/*0x20b2*/  .byte 0x00
/*0x20b3*/  .byte 0x00
/*0x20b4*/  .byte 0x00
/*0x20b5*/  .byte 0x20
/*0x20b6*/  .byte 0x0b
/*0x20b7*/  .byte 0x40
/*0x20b8*/  .byte 0x02
/*0x20b9*/  .byte 0x00
/*0x20ba*/  .byte 0x00
/*0x20bb*/  .byte 0x00
/*0x20bc*/  .byte 0xfc
/*0x20bd*/  .byte 0x03
/*0x20be*/  .byte 0x00
/*0x20bf*/  .byte 0x00
/*0x20c0*/  .byte 0x00
/*0x20c1*/  .byte 0x22
/*0x20c2*/  .byte 0x00
/*0x20c3*/  .byte 0x00
/*0x20c4*/  .byte 0x06
/*0x20c5*/  .byte 0x00
/*0x20c6*/  .byte 0xff
/*0x20c7*/  .byte 0x09
/*0x20c8*/  .byte 0x01
/*0x20c9*/  .byte 0xa1
/*0x20ca*/  .byte 0x01
/*0x20cb*/  .byte 0x09
/*0x20cc*/  .byte 0x02
/*0x20cd*/  .byte 0x15
/*0x20ce*/  .byte 0x00
/*0x20cf*/  .byte 0x26
/*0x20d0*/  .byte 0xff
/*0x20d1*/  .byte 0x00
/*0x20d2*/  .byte 0x75
/*0x20d3*/  .byte 0x08
/*0x20d4*/  .byte 0x95
/*0x20d5*/  .byte 0x40
/*0x20d6*/  .byte 0x81
/*0x20d7*/  .byte 0x02
/*0x20d8*/  .byte 0x09
/*0x20d9*/  .byte 0x03
/*0x20da*/  .byte 0x15
/*0x20db*/  .byte 0x00
/*0x20dc*/  .byte 0x26
/*0x20dd*/  .byte 0xff
/*0x20de*/  .byte 0x00
/*0x20df*/  .byte 0x75
/*0x20e0*/  .byte 0x08
/*0x20e1*/  .byte 0x95
/*0x20e2*/  .byte 0x40
/*0x20e3*/  .byte 0x91
/*0x20e4*/  .byte 0x02
/*0x20e5*/  .byte 0xc0
/*0x20e6*/  .byte 0x00
/*0x20e7*/  .byte 0x00
/*0x20e8*/  .byte 0x05
/*0x20e9*/  .byte 0x01
/*0x20ea*/  .byte 0x09
/*0x20eb*/  .byte 0x80
/*0x20ec*/  .byte 0xa1
/*0x20ed*/  .byte 0x01
/*0x20ee*/  .byte 0x85
/*0x20ef*/  .byte 0x01
/*0x20f0*/  .byte 0x19
/*0x20f1*/  .byte 0x81
/*0x20f2*/  .byte 0x29
/*0x20f3*/  .byte 0x83
/*0x20f4*/  .byte 0x15
/*0x20f5*/  .byte 0x00
/*0x20f6*/  .byte 0x25
/*0x20f7*/  .byte 0x01
/*0x20f8*/  .byte 0x95
/*0x20f9*/  .byte 0x03
/*0x20fa*/  .byte 0x75
/*0x20fb*/  .byte 0x01
/*0x20fc*/  .byte 0x81
/*0x20fd*/  .byte 0x02
/*0x20fe*/  .byte 0x95
/*0x20ff*/  .byte 0x01
/*0x2100*/  .byte 0x75
/*0x2101*/  .byte 0x05
/*0x2102*/  .byte 0x81
/*0x2103*/  .byte 0x01
/*0x2104*/  .byte 0xc0
/*0x2105*/  .byte 0x05
/*0x2106*/  .byte 0x0c
/*0x2107*/  .byte 0x09
/*0x2108*/  .byte 0x01
/*0x2109*/  .byte 0xa1
/*0x210a*/  .byte 0x01
/*0x210b*/  .byte 0x85
/*0x210c*/  .byte 0x02
/*0x210d*/  .byte 0x15
/*0x210e*/  .byte 0x00
/*0x210f*/  .byte 0x25
/*0x2110*/  .byte 0x01
/*0x2111*/  .byte 0x95
/*0x2112*/  .byte 0x12
/*0x2113*/  .byte 0x75
/*0x2114*/  .byte 0x01
/*0x2115*/  .byte 0x0a
/*0x2116*/  .byte 0x83
/*0x2117*/  .byte 0x01
/*0x2118*/  .byte 0x0a
/*0x2119*/  .byte 0x8a
/*0x211a*/  .byte 0x01
/*0x211b*/  .byte 0x0a
/*0x211c*/  .byte 0x92
/*0x211d*/  .byte 0x01
/*0x211e*/  .byte 0x0a
/*0x211f*/  .byte 0x94
/*0x2120*/  .byte 0x01
/*0x2121*/  .byte 0x09
/*0x2122*/  .byte 0xcd
/*0x2123*/  .byte 0x09
/*0x2124*/  .byte 0xb7
/*0x2125*/  .byte 0x09
/*0x2126*/  .byte 0xb6
/*0x2127*/  .byte 0x09
/*0x2128*/  .byte 0xb5
/*0x2129*/  .byte 0x09
/*0x212a*/  .byte 0xe2
/*0x212b*/  .byte 0x09
/*0x212c*/  .byte 0xea
/*0x212d*/  .byte 0x09
/*0x212e*/  .byte 0xe9
/*0x212f*/  .byte 0x0a
/*0x2130*/  .byte 0x21
/*0x2131*/  .byte 0x02
/*0x2132*/  .byte 0x0a
/*0x2133*/  .byte 0x23
/*0x2134*/  .byte 0x02
/*0x2135*/  .byte 0x0a
/*0x2136*/  .byte 0x24
/*0x2137*/  .byte 0x02
/*0x2138*/  .byte 0x0a
/*0x2139*/  .byte 0x25
/*0x213a*/  .byte 0x02
/*0x213b*/  .byte 0x0a
/*0x213c*/  .byte 0x26
/*0x213d*/  .byte 0x02
/*0x213e*/  .byte 0x0a
/*0x213f*/  .byte 0x27
/*0x2140*/  .byte 0x02
/*0x2141*/  .byte 0x0a
/*0x2142*/  .byte 0x2a
/*0x2143*/  .byte 0x02
/*0x2144*/  .byte 0x81
/*0x2145*/  .byte 0x02
/*0x2146*/  .byte 0x95
/*0x2147*/  .byte 0x01
/*0x2148*/  .byte 0x75
/*0x2149*/  .byte 0x0e
/*0x214a*/  .byte 0x81
/*0x214b*/  .byte 0x01
/*0x214c*/  .byte 0xc0
/*0x214d*/  .byte 0x00
/*0x214e*/  .byte 0x00
/*0x214f*/  .byte 0x00
/*0x2150*/  .byte 0x05
/*0x2151*/  .byte 0x01
/*0x2152*/  .byte 0x09
/*0x2153*/  .byte 0x06
/*0x2154*/  .byte 0xa1
/*0x2155*/  .byte 0x01
/*0x2156*/  .byte 0x05
/*0x2157*/  .byte 0x07
/*0x2158*/  .byte 0x19
/*0x2159*/  .byte 0xe0
/*0x215a*/  .byte 0x29
/*0x215b*/  .byte 0xe7
/*0x215c*/  .byte 0x15
/*0x215d*/  .byte 0x00
/*0x215e*/  .byte 0x25
/*0x215f*/  .byte 0x01
/*0x2160*/  .byte 0x75
/*0x2161*/  .byte 0x01
/*0x2162*/  .byte 0x95
/*0x2163*/  .byte 0x08
/*0x2164*/  .byte 0x81
/*0x2165*/  .byte 0x02
/*0x2166*/  .byte 0x95
/*0x2167*/  .byte 0x01
/*0x2168*/  .byte 0x75
/*0x2169*/  .byte 0x08
/*0x216a*/  .byte 0x81
/*0x216b*/  .byte 0x03
/*0x216c*/  .byte 0x95
/*0x216d*/  .byte 0x03
/*0x216e*/  .byte 0x75
/*0x216f*/  .byte 0x01
/*0x2170*/  .byte 0x05
/*0x2171*/  .byte 0x08
/*0x2172*/  .byte 0x19
/*0x2173*/  .byte 0x01
/*0x2174*/  .byte 0x29
/*0x2175*/  .byte 0x03
/*0x2176*/  .byte 0x91
/*0x2177*/  .byte 0x02
/*0x2178*/  .byte 0x95
/*0x2179*/  .byte 0x01
/*0x217a*/  .byte 0x75
/*0x217b*/  .byte 0x05
/*0x217c*/  .byte 0x91
/*0x217d*/  .byte 0x03
/*0x217e*/  .byte 0x95
/*0x217f*/  .byte 0x06
/*0x2180*/  .byte 0x75
/*0x2181*/  .byte 0x08
/*0x2182*/  .byte 0x15
/*0x2183*/  .byte 0x00
/*0x2184*/  .byte 0x26
/*0x2185*/  .byte 0xa4
/*0x2186*/  .byte 0x00
/*0x2187*/  .byte 0x05
/*0x2188*/  .byte 0x07
/*0x2189*/  .byte 0x19
/*0x218a*/  .byte 0x00
/*0x218b*/  .byte 0x29
/*0x218c*/  .byte 0xa4
/*0x218d*/  .byte 0x81
/*0x218e*/  .byte 0x00
/*0x218f*/  .byte 0xc0
/*0x2190*/  .byte 0x09
/*0x2191*/  .byte 0x02
/*0x2192*/  .byte 0x5b
/*0x2193*/  .byte 0x00
/*0x2194*/  .byte 0x03
/*0x2195*/  .byte 0x01
/*0x2196*/  .byte 0x00
/*0x2197*/  .byte 0xa0
/*0x2198*/  .byte 0x32
/*0x2199*/  .byte 0x09
/*0x219a*/  .byte 0x04
/*0x219b*/  .byte 0x00
/*0x219c*/  .byte 0x00
/*0x219d*/  .byte 0x01
/*0x219e*/  .byte 0x03
/*0x219f*/  .byte 0x01
/*0x21a0*/  .byte 0x01
/*0x21a1*/  .byte 0x00
/*0x21a2*/  .byte 0x09
/*0x21a3*/  .byte 0x21
/*0x21a4*/  .byte 0x11
/*0x21a5*/  .byte 0x01
/*0x21a6*/  .byte 0x00
/*0x21a7*/  .byte 0x01
/*0x21a8*/  .byte 0x22
/*0x21a9*/  .byte 0x40
/*0x21aa*/  .byte 0x00
/*0x21ab*/  .byte 0x07
/*0x21ac*/  .byte 0x05
/*0x21ad*/  .byte 0x81
/*0x21ae*/  .byte 0x03
/*0x21af*/  .byte 0x08
/*0x21b0*/  .byte 0x00
/*0x21b1*/  .byte 0x01
/*0x21b2*/  .byte 0x09
/*0x21b3*/  .byte 0x04
/*0x21b4*/  .byte 0x01
/*0x21b5*/  .byte 0x00
/*0x21b6*/  .byte 0x02
/*0x21b7*/  .byte 0x03
/*0x21b8*/  .byte 0x00
/*0x21b9*/  .byte 0x00
/*0x21ba*/  .byte 0x00
/*0x21bb*/  .byte 0x09
/*0x21bc*/  .byte 0x21
/*0x21bd*/  .byte 0x11
/*0x21be*/  .byte 0x01
/*0x21bf*/  .byte 0x00
/*0x21c0*/  .byte 0x01
/*0x21c1*/  .byte 0x22
/*0x21c2*/  .byte 0x22
/*0x21c3*/  .byte 0x00
/*0x21c4*/  .byte 0x07
/*0x21c5*/  .byte 0x05
/*0x21c6*/  .byte 0x83
/*0x21c7*/  .byte 0x03
/*0x21c8*/  .byte 0x40
/*0x21c9*/  .byte 0x00
/*0x21ca*/  .byte 0x01
/*0x21cb*/  .byte 0x07
/*0x21cc*/  .byte 0x05
/*0x21cd*/  .byte 0x04
/*0x21ce*/  .byte 0x03
/*0x21cf*/  .byte 0x40
/*0x21d0*/  .byte 0x00
/*0x21d1*/  .byte 0x01
/*0x21d2*/  .byte 0x09
/*0x21d3*/  .byte 0x04
/*0x21d4*/  .byte 0x02
/*0x21d5*/  .byte 0x00
/*0x21d6*/  .byte 0x01
/*0x21d7*/  .byte 0x03
/*0x21d8*/  .byte 0x00
/*0x21d9*/  .byte 0x00
/*0x21da*/  .byte 0x00
/*0x21db*/  .byte 0x09
/*0x21dc*/  .byte 0x21
/*0x21dd*/  .byte 0x11
/*0x21de*/  .byte 0x01
/*0x21df*/  .byte 0x00
/*0x21e0*/  .byte 0x01
/*0x21e1*/  .byte 0x22
/*0x21e2*/  .byte 0x65
/*0x21e3*/  .byte 0x00
/*0x21e4*/  .byte 0x07
/*0x21e5*/  .byte 0x05
/*0x21e6*/  .byte 0x82
/*0x21e7*/  .byte 0x03
/*0x21e8*/  .byte 0x40
/*0x21e9*/  .byte 0x00
/*0x21ea*/  .byte 0x01
/*0x21eb*/  .byte 0x00
/*0x21ec*/  .byte 0x12
/*0x21ed*/  .byte 0x01
/*0x21ee*/  .byte 0x10
/*0x21ef*/  .byte 0x01
/*0x21f0*/  .byte 0x00
/*0x21f1*/  .byte 0x00
/*0x21f2*/  .byte 0x00
/*0x21f3*/  .byte 0x40
/*0x21f4*/  .byte 0xd9
/*0x21f5*/  .byte 0x04
/*0x21f6*/  .byte 0x75
/*0x21f7*/  .byte 0x11
/*0x21f8*/  .byte 0x03
/*0x21f9*/  .byte 0x11
/*0x21fa*/  .byte 0x00
/*0x21fb*/  .byte 0x01
/*0x21fc*/  .byte 0x00
/*0x21fd*/  .byte 0x01
/*0x21fe*/  .byte 0x00
/*0x21ff*/  .byte 0x00
/*0x2200*/  .byte 0x18
/*0x2201*/  .byte 0x03
/*0x2202*/  .byte 0x55
/*0x2203*/  .byte 0x00
/*0x2204*/  .byte 0x53
/*0x2205*/  .byte 0x00
/*0x2206*/  .byte 0x42
/*0x2207*/  .byte 0x00
/*0x2208*/  .byte 0x2d
/*0x2209*/  .byte 0x00
/*0x220a*/  .byte 0x48
/*0x220b*/  .byte 0x00
/*0x220c*/  .byte 0x49
/*0x220d*/  .byte 0x00
/*0x220e*/  .byte 0x44
/*0x220f*/  .byte 0x00
/*0x2210*/  .byte 0x20
/*0x2211*/  .byte 0x00
/*0x2212*/  .byte 0x49
/*0x2213*/  .byte 0x00
/*0x2214*/  .byte 0x41
/*0x2215*/  .byte 0x00
/*0x2216*/  .byte 0x50
/*0x2217*/  .byte 0x00
/*0x2218*/  .byte 0x00
/*0x2219*/  .byte 0x00
/*0x221a*/  .byte 0x00
/*0x221b*/  .byte 0x00
/*0x221c*/  .byte 0x59
/*0x221d*/  .byte 0x10
/*0x221e*/  .byte 0x00
/*0x221f*/  .byte 0x00
/*0x2220*/  .byte 0x00
/*0x2221*/  .byte 0x00
/*0x2222*/  .byte 0x00
/*0x2223*/  .byte 0x00
/*0x2224*/  .byte 0xed
/*0x2225*/  .byte 0x1a
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
/*0x2230*/  .byte 0xf9
/*0x2231*/  .byte 0x19
/*0x2232*/  .byte 0x00
/*0x2233*/  .byte 0x00
/*0x2234*/  .byte 0xfd
/*0x2235*/  .byte 0x18
/*0x2236*/  .byte 0x00
/*0x2237*/  .byte 0x00
/*0x2238*/  .byte 0x58
/*0x2239*/  .byte 0x22
/*0x223a*/  .byte 0x00
/*0x223b*/  .byte 0x00
/*0x223c*/  .byte 0x00
/*0x223d*/  .byte 0x00
/*0x223e*/  .byte 0x00
/*0x223f*/  .byte 0x20
/*0x2240*/  .byte 0x40
/*0x2241*/  .byte 0x00
/*0x2242*/  .byte 0x00
/*0x2243*/  .byte 0x00
/*0x2244*/  .byte 0x80
/*0x2245*/  .byte 0x1e
/*0x2246*/  .byte 0x00
/*0x2247*/  .byte 0x00
/*0x2248*/  .byte 0x98
/*0x2249*/  .byte 0x22
/*0x224a*/  .byte 0x00
/*0x224b*/  .byte 0x00
/*0x224c*/  .byte 0x40
/*0x224d*/  .byte 0x00
/*0x224e*/  .byte 0x00
/*0x224f*/  .byte 0x20
/*0x2250*/  .byte 0xf0
/*0x2251*/  .byte 0x06
/*0x2252*/  .byte 0x00
/*0x2253*/  .byte 0x00
/*0x2254*/  .byte 0x8e
/*0x2255*/  .byte 0x1e
/*0x2256*/  .byte 0x00
/*0x2257*/  .byte 0x00
/*0x2258*/  .byte 0x01
/*0x2259*/  .byte 0x00
/*0x225a*/  .byte 0x00
/*0x225b*/  .byte 0x00
/*0x225c*/  .byte 0x00
/*0x225d*/  .byte 0x00
/*0x225e*/  .byte 0x00
/*0x225f*/  .byte 0x00
/*0x2260*/  .byte 0x00
/*0x2261*/  .byte 0x30
/*0x2262*/  .byte 0x00
/*0x2263*/  .byte 0x00
/*0x2264*/  .byte 0x00
/*0x2265*/  .byte 0x00
/*0x2266*/  .byte 0x00
/*0x2267*/  .byte 0x00
/*0x2268*/  .byte 0x00
/*0x2269*/  .byte 0x00
/*0x226a*/  .byte 0x00
/*0x226b*/  .byte 0x00
/*0x226c*/  .byte 0xff
/*0x226d*/  .byte 0x07
/*0x226e*/  .byte 0x00
/*0x226f*/  .byte 0x00
/*0x2270*/  .byte 0x00
/*0x2271*/  .byte 0xa2
/*0x2272*/  .byte 0x4a
/*0x2273*/  .byte 0x04
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
/*0x2290*/  .byte 0x00
/*0x2291*/  .byte 0x00
/*0x2292*/  .byte 0x00
/*0x2293*/  .byte 0x00
/*0x2294*/  .byte 0x00
/*0x2295*/  .byte 0x00
/*0x2296*/  .byte 0x00
/*0x2297*/  .byte 0x00
