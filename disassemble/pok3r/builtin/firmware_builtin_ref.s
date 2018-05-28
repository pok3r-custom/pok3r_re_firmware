.syntax unified
.cpu cortex-m3
.text
.thumb

            vectors:
/*0x0000*/  .byte 0xd8
/*0x0001*/  .byte 0x0e
/*0x0002*/  .byte 0x00
/*0x0003*/  .byte 0x20
/*0x0004*/  .byte 0x19
/*0x0005*/  .byte 0x01
/*0x0006*/  .byte 0x00
/*0x0007*/  .byte 0x00
/*0x0008*/  .byte 0x25
/*0x0009*/  .byte 0x01
/*0x000a*/  .byte 0x00
/*0x000b*/  .byte 0x00
/*0x000c*/  .byte 0x25
/*0x000d*/  .byte 0x01
/*0x000e*/  .byte 0x00
/*0x000f*/  .byte 0x00
/*0x0010*/  .byte 0x25
/*0x0011*/  .byte 0x01
/*0x0012*/  .byte 0x00
/*0x0013*/  .byte 0x00
/*0x0014*/  .byte 0x25
/*0x0015*/  .byte 0x01
/*0x0016*/  .byte 0x00
/*0x0017*/  .byte 0x00
/*0x0018*/  .byte 0x25
/*0x0019*/  .byte 0x01
/*0x001a*/  .byte 0x00
/*0x001b*/  .byte 0x00
/*0x001c*/  .byte 0x00
/*0x001d*/  .byte 0x00
/*0x001e*/  .byte 0x00
/*0x001f*/  .byte 0x00


            .thumb_func
            entry:
/*0x0020*/      ldr.w sp, [pc, #0xc] /* data_30 */
/*0x0024*/      bl sram_init

            .thumb_func
            call_28:
/*0x0028*/      ldr r0, [pc, #0] /* data_2c */
/*0x002a*/      bx r0 /* main */

            data_2c:
/*0x002c*/  .word main
            data_30:
/*0x0030*/  .word 0x20000ed8


            .thumb_func
            call_34:
/*0x0034*/      str r1, [r0, #0xc]
/*0x0036*/      bx lr

            .thumb_func
            call_38:
/*0x0038*/      str r1, [r0, #8]
/*0x003a*/      bx lr

/*0x003c*/  .byte 0xe1
/*0x003d*/  .byte 0x10
/*0x003e*/  .byte 0x00
/*0x003f*/  .byte 0x00
/*0x0040*/  .byte 0x40
/*0x0041*/  .byte 0xba
/*0x0042*/  .byte 0x70
/*0x0043*/  .byte 0x47
/*0x0044*/  .byte 0xc0
/*0x0045*/  .byte 0xba
/*0x0046*/  .byte 0x70
/*0x0047*/  .byte 0x47


            .thumb_func
            load_jump_fw:
/*0x0048*/      ldr r1, [r0]
/*0x004a*/      mov sp, r1
/*0x004c*/      ldr r1, [r0, #4]
/*0x004e*/      bx r1

            .thumb_func
            sram_init:
/*0x0050*/      ldr r4, [pc, #0x18] /* data_6c */
/*0x0052*/      ldr r5, [pc, #0x1c] /* data_70 */
/*0x0054*/      b jump_64
            jump_56:
/*0x0056*/      ldr r0, [r4, #0xc]
/*0x0058*/      orr r3, r0, #1
/*0x005c*/      ldm.w r4, {r0, r1, r2}
/*0x0060*/      blx r3
/*0x0062*/      adds r4, #0x10
            jump_64:
/*0x0064*/      cmp r4, r5
/*0x0066*/      blo jump_56
/*0x0068*/      bl call_28

            data_6c:
/*0x006c*/  .word 0x000022ac /* possible pointer */
            data_70:
/*0x0070*/  .word 0x000022cc /* possible pointer */


            .thumb_func
            call_74:
/*0x0074*/      push {r4, lr}
/*0x0076*/      movs r2, #0
/*0x0078*/      cmp r0, #0x1c
/*0x007a*/      bls jump_82
/*0x007c*/      movs r2, #1
/*0x007e*/      subs r0, #0x20
/*0x0080*/      uxtb r0, r0
            jump_82:
/*0x0082*/      ldr r3, [pc, #0x14] /* data_98 */
/*0x0084*/      add.w r2, r3, r2, lsl #2
/*0x0088*/      ldr r3, [r2]
/*0x008a*/      movs r4, #0xf
/*0x008c*/      lsls r4, r0
/*0x008e*/      bics r3, r4
/*0x0090*/      lsls r1, r0
/*0x0092*/      orrs r1, r3
/*0x0094*/      str r1, [r2]
/*0x0096*/      pop {r4, pc}

            data_98:
/*0x0098*/  .word 0x40022000


            .thumb_func
            bftm0_intr:
/*0x009c*/      push {r4, lr}
/*0x009e*/      ldr r0, [pc, #0x20] /* data_c0 */
/*0x00a0*/      bl call_f4
/*0x00a4*/      ldr r0, [pc, #0x1c] /* data_c4 */
/*0x00a6*/      ldr r1, [r0]
/*0x00a8*/      cbz r1, jump_b0
/*0x00aa*/      ldr r1, [r0]
/*0x00ac*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x00ae*/      str r1, [r0]
            jump_b0:
/*0x00b0*/      ldr r1, [r0, #4]
/*0x00b2*/      cmp r1, #0
/*0x00b4*/      beq jump_bc
/*0x00b6*/      ldr r1, [r0, #4]
/*0x00b8*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x00ba*/      str r1, [r0, #4]
            jump_bc:
/*0x00bc*/      pop {r4, pc}

/*0x00be*/  .byte 0x00
/*0x00bf*/  .byte 0x00

            data_c0:
/*0x00c0*/  .word 0x40076000
            data_c4:
/*0x00c4*/  .word 0x2000018c


            .thumb_func
            bftm1_intr:
/*0x00c8*/      push {r4, lr}
/*0x00ca*/      ldr r0, [pc, #0xc] /* data_d8 */
/*0x00cc*/      bl call_f4
/*0x00d0*/      pop.w {r4, lr}
/*0x00d4*/      b.w jump_c3c

            data_d8:
/*0x00d8*/  .word 0x40077000


            .thumb_func
            usb_disable_dppu:
/*0x00dc*/      movs r0, #0
/*0x00de*/      b.w usb_dp_pull_up

/*0x00e2*/  .byte 0x70
/*0x00e3*/  .byte 0x47
/*0x00e4*/  .byte 0x9d
/*0x00e5*/  .byte 0x00
/*0x00e6*/  .byte 0x00
/*0x00e7*/  .byte 0x00
/*0x00e8*/  .byte 0xc9
/*0x00e9*/  .byte 0x00
/*0x00ea*/  .byte 0x00
/*0x00eb*/  .byte 0x00
/*0x00ec*/  .byte 0x27
/*0x00ed*/  .byte 0x01
/*0x00ee*/  .byte 0x00
/*0x00ef*/  .byte 0x00
/*0x00f0*/  .byte 0xf1
/*0x00f1*/  .byte 0x04
/*0x00f2*/  .byte 0x00
/*0x00f3*/  .byte 0x00


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
/*0x010e*/      str r1, [r0, #0x24]
/*0x0110*/      bx lr

/*0x0112*/  .byte 0x70
/*0x0113*/  .byte 0x47
/*0x0114*/  .byte 0x8d
/*0x0115*/  .byte 0x1a
/*0x0116*/  .byte 0x00
/*0x0117*/  .byte 0x00


            .thumb_func
            reset:
/*0x0118*/      ldr r0, [pc, #0xc] /* data_128 */
/*0x011a*/      blx r0 /* call_1a98 */
/*0x011c*/      ldr r0, [pc, #0xc] /* data_12c */
/*0x011e*/      blx r0 /* clock_init */
/*0x0120*/      ldr r0, [pc, #0xc] /* data_130 */
/*0x0122*/      bx r0 /* entry */

            .thumb_func
            generic_fault:
/*0x0124*/      b generic_fault

/*0x0126*/  .byte 0xfe
/*0x0127*/  .byte 0xe7

            data_128:
/*0x0128*/  .word call_1a98
            data_12c:
/*0x012c*/  .word clock_init
            data_130:
/*0x0130*/  .word entry

/*0x0134*/  .byte 0xf0
/*0x0135*/  .byte 0xb5
/*0x0136*/  .byte 0x32
/*0x0137*/  .byte 0x4b
/*0x0138*/  .byte 0x01
/*0x0139*/  .byte 0x25
/*0x013a*/  .byte 0x32
/*0x013b*/  .byte 0x4e
/*0x013c*/  .byte 0x5a
/*0x013d*/  .byte 0x78
/*0x013e*/  .byte 0x01
/*0x013f*/  .byte 0xf0
/*0x0140*/  .byte 0x01
/*0x0141*/  .byte 0x01
/*0x0142*/  .byte 0xe9
/*0x0143*/  .byte 0x28
/*0x0144*/  .byte 0x04
/*0x0145*/  .byte 0xd0
/*0x0146*/  .byte 0xea
/*0x0147*/  .byte 0x28
/*0x0148*/  .byte 0x05
/*0x0149*/  .byte 0xd0
/*0x014a*/  .byte 0xeb
/*0x014b*/  .byte 0x28
/*0x014c*/  .byte 0x07
/*0x014d*/  .byte 0xd1
/*0x014e*/  .byte 0x1a
/*0x014f*/  .byte 0xe0
/*0x0150*/  .byte 0x61
/*0x0151*/  .byte 0xf3
/*0x0152*/  .byte 0x00
/*0x0153*/  .byte 0x02
/*0x0154*/  .byte 0x01
/*0x0155*/  .byte 0xe0
/*0x0156*/  .byte 0x61
/*0x0157*/  .byte 0xf3
/*0x0158*/  .byte 0x41
/*0x0159*/  .byte 0x02
/*0x015a*/  .byte 0x5a
/*0x015b*/  .byte 0x70
/*0x015c*/  .byte 0xf5
/*0x015d*/  .byte 0x60
/*0x015e*/  .byte 0xec
/*0x015f*/  .byte 0x38
/*0x0160*/  .byte 0x11
/*0x0161*/  .byte 0x28
/*0x0162*/  .byte 0x4c
/*0x0163*/  .byte 0xd8
/*0x0164*/  .byte 0x28
/*0x0165*/  .byte 0x4a
/*0x0166*/  .byte 0x12
/*0x0167*/  .byte 0x28
/*0x0168*/  .byte 0x53
/*0x0169*/  .byte 0x78
/*0x016a*/  .byte 0x94
/*0x016b*/  .byte 0x78
/*0x016c*/  .byte 0xd7
/*0x016d*/  .byte 0x78
/*0x016e*/  .byte 0x45
/*0x016f*/  .byte 0xd2
/*0x0170*/  .byte 0xdf
/*0x0171*/  .byte 0xe8
/*0x0172*/  .byte 0x00
/*0x0173*/  .byte 0xf0
/*0x0174*/  .byte 0x0c
/*0x0175*/  .byte 0x0f
/*0x0176*/  .byte 0x13
/*0x0177*/  .byte 0x16
/*0x0178*/  .byte 0x19
/*0x0179*/  .byte 0x1c
/*0x017a*/  .byte 0x1f
/*0x017b*/  .byte 0x22
/*0x017c*/  .byte 0x25
/*0x017d*/  .byte 0x28
/*0x017e*/  .byte 0x2c
/*0x017f*/  .byte 0x2f
/*0x0180*/  .byte 0x32
/*0x0181*/  .byte 0x35
/*0x0182*/  .byte 0x38
/*0x0183*/  .byte 0x3b
/*0x0184*/  .byte 0x3e
/*0x0185*/  .byte 0x41
/*0x0186*/  .byte 0x61
/*0x0187*/  .byte 0xf3
/*0x0188*/  .byte 0x82
/*0x0189*/  .byte 0x02
/*0x018a*/  .byte 0xe6
/*0x018b*/  .byte 0xe7
/*0x018c*/  .byte 0x61
/*0x018d*/  .byte 0xf3
/*0x018e*/  .byte 0x00
/*0x018f*/  .byte 0x03
/*0x0190*/  .byte 0x01
/*0x0191*/  .byte 0xe0
/*0x0192*/  .byte 0x61
/*0x0193*/  .byte 0xf3
/*0x0194*/  .byte 0x41
/*0x0195*/  .byte 0x03
/*0x0196*/  .byte 0x53
/*0x0197*/  .byte 0x70
/*0x0198*/  .byte 0x30
/*0x0199*/  .byte 0xe0
/*0x019a*/  .byte 0x61
/*0x019b*/  .byte 0xf3
/*0x019c*/  .byte 0x82
/*0x019d*/  .byte 0x03
/*0x019e*/  .byte 0xfa
/*0x019f*/  .byte 0xe7
/*0x01a0*/  .byte 0x61
/*0x01a1*/  .byte 0xf3
/*0x01a2*/  .byte 0xc3
/*0x01a3*/  .byte 0x03
/*0x01a4*/  .byte 0xf7
/*0x01a5*/  .byte 0xe7
/*0x01a6*/  .byte 0x61
/*0x01a7*/  .byte 0xf3
/*0x01a8*/  .byte 0x04
/*0x01a9*/  .byte 0x13
/*0x01aa*/  .byte 0xf4
/*0x01ab*/  .byte 0xe7
/*0x01ac*/  .byte 0x61
/*0x01ad*/  .byte 0xf3
/*0x01ae*/  .byte 0x45
/*0x01af*/  .byte 0x13
/*0x01b0*/  .byte 0xf1
/*0x01b1*/  .byte 0xe7
/*0x01b2*/  .byte 0x61
/*0x01b3*/  .byte 0xf3
/*0x01b4*/  .byte 0x86
/*0x01b5*/  .byte 0x13
/*0x01b6*/  .byte 0xee
/*0x01b7*/  .byte 0xe7
/*0x01b8*/  .byte 0x61
/*0x01b9*/  .byte 0xf3
/*0x01ba*/  .byte 0xc7
/*0x01bb*/  .byte 0x13
/*0x01bc*/  .byte 0xeb
/*0x01bd*/  .byte 0xe7
/*0x01be*/  .byte 0x61
/*0x01bf*/  .byte 0xf3
/*0x01c0*/  .byte 0x00
/*0x01c1*/  .byte 0x04
/*0x01c2*/  .byte 0x01
/*0x01c3*/  .byte 0xe0
/*0x01c4*/  .byte 0x61
/*0x01c5*/  .byte 0xf3
/*0x01c6*/  .byte 0x41
/*0x01c7*/  .byte 0x04
/*0x01c8*/  .byte 0x94
/*0x01c9*/  .byte 0x70
/*0x01ca*/  .byte 0x17
/*0x01cb*/  .byte 0xe0
/*0x01cc*/  .byte 0x61
/*0x01cd*/  .byte 0xf3
/*0x01ce*/  .byte 0x82
/*0x01cf*/  .byte 0x04
/*0x01d0*/  .byte 0xfa
/*0x01d1*/  .byte 0xe7
/*0x01d2*/  .byte 0x61
/*0x01d3*/  .byte 0xf3
/*0x01d4*/  .byte 0xc3
/*0x01d5*/  .byte 0x04
/*0x01d6*/  .byte 0xf7
/*0x01d7*/  .byte 0xe7
/*0x01d8*/  .byte 0x61
/*0x01d9*/  .byte 0xf3
/*0x01da*/  .byte 0x04
/*0x01db*/  .byte 0x14
/*0x01dc*/  .byte 0xf4
/*0x01dd*/  .byte 0xe7
/*0x01de*/  .byte 0x61
/*0x01df*/  .byte 0xf3
/*0x01e0*/  .byte 0x45
/*0x01e1*/  .byte 0x14
/*0x01e2*/  .byte 0xf1
/*0x01e3*/  .byte 0xe7
/*0x01e4*/  .byte 0x61
/*0x01e5*/  .byte 0xf3
/*0x01e6*/  .byte 0x86
/*0x01e7*/  .byte 0x14
/*0x01e8*/  .byte 0xee
/*0x01e9*/  .byte 0xe7
/*0x01ea*/  .byte 0x61
/*0x01eb*/  .byte 0xf3
/*0x01ec*/  .byte 0xc7
/*0x01ed*/  .byte 0x14
/*0x01ee*/  .byte 0xeb
/*0x01ef*/  .byte 0xe7
/*0x01f0*/  .byte 0x61
/*0x01f1*/  .byte 0xf3
/*0x01f2*/  .byte 0x00
/*0x01f3*/  .byte 0x07
/*0x01f4*/  .byte 0x01
/*0x01f5*/  .byte 0xe0
/*0x01f6*/  .byte 0x61
/*0x01f7*/  .byte 0xf3
/*0x01f8*/  .byte 0x41
/*0x01f9*/  .byte 0x07
/*0x01fa*/  .byte 0xd7
/*0x01fb*/  .byte 0x70
/*0x01fc*/  .byte 0xb5
/*0x01fd*/  .byte 0x60
/*0x01fe*/  .byte 0xf0
/*0x01ff*/  .byte 0xbd
/*0x0200*/  .byte 0x14
/*0x0201*/  .byte 0x00
/*0x0202*/  .byte 0x00
/*0x0203*/  .byte 0x20
/*0x0204*/  .byte 0x54
/*0x0205*/  .byte 0x00
/*0x0206*/  .byte 0x00
/*0x0207*/  .byte 0x20
/*0x0208*/  .byte 0x28
/*0x0209*/  .byte 0x00
/*0x020a*/  .byte 0x00
/*0x020b*/  .byte 0x20


            .thumb_func
            call_20c:
/*0x020c*/      cmp r1, #0
/*0x020e*/      ldr r1, [r0]
/*0x0210*/      beq jump_218
/*0x0212*/      orr r1, r1, #4
/*0x0216*/      b jump_21c
            jump_218:
/*0x0218*/      bic r1, r1, #4
            jump_21c:
/*0x021c*/      str r1, [r0]
/*0x021e*/      bx lr

            .thumb_func
            call_220:
/*0x0220*/      cmp r1, #0
/*0x0222*/      ldr r1, [r0]
/*0x0224*/      beq jump_22c
/*0x0226*/      orr r1, r1, #1
/*0x022a*/      b jump_230
            jump_22c:
/*0x022c*/      bic r1, r1, #1
            jump_230:
/*0x0230*/      str r1, [r0]
/*0x0232*/      bx lr

            .thumb_func
            call_234:
/*0x0234*/      lsls r0, r0, #3
/*0x0236*/      lsrs r3, r1, #3
/*0x0238*/      add.w r0, r0, r3, lsl #2
/*0x023c*/      ldr r3, [pc, #0x18] /* data_258 */
/*0x023e*/      push {r4, lr}
/*0x0240*/      add r0, r3
/*0x0242*/      lsls r1, r1, #0x1d
/*0x0244*/      ldr r3, [r0]
/*0x0246*/      lsrs r1, r1, #0x1b
/*0x0248*/      movs r4, #0xf
/*0x024a*/      lsls r4, r1
/*0x024c*/      bics r3, r4
/*0x024e*/      lsls r2, r1
/*0x0250*/      orrs r3, r2
/*0x0252*/      str r3, [r0]
/*0x0254*/      pop {r4, pc}

/*0x0256*/  .byte 0x00
/*0x0257*/  .byte 0x00

            data_258:
/*0x0258*/  .word 0x40022020


            .thumb_func
            setup_afio_gpio:
/*0x025c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0260*/      movs r1, #1
/*0x0262*/      lsls r5, r1, #0xe
/*0x0264*/      mov r0, r5
/*0x0266*/      bl call_3b8
/*0x026a*/      movs r1, #1
/*0x026c*/      lsls r4, r1, #0x10
/*0x026e*/      mov r0, r4
/*0x0270*/      bl ckcu_ahb_clock_enable
/*0x0274*/      ldr r6, [pc, #0x90] /* data_308 */
/*0x0276*/      movs r2, #0
/*0x0278*/      mov r1, r5
/*0x027a*/      mov r0, r6
/*0x027c*/      bl gpio_set_input_enable
/*0x0280*/      asrs r7, r4, #1
/*0x0282*/      movs r2, #0
/*0x0284*/      mov r1, r7
/*0x0286*/      mov r0, r6
/*0x0288*/      bl gpio_set_input_enable
/*0x028c*/      movs r2, #2
/*0x028e*/      mov r1, r5
/*0x0290*/      mov r0, r6
/*0x0292*/      bl gpio_set_pin_pull_up_down
/*0x0296*/      movs r2, #2
/*0x0298*/      mov r1, r7
/*0x029a*/      mov r0, r6
/*0x029c*/      bl gpio_set_pin_pull_up_down
/*0x02a0*/      asrs r5, r4, #5
/*0x02a2*/      movs r2, #0
/*0x02a4*/      mov r1, r5
/*0x02a6*/      mov r0, r6
/*0x02a8*/      bl gpio_set_input_enable
/*0x02ac*/      movs r2, #2
/*0x02ae*/      mov r1, r5
/*0x02b0*/      mov r0, r6
/*0x02b2*/      bl gpio_set_pin_pull_up_down
/*0x02b6*/      movs r2, #1
/*0x02b8*/      movs r1, #0xb
/*0x02ba*/      movs r0, #0
/*0x02bc*/      bl call_234
/*0x02c0*/      movs r2, #1
/*0x02c2*/      movs r1, #0xd
/*0x02c4*/      movs r0, #2
/*0x02c6*/      bl call_234
/*0x02ca*/      movs r2, #1
/*0x02cc*/      movs r1, #0xe
/*0x02ce*/      movs r0, #2
/*0x02d0*/      bl call_234
/*0x02d4*/      movs r2, #1
/*0x02d6*/      movs r1, #0xf
/*0x02d8*/      movs r0, #2
/*0x02da*/      bl call_234
/*0x02de*/      ldr r0, [pc, #0x2c] /* data_30c */
/*0x02e0*/      ldr r0, [r0, #4]
/*0x02e2*/      lsls r0, r0, #0x15
/*0x02e4*/      bmi jump_2fa
/*0x02e6*/      movs r2, #1
/*0x02e8*/      movs r1, #0xe
/*0x02ea*/      mov r0, r2
/*0x02ec*/      bl call_234
/*0x02f0*/      movs r2, #1
/*0x02f2*/      movs r1, #0xf
/*0x02f4*/      mov r0, r2
/*0x02f6*/      bl call_234
            jump_2fa:
/*0x02fa*/      movs r1, #0
/*0x02fc*/      mov r0, r4
/*0x02fe*/      bl ckcu_ahb_clock_enable
/*0x0302*/      movs r0, #1
/*0x0304*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_308:
/*0x0308*/  .word 0x400b0000
            data_30c:
/*0x030c*/  .word 0x40088000

            jump_310:
/*0x0310*/      push {r4, lr}
/*0x0312*/      movs r0, #1
/*0x0314*/      bl usb_dp_pull_up
/*0x0318*/      pop.w {r4, lr}
/*0x031c*/      movs r0, #0xfa
/*0x031e*/      b.w call_102

            .thumb_func
            clear_two_words:
/*0x0322*/      movs r1, #0
/*0x0324*/      str r1, [r0, #4]
/*0x0326*/      str r1, [r0]
/*0x0328*/      bx lr

            .thumb_func
            clear_two_words_and_write_two_bytes:
/*0x032a*/      movs r3, #0
/*0x032c*/      str r3, [r0]
/*0x032e*/      str r3, [r0, #4]
/*0x0330*/      strd r1, r2, [r0, #8]
/*0x0334*/      bx lr

            .thumb_func
            function_e_2:
/*0x0336*/      push {r4, lr}
/*0x0338*/      ldr r4, [r0, #4]
/*0x033a*/      movs r2, #0
/*0x033c*/      ldr r3, [r0]
/*0x033e*/      cmp r4, r3
/*0x0340*/      beq jump_35a
/*0x0342*/      ldr r2, [r0, #8]
/*0x0344*/      ldrb r2, [r2, r3]
/*0x0346*/      strb r2, [r1]
/*0x0348*/      ldr r1, [r0]
/*0x034a*/      ldr r2, [r0, #0xc]
/*0x034c*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x034e*/      udiv r3, r1, r2
/*0x0352*/      mls r1, r2, r3, r1
/*0x0356*/      movs r2, #1
/*0x0358*/      str r1, [r0]
            jump_35a:
/*0x035a*/      mov r0, r2
/*0x035c*/      pop {r4, pc}

            .thumb_func
            function_14:
/*0x035e*/      push {r4, r5, lr}
/*0x0360*/      ldr r3, [r0, #4]
/*0x0362*/      movs r2, #0
/*0x0364*/      ldr r4, [r0, #0xc]
/*0x0366*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x0368*/      udiv r5, r3, r4
/*0x036c*/      mls r3, r4, r5, r3
/*0x0370*/      ldr r4, [r0]
/*0x0372*/      cmp r3, r4
/*0x0374*/      beq jump_38c
/*0x0376*/      ldr r2, [r0, #4]
/*0x0378*/      ldr r3, [r0, #8]
/*0x037a*/      strb r1, [r3, r2]
/*0x037c*/      ldr r1, [r0, #0xc]
/*0x037e*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x0380*/      udiv r3, r2, r1
/*0x0384*/      mls r1, r1, r3, r2
/*0x0388*/      str r1, [r0, #4]
/*0x038a*/      movs r2, #1
            jump_38c:
/*0x038c*/      mov r0, r2
/*0x038e*/      pop {r4, r5, pc}

            .thumb_func
            call_390:
/*0x0390*/      ldr r1, [r0, #4]
/*0x0392*/      ldr r0, [r0]
/*0x0394*/      cmp r1, r0
/*0x0396*/      bne jump_39c
/*0x0398*/      movs r0, #1
/*0x039a*/      bx lr
            jump_39c:
/*0x039c*/      movs r0, #0
/*0x039e*/      bx lr

            .thumb_func
            ckcu_ahb_clock_enable:
/*0x03a0*/      ldr r2, [pc, #0x10] /* data_3b4 */
/*0x03a2*/      cmp r1, #1
/*0x03a4*/      ldr r1, [r2, #0x24]
/*0x03a6*/      beq jump_3ae
/*0x03a8*/      bics r1, r0
            jump_3aa:
/*0x03aa*/      str r1, [r2, #0x24]
/*0x03ac*/      bx lr
            jump_3ae:
/*0x03ae*/      orrs r1, r0
/*0x03b0*/      b jump_3aa

/*0x03b2*/  .byte 0x00
/*0x03b3*/  .byte 0x00

            data_3b4:
/*0x03b4*/  .word 0x40088000


            .thumb_func
            call_3b8:
/*0x03b8*/      ldr r2, [pc, #0x10] /* data_3cc */
/*0x03ba*/      cmp r1, #1
/*0x03bc*/      ldr r1, [r2, #0x2c]
/*0x03be*/      beq jump_3c6
/*0x03c0*/      bics r1, r0
            jump_3c2:
/*0x03c2*/      str r1, [r2, #0x2c]
/*0x03c4*/      bx lr
            jump_3c6:
/*0x03c6*/      orrs r1, r0
/*0x03c8*/      b jump_3c2

/*0x03ca*/  .byte 0x00
/*0x03cb*/  .byte 0x00

            data_3cc:
/*0x03cc*/  .word 0x40088000


            .thumb_func
            call_3d0:
/*0x03d0*/      ldr r2, [pc, #0x10] /* data_3e4 */
/*0x03d2*/      cmp r1, #1
/*0x03d4*/      ldr r1, [r2, #0x30]
/*0x03d6*/      beq jump_3de
/*0x03d8*/      bics r1, r0
            jump_3da:
/*0x03da*/      str r1, [r2, #0x30]
/*0x03dc*/      bx lr
            jump_3de:
/*0x03de*/      orrs r1, r0
/*0x03e0*/      b jump_3da

/*0x03e2*/  .byte 0x00
/*0x03e3*/  .byte 0x00

            data_3e4:
/*0x03e4*/  .word 0x40088000


            .thumb_func
            call_3e8:
/*0x03e8*/      ldr r1, [pc, #0xc] /* data_3f8 */
/*0x03ea*/      ldr r2, [r1]
/*0x03ec*/      bic r2, r2, #0xc00000
/*0x03f0*/      orr.w r0, r2, r0, lsl #22
/*0x03f4*/      str r0, [r1]
/*0x03f6*/      bx lr

            data_3f8:
/*0x03f8*/  .word 0x40088000


            .thumb_func
            crc16:
/*0x03fc*/      push {r4, r5, r6, r7, lr}
/*0x03fe*/      movs r6, #0
/*0x0400*/      b jump_438
            jump_402:
/*0x0402*/      ldrb r3, [r1, r6]
/*0x0404*/      movw ip, #0x1021
/*0x0408*/      eor.w r3, r3, r0, lsr #8
/*0x040c*/      lsl.w r4, r3, #8
/*0x0410*/      movs r3, #0
/*0x0412*/      movs r5, #8
            jump_414:
/*0x0414*/      eor.w lr, r4, r3
/*0x0418*/      lsl.w r7, r3, #1
/*0x041c*/      lsls.w lr, lr, #0x10
/*0x0420*/      bpl jump_426
/*0x0422*/      eor.w r7, ip, r3, lsl #1
            jump_426:
/*0x0426*/      mov r3, r7
/*0x0428*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x042a*/      lsl.w r4, r4, #1
/*0x042e*/      bne jump_414
/*0x0430*/      uxth r3, r7
/*0x0432*/      eor.w r0, r3, r0, lsl #8
/*0x0436*/      .short 0x1c76 /* adds r6, r6, #1 */ 
            jump_438:
/*0x0438*/      cmp r6, r2
/*0x043a*/      blo jump_402
/*0x043c*/      uxth r0, r0
/*0x043e*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            flash_page_erase:
/*0x0440*/      ldr r1, [pc, #0xc] /* data_450 */
/*0x0442*/      str r0, [r1]
/*0x0444*/      movs r0, #8
/*0x0446*/      str r0, [r1, #0xc]
/*0x0448*/      movs r0, #0x14
/*0x044a*/      str r0, [r1, #0x10]
/*0x044c*/      b.w jump_474

            data_450:
/*0x0450*/  .word 0x40080000


            .thumb_func
            flash_get_protection_status:
/*0x0454*/      ldr r0, [pc, #4] /* data_45c */
/*0x0456*/      ldr r0, [r0, #0x30]
/*0x0458*/      bx lr

/*0x045a*/  .byte 0x00
/*0x045b*/  .byte 0x00

            data_45c:
/*0x045c*/  .word 0x40080000


            .thumb_func
            flash_write:
/*0x0460*/      ldr r3, [pc, #0xc] /* data_470 */
/*0x0462*/      str r0, [r3, #0xc]
/*0x0464*/      str r1, [r3]
/*0x0466*/      str r2, [r3, #4]
/*0x0468*/      movs r0, #0x14
/*0x046a*/      str r0, [r3, #0x10]
/*0x046c*/      bx lr

/*0x046e*/  .byte 0x00
/*0x046f*/  .byte 0x00

            data_470:
/*0x0470*/  .word 0x40080000

            jump_474:
/*0x0474*/      ldr r0, [pc, #0x18] /* data_490 */
/*0x0476*/      ldr r1, [pc, #0x1c] /* data_494 */
/*0x0478*/      b jump_484
            jump_47a:
/*0x047a*/      ldr r2, [r1, #0x10]
/*0x047c*/      ubfx r2, r2, #2, #2
/*0x0480*/      cmp r2, #3
/*0x0482*/      beq jump_48c
            jump_484:
/*0x0484*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0486*/      bhs jump_47a
/*0x0488*/      movs r0, #8
/*0x048a*/      bx lr
            jump_48c:
/*0x048c*/      movs r0, #0
/*0x048e*/      bx lr

            data_490:
/*0x0490*/  .word 0x000fffff
            data_494:
/*0x0494*/  .word 0x40080000


            .thumb_func
            call_498:
/*0x0498*/      cmp r2, #0
/*0x049a*/      ldr r2, [r0]
/*0x049c*/      beq jump_4a2
/*0x049e*/      orrs r2, r1
/*0x04a0*/      b jump_4a4
            jump_4a2:
/*0x04a2*/      bics r2, r1
            jump_4a4:
/*0x04a4*/      str r2, [r0]
/*0x04a6*/      bx lr

            .thumb_func
            gpio_set_input_enable:
/*0x04a8*/      cmp r2, #0
/*0x04aa*/      ldr r2, [r0, #4]
/*0x04ac*/      beq jump_4b2
/*0x04ae*/      orrs r2, r1
/*0x04b0*/      b jump_4b4
            jump_4b2:
/*0x04b2*/      bics r2, r1
            jump_4b4:
/*0x04b4*/      str r2, [r0, #4]
/*0x04b6*/      bx lr

            .thumb_func
            call_4b8:
/*0x04b8*/      cmp r2, #0
/*0x04ba*/      ldr r2, [r0, #0x10]
/*0x04bc*/      beq jump_4c2
/*0x04be*/      orrs r2, r1
/*0x04c0*/      b jump_4c4
            jump_4c2:
/*0x04c2*/      bics r2, r1
            jump_4c4:
/*0x04c4*/      str r2, [r0, #0x10]
/*0x04c6*/      bx lr

            .thumb_func
            gpio_set_pin_pull_up_down:
/*0x04c8*/      cbz r2, jump_4dc
/*0x04ca*/      cmp r2, #1
/*0x04cc*/      beq jump_4e2
/*0x04ce*/      ldr r2, [r0, #8]
/*0x04d0*/      bics r2, r1
            jump_4d2:
/*0x04d2*/      str r2, [r0, #8]
/*0x04d4*/      ldr r2, [r0, #0xc]
/*0x04d6*/      bics r2, r1
/*0x04d8*/      str r2, [r0, #0xc]
/*0x04da*/      bx lr
            jump_4dc:
/*0x04dc*/      ldr r2, [r0, #8]
/*0x04de*/      orrs r2, r1
/*0x04e0*/      b jump_4d2
            jump_4e2:
/*0x04e2*/      ldr r2, [r0, #0xc]
/*0x04e4*/      orrs r2, r1
/*0x04e6*/      str r2, [r0, #0xc]
/*0x04e8*/      ldr r2, [r0, #8]
/*0x04ea*/      bics r2, r1
/*0x04ec*/      str r2, [r0, #8]
/*0x04ee*/      bx lr

            .thumb_func
            i2c1_intr:
/*0x04f0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x04f4*/      ldr r0, [pc, #0x11c] /* data_614 */
/*0x04f6*/      ldr r2, [r0, #0xc]
/*0x04f8*/      str r2, [r0, #0xc]
/*0x04fa*/      ldr r4, [pc, #0x11c] /* data_618 */
/*0x04fc*/      lsls r1, r2, #0x15
/*0x04fe*/      mov.w sb, #0
/*0x0502*/      bpl jump_508
/*0x0504*/      movs r1, #5
/*0x0506*/      b jump_608
            jump_508:
/*0x0508*/      lsls r1, r2, #0x17
/*0x050a*/      bpl jump_510
/*0x050c*/      movs r1, #4
/*0x050e*/      b jump_608
            jump_510:
/*0x0510*/      lsls r1, r2, #0x14
/*0x0512*/      bpl jump_518
/*0x0514*/      movs r1, #6
/*0x0516*/      b jump_608
            jump_518:
/*0x0518*/      ldr r1, [pc, #0xfc] /* data_618 */
/*0x051a*/      lsls r3, r2, #0x16
/*0x051c*/      ldrb r1, [r1]
/*0x051e*/      bpl jump_530
/*0x0520*/      ldrh r2, [r4, #0xa]
/*0x0522*/      cbz r2, jump_52c
/*0x0524*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x0526*/      strh r2, [r4, #0xa]
/*0x0528*/      movs r2, #0
/*0x052a*/      b jump_5a4
            jump_52c:
/*0x052c*/      movs r1, #2
/*0x052e*/      b jump_608
            jump_530:
/*0x0530*/      ldr.w ip, [r4, #0x10]
/*0x0534*/      cmp.w ip, #0
/*0x0538*/      beq jump_606
/*0x053a*/      ldr r5, [pc, #0xdc] /* data_618 */
/*0x053c*/      ldrh r3, [r5, #8]
/*0x053e*/      ldrh r5, [r5, #6]
/*0x0540*/      adds r6, r3, #1
/*0x0542*/      uxth r6, r6
/*0x0544*/      cmp.w r2, #0x190000
/*0x0548*/      beq jump_5cc
/*0x054a*/      bgt jump_566
/*0x054c*/      mvn r1, #0x180000
/*0x0550*/      adds r1, r2, r1
/*0x0552*/      beq jump_592
/*0x0554*/      cmp r1, #3
/*0x0556*/      bne jump_592
/*0x0558*/      cmp r5, #1
/*0x055a*/      bls jump_592
/*0x055c*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x0560*/      movs r1, #1
/*0x0562*/      b.w call_620
            jump_566:
/*0x0566*/      ldr r7, [pc, #0xb0] /* data_618 */
/*0x0568*/      ldr.w r8, [pc, #0xb0] /* data_61c */
/*0x056c*/      mov.w sl, #1
/*0x0570*/      ldrh r7, [r7, #4]
/*0x0572*/      cmp.w r2, #0x3a0000
/*0x0576*/      beq jump_596
/*0x0578*/      sub.w r2, r2, #0x3a0000
/*0x057c*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x057e*/      bne jump_592
/*0x0580*/      ldrb r1, [r4, #1]
/*0x0582*/      cmp r1, #1
/*0x0584*/      beq jump_58a
/*0x0586*/      str r7, [r0, #0x18]
/*0x0588*/      b jump_5c6
            jump_58a:
/*0x058a*/      lsrs r1, r7, #8
/*0x058c*/      str r1, [r0, #0x18]
/*0x058e*/      strb.w sb, [r8, #1]
            jump_592:
/*0x0592*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_596:
/*0x0596*/      ldrb.w r2, [r8, #1]
/*0x059a*/      cbz r2, jump_5c2
/*0x059c*/      ldrb r2, [r4, #2]
/*0x059e*/      cbz r2, jump_5ac
/*0x05a0*/      mov.w r2, #0x400
            jump_5a4:
/*0x05a4*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x05a8*/      b.w jump_63e
            jump_5ac:
/*0x05ac*/      cmp r3, r5
/*0x05ae*/      bhs jump_5ba
/*0x05b0*/      ldrb.w r1, [ip, r3]
/*0x05b4*/      str r1, [r0, #0x18]
/*0x05b6*/      strh r6, [r4, #8]
/*0x05b8*/      b jump_592
            jump_5ba:
/*0x05ba*/      mov r5, sb
/*0x05bc*/      strb.w sb, [r4, #3]
/*0x05c0*/      b jump_5f4
            jump_5c2:
/*0x05c2*/      uxtb r1, r7
/*0x05c4*/      str r1, [r0, #0x18]
            jump_5c6:
/*0x05c6*/      strb.w sl, [r8, #1]
/*0x05ca*/      b jump_592
            jump_5cc:
/*0x05cc*/      mov r7, r0
/*0x05ce*/      ldr r0, [r0, #0x18]
/*0x05d0*/      strb.w r0, [ip, r3]
/*0x05d4*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x05d6*/      strh r6, [r4, #8]
/*0x05d8*/      cmp r6, r5
/*0x05da*/      bne jump_5e4
/*0x05dc*/      movs r1, #0
/*0x05de*/      mov r0, r7
/*0x05e0*/      bl call_620
            jump_5e4:
/*0x05e4*/      ldrh r0, [r4, #8]
/*0x05e6*/      ldrh r1, [r4, #6]
/*0x05e8*/      cmp r0, r1
/*0x05ea*/      bne jump_592
/*0x05ec*/      mov r5, sb
/*0x05ee*/      strb.w sb, [r4, #3]
/*0x05f2*/      mov r0, r7
            jump_5f4:
/*0x05f4*/      bl call_634
/*0x05f8*/      str r5, [r4, #0x10]
/*0x05fa*/      ldr r0, [r4, #0xc]
/*0x05fc*/      cmp r0, #0
/*0x05fe*/      beq jump_592
/*0x0600*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x0604*/      bx r0
            jump_606:
/*0x0606*/      movs r1, #3
            jump_608:
/*0x0608*/      strb r1, [r4, #3]
/*0x060a*/      bl call_634
/*0x060e*/      str.w sb, [r4, #0x10]
/*0x0612*/      b jump_592

            data_614:
/*0x0614*/  .word 0x40049000
            data_618:
/*0x0618*/  .word 0x200006c4
            data_61c:
/*0x061c*/  .word 0x200000b1


            .thumb_func
            call_620:
/*0x0620*/      cmp r1, #0
/*0x0622*/      ldr r1, [r0]
/*0x0624*/      beq jump_62c
/*0x0626*/      orr r1, r1, #1
/*0x062a*/      b jump_630
            jump_62c:
/*0x062c*/      bic r1, r1, #1
            jump_630:
/*0x0630*/      str r1, [r0]
/*0x0632*/      bx lr

            .thumb_func
            call_634:
/*0x0634*/      ldr r1, [r0]
/*0x0636*/      orr r1, r1, #2
/*0x063a*/      str r1, [r0]
/*0x063c*/      bx lr
            jump_63e:
/*0x063e*/      ldr r3, [r0]
/*0x0640*/      lsls r3, r3, #0x1e
/*0x0642*/      bmi jump_63e
/*0x0644*/      cbz r2, jump_64a
/*0x0646*/      orr r1, r1, #0x400
            jump_64a:
/*0x064a*/      str r1, [r0, #0x1c]
/*0x064c*/      bx lr

/*0x064e*/  .byte 0x00
/*0x064f*/  .byte 0x00


            .thumb_func
            handle_update_packet:
/*0x0650*/      push {r4, r5, r6, lr}
/*0x0652*/      ldr r0, [pc, #0x74] /* data_6c8 */
/*0x0654*/      ldr r1, [r0]
/*0x0656*/      cmp r1, #1
/*0x0658*/      bne jump_6c4
/*0x065a*/      movs r6, #0
/*0x065c*/      str r6, [r0]
/*0x065e*/      ldr r4, [pc, #0x6c] /* data_6cc */
/*0x0660*/      ldr r5, [pc, #0x6c] /* data_6d0 */
/*0x0662*/      str r6, [r4, #8]
            jump_664:
/*0x0664*/      ldr r0, [r4, #8]
/*0x0666*/      adds r1, r5, r0
/*0x0668*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x066a*/      str r0, [r4, #8]
/*0x066c*/      ldr r0, [pc, #0x64] /* data_6d4 */
/*0x066e*/      bl function_e_2
/*0x0672*/      ldr r0, [r4, #8]
/*0x0674*/      cmp r0, #0x40
/*0x0676*/      blo jump_664
/*0x0678*/      ldrh r4, [r5, #2]
/*0x067a*/      strb r6, [r5, #3]
/*0x067c*/      strb r6, [r5, #2]
/*0x067e*/      movs r2, #0x40
/*0x0680*/      ldr r1, [pc, #0x4c] /* data_6d0 */
/*0x0682*/      movs r0, #0
/*0x0684*/      bl crc16
/*0x0688*/      ldrb r1, [r5]
/*0x068a*/      cmp r1, #6
/*0x068c*/      bhi jump_692
/*0x068e*/      cmp r4, r0
/*0x0690*/      beq jump_69c
            jump_692:
/*0x0692*/      movs r4, #0x46
/*0x0694*/      ldr r0, [pc, #0x3c] /* data_6d4 */
/*0x0696*/      bl clear_two_words
/*0x069a*/      b jump_6b6
            jump_69c:
/*0x069c*/      mvn r0, #1
/*0x06a0*/      bl function_e_4
/*0x06a4*/      ldrb r3, [r5]
/*0x06a6*/      ldr r4, [pc, #0x30] /* data_6d8 */
/*0x06a8*/      ldrd r1, r2, [r5, #4]
/*0x06ac*/      ldr.w r3, [r4, r3, lsl #2]
/*0x06b0*/      ldrb r0, [r5, #1]
/*0x06b2*/      blx r3
/*0x06b4*/      mov r4, r0
            jump_6b6:
/*0x06b6*/      mov r1, r4
/*0x06b8*/      pop.w {r4, r5, r6, lr}
/*0x06bc*/      ldr r0, [pc, #0x14] /* data_6d4 */
/*0x06be*/      subs r0, #0x10
/*0x06c0*/      b.w function_14
            jump_6c4:
/*0x06c4*/      pop {r4, r5, r6, pc}

/*0x06c6*/  .byte 0x00
/*0x06c7*/  .byte 0x00

            data_6c8:
/*0x06c8*/  .word 0x20000024
            data_6cc:
/*0x06cc*/  .word 0x20000048
            data_6d0:
/*0x06d0*/  .word 0x20000630
            data_6d4:
/*0x06d4*/  .word 0x200001cc
            data_6d8:
/*0x06d8*/  .word 0x000021bc /* possible pointer */


            .thumb_func
            function_b_3:
/*0x06dc*/      ldr r0, [pc, #0x54] /* data_734 */
/*0x06de*/      push {r4, lr}
/*0x06e0*/      ldr r1, [r0]
/*0x06e2*/      uxth r1, r1
/*0x06e4*/      orr r2, r1, #0x11000000
/*0x06e8*/      ldr r1, [pc, #0x4c] /* data_738 */
/*0x06ea*/      str r2, [r1]
/*0x06ec*/      ldr r2, [r0, #8]
/*0x06ee*/      mov.w r3, #0x2c00
/*0x06f2*/      orr.w r2, r3, r2, lsl #16
/*0x06f6*/      str r2, [r1, #4]
/*0x06f8*/      ldr r2, [r0, #4]
/*0x06fa*/      ldr r0, [r0, #4]
/*0x06fc*/      sub.w r2, r2, #0xa
/*0x0700*/      sub.w r0, r0, #0xa
/*0x0704*/      orr.w r0, r2, r0, lsl #16
/*0x0708*/      str r0, [r1, #8]
/*0x070a*/      mov.w r0, #0x2800
/*0x070e*/      str r0, [r1, #0xc]
/*0x0710*/      sub.w r1, r1, #0x44
/*0x0714*/      mov.w r2, #0x44
/*0x0718*/      sub.w r0, r1, #0x420
/*0x071c*/      bl clear_two_words_and_write_two_bytes
/*0x0720*/      ldr r1, [pc, #0x18] /* data_73c */
/*0x0722*/      pop.w {r4, lr}
/*0x0726*/      mov.w r2, #0x400
/*0x072a*/      sub.w r0, r1, #0x10
/*0x072e*/      b.w clear_two_words_and_write_two_bytes

/*0x0732*/  .byte 0x00
/*0x0733*/  .byte 0x00

            data_734:
/*0x0734*/  .word 0x40080180
            data_738:
/*0x0738*/  .word 0x20000620
            data_73c:
/*0x073c*/  .word 0x200001dc


            .thumb_func
            reset_cmd:
/*0x0740*/      push {r4, r5, r6, lr}
/*0x0742*/      mov r4, r0
/*0x0744*/      movs r1, #1
/*0x0746*/      lsls r0, r1, #0x10
/*0x0748*/      bl ckcu_ahb_clock_enable
/*0x074c*/      ldr r1, [pc, #0x58] /* data_7a8 */
/*0x074e*/      mov.w r2, #0x200
/*0x0752*/      str r2, [r1, #0x24]
/*0x0754*/      ldr r5, [pc, #0x54] /* data_7ac */
/*0x0756*/      cbz r4, jump_75c
/*0x0758*/      ldr r0, [pc, #0x54] /* data_7b0 */
/*0x075a*/      b jump_76c
            jump_75c:
/*0x075c*/      bl check_ver_str
/*0x0760*/      cbz r0, jump_7a2
/*0x0762*/      bl call_7e8
/*0x0766*/      cbz r0, jump_7a2
/*0x0768*/      ldr r0, [pc, #0x44] /* data_7b0 */
/*0x076a*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_76c:
/*0x076c*/      str.w r0, [r5, #0x304]
/*0x0770*/      ldr r1, [pc, #0x40] /* data_7b4 */
/*0x0772*/      mov.w r0, #0x200000
/*0x0776*/      mov.w r4, #-0x1fff2000
/*0x077a*/      str r0, [r1]
/*0x077c*/      bl usb_disable_dppu
/*0x0780*/      ldr r0, [pc, #0x34] /* data_7b8 */
            jump_782:
/*0x0782*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0784*/      bne jump_782
/*0x0786*/      dsb sy
/*0x078a*/      ldr.w r0, [r4, #0xd0c]
/*0x078e*/      ldr r1, [pc, #0x2c] /* data_7bc */
/*0x0790*/      and r0, r0, #0x700
/*0x0794*/      orr.w r0, r0, r1
/*0x0798*/      str.w r0, [r4, #0xd0c]
/*0x079c*/      dsb sy
            jump_7a0:
/*0x07a0*/      b jump_7a0
            jump_7a2:
/*0x07a2*/      movs r0, #0
/*0x07a4*/      pop {r4, r5, r6, pc}

/*0x07a6*/  .byte 0x00
/*0x07a7*/  .byte 0x00

            data_7a8:
/*0x07a8*/  .word 0x400b0000
            data_7ac:
/*0x07ac*/  .word 0x40080000
            data_7b0:
/*0x07b0*/  .word 0x55aafaf5
            data_7b4:
/*0x07b4*/  .word 0xe000e184
            data_7b8:
/*0x07b8*/  .word 0x00061a80
            data_7bc:
/*0x07bc*/  .word 0x05fa0004


            .thumb_func
            check_ver_str:
/*0x07c0*/      mov.w r1, #0x2000
/*0x07c4*/      ldr.w r0, [r1, #0xc00]
/*0x07c8*/      sub.w r0, r0, #0x20000000
/*0x07cc*/      cmp.w r0, #0x10001
/*0x07d0*/      bhs jump_7e0
/*0x07d2*/      ldr.w r0, [r1, #0xc04]
/*0x07d6*/      sub.w r0, r0, #0x2c00
/*0x07da*/      cmp.w r0, #0x1d000
/*0x07de*/      blo jump_7e4
            jump_7e0:
/*0x07e0*/      movs r0, #0
/*0x07e2*/      bx lr
            jump_7e4:
/*0x07e4*/      movs r0, #1
/*0x07e6*/      bx lr

            .thumb_func
            call_7e8:
/*0x07e8*/      mov.w r0, #0x2800
/*0x07ec*/      ldr r1, [r0]
/*0x07ee*/      adds r0, r1, #1
/*0x07f0*/      beq jump_808
/*0x07f2*/      movw r3, #0x2804
/*0x07f6*/      movs r0, #0
/*0x07f8*/      b jump_802
            jump_7fa:
/*0x07fa*/      ldr r2, [r3, r0]
/*0x07fc*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x07fe*/      beq jump_80a
/*0x0800*/      .short 0x1d00 /* adds r0, r0, #4 */ 
            jump_802:
/*0x0802*/      cmp r0, r1
/*0x0804*/      blo jump_7fa
/*0x0806*/      movs r0, #1
            jump_808:
/*0x0808*/      bx lr
            jump_80a:
/*0x080a*/      movs r0, #0
/*0x080c*/      bx lr

/*0x080e*/  .byte 0x00
/*0x080f*/  .byte 0x00


            .thumb_func
            call_810:
/*0x0810*/      push {r4, lr}
/*0x0812*/      bl call_830
/*0x0816*/      ldr r4, [pc, #0x14] /* data_82c */
/*0x0818*/      ldrb r0, [r4]
/*0x081a*/      cmp r0, #1
/*0x081c*/      bne jump_826
/*0x081e*/      bl call_858
/*0x0822*/      movs r0, #2
/*0x0824*/      strb r0, [r4]
            jump_826:
/*0x0826*/      movs r0, #1
/*0x0828*/      pop {r4, pc}

/*0x082a*/  .byte 0x00
/*0x082b*/  .byte 0x00

            data_82c:
/*0x082c*/  .word 0x200000b0


            .thumb_func
            call_830:
/*0x0830*/      push {r4, lr}
/*0x0832*/      ldr r4, [pc, #0x14] /* data_848 */
/*0x0834*/      ldrb r0, [r4]
/*0x0836*/      cbnz r0, jump_844
/*0x0838*/      movs r1, #1
/*0x083a*/      lsls r0, r1, #0x11
/*0x083c*/      bl ckcu_ahb_clock_enable
/*0x0840*/      movs r0, #1
/*0x0842*/      strb r0, [r4]
            jump_844:
/*0x0844*/      movs r0, #1
/*0x0846*/      pop {r4, pc}

            data_848:
/*0x0848*/  .word 0x200000b0


            .thumb_func
            call_84c:
/*0x084c*/      cbz r0, jump_852
/*0x084e*/      b.w jump_868
            jump_852:
/*0x0852*/      b.w call_858

/*0x0856*/  .byte 0x00
/*0x0857*/  .byte 0x00


            .thumb_func
            call_858:
/*0x0858*/      movs r2, #1
/*0x085a*/      movs r1, #0x40
/*0x085c*/      ldr r0, [pc, #4] /* data_864 */
/*0x085e*/      b.w call_498

/*0x0862*/  .byte 0x00
/*0x0863*/  .byte 0x00

            data_864:
/*0x0864*/  .word 0x400b2000

            jump_868:
/*0x0868*/      movs r2, #0
/*0x086a*/      movs r1, #0x40
/*0x086c*/      ldr r0, [pc, #4] /* data_874 */
/*0x086e*/      b.w call_498

/*0x0872*/  .byte 0x00
/*0x0873*/  .byte 0x00

            data_874:
/*0x0874*/  .word 0x400b2000

/*0x0878*/  .byte 0x10
/*0x0879*/  .byte 0xb5
/*0x087a*/  .byte 0x0e
/*0x087b*/  .byte 0x21
/*0x087c*/  .byte 0x15
/*0x087d*/  .byte 0x4b
/*0x087e*/  .byte 0xb1
/*0x087f*/  .byte 0xeb
/*0x0880*/  .byte 0x10
/*0x0881*/  .byte 0x1f
/*0x0882*/  .byte 0x09
/*0x0883*/  .byte 0xd1
/*0x0884*/  .byte 0x00
/*0x0885*/  .byte 0xf0
/*0x0886*/  .byte 0x0f
/*0x0887*/  .byte 0x00
/*0x0888*/  .byte 0x08
/*0x0889*/  .byte 0x28
/*0x088a*/  .byte 0x1b
/*0x088b*/  .byte 0xd2
/*0x088c*/  .byte 0x19
/*0x088d*/  .byte 0x78
/*0x088e*/  .byte 0x01
/*0x088f*/  .byte 0x22
/*0x0890*/  .byte 0x82
/*0x0891*/  .byte 0x40
/*0x0892*/  .byte 0x11
/*0x0893*/  .byte 0x43
/*0x0894*/  .byte 0x19
/*0x0895*/  .byte 0x70
/*0x0896*/  .byte 0x15
/*0x0897*/  .byte 0xe0
/*0x0898*/  .byte 0x00
/*0x0899*/  .byte 0x22
/*0x089a*/  .byte 0x11
/*0x089b*/  .byte 0x46
/*0x089c*/  .byte 0x5c
/*0x089d*/  .byte 0x18
/*0x089e*/  .byte 0xa4
/*0x089f*/  .byte 0x78
/*0x08a0*/  .byte 0x84
/*0x08a1*/  .byte 0x42
/*0x08a2*/  .byte 0x00
/*0x08a3*/  .byte 0xd1
/*0x08a4*/  .byte 0x01
/*0x08a5*/  .byte 0x22
/*0x08a6*/  .byte 0x49
/*0x08a7*/  .byte 0x1c
/*0x08a8*/  .byte 0xc9
/*0x08a9*/  .byte 0xb2
/*0x08aa*/  .byte 0x06
/*0x08ab*/  .byte 0x29
/*0x08ac*/  .byte 0xf6
/*0x08ad*/  .byte 0xd3
/*0x08ae*/  .byte 0x4a
/*0x08af*/  .byte 0xb9
/*0x08b0*/  .byte 0x00
/*0x08b1*/  .byte 0x21
/*0x08b2*/  .byte 0x5a
/*0x08b3*/  .byte 0x18
/*0x08b4*/  .byte 0x92
/*0x08b5*/  .byte 0x78
/*0x08b6*/  .byte 0x3a
/*0x08b7*/  .byte 0xb1
/*0x08b8*/  .byte 0x49
/*0x08b9*/  .byte 0x1c
/*0x08ba*/  .byte 0xc9
/*0x08bb*/  .byte 0xb2
/*0x08bc*/  .byte 0x06
/*0x08bd*/  .byte 0x29
/*0x08be*/  .byte 0xf8
/*0x08bf*/  .byte 0xd3
/*0x08c0*/  .byte 0x06
/*0x08c1*/  .byte 0x29
/*0x08c2*/  .byte 0x04
/*0x08c3*/  .byte 0xd0
/*0x08c4*/  .byte 0x01
/*0x08c5*/  .byte 0x20
/*0x08c6*/  .byte 0x10
/*0x08c7*/  .byte 0xbd
/*0x08c8*/  .byte 0x5a
/*0x08c9*/  .byte 0x18
/*0x08ca*/  .byte 0x90
/*0x08cb*/  .byte 0x70
/*0x08cc*/  .byte 0xf8
/*0x08cd*/  .byte 0xe7
/*0x08ce*/  .byte 0x00
/*0x08cf*/  .byte 0x20
/*0x08d0*/  .byte 0x10
/*0x08d1*/  .byte 0xbd
/*0x08d2*/  .byte 0x00
/*0x08d3*/  .byte 0x00
/*0x08d4*/  .byte 0x30
/*0x08d5*/  .byte 0x00
/*0x08d6*/  .byte 0x00
/*0x08d7*/  .byte 0x20

            jump_8d8:
/*0x08d8*/      ldr r1, [pc, #8] /* data_8e4 */
/*0x08da*/      movw r0, #0xe878
/*0x08de*/      str r0, [r1, #0x58]
/*0x08e0*/      bx lr

/*0x08e2*/  .byte 0x00
/*0x08e3*/  .byte 0x00

            data_8e4:
/*0x08e4*/  .word 0x40024000


            .thumb_func
            call_8e8:
/*0x08e8*/      ldr r0, [pc, #0xc] /* data_8f8 */
/*0x08ea*/      ldr r0, [r0, #0x58]
/*0x08ec*/      movw r1, #0xe878
/*0x08f0*/      ands r0, r1
/*0x08f2*/      beq jump_8f6
/*0x08f4*/      movs r0, #1
            jump_8f6:
/*0x08f6*/      bx lr

            data_8f8:
/*0x08f8*/  .word 0x40024000


            .thumb_func
            function_b_1:
/*0x08fc*/      push {lr}
/*0x08fe*/      sub sp, #0x14
/*0x0900*/      bl call_810
/*0x0904*/      bl call_aa0
/*0x0908*/      ldr r0, [pc, #0x2c] /* data_938 */
/*0x090a*/      str r0, [sp, #0xc]
/*0x090c*/      movs r0, #9
/*0x090e*/      strb.w r0, [sp, #0x13]
/*0x0912*/      movs r0, #0x49
/*0x0914*/      strh.w r0, [sp, #0x10]
/*0x0918*/      ldr r0, [pc, #0x20] /* data_93c */
/*0x091a*/      str r0, [sp]
/*0x091c*/      movs r0, #1
/*0x091e*/      strb.w r0, [sp, #0x12]
/*0x0922*/      movs r0, #0
/*0x0924*/      str r0, [sp, #4]
/*0x0926*/      str r0, [sp, #8]
/*0x0928*/      mov r0, sp
/*0x092a*/      bl call_cbc
/*0x092e*/      bl call_b14
/*0x0932*/      add sp, #0x14
/*0x0934*/      pop {pc}

/*0x0936*/  .byte 0x00
/*0x0937*/  .byte 0x00

            data_938:
/*0x0938*/  .word 0x00002264 /* possible pointer */
            data_93c:
/*0x093c*/  .word 0x00000941 /* possible pointer */

/*0x0940*/  .byte 0x2d
/*0x0941*/  .byte 0xe9
/*0x0942*/  .byte 0xf0
/*0x0943*/  .byte 0x47
/*0x0944*/  .byte 0x0b
/*0x0945*/  .byte 0x46
/*0x0946*/  .byte 0x11
/*0x0947*/  .byte 0x46
/*0x0948*/  .byte 0x32
/*0x0949*/  .byte 0x4a
/*0x094a*/  .byte 0x4f
/*0x094b*/  .byte 0xf0
/*0x094c*/  .byte 0x01
/*0x094d*/  .byte 0x09
/*0x094e*/  .byte 0x02
/*0x094f*/  .byte 0xeb
/*0x0950*/  .byte 0xc0
/*0x0951*/  .byte 0x00
/*0x0952*/  .byte 0xc4
/*0x0953*/  .byte 0x5c
/*0x0954*/  .byte 0xe7
/*0x0955*/  .byte 0x2c
/*0x0956*/  .byte 0x00
/*0x0957*/  .byte 0xd1
/*0x0958*/  .byte 0xe8
/*0x0959*/  .byte 0x24
/*0x095a*/  .byte 0xdf
/*0x095b*/  .byte 0xf8
/*0x095c*/  .byte 0xbc
/*0x095d*/  .byte 0x80
/*0x095e*/  .byte 0x2f
/*0x095f*/  .byte 0x4d
/*0x0960*/  .byte 0xa8
/*0x0961*/  .byte 0xf1
/*0x0962*/  .byte 0x20
/*0x0963*/  .byte 0x07
/*0x0964*/  .byte 0x05
/*0x0965*/  .byte 0xf1
/*0x0966*/  .byte 0x10
/*0x0967*/  .byte 0x02
/*0x0968*/  .byte 0x01
/*0x0969*/  .byte 0x26
/*0x096a*/  .byte 0x61
/*0x096b*/  .byte 0xb3
/*0x096c*/  .byte 0xe8
/*0x096d*/  .byte 0x2c
/*0x096e*/  .byte 0x03
/*0x096f*/  .byte 0xd0
/*0x0970*/  .byte 0x28
/*0x0971*/  .byte 0x78
/*0x0972*/  .byte 0x01
/*0x0973*/  .byte 0x28
/*0x0974*/  .byte 0x01
/*0x0975*/  .byte 0xd0
/*0x0976*/  .byte 0x17
/*0x0977*/  .byte 0xe0
/*0x0978*/  .byte 0x2e
/*0x0979*/  .byte 0x70
/*0x097a*/  .byte 0x00
/*0x097b*/  .byte 0x20
/*0x097c*/  .byte 0x3b
/*0x097d*/  .byte 0x5c
/*0x097e*/  .byte 0xa3
/*0x097f*/  .byte 0x42
/*0x0980*/  .byte 0x04
/*0x0981*/  .byte 0xd0
/*0x0982*/  .byte 0x40
/*0x0983*/  .byte 0x1c
/*0x0984*/  .byte 0xc0
/*0x0985*/  .byte 0xb2
/*0x0986*/  .byte 0x20
/*0x0987*/  .byte 0x28
/*0x0988*/  .byte 0xf8
/*0x0989*/  .byte 0xd3
/*0x098a*/  .byte 0x0d
/*0x098b*/  .byte 0xe0
/*0x098c*/  .byte 0x20
/*0x098d*/  .byte 0x28
/*0x098e*/  .byte 0x0b
/*0x098f*/  .byte 0xd2
/*0x0990*/  .byte 0x01
/*0x0991*/  .byte 0x24
/*0x0992*/  .byte 0x00
/*0x0993*/  .byte 0xf0
/*0x0994*/  .byte 0x1f
/*0x0995*/  .byte 0x03
/*0x0996*/  .byte 0x9c
/*0x0997*/  .byte 0x40
/*0x0998*/  .byte 0x43
/*0x0999*/  .byte 0x09
/*0x099a*/  .byte 0x52
/*0x099b*/  .byte 0xf8
/*0x099c*/  .byte 0x23
/*0x099d*/  .byte 0x70
/*0x099e*/  .byte 0x27
/*0x099f*/  .byte 0x43
/*0x09a0*/  .byte 0x42
/*0x09a1*/  .byte 0xf8
/*0x09a2*/  .byte 0x23
/*0x09a3*/  .byte 0x70
/*0x09a4*/  .byte 0x18
/*0x09a5*/  .byte 0xf8
/*0x09a6*/  .byte 0x00
/*0x09a7*/  .byte 0x40
/*0x09a8*/  .byte 0x20
/*0x09a9*/  .byte 0x46
/*0x09aa*/  .byte 0xff
/*0x09ab*/  .byte 0xf7
/*0x09ac*/  .byte 0xc3
/*0x09ad*/  .byte 0xfb
/*0x09ae*/  .byte 0x20
/*0x09af*/  .byte 0x46
/*0x09b0*/  .byte 0xff
/*0x09b1*/  .byte 0xf7
/*0x09b2*/  .byte 0x62
/*0x09b3*/  .byte 0xff
/*0x09b4*/  .byte 0x01
/*0x09b5*/  .byte 0x28
/*0x09b6*/  .byte 0x02
/*0x09b7*/  .byte 0xd0
/*0x09b8*/  .byte 0x4f
/*0x09b9*/  .byte 0xf0
/*0x09ba*/  .byte 0x00
/*0x09bb*/  .byte 0x09
/*0x09bc*/  .byte 0x00
/*0x09bd*/  .byte 0xe0
/*0x09be*/  .byte 0x6e
/*0x09bf*/  .byte 0x60
/*0x09c0*/  .byte 0x48
/*0x09c1*/  .byte 0x46
/*0x09c2*/  .byte 0xbd
/*0x09c3*/  .byte 0xe8
/*0x09c4*/  .byte 0xf0
/*0x09c5*/  .byte 0x87
/*0x09c6*/  .byte 0xe8
/*0x09c7*/  .byte 0x2c
/*0x09c8*/  .byte 0x01
/*0x09c9*/  .byte 0xd1
/*0x09ca*/  .byte 0x00
/*0x09cb*/  .byte 0x20
/*0x09cc*/  .byte 0x28
/*0x09cd*/  .byte 0x70
/*0x09ce*/  .byte 0x00
/*0x09cf*/  .byte 0x23
/*0x09d0*/  .byte 0xf8
/*0x09d1*/  .byte 0x5c
/*0x09d2*/  .byte 0xa0
/*0x09d3*/  .byte 0x42
/*0x09d4*/  .byte 0x04
/*0x09d5*/  .byte 0xd0
/*0x09d6*/  .byte 0x5b
/*0x09d7*/  .byte 0x1c
/*0x09d8*/  .byte 0xdb
/*0x09d9*/  .byte 0xb2
/*0x09da*/  .byte 0x20
/*0x09db*/  .byte 0x2b
/*0x09dc*/  .byte 0xf8
/*0x09dd*/  .byte 0xd3
/*0x09de*/  .byte 0x11
/*0x09df*/  .byte 0xe0
/*0x09e0*/  .byte 0x20
/*0x09e1*/  .byte 0x2b
/*0x09e2*/  .byte 0x0f
/*0x09e3*/  .byte 0xd2
/*0x09e4*/  .byte 0x4f
/*0x09e5*/  .byte 0xea
/*0x09e6*/  .byte 0x53
/*0x09e7*/  .byte 0x1c
/*0x09e8*/  .byte 0x92
/*0x09e9*/  .byte 0x46
/*0x09ea*/  .byte 0x52
/*0x09eb*/  .byte 0xf8
/*0x09ec*/  .byte 0x2c
/*0x09ed*/  .byte 0x20
/*0x09ee*/  .byte 0x03
/*0x09ef*/  .byte 0xf0
/*0x09f0*/  .byte 0x1f
/*0x09f1*/  .byte 0x07
/*0x09f2*/  .byte 0x06
/*0x09f3*/  .byte 0xfa
/*0x09f4*/  .byte 0x07
/*0x09f5*/  .byte 0xf0
/*0x09f6*/  .byte 0x02
/*0x09f7*/  .byte 0x42
/*0x09f8*/  .byte 0x04
/*0x09f9*/  .byte 0xd0
/*0x09fa*/  .byte 0x18
/*0x09fb*/  .byte 0xf8
/*0x09fc*/  .byte 0x03
/*0x09fd*/  .byte 0x40
/*0x09fe*/  .byte 0x82
/*0x09ff*/  .byte 0x43
/*0x0a00*/  .byte 0x4a
/*0x0a01*/  .byte 0xf8
/*0x0a02*/  .byte 0x2c
/*0x0a03*/  .byte 0x20
/*0x0a04*/  .byte 0x20
/*0x0a05*/  .byte 0x46
/*0x0a06*/  .byte 0xff
/*0x0a07*/  .byte 0xf7
/*0x0a08*/  .byte 0x95
/*0x0a09*/  .byte 0xfb
/*0x0a0a*/  .byte 0x20
/*0x0a0b*/  .byte 0x46
/*0x0a0c*/  .byte 0x00
/*0x0a0d*/  .byte 0xf0
/*0x0a0e*/  .byte 0x64
/*0x0a0f*/  .byte 0xf8
/*0x0a10*/  .byte 0xd5
/*0x0a11*/  .byte 0xe7
/*0x0a12*/  .byte 0x00
/*0x0a13*/  .byte 0x00
/*0x0a14*/  .byte 0x14
/*0x0a15*/  .byte 0x22
/*0x0a16*/  .byte 0x00
/*0x0a17*/  .byte 0x00
/*0x0a18*/  .byte 0xf4
/*0x0a19*/  .byte 0x21
/*0x0a1a*/  .byte 0x00
/*0x0a1b*/  .byte 0x00
/*0x0a1c*/  .byte 0x54
/*0x0a1d*/  .byte 0x00
/*0x0a1e*/  .byte 0x00
/*0x0a1f*/  .byte 0x20
/*0x0a20*/  .byte 0x02
/*0x0a21*/  .byte 0x49
/*0x0a22*/  .byte 0x00
/*0x0a23*/  .byte 0xb1
/*0x0a24*/  .byte 0x01
/*0x0a25*/  .byte 0x20
/*0x0a26*/  .byte 0x48
/*0x0a27*/  .byte 0x70
/*0x0a28*/  .byte 0x70
/*0x0a29*/  .byte 0x47
/*0x0a2a*/  .byte 0x00
/*0x0a2b*/  .byte 0x00
/*0x0a2c*/  .byte 0x54
/*0x0a2d*/  .byte 0x00
/*0x0a2e*/  .byte 0x00
/*0x0a2f*/  .byte 0x20


            .thumb_func
            function_b_2:
/*0x0a30*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0a34*/      mov r4, r0
/*0x0a36*/      bl call_84c
/*0x0a3a*/      mov r0, r4
/*0x0a3c*/      bl call_ef0
/*0x0a40*/      mov.w r7, #0x1000
/*0x0a44*/      ldr r6, [pc, #0x50] /* data_a98 */
/*0x0a46*/      lsls r5, r7, #1
/*0x0a48*/      cbz r4, jump_a6c
/*0x0a4a*/      movs r2, #0
/*0x0a4c*/      mov r1, r7
/*0x0a4e*/      mov r0, r6
/*0x0a50*/      bl gpio_set_input_enable
/*0x0a54*/      movs r2, #0
/*0x0a56*/      mov r1, r5
/*0x0a58*/      mov r0, r6
/*0x0a5a*/      bl gpio_set_input_enable
/*0x0a5e*/      movs r2, #2
/*0x0a60*/      mov r1, r7
/*0x0a62*/      mov r0, r6
/*0x0a64*/      bl gpio_set_pin_pull_up_down
/*0x0a68*/      movs r2, #2
/*0x0a6a*/      b jump_a8c
            jump_a6c:
/*0x0a6c*/      movs r2, #1
/*0x0a6e*/      mov r1, r7
/*0x0a70*/      mov r0, r6
/*0x0a72*/      bl gpio_set_input_enable
/*0x0a76*/      movs r2, #1
/*0x0a78*/      mov r1, r5
/*0x0a7a*/      mov r0, r6
/*0x0a7c*/      bl gpio_set_input_enable
/*0x0a80*/      movs r2, #0
/*0x0a82*/      mov r1, r7
/*0x0a84*/      mov r0, r6
/*0x0a86*/      bl gpio_set_pin_pull_up_down
/*0x0a8a*/      movs r2, #0
            jump_a8c:
/*0x0a8c*/      mov r1, r5
/*0x0a8e*/      mov r0, r6
/*0x0a90*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0a94*/      b.w gpio_set_pin_pull_up_down

            data_a98:
/*0x0a98*/  .word 0x400b0000


            .thumb_func
            call_a9c:
/*0x0a9c*/      b.w jump_bcc

            .thumb_func
            call_aa0:
/*0x0aa0*/      ldr r0, [pc, #0xc] /* data_ab0 */
/*0x0aa2*/      movs r1, #0
/*0x0aa4*/      strb r1, [r0, #6]
/*0x0aa6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x0aa8*/      str.w r1, [r0, #2]
/*0x0aac*/      bx lr

/*0x0aae*/  .byte 0x00
/*0x0aaf*/  .byte 0x00

            data_ab0:
/*0x0ab0*/  .word 0x20000670


            .thumb_func
            call_ab4:
/*0x0ab4*/      ldr r1, [pc, #0x1c] /* data_ad4 */
/*0x0ab6*/      movw r2, #0xe878
/*0x0aba*/      cbz r0, jump_aca
/*0x0abc*/      ldr r0, [r1, #0x54]
/*0x0abe*/      orrs r0, r2
/*0x0ac0*/      str r0, [r1, #0x54]
/*0x0ac2*/      str r2, [r1, #0x58]
/*0x0ac4*/      ldr r0, [r1, #0x50]
/*0x0ac6*/      orrs r0, r2
/*0x0ac8*/      b jump_ace
            jump_aca:
/*0x0aca*/      ldr r0, [r1, #0x50]
/*0x0acc*/      bics r0, r2
            jump_ace:
/*0x0ace*/      str r0, [r1, #0x50]
/*0x0ad0*/      bx lr

/*0x0ad2*/  .byte 0x00
/*0x0ad3*/  .byte 0x00

            data_ad4:
/*0x0ad4*/  .word 0x40024000

/*0x0ad8*/  .byte 0x30
/*0x0ad9*/  .byte 0xb5
/*0x0ada*/  .byte 0x0e
/*0x0adb*/  .byte 0x21
/*0x0adc*/  .byte 0x0c
/*0x0add*/  .byte 0x4b
/*0x0ade*/  .byte 0xb1
/*0x0adf*/  .byte 0xeb
/*0x0ae0*/  .byte 0x10
/*0x0ae1*/  .byte 0x1f
/*0x0ae2*/  .byte 0x09
/*0x0ae3*/  .byte 0xd1
/*0x0ae4*/  .byte 0x00
/*0x0ae5*/  .byte 0xf0
/*0x0ae6*/  .byte 0x0f
/*0x0ae7*/  .byte 0x00
/*0x0ae8*/  .byte 0x08
/*0x0ae9*/  .byte 0x28
/*0x0aea*/  .byte 0x04
/*0x0aeb*/  .byte 0xd2
/*0x0aec*/  .byte 0x19
/*0x0aed*/  .byte 0x78
/*0x0aee*/  .byte 0x01
/*0x0aef*/  .byte 0x22
/*0x0af0*/  .byte 0x82
/*0x0af1*/  .byte 0x40
/*0x0af2*/  .byte 0x91
/*0x0af3*/  .byte 0x43
/*0x0af4*/  .byte 0x19
/*0x0af5*/  .byte 0x70
/*0x0af6*/  .byte 0x30
/*0x0af7*/  .byte 0xbd
/*0x0af8*/  .byte 0x00
/*0x0af9*/  .byte 0x21
/*0x0afa*/  .byte 0x0c
/*0x0afb*/  .byte 0x46
/*0x0afc*/  .byte 0x5a
/*0x0afd*/  .byte 0x18
/*0x0afe*/  .byte 0x95
/*0x0aff*/  .byte 0x78
/*0x0b00*/  .byte 0x85
/*0x0b01*/  .byte 0x42
/*0x0b02*/  .byte 0x00
/*0x0b03*/  .byte 0xd1
/*0x0b04*/  .byte 0x94
/*0x0b05*/  .byte 0x70
/*0x0b06*/  .byte 0x49
/*0x0b07*/  .byte 0x1c
/*0x0b08*/  .byte 0xc9
/*0x0b09*/  .byte 0xb2
/*0x0b0a*/  .byte 0x06
/*0x0b0b*/  .byte 0x29
/*0x0b0c*/  .byte 0xf6
/*0x0b0d*/  .byte 0xd3
/*0x0b0e*/  .byte 0x30
/*0x0b0f*/  .byte 0xbd
/*0x0b10*/  .byte 0x30
/*0x0b11*/  .byte 0x00
/*0x0b12*/  .byte 0x00
/*0x0b13*/  .byte 0x20


            .thumb_func
            call_b14:
/*0x0b14*/      push {r4, lr}
/*0x0b16*/      movs r1, #1
/*0x0b18*/      lsls r0, r1, #0x10
/*0x0b1a*/      bl call_3d0
/*0x0b1e*/      ldr r4, [pc, #0x28] /* data_b48 */
/*0x0b20*/      movw r1, #0x8c9f
/*0x0b24*/      mov r0, r4
/*0x0b26*/      bl call_34
/*0x0b2a*/      movs r1, #1
/*0x0b2c*/      mov r0, r4
/*0x0b2e*/      bl call_220
/*0x0b32*/      ldr r2, [pc, #0x18] /* data_b4c */
/*0x0b34*/      asrs r1, r4, #0x15
/*0x0b36*/      str r1, [r2]
/*0x0b38*/      mov r0, r4
/*0x0b3a*/      pop.w {r4, lr}
/*0x0b3e*/      mov.w r1, #1
/*0x0b42*/      b.w call_20c

/*0x0b46*/  .byte 0x00
/*0x0b47*/  .byte 0x00

            data_b48:
/*0x0b48*/  .word 0x40076000
            data_b4c:
/*0x0b4c*/  .word 0xe000e104


            .thumb_func
            call_b50:
/*0x0b50*/      push {r4, r5, lr}
/*0x0b52*/      ldr r1, [pc, #0x34] /* data_b88 */
/*0x0b54*/      ldr r4, [r1]
/*0x0b56*/      ldr r3, [r1, #0x48]
/*0x0b58*/      mov.w r2, #1
/*0x0b5c*/      str r2, [r1]
/*0x0b5e*/      mov.w r2, #0
/*0x0b62*/      str r2, [r1, #0x48]
/*0x0b64*/      ldr r5, [pc, #0x24] /* data_b8c */
/*0x0b66*/      str r2, [r5, #0x10]
/*0x0b68*/      str r2, [r5]
/*0x0b6a*/      str r4, [r1]
/*0x0b6c*/      ldr r2, [pc, #0x20] /* data_b90 */
/*0x0b6e*/      sub.w r1, r1, #0x618
/*0x0b72*/      ldr r4, [r2]
/*0x0b74*/      orr r4, r4, #4
/*0x0b78*/      str r4, [r2]
/*0x0b7a*/      cbz r0, jump_b84
/*0x0b7c*/      wfi 
            jump_b7e:
/*0x0b7e*/      str.w r3, [r1, #0x660]
/*0x0b82*/      pop {r4, r5, pc}
            jump_b84:
/*0x0b84*/      wfe 
/*0x0b86*/      b jump_b7e

            data_b88:
/*0x0b88*/  .word 0x43100618
            data_b8c:
/*0x0b8c*/  .word 0x42d4208c
            data_b90:
/*0x0b90*/  .word 0xe000ed10

            jump_b94:
/*0x0b94*/      ldr r2, [pc, #0x14] /* data_bac */
/*0x0b96*/      cmp r1, #1
/*0x0b98*/      ldr.w r1, [r2, #0x104]
/*0x0b9c*/      beq jump_ba6
/*0x0b9e*/      bics r1, r0
            jump_ba0:
/*0x0ba0*/      str.w r1, [r2, #0x104]
/*0x0ba4*/      bx lr
            jump_ba6:
/*0x0ba6*/      orrs r1, r0
/*0x0ba8*/      b jump_ba0

/*0x0baa*/  .byte 0x00
/*0x0bab*/  .byte 0x00

            data_bac:
/*0x0bac*/  .word 0x40088000


            .thumb_func
            ckcu_set_wtf:
/*0x0bb0*/      ldr r2, [pc, #0x14] /* data_bc8 */
/*0x0bb2*/      cmp r1, #1
/*0x0bb4*/      ldr.w r1, [r2, #0x10c]
/*0x0bb8*/      beq jump_bc2
/*0x0bba*/      bics r1, r0
            jump_bbc:
/*0x0bbc*/      str.w r1, [r2, #0x10c]
/*0x0bc0*/      bx lr
            jump_bc2:
/*0x0bc2*/      orrs r1, r0
/*0x0bc4*/      b jump_bbc

/*0x0bc6*/  .byte 0x00
/*0x0bc7*/  .byte 0x00

            data_bc8:
/*0x0bc8*/  .word 0x40088000

            jump_bcc:
/*0x0bcc*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x0bd0*/      ldr r0, [pc, #0x64] /* data_c38 */
/*0x0bd2*/      ldrh r0, [r0]
/*0x0bd4*/      cmp r0, #0
/*0x0bd6*/      bne jump_c34
/*0x0bd8*/      ldr.w sb, [pc, #0x5c] /* data_c38 */
/*0x0bdc*/      movs r7, #0
/*0x0bde*/      add.w sb, sb, #0x28
/*0x0be2*/      ldrb.w fp, [sb, #0x1c]
/*0x0be6*/      b jump_c30
            jump_be8:
/*0x0be8*/      ldr r0, [pc, #0x4c] /* data_c38 */
/*0x0bea*/      mov.w sl, #1
/*0x0bee*/      add r0, r7
/*0x0bf0*/      mov r8, r0
/*0x0bf2*/      ldrb r5, [r0, #2]
/*0x0bf4*/      ldrb r6, [r0, #0x14]
/*0x0bf6*/      eors r6, r5
/*0x0bf8*/      movs r4, #0
            jump_bfa:
/*0x0bfa*/      lsls r0, r6, #0x1f
/*0x0bfc*/      beq jump_c20
/*0x0bfe*/      sbfx r2, r5, #0, #1
/*0x0c02*/      ldr.w r3, [sb, #0xc]
/*0x0c06*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x0c08*/      mov r1, r4
/*0x0c0a*/      mov r0, r7
/*0x0c0c*/      blx r3
/*0x0c0e*/      cmp r0, #1
/*0x0c10*/      bne jump_c20
/*0x0c12*/      ldrb.w r1, [r8, #0x14]
/*0x0c16*/      lsl.w r0, sl, r4
/*0x0c1a*/      eors r1, r0
/*0x0c1c*/      strb.w r1, [r8, #0x14]
            jump_c20:
/*0x0c20*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x0c22*/      lsrs r6, r6, #1
/*0x0c24*/      lsrs r5, r5, #1
/*0x0c26*/      uxtb r4, r4
/*0x0c28*/      cmp r4, #8
/*0x0c2a*/      blo jump_bfa
/*0x0c2c*/      .short 0x1c7f /* adds r7, r7, #1 */ 
/*0x0c2e*/      uxtb r7, r7
            jump_c30:
/*0x0c30*/      cmp r7, fp
/*0x0c32*/      blo jump_be8
            jump_c34:
/*0x0c34*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_c38:
/*0x0c38*/  .word 0x2000067c

            jump_c3c:
/*0x0c3c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0c40*/      ldr.w r8, [pc, #0x68] /* data_cac */
/*0x0c44*/      ldr r0, [pc, #0x68] /* data_cb0 */
/*0x0c46*/      sub.w r7, r8, #0x28
/*0x0c4a*/      ldrb.w r3, [r8, #0x1b]
/*0x0c4e*/      lsrs r4, r3, #1
/*0x0c50*/      add.w r0, r0, r4, lsl #3
/*0x0c54*/      ldr r5, [r0]
/*0x0c56*/      ldr r6, [r0, #4]
/*0x0c58*/      ldrh r0, [r7]
/*0x0c5a*/      cbz r0, jump_c62
/*0x0c5c*/      ldrh r0, [r7]
/*0x0c5e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x0c60*/      strh r0, [r7]
            jump_c62:
/*0x0c62*/      lsls r0, r3, #0x1f
/*0x0c64*/      beq jump_c92
/*0x0c66*/      bl call_f74
/*0x0c6a*/      str r6, [r5, #0x24]
/*0x0c6c*/      adds r1, r7, r4
/*0x0c6e*/      ldrb r2, [r1, #2]
/*0x0c70*/      cmp r2, r0
/*0x0c72*/      beq jump_c7c
/*0x0c74*/      ldrh.w r2, [r8, #0x18]
/*0x0c78*/      strh r2, [r7]
/*0x0c7a*/      strb r0, [r1, #2]
            jump_c7c:
/*0x0c7c*/      ldrb.w r0, [r8, #0x1a]
/*0x0c80*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x0c82*/      udiv r2, r3, r0
/*0x0c86*/      mls r0, r0, r2, r3
/*0x0c8a*/      strb.w r0, [r8, #0x1b]
/*0x0c8e*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_c92:
/*0x0c92*/      movs r0, #0x40
/*0x0c94*/      ldr r1, [pc, #0x1c] /* data_cb4 */
/*0x0c96*/      cmp r4, #2
/*0x0c98*/      bne jump_ca4
/*0x0c9a*/      ldr r2, [pc, #0x1c] /* data_cb8 */
/*0x0c9c*/      ldrb r2, [r2]
/*0x0c9e*/      cbz r2, jump_ca4
/*0x0ca0*/      str r0, [r1, #0x24]
/*0x0ca2*/      b jump_ca6
            jump_ca4:
/*0x0ca4*/      str r0, [r1, #0x28]
            jump_ca6:
/*0x0ca6*/      str r6, [r5, #0x28]
/*0x0ca8*/      b jump_c7c

/*0x0caa*/  .byte 0x00
/*0x0cab*/  .byte 0x00

            data_cac:
/*0x0cac*/  .word 0x200006a4
            data_cb0:
/*0x0cb0*/  .word 0x00002264 /* possible pointer */
            data_cb4:
/*0x0cb4*/  .word 0x400b2000
            data_cb8:
/*0x0cb8*/  .word 0x20000055


            .thumb_func
            call_cbc:
/*0x0cbc*/      push {r4, r5, r6, lr}
/*0x0cbe*/      mov r4, r0
/*0x0cc0*/      bl call_d34
/*0x0cc4*/      ldr r5, [pc, #0x60] /* data_d28 */
/*0x0cc6*/      ldrb r0, [r5]
/*0x0cc8*/      cmp r0, #1
/*0x0cca*/      bne jump_d24
/*0x0ccc*/      ldr r6, [pc, #0x5c] /* data_d2c */
/*0x0cce*/      ldrh r0, [r4, #0x10]
/*0x0cd0*/      sub.w r3, r6, #0x28
/*0x0cd4*/      strh r0, [r6, #0x18]
/*0x0cd6*/      ldr r0, [r4, #0xc]
/*0x0cd8*/      str r0, [r6]
/*0x0cda*/      ldrb r0, [r4, #0x13]
/*0x0cdc*/      lsls r0, r0, #1
/*0x0cde*/      strb r0, [r6, #0x1a]
/*0x0ce0*/      movs r0, #0
/*0x0ce2*/      strb r0, [r6, #0x1b]
/*0x0ce4*/      movs r2, #0xff
/*0x0ce6*/      b jump_cf2
            jump_ce8:
/*0x0ce8*/      adds r1, r3, r0
/*0x0cea*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x0cec*/      strb r2, [r1, #2]
/*0x0cee*/      strb r2, [r1, #0x14]
/*0x0cf0*/      uxtb r0, r0
            jump_cf2:
/*0x0cf2*/      ldrb r1, [r4, #0x13]
/*0x0cf4*/      cmp r1, r0
/*0x0cf6*/      bhi jump_ce8
/*0x0cf8*/      ldr r0, [r4]
/*0x0cfa*/      str r0, [r6, #0xc]
/*0x0cfc*/      ldr r0, [r4, #4]
/*0x0cfe*/      str r0, [r6, #0x10]
/*0x0d00*/      ldr r0, [r4, #8]
/*0x0d02*/      str r0, [r6, #0x14]
/*0x0d04*/      ldrb r0, [r4, #0x13]
/*0x0d06*/      strb r0, [r6, #0x1c]
/*0x0d08*/      movs r1, #1
/*0x0d0a*/      lsls r0, r1, #0x11
/*0x0d0c*/      bl call_3d0
/*0x0d10*/      mov.w r1, #0x3200
/*0x0d14*/      ldr r0, [pc, #0x18] /* data_d30 */
/*0x0d16*/      bl call_34
/*0x0d1a*/      movs r0, #1
/*0x0d1c*/      bl call_ef0
/*0x0d20*/      movs r0, #2
/*0x0d22*/      strb r0, [r5]
            jump_d24:
/*0x0d24*/      movs r0, #1
/*0x0d26*/      pop {r4, r5, r6, pc}

            data_d28:
/*0x0d28*/  .word 0x2000006c
            data_d2c:
/*0x0d2c*/  .word 0x200006a4
            data_d30:
/*0x0d30*/  .word 0x40077000


            .thumb_func
            call_d34:
/*0x0d34*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x0d38*/      ldr.w r8, [pc, #0x1a0] /* data_edc */
/*0x0d3c*/      ldrb.w r0, [r8]
/*0x0d40*/      cbnz r0, jump_dc0
/*0x0d42*/      movs r1, #1
/*0x0d44*/      lsls r4, r1, #0xf
/*0x0d46*/      mov r0, r4
/*0x0d48*/      bl call_3b8
/*0x0d4c*/      movs r1, #1
/*0x0d4e*/      mov.w r0, #0xf0000
/*0x0d52*/      bl ckcu_ahb_clock_enable
/*0x0d56*/      ldr r7, [pc, #0x188] /* data_ee0 */
/*0x0d58*/      movs r2, #0
/*0x0d5a*/      movs r1, #8
/*0x0d5c*/      mov r0, r7
/*0x0d5e*/      bl gpio_set_pin_pull_up_down
/*0x0d62*/      movs r2, #0
/*0x0d64*/      movs r1, #0x10
/*0x0d66*/      mov r0, r7
/*0x0d68*/      bl gpio_set_pin_pull_up_down
/*0x0d6c*/      movs r2, #0
/*0x0d6e*/      movs r1, #0x20
/*0x0d70*/      mov r0, r7
/*0x0d72*/      bl gpio_set_pin_pull_up_down
/*0x0d76*/      movs r2, #0
/*0x0d78*/      movs r1, #0x40
/*0x0d7a*/      mov r0, r7
/*0x0d7c*/      bl gpio_set_pin_pull_up_down
/*0x0d80*/      ldr.w sb, [pc, #0x160] /* data_ee4 */
/*0x0d84*/      asrs r6, r4, #4
/*0x0d86*/      movs r2, #0
/*0x0d88*/      mov r1, r6
/*0x0d8a*/      mov r0, sb
/*0x0d8c*/      bl gpio_set_pin_pull_up_down
/*0x0d90*/      ldr.w sl, [pc, #0x154] /* data_ee8 */
/*0x0d94*/      mov.w fp, #0x2000
/*0x0d98*/      movs r2, #0
/*0x0d9a*/      mov r1, fp
/*0x0d9c*/      mov r5, sl
/*0x0d9e*/      mov r0, sl
/*0x0da0*/      bl gpio_set_pin_pull_up_down
/*0x0da4*/      movs r2, #0
/*0x0da6*/      asrs r1, r4, #1
/*0x0da8*/      mov r0, r5
/*0x0daa*/      bl gpio_set_pin_pull_up_down
/*0x0dae*/      movs r2, #0
/*0x0db0*/      mov r1, r4
/*0x0db2*/      mov r0, r5
/*0x0db4*/      bl gpio_set_pin_pull_up_down
/*0x0db8*/      movs r2, #1
/*0x0dba*/      movs r1, #8
/*0x0dbc*/      mov r0, r7
/*0x0dbe*/      b jump_dc2
            jump_dc0:
/*0x0dc0*/      b jump_ed6
            jump_dc2:
/*0x0dc2*/      bl gpio_set_input_enable
/*0x0dc6*/      movs r2, #1
/*0x0dc8*/      movs r1, #0x10
/*0x0dca*/      mov r0, r7
/*0x0dcc*/      bl gpio_set_input_enable
/*0x0dd0*/      movs r2, #1
/*0x0dd2*/      movs r1, #0x20
/*0x0dd4*/      mov r0, r7
/*0x0dd6*/      bl gpio_set_input_enable
/*0x0dda*/      movs r2, #1
/*0x0ddc*/      movs r1, #0x40
/*0x0dde*/      mov r0, r7
/*0x0de0*/      bl gpio_set_input_enable
/*0x0de4*/      movs r2, #1
/*0x0de6*/      mov r1, r6
/*0x0de8*/      mov r0, sb
/*0x0dea*/      bl gpio_set_input_enable
/*0x0dee*/      movs r2, #1
/*0x0df0*/      mov r1, fp
/*0x0df2*/      mov r0, r5
/*0x0df4*/      bl gpio_set_input_enable
/*0x0df8*/      movs r2, #1
/*0x0dfa*/      lsls r1, r2, #0xe
/*0x0dfc*/      mov r0, r5
/*0x0dfe*/      bl gpio_set_input_enable
/*0x0e02*/      movs r2, #1
/*0x0e04*/      mov r1, r4
/*0x0e06*/      mov r0, r5
/*0x0e08*/      bl gpio_set_input_enable
/*0x0e0c*/      movs r1, #0
/*0x0e0e*/      movs r0, #0xc
/*0x0e10*/      bl call_74
/*0x0e14*/      movs r1, #0
/*0x0e16*/      movs r0, #0x10
/*0x0e18*/      bl call_74
/*0x0e1c*/      movs r1, #0
/*0x0e1e*/      movs r0, #0x14
/*0x0e20*/      bl call_74
/*0x0e24*/      movs r1, #0
/*0x0e26*/      movs r0, #0x18
/*0x0e28*/      bl call_74
/*0x0e2c*/      movs r1, #1
/*0x0e2e*/      movs r0, #0x2c
/*0x0e30*/      bl call_74
/*0x0e34*/      movs r1, #2
/*0x0e36*/      movs r0, #0x34
/*0x0e38*/      bl call_74
/*0x0e3c*/      movs r1, #2
/*0x0e3e*/      movs r0, #0x38
/*0x0e40*/      bl call_74
/*0x0e44*/      movs r1, #2
/*0x0e46*/      movs r0, #0x3c
/*0x0e48*/      bl call_74
/*0x0e4c*/      ldr.w sb, [pc, #0x9c] /* data_eec */
/*0x0e50*/      movs r4, #0
            jump_e52:
/*0x0e52*/      add.w r0, sb, r4, lsl #3
/*0x0e56*/      ldr r5, [r0]
/*0x0e58*/      ldr r6, [r0, #4]
/*0x0e5a*/      mov r0, r5
/*0x0e5c*/      uxth r1, r6
/*0x0e5e*/      bl call_10e
/*0x0e62*/      uxth r1, r6
/*0x0e64*/      movs r2, #1
/*0x0e66*/      mov r0, r5
/*0x0e68*/      bl call_4b8
/*0x0e6c*/      uxth r1, r6
/*0x0e6e*/      movs r2, #1
/*0x0e70*/      mov r0, r5
/*0x0e72*/      bl call_498
/*0x0e76*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x0e78*/      uxtb r4, r4
/*0x0e7a*/      cmp r4, #9
/*0x0e7c*/      blo jump_e52
/*0x0e7e*/      movs r2, #2
/*0x0e80*/      lsls r4, r2, #7
/*0x0e82*/      mov r1, r4
/*0x0e84*/      mov r0, r7
/*0x0e86*/      bl gpio_set_pin_pull_up_down
/*0x0e8a*/      movs r2, #0
/*0x0e8c*/      mov r1, r4
/*0x0e8e*/      mov r0, r7
/*0x0e90*/      bl gpio_set_input_enable
/*0x0e94*/      movs r2, #1
/*0x0e96*/      movs r1, #4
/*0x0e98*/      mov r0, sl
/*0x0e9a*/      bl call_498
/*0x0e9e*/      movs r2, #2
/*0x0ea0*/      lsls r4, r2, #8
/*0x0ea2*/      mov r1, r4
/*0x0ea4*/      mov r0, r7
/*0x0ea6*/      bl gpio_set_pin_pull_up_down
/*0x0eaa*/      movs r2, #0
/*0x0eac*/      mov r1, r4
/*0x0eae*/      mov r0, r7
/*0x0eb0*/      bl gpio_set_input_enable
/*0x0eb4*/      mov r1, r4
/*0x0eb6*/      mov r0, r7
/*0x0eb8*/      bl call_10e
/*0x0ebc*/      movs r2, #1
/*0x0ebe*/      mov r1, r4
/*0x0ec0*/      mov r0, r7
/*0x0ec2*/      bl call_4b8
/*0x0ec6*/      movs r2, #1
/*0x0ec8*/      mov r1, r4
/*0x0eca*/      mov r0, r7
/*0x0ecc*/      bl call_498
/*0x0ed0*/      movs r1, #1
/*0x0ed2*/      strb.w r1, [r8]
            jump_ed6:
/*0x0ed6*/      movs r0, #1
/*0x0ed8*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_edc:
/*0x0edc*/  .word 0x2000006c
            data_ee0:
/*0x0ee0*/  .word 0x400b0000
            data_ee4:
/*0x0ee4*/  .word 0x400b2000
            data_ee8:
/*0x0ee8*/  .word 0x400b4000
            data_eec:
/*0x0eec*/  .word 0x00002264 /* possible pointer */


            .thumb_func
            call_ef0:
/*0x0ef0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x0ef4*/      ldr r4, [pc, #0x70] /* data_f68 */
/*0x0ef6*/      ldr r6, [pc, #0x74] /* data_f6c */
/*0x0ef8*/      asrs r5, r4, #0x14
/*0x0efa*/      ldr.w r8, [pc, #0x74] /* data_f70 */
/*0x0efe*/      asrs r7, r4, #0x15
/*0x0f00*/      cbz r0, jump_f2a
/*0x0f02*/      movs r1, #0
/*0x0f04*/      mov r0, r4
/*0x0f06*/      bl call_220
/*0x0f0a*/      movs r1, #0
/*0x0f0c*/      mov r0, r4
/*0x0f0e*/      bl call_20c
/*0x0f12*/      mov r0, r4
/*0x0f14*/      bl call_f4
/*0x0f18*/      str.w r5, [r6, #0x180]
/*0x0f1c*/      str.w r7, [r8, #0x24]
/*0x0f20*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x0f24*/      movs r0, #0
/*0x0f26*/      b.w call_fd8
            jump_f2a:
/*0x0f2a*/      movs r0, #1
/*0x0f2c*/      bl call_fd8
/*0x0f30*/      movs r0, #0xa
/*0x0f32*/      bl call_102
/*0x0f36*/      str.w r7, [r8, #0x28]
/*0x0f3a*/      movs r0, #0xa
/*0x0f3c*/      bl call_102
/*0x0f40*/      movs r1, #0
/*0x0f42*/      mov r0, r4
/*0x0f44*/      bl call_38
/*0x0f48*/      mov r0, r4
/*0x0f4a*/      bl call_f4
/*0x0f4e*/      movs r1, #1
/*0x0f50*/      mov r0, r4
/*0x0f52*/      bl call_20c
/*0x0f56*/      movs r1, #1
/*0x0f58*/      mov r0, r4
/*0x0f5a*/      bl call_220
/*0x0f5e*/      str.w r5, [r6, #0x100]
/*0x0f62*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x0f66*/  .byte 0x00
/*0x0f67*/  .byte 0x00

            data_f68:
/*0x0f68*/  .word 0x40077000
            data_f6c:
/*0x0f6c*/  .word 0xe000e004
            data_f70:
/*0x0f70*/  .word 0x400b0000


            .thumb_func
            call_f74:
/*0x0f74*/      ldr r1, [pc, #0x54] /* data_fcc */
/*0x0f76*/      movs r0, #0
/*0x0f78*/      ldr r2, [r1, #0x1c]
/*0x0f7a*/      lsls r2, r2, #0x1c
/*0x0f7c*/      bpl jump_f80
/*0x0f7e*/      movs r0, #1
            jump_f80:
/*0x0f80*/      ldr r2, [r1, #0x1c]
/*0x0f82*/      lsls r2, r2, #0x1b
/*0x0f84*/      bpl jump_f8a
/*0x0f86*/      orr r0, r0, #2
            jump_f8a:
/*0x0f8a*/      ldr r2, [r1, #0x1c]
/*0x0f8c*/      lsls r2, r2, #0x1a
/*0x0f8e*/      bpl jump_f94
/*0x0f90*/      orr r0, r0, #4
            jump_f94:
/*0x0f94*/      ldr r1, [r1, #0x1c]
/*0x0f96*/      lsls r1, r1, #0x19
/*0x0f98*/      bpl jump_f9e
/*0x0f9a*/      orr r0, r0, #8
            jump_f9e:
/*0x0f9e*/      ldr r1, [pc, #0x30] /* data_fd0 */
/*0x0fa0*/      ldr r1, [r1, #0x1c]
/*0x0fa2*/      lsls r1, r1, #0x14
/*0x0fa4*/      bpl jump_faa
/*0x0fa6*/      orr r0, r0, #0x10
            jump_faa:
/*0x0faa*/      ldr r1, [pc, #0x28] /* data_fd4 */
/*0x0fac*/      ldr r2, [r1, #0x1c]
/*0x0fae*/      lsls r2, r2, #0x12
/*0x0fb0*/      bpl jump_fb6
/*0x0fb2*/      orr r0, r0, #0x20
            jump_fb6:
/*0x0fb6*/      ldr r2, [r1, #0x1c]
/*0x0fb8*/      lsls r2, r2, #0x11
/*0x0fba*/      bpl jump_fc0
/*0x0fbc*/      orr r0, r0, #0x40
            jump_fc0:
/*0x0fc0*/      ldr r1, [r1, #0x1c]
/*0x0fc2*/      lsls r1, r1, #0x10
/*0x0fc4*/      bpl jump_fca
/*0x0fc6*/      orr r0, r0, #0x80
            jump_fca:
/*0x0fca*/      bx lr

            data_fcc:
/*0x0fcc*/  .word 0x400b0000
            data_fd0:
/*0x0fd0*/  .word 0x400b2000
            data_fd4:
/*0x0fd4*/  .word 0x400b4000


            .thumb_func
            call_fd8:
/*0x0fd8*/      push {r4, lr}
/*0x0fda*/      movs r2, #9
/*0x0fdc*/      ldr r4, [pc, #0x48] /* data_1028 */
/*0x0fde*/      movs r1, #0
/*0x0fe0*/      cbnz r0, jump_ff2
/*0x0fe2*/      b jump_101c
            jump_fe4:
/*0x0fe4*/      add.w r0, r4, r1, lsl #3
/*0x0fe8*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x0fea*/      ldr r3, [r0]
/*0x0fec*/      ldr r0, [r0, #4]
/*0x0fee*/      uxtb r1, r1
/*0x0ff0*/      str r0, [r3, #0x24]
            jump_ff2:
/*0x0ff2*/      movs r0, r2
/*0x0ff4*/      sub.w r2, r2, #1
/*0x0ff8*/      uxtb r2, r2
/*0x0ffa*/      bne jump_fe4
/*0x0ffc*/      pop {r4, pc}
            jump_ffe:
/*0x0ffe*/      cmp r1, #8
/*0x1000*/      beq jump_1012
/*0x1002*/      add.w r0, r4, r1, lsl #3
/*0x1006*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1008*/      ldr r3, [r0]
/*0x100a*/      ldr r0, [r0, #4]
/*0x100c*/      uxtb r1, r1
/*0x100e*/      str r0, [r3, #0x28]
/*0x1010*/      b jump_101c
            jump_1012:
/*0x1012*/      ldr r0, [pc, #0x14] /* data_1028 */
/*0x1014*/      movs r1, #9
/*0x1016*/      ldr r3, [r0, #0x40]
/*0x1018*/      ldr r0, [r0, #0x44]
/*0x101a*/      str r0, [r3, #0x24]
            jump_101c:
/*0x101c*/      movs r0, r2
/*0x101e*/      sub.w r2, r2, #1
/*0x1022*/      uxtb r2, r2
/*0x1024*/      bne jump_ffe
/*0x1026*/      pop {r4, pc}

            data_1028:
/*0x1028*/  .word 0x00002264 /* possible pointer */


            .thumb_func
            function_e_4:
/*0x102c*/      mov.w r1, #-0x1fff2000
/*0x1030*/      cbz r0, jump_1040
/*0x1032*/      cmp r0, #1
/*0x1034*/      ldr r0, [r1, #0x10]
/*0x1036*/      beq jump_1046
/*0x1038*/      bic r0, r0, #1
            jump_103c:
/*0x103c*/      str r0, [r1, #0x10]
/*0x103e*/      bx lr
            jump_1040:
/*0x1040*/      movs r0, #0
/*0x1042*/      str r0, [r1, #0x18]
/*0x1044*/      bx lr
            jump_1046:
/*0x1046*/      orr r0, r0, #1
/*0x104a*/      b jump_103c

            .thumb_func
            function_17:
/*0x104c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1050*/      ldr r5, [pc, #0x80] /* data_10d4 */
/*0x1052*/      ldr r0, [r5]
/*0x1054*/      cmp r0, #0
/*0x1056*/      beq jump_10ce
/*0x1058*/      ldr r0, [pc, #0x7c] /* data_10d8 */
/*0x105a*/      bl function_6
/*0x105e*/      mov r4, r0
/*0x1060*/      cmp r0, #1
/*0x1062*/      bne jump_1068
/*0x1064*/      bl call_ab4
            jump_1068:
/*0x1068*/      ldr r7, [pc, #0x6c] /* data_10d8 */
/*0x106a*/      ldrb.w r0, [r7, #0x32]
/*0x106e*/      cmp r0, #3
/*0x1070*/      bne jump_10a0
/*0x1072*/      ldr r6, [pc, #0x68] /* data_10dc */
/*0x1074*/      ldr r0, [r6]
/*0x1076*/      tst.w r0, #0xc0
/*0x107a*/      beq jump_10a0
/*0x107c*/      movs r0, #1
/*0x107e*/      bl function_b_2
/*0x1082*/      movs r0, #0
/*0x1084*/      str r0, [r5, #8]
/*0x1086*/      ldrb.w r0, [r7, #0x32]
/*0x108a*/      cmp r0, #3
/*0x108c*/      bne jump_10a0
/*0x108e*/      ldr r0, [r6]
/*0x1090*/      tst.w r0, #0xc0
/*0x1094*/      beq jump_10a0
/*0x1096*/      bl watchdog_reload_timer
/*0x109a*/      movs r0, #0
/*0x109c*/      bl call_b50
            jump_10a0:
/*0x10a0*/      bl call_8e8
/*0x10a4*/      cmp r0, #1
/*0x10a6*/      beq jump_10ba
/*0x10a8*/      cmp r4, #1
/*0x10aa*/      bne jump_10ce
            jump_10ac:
/*0x10ac*/      movs r0, #0
/*0x10ae*/      bl call_ab4
/*0x10b2*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x10b6*/      b.w jump_8d8
            jump_10ba:
/*0x10ba*/      cmp r4, #1
/*0x10bc*/      bne jump_10ce
/*0x10be*/      ldr r0, [pc, #0x18] /* data_10d8 */
/*0x10c0*/      bl call_1666
/*0x10c4*/      cmp r0, #1
/*0x10c6*/      bne jump_10ac
/*0x10c8*/      bl call_16b6
/*0x10cc*/      b jump_10ac
            jump_10ce:
/*0x10ce*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x10d2*/  .byte 0x00
/*0x10d3*/  .byte 0x00

            data_10d4:
/*0x10d4*/  .word 0x20000000
            data_10d8:
/*0x10d8*/  .word 0x200000b8
            data_10dc:
/*0x10dc*/  .word 0x400a8000

/*0x10e0*/  .byte 0x70
/*0x10e1*/  .byte 0x47
/*0x10e2*/  .byte 0x00
/*0x10e3*/  .byte 0x00


            .thumb_func
            clock_init:
/*0x10e4*/      ldr r0, [pc, #0x50] /* data_1138 */
/*0x10e6*/      movs r1, #1
/*0x10e8*/      str.w r1, [r0, #0x300]
/*0x10ec*/      ldr r2, [pc, #0x4c] /* data_113c */
/*0x10ee*/      str.w r1, [r2, #0xa8]
            jump_10f2:
/*0x10f2*/      ldr.w r3, [r2, #0x108]
/*0x10f6*/      cmp r3, #0
/*0x10f8*/      beq jump_10f2
/*0x10fa*/      movs r3, #0
/*0x10fc*/      str r3, [r2, #0x20]
/*0x10fe*/      mov.w r3, #0x9000000
/*0x1102*/      str r3, [r0, #0x18]
/*0x1104*/      str.w r1, [r2, #0xa4]
            jump_1108:
/*0x1108*/      ldr.w r3, [r2, #0x104]
/*0x110c*/      cmp r3, #0
/*0x110e*/      beq jump_1108
/*0x1110*/      ldr r2, [pc, #0x2c] /* data_1140 */
/*0x1112*/      ldr r3, [r2]
/*0x1114*/      bic r3, r3, #7
/*0x1118*/      add.w r3, r3, #3
/*0x111c*/      str r3, [r2]
/*0x111e*/      str r1, [r0, #0x20]
/*0x1120*/      ldr r2, [r0, #4]
/*0x1122*/      bic r2, r2, #3
/*0x1126*/      add.w r2, r2, #1
/*0x112a*/      str r2, [r0, #4]
            jump_112c:
/*0x112c*/      ldr r2, [r0, #0x34]
/*0x112e*/      cmp.w r1, r2, lsr #30
/*0x1132*/      bne jump_112c
/*0x1134*/      bx lr

/*0x1136*/  .byte 0x00
/*0x1137*/  .byte 0x00

            data_1138:
/*0x1138*/  .word 0x40088000
            data_113c:
/*0x113c*/  .word 0x43100000
            data_1140:
/*0x1140*/  .word 0x40080200

/*0x1144*/  .byte 0x70
/*0x1145*/  .byte 0xb5
/*0x1146*/  .byte 0x16
/*0x1147*/  .byte 0x4d
/*0x1148*/  .byte 0x16
/*0x1149*/  .byte 0x48
/*0x114a*/  .byte 0x00
/*0x114b*/  .byte 0x24
/*0x114c*/  .byte 0x29
/*0x114d*/  .byte 0x68
/*0x114e*/  .byte 0x59
/*0x114f*/  .byte 0xb1
/*0x1150*/  .byte 0xc1
/*0x1151*/  .byte 0x68
/*0x1152*/  .byte 0x01
/*0x1153*/  .byte 0x29
/*0x1154*/  .byte 0x07
/*0x1155*/  .byte 0xd1
/*0x1156*/  .byte 0xc4
/*0x1157*/  .byte 0x60
/*0x1158*/  .byte 0x00
/*0x1159*/  .byte 0xf1
/*0x115a*/  .byte 0x20
/*0x115b*/  .byte 0x01
/*0x115c*/  .byte 0x08
/*0x115d*/  .byte 0x22
/*0x115e*/  .byte 0x01
/*0x115f*/  .byte 0x20
/*0x1160*/  .byte 0x00
/*0x1161*/  .byte 0xf0
/*0x1162*/  .byte 0xc8
/*0x1163*/  .byte 0xfb
/*0x1164*/  .byte 0x2c
/*0x1165*/  .byte 0x60
/*0x1166*/  .byte 0x70
/*0x1167*/  .byte 0xbd
/*0x1168*/  .byte 0x0f
/*0x1169*/  .byte 0x4d
/*0x116a*/  .byte 0x29
/*0x116b*/  .byte 0x68
/*0x116c*/  .byte 0x00
/*0x116d*/  .byte 0x29
/*0x116e*/  .byte 0xfa
/*0x116f*/  .byte 0xd1
/*0x1170*/  .byte 0x05
/*0x1171*/  .byte 0xf1
/*0x1172*/  .byte 0x0c
/*0x1173*/  .byte 0x06
/*0x1174*/  .byte 0x31
/*0x1175*/  .byte 0x68
/*0x1176*/  .byte 0x00
/*0x1177*/  .byte 0x29
/*0x1178*/  .byte 0xf5
/*0x1179*/  .byte 0xd0
/*0x117a*/  .byte 0xc1
/*0x117b*/  .byte 0x68
/*0x117c*/  .byte 0x01
/*0x117d*/  .byte 0x29
/*0x117e*/  .byte 0xf2
/*0x117f*/  .byte 0xd1
/*0x1180*/  .byte 0xc4
/*0x1181*/  .byte 0x60
/*0x1182*/  .byte 0x08
/*0x1183*/  .byte 0x49
/*0x1184*/  .byte 0x08
/*0x1185*/  .byte 0x22
/*0x1186*/  .byte 0x20
/*0x1187*/  .byte 0x31
/*0x1188*/  .byte 0x01
/*0x1189*/  .byte 0x20
/*0x118a*/  .byte 0x00
/*0x118b*/  .byte 0xf0
/*0x118c*/  .byte 0xb3
/*0x118d*/  .byte 0xfb
/*0x118e*/  .byte 0x30
/*0x118f*/  .byte 0x68
/*0x1190*/  .byte 0x4f
/*0x1191*/  .byte 0xf4
/*0x1192*/  .byte 0x7a
/*0x1193*/  .byte 0x61
/*0x1194*/  .byte 0x48
/*0x1195*/  .byte 0x43
/*0x1196*/  .byte 0xc9
/*0x1197*/  .byte 0x10
/*0x1198*/  .byte 0xb0
/*0x1199*/  .byte 0xfb
/*0x119a*/  .byte 0xf1
/*0x119b*/  .byte 0xf0
/*0x119c*/  .byte 0x28
/*0x119d*/  .byte 0x60
/*0x119e*/  .byte 0x70
/*0x119f*/  .byte 0xbd
/*0x11a0*/  .byte 0x58
/*0x11a1*/  .byte 0x00
/*0x11a2*/  .byte 0x00
/*0x11a3*/  .byte 0x20
/*0x11a4*/  .byte 0x10
/*0x11a5*/  .byte 0x00
/*0x11a6*/  .byte 0x00
/*0x11a7*/  .byte 0x20
/*0x11a8*/  .byte 0x8c
/*0x11a9*/  .byte 0x01
/*0x11aa*/  .byte 0x00
/*0x11ab*/  .byte 0x20
/*0x11ac*/  .byte 0x70
/*0x11ad*/  .byte 0xb5
/*0x11ae*/  .byte 0x0e
/*0x11af*/  .byte 0x4d
/*0x11b0*/  .byte 0x0e
/*0x11b1*/  .byte 0x48
/*0x11b2*/  .byte 0x00
/*0x11b3*/  .byte 0x24
/*0x11b4*/  .byte 0x29
/*0x11b5*/  .byte 0x68
/*0x11b6*/  .byte 0x39
/*0x11b7*/  .byte 0xb1
/*0x11b8*/  .byte 0x01
/*0x11b9*/  .byte 0x69
/*0x11ba*/  .byte 0x01
/*0x11bb*/  .byte 0x29
/*0x11bc*/  .byte 0x13
/*0x11bd*/  .byte 0xd1
/*0x11be*/  .byte 0x04
/*0x11bf*/  .byte 0x61
/*0x11c0*/  .byte 0x05
/*0x11c1*/  .byte 0x22
/*0x11c2*/  .byte 0x00
/*0x11c3*/  .byte 0xf1
/*0x11c4*/  .byte 0x18
/*0x11c5*/  .byte 0x01
/*0x11c6*/  .byte 0x0a
/*0x11c7*/  .byte 0xe0
/*0x11c8*/  .byte 0x09
/*0x11c9*/  .byte 0x4d
/*0x11ca*/  .byte 0x29
/*0x11cb*/  .byte 0x68
/*0x11cc*/  .byte 0x00
/*0x11cd*/  .byte 0x29
/*0x11ce*/  .byte 0x0a
/*0x11cf*/  .byte 0xd0
/*0x11d0*/  .byte 0x01
/*0x11d1*/  .byte 0x69
/*0x11d2*/  .byte 0x01
/*0x11d3*/  .byte 0x29
/*0x11d4*/  .byte 0x07
/*0x11d5*/  .byte 0xd1
/*0x11d6*/  .byte 0x04
/*0x11d7*/  .byte 0x61
/*0x11d8*/  .byte 0x04
/*0x11d9*/  .byte 0x49
/*0x11da*/  .byte 0x02
/*0x11db*/  .byte 0x22
/*0x11dc*/  .byte 0x09
/*0x11dd*/  .byte 0x1d
/*0x11de*/  .byte 0x02
/*0x11df*/  .byte 0x20
/*0x11e0*/  .byte 0x00
/*0x11e1*/  .byte 0xf0
/*0x11e2*/  .byte 0x88
/*0x11e3*/  .byte 0xfb
/*0x11e4*/  .byte 0x2c
/*0x11e5*/  .byte 0x60
/*0x11e6*/  .byte 0x70
/*0x11e7*/  .byte 0xbd
/*0x11e8*/  .byte 0x5c
/*0x11e9*/  .byte 0x00
/*0x11ea*/  .byte 0x00
/*0x11eb*/  .byte 0x20
/*0x11ec*/  .byte 0x10
/*0x11ed*/  .byte 0x00
/*0x11ee*/  .byte 0x00
/*0x11ef*/  .byte 0x20
/*0x11f0*/  .byte 0x60
/*0x11f1*/  .byte 0x00
/*0x11f2*/  .byte 0x00
/*0x11f3*/  .byte 0x20
/*0x11f4*/  .byte 0x01
/*0x11f5*/  .byte 0x49
/*0x11f6*/  .byte 0x01
/*0x11f7*/  .byte 0x20
/*0x11f8*/  .byte 0xc8
/*0x11f9*/  .byte 0x60
/*0x11fa*/  .byte 0x70
/*0x11fb*/  .byte 0x47
/*0x11fc*/  .byte 0x10
/*0x11fd*/  .byte 0x00
/*0x11fe*/  .byte 0x00
/*0x11ff*/  .byte 0x20
/*0x1200*/  .byte 0x01
/*0x1201*/  .byte 0x49
/*0x1202*/  .byte 0x01
/*0x1203*/  .byte 0x20
/*0x1204*/  .byte 0x08
/*0x1205*/  .byte 0x61
/*0x1206*/  .byte 0x70
/*0x1207*/  .byte 0x47
/*0x1208*/  .byte 0x10
/*0x1209*/  .byte 0x00
/*0x120a*/  .byte 0x00
/*0x120b*/  .byte 0x20


            .thumb_func
            function_70:
/*0x120c*/      push {r4, lr}
/*0x120e*/      ldr r4, [pc, #0x28] /* data_1238 */
/*0x1210*/      ldrd r1, r0, [r4, #4]
/*0x1214*/      add r1, r0
/*0x1216*/      movs r2, #0x40
/*0x1218*/      movs r0, #4
/*0x121a*/      bl call_1894
/*0x121e*/      ldr r1, [r4, #4]
/*0x1220*/      add r0, r1
/*0x1222*/      ubfx r0, r0, #0, #0xa
/*0x1226*/      str r0, [r4, #4]
/*0x1228*/      ldr r1, [pc, #0x10] /* data_123c */
/*0x122a*/      movs r0, #1
/*0x122c*/      str r0, [r1, #0x14]
/*0x122e*/      pop.w {r4, lr}
/*0x1232*/      b.w handle_update_packet

/*0x1236*/  .byte 0x00
/*0x1237*/  .byte 0x00

            data_1238:
/*0x1238*/  .word 0x200001cc
            data_123c:
/*0x123c*/  .word 0x20000010

            jump_1240:
/*0x1240*/      push {r4, r5, r6, lr}
/*0x1242*/      mov r4, r0
/*0x1244*/      ldrb r2, [r0, #3]
/*0x1246*/      ldrb r1, [r0, #2]
/*0x1248*/      ldrh r5, [r0, #6]
/*0x124a*/      ldrh r0, [r0, #4]
/*0x124c*/      cmp r2, #1
/*0x124e*/      bne jump_12a2
/*0x1250*/      cbz r0, jump_1266
/*0x1252*/      cmp r0, #1
/*0x1254*/      beq jump_126c
/*0x1256*/      cmp r0, #2
/*0x1258*/      bne jump_12a2
/*0x125a*/      cmp r1, #1
/*0x125c*/      beq jump_1294
/*0x125e*/      cmp r1, #2
/*0x1260*/      bne jump_12a2
/*0x1262*/      ldr r0, [pc, #0x40] /* data_12a4 */
/*0x1264*/      b jump_1298
            jump_1266:
/*0x1266*/      ldr r0, [pc, #0x3c] /* data_12a4 */
/*0x1268*/      adds r0, #8
/*0x126a*/      b jump_1298
            jump_126c:
/*0x126c*/      ldr r0, [pc, #0x38] /* data_12a8 */
/*0x126e*/      bl call_390
/*0x1272*/      cmp r0, #0
/*0x1274*/      bne jump_12a2
/*0x1276*/      ldr r2, [pc, #0x30] /* data_12a8 */
/*0x1278*/      movs r0, #0x43
/*0x127a*/      movs r3, #0
/*0x127c*/      ldr r1, [r2, #8]
/*0x127e*/      b jump_1284
            jump_1280:
/*0x1280*/      strb r3, [r1, r0]
/*0x1282*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_1284:
/*0x1284*/      ldr r6, [r2, #4]
/*0x1286*/      cmp r6, r0
/*0x1288*/      bls jump_1280
/*0x128a*/      ldr r0, [pc, #0x1c] /* data_12a8 */
/*0x128c*/      str r1, [r4, #0x1c]
/*0x128e*/      bl clear_two_words
/*0x1292*/      b jump_129a
            jump_1294:
/*0x1294*/      ldr r0, [pc, #0xc] /* data_12a4 */
/*0x1296*/      subs r0, #0x14
            jump_1298:
/*0x1298*/      str r0, [r4, #0x1c]
            jump_129a:
/*0x129a*/      movs r0, #1
/*0x129c*/      str r5, [r4, #0x20]
/*0x129e*/      strb.w r0, [r4, #0x24]
            jump_12a2:
/*0x12a2*/      pop {r4, r5, r6, pc}

            data_12a4:
/*0x12a4*/  .word 0x20000028
            data_12a8:
/*0x12a8*/  .word 0x200001bc


            .thumb_func
            ptr_write_func_ptrs:
/*0x12ac*/      ldr r1, [pc, #0x20] /* data_12d0 */
/*0x12ae*/      str r1, [r0]
/*0x12b0*/      ldr r1, [pc, #0x20] /* data_12d4 */
/*0x12b2*/      str r1, [r0, #8]
/*0x12b4*/      ldr r1, [pc, #0x20] /* data_12d8 */
/*0x12b6*/      str r1, [r0, #0x18]
/*0x12b8*/      ldr r1, [pc, #0x20] /* data_12dc */
/*0x12ba*/      str r1, [r0, #0x24]
/*0x12bc*/      ldr r1, [pc, #0x20] /* data_12e0 */
/*0x12be*/      str r1, [r0, #0x2c]
/*0x12c0*/      ldr r1, [pc, #0x20] /* data_12e4 */
/*0x12c2*/      str r1, [r0, #0x30]
/*0x12c4*/      ldr r1, [pc, #0x20] /* data_12e8 */
/*0x12c6*/      str r1, [r0, #0x38]
/*0x12c8*/      movs r0, #0
/*0x12ca*/      b.w jump_13e4

/*0x12ce*/  .byte 0x00
/*0x12cf*/  .byte 0x00

            data_12d0:
/*0x12d0*/  .word 0x000012ed /* possible pointer */
            data_12d4:
/*0x12d4*/  .word 0x000013e5 /* possible pointer */
            data_12d8:
/*0x12d8*/  .word 0x00001435 /* possible pointer */
            data_12dc:
/*0x12dc*/  .word 0x00001331 /* possible pointer */
            data_12e0:
/*0x12e0*/  .word 0x000011f5 /* possible pointer */
            data_12e4:
/*0x12e4*/  .word 0x00001201 /* possible pointer */
            data_12e8:
/*0x12e8*/  .word 0x0000120d /* possible pointer */

/*0x12ec*/  .byte 0x0e
/*0x12ed*/  .byte 0x48
/*0x12ee*/  .byte 0x10
/*0x12ef*/  .byte 0xb5
/*0x12f0*/  .byte 0x01
/*0x12f1*/  .byte 0x68
/*0x12f2*/  .byte 0x01
/*0x12f3*/  .byte 0x29
/*0x12f4*/  .byte 0x11
/*0x12f5*/  .byte 0xd1
/*0x12f6*/  .byte 0x00
/*0x12f7*/  .byte 0x21
/*0x12f8*/  .byte 0x01
/*0x12f9*/  .byte 0x60
/*0x12fa*/  .byte 0x0c
/*0x12fb*/  .byte 0x4c
/*0x12fc*/  .byte 0x20
/*0x12fd*/  .byte 0x78
/*0x12fe*/  .byte 0x00
/*0x12ff*/  .byte 0xf0
/*0x1300*/  .byte 0x01
/*0x1301*/  .byte 0x00
/*0x1302*/  .byte 0xfe
/*0x1303*/  .byte 0xf7
/*0x1304*/  .byte 0xee
/*0x1305*/  .byte 0xfe
/*0x1306*/  .byte 0x20
/*0x1307*/  .byte 0x78
/*0x1308*/  .byte 0xc0
/*0x1309*/  .byte 0xf3
/*0x130a*/  .byte 0x40
/*0x130b*/  .byte 0x00
/*0x130c*/  .byte 0xff
/*0x130d*/  .byte 0xf7
/*0x130e*/  .byte 0x88
/*0x130f*/  .byte 0xfb
/*0x1310*/  .byte 0x20
/*0x1311*/  .byte 0x78
/*0x1312*/  .byte 0xc0
/*0x1313*/  .byte 0xf3
/*0x1314*/  .byte 0x80
/*0x1315*/  .byte 0x00
/*0x1316*/  .byte 0xfe
/*0x1317*/  .byte 0xf7
/*0x1318*/  .byte 0xfc
/*0x1319*/  .byte 0xfe
/*0x131a*/  .byte 0xff
/*0x131b*/  .byte 0xf7
/*0x131c*/  .byte 0x13
/*0x131d*/  .byte 0xff
/*0x131e*/  .byte 0xbd
/*0x131f*/  .byte 0xe8
/*0x1320*/  .byte 0x10
/*0x1321*/  .byte 0x40
/*0x1322*/  .byte 0xff
/*0x1323*/  .byte 0xf7
/*0x1324*/  .byte 0x43
/*0x1325*/  .byte 0xbf
/*0x1326*/  .byte 0x00
/*0x1327*/  .byte 0x00
/*0x1328*/  .byte 0xa4
/*0x1329*/  .byte 0x01
/*0x132a*/  .byte 0x00
/*0x132b*/  .byte 0x20
/*0x132c*/  .byte 0x10
/*0x132d*/  .byte 0x00
/*0x132e*/  .byte 0x00
/*0x132f*/  .byte 0x20


            .thumb_func
            function_67:
/*0x1330*/      push {r4, r5, r6, r7}
/*0x1332*/      ldrh r1, [r0]
/*0x1334*/      mov.w r5, #0x100
/*0x1338*/      movw r7, #0x921
/*0x133c*/      lsls r6, r5, #1
/*0x133e*/      ldr r4, [pc, #0x98] /* data_13d8 */
/*0x1340*/      movs r3, #1
/*0x1342*/      subw r2, r1, #0x921
/*0x1346*/      cmp r1, r7
/*0x1348*/      beq jump_1388
/*0x134a*/      bgt jump_1362
/*0x134c*/      adds.w r1, r2, #0x780
/*0x1350*/      beq jump_1376
/*0x1352*/      cmp r1, r5
/*0x1354*/      beq jump_137c
/*0x1356*/      cmp r1, r6
/*0x1358*/      bne jump_13b0
/*0x135a*/      ldr r1, [pc, #0x80] /* data_13dc */
/*0x135c*/      strd r1, r3, [r0, #0x1c]
/*0x1360*/      b jump_13d2
            jump_1362:
/*0x1362*/      movs r7, #0
/*0x1364*/      cmp r2, r5
/*0x1366*/      beq jump_13b4
/*0x1368*/      cmp r2, r6
/*0x136a*/      bne jump_13b0
/*0x136c*/      ldr r2, [pc, #0x6c] /* data_13dc */
/*0x136e*/      ldrb r1, [r0, #2]
/*0x1370*/      subs r2, #8
/*0x1372*/      str r1, [r2, #8]
/*0x1374*/      b jump_13d0
            jump_1376:
/*0x1376*/      pop {r4, r5, r6, r7}
/*0x1378*/      b.w jump_1240
            jump_137c:
/*0x137c*/      ldrh r1, [r0, #4]
/*0x137e*/      cmp r1, #0
/*0x1380*/      bne jump_13b0
/*0x1382*/      strd r4, r3, [r0, #0x1c]
/*0x1386*/      b jump_13d2
            jump_1388:
/*0x1388*/      ldrb r3, [r0, #3]
/*0x138a*/      ldrh r1, [r0, #6]
/*0x138c*/      ldrh r2, [r0, #4]
/*0x138e*/      str r1, [r0, #0x20]
/*0x1390*/      cmp r3, #2
/*0x1392*/      bne jump_13b0
/*0x1394*/      cmp r2, #0
/*0x1396*/      bne jump_13b0
/*0x1398*/      ldr r3, [pc, #0x40] /* data_13dc */
/*0x139a*/      subs r3, #8
/*0x139c*/      str r3, [r0, #0x1c]
/*0x139e*/      ldr r3, [pc, #0x40] /* data_13e0 */
/*0x13a0*/      strd r3, r2, [r0, #0x28]
/*0x13a4*/      movs r2, #2
/*0x13a6*/      strb.w r2, [r0, #0x24]
/*0x13aa*/      ldr r0, [pc, #0x2c] /* data_13d8 */
/*0x13ac*/      adds r0, #0x18
/*0x13ae*/      str r1, [r0]
            jump_13b0:
/*0x13b0*/      pop {r4, r5, r6, r7}
/*0x13b2*/      bx lr
            jump_13b4:
/*0x13b4*/      ldrh r2, [r0, #4]
/*0x13b6*/      ldrb r1, [r0, #3]
/*0x13b8*/      cmp r2, #0
/*0x13ba*/      bne jump_13b0
/*0x13bc*/      mov.w r2, #0xfa0
/*0x13c0*/      str r1, [r4]
/*0x13c2*/      muls r1, r2, r1
/*0x13c4*/      asrs r2, r2, #3
/*0x13c6*/      udiv r1, r1, r2
/*0x13ca*/      ldr r2, [pc, #0xc] /* data_13d8 */
/*0x13cc*/      subs r2, #0xc
/*0x13ce*/      str r1, [r2]
            jump_13d0:
/*0x13d0*/      str r7, [r0, #0x20]
            jump_13d2:
/*0x13d2*/      strb.w r3, [r0, #0x24]
/*0x13d6*/      b jump_13b0

            data_13d8:
/*0x13d8*/  .word 0x20000198
            data_13dc:
/*0x13dc*/  .word 0x20000018
            data_13e0:
/*0x13e0*/  .word 0x00001425 /* possible pointer */

            jump_13e4:
/*0x13e4*/      ldr r0, [pc, #0x34] /* data_141c */
/*0x13e6*/      push {r4, lr}
/*0x13e8*/      movs r3, #1
/*0x13ea*/      str r3, [r0, #0xc]
/*0x13ec*/      str r3, [r0, #0x10]
/*0x13ee*/      movs r1, #0
/*0x13f0*/      str r1, [r0, #0x14]
/*0x13f2*/      add.w r2, r0, #0x20
/*0x13f6*/      movs r0, #5
/*0x13f8*/      strb r1, [r2]
            jump_13fa:
/*0x13fa*/      add.w r4, r2, r0
/*0x13fe*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x1400*/      strb r1, [r4, #2]
/*0x1402*/      bpl jump_13fa
/*0x1404*/      ldr r0, [pc, #0x14] /* data_141c */
/*0x1406*/      movs r2, #2
/*0x1408*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x140a*/      strb r3, [r0]
/*0x140c*/      strb r1, [r0, #1]
/*0x140e*/      adds r0, #0x14
/*0x1410*/      strb r2, [r0]
/*0x1412*/      str.w r1, [r0, #1]
/*0x1416*/      ldr r0, [pc, #8] /* data_1420 */
/*0x1418*/      str r3, [r0]
/*0x141a*/      pop {r4, pc}

            data_141c:
/*0x141c*/  .word 0x20000010
            data_1420:
/*0x1420*/  .word 0x2000000c


            .thumb_func
            function_81:
/*0x1424*/      ldr r2, [pc, #8] /* data_1430 */
/*0x1426*/      movs r1, #1
/*0x1428*/      str.w r1, [r2, r0, lsl #2]
/*0x142c*/      bx lr

/*0x142e*/  .byte 0x00
/*0x142f*/  .byte 0x00

            data_1430:
/*0x1430*/  .word 0x200001a4


            .thumb_func
            usb_get_descriptor:
/*0x1434*/      ldrb r2, [r0, #3]
/*0x1436*/      ldrh r1, [r0, #4]
/*0x1438*/      movs r3, #1
/*0x143a*/      cmp r2, #0x21
/*0x143c*/      beq jump_144e
/*0x143e*/      cmp r2, #0x22
/*0x1440*/      bne jump_1486
/*0x1442*/      cbz r1, jump_1470
/*0x1444*/      cmp r1, #1
/*0x1446*/      beq jump_1478
/*0x1448*/      cmp r1, #2
/*0x144a*/      bne jump_1482
/*0x144c*/      b jump_1488
            jump_144e:
/*0x144e*/      cbz r1, jump_145a
/*0x1450*/      cmp r1, #1
/*0x1452*/      beq jump_1460
/*0x1454*/      cmp r1, #2
/*0x1456*/      bne jump_1466
/*0x1458*/      b jump_146a
            jump_145a:
/*0x145a*/      ldr r1, [r0, #0xc]
/*0x145c*/      adds r1, #0x12
/*0x145e*/      b jump_1464
            jump_1460:
/*0x1460*/      ldr r1, [r0, #0xc]
/*0x1462*/      adds r1, #0x2b
            jump_1464:
/*0x1464*/      str r1, [r0, #0x1c]
            jump_1466:
/*0x1466*/      movs r1, #9
/*0x1468*/      b jump_1480
            jump_146a:
/*0x146a*/      ldr r1, [r0, #0xc]
/*0x146c*/      adds r1, #0x4b
/*0x146e*/      b jump_1464
            jump_1470:
/*0x1470*/      ldr r1, [pc, #0x20] /* data_1494 */
/*0x1472*/      str r1, [r0, #0x1c]
/*0x1474*/      movs r1, #0x40
/*0x1476*/      b jump_1480
            jump_1478:
/*0x1478*/      ldr r1, [pc, #0x18] /* data_1494 */
/*0x147a*/      adds r1, #0x40
/*0x147c*/      str r1, [r0, #0x1c]
/*0x147e*/      movs r1, #0x22
            jump_1480:
/*0x1480*/      str r1, [r0, #0x20]
            jump_1482:
/*0x1482*/      strb.w r3, [r0, #0x24]
            jump_1486:
/*0x1486*/      bx lr
            jump_1488:
/*0x1488*/      ldr r1, [pc, #8] /* data_1494 */
/*0x148a*/      adds r1, #0x64
/*0x148c*/      str r1, [r0, #0x1c]
/*0x148e*/      movs r1, #0x65
/*0x1490*/      b jump_1480

/*0x1492*/  .byte 0x00
/*0x1493*/  .byte 0x00

            data_1494:
/*0x1494*/  .word 0x00002024 /* possible pointer */


            .thumb_func
            function_6:
/*0x1498*/      ldrb.w r0, [r0, #0x34]
/*0x149c*/      ubfx r0, r0, #1, #1
/*0x14a0*/      bx lr

            .thumb_func
            usb_entry:
/*0x14a2*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x14a6*/      mov r4, r0
/*0x14a8*/      bl call_196c
/*0x14ac*/      mov r5, r0
/*0x14ae*/      lsls r0, r0, #0x1e
/*0x14b0*/      bpl jump_14c0
/*0x14b2*/      ldr r1, [r4, #0x4c]
/*0x14b4*/      cbz r1, jump_14ba
/*0x14b6*/      ldr r0, [r4, #0x50]
/*0x14b8*/      blx r1
            jump_14ba:
/*0x14ba*/      movs r0, #2
/*0x14bc*/      bl call_16e0
            jump_14c0:
/*0x14c0*/      lsls r0, r5, #0x1b
/*0x14c2*/      bpl jump_14e2
/*0x14c4*/      movs r0, #0x10
/*0x14c6*/      bl call_16e0
/*0x14ca*/      ldrb.w r0, [r4, #0x32]
/*0x14ce*/      cmp r0, #2
/*0x14d0*/      blo jump_14e2
/*0x14d2*/      bl call_1980
/*0x14d6*/      ldrb r0, [r4, #0x32]!
/*0x14da*/      strb r0, [r4, #1]
/*0x14dc*/      movs r0, #3
/*0x14de*/      strb r0, [r4], #-0x32
            jump_14e2:
/*0x14e2*/      lsls r0, r5, #0x1d
/*0x14e4*/      mov.w r7, #0
/*0x14e8*/      bpl jump_1532
/*0x14ea*/      add.w r4, r4, #0x20
/*0x14ee*/      mov.w r0, #-1
/*0x14f2*/      ldr r6, [r4, #0x64]
/*0x14f4*/      str r0, [r4]
/*0x14f6*/      strb r7, [r4, #0x10]
/*0x14f8*/      strb r7, [r4, #0x11]
/*0x14fa*/      ldrb r0, [r4, #0x14]
/*0x14fc*/      bic r0, r0, #2
/*0x1500*/      strb r0, [r4, #0x14]
/*0x1502*/      mov.w r0, #4
/*0x1506*/      strb r0, [r4, #0x12]
/*0x1508*/      str r7, [r4, #0x18]
/*0x150a*/      bl call_177c
/*0x150e*/      bl usb_clear_csr
/*0x1512*/      movs r0, #0
/*0x1514*/      ldr r1, [r4, #0x64]
/*0x1516*/      bl call_1834
/*0x151a*/      ldr r0, [r6]
/*0x151c*/      bl call_193c
/*0x1520*/      ldr r1, [r4, #0x24]
/*0x1522*/      sub.w r4, r4, #0x20
/*0x1526*/      cbz r1, jump_152c
/*0x1528*/      ldr r0, [r4, #0x48]
/*0x152a*/      blx r1
            jump_152c:
/*0x152c*/      movs r0, #4
/*0x152e*/      bl call_16e0
            jump_1532:
/*0x1532*/      lsls r0, r5, #0x1c
/*0x1534*/      bpl jump_1548
/*0x1536*/      bl usb_clear_csr
/*0x153a*/      ldrb.w r0, [r4, #0x33]
/*0x153e*/      strb.w r0, [r4, #0x32]
/*0x1542*/      movs r0, #8
/*0x1544*/      bl call_16e0
            jump_1548:
/*0x1548*/      lsls r0, r5, #0x17
/*0x154a*/      mov.w r6, #0x100
/*0x154e*/      bpl jump_1646
/*0x1550*/      movs r0, #0
/*0x1552*/      bl call_1814
/*0x1556*/      mov r5, r0
/*0x1558*/      lsls r0, r0, #0x16
/*0x155a*/      bpl jump_15a2
/*0x155c*/      mov r0, r4
/*0x155e*/      bl call_1a58
/*0x1562*/      strb.w r7, [r4, #0x24]
/*0x1566*/      str r7, [r4, #0x20]
/*0x1568*/      ldrb r0, [r4]
/*0x156a*/      ands r0, r0, #0x60
/*0x156e*/      beq jump_1576
/*0x1570*/      cmp r0, #0x20
/*0x1572*/      bne jump_1586
/*0x1574*/      b jump_157e
            jump_1576:
/*0x1576*/      mov r0, r4
/*0x1578*/      bl call_1d38
/*0x157c*/      b jump_1586
            jump_157e:
/*0x157e*/      ldr r1, [r4, #0x60]
/*0x1580*/      cbz r1, jump_1586
/*0x1582*/      mov r0, r4
/*0x1584*/      blx r1
            jump_1586:
/*0x1586*/      ldrb.w r0, [r4, #0x24]
/*0x158a*/      cmp r0, #1
/*0x158c*/      beq jump_15be
/*0x158e*/      cmp r0, #2
/*0x1590*/      beq jump_15d0
/*0x1592*/      movs r0, #0
/*0x1594*/      bl call_18d4
            jump_1598:
/*0x1598*/      mov.w r1, #0x200
/*0x159c*/      movs r0, #0
/*0x159e*/      bl call_17a4
            jump_15a2:
/*0x15a2*/      lsls r0, r5, #0x1e
/*0x15a4*/      bpl jump_1604
/*0x15a6*/      movs r1, #2
/*0x15a8*/      movs r0, #0
/*0x15aa*/      bl call_17a4
/*0x15ae*/      ldr r0, [r4, #0x20]
/*0x15b0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x15b2*/      beq jump_1604
/*0x15b4*/      ldrb.w r0, [r4, #0x24]
/*0x15b8*/      cmp r0, #2
/*0x15ba*/      beq jump_15dc
/*0x15bc*/      b jump_1604
            jump_15be:
/*0x15be*/      ldrh r0, [r4, #6]
/*0x15c0*/      ldr r1, [r4, #0x20]
/*0x15c2*/      cmp r1, r0
/*0x15c4*/      ble jump_15c8
/*0x15c6*/      str r0, [r4, #0x20]
            jump_15c8:
/*0x15c8*/      mov r0, r4
/*0x15ca*/      bl call_1cc0
/*0x15ce*/      b jump_1598
            jump_15d0:
/*0x15d0*/      movs r2, #0
/*0x15d2*/      mov r1, r2
/*0x15d4*/      mov r0, r2
/*0x15d6*/      bl usb_copy_send
/*0x15da*/      b jump_1598
            jump_15dc:
/*0x15dc*/      movs r2, #0x40
/*0x15de*/      movs r0, #0
/*0x15e0*/      ldr r1, [r4, #0x1c]
/*0x15e2*/      bl call_1894
/*0x15e6*/      ldr r1, [r4, #0x1c]
/*0x15e8*/      add r1, r0
/*0x15ea*/      str r1, [r4, #0x1c]
/*0x15ec*/      ldr r1, [r4, #0x20]
/*0x15ee*/      subs r0, r1, r0
/*0x15f0*/      str r0, [r4, #0x20]
/*0x15f2*/      bne jump_1604
/*0x15f4*/      movs r0, #1
/*0x15f6*/      strb.w r0, [r4, #0x24]
/*0x15fa*/      ldr r1, [r4, #0x28]
/*0x15fc*/      cbz r1, jump_1604
/*0x15fe*/      ldr r0, [r4, #0x2c]
/*0x1600*/      blx r1
/*0x1602*/      str r7, [r4, #0x28]
            jump_1604:
/*0x1604*/      lsls r0, r5, #0x1b
/*0x1606*/      bpl jump_1616
/*0x1608*/      mov r0, r4
/*0x160a*/      bl call_1cc0
/*0x160e*/      movs r1, #0x10
/*0x1610*/      movs r0, #0
/*0x1612*/      bl call_17a4
            jump_1616:
/*0x1616*/      mov r0, r6
/*0x1618*/      bl call_16e0
/*0x161c*/      b jump_1646
            jump_161e:
/*0x161e*/      mov r0, r5
/*0x1620*/      bl call_1814
/*0x1624*/      tst.w r0, #0x12
/*0x1628*/      beq jump_1646
/*0x162a*/      movs r1, #0x12
/*0x162c*/      mov r0, r5
/*0x162e*/      bl call_17a4
/*0x1632*/      lsl.w r0, r6, r5
/*0x1636*/      bl call_16e0
/*0x163a*/      add.w r0, r4, r5, lsl #2
/*0x163e*/      ldr r1, [r0, #0x64]
/*0x1640*/      cbz r1, jump_1646
/*0x1642*/      mov r0, r5
/*0x1644*/      blx r1
            jump_1646:
/*0x1646*/      bl call_196c
/*0x164a*/      bl call_194c
/*0x164e*/      mov r5, r0
/*0x1650*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1652*/      bne jump_161e
/*0x1654*/      pop.w {r4, r5, r6, r7, r8, pc}

            .thumb_func
            call_1658:
/*0x1658*/      add.w r0, r0, #0x30
/*0x165c*/      movs r1, #2
/*0x165e*/      strb r1, [r0, #2]
/*0x1660*/      ldr r0, [r0, #0x54]
/*0x1662*/      b.w jump_197c

            .thumb_func
            call_1666:
/*0x1666*/      ldrb.w r0, [r0, #0x32]
/*0x166a*/      cmp r0, #3
/*0x166c*/      beq jump_1672
/*0x166e*/      movs r0, #0
/*0x1670*/      bx lr
            jump_1672:
/*0x1672*/      movs r0, #1
/*0x1674*/      bx lr

            .thumb_func
            call_1676:
/*0x1676*/      push {r4, lr}
/*0x1678*/      add.w r4, r0, #0x30
/*0x167c*/      ldrb r0, [r4, #4]
/*0x167e*/      ubfx r1, r0, #0, #1
/*0x1682*/      ldr r0, [r4, #0x54]
/*0x1684*/      bl call_19a0
/*0x1688*/      ldrb r0, [r4, #2]
/*0x168a*/      sub.w r4, r4, #0x30
/*0x168e*/      cmp r0, #3
/*0x1690*/      bne jump_169e
/*0x1692*/      ldr.w r1, [r4, #0x88]
/*0x1696*/      cbz r1, jump_169e
/*0x1698*/      ldr.w r0, [r4, #0x8c]
/*0x169c*/      blx r1
            jump_169e:
/*0x169e*/      ldr r1, [r4, #0x3c]
/*0x16a0*/      cmp r1, #0
/*0x16a2*/      beq jump_16b4
/*0x16a4*/      ldrb.w r0, [r4, #0x32]
/*0x16a8*/      cmp r0, #6
/*0x16aa*/      bne jump_16b4
/*0x16ac*/      ldr r0, [r4, #0x40]
/*0x16ae*/      pop.w {r4, lr}
/*0x16b2*/      bx r1
            jump_16b4:
/*0x16b4*/      pop {r4, pc}

            .thumb_func
            call_16b6:
/*0x16b6*/      push {r4, lr}
/*0x16b8*/      bl usb_clear_csr
/*0x16bc*/      pop.w {r4, lr}
/*0x16c0*/      b.w jump_1a68

            .thumb_func
            call_16c4:
/*0x16c4*/      ldr r1, [pc, #0x10] /* data_16d8 */
/*0x16c6*/      str r1, [r0]
/*0x16c8*/      adds r1, #0x14
/*0x16ca*/      str r1, [r0, #4]
/*0x16cc*/      ldr r1, [pc, #0xc] /* data_16dc */
/*0x16ce*/      str r1, [r0, #8]
/*0x16d0*/      movs r1, #4
/*0x16d2*/      str r1, [r0, #0xc]
/*0x16d4*/      bx lr

/*0x16d6*/  .byte 0x00
/*0x16d7*/  .byte 0x00

            data_16d8:
/*0x16d8*/  .word 0x000020f0 /* possible pointer */
            data_16dc:
/*0x16dc*/  .word 0x20000038


            .thumb_func
            call_16e0:
/*0x16e0*/      ldr r1, [pc, #4] /* data_16e8 */
/*0x16e2*/      str r0, [r1, #8]
/*0x16e4*/      bx lr

/*0x16e6*/  .byte 0x00
/*0x16e7*/  .byte 0x00

            data_16e8:
/*0x16e8*/  .word 0x400a8000


            .thumb_func
            usb_init:
/*0x16ec*/      push {r4, lr}
/*0x16ee*/      movs r1, #1
/*0x16f0*/      movs r0, #0x40
/*0x16f2*/      bl call_3d0
/*0x16f6*/      movs r1, #1
/*0x16f8*/      lsls r0, r1, #0xa
/*0x16fa*/      bl ckcu_ahb_clock_enable
/*0x16fe*/      movs r0, #2
/*0x1700*/      bl call_3e8
/*0x1704*/      ldr r1, [pc, #0x30] /* data_1738 */
/*0x1706*/      sub.w r0, r1, #0xc
/*0x170a*/      str r1, [r0]
/*0x170c*/      ldr r1, [pc, #0x2c] /* data_173c */
/*0x170e*/      str r1, [r0, #4]
/*0x1710*/      subs r0, #0x7c
/*0x1712*/      bl call_16c4
/*0x1716*/      ldr r0, [pc, #0x20] /* data_1738 */
/*0x1718*/      subs r0, #0x54
/*0x171a*/      bl ptr_write_func_ptrs
/*0x171e*/      ldr r0, [pc, #0x18] /* data_1738 */
/*0x1720*/      subs r0, #0x90
/*0x1722*/      bl call_1658
/*0x1726*/      ldr r1, [pc, #0x18] /* data_1740 */
/*0x1728*/      mov.w r0, #0x200000
/*0x172c*/      str.w r0, [r1, #0x100]
/*0x1730*/      pop.w {r4, lr}
/*0x1734*/      b.w jump_310

            data_1738:
/*0x1738*/  .word 0x20000148
            data_173c:
/*0x173c*/  .word 0x0000104d /* possible pointer */
            data_1740:
/*0x1740*/  .word 0xe000e004


            .thumb_func
            call_1744:
/*0x1744*/      ldr r1, [pc, #0x14] /* data_175c */
/*0x1746*/      cmp r0, #1
/*0x1748*/      ldr r0, [r1]
/*0x174a*/      beq jump_1754
/*0x174c*/      bic r0, r0, #0x800
            jump_1750:
/*0x1750*/      str r0, [r1]
/*0x1752*/      bx lr
            jump_1754:
/*0x1754*/      orr r0, r0, #0x800
/*0x1758*/      b jump_1750

/*0x175a*/  .byte 0x00
/*0x175b*/  .byte 0x00

            data_175c:
/*0x175c*/  .word 0x400a8000


            .thumb_func
            usb_dp_pull_up:
/*0x1760*/      ldr r1, [pc, #0x14] /* data_1778 */
/*0x1762*/      cmp r0, #1
/*0x1764*/      ldr r0, [r1]
/*0x1766*/      beq jump_1770
/*0x1768*/      bic r0, r0, #0x400
            jump_176c:
/*0x176c*/      str r0, [r1]
/*0x176e*/      bx lr
            jump_1770:
/*0x1770*/      orr r0, r0, #0x400
/*0x1774*/      b jump_176c

/*0x1776*/  .byte 0x00
/*0x1777*/  .byte 0x00

            data_1778:
/*0x1778*/  .word 0x400a8000


            .thumb_func
            call_177c:
/*0x177c*/      movs r1, #1
/*0x177e*/      movs r0, #0x20
/*0x1780*/      b.w jump_b94

            .thumb_func
            call_1784:
/*0x1784*/      push {r4, lr}
/*0x1786*/      bl usb_get_ep_reg
/*0x178a*/      ldr r1, [r0]
/*0x178c*/      and r1, r1, #9
/*0x1790*/      str r1, [r0]
/*0x1792*/      pop {r4, pc}

            .thumb_func
            call_1794:
/*0x1794*/      push {r4, lr}
/*0x1796*/      bl usb_get_ep_reg
/*0x179a*/      ldr r1, [r0]
/*0x179c*/      and r1, r1, #0x24
/*0x17a0*/      str r1, [r0]
/*0x17a2*/      pop {r4, pc}

            .thumb_func
            call_17a4:
/*0x17a4*/      push {r4, lr}
/*0x17a6*/      mov r4, r1
/*0x17a8*/      bl usb_get_ep_reg
/*0x17ac*/      str r4, [r0, #8]
/*0x17ae*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_buff:
/*0x17b0*/      push {r4, lr}
/*0x17b2*/      bl usb_get_ep_reg
/*0x17b6*/      ldr r0, [r0, #0x10]
/*0x17b8*/      ldr r1, [pc, #8] /* data_17c4 */
/*0x17ba*/      ubfx r0, r0, #0, #0xa
/*0x17be*/      add r0, r1
/*0x17c0*/      pop {r4, pc}

/*0x17c2*/  .byte 0x00
/*0x17c3*/  .byte 0x00

            data_17c4:
/*0x17c4*/  .word 0x400aa000


            .thumb_func
            call_17c8:
/*0x17c8*/      push {r4, r5, r6, lr}
/*0x17ca*/      mov r5, r0
/*0x17cc*/      bl usb_get_ep_reg
/*0x17d0*/      mov r4, r0
/*0x17d2*/      mov r0, r5
/*0x17d4*/      bl usb_get_ep_len
/*0x17d8*/      ldr r1, [r4, #0x10]
/*0x17da*/      ubfx r1, r1, #0, #0xa
/*0x17de*/      add r0, r1
/*0x17e0*/      ldr r1, [pc, #4] /* data_17e8 */
/*0x17e2*/      add r0, r1
/*0x17e4*/      pop {r4, r5, r6, pc}

/*0x17e6*/  .byte 0x00
/*0x17e7*/  .byte 0x00

            data_17e8:
/*0x17e8*/  .word 0x400aa000


            .thumb_func
            usb_get_ep_len:
/*0x17ec*/      push {r4, lr}
/*0x17ee*/      bl usb_get_ep_reg
/*0x17f2*/      ldr r0, [r0, #0x10]
/*0x17f4*/      ubfx r0, r0, #0xa, #0xa
/*0x17f8*/      pop {r4, pc}

            .thumb_func
            call_17fa:
/*0x17fa*/      push {r4, lr}
/*0x17fc*/      bl usb_get_ep_reg
/*0x1800*/      ldr r1, [r0, #0x10]
/*0x1802*/      ldr r0, [r0]
/*0x1804*/      lsls r1, r1, #3
/*0x1806*/      bpl jump_180e
/*0x1808*/      ubfx r0, r0, #2, #1
/*0x180c*/      pop {r4, pc}
            jump_180e:
/*0x180e*/      ubfx r0, r0, #5, #1
/*0x1812*/      pop {r4, pc}

            .thumb_func
            call_1814:
/*0x1814*/      push {r4, lr}
/*0x1816*/      bl usb_get_ep_reg
/*0x181a*/      ldr r1, [r0, #4]
/*0x181c*/      ldr r0, [r0, #8]
/*0x181e*/      ands r0, r1
/*0x1820*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_tcnt:
/*0x1822*/      push {r4, lr}
/*0x1824*/      mov r4, r1
/*0x1826*/      bl usb_get_ep_reg
/*0x182a*/      ldr r0, [r0, #0xc]
/*0x182c*/      lsrs r0, r4
/*0x182e*/      ubfx r0, r0, #0, #9
/*0x1832*/      pop {r4, pc}

            .thumb_func
            call_1834:
/*0x1834*/      push {r4, r5, r6, lr}
/*0x1836*/      mov r4, r1
/*0x1838*/      mov r5, r0
/*0x183a*/      bl usb_get_ep_reg
/*0x183e*/      add.w r1, r4, r5, lsl #3
/*0x1842*/      ldr r2, [r1, #4]
/*0x1844*/      str r2, [r0, #0x10]
/*0x1846*/      ldr r1, [r1, #8]
/*0x1848*/      str r1, [r0, #4]
/*0x184a*/      mov.w r1, #-1
/*0x184e*/      str r1, [r0, #8]
/*0x1850*/      mov r0, r5
/*0x1852*/      pop.w {r4, r5, r6, lr}
/*0x1856*/      b.w jump_18c4

            .thumb_func
            call_185a:
/*0x185a*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x185e*/      mov r7, r1
/*0x1860*/      mov r6, r2
/*0x1862*/      movs r5, r0
/*0x1864*/      beq jump_188a
/*0x1866*/      movs r1, #0
            jump_1868:
/*0x1868*/      bl usb_get_ep_tcnt
/*0x186c*/      mov r4, r0
/*0x186e*/      cmp r0, r6
/*0x1870*/      bhi jump_1884
/*0x1872*/      mov r0, r5
/*0x1874*/      cbz r5, jump_188e
/*0x1876*/      bl usb_get_ep_buff
            jump_187a:
/*0x187a*/      adds r1, r4, #3
/*0x187c*/      lsrs r2, r1, #2
/*0x187e*/      mov r1, r7
/*0x1880*/      bl call_1ea0
            jump_1884:
/*0x1884*/      mov r0, r4
/*0x1886*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_188a:
/*0x188a*/      movs r1, #0x10
/*0x188c*/      b jump_1868
            jump_188e:
/*0x188e*/      bl call_17c8
/*0x1892*/      b jump_187a

            .thumb_func
            call_1894:
/*0x1894*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x1898*/      mov r7, r1
/*0x189a*/      mov r5, r2
/*0x189c*/      mov r6, r0
/*0x189e*/      bl usb_get_ep_reg
/*0x18a2*/      mov r4, r0
/*0x18a4*/      movs r0, #0
/*0x18a6*/      cbz r5, jump_18b8
/*0x18a8*/      mov r2, r5
/*0x18aa*/      mov r1, r7
/*0x18ac*/      mov r0, r6
/*0x18ae*/      bl call_185a
/*0x18b2*/      cbnz r0, jump_18b8
/*0x18b4*/      cmp r5, #0
/*0x18b6*/      bne jump_18c0
            jump_18b8:
/*0x18b8*/      ldr r1, [r4]
/*0x18ba*/      and r1, r1, #0x10
/*0x18be*/      str r1, [r4]
            jump_18c0:
/*0x18c0*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_18c4:
/*0x18c4*/      push {r4, lr}
/*0x18c6*/      bl usb_get_ep_reg
/*0x18ca*/      ldr r1, [r0]
/*0x18cc*/      and r1, r1, #0x19
/*0x18d0*/      str r1, [r0]
/*0x18d2*/      pop {r4, pc}

            .thumb_func
            call_18d4:
/*0x18d4*/      push {r4, lr}
/*0x18d6*/      bl usb_get_ep_reg
/*0x18da*/      movs r1, #4
/*0x18dc*/      str r1, [r0]
/*0x18de*/      pop {r4, pc}

            .thumb_func
            call_18e0:
/*0x18e0*/      push {r4, lr}
/*0x18e2*/      bl usb_get_ep_reg
/*0x18e6*/      movs r1, #0x40
/*0x18e8*/      str r1, [r0, #8]
/*0x18ea*/      ldr r2, [r0]
/*0x18ec*/      movs r1, #0x24
/*0x18ee*/      bics r1, r2
/*0x18f0*/      str r1, [r0]
/*0x18f2*/      pop {r4, pc}

            .thumb_func
            usb_copy_send:
/*0x18f4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x18f8*/      mov r8, r1
/*0x18fa*/      mov r4, r2
/*0x18fc*/      mov r7, r0
/*0x18fe*/      bl usb_get_ep_len
/*0x1902*/      mov r6, r0
/*0x1904*/      mov r0, r7
/*0x1906*/      bl usb_get_ep_reg
/*0x190a*/      mov r5, r0
/*0x190c*/      movs r1, #0
/*0x190e*/      mov r0, r7
/*0x1910*/      bl usb_get_ep_tcnt
/*0x1914*/      cmp r4, r6
/*0x1916*/      bhi jump_191a
/*0x1918*/      cbz r0, jump_1920
            jump_191a:
/*0x191a*/      movs r0, #0
            jump_191c:
/*0x191c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_1920:
/*0x1920*/      mov r0, r7
/*0x1922*/      bl usb_get_ep_buff
/*0x1926*/      mov r1, r0
/*0x1928*/      adds r0, r4, #3
/*0x192a*/      lsrs r2, r0, #2
/*0x192c*/      mov r0, r8
/*0x192e*/      bl call_1ea0
/*0x1932*/      str r4, [r5, #0xc]
/*0x1934*/      movs r0, #2
/*0x1936*/      str r0, [r5]
/*0x1938*/      mov r0, r4
/*0x193a*/      b jump_191c

            .thumb_func
            call_193c:
/*0x193c*/      ldr r1, [pc, #8] /* data_1948 */
/*0x193e*/      ldr r2, [r1, #4]
/*0x1940*/      orrs r2, r0
/*0x1942*/      str r2, [r1, #4]
/*0x1944*/      bx lr

/*0x1946*/  .byte 0x00
/*0x1947*/  .byte 0x00

            data_1948:
/*0x1948*/  .word 0x400a8000


            .thumb_func
            call_194c:
/*0x194c*/      mov r3, r0
/*0x194e*/      movs r1, #7
            jump_1950:
/*0x1950*/      add.w r2, r1, #8
/*0x1954*/      lsr.w r0, r3, r2
/*0x1958*/      lsls r0, r0, #0x1f
/*0x195a*/      beq jump_1960
/*0x195c*/      sxtb r0, r1
/*0x195e*/      bx lr
            jump_1960:
/*0x1960*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x1962*/      cmp r1, #0
/*0x1964*/      bgt jump_1950
/*0x1966*/      mov.w r0, #-1
/*0x196a*/      bx lr

            .thumb_func
            call_196c:
/*0x196c*/      ldr r0, [pc, #8] /* data_1978 */
/*0x196e*/      ldr r1, [r0, #4]
/*0x1970*/      ldr r0, [r0, #8]
/*0x1972*/      ands r0, r1
/*0x1974*/      bx lr

/*0x1976*/  .byte 0x00
/*0x1977*/  .byte 0x00

            data_1978:
/*0x1978*/  .word 0x400a8000

            jump_197c:
/*0x197c*/      b.w jump_1a14

            .thumb_func
            call_1980:
/*0x1980*/      ldr r0, [pc, #8] /* data_198c */
/*0x1982*/      ldr r1, [r0]
/*0x1984*/      orr r1, r1, #0xc
/*0x1988*/      str r1, [r0]
/*0x198a*/      bx lr

            data_198c:
/*0x198c*/  .word 0x400a8000


            .thumb_func
            usb_clear_csr:
/*0x1990*/      ldr r0, [pc, #8] /* data_199c */
/*0x1992*/      ldr r1, [r0]
/*0x1994*/      and r1, r1, #0x400
/*0x1998*/      str r1, [r0]
/*0x199a*/      bx lr

            data_199c:
/*0x199c*/  .word 0x400a8000


            .thumb_func
            call_19a0:
/*0x19a0*/      push {r4, lr}
/*0x19a2*/      mov r4, r0
/*0x19a4*/      ldr r0, [pc, #0x64] /* data_1a0c */
/*0x19a6*/      ldr r2, [r0]
/*0x19a8*/      cmp r2, #1
/*0x19aa*/      bne jump_1a0a
/*0x19ac*/      movs r2, #0
/*0x19ae*/      str r2, [r0]
/*0x19b0*/      ldr r0, [pc, #0x5c] /* data_1a10 */
/*0x19b2*/      ldr r2, [r0]
/*0x19b4*/      lsls r3, r2, #0x19
/*0x19b6*/      mov.w r2, #-1
/*0x19ba*/      bpl jump_19d6
/*0x19bc*/      movw r3, #0x40c
/*0x19c0*/      str r3, [r0]
/*0x19c2*/      str r2, [r0, #8]
/*0x19c4*/      cbnz r1, jump_19cc
/*0x19c6*/      movs r0, #0
/*0x19c8*/      bl call_b50
            jump_19cc:
/*0x19cc*/      ldr r0, [r4]
/*0x19ce*/      pop.w {r4, lr}
/*0x19d2*/      b.w call_193c
            jump_19d6:
/*0x19d6*/      movw r3, #0xc0c
/*0x19da*/      str r3, [r0]
/*0x19dc*/      str r2, [r0, #8]
/*0x19de*/      cbnz r1, jump_19e6
/*0x19e0*/      movs r0, #0
/*0x19e2*/      bl call_b50
            jump_19e6:
/*0x19e6*/      movs r0, #0
/*0x19e8*/      bl call_1744
/*0x19ec*/      ldr r0, [r4]
/*0x19ee*/      bl call_193c
/*0x19f2*/      movs r0, #0
/*0x19f4*/      bl usb_dp_pull_up
/*0x19f8*/      movs r0, #0
            jump_19fa:
/*0x19fa*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x19fc*/      cmp r0, #0xc8
/*0x19fe*/      blo jump_19fa
/*0x1a00*/      pop.w {r4, lr}
/*0x1a04*/      movs r0, #1
/*0x1a06*/      b.w usb_dp_pull_up
            jump_1a0a:
/*0x1a0a*/      pop {r4, pc}

            data_1a0c:
/*0x1a0c*/  .word 0x200000b4
            data_1a10:
/*0x1a10*/  .word 0x400a8000

            jump_1a14:
/*0x1a14*/      movw r1, #0x171d
/*0x1a18*/      str r1, [r0]
/*0x1a1a*/      ldr r1, [pc, #0x28] /* data_1a44 */
/*0x1a1c*/      str r1, [r0, #4]
/*0x1a1e*/      movw r1, #0x212
/*0x1a22*/      str r1, [r0, #8]
/*0x1a24*/      ldr r1, [pc, #0x20] /* data_1a48 */
/*0x1a26*/      str r1, [r0, #0xc]
/*0x1a28*/      ldr r2, [pc, #0x20] /* data_1a4c */
/*0x1a2a*/      movs r1, #0x10
/*0x1a2c*/      strd r1, r2, [r0, #0x10]
/*0x1a30*/      str r1, [r0, #0x18]
/*0x1a32*/      ldr r1, [pc, #0x1c] /* data_1a50 */
/*0x1a34*/      str r1, [r0, #0x1c]
/*0x1a36*/      movs r1, #0
/*0x1a38*/      str r1, [r0, #0x20]
/*0x1a3a*/      ldr r1, [pc, #0x18] /* data_1a54 */
/*0x1a3c*/      str r1, [r0, #0x24]
/*0x1a3e*/      movs r1, #2
/*0x1a40*/      str r1, [r0, #0x28]
/*0x1a42*/      bx lr

            data_1a44:
/*0x1a44*/  .word 0x80010008
            data_1a48:
/*0x1a48*/  .word 0x91002088
            data_1a4c:
/*0x1a4c*/  .word 0x92010090
            data_1a50:
/*0x1a50*/  .word 0x930100d0
            data_1a54:
/*0x1a54*/  .word 0x84010110


            .thumb_func
            call_1a58:
/*0x1a58*/      ldr r1, [pc, #8] /* data_1a64 */
/*0x1a5a*/      ldr r2, [r1]
/*0x1a5c*/      str r2, [r0]
/*0x1a5e*/      ldr r1, [r1, #4]
/*0x1a60*/      str r1, [r0, #4]
/*0x1a62*/      bx lr

            data_1a64:
/*0x1a64*/  .word 0x400aa000

            jump_1a68:
/*0x1a68*/      ldr r0, [pc, #8] /* data_1a74 */
/*0x1a6a*/      ldr r1, [r0]
/*0x1a6c*/      orr r1, r1, #0x20
/*0x1a70*/      str r1, [r0]
/*0x1a72*/      bx lr

            data_1a74:
/*0x1a74*/  .word 0x400a8000


            .thumb_func
            call_1a78:
/*0x1a78*/      ldr r1, [pc, #0xc] /* data_1a88 */
/*0x1a7a*/      ldr r2, [r1]
/*0x1a7c*/      orr r2, r2, #0x100
/*0x1a80*/      str r2, [r1]
/*0x1a82*/      str r0, [r1, #0x10]
/*0x1a84*/      bx lr

/*0x1a86*/  .byte 0x00
/*0x1a87*/  .byte 0x00

            data_1a88:
/*0x1a88*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x1a8c*/      ldr r0, [pc, #4] /* data_1a94 */
/*0x1a8e*/      b.w usb_entry

/*0x1a92*/  .byte 0x00
/*0x1a93*/  .byte 0x00

            data_1a94:
/*0x1a94*/  .word 0x200000b8


            .thumb_func
            call_1a98:
/*0x1a98*/      ldr r1, [pc, #0x4c] /* data_1ae8 */
/*0x1a9a*/      ldr r0, [pc, #0x48] /* data_1ae4 */
/*0x1a9c*/      ldr r2, [r1, #0x30]
/*0x1a9e*/      orr r2, r2, #0x10
/*0x1aa2*/      str r2, [r1, #0x30]
/*0x1aa4*/      ldr r1, [pc, #0x44] /* data_1aec */
/*0x1aa6*/      ldr r2, [r1, #4]
/*0x1aa8*/      ubfx r2, r2, #0, #0xc
/*0x1aac*/      orr r2, r2, #0x1a000
/*0x1ab0*/      b jump_1aba
            jump_1ab2:
/*0x1ab2*/      str r2, [r1, #4]
/*0x1ab4*/      ldr r3, [r1, #4]
/*0x1ab6*/      lsls r3, r3, #0xf
/*0x1ab8*/      bmi jump_1abe
            jump_1aba:
/*0x1aba*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x1abc*/      bhs jump_1ab2
            jump_1abe:
/*0x1abe*/      ldr r0, [r1, #8]
/*0x1ac0*/      ubfx r0, r0, #0, #0xc
/*0x1ac4*/      orr r0, r0, #0x5000
/*0x1ac8*/      str r0, [r1, #8]
/*0x1aca*/      ldr r0, [r1, #4]
/*0x1acc*/      and r0, r0, #0x1f000
/*0x1ad0*/      orr r0, r0, #0x7d0
/*0x1ad4*/      str r0, [r1, #4]
/*0x1ad6*/      ldr r0, [pc, #0x18] /* data_1af0 */
/*0x1ad8*/      str r0, [r1]
/*0x1ada*/      movw r0, #0xca35
/*0x1ade*/      str r0, [r1, #0x10]
/*0x1ae0*/      bx lr

/*0x1ae2*/  .byte 0x00
/*0x1ae3*/  .byte 0x00

            data_1ae4:
/*0x1ae4*/  .word 0x006ddd00
            data_1ae8:
/*0x1ae8*/  .word 0x40088000
            data_1aec:
/*0x1aec*/  .word 0x40068000
            data_1af0:
/*0x1af0*/  .word 0x5fa00001


            .thumb_func
            watchdog_reload_timer:
/*0x1af4*/      ldr r1, [pc, #8] /* data_1b00 */
/*0x1af6*/      ldr r0, [pc, #4] /* data_1afc */
/*0x1af8*/      str r0, [r1]
/*0x1afa*/      bx lr

            data_1afc:
/*0x1afc*/  .word 0x5fa00001
            data_1b00:
/*0x1b00*/  .word 0x40068000


            .thumb_func
            flash_crc_cmd:
/*0x1b04*/      push {r4, lr}
/*0x1b06*/      bl crc16
/*0x1b0a*/      mov r4, r0
/*0x1b0c*/      mov r1, r0
/*0x1b0e*/      ldr r0, [pc, #0x10] /* data_1b20 */
/*0x1b10*/      bl function_14
/*0x1b14*/      lsrs r1, r4, #8
/*0x1b16*/      ldr r0, [pc, #8] /* data_1b20 */
/*0x1b18*/      bl function_14
/*0x1b1c*/      movs r0, #0x4f
/*0x1b1e*/      pop {r4, pc}

            data_1b20:
/*0x1b20*/  .word 0x200001bc


            .thumb_func
            flash_erase_cmd:
/*0x1b24*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x1b28*/      mov r6, r2
/*0x1b2a*/      cmp r0, #0xa
/*0x1b2c*/      beq jump_1b34
/*0x1b2e*/      cmp.w r1, #0x2800
/*0x1b32*/      bhs jump_1b3a
            jump_1b34:
/*0x1b34*/      movs r0, #0x46
            jump_1b36:
/*0x1b36*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_1b3a:
/*0x1b3a*/      movs r5, #0
/*0x1b3c*/      mov r4, r1
/*0x1b3e*/      subs r7, r5, #1
/*0x1b40*/      ldr.w r8, [pc, #0x2c] /* data_1b70 */
/*0x1b44*/      mov.w sb, #0x1e
/*0x1b48*/      b jump_1b68
            jump_1b4a:
/*0x1b4a*/      mov r0, r4
/*0x1b4c*/      bl flash_page_erase
/*0x1b50*/      udiv r1, r5, sb
/*0x1b54*/      mls r0, sb, r1, r5
/*0x1b58*/      str.w r7, [r8, #4]
/*0x1b5c*/      cbnz r0, jump_1b62
/*0x1b5e*/      bl watchdog_reload_timer
            jump_1b62:
/*0x1b62*/      add.w r4, r4, #0x400
/*0x1b66*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_1b68:
/*0x1b68*/      cmp r4, r6
/*0x1b6a*/      bls jump_1b4a
/*0x1b6c*/      movs r0, #0x4f
/*0x1b6e*/      b jump_1b36

            data_1b70:
/*0x1b70*/  .word 0x20000048


            .thumb_func
            disconnect_cmd:
/*0x1b74*/      bl usb_disable_dppu
            jump_1b78:
/*0x1b78*/      b jump_1b78

/*0x1b7a*/  .byte 0x00
/*0x1b7b*/  .byte 0x00


            .thumb_func
            flash_read_write_cmd:
/*0x1b7c*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x1b80*/      mov.w r7, #0
/*0x1b84*/      ldr r5, [pc, #0x100] /* data_1c88 */
/*0x1b86*/      ldr.w fp, [pc, #0x104] /* data_1c8c */
/*0x1b8a*/      movs.w r8, r0
/*0x1b8e*/      mov r4, r1
/*0x1b90*/      mov sb, r2
/*0x1b92*/      mov r6, r7
/*0x1b94*/      mov sl, r7
/*0x1b96*/      bne jump_1bb6
/*0x1b98*/      ldr r1, [pc, #0xf4] /* data_1c90 */
/*0x1b9a*/      ldrb r0, [r1]
/*0x1b9c*/      cbnz r0, jump_1ba6
/*0x1b9e*/      subs r0, r7, #1
/*0x1ba0*/      str r0, [r1, #4]
/*0x1ba2*/      movs r0, #1
/*0x1ba4*/      strb r0, [r1]
            jump_1ba6:
/*0x1ba6*/      ldr r0, [r1, #4]
/*0x1ba8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1baa*/      str r0, [r1, #4]
/*0x1bac*/      subs r0, #0xa
/*0x1bae*/      cmp r0, #0x5a
/*0x1bb0*/      bhi jump_1bb6
/*0x1bb2*/      bl firmware_decrypt
            jump_1bb6:
/*0x1bb6*/      bl flash_get_protection_status
/*0x1bba*/      lsls r0, r0, #0x1f
/*0x1bbc*/      bne jump_1bc2
/*0x1bbe*/      mov.w sl, #1
            jump_1bc2:
/*0x1bc2*/      cmp.w r8, #1
/*0x1bc6*/      bne jump_1c7e
/*0x1bc8*/      cmp.w sl, #1
/*0x1bcc*/      bne jump_1be8
/*0x1bce*/      sub.w r0, sb, r4
/*0x1bd2*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1bd4*/      b jump_1bde
            jump_1bd6:
/*0x1bd6*/      ldr r1, [r4, r7]
/*0x1bd8*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1bda*/      bne jump_1c40
/*0x1bdc*/      .short 0x1d3f /* adds r7, r7, #4 */ 
            jump_1bde:
/*0x1bde*/      cmp r0, r7
/*0x1be0*/      bhi jump_1bd6
/*0x1be2*/      cmp.w r8, #1
/*0x1be6*/      bne jump_1c7e
            jump_1be8:
/*0x1be8*/      ldr r1, [pc, #0xa4] /* data_1c90 */
/*0x1bea*/      movs r0, #0
/*0x1bec*/      strb r0, [r1]
/*0x1bee*/      ldr r0, [r1, #4]
/*0x1bf0*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1bf2*/      str r0, [r1, #4]
/*0x1bf4*/      subs r0, #0xa
/*0x1bf6*/      cmp r0, #0x5a
/*0x1bf8*/      bhi jump_1c0e
/*0x1bfa*/      bl firmware_decrypt
/*0x1bfe*/      b jump_1c0e
            jump_1c00:
/*0x1c00*/      mov r1, r4
/*0x1c02*/      movs r0, #4
/*0x1c04*/      ldr r2, [r5]
/*0x1c06*/      bl flash_write
/*0x1c0a*/      .short 0x1d24 /* adds r4, r4, #4 */ 
/*0x1c0c*/      .short 0x1d2d /* adds r5, r5, #4 */ 
            jump_1c0e:
/*0x1c0e*/      cmp r4, sb
/*0x1c10*/      bls jump_1c00
/*0x1c12*/      b jump_1c7e
            jump_1c14:
/*0x1c14*/      ldr r0, [pc, #0x7c] /* data_1c94 */
/*0x1c16*/      cmp r4, r0
/*0x1c18*/      bls jump_1c1e
/*0x1c1a*/      movs r0, #0
/*0x1c1c*/      b jump_1c20
            jump_1c1e:
/*0x1c1e*/      ldr r0, [r4]
            jump_1c20:
/*0x1c20*/      cmp.w r8, #0
/*0x1c24*/      beq jump_1c34
/*0x1c26*/      cmp.w r8, #3
/*0x1c2a*/      beq jump_1c3c
/*0x1c2c*/      cmp.w sl, #1
/*0x1c30*/      beq jump_1c46
/*0x1c32*/      b jump_1c5a
            jump_1c34:
/*0x1c34*/      ldr r1, [r5]
/*0x1c36*/      cmp r1, r0
/*0x1c38*/      bne jump_1c40
/*0x1c3a*/      b jump_1c7a
            jump_1c3c:
/*0x1c3c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x1c3e*/      beq jump_1c7a
            jump_1c40:
/*0x1c40*/      movs r0, #0x46
            jump_1c42:
/*0x1c42*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
            jump_1c46:
/*0x1c46*/      sub.w r1, r4, #0x2800
/*0x1c4a*/      cmp.w r1, #0x400
/*0x1c4e*/      blo jump_1c5a
/*0x1c50*/      ldr r1, [pc, #0x44] /* data_1c98 */
/*0x1c52*/      add r1, r4
/*0x1c54*/      cmp r1, #0x50
/*0x1c56*/      blo jump_1c5a
/*0x1c58*/      movs r0, #0
            jump_1c5a:
/*0x1c5a*/      str.w r0, [fp, r6, lsl #2]
/*0x1c5e*/      .short 0x1c76 /* adds r6, r6, #1 */ 
/*0x1c60*/      cmp r6, #0x10
/*0x1c62*/      bne jump_1c7a
/*0x1c64*/      ldr r0, [pc, #0x34] /* data_1c9c */
/*0x1c66*/      movs r6, #0
/*0x1c68*/      movs r1, #0x10
/*0x1c6a*/      str r1, [r0, #0x58]
/*0x1c6c*/      movs r1, #0x40
/*0x1c6e*/      str r1, [r0, #0x5c]
/*0x1c70*/      movs r1, #2
/*0x1c72*/      str r1, [r0, #0x50]
            jump_1c74:
/*0x1c74*/      ldr r1, [r0, #0x58]
/*0x1c76*/      lsls r1, r1, #0x1b
/*0x1c78*/      bpl jump_1c74
            jump_1c7a:
/*0x1c7a*/      .short 0x1d24 /* adds r4, r4, #4 */ 
/*0x1c7c*/      .short 0x1d2d /* adds r5, r5, #4 */ 
            jump_1c7e:
/*0x1c7e*/      cmp r4, sb
/*0x1c80*/      bls jump_1c14
/*0x1c82*/      movs r0, #0x4f
/*0x1c84*/      b jump_1c42

/*0x1c86*/  .byte 0x00
/*0x1c87*/  .byte 0x00

            data_1c88:
/*0x1c88*/  .word 0x2000063c
            data_1c8c:
/*0x1c8c*/  .word 0x400aa0d0
            data_1c90:
/*0x1c90*/  .word 0x20000048
            data_1c94:
/*0x1c94*/  .word 0x1ff003fc
            data_1c98:
/*0x1c98*/  .word 0xe0100000
            data_1c9c:
/*0x1c9c*/  .word 0x400a8000


            .thumb_func
            function_e_77:
/*0x1ca0*/      push {r4, lr}
/*0x1ca2*/      movs r2, #0x40
/*0x1ca4*/      ldr r1, [pc, #0x10] /* data_1cb8 */
/*0x1ca6*/      movs r0, #3
/*0x1ca8*/      bl usb_copy_send
/*0x1cac*/      ldr r1, [pc, #0xc] /* data_1cbc */
/*0x1cae*/      mov.w r0, #-1
/*0x1cb2*/      str r0, [r1, #4]
/*0x1cb4*/      movs r0, #0x4f
/*0x1cb6*/      pop {r4, pc}

            data_1cb8:
/*0x1cb8*/  .word 0x20000620
            data_1cbc:
/*0x1cbc*/  .word 0x20000048


            .thumb_func
            call_1cc0:
/*0x1cc0*/      push {r4, r5, r6, lr}
/*0x1cc2*/      mov r4, r0
/*0x1cc4*/      movs r0, #0
/*0x1cc6*/      bl usb_get_ep_len
/*0x1cca*/      mov r5, r0
/*0x1ccc*/      ldr r0, [r4, #0x20]
/*0x1cce*/      adds r1, r0, #1
/*0x1cd0*/      beq jump_1d00
/*0x1cd2*/      ldrb.w r1, [r4, #0x24]
/*0x1cd6*/      cmp r1, #1
/*0x1cd8*/      bne jump_1d00
/*0x1cda*/      cmp r0, r5
/*0x1cdc*/      blo jump_1ce4
/*0x1cde*/      subs r0, r0, r5
/*0x1ce0*/      str r0, [r4, #0x20]
/*0x1ce2*/      b jump_1cf0
            jump_1ce4:
/*0x1ce4*/      mov r5, r0
/*0x1ce6*/      movs r0, #0
/*0x1ce8*/      str r0, [r4, #0x20]
/*0x1cea*/      movs r0, #2
/*0x1cec*/      strb.w r0, [r4, #0x24]
            jump_1cf0:
/*0x1cf0*/      mov r2, r5
/*0x1cf2*/      movs r0, #0
/*0x1cf4*/      ldr r1, [r4, #0x1c]
/*0x1cf6*/      bl usb_copy_send
/*0x1cfa*/      ldr r0, [r4, #0x1c]
/*0x1cfc*/      add r0, r5
/*0x1cfe*/      str r0, [r4, #0x1c]
            jump_1d00:
/*0x1d00*/      pop {r4, r5, r6, pc}
            jump_1d02:
/*0x1d02*/      push {r4, lr}
/*0x1d04*/      mov r4, r0
/*0x1d06*/      movs r0, #0
/*0x1d08*/      strb r0, [r4, #0x19]
/*0x1d0a*/      cbz r1, jump_1d20
/*0x1d0c*/      cmp r1, #1
/*0x1d0e*/      beq jump_1d24
/*0x1d10*/      cmp r1, #2
/*0x1d12*/      bne jump_1d36
/*0x1d14*/      ldrh r0, [r4, #4]
/*0x1d16*/      and r0, r0, #0xf
/*0x1d1a*/      bl call_17fa
/*0x1d1e*/      b jump_1d24
            jump_1d20:
/*0x1d20*/      ldrb.w r0, [r4, #0x34]
            jump_1d24:
/*0x1d24*/      strb r0, [r4, #0x18]
/*0x1d26*/      add.w r0, r4, #0x18
/*0x1d2a*/      str r0, [r4, #0x1c]
/*0x1d2c*/      movs r0, #2
/*0x1d2e*/      str r0, [r4, #0x20]
/*0x1d30*/      movs r0, #1
/*0x1d32*/      strb.w r0, [r4, #0x24]
            jump_1d36:
/*0x1d36*/      pop {r4, pc}

            .thumb_func
            call_1d38:
/*0x1d38*/      push {r4, r5, r6, lr}
/*0x1d3a*/      mov r4, r0
/*0x1d3c*/      ldrh r0, [r0]
/*0x1d3e*/      movs r5, #1
/*0x1d40*/      cmp.w r0, #0x500
/*0x1d44*/      beq jump_1de2
/*0x1d46*/      bgt jump_1d8a
/*0x1d48*/      cmp.w r0, #0x100
/*0x1d4c*/      beq jump_1dd4
/*0x1d4e*/      bgt jump_1d68
/*0x1d50*/      cmp r0, #0x80
/*0x1d52*/      beq jump_1dcc
/*0x1d54*/      cmp r0, #0x81
/*0x1d56*/      beq jump_1dd0
/*0x1d58*/      cmp r0, #0x82
/*0x1d5a*/      bne jump_1e26
/*0x1d5c*/      movs r1, #2
            jump_1d5e:
/*0x1d5e*/      mov r0, r4
/*0x1d60*/      pop.w {r4, r5, r6, lr}
/*0x1d64*/      b.w jump_1d02
            jump_1d68:
/*0x1d68*/      cmp.w r0, #0x102
/*0x1d6c*/      beq jump_1dd8
/*0x1d6e*/      cmp.w r0, #0x300
/*0x1d72*/      beq jump_1ddc
/*0x1d74*/      sub.w r0, r0, #0x300
/*0x1d78*/      subs r0, #2
/*0x1d7a*/      bne jump_1e26
/*0x1d7c*/      movs r2, #1
            jump_1d7e:
/*0x1d7e*/      movs r1, #2
            jump_1d80:
/*0x1d80*/      mov r0, r4
/*0x1d82*/      pop.w {r4, r5, r6, lr}
/*0x1d86*/      b.w jump_1e54
            jump_1d8a:
/*0x1d8a*/      cmp.w r0, #0x900
/*0x1d8e*/      beq jump_1e2c
/*0x1d90*/      bgt jump_1db2
/*0x1d92*/      cmp.w r0, #0x680
/*0x1d96*/      beq jump_1df0
/*0x1d98*/      sub.w r0, r0, #0x600
/*0x1d9c*/      subs r0, #0x81
/*0x1d9e*/      beq jump_1e28
/*0x1da0*/      sub.w r0, r0, #0x100
/*0x1da4*/      subs r0, #0xff
/*0x1da6*/      bne jump_1e26
/*0x1da8*/      add.w r0, r4, #0x30
/*0x1dac*/      strd r0, r5, [r4, #0x1c]
/*0x1db0*/      b jump_1e22
            jump_1db2:
/*0x1db2*/      sub.w r0, r0, #0xa00
/*0x1db6*/      subs r0, #0x81
/*0x1db8*/      beq jump_1e50
/*0x1dba*/      cmp r0, #0x80
/*0x1dbc*/      bne jump_1e26
/*0x1dbe*/      ldr r1, [r4, #0x58]
            jump_1dc0:
/*0x1dc0*/      cmp r1, #0
/*0x1dc2*/      beq jump_1e26
/*0x1dc4*/      mov r0, r4
/*0x1dc6*/      pop.w {r4, r5, r6, lr}
/*0x1dca*/      bx r1
            jump_1dcc:
/*0x1dcc*/      movs r1, #0
/*0x1dce*/      b jump_1d5e
            jump_1dd0:
/*0x1dd0*/      movs r1, #1
/*0x1dd2*/      b jump_1d5e
            jump_1dd4:
/*0x1dd4*/      movs r2, #0
/*0x1dd6*/      b jump_1dde
            jump_1dd8:
/*0x1dd8*/      movs r2, #0
/*0x1dda*/      b jump_1d7e
            jump_1ddc:
/*0x1ddc*/      movs r2, #1
            jump_1dde:
/*0x1dde*/      movs r1, #0
/*0x1de0*/      b jump_1d80
            jump_1de2:
/*0x1de2*/      ldrb r0, [r4, #2]
/*0x1de4*/      bl call_1a78
/*0x1de8*/      strb.w r5, [r4, #0x24]
/*0x1dec*/      movs r0, #5
/*0x1dee*/      b jump_1e4a
            jump_1df0:
/*0x1df0*/      ldrb r0, [r4, #3]
/*0x1df2*/      cmp r0, #1
/*0x1df4*/      beq jump_1e16
/*0x1df6*/      cmp r0, #2
/*0x1df8*/      beq jump_1e1a
/*0x1dfa*/      cmp r0, #3
/*0x1dfc*/      bne jump_1e26
/*0x1dfe*/      ldrb r0, [r4, #2]
/*0x1e00*/      ldr r1, [r4, #0x14]
/*0x1e02*/      cmp r1, r0
/*0x1e04*/      bls jump_1e26
/*0x1e06*/      ldr r1, [r4, #0x10]
/*0x1e08*/      ldr.w r0, [r1, r0, lsl #2]
/*0x1e0c*/      cmp r0, #0
/*0x1e0e*/      beq jump_1e26
            jump_1e10:
/*0x1e10*/      str r0, [r4, #0x1c]
/*0x1e12*/      ldrb r0, [r0]
/*0x1e14*/      b jump_1e20
            jump_1e16:
/*0x1e16*/      ldr r0, [r4, #8]
/*0x1e18*/      b jump_1e10
            jump_1e1a:
/*0x1e1a*/      ldr r0, [r4, #0xc]
/*0x1e1c*/      str r0, [r4, #0x1c]
/*0x1e1e*/      ldrh r0, [r0, #2]
            jump_1e20:
/*0x1e20*/      str r0, [r4, #0x20]
            jump_1e22:
/*0x1e22*/      strb.w r5, [r4, #0x24]
            jump_1e26:
/*0x1e26*/      pop {r4, r5, r6, pc}
            jump_1e28:
/*0x1e28*/      ldr r1, [r4, #0x54]
/*0x1e2a*/      b jump_1dc0
            jump_1e2c:
/*0x1e2c*/      ldrb r0, [r4, #2]
/*0x1e2e*/      strb.w r0, [r4, #0x30]
/*0x1e32*/      strb.w r5, [r4, #0x24]
/*0x1e36*/      movs r5, #1
            jump_1e38:
/*0x1e38*/      sxtb r0, r5
/*0x1e3a*/      ldr.w r1, [r4, #0x84]
/*0x1e3e*/      bl call_1834
/*0x1e42*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x1e44*/      cmp r5, #8
/*0x1e46*/      blo jump_1e38
/*0x1e48*/      movs r0, #6
            jump_1e4a:
/*0x1e4a*/      strb.w r0, [r4, #0x32]
/*0x1e4e*/      pop {r4, r5, r6, pc}
            jump_1e50:
/*0x1e50*/      ldr r1, [r4, #0x5c]
/*0x1e52*/      b jump_1dc0
            jump_1e54:
/*0x1e54*/      push {r4, r5, r6, lr}
/*0x1e56*/      mov r4, r0
/*0x1e58*/      movs r6, #1
/*0x1e5a*/      cbz r1, jump_1e76
/*0x1e5c*/      cmp r1, #2
/*0x1e5e*/      bne jump_1e74
/*0x1e60*/      ldrh r0, [r4, #4]
/*0x1e62*/      ands r5, r0, #0xf
/*0x1e66*/      beq jump_1e70
/*0x1e68*/      cbz r2, jump_1e8c
/*0x1e6a*/      mov r0, r5
/*0x1e6c*/      bl call_18e0
            jump_1e70:
/*0x1e70*/      strb.w r6, [r4, #0x24]
            jump_1e74:
/*0x1e74*/      pop {r4, r5, r6, pc}
            jump_1e76:
/*0x1e76*/      ldrb r0, [r4, #2]
/*0x1e78*/      cmp r0, #1
/*0x1e7a*/      bne jump_1e74
/*0x1e7c*/      add.w r4, r4, #0x24
/*0x1e80*/      ldrb r0, [r4, #0x10]
/*0x1e82*/      bfi r0, r2, #1, #1
/*0x1e86*/      strb r0, [r4, #0x10]
/*0x1e88*/      strb r6, [r4]
/*0x1e8a*/      pop {r4, r5, r6, pc}
            jump_1e8c:
/*0x1e8c*/      ldr r0, [r4, #0x38]
/*0x1e8e*/      cmp r0, #0
/*0x1e90*/      bne jump_1e70
/*0x1e92*/      mov r0, r5
/*0x1e94*/      bl call_1794
/*0x1e98*/      sxtb r0, r5
/*0x1e9a*/      bl call_1784
/*0x1e9e*/      b jump_1e70

            .thumb_func
            call_1ea0:
/*0x1ea0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x1ea2*/      bmi jump_1eae
/*0x1ea4*/      ldr.w r3, [r0, r2, lsl #2]
/*0x1ea8*/      str.w r3, [r1, r2, lsl #2]
/*0x1eac*/      b call_1ea0
            jump_1eae:
/*0x1eae*/      bx lr

            .thumb_func
            usb_get_ep_reg:
/*0x1eb0*/      ldr r1, [pc, #8] /* data_1ebc */
/*0x1eb2*/      add.w r0, r0, r0, lsl #2
/*0x1eb6*/      add.w r0, r1, r0, lsl #2
/*0x1eba*/      bx lr

            data_1ebc:
/*0x1ebc*/  .word 0x400a8014

/*0x1ec0*/  .byte 0x02
/*0x1ec1*/  .byte 0xe0
/*0x1ec2*/  .byte 0x08
/*0x1ec3*/  .byte 0xc8
/*0x1ec4*/  .byte 0x12
/*0x1ec5*/  .byte 0x1f
/*0x1ec6*/  .byte 0x08
/*0x1ec7*/  .byte 0xc1
/*0x1ec8*/  .byte 0x00
/*0x1ec9*/  .byte 0x2a
/*0x1eca*/  .byte 0xfa
/*0x1ecb*/  .byte 0xd1
/*0x1ecc*/  .byte 0x70
/*0x1ecd*/  .byte 0x47
/*0x1ece*/  .byte 0x70
/*0x1ecf*/  .byte 0x47
/*0x1ed0*/  .byte 0x00
/*0x1ed1*/  .byte 0x20
/*0x1ed2*/  .byte 0x01
/*0x1ed3*/  .byte 0xe0
/*0x1ed4*/  .byte 0x01
/*0x1ed5*/  .byte 0xc1
/*0x1ed6*/  .byte 0x12
/*0x1ed7*/  .byte 0x1f
/*0x1ed8*/  .byte 0x00
/*0x1ed9*/  .byte 0x2a
/*0x1eda*/  .byte 0xfb
/*0x1edb*/  .byte 0xd1
/*0x1edc*/  .byte 0x70
/*0x1edd*/  .byte 0x47
/*0x1ede*/  .byte 0x00
/*0x1edf*/  .byte 0x00


            .thumb_func
            main:
/*0x1ee0*/      ldr r0, [pc, #0x9c] /* data_1f80 */
/*0x1ee2*/      ldr r0, [r0]
/*0x1ee4*/      ldr r1, [pc, #0x9c] /* data_1f84 */
/*0x1ee6*/      cmp r0, r1
/*0x1ee8*/      beq jump_1f0a
/*0x1eea*/      bl check_ver_str
/*0x1eee*/      cmp r0, #1
/*0x1ef0*/      bne jump_1f0a
/*0x1ef2*/      bl call_7e8
/*0x1ef6*/      cmp r0, #1
/*0x1ef8*/      bne jump_1f0a
/*0x1efa*/      movs r1, #1
/*0x1efc*/      movs r0, #0x10
/*0x1efe*/      bl ckcu_set_wtf
/*0x1f02*/      mov.w r0, #0x2c00
/*0x1f06*/      bl load_jump_fw
            jump_1f0a:
/*0x1f0a*/      bl setup_afio_gpio
/*0x1f0e*/      bl function_b_1
/*0x1f12*/      movs r0, #1
/*0x1f14*/      bl function_b_2
/*0x1f18*/      bl function_b_3
/*0x1f1c*/      bl usb_init
/*0x1f20*/      movs r7, #0
/*0x1f22*/      ldr r5, [pc, #0x64] /* data_1f88 */
/*0x1f24*/      ldr r4, [pc, #0x64] /* data_1f8c */
/*0x1f26*/      movs r6, #1
            jump_1f28:
/*0x1f28*/      ldr r0, [r4, #4]
/*0x1f2a*/      cbnz r0, jump_1f3c
/*0x1f2c*/      ldrb.w r0, [r5, #0x32]
/*0x1f30*/      cmp r0, #6
/*0x1f32*/      bne jump_1f72
/*0x1f34*/      movs r0, #0
/*0x1f36*/      str r6, [r4, #4]
/*0x1f38*/      bl function_b_2
            jump_1f3c:
/*0x1f3c*/      ldr r0, [r4, #4]
/*0x1f3e*/      cmp r0, #1
/*0x1f40*/      bne jump_1f72
/*0x1f42*/      ldr r0, [r4, #0xc]
/*0x1f44*/      cbz r0, jump_1f50
/*0x1f46*/      str r7, [r4, #0xc]
/*0x1f48*/      movs r0, #1
/*0x1f4a*/      str r7, [r4, #8]
/*0x1f4c*/      bl function_b_2
            jump_1f50:
/*0x1f50*/      ldr r0, [r4, #8]
/*0x1f52*/      cbnz r0, jump_1f68
/*0x1f54*/      ldr r0, [r4, #0xc]
/*0x1f56*/      cbnz r0, jump_1f72
/*0x1f58*/      ldrb.w r0, [r5, #0x32]
/*0x1f5c*/      cmp r0, #6
/*0x1f5e*/      bne jump_1f72
/*0x1f60*/      movs r0, #0
/*0x1f62*/      str r6, [r4, #8]
/*0x1f64*/      bl function_b_2
            jump_1f68:
/*0x1f68*/      ldr r0, [r4, #8]
/*0x1f6a*/      cmp r0, #1
/*0x1f6c*/      bne jump_1f72
/*0x1f6e*/      bl call_a9c
            jump_1f72:
/*0x1f72*/      ldr r0, [pc, #0x14] /* data_1f88 */
/*0x1f74*/      bl call_1676
/*0x1f78*/      bl watchdog_reload_timer
/*0x1f7c*/      b jump_1f28

/*0x1f7e*/  .byte 0x00
/*0x1f7f*/  .byte 0x00

            data_1f80:
/*0x1f80*/  .word 0x40080304
            data_1f84:
/*0x1f84*/  .word 0x55aafaf5
            data_1f88:
/*0x1f88*/  .word 0x200000b8
            data_1f8c:
/*0x1f8c*/  .word 0x20000000


            .thumb_func
            firmware_decrypt:
/*0x1f90*/      push {r4, r5, r6, lr}
/*0x1f92*/      ldr r0, [pc, #0x84] /* data_2018 */
/*0x1f94*/      ldr r2, [pc, #0x84] /* data_201c */
/*0x1f96*/      mov r4, r0
/*0x1f98*/      movs r1, #0
            jump_1f9a:
/*0x1f9a*/      ldr r3, [r0]
/*0x1f9c*/      ldr.w r5, [r2, r1, lsl #2]
/*0x1fa0*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x1fa2*/      eors r3, r5
/*0x1fa4*/      stm r0!, {r3}
/*0x1fa6*/      cmp r1, #0xd
/*0x1fa8*/      bls jump_1f9a
/*0x1faa*/      ldr r0, [pc, #0x74] /* data_2020 */
/*0x1fac*/      movs r5, #0
/*0x1fae*/      ldr r0, [r0, #4]
/*0x1fb0*/      and r6, r0, #7
            jump_1fb4:
/*0x1fb4*/      ldr r3, [r4]
/*0x1fb6*/      cmp r6, #8
/*0x1fb8*/      uxtb r1, r3
/*0x1fba*/      and r2, r3, #0xff00
/*0x1fbe*/      and r0, r3, #0xff0000
/*0x1fc2*/      and r3, r3, #0xff000000
/*0x1fc6*/      bhs switch_2008
/*0x1fc8*/      tbb [pc, r6]

/*0x1fcc*/  .byte 0x1e /* case switch_2008 */ /* case switch_2008 */
/*0x1fcd*/  .byte 0x04 /* case switch_1fd4 */ /* case switch_1fd4 */
/*0x1fce*/  .byte 0x08 /* case switch_1fdc */ /* case switch_1fdc */
/*0x1fcf*/  .byte 0x0c /* case switch_1fe4 */ /* case switch_1fe4 */
/*0x1fd0*/  .byte 0x10 /* case switch_1fec */ /* case switch_1fec */
/*0x1fd1*/  .byte 0x14 /* case switch_1ff4 */ /* case switch_1ff4 */
/*0x1fd2*/  .byte 0x17 /* case switch_1ffa */ /* case switch_1ffa */
/*0x1fd3*/  .byte 0x1c /* case switch_2004 */ /* case switch_2004 */

            switch_1fd4:
/*0x1fd4*/      lsls r1, r1, #0x18
/*0x1fd6*/      lsrs r2, r2, #8
/*0x1fd8*/      lsrs r0, r0, #8
/*0x1fda*/      b jump_1fe0
            switch_1fdc:
/*0x1fdc*/      lsls r1, r1, #0x18
/*0x1fde*/      lsrs r0, r0, #0x10
            jump_1fe0:
/*0x1fe0*/      lsrs r3, r3, #8
/*0x1fe2*/      b switch_2008
            switch_1fe4:
/*0x1fe4*/      lsls r1, r1, #0x18
/*0x1fe6*/      lsls r2, r2, #8
/*0x1fe8*/      lsrs r0, r0, #8
/*0x1fea*/      b jump_1ff0
            switch_1fec:
/*0x1fec*/      lsls r1, r1, #0x10
/*0x1fee*/      lsls r0, r0, #8
            jump_1ff0:
/*0x1ff0*/      lsrs r3, r3, #0x18
/*0x1ff2*/      b switch_2008
            switch_1ff4:
/*0x1ff4*/      lsls r1, r1, #0x10
/*0x1ff6*/      lsrs r2, r2, #8
/*0x1ff8*/      b jump_2006
            switch_1ffa:
/*0x1ffa*/      lsls r1, r1, #0x18
/*0x1ffc*/      lsls r2, r2, #8
/*0x1ffe*/      lsrs r0, r0, #0x10
/*0x2000*/      lsrs r3, r3, #0x10
/*0x2002*/      b switch_2008
            switch_2004:
/*0x2004*/      lsls r2, r2, #8
            jump_2006:
/*0x2006*/      lsrs r0, r0, #8
            switch_2008:
/*0x2008*/      orrs r1, r2
/*0x200a*/      orrs r1, r0
/*0x200c*/      orrs r1, r3
/*0x200e*/      stm r4!, {r1}
/*0x2010*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x2012*/      cmp r5, #0xd
/*0x2014*/      bls jump_1fb4
/*0x2016*/      pop {r4, r5, r6, pc}

            data_2018:
/*0x2018*/  .word 0x2000063c
            data_201c:
/*0x201c*/  .word 0x00002188 /* possible pointer */
            data_2020:
/*0x2020*/  .word 0x20000048

            usb_report0_desc:
/*0x2024*/  .byte 0x05
/*0x2025*/  .byte 0x01
/*0x2026*/  .byte 0x09
/*0x2027*/  .byte 0x06
/*0x2028*/  .byte 0xa1
/*0x2029*/  .byte 0x01
/*0x202a*/  .byte 0x05
/*0x202b*/  .byte 0x07
/*0x202c*/  .byte 0x19
/*0x202d*/  .byte 0xe0
/*0x202e*/  .byte 0x29
/*0x202f*/  .byte 0xe7
/*0x2030*/  .byte 0x15
/*0x2031*/  .byte 0x00
/*0x2032*/  .byte 0x25
/*0x2033*/  .byte 0x01
/*0x2034*/  .byte 0x75
/*0x2035*/  .byte 0x01
/*0x2036*/  .byte 0x95
/*0x2037*/  .byte 0x08
/*0x2038*/  .byte 0x81
/*0x2039*/  .byte 0x02
/*0x203a*/  .byte 0x95
/*0x203b*/  .byte 0x01
/*0x203c*/  .byte 0x75
/*0x203d*/  .byte 0x08
/*0x203e*/  .byte 0x81
/*0x203f*/  .byte 0x03
/*0x2040*/  .byte 0x95
/*0x2041*/  .byte 0x03
/*0x2042*/  .byte 0x75
/*0x2043*/  .byte 0x01
/*0x2044*/  .byte 0x05
/*0x2045*/  .byte 0x08
/*0x2046*/  .byte 0x19
/*0x2047*/  .byte 0x01
/*0x2048*/  .byte 0x29
/*0x2049*/  .byte 0x03
/*0x204a*/  .byte 0x91
/*0x204b*/  .byte 0x02
/*0x204c*/  .byte 0x95
/*0x204d*/  .byte 0x01
/*0x204e*/  .byte 0x75
/*0x204f*/  .byte 0x05
/*0x2050*/  .byte 0x91
/*0x2051*/  .byte 0x03
/*0x2052*/  .byte 0x95
/*0x2053*/  .byte 0x06
/*0x2054*/  .byte 0x75
/*0x2055*/  .byte 0x08
/*0x2056*/  .byte 0x15
/*0x2057*/  .byte 0x00
/*0x2058*/  .byte 0x26
/*0x2059*/  .byte 0xa4
/*0x205a*/  .byte 0x00
/*0x205b*/  .byte 0x05
/*0x205c*/  .byte 0x07
/*0x205d*/  .byte 0x19
/*0x205e*/  .byte 0x00
/*0x205f*/  .byte 0x29
/*0x2060*/  .byte 0xa4
/*0x2061*/  .byte 0x81
/*0x2062*/  .byte 0x00
/*0x2063*/  .byte 0xc0
            usb_report1_desc:
/*0x2064*/  .byte 0x06
/*0x2065*/  .byte 0x00
/*0x2066*/  .byte 0xff
/*0x2067*/  .byte 0x09
/*0x2068*/  .byte 0x01
/*0x2069*/  .byte 0xa1
/*0x206a*/  .byte 0x01
/*0x206b*/  .byte 0x09
/*0x206c*/  .byte 0x02
/*0x206d*/  .byte 0x15
/*0x206e*/  .byte 0x00
/*0x206f*/  .byte 0x26
/*0x2070*/  .byte 0xff
/*0x2071*/  .byte 0x00
/*0x2072*/  .byte 0x75
/*0x2073*/  .byte 0x08
/*0x2074*/  .byte 0x95
/*0x2075*/  .byte 0x40
/*0x2076*/  .byte 0x81
/*0x2077*/  .byte 0x02
/*0x2078*/  .byte 0x09
/*0x2079*/  .byte 0x03
/*0x207a*/  .byte 0x15
/*0x207b*/  .byte 0x00
/*0x207c*/  .byte 0x26
/*0x207d*/  .byte 0xff
/*0x207e*/  .byte 0x00
/*0x207f*/  .byte 0x75
/*0x2080*/  .byte 0x08
/*0x2081*/  .byte 0x95
/*0x2082*/  .byte 0x40
/*0x2083*/  .byte 0x91
/*0x2084*/  .byte 0x02
/*0x2085*/  .byte 0xc0
/*0x2086*/  .byte 0x00
/*0x2087*/  .byte 0x00
            usb_report2_desc:
/*0x2088*/  .byte 0x05
/*0x2089*/  .byte 0x01
/*0x208a*/  .byte 0x09
/*0x208b*/  .byte 0x80
/*0x208c*/  .byte 0xa1
/*0x208d*/  .byte 0x01
/*0x208e*/  .byte 0x85
/*0x208f*/  .byte 0x01
/*0x2090*/  .byte 0x19
/*0x2091*/  .byte 0x81
/*0x2092*/  .byte 0x29
/*0x2093*/  .byte 0x83
/*0x2094*/  .byte 0x15
/*0x2095*/  .byte 0x00
/*0x2096*/  .byte 0x25
/*0x2097*/  .byte 0x01
/*0x2098*/  .byte 0x95
/*0x2099*/  .byte 0x03
/*0x209a*/  .byte 0x75
/*0x209b*/  .byte 0x01
/*0x209c*/  .byte 0x81
/*0x209d*/  .byte 0x02
/*0x209e*/  .byte 0x95
/*0x209f*/  .byte 0x01
/*0x20a0*/  .byte 0x75
/*0x20a1*/  .byte 0x05
/*0x20a2*/  .byte 0x81
/*0x20a3*/  .byte 0x01
/*0x20a4*/  .byte 0xc0
/*0x20a5*/  .byte 0x05
/*0x20a6*/  .byte 0x0c
/*0x20a7*/  .byte 0x09
/*0x20a8*/  .byte 0x01
/*0x20a9*/  .byte 0xa1
/*0x20aa*/  .byte 0x01
/*0x20ab*/  .byte 0x85
/*0x20ac*/  .byte 0x02
/*0x20ad*/  .byte 0x15
/*0x20ae*/  .byte 0x00
/*0x20af*/  .byte 0x25
/*0x20b0*/  .byte 0x01
/*0x20b1*/  .byte 0x95
/*0x20b2*/  .byte 0x12
/*0x20b3*/  .byte 0x75
/*0x20b4*/  .byte 0x01
/*0x20b5*/  .byte 0x0a
/*0x20b6*/  .byte 0x83
/*0x20b7*/  .byte 0x01
/*0x20b8*/  .byte 0x0a
/*0x20b9*/  .byte 0x8a
/*0x20ba*/  .byte 0x01
/*0x20bb*/  .byte 0x0a
/*0x20bc*/  .byte 0x92
/*0x20bd*/  .byte 0x01
/*0x20be*/  .byte 0x0a
/*0x20bf*/  .byte 0x94
/*0x20c0*/  .byte 0x01
/*0x20c1*/  .byte 0x09
/*0x20c2*/  .byte 0xcd
/*0x20c3*/  .byte 0x09
/*0x20c4*/  .byte 0xb7
/*0x20c5*/  .byte 0x09
/*0x20c6*/  .byte 0xb6
/*0x20c7*/  .byte 0x09
/*0x20c8*/  .byte 0xb5
/*0x20c9*/  .byte 0x09
/*0x20ca*/  .byte 0xe2
/*0x20cb*/  .byte 0x09
/*0x20cc*/  .byte 0xea
/*0x20cd*/  .byte 0x09
/*0x20ce*/  .byte 0xe9
/*0x20cf*/  .byte 0x0a
/*0x20d0*/  .byte 0x21
/*0x20d1*/  .byte 0x02
/*0x20d2*/  .byte 0x0a
/*0x20d3*/  .byte 0x23
/*0x20d4*/  .byte 0x02
/*0x20d5*/  .byte 0x0a
/*0x20d6*/  .byte 0x24
/*0x20d7*/  .byte 0x02
/*0x20d8*/  .byte 0x0a
/*0x20d9*/  .byte 0x25
/*0x20da*/  .byte 0x02
/*0x20db*/  .byte 0x0a
/*0x20dc*/  .byte 0x26
/*0x20dd*/  .byte 0x02
/*0x20de*/  .byte 0x0a
/*0x20df*/  .byte 0x27
/*0x20e0*/  .byte 0x02
/*0x20e1*/  .byte 0x0a
/*0x20e2*/  .byte 0x2a
/*0x20e3*/  .byte 0x02
/*0x20e4*/  .byte 0x81
/*0x20e5*/  .byte 0x02
/*0x20e6*/  .byte 0x95
/*0x20e7*/  .byte 0x01
/*0x20e8*/  .byte 0x75
/*0x20e9*/  .byte 0x0e
/*0x20ea*/  .byte 0x81
/*0x20eb*/  .byte 0x01
/*0x20ec*/  .byte 0xc0
/*0x20ed*/  .byte 0x00
/*0x20ee*/  .byte 0x00
/*0x20ef*/  .byte 0x00
            usb_device_desc:
/*0x20f0*/  .byte 0x12
/*0x20f1*/  .byte 0x01
/*0x20f2*/  .byte 0x10
/*0x20f3*/  .byte 0x01
/*0x20f4*/  .byte 0x00
/*0x20f5*/  .byte 0x00
/*0x20f6*/  .byte 0x00
/*0x20f7*/  .byte 0x40
/*0x20f8*/  .byte 0xd9
/*0x20f9*/  .byte 0x04
/*0x20fa*/  .byte 0x41
/*0x20fb*/  .byte 0x11
/*0x20fc*/  .byte 0x01
/*0x20fd*/  .byte 0x01
/*0x20fe*/  .byte 0x00
/*0x20ff*/  .byte 0x02
/*0x2100*/  .byte 0x00
/*0x2101*/  .byte 0x01
/*0x2102*/  .byte 0x00
/*0x2103*/  .byte 0x00
            usb_config_desc:
/*0x2104*/  .byte 0x09
/*0x2105*/  .byte 0x02
/*0x2106*/  .byte 0x5b
/*0x2107*/  .byte 0x00
/*0x2108*/  .byte 0x03
/*0x2109*/  .byte 0x01
/*0x210a*/  .byte 0x00
/*0x210b*/  .byte 0xa0
/*0x210c*/  .byte 0x32
            usb_interface0_desc:
/*0x210d*/  .byte 0x09
/*0x210e*/  .byte 0x04
/*0x210f*/  .byte 0x00
/*0x2110*/  .byte 0x00
/*0x2111*/  .byte 0x01
/*0x2112*/  .byte 0x03
/*0x2113*/  .byte 0x01
/*0x2114*/  .byte 0x01
/*0x2115*/  .byte 0x00
            usb_hid0_desc:
/*0x2116*/  .byte 0x09
/*0x2117*/  .byte 0x21
/*0x2118*/  .byte 0x11
/*0x2119*/  .byte 0x01
/*0x211a*/  .byte 0x00
/*0x211b*/  .byte 0x01
/*0x211c*/  .byte 0x22
/*0x211d*/  .byte 0x40
/*0x211e*/  .byte 0x00
            usb_endpoint1_desc:
/*0x211f*/  .byte 0x07
/*0x2120*/  .byte 0x05
/*0x2121*/  .byte 0x81
/*0x2122*/  .byte 0x03
/*0x2123*/  .byte 0x08
/*0x2124*/  .byte 0x00
/*0x2125*/  .byte 0x01
            usb_interface1_desc:
/*0x2126*/  .byte 0x09
/*0x2127*/  .byte 0x04
/*0x2128*/  .byte 0x01
/*0x2129*/  .byte 0x00
/*0x212a*/  .byte 0x02
/*0x212b*/  .byte 0x03
/*0x212c*/  .byte 0x00
/*0x212d*/  .byte 0x00
/*0x212e*/  .byte 0x00
            usb_hid1_desc:
/*0x212f*/  .byte 0x09
/*0x2130*/  .byte 0x21
/*0x2131*/  .byte 0x11
/*0x2132*/  .byte 0x01
/*0x2133*/  .byte 0x00
/*0x2134*/  .byte 0x01
/*0x2135*/  .byte 0x22
/*0x2136*/  .byte 0x22
/*0x2137*/  .byte 0x00
            usb_endpoint3_desc:
/*0x2138*/  .byte 0x07
/*0x2139*/  .byte 0x05
/*0x213a*/  .byte 0x83
/*0x213b*/  .byte 0x03
/*0x213c*/  .byte 0x40
/*0x213d*/  .byte 0x00
/*0x213e*/  .byte 0x01
            usb_endpoint4_desc:
/*0x213f*/  .byte 0x07
/*0x2140*/  .byte 0x05
/*0x2141*/  .byte 0x04
/*0x2142*/  .byte 0x03
/*0x2143*/  .byte 0x40
/*0x2144*/  .byte 0x00
/*0x2145*/  .byte 0x01
            usb_interface2_desc:
/*0x2146*/  .byte 0x09
/*0x2147*/  .byte 0x04
/*0x2148*/  .byte 0x02
/*0x2149*/  .byte 0x00
/*0x214a*/  .byte 0x01
/*0x214b*/  .byte 0x03
/*0x214c*/  .byte 0x00
/*0x214d*/  .byte 0x00
/*0x214e*/  .byte 0x00
            usb:
/*0x214f*/  .byte 0x09
/*0x2150*/  .byte 0x21
/*0x2151*/  .byte 0x11
/*0x2152*/  .byte 0x01
/*0x2153*/  .byte 0x00
/*0x2154*/  .byte 0x01
/*0x2155*/  .byte 0x22
/*0x2156*/  .byte 0x65
/*0x2157*/  .byte 0x00
            usb_endpoint2_desc:
/*0x2158*/  .byte 0x07
/*0x2159*/  .byte 0x05
/*0x215a*/  .byte 0x82
/*0x215b*/  .byte 0x03
/*0x215c*/  .byte 0x40
/*0x215d*/  .byte 0x00
/*0x215e*/  .byte 0x01
/*0x215f*/  .byte 0x00
            usb_str0_desc:
/*0x2160*/  .byte 0x04
/*0x2161*/  .byte 0x03
/*0x2162*/  .byte 0x09
/*0x2163*/  .byte 0x04
            usb_str1_desc:
/*0x2164*/  .byte 0x22
/*0x2165*/  .byte 0x03
/*0x2166*/  .byte 0x55
/*0x2167*/  .byte 0x00
/*0x2168*/  .byte 0x53
/*0x2169*/  .byte 0x00
/*0x216a*/  .byte 0x42
/*0x216b*/  .byte 0x00
/*0x216c*/  .byte 0x2d
/*0x216d*/  .byte 0x00
/*0x216e*/  .byte 0x48
/*0x216f*/  .byte 0x00
/*0x2170*/  .byte 0x49
/*0x2171*/  .byte 0x00
/*0x2172*/  .byte 0x44
/*0x2173*/  .byte 0x00
/*0x2174*/  .byte 0x20
/*0x2175*/  .byte 0x00
/*0x2176*/  .byte 0x4b
/*0x2177*/  .byte 0x00
/*0x2178*/  .byte 0x65
/*0x2179*/  .byte 0x00
/*0x217a*/  .byte 0x79
/*0x217b*/  .byte 0x00
/*0x217c*/  .byte 0x62
/*0x217d*/  .byte 0x00
/*0x217e*/  .byte 0x6f
/*0x217f*/  .byte 0x00
/*0x2180*/  .byte 0x61
/*0x2181*/  .byte 0x00
/*0x2182*/  .byte 0x72
/*0x2183*/  .byte 0x00
/*0x2184*/  .byte 0x64
/*0x2185*/  .byte 0x00
/*0x2186*/  .byte 0x00
/*0x2187*/  .byte 0x00
            xor_key:
/*0x2188*/  .byte 0xaa
/*0x2189*/  .byte 0x55
/*0x218a*/  .byte 0xaa
/*0x218b*/  .byte 0x55
/*0x218c*/  .byte 0x55
/*0x218d*/  .byte 0xaa
/*0x218e*/  .byte 0x55
/*0x218f*/  .byte 0xaa
/*0x2190*/  .byte 0xff
/*0x2191*/  .byte 0x00
/*0x2192*/  .byte 0x00
/*0x2193*/  .byte 0x00
/*0x2194*/  .byte 0x00
/*0x2195*/  .byte 0xff
/*0x2196*/  .byte 0x00
/*0x2197*/  .byte 0x00
/*0x2198*/  .byte 0x00
/*0x2199*/  .byte 0x00
/*0x219a*/  .byte 0xff
/*0x219b*/  .byte 0x00
/*0x219c*/  .byte 0x00
/*0x219d*/  .byte 0x00
/*0x219e*/  .byte 0x00
/*0x219f*/  .byte 0xff
/*0x21a0*/  .byte 0x00
/*0x21a1*/  .byte 0x00
/*0x21a2*/  .byte 0x00
/*0x21a3*/  .byte 0x00
/*0x21a4*/  .byte 0xff
/*0x21a5*/  .byte 0xff
/*0x21a6*/  .byte 0xff
/*0x21a7*/  .byte 0xff
/*0x21a8*/  .byte 0x0f
/*0x21a9*/  .byte 0x0f
/*0x21aa*/  .byte 0x0f
/*0x21ab*/  .byte 0x0f
/*0x21ac*/  .byte 0xf0
/*0x21ad*/  .byte 0xf0
/*0x21ae*/  .byte 0xf0
/*0x21af*/  .byte 0xf0
/*0x21b0*/  .byte 0xaa
/*0x21b1*/  .byte 0xaa
/*0x21b2*/  .byte 0xaa
/*0x21b3*/  .byte 0xaa
/*0x21b4*/  .byte 0x55
/*0x21b5*/  .byte 0x55
/*0x21b6*/  .byte 0x55
/*0x21b7*/  .byte 0x55
/*0x21b8*/  .byte 0x00
/*0x21b9*/  .byte 0x00
/*0x21ba*/  .byte 0x00
/*0x21bb*/  .byte 0x00
            update_handlers:
/*0x21bc*/  .byte 0x25
/*0x21bd*/  .byte 0x1b
/*0x21be*/  .byte 0x00
/*0x21bf*/  .byte 0x00
/*0x21c0*/  .byte 0x7d
/*0x21c1*/  .byte 0x1b
/*0x21c2*/  .byte 0x00
/*0x21c3*/  .byte 0x00
/*0x21c4*/  .byte 0x05
/*0x21c5*/  .byte 0x1b
/*0x21c6*/  .byte 0x00
/*0x21c7*/  .byte 0x00
/*0x21c8*/  .byte 0xa1
/*0x21c9*/  .byte 0x1c
/*0x21ca*/  .byte 0x00
/*0x21cb*/  .byte 0x00
/*0x21cc*/  .byte 0x41
/*0x21cd*/  .byte 0x07
/*0x21ce*/  .byte 0x00
/*0x21cf*/  .byte 0x00
/*0x21d0*/  .byte 0x75
/*0x21d1*/  .byte 0x1b
/*0x21d2*/  .byte 0x00
/*0x21d3*/  .byte 0x00
/*0x21d4*/  .byte 0x35
/*0x21d5*/  .byte 0x1e
/*0x21d6*/  .byte 0x1f
/*0x21d7*/  .byte 0x20
/*0x21d8*/  .byte 0x21
/*0x21d9*/  .byte 0x22
/*0x21da*/  .byte 0x23
/*0x21db*/  .byte 0x24
/*0x21dc*/  .byte 0x25
/*0x21dd*/  .byte 0x26
/*0x21de*/  .byte 0x27
/*0x21df*/  .byte 0x2d
/*0x21e0*/  .byte 0x2e
/*0x21e1*/  .byte 0x2a
/*0x21e2*/  .byte 0x18
/*0x21e3*/  .byte 0x0c
/*0x21e4*/  .byte 0x12
/*0x21e5*/  .byte 0x13
/*0x21e6*/  .byte 0x2f
/*0x21e7*/  .byte 0x30
/*0x21e8*/  .byte 0x0d
/*0x21e9*/  .byte 0x0e
/*0x21ea*/  .byte 0x0f
/*0x21eb*/  .byte 0x33
/*0x21ec*/  .byte 0x34
/*0x21ed*/  .byte 0x1d
/*0x21ee*/  .byte 0x11
/*0x21ef*/  .byte 0x36
/*0x21f0*/  .byte 0x37
/*0x21f1*/  .byte 0x38
/*0x21f2*/  .byte 0x0b
/*0x21f3*/  .byte 0x29
/*0x21f4*/  .byte 0x29
/*0x21f5*/  .byte 0x3a
/*0x21f6*/  .byte 0x3b
/*0x21f7*/  .byte 0x3c
/*0x21f8*/  .byte 0x3d
/*0x21f9*/  .byte 0x3e
/*0x21fa*/  .byte 0x3f
/*0x21fb*/  .byte 0x40
/*0x21fc*/  .byte 0x41
/*0x21fd*/  .byte 0x42
/*0x21fe*/  .byte 0x43
/*0x21ff*/  .byte 0x44
/*0x2200*/  .byte 0x45
/*0x2201*/  .byte 0x4c
/*0x2202*/  .byte 0x4b
/*0x2203*/  .byte 0x52
/*0x2204*/  .byte 0x4e
/*0x2205*/  .byte 0x46
/*0x2206*/  .byte 0x47
/*0x2207*/  .byte 0x48
/*0x2208*/  .byte 0x50
/*0x2209*/  .byte 0x51
/*0x220a*/  .byte 0x4f
/*0x220b*/  .byte 0x49
/*0x220c*/  .byte 0x4c
/*0x220d*/  .byte 0x65
/*0x220e*/  .byte 0x4d
/*0x220f*/  .byte 0xf5
/*0x2210*/  .byte 0xf6
/*0x2211*/  .byte 0xf4
/*0x2212*/  .byte 0x4a
/*0x2213*/  .byte 0x35
/*0x2214*/  .byte 0x29
/*0x2215*/  .byte 0x1e
/*0x2216*/  .byte 0x1f
/*0x2217*/  .byte 0x20
/*0x2218*/  .byte 0x21
/*0x2219*/  .byte 0x22
/*0x221a*/  .byte 0x23
/*0x221b*/  .byte 0x24
/*0x221c*/  .byte 0x2b
/*0x221d*/  .byte 0x14
/*0x221e*/  .byte 0x1a
/*0x221f*/  .byte 0x08
/*0x2220*/  .byte 0x15
/*0x2221*/  .byte 0x17
/*0x2222*/  .byte 0x1c
/*0x2223*/  .byte 0x18
/*0x2224*/  .byte 0x39
/*0x2225*/  .byte 0x04
/*0x2226*/  .byte 0x16
/*0x2227*/  .byte 0x07
/*0x2228*/  .byte 0x09
/*0x2229*/  .byte 0x0a
/*0x222a*/  .byte 0x0b
/*0x222b*/  .byte 0x0d
/*0x222c*/  .byte 0xe1
/*0x222d*/  .byte 0x1d
/*0x222e*/  .byte 0x1b
/*0x222f*/  .byte 0x06
/*0x2230*/  .byte 0x19
/*0x2231*/  .byte 0x05
/*0x2232*/  .byte 0x11
/*0x2233*/  .byte 0x10
/*0x2234*/  .byte 0xe0
/*0x2235*/  .byte 0xe3
/*0x2236*/  .byte 0xe2
/*0x2237*/  .byte 0x25
/*0x2238*/  .byte 0x26
/*0x2239*/  .byte 0x27
/*0x223a*/  .byte 0x2d
/*0x223b*/  .byte 0x2a
/*0x223c*/  .byte 0x64
/*0x223d*/  .byte 0x00
/*0x223e*/  .byte 0x2e
/*0x223f*/  .byte 0x0c
/*0x2240*/  .byte 0x12
/*0x2241*/  .byte 0x13
/*0x2242*/  .byte 0x2f
/*0x2243*/  .byte 0x31
/*0x2244*/  .byte 0x00
/*0x2245*/  .byte 0x00
/*0x2246*/  .byte 0x30
/*0x2247*/  .byte 0x0e
/*0x2248*/  .byte 0x0f
/*0x2249*/  .byte 0x33
/*0x224a*/  .byte 0x34
/*0x224b*/  .byte 0x28
/*0x224c*/  .byte 0x00
/*0x224d*/  .byte 0x00
/*0x224e*/  .byte 0x2c
/*0x224f*/  .byte 0x36
/*0x2250*/  .byte 0x37
/*0x2251*/  .byte 0x38
/*0x2252*/  .byte 0xe5
/*0x2253*/  .byte 0x35
/*0x2254*/  .byte 0xce
/*0x2255*/  .byte 0xcd
/*0x2256*/  .byte 0xcc
/*0x2257*/  .byte 0xe6
/*0x2258*/  .byte 0xe7
/*0x2259*/  .byte 0x65
/*0x225a*/  .byte 0xcb
/*0x225b*/  .byte 0xe4
/*0x225c*/  .byte 0x20
/*0x225d*/  .byte 0x10
/*0x225e*/  .byte 0x40
/*0x225f*/  .byte 0x80
/*0x2260*/  .byte 0x01
/*0x2261*/  .byte 0x02
/*0x2262*/  .byte 0x04
/*0x2263*/  .byte 0x08
            data_9:
/*0x2264*/  .byte 0x00
/*0x2265*/  .byte 0x60
/*0x2266*/  .byte 0x0b
/*0x2267*/  .byte 0x40
/*0x2268*/  .byte 0x01
/*0x2269*/  .byte 0x00
/*0x226a*/  .byte 0x00
/*0x226b*/  .byte 0x00
/*0x226c*/  .byte 0x00
/*0x226d*/  .byte 0x00
/*0x226e*/  .byte 0x0b
/*0x226f*/  .byte 0x40
/*0x2270*/  .byte 0x00
/*0x2271*/  .byte 0x08
/*0x2272*/  .byte 0x00
/*0x2273*/  .byte 0x00
/*0x2274*/  .byte 0x00
/*0x2275*/  .byte 0x00
/*0x2276*/  .byte 0x0b
/*0x2277*/  .byte 0x40
/*0x2278*/  .byte 0x00
/*0x2279*/  .byte 0x80
/*0x227a*/  .byte 0x00
/*0x227b*/  .byte 0x00
/*0x227c*/  .byte 0x00
/*0x227d*/  .byte 0x20
/*0x227e*/  .byte 0x0b
/*0x227f*/  .byte 0x40
/*0x2280*/  .byte 0x02
/*0x2281*/  .byte 0x00
/*0x2282*/  .byte 0x00
/*0x2283*/  .byte 0x00
/*0x2284*/  .byte 0x00
/*0x2285*/  .byte 0x40
/*0x2286*/  .byte 0x0b
/*0x2287*/  .byte 0x40
/*0x2288*/  .byte 0x20
/*0x2289*/  .byte 0x00
/*0x228a*/  .byte 0x00
/*0x228b*/  .byte 0x00
/*0x228c*/  .byte 0x00
/*0x228d*/  .byte 0x20
/*0x228e*/  .byte 0x0b
/*0x228f*/  .byte 0x40
/*0x2290*/  .byte 0x08
/*0x2291*/  .byte 0x00
/*0x2292*/  .byte 0x00
/*0x2293*/  .byte 0x00
/*0x2294*/  .byte 0x00
/*0x2295*/  .byte 0x20
/*0x2296*/  .byte 0x0b
/*0x2297*/  .byte 0x40
/*0x2298*/  .byte 0x10
/*0x2299*/  .byte 0x00
/*0x229a*/  .byte 0x00
/*0x229b*/  .byte 0x00
/*0x229c*/  .byte 0x00
/*0x229d*/  .byte 0x20
/*0x229e*/  .byte 0x0b
/*0x229f*/  .byte 0x40
/*0x22a0*/  .byte 0x20
/*0x22a1*/  .byte 0x00
/*0x22a2*/  .byte 0x00
/*0x22a3*/  .byte 0x00
/*0x22a4*/  .byte 0x00
/*0x22a5*/  .byte 0x40
/*0x22a6*/  .byte 0x0b
/*0x22a7*/  .byte 0x40
/*0x22a8*/  .byte 0x00
/*0x22a9*/  .byte 0x01
/*0x22aa*/  .byte 0x00
/*0x22ab*/  .byte 0x00
            task_1:
/*0x22ac*/  .byte 0xcc
/*0x22ad*/  .byte 0x22
/*0x22ae*/  .byte 0x00
/*0x22af*/  .byte 0x00
/*0x22b0*/  .byte 0x00
/*0x22b1*/  .byte 0x00
/*0x22b2*/  .byte 0x00
/*0x22b3*/  .byte 0x20
/*0x22b4*/  .byte 0xb8
/*0x22b5*/  .byte 0x00
/*0x22b6*/  .byte 0x00
/*0x22b7*/  .byte 0x00
/*0x22b8*/  .byte 0xc0
/*0x22b9*/  .byte 0x1e
/*0x22ba*/  .byte 0x00
/*0x22bb*/  .byte 0x00
            task_2:
/*0x22bc*/  .byte 0x84
/*0x22bd*/  .byte 0x23
/*0x22be*/  .byte 0x00
/*0x22bf*/  .byte 0x00
/*0x22c0*/  .byte 0xb8
/*0x22c1*/  .byte 0x00
/*0x22c2*/  .byte 0x00
/*0x22c3*/  .byte 0x20
/*0x22c4*/  .byte 0x20
/*0x22c5*/  .byte 0x0e
/*0x22c6*/  .byte 0x00
/*0x22c7*/  .byte 0x00
/*0x22c8*/  .byte 0xd0
/*0x22c9*/  .byte 0x1e
/*0x22ca*/  .byte 0x00
/*0x22cb*/  .byte 0x00
            sram_init_data:
/*0x22cc*/  .byte 0x01
/*0x22cd*/  .byte 0x00
/*0x22ce*/  .byte 0x00
/*0x22cf*/  .byte 0x00
/*0x22d0*/  .byte 0x00
/*0x22d1*/  .byte 0x00
/*0x22d2*/  .byte 0x00
/*0x22d3*/  .byte 0x00
/*0x22d4*/  .byte 0x00
/*0x22d5*/  .byte 0x00
/*0x22d6*/  .byte 0x00
/*0x22d7*/  .byte 0x00
/*0x22d8*/  .byte 0x00
/*0x22d9*/  .byte 0x00
/*0x22da*/  .byte 0x00
/*0x22db*/  .byte 0x00
/*0x22dc*/  .byte 0x00
/*0x22dd*/  .byte 0x00
/*0x22de*/  .byte 0x00
/*0x22df*/  .byte 0x00
/*0x22e0*/  .byte 0x00
/*0x22e1*/  .byte 0x00
/*0x22e2*/  .byte 0x00
/*0x22e3*/  .byte 0x00
/*0x22e4*/  .byte 0x01
/*0x22e5*/  .byte 0x00
/*0x22e6*/  .byte 0x00
/*0x22e7*/  .byte 0x00
/*0x22e8*/  .byte 0x01
/*0x22e9*/  .byte 0x00
/*0x22ea*/  .byte 0x00
/*0x22eb*/  .byte 0x00
/*0x22ec*/  .byte 0x01
/*0x22ed*/  .byte 0x00
/*0x22ee*/  .byte 0x00
/*0x22ef*/  .byte 0x00
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
/*0x2304*/  .byte 0x60
/*0x2305*/  .byte 0x21
/*0x2306*/  .byte 0x00
/*0x2307*/  .byte 0x00
/*0x2308*/  .byte 0x00
/*0x2309*/  .byte 0x00
/*0x230a*/  .byte 0x00
/*0x230b*/  .byte 0x00
/*0x230c*/  .byte 0x64
/*0x230d*/  .byte 0x21
/*0x230e*/  .byte 0x00
/*0x230f*/  .byte 0x00
/*0x2310*/  .byte 0x00
/*0x2311*/  .byte 0x00
/*0x2312*/  .byte 0x00
/*0x2313*/  .byte 0x00
/*0x2314*/  .byte 0x00
/*0x2315*/  .byte 0x00
/*0x2316*/  .byte 0x00
/*0x2317*/  .byte 0x00
/*0x2318*/  .byte 0xff
/*0x2319*/  .byte 0xff
/*0x231a*/  .byte 0xff
/*0x231b*/  .byte 0xff
/*0x231c*/  .byte 0x00
/*0x231d*/  .byte 0x00
/*0x231e*/  .byte 0x00
/*0x231f*/  .byte 0x00
/*0x2320*/  .byte 0x00
/*0x2321*/  .byte 0x00
/*0x2322*/  .byte 0x00
/*0x2323*/  .byte 0x00
/*0x2324*/  .byte 0x00
/*0x2325*/  .byte 0x00
/*0x2326*/  .byte 0x00
/*0x2327*/  .byte 0x00
/*0x2328*/  .byte 0x00
/*0x2329*/  .byte 0x00
/*0x232a*/  .byte 0x00
/*0x232b*/  .byte 0x00
/*0x232c*/  .byte 0x00
/*0x232d*/  .byte 0x00
/*0x232e*/  .byte 0x00
/*0x232f*/  .byte 0x00
/*0x2330*/  .byte 0x00
/*0x2331*/  .byte 0x00
/*0x2332*/  .byte 0x00
/*0x2333*/  .byte 0x00
/*0x2334*/  .byte 0x00
/*0x2335*/  .byte 0x00
/*0x2336*/  .byte 0x00
/*0x2337*/  .byte 0x00
/*0x2338*/  .byte 0x00
/*0x2339*/  .byte 0x00
/*0x233a*/  .byte 0x00
/*0x233b*/  .byte 0x00
/*0x233c*/  .byte 0x90
/*0x233d*/  .byte 0xd0
/*0x233e*/  .byte 0x02
/*0x233f*/  .byte 0x40
/*0x2340*/  .byte 0x90
/*0x2341*/  .byte 0xf0
/*0x2342*/  .byte 0x06
/*0x2343*/  .byte 0x40
/*0x2344*/  .byte 0x94
/*0x2345*/  .byte 0xf0
/*0x2346*/  .byte 0x06
/*0x2347*/  .byte 0x40
/*0x2348*/  .byte 0x98
/*0x2349*/  .byte 0xf0
/*0x234a*/  .byte 0x06
/*0x234b*/  .byte 0x40
/*0x234c*/  .byte 0x9c
/*0x234d*/  .byte 0xe0
/*0x234e*/  .byte 0x06
/*0x234f*/  .byte 0x40
/*0x2350*/  .byte 0x90
/*0x2351*/  .byte 0xe0
/*0x2352*/  .byte 0x06
/*0x2353*/  .byte 0x40
/*0x2354*/  .byte 0x94
/*0x2355*/  .byte 0xe0
/*0x2356*/  .byte 0x06
/*0x2357*/  .byte 0x40
/*0x2358*/  .byte 0x98
/*0x2359*/  .byte 0xe0
/*0x235a*/  .byte 0x06
/*0x235b*/  .byte 0x40
/*0x235c*/  .byte 0x9c
/*0x235d*/  .byte 0xc0
/*0x235e*/  .byte 0x02
/*0x235f*/  .byte 0x40
/*0x2360*/  .byte 0x98
/*0x2361*/  .byte 0xc0
/*0x2362*/  .byte 0x02
/*0x2363*/  .byte 0x40
/*0x2364*/  .byte 0x9c
/*0x2365*/  .byte 0xf0
/*0x2366*/  .byte 0x06
/*0x2367*/  .byte 0x40
/*0x2368*/  .byte 0x94
/*0x2369*/  .byte 0xd0
/*0x236a*/  .byte 0x02
/*0x236b*/  .byte 0x40
/*0x236c*/  .byte 0x90
/*0x236d*/  .byte 0xc0
/*0x236e*/  .byte 0x02
/*0x236f*/  .byte 0x40
/*0x2370*/  .byte 0x94
/*0x2371*/  .byte 0xc0
/*0x2372*/  .byte 0x02
/*0x2373*/  .byte 0x40
/*0x2374*/  .byte 0x98
/*0x2375*/  .byte 0xd0
/*0x2376*/  .byte 0x02
/*0x2377*/  .byte 0x40
/*0x2378*/  .byte 0x9c
/*0x2379*/  .byte 0xd0
/*0x237a*/  .byte 0x02
/*0x237b*/  .byte 0x40
/*0x237c*/  .byte 0x00
/*0x237d*/  .byte 0x00
/*0x237e*/  .byte 0x00
/*0x237f*/  .byte 0x00
/*0x2380*/  .byte 0x01
/*0x2381*/  .byte 0x00
/*0x2382*/  .byte 0x00
/*0x2383*/  .byte 0x00
