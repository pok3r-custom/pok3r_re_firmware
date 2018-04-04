.syntax unified
.cpu cortex-m3
.text
.thumb

            vectors:
/*0x2c00*/  .byte 0x60
/*0x2c01*/  .byte 0x37
/*0x2c02*/  .byte 0x00
/*0x2c03*/  .byte 0x20

/*0x2c04*/  .word reset
/*0x2c08*/  .word nmi
/*0x2c0c*/  .word hard_fault
/*0x2c10*/  .word mcu_fault
/*0x2c14*/  .word bus_fault
/*0x2c18*/  .word usage_fault

/*0x2c1c*/  .byte 0x00
/*0x2c1d*/  .byte 0x00
/*0x2c1e*/  .byte 0x00
/*0x2c1f*/  .byte 0x00
/*0x2c20*/  .byte 0x00
/*0x2c21*/  .byte 0x00
/*0x2c22*/  .byte 0x00
/*0x2c23*/  .byte 0x00
/*0x2c24*/  .byte 0x00
/*0x2c25*/  .byte 0x00
/*0x2c26*/  .byte 0x00
/*0x2c27*/  .byte 0x00
/*0x2c28*/  .byte 0x00
/*0x2c29*/  .byte 0x00
/*0x2c2a*/  .byte 0x00
/*0x2c2b*/  .byte 0x00

/*0x2c2c*/  .word svccall_intr
/*0x2c30*/  .word debug_intr

/*0x2c34*/  .byte 0x00
/*0x2c35*/  .byte 0x00
/*0x2c36*/  .byte 0x00
/*0x2c37*/  .byte 0x00

/*0x2c38*/  .word pendsv_intr
/*0x2c3c*/  .word systick_intr
/*0x2c40*/  .word generic_intr
/*0x2c44*/  .word generic_intr
/*0x2c48*/  .word generic_intr
/*0x2c4c*/  .word generic_intr
/*0x2c50*/  .word generic_intr
/*0x2c54*/  .word generic_intr
/*0x2c58*/  .word generic_intr
/*0x2c5c*/  .word generic_intr
/*0x2c60*/  .word generic_intr
/*0x2c64*/  .word generic_intr
/*0x2c68*/  .word generic_intr
/*0x2c6c*/  .word generic_intr
/*0x2c70*/  .word generic_intr
/*0x2c74*/  .word generic_intr
/*0x2c78*/  .word generic_intr
/*0x2c7c*/  .word generic_intr
/*0x2c80*/  .word generic_intr
/*0x2c84*/  .word generic_intr
/*0x2c88*/  .word generic_intr
/*0x2c8c*/  .word generic_intr
/*0x2c90*/  .word generic_intr
/*0x2c94*/  .word generic_intr
/*0x2c98*/  .word generic_intr
/*0x2c9c*/  .word generic_intr
/*0x2ca0*/  .word generic_intr
/*0x2ca4*/  .word generic_intr

/*0x2ca8*/  .byte 0x00
/*0x2ca9*/  .byte 0x00
/*0x2caa*/  .byte 0x00
/*0x2cab*/  .byte 0x00

/*0x2cac*/  .word generic_intr
/*0x2cb0*/  .word generic_intr
/*0x2cb4*/  .word generic_intr
/*0x2cb8*/  .word generic_intr
/*0x2cbc*/  .word generic_intr
/*0x2cc0*/  .word generic_intr
/*0x2cc4*/  .word generic_intr
/*0x2cc8*/  .word generic_intr
/*0x2ccc*/  .word generic_intr
/*0x2cd0*/  .word generic_intr

/*0x2cd4*/  .byte 0x00
/*0x2cd5*/  .byte 0x00
/*0x2cd6*/  .byte 0x00
/*0x2cd7*/  .byte 0x00
/*0x2cd8*/  .byte 0x00
/*0x2cd9*/  .byte 0x00
/*0x2cda*/  .byte 0x00
/*0x2cdb*/  .byte 0x00
/*0x2cdc*/  .byte 0x00
/*0x2cdd*/  .byte 0x00
/*0x2cde*/  .byte 0x00
/*0x2cdf*/  .byte 0x00
/*0x2ce0*/  .byte 0x00
/*0x2ce1*/  .byte 0x00
/*0x2ce2*/  .byte 0x00
/*0x2ce3*/  .byte 0x00

/*0x2ce4*/  .word bftm0_intr
/*0x2ce8*/  .word bftm1_intr
/*0x2cec*/  .word generic_intr
/*0x2cf0*/  .word i2c1_intr
/*0x2cf4*/  .word generic_intr
/*0x2cf8*/  .word generic_intr
/*0x2cfc*/  .word generic_intr
/*0x2d00*/  .word generic_intr
/*0x2d04*/  .word generic_intr
/*0x2d08*/  .word generic_intr
/*0x2d0c*/  .word generic_intr
/*0x2d10*/  .word generic_intr
/*0x2d14*/  .word usb_intr

/*0x2d18*/  .byte 0x00
/*0x2d19*/  .byte 0x00
/*0x2d1a*/  .byte 0x00
/*0x2d1b*/  .byte 0x00

/*0x2d1c*/  .word generic_intr
/*0x2d20*/  .word generic_intr
/*0x2d24*/  .word generic_intr
/*0x2d28*/  .word generic_intr
/*0x2d2c*/  .word generic_intr
/*0x2d30*/  .word generic_intr
/*0x2d34*/  .word generic_intr
/*0x2d38*/  .word generic_intr

/*0x2d3c*/  .byte 0x00
/*0x2d3d*/  .byte 0x00
/*0x2d3e*/  .byte 0x00
/*0x2d3f*/  .byte 0x00
/*0x2d40*/  .byte 0x00
/*0x2d41*/  .byte 0x00
/*0x2d42*/  .byte 0x00
/*0x2d43*/  .byte 0x00
/*0x2d44*/  .byte 0x00
/*0x2d45*/  .byte 0x00
/*0x2d46*/  .byte 0x00
/*0x2d47*/  .byte 0x00
/*0x2d48*/  .byte 0x00
/*0x2d49*/  .byte 0x00
/*0x2d4a*/  .byte 0x00
/*0x2d4b*/  .byte 0x00
/*0x2d4c*/  .byte 0x00
/*0x2d4d*/  .byte 0x00
/*0x2d4e*/  .byte 0x00
/*0x2d4f*/  .byte 0x00

/*0x2d50*/  .word generic_intr


            .thumb_func
            reset:
/*0x2d54*/      ldr r0, [pc, #0x1c] /* data_2d74 */
/*0x2d56*/      blx r0 /* watchdog_init */
/*0x2d58*/      ldr r0, [pc, #0x1c] /* data_2d78 */
/*0x2d5a*/      blx r0 /* clock_init */
/*0x2d5c*/      ldr r0, [pc, #0x1c] /* data_2d7c */
/*0x2d5e*/      bx r0 /* entry */

            .thumb_func
            nmi:
/*0x2d60*/      b nmi

            .thumb_func
            hard_fault:
/*0x2d62*/      b hard_fault

            .thumb_func
            mcu_fault:
/*0x2d64*/      b mcu_fault

            .thumb_func
            bus_fault:
/*0x2d66*/      b bus_fault

            .thumb_func
            usage_fault:
/*0x2d68*/      b usage_fault

            .thumb_func
            svccall_intr:
/*0x2d6a*/      b svccall_intr

            .thumb_func
            debug_intr:
/*0x2d6c*/      b debug_intr

            .thumb_func
            pendsv_intr:
/*0x2d6e*/      b pendsv_intr

            .thumb_func
            systick_intr:
/*0x2d70*/      b systick_intr

            .thumb_func
            generic_intr:
/*0x2d72*/      b generic_intr

            data_2d74:
/*0x2d74*/  .word watchdog_init
            data_2d78:
/*0x2d78*/  .word clock_init
            data_2d7c:
/*0x2d7c*/  .word entry


            .thumb_func
            entry:
/*0x2d80*/      ldr.w sp, [pc, #0xc] /* data_2d90 */
/*0x2d84*/      bl sram_init

            .thumb_func
            call_2d88:
/*0x2d88*/      ldr r0, [pc, #0] /* data_2d8c */
/*0x2d8a*/      bx r0 /* main */

            data_2d8c:
/*0x2d8c*/  .word main
            data_2d90:
/*0x2d90*/  .word 0x20003760


            .thumb_func
            rand:
/*0x2d94*/      ldr r1, [pc, #0x18] /* data_2db0 */
/*0x2d96*/      ldr r2, [pc, #0x1c] /* data_2db4 */
/*0x2d98*/      ldr r0, [r1]
/*0x2d9a*/      muls r0, r2, r0
/*0x2d9c*/      movw r2, #0x3039
/*0x2da0*/      add r0, r2
/*0x2da2*/      str r0, [r1]
/*0x2da4*/      lsrs r0, r0, #1
/*0x2da6*/      bx lr

            .thumb_func
            srand:
/*0x2da8*/      ldr r1, [pc, #4] /* data_2db0 */
/*0x2daa*/      str r0, [r1]
/*0x2dac*/      bx lr

/*0x2dae*/  .byte 0x00
/*0x2daf*/  .byte 0x00

            data_2db0:
/*0x2db0*/  .word 0x20000230
            data_2db4:
/*0x2db4*/  .word 0x41c64e6d


            .thumb_func
            memcpy:
/*0x2db8*/      orr.w r3, r0, r1
/*0x2dbc*/      lsls r3, r3, #0x1e
/*0x2dbe*/      beq jump_2dc8
/*0x2dc0*/      b jump_2dd6
            jump_2dc2:
/*0x2dc2*/      ldm r1!, {r3}
/*0x2dc4*/      subs r2, r2, #4
/*0x2dc6*/      stm r0!, {r3}
            jump_2dc8:
/*0x2dc8*/      cmp r2, #4
/*0x2dca*/      bhs jump_2dc2
/*0x2dcc*/      b jump_2dd6
            jump_2dce:
/*0x2dce*/      ldrb r3, [r1], #1
/*0x2dd2*/      strb r3, [r0], #1
            jump_2dd6:
/*0x2dd6*/      subs r2, r2, #1
/*0x2dd8*/      bhs jump_2dce
/*0x2dda*/      bx lr

            .thumb_func
            sram_init:
/*0x2ddc*/      ldr r4, [pc, #0x18] /* data_2df8 */
/*0x2dde*/      ldr r5, [pc, #0x1c] /* data_2dfc */
/*0x2de0*/      b jump_2df0
            jump_2de2:
/*0x2de2*/      ldr r0, [r4, #0xc]
/*0x2de4*/      orr r3, r0, #1
/*0x2de8*/      ldm.w r4, {r0, r1, r2}
/*0x2dec*/      blx r3
/*0x2dee*/      adds r4, #0x10
            jump_2df0:
/*0x2df0*/      cmp r4, r5
/*0x2df2*/      blo jump_2de2
/*0x2df4*/      bl call_2d88
            data_2df8:
/*0x2df8*/      ldrh r0, [r6, #0x3e]
/*0x2dfa*/      movs r0, r0
            data_2dfc:
/*0x2dfc*/      str r0, [sp, #0x40]
/*0x2dfe*/      movs r0, r0

            .thumb_func
            sram_decode_static:
/*0x2e00*/      push {r4, r5, r6, lr}
/*0x2e02*/      add.w r4, r1, r2
            jump_2e06:
/*0x2e06*/      ldrb r5, [r0], #1
/*0x2e0a*/      ands r3, r5, #7
/*0x2e0e*/      bne jump_2e14
/*0x2e10*/      ldrb r3, [r0], #1
            jump_2e14:
/*0x2e14*/      asrs r2, r5, #4
/*0x2e16*/      bne jump_2e26
/*0x2e18*/      ldrb r2, [r0], #1
/*0x2e1c*/      b jump_2e26
            jump_2e1e:
/*0x2e1e*/      ldrb r6, [r0], #1
/*0x2e22*/      strb r6, [r1], #1
            jump_2e26:
/*0x2e26*/      subs r3, r3, #1
/*0x2e28*/      bne jump_2e1e
/*0x2e2a*/      lsls r3, r5, #0x1c
/*0x2e2c*/      bmi jump_2e3a
/*0x2e2e*/      movs r3, #0
            jump_2e30:
/*0x2e30*/      subs r2, r2, #1
/*0x2e32*/      bmi jump_2e54
/*0x2e34*/      strb r3, [r1], #1
/*0x2e38*/      b jump_2e30
            jump_2e3a:
/*0x2e3a*/      ldrb r3, [r0], #1
/*0x2e3e*/      add.w r2, r2, #2
/*0x2e42*/      sub.w r3, r1, r3
/*0x2e46*/      b jump_2e50
            jump_2e48:
/*0x2e48*/      ldrb r5, [r3], #1
/*0x2e4c*/      strb r5, [r1], #1
            jump_2e50:
/*0x2e50*/      subs r2, r2, #1
/*0x2e52*/      bpl jump_2e48
            jump_2e54:
/*0x2e54*/      cmp r1, r4
/*0x2e56*/      blo jump_2e06
/*0x2e58*/      movs r0, #0
/*0x2e5a*/      pop {r4, r5, r6, pc}

            .thumb_func
            function_e_32:
/*0x2e5c*/      push {r4, r5, r6, r7, lr}
/*0x2e5e*/      ldr r3, [pc, #0xe4] /* data_2f44 */
/*0x2e60*/      ldr r6, [pc, #0xe4] /* data_2f48 */
/*0x2e62*/      movs r5, #1
/*0x2e64*/      ldrb r2, [r3, #1]
/*0x2e66*/      and r1, r1, #1
/*0x2e6a*/      cmp r0, #0xe9
/*0x2e6c*/      beq jump_2e78
/*0x2e6e*/      cmp r0, #0xea
/*0x2e70*/      beq jump_2e7e
/*0x2e72*/      cmp r0, #0xeb
/*0x2e74*/      bne jump_2e86
/*0x2e76*/      b jump_2eb6
            jump_2e78:
/*0x2e78*/      bfi r2, r1, #0, #1
/*0x2e7c*/      b jump_2e82
            jump_2e7e:
/*0x2e7e*/      bfi r2, r1, #1, #1
            jump_2e82:
/*0x2e82*/      strb r2, [r3, #1]
/*0x2e84*/      str r5, [r6, #0x1c]
            jump_2e86:
/*0x2e86*/      subs r0, #0xec
/*0x2e88*/      cmp r0, #0x11
/*0x2e8a*/      bhi jump_2f40
/*0x2e8c*/      ldr r2, [pc, #0xbc] /* data_2f4c */
/*0x2e8e*/      ldr.w ip, [pc, #0xb8] /* data_2f48 */
/*0x2e92*/      cmp r0, #0x12
/*0x2e94*/      ldrb r3, [r2, #1]
/*0x2e96*/      ldrb r4, [r2, #2]
/*0x2e98*/      ldrb r7, [r2, #3]
/*0x2e9a*/      sub.w ip, ip, #0x80
/*0x2e9e*/      bhs jump_2f3e
/*0x2ea0*/      tbb [pc, r0]

/*0x2ea4*/  .byte 0x0c
/*0x2ea5*/  .byte 0x0f
/*0x2ea6*/  .byte 0x13
/*0x2ea7*/  .byte 0x16
/*0x2ea8*/  .byte 0x19
/*0x2ea9*/  .byte 0x1c
/*0x2eaa*/  .byte 0x1f
/*0x2eab*/  .byte 0x22
/*0x2eac*/  .byte 0x25
/*0x2ead*/  .byte 0x2b
/*0x2eae*/  .byte 0x30
/*0x2eaf*/  .byte 0x37
/*0x2eb0*/  .byte 0x3a
/*0x2eb1*/  .byte 0x3e
/*0x2eb2*/  .byte 0x41
/*0x2eb3*/  .byte 0x44
/*0x2eb4*/  .byte 0x47
/*0x2eb5*/  .byte 0x4a

            jump_2eb6:
/*0x2eb6*/      bfi r2, r1, #2, #1
/*0x2eba*/      b jump_2e82
            switch_2ebc:
/*0x2ebc*/      bfi r3, r1, #0, #1
/*0x2ec0*/      b jump_2ec6
            switch_2ec2:
/*0x2ec2*/      bfi r3, r1, #1, #1
            jump_2ec6:
/*0x2ec6*/      strb r3, [r2, #1]
/*0x2ec8*/      b jump_2f3e
            switch_2eca:
/*0x2eca*/      bfi r3, r1, #2, #1
/*0x2ece*/      b jump_2ec6
            switch_2ed0:
/*0x2ed0*/      bfi r3, r1, #3, #1
/*0x2ed4*/      b jump_2ec6
            switch_2ed6:
/*0x2ed6*/      bfi r3, r1, #4, #1
/*0x2eda*/      b jump_2ec6
            switch_2edc:
/*0x2edc*/      bfi r3, r1, #5, #1
/*0x2ee0*/      b jump_2ec6
            switch_2ee2:
/*0x2ee2*/      bfi r3, r1, #6, #1
/*0x2ee6*/      b jump_2ec6
            switch_2ee8:
/*0x2ee8*/      bfi r3, r1, #7, #1
/*0x2eec*/      b jump_2ec6
            switch_2eee:
/*0x2eee*/      bfi r4, r1, #0, #1
/*0x2ef2*/      strb r4, [r2, #2]
/*0x2ef4*/      strb.w r5, [ip, #0x17]
/*0x2ef8*/      b jump_2f3e
            switch_2efa:
/*0x2efa*/      bfi r4, r1, #1, #1
/*0x2efe*/      strb r4, [r2, #2]
/*0x2f00*/      movs r0, #2
/*0x2f02*/      b jump_2f0c
            switch_2f04:
/*0x2f04*/      bfi r4, r1, #2, #1
/*0x2f08*/      strb r4, [r2, #2]
/*0x2f0a*/      movs r0, #4
            jump_2f0c:
/*0x2f0c*/      strb.w r0, [ip, #0x17]
/*0x2f10*/      b jump_2f3e
            switch_2f12:
/*0x2f12*/      bfi r4, r1, #3, #1
/*0x2f16*/      b jump_2f1c
            switch_2f18:
/*0x2f18*/      bfi r4, r1, #4, #1
            jump_2f1c:
/*0x2f1c*/      strb r4, [r2, #2]
/*0x2f1e*/      b jump_2f3e
            switch_2f20:
/*0x2f20*/      bfi r4, r1, #5, #1
/*0x2f24*/      b jump_2f1c
            switch_2f26:
/*0x2f26*/      bfi r4, r1, #6, #1
/*0x2f2a*/      b jump_2f1c
            switch_2f2c:
/*0x2f2c*/      bfi r4, r1, #7, #1
/*0x2f30*/      b jump_2f1c
            switch_2f32:
/*0x2f32*/      bfi r7, r1, #0, #1
/*0x2f36*/      b jump_2f3c
            switch_2f38:
/*0x2f38*/      bfi r7, r1, #1, #1
            jump_2f3c:
/*0x2f3c*/      strb r7, [r2, #3]
            jump_2f3e:
/*0x2f3e*/      str r5, [r6, #0x18]
            jump_2f40:
/*0x2f40*/      pop {r4, r5, r6, r7, pc}

/*0x2f42*/  .byte 0x00
/*0x2f43*/  .byte 0x00

            data_2f44:
/*0x2f44*/  .word 0x20000018
            data_2f48:
/*0x2f48*/  .word 0x200000d8
            data_2f4c:
/*0x2f4c*/  .word 0x2000002c


            .thumb_func
            afio_exti_ssr_write:
/*0x2f50*/      push {r4, lr}
/*0x2f52*/      movs r2, #0
/*0x2f54*/      cmp r0, #0x1c
/*0x2f56*/      bls jump_2f5e
/*0x2f58*/      movs r2, #1
/*0x2f5a*/      subs r0, #0x20
/*0x2f5c*/      uxtb r0, r0
            jump_2f5e:
/*0x2f5e*/      ldr r3, [pc, #0x14] /* data_2f74 */
/*0x2f60*/      add.w r2, r3, r2, lsl #2
/*0x2f64*/      ldr r3, [r2]
            switch_2f66:
/*0x2f66*/      movs r4, #0xf
/*0x2f68*/      lsls r4, r0
/*0x2f6a*/      bics r3, r4
/*0x2f6c*/      lsls r1, r0
/*0x2f6e*/      orrs r1, r3
/*0x2f70*/      str r1, [r2]
/*0x2f72*/      pop {r4, pc}

            data_2f74:
/*0x2f74*/  .word 0x40022000


            .thumb_func
            handle_update_packet:
/*0x2f78*/      push {r4, r5, r6, lr}
/*0x2f7a*/      ldr r0, [pc, #0x74] /* data_2ff0 */
/*0x2f7c*/      ldr r1, [r0]
/*0x2f7e*/      cmp r1, #1
/*0x2f80*/      bne jump_2fec
/*0x2f82*/      movs r6, #0
/*0x2f84*/      str r6, [r0]
/*0x2f86*/      ldr r4, [pc, #0x6c] /* data_2ff4 */
/*0x2f88*/      ldr r5, [pc, #0x6c] /* data_2ff8 */
/*0x2f8a*/      str r6, [r4]
            jump_2f8c:
/*0x2f8c*/      ldr r0, [r4]
/*0x2f8e*/      adds r1, r5, r0
/*0x2f90*/      adds r0, r0, #1
/*0x2f92*/      str r0, [r4]
/*0x2f94*/      ldr r0, [pc, #0x64] /* data_2ffc */
/*0x2f96*/      bl function_e_2
/*0x2f9a*/      ldr r0, [r4]
/*0x2f9c*/      cmp r0, #0x40
/*0x2f9e*/      blo jump_2f8c
/*0x2fa0*/      ldrh r4, [r5, #2]
/*0x2fa2*/      strb r6, [r5, #3]
/*0x2fa4*/      strb r6, [r5, #2]
/*0x2fa6*/      movs r2, #0x40
            switch_2fa8:
/*0x2fa8*/      ldr r1, [pc, #0x4c] /* data_2ff8 */
/*0x2faa*/      movs r0, #0
/*0x2fac*/      bl crc16
/*0x2fb0*/      ldrb r1, [r5]
/*0x2fb2*/      cmp r1, #7
/*0x2fb4*/      bhi jump_2fba
/*0x2fb6*/      cmp r4, r0
/*0x2fb8*/      beq jump_2fc4
            jump_2fba:
/*0x2fba*/      movs r4, #0x46
/*0x2fbc*/      ldr r0, [pc, #0x3c] /* data_2ffc */
/*0x2fbe*/      bl clear_two_words
/*0x2fc2*/      b jump_2fde
            jump_2fc4:
/*0x2fc4*/      mvn r0, #1
/*0x2fc8*/      bl function_e_4
/*0x2fcc*/      ldrb r3, [r5]
/*0x2fce*/      ldr r4, [pc, #0x30] /* data_3000 */
/*0x2fd0*/      ldrd r1, r2, [r5, #4]
/*0x2fd4*/      ldr.w r3, [r4, r3, lsl #2]
/*0x2fd8*/      ldrb r0, [r5, #1]
/*0x2fda*/      blx r3
/*0x2fdc*/      mov r4, r0
            jump_2fde:
/*0x2fde*/      mov r1, r4
/*0x2fe0*/      pop.w {r4, r5, r6, lr}
/*0x2fe4*/      ldr r0, [pc, #0x14] /* data_2ffc */
/*0x2fe6*/      subs r0, #0x10
/*0x2fe8*/      b.w function_14
            jump_2fec:
/*0x2fec*/      pop {r4, r5, r6, pc}

/*0x2fee*/  .byte 0x00
/*0x2fef*/  .byte 0x00

            data_2ff0:
/*0x2ff0*/  .word 0x20000028
            data_2ff4:
/*0x2ff4*/  .word 0x20000054
            data_2ff8:
/*0x2ff8*/  .word 0x200007cc
            data_2ffc:
/*0x2ffc*/  .word 0x20000368
            data_3000:
/*0x3000*/  .word data_8b54


            .thumb_func
            function_e_33:
/*0x3004*/      ldr r0, [pc, #0x54] /* data_305c */
/*0x3006*/      push {r4, lr}
/*0x3008*/      ldr r1, [r0]
/*0x300a*/      uxth r1, r1
/*0x300c*/      orr r2, r1, #0x11000000
/*0x3010*/      ldr r1, [pc, #0x4c] /* data_3060 */
/*0x3012*/      str r2, [r1]
/*0x3014*/      ldr r2, [r0, #8]
/*0x3016*/      mov.w r3, #0x2c00
/*0x301a*/      orr.w r2, r3, r2, lsl #16
/*0x301e*/      str r2, [r1, #4]
/*0x3020*/      ldr r2, [r0, #4]
/*0x3022*/      ldr r0, [r0, #4]
/*0x3024*/      sub.w r2, r2, #0xa
/*0x3028*/      sub.w r0, r0, #0xa
/*0x302c*/      orr.w r0, r2, r0, lsl #16
/*0x3030*/      str r0, [r1, #8]
/*0x3032*/      mov.w r0, #0x2800
/*0x3036*/      str r0, [r1, #0xc]
/*0x3038*/      sub.w r1, r1, #0x44
/*0x303c*/      mov.w r2, #0x44
/*0x3040*/      sub.w r0, r1, #0x420
/*0x3044*/      bl clear_two_words_and_write_two_bytes
/*0x3048*/      ldr r1, [pc, #0x18] /* data_3064 */
/*0x304a*/      pop.w {r4, lr}
/*0x304e*/      mov.w r2, #0x400
/*0x3052*/      sub.w r0, r1, #0x10
/*0x3056*/      b.w clear_two_words_and_write_two_bytes

/*0x305a*/  .byte 0x00
/*0x305b*/  .byte 0x00

            data_305c:
/*0x305c*/  .word 0x40080180
            data_3060:
/*0x3060*/  .word 0x200007bc
            data_3064:
/*0x3064*/  .word 0x20000378


            .thumb_func
            loc_3068:
/*0x3068*/      movs r1, #1
/*0x306a*/      lsls r0, r1, #0x10
/*0x306c*/      bl ckcu_ahb_clock_enable
/*0x3070*/      ldr r1, [pc, #0x3c] /* data_30b0 */
/*0x3072*/      mov.w r0, #0x200
/*0x3076*/      str r0, [r1, #0x24]
/*0x3078*/      ldr r1, [pc, #0x38] /* data_30b4 */
/*0x307a*/      lsls r0, r0, #0xc
/*0x307c*/      mov.w r4, #-0x1fff2000
/*0x3080*/      str r0, [r1]
/*0x3082*/      bl usb_disable_dppu
/*0x3086*/      ldr r1, [pc, #0x34] /* data_30bc */
/*0x3088*/      ldr r0, [pc, #0x2c] /* data_30b8 */
            switch_308a:
/*0x308a*/      str.w r0, [r1, #0x304]
/*0x308e*/      ldr r0, [pc, #0x30] /* data_30c0 */
            jump_3090:
/*0x3090*/      subs r0, r0, #1
/*0x3092*/      bne jump_3090
/*0x3094*/      dsb sy
/*0x3098*/      ldr.w r0, [r4, #0xd0c]
/*0x309c*/      ldr r1, [pc, #0x24] /* data_30c4 */
/*0x309e*/      and r0, r0, #0x700
/*0x30a2*/      orr.w r0, r0, r1
/*0x30a6*/      str.w r0, [r4, #0xd0c]
/*0x30aa*/      dsb sy
            jump_30ae:
/*0x30ae*/      b jump_30ae

            data_30b0:
/*0x30b0*/  .word 0x400b0000
            data_30b4:
/*0x30b4*/  .word 0xe000e184
            data_30b8:
/*0x30b8*/  .word 0x55aafaf5
            data_30bc:
/*0x30bc*/  .word 0x40080000
            data_30c0:
/*0x30c0*/  .word 0x00061a80
            data_30c4:
/*0x30c4*/  .word 0x05fa0004


            .thumb_func
            bftm0_intr:
/*0x30c8*/      push {r4, r5, r6, lr}
/*0x30ca*/      bl rand
/*0x30ce*/      ldr r0, [pc, #0x120] /* data_31f0 */
/*0x30d0*/      bl function_44
/*0x30d4*/      ldr r0, [pc, #0x11c] /* data_31f4 */
/*0x30d6*/      movs r2, #1
/*0x30d8*/      ldr r3, [pc, #0x11c] /* data_31f8 */
/*0x30da*/      ldrh r0, [r0]
/*0x30dc*/      cmp r0, #1
/*0x30de*/      bls jump_30f6
/*0x30e0*/      ldr r4, [pc, #0x118] /* data_31fc */
/*0x30e2*/      ldrh r1, [r4]
/*0x30e4*/      adds r1, r1, #1
/*0x30e6*/      udiv r5, r1, r0
/*0x30ea*/      mls r0, r0, r5, r1
/*0x30ee*/      lsls r0, r0, #0x10
/*0x30f0*/      lsrs r0, r0, #0x10
/*0x30f2*/      strh r0, [r4]
/*0x30f4*/      bne jump_30f8
            jump_30f6:
/*0x30f6*/      strb r2, [r3]
            jump_30f8:
/*0x30f8*/      ldr r0, [pc, #0x104] /* data_3200 */
/*0x30fa*/      ldrb r1, [r0]
/*0x30fc*/      adds r1, r1, #1
/*0x30fe*/      strb r1, [r0]
/*0x3100*/      ldr r1, [pc, #0x100] /* data_3204 */
/*0x3102*/      ldrb r0, [r1]
/*0x3104*/      adds r0, r0, #1
/*0x3106*/      strb r0, [r1]
/*0x3108*/      ldr r0, [pc, #0xfc] /* data_3208 */
/*0x310a*/      ldrb r1, [r0]
/*0x310c*/      adds r1, r1, #1
/*0x310e*/      strb r1, [r0]
/*0x3110*/      ldr r0, [pc, #0xf8] /* data_320c */
/*0x3112*/      ldr r1, [r0]
/*0x3114*/      cbz r1, jump_311c
/*0x3116*/      ldr r1, [r0]
/*0x3118*/      subs r1, r1, #1
/*0x311a*/      str r1, [r0]
            jump_311c:
/*0x311c*/      ldr r1, [r0, #4]
/*0x311e*/      cbz r1, jump_3126
/*0x3120*/      ldr r1, [r0, #4]
/*0x3122*/      subs r1, r1, #1
/*0x3124*/      str r1, [r0, #4]
            jump_3126:
/*0x3126*/      ldr r0, [pc, #0xe8] /* data_3210 */
/*0x3128*/      ldr r1, [r0]
/*0x312a*/      cmp r1, #1
/*0x312c*/      bls jump_3134
/*0x312e*/      ldr r1, [r0]
/*0x3130*/      subs r1, r1, #1
/*0x3132*/      str r1, [r0]
            jump_3134:
/*0x3134*/      ldr r0, [pc, #0xdc] /* data_3214 */
/*0x3136*/      ldr r1, [r0]
/*0x3138*/      cmp r1, #1
/*0x313a*/      bls jump_3142
/*0x313c*/      ldr r1, [r0]
/*0x313e*/      subs r1, r1, #1
/*0x3140*/      str r1, [r0]
            jump_3142:
/*0x3142*/      ldr r0, [pc, #0xd4] /* data_3218 */
/*0x3144*/      ldr r1, [r0]
/*0x3146*/      cbz r1, jump_314e
/*0x3148*/      ldr r1, [r0]
/*0x314a*/      adds r1, r1, #1
/*0x314c*/      str r1, [r0]
            jump_314e:
/*0x314e*/      ldr r0, [pc, #0xcc] /* data_321c */
/*0x3150*/      ldr r1, [r0]
/*0x3152*/      cbz r1, jump_315a
/*0x3154*/      ldr r1, [r0]
/*0x3156*/      adds r1, r1, #1
/*0x3158*/      str r1, [r0]
            jump_315a:
/*0x315a*/      ldr r0, [pc, #0xc4] /* data_3220 */
/*0x315c*/      ldr r1, [r0]
/*0x315e*/      cbz r1, jump_3166
/*0x3160*/      ldr r1, [r0]
/*0x3162*/      adds r1, r1, #1
/*0x3164*/      str r1, [r0]
            jump_3166:
/*0x3166*/      ldr r0, [pc, #0xbc] /* data_3224 */
/*0x3168*/      ldr r1, [r0]
/*0x316a*/      cbz r1, jump_3172
/*0x316c*/      ldr r1, [r0]
/*0x316e*/      adds r1, r1, #1
/*0x3170*/      str r1, [r0]
            jump_3172:
/*0x3172*/      ldr r0, [pc, #0xb4] /* data_3228 */
/*0x3174*/      ldr r1, [r0]
/*0x3176*/      cbz r1, jump_317e
/*0x3178*/      ldr r1, [r0]
/*0x317a*/      adds r1, r1, #1
/*0x317c*/      str r1, [r0]
            jump_317e:
/*0x317e*/      ldr r0, [pc, #0xac] /* data_322c */
/*0x3180*/      ldr r1, [r0]
/*0x3182*/      cbz r1, jump_318a
/*0x3184*/      ldr r1, [r0]
/*0x3186*/      adds r1, r1, #1
/*0x3188*/      str r1, [r0]
            jump_318a:
/*0x318a*/      ldr r0, [pc, #0xa4] /* data_3230 */
/*0x318c*/      ldr r1, [r0]
/*0x318e*/      cbz r1, jump_3196
/*0x3190*/      ldr r1, [r0]
/*0x3192*/      adds r1, r1, #1
/*0x3194*/      str r1, [r0]
            jump_3196:
/*0x3196*/      ldr r0, [pc, #0x9c] /* data_3234 */
/*0x3198*/      ldr r1, [r0]
/*0x319a*/      cbz r1, jump_31a2
/*0x319c*/      ldr r1, [r0]
/*0x319e*/      adds r1, r1, #1
/*0x31a0*/      str r1, [r0]
            jump_31a2:
/*0x31a2*/      ldr r0, [pc, #0x94] /* data_3238 */
/*0x31a4*/      ldr r1, [r0]
/*0x31a6*/      cbz r1, jump_31ae
/*0x31a8*/      ldr r1, [r0]
/*0x31aa*/      adds r1, r1, #1
/*0x31ac*/      str r1, [r0]
            jump_31ae:
/*0x31ae*/      ldr r0, [pc, #0x8c] /* data_323c */
/*0x31b0*/      ldr r1, [r0]
/*0x31b2*/      cbz r1, jump_31ba
/*0x31b4*/      ldr r1, [r0]
/*0x31b6*/      adds r1, r1, #1
/*0x31b8*/      str r1, [r0]
            jump_31ba:
/*0x31ba*/      ldr r0, [pc, #0x84] /* data_3240 */
/*0x31bc*/      ldrh r1, [r0]
/*0x31be*/      cbz r1, jump_31c6
/*0x31c0*/      ldrh r1, [r0]
/*0x31c2*/      subs r1, r1, #1
/*0x31c4*/      strh r1, [r0]
            jump_31c6:
/*0x31c6*/      ldr r0, [pc, #0x7c] /* data_3244 */
/*0x31c8*/      ldr r1, [r0]
/*0x31ca*/      cbz r1, jump_31d2
/*0x31cc*/      ldr r1, [r0]
/*0x31ce*/      adds r1, r1, #1
/*0x31d0*/      str r1, [r0]
            jump_31d2:
/*0x31d2*/      ldr r0, [pc, #0x74] /* data_3248 */
/*0x31d4*/      ldr r1, [r0]
/*0x31d6*/      cbz r1, jump_31de
/*0x31d8*/      ldr r1, [r0]
/*0x31da*/      adds r1, r1, #1
/*0x31dc*/      str r1, [r0]
            jump_31de:
/*0x31de*/      ldr r0, [pc, #0x6c] /* data_324c */
/*0x31e0*/      ldr r1, [r0]
/*0x31e2*/      cmp r1, #0
/*0x31e4*/      beq jump_31ec
/*0x31e6*/      ldr r1, [r0]
/*0x31e8*/      adds r1, r1, #1
/*0x31ea*/      str r1, [r0]
            jump_31ec:
/*0x31ec*/      pop {r4, r5, r6, pc}

/*0x31ee*/  .byte 0x00
/*0x31ef*/  .byte 0x00

            data_31f0:
/*0x31f0*/  .word 0x40076000
            data_31f4:
/*0x31f4*/  .word 0x20000100
            data_31f8:
/*0x31f8*/  .word 0x20000090
            data_31fc:
/*0x31fc*/  .word 0x20000104
            data_3200:
/*0x3200*/  .word 0x2000006b
            data_3204:
/*0x3204*/  .word 0x2000006c
            data_3208:
/*0x3208*/  .word 0x2000006d
            data_320c:
/*0x320c*/  .word 0x20000308
            data_3210:
/*0x3210*/  .word 0x200000c0
            data_3214:
/*0x3214*/  .word 0x200000c4
            data_3218:
/*0x3218*/  .word 0x200000d8
            data_321c:
/*0x321c*/  .word 0x200000d4
            data_3220:
/*0x3220*/  .word 0x200000e4
            data_3224:
/*0x3224*/  .word 0x20000108
            data_3228:
/*0x3228*/  .word 0x2000010c
            data_322c:
/*0x322c*/  .word 0x200000dc
            data_3230:
/*0x3230*/  .word 0x200000c8
            data_3234:
/*0x3234*/  .word 0x200000cc
            data_3238:
/*0x3238*/  .word 0x200000d0
            data_323c:
/*0x323c*/  .word 0x200000b4
            data_3240:
/*0x3240*/  .word 0x2000009a
            data_3244:
/*0x3244*/  .word 0x200000fc
            data_3248:
/*0x3248*/  .word 0x200001d0
            data_324c:
/*0x324c*/  .word 0x200000e0


            .thumb_func
            bftm1_intr:
/*0x3250*/      push {r4, lr}
/*0x3252*/      ldr r0, [pc, #0xc] /* data_3260 */
/*0x3254*/      bl function_44
/*0x3258*/      pop.w {r4, lr}
/*0x325c*/      b.w function_e_47

            data_3260:
/*0x3260*/  .word 0x40077000


            .thumb_func
            function_44:
/*0x3264*/      ldr r1, [r0, #4]
/*0x3266*/      bic r1, r1, #1
/*0x326a*/      str r1, [r0, #4]
/*0x326c*/      dsb sy
/*0x3270*/      bx lr

            .thumb_func
            function_45:
/*0x3272*/      cmp r1, #0
/*0x3274*/      ldr r1, [r0]
/*0x3276*/      beq jump_327e
/*0x3278*/      orr r1, r1, #4
/*0x327c*/      b jump_3282
            jump_327e:
/*0x327e*/      bic r1, r1, #4
            jump_3282:
/*0x3282*/      str r1, [r0]
/*0x3284*/      bx lr

            .thumb_func
            function_46:
/*0x3286*/      cmp r1, #0
/*0x3288*/      ldr r1, [r0]
/*0x328a*/      beq jump_3292
/*0x328c*/      orr r1, r1, #1
/*0x3290*/      b jump_3296
            jump_3292:
/*0x3292*/      bic r1, r1, #1
            jump_3296:
/*0x3296*/      str r1, [r0]
/*0x3298*/      bx lr

            .thumb_func
            function_47:
/*0x329a*/      str r1, [r0, #0xc]
/*0x329c*/      bx lr

            .thumb_func
            function_48:
/*0x329e*/      str r1, [r0, #8]
/*0x32a0*/      bx lr

/*0x32a2*/  .byte 0x00
/*0x32a3*/  .byte 0x00


            .thumb_func
            afio_pin_config:
/*0x32a4*/      lsls r0, r0, #3
/*0x32a6*/      lsrs r3, r1, #3
/*0x32a8*/      add.w r0, r0, r3, lsl #2
/*0x32ac*/      ldr r3, [pc, #0x18] /* data_32c8 */
/*0x32ae*/      push {r4, lr}
/*0x32b0*/      add r0, r3
/*0x32b2*/      lsls r1, r1, #0x1d
/*0x32b4*/      ldr r3, [r0]
/*0x32b6*/      lsrs r1, r1, #0x1b
/*0x32b8*/      movs r4, #0xf
/*0x32ba*/      lsls r4, r1
/*0x32bc*/      bics r3, r4
/*0x32be*/      lsls r2, r1
/*0x32c0*/      orrs r3, r2
/*0x32c2*/      str r3, [r0]
/*0x32c4*/      pop {r4, pc}

/*0x32c6*/  .byte 0x00
/*0x32c7*/  .byte 0x00

            data_32c8:
/*0x32c8*/  .word 0x40022020


            .thumb_func
            spin_wait_maybe:
/*0x32cc*/      add.w r0, r0, r0, lsl #2
/*0x32d0*/      lsls r0, r0, #2
            jump_32d2:
/*0x32d2*/      subs r0, r0, #1
/*0x32d4*/      bhs jump_32d2
/*0x32d6*/      bx lr

            .thumb_func
            setup_afio_gpio:
/*0x32d8*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x32dc*/      movs r1, #1
/*0x32de*/      lsls r5, r1, #0xe
/*0x32e0*/      mov r0, r5
/*0x32e2*/      bl ckcu_apb0_clock_enable
/*0x32e6*/      movs r1, #1
/*0x32e8*/      lsls r4, r1, #0x10
/*0x32ea*/      mov r0, r4
/*0x32ec*/      bl ckcu_ahb_clock_enable
/*0x32f0*/      ldr r6, [pc, #0x90] /* data_3384 */
/*0x32f2*/      movs r2, #0
/*0x32f4*/      mov r1, r5
/*0x32f6*/      mov r0, r6
/*0x32f8*/      bl gpio_set_input_enable
/*0x32fc*/      asrs r7, r4, #1
/*0x32fe*/      movs r2, #0
/*0x3300*/      mov r1, r7
/*0x3302*/      mov r0, r6
/*0x3304*/      bl gpio_set_input_enable
/*0x3308*/      movs r2, #2
/*0x330a*/      mov r1, r5
/*0x330c*/      mov r0, r6
/*0x330e*/      bl gpio_set_pin_pull_up_down
/*0x3312*/      movs r2, #2
/*0x3314*/      mov r1, r7
/*0x3316*/      mov r0, r6
/*0x3318*/      bl gpio_set_pin_pull_up_down
/*0x331c*/      asrs r5, r4, #5
/*0x331e*/      movs r2, #0
/*0x3320*/      mov r1, r5
/*0x3322*/      mov r0, r6
/*0x3324*/      bl gpio_set_input_enable
/*0x3328*/      movs r2, #2
/*0x332a*/      mov r1, r5
/*0x332c*/      mov r0, r6
/*0x332e*/      bl gpio_set_pin_pull_up_down
/*0x3332*/      movs r2, #1
/*0x3334*/      movs r1, #0xb
/*0x3336*/      movs r0, #0
/*0x3338*/      bl afio_pin_config
/*0x333c*/      movs r2, #1
/*0x333e*/      movs r1, #0xd
/*0x3340*/      movs r0, #2
/*0x3342*/      bl afio_pin_config
/*0x3346*/      movs r2, #1
/*0x3348*/      movs r1, #0xe
/*0x334a*/      movs r0, #2
/*0x334c*/      bl afio_pin_config
/*0x3350*/      movs r2, #1
/*0x3352*/      movs r1, #0xf
/*0x3354*/      movs r0, #2
/*0x3356*/      bl afio_pin_config
/*0x335a*/      ldr r0, [pc, #0x2c] /* data_3388 */
/*0x335c*/      ldr r0, [r0, #4]
/*0x335e*/      lsls r0, r0, #0x15
/*0x3360*/      bmi jump_3376
/*0x3362*/      movs r2, #1
/*0x3364*/      movs r1, #0xe
/*0x3366*/      mov r0, r2
/*0x3368*/      bl afio_pin_config
/*0x336c*/      movs r2, #1
/*0x336e*/      movs r1, #0xf
/*0x3370*/      mov r0, r2
/*0x3372*/      bl afio_pin_config
            jump_3376:
/*0x3376*/      movs r1, #0
/*0x3378*/      mov r0, r4
/*0x337a*/      bl ckcu_ahb_clock_enable
/*0x337e*/      movs r0, #1
/*0x3380*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_3384:
/*0x3384*/  .word 0x400b0000
            data_3388:
/*0x3388*/  .word 0x40088000


            .thumb_func
            function_e_34:
/*0x338c*/      push {r4, lr}
/*0x338e*/      movs r0, #1
/*0x3390*/      bl usb_dp_pull_up
/*0x3394*/      pop.w {r4, lr}
/*0x3398*/      movs r0, #0xfa
/*0x339a*/      b.w spin_wait_maybe

            .thumb_func
            usb_disable_dppu:
/*0x339e*/      movs r0, #0
/*0x33a0*/      b.w usb_dp_pull_up

            .thumb_func
            clear_two_words:
/*0x33a4*/      movs r1, #0
/*0x33a6*/      str r1, [r0, #4]
/*0x33a8*/      str r1, [r0]
/*0x33aa*/      bx lr

            .thumb_func
            clear_two_words_and_write_two_bytes:
/*0x33ac*/      movs r3, #0
/*0x33ae*/      str r3, [r0]
/*0x33b0*/      str r3, [r0, #4]
/*0x33b2*/      strd r1, r2, [r0, #8]
/*0x33b6*/      bx lr

            .thumb_func
            function_e_2:
/*0x33b8*/      push {r4, lr}
/*0x33ba*/      ldr r4, [r0, #4]
/*0x33bc*/      movs r2, #0
/*0x33be*/      ldr r3, [r0]
/*0x33c0*/      cmp r4, r3
/*0x33c2*/      beq jump_33dc
/*0x33c4*/      ldr r2, [r0, #8]
/*0x33c6*/      ldrb r2, [r2, r3]
/*0x33c8*/      strb r2, [r1]
/*0x33ca*/      ldr r1, [r0]
/*0x33cc*/      ldr r2, [r0, #0xc]
/*0x33ce*/      adds r1, r1, #1
/*0x33d0*/      udiv r3, r1, r2
/*0x33d4*/      mls r1, r2, r3, r1
/*0x33d8*/      movs r2, #1
/*0x33da*/      str r1, [r0]
            jump_33dc:
/*0x33dc*/      mov r0, r2
/*0x33de*/      pop {r4, pc}

            .thumb_func
            function_14:
/*0x33e0*/      push {r4, r5, lr}
/*0x33e2*/      ldr r3, [r0, #4]
/*0x33e4*/      movs r2, #0
/*0x33e6*/      ldr r4, [r0, #0xc]
/*0x33e8*/      adds r3, r3, #1
/*0x33ea*/      udiv r5, r3, r4
/*0x33ee*/      mls r3, r4, r5, r3
/*0x33f2*/      ldr r4, [r0]
/*0x33f4*/      cmp r3, r4
/*0x33f6*/      beq jump_340e
/*0x33f8*/      ldr r2, [r0, #4]
/*0x33fa*/      ldr r3, [r0, #8]
/*0x33fc*/      strb r1, [r3, r2]
/*0x33fe*/      ldr r1, [r0, #0xc]
/*0x3400*/      adds r2, r2, #1
/*0x3402*/      udiv r3, r2, r1
/*0x3406*/      mls r1, r1, r3, r2
/*0x340a*/      str r1, [r0, #4]
/*0x340c*/      movs r2, #1
            jump_340e:
/*0x340e*/      mov r0, r2
/*0x3410*/      pop {r4, r5, pc}

            .thumb_func
            function_e_35:
/*0x3412*/      ldr r1, [r0, #4]
/*0x3414*/      ldr r0, [r0]
/*0x3416*/      cmp r1, r0
/*0x3418*/      bne jump_341e
/*0x341a*/      movs r0, #1
/*0x341c*/      bx lr
            jump_341e:
/*0x341e*/      movs r0, #0
/*0x3420*/      bx lr

/*0x3422*/  .byte 0x00
/*0x3423*/  .byte 0x00


            .thumb_func
            ckcu_ahb_clock_enable:
/*0x3424*/      ldr r2, [pc, #0x10] /* data_3438 */
/*0x3426*/      cmp r1, #1
/*0x3428*/      ldr r1, [r2, #0x24]
/*0x342a*/      beq jump_3432
/*0x342c*/      bics r1, r0
            jump_342e:
/*0x342e*/      str r1, [r2, #0x24]
/*0x3430*/      bx lr
            jump_3432:
/*0x3432*/      orrs r1, r0
/*0x3434*/      b jump_342e

/*0x3436*/  .byte 0x00
/*0x3437*/  .byte 0x00

            data_3438:
/*0x3438*/  .word 0x40088000


            .thumb_func
            ckcu_apb0_clock_enable:
/*0x343c*/      ldr r2, [pc, #0x10] /* data_3450 */
/*0x343e*/      cmp r1, #1
/*0x3440*/      ldr r1, [r2, #0x2c]
/*0x3442*/      beq jump_344a
/*0x3444*/      bics r1, r0
            jump_3446:
/*0x3446*/      str r1, [r2, #0x2c]
/*0x3448*/      bx lr
            jump_344a:
/*0x344a*/      orrs r1, r0
/*0x344c*/      b jump_3446

/*0x344e*/  .byte 0x00
/*0x344f*/  .byte 0x00

            data_3450:
/*0x3450*/  .word 0x40088000


            .thumb_func
            ckcu_apb1_clock_enable:
/*0x3454*/      ldr r2, [pc, #0x10] /* data_3468 */
/*0x3456*/      cmp r1, #1
/*0x3458*/      ldr r1, [r2, #0x30]
/*0x345a*/      beq jump_3462
/*0x345c*/      bics r1, r0
            jump_345e:
/*0x345e*/      str r1, [r2, #0x30]
/*0x3460*/      bx lr
            jump_3462:
/*0x3462*/      orrs r1, r0
/*0x3464*/      b jump_345e

/*0x3466*/  .byte 0x00
/*0x3467*/  .byte 0x00

            data_3468:
/*0x3468*/  .word 0x40088000


            .thumb_func
            ckcu_set_usb_prescaler:
/*0x346c*/      ldr r1, [pc, #0xc] /* data_347c */
/*0x346e*/      ldr r2, [r1]
/*0x3470*/      bic r2, r2, #0xc00000
/*0x3474*/      orr.w r0, r2, r0, lsl #22
/*0x3478*/      str r0, [r1]
/*0x347a*/      bx lr

            data_347c:
/*0x347c*/  .word 0x40088000


            .thumb_func
            crc16:
/*0x3480*/      push {r4, r5, r6, r7, lr}
/*0x3482*/      movs r6, #0
/*0x3484*/      b jump_34bc
            jump_3486:
/*0x3486*/      ldrb r3, [r1, r6]
/*0x3488*/      movw ip, #0x1021
/*0x348c*/      eor.w r3, r3, r0, lsr #8
/*0x3490*/      lsl.w r4, r3, #8
/*0x3494*/      movs r3, #0
/*0x3496*/      movs r5, #8
            jump_3498:
/*0x3498*/      eor.w lr, r4, r3
/*0x349c*/      lsl.w r7, r3, #1
/*0x34a0*/      lsls.w lr, lr, #0x10
/*0x34a4*/      bpl jump_34aa
/*0x34a6*/      eor.w r7, ip, r3, lsl #1
            jump_34aa:
/*0x34aa*/      mov r3, r7
/*0x34ac*/      subs r5, r5, #1
/*0x34ae*/      lsl.w r4, r4, #1
/*0x34b2*/      bne jump_3498
/*0x34b4*/      uxth r3, r7
/*0x34b6*/      eor.w r0, r3, r0, lsl #8
/*0x34ba*/      adds r6, r6, #1
            jump_34bc:
/*0x34bc*/      cmp r6, r2
/*0x34be*/      blo jump_3486
/*0x34c0*/      uxth r0, r0
/*0x34c2*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            flash_page_erase:
/*0x34c4*/      ldr r1, [pc, #0xc] /* data_34d4 */
/*0x34c6*/      str r0, [r1]
/*0x34c8*/      movs r0, #8
/*0x34ca*/      str r0, [r1, #0xc]
/*0x34cc*/      movs r0, #0x14
/*0x34ce*/      str r0, [r1, #0x10]
/*0x34d0*/      b.w jump_34f8

            data_34d4:
/*0x34d4*/  .word 0x40080000


            .thumb_func
            flash_get_protection_status:
/*0x34d8*/      ldr r0, [pc, #4] /* data_34e0 */
/*0x34da*/      ldr r0, [r0, #0x30]
/*0x34dc*/      bx lr

/*0x34de*/  .byte 0x00
/*0x34df*/  .byte 0x00

            data_34e0:
/*0x34e0*/  .word 0x40080000


            .thumb_func
            flash_write:
/*0x34e4*/      ldr r3, [pc, #0xc] /* data_34f4 */
/*0x34e6*/      str r0, [r3, #0xc]
/*0x34e8*/      str r1, [r3]
/*0x34ea*/      str r2, [r3, #4]
/*0x34ec*/      movs r0, #0x14
/*0x34ee*/      str r0, [r3, #0x10]
/*0x34f0*/      bx lr

/*0x34f2*/  .byte 0x00
/*0x34f3*/  .byte 0x00

            data_34f4:
/*0x34f4*/  .word 0x40080000

            jump_34f8:
/*0x34f8*/      ldr r0, [pc, #0x18] /* data_3514 */
/*0x34fa*/      ldr r1, [pc, #0x1c] /* data_3518 */
/*0x34fc*/      b jump_3508
            jump_34fe:
/*0x34fe*/      ldr r2, [r1, #0x10]
/*0x3500*/      ubfx r2, r2, #2, #2
/*0x3504*/      cmp r2, #3
/*0x3506*/      beq jump_3510
            jump_3508:
/*0x3508*/      subs r0, r0, #1
/*0x350a*/      bhs jump_34fe
/*0x350c*/      movs r0, #8
/*0x350e*/      bx lr
            jump_3510:
/*0x3510*/      movs r0, #0
/*0x3512*/      bx lr

            data_3514:
/*0x3514*/  .word 0x000fffff
            data_3518:
/*0x3518*/  .word 0x40080000


            .thumb_func
            gpio_set_input_output:
/*0x351c*/      cmp r2, #0
/*0x351e*/      ldr r2, [r0]
/*0x3520*/      beq jump_3526
/*0x3522*/      orrs r2, r1
/*0x3524*/      b jump_3528
            jump_3526:
/*0x3526*/      bics r2, r1
            jump_3528:
/*0x3528*/      str r2, [r0]
/*0x352a*/      bx lr

            .thumb_func
            gpio_set_output_current:
/*0x352c*/      cmp r2, #0
/*0x352e*/      ldr r2, [r0, #0x14]
/*0x3530*/      beq jump_3536
/*0x3532*/      orrs r2, r1
/*0x3534*/      b jump_3538
            jump_3536:
/*0x3536*/      bics r2, r1
            jump_3538:
/*0x3538*/      str r2, [r0, #0x14]
/*0x353a*/      bx lr

            .thumb_func
            gpio_set_input_enable:
/*0x353c*/      cmp r2, #0
/*0x353e*/      ldr r2, [r0, #4]
/*0x3540*/      beq jump_3546
/*0x3542*/      orrs r2, r1
/*0x3544*/      b jump_3548
            jump_3546:
/*0x3546*/      bics r2, r1
            jump_3548:
/*0x3548*/      str r2, [r0, #4]
/*0x354a*/      bx lr

            .thumb_func
            gpio_set_open_drain:
/*0x354c*/      cmp r2, #0
/*0x354e*/      ldr r2, [r0, #0x10]
/*0x3550*/      beq jump_3556
/*0x3552*/      orrs r2, r1
/*0x3554*/      b jump_3558
            jump_3556:
/*0x3556*/      bics r2, r1
            jump_3558:
/*0x3558*/      str r2, [r0, #0x10]
/*0x355a*/      bx lr

            .thumb_func
            gpio_set_pin_pull_up_down:
/*0x355c*/      cbz r2, jump_3570
/*0x355e*/      cmp r2, #1
/*0x3560*/      beq jump_3576
/*0x3562*/      ldr r2, [r0, #8]
/*0x3564*/      bics r2, r1
            jump_3566:
/*0x3566*/      str r2, [r0, #8]
/*0x3568*/      ldr r2, [r0, #0xc]
/*0x356a*/      bics r2, r1
/*0x356c*/      str r2, [r0, #0xc]
/*0x356e*/      bx lr
            jump_3570:
/*0x3570*/      ldr r2, [r0, #8]
/*0x3572*/      orrs r2, r1
/*0x3574*/      b jump_3566
            jump_3576:
/*0x3576*/      ldr r2, [r0, #0xc]
/*0x3578*/      orrs r2, r1
/*0x357a*/      str r2, [r0, #0xc]
/*0x357c*/      ldr r2, [r0, #8]
/*0x357e*/      bics r2, r1
/*0x3580*/      str r2, [r0, #8]
/*0x3582*/      bx lr

            .thumb_func
            gpio_set_pin:
/*0x3584*/      str r1, [r0, #0x24]
/*0x3586*/      bx lr

            .thumb_func
            gpio_set_reset_pin:
/*0x3588*/      cbz r2, jump_358e
/*0x358a*/      str r1, [r0, #0x24]
/*0x358c*/      bx lr
            jump_358e:
/*0x358e*/      str r1, [r0, #0x28]
/*0x3590*/      bx lr

            .thumb_func
            gptm_enable_disable:
/*0x3592*/      cmp r1, #0
/*0x3594*/      ldr r1, [r0, #0x10]
/*0x3596*/      beq jump_359e
/*0x3598*/      orr r1, r1, #1
/*0x359c*/      b jump_35a2
            jump_359e:
/*0x359e*/      bic r1, r1, #1
            jump_35a2:
/*0x35a2*/      str r1, [r0, #0x10]
/*0x35a4*/      bx lr

            .thumb_func
            function_62:
/*0x35a6*/      push {r4, r5, r6, r7, lr}
/*0x35a8*/      ldrb r3, [r1]
/*0x35aa*/      movs r4, #1
/*0x35ac*/      add.w r6, r0, r3, lsl #2
/*0x35b0*/      lsls r3, r3, #1
/*0x35b2*/      lsls r4, r3
/*0x35b4*/      ldr r7, [r0, #0x50]
/*0x35b6*/      add.w r2, r6, #0x40
/*0x35ba*/      add.w r5, r6, #0x90
/*0x35be*/      mvns r4, r4
/*0x35c0*/      ands r7, r4
/*0x35c2*/      str r7, [r0, #0x50]
/*0x35c4*/      ldr r7, [r0, #0x54]
/*0x35c6*/      ands r7, r4
/*0x35c8*/      str r7, [r0, #0x54]
/*0x35ca*/      ldr r4, [r0, #0x54]
/*0x35cc*/      ldrb r7, [r1, #9]
/*0x35ce*/      lsls r7, r3
/*0x35d0*/      orrs r4, r7
/*0x35d2*/      str r4, [r0, #0x54]
/*0x35d4*/      ldr r4, [r2]
/*0x35d6*/      movw r7, #0x107
/*0x35da*/      bics r4, r7
/*0x35dc*/      str r4, [r2]
/*0x35de*/      ldr r4, [r2]
/*0x35e0*/      ldr r7, [r1, #4]
/*0x35e2*/      orrs r4, r7
/*0x35e4*/      str r4, [r2]
/*0x35e6*/      ldrh r2, [r1, #0xa]
/*0x35e8*/      str r2, [r5]
/*0x35ea*/      ldrh r2, [r1, #0xc]
/*0x35ec*/      str.w r2, [r6, #0xa0]
/*0x35f0*/      ldr r2, [r0, #0x50]
/*0x35f2*/      ldrb r1, [r1, #8]
/*0x35f4*/      lsls r1, r3
/*0x35f6*/      orrs r2, r1
/*0x35f8*/      str r2, [r0, #0x50]
/*0x35fa*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            function_e_36:
/*0x35fc*/      movs r1, #0
/*0x35fe*/      strb r1, [r0]
/*0x3600*/      str r1, [r0, #4]
/*0x3602*/      strb r1, [r0, #8]
/*0x3604*/      strb r1, [r0, #9]
/*0x3606*/      strh r1, [r0, #0xa]
/*0x3608*/      strh r1, [r0, #0xc]
/*0x360a*/      bx lr

            .thumb_func
            call_360c:
/*0x360c*/      ldrh r2, [r1]
/*0x360e*/      str.w r2, [r0, #0x88]
/*0x3612*/      ldrh r2, [r1, #2]
/*0x3614*/      str.w r2, [r0, #0x84]
/*0x3618*/      ldr r2, [r0]
/*0x361a*/      bic r2, r2, #0x30000
/*0x361e*/      str r2, [r0]
/*0x3620*/      ldr r2, [r0]
/*0x3622*/      bic r2, r2, #0x1000000
/*0x3626*/      str r2, [r0]
/*0x3628*/      ldr r2, [r0]
/*0x362a*/      ldr r3, [r1, #4]
/*0x362c*/      orrs r2, r3
/*0x362e*/      str r2, [r0]
/*0x3630*/      ldrh r1, [r1, #8]
/*0x3632*/      str r1, [r0, #0x78]
/*0x3634*/      bx lr

            .thumb_func
            call_3636:
/*0x3636*/      movs r1, #0
/*0x3638*/      movw r2, #0xffff
/*0x363c*/      str r1, [r0, #4]
/*0x363e*/      strh r2, [r0]
/*0x3640*/      strh r1, [r0, #2]
/*0x3642*/      mov.w r1, #0x100
/*0x3646*/      strh r1, [r0, #8]
/*0x3648*/      bx lr

/*0x364a*/  .byte 0x00
/*0x364b*/  .byte 0x00


            .thumb_func
            i2c1_intr:
/*0x364c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x3650*/      ldr r0, [pc, #0x11c] /* data_3770 */
/*0x3652*/      ldr r2, [r0, #0xc]
/*0x3654*/      str r2, [r0, #0xc]
/*0x3656*/      ldr r4, [pc, #0x11c] /* data_3774 */
/*0x3658*/      lsls r1, r2, #0x15
/*0x365a*/      mov.w sb, #0
/*0x365e*/      bpl jump_3664
/*0x3660*/      movs r1, #5
/*0x3662*/      b jump_3764
            jump_3664:
/*0x3664*/      lsls r1, r2, #0x17
/*0x3666*/      bpl jump_366c
/*0x3668*/      movs r1, #4
/*0x366a*/      b jump_3764
            jump_366c:
/*0x366c*/      lsls r1, r2, #0x14
/*0x366e*/      bpl jump_3674
/*0x3670*/      movs r1, #6
/*0x3672*/      b jump_3764
            jump_3674:
/*0x3674*/      ldr r1, [pc, #0xfc] /* data_3774 */
/*0x3676*/      lsls r3, r2, #0x16
/*0x3678*/      ldrb r1, [r1]
/*0x367a*/      bpl jump_368c
/*0x367c*/      ldrh r2, [r4, #0xa]
/*0x367e*/      cbz r2, jump_3688
/*0x3680*/      subs r2, r2, #1
/*0x3682*/      strh r2, [r4, #0xa]
/*0x3684*/      movs r2, #0
/*0x3686*/      b jump_3700
            jump_3688:
/*0x3688*/      movs r1, #2
/*0x368a*/      b jump_3764
            jump_368c:
/*0x368c*/      ldr.w ip, [r4, #0x10]
/*0x3690*/      cmp.w ip, #0
/*0x3694*/      beq jump_3762
/*0x3696*/      ldr r5, [pc, #0xdc] /* data_3774 */
/*0x3698*/      ldrh r3, [r5, #8]
/*0x369a*/      ldrh r5, [r5, #6]
/*0x369c*/      adds r6, r3, #1
/*0x369e*/      uxth r6, r6
/*0x36a0*/      cmp.w r2, #0x190000
/*0x36a4*/      beq jump_3728
/*0x36a6*/      bgt jump_36c2
/*0x36a8*/      mvn r1, #0x180000
/*0x36ac*/      adds r1, r2, r1
/*0x36ae*/      beq jump_36ee
/*0x36b0*/      cmp r1, #3
/*0x36b2*/      bne jump_36ee
/*0x36b4*/      cmp r5, #1
/*0x36b6*/      bls jump_36ee
/*0x36b8*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x36bc*/      movs r1, #1
/*0x36be*/      b.w function_57
            jump_36c2:
/*0x36c2*/      ldr r7, [pc, #0xb0] /* data_3774 */
/*0x36c4*/      ldr.w r8, [pc, #0xb0] /* data_3778 */
/*0x36c8*/      mov.w sl, #1
/*0x36cc*/      ldrh r7, [r7, #4]
/*0x36ce*/      cmp.w r2, #0x3a0000
/*0x36d2*/      beq jump_36f2
/*0x36d4*/      sub.w r2, r2, #0x3a0000
/*0x36d8*/      subs r2, r2, #4
/*0x36da*/      bne jump_36ee
/*0x36dc*/      ldrb r1, [r4, #1]
/*0x36de*/      cmp r1, #1
/*0x36e0*/      beq jump_36e6
/*0x36e2*/      str r7, [r0, #0x18]
/*0x36e4*/      b jump_3722
            jump_36e6:
/*0x36e6*/      lsrs r1, r7, #8
/*0x36e8*/      str r1, [r0, #0x18]
/*0x36ea*/      strb.w sb, [r8, #1]
            jump_36ee:
/*0x36ee*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_36f2:
/*0x36f2*/      ldrb.w r2, [r8, #1]
/*0x36f6*/      cbz r2, jump_371e
/*0x36f8*/      ldrb r2, [r4, #2]
/*0x36fa*/      cbz r2, jump_3708
/*0x36fc*/      mov.w r2, #0x400
            jump_3700:
/*0x3700*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x3704*/      b.w function_59
            jump_3708:
/*0x3708*/      cmp r3, r5
/*0x370a*/      bhs jump_3716
/*0x370c*/      ldrb.w r1, [ip, r3]
/*0x3710*/      str r1, [r0, #0x18]
/*0x3712*/      strh r6, [r4, #8]
/*0x3714*/      b jump_36ee
            jump_3716:
/*0x3716*/      mov r5, sb
/*0x3718*/      strb.w sb, [r4, #3]
/*0x371c*/      b jump_3750
            jump_371e:
/*0x371e*/      uxtb r1, r7
/*0x3720*/      str r1, [r0, #0x18]
            jump_3722:
/*0x3722*/      strb.w sl, [r8, #1]
/*0x3726*/      b jump_36ee
            jump_3728:
/*0x3728*/      mov r7, r0
/*0x372a*/      ldr r0, [r0, #0x18]
/*0x372c*/      strb.w r0, [ip, r3]
/*0x3730*/      subs r5, r5, #1
/*0x3732*/      strh r6, [r4, #8]
/*0x3734*/      cmp r6, r5
/*0x3736*/      bne jump_3740
/*0x3738*/      movs r1, #0
/*0x373a*/      mov r0, r7
/*0x373c*/      bl function_57
            jump_3740:
/*0x3740*/      ldrh r0, [r4, #8]
/*0x3742*/      ldrh r1, [r4, #6]
/*0x3744*/      cmp r0, r1
/*0x3746*/      bne jump_36ee
/*0x3748*/      mov r5, sb
/*0x374a*/      strb.w sb, [r4, #3]
/*0x374e*/      mov r0, r7
            jump_3750:
/*0x3750*/      bl function_58
/*0x3754*/      str r5, [r4, #0x10]
/*0x3756*/      ldr r0, [r4, #0xc]
/*0x3758*/      cmp r0, #0
/*0x375a*/      beq jump_36ee
/*0x375c*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x3760*/      bx r0
            jump_3762:
/*0x3762*/      movs r1, #3
            jump_3764:
/*0x3764*/      strb r1, [r4, #3]
/*0x3766*/      bl function_58
/*0x376a*/      str.w sb, [r4, #0x10]
/*0x376e*/      b jump_36ee

            data_3770:
/*0x3770*/  .word 0x40049000
            data_3774:
/*0x3774*/  .word 0x20002f4c
            data_3778:
/*0x3778*/  .word 0x2000021e


            .thumb_func
            function_57:
/*0x377c*/      cmp r1, #0
/*0x377e*/      ldr r1, [r0]
/*0x3780*/      beq jump_3788
/*0x3782*/      orr r1, r1, #1
/*0x3786*/      b jump_378c
            jump_3788:
/*0x3788*/      bic r1, r1, #1
            jump_378c:
/*0x378c*/      str r1, [r0]
/*0x378e*/      bx lr

            .thumb_func
            function_58:
/*0x3790*/      ldr r1, [r0]
/*0x3792*/      orr r1, r1, #2
/*0x3796*/      str r1, [r0]
/*0x3798*/      bx lr

            .thumb_func
            function_59:
/*0x379a*/      ldr r3, [r0]
/*0x379c*/      lsls r3, r3, #0x1e
/*0x379e*/      bmi function_59
/*0x37a0*/      cbz r2, jump_37a6
/*0x37a2*/      orr r1, r1, #0x400
            jump_37a6:
/*0x37a6*/      str r1, [r0, #0x1c]
/*0x37a8*/      bx lr

/*0x37aa*/  .byte 0x00
/*0x37ab*/  .byte 0x00


            .thumb_func
            function_60:
/*0x37ac*/      push {lr}
/*0x37ae*/      bl function_61
/*0x37b2*/      ldr r0, [pc, #0x10] /* data_37c4 */
/*0x37b4*/      ldrb r1, [r0]
/*0x37b6*/      cmp r1, #1
/*0x37b8*/      bne jump_37be
/*0x37ba*/      movs r1, #2
/*0x37bc*/      strb r1, [r0]
            jump_37be:
/*0x37be*/      movs r0, #1
/*0x37c0*/      pop {pc}

/*0x37c2*/  .byte 0x00
/*0x37c3*/  .byte 0x00

            data_37c4:
/*0x37c4*/  .word 0x2000021c


            .thumb_func
            function_61:
/*0x37c8*/      ldr r0, [pc, #0xc] /* data_37d8 */
/*0x37ca*/      ldrb r1, [r0]
/*0x37cc*/      cbnz r1, jump_37d2
/*0x37ce*/      movs r1, #1
/*0x37d0*/      strb r1, [r0]
            jump_37d2:
/*0x37d2*/      movs r0, #1
/*0x37d4*/      bx lr

/*0x37d6*/  .byte 0x00
/*0x37d7*/  .byte 0x00

            data_37d8:
/*0x37d8*/  .word 0x2000021c


            .thumb_func
            nop_1:
/*0x37dc*/      bx lr

/*0x37de*/  .byte 0x00
/*0x37df*/  .byte 0x00


            .thumb_func
            function_13:
/*0x37e0*/      push {r4, r5, lr}
/*0x37e2*/      movs r1, #0xe
/*0x37e4*/      movs r4, #1
/*0x37e6*/      ldr r3, [pc, #0x6c] /* data_3854 */
/*0x37e8*/      cmp.w r1, r0, lsr #4
/*0x37ec*/      bne jump_3800
/*0x37ee*/      and r0, r0, #0xf
/*0x37f2*/      cmp r0, #8
/*0x37f4*/      bhs jump_3850
/*0x37f6*/      ldrb r1, [r3]
/*0x37f8*/      lsls r4, r0
/*0x37fa*/      orrs r1, r4
/*0x37fc*/      strb r1, [r3]
/*0x37fe*/      b jump_3850
            jump_3800:
/*0x3800*/      cmp r0, #0x91
/*0x3802*/      bhi jump_3850
/*0x3804*/      movs r2, #0
/*0x3806*/      mov r1, r2
            jump_3808:
/*0x3808*/      adds r5, r3, r1
/*0x380a*/      ldrb r5, [r5, #2]
/*0x380c*/      cmp r5, r0
/*0x380e*/      bne jump_3812
/*0x3810*/      movs r2, #1
            jump_3812:
/*0x3812*/      adds r1, r1, #1
/*0x3814*/      uxtb r1, r1
/*0x3816*/      cmp r1, #6
/*0x3818*/      blo jump_3808
/*0x381a*/      cbnz r2, jump_3850
/*0x381c*/      movs r1, #0
            jump_381e:
/*0x381e*/      adds r2, r3, r1
/*0x3820*/      ldrb r2, [r2, #2]
/*0x3822*/      cbz r2, jump_3832
/*0x3824*/      adds r1, r1, #1
/*0x3826*/      uxtb r1, r1
/*0x3828*/      cmp r1, #6
/*0x382a*/      blo jump_381e
            jump_382c:
/*0x382c*/      cmp r1, #6
/*0x382e*/      beq jump_3838
/*0x3830*/      b jump_3850
            jump_3832:
/*0x3832*/      adds r2, r3, r1
/*0x3834*/      strb r0, [r2, #2]
/*0x3836*/      b jump_382c
            jump_3838:
/*0x3838*/      lsrs r2, r0, #3
/*0x383a*/      and r0, r0, #7
/*0x383e*/      lsl.w r1, r4, r0
/*0x3842*/      ldr r0, [pc, #0x14] /* data_3858 */
/*0x3844*/      add r0, r2
/*0x3846*/      ldrb r2, [r0, #2]
/*0x3848*/      orrs r2, r1
/*0x384a*/      strb r2, [r0, #2]
/*0x384c*/      ldr r0, [pc, #0xc] /* data_385c */
/*0x384e*/      str r4, [r0, #0x14]
            jump_3850:
/*0x3850*/      movs r0, #1
/*0x3852*/      pop {r4, r5, pc}

            data_3854:
/*0x3854*/  .word 0x2000003c
            data_3858:
/*0x3858*/  .word 0x2000032c
            data_385c:
/*0x385c*/  .word 0x200000d8


            .thumb_func
            exti_set_wakup:
/*0x3860*/      ldr r1, [pc, #8] /* data_386c */
/*0x3862*/      movw r0, #0xe878
/*0x3866*/      str r0, [r1, #0x58]
/*0x3868*/      bx lr

/*0x386a*/  .byte 0x00
/*0x386b*/  .byte 0x00

            data_386c:
/*0x386c*/  .word 0x40024000


            .thumb_func
            exti_check_wakup:
/*0x3870*/      ldr r0, [pc, #0xc] /* data_3880 */
/*0x3872*/      ldr r0, [r0, #0x58]
/*0x3874*/      movw r1, #0xe878
/*0x3878*/      ands r0, r1
/*0x387a*/      beq jump_387e
/*0x387c*/      movs r0, #1
            jump_387e:
/*0x387e*/      bx lr

            data_3880:
/*0x3880*/  .word 0x40024000


            .thumb_func
            function_74:
/*0x3884*/      push {r4, r5, r6, lr}
/*0x3886*/      sub sp, #0x18
/*0x3888*/      bl function_60
/*0x388c*/      bl spi_flash_init
/*0x3890*/      ldr r4, [pc, #0xa8] /* data_393c */
/*0x3892*/      ldr r6, [pc, #0xa4] /* data_3938 */
/*0x3894*/      movs r2, #3
/*0x3896*/      ldrb.w r0, [r4, #0x26]
/*0x389a*/      ldr.w r1, [r6, r0, lsl #2]
/*0x389e*/      ldr r0, [pc, #0xa0] /* data_3940 */
/*0x38a0*/      addw r1, r1, #0xffb
/*0x38a4*/      bl spi_flash_read_data
/*0x38a8*/      ldr r5, [pc, #0x94] /* data_3940 */
/*0x38aa*/      ldrb r0, [r5]
/*0x38ac*/      cmp r0, #0x56
/*0x38ae*/      bne jump_38bc
/*0x38b0*/      ldrb r0, [r5, #1]
/*0x38b2*/      cmp r0, #0x31
/*0x38b4*/      bne jump_38bc
/*0x38b6*/      ldrb r0, [r5, #2]
/*0x38b8*/      cmp r0, #0x34
/*0x38ba*/      beq jump_38ca
            jump_38bc:
/*0x38bc*/      bl function_e_95
            jump_38c0:
/*0x38c0*/      ldrb.w r0, [r4, #0x39]
/*0x38c4*/      cmp r0, #1
/*0x38c6*/      beq jump_38ee
/*0x38c8*/      b jump_3900
            jump_38ca:
/*0x38ca*/      ldrb.w r0, [r4, #0x26]
/*0x38ce*/      mov.w r2, #0xff0
/*0x38d2*/      ldr.w r1, [r6, r0, lsl #2]
/*0x38d6*/      ldr r0, [pc, #0x68] /* data_3940 */
/*0x38d8*/      add.w r1, r1, #0xff0
/*0x38dc*/      bl spi_flash_read_data
/*0x38e0*/      ldrb r0, [r5]
/*0x38e2*/      strb r0, [r4, #0x18]
/*0x38e4*/      ldrb.w r0, [r4, #0x26]
/*0x38e8*/      bl function_e_25
/*0x38ec*/      b jump_38c0
            jump_38ee:
/*0x38ee*/      ldrh.w r0, [r4, #0x46]
/*0x38f2*/      cbnz r0, jump_3900
/*0x38f4*/      ldrh.w r0, [r4, #0x48]
/*0x38f8*/      cbnz r0, jump_3900
/*0x38fa*/      movs r0, #0xc8
/*0x38fc*/      strh.w r0, [r4, #0x48]
            jump_3900:
/*0x3900*/      ldr r0, [pc, #0x40] /* data_3944 */
/*0x3902*/      str r0, [sp, #0xc]
/*0x3904*/      movs r0, #9
/*0x3906*/      strb.w r0, [sp, #0x13]
/*0x390a*/      mov.w r0, #0x208
/*0x390e*/      strh.w r0, [sp, #0x10]
/*0x3912*/      ldr r0, [pc, #0x34] /* data_3948 */
/*0x3914*/      str r0, [sp]
/*0x3916*/      movs r0, #1
/*0x3918*/      strb.w r0, [sp, #0x12]
/*0x391c*/      movs r0, #0
/*0x391e*/      str r0, [sp, #4]
/*0x3920*/      str r0, [sp, #8]
/*0x3922*/      mov r0, sp
/*0x3924*/      bl function_e_48
/*0x3928*/      ldrb.w r0, [r4, #0x39]
/*0x392c*/      bl function_e_18
/*0x3930*/      bl call_4824
/*0x3934*/      add sp, #0x18
/*0x3936*/      pop {r4, r5, r6, pc}

            data_3938:
/*0x3938*/  .word data_8d44
            data_393c:
/*0x393c*/  .word 0x20000058
            data_3940:
/*0x3940*/  .word 0x20001cba
            data_3944:
/*0x3944*/  .word data_8fa8
            data_3948:
/*0x3948*/  .word loc_394c


            .thumb_func
            loc_394c:
/*0x394c*/      push.w {r0, r1, r2, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x3950*/      sub sp, #0x10
/*0x3952*/      mov r5, r0
/*0x3954*/      movs r0, #1
/*0x3956*/      str r0, [sp, #0xc]
/*0x3958*/      movs r0, #0
/*0x395a*/      ldr.w fp, [pc, #0x3fc] /* data_3d58 */
/*0x395e*/      str r0, [sp]
/*0x3960*/      str r0, [sp, #4]
/*0x3962*/      str r0, [sp, #8]
/*0x3964*/      mov r6, r1
/*0x3966*/      mov sb, r0
/*0x3968*/      str.w r0, [fp, #0x34]
/*0x396c*/      sub.w r7, fp, #0x80
/*0x3970*/      ldrb.w r0, [r7, #0x30]
/*0x3974*/      cmp r0, #1
/*0x3976*/      bls jump_3996
/*0x3978*/      ldr r1, [pc, #0x3e0] /* data_3d5c */
/*0x397a*/      ldrb r1, [r1]
/*0x397c*/      cmp r1, #1
/*0x397e*/      bne jump_3996
/*0x3980*/      adds r0, r0, #1
/*0x3982*/      uxtb r0, r0
/*0x3984*/      strb.w r0, [r7, #0x30]
/*0x3988*/      cmp r0, #6
/*0x398a*/      bls jump_3992
/*0x398c*/      movs r0, #2
/*0x398e*/      strb.w r0, [r7, #0x30]
            jump_3992:
/*0x3992*/      bl function_e_15
            jump_3996:
/*0x3996*/      ldrb r0, [r7, #2]
/*0x3998*/      mov.w sl, #1
/*0x399c*/      cmp r0, #1
/*0x399e*/      bne jump_39a8
/*0x39a0*/      ldr r0, [pc, #0x3bc] /* data_3d60 */
/*0x39a2*/      ldrb r0, [r0, #6]
/*0x39a4*/      cmp r0, #0xfc
/*0x39a6*/      beq jump_39b2
            jump_39a8:
/*0x39a8*/      ldrb.w r0, [r7, #0x30]
/*0x39ac*/      cmp r0, #1
/*0x39ae*/      beq jump_39be
/*0x39b0*/      b jump_39c8
            jump_39b2:
/*0x39b2*/      ldrb.w r0, [r7, #0x30]
/*0x39b6*/      cmp r0, #1
/*0x39b8*/      beq jump_39c8
/*0x39ba*/      mov r0, sl
/*0x39bc*/      b jump_39c0
            jump_39be:
/*0x39be*/      mov r0, sb
            jump_39c0:
/*0x39c0*/      strb.w r0, [r7, #0x30]
/*0x39c4*/      str.w r0, [fp, #8]
            jump_39c8:
/*0x39c8*/      add.w r4, r6, r5, lsl #3
/*0x39cc*/      cmp r4, #0x22
/*0x39ce*/      beq jump_39d4
/*0x39d0*/      cmp r4, #0x43
/*0x39d2*/      bne jump_3a38
            jump_39d4:
/*0x39d4*/      ldr r0, [sp, #0x18]
/*0x39d6*/      cbz r0, jump_3a0c
/*0x39d8*/      cmp r4, #0x22
/*0x39da*/      bne jump_39e8
/*0x39dc*/      ldrb.w r0, [r7, #0x2b]
/*0x39e0*/      orr r0, r0, #1
/*0x39e4*/      strb.w r0, [r7, #0x2b]
            jump_39e8:
/*0x39e8*/      cmp r4, #0x43
/*0x39ea*/      bne jump_39f8
/*0x39ec*/      ldrb.w r0, [r7, #0x2b]
/*0x39f0*/      orr r0, r0, #2
/*0x39f4*/      strb.w r0, [r7, #0x2b]
            jump_39f8:
/*0x39f8*/      ldrb.w r0, [r7, #0x2b]
/*0x39fc*/      cmp r0, #3
/*0x39fe*/      bne jump_3a38
/*0x3a00*/      str.w sl, [fp, #0x34]
/*0x3a04*/      movs r0, #2
/*0x3a06*/      strb.w r0, [r7, #0x2a]
/*0x3a0a*/      b jump_3a38
            jump_3a0c:
/*0x3a0c*/      mov r0, sb
/*0x3a0e*/      strb.w sb, [r7, #0x2a]
/*0x3a12*/      cmp r4, #0x22
/*0x3a14*/      bne jump_3a22
/*0x3a16*/      ldrb.w r1, [r7, #0x2b]
/*0x3a1a*/      and r1, r1, #0xfe
/*0x3a1e*/      strb.w r1, [r7, #0x2b]
            jump_3a22:
/*0x3a22*/      cmp r4, #0x43
/*0x3a24*/      bne jump_3a32
/*0x3a26*/      ldrb.w r1, [r7, #0x2b]
/*0x3a2a*/      and r1, r1, #0xfd
/*0x3a2e*/      strb.w r1, [r7, #0x2b]
            jump_3a32:
/*0x3a32*/      strb r0, [r7, #0xc]
/*0x3a34*/      str.w r0, [fp, #0x34]
            jump_3a38:
/*0x3a38*/      cmp r4, #0x44
/*0x3a3a*/      beq jump_3a40
/*0x3a3c*/      cmp r4, #0xc
/*0x3a3e*/      bne jump_3a70
            jump_3a40:
/*0x3a40*/      ldr r0, [sp, #0x18]
/*0x3a42*/      cbz r0, jump_3a64
/*0x3a44*/      movs r0, #0x10
/*0x3a46*/      cmp r4, #0x44
/*0x3a48*/      bne jump_3a4e
/*0x3a4a*/      strb.w r0, [r7, #0x2b]
            jump_3a4e:
/*0x3a4e*/      cmp r4, #0xc
/*0x3a50*/      bne jump_3a70
/*0x3a52*/      ldrb.w r0, [r7, #0x2b]
/*0x3a56*/      cmp r0, #0x10
/*0x3a58*/      bne jump_3a70
/*0x3a5a*/      strb.w sb, [r7, #0x2a]
/*0x3a5e*/      str.w sl, [fp, #0x34]
/*0x3a62*/      b jump_3a70
            jump_3a64:
/*0x3a64*/      cmp r4, #0x44
/*0x3a66*/      bne jump_3a6c
/*0x3a68*/      strb.w sb, [r7, #0x2b]
            jump_3a6c:
/*0x3a6c*/      str.w sb, [fp, #0x34]
            jump_3a70:
/*0x3a70*/      cmp r4, #0x3a
/*0x3a72*/      beq jump_3a7c
/*0x3a74*/      cmp r4, #0x43
/*0x3a76*/      beq jump_3a7c
/*0x3a78*/      cmp r4, #0x21
/*0x3a7a*/      bne jump_3afe
            jump_3a7c:
/*0x3a7c*/      ldr r0, [sp, #0x18]
/*0x3a7e*/      cbz r0, jump_3ace
/*0x3a80*/      cmp r4, #0x43
/*0x3a82*/      bne jump_3a90
/*0x3a84*/      ldrb.w r0, [r7, #0x2e]
/*0x3a88*/      orr r0, r0, #0x10
/*0x3a8c*/      strb.w r0, [r7, #0x2e]
            jump_3a90:
/*0x3a90*/      cmp r4, #0x3a
/*0x3a92*/      bne jump_3aa0
/*0x3a94*/      ldrb.w r0, [r7, #0x2e]
/*0x3a98*/      orr r0, r0, #0x20
/*0x3a9c*/      strb.w r0, [r7, #0x2e]
            jump_3aa0:
/*0x3aa0*/      cmp r4, #0x21
/*0x3aa2*/      bne jump_3ab0
/*0x3aa4*/      ldrb.w r0, [r7, #0x2e]
/*0x3aa8*/      orr r0, r0, #0x40
/*0x3aac*/      strb.w r0, [r7, #0x2e]
            jump_3ab0:
/*0x3ab0*/      ldrb.w r0, [r7, #0x2e]
/*0x3ab4*/      cmp r0, #0x70
/*0x3ab6*/      bne jump_3afe
/*0x3ab8*/      strb.w sb, [r7, #0x2e]
/*0x3abc*/      strb.w sl, [r7, #0x2f]
/*0x3ac0*/      ldrb.w r0, [r7, #0x2c]
/*0x3ac4*/      eor r0, r0, #1
/*0x3ac8*/      strb.w r0, [r7, #0x2d]
/*0x3acc*/      b jump_3afe
            jump_3ace:
/*0x3ace*/      cmp r4, #0x43
/*0x3ad0*/      bne jump_3ade
/*0x3ad2*/      ldrb.w r0, [r7, #0x2e]
/*0x3ad6*/      bic r0, r0, #0x10
/*0x3ada*/      strb.w r0, [r7, #0x2e]
            jump_3ade:
/*0x3ade*/      cmp r4, #0x3a
/*0x3ae0*/      bne jump_3aee
/*0x3ae2*/      ldrb.w r0, [r7, #0x2e]
/*0x3ae6*/      bic r0, r0, #0x20
/*0x3aea*/      strb.w r0, [r7, #0x2e]
            jump_3aee:
/*0x3aee*/      cmp r4, #0x21
/*0x3af0*/      bne jump_3afe
/*0x3af2*/      ldrb.w r0, [r7, #0x2e]
/*0x3af6*/      bic r0, r0, #0x40
/*0x3afa*/      strb.w r0, [r7, #0x2e]
            jump_3afe:
/*0x3afe*/      bl function_80
/*0x3b02*/      cmp r0, #1
/*0x3b04*/      bne jump_3baa
/*0x3b06*/      ldrb r0, [r7, #0x19]
/*0x3b08*/      ldr r3, [pc, #0x258] /* data_3d64 */
/*0x3b0a*/      mov.w ip, #0xff0
/*0x3b0e*/      cmp r0, #1
/*0x3b10*/      beq jump_3b24
/*0x3b12*/      ldrb.w r0, [r7, #0x28]
/*0x3b16*/      cmp r0, #1
/*0x3b18*/      beq jump_3b4c
/*0x3b1a*/      ldrb.w r0, [r7, #0x2f]
/*0x3b1e*/      cmp r0, #1
/*0x3b20*/      beq jump_3b4c
/*0x3b22*/      b jump_3baa
            jump_3b24:
/*0x3b24*/      ldrb r0, [r7, #0x1a]
/*0x3b26*/      strb r0, [r7, #0x18]
/*0x3b28*/      ldrb.w r1, [r7, #0x27]
/*0x3b2c*/      ldr r2, [pc, #0x238] /* data_3d68 */
/*0x3b2e*/      strb.w r1, [r7, #0x26]
/*0x3b32*/      strb.w sb, [r7, #0x19]
/*0x3b36*/      strb.w r0, [r2, #0xff0]
/*0x3b3a*/      ldr.w r0, [r3, r1, lsl #2]
/*0x3b3e*/      mov r2, ip
/*0x3b40*/      add.w r0, r0, #0xff0
/*0x3b44*/      mov r1, r0
/*0x3b46*/      bl function_e_97
/*0x3b4a*/      b jump_3b92
            jump_3b4c:
/*0x3b4c*/      ldrb.w r0, [r7, #0x28]
/*0x3b50*/      cmp r0, #1
/*0x3b52*/      beq jump_3b5e
/*0x3b54*/      ldrb.w r0, [r7, #0x2f]
/*0x3b58*/      cmp r0, #1
/*0x3b5a*/      beq jump_3b86
/*0x3b5c*/      b jump_3b92
            jump_3b5e:
/*0x3b5e*/      add.w r7, r7, #0x18
/*0x3b62*/      ldrb r0, [r7, #0xf]
/*0x3b64*/      strb r0, [r7, #0xe]
/*0x3b66*/      mov r2, ip
/*0x3b68*/      ldr.w r1, [r3, r0, lsl #2]
/*0x3b6c*/      ldr r0, [pc, #0x1f8] /* data_3d68 */
/*0x3b6e*/      add.w r1, r1, #0xff0
/*0x3b72*/      bl spi_flash_read_data
/*0x3b76*/      ldr r0, [pc, #0x1f0] /* data_3d68 */
/*0x3b78*/      ldrb r0, [r0]
/*0x3b7a*/      strb r0, [r7]
/*0x3b7c*/      strb.w sb, [r7, #0x10]
/*0x3b80*/      sub.w r7, r7, #0x18
/*0x3b84*/      b jump_3b92
            jump_3b86:
/*0x3b86*/      ldrb.w r0, [r7, #0x2d]
/*0x3b8a*/      strb.w r0, [r7, #0x2c]
/*0x3b8e*/      strb.w sb, [r7, #0x2f]
            jump_3b92:
/*0x3b92*/      ldrb.w r0, [r7, #0x26]
/*0x3b96*/      bl function_e_25
/*0x3b9a*/      ldrb.w r0, [r7, #0x39]
/*0x3b9e*/      bl function_e_18
/*0x3ba2*/      bl function_e_83
/*0x3ba6*/      strb.w sb, [r7, #0x1b]
            jump_3baa:
/*0x3baa*/      ldrb.w r0, [r7, #0x3d]
/*0x3bae*/      ldr r2, [pc, #0x1bc] /* data_3d6c */
/*0x3bb0*/      cmp r4, r0
/*0x3bb2*/      beq jump_3bba
/*0x3bb4*/      cmp.w r8, #0xe8
/*0x3bb8*/      bne jump_3c00
            jump_3bba:
/*0x3bba*/      ldrb.w r0, [r7, #0x2c]
/*0x3bbe*/      movs r1, #1
/*0x3bc0*/      cmp r0, #1
/*0x3bc2*/      bne jump_3bda
/*0x3bc4*/      movs r0, #0
            jump_3bc6:
/*0x3bc6*/      ldrb r3, [r2, r0]
/*0x3bc8*/      cmp r4, r3
/*0x3bca*/      bne jump_3bce
/*0x3bcc*/      movs r1, #0
            jump_3bce:
/*0x3bce*/      adds r0, r0, #1
/*0x3bd0*/      uxtb r0, r0
/*0x3bd2*/      cmp r0, #4
/*0x3bd4*/      blo jump_3bc6
/*0x3bd6*/      cmp r1, #1
/*0x3bd8*/      bne jump_3c00
            jump_3bda:
/*0x3bda*/      ldr r0, [sp, #0x18]
/*0x3bdc*/      cbz r0, jump_3be4
/*0x3bde*/      strb.w sl, [r7, #2]
/*0x3be2*/      b jump_3bf8
            jump_3be4:
/*0x3be4*/      strb.w sb, [r7, #2]
/*0x3be8*/      strb.w sb, [r7, #4]
/*0x3bec*/      str.w sb, [r7, #0x68]
/*0x3bf0*/      str.w sb, [r7, #0x6c]
/*0x3bf4*/      str.w sb, [fp, #4]
            jump_3bf8:
/*0x3bf8*/      movs r0, #1
/*0x3bfa*/      mov.w r8, #0
/*0x3bfe*/      str r0, [sp]
            jump_3c00:
/*0x3c00*/      ldrb.w r0, [r7, #0x3e]
/*0x3c04*/      cmp r4, r0
/*0x3c06*/      bne jump_3c3a
/*0x3c08*/      ldrb.w r0, [r7, #0x2c]
/*0x3c0c*/      movs r1, #1
/*0x3c0e*/      cmp r0, #1
/*0x3c10*/      bne jump_3c28
/*0x3c12*/      movs r0, #0
            jump_3c14:
/*0x3c14*/      ldrb r3, [r2, r0]
/*0x3c16*/      cmp r4, r3
/*0x3c18*/      bne jump_3c1c
/*0x3c1a*/      movs r1, #0
            jump_3c1c:
/*0x3c1c*/      adds r0, r0, #1
/*0x3c1e*/      uxtb r0, r0
/*0x3c20*/      cmp r0, #4
/*0x3c22*/      blo jump_3c14
/*0x3c24*/      cmp r1, #1
/*0x3c26*/      bne jump_3c3a
            jump_3c28:
/*0x3c28*/      ldr r0, [sp, #0x18]
/*0x3c2a*/      cbz r0, jump_3c32
/*0x3c2c*/      strb.w sl, [r7, #3]
/*0x3c30*/      b jump_3c36
            jump_3c32:
/*0x3c32*/      strb.w sb, [r7, #3]
            jump_3c36:
/*0x3c36*/      movs r0, #1
/*0x3c38*/      str r0, [sp]
            jump_3c3a:
/*0x3c3a*/      ldr r0, [pc, #0x11c] /* data_3d58 */
/*0x3c3c*/      subs r0, #0x80
/*0x3c3e*/      ldrb.w r0, [r0, #0x2c]
/*0x3c42*/      cmp r0, #1
/*0x3c44*/      bne jump_3c5a
/*0x3c46*/      movs r0, #0
            jump_3c48:
/*0x3c48*/      ldrb r1, [r2, r0]
/*0x3c4a*/      cmp r4, r1
/*0x3c4c*/      bne jump_3c52
/*0x3c4e*/      movs r1, #1
/*0x3c50*/      str r1, [sp, #8]
            jump_3c52:
/*0x3c52*/      adds r0, r0, #1
/*0x3c54*/      uxtb r0, r0
/*0x3c56*/      cmp r0, #4
/*0x3c58*/      blo jump_3c48
            jump_3c5a:
/*0x3c5a*/      movs r4, #1
/*0x3c5c*/      ldr r3, [sp, #0x18]
/*0x3c5e*/      lsls r4, r6
/*0x3c60*/      ldr r0, [pc, #0x10c] /* data_3d70 */
/*0x3c62*/      ldr r1, [pc, #0x110] /* data_3d74 */
/*0x3c64*/      ldr r2, [pc, #0x110] /* data_3d78 */
/*0x3c66*/      cmp r3, #0
/*0x3c68*/      ldr r3, [sp]
/*0x3c6a*/      add.w r0, r0, r5, lsl #3
/*0x3c6e*/      add.w r1, r1, r5, lsl #3
/*0x3c72*/      add.w r2, r2, r5, lsl #3
/*0x3c76*/      beq jump_3cd6
/*0x3c78*/      cmp r3, #1
/*0x3c7a*/      beq jump_3d04
/*0x3c7c*/      ldr r7, [pc, #0xd8] /* data_3d58 */
/*0x3c7e*/      subs r7, #0x80
/*0x3c80*/      ldrb r3, [r7, #0x18]
/*0x3c82*/      cbz r3, jump_3c8e
/*0x3c84*/      ldr.w r3, [fp, #0x34]
/*0x3c88*/      cbnz r3, jump_3c8e
/*0x3c8a*/      ldr r3, [sp, #8]
/*0x3c8c*/      cbz r3, jump_3ca0
            jump_3c8e:
/*0x3c8e*/      ldrb.w r3, [r7, #0x26]
/*0x3c92*/      cmp r3, #1
/*0x3c94*/      beq jump_3cce
/*0x3c96*/      cmp r3, #2
/*0x3c98*/      beq jump_3cd2
/*0x3c9a*/      ldrb r0, [r2, r6]
            jump_3c9c:
/*0x3c9c*/      mov r8, r0
/*0x3c9e*/      b jump_3d04
            jump_3ca0:
/*0x3ca0*/      mov r1, r6
/*0x3ca2*/      mov r0, r5
/*0x3ca4*/      ldr r2, [sp, #0x18]
/*0x3ca6*/      bl function_e_82
/*0x3caa*/      mov r8, r0
/*0x3cac*/      ldrb.w r0, [r7, #0x24]
/*0x3cb0*/      cmp r0, #2
/*0x3cb2*/      beq jump_3cc0
/*0x3cb4*/      cmp r0, #0x12
/*0x3cb6*/      beq jump_3cc0
/*0x3cb8*/      cmp r0, #3
/*0x3cba*/      beq jump_3cc0
/*0x3cbc*/      cmp r0, #0x13
/*0x3cbe*/      bne jump_3d04
            jump_3cc0:
/*0x3cc0*/      ldr r1, [pc, #0xb8] /* data_3d7c */
/*0x3cc2*/      ldrb r0, [r1, r5]
/*0x3cc4*/      orrs r0, r4
/*0x3cc6*/      strb r0, [r1, r5]
/*0x3cc8*/      movs r0, #1
/*0x3cca*/      str r0, [sp, #4]
/*0x3ccc*/      b jump_3d04
            jump_3cce:
/*0x3cce*/      ldrb r0, [r0, r6]
/*0x3cd0*/      b jump_3c9c
            jump_3cd2:
/*0x3cd2*/      ldrb r0, [r1, r6]
/*0x3cd4*/      b jump_3c9c
            jump_3cd6:
/*0x3cd6*/      cmp r3, #1
/*0x3cd8*/      beq jump_3d04
/*0x3cda*/      ldr r7, [pc, #0x7c] /* data_3d58 */
/*0x3cdc*/      subs r7, #0x80
/*0x3cde*/      ldrb r3, [r7, #0x18]
/*0x3ce0*/      cbz r3, jump_3cec
/*0x3ce2*/      ldr.w r3, [fp, #0x34]
/*0x3ce6*/      cbnz r3, jump_3cec
/*0x3ce8*/      ldr r3, [sp, #8]
/*0x3cea*/      cbz r3, jump_3d2e
            jump_3cec:
/*0x3cec*/      ldrb.w r3, [r7, #0x26]
/*0x3cf0*/      cmp r3, #1
/*0x3cf2*/      beq jump_3d54
/*0x3cf4*/      cmp r3, #2
/*0x3cf6*/      beq jump_3d80
/*0x3cf8*/      ldrb r0, [r2, r6]
            jump_3cfa:
/*0x3cfa*/      mov r8, r0
            jump_3cfc:
/*0x3cfc*/      ldr r0, [pc, #0x7c] /* data_3d7c */
/*0x3cfe*/      ldrb r1, [r0, r5]
/*0x3d00*/      bics r1, r4
/*0x3d02*/      strb r1, [r0, r5]
            jump_3d04:
/*0x3d04*/      mov r0, r8
/*0x3d06*/      ldr r1, [sp, #0x18]
/*0x3d08*/      bl function_e_85
/*0x3d0c*/      ldr r7, [pc, #0x5c] /* data_3d6c */
/*0x3d0e*/      ldr r0, [sp, #0x18]
/*0x3d10*/      adds r7, #0x16
/*0x3d12*/      cmp r0, #0
/*0x3d14*/      ldr r0, [sp]
/*0x3d16*/      beq jump_3e12
/*0x3d18*/      cmp r0, #1
/*0x3d1a*/      beq jump_3e14
/*0x3d1c*/      mov r2, r6
/*0x3d1e*/      mov r1, r5
/*0x3d20*/      mov r0, r8
/*0x3d22*/      bl function_e_13
/*0x3d26*/      mov r4, r0
/*0x3d28*/      cmp r0, #0xe8
/*0x3d2a*/      beq jump_3d84
/*0x3d2c*/      b jump_3d92
            jump_3d2e:
/*0x3d2e*/      mov r1, r6
/*0x3d30*/      mov r0, r5
/*0x3d32*/      ldr r2, [sp, #0x18]
/*0x3d34*/      bl function_e_82
/*0x3d38*/      mov r8, r0
/*0x3d3a*/      ldrb.w r0, [r7, #0x24]
/*0x3d3e*/      cmp r0, #2
/*0x3d40*/      beq jump_3d4e
/*0x3d42*/      cmp r0, #0x12
/*0x3d44*/      beq jump_3d4e
/*0x3d46*/      cmp r0, #3
/*0x3d48*/      beq jump_3d4e
/*0x3d4a*/      cmp r0, #0x13
/*0x3d4c*/      bne jump_3cfc
            jump_3d4e:
/*0x3d4e*/      movs r0, #1
/*0x3d50*/      str r0, [sp, #4]
/*0x3d52*/      b jump_3cfc
            jump_3d54:
/*0x3d54*/      ldrb r0, [r0, r6]
/*0x3d56*/      b jump_3cfa

            data_3d58:
/*0x3d58*/  .word 0x200000d8
            data_3d5c:
/*0x3d5c*/  .word 0x2000003c
            data_3d60:
/*0x3d60*/  .word 0x20002de4
            data_3d64:
/*0x3d64*/  .word data_8d44
            data_3d68:
/*0x3d68*/  .word 0x20001cba
            data_3d6c:
/*0x3d6c*/  .word data_8b70
            data_3d70:
/*0x3d70*/  .word data_8f10
            data_3d74:
/*0x3d74*/  .word data_8f58
            data_3d78:
/*0x3d78*/  .word data_8ec8
            data_3d7c:
/*0x3d7c*/  .word 0x20002cba

            jump_3d80:
/*0x3d80*/      ldrb r0, [r1, r6]
/*0x3d82*/      b jump_3cfa
            jump_3d84:
/*0x3d84*/      ldr r0, [pc, #0x1f8] /* data_3f80 */
/*0x3d86*/      ldrb r1, [r0, #2]
/*0x3d88*/      cmp r1, #1
/*0x3d8a*/      beq jump_3d92
/*0x3d8c*/      strb.w sl, [r0, #2]
/*0x3d90*/      movs r4, #0
            jump_3d92:
/*0x3d92*/      ldr r0, [pc, #0x1f0] /* data_3f84 */
/*0x3d94*/      ldrb r0, [r0]
/*0x3d96*/      lsls r0, r0, #0x1e
/*0x3d98*/      bpl jump_3da4
/*0x3d9a*/      cmp r4, #0x29
/*0x3d9c*/      bne jump_3da4
/*0x3d9e*/      ldr r0, [pc, #0x1e0] /* data_3f80 */
/*0x3da0*/      ldrb r1, [r0, #2]
/*0x3da2*/      cbz r1, jump_3dae
            jump_3da4:
/*0x3da4*/      ldr r1, [pc, #0x1d8] /* data_3f80 */
/*0x3da6*/      ldrb r0, [r1, #2]
/*0x3da8*/      cmp r0, #1
/*0x3daa*/      beq jump_3db6
/*0x3dac*/      b jump_3e36
            jump_3dae:
/*0x3dae*/      strb.w sl, [r0, #0x22]
/*0x3db2*/      movs r4, #0x35
/*0x3db4*/      b jump_3e36
            jump_3db6:
/*0x3db6*/      ldrb r0, [r1, #3]
/*0x3db8*/      cmp r0, #1
/*0x3dba*/      beq jump_3e36
/*0x3dbc*/      ldr r0, [sp, #4]
/*0x3dbe*/      cbnz r0, jump_3e16
/*0x3dc0*/      ldr r2, [pc, #0x1c4] /* data_3f88 */
            jump_3dc2:
/*0x3dc2*/      ldrb r3, [r7, r0]
/*0x3dc4*/      cmp r3, r5
/*0x3dc6*/      bne jump_3dce
/*0x3dc8*/      ldrb r3, [r2, r0]
/*0x3dca*/      cmp r3, r6
/*0x3dcc*/      beq jump_3dd8
            jump_3dce:
/*0x3dce*/      adds r0, r0, #1
/*0x3dd0*/      uxtb r0, r0
/*0x3dd2*/      cmp r0, #0x2c
/*0x3dd4*/      blo jump_3dc2
/*0x3dd6*/      b jump_3dfa
            jump_3dd8:
/*0x3dd8*/      cmp r0, #0x2c
/*0x3dda*/      bhs jump_3dfa
/*0x3ddc*/      movs r3, #1
/*0x3dde*/      and r2, r0, #0x1f
/*0x3de2*/      lsls r3, r2
/*0x3de4*/      ldr r4, [pc, #0x198] /* data_3f80 */
/*0x3de6*/      lsrs r2, r0, #5
/*0x3de8*/      adds r4, #0xf8
/*0x3dea*/      ldr.w r5, [r4, r2, lsl #2]
/*0x3dee*/      orrs r5, r3
/*0x3df0*/      str.w r5, [r4, r2, lsl #2]
/*0x3df4*/      ldr r2, [pc, #0x190] /* data_3f88 */
/*0x3df6*/      adds r2, #0x2c
/*0x3df8*/      ldrb r4, [r2, r0]
            jump_3dfa:
/*0x3dfa*/      cmp r4, #0xc4
/*0x3dfc*/      beq jump_3ea8
/*0x3dfe*/      bgt jump_3e18
/*0x3e00*/      cmp r4, #0xc0
/*0x3e02*/      beq jump_3e26
/*0x3e04*/      cmp r4, #0xc1
/*0x3e06*/      beq jump_3e2c
/*0x3e08*/      cmp r4, #0xc2
/*0x3e0a*/      beq jump_3e4c
/*0x3e0c*/      cmp r4, #0xc3
/*0x3e0e*/      bne jump_3e36
/*0x3e10*/      b jump_3e50
            jump_3e12:
/*0x3e12*/      b jump_3ed2
            jump_3e14:
/*0x3e14*/      b jump_3f76
            jump_3e16:
/*0x3e16*/      b jump_3e36
            jump_3e18:
/*0x3e18*/      cmp r4, #0xc5
/*0x3e1a*/      beq jump_3eb4
/*0x3e1c*/      cmp r4, #0xc6
/*0x3e1e*/      beq jump_3eae
/*0x3e20*/      cmp r4, #0xe4
/*0x3e22*/      bne jump_3e36
/*0x3e24*/      b jump_3e5a
            jump_3e26:
/*0x3e26*/      strb.w sb, [r1, #0x1a]
/*0x3e2a*/      b jump_3e54
            jump_3e2c:
/*0x3e2c*/      strb.w sl, [r1, #0x1a]
/*0x3e30*/      strb.w sl, [r1, #0x19]
            jump_3e34:
/*0x3e34*/      movs r4, #0
            jump_3e36:
/*0x3e36*/      mov r0, r4
/*0x3e38*/      ldr r1, [sp, #0x18]
/*0x3e3a*/      bl function_e_32
/*0x3e3e*/      mov r0, r4
/*0x3e40*/      ldr r1, [sp, #0x18]
/*0x3e42*/      bl function_e_92
/*0x3e46*/      cmp r0, #1
/*0x3e48*/      beq jump_3eba
/*0x3e4a*/      b jump_3ebc
            jump_3e4c:
/*0x3e4c*/      movs r0, #2
/*0x3e4e*/      b jump_3e52
            jump_3e50:
/*0x3e50*/      movs r0, #3
            jump_3e52:
/*0x3e52*/      strb r0, [r1, #0x1a]
            jump_3e54:
/*0x3e54*/      strb.w sl, [r1, #0x19]
/*0x3e58*/      b jump_3e34
            jump_3e5a:
/*0x3e5a*/      ldrb r0, [r1, #0x18]
/*0x3e5c*/      cbz r0, jump_3e64
/*0x3e5e*/      ldrb.w r0, [r1, #0x20]
/*0x3e62*/      cbz r0, jump_3e82
            jump_3e64:
/*0x3e64*/      ldrb.w r0, [r1, #0x20]
/*0x3e68*/      cmp r0, #1
/*0x3e6a*/      bne jump_3e34
/*0x3e6c*/      str.w sl, [fp, #0x24]
/*0x3e70*/      add.w r1, r1, #0x24
/*0x3e74*/      ldr r0, [pc, #0x114] /* data_3f8c */
/*0x3e76*/      strb.w sl, [r1, #1]
/*0x3e7a*/      ldrh.w r0, [r0, #0x8a]
/*0x3e7e*/      strh r0, [r1, #0x20]
/*0x3e80*/      b jump_3e34
            jump_3e82:
/*0x3e82*/      strb.w sl, [r1, #0x16]
/*0x3e86*/      str.w sl, [r1, #0x5c]
/*0x3e8a*/      strb.w sl, [r1]
/*0x3e8e*/      ldr r3, [pc, #0xf0] /* data_3f80 */
/*0x3e90*/      adds r3, #0xf8
/*0x3e92*/      str.w sb, [r3]
/*0x3e96*/      str.w sb, [r3, #4]
/*0x3e9a*/      strb.w sb, [r1, #0x1b]
/*0x3e9e*/      str.w sl, [fp, #0x24]
/*0x3ea2*/      strb.w sb, [r1, #0x32]
/*0x3ea6*/      b jump_3e34
            jump_3ea8:
/*0x3ea8*/      bl function_e_90
/*0x3eac*/      b jump_3e34
            jump_3eae:
/*0x3eae*/      bl function_e_88
/*0x3eb2*/      b jump_3e34
            jump_3eb4:
/*0x3eb4*/      bl function_e_91
/*0x3eb8*/      b jump_3e34
            jump_3eba:
/*0x3eba*/      movs r4, #0
            jump_3ebc:
/*0x3ebc*/      mov r0, r4
/*0x3ebe*/      bl function_13
/*0x3ec2*/      cmp r0, #1
/*0x3ec4*/      beq jump_3ecc
/*0x3ec6*/      movs r0, #0
/*0x3ec8*/      str r0, [sp, #0xc]
/*0x3eca*/      b jump_3f76
            jump_3ecc:
/*0x3ecc*/      str.w sl, [fp, #0x10]
/*0x3ed0*/      b jump_3f76
            jump_3ed2:
/*0x3ed2*/      cmp r0, #1
/*0x3ed4*/      beq jump_3f76
/*0x3ed6*/      mov r2, r6
/*0x3ed8*/      mov r1, r5
/*0x3eda*/      mov r0, r8
/*0x3edc*/      bl function_e_12
/*0x3ee0*/      mov r4, r0
/*0x3ee2*/      cmp r0, #0xe8
/*0x3ee4*/      beq jump_3eec
/*0x3ee6*/      cmp r4, #0x29
/*0x3ee8*/      beq jump_3f06
/*0x3eea*/      b jump_3f16
            jump_3eec:
/*0x3eec*/      ldr r1, [pc, #0x90] /* data_3f80 */
/*0x3eee*/      strb.w sb, [r1, #2]
/*0x3ef2*/      strb.w sb, [r1, #4]
/*0x3ef6*/      str.w sb, [r1, #0x68]
/*0x3efa*/      str.w sb, [r1, #0x6c]
/*0x3efe*/      str.w sb, [fp, #4]
/*0x3f02*/      movs r4, #0
/*0x3f04*/      b jump_3f16
            jump_3f06:
/*0x3f06*/      ldr r0, [pc, #0x78] /* data_3f80 */
/*0x3f08*/      ldrb.w r1, [r0, #0x22]
/*0x3f0c*/      cmp r1, #1
/*0x3f0e*/      bne jump_3f16
/*0x3f10*/      strb.w sb, [r0, #0x22]
/*0x3f14*/      movs r4, #0x35
            jump_3f16:
/*0x3f16*/      ldr r0, [sp, #4]
/*0x3f18*/      cbnz r0, jump_3f58
/*0x3f1a*/      ldr r1, [pc, #0x6c] /* data_3f88 */
            jump_3f1c:
/*0x3f1c*/      ldrb r2, [r7, r0]
/*0x3f1e*/      cmp r2, r5
/*0x3f20*/      bne jump_3f28
/*0x3f22*/      ldrb r2, [r1, r0]
/*0x3f24*/      cmp r2, r6
/*0x3f26*/      beq jump_3f32
            jump_3f28:
/*0x3f28*/      adds r0, r0, #1
/*0x3f2a*/      uxtb r0, r0
/*0x3f2c*/      cmp r0, #0x2c
/*0x3f2e*/      blo jump_3f1c
/*0x3f30*/      b jump_3f58
            jump_3f32:
/*0x3f32*/      cmp r0, #0x2c
/*0x3f34*/      bhs jump_3f58
/*0x3f36*/      ldr r5, [pc, #0x48] /* data_3f80 */
/*0x3f38*/      lsrs r3, r0, #5
/*0x3f3a*/      adds r5, #0xf8
/*0x3f3c*/      and r6, r0, #0x1f
/*0x3f40*/      ldr.w r2, [r5, r3, lsl #2]
/*0x3f44*/      lsl.w r1, sl, r6
/*0x3f48*/      tst r2, r1
/*0x3f4a*/      beq jump_3f58
/*0x3f4c*/      ldr r4, [pc, #0x38] /* data_3f88 */
/*0x3f4e*/      adds r4, #0x58
/*0x3f50*/      bics r2, r1
/*0x3f52*/      ldrb r4, [r4, r0]
/*0x3f54*/      str.w r2, [r5, r3, lsl #2]
            jump_3f58:
/*0x3f58*/      mov r0, r4
/*0x3f5a*/      ldr r1, [sp, #0x18]
/*0x3f5c*/      bl function_e_32
/*0x3f60*/      mov r0, r4
/*0x3f62*/      ldr r1, [sp, #0x18]
/*0x3f64*/      bl function_e_92
/*0x3f68*/      cmp r0, #1
/*0x3f6a*/      bne jump_3f6e
/*0x3f6c*/      movs r4, #0
            jump_3f6e:
/*0x3f6e*/      mov r0, r4
/*0x3f70*/      bl function_e_23
/*0x3f74*/      b jump_3ecc
            jump_3f76:
/*0x3f76*/      ldr r0, [sp, #0xc]
/*0x3f78*/      add sp, #0x1c
/*0x3f7a*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

/*0x3f7e*/  .byte 0x00
/*0x3f7f*/  .byte 0x00

            data_3f80:
/*0x3f80*/  .word 0x20000058
            data_3f84:
/*0x3f84*/  .word 0x2000003c
            data_3f88:
/*0x3f88*/  .word data_8bb2
            data_3f8c:
/*0x3f8c*/  .word 0x20002e2c


            .thumb_func
            function_e_18:
/*0x3f90*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x3f94*/      ldr r5, [pc, #0x2b4] /* data_424c */
/*0x3f96*/      movs r1, #0x64
/*0x3f98*/      ldr.w fp, [pc, #0x2a8] /* data_4244 */
/*0x3f9c*/      movs r4, #0
/*0x3f9e*/      ldr r3, [pc, #0x2a8] /* data_4248 */
/*0x3fa0*/      mov r6, r0
/*0x3fa2*/      mov.w r8, #2
/*0x3fa6*/      mov.w sb, #0x3e8
/*0x3faa*/      movw sl, #0xffff
/*0x3fae*/      add.w r7, r5, #0x90
/*0x3fb2*/      cmp r0, #0xc
/*0x3fb4*/      bhs switch_3fdc
/*0x3fb6*/      tbb [pc, r0]

/*0x3fba*/  .byte 0x06
/*0x3fbb*/  .byte 0x57
/*0x3fbc*/  .byte 0x06
/*0x3fbd*/  .byte 0x06
/*0x3fbe*/  .byte 0xe4
/*0x3fbf*/  .byte 0xfd
/*0x3fc0*/  .byte 0xfc
/*0x3fc1*/  .byte 0x11
/*0x3fc2*/  .byte 0x11
/*0x3fc3*/  .byte 0x81
/*0x3fc4*/  .byte 0x06
/*0x3fc5*/  .byte 0x17

            switch_3fc6:
/*0x3fc6*/      bl function_e_41
/*0x3fca*/      movs r1, #0xa
/*0x3fcc*/      str.w r1, [fp, #0x28]
/*0x3fd0*/      cmp r6, #0xa
/*0x3fd2*/      beq jump_3fde
/*0x3fd4*/      cmp r6, #3
/*0x3fd6*/      beq switch_3fdc
/*0x3fd8*/      cmp r6, #2
/*0x3fda*/      beq jump_3fe2
            switch_3fdc:
/*0x3fdc*/      b jump_423a
            jump_3fde:
/*0x3fde*/      movs r1, #4
/*0x3fe0*/      b jump_4062
            jump_3fe2:
/*0x3fe2*/      str.w r8, [fp, #0x28]
/*0x3fe6*/      b jump_423a
            switch_3fe8:
/*0x3fe8*/      movs r6, #0
            jump_3fea:
/*0x3fea*/      ldr r0, [pc, #0x25c] /* data_4248 */
/*0x3fec*/      movs r5, #0
/*0x3fee*/      add.w r8, r0, r6, lsl #4
/*0x3ff2*/      ldr r0, [pc, #0x258] /* data_424c */
/*0x3ff4*/      movw r7, #0x3e9
/*0x3ff8*/      add.w sb, r0, r6, lsl #4
/*0x3ffc*/      adds r0, #0x90
/*0x3ffe*/      add.w sl, r0, r6, lsl #4
            jump_4002:
/*0x4002*/      bl rand
/*0x4006*/      sdiv r1, r0, r7
/*0x400a*/      mls r0, r7, r1, r0
/*0x400e*/      uxth r0, r0
/*0x4010*/      rsb r2, r0, r0, lsl #16
/*0x4014*/      mov.w r1, #0x3e8
/*0x4018*/      udiv r1, r2, r1
/*0x401c*/      mov.w r2, #0x1c2
/*0x4020*/      muls r1, r2, r1
/*0x4022*/      movw r2, #0xffff
/*0x4026*/      udiv r1, r1, r2
/*0x402a*/      strh.w r1, [r8, r5, lsl #1]
/*0x402e*/      strh.w r0, [sb, r5, lsl #1]
/*0x4032*/      bl rand
/*0x4036*/      sdiv r1, r0, r7
/*0x403a*/      mls r0, r7, r1, r0
/*0x403e*/      strh.w r0, [sl, r5, lsl #1]
/*0x4042*/      adds r5, r5, #1
/*0x4044*/      uxtb r5, r5
/*0x4046*/      cmp r5, #8
/*0x4048*/      blo jump_4002
/*0x404a*/      adds r6, r6, #1
/*0x404c*/      uxtb r6, r6
/*0x404e*/      cmp r6, #9
/*0x4050*/      blo jump_3fea
/*0x4052*/      ldr r1, [pc, #0x1f0] /* data_4244 */
/*0x4054*/      str.w r4, [fp, #0x2c]
/*0x4058*/      subs r1, #0x80
/*0x405a*/      strb.w r4, [r1, #0x38]
/*0x405e*/      mov.w r1, #0x7d0
            jump_4062:
/*0x4062*/      str.w r1, [fp, #0x28]
/*0x4066*/      b jump_423a
            switch_4068:
/*0x4068*/      ldr r0, [pc, #0x1d8] /* data_4244 */
/*0x406a*/      strd r8, r4, [fp, #0x28]
/*0x406e*/      subs r0, #0x80
/*0x4070*/      movs r1, #0
/*0x4072*/      strb.w r4, [r0, #0x38]
/*0x4076*/      ldrh.w r0, [r0, #0x48]
/*0x407a*/      mov.w r2, #0x1c2
/*0x407e*/      rsb r0, r0, r0, lsl #16
/*0x4082*/      udiv r0, r0, sb
/*0x4086*/      muls r0, r2, r0
/*0x4088*/      udiv r0, r0, sl
/*0x408c*/      uxth.w r8, r0
            jump_4090:
/*0x4090*/      movs r0, #0
/*0x4092*/      add.w r6, r3, r1, lsl #4
/*0x4096*/      add.w r2, r5, r1, lsl #4
/*0x409a*/      add.w ip, r7, r1, lsl #4
            jump_409e:
/*0x409e*/      strh.w r8, [r6, r0, lsl #1]
/*0x40a2*/      strh.w r4, [r2, r0, lsl #1]
/*0x40a6*/      strh.w r4, [ip, r0, lsl #1]
/*0x40aa*/      adds r0, r0, #1
/*0x40ac*/      uxtb r0, r0
/*0x40ae*/      cmp r0, #8
/*0x40b0*/      blo jump_409e
/*0x40b2*/      adds r1, r1, #1
/*0x40b4*/      uxtb r1, r1
/*0x40b6*/      cmp r1, #9
/*0x40b8*/      blo jump_4090
/*0x40ba*/      b jump_423a
            switch_40bc:
/*0x40bc*/      ldr r6, [pc, #0x18c] /* data_424c */
/*0x40be*/      mov.w r3, #0x1f4
/*0x40c2*/      subs r6, #0x3c
/*0x40c4*/      mov.w r7, #0x12c
/*0x40c8*/      strh r3, [r6]
/*0x40ca*/      strh r1, [r6, #2]
/*0x40cc*/      strh r7, [r6, #4]
/*0x40ce*/      mov.w r8, #0x2bc
/*0x40d2*/      strh.w r8, [r6, #6]
/*0x40d6*/      mov.w ip, #0x384
/*0x40da*/      add.w r4, r6, #0x28
/*0x40de*/      strh.w ip, [r6, #8]
/*0x40e2*/      movs r0, #0
/*0x40e4*/      strb r0, [r4]
/*0x40e6*/      strb r0, [r4, #1]
/*0x40e8*/      movs r2, #1
/*0x40ea*/      strb r2, [r4, #2]
/*0x40ec*/      strb r2, [r4, #3]
/*0x40ee*/      sub.w r5, r4, #0x14
/*0x40f2*/      strb r0, [r4, #4]
/*0x40f4*/      strh r3, [r5]
/*0x40f6*/      strh.w ip, [r5, #2]
/*0x40fa*/      strh.w r8, [r5, #4]
/*0x40fe*/      strh r7, [r5, #6]
/*0x4100*/      strh r1, [r5, #8]
/*0x4102*/      add.w r1, r4, #0xa
/*0x4106*/      movs r3, #0
/*0x4108*/      strb r2, [r1]
/*0x410a*/      strb r2, [r1, #1]
/*0x410c*/      strb r0, [r1, #2]
/*0x410e*/      strb r0, [r1, #3]
/*0x4110*/      strb r2, [r1, #4]
/*0x4112*/      ldr r1, [pc, #0x134] /* data_4248 */
/*0x4114*/      ldr r2, [pc, #0x138] /* data_4250 */
/*0x4116*/      mov lr, sb
/*0x4118*/      mov r6, sl
            jump_411a:
/*0x411a*/      ldr r4, [pc, #0x128] /* data_4244 */
/*0x411c*/      movs r0, #0
/*0x411e*/      ldr.w sl, [pc, #0x12c] /* data_424c */
/*0x4122*/      adds r4, #0xad
/*0x4124*/      sub.w sl, sl, #0x3c
/*0x4128*/      add.w sb, r4, r3, lsl #3
            jump_412c:
/*0x412c*/      mov.w r8, #0x1c2
/*0x4130*/      ldrb.w r4, [sb, r0]
/*0x4134*/      adds r0, r0, #1
/*0x4136*/      cmp r0, #8
/*0x4138*/      ldrh.w r7, [sl, r4, lsl #1]
/*0x413c*/      rsb ip, r7, r7, lsl #16
/*0x4140*/      udiv ip, ip, lr
/*0x4144*/      mul ip, ip, r8
/*0x4148*/      udiv ip, ip, r6
/*0x414c*/      strh ip, [r1], #2
/*0x4150*/      ldrh.w r4, [r5, r4, lsl #1]
/*0x4154*/      rsb r4, r4, r4, lsl #16
/*0x4158*/      udiv r4, r4, lr
/*0x415c*/      mul r4, r4, r8
/*0x4160*/      udiv r4, r4, r6
/*0x4164*/      strh r4, [r2], #2
/*0x4168*/      blo jump_412c
/*0x416a*/      adds r3, r3, #1
/*0x416c*/      cmp r3, #9
/*0x416e*/      blo jump_411a
/*0x4170*/      movs r0, #0
/*0x4172*/      movs r2, #1
/*0x4174*/      ldr r1, [pc, #0xcc] /* data_4244 */
/*0x4176*/      strd r2, r0, [fp, #0x28]
/*0x417a*/      subs r1, #0x80
/*0x417c*/      strb.w r0, [r1, #0x38]
/*0x4180*/      b jump_423a
            switch_4182:
/*0x4182*/      ldr.w r8, [pc, #0xc0] /* data_4244 */
/*0x4186*/      movs r1, #0
/*0x4188*/      sub.w r8, r8, #0x80
/*0x418c*/      ldrb.w r2, [r8, #6]
            jump_4190:
/*0x4190*/      movs r0, #0
            jump_4192:
/*0x4192*/      ldrb.w r6, [r8, #9]
/*0x4196*/      mov ip, r8
/*0x4198*/      cbz r6, jump_41b6
/*0x419a*/      cbz r2, jump_41b6
/*0x419c*/      ldrb.w r6, [ip, #9]
/*0x41a0*/      cmp r6, #1
/*0x41a2*/      beq jump_41ba
/*0x41a4*/      cmp r2, #1
/*0x41a6*/      beq jump_41ba
/*0x41a8*/      ldrb.w r6, [ip, #9]
/*0x41ac*/      cmp r6, #2
/*0x41ae*/      beq jump_41e2
/*0x41b0*/      b jump_4204
            switch_41b2:
/*0x41b2*/      b jump_422a
            switch_41b4:
/*0x41b4*/      b jump_4216
            jump_41b6:
/*0x41b6*/      ldr r6, [pc, #0x9c] /* data_4254 */
/*0x41b8*/      b jump_41bc
            jump_41ba:
/*0x41ba*/      ldr r6, [pc, #0x9c] /* data_4258 */
            jump_41bc:
/*0x41bc*/      add.w r6, r6, r1, lsl #5
/*0x41c0*/      ldrh.w r6, [r6, r0, lsl #2]
/*0x41c4*/      rsb ip, r6, r6, lsl #16
/*0x41c8*/      udiv r6, ip, sb
/*0x41cc*/      mov.w ip, #0x1c2
/*0x41d0*/      mul r6, r6, ip
/*0x41d4*/      udiv r6, r6, sl
/*0x41d8*/      add.w ip, r3, r1, lsl #4
/*0x41dc*/      strh.w r6, [ip, r0, lsl #1]
/*0x41e0*/      b jump_41f4
            jump_41e2:
/*0x41e2*/      add.w r6, r3, r1, lsl #4
/*0x41e6*/      strh.w r4, [r6, r0, lsl #1]
/*0x41ea*/      ldr r6, [pc, #0x64] /* data_4250 */
/*0x41ec*/      add.w r6, r6, r1, lsl #4
/*0x41f0*/      strh.w r4, [r6, r0, lsl #1]
            jump_41f4:
/*0x41f4*/      add.w r6, r5, r1, lsl #4
/*0x41f8*/      strh.w r4, [r6, r0, lsl #1]
/*0x41fc*/      add.w r6, r7, r1, lsl #4
/*0x4200*/      strh.w r4, [r6, r0, lsl #1]
            jump_4204:
/*0x4204*/      adds r0, r0, #1
/*0x4206*/      uxtb r0, r0
/*0x4208*/      cmp r0, #8
/*0x420a*/      blo jump_4192
/*0x420c*/      adds r1, r1, #1
/*0x420e*/      uxtb r1, r1
/*0x4210*/      cmp r1, #9
/*0x4212*/      blo jump_4190
/*0x4214*/      b jump_423a
            jump_4216:
/*0x4216*/      ldr r5, [pc, #0x2c] /* data_4244 */
/*0x4218*/      strd r1, r4, [fp, #0x28]
/*0x421c*/      subs r5, #0x4f
/*0x421e*/      strb r4, [r5, #7]
/*0x4220*/      bl function_e_41
/*0x4224*/      movs r0, #1
/*0x4226*/      strb r0, [r5]
/*0x4228*/      b jump_423a
            jump_422a:
/*0x422a*/      ldr r0, [pc, #0x18] /* data_4244 */
/*0x422c*/      strd r1, r4, [fp, #0x28]
/*0x4230*/      subs r0, #0x80
/*0x4232*/      strb.w r4, [r0, #0x38]
/*0x4236*/      bl function_e_41
            jump_423a:
/*0x423a*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x423e*/      b.w function_e_1

/*0x4242*/  .byte 0x00
/*0x4243*/  .byte 0x00

            data_4244:
/*0x4244*/  .word 0x200000d8
            data_4248:
/*0x4248*/  .word 0x20002e2c
            data_424c:
/*0x424c*/  .word 0x20000b9a
            data_4250:
/*0x4250*/  .word 0x20002ebc
            data_4254:
/*0x4254*/  .word 0x2000091e
            data_4258:
/*0x4258*/  .word 0x20000a3e


            .thumb_func
            function_e_19:
/*0x425c*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x4260*/      ldr.w fp, [pc, #0x378] /* data_45dc */
/*0x4264*/      movs r4, #1
/*0x4266*/      add.w r1, fp, #0x1c
/*0x426a*/      ldrb.w r2, [fp, #0x39]
/*0x426e*/      ldrh r6, [r1, #0x32]
/*0x4270*/      ldrh r5, [r1, #0x34]
/*0x4272*/      adds r0, r6, #1
/*0x4274*/      uxth.w sl, r0
/*0x4278*/      subs r0, r6, #1
/*0x427a*/      uxth r7, r0
/*0x427c*/      adds r0, r5, #1
/*0x427e*/      uxth r0, r0
/*0x4280*/      str r0, [sp]
/*0x4282*/      subs r0, r5, #1
/*0x4284*/      uxth r0, r0
/*0x4286*/      str r0, [sp, #4]
/*0x4288*/      ldrb r0, [r1, #0x1e]
/*0x428a*/      ldrb r3, [r1, #-0x15]
/*0x428e*/      subs r2, r2, #2
/*0x4290*/      movs r1, #0
/*0x4292*/      ldr.w sb, [pc, #0x34c] /* data_45e0 */
/*0x4296*/      mov.w r8, #0x3e8
/*0x429a*/      movw lr, #0xffff
/*0x429e*/      cmp r2, #0xa
/*0x42a0*/      bhs switch_4360
/*0x42a2*/      tbb [pc, r2]

/*0x42a6*/  .byte 0xc6
/*0x42a7*/  .byte 0x5e
/*0x42a8*/  .byte 0x5d
/*0x42a9*/  .byte 0xfe
/*0x42aa*/  .byte 0xfd
/*0x42ab*/  .byte 0x5d
/*0x42ac*/  .byte 0x5d
/*0x42ad*/  .byte 0x5d
/*0x42ae*/  .byte 0x05
/*0x42af*/  .byte 0xfc

            switch_42b0:
/*0x42b0*/      mov r2, fp
/*0x42b2*/      cbz r3, jump_42ba
/*0x42b4*/      cmp r3, #1
/*0x42b6*/      beq jump_42cc
/*0x42b8*/      b jump_42e0
            jump_42ba:
/*0x42ba*/      cbz r0, jump_42c0
/*0x42bc*/      cmp r0, #2
/*0x42be*/      bne jump_42e0
            jump_42c0:
/*0x42c0*/      strh.w sl, [r2, #0x4e]
/*0x42c4*/      cmp sl, r8
/*0x42c6*/      blo jump_42e0
/*0x42c8*/      strb r4, [r2, #7]
/*0x42ca*/      b jump_42e0
            jump_42cc:
/*0x42cc*/      cbz r0, jump_42d2
/*0x42ce*/      cmp r0, #2
/*0x42d0*/      bne jump_42e0
            jump_42d2:
/*0x42d2*/      strh.w r7, [r2, #0x4e]
/*0x42d6*/      cbnz r7, jump_42e0
/*0x42d8*/      strb r1, [r2, #7]
/*0x42da*/      cbnz r0, jump_42e0
/*0x42dc*/      strb.w r4, [r2, #0x3a]
            jump_42e0:
/*0x42e0*/      ldrb r0, [r2, #8]
/*0x42e2*/      cbz r0, jump_42ea
/*0x42e4*/      cmp r0, #1
/*0x42e6*/      beq jump_4304
/*0x42e8*/      b jump_432a
            jump_42ea:
/*0x42ea*/      ldrb.w r0, [r2, #0x3a]
/*0x42ee*/      cmp r0, #1
/*0x42f0*/      beq jump_42f6
/*0x42f2*/      cmp r0, #2
/*0x42f4*/      bne jump_432a
            jump_42f6:
/*0x42f6*/      ldr r0, [sp]
/*0x42f8*/      strh.w r0, [r2, #0x50]
/*0x42fc*/      cmp r0, r8
/*0x42fe*/      blo jump_432a
/*0x4300*/      strb r4, [r2, #8]
/*0x4302*/      b jump_432a
            jump_4304:
/*0x4304*/      ldrb.w r0, [r2, #0x3a]
/*0x4308*/      cmp r0, #1
/*0x430a*/      beq jump_4310
/*0x430c*/      cmp r0, #2
/*0x430e*/      bne jump_432a
            jump_4310:
/*0x4310*/      ldr r3, [sp, #4]
/*0x4312*/      strh.w r3, [r2, #0x50]
/*0x4316*/      cbnz r3, jump_432a
/*0x4318*/      strb r1, [r2, #8]
/*0x431a*/      adds r0, r0, #1
/*0x431c*/      movs r1, #3
/*0x431e*/      udiv r3, r0, r1
/*0x4322*/      mls r0, r1, r3, r0
/*0x4326*/      strb.w r0, [r2, #0x3a]
            jump_432a:
/*0x432a*/      ldrh.w r0, [fp, #0x4e]
/*0x432e*/      movs r1, #0
/*0x4330*/      rsb r0, r0, r0, lsl #16
/*0x4334*/      udiv r0, r0, r8
/*0x4338*/      mov.w r2, #0x1c2
/*0x433c*/      muls r0, r2, r0
/*0x433e*/      udiv r0, r0, lr
/*0x4342*/      uxth r2, r0
/*0x4344*/      mov r4, sb
            jump_4346:
/*0x4346*/      movs r0, #0
/*0x4348*/      add.w r3, r4, r1, lsl #4
            jump_434c:
/*0x434c*/      strh.w r2, [r3, r0, lsl #1]
/*0x4350*/      adds r0, r0, #1
/*0x4352*/      uxtb r0, r0
/*0x4354*/      cmp r0, #8
/*0x4356*/      blo jump_434c
/*0x4358*/      adds r1, r1, #1
/*0x435a*/      uxtb r1, r1
/*0x435c*/      cmp r1, #9
/*0x435e*/      blo jump_4346
            switch_4360:
/*0x4360*/      b jump_45ac
            switch_4362:
/*0x4362*/      mov r2, fp
/*0x4364*/      mov.w ip, #2
/*0x4368*/      mov.w fp, #0x1f4
/*0x436c*/      cmp r0, #6
/*0x436e*/      bhs switch_43b6
/*0x4370*/      tbb [pc, r0]

/*0x4374*/  .byte 0x03
/*0x4375*/  .byte 0x09
/*0x4376*/  .byte 0x21
/*0x4377*/  .byte 0x0f
/*0x4378*/  .byte 0x18
/*0x4379*/  .byte 0x1f

            switch_437a:
/*0x437a*/      strb r1, [r2, #7]
/*0x437c*/      strb.w ip, [r2, #8]
/*0x4380*/      strb.w r4, [r2, #0x3a]
/*0x4384*/      b jump_43c4
            switch_4386:
/*0x4386*/      cmp r6, fp
/*0x4388*/      bne switch_43b6
/*0x438a*/      strb r1, [r2, #8]
/*0x438c*/      strb.w ip, [r2, #0x3a]
/*0x4390*/      b switch_43b6
            switch_4392:
/*0x4392*/      cmp r5, #1
/*0x4394*/      bne switch_43b6
/*0x4396*/      strb.w ip, [r2, #7]
/*0x439a*/      strb r1, [r2, #8]
/*0x439c*/      movs r0, #4
/*0x439e*/      strb.w r0, [r2, #0x3a]
/*0x43a2*/      b jump_43e2
            switch_43a4:
/*0x43a4*/      cmp r5, fp
/*0x43a6*/      bne switch_43b6
/*0x43a8*/      strb r1, [r2, #7]
/*0x43aa*/      movs r0, #5
/*0x43ac*/      strb.w r0, [r2, #0x3a]
/*0x43b0*/      b jump_43c4
            switch_43b2:
/*0x43b2*/      cmp r6, #1
/*0x43b4*/      beq jump_43be
            switch_43b6:
/*0x43b6*/      cbz r3, jump_43c4
/*0x43b8*/      cmp r3, #1
/*0x43ba*/      beq jump_43d0
/*0x43bc*/      b jump_43d8
            jump_43be:
/*0x43be*/      strb r1, [r2, #7]
/*0x43c0*/      strb.w r1, [r2, #0x3a]
            jump_43c4:
/*0x43c4*/      strh.w sl, [r2, #0x4e]
/*0x43c8*/      cmp sl, r8
/*0x43ca*/      blo jump_43d8
/*0x43cc*/      strb r4, [r2, #7]
/*0x43ce*/      b jump_43d8
            jump_43d0:
/*0x43d0*/      strh.w r7, [r2, #0x4e]
/*0x43d4*/      cbnz r7, jump_43d8
/*0x43d6*/      strb r1, [r2, #7]
            jump_43d8:
/*0x43d8*/      ldrb r0, [r2, #8]
/*0x43da*/      cbz r0, jump_43e2
/*0x43dc*/      cmp r0, #1
/*0x43de*/      beq jump_43f0
/*0x43e0*/      b jump_43fa
            jump_43e2:
/*0x43e2*/      ldr r0, [sp]
/*0x43e4*/      strh.w r0, [r2, #0x50]
/*0x43e8*/      cmp r0, r8
/*0x43ea*/      blo jump_43fa
/*0x43ec*/      strb r4, [r2, #8]
/*0x43ee*/      b jump_43fa
            jump_43f0:
/*0x43f0*/      ldr r0, [sp, #4]
/*0x43f2*/      strh.w r0, [r2, #0x50]
/*0x43f6*/      cbnz r0, jump_43fa
/*0x43f8*/      strb r1, [r2, #8]
            jump_43fa:
/*0x43fa*/      ldrh.w r0, [r2, #0x4e]
/*0x43fe*/      movs r1, #0
/*0x4400*/      rsb r0, r0, r0, lsl #16
/*0x4404*/      udiv r0, r0, r8
/*0x4408*/      mov.w r2, #0x1c2
/*0x440c*/      muls r0, r2, r0
/*0x440e*/      udiv r0, r0, lr
/*0x4412*/      uxth r2, r0
/*0x4414*/      mov r4, sb
            jump_4416:
/*0x4416*/      movs r0, #0
/*0x4418*/      add.w r3, r4, r1, lsl #4
            jump_441c:
/*0x441c*/      strh.w r2, [r3, r0, lsl #1]
/*0x4420*/      adds r0, r0, #1
/*0x4422*/      uxtb r0, r0
/*0x4424*/      cmp r0, #8
/*0x4426*/      blo jump_441c
/*0x4428*/      adds r1, r1, #1
/*0x442a*/      uxtb r1, r1
/*0x442c*/      cmp r1, #9
/*0x442e*/      blo jump_4416
/*0x4430*/      b jump_45ac
            switch_4432:
/*0x4432*/      movs r1, #0
            jump_4434:
/*0x4434*/      ldr r0, [pc, #0x1ac] /* data_45e4 */
/*0x4436*/      ldr r2, [pc, #0x1b0] /* data_45e8 */
/*0x4438*/      add r0, r1
/*0x443a*/      movs r3, #1
/*0x443c*/      ldrb.w sl, [r0, #0x14]
/*0x4440*/      movs r0, #0
/*0x4442*/      add.w r4, r2, r1, lsl #4
/*0x4446*/      adds r2, #0x90
/*0x4448*/      add.w r5, r2, r1, lsl #4
            jump_444c:
/*0x444c*/      tst.w sl, r3
/*0x4450*/      beq jump_44ba
/*0x4452*/      ldrsh.w r2, [r4, r0, lsl #1]
/*0x4456*/      ldrsh.w ip, [r5, r0, lsl #1]
/*0x445a*/      cmp r2, #0
/*0x445c*/      ble jump_4486
/*0x445e*/      subs r2, r2, #1
/*0x4460*/      sxth r2, r2
/*0x4462*/      cmp r2, #0
/*0x4464*/      bge jump_4468
/*0x4466*/      movs r2, #0
            jump_4468:
/*0x4468*/      rsb r6, r2, r2, lsl #16
/*0x446c*/      udiv r6, r6, r8
/*0x4470*/      mov.w r7, #0x1c2
/*0x4474*/      muls r6, r7, r6
/*0x4476*/      udiv r6, r6, lr
/*0x447a*/      add.w r7, sb, r1, lsl #4
/*0x447e*/      strh.w r6, [r7, r0, lsl #1]
/*0x4482*/      strh.w r2, [r4, r0, lsl #1]
            jump_4486:
/*0x4486*/      cmp.w ip, #0
/*0x448a*/      ble jump_449c
/*0x448c*/      sub.w r2, ip, #1
/*0x4490*/      sxth r2, r2
/*0x4492*/      cmp r2, #0
/*0x4494*/      bge jump_4498
/*0x4496*/      movs r2, #0
            jump_4498:
/*0x4498*/      strh.w r2, [r5, r0, lsl #1]
            jump_449c:
/*0x449c*/      b jump_44a4
            switch_449e:
/*0x449e*/      b jump_44d0
            switch_44a0:
/*0x44a0*/      b jump_457e
            switch_44a2:
/*0x44a2*/      b jump_451c
            jump_44a4:
/*0x44a4*/      lsls r2, r3, #0x19
/*0x44a6*/      adds r0, r0, #1
/*0x44a8*/      lsrs r3, r2, #0x18
/*0x44aa*/      uxtb r0, r0
/*0x44ac*/      cmp r0, #8
/*0x44ae*/      blo jump_444c
/*0x44b0*/      adds r1, r1, #1
/*0x44b2*/      uxtb r1, r1
/*0x44b4*/      cmp r1, #9
/*0x44b6*/      blo jump_4434
/*0x44b8*/      b jump_45ac
            jump_44ba:
/*0x44ba*/      add.w r6, sb, r1, lsl #4
/*0x44be*/      mov.w r2, #0x1c2
/*0x44c2*/      strh.w r2, [r6, r0, lsl #1]
/*0x44c6*/      strh.w r8, [r4, r0, lsl #1]
/*0x44ca*/      ldrh.w r2, [fp, #0x4a]
/*0x44ce*/      b jump_4498
            jump_44d0:
/*0x44d0*/      movs r5, #0
/*0x44d2*/      mov r7, lr
/*0x44d4*/      movw fp, #0x3e9
/*0x44d8*/      mov sl, sb
            jump_44da:
/*0x44da*/      movs r4, #0
/*0x44dc*/      mov sb, fp
/*0x44de*/      add.w r6, sl, r5, lsl #4
            jump_44e2:
/*0x44e2*/      bl rand
/*0x44e6*/      sdiv r2, r0, sb
/*0x44ea*/      mls r0, sb, r2, r0
/*0x44ee*/      uxth r0, r0
/*0x44f0*/      rsb r0, r0, r0, lsl #16
/*0x44f4*/      udiv r0, r0, r8
/*0x44f8*/      mov.w r1, #0x1c2
/*0x44fc*/      muls r0, r1, r0
/*0x44fe*/      udiv r0, r0, r7
/*0x4502*/      strh.w r0, [r6, r4, lsl #1]
/*0x4506*/      bl rand
/*0x450a*/      adds r4, r4, #1
/*0x450c*/      uxtb r4, r4
/*0x450e*/      cmp r4, #8
/*0x4510*/      blo jump_44e2
/*0x4512*/      adds r5, r5, #1
/*0x4514*/      uxtb r5, r5
/*0x4516*/      cmp r5, #9
/*0x4518*/      blo jump_44da
/*0x451a*/      b jump_45ac
            jump_451c:
/*0x451c*/      bl function_e_41
/*0x4520*/      ldr.w sl, [pc, #0xc8] /* data_45ec */
/*0x4524*/      ldrb.w r2, [fp, #0x31]
/*0x4528*/      movs r1, #0
/*0x452a*/      mov r8, fp
/*0x452c*/      mov.w r3, #0x1c2
/*0x4530*/      mov ip, sb
            jump_4532:
/*0x4532*/      movs r0, #0
/*0x4534*/      add.w r6, sl, r1, lsl #3
/*0x4538*/      add.w r5, ip, r1, lsl #4
            jump_453c:
/*0x453c*/      ldrb r7, [r6, r0]
/*0x453e*/      cmp r7, r2
/*0x4540*/      bne jump_4546
/*0x4542*/      strh.w r3, [r5, r0, lsl #1]
            jump_4546:
/*0x4546*/      adds r0, r0, #1
/*0x4548*/      uxtb r0, r0
/*0x454a*/      cmp r0, #8
/*0x454c*/      blo jump_453c
/*0x454e*/      adds r1, r1, #1
/*0x4550*/      uxtb r1, r1
/*0x4552*/      cmp r1, #9
/*0x4554*/      blo jump_4532
/*0x4556*/      ldr r0, [pc, #0x98] /* data_45f0 */
/*0x4558*/      cmp r2, #0x3a
/*0x455a*/      beq jump_4562
/*0x455c*/      cmp r2, #0x3d
/*0x455e*/      beq jump_4568
/*0x4560*/      b jump_456c
            jump_4562:
/*0x4562*/      strh.w r3, [r0, #0x72]
/*0x4566*/      b jump_456c
            jump_4568:
/*0x4568*/      strh.w r3, [r0, #0x84]
            jump_456c:
/*0x456c*/      adds r2, r2, #1
/*0x456e*/      uxtb r0, r2
/*0x4570*/      strb.w r0, [r8, #0x31]
/*0x4574*/      cmp r0, #0x41
/*0x4576*/      bls jump_45ac
/*0x4578*/      strb.w r4, [fp, #0x31]
/*0x457c*/      b jump_45ac
            jump_457e:
/*0x457e*/      ldrb.w r2, [fp, #0x1d]
/*0x4582*/      mov r0, fp
/*0x4584*/      cmp r2, #1
/*0x4586*/      beq jump_45b4
/*0x4588*/      strh.w r1, [sb, #2]
            jump_458c:
/*0x458c*/      ldrb r2, [r0, #0x1e]
/*0x458e*/      cmp r2, #1
/*0x4590*/      beq jump_45be
/*0x4592*/      strh.w r1, [sb, #4]
            jump_4596:
/*0x4596*/      ldrb r2, [r0, #0x1f]
/*0x4598*/      cmp r2, #1
/*0x459a*/      beq jump_45c8
/*0x459c*/      strh.w r1, [sb, #6]
            jump_45a0:
/*0x45a0*/      ldrb.w r0, [fp, #0x20]
/*0x45a4*/      cmp r0, #1
/*0x45a6*/      beq jump_45d2
/*0x45a8*/      strh.w r1, [sb, #8]
            jump_45ac:
/*0x45ac*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x45b0*/      b.w function_e_1
            jump_45b4:
/*0x45b4*/      mov.w r2, #0x1c2
/*0x45b8*/      strh.w r2, [sb, #2]
/*0x45bc*/      b jump_458c
            jump_45be:
/*0x45be*/      mov.w r3, #0x1c2
/*0x45c2*/      strh.w r3, [sb, #4]
/*0x45c6*/      b jump_4596
            jump_45c8:
/*0x45c8*/      mov.w r2, #0x1c2
/*0x45cc*/      strh.w r2, [sb, #6]
/*0x45d0*/      b jump_45a0
            jump_45d2:
/*0x45d2*/      mov.w r0, #0x1c2
/*0x45d6*/      strh.w r0, [sb, #8]
/*0x45da*/      b jump_45ac

            data_45dc:
/*0x45dc*/  .word 0x20000058
            data_45e0:
/*0x45e0*/  .word 0x20002e2c
            data_45e4:
/*0x45e4*/  .word 0x20002de4
            data_45e8:
/*0x45e8*/  .word 0x20000b9a
            data_45ec:
/*0x45ec*/  .word data_8e80
            data_45f0:
/*0x45f0*/  .word 0x20002ebc


            .thumb_func
            call_45f4:
/*0x45f4*/      push {r4, lr}
/*0x45f6*/      ldr r1, [pc, #0x1c] /* data_4614 */
/*0x45f8*/      cbz r0, jump_4606
/*0x45fa*/      movs r0, #1
/*0x45fc*/      strb r0, [r1, #5]
/*0x45fe*/      bl function_e_1
/*0x4602*/      movs r0, #1
/*0x4604*/      pop {r4, pc}
            jump_4606:
/*0x4606*/      movs r0, #0
/*0x4608*/      strb r0, [r1, #5]
/*0x460a*/      bl function_e_1
/*0x460e*/      movs r0, #0
/*0x4610*/      pop {r4, pc}

/*0x4612*/  .byte 0x00
/*0x4613*/  .byte 0x00

            data_4614:
/*0x4614*/  .word 0x20000058


            .thumb_func
            nop_3:
/*0x4618*/      bx lr

            .thumb_func
            nop_2:
/*0x461a*/      bx lr

            .thumb_func
            function_37:
/*0x461c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4620*/      mov r4, r0
/*0x4622*/      bl nop_1
/*0x4626*/      mov r0, r4
/*0x4628*/      bl jump_2
/*0x462c*/      mov r0, r4
/*0x462e*/      bl function_e_49
/*0x4632*/      mov.w r1, #0x100
/*0x4636*/      ldr r0, [pc, #0x84] /* data_46bc */
/*0x4638*/      lsls r5, r1, #4
/*0x463a*/      ldr r6, [pc, #0x84] /* data_46c0 */
/*0x463c*/      lsls r7, r1, #5
/*0x463e*/      cbz r4, jump_468a
/*0x4640*/      movs r2, #0
/*0x4642*/      mov r8, r1
/*0x4644*/      mov r4, r0
/*0x4646*/      bl gpio_set_open_drain
/*0x464a*/      movs r2, #1
/*0x464c*/      mov r1, r8
/*0x464e*/      mov r0, r4
/*0x4650*/      bl gpio_set_output_current
/*0x4654*/      movs r2, #1
/*0x4656*/      mov r1, r8
/*0x4658*/      mov r0, r4
/*0x465a*/      bl gpio_set_input_output
/*0x465e*/      movs r2, #1
/*0x4660*/      mov r1, r8
/*0x4662*/      mov r0, r4
/*0x4664*/      bl gpio_set_reset_pin
/*0x4668*/      movs r2, #0
/*0x466a*/      mov r1, r5
/*0x466c*/      mov r0, r6
/*0x466e*/      bl gpio_set_input_enable
/*0x4672*/      movs r2, #0
/*0x4674*/      mov r1, r7
/*0x4676*/      mov r0, r6
/*0x4678*/      bl gpio_set_input_enable
/*0x467c*/      movs r2, #2
/*0x467e*/      mov r1, r5
/*0x4680*/      mov r0, r6
/*0x4682*/      bl gpio_set_pin_pull_up_down
/*0x4686*/      movs r2, #2
/*0x4688*/      b jump_46b0
            jump_468a:
/*0x468a*/      movs r2, #1
/*0x468c*/      bl gpio_set_open_drain
/*0x4690*/      movs r2, #1
/*0x4692*/      mov r1, r5
/*0x4694*/      mov r0, r6
/*0x4696*/      bl gpio_set_input_enable
/*0x469a*/      movs r2, #1
/*0x469c*/      mov r1, r7
/*0x469e*/      mov r0, r6
/*0x46a0*/      bl gpio_set_input_enable
/*0x46a4*/      movs r2, #0
/*0x46a6*/      mov r1, r5
/*0x46a8*/      mov r0, r6
/*0x46aa*/      bl gpio_set_pin_pull_up_down
/*0x46ae*/      movs r2, #0
            jump_46b0:
/*0x46b0*/      mov r1, r7
/*0x46b2*/      mov r0, r6
/*0x46b4*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x46b8*/      b.w gpio_set_pin_pull_up_down

            data_46bc:
/*0x46bc*/  .word 0x400b4000
            data_46c0:
/*0x46c0*/  .word 0x400b0000


            .thumb_func
            function_e_21:
/*0x46c4*/      push {r4, r5, r6, lr}
/*0x46c6*/      ldr r4, [pc, #0xcc] /* data_4794 */
/*0x46c8*/      movs r5, #0
/*0x46ca*/      ldrb.w r0, [r4, #0x30]
/*0x46ce*/      cbz r0, jump_4708
/*0x46d0*/      ldrb.w r0, [r4, #0x38]
/*0x46d4*/      cbz r0, jump_46de
/*0x46d6*/      bl function_e_19
/*0x46da*/      strb.w r5, [r4, #0x38]
            jump_46de:
/*0x46de*/      ldr r0, [pc, #0xb4] /* data_4794 */
/*0x46e0*/      adds r0, #0x80
/*0x46e2*/      ldr r1, [r0, #8]
/*0x46e4*/      movw r2, #0x1770
/*0x46e8*/      cmp r1, r2
/*0x46ea*/      bls jump_4700
/*0x46ec*/      ldrb.w r1, [r4, #0x30]
/*0x46f0*/      cmp r1, #1
/*0x46f2*/      bne jump_4700
/*0x46f4*/      movs r1, #2
/*0x46f6*/      strb.w r1, [r4, #0x30]
/*0x46fa*/      str r5, [r0, #8]
/*0x46fc*/      bl function_e_15
            jump_4700:
/*0x4700*/      pop.w {r4, r5, r6, lr}
/*0x4704*/      b.w function_e_46
            jump_4708:
/*0x4708*/      ldrb r0, [r4, #0xa]
/*0x470a*/      cmp r0, #0x63
/*0x470c*/      beq jump_4712
/*0x470e*/      bl function_e_26
            jump_4712:
/*0x4712*/      ldrb r0, [r4, #0xa]
/*0x4714*/      cmp r0, #0x63
/*0x4716*/      bne jump_4730
/*0x4718*/      ldrb r0, [r4, #0x11]
/*0x471a*/      cmp r0, #0x63
/*0x471c*/      bne jump_4730
/*0x471e*/      ldrb r0, [r4, #0xc]
/*0x4720*/      cbnz r0, jump_4734
/*0x4722*/      ldrb r0, [r4, #0x16]
/*0x4724*/      cbnz r0, jump_473c
/*0x4726*/      ldrb.w r0, [r4, #0x29]
/*0x472a*/      cbnz r0, jump_473c
/*0x472c*/      bl function_e_46
            jump_4730:
/*0x4730*/      ldrb r0, [r4, #0xc]
/*0x4732*/      cbz r0, jump_473c
            jump_4734:
/*0x4734*/      ldrb r0, [r4, #0x16]
/*0x4736*/      cbnz r0, jump_473c
/*0x4738*/      bl function_e_7
            jump_473c:
/*0x473c*/      bl function_e_87
/*0x4740*/      ldrb r0, [r4, #0x16]
/*0x4742*/      cmp r0, #1
/*0x4744*/      bne jump_474a
/*0x4746*/      bl function_e_43
            jump_474a:
/*0x474a*/      ldrb r0, [r4, #0x1b]
/*0x474c*/      cmp r0, #1
/*0x474e*/      beq jump_4756
/*0x4750*/      ldrb r0, [r4, #0x1c]
/*0x4752*/      cmp r0, #3
/*0x4754*/      bne jump_475a
            jump_4756:
/*0x4756*/      bl function_e_86
            jump_475a:
/*0x475a*/      ldrb.w r0, [r4, #0x20]
/*0x475e*/      cmp r0, #1
/*0x4760*/      bne jump_476c
/*0x4762*/      ldrb r0, [r4, #0x18]
/*0x4764*/      cbz r0, jump_476c
/*0x4766*/      bl function_e_14
/*0x476a*/      b jump_4780
            jump_476c:
/*0x476c*/      ldrb.w r0, [r4, #0x29]
/*0x4770*/      cmp r0, #0x14
/*0x4772*/      bne jump_4780
/*0x4774*/      strb.w r5, [r4, #0x29]
/*0x4778*/      ldrb.w r0, [r4, #0x39]
/*0x477c*/      bl function_e_18
            jump_4780:
/*0x4780*/      ldrb.w r0, [r4, #0x38]
/*0x4784*/      cmp r0, #0
/*0x4786*/      beq jump_4790
/*0x4788*/      bl function_e_19
/*0x478c*/      strb.w r5, [r4, #0x38]
            jump_4790:
/*0x4790*/      pop {r4, r5, r6, pc}

/*0x4792*/  .byte 0x00
/*0x4793*/  .byte 0x00

            data_4794:
/*0x4794*/  .word 0x20000058


            .thumb_func
            function_e_22:
/*0x4798*/      ldr r1, [pc, #0x1c] /* data_47b8 */
/*0x479a*/      movw r2, #0xe878
/*0x479e*/      cbz r0, jump_47ae
/*0x47a0*/      ldr r0, [r1, #0x54]
/*0x47a2*/      orrs r0, r2
/*0x47a4*/      str r0, [r1, #0x54]
/*0x47a6*/      str r2, [r1, #0x58]
/*0x47a8*/      ldr r0, [r1, #0x50]
/*0x47aa*/      orrs r0, r2
/*0x47ac*/      b jump_47b2
            jump_47ae:
/*0x47ae*/      ldr r0, [r1, #0x50]
/*0x47b0*/      bics r0, r2
            jump_47b2:
/*0x47b2*/      str r0, [r1, #0x50]
/*0x47b4*/      bx lr

/*0x47b6*/  .byte 0x00
/*0x47b7*/  .byte 0x00

            data_47b8:
/*0x47b8*/  .word 0x40024000


            .thumb_func
            function_e_23:
/*0x47bc*/      push {r4, lr}
/*0x47be*/      movs r1, #0xe
/*0x47c0*/      movs r3, #1
/*0x47c2*/      ldr r2, [pc, #0x54] /* data_4818 */
/*0x47c4*/      cmp.w r1, r0, lsr #4
/*0x47c8*/      bne jump_47dc
/*0x47ca*/      and r0, r0, #0xf
/*0x47ce*/      cmp r0, #8
/*0x47d0*/      bhs jump_47da
/*0x47d2*/      ldrb r1, [r2]
/*0x47d4*/      lsls r3, r0
/*0x47d6*/      bics r1, r3
/*0x47d8*/      strb r1, [r2]
            jump_47da:
/*0x47da*/      pop {r4, pc}
            jump_47dc:
/*0x47dc*/      cmp r0, #0x91
/*0x47de*/      bhi jump_47da
/*0x47e0*/      movs r1, #0
            jump_47e2:
/*0x47e2*/      adds r4, r2, r1
/*0x47e4*/      ldrb r4, [r4, #2]
/*0x47e6*/      cmp r4, r0
/*0x47e8*/      bne jump_47f2
/*0x47ea*/      add r2, r1
/*0x47ec*/      movs r4, #0
/*0x47ee*/      strb r4, [r2, #2]
/*0x47f0*/      b jump_47fa
            jump_47f2:
/*0x47f2*/      adds r1, r1, #1
/*0x47f4*/      uxtb r1, r1
/*0x47f6*/      cmp r1, #6
/*0x47f8*/      blo jump_47e2
            jump_47fa:
/*0x47fa*/      cmp r1, #6
/*0x47fc*/      bne jump_47da
/*0x47fe*/      lsrs r2, r0, #3
/*0x4800*/      and r1, r0, #7
/*0x4804*/      ldr r0, [pc, #0x14] /* data_481c */
/*0x4806*/      mov r4, r3
/*0x4808*/      add r0, r2
/*0x480a*/      lsls r3, r1
/*0x480c*/      ldrb r2, [r0, #2]
/*0x480e*/      bics r2, r3
/*0x4810*/      strb r2, [r0, #2]
/*0x4812*/      ldr r0, [pc, #0xc] /* data_4820 */
/*0x4814*/      str r4, [r0, #0x14]
/*0x4816*/      pop {r4, pc}

            data_4818:
/*0x4818*/  .word 0x2000003c
            data_481c:
/*0x481c*/  .word 0x2000032c
            data_4820:
/*0x4820*/  .word 0x200000d8


            .thumb_func
            call_4824:
/*0x4824*/      push {r4, lr}
/*0x4826*/      movs r1, #1
/*0x4828*/      lsls r0, r1, #0x10
/*0x482a*/      bl ckcu_apb1_clock_enable
/*0x482e*/      ldr r4, [pc, #0x28] /* data_4858 */
/*0x4830*/      movw r1, #0x8c9f
/*0x4834*/      mov r0, r4
/*0x4836*/      bl function_47
/*0x483a*/      movs r1, #1
/*0x483c*/      mov r0, r4
/*0x483e*/      bl function_46
/*0x4842*/      ldr r2, [pc, #0x18] /* data_485c */
/*0x4844*/      asrs r1, r4, #0x15
/*0x4846*/      str r1, [r2]
/*0x4848*/      mov r0, r4
/*0x484a*/      pop.w {r4, lr}
/*0x484e*/      mov.w r1, #1
/*0x4852*/      b.w function_45

/*0x4856*/  .byte 0x00
/*0x4857*/  .byte 0x00

            data_4858:
/*0x4858*/  .word 0x40076000
            data_485c:
/*0x485c*/  .word 0xe000e104


            .thumb_func
            function_e_25:
/*0x4860*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4864*/      ldr r5, [pc, #0xe4] /* data_494c */
/*0x4866*/      ldr r6, [pc, #0xe0] /* data_4948 */
/*0x4868*/      ldr r4, [pc, #0xe4] /* data_4950 */
/*0x486a*/      ldrb r1, [r5, #-0x8]
/*0x486e*/      ldr.w r2, [r6, r1, lsl #2]
/*0x4872*/      sub.w r1, r6, #0x9c
/*0x4876*/      ldr.w r0, [r1, r0, lsl #2]
/*0x487a*/      adds r1, r2, r0
/*0x487c*/      adds r0, r2, r4
/*0x487e*/      mov.w r2, #0x3f0
/*0x4882*/      bl spi_flash_read_data
/*0x4886*/      ldrb r0, [r5, #-0x8]
/*0x488a*/      ldr.w ip, [pc, #0xc8] /* data_4954 */
/*0x488e*/      ldr.w r0, [r6, r0, lsl #2]
/*0x4892*/      add.w lr, ip, #0x120
/*0x4896*/      ldrb r1, [r4, r0]
/*0x4898*/      strb r1, [r5, #0x19]
/*0x489a*/      adds r1, r4, #1
/*0x489c*/      ldrb r2, [r0, r1]
/*0x489e*/      adds r1, r1, #1
/*0x48a0*/      ldrb r1, [r0, r1]
/*0x48a2*/      add.w r1, r2, r1, lsl #8
/*0x48a6*/      strh r1, [r5, #0x26]
/*0x48a8*/      adds r1, r4, #3
/*0x48aa*/      ldrb r2, [r0, r1]
/*0x48ac*/      adds r1, r1, #1
/*0x48ae*/      ldrb r1, [r0, r1]
/*0x48b0*/      add.w r1, r2, r1, lsl #8
/*0x48b4*/      strh r1, [r5, #0x28]
/*0x48b6*/      adds r1, r4, #5
/*0x48b8*/      ldrb r2, [r0, r1]
/*0x48ba*/      adds r1, r1, #1
/*0x48bc*/      ldrb r1, [r0, r1]
/*0x48be*/      add.w r1, r2, r1, lsl #8
/*0x48c2*/      strh r1, [r5, #0x2a]
/*0x48c4*/      adds r1, r4, #7
/*0x48c6*/      ldrb r2, [r0, r1]
/*0x48c8*/      adds r1, r1, #1
/*0x48ca*/      ldrb r1, [r0, r1]
/*0x48cc*/      add.w r1, r2, r1, lsl #8
/*0x48d0*/      strh r1, [r5, #0x2c]
/*0x48d2*/      add.w r1, r4, #9
/*0x48d6*/      movs r2, #0
/*0x48d8*/      ldrb r1, [r0, r1]
/*0x48da*/      strb r1, [r5, #-0x1a]
/*0x48de*/      add.w r1, r4, #0xa
/*0x48e2*/      adds r3, r0, r4
/*0x48e4*/      ldrb r1, [r0, r1]
/*0x48e6*/      strb r1, [r5, #0x1d]
/*0x48e8*/      add.w r1, r4, #0xb
/*0x48ec*/      ldrb r1, [r0, r1]
/*0x48ee*/      strb r1, [r5, #0x1e]
            jump_48f0:
/*0x48f0*/      movs r0, #0
/*0x48f2*/      add.w r4, lr, r2, lsl #5
/*0x48f6*/      add.w r5, ip, r2, lsl #5
            jump_48fa:
/*0x48fa*/      add.w r1, r0, r2, lsl #3
/*0x48fe*/      lsls r1, r1, #2
/*0x4900*/      add.w r6, r1, #0xc
/*0x4904*/      add r6, r3
/*0x4906*/      add.w r7, r5, r0, lsl #2
/*0x490a*/      ldrh r6, [r6]
/*0x490c*/      strh.w r6, [r5, r0, lsl #2]
/*0x4910*/      add.w r6, r1, #0xe
/*0x4914*/      add r6, r3
/*0x4916*/      ldrh r6, [r6]
/*0x4918*/      strh r6, [r7, #2]
/*0x491a*/      addw r6, r1, #0x12d
/*0x491e*/      add r6, r3
/*0x4920*/      addw r1, r1, #0x12f

            .thumb_func
            function_e_24:
/*0x4924*/      ldrh r6, [r6]
/*0x4926*/      strh.w r6, [r4, r0, lsl #2]
/*0x492a*/      add.w r6, r4, r0, lsl #2
/*0x492e*/      add r1, r3
/*0x4930*/      adds r0, r0, #1
/*0x4932*/      ldrh r1, [r1]
/*0x4934*/      uxtb r0, r0
/*0x4936*/      strh r1, [r6, #2]
/*0x4938*/      cmp r0, #8
/*0x493a*/      blo jump_48fa
/*0x493c*/      adds r2, r2, #1
/*0x493e*/      uxtb r2, r2
/*0x4940*/      cmp r2, #9
/*0x4942*/      blo jump_48f0
/*0x4944*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_4948:
/*0x4948*/  .word data_8de0
            data_494c:
/*0x494c*/  .word 0x20000078
            data_4950:
/*0x4950*/  .word 0x20001cba
            data_4954:
/*0x4954*/  .word 0x2000091e


            .thumb_func
            function_e_26:
/*0x4958*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x495c*/      ldr r7, [pc, #0x2c4] /* data_4c24 */
/*0x495e*/      ldrb r0, [r7, #0xa]
/*0x4960*/      cmp r0, #5
/*0x4962*/      bhs jump_4a5e
/*0x4964*/      tbb [pc, r0]

/*0x4968*/  .byte 0x03
/*0x4969*/  .byte 0x03
/*0x496a*/  .byte 0x03
/*0x496b*/  .byte 0x03
/*0x496c*/  .byte 0xfe
/*0x496d*/  .byte 0x00

            switch_496e:
/*0x496e*/      ldr r0, [pc, #0x2b8] /* data_4c28 */
/*0x4970*/      movs r5, #0
/*0x4972*/      ldrb r1, [r0, #8]
/*0x4974*/      and r1, r1, #0xbf
/*0x4978*/      strb r1, [r0, #8]
/*0x497a*/      ldr r0, [pc, #0x2b0] /* data_4c2c */
/*0x497c*/      ldrb r1, [r0, #0x1c]
/*0x497e*/      and r1, r1, #0xbf
/*0x4982*/      strb r1, [r0, #0x1c]
/*0x4984*/      b jump_498a
            jump_4986:
/*0x4986*/      cmp r5, #8
/*0x4988*/      beq jump_49e0
            jump_498a:
/*0x498a*/      ldr r0, [pc, #0x2a0] /* data_4c2c */
/*0x498c*/      adds r1, r0, r5
/*0x498e*/      ldrb r6, [r1, #2]
            jump_4990:
/*0x4990*/      ldr r0, [pc, #0x298] /* data_4c2c */
/*0x4992*/      movs r4, #0
/*0x4994*/      add.w fp, r0, r5
/*0x4998*/      ldrb.w r0, [fp, #0x14]
/*0x499c*/      eor.w sb, r0, r6
            jump_49a0:
/*0x49a0*/      lsls.w r0, sb, #0x1f
/*0x49a4*/      beq jump_4aa4
/*0x49a6*/      movs r0, #1
/*0x49a8*/      str r0, [r7, #0x7c]
/*0x49aa*/      ldr r0, [pc, #0x284] /* data_4c30 */
/*0x49ac*/      add.w r0, r0, r5, lsl #3
/*0x49b0*/      ldrb.w sl, [r0, r4]
/*0x49b4*/      lsls r0, r6, #0x1f
/*0x49b6*/      beq jump_49ea
/*0x49b8*/      ldrb.w r1, [r7, #0x3d]
/*0x49bc*/      add.w r0, r4, r5, lsl #3
/*0x49c0*/      cmp r0, r1
/*0x49c2*/      bne jump_49cc
/*0x49c4*/      movs r0, #0
/*0x49c6*/      strb r0, [r7, #2]
/*0x49c8*/      str r0, [r7, #0x68]
/*0x49ca*/      str r0, [r7, #0x6c]
            jump_49cc:
/*0x49cc*/      ldrb.w r1, [fp, #0x14]
/*0x49d0*/      movs r0, #1
/*0x49d2*/      lsls r0, r4
/*0x49d4*/      eors r1, r0
/*0x49d6*/      strb.w r1, [fp, #0x14]
/*0x49da*/      ldrb r0, [r7, #0xa]
/*0x49dc*/      cbz r0, jump_4a5c
/*0x49de*/      b jump_4ba6
            jump_49e0:
/*0x49e0*/      ldr r0, [pc, #0x248] /* data_4c2c */
/*0x49e2*/      ldrb r0, [r0, #0xa]
/*0x49e4*/      and r6, r0, #0xbf
/*0x49e8*/      b jump_4990
            jump_49ea:
/*0x49ea*/      ldrb r1, [r7, #0xa]
/*0x49ec*/      movs r0, #0
/*0x49ee*/      cmp r1, #2
/*0x49f0*/      bne jump_4ae2
/*0x49f2*/      ldrb.w r2, [r7, #0x3d]
/*0x49f6*/      add.w r1, r4, r5, lsl #3
/*0x49fa*/      cmp r1, r2
/*0x49fc*/      bne jump_4a04
/*0x49fe*/      movs r0, #1
/*0x4a00*/      strb r0, [r7, #2]
/*0x4a02*/      b jump_4a0a
            jump_4a04:
/*0x4a04*/      ldrb r1, [r7, #2]
/*0x4a06*/      cmp r1, #1
/*0x4a08*/      bne jump_4a36
            jump_4a0a:
/*0x4a0a*/      cmp r5, #1
/*0x4a0c*/      bne jump_4a36
/*0x4a0e*/      cmp r4, #1
/*0x4a10*/      beq jump_4a1c
/*0x4a12*/      cmp r4, #2
/*0x4a14*/      beq jump_4a26
/*0x4a16*/      cmp r4, #3
/*0x4a18*/      beq jump_4a2c
/*0x4a1a*/      b jump_4a36
            jump_4a1c:
/*0x4a1c*/      bl function_e_52
/*0x4a20*/      movs r0, #1
/*0x4a22*/      movs r1, #3
/*0x4a24*/      b jump_4a34
            jump_4a26:
/*0x4a26*/      ldrb r1, [r7, #9]
/*0x4a28*/      cbz r1, jump_4a32
/*0x4a2a*/      b jump_4a36
            jump_4a2c:
/*0x4a2c*/      ldrb r1, [r7, #9]
/*0x4a2e*/      cmp r1, #1
/*0x4a30*/      bne jump_4a36
            jump_4a32:
/*0x4a32*/      movs r1, #4
            jump_4a34:
/*0x4a34*/      strb r1, [r7, #0xa]
            jump_4a36:
/*0x4a36*/      ldrb r1, [r7, #9]
/*0x4a38*/      cbnz r1, jump_4a86
/*0x4a3a*/      ldrb r1, [r7, #0xa]
/*0x4a3c*/      cmp r1, #4
/*0x4a3e*/      beq jump_4a86
/*0x4a40*/      cbnz r0, jump_4a86
/*0x4a42*/      ldr r1, [pc, #0x1e4] /* data_4c28 */
/*0x4a44*/      ldrh.w r2, [r7, #0x52]
/*0x4a48*/      adds r1, #0x12
/*0x4a4a*/      add.w r1, r1, r5, lsl #5
/*0x4a4e*/      ldrh.w r3, [r1, r4, lsl #2]
/*0x4a52*/      cmp r3, r2
/*0x4a54*/      bne jump_4a78
/*0x4a56*/      add.w r8, r1, r4, lsl #2
/*0x4a5a*/      b jump_4a60
            jump_4a5c:
/*0x4a5c*/      b jump_4b72
            jump_4a5e:
/*0x4a5e*/      b jump_4c0c
            jump_4a60:
/*0x4a60*/      ldrh.w r3, [r8, #2]
/*0x4a64*/      ldrh.w ip, [r7, #0x54]
/*0x4a68*/      cmp r3, ip
/*0x4a6a*/      bne jump_4a78
/*0x4a6c*/      movs r2, #0
/*0x4a6e*/      strh.w r2, [r1, r4, lsl #2]
/*0x4a72*/      strh.w r2, [r8, #2]
/*0x4a76*/      b jump_4a86
            jump_4a78:
/*0x4a78*/      strh.w r2, [r1, r4, lsl #2]
/*0x4a7c*/      add.w r1, r1, r4, lsl #2
/*0x4a80*/      ldrh.w r2, [r7, #0x54]
/*0x4a84*/      strh r2, [r1, #2]
            jump_4a86:
/*0x4a86*/      ldrb r1, [r7, #9]
/*0x4a88*/      cmp r1, #1
/*0x4a8a*/      bne jump_4ad8
/*0x4a8c*/      ldrb r1, [r7, #0xa]
/*0x4a8e*/      cmp r1, #4
/*0x4a90*/      beq jump_4ad8
/*0x4a92*/      cbnz r0, jump_4ad6
/*0x4a94*/      ldr r0, [pc, #0x19c] /* data_4c34 */
/*0x4a96*/      ldrh.w r1, [r7, #0x52]
/*0x4a9a*/      add.w r0, r0, r5, lsl #5
/*0x4a9e*/      ldrh.w r2, [r0, r4, lsl #2]
/*0x4aa2*/      b jump_4aa6
            jump_4aa4:
/*0x4aa4*/      b jump_4bc8
            jump_4aa6:
/*0x4aa6*/      cmp r2, r1
/*0x4aa8*/      bne jump_4ac6
/*0x4aaa*/      add.w ip, r0, r4, lsl #2
/*0x4aae*/      ldrh.w r3, [r7, #0x54]
/*0x4ab2*/      ldrh.w r2, [ip, #2]
/*0x4ab6*/      cmp r2, r3
/*0x4ab8*/      bne jump_4ac6
/*0x4aba*/      movs r1, #0
/*0x4abc*/      strh.w r1, [r0, r4, lsl #2]
/*0x4ac0*/      strh.w r1, [ip, #2]
/*0x4ac4*/      b jump_4ada
            jump_4ac6:
/*0x4ac6*/      strh.w r1, [r0, r4, lsl #2]
/*0x4aca*/      add.w r0, r0, r4, lsl #2
/*0x4ace*/      ldrh.w r1, [r7, #0x54]
/*0x4ad2*/      strh r1, [r0, #2]
/*0x4ad4*/      b jump_4ada
            jump_4ad6:
/*0x4ad6*/      b jump_4ae2
            jump_4ad8:
/*0x4ad8*/      cbnz r0, jump_4ae2
            jump_4ada:
/*0x4ada*/      ldrb.w r0, [r7, #0x39]
/*0x4ade*/      bl function_e_18
            jump_4ae2:
/*0x4ae2*/      ldrb r0, [r7, #0xa]
/*0x4ae4*/      cmp r0, #3
/*0x4ae6*/      bne.w jump_49cc
/*0x4aea*/      orrs.w r0, r5, r4
/*0x4aee*/      beq jump_4b32
/*0x4af0*/      cmp r5, #4
/*0x4af2*/      beq jump_4afa
/*0x4af4*/      cmp r5, #5
/*0x4af6*/      beq jump_4b02
/*0x4af8*/      b jump_4b06
            jump_4afa:
/*0x4afa*/      cmp r4, #6
/*0x4afc*/      bne jump_4b06
/*0x4afe*/      movs r0, #0xb
/*0x4b00*/      b jump_4b32
            jump_4b02:
/*0x4b02*/      cmp r4, #2
/*0x4b04*/      beq jump_4b24
            jump_4b06:
/*0x4b06*/      sub.w r0, sl, #0x1e
/*0x4b0a*/      cmp r0, #0xd
/*0x4b0c*/      bhs.w jump_49cc
/*0x4b10*/      tbb [pc, r0]

/*0x4b14*/  .byte 0x0a
/*0x4b15*/  .byte 0x0a
/*0x4b16*/  .byte 0x0a
/*0x4b17*/  .byte 0x0a
/*0x4b18*/  .byte 0x0a
/*0x4b19*/  .byte 0x0a
/*0x4b1a*/  .byte 0x0a
/*0x4b1b*/  .byte 0x0a
/*0x4b1c*/  .byte 0x0a
/*0x4b1d*/  .byte 0x0a
/*0x4b1e*/  .byte 0x07
/*0x4b1f*/  .byte 0x07
/*0x4b20*/  .byte 0x0e
/*0x4b21*/  .byte 0x00

            switch_4b22:
/*0x4b22*/      b jump_49cc
            jump_4b24:
/*0x4b24*/      movs r0, #0xc
/*0x4b26*/      b jump_4b32
            switch_4b28:
/*0x4b28*/      sub.w r0, sl, #0x1d
/*0x4b2c*/      uxtb r0, r0
/*0x4b2e*/      b jump_4b32
            switch_4b30:
/*0x4b30*/      movs r0, #0xd
            jump_4b32:
/*0x4b32*/      ldr r1, [pc, #0x104] /* data_4c38 */
/*0x4b34*/      ldrh.w r0, [r1, r0, lsl #1]
/*0x4b38*/      strh.w r0, [r7, #0x52]
/*0x4b3c*/      ldrb.w r0, [r7, #0x39]
/*0x4b40*/      bl function_e_18
/*0x4b44*/      ldrh.w r0, [r7, #0x52]
/*0x4b48*/      mov.w r1, #0x3e8
/*0x4b4c*/      rsb r0, r0, r0, lsl #16
/*0x4b50*/      udiv r0, r0, r1
/*0x4b54*/      mov.w r1, #0x1c2
/*0x4b58*/      muls r0, r1, r0
/*0x4b5a*/      movw r1, #0xffff
/*0x4b5e*/      udiv r0, r0, r1
/*0x4b62*/      b jump_4b66
            switch_4b64:
/*0x4b64*/      b jump_4be4
            jump_4b66:
/*0x4b66*/      ldr r1, [pc, #0xd4] /* data_4c3c */
/*0x4b68*/      strh.w r0, [r1, #0x52]
/*0x4b6c*/      movs r0, #2
/*0x4b6e*/      strb r0, [r7, #0xa]
/*0x4b70*/      b jump_49cc
            jump_4b72:
/*0x4b72*/      bl call_8894
/*0x4b76*/      cmp r0, #1
/*0x4b78*/      bne jump_4ba6
/*0x4b7a*/      ldrb r0, [r7, #0xa]
/*0x4b7c*/      adds r0, r0, #1
/*0x4b7e*/      strb r0, [r7, #0xa]
/*0x4b80*/      movs r0, #0
/*0x4b82*/      str r0, [r7, #0x7c]
/*0x4b84*/      ldr r1, [pc, #0x9c] /* data_4c24 */
/*0x4b86*/      adds r1, #0x80
/*0x4b88*/      str r0, [r1]
/*0x4b8a*/      strb r0, [r7, #2]
/*0x4b8c*/      strb r0, [r7, #4]
/*0x4b8e*/      ldrh.w r0, [r7, #0x46]
/*0x4b92*/      ldrh.w r1, [r7, #0x48]
/*0x4b96*/      orrs.w r2, r0, r1
/*0x4b9a*/      bne jump_4b9e
/*0x4b9c*/      movs r1, #0xc8
            jump_4b9e:
/*0x4b9e*/      strh.w r1, [r7, #0x52]
/*0x4ba2*/      strh.w r0, [r7, #0x54]
            jump_4ba6:
/*0x4ba6*/      ldrb r0, [r7, #0xa]
/*0x4ba8*/      cmp r0, #1
/*0x4baa*/      bne jump_4bb8
/*0x4bac*/      ldrb r0, [r7, #9]
/*0x4bae*/      cmp r0, #2
/*0x4bb0*/      beq jump_4bb8
/*0x4bb2*/      ldrb r0, [r7, #0xa]
/*0x4bb4*/      adds r0, r0, #1
/*0x4bb6*/      strb r0, [r7, #0xa]
            jump_4bb8:
/*0x4bb8*/      bl call_8894
/*0x4bbc*/      cmp r0, #1
/*0x4bbe*/      bne jump_4bc8
/*0x4bc0*/      ldrb r0, [r7, #0xa]
/*0x4bc2*/      cmp r0, #4
/*0x4bc4*/      bne jump_4bc8
/*0x4bc6*/      strb r0, [r7, #0xa]
            jump_4bc8:
/*0x4bc8*/      adds r4, r4, #1
/*0x4bca*/      lsrs r6, r6, #1
/*0x4bcc*/      uxtb r4, r4
/*0x4bce*/      lsr.w sb, sb, #1
/*0x4bd2*/      cmp r4, #8
/*0x4bd4*/      blo.w jump_49a0
/*0x4bd8*/      adds r5, r5, #1
/*0x4bda*/      uxtb r5, r5
/*0x4bdc*/      cmp r5, #9
/*0x4bde*/      blo.w jump_4986
/*0x4be2*/      b jump_4c0c
            jump_4be4:
/*0x4be4*/      ldrb r0, [r7, #9]
/*0x4be6*/      strb r0, [r7, #6]
/*0x4be8*/      bl function_e_5
/*0x4bec*/      movs r0, #2
/*0x4bee*/      strb r0, [r7, #9]
/*0x4bf0*/      movs r0, #0x63
/*0x4bf2*/      strb r0, [r7, #0xa]
/*0x4bf4*/      movs r0, #0
/*0x4bf6*/      strb r0, [r7, #2]
/*0x4bf8*/      strb r0, [r7, #4]
/*0x4bfa*/      str r0, [r7, #0x68]
/*0x4bfc*/      str r0, [r7, #0x6c]
/*0x4bfe*/      str r0, [r7, #0x7c]
/*0x4c00*/      ldr r1, [pc, #0x38] /* data_4c3c */
/*0x4c02*/      strh.w r0, [r1, #0x52]
/*0x4c06*/      ldr r1, [pc, #0x38] /* data_4c40 */
/*0x4c08*/      strh.w r0, [r1, #0x52]
            jump_4c0c:
/*0x4c0c*/      ldr r1, [r7, #0x7c]
/*0x4c0e*/      movw r0, #0x4e20
/*0x4c12*/      cmp r1, r0
/*0x4c14*/      blo jump_4c20
/*0x4c16*/      ldrb r0, [r7, #0xa]
/*0x4c18*/      cmp r0, #0x14
/*0x4c1a*/      bhi jump_4c20
/*0x4c1c*/      movs r0, #4
/*0x4c1e*/      strb r0, [r7, #0xa]
            jump_4c20:
/*0x4c20*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_4c24:
/*0x4c24*/  .word 0x20000058
            data_4c28:
/*0x4c28*/  .word 0x2000090c
            data_4c2c:
/*0x4c2c*/  .word 0x20002de4
            data_4c30:
/*0x4c30*/  .word data_8ec8
            data_4c34:
/*0x4c34*/  .word 0x20000a3e
            data_4c38:
/*0x4c38*/  .word 0x20000160
            data_4c3c:
/*0x4c3c*/  .word 0x20002e2c
            data_4c40:
/*0x4c40*/  .word 0x20002ebc


            .thumb_func
            function_e_27:
/*0x4c44*/      cmp r1, #0
/*0x4c46*/      ldr r1, [r0, #0x70]
/*0x4c48*/      beq jump_4c50
/*0x4c4a*/      orr r1, r1, #0x10
/*0x4c4e*/      b jump_4c54
            jump_4c50:
/*0x4c50*/      bic r1, r1, #0x10
            jump_4c54:
/*0x4c54*/      str r1, [r0, #0x70]
/*0x4c56*/      bx lr

            .thumb_func
            function_e_28:
/*0x4c58*/      cmp r1, #0
/*0x4c5a*/      ldr r1, [r0, #0x10]
/*0x4c5c*/      beq jump_4c64
/*0x4c5e*/      orr r1, r1, #1
/*0x4c62*/      b jump_4c68
            jump_4c64:
/*0x4c64*/      bic r1, r1, #1
            jump_4c68:
/*0x4c68*/      str r1, [r0, #0x10]
/*0x4c6a*/      bx lr

            .thumb_func
            function_e_29:
/*0x4c6c*/      push {r4, r5, r6, r7, lr}
/*0x4c6e*/      ldrb r3, [r1]
/*0x4c70*/      movs r4, #3
/*0x4c72*/      add.w lr, r0, r3, lsl #2
/*0x4c76*/      lsls r3, r3, #1
/*0x4c78*/      lsls r4, r3
/*0x4c7a*/      ldr r5, [r0, #0x50]
/*0x4c7c*/      add.w r2, lr, #0x40
/*0x4c80*/      add.w ip, lr, #0x90
/*0x4c84*/      mvns r4, r4
/*0x4c86*/      ands r5, r4
/*0x4c88*/      str r5, [r0, #0x50]
/*0x4c8a*/      ldr r5, [r0, #0x54]
/*0x4c8c*/      ldrb r6, [r1, #0xa]
/*0x4c8e*/      ldrb r7, [r1, #0xb]
/*0x4c90*/      ands r5, r4
/*0x4c92*/      orr.w r6, r6, r7, lsl #1
/*0x4c96*/      lsls r6, r3
/*0x4c98*/      orrs r6, r5
/*0x4c9a*/      str r6, [r0, #0x54]
/*0x4c9c*/      ldr r5, [r0, #0x6c]
/*0x4c9e*/      ldrb r6, [r1, #0xd]
/*0x4ca0*/      ands r5, r4
/*0x4ca2*/      ldrb r4, [r1, #0xc]
/*0x4ca4*/      orr.w r4, r4, r6, lsl #1
/*0x4ca8*/      lsls r4, r3
/*0x4caa*/      orrs r4, r5
/*0x4cac*/      str r4, [r0, #0x6c]
/*0x4cae*/      ldr r4, [r2]
/*0x4cb0*/      movw r5, #0x107
/*0x4cb4*/      bics r4, r5
/*0x4cb6*/      str r4, [r2]
/*0x4cb8*/      ldr r4, [r2]
/*0x4cba*/      ldr r5, [r1, #4]
/*0x4cbc*/      orrs r4, r5
/*0x4cbe*/      str r4, [r2]
/*0x4cc0*/      ldrh r2, [r1, #0xe]
/*0x4cc2*/      str.w r2, [ip]
/*0x4cc6*/      ldrh r2, [r1, #0x10]
/*0x4cc8*/      str.w r2, [lr, #0xa0]
/*0x4ccc*/      ldrb r2, [r1, #8]
/*0x4cce*/      ldrb r1, [r1, #9]
/*0x4cd0*/      orr.w r1, r2, r1, lsl #1
/*0x4cd4*/      ldr r2, [r0, #0x50]
/*0x4cd6*/      lsls r1, r3
/*0x4cd8*/      orrs r1, r2
/*0x4cda*/      str r1, [r0, #0x50]
/*0x4cdc*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            clear_some_mem:
/*0x4cde*/      movs r1, #0
/*0x4ce0*/      strb r1, [r0]
/*0x4ce2*/      str r1, [r0, #4]
/*0x4ce4*/      strb r1, [r0, #8]
/*0x4ce6*/      strb r1, [r0, #9]
/*0x4ce8*/      strb r1, [r0, #0xa]
/*0x4cea*/      strb r1, [r0, #0xb]
/*0x4cec*/      strb r1, [r0, #0xc]
/*0x4cee*/      strb r1, [r0, #0xd]
/*0x4cf0*/      strh r1, [r0, #0xe]
/*0x4cf2*/      strh r1, [r0, #0x10]
/*0x4cf4*/      bx lr

            .thumb_func
            function_e_30:
/*0x4cf6*/      ldrh r2, [r1]
/*0x4cf8*/      str.w r2, [r0, #0x88]
/*0x4cfc*/      ldrh r2, [r1, #2]
/*0x4cfe*/      str.w r2, [r0, #0x84]
/*0x4d02*/      ldr r2, [r0]
/*0x4d04*/      bic r2, r2, #0x30000
/*0x4d08*/      str r2, [r0]
/*0x4d0a*/      ldr r2, [r0]
/*0x4d0c*/      bic r2, r2, #0x1000000
/*0x4d10*/      str r2, [r0]
/*0x4d12*/      ldr r2, [r0]
/*0x4d14*/      ldr r3, [r1, #8]
/*0x4d16*/      orrs r2, r3
/*0x4d18*/      str r2, [r0]
/*0x4d1a*/      ldrb r2, [r1, #4]
/*0x4d1c*/      str.w r2, [r0, #0x8c]
/*0x4d20*/      ldrh r1, [r1, #0xc]
/*0x4d22*/      str r1, [r0, #0x78]
/*0x4d24*/      bx lr

            .thumb_func
            function_e_31:
/*0x4d26*/      movs r1, #0
/*0x4d28*/      movw r2, #0xffff
/*0x4d2c*/      str r1, [r0, #8]
/*0x4d2e*/      strh r2, [r0]
/*0x4d30*/      strh r1, [r0, #2]
/*0x4d32*/      mov.w r2, #0x100
/*0x4d36*/      strh r2, [r0, #0xc]
/*0x4d38*/      strb r1, [r0, #4]
/*0x4d3a*/      bx lr

            .thumb_func
            spi_flash_read_status:
/*0x4d3c*/      push {r2, r3, r4, r5, r6, lr}
/*0x4d3e*/      ldr r4, [pc, #0x20] /* data_4d60 */
/*0x4d40*/      movs r0, #5
/*0x4d42*/      strh.w r0, [sp]
/*0x4d46*/      mov.w r5, #0x400
/*0x4d4a*/      str r5, [r4, #0x28]
/*0x4d4c*/      movs r2, #2
/*0x4d4e*/      add r1, sp, #4
/*0x4d50*/      mov r0, sp
/*0x4d52*/      bl spi_write_read
/*0x4d56*/      str r5, [r4, #0x24]
/*0x4d58*/      ldrb.w r0, [sp, #5]
/*0x4d5c*/      pop {r2, r3, r4, r5, r6, pc}

/*0x4d5e*/  .byte 0x00
/*0x4d5f*/  .byte 0x00

            data_4d60:
/*0x4d60*/  .word 0x400b2000


            .thumb_func
            spi_init:
/*0x4d64*/      push {r4, r5, r6, lr}
/*0x4d66*/      sub sp, #0x30
/*0x4d68*/      bl spi_gpio_init
/*0x4d6c*/      ldr r4, [pc, #0x5c] /* data_4dcc */
/*0x4d6e*/      ldrb r0, [r4]
/*0x4d70*/      cmp r0, #1
/*0x4d72*/      bne jump_4dc4
/*0x4d74*/      movs r1, #1
/*0x4d76*/      movs r0, #0x20
/*0x4d78*/      bl ckcu_apb0_clock_enable
/*0x4d7c*/      mov.w r0, #0x4000
/*0x4d80*/      asrs r5, r0, #4
/*0x4d82*/      strd r0, r5, [sp]
/*0x4d86*/      movs r0, #8
/*0x4d88*/      str r0, [sp, #8]
/*0x4d8a*/      movs r0, #0
/*0x4d8c*/      str r0, [sp, #0xc]
/*0x4d8e*/      str r0, [sp, #0x10]
/*0x4d90*/      str r0, [sp, #0x14]
/*0x4d92*/      str r0, [sp, #0x18]
/*0x4d94*/      str r0, [sp, #0x1c]
/*0x4d96*/      movs r0, #4
/*0x4d98*/      ldr r6, [pc, #0x34] /* data_4dd0 */
/*0x4d9a*/      str r0, [sp, #0x20]
/*0x4d9c*/      str r0, [sp, #0x24]
/*0x4d9e*/      str r0, [sp, #0x28]
/*0x4da0*/      mov r1, sp
/*0x4da2*/      mov r0, r6
/*0x4da4*/      bl spi_config
/*0x4da8*/      movs r1, #1
/*0x4daa*/      mov r0, r6
/*0x4dac*/      bl spi_slave_select_output
/*0x4db0*/      ldr r0, [pc, #0x20] /* data_4dd4 */
/*0x4db2*/      str r5, [r0, #0x24]
/*0x4db4*/      movs r1, #1
/*0x4db6*/      mov r0, r6
/*0x4db8*/      bl spi_enable
/*0x4dbc*/      bl pinmux_b789_spi
/*0x4dc0*/      movs r0, #2
/*0x4dc2*/      strb r0, [r4]
            jump_4dc4:
/*0x4dc4*/      add sp, #0x30
/*0x4dc6*/      movs r0, #1
/*0x4dc8*/      pop {r4, r5, r6, pc}

/*0x4dca*/  .byte 0x00
/*0x4dcb*/  .byte 0x00

            data_4dcc:
/*0x4dcc*/  .word 0x20000220
            data_4dd0:
/*0x4dd0*/  .word 0x40044000
            data_4dd4:
/*0x4dd4*/  .word 0x400b2000


            .thumb_func
            spi_flash_read_wip:
/*0x4dd8*/      push {r4, lr}
/*0x4dda*/      bl spi_flash_read_status
/*0x4dde*/      ubfx r0, r0, #0, #1
/*0x4de2*/      pop {r4, pc}

            .thumb_func
            spi_gpio_init:
/*0x4de4*/      push {r4, r5, r6, lr}
/*0x4de6*/      ldr r4, [pc, #0x44] /* data_4e2c */
/*0x4de8*/      ldrb r0, [r4]
/*0x4dea*/      cbnz r0, jump_4e26
/*0x4dec*/      movs r1, #1
/*0x4dee*/      lsls r0, r1, #0x11
/*0x4df0*/      bl ckcu_ahb_clock_enable
/*0x4df4*/      ldr r6, [pc, #0x38] /* data_4e30 */
/*0x4df6*/      mov.w r5, #0x400
/*0x4dfa*/      movs r2, #0
/*0x4dfc*/      mov r1, r5
/*0x4dfe*/      mov r0, r6
/*0x4e00*/      bl gpio_set_pin_pull_up_down
/*0x4e04*/      movs r2, #1
/*0x4e06*/      mov r1, r5
/*0x4e08*/      mov r0, r6
/*0x4e0a*/      bl gpio_set_output_current
/*0x4e0e*/      movs r2, #1
/*0x4e10*/      movs r1, #0x80
/*0x4e12*/      mov r0, r6
/*0x4e14*/      bl gpio_set_output_current
/*0x4e18*/      movs r2, #1
/*0x4e1a*/      lsls r1, r2, #8
/*0x4e1c*/      mov r0, r6
/*0x4e1e*/      bl gpio_set_output_current
/*0x4e22*/      movs r0, #1
/*0x4e24*/      strb r0, [r4]
            jump_4e26:
/*0x4e26*/      movs r0, #1
/*0x4e28*/      pop {r4, r5, r6, pc}

/*0x4e2a*/  .byte 0x00
/*0x4e2b*/  .byte 0x00

            data_4e2c:
/*0x4e2c*/  .word 0x20000220
            data_4e30:
/*0x4e30*/  .word 0x400b2000


            .thumb_func
            pinmux_select_b789:
/*0x4e34*/      cbz r0, jump_4e3a
/*0x4e36*/      b.w pinmux_b789_gpio
            jump_4e3a:
/*0x4e3a*/      b.w pinmux_b789_spi

/*0x4e3e*/  .byte 0x00
/*0x4e3f*/  .byte 0x00


            .thumb_func
            pinmux_b789_spi:
/*0x4e40*/      push {r4, r5, r6, lr}
/*0x4e42*/      movs r2, #1
/*0x4e44*/      ldr r5, [pc, #0x38] /* data_4e80 */
/*0x4e46*/      lsls r4, r2, #0xa
/*0x4e48*/      mov r1, r4
/*0x4e4a*/      mov r0, r5
/*0x4e4c*/      bl gpio_set_input_output
/*0x4e50*/      movs r2, #2
/*0x4e52*/      mov r1, r4
/*0x4e54*/      mov r0, r5
/*0x4e56*/      bl gpio_set_pin_pull_up_down
/*0x4e5a*/      movs r2, #5
/*0x4e5c*/      movs r1, #7
/*0x4e5e*/      movs r0, #1
/*0x4e60*/      bl afio_pin_config
/*0x4e64*/      movs r2, #5
/*0x4e66*/      movs r1, #8
/*0x4e68*/      movs r0, #1
/*0x4e6a*/      bl afio_pin_config
/*0x4e6e*/      movs r2, #5
/*0x4e70*/      movs r1, #9
/*0x4e72*/      movs r0, #1
/*0x4e74*/      bl afio_pin_config
/*0x4e78*/      pop.w {r4, r5, r6, lr}
/*0x4e7c*/      b.w spi_flash_release_sleep

            data_4e80:
/*0x4e80*/  .word 0x400b2000


            .thumb_func
            pinmux_b789_gpio:
/*0x4e84*/      push {r4, r5, r6, lr}
/*0x4e86*/      bl spi_flash_deep_power_down
/*0x4e8a*/      ldr r5, [pc, #0x3c] /* data_4ec8 */
/*0x4e8c*/      mov.w r4, #0x400
/*0x4e90*/      movs r2, #0
/*0x4e92*/      mov r1, r4
/*0x4e94*/      mov r0, r5
/*0x4e96*/      bl gpio_set_pin_pull_up_down
/*0x4e9a*/      movs r2, #0
/*0x4e9c*/      mov r1, r4
/*0x4e9e*/      mov r0, r5
/*0x4ea0*/      bl gpio_set_input_output
/*0x4ea4*/      movs r2, #0
/*0x4ea6*/      movs r1, #7
/*0x4ea8*/      movs r0, #1
/*0x4eaa*/      bl afio_pin_config
/*0x4eae*/      movs r2, #0
/*0x4eb0*/      movs r1, #8
/*0x4eb2*/      movs r0, #1
/*0x4eb4*/      bl afio_pin_config
/*0x4eb8*/      pop.w {r4, r5, r6, lr}
/*0x4ebc*/      movs r2, #0
/*0x4ebe*/      movs r1, #9
/*0x4ec0*/      movs r0, #1
/*0x4ec2*/      b.w afio_pin_config

/*0x4ec6*/  .byte 0x00
/*0x4ec7*/  .byte 0x00

            data_4ec8:
/*0x4ec8*/  .word 0x400b2000


            .thumb_func
            spi_flash_page_program:
/*0x4ecc*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x4ed0*/      mov r7, r0
/*0x4ed2*/      mov r4, r1
/*0x4ed4*/      mov r8, r2
/*0x4ed6*/      bl spi_flash_write_enable
/*0x4eda*/      ldr r6, [pc, #0x38] /* data_4f14 */
/*0x4edc*/      mov.w r5, #0x400
/*0x4ee0*/      str r5, [r6, #0x28]
/*0x4ee2*/      movs r0, #2
/*0x4ee4*/      strb.w r0, [sp]
/*0x4ee8*/      lsrs r0, r4, #0x10
/*0x4eea*/      strb.w r0, [sp, #1]
/*0x4eee*/      lsrs r0, r4, #8
/*0x4ef0*/      strb.w r0, [sp, #2]
/*0x4ef4*/      strb.w r4, [sp, #3]
/*0x4ef8*/      movs r2, #4
/*0x4efa*/      movs r1, #0
/*0x4efc*/      mov r0, sp
/*0x4efe*/      bl spi_write_read
/*0x4f02*/      mov r2, r8
/*0x4f04*/      movs r1, #0
/*0x4f06*/      mov r0, r7
/*0x4f08*/      bl spi_write_read
/*0x4f0c*/      str r5, [r6, #0x24]
/*0x4f0e*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

/*0x4f12*/  .byte 0x00
/*0x4f13*/  .byte 0x00

            data_4f14:
/*0x4f14*/  .word 0x400b2000


            .thumb_func
            spi_flash_sector_erase:
/*0x4f18*/      push {r3, r4, r5, r6, r7, lr}
/*0x4f1a*/      mov r4, r0
/*0x4f1c*/      bl spi_flash_write_enable
/*0x4f20*/      ldr r6, [pc, #0x28] /* data_4f4c */
/*0x4f22*/      mov.w r5, #0x400
/*0x4f26*/      str r5, [r6, #0x28]
/*0x4f28*/      movs r0, #0x20
/*0x4f2a*/      strb.w r0, [sp]
/*0x4f2e*/      lsrs r0, r4, #0x10
/*0x4f30*/      strb.w r0, [sp, #1]
/*0x4f34*/      lsrs r0, r4, #8
/*0x4f36*/      strb.w r0, [sp, #2]
/*0x4f3a*/      strb.w r4, [sp, #3]
/*0x4f3e*/      movs r2, #4
/*0x4f40*/      movs r1, #0
/*0x4f42*/      mov r0, sp
/*0x4f44*/      bl spi_write_read
/*0x4f48*/      str r5, [r6, #0x24]
/*0x4f4a*/      pop {r3, r4, r5, r6, r7, pc}

            data_4f4c:
/*0x4f4c*/  .word 0x400b2000


            .thumb_func
            spi_flash_write_status_register:
/*0x4f50*/      push {r3, r4, r5, r6, r7, lr}
/*0x4f52*/      mov r6, r0
/*0x4f54*/      bl spi_flash_write_enable
/*0x4f58*/      ldr r4, [pc, #0x1c] /* data_4f78 */
/*0x4f5a*/      mov.w r5, #0x400
/*0x4f5e*/      str r5, [r4, #0x28]
/*0x4f60*/      movs r0, #1
/*0x4f62*/      strb.w r0, [sp]
/*0x4f66*/      strb.w r6, [sp, #1]
/*0x4f6a*/      movs r2, #2
/*0x4f6c*/      movs r1, #0
/*0x4f6e*/      mov r0, sp
/*0x4f70*/      bl spi_write_read
/*0x4f74*/      str r5, [r4, #0x24]
/*0x4f76*/      pop {r3, r4, r5, r6, r7, pc}

            data_4f78:
/*0x4f78*/  .word 0x400b2000


            .thumb_func
            function_78:
/*0x4f7c*/      push {r4, lr}
/*0x4f7e*/      movs r4, #0x3c
/*0x4f80*/      bl spi_flash_page_program
/*0x4f84*/      b jump_4f92
            jump_4f86:
/*0x4f86*/      movs r0, #0x64
/*0x4f88*/      bl spin_wait_maybe
/*0x4f8c*/      bl spi_flash_read_wip
/*0x4f90*/      cbz r0, jump_4f9a
            jump_4f92:
/*0x4f92*/      subs r4, r4, #1
/*0x4f94*/      adds r0, r4, #1
/*0x4f96*/      bne jump_4f86
/*0x4f98*/      pop {r4, pc}
            jump_4f9a:
/*0x4f9a*/      movs r0, #1
/*0x4f9c*/      pop {r4, pc}

/*0x4f9e*/  .byte 0x00
/*0x4f9f*/  .byte 0x00


            .thumb_func
            spi_flash_deep_power_down:
/*0x4fa0*/      push {r3, r4, r5, lr}
/*0x4fa2*/      ldr r4, [pc, #0x20] /* data_4fc4 */
/*0x4fa4*/      movs r0, #0xb9
/*0x4fa6*/      strb.w r0, [sp]
/*0x4faa*/      mov.w r5, #0x400
/*0x4fae*/      str r5, [r4, #0x28]
/*0x4fb0*/      movs r2, #1
/*0x4fb2*/      movs r1, #0
/*0x4fb4*/      mov r0, sp
/*0x4fb6*/      bl spi_write_read
/*0x4fba*/      str r5, [r4, #0x24]
/*0x4fbc*/      movs r0, #0xa
/*0x4fbe*/      bl spin_wait_maybe
/*0x4fc2*/      pop {r3, r4, r5, pc}

            data_4fc4:
/*0x4fc4*/  .word 0x400b2000


            .thumb_func
            spi_flash_read_data:
/*0x4fc8*/      push {r3, r4, r5, r6, r7, lr}
/*0x4fca*/      ldr r5, [pc, #0x38] /* data_5004 */
/*0x4fcc*/      mov.w r4, #0x400
/*0x4fd0*/      mov r7, r0
/*0x4fd2*/      mov r6, r2
/*0x4fd4*/      str r4, [r5, #0x28]
/*0x4fd6*/      movs r0, #3
/*0x4fd8*/      strb.w r0, [sp]
/*0x4fdc*/      lsrs r0, r1, #0x10
/*0x4fde*/      strb.w r0, [sp, #1]
/*0x4fe2*/      lsrs r0, r1, #8
/*0x4fe4*/      strb.w r0, [sp, #2]
/*0x4fe8*/      strb.w r1, [sp, #3]
/*0x4fec*/      movs r2, #4
/*0x4fee*/      movs r1, #0
/*0x4ff0*/      mov r0, sp
/*0x4ff2*/      bl spi_write_read
/*0x4ff6*/      mov r2, r6
/*0x4ff8*/      mov r1, r7
/*0x4ffa*/      movs r0, #0
/*0x4ffc*/      bl spi_write_read
/*0x5000*/      str r4, [r5, #0x24]
/*0x5002*/      pop {r3, r4, r5, r6, r7, pc}

            data_5004:
/*0x5004*/  .word 0x400b2000


            .thumb_func
            spi_write_read:
/*0x5008*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x500c*/      mov r6, r1
/*0x500e*/      ldr r1, [pc, #0x88] /* data_5098 */
/*0x5010*/      mov r5, r0
/*0x5012*/      movs r4, #0
/*0x5014*/      ldr r0, [r1, #4]
/*0x5016*/      mov r7, r2
/*0x5018*/      cmp r0, #0
/*0x501a*/      ble jump_5022
/*0x501c*/      subs r0, r0, r7
/*0x501e*/      str r0, [r1, #4]
/*0x5020*/      b jump_502c
            jump_5022:
/*0x5022*/      mov.w r0, #0xfa0
/*0x5026*/      str r0, [r1, #4]
/*0x5028*/      bl watchdog_reload_timer
            jump_502c:
/*0x502c*/      cmp r7, #8
/*0x502e*/      bls jump_5034
/*0x5030*/      movs r0, #8
/*0x5032*/      b jump_5036
            jump_5034:
/*0x5034*/      mov r0, r7
            jump_5036:
/*0x5036*/      movs r2, #0
/*0x5038*/      mov r3, r2
/*0x503a*/      ldr r1, [pc, #0x60] /* data_509c */
/*0x503c*/      b jump_504a
            jump_503e:
/*0x503e*/      cbz r5, jump_5050
/*0x5040*/      ldrb.w ip, [r5, r2]
/*0x5044*/      str.w ip, [r1, #0x10]
            jump_5048:
/*0x5048*/      adds r2, r2, #1
            jump_504a:
/*0x504a*/      cmp r2, r0
/*0x504c*/      blo jump_503e
/*0x504e*/      b jump_5072
            jump_5050:
/*0x5050*/      str r3, [r1, #0x10]
/*0x5052*/      b jump_5048
            jump_5054:
/*0x5054*/      ldr r2, [r1, #0x1c]
/*0x5056*/      tst.w r2, #0xf0
/*0x505a*/      beq jump_5054
/*0x505c*/      ldr r2, [r1, #0x10]
/*0x505e*/      uxtb r2, r2
/*0x5060*/      cbz r5, jump_5078
/*0x5062*/      ldrb.w ip, [r5, r0]
/*0x5066*/      str.w ip, [r1, #0x10]
            jump_506a:
/*0x506a*/      adds r0, r0, #1
/*0x506c*/      cbz r6, jump_5070
/*0x506e*/      strb r2, [r6, r4]
            jump_5070:
/*0x5070*/      adds r4, r4, #1
            jump_5072:
/*0x5072*/      cmp r0, r7
/*0x5074*/      blo jump_5054
/*0x5076*/      b jump_508e
            jump_5078:
/*0x5078*/      str r3, [r1, #0x10]
/*0x507a*/      b jump_506a
            jump_507c:
/*0x507c*/      ldr r0, [r1, #0x1c]
/*0x507e*/      tst.w r0, #0xf0
/*0x5082*/      beq jump_507c
/*0x5084*/      ldr r0, [r1, #0x10]
/*0x5086*/      uxtb r0, r0
/*0x5088*/      cbz r6, jump_508c
/*0x508a*/      strb r0, [r6, r4]
            jump_508c:
/*0x508c*/      adds r4, r4, #1
            jump_508e:
/*0x508e*/      cmp r4, r7
/*0x5090*/      blo jump_507c
/*0x5092*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x5096*/  .byte 0x00
/*0x5097*/  .byte 0x00

            data_5098:
/*0x5098*/  .word 0x20000220
            data_509c:
/*0x509c*/  .word 0x40044000


            .thumb_func
            function_e_40:
/*0x50a0*/      push {r4, r5, r6, lr}
/*0x50a2*/      movw r4, #0x12d
/*0x50a6*/      bl spi_flash_sector_erase
/*0x50aa*/      mov.w r5, #0x3e8
/*0x50ae*/      b jump_50bc
            jump_50b0:
/*0x50b0*/      mov r0, r5
/*0x50b2*/      bl spin_wait_maybe
/*0x50b6*/      bl spi_flash_read_wip
/*0x50ba*/      cbz r0, jump_50c4
            jump_50bc:
/*0x50bc*/      subs r4, r4, #1
/*0x50be*/      adds r0, r4, #1
/*0x50c0*/      bne jump_50b0
/*0x50c2*/      pop {r4, r5, r6, pc}
            jump_50c4:
/*0x50c4*/      movs r0, #1
/*0x50c6*/      pop {r4, r5, r6, pc}

            .thumb_func
            spi_flash_release_sleep:
/*0x50c8*/      push {r3, r4, r5, lr}
/*0x50ca*/      ldr r4, [pc, #0x20] /* data_50ec */
/*0x50cc*/      movs r0, #0xab
/*0x50ce*/      strb.w r0, [sp]
/*0x50d2*/      mov.w r5, #0x400
/*0x50d6*/      str r5, [r4, #0x28]
/*0x50d8*/      movs r2, #1
/*0x50da*/      movs r1, #0
/*0x50dc*/      mov r0, sp
/*0x50de*/      bl spi_write_read
/*0x50e2*/      str r5, [r4, #0x24]
/*0x50e4*/      movs r0, #0xa
/*0x50e6*/      bl spin_wait_maybe
/*0x50ea*/      pop {r3, r4, r5, pc}

            data_50ec:
/*0x50ec*/  .word 0x400b2000


            .thumb_func
            function_27:
/*0x50f0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x50f4*/      mov r6, r0
/*0x50f6*/      rsbs r0, r1, #0
/*0x50f8*/      uxtb r4, r0
/*0x50fa*/      mov r5, r1
/*0x50fc*/      cmp r4, r2
/*0x50fe*/      bhs jump_510a
/*0x5100*/      subs r0, r2, r4
/*0x5102*/      ubfx r7, r0, #8, #0x10
/*0x5106*/      uxtb r0, r0
/*0x5108*/      b jump_5110
            jump_510a:
/*0x510a*/      movs r7, #0
/*0x510c*/      uxth r4, r2
/*0x510e*/      mov r0, r7
            jump_5110:
/*0x5110*/      mov r8, r0
/*0x5112*/      cbz r4, jump_5126
/*0x5114*/      mov r2, r4
/*0x5116*/      mov r1, r5
/*0x5118*/      mov r0, r6
/*0x511a*/      bl function_78
/*0x511e*/      cmp r0, #1
/*0x5120*/      bne jump_515e
/*0x5122*/      add r5, r4
/*0x5124*/      add r6, r4
            jump_5126:
/*0x5126*/      movs r4, #0
/*0x5128*/      mov.w sb, #0x100
/*0x512c*/      b jump_5146
            jump_512e:
/*0x512e*/      mov r2, sb
/*0x5130*/      mov r1, r5
/*0x5132*/      mov r0, r6
/*0x5134*/      bl function_78
/*0x5138*/      cmp r0, #1
/*0x513a*/      bne jump_515e
/*0x513c*/      add.w r5, r5, #0x100
/*0x5140*/      add.w r6, r6, #0x100
/*0x5144*/      adds r4, r4, #1
            jump_5146:
/*0x5146*/      cmp r4, r7
/*0x5148*/      blt jump_512e
/*0x514a*/      movs.w r0, r8
/*0x514e*/      beq jump_5164
/*0x5150*/      mov r2, r0
/*0x5152*/      mov r1, r5
/*0x5154*/      mov r0, r6
/*0x5156*/      bl function_78
/*0x515a*/      cmp r0, #1
/*0x515c*/      beq jump_5164
            jump_515e:
/*0x515e*/      movs r0, #0
            jump_5160:
/*0x5160*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_5164:
/*0x5164*/      movs r0, #1
/*0x5166*/      b jump_5160

            .thumb_func
            spi_flash_write_enable:
/*0x5168*/      push {r3, r4, r5, lr}
/*0x516a*/      ldr r4, [pc, #0x1c] /* data_5188 */
/*0x516c*/      movs r0, #6
/*0x516e*/      strb.w r0, [sp]
/*0x5172*/      mov.w r5, #0x400
/*0x5176*/      str r5, [r4, #0x28]
/*0x5178*/      movs r2, #1
/*0x517a*/      movs r1, #0
/*0x517c*/      mov r0, sp
/*0x517e*/      bl spi_write_read
/*0x5182*/      str r5, [r4, #0x24]
/*0x5184*/      pop {r3, r4, r5, pc}

/*0x5186*/  .byte 0x00
/*0x5187*/  .byte 0x00

            data_5188:
/*0x5188*/  .word 0x400b2000


            .thumb_func
            spi_flash_set_status_reg:
/*0x518c*/      push {r4, lr}
/*0x518e*/      mov.w r4, #0x19a
/*0x5192*/      bl spi_flash_write_status_register
/*0x5196*/      b jump_51a4
            jump_5198:
/*0x5198*/      movs r0, #0x64
/*0x519a*/      bl spin_wait_maybe
/*0x519e*/      bl spi_flash_read_wip
/*0x51a2*/      cbz r0, jump_51ac
            jump_51a4:
/*0x51a4*/      subs r4, r4, #1
/*0x51a6*/      adds r0, r4, #1
/*0x51a8*/      bne jump_5198
/*0x51aa*/      pop {r4, pc}
            jump_51ac:
/*0x51ac*/      movs r0, #1
/*0x51ae*/      pop {r4, pc}

            .thumb_func
            setup_intr_priority:
/*0x51b0*/      push {r4, lr}
/*0x51b2*/      mov.w r1, #0x2c00
/*0x51b6*/      movs r0, #0
/*0x51b8*/      bl nvic_set_vtor
/*0x51bc*/      ldr r1, [pc, #0x78] /* data_5238 */
/*0x51be*/      ldr r0, [r1]
/*0x51c0*/      movw r2, #0xf8ff
/*0x51c4*/      and.w r0, r0, r2
/*0x51c8*/      ldr r2, [pc, #0x70] /* data_523c */
/*0x51ca*/      orr r0, r0, #0x300
/*0x51ce*/      orr.w r0, r0, r2
/*0x51d2*/      str r0, [r1]
/*0x51d4*/      mov.w r2, #0
/*0x51d8*/      mov r1, r2
/*0x51da*/      mov.w r0, #3
/*0x51de*/      bl calc_nvic_priority
/*0x51e2*/      mov r1, r0
/*0x51e4*/      movs r0, #0x2b
/*0x51e6*/      bl ppb_set_nvic_priority
/*0x51ea*/      movs r2, #0
/*0x51ec*/      mov r1, r2
/*0x51ee*/      movs r0, #3
/*0x51f0*/      bl calc_nvic_priority
/*0x51f4*/      mov r1, r0
/*0x51f6*/      movs r0, #0x2c
/*0x51f8*/      bl ppb_set_nvic_priority
/*0x51fc*/      movs r2, #0
/*0x51fe*/      movs r1, #1
/*0x5200*/      movs r0, #3
/*0x5202*/      bl calc_nvic_priority
/*0x5206*/      mov r1, r0
/*0x5208*/      movs r0, #0x2a
/*0x520a*/      bl ppb_set_nvic_priority
/*0x520e*/      movs r2, #0
/*0x5210*/      movs r1, #2
/*0x5212*/      movs r0, #3
/*0x5214*/      bl calc_nvic_priority
/*0x5218*/      mov r1, r0
/*0x521a*/      movs r0, #0x29
/*0x521c*/      bl ppb_set_nvic_priority
/*0x5220*/      movs r2, #0
/*0x5222*/      movs r1, #2
/*0x5224*/      movs r0, #3
/*0x5226*/      bl calc_nvic_priority
/*0x522a*/      mov r1, r0
/*0x522c*/      pop.w {r4, lr}
/*0x5230*/      movs r0, #0x35
/*0x5232*/      b.w ppb_set_nvic_priority

/*0x5236*/  .byte 0x00
/*0x5237*/  .byte 0x00

            data_5238:
/*0x5238*/  .word 0xe000ed0c
            data_523c:
/*0x523c*/  .word 0x05fa0000


            .thumb_func
            calc_nvic_priority:
/*0x5240*/      push {r4, r5, lr}
/*0x5242*/      and r3, r0, #7
/*0x5246*/      movs r5, #4
/*0x5248*/      rsb.w r0, r3, #7
/*0x524c*/      cmp r0, #4
/*0x524e*/      bhi jump_5252
/*0x5250*/      mov r5, r0
            jump_5252:
/*0x5252*/      movs r4, #0
/*0x5254*/      adds r0, r3, #4
/*0x5256*/      cmp r0, #7
/*0x5258*/      blo jump_525c
/*0x525a*/      subs r4, r3, #3
            jump_525c:
/*0x525c*/      movs r3, #1
/*0x525e*/      lsl.w r0, r3, r5
/*0x5262*/      subs r0, r0, #1
/*0x5264*/      ands r0, r1
/*0x5266*/      lsls r0, r4
/*0x5268*/      lsls r3, r4
/*0x526a*/      subs r3, r3, #1
/*0x526c*/      ands r3, r2
/*0x526e*/      orrs r0, r3
/*0x5270*/      pop {r4, r5, pc}

            .thumb_func
            ppb_set_nvic_priority:
/*0x5272*/      lsls r1, r1, #0x1c
/*0x5274*/      lsrs r1, r1, #0x18
/*0x5276*/      mov.w r2, #-0x1fff2000
/*0x527a*/      cmp r0, #0
/*0x527c*/      bge jump_528a
/*0x527e*/      and r0, r0, #0xf
/*0x5282*/      add r0, r2
/*0x5284*/      strb.w r1, [r0, #0xd14]
/*0x5288*/      bx lr
            jump_528a:
/*0x528a*/      add r0, r2
/*0x528c*/      strb.w r1, [r0, #0x400]
/*0x5290*/      bx lr

/*0x5292*/  .byte 0x00
/*0x5293*/  .byte 0x00


            .thumb_func
            nvic_set_vtor:
/*0x5294*/      ldr r2, [pc, #8] /* data_52a0 */
/*0x5296*/      ands r1, r2
/*0x5298*/      orrs r1, r0
/*0x529a*/      ldr r0, [pc, #8] /* data_52a4 */
/*0x529c*/      str r1, [r0]
/*0x529e*/      bx lr

            data_52a0:
/*0x52a0*/  .word 0x1fffff80
            data_52a4:
/*0x52a4*/  .word 0xe000ed08


            .thumb_func
            spi_flash_init:
/*0x52a8*/      push {r4, lr}
/*0x52aa*/      bl spi_gpio_setup
/*0x52ae*/      ldr r4, [pc, #0x3c] /* data_52ec */
/*0x52b0*/      ldrb r0, [r4]
/*0x52b2*/      cmp r0, #1
/*0x52b4*/      bne jump_52e6
/*0x52b6*/      bl spi_init
/*0x52ba*/      cmp r0, #1
/*0x52bc*/      bne jump_52de
/*0x52be*/      bl spi_flash_read_status
/*0x52c2*/      cbz r0, jump_52ce
/*0x52c4*/      movs r0, #0
/*0x52c6*/      bl spi_flash_set_status_reg
/*0x52ca*/      cmp r0, #1
/*0x52cc*/      bne jump_52de
            jump_52ce:
/*0x52ce*/      bl spi_flash_read_status
/*0x52d2*/      cbz r0, jump_52e2
/*0x52d4*/      movs r0, #0
/*0x52d6*/      bl spi_flash_set_status_reg
/*0x52da*/      cmp r0, #1
/*0x52dc*/      beq jump_52e2
            jump_52de:
/*0x52de*/      movs r0, #0
/*0x52e0*/      pop {r4, pc}
            jump_52e2:
/*0x52e2*/      movs r0, #2
/*0x52e4*/      strb r0, [r4]
            jump_52e6:
/*0x52e6*/      movs r0, #1
/*0x52e8*/      pop {r4, pc}

/*0x52ea*/  .byte 0x00
/*0x52eb*/  .byte 0x00

            data_52ec:
/*0x52ec*/  .word 0x20000228


            .thumb_func
            spi_gpio_setup:
/*0x52f0*/      push {r4, lr}
/*0x52f2*/      ldr r4, [pc, #0x10] /* data_5304 */
/*0x52f4*/      ldrb r0, [r4]
/*0x52f6*/      cbnz r0, jump_5300
/*0x52f8*/      bl spi_gpio_init
/*0x52fc*/      movs r0, #1
/*0x52fe*/      strb r0, [r4]
            jump_5300:
/*0x5300*/      movs r0, #1
/*0x5302*/      pop {r4, pc}

            data_5304:
/*0x5304*/  .word 0x20000228


            .thumb_func
            jump_2:
/*0x5308*/      b.w pinmux_select_b789

            .thumb_func
            function_e_41:
/*0x530c*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x5310*/      ldr.w ip, [pc, #0x64] /* data_5378 */
/*0x5314*/      movs r1, #0
/*0x5316*/      ldr.w r8, [pc, #0x58] /* data_5370 */
/*0x531a*/      ldr.w sb, [pc, #0x58] /* data_5374 */
/*0x531e*/      mov r2, r1
/*0x5320*/      add.w r7, ip, #0x90
            jump_5324:
/*0x5324*/      movs r0, #0
/*0x5326*/      add.w r3, r8, r1, lsl #4
/*0x532a*/      add.w r5, sb, r1, lsl #4
/*0x532e*/      add.w r4, ip, r1, lsl #4
/*0x5332*/      add.w r6, r7, r1, lsl #4
            jump_5336:
/*0x5336*/      strh.w r2, [r3, r0, lsl #1]
/*0x533a*/      strh.w r2, [r5, r0, lsl #1]
/*0x533e*/      strh.w r2, [r4, r0, lsl #1]
/*0x5342*/      strh.w r2, [r6, r0, lsl #1]
/*0x5346*/      adds r0, r0, #1
/*0x5348*/      uxtb r0, r0
/*0x534a*/      cmp r0, #8
/*0x534c*/      blo jump_5336
/*0x534e*/      adds r1, r1, #1
/*0x5350*/      uxtb r1, r1
/*0x5352*/      cmp r1, #9
/*0x5354*/      blo jump_5324
/*0x5356*/      ldr r0, [pc, #0x24] /* data_537c */
/*0x5358*/      str r2, [r0, #0x2c]
/*0x535a*/      subs r0, #0x48
/*0x535c*/      strb r2, [r0]
/*0x535e*/      strb r2, [r0, #2]
/*0x5360*/      strh r2, [r0, #0x16]
/*0x5362*/      strh r2, [r0, #0x18]
/*0x5364*/      strb r2, [r0, #-0x31]
/*0x5368*/      strb r2, [r0, #-0x30]
/*0x536c*/      pop.w {r4, r5, r6, r7, r8, sb, pc}

            data_5370:
/*0x5370*/  .word 0x20002e2c
            data_5374:
/*0x5374*/  .word 0x20002ebc
            data_5378:
/*0x5378*/  .word 0x20000b9a
            data_537c:
/*0x537c*/  .word 0x200000d8


            .thumb_func
            function_e_42:
/*0x5380*/      push {r4, r5, r6, r7, lr}
/*0x5382*/      rsb r0, r0, r0, lsl #16
/*0x5386*/      mov.w r5, #0x3e8
/*0x538a*/      udiv r0, r0, r5
/*0x538e*/      mov.w r3, #0x1c2
/*0x5392*/      muls r0, r3, r0
/*0x5394*/      movw r4, #0xffff
/*0x5398*/      udiv r0, r0, r4
/*0x539c*/      uxth r3, r0
/*0x539e*/      rsb r0, r1, r1, lsl #16
/*0x53a2*/      udiv r0, r0, r5
/*0x53a6*/      movs r2, #0
/*0x53a8*/      mov.w r1, #0x1c2
/*0x53ac*/      muls r0, r1, r0
/*0x53ae*/      udiv r0, r0, r4
/*0x53b2*/      ldr r7, [pc, #0x28] /* data_53dc */
/*0x53b4*/      ldr r6, [pc, #0x28] /* data_53e0 */
/*0x53b6*/      uxth r5, r0
            jump_53b8:
/*0x53b8*/      movs r0, #0
/*0x53ba*/      add.w r1, r7, r2, lsl #4
/*0x53be*/      add.w r4, r6, r2, lsl #4
            jump_53c2:
/*0x53c2*/      strh.w r3, [r1, r0, lsl #1]
/*0x53c6*/      strh.w r5, [r4, r0, lsl #1]
/*0x53ca*/      adds r0, r0, #1
/*0x53cc*/      uxtb r0, r0
/*0x53ce*/      cmp r0, #8
/*0x53d0*/      blo jump_53c2
/*0x53d2*/      adds r2, r2, #1
/*0x53d4*/      uxtb r2, r2
/*0x53d6*/      cmp r2, #9
/*0x53d8*/      blo jump_53b8
/*0x53da*/      pop {r4, r5, r6, r7, pc}

            data_53dc:
/*0x53dc*/  .word 0x20002e2c
            data_53e0:
/*0x53e0*/  .word 0x20002ebc


            .thumb_func
            function_e_43:
/*0x53e4*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x53e8*/      ldr.w r8, [pc, #0x42c] /* data_5818 */
/*0x53ec*/      movs r0, #0
/*0x53ee*/      str r0, [sp]
/*0x53f0*/      ldr.w r0, [r8, #0x5c]
/*0x53f4*/      movw r1, #0x7530
/*0x53f8*/      cmp r0, r1
/*0x53fa*/      bhi jump_540e
/*0x53fc*/      ldrb.w r1, [r8]
/*0x5400*/      mov r0, r8
/*0x5402*/      cmp r1, #0xa
/*0x5404*/      bne jump_5428
/*0x5406*/      ldr r0, [r0, #0x5c]
/*0x5408*/      cmp.w r0, #0xfa0
/*0x540c*/      bls jump_5428
            jump_540e:
/*0x540e*/      movs r1, #0x14
/*0x5410*/      strb.w r1, [r8]
/*0x5414*/      movs r1, #0
/*0x5416*/      strb.w r1, [r8, #2]
/*0x541a*/      strb.w r1, [r8, #3]
/*0x541e*/      ldr r0, [pc, #0x3fc] /* data_581c */
/*0x5420*/      strh.w r1, [r0, #0x84]
/*0x5424*/      bl function_e_83
            jump_5428:
/*0x5428*/      ldr r4, [pc, #0x3f4] /* data_5820 */
/*0x542a*/      ldrh r0, [r4]
/*0x542c*/      mov.w sb, #1
/*0x5430*/      cbnz r0, jump_54b0
/*0x5432*/      and r0, r5, #1
/*0x5436*/      mvns r0, r0
/*0x5438*/      uxtb r1, r0
/*0x543a*/      movs r6, #0
/*0x543c*/      mov r0, r7
/*0x543e*/      bl function_e_85
/*0x5442*/      ldr r1, [pc, #0x3e0] /* data_5824 */
/*0x5444*/      movs r0, #0
            jump_5446:
/*0x5446*/      adds r2, r4, r0
/*0x5448*/      ldrb r2, [r2, #2]
/*0x544a*/      strb r2, [r1, r0]
/*0x544c*/      adds r0, r0, #1
/*0x544e*/      uxtb r0, r0
/*0x5450*/      cmp r0, #9
/*0x5452*/      blo jump_5446
/*0x5454*/      ldrb r0, [r1, #8]
/*0x5456*/      movs r5, #0
/*0x5458*/      and r0, r0, #0xbf
/*0x545c*/      strb r0, [r1, #8]
/*0x545e*/      ldrb r0, [r4, #0x1c]
/*0x5460*/      and r0, r0, #0xbf
/*0x5464*/      strb r0, [r4, #0x1c]
            jump_5466:
/*0x5466*/      ldr r0, [pc, #0x3bc] /* data_5824 */
/*0x5468*/      movs r4, #0
/*0x546a*/      ldrb.w sl, [r0, r5]
/*0x546e*/      ldr r0, [pc, #0x3b0] /* data_5820 */
/*0x5470*/      add r0, r5
/*0x5472*/      str r0, [sp, #4]
/*0x5474*/      ldrb r1, [r0, #0x14]
/*0x5476*/      eor.w fp, r1, sl
            jump_547a:
/*0x547a*/      ldrb.w r0, [r8, #0x26]
/*0x547e*/      mov r2, r8
/*0x5480*/      cmp r0, #1
/*0x5482*/      beq jump_5548
/*0x5484*/      cmp r0, #2
/*0x5486*/      beq jump_554c
/*0x5488*/      ldr r0, [pc, #0x39c] /* data_5828 */
            jump_548a:
/*0x548a*/      lsls.w r1, fp, #0x1f
/*0x548e*/      add.w r0, r0, r5, lsl #3
/*0x5492*/      ldrb r0, [r0, r4]
/*0x5494*/      beq jump_5592
/*0x5496*/      ldrb.w r3, [r2, #0x3d]
/*0x549a*/      add.w r1, r4, r5, lsl #3
/*0x549e*/      cmp r1, r3
/*0x54a0*/      bne jump_54a8
/*0x54a2*/      movs r0, #0xe8
/*0x54a4*/      movs r3, #1
/*0x54a6*/      str r3, [sp]
            jump_54a8:
/*0x54a8*/      ldrb.w r3, [r2, #0x3e]
/*0x54ac*/      cmp r1, r3
/*0x54ae*/      b jump_54b2
            jump_54b0:
/*0x54b0*/      b jump_5872
            jump_54b2:
/*0x54b2*/      bne jump_54ba
/*0x54b4*/      movs r0, #0xca
/*0x54b6*/      movs r1, #1
/*0x54b8*/      str r1, [sp]
            jump_54ba:
/*0x54ba*/      ldrb r1, [r2]
/*0x54bc*/      cmp r1, #0xa
/*0x54be*/      beq jump_54c4
/*0x54c0*/      str.w sb, [r2, #0x5c]
            jump_54c4:
/*0x54c4*/      movs r3, #0
/*0x54c6*/      strb r3, [r2, #0x17]
/*0x54c8*/      ldrb.w r1, [r2, #0x32]
/*0x54cc*/      cmp r1, #0x3f
/*0x54ce*/      blo jump_54f0
/*0x54d0*/      ldrb.w r2, [r8]
/*0x54d4*/      mov r1, r8
/*0x54d6*/      cmp r2, #0xa
/*0x54d8*/      beq jump_54f0
/*0x54da*/      movs r2, #0xa
/*0x54dc*/      strb r2, [r1]
/*0x54de*/      ldr r3, [pc, #0x338] /* data_5818 */
/*0x54e0*/      adds r3, #0x80
/*0x54e2*/      str.w sb, [r3, #0x24]
/*0x54e6*/      str.w sb, [r1, #0x5c]
/*0x54ea*/      movs r2, #0
/*0x54ec*/      strb.w r2, [r8, #0x32]
            jump_54f0:
/*0x54f0*/      lsls.w r1, sl, #0x1f
/*0x54f4*/      beq jump_5550
/*0x54f6*/      ldrb.w r1, [r8, #0x32]
/*0x54fa*/      cmp r1, #0x3f
/*0x54fc*/      blo jump_5518
/*0x54fe*/      ldrb.w r2, [r8]
/*0x5502*/      mov r1, r8
/*0x5504*/      cmp r2, #0xa
/*0x5506*/      beq jump_5518
/*0x5508*/      movs r2, #0xa
/*0x550a*/      strb r2, [r1]
/*0x550c*/      ldr r3, [pc, #0x308] /* data_5818 */
/*0x550e*/      adds r3, #0x80
/*0x5510*/      str.w sb, [r3, #0x24]
/*0x5514*/      str.w sb, [r1, #0x5c]
            jump_5518:
/*0x5518*/      mov r2, r4
/*0x551a*/      mov r1, r5
/*0x551c*/      bl function_e_12
/*0x5520*/      mov r7, r0
/*0x5522*/      cmp r0, #0xe8
/*0x5524*/      beq jump_561a
/*0x5526*/      cmp r7, #0xca
/*0x5528*/      beq jump_5546
            jump_552a:
/*0x552a*/      ldr r1, [pc, #0x300] /* data_582c */
/*0x552c*/      movs r0, #0
/*0x552e*/      add.w r2, r1, #0x2a
            jump_5532:
/*0x5532*/      ldrb r3, [r1, r0]
/*0x5534*/      cmp r3, r5
/*0x5536*/      bne jump_553e
/*0x5538*/      ldrb r3, [r2, r0]
/*0x553a*/      cmp r3, r4
/*0x553c*/      beq jump_561c
            jump_553e:
/*0x553e*/      adds r0, r0, #1
/*0x5540*/      uxtb r0, r0
/*0x5542*/      cmp r0, #0x2a
/*0x5544*/      blo jump_5532
            jump_5546:
/*0x5546*/      b jump_57a2
            jump_5548:
/*0x5548*/      ldr r0, [pc, #0x2e4] /* data_5830 */
/*0x554a*/      b jump_548a
            jump_554c:
/*0x554c*/      ldr r0, [pc, #0x2e4] /* data_5834 */
/*0x554e*/      b jump_548a
            jump_5550:
/*0x5550*/      mov r2, r4
/*0x5552*/      mov r1, r5
/*0x5554*/      bl function_e_13
/*0x5558*/      mov r7, r0
/*0x555a*/      cmp r0, #0xe8
/*0x555c*/      beq jump_5568
/*0x555e*/      ldrb.w r0, [r8, #2]
/*0x5562*/      cmp r0, #1
/*0x5564*/      beq jump_556c
/*0x5566*/      b jump_557a
            jump_5568:
/*0x5568*/      strb.w sb, [r8, #2]
            jump_556c:
/*0x556c*/      cmp r5, #8
/*0x556e*/      bne jump_557a
/*0x5570*/      cmp r4, #7
/*0x5572*/      bne jump_557a
/*0x5574*/      movs r0, #0x14
/*0x5576*/      strb.w r0, [r8]
            jump_557a:
/*0x557a*/      ldrb.w r1, [r8, #0x20]
/*0x557e*/      mov r0, r8
/*0x5580*/      cmp r1, #1
/*0x5582*/      bne jump_5598
/*0x5584*/      movs r1, #0xa
/*0x5586*/      strb r1, [r0]
/*0x5588*/      ldr r2, [pc, #0x28c] /* data_5818 */
/*0x558a*/      adds r2, #0x80
/*0x558c*/      str.w sb, [r2, #0x24]
/*0x5590*/      b jump_5594
            jump_5592:
/*0x5592*/      b jump_5856
            jump_5594:
/*0x5594*/      str.w sb, [r0, #0x5c]
            jump_5598:
/*0x5598*/      ldrb r0, [r0]
/*0x559a*/      cmp r0, #2
/*0x559c*/      beq jump_55a4
/*0x559e*/      cmp r0, #4
/*0x55a0*/      bne jump_55ec
/*0x55a2*/      b jump_55ee
            jump_55a4:
/*0x55a4*/      cmp r7, #0xe8
/*0x55a6*/      beq jump_55ec
/*0x55a8*/      cmp r7, #0xca
/*0x55aa*/      beq jump_55ec
/*0x55ac*/      cmp r7, #0x10
/*0x55ae*/      beq jump_55bc
/*0x55b0*/      cmp r7, #0x37
/*0x55b2*/      beq jump_55bc
/*0x55b4*/      cmp r7, #0x36
/*0x55b6*/      beq jump_55bc
/*0x55b8*/      cmp r7, #0x38
/*0x55ba*/      bne jump_55c4
            jump_55bc:
/*0x55bc*/      ldrb.w r0, [r8, #2]
/*0x55c0*/      cmp r0, #1
/*0x55c2*/      beq jump_55ec
            jump_55c4:
/*0x55c4*/      ldrb.w r1, [r8, #2]
/*0x55c8*/      strb.w r1, [r8, #0x35]
/*0x55cc*/      strb.w r5, [r8, #0x33]
/*0x55d0*/      strb.w r4, [r8, #0x34]
/*0x55d4*/      movs r1, #3
/*0x55d6*/      strb.w r1, [r8]
/*0x55da*/      movs r1, #0
/*0x55dc*/      ldr r2, [pc, #0x258] /* data_5838 */
/*0x55de*/      strb.w r1, [r8, #0x32]
/*0x55e2*/      mov r0, r1
            jump_55e4:
/*0x55e4*/      strb r1, [r2, r0]
/*0x55e6*/      adds r0, r0, #1
/*0x55e8*/      cmp r0, #0xff
/*0x55ea*/      bls jump_55e4
            jump_55ec:
/*0x55ec*/      b jump_5732
            jump_55ee:
/*0x55ee*/      cmp r7, #0xe8
/*0x55f0*/      beq jump_56a6
/*0x55f2*/      ldrb.w r0, [r8, #0x32]
/*0x55f6*/      cmp r0, #0x3f
/*0x55f8*/      bhs jump_55fe
/*0x55fa*/      cmp r7, #0xca
/*0x55fc*/      bne jump_5632
            jump_55fe:
/*0x55fe*/      mov r1, r8
/*0x5600*/      cbz r0, jump_562e
/*0x5602*/      cmp r0, #0x3f
/*0x5604*/      blo jump_561e
/*0x5606*/      movs r0, #0xa
/*0x5608*/      mov r2, r1
/*0x560a*/      strb r0, [r1]
/*0x560c*/      ldr r1, [pc, #0x208] /* data_5818 */
/*0x560e*/      adds r1, #0x80
/*0x5610*/      str.w sb, [r1, #0x24]
/*0x5614*/      str.w sb, [r2, #0x5c]
/*0x5618*/      b jump_5632
            jump_561a:
/*0x561a*/      b jump_576e
            jump_561c:
/*0x561c*/      b jump_5776
            jump_561e:
/*0x561e*/      bl function_26
/*0x5622*/      cmp r0, #1
/*0x5624*/      bne jump_5632
/*0x5626*/      movs r1, #5
/*0x5628*/      strb.w r1, [r8]
/*0x562c*/      b jump_5632
            jump_562e:
/*0x562e*/      strb.w sb, [r1]
            jump_5632:
/*0x5632*/      ldrb.w r0, [r8, #2]
/*0x5636*/      cmp r0, #1
/*0x5638*/      bne jump_572a
/*0x563a*/      ldr r0, [sp]
/*0x563c*/      cmp r0, #1
/*0x563e*/      beq jump_572a
/*0x5640*/      cmp r7, #0xca
/*0x5642*/      beq jump_5684
/*0x5644*/      ldr r1, [pc, #0x1e4] /* data_582c */
/*0x5646*/      movs r0, #0
/*0x5648*/      add.w r2, r1, #0x2a
            jump_564c:
/*0x564c*/      ldrb r3, [r1, r0]
/*0x564e*/      cmp r3, r5
/*0x5650*/      bne jump_5658
/*0x5652*/      ldrb r3, [r2, r0]
/*0x5654*/      cmp r3, r4
/*0x5656*/      beq jump_5662
            jump_5658:
/*0x5658*/      adds r0, r0, #1
/*0x565a*/      uxtb r0, r0
/*0x565c*/      cmp r0, #0x2a
/*0x565e*/      blo jump_564c
/*0x5660*/      b jump_5684
            jump_5662:
/*0x5662*/      cmp r0, #0x2a
/*0x5664*/      bhs jump_5684
/*0x5666*/      movs r2, #1
/*0x5668*/      and r1, r0, #0x1f
/*0x566c*/      lsls r2, r1
/*0x566e*/      ldr r7, [pc, #0x1a8] /* data_5818 */
/*0x5670*/      lsrs r1, r0, #5
/*0x5672*/      adds r7, #0xf8
/*0x5674*/      ldr.w r3, [r7, r1, lsl #2]
/*0x5678*/      orrs r3, r2
/*0x567a*/      str.w r3, [r7, r1, lsl #2]
/*0x567e*/      ldr r1, [pc, #0x1ac] /* data_582c */
/*0x5680*/      adds r1, #0x54
/*0x5682*/      ldrb r7, [r1, r0]
            jump_5684:
/*0x5684*/      cmp r7, #0xc4
/*0x5686*/      beq jump_56a8
/*0x5688*/      bgt jump_5698
/*0x568a*/      cmp r7, #5
/*0x568c*/      beq jump_56da
/*0x568e*/      cmp r7, #0xa
/*0x5690*/      beq jump_56d0
/*0x5692*/      cmp r7, #0x17
/*0x5694*/      bne jump_56a0
/*0x5696*/      b jump_56c6
            jump_5698:
/*0x5698*/      cmp r7, #0xc5
/*0x569a*/      beq jump_56b4
/*0x569c*/      cmp r7, #0xc6
/*0x569e*/      beq jump_56ae
            jump_56a0:
/*0x56a0*/      ldrb.w r0, [r8, #1]
/*0x56a4*/      cbz r0, jump_56b8
            jump_56a6:
/*0x56a6*/      b jump_5732
            jump_56a8:
/*0x56a8*/      bl function_e_90
/*0x56ac*/      b jump_56b8
            jump_56ae:
/*0x56ae*/      bl function_e_88
/*0x56b2*/      b jump_56b8
            jump_56b4:
/*0x56b4*/      bl function_e_91
            jump_56b8:
/*0x56b8*/      movs r6, #1
/*0x56ba*/      movs r0, #6
/*0x56bc*/      str.w r0, [r8, #0x60]
/*0x56c0*/      str.w r0, [r8, #0x64]
/*0x56c4*/      b jump_5740
            jump_56c6:
/*0x56c6*/      ldr.w r1, [r8, #0x64]
/*0x56ca*/      mov r0, r8
/*0x56cc*/      adds r1, #0x1e
/*0x56ce*/      b jump_56e4
            jump_56d0:
/*0x56d0*/      ldr.w r1, [r8, #0x64]
/*0x56d4*/      mov r0, r8
/*0x56d6*/      adds r1, #0xc8
/*0x56d8*/      b jump_56e4
            jump_56da:
/*0x56da*/      ldr.w r1, [r8, #0x64]
/*0x56de*/      mov r0, r8
/*0x56e0*/      add.w r1, r1, #0x3e8
            jump_56e4:
/*0x56e4*/      str r1, [r0, #0x64]
/*0x56e6*/      ldr.w r0, [r8, #0x64]
/*0x56ea*/      movw r1, #0xf830
/*0x56ee*/      cmp r0, r1
/*0x56f0*/      bhs jump_5732
/*0x56f2*/      ldrb.w r0, [r8, #0x32]
/*0x56f6*/      cbz r0, jump_5710
/*0x56f8*/      ldr.w r1, [r8, #0x64]
/*0x56fc*/      lsrs r2, r1, #8
/*0x56fe*/      ldr r1, [pc, #0x138] /* data_5838 */
/*0x5700*/      add.w r0, r1, r0, lsl #2
/*0x5704*/      strb r2, [r0, #-0x2]!
/*0x5708*/      ldr.w r1, [r8, #0x64]
/*0x570c*/      strb r1, [r0, #1]
/*0x570e*/      b jump_5720
            jump_5710:
/*0x5710*/      ldr.w r0, [r8, #0x64]
/*0x5714*/      str.w r0, [r8, #0x60]
/*0x5718*/      movs r1, #0
/*0x571a*/      mov r0, r1
/*0x571c*/      bl function_e_11
            jump_5720:
/*0x5720*/      movs r6, #2
/*0x5722*/      strb.w sb, [r8, #1]
/*0x5726*/      b jump_5848

/*0x5728*/  .byte 0xff
/*0x5729*/  .byte 0xe7

            jump_572a:
/*0x572a*/      ldrb.w r1, [r8, #1]
/*0x572e*/      mov r0, r8
/*0x5730*/      cbz r1, jump_5738
            jump_5732:
/*0x5732*/      cmp r6, #1
/*0x5734*/      beq jump_5740
/*0x5736*/      b jump_5848
            jump_5738:
/*0x5738*/      movs r6, #1
/*0x573a*/      movs r1, #6
/*0x573c*/      str r1, [r0, #0x60]
/*0x573e*/      str r1, [r0, #0x64]
            jump_5740:
/*0x5740*/      ldrb.w r0, [r8]
/*0x5744*/      cmp r0, #4
/*0x5746*/      bne jump_5848
/*0x5748*/      movs r1, #1
/*0x574a*/      mov r0, r7
/*0x574c*/      bl function_e_32
/*0x5750*/      mov r0, r7
/*0x5752*/      bl function_13
/*0x5756*/      cmp r0, #1
/*0x5758*/      bne jump_5762
/*0x575a*/      ldr r1, [pc, #0xbc] /* data_5818 */
/*0x575c*/      adds r1, #0x80
/*0x575e*/      str.w sb, [r1, #0x10]
            jump_5762:
/*0x5762*/      movs r1, #1
/*0x5764*/      mov r0, r7
/*0x5766*/      bl function_e_11
/*0x576a*/      movs r6, #0
/*0x576c*/      b jump_5848
            jump_576e:
/*0x576e*/      movs r0, #0
/*0x5770*/      strb.w r0, [r8, #2]
/*0x5774*/      b jump_552a
            jump_5776:
/*0x5776*/      cmp r0, #0x2a
/*0x5778*/      bhs jump_57a2
/*0x577a*/      ldr.w ip, [pc, #0x9c] /* data_5818 */
/*0x577e*/      lsr.w lr, r0, #5
/*0x5782*/      add.w ip, ip, #0xf8
/*0x5786*/      and r3, r0, #0x1f
/*0x578a*/      ldr.w r1, [ip, lr, lsl #2]
/*0x578e*/      lsl.w r2, sb, r3
/*0x5792*/      tst r1, r2
/*0x5794*/      beq jump_57a2
/*0x5796*/      ldr r3, [pc, #0x94] /* data_582c */
/*0x5798*/      adds r3, #0x7e
/*0x579a*/      bics r1, r2
/*0x579c*/      ldrb r7, [r3, r0]
/*0x579e*/      str.w r1, [ip, lr, lsl #2]
            jump_57a2:
/*0x57a2*/      ldrb.w r0, [r8, #1]
/*0x57a6*/      cbnz r0, jump_57ee
/*0x57a8*/      mov r0, r7
/*0x57aa*/      bl function_e_23
/*0x57ae*/      ldr r1, [pc, #0x68] /* data_5818 */
/*0x57b0*/      mov r0, r7
/*0x57b2*/      adds r1, #0x80
/*0x57b4*/      str.w sb, [r1, #0x10]
/*0x57b8*/      movs r1, #0
/*0x57ba*/      bl function_e_32
/*0x57be*/      ldrb.w r0, [r8]
/*0x57c2*/      cmp r0, #1
/*0x57c4*/      beq jump_57d0
/*0x57c6*/      cmp r0, #3
/*0x57c8*/      beq jump_57e0
/*0x57ca*/      cmp r0, #4
/*0x57cc*/      bne jump_580c
/*0x57ce*/      b jump_57f0
            jump_57d0:
/*0x57d0*/      bl function_80
/*0x57d4*/      cmp r0, #1
/*0x57d6*/      bne jump_580c
/*0x57d8*/      movs r0, #2
/*0x57da*/      strb.w r0, [r8]
/*0x57de*/      b jump_580c
            jump_57e0:
/*0x57e0*/      bl function_80
/*0x57e4*/      cmp r0, #1
/*0x57e6*/      bne jump_580c
/*0x57e8*/      movs r1, #4
/*0x57ea*/      strb.w r1, [r8]
            jump_57ee:
/*0x57ee*/      b jump_580c
            jump_57f0:
/*0x57f0*/      cmp r7, #0xe8
/*0x57f2*/      beq jump_580c
/*0x57f4*/      cmp r7, #0xca
/*0x57f6*/      beq jump_580c
/*0x57f8*/      ldrb.w r1, [r8, #0x32]
/*0x57fc*/      cbz r1, jump_580c
/*0x57fe*/      ldrb.w r0, [r8, #1]
/*0x5802*/      cbnz r0, jump_580c
/*0x5804*/      movs r1, #0
/*0x5806*/      mov r0, r7
/*0x5808*/      bl function_e_11
            jump_580c:
/*0x580c*/      ldrb.w r0, [r8, #1]
/*0x5810*/      mov r7, r8
/*0x5812*/      cmp r0, #1
/*0x5814*/      bne jump_5848
/*0x5816*/      b jump_583c

            data_5818:
/*0x5818*/  .word 0x20000058
            data_581c:
/*0x581c*/  .word 0x20002e2c
            data_5820:
/*0x5820*/  .word 0x20002de4
            data_5824:
/*0x5824*/  .word 0x2000090c
            data_5828:
/*0x5828*/  .word data_8ec8
            data_582c:
/*0x582c*/  .word data_8c36
            data_5830:
/*0x5830*/  .word data_8f10
            data_5834:
/*0x5834*/  .word data_8f58
            data_5838:
/*0x5838*/  .word 0x2000080c

            jump_583c:
/*0x583c*/      bl function_80
/*0x5840*/      cmp r0, #1
/*0x5842*/      bne jump_5848
/*0x5844*/      movs r0, #0
/*0x5846*/      strb r0, [r7, #1]
            jump_5848:
/*0x5848*/      ldr r0, [sp, #4]
/*0x584a*/      ldrb r1, [r0, #0x14]
/*0x584c*/      lsl.w r0, sb, r4
/*0x5850*/      eors r1, r0
/*0x5852*/      ldr r0, [sp, #4]
/*0x5854*/      strb r1, [r0, #0x14]
            jump_5856:
/*0x5856*/      adds r4, r4, #1
/*0x5858*/      uxtb r4, r4
/*0x585a*/      lsr.w fp, fp, #1
/*0x585e*/      lsr.w sl, sl, #1
/*0x5862*/      cmp r4, #8
/*0x5864*/      blo.w jump_547a
/*0x5868*/      adds r5, r5, #1
/*0x586a*/      uxtb r5, r5
/*0x586c*/      cmp r5, #9
/*0x586e*/      blo.w jump_5466
            jump_5872:
/*0x5872*/      ldrb.w r0, [r8]
/*0x5876*/      mov r4, r8
/*0x5878*/      cmp r0, #5
/*0x587a*/      bne jump_5930
/*0x587c*/      bl function_80
/*0x5880*/      cmp r0, #1
/*0x5882*/      bne jump_5930
/*0x5884*/      ldrb.w r2, [r4, #0x35]
/*0x5888*/      ldr r1, [pc, #0xd4] /* data_5960 */
/*0x588a*/      cbz r2, jump_5892
/*0x588c*/      cmp r2, #1
/*0x588e*/      beq jump_58ae
/*0x5890*/      b jump_58ca
            jump_5892:
/*0x5892*/      movs r0, #2
/*0x5894*/      strb r0, [r1]
/*0x5896*/      ldrb.w r0, [r4, #0x32]
/*0x589a*/      cmp r0, #2
/*0x589c*/      bne jump_58ca
/*0x589e*/      ldr r0, [pc, #0xc4] /* data_5964 */
/*0x58a0*/      ldrb r3, [r0, #6]
/*0x58a2*/      cbnz r3, jump_58ca
/*0x58a4*/      ldrb r0, [r0, #7]
/*0x58a6*/      cmp r0, #6
/*0x58a8*/      bne jump_58ca
/*0x58aa*/      movs r0, #0x12
/*0x58ac*/      b jump_58c8
            jump_58ae:
/*0x58ae*/      movs r0, #3
/*0x58b0*/      strb r0, [r1]
/*0x58b2*/      ldrb.w r0, [r4, #0x32]
/*0x58b6*/      cmp r0, #2
/*0x58b8*/      bne jump_58ca
/*0x58ba*/      ldr r0, [pc, #0xa8] /* data_5964 */
/*0x58bc*/      ldrb r3, [r0, #6]
/*0x58be*/      cbnz r3, jump_58ca
/*0x58c0*/      ldrb r0, [r0, #7]
/*0x58c2*/      cmp r0, #6
/*0x58c4*/      bne jump_58ca
/*0x58c6*/      movs r0, #0x13
            jump_58c8:
/*0x58c8*/      strb r0, [r1]
            jump_58ca:
/*0x58ca*/      ldr r3, [pc, #0x98] /* data_5964 */
/*0x58cc*/      movs r0, #0
            jump_58ce:
/*0x58ce*/      adds r6, r1, r0
/*0x58d0*/      ldrb r5, [r3, r0]
/*0x58d2*/      adds r0, r0, #1
/*0x58d4*/      strb r5, [r6, #1]
/*0x58d6*/      cmp r0, #0xff
/*0x58d8*/      bls jump_58ce
/*0x58da*/      add.w r4, r4, #0x18
/*0x58de*/      ldr r1, [pc, #0x88] /* data_5968 */
/*0x58e0*/      ldrb r0, [r4, #0xe]
/*0x58e2*/      add.w r0, r0, r0, lsl #1
/*0x58e6*/      add.w r0, r1, r0, lsl #4
/*0x58ea*/      ldrb r1, [r4]
/*0x58ec*/      add.w r0, r0, r1, lsl #4
/*0x58f0*/      cbz r2, jump_5958
/*0x58f2*/      sub.w r0, r0, #0xc
            jump_58f6:
/*0x58f6*/      ldrb r2, [r4, #0x1c]
/*0x58f8*/      ldrb r3, [r4, #0x1b]
/*0x58fa*/      ldr r1, [r0, #8]
/*0x58fc*/      add.w r2, r2, r3, lsl #3
/*0x5900*/      ldr r0, [r0]
/*0x5902*/      add.w r5, r1, r2, lsl #8
/*0x5906*/      add r0, r2
/*0x5908*/      sub.w r4, r4, #0x18
/*0x590c*/      mov.w r2, #0
/*0x5910*/      mov r1, r0
/*0x5912*/      bl function_e_97
/*0x5916*/      movs r2, #1
/*0x5918*/      add.w r1, r5, #0xff
/*0x591c*/      mov r0, r5
/*0x591e*/      bl function_e_97
/*0x5922*/      bl function_e_83
/*0x5926*/      strb.w sb, [r4]
/*0x592a*/      movs r0, #0
/*0x592c*/      strb.w r0, [r4, #0x32]
            jump_5930:
/*0x5930*/      bl function_80
/*0x5934*/      cmp r0, #1
/*0x5936*/      bne jump_5954
/*0x5938*/      ldrb r0, [r4]
/*0x593a*/      cmp r0, #0x14
/*0x593c*/      bne jump_5954
/*0x593e*/      movs r5, #0
/*0x5940*/      strb r5, [r4, #0x16]
/*0x5942*/      bl function_e_83
/*0x5946*/      str r5, [r4, #0x5c]
/*0x5948*/      strb r5, [r4]
/*0x594a*/      ldr r0, [pc, #0x20] /* data_596c */
/*0x594c*/      str r5, [r0, #0x24]
/*0x594e*/      adds r0, #0x78
/*0x5950*/      str r5, [r0]
/*0x5952*/      str r5, [r0, #4]
            jump_5954:
/*0x5954*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
            jump_5958:
/*0x5958*/      b jump_595a
            jump_595a:
/*0x595a*/      sub.w r0, r0, #0x10
/*0x595e*/      b jump_58f6

            data_5960:
/*0x5960*/  .word 0x20001cba
            data_5964:
/*0x5964*/  .word 0x2000080c
            data_5968:
/*0x5968*/  .word data_8d50
            data_596c:
/*0x596c*/  .word 0x200000d8


            .thumb_func
            loc_5970:
/*0x5970*/      push {r3, lr}
/*0x5972*/      ldr r1, [pc, #0x38] /* data_59ac */
/*0x5974*/      ldr r2, [pc, #0x38] /* data_59b0 */
/*0x5976*/      cmp r0, #6
/*0x5978*/      bhs jump_59a8
/*0x597a*/      tbb [pc, r0]

/*0x597e*/  .byte 0x03
/*0x597f*/  .byte 0x03
/*0x5980*/  .byte 0x03
/*0x5981*/  .byte 0x07
/*0x5982*/  .byte 0x0a
/*0x5983*/  .byte 0x12

            switch_5984:
/*0x5984*/      ldr r2, [pc, #0x2c] /* data_59b4 */
/*0x5986*/      strb r0, [r2]
/*0x5988*/      movs r0, #0
/*0x598a*/      b jump_598e
            switch_598c:
/*0x598c*/      movs r0, #1
            jump_598e:
/*0x598e*/      strb r0, [r1]
/*0x5990*/      b jump_59a8
            switch_5992:
/*0x5992*/      ldrb r0, [r2]
/*0x5994*/      str r0, [sp]
/*0x5996*/      movs r2, #0x40
/*0x5998*/      mov r1, sp
/*0x599a*/      movs r0, #3
/*0x599c*/      bl usb_copy_send
/*0x59a0*/      b jump_59a8
            switch_59a2:
/*0x59a2*/      ldr r0, [pc, #0x14] /* data_59b8 */
/*0x59a4*/      ldrb r0, [r0, #0xc]
/*0x59a6*/      strb r0, [r2]
            jump_59a8:
/*0x59a8*/      movs r0, #0x4f
/*0x59aa*/      pop {r3, pc}

            data_59ac:
/*0x59ac*/  .word 0x200001ce
            data_59b0:
/*0x59b0*/  .word 0x200001d4
            data_59b4:
/*0x59b4*/  .word 0x200001cd
            data_59b8:
/*0x59b8*/  .word 0x200007cc


            .thumb_func
            function_63:
/*0x59bc*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x59c0*/      sub sp, #0x24
/*0x59c2*/      bl function_64
/*0x59c6*/      ldr r0, [pc, #0x1e4] /* data_5bac */
/*0x59c8*/      ldrb r0, [r0]
/*0x59ca*/      cmp r0, #1
/*0x59cc*/      bne jump_5aca
/*0x59ce*/      movs r1, #1
/*0x59d0*/      movw r0, #0x303
/*0x59d4*/      bl ckcu_apb1_clock_enable
/*0x59d8*/      add r0, sp, #0x10
/*0x59da*/      bl call_3636
/*0x59de*/      movw sb, #0x1c1
/*0x59e2*/      strh.w sb, [sp, #0x10]
/*0x59e6*/      add r1, sp, #0x10
/*0x59e8*/      ldr r0, [pc, #0x1c4] /* data_5bb0 */
/*0x59ea*/      bl call_360c
/*0x59ee*/      mov r0, sp
/*0x59f0*/      bl function_e_36
/*0x59f4*/      movs r5, #1
/*0x59f6*/      movs r4, #0
/*0x59f8*/      strb.w r5, [sp, #8]
/*0x59fc*/      movs r6, #6
/*0x59fe*/      strh.w r4, [sp, #0xa]
/*0x5a02*/      strb.w r4, [sp]
/*0x5a06*/      mov r1, sp
/*0x5a08*/      ldr r0, [pc, #0x1a4] /* data_5bb0 */
/*0x5a0a*/      str r6, [sp, #4]
/*0x5a0c*/      bl function_62
/*0x5a10*/      strb.w r5, [sp]
/*0x5a14*/      mov r1, sp
/*0x5a16*/      ldr r0, [pc, #0x198] /* data_5bb0 */
/*0x5a18*/      str r6, [sp, #4]
/*0x5a1a*/      bl function_62
/*0x5a1e*/      mov.w r8, #2
/*0x5a22*/      strb.w r8, [sp]
/*0x5a26*/      mov r1, sp
/*0x5a28*/      ldr r0, [pc, #0x184] /* data_5bb0 */
/*0x5a2a*/      str r6, [sp, #4]
/*0x5a2c*/      bl function_62
/*0x5a30*/      mov.w sl, #3
/*0x5a34*/      strb.w sl, [sp]
/*0x5a38*/      mov r1, sp
/*0x5a3a*/      ldr r0, [pc, #0x174] /* data_5bb0 */
/*0x5a3c*/      str r6, [sp, #4]
/*0x5a3e*/      bl function_62
/*0x5a42*/      ldr r0, [pc, #0x16c] /* data_5bb0 */
/*0x5a44*/      str r4, [r0, #0x7c]
/*0x5a46*/      add r0, sp, #0x10
/*0x5a48*/      bl call_3636
/*0x5a4c*/      strh.w sb, [sp, #0x10]
/*0x5a50*/      add r1, sp, #0x10
/*0x5a52*/      ldr r0, [pc, #0x160] /* data_5bb4 */
/*0x5a54*/      bl call_360c
/*0x5a58*/      mov r0, sp
/*0x5a5a*/      bl function_e_36
/*0x5a5e*/      strb.w r5, [sp, #8]
/*0x5a62*/      strh.w r4, [sp, #0xa]
/*0x5a66*/      strb.w r4, [sp]
/*0x5a6a*/      mov r1, sp
/*0x5a6c*/      ldr r0, [pc, #0x144] /* data_5bb4 */
/*0x5a6e*/      str r6, [sp, #4]
/*0x5a70*/      bl function_62
/*0x5a74*/      strb.w r5, [sp]
/*0x5a78*/      mov r1, sp
/*0x5a7a*/      ldr r0, [pc, #0x138] /* data_5bb4 */
/*0x5a7c*/      str r6, [sp, #4]
/*0x5a7e*/      bl function_62
/*0x5a82*/      strb.w r8, [sp]
/*0x5a86*/      mov r1, sp
/*0x5a88*/      ldr r0, [pc, #0x128] /* data_5bb4 */
/*0x5a8a*/      str r6, [sp, #4]
/*0x5a8c*/      bl function_62
/*0x5a90*/      movs r7, #7
/*0x5a92*/      strb.w sl, [sp]
/*0x5a96*/      mov r1, sp
/*0x5a98*/      ldr r0, [pc, #0x118] /* data_5bb4 */
/*0x5a9a*/      str r7, [sp, #4]
/*0x5a9c*/      bl function_62
/*0x5aa0*/      ldr r0, [pc, #0x110] /* data_5bb4 */
/*0x5aa2*/      str r4, [r0, #0x7c]
/*0x5aa4*/      add r0, sp, #0x14
/*0x5aa6*/      bl function_e_31
/*0x5aaa*/      ldr.w fp, [pc, #0x10c] /* data_5bb8 */
/*0x5aae*/      strh.w sb, [sp, #0x14]
/*0x5ab2*/      add r1, sp, #0x14
/*0x5ab4*/      mov r0, fp
/*0x5ab6*/      bl function_e_30
/*0x5aba*/      mov r0, sp
/*0x5abc*/      bl clear_some_mem
/*0x5ac0*/      strb.w r5, [sp, #8]
/*0x5ac4*/      strh.w r4, [sp, #0xe]
/*0x5ac8*/      b jump_5acc
            jump_5aca:
/*0x5aca*/      b jump_5ba2
            jump_5acc:
/*0x5acc*/      strb.w r4, [sp]
/*0x5ad0*/      mov r1, sp
/*0x5ad2*/      mov r0, fp
/*0x5ad4*/      str r7, [sp, #4]
/*0x5ad6*/      bl function_e_29
/*0x5ada*/      strb.w r5, [sp]
/*0x5ade*/      mov r1, sp
/*0x5ae0*/      mov r0, fp
/*0x5ae2*/      str r7, [sp, #4]
/*0x5ae4*/      bl function_e_29
/*0x5ae8*/      strb.w r8, [sp]
/*0x5aec*/      mov r1, sp
/*0x5aee*/      mov r0, fp
/*0x5af0*/      str r7, [sp, #4]
/*0x5af2*/      bl function_e_29
/*0x5af6*/      strb.w sl, [sp]
/*0x5afa*/      mov r1, sp
/*0x5afc*/      mov r0, fp
/*0x5afe*/      str r7, [sp, #4]
/*0x5b00*/      bl function_e_29
/*0x5b04*/      mov r0, fp
/*0x5b06*/      str.w r4, [fp, #0x7c]
/*0x5b0a*/      movs r1, #1
/*0x5b0c*/      bl function_e_27
/*0x5b10*/      add r0, sp, #0x14
/*0x5b12*/      bl function_e_31
/*0x5b16*/      strh.w sb, [sp, #0x14]
/*0x5b1a*/      ldr.w sb, [pc, #0xa0] /* data_5bbc */
/*0x5b1e*/      add r1, sp, #0x14
/*0x5b20*/      mov r0, sb
/*0x5b22*/      bl function_e_30
/*0x5b26*/      mov r0, sp
/*0x5b28*/      bl clear_some_mem
/*0x5b2c*/      strb.w r5, [sp, #8]
/*0x5b30*/      strh.w r4, [sp, #0xe]
/*0x5b34*/      strb.w r4, [sp]
/*0x5b38*/      mov r1, sp
/*0x5b3a*/      mov r0, sb
/*0x5b3c*/      str r6, [sp, #4]
/*0x5b3e*/      bl function_e_29
/*0x5b42*/      strb.w r5, [sp]
/*0x5b46*/      mov r1, sp
/*0x5b48*/      mov r0, sb
/*0x5b4a*/      str r7, [sp, #4]
/*0x5b4c*/      bl function_e_29
/*0x5b50*/      strb.w r8, [sp]
/*0x5b54*/      mov r1, sp
/*0x5b56*/      mov r0, sb
/*0x5b58*/      str r7, [sp, #4]
/*0x5b5a*/      bl function_e_29
/*0x5b5e*/      strb.w sl, [sp]
/*0x5b62*/      mov r1, sp
/*0x5b64*/      mov r0, sb
/*0x5b66*/      str r7, [sp, #4]
/*0x5b68*/      bl function_e_29
/*0x5b6c*/      mov r0, sb
/*0x5b6e*/      str.w r4, [sb, #0x7c]
/*0x5b72*/      movs r1, #1
/*0x5b74*/      bl function_e_27
/*0x5b78*/      movs r1, #1
/*0x5b7a*/      ldr r0, [pc, #0x34] /* data_5bb0 */
/*0x5b7c*/      bl gptm_enable_disable
/*0x5b80*/      movs r1, #1
/*0x5b82*/      ldr r0, [pc, #0x30] /* data_5bb4 */
/*0x5b84*/      bl gptm_enable_disable
/*0x5b88*/      movs r1, #1
/*0x5b8a*/      mov r0, fp
/*0x5b8c*/      bl function_e_28
/*0x5b90*/      movs r1, #1
/*0x5b92*/      mov r0, sb
/*0x5b94*/      bl function_e_28
/*0x5b98*/      bl call_5ca8
/*0x5b9c*/      ldr r1, [pc, #0xc] /* data_5bac */
/*0x5b9e*/      strb.w r8, [r1]
            jump_5ba2:
/*0x5ba2*/      add sp, #0x24
/*0x5ba4*/      movs r0, #1
/*0x5ba6*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

/*0x5baa*/  .byte 0x00
/*0x5bab*/  .byte 0x00

            data_5bac:
/*0x5bac*/  .word 0x2000021d
            data_5bb0:
/*0x5bb0*/  .word 0x4006e000
            data_5bb4:
/*0x5bb4*/  .word 0x4006f000
            data_5bb8:
/*0x5bb8*/  .word 0x4002c000
            data_5bbc:
/*0x5bbc*/  .word 0x4002d000


            .thumb_func
            function_64:
/*0x5bc0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5bc4*/      ldr r4, [pc, #0xc4] /* data_5c8c */
/*0x5bc6*/      ldrb r0, [r4]
/*0x5bc8*/      cbnz r0, jump_5c48
/*0x5bca*/      movs r1, #1
/*0x5bcc*/      mov.w r0, #0x70000
/*0x5bd0*/      bl ckcu_ahb_clock_enable
/*0x5bd4*/      ldr r5, [pc, #0xb8] /* data_5c90 */
/*0x5bd6*/      movs r2, #1
/*0x5bd8*/      lsls r1, r2, #9
/*0x5bda*/      mov r0, r5
/*0x5bdc*/      bl gpio_set_output_current
/*0x5be0*/      movs r2, #1
/*0x5be2*/      lsls r6, r2, #0xa
/*0x5be4*/      mov r1, r6
/*0x5be6*/      mov r0, r5
/*0x5be8*/      bl gpio_set_output_current
/*0x5bec*/      movs r2, #1
/*0x5bee*/      lsls r1, r2, #0xb
/*0x5bf0*/      mov r0, r5
/*0x5bf2*/      bl gpio_set_output_current
/*0x5bf6*/      ldr r7, [pc, #0x9c] /* data_5c94 */
/*0x5bf8*/      movs r2, #1
/*0x5bfa*/      movs r1, #0x80
/*0x5bfc*/      mov r0, r7
/*0x5bfe*/      bl gpio_set_output_current
/*0x5c02*/      movs r2, #1
/*0x5c04*/      mov r1, r2
/*0x5c06*/      mov r0, r7
/*0x5c08*/      bl gpio_set_output_current
/*0x5c0c*/      movs r2, #1
/*0x5c0e*/      movs r1, #2
/*0x5c10*/      mov r0, r7
/*0x5c12*/      bl gpio_set_output_current
/*0x5c16*/      movs r2, #1
/*0x5c18*/      movs r1, #4
/*0x5c1a*/      mov r0, r7
/*0x5c1c*/      bl gpio_set_output_current
/*0x5c20*/      movs r2, #1
/*0x5c22*/      movs r1, #8
/*0x5c24*/      mov r0, r5
/*0x5c26*/      bl gpio_set_open_drain
/*0x5c2a*/      movs r2, #1
/*0x5c2c*/      lsls r1, r2, #0xe
/*0x5c2e*/      mov r0, r7
/*0x5c30*/      bl gpio_set_open_drain
/*0x5c34*/      ldr.w r8, [pc, #0x60] /* data_5c98 */
/*0x5c38*/      movs r2, #1
/*0x5c3a*/      mov r1, r2
/*0x5c3c*/      mov r0, r8
/*0x5c3e*/      bl gpio_set_open_drain
/*0x5c42*/      movs r2, #1
/*0x5c44*/      movs r1, #4
/*0x5c46*/      b jump_5c4a
            jump_5c48:
/*0x5c48*/      b jump_5c86
            jump_5c4a:
/*0x5c4a*/      mov r0, r8
/*0x5c4c*/      bl gpio_set_open_drain
/*0x5c50*/      movs r2, #1
/*0x5c52*/      movs r1, #0x80
/*0x5c54*/      mov r0, r5
/*0x5c56*/      bl gpio_set_open_drain
/*0x5c5a*/      movs r2, #1
/*0x5c5c*/      movs r1, #0x40
/*0x5c5e*/      mov r0, r8
/*0x5c60*/      bl gpio_set_output_current
/*0x5c64*/      movs r2, #1
/*0x5c66*/      mov r1, r6
/*0x5c68*/      mov r0, r7
/*0x5c6a*/      bl gpio_set_open_drain
/*0x5c6e*/      movs r2, #1
/*0x5c70*/      movs r1, #0x10
/*0x5c72*/      mov r0, r5
/*0x5c74*/      bl gpio_set_open_drain
/*0x5c78*/      movs r2, #1
/*0x5c7a*/      movs r1, #0x40
/*0x5c7c*/      mov r0, r5
/*0x5c7e*/      bl gpio_set_open_drain
/*0x5c82*/      movs r0, #1
/*0x5c84*/      strb r0, [r4]
            jump_5c86:
/*0x5c86*/      movs r0, #1
/*0x5c88*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5c8c:
/*0x5c8c*/  .word 0x2000021d
            data_5c90:
/*0x5c90*/  .word 0x400b4000
            data_5c94:
/*0x5c94*/  .word 0x400b0000
            data_5c98:
/*0x5c98*/  .word 0x400b2000


            .thumb_func
            function_36:
/*0x5c9c*/      cbz r0, jump_5ca2
/*0x5c9e*/      b.w function_50
            jump_5ca2:
/*0x5ca2*/      b.w call_5ca8

/*0x5ca6*/  .byte 0x00
/*0x5ca7*/  .byte 0x00


            .thumb_func
            call_5ca8:
/*0x5ca8*/      push {r4, lr}
/*0x5caa*/      ldr r4, [pc, #0xf8] /* data_5da4 */
/*0x5cac*/      movs r2, #2
/*0x5cae*/      lsls r1, r2, #8
/*0x5cb0*/      mov r0, r4
/*0x5cb2*/      bl gpio_set_pin_pull_up_down
/*0x5cb6*/      movs r2, #4
/*0x5cb8*/      movs r1, #9
/*0x5cba*/      movs r0, #2
/*0x5cbc*/      bl afio_pin_config
/*0x5cc0*/      movs r2, #2
/*0x5cc2*/      lsls r1, r2, #9
/*0x5cc4*/      mov r0, r4
/*0x5cc6*/      bl gpio_set_pin_pull_up_down
/*0x5cca*/      movs r2, #4
/*0x5ccc*/      movs r1, #0xa
/*0x5cce*/      movs r0, #2
/*0x5cd0*/      bl afio_pin_config
/*0x5cd4*/      movs r2, #2
/*0x5cd6*/      lsls r1, r2, #0xa
/*0x5cd8*/      mov r0, r4
/*0x5cda*/      bl gpio_set_pin_pull_up_down
/*0x5cde*/      movs r2, #4
/*0x5ce0*/      movs r1, #0xb
/*0x5ce2*/      movs r0, #2
/*0x5ce4*/      bl afio_pin_config
/*0x5ce8*/      ldr r4, [pc, #0xbc] /* data_5da8 */
/*0x5cea*/      movs r2, #2
/*0x5cec*/      movs r1, #0x80
/*0x5cee*/      mov r0, r4
/*0x5cf0*/      bl gpio_set_pin_pull_up_down
/*0x5cf4*/      movs r2, #4
/*0x5cf6*/      movs r1, #7
/*0x5cf8*/      movs r0, #0
/*0x5cfa*/      bl afio_pin_config
/*0x5cfe*/      movs r2, #2
/*0x5d00*/      movs r1, #1
/*0x5d02*/      mov r0, r4
/*0x5d04*/      bl gpio_set_pin_pull_up_down
/*0x5d08*/      movs r1, #0
/*0x5d0a*/      movs r2, #4
/*0x5d0c*/      mov r0, r1
/*0x5d0e*/      bl afio_pin_config
/*0x5d12*/      movs r2, #2
/*0x5d14*/      mov r1, r2
/*0x5d16*/      mov r0, r4
/*0x5d18*/      bl gpio_set_pin_pull_up_down
/*0x5d1c*/      movs r2, #4
/*0x5d1e*/      movs r1, #1
/*0x5d20*/      movs r0, #0
/*0x5d22*/      bl afio_pin_config
/*0x5d26*/      movs r2, #2
/*0x5d28*/      movs r1, #4
/*0x5d2a*/      mov r0, r4
/*0x5d2c*/      bl gpio_set_pin_pull_up_down
/*0x5d30*/      movs r2, #4
/*0x5d32*/      movs r1, #2
/*0x5d34*/      movs r0, #0
/*0x5d36*/      bl afio_pin_config
/*0x5d3a*/      movs r2, #4
/*0x5d3c*/      movs r1, #3
/*0x5d3e*/      movs r0, #2
/*0x5d40*/      bl afio_pin_config
/*0x5d44*/      movs r2, #4
/*0x5d46*/      movs r1, #0xe
/*0x5d48*/      movs r0, #0
/*0x5d4a*/      bl afio_pin_config
/*0x5d4e*/      movs r2, #4
/*0x5d50*/      movs r1, #0
/*0x5d52*/      movs r0, #1
/*0x5d54*/      bl afio_pin_config
/*0x5d58*/      movs r2, #4
/*0x5d5a*/      movs r1, #2
/*0x5d5c*/      movs r0, #1
/*0x5d5e*/      bl afio_pin_config
/*0x5d62*/      movs r2, #4
/*0x5d64*/      movs r1, #7
/*0x5d66*/      movs r0, #2
/*0x5d68*/      bl afio_pin_config
/*0x5d6c*/      movs r2, #2
/*0x5d6e*/      movs r1, #0x40
/*0x5d70*/      ldr r0, [pc, #0x38] /* data_5dac */
/*0x5d72*/      bl gpio_set_pin_pull_up_down
/*0x5d76*/      movs r2, #4
/*0x5d78*/      movs r1, #6
/*0x5d7a*/      movs r0, #1
/*0x5d7c*/      bl afio_pin_config
/*0x5d80*/      movs r2, #4
/*0x5d82*/      movs r1, #0xa
/*0x5d84*/      movs r0, #0
/*0x5d86*/      bl afio_pin_config
/*0x5d8a*/      movs r2, #4
/*0x5d8c*/      mov r1, r2
/*0x5d8e*/      movs r0, #2
/*0x5d90*/      bl afio_pin_config
/*0x5d94*/      movs r2, #4
/*0x5d96*/      movs r1, #6
/*0x5d98*/      pop.w {r4, lr}
/*0x5d9c*/      movs r0, #2
/*0x5d9e*/      b.w afio_pin_config

/*0x5da2*/  .byte 0x00
/*0x5da3*/  .byte 0x00

            data_5da4:
/*0x5da4*/  .word 0x400b4000
            data_5da8:
/*0x5da8*/  .word 0x400b0000
            data_5dac:
/*0x5dac*/  .word 0x400b2000


            .thumb_func
            function_50:
/*0x5db0*/      push {r4, lr}
/*0x5db2*/      ldr r4, [pc, #0xf8] /* data_5eac */
/*0x5db4*/      movs r2, #1
/*0x5db6*/      lsls r1, r2, #9
/*0x5db8*/      mov r0, r4
/*0x5dba*/      bl gpio_set_pin_pull_up_down
/*0x5dbe*/      movs r2, #0
/*0x5dc0*/      movs r1, #9
/*0x5dc2*/      movs r0, #2
/*0x5dc4*/      bl afio_pin_config
/*0x5dc8*/      movs r2, #1
/*0x5dca*/      lsls r1, r2, #0xa
/*0x5dcc*/      mov r0, r4
/*0x5dce*/      bl gpio_set_pin_pull_up_down
/*0x5dd2*/      movs r2, #0
/*0x5dd4*/      movs r1, #0xa
/*0x5dd6*/      movs r0, #2
/*0x5dd8*/      bl afio_pin_config
/*0x5ddc*/      movs r2, #1
/*0x5dde*/      lsls r1, r2, #0xb
/*0x5de0*/      mov r0, r4
/*0x5de2*/      bl gpio_set_pin_pull_up_down
/*0x5de6*/      movs r2, #0
/*0x5de8*/      movs r1, #0xb
/*0x5dea*/      movs r0, #2
/*0x5dec*/      bl afio_pin_config
/*0x5df0*/      ldr r4, [pc, #0xbc] /* data_5eb0 */
/*0x5df2*/      movs r2, #1
/*0x5df4*/      movs r1, #0x80
/*0x5df6*/      mov r0, r4
/*0x5df8*/      bl gpio_set_pin_pull_up_down
/*0x5dfc*/      movs r2, #0
/*0x5dfe*/      movs r1, #7
/*0x5e00*/      mov r0, r2
/*0x5e02*/      bl afio_pin_config
/*0x5e06*/      movs r2, #1
/*0x5e08*/      mov r1, r2
/*0x5e0a*/      mov r0, r4
/*0x5e0c*/      bl gpio_set_pin_pull_up_down
/*0x5e10*/      movs r2, #0
/*0x5e12*/      mov r1, r2
/*0x5e14*/      mov r0, r2
/*0x5e16*/      bl afio_pin_config
/*0x5e1a*/      movs r2, #1
/*0x5e1c*/      movs r1, #2
/*0x5e1e*/      mov r0, r4
/*0x5e20*/      bl gpio_set_pin_pull_up_down
/*0x5e24*/      movs r2, #0
/*0x5e26*/      movs r1, #1
/*0x5e28*/      mov r0, r2
/*0x5e2a*/      bl afio_pin_config
/*0x5e2e*/      movs r2, #1
/*0x5e30*/      movs r1, #4
/*0x5e32*/      mov r0, r4
/*0x5e34*/      bl gpio_set_pin_pull_up_down
/*0x5e38*/      movs r2, #0
/*0x5e3a*/      movs r1, #2
/*0x5e3c*/      mov r0, r2
/*0x5e3e*/      bl afio_pin_config
/*0x5e42*/      movs r2, #0
/*0x5e44*/      movs r1, #3
/*0x5e46*/      movs r0, #2
/*0x5e48*/      bl afio_pin_config
/*0x5e4c*/      movs r2, #0
/*0x5e4e*/      movs r1, #0xe
/*0x5e50*/      mov r0, r2
/*0x5e52*/      bl afio_pin_config
/*0x5e56*/      movs r2, #0
/*0x5e58*/      mov r1, r2
/*0x5e5a*/      movs r0, #1
/*0x5e5c*/      bl afio_pin_config
/*0x5e60*/      movs r2, #0
/*0x5e62*/      movs r1, #2
/*0x5e64*/      movs r0, #1
/*0x5e66*/      bl afio_pin_config
/*0x5e6a*/      movs r2, #0
/*0x5e6c*/      movs r1, #7
/*0x5e6e*/      movs r0, #2
/*0x5e70*/      bl afio_pin_config
/*0x5e74*/      movs r2, #1
/*0x5e76*/      movs r1, #0x40
/*0x5e78*/      ldr r0, [pc, #0x38] /* data_5eb4 */
/*0x5e7a*/      bl gpio_set_pin_pull_up_down
/*0x5e7e*/      movs r2, #0
/*0x5e80*/      movs r1, #6
/*0x5e82*/      movs r0, #1
/*0x5e84*/      bl afio_pin_config
/*0x5e88*/      movs r2, #0
/*0x5e8a*/      movs r1, #0xa
/*0x5e8c*/      mov r0, r2
/*0x5e8e*/      bl afio_pin_config
/*0x5e92*/      movs r2, #0
/*0x5e94*/      movs r1, #4
/*0x5e96*/      movs r0, #2
/*0x5e98*/      bl afio_pin_config
/*0x5e9c*/      movs r2, #0
/*0x5e9e*/      movs r1, #6
/*0x5ea0*/      pop.w {r4, lr}
/*0x5ea4*/      movs r0, #2
/*0x5ea6*/      b.w afio_pin_config

/*0x5eaa*/  .byte 0x00
/*0x5eab*/  .byte 0x00

            data_5eac:
/*0x5eac*/  .word 0x400b4000
            data_5eb0:
/*0x5eb0*/  .word 0x400b0000
            data_5eb4:
/*0x5eb4*/  .word 0x400b2000


            .thumb_func
            function_3:
/*0x5eb8*/      push {r4, r5, lr}
/*0x5eba*/      ldr r1, [pc, #0x34] /* data_5ef0 */
/*0x5ebc*/      ldr r4, [r1]
/*0x5ebe*/      ldr r3, [r1, #0x48]
/*0x5ec0*/      mov.w r2, #1
/*0x5ec4*/      str r2, [r1]
/*0x5ec6*/      mov.w r2, #0
/*0x5eca*/      str r2, [r1, #0x48]
/*0x5ecc*/      ldr r5, [pc, #0x24] /* data_5ef4 */
/*0x5ece*/      str r2, [r5, #0x10]
/*0x5ed0*/      str r2, [r5]
/*0x5ed2*/      str r4, [r1]
/*0x5ed4*/      ldr r2, [pc, #0x20] /* data_5ef8 */
/*0x5ed6*/      sub.w r1, r1, #0x618
/*0x5eda*/      ldr r4, [r2]
/*0x5edc*/      orr r4, r4, #4
/*0x5ee0*/      str r4, [r2]
/*0x5ee2*/      cbz r0, jump_5eec
/*0x5ee4*/      wfi 
            jump_5ee6:
/*0x5ee6*/      str.w r3, [r1, #0x660]
/*0x5eea*/      pop {r4, r5, pc}
            jump_5eec:
/*0x5eec*/      wfe 
/*0x5eee*/      b jump_5ee6

            data_5ef0:
/*0x5ef0*/  .word 0x43100618
            data_5ef4:
/*0x5ef4*/  .word 0x42d4208c
            data_5ef8:
/*0x5ef8*/  .word 0xe000ed10


            .thumb_func
            ckcu_voodoo1:
/*0x5efc*/      ldr r2, [pc, #0x14] /* data_5f14 */
/*0x5efe*/      cmp r1, #1
/*0x5f00*/      ldr.w r1, [r2, #0x104]
/*0x5f04*/      beq jump_5f0e
/*0x5f06*/      bics r1, r0
            jump_5f08:
/*0x5f08*/      str.w r1, [r2, #0x104]
/*0x5f0c*/      bx lr
            jump_5f0e:
/*0x5f0e*/      orrs r1, r0
/*0x5f10*/      b jump_5f08

/*0x5f12*/  .byte 0x00
/*0x5f13*/  .byte 0x00

            data_5f14:
/*0x5f14*/  .word 0x40088000


            .thumb_func
            function_e_46:
/*0x5f18*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x5f1c*/      ldr r0, [pc, #0x64] /* data_5f84 */
/*0x5f1e*/      ldrh r0, [r0]
/*0x5f20*/      cmp r0, #0
/*0x5f22*/      bne jump_5f80
/*0x5f24*/      ldr.w sb, [pc, #0x5c] /* data_5f84 */
/*0x5f28*/      movs r7, #0
/*0x5f2a*/      add.w sb, sb, #0x28
/*0x5f2e*/      ldrb.w fp, [sb, #0x1c]
/*0x5f32*/      b jump_5f7c
            jump_5f34:
/*0x5f34*/      ldr r0, [pc, #0x4c] /* data_5f84 */
/*0x5f36*/      mov.w sl, #1
/*0x5f3a*/      add r0, r7
/*0x5f3c*/      mov r8, r0
/*0x5f3e*/      ldrb r5, [r0, #2]
/*0x5f40*/      ldrb r6, [r0, #0x14]
/*0x5f42*/      eors r6, r5
/*0x5f44*/      movs r4, #0
            jump_5f46:
/*0x5f46*/      lsls r0, r6, #0x1f
/*0x5f48*/      beq jump_5f6c
/*0x5f4a*/      sbfx r2, r5, #0, #1
/*0x5f4e*/      ldr.w r3, [sb, #0xc]
/*0x5f52*/      adds r2, r2, #1
/*0x5f54*/      mov r1, r4
/*0x5f56*/      mov r0, r7
/*0x5f58*/      blx r3
/*0x5f5a*/      cmp r0, #1
/*0x5f5c*/      bne jump_5f6c
/*0x5f5e*/      ldrb.w r1, [r8, #0x14]
/*0x5f62*/      lsl.w r0, sl, r4
/*0x5f66*/      eors r1, r0
/*0x5f68*/      strb.w r1, [r8, #0x14]
            jump_5f6c:
/*0x5f6c*/      adds r4, r4, #1
/*0x5f6e*/      lsrs r6, r6, #1
/*0x5f70*/      lsrs r5, r5, #1
/*0x5f72*/      uxtb r4, r4
/*0x5f74*/      cmp r4, #8
/*0x5f76*/      blo jump_5f46
/*0x5f78*/      adds r7, r7, #1
/*0x5f7a*/      uxtb r7, r7
            jump_5f7c:
/*0x5f7c*/      cmp r7, fp
/*0x5f7e*/      blo jump_5f34
            jump_5f80:
/*0x5f80*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_5f84:
/*0x5f84*/  .word 0x20002de4


            .thumb_func
            function_e_47:
/*0x5f88*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x5f8c*/      ldr.w sl, [pc, #0x108] /* data_6098 */
/*0x5f90*/      ldr r0, [pc, #0x108] /* data_609c */
/*0x5f92*/      sub.w sb, sl, #0x28
/*0x5f96*/      ldrb.w r5, [sl, #0x1b]
/*0x5f9a*/      lsrs r4, r5, #1
/*0x5f9c*/      add.w r0, r0, r4, lsl #3
/*0x5fa0*/      ldr.w r8, [r0]
/*0x5fa4*/      ldr r7, [r0, #4]
/*0x5fa6*/      ldrh.w r0, [sb]
/*0x5faa*/      cbz r0, jump_5fb6
/*0x5fac*/      ldrh.w r1, [sb]
/*0x5fb0*/      subs r1, r1, #1
/*0x5fb2*/      strh.w r1, [sb]
            jump_5fb6:
/*0x5fb6*/      lsls r0, r5, #0x1f
/*0x5fb8*/      mov.w fp, #0x100
/*0x5fbc*/      mov.w r3, #0
/*0x5fc0*/      beq jump_5fce
/*0x5fc2*/      bl function_e_50
/*0x5fc6*/      mov r6, r0
/*0x5fc8*/      ldr r0, [pc, #0xd4] /* data_60a0 */
/*0x5fca*/      movs r1, #8
/*0x5fcc*/      b jump_6026
            jump_5fce:
/*0x5fce*/      ldr r0, [pc, #0xd0] /* data_60a0 */
/*0x5fd0*/      adds r0, #0x20
/*0x5fd2*/      movs r1, #8
/*0x5fd4*/      b jump_5fda
            jump_5fd6:
/*0x5fd6*/      ldm r0!, {r2}
/*0x5fd8*/      str r3, [r2]
            jump_5fda:
/*0x5fda*/      subs r1, r1, #1
/*0x5fdc*/      bhs jump_5fd6
/*0x5fde*/      ldr r0, [pc, #0xc4] /* data_60a4 */
/*0x5fe0*/      movs r1, #4
/*0x5fe2*/      str r1, [r0, #0x28]
/*0x5fe4*/      ldr r2, [pc, #0xc0] /* data_60a8 */
/*0x5fe6*/      mov r6, fp
/*0x5fe8*/      str.w fp, [r2, #0x28]
/*0x5fec*/      str r1, [r0, #0x24]
/*0x5fee*/      movs r0, #0xa
/*0x5ff0*/      bl spin_wait_maybe
/*0x5ff4*/      str.w r7, [r8, #0x28]
/*0x5ff8*/      ldr r0, [pc, #0xb0] /* data_60ac */
/*0x5ffa*/      ldr r3, [pc, #0xb4] /* data_60b0 */
/*0x5ffc*/      add.w r1, r0, r4, lsl #4
/*0x6000*/      ldr r0, [pc, #0x9c] /* data_60a0 */
/*0x6002*/      movs r2, #8
/*0x6004*/      str r6, [r3, #0x78]
/*0x6006*/      ldr r3, [pc, #0xac] /* data_60b4 */
/*0x6008*/      str r6, [r3, #0x78]
/*0x600a*/      ldr r3, [pc, #0xac] /* data_60b8 */
/*0x600c*/      str r6, [r3, #0x78]
/*0x600e*/      ldr r3, [pc, #0xac] /* data_60bc */
/*0x6010*/      str r6, [r3, #0x78]
/*0x6012*/      b jump_601c
            jump_6014:
/*0x6014*/      ldm r0!, {r4}
/*0x6016*/      ldrh r3, [r1], #2
/*0x601a*/      str r3, [r4]
            jump_601c:
/*0x601c*/      subs r2, r2, #1
/*0x601e*/      bhs jump_6014
/*0x6020*/      b jump_6082
            jump_6022:
/*0x6022*/      ldm r0!, {r2}
/*0x6024*/      str r3, [r2]
            jump_6026:
/*0x6026*/      subs r1, r1, #1
/*0x6028*/      bhs jump_6022
/*0x602a*/      str.w r7, [r8, #0x24]
/*0x602e*/      movs r0, #0xa
/*0x6030*/      bl spin_wait_maybe
/*0x6034*/      mov r0, r4
/*0x6036*/      bl function_e_51
/*0x603a*/      ldr r0, [pc, #0x70] /* data_60ac */
/*0x603c*/      ldr r7, [pc, #0x70] /* data_60b0 */
/*0x603e*/      adds r0, #0x90
/*0x6040*/      add.w r1, r0, r4, lsl #4
/*0x6044*/      ldr r0, [pc, #0x58] /* data_60a0 */
/*0x6046*/      str.w fp, [r7, #0x78]
/*0x604a*/      adds r0, #0x20
/*0x604c*/      movs r2, #8
/*0x604e*/      ldr r7, [pc, #0x64] /* data_60b4 */
/*0x6050*/      str.w fp, [r7, #0x78]
/*0x6054*/      ldr r7, [pc, #0x60] /* data_60b8 */
/*0x6056*/      str.w fp, [r7, #0x78]
/*0x605a*/      ldr r7, [pc, #0x60] /* data_60bc */
/*0x605c*/      str.w fp, [r7, #0x78]
/*0x6060*/      b jump_606a
            jump_6062:
/*0x6062*/      ldm r0!, {r7}
/*0x6064*/      ldrh r3, [r1], #2
/*0x6068*/      str r3, [r7]
            jump_606a:
/*0x606a*/      subs r2, r2, #1
/*0x606c*/      bhs jump_6062
/*0x606e*/      add.w r0, sb, r4
/*0x6072*/      mov r1, sb
/*0x6074*/      ldrb r2, [r0, #2]
/*0x6076*/      cmp r2, r6
/*0x6078*/      beq jump_6082
/*0x607a*/      ldrh.w r2, [sl, #0x18]
/*0x607e*/      strh r2, [r1]
/*0x6080*/      strb r6, [r0, #2]
            jump_6082:
/*0x6082*/      ldrb.w r0, [sl, #0x1a]
/*0x6086*/      adds r5, r5, #1
/*0x6088*/      udiv r2, r5, r0
/*0x608c*/      mls r0, r0, r2, r5
/*0x6090*/      strb.w r0, [sl, #0x1b]
/*0x6094*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_6098:
/*0x6098*/  .word 0x20002e0c
            data_609c:
/*0x609c*/  .word data_8fa8
            data_60a0:
/*0x60a0*/  .word 0x200001dc
            data_60a4:
/*0x60a4*/  .word 0x400b4000
            data_60a8:
/*0x60a8*/  .word 0x400b0000
            data_60ac:
/*0x60ac*/  .word 0x20002cc4
            data_60b0:
/*0x60b0*/  .word 0x4006e000
            data_60b4:
/*0x60b4*/  .word 0x4006f000
            data_60b8:
/*0x60b8*/  .word 0x4002c000
            data_60bc:
/*0x60bc*/  .word 0x4002d000


            .thumb_func
            function_e_48:
/*0x60c0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x60c4*/      mov r4, r0
/*0x60c6*/      bl function_51
/*0x60ca*/      ldr.w sb, [pc, #0x98] /* data_6164 */
/*0x60ce*/      ldrb.w r0, [sb]
/*0x60d2*/      cmp r0, #1
/*0x60d4*/      bne jump_615e
/*0x60d6*/      ldr r7, [pc, #0x90] /* data_6168 */
/*0x60d8*/      ldrh r0, [r4, #0x10]
/*0x60da*/      mov.w r8, #0xff
/*0x60de*/      strh r0, [r7, #0x18]
/*0x60e0*/      ldr r0, [r4, #0xc]
/*0x60e2*/      str r0, [r7]
/*0x60e4*/      ldrb r0, [r4, #0x13]
/*0x60e6*/      sub.w sl, r7, #0x28
/*0x60ea*/      lsls r0, r0, #1
/*0x60ec*/      strb r0, [r7, #0x1a]
/*0x60ee*/      movs r0, #0
/*0x60f0*/      strb r0, [r7, #0x1b]
/*0x60f2*/      mov r2, r0
/*0x60f4*/      sub.w ip, r7, #0x148
/*0x60f8*/      sub.w r6, r7, #0xb8
/*0x60fc*/      b jump_6126
            jump_60fe:
/*0x60fe*/      add.w r1, sl, r2
/*0x6102*/      add.w r5, ip, r2, lsl #4
/*0x6106*/      strb.w r8, [r1, #2]
/*0x610a*/      strb.w r8, [r1, #0x14]
/*0x610e*/      movs r1, #0
/*0x6110*/      add.w r3, r6, r2, lsl #4
            jump_6114:
/*0x6114*/      strh.w r0, [r5, r1, lsl #1]
/*0x6118*/      strh.w r0, [r3, r1, lsl #1]
/*0x611c*/      adds r1, r1, #1
/*0x611e*/      cmp r1, #8
/*0x6120*/      blt jump_6114
/*0x6122*/      adds r2, r2, #1
/*0x6124*/      uxtb r2, r2
            jump_6126:
/*0x6126*/      ldrb r1, [r4, #0x13]
/*0x6128*/      cmp r1, r2
/*0x612a*/      bhi jump_60fe
/*0x612c*/      ldr r0, [r4]
/*0x612e*/      str r0, [r7, #0xc]
/*0x6130*/      ldr r0, [r4, #4]
/*0x6132*/      str r0, [r7, #0x10]
/*0x6134*/      ldr r0, [r4, #8]
/*0x6136*/      str r0, [r7, #0x14]
/*0x6138*/      ldrb r0, [r4, #0x13]
/*0x613a*/      strb r0, [r7, #0x1c]
/*0x613c*/      movs r1, #1
/*0x613e*/      lsls r0, r1, #0x11
/*0x6140*/      bl ckcu_apb1_clock_enable
/*0x6144*/      mov.w r1, #0x708
/*0x6148*/      ldr r0, [pc, #0x20] /* data_616c */
/*0x614a*/      bl function_47
/*0x614e*/      bl function_63
/*0x6152*/      movs r0, #1
/*0x6154*/      bl function_e_49
/*0x6158*/      movs r1, #2
/*0x615a*/      strb.w r1, [sb]
            jump_615e:
/*0x615e*/      movs r0, #1
/*0x6160*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_6164:
/*0x6164*/  .word 0x200001d8
            data_6168:
/*0x6168*/  .word 0x20002e0c
            data_616c:
/*0x616c*/  .word 0x40077000


            .thumb_func
            function_51:
/*0x6170*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x6174*/      ldr.w sb, [pc, #0x1c4] /* data_633c */
/*0x6178*/      ldrb.w r0, [sb]
/*0x617c*/      cbnz r0, jump_61fc
/*0x617e*/      movs r1, #1
/*0x6180*/      lsls r4, r1, #0xf
/*0x6182*/      mov r0, r4
/*0x6184*/      bl ckcu_apb0_clock_enable
/*0x6188*/      movs r1, #1
/*0x618a*/      mov.w r0, #0xf0000
/*0x618e*/      bl ckcu_ahb_clock_enable
/*0x6192*/      ldr r7, [pc, #0x1ac] /* data_6340 */
/*0x6194*/      movs r2, #0
/*0x6196*/      movs r1, #8
/*0x6198*/      mov r0, r7
/*0x619a*/      bl gpio_set_pin_pull_up_down
/*0x619e*/      movs r2, #0
/*0x61a0*/      movs r1, #0x10
/*0x61a2*/      mov r0, r7
/*0x61a4*/      bl gpio_set_pin_pull_up_down
/*0x61a8*/      movs r2, #0
/*0x61aa*/      movs r1, #0x20
/*0x61ac*/      mov r0, r7
/*0x61ae*/      bl gpio_set_pin_pull_up_down
/*0x61b2*/      movs r2, #0
/*0x61b4*/      movs r1, #0x40
/*0x61b6*/      mov r0, r7
/*0x61b8*/      bl gpio_set_pin_pull_up_down
/*0x61bc*/      ldr.w sl, [pc, #0x184] /* data_6344 */
/*0x61c0*/      asrs r6, r4, #4
/*0x61c2*/      movs r2, #0
/*0x61c4*/      mov r1, r6
/*0x61c6*/      mov r0, sl
/*0x61c8*/      bl gpio_set_pin_pull_up_down
/*0x61cc*/      ldr.w r8, [pc, #0x178] /* data_6348 */
/*0x61d0*/      mov.w fp, #0x2000
/*0x61d4*/      movs r2, #0
/*0x61d6*/      mov r1, fp
/*0x61d8*/      mov r5, r8
/*0x61da*/      mov r0, r8
/*0x61dc*/      bl gpio_set_pin_pull_up_down
/*0x61e0*/      movs r2, #0
/*0x61e2*/      asrs r1, r4, #1
/*0x61e4*/      mov r0, r5
/*0x61e6*/      bl gpio_set_pin_pull_up_down
/*0x61ea*/      movs r2, #0
/*0x61ec*/      mov r1, r4
/*0x61ee*/      mov r0, r5
/*0x61f0*/      bl gpio_set_pin_pull_up_down
/*0x61f4*/      movs r2, #1
/*0x61f6*/      movs r1, #8
/*0x61f8*/      mov r0, r7
/*0x61fa*/      b jump_61fe
            jump_61fc:
/*0x61fc*/      b jump_6336
            jump_61fe:
/*0x61fe*/      bl gpio_set_input_enable
/*0x6202*/      movs r2, #1
/*0x6204*/      movs r1, #0x10
/*0x6206*/      mov r0, r7
/*0x6208*/      bl gpio_set_input_enable
/*0x620c*/      movs r2, #1
/*0x620e*/      movs r1, #0x20
/*0x6210*/      mov r0, r7
/*0x6212*/      bl gpio_set_input_enable
/*0x6216*/      movs r2, #1
/*0x6218*/      movs r1, #0x40
/*0x621a*/      mov r0, r7
/*0x621c*/      bl gpio_set_input_enable
/*0x6220*/      movs r2, #1
/*0x6222*/      mov r1, r6
/*0x6224*/      mov r0, sl
/*0x6226*/      bl gpio_set_input_enable
/*0x622a*/      movs r2, #1
/*0x622c*/      mov r1, fp
/*0x622e*/      mov r0, r5
/*0x6230*/      bl gpio_set_input_enable
/*0x6234*/      movs r2, #1
/*0x6236*/      lsls r1, r2, #0xe
/*0x6238*/      mov r0, r5
/*0x623a*/      bl gpio_set_input_enable
/*0x623e*/      movs r2, #1
/*0x6240*/      mov r1, r4
/*0x6242*/      mov r0, r5
/*0x6244*/      bl gpio_set_input_enable
/*0x6248*/      movs r1, #0
/*0x624a*/      movs r0, #0xc
/*0x624c*/      bl afio_exti_ssr_write
/*0x6250*/      movs r1, #0
/*0x6252*/      movs r0, #0x10
/*0x6254*/      bl afio_exti_ssr_write
/*0x6258*/      movs r1, #0
/*0x625a*/      movs r0, #0x14
/*0x625c*/      bl afio_exti_ssr_write
/*0x6260*/      movs r1, #0
/*0x6262*/      movs r0, #0x18
/*0x6264*/      bl afio_exti_ssr_write
/*0x6268*/      movs r1, #1
/*0x626a*/      movs r0, #0x2c
/*0x626c*/      bl afio_exti_ssr_write
/*0x6270*/      movs r1, #2
/*0x6272*/      movs r0, #0x34
/*0x6274*/      bl afio_exti_ssr_write
/*0x6278*/      movs r1, #2
/*0x627a*/      movs r0, #0x38
/*0x627c*/      bl afio_exti_ssr_write
/*0x6280*/      movs r1, #2
/*0x6282*/      movs r0, #0x3c
/*0x6284*/      bl afio_exti_ssr_write
/*0x6288*/      ldr.w sl, [pc, #0xc0] /* data_634c */
/*0x628c*/      movs r4, #0
            jump_628e:
/*0x628e*/      add.w r0, sl, r4, lsl #3
/*0x6292*/      ldr r5, [r0]
/*0x6294*/      ldr r6, [r0, #4]
/*0x6296*/      mov r0, r5
/*0x6298*/      uxth r1, r6
/*0x629a*/      bl gpio_set_pin
/*0x629e*/      uxth r1, r6
/*0x62a0*/      movs r2, #1
/*0x62a2*/      mov r0, r5
/*0x62a4*/      bl gpio_set_open_drain
/*0x62a8*/      uxth r1, r6
/*0x62aa*/      movs r2, #1
/*0x62ac*/      mov r0, r5
/*0x62ae*/      bl gpio_set_input_output
/*0x62b2*/      adds r4, r4, #1
/*0x62b4*/      uxtb r4, r4
/*0x62b6*/      cmp r4, #9
/*0x62b8*/      blo jump_628e
/*0x62ba*/      movs r2, #2
/*0x62bc*/      lsls r5, r2, #7
/*0x62be*/      mov r1, r5
/*0x62c0*/      mov r0, r7
/*0x62c2*/      bl gpio_set_pin_pull_up_down
/*0x62c6*/      movs r2, #0
/*0x62c8*/      mov r1, r5
/*0x62ca*/      mov r0, r7
/*0x62cc*/      bl gpio_set_input_enable
/*0x62d0*/      movs r2, #1
/*0x62d2*/      mov r1, r2
/*0x62d4*/      mov r4, r8
/*0x62d6*/      mov r0, r8
/*0x62d8*/      bl gpio_set_input_output
/*0x62dc*/      movs r2, #1
/*0x62de*/      movs r1, #2
/*0x62e0*/      mov r0, r4
/*0x62e2*/      bl gpio_set_input_output
/*0x62e6*/      movs r2, #1
/*0x62e8*/      mov r1, r5
/*0x62ea*/      mov r0, r7
/*0x62ec*/      bl gpio_set_input_output
/*0x62f0*/      bl function_64
/*0x62f4*/      movs r2, #1
/*0x62f6*/      movs r1, #4
/*0x62f8*/      mov r0, r4
/*0x62fa*/      bl gpio_set_input_output
/*0x62fe*/      movs r2, #2
/*0x6300*/      lsls r4, r2, #8
/*0x6302*/      mov r1, r4
/*0x6304*/      mov r0, r7
/*0x6306*/      bl gpio_set_pin_pull_up_down
/*0x630a*/      movs r2, #0
/*0x630c*/      mov r1, r4
/*0x630e*/      mov r0, r7
/*0x6310*/      bl gpio_set_input_enable
/*0x6314*/      mov r1, r4
/*0x6316*/      mov r0, r7
/*0x6318*/      bl gpio_set_pin
/*0x631c*/      movs r2, #1
/*0x631e*/      mov r1, r4
/*0x6320*/      mov r0, r7
/*0x6322*/      bl gpio_set_open_drain
/*0x6326*/      movs r2, #1
/*0x6328*/      mov r1, r4
/*0x632a*/      mov r0, r7
/*0x632c*/      bl gpio_set_input_output
/*0x6330*/      movs r1, #1
/*0x6332*/      strb.w r1, [sb]
            jump_6336:
/*0x6336*/      movs r0, #1
/*0x6338*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_633c:
/*0x633c*/  .word 0x200001d8
            data_6340:
/*0x6340*/  .word 0x400b0000
            data_6344:
/*0x6344*/  .word 0x400b2000
            data_6348:
/*0x6348*/  .word 0x400b4000
            data_634c:
/*0x634c*/  .word data_8fa8


            .thumb_func
            function_e_49:
/*0x6350*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x6354*/      ldr r4, [pc, #0xa8] /* data_6400 */
/*0x6356*/      ldr r6, [pc, #0xac] /* data_6404 */
/*0x6358*/      ldr.w r8, [pc, #0xac] /* data_6408 */
/*0x635c*/      movs.w sb, r0
/*0x6360*/      mov.w r5, #0x200
/*0x6364*/      mov.w r7, #0x400
/*0x6368*/      beq jump_63be
/*0x636a*/      movs r1, #0
/*0x636c*/      mov r0, r6
/*0x636e*/      bl function_46
/*0x6372*/      movs r1, #0
/*0x6374*/      mov r0, r6
/*0x6376*/      bl function_45
/*0x637a*/      mov r0, r6
/*0x637c*/      bl function_44
/*0x6380*/      str.w r7, [r8, #0x180]
/*0x6384*/      movs r0, #0
/*0x6386*/      ldr r2, [pc, #0x84] /* data_640c */
/*0x6388*/      mov r1, r0
            jump_638a:
/*0x638a*/      ldr.w r3, [r2, r0, lsl #2]
/*0x638e*/      str r1, [r3]
/*0x6390*/      adds r0, r0, #1
/*0x6392*/      cmp r0, #7
/*0x6394*/      blt jump_638a
/*0x6396*/      ldr r2, [pc, #0x74] /* data_640c */
/*0x6398*/      movs r0, #0
/*0x639a*/      subs r2, #0x20
            jump_639c:
/*0x639c*/      ldr.w r3, [r2, r0, lsl #2]
/*0x63a0*/      str r1, [r3]
/*0x63a2*/      adds r0, r0, #1
/*0x63a4*/      cmp r0, #7
/*0x63a6*/      blt jump_639c
/*0x63a8*/      mov.w r0, #0x100
/*0x63ac*/      str r0, [r4, #0x28]
/*0x63ae*/      ldr r1, [pc, #0x60] /* data_6410 */
/*0x63b0*/      movs r0, #4
/*0x63b2*/      str r0, [r1, #0x28]
/*0x63b4*/      str r5, [r4, #0x24]
/*0x63b6*/      movs r0, #0
/*0x63b8*/      bl function_e_6
/*0x63bc*/      b jump_63f4
            jump_63be:
/*0x63be*/      movs r0, #1
/*0x63c0*/      bl function_e_6
/*0x63c4*/      movs r0, #0xa
/*0x63c6*/      bl spin_wait_maybe
/*0x63ca*/      str r5, [r4, #0x28]
/*0x63cc*/      movs r0, #0xa
/*0x63ce*/      bl spin_wait_maybe
/*0x63d2*/      movs r1, #0
/*0x63d4*/      mov r0, r6
/*0x63d6*/      bl function_48
/*0x63da*/      mov r0, r6
/*0x63dc*/      bl function_44
/*0x63e0*/      movs r1, #1
/*0x63e2*/      mov r0, r6
/*0x63e4*/      bl function_45
/*0x63e8*/      movs r1, #1
/*0x63ea*/      mov r0, r6
/*0x63ec*/      bl function_46
/*0x63f0*/      str.w r7, [r8, #0x100]
            jump_63f4:
/*0x63f4*/      mov r0, sb
/*0x63f6*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x63fa*/      b.w function_36

/*0x63fe*/  .byte 0x00
/*0x63ff*/  .byte 0x00

            data_6400:
/*0x6400*/  .word 0x400b0000
            data_6404:
/*0x6404*/  .word 0x40077000
            data_6408:
/*0x6408*/  .word 0xe000e004
            data_640c:
/*0x640c*/  .word 0x200001fc
            data_6410:
/*0x6410*/  .word 0x400b4000


            .thumb_func
            function_e_50:
/*0x6414*/      ldr r1, [pc, #0x54] /* data_646c */
/*0x6416*/      movs r0, #0
/*0x6418*/      ldr r2, [r1, #0x1c]
/*0x641a*/      lsls r2, r2, #0x1c
/*0x641c*/      bpl jump_6420
/*0x641e*/      movs r0, #1
            jump_6420:
/*0x6420*/      ldr r2, [r1, #0x1c]
/*0x6422*/      lsls r2, r2, #0x1b
/*0x6424*/      bpl jump_642a
/*0x6426*/      orr r0, r0, #2
            jump_642a:
/*0x642a*/      ldr r2, [r1, #0x1c]
/*0x642c*/      lsls r2, r2, #0x1a
/*0x642e*/      bpl jump_6434
/*0x6430*/      orr r0, r0, #4
            jump_6434:
/*0x6434*/      ldr r1, [r1, #0x1c]
/*0x6436*/      lsls r1, r1, #0x19
/*0x6438*/      bpl jump_643e
/*0x643a*/      orr r0, r0, #8
            jump_643e:
/*0x643e*/      ldr r1, [pc, #0x30] /* data_6470 */
/*0x6440*/      ldr r1, [r1, #0x1c]
/*0x6442*/      lsls r1, r1, #0x14
/*0x6444*/      bpl jump_644a
/*0x6446*/      orr r0, r0, #0x10
            jump_644a:
/*0x644a*/      ldr r1, [pc, #0x28] /* data_6474 */
/*0x644c*/      ldr r2, [r1, #0x1c]
/*0x644e*/      lsls r2, r2, #0x12
/*0x6450*/      bpl jump_6456
/*0x6452*/      orr r0, r0, #0x20
            jump_6456:
/*0x6456*/      ldr r2, [r1, #0x1c]
/*0x6458*/      lsls r2, r2, #0x11
/*0x645a*/      bpl jump_6460
/*0x645c*/      orr r0, r0, #0x40
            jump_6460:
/*0x6460*/      ldr r1, [r1, #0x1c]
/*0x6462*/      lsls r1, r1, #0x10
/*0x6464*/      bpl jump_646a
/*0x6466*/      orr r0, r0, #0x80
            jump_646a:
/*0x646a*/      bx lr

            data_646c:
/*0x646c*/  .word 0x400b0000
            data_6470:
/*0x6470*/  .word 0x400b2000
            data_6474:
/*0x6474*/  .word 0x400b4000


            .thumb_func
            function_e_51:
/*0x6478*/      push {r4, r5, lr}
/*0x647a*/      ldr r2, [pc, #0x44] /* data_64c0 */
/*0x647c*/      movs r1, #4
/*0x647e*/      str r1, [r2, #0x28]
/*0x6480*/      ldr r3, [pc, #0x40] /* data_64c4 */
/*0x6482*/      lsls r4, r1, #6
/*0x6484*/      str r4, [r3, #0x28]
/*0x6486*/      str r1, [r2, #0x24]
/*0x6488*/      cmp r0, #8
/*0x648a*/      beq jump_64a0
/*0x648c*/      bhs jump_64a2
/*0x648e*/      ldr r3, [pc, #0x38] /* data_64c8 */
/*0x6490*/      mov.w r1, #8
/*0x6494*/      mov.w r4, #1
/*0x6498*/      ldrb r0, [r3, r0]
/*0x649a*/      mov.w r3, #2
/*0x649e*/      b jump_64b6
            jump_64a0:
/*0x64a0*/      str r4, [r3, #0x24]
            jump_64a2:
/*0x64a2*/      pop {r4, r5, pc}
            jump_64a4:
/*0x64a4*/      lsls r5, r0, #0x18
/*0x64a6*/      bpl jump_64ac
/*0x64a8*/      str r4, [r2, #0x24]
/*0x64aa*/      b jump_64ae
            jump_64ac:
/*0x64ac*/      str r4, [r2, #0x28]
            jump_64ae:
/*0x64ae*/      str r3, [r2, #0x24]
/*0x64b0*/      lsls r0, r0, #0x19
/*0x64b2*/      lsrs r0, r0, #0x18
/*0x64b4*/      str r3, [r2, #0x28]
            jump_64b6:
/*0x64b6*/      subs r1, r1, #1
/*0x64b8*/      bhs jump_64a4
/*0x64ba*/      str r4, [r2, #0x28]
/*0x64bc*/      pop {r4, r5, pc}

/*0x64be*/  .byte 0x00
/*0x64bf*/  .byte 0x00

            data_64c0:
/*0x64c0*/  .word 0x400b4000
            data_64c4:
/*0x64c4*/  .word 0x400b0000
            data_64c8:
/*0x64c8*/  .word data_8fa0


            .thumb_func
            function_e_6:
/*0x64cc*/      push {r4, lr}
/*0x64ce*/      movs r2, #9
/*0x64d0*/      ldr r4, [pc, #0x48] /* data_651c */
/*0x64d2*/      movs r1, #0
/*0x64d4*/      cbnz r0, jump_64e6
/*0x64d6*/      b jump_6510
            jump_64d8:
/*0x64d8*/      add.w r0, r4, r1, lsl #3
/*0x64dc*/      adds r1, r1, #1
/*0x64de*/      ldr r3, [r0]
/*0x64e0*/      ldr r0, [r0, #4]
/*0x64e2*/      uxtb r1, r1
/*0x64e4*/      str r0, [r3, #0x24]
            jump_64e6:
/*0x64e6*/      movs r0, r2
/*0x64e8*/      sub.w r2, r2, #1
/*0x64ec*/      uxtb r2, r2
/*0x64ee*/      bne jump_64d8
/*0x64f0*/      pop {r4, pc}
            jump_64f2:
/*0x64f2*/      cmp r1, #8
/*0x64f4*/      beq jump_6506
/*0x64f6*/      add.w r0, r4, r1, lsl #3
/*0x64fa*/      adds r1, r1, #1
/*0x64fc*/      ldr r3, [r0]
/*0x64fe*/      ldr r0, [r0, #4]
/*0x6500*/      uxtb r1, r1
/*0x6502*/      str r0, [r3, #0x28]
/*0x6504*/      b jump_6510
            jump_6506:
/*0x6506*/      ldr r0, [pc, #0x14] /* data_651c */
/*0x6508*/      movs r1, #9
/*0x650a*/      ldr r3, [r0, #0x40]
/*0x650c*/      ldr r0, [r0, #0x44]
/*0x650e*/      str r0, [r3, #0x24]
            jump_6510:
/*0x6510*/      movs r0, r2
/*0x6512*/      sub.w r2, r2, #1
/*0x6516*/      uxtb r2, r2
/*0x6518*/      bne jump_64f2
/*0x651a*/      pop {r4, pc}

            data_651c:
/*0x651c*/  .word data_8fa8


            .thumb_func
            function_e_52:
/*0x6520*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6524*/      ldr r6, [pc, #0x48] /* data_6570 */
/*0x6526*/      ldr r4, [pc, #0x44] /* data_656c */
/*0x6528*/      ldr r7, [pc, #0x48] /* data_6574 */
/*0x652a*/      movs r0, #0
/*0x652c*/      mov.w r5, #0x3e8
/*0x6530*/      movw lr, #0xffff
/*0x6534*/      sub.w r2, r6, #0xe
            jump_6538:
/*0x6538*/      ldrh.w r1, [r4, r0, lsl #1]
/*0x653c*/      mov.w r3, #0x1c2
/*0x6540*/      rsb r1, r1, r1, lsl #16
/*0x6544*/      udiv r1, r1, r5
/*0x6548*/      muls r1, r3, r1
/*0x654a*/      udiv r1, r1, lr
/*0x654e*/      ldrb r3, [r6, r0]
/*0x6550*/      ldrb.w ip, [r2, r0]
/*0x6554*/      add.w r3, r7, r3, lsl #4
/*0x6558*/      adds r0, r0, #1
/*0x655a*/      uxtb r0, r0
/*0x655c*/      strh.w r1, [r3, ip, lsl #1]
/*0x6560*/      cmp r0, #0xe
/*0x6562*/      blo jump_6538
/*0x6564*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6568*/      b.w function_e_1

            data_656c:
/*0x656c*/  .word 0x20000160
            data_6570:
/*0x6570*/  .word data_8d34
            data_6574:
/*0x6574*/  .word 0x20002e2c


            .thumb_func
            spi_enable:
/*0x6578*/      cmp r1, #0
/*0x657a*/      ldr r1, [r0]
/*0x657c*/      beq jump_6584
/*0x657e*/      orr r1, r1, #1
/*0x6582*/      b jump_6588
            jump_6584:
/*0x6584*/      bic r1, r1, #1
            jump_6588:
/*0x6588*/      str r1, [r0]
/*0x658a*/      bx lr

            .thumb_func
            spi_config:
/*0x658c*/      push {r4, r5, lr}
/*0x658e*/      ldr r2, [r1, #0x14]
/*0x6590*/      cmp.w r2, #0x400
/*0x6594*/      beq jump_659a
/*0x6596*/      cbz r2, jump_65b0
/*0x6598*/      b jump_65b4
            jump_659a:
/*0x659a*/      ldr r2, [r1, #0x18]
/*0x659c*/      cbz r2, jump_65a4
/*0x659e*/      cmp r2, #1
/*0x65a0*/      beq jump_65aa
/*0x65a2*/      b jump_65b4
            jump_65a4:
/*0x65a4*/      mov.w r2, #0x600
/*0x65a8*/      b jump_65b8
            jump_65aa:
/*0x65aa*/      mov.w r2, #0x500
/*0x65ae*/      b jump_65b8
            jump_65b0:
/*0x65b0*/      ldr r2, [r1, #0x18]
/*0x65b2*/      cbz r2, jump_65ea
            jump_65b4:
/*0x65b4*/      mov.w r2, #0x200
            jump_65b8:
/*0x65b8*/      ldr r4, [r1, #8]
/*0x65ba*/      ldr r3, [r1]
/*0x65bc*/      orrs r3, r4
/*0x65be*/      ldrd r4, r5, [r1, #0xc]
/*0x65c2*/      orrs r4, r5
/*0x65c4*/      orrs r3, r4
/*0x65c6*/      ldr r4, [r1, #0x1c]
/*0x65c8*/      orrs r3, r4
/*0x65ca*/      orrs r3, r2
/*0x65cc*/      str r3, [r0, #4]
/*0x65ce*/      ldr r3, [r1, #0x24]
/*0x65d0*/      ldr r2, [r1, #4]
/*0x65d2*/      orrs r2, r3
/*0x65d4*/      ldr r3, [r1, #0x20]
/*0x65d6*/      orr.w r2, r2, r3, lsl #4
/*0x65da*/      str r2, [r0, #0x18]
/*0x65dc*/      ldr r1, [r1, #0x28]
/*0x65de*/      mov.w r2, #-1
/*0x65e2*/      add.w r1, r2, r1, lsr #1
/*0x65e6*/      str r1, [r0, #0xc]
/*0x65e8*/      pop {r4, r5, pc}
            jump_65ea:
/*0x65ea*/      mov.w r2, #0x100
/*0x65ee*/      b jump_65b8

            .thumb_func
            spi_slave_select_output:
/*0x65f0*/      cmp r1, #0
/*0x65f2*/      ldr r1, [r0]
/*0x65f4*/      beq jump_65fc
/*0x65f6*/      orr r1, r1, #8
/*0x65fa*/      b jump_6600
            jump_65fc:
/*0x65fc*/      bic r1, r1, #8
            jump_6600:
/*0x6600*/      str r1, [r0]
/*0x6602*/      bx lr

            .thumb_func
            function_e_4:
/*0x6604*/      mov.w r1, #-0x1fff2000
/*0x6608*/      cbz r0, jump_6618
/*0x660a*/      cmp r0, #1
/*0x660c*/      ldr r0, [r1, #0x10]
/*0x660e*/      beq jump_661e
/*0x6610*/      bic r0, r0, #1
            jump_6614:
/*0x6614*/      str r0, [r1, #0x10]
/*0x6616*/      bx lr
            jump_6618:
/*0x6618*/      movs r0, #0
/*0x661a*/      str r0, [r1, #0x18]
/*0x661c*/      bx lr
            jump_661e:
/*0x661e*/      orr r0, r0, #1
/*0x6622*/      b jump_6614

            .thumb_func
            loc_6624:
/*0x6624*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6628*/      ldr r5, [pc, #0x80] /* data_66ac */
/*0x662a*/      ldr r0, [r5, #4]
/*0x662c*/      cmp r0, #0
/*0x662e*/      beq jump_66a6
/*0x6630*/      ldr r0, [pc, #0x7c] /* data_66b0 */
/*0x6632*/      bl function_6
/*0x6636*/      mov r4, r0
/*0x6638*/      cmp r0, #1
/*0x663a*/      bne jump_6640
/*0x663c*/      bl function_e_22
            jump_6640:
/*0x6640*/      ldr r7, [pc, #0x6c] /* data_66b0 */
/*0x6642*/      ldrb.w r0, [r7, #0x32]
/*0x6646*/      cmp r0, #3
/*0x6648*/      bne jump_6678
/*0x664a*/      ldr r6, [pc, #0x68] /* data_66b4 */
/*0x664c*/      ldr r0, [r6]
/*0x664e*/      tst.w r0, #0xc0
/*0x6652*/      beq jump_6678
/*0x6654*/      movs r0, #1
/*0x6656*/      bl function_37
/*0x665a*/      movs r0, #0
/*0x665c*/      str r0, [r5, #0xc]
/*0x665e*/      ldrb.w r0, [r7, #0x32]
/*0x6662*/      cmp r0, #3
/*0x6664*/      bne jump_6678
/*0x6666*/      ldr r0, [r6]
/*0x6668*/      tst.w r0, #0xc0
/*0x666c*/      beq jump_6678
/*0x666e*/      bl watchdog_reload_timer
/*0x6672*/      movs r0, #0
/*0x6674*/      bl function_3
            jump_6678:
/*0x6678*/      bl exti_check_wakup
/*0x667c*/      cmp r0, #1
/*0x667e*/      beq jump_6692
/*0x6680*/      cmp r4, #1
/*0x6682*/      bne jump_66a6
            jump_6684:
/*0x6684*/      movs r0, #0
/*0x6686*/      bl function_e_22
/*0x668a*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x668e*/      b.w exti_set_wakup
            jump_6692:
/*0x6692*/      cmp r4, #1
/*0x6694*/      bne jump_66a6
/*0x6696*/      ldr r0, [pc, #0x18] /* data_66b0 */
/*0x6698*/      bl call_6cb6
/*0x669c*/      cmp r0, #1
/*0x669e*/      bne jump_6684
/*0x66a0*/      bl gen_remote_wakeup
/*0x66a4*/      b jump_6684
            jump_66a6:
/*0x66a6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x66aa*/  .byte 0x00
/*0x66ab*/  .byte 0x00

            data_66ac:
/*0x66ac*/  .word 0x20000000
            data_66b0:
/*0x66b0*/  .word 0x20000234
            data_66b4:
/*0x66b4*/  .word 0x400a8000


            .thumb_func
            clock_init:
/*0x66b8*/      ldr r0, [pc, #0x50] /* data_670c */
/*0x66ba*/      movs r1, #1
/*0x66bc*/      str.w r1, [r0, #0x300]
/*0x66c0*/      ldr r2, [pc, #0x4c] /* data_6710 */
/*0x66c2*/      str.w r1, [r2, #0xa8]
            jump_66c6:
/*0x66c6*/      ldr.w r3, [r2, #0x108]
/*0x66ca*/      cmp r3, #0
/*0x66cc*/      beq jump_66c6
/*0x66ce*/      movs r3, #0
/*0x66d0*/      str r3, [r2, #0x20]
/*0x66d2*/      mov.w r3, #0x9000000
/*0x66d6*/      str r3, [r0, #0x18]
/*0x66d8*/      str.w r1, [r2, #0xa4]
            jump_66dc:
/*0x66dc*/      ldr.w r3, [r2, #0x104]
/*0x66e0*/      cmp r3, #0
/*0x66e2*/      beq jump_66dc
/*0x66e4*/      ldr r2, [pc, #0x2c] /* data_6714 */
/*0x66e6*/      ldr r3, [r2]
/*0x66e8*/      bic r3, r3, #7
/*0x66ec*/      add.w r3, r3, #3
/*0x66f0*/      str r3, [r2]
/*0x66f2*/      str r1, [r0, #0x20]
/*0x66f4*/      ldr r2, [r0, #4]
/*0x66f6*/      bic r2, r2, #3
/*0x66fa*/      add.w r2, r2, #1
/*0x66fe*/      str r2, [r0, #4]
            jump_6700:
/*0x6700*/      ldr r2, [r0, #0x34]
/*0x6702*/      cmp.w r1, r2, lsr #30
/*0x6706*/      bne jump_6700
/*0x6708*/      bx lr

/*0x670a*/  .byte 0x00
/*0x670b*/  .byte 0x00

            data_670c:
/*0x670c*/  .word 0x40088000
            data_6710:
/*0x6710*/  .word 0x43100000
            data_6714:
/*0x6714*/  .word 0x40080200


            .thumb_func
            function_e_56:
/*0x6718*/      push {r4, r5, r6, lr}
/*0x671a*/      ldr r5, [pc, #0x58] /* data_6774 */
/*0x671c*/      ldr r0, [pc, #0x58] /* data_6778 */
/*0x671e*/      movs r4, #0
/*0x6720*/      ldr r1, [r5]
/*0x6722*/      cbz r1, jump_673c
/*0x6724*/      ldr r1, [r0, #0xc]
/*0x6726*/      cmp r1, #1
/*0x6728*/      bne jump_673a
/*0x672a*/      str r4, [r0, #0xc]
/*0x672c*/      add.w r1, r0, #0x28
/*0x6730*/      movs r2, #8
/*0x6732*/      movs r0, #1
/*0x6734*/      bl usb_copy_send
/*0x6738*/      str r4, [r5]
            jump_673a:
/*0x673a*/      pop {r4, r5, r6, pc}
            jump_673c:
/*0x673c*/      ldr r5, [pc, #0x3c] /* data_677c */
/*0x673e*/      ldr r1, [r5]
/*0x6740*/      cmp r1, #0
/*0x6742*/      bne jump_673a
/*0x6744*/      add.w r6, r5, #0xc
/*0x6748*/      ldr r1, [r6]
/*0x674a*/      cmp r1, #0
/*0x674c*/      beq jump_673a
/*0x674e*/      ldr r1, [r0, #0xc]
/*0x6750*/      cmp r1, #1
/*0x6752*/      bne jump_673a
/*0x6754*/      str r4, [r0, #0xc]
/*0x6756*/      ldr r1, [pc, #0x20] /* data_6778 */
/*0x6758*/      movs r2, #8
/*0x675a*/      adds r1, #0x28
/*0x675c*/      movs r0, #1
/*0x675e*/      bl usb_copy_send
/*0x6762*/      ldr r0, [r6]
/*0x6764*/      mov.w r1, #0xfa0
/*0x6768*/      muls r0, r1, r0
/*0x676a*/      asrs r1, r1, #3
/*0x676c*/      udiv r0, r0, r1
/*0x6770*/      str r0, [r5]
/*0x6772*/      pop {r4, r5, r6, pc}

            data_6774:
/*0x6774*/  .word 0x200000e8
            data_6778:
/*0x6778*/  .word 0x20000014
            data_677c:
/*0x677c*/  .word 0x20000308


            .thumb_func
            function_e_57:
/*0x6780*/      push {r4, r5, r6, lr}
/*0x6782*/      ldr r5, [pc, #0x6c] /* data_67f0 */
/*0x6784*/      ldr r0, [pc, #0x6c] /* data_67f4 */
/*0x6786*/      movs r4, #0
/*0x6788*/      ldr r1, [r5]
/*0x678a*/      cbz r1, jump_679c
/*0x678c*/      ldr r1, [r0, #0x10]
/*0x678e*/      cmp r1, #1
/*0x6790*/      bne jump_67b8
/*0x6792*/      str r4, [r0, #0x10]
/*0x6794*/      movs r2, #5
/*0x6796*/      add.w r1, r0, #0x18
/*0x679a*/      b jump_67b0
            jump_679c:
/*0x679c*/      ldr r5, [pc, #0x58] /* data_67f8 */
/*0x679e*/      ldr r1, [r5]
/*0x67a0*/      cbz r1, jump_67ba
/*0x67a2*/      ldr r1, [r0, #0x10]
/*0x67a4*/      cmp r1, #1
/*0x67a6*/      bne jump_67b8
/*0x67a8*/      str r4, [r0, #0x10]
/*0x67aa*/      ldr r1, [pc, #0x48] /* data_67f4 */
/*0x67ac*/      movs r2, #2
/*0x67ae*/      adds r1, r1, #4
            jump_67b0:
/*0x67b0*/      movs r0, #2
/*0x67b2*/      bl usb_copy_send
/*0x67b6*/      str r4, [r5]
            jump_67b8:
/*0x67b8*/      pop {r4, r5, r6, pc}
            jump_67ba:
/*0x67ba*/      ldr r5, [pc, #0x40] /* data_67fc */
/*0x67bc*/      ldr r1, [r5]
/*0x67be*/      cbz r1, jump_67d0
/*0x67c0*/      ldr r1, [r0, #0x10]
/*0x67c2*/      cmp r1, #1
/*0x67c4*/      bne jump_67b8
/*0x67c6*/      str r4, [r0, #0x10]
/*0x67c8*/      ldr r1, [pc, #0x28] /* data_67f4 */
/*0x67ca*/      movs r2, #5
/*0x67cc*/      adds r1, #0x20
/*0x67ce*/      b jump_67b0
            jump_67d0:
/*0x67d0*/      ldr r5, [pc, #0x2c] /* data_6800 */
/*0x67d2*/      ldrb r1, [r5]
/*0x67d4*/      cmp r1, #0
/*0x67d6*/      beq jump_67b8
/*0x67d8*/      ldr r1, [r0, #0x10]
/*0x67da*/      cmp r1, #1
/*0x67dc*/      bne jump_67b8
/*0x67de*/      str r4, [r0, #0x10]
/*0x67e0*/      movs r2, #0x1f
/*0x67e2*/      ldr r1, [pc, #0x20] /* data_6804 */
/*0x67e4*/      movs r0, #2
/*0x67e6*/      bl usb_copy_send
/*0x67ea*/      strb r4, [r5]
/*0x67ec*/      pop {r4, r5, r6, pc}

/*0x67ee*/  .byte 0x00
/*0x67ef*/  .byte 0x00

            data_67f0:
/*0x67f0*/  .word 0x200000f0
            data_67f4:
/*0x67f4*/  .word 0x20000014
            data_67f8:
/*0x67f8*/  .word 0x200000f4
            data_67fc:
/*0x67fc*/  .word 0x200000f8
            data_6800:
/*0x6800*/  .word 0x200000ec
            data_6804:
/*0x6804*/  .word 0x2000032c


            .thumb_func
            loc_6808:
/*0x6808*/      ldr r1, [pc, #4] /* data_6810 */
/*0x680a*/      movs r0, #1
/*0x680c*/      str r0, [r1, #0xc]
/*0x680e*/      bx lr

            data_6810:
/*0x6810*/  .word 0x20000014


            .thumb_func
            loc_6814:
/*0x6814*/      ldr r1, [pc, #4] /* data_681c */
/*0x6816*/      movs r0, #1
/*0x6818*/      str r0, [r1, #0x10]
/*0x681a*/      bx lr

            data_681c:
/*0x681c*/  .word 0x20000014


            .thumb_func
            loc_6820:
/*0x6820*/      push {r4, lr}
/*0x6822*/      ldr r4, [pc, #0x28] /* data_684c */
/*0x6824*/      ldrd r1, r0, [r4, #4]
/*0x6828*/      add r1, r0
/*0x682a*/      movs r2, #0x40
/*0x682c*/      movs r0, #4
/*0x682e*/      bl usb_recv
/*0x6832*/      ldr r1, [r4, #4]
/*0x6834*/      add r0, r1
/*0x6836*/      ubfx r0, r0, #0, #0xa
/*0x683a*/      str r0, [r4, #4]
/*0x683c*/      ldr r1, [pc, #0x10] /* data_6850 */
/*0x683e*/      movs r0, #1
/*0x6840*/      str r0, [r1, #0x14]
/*0x6842*/      pop.w {r4, lr}
/*0x6846*/      b.w handle_update_packet

/*0x684a*/  .byte 0x00
/*0x684b*/  .byte 0x00

            data_684c:
/*0x684c*/  .word 0x20000368
            data_6850:
/*0x6850*/  .word 0x20000014


            .thumb_func
            function_e_58:
/*0x6854*/      push {r4, r5, r6, lr}
/*0x6856*/      mov r4, r0
/*0x6858*/      ldrb r2, [r0, #3]
/*0x685a*/      ldrb r0, [r0, #2]
/*0x685c*/      ldrh r5, [r4, #6]
/*0x685e*/      ldrh r1, [r4, #4]
/*0x6860*/      cmp r2, #1
/*0x6862*/      bne jump_68bc
/*0x6864*/      cbz r1, jump_6882
/*0x6866*/      cmp r1, #1
/*0x6868*/      beq jump_6886
/*0x686a*/      cmp r1, #2
/*0x686c*/      bne jump_68bc
/*0x686e*/      cmp r0, #1
/*0x6870*/      beq jump_68ae
/*0x6872*/      cmp r0, #2
/*0x6874*/      beq jump_68be
/*0x6876*/      cmp r0, #3
/*0x6878*/      beq jump_68c4
/*0x687a*/      cmp r0, #4
/*0x687c*/      bne jump_68bc
/*0x687e*/      ldr r0, [pc, #0x4c] /* data_68cc */
/*0x6880*/      b jump_68b2
            jump_6882:
/*0x6882*/      ldr r0, [pc, #0x4c] /* data_68d0 */
/*0x6884*/      b jump_68b2
            jump_6886:
/*0x6886*/      ldr r0, [pc, #0x4c] /* data_68d4 */
/*0x6888*/      bl function_e_35
/*0x688c*/      cmp r0, #0
/*0x688e*/      bne jump_68bc
/*0x6890*/      ldr r2, [pc, #0x40] /* data_68d4 */
/*0x6892*/      movs r0, #0x43
/*0x6894*/      movs r3, #0
/*0x6896*/      ldr r1, [r2, #8]
/*0x6898*/      b jump_689e
            jump_689a:
/*0x689a*/      strb r3, [r1, r0]
/*0x689c*/      subs r0, r0, #1
            jump_689e:
/*0x689e*/      ldr r6, [r2, #4]
/*0x68a0*/      cmp r6, r0
/*0x68a2*/      bls jump_689a
/*0x68a4*/      ldr r0, [pc, #0x2c] /* data_68d4 */
/*0x68a6*/      str r1, [r4, #0x1c]
/*0x68a8*/      bl clear_two_words
/*0x68ac*/      b jump_68b4
            jump_68ae:
/*0x68ae*/      ldr r0, [pc, #0x20] /* data_68d0 */
/*0x68b0*/      subs r0, #0x24
            jump_68b2:
/*0x68b2*/      str r0, [r4, #0x1c]
            jump_68b4:
/*0x68b4*/      movs r0, #1
/*0x68b6*/      str r5, [r4, #0x20]
/*0x68b8*/      strb.w r0, [r4, #0x24]
            jump_68bc:
/*0x68bc*/      pop {r4, r5, r6, pc}
            jump_68be:
/*0x68be*/      ldr r0, [pc, #0x10] /* data_68d0 */
/*0x68c0*/      subs r0, #0x10
/*0x68c2*/      b jump_68b2
            jump_68c4:
/*0x68c4*/      ldr r0, [pc, #8] /* data_68d0 */
/*0x68c6*/      subs r0, #8
/*0x68c8*/      b jump_68b2

/*0x68ca*/  .byte 0x00
/*0x68cb*/  .byte 0x00

            data_68cc:
/*0x68cc*/  .word 0x2000032c
            data_68d0:
/*0x68d0*/  .word 0x2000003c
            data_68d4:
/*0x68d4*/  .word 0x20000358


            .thumb_func
            ptr_write_func_ptrs:
/*0x68d8*/      ldr r1, [pc, #0x20] /* data_68fc */
/*0x68da*/      str r1, [r0]
/*0x68dc*/      ldr r1, [pc, #0x20] /* data_6900 */
/*0x68de*/      str r1, [r0, #8]
/*0x68e0*/      ldr r1, [pc, #0x20] /* data_6904 */
/*0x68e2*/      str r1, [r0, #0x18]
/*0x68e4*/      ldr r1, [pc, #0x20] /* data_6908 */
/*0x68e6*/      str r1, [r0, #0x24]
/*0x68e8*/      ldr r1, [pc, #0x20] /* data_690c */
/*0x68ea*/      str r1, [r0, #0x2c]
/*0x68ec*/      ldr r1, [pc, #0x20] /* data_6910 */
/*0x68ee*/      str r1, [r0, #0x30]
/*0x68f0*/      ldr r1, [pc, #0x20] /* data_6914 */
/*0x68f2*/      str r1, [r0, #0x38]
/*0x68f4*/      movs r0, #0
/*0x68f6*/      b.w loc_6a10

/*0x68fa*/  .byte 0x00
/*0x68fb*/  .byte 0x00

            data_68fc:
/*0x68fc*/  .word loc_6918
            data_6900:
/*0x6900*/  .word loc_6a10
            data_6904:
/*0x6904*/  .word loc_6a84
            data_6908:
/*0x6908*/  .word loc_695c
            data_690c:
/*0x690c*/  .word loc_6808
            data_6910:
/*0x6910*/  .word loc_6814
            data_6914:
/*0x6914*/  .word loc_6820


            .thumb_func
            loc_6918:
/*0x6918*/      ldr r0, [pc, #0x38] /* data_6954 */
/*0x691a*/      push {r4, lr}
/*0x691c*/      ldr r1, [r0]
/*0x691e*/      cmp r1, #1
/*0x6920*/      bne jump_6946
/*0x6922*/      movs r1, #0
/*0x6924*/      str r1, [r0]
/*0x6926*/      ldr r4, [pc, #0x30] /* data_6958 */
/*0x6928*/      ldrb r0, [r4]
/*0x692a*/      and r0, r0, #1
/*0x692e*/      bl nop_3
/*0x6932*/      ldrb r0, [r4]
/*0x6934*/      ubfx r0, r0, #1, #1
/*0x6938*/      bl call_45f4
/*0x693c*/      ldrb r0, [r4]
/*0x693e*/      ubfx r0, r0, #2, #1
/*0x6942*/      bl nop_2
            jump_6946:
/*0x6946*/      bl function_e_56
/*0x694a*/      pop.w {r4, lr}
/*0x694e*/      b.w function_e_57

/*0x6952*/  .byte 0x00
/*0x6953*/  .byte 0x00

            data_6954:
/*0x6954*/  .word 0x20000320
            data_6958:
/*0x6958*/  .word 0x20000014


            .thumb_func
            loc_695c:
/*0x695c*/      push {r4, r5, r6, r7}
/*0x695e*/      ldrh r1, [r0]
/*0x6960*/      mov.w r5, #0x100
/*0x6964*/      movw r7, #0x921
/*0x6968*/      lsls r6, r5, #1
/*0x696a*/      ldr r4, [pc, #0x98] /* data_6a04 */
/*0x696c*/      movs r3, #1
/*0x696e*/      subw r2, r1, #0x921
/*0x6972*/      cmp r1, r7
/*0x6974*/      beq jump_69b4
/*0x6976*/      bgt jump_698e
/*0x6978*/      adds.w r1, r2, #0x780
/*0x697c*/      beq jump_69a2
/*0x697e*/      cmp r1, r5
/*0x6980*/      beq jump_69a8
/*0x6982*/      cmp r1, r6
/*0x6984*/      bne jump_69dc
/*0x6986*/      ldr r1, [pc, #0x80] /* data_6a08 */
/*0x6988*/      strd r1, r3, [r0, #0x1c]
/*0x698c*/      b jump_69fe
            jump_698e:
/*0x698e*/      movs r7, #0
/*0x6990*/      cmp r2, r5
/*0x6992*/      beq jump_69e0
/*0x6994*/      cmp r2, r6
/*0x6996*/      bne jump_69dc
/*0x6998*/      ldr r2, [pc, #0x6c] /* data_6a08 */
/*0x699a*/      ldrb r1, [r0, #2]
/*0x699c*/      subs r2, #8
/*0x699e*/      str r1, [r2, #8]
/*0x69a0*/      b jump_69fc
            jump_69a2:
/*0x69a2*/      pop {r4, r5, r6, r7}
/*0x69a4*/      b.w function_e_58
            jump_69a8:
/*0x69a8*/      ldrh r1, [r0, #4]
/*0x69aa*/      cmp r1, #0
/*0x69ac*/      bne jump_69dc
/*0x69ae*/      strd r4, r3, [r0, #0x1c]
/*0x69b2*/      b jump_69fe
            jump_69b4:
/*0x69b4*/      ldrb r3, [r0, #3]
/*0x69b6*/      ldrh r1, [r0, #6]
/*0x69b8*/      ldrh r2, [r0, #4]
/*0x69ba*/      str r1, [r0, #0x20]
/*0x69bc*/      cmp r3, #2
/*0x69be*/      bne jump_69dc
/*0x69c0*/      cmp r2, #0
/*0x69c2*/      bne jump_69dc
/*0x69c4*/      ldr r3, [pc, #0x40] /* data_6a08 */
/*0x69c6*/      subs r3, #8
/*0x69c8*/      str r3, [r0, #0x1c]
/*0x69ca*/      ldr r3, [pc, #0x40] /* data_6a0c */
/*0x69cc*/      strd r3, r2, [r0, #0x28]
/*0x69d0*/      movs r2, #2
/*0x69d2*/      strb.w r2, [r0, #0x24]
/*0x69d6*/      ldr r0, [pc, #0x2c] /* data_6a04 */
/*0x69d8*/      adds r0, #0x38
/*0x69da*/      str r1, [r0]
            jump_69dc:
/*0x69dc*/      pop {r4, r5, r6, r7}
/*0x69de*/      bx lr
            jump_69e0:
/*0x69e0*/      ldrh r2, [r0, #4]
/*0x69e2*/      ldrb r1, [r0, #3]
/*0x69e4*/      cmp r2, #0
/*0x69e6*/      bne jump_69dc
/*0x69e8*/      mov.w r2, #0xfa0
/*0x69ec*/      str r1, [r4]
/*0x69ee*/      muls r1, r2, r1
/*0x69f0*/      asrs r2, r2, #3
/*0x69f2*/      udiv r1, r1, r2
/*0x69f6*/      ldr r2, [pc, #0xc] /* data_6a04 */
/*0x69f8*/      subs r2, #0xc
/*0x69fa*/      str r1, [r2]
            jump_69fc:
/*0x69fc*/      str r7, [r0, #0x20]
            jump_69fe:
/*0x69fe*/      strb.w r3, [r0, #0x24]
/*0x6a02*/      b jump_69dc

            data_6a04:
/*0x6a04*/  .word 0x20000314
            data_6a08:
/*0x6a08*/  .word 0x2000001c
            data_6a0c:
/*0x6a0c*/  .word loc_6a74


            .thumb_func
            loc_6a10:
/*0x6a10*/      ldr r0, [pc, #0x54] /* data_6a68 */
/*0x6a12*/      push {r4, lr}
/*0x6a14*/      movs r3, #1
/*0x6a16*/      str r3, [r0, #0xc]
/*0x6a18*/      str r3, [r0, #0x10]
/*0x6a1a*/      movs r1, #0
/*0x6a1c*/      str r1, [r0, #0x14]
/*0x6a1e*/      add.w r2, r0, #0x28
/*0x6a22*/      movs r0, #5
/*0x6a24*/      strb r1, [r2]
            jump_6a26:
/*0x6a26*/      add.w r4, r2, r0
/*0x6a2a*/      subs r0, r0, #1
/*0x6a2c*/      strb r1, [r4, #2]
/*0x6a2e*/      bpl jump_6a26
/*0x6a30*/      ldr r0, [pc, #0x34] /* data_6a68 */
/*0x6a32*/      movs r2, #2
/*0x6a34*/      adds r0, r0, #4
/*0x6a36*/      strb r3, [r0]
/*0x6a38*/      strb r1, [r0, #1]
/*0x6a3a*/      adds r0, #0x14
/*0x6a3c*/      strb r2, [r0]
/*0x6a3e*/      str.w r1, [r0, #1]
/*0x6a42*/      adds r0, #8
/*0x6a44*/      movs r2, #3
/*0x6a46*/      strb r2, [r0]
/*0x6a48*/      strb r1, [r0, #2]
/*0x6a4a*/      strb r1, [r0, #3]
/*0x6a4c*/      strb r1, [r0, #4]
/*0x6a4e*/      ldr r2, [pc, #0x1c] /* data_6a6c */
/*0x6a50*/      strb r1, [r0, #1]
/*0x6a52*/      movs r0, #4
/*0x6a54*/      strb r0, [r2]
/*0x6a56*/      movs r0, #0x1c
            jump_6a58:
/*0x6a58*/      add.w r4, r2, r0
/*0x6a5c*/      subs r0, r0, #1
/*0x6a5e*/      strb r1, [r4, #2]
/*0x6a60*/      bpl jump_6a58
/*0x6a62*/      ldr r0, [pc, #0xc] /* data_6a70 */
/*0x6a64*/      str r3, [r0]
/*0x6a66*/      pop {r4, pc}

            data_6a68:
/*0x6a68*/  .word 0x20000014
            data_6a6c:
/*0x6a6c*/  .word 0x2000032c
            data_6a70:
/*0x6a70*/  .word 0x20000010


            .thumb_func
            loc_6a74:
/*0x6a74*/      ldr r2, [pc, #8] /* data_6a80 */
/*0x6a76*/      movs r1, #1
/*0x6a78*/      str.w r1, [r2, r0, lsl #2]
/*0x6a7c*/      bx lr

/*0x6a7e*/  .byte 0x00
/*0x6a7f*/  .byte 0x00

            data_6a80:
/*0x6a80*/  .word 0x20000320


            .thumb_func
            loc_6a84:
/*0x6a84*/      ldrb r2, [r0, #3]
/*0x6a86*/      ldrh r1, [r0, #4]
/*0x6a88*/      movs r3, #1
/*0x6a8a*/      cmp r2, #0x21
/*0x6a8c*/      beq jump_6a9e
/*0x6a8e*/      cmp r2, #0x22
/*0x6a90*/      bne jump_6ad6
/*0x6a92*/      cbz r1, jump_6ac0
/*0x6a94*/      cmp r1, #1
/*0x6a96*/      beq jump_6ac8
/*0x6a98*/      cmp r1, #2
/*0x6a9a*/      bne jump_6ad2
/*0x6a9c*/      b jump_6ad8
            jump_6a9e:
/*0x6a9e*/      cbz r1, jump_6aaa
/*0x6aa0*/      cmp r1, #1
/*0x6aa2*/      beq jump_6ab0
/*0x6aa4*/      cmp r1, #2
/*0x6aa6*/      bne jump_6ab6
/*0x6aa8*/      b jump_6aba
            jump_6aaa:
/*0x6aaa*/      ldr r1, [r0, #0xc]
/*0x6aac*/      adds r1, #0x12
/*0x6aae*/      b jump_6ab4
            jump_6ab0:
/*0x6ab0*/      ldr r1, [r0, #0xc]
/*0x6ab2*/      adds r1, #0x2b
            jump_6ab4:
/*0x6ab4*/      str r1, [r0, #0x1c]
            jump_6ab6:
/*0x6ab6*/      movs r1, #9
/*0x6ab8*/      b jump_6ad0
            jump_6aba:
/*0x6aba*/      ldr r1, [r0, #0xc]
/*0x6abc*/      adds r1, #0x4b
/*0x6abe*/      b jump_6ab4
            jump_6ac0:
/*0x6ac0*/      ldr r1, [pc, #0x20] /* data_6ae4 */
/*0x6ac2*/      str r1, [r0, #0x1c]
/*0x6ac4*/      movs r1, #0x40
/*0x6ac6*/      b jump_6ad0
            jump_6ac8:
/*0x6ac8*/      ldr r1, [pc, #0x18] /* data_6ae4 */
/*0x6aca*/      adds r1, #0x40
/*0x6acc*/      str r1, [r0, #0x1c]
/*0x6ace*/      movs r1, #0x22
            jump_6ad0:
/*0x6ad0*/      str r1, [r0, #0x20]
            jump_6ad2:
/*0x6ad2*/      strb.w r3, [r0, #0x24]
            jump_6ad6:
/*0x6ad6*/      bx lr
            jump_6ad8:
/*0x6ad8*/      ldr r1, [pc, #8] /* data_6ae4 */
/*0x6ada*/      adds r1, #0x64
/*0x6adc*/      str r1, [r0, #0x1c]
/*0x6ade*/      movs r1, #0xc6
/*0x6ae0*/      b jump_6ad0

/*0x6ae2*/  .byte 0x00
/*0x6ae3*/  .byte 0x00

            data_6ae4:
/*0x6ae4*/  .word data_8998


            .thumb_func
            function_6:
/*0x6ae8*/      ldrb.w r0, [r0, #0x34]
/*0x6aec*/      ubfx r0, r0, #1, #1
/*0x6af0*/      bx lr

            .thumb_func
            usb_entry:
/*0x6af2*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6af6*/      mov r4, r0
/*0x6af8*/      bl usb_get_intr_flags
/*0x6afc*/      mov r5, r0
/*0x6afe*/      lsls r0, r0, #0x1e
/*0x6b00*/      bpl jump_6b10
/*0x6b02*/      ldr r1, [r4, #0x4c]
/*0x6b04*/      cbz r1, jump_6b0a
/*0x6b06*/      ldr r0, [r4, #0x50]
/*0x6b08*/      blx r1
            jump_6b0a:
/*0x6b0a*/      movs r0, #2
/*0x6b0c*/      bl usb_set_intr_flags
            jump_6b10:
/*0x6b10*/      lsls r0, r5, #0x1b
/*0x6b12*/      bpl jump_6b32
/*0x6b14*/      movs r0, #0x10
/*0x6b16*/      bl usb_set_intr_flags
/*0x6b1a*/      ldrb.w r0, [r4, #0x32]
/*0x6b1e*/      cmp r0, #2
/*0x6b20*/      blo jump_6b32
/*0x6b22*/      bl usb_set_lpmode_pdwn
/*0x6b26*/      ldrb r0, [r4, #0x32]!
/*0x6b2a*/      strb r0, [r4, #1]
/*0x6b2c*/      movs r0, #3
/*0x6b2e*/      strb r0, [r4], #-0x32
            jump_6b32:
/*0x6b32*/      lsls r0, r5, #0x1d
/*0x6b34*/      mov.w r7, #0
/*0x6b38*/      bpl jump_6b82
/*0x6b3a*/      add.w r4, r4, #0x20
/*0x6b3e*/      mov.w r0, #-1
/*0x6b42*/      ldr r6, [r4, #0x64]
/*0x6b44*/      str r0, [r4]
/*0x6b46*/      strb r7, [r4, #0x10]
/*0x6b48*/      strb r7, [r4, #0x11]
/*0x6b4a*/      ldrb r0, [r4, #0x14]
/*0x6b4c*/      bic r0, r0, #2
/*0x6b50*/      strb r0, [r4, #0x14]
/*0x6b52*/      mov.w r0, #4
/*0x6b56*/      strb r0, [r4, #0x12]
/*0x6b58*/      str r7, [r4, #0x18]
/*0x6b5a*/      bl usb_ckcu_voodoo
/*0x6b5e*/      bl usb_clear_csr
/*0x6b62*/      movs r0, #0
/*0x6b64*/      ldr r1, [r4, #0x64]
/*0x6b66*/      bl function_e_70
/*0x6b6a*/      ldr r0, [r6]
/*0x6b6c*/      bl usb_enable_intr
/*0x6b70*/      ldr r1, [r4, #0x24]
/*0x6b72*/      sub.w r4, r4, #0x20
/*0x6b76*/      cbz r1, jump_6b7c
/*0x6b78*/      ldr r0, [r4, #0x48]
/*0x6b7a*/      blx r1
            jump_6b7c:
/*0x6b7c*/      movs r0, #4
/*0x6b7e*/      bl usb_set_intr_flags
            jump_6b82:
/*0x6b82*/      lsls r0, r5, #0x1c
/*0x6b84*/      bpl jump_6b98
/*0x6b86*/      bl usb_clear_csr
/*0x6b8a*/      ldrb.w r0, [r4, #0x33]
/*0x6b8e*/      strb.w r0, [r4, #0x32]
/*0x6b92*/      movs r0, #8
/*0x6b94*/      bl usb_set_intr_flags
            jump_6b98:
/*0x6b98*/      lsls r0, r5, #0x17
/*0x6b9a*/      mov.w r6, #0x100
/*0x6b9e*/      bpl jump_6c96
/*0x6ba0*/      movs r0, #0
/*0x6ba2*/      bl usb_get_ep_intr
/*0x6ba6*/      mov r5, r0
/*0x6ba8*/      lsls r0, r0, #0x16
/*0x6baa*/      bpl jump_6bf2
/*0x6bac*/      mov r0, r4
/*0x6bae*/      bl usb_copy_ep_setup
/*0x6bb2*/      strb.w r7, [r4, #0x24]
/*0x6bb6*/      str r7, [r4, #0x20]
/*0x6bb8*/      ldrb r0, [r4]
/*0x6bba*/      ands r0, r0, #0x60
/*0x6bbe*/      beq jump_6bc6
/*0x6bc0*/      cmp r0, #0x20
/*0x6bc2*/      bne jump_6bd6
/*0x6bc4*/      b jump_6bce
            jump_6bc6:
/*0x6bc6*/      mov r0, r4
/*0x6bc8*/      bl function_e_79
/*0x6bcc*/      b jump_6bd6
            jump_6bce:
/*0x6bce*/      ldr r1, [r4, #0x60]
/*0x6bd0*/      cbz r1, jump_6bd6
/*0x6bd2*/      mov r0, r4
/*0x6bd4*/      blx r1
            jump_6bd6:
/*0x6bd6*/      ldrb.w r0, [r4, #0x24]
/*0x6bda*/      cmp r0, #1
/*0x6bdc*/      beq jump_6c0e
/*0x6bde*/      cmp r0, #2
/*0x6be0*/      beq jump_6c20
/*0x6be2*/      movs r0, #0
/*0x6be4*/      bl function_e_72
            jump_6be8:
/*0x6be8*/      mov.w r1, #0x200
/*0x6bec*/      movs r0, #0
/*0x6bee*/      bl usb_set_ep_intr
            jump_6bf2:
/*0x6bf2*/      lsls r0, r5, #0x1e
/*0x6bf4*/      bpl jump_6c54
/*0x6bf6*/      movs r1, #2
/*0x6bf8*/      movs r0, #0
/*0x6bfa*/      bl usb_set_ep_intr
/*0x6bfe*/      ldr r0, [r4, #0x20]
/*0x6c00*/      adds r0, r0, #1
/*0x6c02*/      beq jump_6c54
/*0x6c04*/      ldrb.w r0, [r4, #0x24]
/*0x6c08*/      cmp r0, #2
/*0x6c0a*/      beq jump_6c2c
/*0x6c0c*/      b jump_6c54
            jump_6c0e:
/*0x6c0e*/      ldrh r0, [r4, #6]
/*0x6c10*/      ldr r1, [r4, #0x20]
/*0x6c12*/      cmp r1, r0
/*0x6c14*/      ble jump_6c18
/*0x6c16*/      str r0, [r4, #0x20]
            jump_6c18:
/*0x6c18*/      mov r0, r4
/*0x6c1a*/      bl function_e_78
/*0x6c1e*/      b jump_6be8
            jump_6c20:
/*0x6c20*/      movs r2, #0
/*0x6c22*/      mov r1, r2
/*0x6c24*/      mov r0, r2
/*0x6c26*/      bl usb_copy_send
/*0x6c2a*/      b jump_6be8
            jump_6c2c:
/*0x6c2c*/      movs r2, #0x40
/*0x6c2e*/      movs r0, #0
/*0x6c30*/      ldr r1, [r4, #0x1c]
/*0x6c32*/      bl usb_recv
/*0x6c36*/      ldr r1, [r4, #0x1c]
/*0x6c38*/      add r1, r0
/*0x6c3a*/      str r1, [r4, #0x1c]
/*0x6c3c*/      ldr r1, [r4, #0x20]
/*0x6c3e*/      subs r0, r1, r0
/*0x6c40*/      str r0, [r4, #0x20]
/*0x6c42*/      bne jump_6c54
/*0x6c44*/      movs r0, #1
/*0x6c46*/      strb.w r0, [r4, #0x24]
/*0x6c4a*/      ldr r1, [r4, #0x28]
/*0x6c4c*/      cbz r1, jump_6c54
/*0x6c4e*/      ldr r0, [r4, #0x2c]
/*0x6c50*/      blx r1
/*0x6c52*/      str r7, [r4, #0x28]
            jump_6c54:
/*0x6c54*/      lsls r0, r5, #0x1b
/*0x6c56*/      bpl jump_6c66
/*0x6c58*/      mov r0, r4
/*0x6c5a*/      bl function_e_78
/*0x6c5e*/      movs r1, #0x10
/*0x6c60*/      movs r0, #0
/*0x6c62*/      bl usb_set_ep_intr
            jump_6c66:
/*0x6c66*/      mov r0, r6
/*0x6c68*/      bl usb_set_intr_flags
/*0x6c6c*/      b jump_6c96
            jump_6c6e:
/*0x6c6e*/      mov r0, r5
/*0x6c70*/      bl usb_get_ep_intr
/*0x6c74*/      tst.w r0, #0x12
/*0x6c78*/      beq jump_6c96
/*0x6c7a*/      movs r1, #0x12
/*0x6c7c*/      mov r0, r5
/*0x6c7e*/      bl usb_set_ep_intr
/*0x6c82*/      lsl.w r0, r6, r5
/*0x6c86*/      bl usb_set_intr_flags
/*0x6c8a*/      add.w r0, r4, r5, lsl #2
/*0x6c8e*/      ldr r1, [r0, #0x64]
/*0x6c90*/      cbz r1, jump_6c96
/*0x6c92*/      mov r0, r5
/*0x6c94*/      blx r1
            jump_6c96:
/*0x6c96*/      bl usb_get_intr_flags
/*0x6c9a*/      bl function_e_75
/*0x6c9e*/      mov r5, r0
/*0x6ca0*/      adds r0, r0, #1
/*0x6ca2*/      bne jump_6c6e
/*0x6ca4*/      pop.w {r4, r5, r6, r7, r8, pc}

            .thumb_func
            function_23:
/*0x6ca8*/      add.w r0, r0, #0x30
/*0x6cac*/      movs r1, #2
/*0x6cae*/      strb r1, [r0, #2]
/*0x6cb0*/      ldr r0, [r0, #0x54]
/*0x6cb2*/      b.w jump_1

            .thumb_func
            call_6cb6:
/*0x6cb6*/      ldrb.w r0, [r0, #0x32]
/*0x6cba*/      cmp r0, #3
/*0x6cbc*/      beq jump_6cc2
/*0x6cbe*/      movs r0, #0
/*0x6cc0*/      bx lr
            jump_6cc2:
/*0x6cc2*/      movs r0, #1
/*0x6cc4*/      bx lr

            .thumb_func
            function_75:
/*0x6cc6*/      push {r4, lr}
/*0x6cc8*/      add.w r4, r0, #0x30
/*0x6ccc*/      ldrb r0, [r4, #4]
/*0x6cce*/      ubfx r1, r0, #0, #1
/*0x6cd2*/      ldr r0, [r4, #0x54]
/*0x6cd4*/      bl function_82
/*0x6cd8*/      ldrb r0, [r4, #2]
/*0x6cda*/      sub.w r4, r4, #0x30
/*0x6cde*/      cmp r0, #3
/*0x6ce0*/      bne jump_6cee
/*0x6ce2*/      ldr.w r1, [r4, #0x88]
/*0x6ce6*/      cbz r1, jump_6cee
/*0x6ce8*/      ldr.w r0, [r4, #0x8c]
/*0x6cec*/      blx r1
            jump_6cee:
/*0x6cee*/      ldr r1, [r4, #0x3c]
/*0x6cf0*/      cmp r1, #0
/*0x6cf2*/      beq jump_6d04
/*0x6cf4*/      ldrb.w r0, [r4, #0x32]
/*0x6cf8*/      cmp r0, #6
/*0x6cfa*/      bne jump_6d04
/*0x6cfc*/      ldr r0, [r4, #0x40]
/*0x6cfe*/      pop.w {r4, lr}
/*0x6d02*/      bx r1
            jump_6d04:
/*0x6d04*/      pop {r4, pc}

            .thumb_func
            gen_remote_wakeup:
/*0x6d06*/      push {r4, lr}
/*0x6d08*/      bl usb_clear_csr
/*0x6d0c*/      pop.w {r4, lr}
/*0x6d10*/      b.w usb_set_genrsm

            .thumb_func
            ptr_set_desc_ptr:
/*0x6d14*/      ldr r1, [pc, #0x10] /* data_6d28 */
/*0x6d16*/      str r1, [r0]
/*0x6d18*/      adds r1, #0x14
/*0x6d1a*/      str r1, [r0, #4]
/*0x6d1c*/      ldr r1, [pc, #0xc] /* data_6d2c */
/*0x6d1e*/      str r1, [r0, #8]
/*0x6d20*/      movs r1, #4
/*0x6d22*/      str r1, [r0, #0xc]
/*0x6d24*/      bx lr

/*0x6d26*/  .byte 0x00
/*0x6d27*/  .byte 0x00

            data_6d28:
/*0x6d28*/  .word data_8ac4
            data_6d2c:
/*0x6d2c*/  .word 0x20000044


            .thumb_func
            usb_set_intr_flags:
/*0x6d30*/      ldr r1, [pc, #4] /* data_6d38 */
/*0x6d32*/      str r0, [r1, #8]
/*0x6d34*/      bx lr

/*0x6d36*/  .byte 0x00
/*0x6d37*/  .byte 0x00

            data_6d38:
/*0x6d38*/  .word 0x400a8000


            .thumb_func
            usb_init:
/*0x6d3c*/      push {r4, lr}
/*0x6d3e*/      movs r1, #1
/*0x6d40*/      movs r0, #0x40
/*0x6d42*/      bl ckcu_apb1_clock_enable
/*0x6d46*/      movs r1, #1
/*0x6d48*/      lsls r0, r1, #0xa
/*0x6d4a*/      bl ckcu_ahb_clock_enable
/*0x6d4e*/      movs r0, #2
/*0x6d50*/      bl ckcu_set_usb_prescaler
/*0x6d54*/      ldr r1, [pc, #0x30] /* data_6d88 */
/*0x6d56*/      sub.w r0, r1, #0xc
/*0x6d5a*/      str r1, [r0]
/*0x6d5c*/      ldr r1, [pc, #0x2c] /* data_6d8c */
/*0x6d5e*/      str r1, [r0, #4]
/*0x6d60*/      subs r0, #0x7c
/*0x6d62*/      bl ptr_set_desc_ptr
/*0x6d66*/      ldr r0, [pc, #0x20] /* data_6d88 */
/*0x6d68*/      subs r0, #0x54
/*0x6d6a*/      bl ptr_write_func_ptrs
/*0x6d6e*/      ldr r0, [pc, #0x18] /* data_6d88 */
/*0x6d70*/      subs r0, #0x90
/*0x6d72*/      bl function_23
/*0x6d76*/      ldr r1, [pc, #0x18] /* data_6d90 */
/*0x6d78*/      mov.w r0, #0x200000
/*0x6d7c*/      str.w r0, [r1, #0x100]
/*0x6d80*/      pop.w {r4, lr}
/*0x6d84*/      b.w function_e_34

            data_6d88:
/*0x6d88*/  .word 0x200002c4
            data_6d8c:
/*0x6d8c*/  .word loc_6624
            data_6d90:
/*0x6d90*/  .word 0xe000e004


            .thumb_func
            usb_dp_wake_up:
/*0x6d94*/      ldr r1, [pc, #0x14] /* data_6dac */
/*0x6d96*/      cmp r0, #1
/*0x6d98*/      ldr r0, [r1]
/*0x6d9a*/      beq jump_6da4
/*0x6d9c*/      bic r0, r0, #0x800
            jump_6da0:
/*0x6da0*/      str r0, [r1]
/*0x6da2*/      bx lr
            jump_6da4:
/*0x6da4*/      orr r0, r0, #0x800
/*0x6da8*/      b jump_6da0

/*0x6daa*/  .byte 0x00
/*0x6dab*/  .byte 0x00

            data_6dac:
/*0x6dac*/  .word 0x400a8000


            .thumb_func
            usb_dp_pull_up:
/*0x6db0*/      ldr r1, [pc, #0x14] /* data_6dc8 */
/*0x6db2*/      cmp r0, #1
/*0x6db4*/      ldr r0, [r1]
/*0x6db6*/      beq jump_6dc0
/*0x6db8*/      bic r0, r0, #0x400
            jump_6dbc:
/*0x6dbc*/      str r0, [r1]
/*0x6dbe*/      bx lr
            jump_6dc0:
/*0x6dc0*/      orr r0, r0, #0x400
/*0x6dc4*/      b jump_6dbc

/*0x6dc6*/  .byte 0x00
/*0x6dc7*/  .byte 0x00

            data_6dc8:
/*0x6dc8*/  .word 0x400a8000


            .thumb_func
            usb_ckcu_voodoo:
/*0x6dcc*/      movs r1, #1
/*0x6dce*/      movs r0, #0x20
/*0x6dd0*/      b.w ckcu_voodoo1

            .thumb_func
            usb_ep_data_toggle:
/*0x6dd4*/      push {r4, lr}
/*0x6dd6*/      bl usb_get_ep_reg
/*0x6dda*/      ldr r1, [r0]
/*0x6ddc*/      and r1, r1, #9
/*0x6de0*/      str r1, [r0]
/*0x6de2*/      pop {r4, pc}

            .thumb_func
            usb_ep_stall:
/*0x6de4*/      push {r4, lr}
/*0x6de6*/      bl usb_get_ep_reg
/*0x6dea*/      ldr r1, [r0]
/*0x6dec*/      and r1, r1, #0x24
/*0x6df0*/      str r1, [r0]
/*0x6df2*/      pop {r4, pc}

            .thumb_func
            usb_set_ep_intr:
/*0x6df4*/      push {r4, lr}
/*0x6df6*/      mov r4, r1
/*0x6df8*/      bl usb_get_ep_reg
/*0x6dfc*/      str r4, [r0, #8]
/*0x6dfe*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_buff:
/*0x6e00*/      push {r4, lr}
/*0x6e02*/      bl usb_get_ep_reg
/*0x6e06*/      ldr r0, [r0, #0x10]
/*0x6e08*/      ldr r1, [pc, #8] /* data_6e14 */
/*0x6e0a*/      ubfx r0, r0, #0, #0xa
/*0x6e0e*/      add r0, r1
/*0x6e10*/      pop {r4, pc}

/*0x6e12*/  .byte 0x00
/*0x6e13*/  .byte 0x00

            data_6e14:
/*0x6e14*/  .word 0x400aa000


            .thumb_func
            usb_get_ep_buff_end:
/*0x6e18*/      push {r4, r5, r6, lr}
/*0x6e1a*/      mov r5, r0
/*0x6e1c*/      bl usb_get_ep_reg
/*0x6e20*/      mov r4, r0
/*0x6e22*/      mov r0, r5
/*0x6e24*/      bl usb_get_ep_len
/*0x6e28*/      ldr r1, [r4, #0x10]
/*0x6e2a*/      ubfx r1, r1, #0, #0xa
/*0x6e2e*/      add r0, r1
/*0x6e30*/      ldr r1, [pc, #4] /* data_6e38 */
/*0x6e32*/      add r0, r1
/*0x6e34*/      pop {r4, r5, r6, pc}

/*0x6e36*/  .byte 0x00
/*0x6e37*/  .byte 0x00

            data_6e38:
/*0x6e38*/  .word 0x400aa000


            .thumb_func
            usb_get_ep_len:
/*0x6e3c*/      push {r4, lr}
/*0x6e3e*/      bl usb_get_ep_reg
/*0x6e42*/      ldr r0, [r0, #0x10]
/*0x6e44*/      ubfx r0, r0, #0xa, #0xa
/*0x6e48*/      pop {r4, pc}

            .thumb_func
            function_e_67:
/*0x6e4a*/      push {r4, lr}
/*0x6e4c*/      bl usb_get_ep_reg
/*0x6e50*/      ldr r1, [r0, #0x10]
/*0x6e52*/      ldr r0, [r0]
/*0x6e54*/      lsls r1, r1, #3
/*0x6e56*/      bpl jump_6e5e
/*0x6e58*/      ubfx r0, r0, #2, #1
/*0x6e5c*/      pop {r4, pc}
            jump_6e5e:
/*0x6e5e*/      ubfx r0, r0, #5, #1
/*0x6e62*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_intr:
/*0x6e64*/      push {r4, lr}
/*0x6e66*/      bl usb_get_ep_reg
/*0x6e6a*/      ldr r1, [r0, #4]
/*0x6e6c*/      ldr r0, [r0, #8]
/*0x6e6e*/      ands r0, r1
/*0x6e70*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_tcnt:
/*0x6e72*/      push {r4, lr}
/*0x6e74*/      mov r4, r1
/*0x6e76*/      bl usb_get_ep_reg
/*0x6e7a*/      ldr r0, [r0, #0xc]
/*0x6e7c*/      lsrs r0, r4
/*0x6e7e*/      ubfx r0, r0, #0, #9
/*0x6e82*/      pop {r4, pc}

            .thumb_func
            function_e_70:
/*0x6e84*/      push {r4, r5, r6, lr}
/*0x6e86*/      mov r4, r1
/*0x6e88*/      mov r5, r0
/*0x6e8a*/      bl usb_get_ep_reg
/*0x6e8e*/      add.w r1, r4, r5, lsl #3
/*0x6e92*/      ldr r2, [r1, #4]
/*0x6e94*/      str r2, [r0, #0x10]
/*0x6e96*/      ldr r1, [r1, #8]
/*0x6e98*/      str r1, [r0, #4]
/*0x6e9a*/      mov.w r1, #-1
/*0x6e9e*/      str r1, [r0, #8]
/*0x6ea0*/      mov r0, r5
/*0x6ea2*/      pop.w {r4, r5, r6, lr}
/*0x6ea6*/      b.w function_e_71

            .thumb_func
            usb_read_ep_buff:
/*0x6eaa*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6eae*/      mov r7, r1
/*0x6eb0*/      mov r6, r2
/*0x6eb2*/      movs r5, r0
/*0x6eb4*/      beq jump_6eda
/*0x6eb6*/      movs r1, #0
            jump_6eb8:
/*0x6eb8*/      bl usb_get_ep_tcnt
/*0x6ebc*/      mov r4, r0
/*0x6ebe*/      cmp r0, r6
/*0x6ec0*/      bhi jump_6ed4
/*0x6ec2*/      mov r0, r5
/*0x6ec4*/      cbz r5, jump_6ede
/*0x6ec6*/      bl usb_get_ep_buff
            jump_6eca:
/*0x6eca*/      adds r1, r4, #3
/*0x6ecc*/      lsrs r2, r1, #2
/*0x6ece*/      mov r1, r7
/*0x6ed0*/      bl word_copy
            jump_6ed4:
/*0x6ed4*/      mov r0, r4
/*0x6ed6*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6eda:
/*0x6eda*/      movs r1, #0x10
/*0x6edc*/      b jump_6eb8
            jump_6ede:
/*0x6ede*/      bl usb_get_ep_buff_end
/*0x6ee2*/      b jump_6eca

            .thumb_func
            usb_recv:
/*0x6ee4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6ee8*/      mov r7, r1
/*0x6eea*/      mov r5, r2
/*0x6eec*/      mov r6, r0
/*0x6eee*/      bl usb_get_ep_reg
/*0x6ef2*/      mov r4, r0
/*0x6ef4*/      movs r0, #0
/*0x6ef6*/      cbz r5, jump_6f08
/*0x6ef8*/      mov r2, r5
/*0x6efa*/      mov r1, r7
/*0x6efc*/      mov r0, r6
/*0x6efe*/      bl usb_read_ep_buff
/*0x6f02*/      cbnz r0, jump_6f08
/*0x6f04*/      cmp r5, #0
/*0x6f06*/      bne jump_6f10
            jump_6f08:
/*0x6f08*/      ldr r1, [r4]
/*0x6f0a*/      and r1, r1, #0x10
/*0x6f0e*/      str r1, [r4]
            jump_6f10:
/*0x6f10*/      pop.w {r4, r5, r6, r7, r8, pc}

            .thumb_func
            function_e_71:
/*0x6f14*/      push {r4, lr}
/*0x6f16*/      bl usb_get_ep_reg
/*0x6f1a*/      ldr r1, [r0]
/*0x6f1c*/      and r1, r1, #0x19
/*0x6f20*/      str r1, [r0]
/*0x6f22*/      pop {r4, pc}

            .thumb_func
            function_e_72:
/*0x6f24*/      push {r4, lr}
/*0x6f26*/      bl usb_get_ep_reg
/*0x6f2a*/      movs r1, #4
/*0x6f2c*/      str r1, [r0]
/*0x6f2e*/      pop {r4, pc}

            .thumb_func
            function_e_73:
/*0x6f30*/      push {r4, lr}
/*0x6f32*/      bl usb_get_ep_reg
/*0x6f36*/      movs r1, #0x40
/*0x6f38*/      str r1, [r0, #8]
/*0x6f3a*/      ldr r2, [r0]
/*0x6f3c*/      movs r1, #0x24
/*0x6f3e*/      bics r1, r2
/*0x6f40*/      str r1, [r0]
/*0x6f42*/      pop {r4, pc}

            .thumb_func
            usb_copy_send:
/*0x6f44*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6f48*/      mov r8, r1
/*0x6f4a*/      mov r4, r2
/*0x6f4c*/      mov r7, r0
/*0x6f4e*/      bl usb_get_ep_len
/*0x6f52*/      mov r6, r0
/*0x6f54*/      mov r0, r7
/*0x6f56*/      bl usb_get_ep_reg
/*0x6f5a*/      mov r5, r0
/*0x6f5c*/      movs r1, #0
/*0x6f5e*/      mov r0, r7
/*0x6f60*/      bl usb_get_ep_tcnt
/*0x6f64*/      cmp r4, r6
/*0x6f66*/      bhi jump_6f6a
/*0x6f68*/      cbz r0, jump_6f70
            jump_6f6a:
/*0x6f6a*/      movs r0, #0
            jump_6f6c:
/*0x6f6c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6f70:
/*0x6f70*/      mov r0, r7
/*0x6f72*/      bl usb_get_ep_buff
/*0x6f76*/      mov r1, r0
/*0x6f78*/      adds r0, r4, #3
/*0x6f7a*/      lsrs r2, r0, #2
/*0x6f7c*/      mov r0, r8
/*0x6f7e*/      bl word_copy
/*0x6f82*/      str r4, [r5, #0xc]
/*0x6f84*/      movs r0, #2
/*0x6f86*/      str r0, [r5]
/*0x6f88*/      mov r0, r4
/*0x6f8a*/      b jump_6f6c

            .thumb_func
            usb_enable_intr:
/*0x6f8c*/      ldr r1, [pc, #8] /* data_6f98 */
/*0x6f8e*/      ldr r2, [r1, #4]
/*0x6f90*/      orrs r2, r0
/*0x6f92*/      str r2, [r1, #4]
/*0x6f94*/      bx lr

/*0x6f96*/  .byte 0x00
/*0x6f97*/  .byte 0x00

            data_6f98:
/*0x6f98*/  .word 0x400a8000


            .thumb_func
            function_e_75:
/*0x6f9c*/      mov r3, r0
/*0x6f9e*/      movs r1, #7
            jump_6fa0:
/*0x6fa0*/      add.w r2, r1, #8
/*0x6fa4*/      lsr.w r0, r3, r2
/*0x6fa8*/      lsls r0, r0, #0x1f
/*0x6faa*/      beq jump_6fb0
/*0x6fac*/      sxtb r0, r1
/*0x6fae*/      bx lr
            jump_6fb0:
/*0x6fb0*/      subs r1, r1, #1
/*0x6fb2*/      cmp r1, #0
/*0x6fb4*/      bgt jump_6fa0
/*0x6fb6*/      mov.w r0, #-1
/*0x6fba*/      bx lr

            .thumb_func
            usb_get_intr_flags:
/*0x6fbc*/      ldr r0, [pc, #8] /* data_6fc8 */
/*0x6fbe*/      ldr r1, [r0, #4]
/*0x6fc0*/      ldr r0, [r0, #8]
/*0x6fc2*/      ands r0, r1
/*0x6fc4*/      bx lr

/*0x6fc6*/  .byte 0x00
/*0x6fc7*/  .byte 0x00

            data_6fc8:
/*0x6fc8*/  .word 0x400a8000


            .thumb_func
            jump_1:
/*0x6fcc*/      b.w ptr_write_data

            .thumb_func
            usb_set_lpmode_pdwn:
/*0x6fd0*/      ldr r0, [pc, #8] /* data_6fdc */
/*0x6fd2*/      ldr r1, [r0]
/*0x6fd4*/      orr r1, r1, #0xc
/*0x6fd8*/      str r1, [r0]
/*0x6fda*/      bx lr

            data_6fdc:
/*0x6fdc*/  .word 0x400a8000


            .thumb_func
            usb_clear_csr:
/*0x6fe0*/      ldr r0, [pc, #8] /* data_6fec */
/*0x6fe2*/      ldr r1, [r0]
/*0x6fe4*/      and r1, r1, #0x400
/*0x6fe8*/      str r1, [r0]
/*0x6fea*/      bx lr

            data_6fec:
/*0x6fec*/  .word 0x400a8000


            .thumb_func
            function_82:
/*0x6ff0*/      push {r4, lr}
/*0x6ff2*/      mov r4, r0
/*0x6ff4*/      ldr r0, [pc, #0x64] /* data_705c */
/*0x6ff6*/      ldr r2, [r0]
/*0x6ff8*/      cmp r2, #1
/*0x6ffa*/      bne jump_705a
/*0x6ffc*/      movs r2, #0
/*0x6ffe*/      str r2, [r0]
/*0x7000*/      ldr r0, [pc, #0x5c] /* data_7060 */
/*0x7002*/      ldr r2, [r0]
/*0x7004*/      lsls r3, r2, #0x19
/*0x7006*/      mov.w r2, #-1
/*0x700a*/      bpl jump_7026
/*0x700c*/      movw r3, #0x40c
/*0x7010*/      str r3, [r0]
/*0x7012*/      str r2, [r0, #8]
/*0x7014*/      cbnz r1, jump_701c
/*0x7016*/      movs r0, #0
/*0x7018*/      bl function_3
            jump_701c:
/*0x701c*/      ldr r0, [r4]
/*0x701e*/      pop.w {r4, lr}
/*0x7022*/      b.w usb_enable_intr
            jump_7026:
/*0x7026*/      movw r3, #0xc0c
/*0x702a*/      str r3, [r0]
/*0x702c*/      str r2, [r0, #8]
/*0x702e*/      cbnz r1, jump_7036
/*0x7030*/      movs r0, #0
/*0x7032*/      bl function_3
            jump_7036:
/*0x7036*/      movs r0, #0
/*0x7038*/      bl usb_dp_wake_up
/*0x703c*/      ldr r0, [r4]
/*0x703e*/      bl usb_enable_intr
/*0x7042*/      movs r0, #0
/*0x7044*/      bl usb_dp_pull_up
/*0x7048*/      movs r0, #0
            jump_704a:
/*0x704a*/      adds r0, r0, #1
/*0x704c*/      cmp r0, #0xc8
/*0x704e*/      blo jump_704a
/*0x7050*/      pop.w {r4, lr}
/*0x7054*/      movs r0, #1
/*0x7056*/      b.w usb_dp_pull_up
            jump_705a:
/*0x705a*/      pop {r4, pc}

            data_705c:
/*0x705c*/  .word 0x2000022c
            data_7060:
/*0x7060*/  .word 0x400a8000


            .thumb_func
            ptr_write_data:
/*0x7064*/      movw r1, #0x171d
/*0x7068*/      str r1, [r0]
/*0x706a*/      ldr r1, [pc, #0x28] /* data_7094 */
/*0x706c*/      str r1, [r0, #4]
/*0x706e*/      movw r1, #0x212
/*0x7072*/      str r1, [r0, #8]
/*0x7074*/      ldr r1, [pc, #0x20] /* data_7098 */
/*0x7076*/      str r1, [r0, #0xc]
/*0x7078*/      ldr r2, [pc, #0x20] /* data_709c */
/*0x707a*/      movs r1, #0x10
/*0x707c*/      strd r1, r2, [r0, #0x10]
/*0x7080*/      str r1, [r0, #0x18]
/*0x7082*/      ldr r1, [pc, #0x1c] /* data_70a0 */
/*0x7084*/      str r1, [r0, #0x1c]
/*0x7086*/      movs r1, #0
/*0x7088*/      str r1, [r0, #0x20]
/*0x708a*/      ldr r1, [pc, #0x18] /* data_70a4 */
/*0x708c*/      str r1, [r0, #0x24]
/*0x708e*/      movs r1, #2
/*0x7090*/      str r1, [r0, #0x28]
/*0x7092*/      bx lr

            data_7094:
/*0x7094*/  .word 0x80010008
            data_7098:
/*0x7098*/  .word 0x91002088
            data_709c:
/*0x709c*/  .word 0x92010090
            data_70a0:
/*0x70a0*/  .word 0x930100d0
            data_70a4:
/*0x70a4*/  .word 0x84010110


            .thumb_func
            usb_copy_ep_setup:
/*0x70a8*/      ldr r1, [pc, #8] /* data_70b4 */
/*0x70aa*/      ldr r2, [r1]
/*0x70ac*/      str r2, [r0]
/*0x70ae*/      ldr r1, [r1, #4]
/*0x70b0*/      str r1, [r0, #4]
/*0x70b2*/      bx lr

            data_70b4:
/*0x70b4*/  .word 0x400aa000


            .thumb_func
            usb_set_genrsm:
/*0x70b8*/      ldr r0, [pc, #8] /* data_70c4 */
/*0x70ba*/      ldr r1, [r0]
/*0x70bc*/      orr r1, r1, #0x20
/*0x70c0*/      str r1, [r0]
/*0x70c2*/      bx lr

            data_70c4:
/*0x70c4*/  .word 0x400a8000


            .thumb_func
            usb_set_adrset:
/*0x70c8*/      ldr r1, [pc, #0xc] /* data_70d8 */
/*0x70ca*/      ldr r2, [r1]
/*0x70cc*/      orr r2, r2, #0x100
/*0x70d0*/      str r2, [r1]
/*0x70d2*/      str r0, [r1, #0x10]
/*0x70d4*/      bx lr

/*0x70d6*/  .byte 0x00
/*0x70d7*/  .byte 0x00

            data_70d8:
/*0x70d8*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x70dc*/      ldr r0, [pc, #4] /* data_70e4 */
/*0x70de*/      b.w usb_entry

/*0x70e2*/  .byte 0x00
/*0x70e3*/  .byte 0x00

            data_70e4:
/*0x70e4*/  .word 0x20000234


            .thumb_func
            watchdog_init:
/*0x70e8*/      ldr r1, [pc, #0x4c] /* data_7138 */
/*0x70ea*/      ldr r0, [pc, #0x48] /* data_7134 */
/*0x70ec*/      ldr r2, [r1, #0x30]
/*0x70ee*/      orr r2, r2, #0x10
/*0x70f2*/      str r2, [r1, #0x30]
/*0x70f4*/      ldr r1, [pc, #0x44] /* data_713c */
/*0x70f6*/      ldr r2, [r1, #4]
/*0x70f8*/      ubfx r2, r2, #0, #0xc
/*0x70fc*/      orr r2, r2, #0x1a000
/*0x7100*/      b jump_710a
            jump_7102:
/*0x7102*/      str r2, [r1, #4]
/*0x7104*/      ldr r3, [r1, #4]
/*0x7106*/      lsls r3, r3, #0xf
/*0x7108*/      bmi jump_710e
            jump_710a:
/*0x710a*/      subs r0, r0, #1
/*0x710c*/      bhs jump_7102
            jump_710e:
/*0x710e*/      ldr r0, [r1, #8]
/*0x7110*/      ubfx r0, r0, #0, #0xc
/*0x7114*/      orr r0, r0, #0x5000
/*0x7118*/      str r0, [r1, #8]
/*0x711a*/      ldr r0, [r1, #4]
/*0x711c*/      and r0, r0, #0x1f000
/*0x7120*/      orr r0, r0, #0x7d0
/*0x7124*/      str r0, [r1, #4]
/*0x7126*/      ldr r0, [pc, #0x18] /* data_7140 */
/*0x7128*/      str r0, [r1]
/*0x712a*/      movw r0, #0xca35
/*0x712e*/      str r0, [r1, #0x10]
/*0x7130*/      bx lr

/*0x7132*/  .byte 0x00
/*0x7133*/  .byte 0x00

            data_7134:
/*0x7134*/  .word 0x006ddd00
            data_7138:
/*0x7138*/  .word 0x40088000
            data_713c:
/*0x713c*/  .word 0x40068000
            data_7140:
/*0x7140*/  .word 0x5fa00001


            .thumb_func
            watchdog_reload_timer:
/*0x7144*/      ldr r1, [pc, #8] /* data_7150 */
/*0x7146*/      ldr r0, [pc, #4] /* data_714c */
/*0x7148*/      str r0, [r1]
/*0x714a*/      bx lr

            data_714c:
/*0x714c*/  .word 0x5fa00001
            data_7150:
/*0x7150*/  .word 0x40068000


            .thumb_func
            loc_7154:
/*0x7154*/      movs r0, #0x4f
/*0x7156*/      bx lr

            .thumb_func
            loc_7158:
/*0x7158*/      push {r4, lr}
/*0x715a*/      bl crc16
/*0x715e*/      mov r4, r0
/*0x7160*/      mov r1, r0
/*0x7162*/      ldr r0, [pc, #0x10] /* data_7174 */
/*0x7164*/      bl function_14
/*0x7168*/      lsrs r1, r4, #8
/*0x716a*/      ldr r0, [pc, #8] /* data_7174 */
/*0x716c*/      bl function_14
/*0x7170*/      movs r0, #0x4f
/*0x7172*/      pop {r4, pc}

            data_7174:
/*0x7174*/  .word 0x20000358


            .thumb_func
            loc_7178:
/*0x7178*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x717c*/      mov r6, r2
/*0x717e*/      cmp r0, #0xa
/*0x7180*/      beq jump_7188
/*0x7182*/      cmp.w r1, #0xf800
/*0x7186*/      bhs jump_718e
            jump_7188:
/*0x7188*/      movs r0, #0x46
            jump_718a:
/*0x718a*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_718e:
/*0x718e*/      movs r5, #0
/*0x7190*/      mov r4, r1
/*0x7192*/      movs r7, #0x1e
/*0x7194*/      b jump_71b0
            jump_7196:
/*0x7196*/      mov r0, r4
/*0x7198*/      bl flash_page_erase
/*0x719c*/      udiv r0, r5, r7
/*0x71a0*/      mls r0, r7, r0, r5
/*0x71a4*/      cbnz r0, jump_71aa
/*0x71a6*/      bl watchdog_reload_timer
            jump_71aa:
/*0x71aa*/      add.w r4, r4, #0x400
/*0x71ae*/      adds r5, r5, #1
            jump_71b0:
/*0x71b0*/      cmp r4, r6
/*0x71b2*/      bls jump_7196
/*0x71b4*/      movs r0, #0x4f
/*0x71b6*/      b jump_718a

            .thumb_func
            loc_71b8:
/*0x71b8*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x71bc*/      movs r6, #0
/*0x71be*/      mov r8, r0
/*0x71c0*/      mov r4, r1
/*0x71c2*/      mov sb, r2
/*0x71c4*/      ldr r7, [pc, #0xc0] /* data_7288 */
/*0x71c6*/      mov r5, r6
/*0x71c8*/      ldr.w fp, [pc, #0xc0] /* data_728c */
/*0x71cc*/      mov sl, r6
/*0x71ce*/      bl flash_get_protection_status
/*0x71d2*/      lsls r0, r0, #0x1f
/*0x71d4*/      bne jump_71da
/*0x71d6*/      mov.w sl, #1
            jump_71da:
/*0x71da*/      cmp.w r8, #1
/*0x71de*/      bne jump_727e
/*0x71e0*/      cmp.w sl, #1
/*0x71e4*/      bne jump_7210
/*0x71e6*/      sub.w r0, sb, r4
/*0x71ea*/      adds r0, r0, #1
/*0x71ec*/      b jump_71f6
            jump_71ee:
/*0x71ee*/      ldr r1, [r4, r6]
/*0x71f0*/      adds r1, r1, #1
/*0x71f2*/      bne jump_723a
/*0x71f4*/      adds r6, r6, #4
            jump_71f6:
/*0x71f6*/      cmp r0, r6
/*0x71f8*/      bhi jump_71ee
/*0x71fa*/      cmp.w r8, #1
/*0x71fe*/      beq jump_7210
/*0x7200*/      b jump_727e
            jump_7202:
/*0x7202*/      mov r1, r4
/*0x7204*/      movs r0, #4
/*0x7206*/      ldr r2, [r7]
/*0x7208*/      bl flash_write
/*0x720c*/      adds r4, r4, #4
/*0x720e*/      adds r7, r7, #4
            jump_7210:
/*0x7210*/      cmp r4, sb
/*0x7212*/      bls jump_7202
/*0x7214*/      b jump_727e
            jump_7216:
/*0x7216*/      ldr r0, [pc, #0x78] /* data_7290 */
/*0x7218*/      cmp r4, r0
/*0x721a*/      bls jump_7220
/*0x721c*/      movs r0, #0
/*0x721e*/      b jump_7222
            jump_7220:
/*0x7220*/      ldr r0, [r4]
            jump_7222:
/*0x7222*/      cmp.w r8, #0
/*0x7226*/      beq jump_727c
/*0x7228*/      cmp.w r8, #3
/*0x722c*/      beq jump_7236
/*0x722e*/      cmp.w sl, #1
/*0x7232*/      beq jump_7240
/*0x7234*/      b jump_725c
            jump_7236:
/*0x7236*/      adds r0, r0, #1
/*0x7238*/      beq jump_727c
            jump_723a:
/*0x723a*/      movs r0, #0x46
            jump_723c:
/*0x723c*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
            jump_7240:
/*0x7240*/      sub.w r1, r4, #0x2800
/*0x7244*/      cmp.w r1, #0x400
/*0x7248*/      blo jump_725c
/*0x724a*/      cmp.w r4, #0xf800
/*0x724e*/      bhs jump_725c
/*0x7250*/      ldr r2, [pc, #0x40] /* data_7294 */
/*0x7252*/      sub.w r1, r4, #0xf800
/*0x7256*/      cmp r1, r2
/*0x7258*/      blo jump_725c
/*0x725a*/      movs r0, r0
            jump_725c:
/*0x725c*/      str.w r0, [fp, r5, lsl #2]
/*0x7260*/      adds r5, r5, #1
/*0x7262*/      cmp r5, #0x10
/*0x7264*/      bne jump_727c
/*0x7266*/      ldr r0, [pc, #0x30] /* data_7298 */
/*0x7268*/      movs r5, #0
/*0x726a*/      movs r1, #0x10
/*0x726c*/      str r1, [r0, #0x58]
/*0x726e*/      movs r1, #0x40
/*0x7270*/      str r1, [r0, #0x5c]
/*0x7272*/      movs r1, #2
/*0x7274*/      str r1, [r0, #0x50]
            jump_7276:
/*0x7276*/      ldr r1, [r0, #0x58]
/*0x7278*/      lsls r1, r1, #0x1b
/*0x727a*/      bpl jump_7276
            jump_727c:
/*0x727c*/      adds r4, r4, #4
            jump_727e:
/*0x727e*/      cmp r4, sb
/*0x7280*/      bls jump_7216
/*0x7282*/      movs r0, #0x4f
/*0x7284*/      b jump_723c

/*0x7286*/  .byte 0x00
/*0x7287*/  .byte 0x00

            data_7288:
/*0x7288*/  .word 0x200007d8
            data_728c:
/*0x728c*/  .word 0x400aa0d0
            data_7290:
/*0x7290*/  .word 0x1ff003fc
            data_7294:
/*0x7294*/  .word 0x1fef0850
            data_7298:
/*0x7298*/  .word 0x400a8000


            .thumb_func
            loc_729c:
/*0x729c*/      push {r4, lr}
/*0x729e*/      movs r2, #0x40
/*0x72a0*/      ldr r1, [pc, #8] /* data_72ac */
/*0x72a2*/      movs r0, #3
/*0x72a4*/      bl usb_copy_send
/*0x72a8*/      movs r0, #0x4f
/*0x72aa*/      pop {r4, pc}

            data_72ac:
/*0x72ac*/  .word 0x200007bc


            .thumb_func
            function_e_78:
/*0x72b0*/      push {r4, r5, r6, lr}
/*0x72b2*/      mov r4, r0
/*0x72b4*/      movs r0, #0
/*0x72b6*/      bl usb_get_ep_len
/*0x72ba*/      mov r5, r0
/*0x72bc*/      ldr r0, [r4, #0x20]
/*0x72be*/      adds r1, r0, #1
/*0x72c0*/      beq jump_72f0
/*0x72c2*/      ldrb.w r1, [r4, #0x24]
/*0x72c6*/      cmp r1, #1
/*0x72c8*/      bne jump_72f0
/*0x72ca*/      cmp r0, r5
/*0x72cc*/      blo jump_72d4
/*0x72ce*/      subs r0, r0, r5
/*0x72d0*/      str r0, [r4, #0x20]
/*0x72d2*/      b jump_72e0
            jump_72d4:
/*0x72d4*/      mov r5, r0
/*0x72d6*/      movs r0, #0
/*0x72d8*/      str r0, [r4, #0x20]
/*0x72da*/      movs r0, #2
/*0x72dc*/      strb.w r0, [r4, #0x24]
            jump_72e0:
/*0x72e0*/      mov r2, r5
/*0x72e2*/      movs r0, #0
/*0x72e4*/      ldr r1, [r4, #0x1c]
/*0x72e6*/      bl usb_copy_send
/*0x72ea*/      ldr r0, [r4, #0x1c]
/*0x72ec*/      add r0, r5
/*0x72ee*/      str r0, [r4, #0x1c]
            jump_72f0:
/*0x72f0*/      pop {r4, r5, r6, pc}
            jump_72f2:
/*0x72f2*/      push {r4, lr}
/*0x72f4*/      mov r4, r0
/*0x72f6*/      movs r0, #0
/*0x72f8*/      strb r0, [r4, #0x19]
/*0x72fa*/      cbz r1, jump_7310
/*0x72fc*/      cmp r1, #1
/*0x72fe*/      beq jump_7314
/*0x7300*/      cmp r1, #2
/*0x7302*/      bne jump_7326
/*0x7304*/      ldrh r0, [r4, #4]
/*0x7306*/      and r0, r0, #0xf
/*0x730a*/      bl function_e_67
/*0x730e*/      b jump_7314
            jump_7310:
/*0x7310*/      ldrb.w r0, [r4, #0x34]
            jump_7314:
/*0x7314*/      strb r0, [r4, #0x18]
/*0x7316*/      add.w r0, r4, #0x18
/*0x731a*/      str r0, [r4, #0x1c]
/*0x731c*/      movs r0, #2
/*0x731e*/      str r0, [r4, #0x20]
/*0x7320*/      movs r0, #1
/*0x7322*/      strb.w r0, [r4, #0x24]
            jump_7326:
/*0x7326*/      pop {r4, pc}

            .thumb_func
            function_e_79:
/*0x7328*/      push {r4, r5, r6, lr}
/*0x732a*/      mov r4, r0
/*0x732c*/      ldrh r0, [r0]
/*0x732e*/      movs r5, #1
/*0x7330*/      cmp.w r0, #0x500
/*0x7334*/      beq jump_73d2
/*0x7336*/      bgt jump_737a
/*0x7338*/      cmp.w r0, #0x100
/*0x733c*/      beq jump_73c4
/*0x733e*/      bgt jump_7358
/*0x7340*/      cmp r0, #0x80
/*0x7342*/      beq jump_73bc
/*0x7344*/      cmp r0, #0x81
/*0x7346*/      beq jump_73c0
/*0x7348*/      cmp r0, #0x82
/*0x734a*/      bne jump_7416
/*0x734c*/      movs r1, #2
            jump_734e:
/*0x734e*/      mov r0, r4
/*0x7350*/      pop.w {r4, r5, r6, lr}
/*0x7354*/      b.w jump_72f2
            jump_7358:
/*0x7358*/      cmp.w r0, #0x102
/*0x735c*/      beq jump_73c8
/*0x735e*/      cmp.w r0, #0x300
/*0x7362*/      beq jump_73cc
/*0x7364*/      sub.w r0, r0, #0x300
/*0x7368*/      subs r0, #2
/*0x736a*/      bne jump_7416
/*0x736c*/      movs r2, #1
            jump_736e:
/*0x736e*/      movs r1, #2
            jump_7370:
/*0x7370*/      mov r0, r4
/*0x7372*/      pop.w {r4, r5, r6, lr}
/*0x7376*/      b.w function_e_80
            jump_737a:
/*0x737a*/      cmp.w r0, #0x900
/*0x737e*/      beq jump_741c
/*0x7380*/      bgt jump_73a2
/*0x7382*/      cmp.w r0, #0x680
/*0x7386*/      beq jump_73e0
/*0x7388*/      sub.w r0, r0, #0x600
/*0x738c*/      subs r0, #0x81
/*0x738e*/      beq jump_7418
/*0x7390*/      sub.w r0, r0, #0x100
/*0x7394*/      subs r0, #0xff
/*0x7396*/      bne jump_7416
/*0x7398*/      add.w r0, r4, #0x30
/*0x739c*/      strd r0, r5, [r4, #0x1c]
/*0x73a0*/      b jump_7412
            jump_73a2:
/*0x73a2*/      sub.w r0, r0, #0xa00
/*0x73a6*/      subs r0, #0x81
/*0x73a8*/      beq jump_7440
/*0x73aa*/      cmp r0, #0x80
/*0x73ac*/      bne jump_7416
/*0x73ae*/      ldr r1, [r4, #0x58]
            jump_73b0:
/*0x73b0*/      cmp r1, #0
/*0x73b2*/      beq jump_7416
/*0x73b4*/      mov r0, r4
/*0x73b6*/      pop.w {r4, r5, r6, lr}
/*0x73ba*/      bx r1
            jump_73bc:
/*0x73bc*/      movs r1, #0
/*0x73be*/      b jump_734e
            jump_73c0:
/*0x73c0*/      movs r1, #1
/*0x73c2*/      b jump_734e
            jump_73c4:
/*0x73c4*/      movs r2, #0
/*0x73c6*/      b jump_73ce
            jump_73c8:
/*0x73c8*/      movs r2, #0
/*0x73ca*/      b jump_736e
            jump_73cc:
/*0x73cc*/      movs r2, #1
            jump_73ce:
/*0x73ce*/      movs r1, #0
/*0x73d0*/      b jump_7370
            jump_73d2:
/*0x73d2*/      ldrb r0, [r4, #2]
/*0x73d4*/      bl usb_set_adrset
/*0x73d8*/      strb.w r5, [r4, #0x24]
/*0x73dc*/      movs r0, #5
/*0x73de*/      b jump_743a
            jump_73e0:
/*0x73e0*/      ldrb r0, [r4, #3]
/*0x73e2*/      cmp r0, #1
/*0x73e4*/      beq jump_7406
/*0x73e6*/      cmp r0, #2
/*0x73e8*/      beq jump_740a
/*0x73ea*/      cmp r0, #3
/*0x73ec*/      bne jump_7416
/*0x73ee*/      ldrb r0, [r4, #2]
/*0x73f0*/      ldr r1, [r4, #0x14]
/*0x73f2*/      cmp r1, r0
/*0x73f4*/      bls jump_7416
/*0x73f6*/      ldr r1, [r4, #0x10]
/*0x73f8*/      ldr.w r0, [r1, r0, lsl #2]
/*0x73fc*/      cmp r0, #0
/*0x73fe*/      beq jump_7416
            jump_7400:
/*0x7400*/      str r0, [r4, #0x1c]
/*0x7402*/      ldrb r0, [r0]
/*0x7404*/      b jump_7410
            jump_7406:
/*0x7406*/      ldr r0, [r4, #8]
/*0x7408*/      b jump_7400
            jump_740a:
/*0x740a*/      ldr r0, [r4, #0xc]
/*0x740c*/      str r0, [r4, #0x1c]
/*0x740e*/      ldrh r0, [r0, #2]
            jump_7410:
/*0x7410*/      str r0, [r4, #0x20]
            jump_7412:
/*0x7412*/      strb.w r5, [r4, #0x24]
            jump_7416:
/*0x7416*/      pop {r4, r5, r6, pc}
            jump_7418:
/*0x7418*/      ldr r1, [r4, #0x54]
/*0x741a*/      b jump_73b0
            jump_741c:
/*0x741c*/      ldrb r0, [r4, #2]
/*0x741e*/      strb.w r0, [r4, #0x30]
/*0x7422*/      strb.w r5, [r4, #0x24]
/*0x7426*/      movs r5, #1
            jump_7428:
/*0x7428*/      sxtb r0, r5
/*0x742a*/      ldr.w r1, [r4, #0x84]
/*0x742e*/      bl function_e_70
/*0x7432*/      adds r5, r5, #1
/*0x7434*/      cmp r5, #8
/*0x7436*/      blo jump_7428
/*0x7438*/      movs r0, #6
            jump_743a:
/*0x743a*/      strb.w r0, [r4, #0x32]
/*0x743e*/      pop {r4, r5, r6, pc}
            jump_7440:
/*0x7440*/      ldr r1, [r4, #0x5c]
/*0x7442*/      b jump_73b0

            .thumb_func
            function_e_80:
/*0x7444*/      push {r4, r5, r6, lr}
/*0x7446*/      mov r4, r0
/*0x7448*/      movs r6, #1
/*0x744a*/      cbz r1, jump_7466
/*0x744c*/      cmp r1, #2
/*0x744e*/      bne jump_7464
/*0x7450*/      ldrh r0, [r4, #4]
/*0x7452*/      ands r5, r0, #0xf
/*0x7456*/      beq jump_7460
/*0x7458*/      cbz r2, jump_747c
/*0x745a*/      mov r0, r5
/*0x745c*/      bl function_e_73
            jump_7460:
/*0x7460*/      strb.w r6, [r4, #0x24]
            jump_7464:
/*0x7464*/      pop {r4, r5, r6, pc}
            jump_7466:
/*0x7466*/      ldrb r0, [r4, #2]
/*0x7468*/      cmp r0, #1
/*0x746a*/      bne jump_7464
/*0x746c*/      add.w r4, r4, #0x24
/*0x7470*/      ldrb r0, [r4, #0x10]
/*0x7472*/      bfi r0, r2, #1, #1
/*0x7476*/      strb r0, [r4, #0x10]
/*0x7478*/      strb r6, [r4]
/*0x747a*/      pop {r4, r5, r6, pc}
            jump_747c:
/*0x747c*/      ldr r0, [r4, #0x38]
/*0x747e*/      cmp r0, #0
/*0x7480*/      bne jump_7460
/*0x7482*/      mov r0, r5
/*0x7484*/      bl usb_ep_stall
/*0x7488*/      sxtb r0, r5
/*0x748a*/      bl usb_ep_data_toggle
/*0x748e*/      b jump_7460

            .thumb_func
            word_copy:
/*0x7490*/      subs r2, r2, #1
/*0x7492*/      bmi jump_749e
/*0x7494*/      ldr.w r3, [r0, r2, lsl #2]
/*0x7498*/      str.w r3, [r1, r2, lsl #2]
/*0x749c*/      b word_copy
            jump_749e:
/*0x749e*/      bx lr

            .thumb_func
            usb_get_ep_reg:
/*0x74a0*/      ldr r1, [pc, #8] /* data_74ac */
/*0x74a2*/      add.w r0, r0, r0, lsl #2
/*0x74a6*/      add.w r0, r1, r0, lsl #2
/*0x74aa*/      bx lr

            data_74ac:
/*0x74ac*/  .word 0x400a8014


            .thumb_func
            function_e_81_unsued:
/*0x74b0*/      b jump_74b8
            jump_74b2:
/*0x74b2*/      ldm r0!, {r3}
/*0x74b4*/      subs r2, r2, #4
/*0x74b6*/      stm r1!, {r3}
            jump_74b8:
/*0x74b8*/      cmp r2, #0
/*0x74ba*/      bne jump_74b2
/*0x74bc*/      bx lr

/*0x74be*/  .byte 0x70
/*0x74bf*/  .byte 0x47


            .thumb_func
            sram_stack_zero:
/*0x74c0*/      movs r0, #0
/*0x74c2*/      b jump_74c8
            jump_74c4:
/*0x74c4*/      stm r1!, {r0}
/*0x74c6*/      subs r2, r2, #4
            jump_74c8:
/*0x74c8*/      cmp r2, #0
/*0x74ca*/      bne jump_74c4
/*0x74cc*/      bx lr

/*0x74ce*/  .byte 0x00
/*0x74cf*/  .byte 0x00


            .thumb_func
            function_e_82:
/*0x74d0*/      push.w {r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x74d4*/      ldr.w sb, [pc, #0x28c] /* data_7764 */
/*0x74d8*/      mov r8, r2
/*0x74da*/      mov r4, r0
/*0x74dc*/      mov r5, r1
/*0x74de*/      mov r6, sb
/*0x74e0*/      ldrb.w r2, [sb, #2]
/*0x74e4*/      bl function_24
/*0x74e8*/      strb.w r0, [r6, #0x24]
/*0x74ec*/      add.w r6, r5, r4, lsl #3
/*0x74f0*/      cmp r6, #0x10
/*0x74f2*/      bne jump_7502
/*0x74f4*/      ldrb.w r1, [sb, #0x1f]
/*0x74f8*/      cmp r1, #1
/*0x74fa*/      bne jump_7502
/*0x74fc*/      movs r1, #0xff
/*0x74fe*/      strb.w r1, [sb, #0x24]
            jump_7502:
/*0x7502*/      ldr r0, [pc, #0x268] /* data_776c */
/*0x7504*/      movs r7, #1
/*0x7506*/      add.w r0, r0, r4, lsl #3
/*0x750a*/      str r0, [sp]
/*0x750c*/      ldr r0, [pc, #0x260] /* data_7770 */
/*0x750e*/      ldr.w fp, [pc, #0x258] /* data_7768 */
/*0x7512*/      add.w r0, r0, r4, lsl #3
/*0x7516*/      str r0, [sp, #4]
/*0x7518*/      ldr r0, [pc, #0x258] /* data_7774 */
/*0x751a*/      lsls r7, r5
/*0x751c*/      add.w r0, r0, r4, lsl #3
/*0x7520*/      mov.w sl, #0
/*0x7524*/      str r0, [sp, #8]
/*0x7526*/      cmp.w r8, #0
/*0x752a*/      beq jump_7628
/*0x752c*/      ldrb.w r0, [sb, #0x1b]
/*0x7530*/      mov r8, sb
/*0x7532*/      cmp r0, #1
/*0x7534*/      beq jump_753e
/*0x7536*/      ldrb.w r0, [r8, #0x1c]
/*0x753a*/      cmp r0, #3
/*0x753c*/      bne jump_754a
            jump_753e:
/*0x753e*/      bl function_e_84
/*0x7542*/      strb.w sl, [r8, #0x1b]
/*0x7546*/      strb.w sl, [r8, #0x1c]
            jump_754a:
/*0x754a*/      ldrb.w r0, [r8, #2]
/*0x754e*/      mov.w r2, #0x100
/*0x7552*/      cbz r0, jump_7570
/*0x7554*/      ldr.w sb, [pc, #0x220] /* data_7778 */
/*0x7558*/      ldrb.w r1, [sb, r4]
/*0x755c*/      orrs r1, r7
/*0x755e*/      strb.w r1, [sb, r4]
/*0x7562*/      ldrb.w r0, [r8, #0x24]
/*0x7566*/      cmp r0, #3
/*0x7568*/      beq jump_75ea
/*0x756a*/      cmp r0, #0x13
/*0x756c*/      beq jump_765c
/*0x756e*/      b jump_7626
            jump_7570:
/*0x7570*/      ldrb.w r0, [r8, #0x24]
/*0x7574*/      mov r7, r8
/*0x7576*/      cmp r0, #2
/*0x7578*/      beq jump_7580
/*0x757a*/      cmp r0, #0x12
/*0x757c*/      beq jump_75b0
/*0x757e*/      b jump_7632
            jump_7580:
/*0x7580*/      add.w r7, r7, #0x18
/*0x7584*/      ldrb r0, [r7, #0xe]
/*0x7586*/      add.w r1, r0, r0, lsl #1
/*0x758a*/      add.w r0, fp, r1, lsl #4
/*0x758e*/      ldrb r1, [r7]
/*0x7590*/      add.w r0, r0, r1, lsl #4
/*0x7594*/      ldr r0, [r0, #-0x8]
/*0x7598*/      strb.w sl, [r7, #0x1a]
/*0x759c*/      add.w r1, r0, r6, lsl #8
/*0x75a0*/      mov.w r0, #1
/*0x75a4*/      strb r0, [r7, #3]
/*0x75a6*/      strb r0, [r7, #4]
/*0x75a8*/      strh.w sl, [r7, #0x2a]
/*0x75ac*/      strb r4, [r7, #0x1e]
/*0x75ae*/      b jump_761c
            jump_75b0:
/*0x75b0*/      add.w r7, r7, #0x18
/*0x75b4*/      mov.w r2, #2
/*0x75b8*/      ldrb r0, [r7, #0xe]
/*0x75ba*/      add.w r1, r0, r0, lsl #1
/*0x75be*/      add.w r0, fp, r1, lsl #4
/*0x75c2*/      ldrb r1, [r7]
/*0x75c4*/      add.w r0, r0, r1, lsl #4
/*0x75c8*/      ldr r0, [r0, #-0x8]
/*0x75cc*/      add.w r1, r0, r6, lsl #8
/*0x75d0*/      ldr r0, [pc, #0x1a8] /* data_777c */
/*0x75d2*/      bl spi_flash_read_data
/*0x75d6*/      ldr r0, [pc, #0x1a4] /* data_777c */
/*0x75d8*/      ldrb r4, [r0, #1]
/*0x75da*/      mov r0, r4
/*0x75dc*/      bl function_e_89
/*0x75e0*/      movs r0, #1
/*0x75e2*/      strb r0, [r7, #0xb]
/*0x75e4*/      mov r0, r4
            jump_75e6:
/*0x75e6*/      pop.w {r1, r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_75ea:
/*0x75ea*/      ldrb.w r0, [r8, #0x26]
/*0x75ee*/      add.w r1, r0, r0, lsl #1
/*0x75f2*/      add.w r0, fp, r1, lsl #4
/*0x75f6*/      ldrb.w r1, [r8, #0x18]
/*0x75fa*/      add.w r0, r0, r1, lsl #4
/*0x75fe*/      ldr r0, [r0, #-0x4]
/*0x7602*/      strb.w sl, [r8, #0x32]
/*0x7606*/      add.w r1, r0, r6, lsl #8
/*0x760a*/      movs r0, #1
/*0x760c*/      strb.w r0, [r8, #0x1b]
/*0x7610*/      strb.w r0, [r8, #0x1c]
/*0x7614*/      strh.w sl, [r8, #0x42]
/*0x7618*/      strb.w r4, [r8, #0x36]
            jump_761c:
/*0x761c*/      strb.w r5, [r8, #0x37]
/*0x7620*/      ldr r0, [pc, #0x158] /* data_777c */
/*0x7622*/      bl spi_flash_read_data
            jump_7626:
/*0x7626*/      b jump_762a
            jump_7628:
/*0x7628*/      b jump_76a6
            jump_762a:
/*0x762a*/      ldrb.w r0, [r8, #0x24]
/*0x762e*/      cmp r0, #2
/*0x7630*/      beq jump_76fc
            jump_7632:
/*0x7632*/      ldrb.w r0, [r8, #0x24]
/*0x7636*/      mov r1, r8
/*0x7638*/      cmp r0, #3
/*0x763a*/      beq jump_76fc
/*0x763c*/      cmp r0, #0xc
/*0x763e*/      beq jump_76fc
/*0x7640*/      cmp r0, #0xd
/*0x7642*/      beq jump_76fc
/*0x7644*/      ldrb.w r0, [r1, #0x26]
/*0x7648*/      cmp r0, #1
/*0x764a*/      beq jump_769e
/*0x764c*/      cmp r0, #2
/*0x764e*/      beq jump_76a2
/*0x7650*/      ldr r0, [sp, #8]
            jump_7652:
/*0x7652*/      ldrb r0, [r0, r5]
/*0x7654*/      strb.w sl, [r8, #0x23]
/*0x7658*/      b jump_75e6

/*0x765a*/  .byte 0xff
/*0x765b*/  .byte 0xe7

            jump_765c:
/*0x765c*/      ldrb.w r0, [r8, #0x26]
/*0x7660*/      movs r2, #2
/*0x7662*/      add.w r1, r0, r0, lsl #1
/*0x7666*/      add.w r0, fp, r1, lsl #4
/*0x766a*/      ldrb.w r1, [r8, #0x18]
/*0x766e*/      add.w r0, r0, r1, lsl #4
/*0x7672*/      ldr r0, [r0, #-0x4]
/*0x7676*/      add.w r1, r0, r6, lsl #8
/*0x767a*/      ldr r0, [pc, #0x100] /* data_777c */
/*0x767c*/      bl spi_flash_read_data
/*0x7680*/      ldr r0, [pc, #0xf8] /* data_777c */
/*0x7682*/      ldrb r5, [r0, #1]
/*0x7684*/      mov r0, r5
/*0x7686*/      bl function_e_89
/*0x768a*/      ldrb.w r0, [sb, r4]
/*0x768e*/      movs r1, #1
/*0x7690*/      orrs r0, r7
/*0x7692*/      strb.w r0, [sb, r4]
/*0x7696*/      strb.w r1, [r8, #0x23]
/*0x769a*/      mov r0, r5
/*0x769c*/      b jump_75e6
            jump_769e:
/*0x769e*/      ldr r0, [sp]
/*0x76a0*/      b jump_7652
            jump_76a2:
/*0x76a2*/      ldr r0, [sp, #4]
/*0x76a4*/      b jump_7652
            jump_76a6:
/*0x76a6*/      ldr r1, [pc, #0xd0] /* data_7778 */
/*0x76a8*/      mov.w r8, #1
/*0x76ac*/      ldrb r0, [r1, r4]
/*0x76ae*/      tst r0, r7
/*0x76b0*/      beq jump_7718
/*0x76b2*/      bics r0, r7
/*0x76b4*/      strb r0, [r1, r4]
/*0x76b6*/      movs r2, #1
/*0x76b8*/      mov r1, r5
/*0x76ba*/      mov r0, r4
/*0x76bc*/      bl function_24
/*0x76c0*/      mov r4, sb
/*0x76c2*/      strb.w r0, [sb, #0x24]
/*0x76c6*/      cmp r0, #3
/*0x76c8*/      beq jump_76f2
/*0x76ca*/      cmp r0, #0x13
/*0x76cc*/      beq jump_7700
/*0x76ce*/      cmp r0, #2
/*0x76d0*/      beq jump_76fc
            jump_76d2:
/*0x76d2*/      uxtb r0, r0
/*0x76d4*/      cmp r0, #3
/*0x76d6*/      beq jump_76fc
/*0x76d8*/      cmp r0, #0xc
/*0x76da*/      beq jump_76fc
/*0x76dc*/      cmp r0, #0xd
/*0x76de*/      beq jump_76fc
/*0x76e0*/      ldrb.w r0, [r4, #0x26]
/*0x76e4*/      cmp r0, #1
/*0x76e6*/      beq jump_775c
/*0x76e8*/      cmp r0, #2
/*0x76ea*/      beq jump_7760
/*0x76ec*/      ldr r0, [sp, #8]
            jump_76ee:
/*0x76ee*/      ldrb r0, [r0, r5]
/*0x76f0*/      b jump_75e6
            jump_76f2:
/*0x76f2*/      strb.w sl, [r4, #0x1b]
/*0x76f6*/      movs r0, #3
/*0x76f8*/      strb.w r0, [sb, #0x1c]
            jump_76fc:
/*0x76fc*/      movs r0, #0
/*0x76fe*/      b jump_75e6
            jump_7700:
/*0x7700*/      ldrb.w r0, [r4, #0x26]
/*0x7704*/      add.w r1, r0, r0, lsl #1
/*0x7708*/      add.w r0, fp, r1, lsl #4
/*0x770c*/      ldrb r1, [r4, #0x18]
/*0x770e*/      add.w r0, r0, r1, lsl #4
/*0x7712*/      ldr r0, [r0, #-0x4]
/*0x7716*/      b jump_7746
            jump_7718:
/*0x7718*/      movs r2, #0
/*0x771a*/      mov r1, r5
/*0x771c*/      mov r0, r4
/*0x771e*/      bl function_24
/*0x7722*/      mov r4, sb
/*0x7724*/      strb.w r0, [sb, #0x24]
/*0x7728*/      cmp r0, #2
/*0x772a*/      beq jump_76f2
/*0x772c*/      cmp r0, #0x12
/*0x772e*/      bne jump_76d2
/*0x7730*/      ldrb.w r0, [r4, #0x26]
/*0x7734*/      add.w r1, r0, r0, lsl #1
/*0x7738*/      add.w r0, fp, r1, lsl #4
/*0x773c*/      ldrb r1, [r4, #0x18]
/*0x773e*/      add.w r0, r0, r1, lsl #4
/*0x7742*/      ldr r0, [r0, #-0x8]
            jump_7746:
/*0x7746*/      movs r2, #2
/*0x7748*/      add.w r1, r0, r6, lsl #8
/*0x774c*/      ldr r0, [pc, #0x2c] /* data_777c */
/*0x774e*/      bl spi_flash_read_data
/*0x7752*/      ldr r0, [pc, #0x28] /* data_777c */
/*0x7754*/      ldrb r0, [r0, #1]
/*0x7756*/      strb.w r8, [r4, #0x23]
/*0x775a*/      b jump_75e6
            jump_775c:
/*0x775c*/      ldr r0, [sp]
/*0x775e*/      b jump_76ee
            jump_7760:
/*0x7760*/      ldr r0, [sp, #4]
/*0x7762*/      b jump_76ee

            data_7764:
/*0x7764*/  .word 0x20000058
            data_7768:
/*0x7768*/  .word data_8d50
            data_776c:
/*0x776c*/  .word data_8f10
            data_7770:
/*0x7770*/  .word data_8f58
            data_7774:
/*0x7774*/  .word data_8ec8
            data_7778:
/*0x7778*/  .word 0x20000915
            data_777c:
/*0x777c*/  .word 0x2000080c


            .thumb_func
            function_e_83:
/*0x7780*/      push {lr}
/*0x7782*/      bl function_e_84
/*0x7786*/      movs r0, #0
/*0x7788*/      ldr r2, [pc, #0x20] /* data_77ac */
/*0x778a*/      mov r1, r0
            jump_778c:
/*0x778c*/      strb r1, [r2, r0]
/*0x778e*/      adds r0, r0, #1
/*0x7790*/      uxtb r0, r0
/*0x7792*/      cmp r0, #9
/*0x7794*/      blo jump_778c
/*0x7796*/      ldr r2, [pc, #0x18] /* data_77b0 */
/*0x7798*/      movs r0, #0
            jump_779a:
/*0x779a*/      strb r1, [r2, r0]
/*0x779c*/      adds r0, r0, #1
/*0x779e*/      uxtb r0, r0
/*0x77a0*/      cmp r0, #9
/*0x77a2*/      blo jump_779a
/*0x77a4*/      ldr r0, [pc, #0xc] /* data_77b4 */
/*0x77a6*/      strb r1, [r0, #2]
/*0x77a8*/      pop {pc}

/*0x77aa*/  .byte 0x00
/*0x77ab*/  .byte 0x00

            data_77ac:
/*0x77ac*/  .word 0x20002cba
            data_77b0:
/*0x77b0*/  .word 0x20000915
            data_77b4:
/*0x77b4*/  .word 0x20000058


            .thumb_func
            function_e_84:
/*0x77b8*/      push {r4, r5, r6, lr}
/*0x77ba*/      ldr r3, [pc, #0x74] /* data_7830 */
/*0x77bc*/      movs r2, #0
/*0x77be*/      ldr r1, [pc, #0x74] /* data_7834 */
/*0x77c0*/      strb.w r2, [r3, #0x2b]
/*0x77c4*/      mov r0, r2
/*0x77c6*/      strb r2, [r1]
            jump_77c8:
/*0x77c8*/      adds r4, r1, r0
/*0x77ca*/      adds r0, r0, #1
/*0x77cc*/      uxtb r0, r0
/*0x77ce*/      strb r2, [r4, #2]
/*0x77d0*/      cmp r0, #6
/*0x77d2*/      blo jump_77c8
/*0x77d4*/      ldr r4, [pc, #0x58] /* data_7830 */
/*0x77d6*/      movs r1, #1
/*0x77d8*/      adds r4, #0x80
/*0x77da*/      ldr r5, [pc, #0x5c] /* data_7838 */
/*0x77dc*/      movs r0, #0
/*0x77de*/      str r1, [r4, #0x10]
            jump_77e0:
/*0x77e0*/      adds r6, r5, r0
/*0x77e2*/      adds r0, r0, #1
/*0x77e4*/      uxtb r0, r0
/*0x77e6*/      strb r2, [r6, #2]
/*0x77e8*/      cmp r0, #0x1e
/*0x77ea*/      blo jump_77e0
/*0x77ec*/      strb r2, [r3, #3]
/*0x77ee*/      movs r0, #2
/*0x77f0*/      strb r0, [r3, #9]
/*0x77f2*/      ldr r0, [pc, #0x48] /* data_783c */
/*0x77f4*/      str r1, [r4, #0x14]
/*0x77f6*/      strb r2, [r0, #2]
/*0x77f8*/      strb r2, [r0, #3]
/*0x77fa*/      strb r2, [r0, #4]
/*0x77fc*/      ldrb r2, [r0, #1]
/*0x77fe*/      bic r2, r2, #3
/*0x7802*/      strb r2, [r0, #1]
/*0x7804*/      ldr r2, [pc, #0x38] /* data_7840 */
/*0x7806*/      str r1, [r4, #0x20]
/*0x7808*/      ldrb r0, [r2, #1]
/*0x780a*/      bic r0, r0, #7
/*0x780e*/      strb r0, [r2, #1]
/*0x7810*/      ldr r0, [pc, #0x30] /* data_7844 */
/*0x7812*/      str r1, [r4, #0x1c]
/*0x7814*/      ldrb r2, [r0, #1]
/*0x7816*/      bic r2, r2, #0xff
/*0x781a*/      strb r2, [r0, #1]
/*0x781c*/      ldrb r2, [r0, #2]
/*0x781e*/      bic r2, r2, #0xff
/*0x7822*/      strb r2, [r0, #2]
/*0x7824*/      ldrb r2, [r0, #3]
/*0x7826*/      bic r2, r2, #3
/*0x782a*/      strb r2, [r0, #3]
/*0x782c*/      str r1, [r4, #0x18]
/*0x782e*/      pop {r4, r5, r6, pc}

            data_7830:
/*0x7830*/  .word 0x20000058
            data_7834:
/*0x7834*/  .word 0x2000003c
            data_7838:
/*0x7838*/  .word 0x2000032c
            data_783c:
/*0x783c*/  .word 0x20000034
            data_7840:
/*0x7840*/  .word 0x20000018
            data_7844:
/*0x7844*/  .word 0x2000002c


            .thumb_func
            function_e_85:
/*0x7848*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x784c*/      movs r6, #1
/*0x784e*/      movs r7, #0
/*0x7850*/      ldr r5, [pc, #0xb8] /* data_790c */
/*0x7852*/      cmp r0, #0xcb
/*0x7854*/      beq jump_7864
/*0x7856*/      cmp r0, #0xcc
/*0x7858*/      beq jump_786e
/*0x785a*/      cmp r0, #0xcd
/*0x785c*/      beq jump_7878
/*0x785e*/      cmp r0, #0xce
/*0x7860*/      beq jump_7882
/*0x7862*/      b jump_788e
            jump_7864:
/*0x7864*/      cbz r1, jump_786a
/*0x7866*/      strb r6, [r5, #0x1d]
/*0x7868*/      b jump_788e
            jump_786a:
/*0x786a*/      strb r7, [r5, #0x1d]
/*0x786c*/      b jump_788e
            jump_786e:
/*0x786e*/      cbz r1, jump_7874
/*0x7870*/      strb r6, [r5, #0x1e]
/*0x7872*/      b jump_788e
            jump_7874:
/*0x7874*/      strb r7, [r5, #0x1e]
/*0x7876*/      b jump_788e
            jump_7878:
/*0x7878*/      cbz r1, jump_787e
/*0x787a*/      strb r6, [r5, #0x1f]
/*0x787c*/      b jump_788e
            jump_787e:
/*0x787e*/      strb r7, [r5, #0x1f]
/*0x7880*/      b jump_788e
            jump_7882:
/*0x7882*/      cbz r1, jump_788a
/*0x7884*/      strb.w r6, [r5, #0x20]
/*0x7888*/      b jump_788e
            jump_788a:
/*0x788a*/      strb.w r7, [r5, #0x20]
            jump_788e:
/*0x788e*/      ldrb.w r0, [r5, #0x30]
/*0x7892*/      cmp r0, #0
/*0x7894*/      bne jump_78ca
/*0x7896*/      ldrb r1, [r5, #0x1d]
/*0x7898*/      ldrb r0, [r5, #0x1e]
/*0x789a*/      orrs.w r2, r1, r0
/*0x789e*/      beq jump_78a6
/*0x78a0*/      cmp r1, #1
/*0x78a2*/      beq jump_78aa
/*0x78a4*/      b jump_78b0
            jump_78a6:
/*0x78a6*/      movs r4, #0
/*0x78a8*/      b jump_78b2
            jump_78aa:
/*0x78aa*/      cbz r0, jump_78ce
/*0x78ac*/      cmp r0, #1
/*0x78ae*/      beq jump_78d2
            jump_78b0:
/*0x78b0*/      movs r4, #3
            jump_78b2:
/*0x78b2*/      ldrb.w r0, [r5, #0x26]
/*0x78b6*/      cmp r4, r0
/*0x78b8*/      beq jump_78ca
/*0x78ba*/      strb.w r4, [r5, #0x27]
/*0x78be*/      bl function_80
/*0x78c2*/      cmp r0, #1
/*0x78c4*/      beq jump_78d6
/*0x78c6*/      strb.w r6, [r5, #0x28]
            jump_78ca:
/*0x78ca*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_78ce:
/*0x78ce*/      movs r4, #1
/*0x78d0*/      b jump_78b2
            jump_78d2:
/*0x78d2*/      movs r4, #2
/*0x78d4*/      b jump_78b2
            jump_78d6:
/*0x78d6*/      add.w r5, r5, #0x18
/*0x78da*/      ldr r0, [pc, #0x34] /* data_7910 */
/*0x78dc*/      strb r4, [r5, #0xe]
/*0x78de*/      mov.w r2, #0xff0
/*0x78e2*/      ldr.w r1, [r0, r4, lsl #2]
/*0x78e6*/      ldr r0, [pc, #0x2c] /* data_7914 */
/*0x78e8*/      add.w r1, r1, #0xff0
/*0x78ec*/      bl spi_flash_read_data
/*0x78f0*/      ldr r0, [pc, #0x20] /* data_7914 */
/*0x78f2*/      ldrb r0, [r0]
/*0x78f4*/      strb r0, [r5]
/*0x78f6*/      ldrb r0, [r5, #0xe]
/*0x78f8*/      bl function_e_25
/*0x78fc*/      ldrb.w r0, [r5, #0x21]
/*0x7900*/      bl function_e_18
/*0x7904*/      bl function_e_83
/*0x7908*/      strb r7, [r5, #3]
/*0x790a*/      b jump_78ca

            data_790c:
/*0x790c*/  .word 0x20000058
            data_7910:
/*0x7910*/  .word data_8d44
            data_7914:
/*0x7914*/  .word 0x20001cba


            .thumb_func
            function_e_86:
/*0x7918*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x791c*/      ldr r4, [pc, #0xac] /* data_79cc */
/*0x791e*/      mov r0, r4
/*0x7920*/      ldrb r6, [r4, #0x1b]
/*0x7922*/      ldrb r0, [r0, #0x1c]
/*0x7924*/      cmp r6, #1
/*0x7926*/      beq jump_792c
/*0x7928*/      cmp r0, #3
/*0x792a*/      bne jump_7966
            jump_792c:
/*0x792c*/      ldrh.w r1, [r4, #0x42]
/*0x7930*/      cmp r1, #0
/*0x7932*/      bne jump_7966
/*0x7934*/      ldr r5, [pc, #0x98] /* data_79d0 */
/*0x7936*/      ldrb.w r2, [r4, #0x32]
/*0x793a*/      movs r7, #0
/*0x793c*/      add.w r1, r5, r2, lsl #2
/*0x7940*/      ldrb r3, [r1, #2]
/*0x7942*/      cbnz r3, jump_794e
/*0x7944*/      ldrb.w ip, [r1, #3]
/*0x7948*/      cmp.w ip, #0
/*0x794c*/      beq jump_7954
            jump_794e:
/*0x794e*/      orrs r6, r2
/*0x7950*/      beq jump_7978
/*0x7952*/      b jump_797c
            jump_7954:
/*0x7954*/      cmp r6, #1
/*0x7956*/      bne jump_7974
/*0x7958*/      strb.w r7, [r4, #0x32]
/*0x795c*/      cmp r0, #1
/*0x795e*/      beq jump_796a
/*0x7960*/      movs r0, #0xc8
            jump_7962:
/*0x7962*/      strh.w r0, [r4, #0x42]
            jump_7966:
/*0x7966*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_796a:
/*0x796a*/      movs r0, #2
/*0x796c*/      strb r0, [r4, #0x1c]
/*0x796e*/      mov.w r0, #0x3e8
/*0x7972*/      b jump_7962
            jump_7974:
/*0x7974*/      strb r7, [r4, #0x1c]
/*0x7976*/      b jump_7966
            jump_7978:
/*0x7978*/      cmp r0, #3
/*0x797a*/      beq jump_7974
            jump_797c:
/*0x797c*/      add.w r4, r4, #0x32
/*0x7980*/      ldrb r6, [r1, #1]
/*0x7982*/      lsls r0, r3, #8
/*0x7984*/      strh r0, [r4, #0x10]
/*0x7986*/      ldrb r0, [r1, #3]
/*0x7988*/      ldrh r1, [r4, #0x10]
/*0x798a*/      orr.w r0, r0, r1
/*0x798e*/      strh r0, [r4, #0x10]
/*0x7990*/      ldrb.w r1, [r5, r2, lsl #2]
/*0x7994*/      mov r0, r6
/*0x7996*/      bl function_e_32
/*0x799a*/      ldrb r0, [r4], #-0x32
/*0x799e*/      ldr r7, [pc, #0x2c] /* data_79cc */
/*0x79a0*/      ldrb.w r0, [r5, r0, lsl #2]
/*0x79a4*/      movs r5, #1
/*0x79a6*/      adds r7, #0x80
/*0x79a8*/      cmp r0, #1
/*0x79aa*/      mov r0, r6
/*0x79ac*/      beq jump_79be
/*0x79ae*/      bl function_e_23
            jump_79b2:
/*0x79b2*/      str r5, [r7, #0x10]
/*0x79b4*/      ldrb r0, [r4, #0x32]!
/*0x79b8*/      adds r0, r0, #1
/*0x79ba*/      strb r0, [r4]
/*0x79bc*/      b jump_7966
            jump_79be:
/*0x79be*/      bl function_e_89
/*0x79c2*/      mov r0, r6
/*0x79c4*/      bl function_13
/*0x79c8*/      b jump_79b2

/*0x79ca*/  .byte 0x00
/*0x79cb*/  .byte 0x00

            data_79cc:
/*0x79cc*/  .word 0x20000058
            data_79d0:
/*0x79d0*/  .word 0x2000080c


            .thumb_func
            function_e_87:
/*0x79d4*/      push {r4, r5, r6, lr}
/*0x79d6*/      ldr r5, [pc, #0x6c] /* data_7a44 */
/*0x79d8*/      ldr r0, [r5, #0x34]
/*0x79da*/      cmp r0, #0
/*0x79dc*/      beq jump_7a42
/*0x79de*/      ldr r0, [r5, #0x34]
/*0x79e0*/      movw r1, #0x2710
/*0x79e4*/      cmp r0, r1
/*0x79e6*/      bls jump_7a42
/*0x79e8*/      movs r4, #0
/*0x79ea*/      str r4, [r5, #0x34]
/*0x79ec*/      sub.w r6, r5, #0x80
/*0x79f0*/      mov r0, r6
/*0x79f2*/      ldrb.w r1, [r6, #0x2a]
/*0x79f6*/      ldrb.w r0, [r0, #0x26]
/*0x79fa*/      cmp r1, #2
/*0x79fc*/      beq jump_7a04
/*0x79fe*/      bl function_e_8
/*0x7a02*/      b jump_7a08
            jump_7a04:
/*0x7a04*/      bl function_e_94
            jump_7a08:
/*0x7a08*/      strb r4, [r6, #0x2a]!
/*0x7a0c*/      strb r4, [r6, #1]
/*0x7a0e*/      ldrb r0, [r6, #0xf]
/*0x7a10*/      sub.w r6, r6, #0x2a
/*0x7a14*/      bl function_e_18
/*0x7a18*/      ldr r1, [pc, #0x2c] /* data_7a48 */
/*0x7a1a*/      movs r0, #0
/*0x7a1c*/      strb r4, [r1]
            jump_7a1e:
/*0x7a1e*/      adds r2, r1, r0
/*0x7a20*/      adds r0, r0, #1
/*0x7a22*/      uxtb r0, r0
/*0x7a24*/      strb r4, [r2, #2]
/*0x7a26*/      cmp r0, #6
/*0x7a28*/      blo jump_7a1e
/*0x7a2a*/      movs r2, #1
/*0x7a2c*/      ldr r1, [pc, #0x1c] /* data_7a4c */
/*0x7a2e*/      movs r0, #0
/*0x7a30*/      str r2, [r5, #0x10]
            jump_7a32:
/*0x7a32*/      adds r3, r1, r0
/*0x7a34*/      adds r0, r0, #1
/*0x7a36*/      uxtb r0, r0
/*0x7a38*/      strb r4, [r3, #2]
/*0x7a3a*/      cmp r0, #0x1d
/*0x7a3c*/      blo jump_7a32
/*0x7a3e*/      str r2, [r5, #0x14]
/*0x7a40*/      strb r4, [r6, #0xc]
            jump_7a42:
/*0x7a42*/      pop {r4, r5, r6, pc}

            data_7a44:
/*0x7a44*/  .word 0x200000d8
            data_7a48:
/*0x7a48*/  .word 0x2000003c
            data_7a4c:
/*0x7a4c*/  .word 0x2000032c


            .thumb_func
            function_e_88:
/*0x7a50*/      push {r4, lr}
/*0x7a52*/      ldr r4, [pc, #0x24] /* data_7a78 */
/*0x7a54*/      ldrb.w r0, [r4, #0x39]
/*0x7a58*/      cmp r0, #1
/*0x7a5a*/      bne jump_7a68
/*0x7a5c*/      ldrh.w r0, [r4, #0x48]
/*0x7a60*/      bl function_1
/*0x7a64*/      strh.w r0, [r4, #0x48]
            jump_7a68:
/*0x7a68*/      bl function_e_10
/*0x7a6c*/      ldrb.w r0, [r4, #0x39]
/*0x7a70*/      pop.w {r4, lr}
/*0x7a74*/      b.w function_e_18

            data_7a78:
/*0x7a78*/  .word 0x20000058


            .thumb_func
            function_e_89:
/*0x7a7c*/      cmp r0, #0xc4
/*0x7a7e*/      beq jump_7a8c
/*0x7a80*/      cmp r0, #0xc5
/*0x7a82*/      beq jump_7a90
/*0x7a84*/      cmp r0, #0xc6
/*0x7a86*/      bne jump_7a94
/*0x7a88*/      b.w function_e_88
            jump_7a8c:
/*0x7a8c*/      b.w function_e_90
            jump_7a90:
/*0x7a90*/      b.w function_e_91
            jump_7a94:
/*0x7a94*/      bx lr

/*0x7a96*/  .byte 0x00
/*0x7a97*/  .byte 0x00


            .thumb_func
            function_e_90:
/*0x7a98*/      push {r4, lr}
/*0x7a9a*/      ldr r4, [pc, #0x24] /* data_7ac0 */
/*0x7a9c*/      ldrb.w r0, [r4, #0x39]
/*0x7aa0*/      cmp r0, #1
/*0x7aa2*/      bne jump_7ab0
/*0x7aa4*/      ldrh.w r0, [r4, #0x48]
/*0x7aa8*/      bl call_837c
/*0x7aac*/      strh.w r0, [r4, #0x48]
            jump_7ab0:
/*0x7ab0*/      bl function_e_10
/*0x7ab4*/      ldrb.w r0, [r4, #0x39]
/*0x7ab8*/      pop.w {r4, lr}
/*0x7abc*/      b.w function_e_18

            data_7ac0:
/*0x7ac0*/  .word 0x20000058


            .thumb_func
            function_e_91:
/*0x7ac4*/      push {r4, r5, r6, lr}
/*0x7ac6*/      ldr r4, [pc, #0x7c] /* data_7b44 */
/*0x7ac8*/      movs r5, #0
/*0x7aca*/      ldrb.w r0, [r4, #0x39]
/*0x7ace*/      cmp r0, #1
/*0x7ad0*/      bne jump_7aea
/*0x7ad2*/      ldrh.w r0, [r4, #0x46]
/*0x7ad6*/      cbnz r0, jump_7af2
/*0x7ad8*/      ldrh.w r0, [r4, #0x48]
/*0x7adc*/      cbnz r0, jump_7af2
/*0x7ade*/      mov.w r0, #0x12c
/*0x7ae2*/      strh.w r0, [r4, #0x48]
/*0x7ae6*/      bl function_e_9
            jump_7aea:
/*0x7aea*/      ldrb.w r0, [r4, #0x39]
/*0x7aee*/      cmp r0, #4
/*0x7af0*/      beq jump_7b3e
            jump_7af2:
/*0x7af2*/      ldrb.w r0, [r4, #0x39]
/*0x7af6*/      adds r0, r0, #1
/*0x7af8*/      and r0, r0, #3
/*0x7afc*/      strb.w r0, [r4, #0x39]
            jump_7b00:
/*0x7b00*/      ldr r6, [pc, #0x40] /* data_7b44 */
/*0x7b02*/      strb r5, [r4, #0xb]
/*0x7b04*/      adds r6, #0x80
/*0x7b06*/      str r5, [r6, #0x30]
/*0x7b08*/      ldrb.w r0, [r4, #0x39]
/*0x7b0c*/      bl function_e_18
/*0x7b10*/      ldr r1, [pc, #0x34] /* data_7b48 */
/*0x7b12*/      ldrb.w r0, [r4, #0x39]
/*0x7b16*/      strb r0, [r1]
/*0x7b18*/      ldr r0, [pc, #0x30] /* data_7b4c */
/*0x7b1a*/      ldrb r1, [r4, #0x18]
/*0x7b1c*/      ldrb.w r2, [r4, #0x26]
/*0x7b20*/      ldr.w r1, [r0, r1, lsl #2]
/*0x7b24*/      subs r0, #0x9c
/*0x7b26*/      ldr.w r0, [r0, r2, lsl #2]
/*0x7b2a*/      movs r2, #0
/*0x7b2c*/      add r0, r1
/*0x7b2e*/      mov r1, r0
/*0x7b30*/      bl function_e_97
/*0x7b34*/      str r5, [r4, #0x68]
/*0x7b36*/      str r5, [r4, #0x6c]
/*0x7b38*/      movs r0, #1
/*0x7b3a*/      str r0, [r6, #4]
/*0x7b3c*/      pop {r4, r5, r6, pc}
            jump_7b3e:
/*0x7b3e*/      strb.w r5, [r4, #0x39]
/*0x7b42*/      b jump_7b00

            data_7b44:
/*0x7b44*/  .word 0x20000058
            data_7b48:
/*0x7b48*/  .word 0x20001cba
            data_7b4c:
/*0x7b4c*/  .word data_8de0


            .thumb_func
            function_24:
/*0x7b50*/      push {r4, lr}
/*0x7b52*/      ldr r3, [pc, #0x34] /* data_7b88 */
/*0x7b54*/      add.w r0, r1, r0, lsl #3
/*0x7b58*/      ldr r4, [pc, #0x30] /* data_7b8c */
/*0x7b5a*/      ldrb.w r1, [r3, #0x26]
/*0x7b5e*/      ldrb r3, [r3, #0x18]
/*0x7b60*/      add.w r1, r1, r1, lsl #1
/*0x7b64*/      add.w r1, r4, r1, lsl #4
/*0x7b68*/      add.w r1, r1, r3, lsl #4
/*0x7b6c*/      cbz r2, jump_7b82
/*0x7b6e*/      ldr r1, [r1, #-0xc]
            jump_7b72:
/*0x7b72*/      movs r2, #1
/*0x7b74*/      add r1, r0
/*0x7b76*/      ldr r0, [pc, #0x18] /* data_7b90 */
/*0x7b78*/      bl spi_flash_read_data
/*0x7b7c*/      ldr r0, [pc, #0x10] /* data_7b90 */
/*0x7b7e*/      ldrb r0, [r0]
/*0x7b80*/      pop {r4, pc}
            jump_7b82:
/*0x7b82*/      ldr r1, [r1, #-0x10]
/*0x7b86*/      b jump_7b72

            data_7b88:
/*0x7b88*/  .word 0x20000058
            data_7b8c:
/*0x7b8c*/  .word data_8d50
            data_7b90:
/*0x7b90*/  .word 0x20001cba


            .thumb_func
            main:
/*0x7b94*/      bl setup_intr_priority
/*0x7b98*/      bl setup_afio_gpio
/*0x7b9c*/      bl function_74
/*0x7ba0*/      ldr r0, [pc, #0x118] /* data_7cbc */
/*0x7ba2*/      bl spin_wait_maybe
/*0x7ba6*/      movs r0, #1
/*0x7ba8*/      bl function_37
/*0x7bac*/      movs r0, #1
/*0x7bae*/      bl function_e_6
/*0x7bb2*/      ldr r0, [pc, #0x10c] /* data_7cc0 */
/*0x7bb4*/      bl spin_wait_maybe
/*0x7bb8*/      movs r0, #0xa
/*0x7bba*/      bl spin_wait_maybe
/*0x7bbe*/      ldr.w r8, [pc, #0x104] /* data_7cc4 */
/*0x7bc2*/      mov.w r6, #0x200
/*0x7bc6*/      str.w r6, [r8, #0x28]
/*0x7bca*/      movs r0, #0xa
/*0x7bcc*/      bl spin_wait_maybe
/*0x7bd0*/      ldr.w sl, [pc, #0xf4] /* data_7cc8 */
/*0x7bd4*/      mov.w sb, #0x100
/*0x7bd8*/      movs r2, #1
/*0x7bda*/      mov r4, sb
/*0x7bdc*/      mov r1, sb
/*0x7bde*/      mov r5, sl
/*0x7be0*/      mov r0, sl
/*0x7be2*/      bl gpio_set_input_output
/*0x7be6*/      movs r2, #0
/*0x7be8*/      mov r1, r4
/*0x7bea*/      mov r0, r5
/*0x7bec*/      bl gpio_set_reset_pin
/*0x7bf0*/      movs r0, #0xa
/*0x7bf2*/      bl spin_wait_maybe
/*0x7bf6*/      bl function_e_50
/*0x7bfa*/      ldr r4, [pc, #0xd0] /* data_7ccc */
/*0x7bfc*/      strb r0, [r4]
/*0x7bfe*/      ldrb r0, [r4]
/*0x7c00*/      and r0, r0, #0x44
/*0x7c04*/      strb r0, [r4]
/*0x7c06*/      ldrb r1, [r4]
/*0x7c08*/      ldr r0, [pc, #0xc4] /* data_7cd0 */
/*0x7c0a*/      movs r7, #0
/*0x7c0c*/      movs r5, #1
/*0x7c0e*/      cmp r1, #0x44
/*0x7c10*/      beq jump_7c5e
/*0x7c12*/      ldrb r1, [r4]
/*0x7c14*/      cmp r1, #4
/*0x7c16*/      beq jump_7c62
/*0x7c18*/      ldrb r1, [r4]
/*0x7c1a*/      cmp r1, #0x44
/*0x7c1c*/      beq jump_7c66
/*0x7c1e*/      movs r1, #3
            jump_7c20:
/*0x7c20*/      strb r1, [r0]
            jump_7c22:
/*0x7c22*/      ldr r1, [pc, #0xb0] /* data_7cd4 */
/*0x7c24*/      ldrb r0, [r0]
/*0x7c26*/      strb r0, [r1]
/*0x7c28*/      movs r2, #1
/*0x7c2a*/      mov r1, sb
/*0x7c2c*/      mov r0, sl
/*0x7c2e*/      bl gpio_set_reset_pin
/*0x7c32*/      movs r0, #0xa
/*0x7c34*/      bl spin_wait_maybe
/*0x7c38*/      movs r0, #1
/*0x7c3a*/      bl function_e_6
/*0x7c3e*/      movs r0, #0xa
/*0x7c40*/      bl spin_wait_maybe
/*0x7c44*/      str.w r6, [r8, #0x24]
/*0x7c48*/      movs r0, #0xa
/*0x7c4a*/      bl spin_wait_maybe
/*0x7c4e*/      bl function_e_33
/*0x7c52*/      bl usb_init
/*0x7c56*/      ldr r6, [pc, #0x80] /* data_7cd8 */
            jump_7c58:
/*0x7c58*/      ldr r0, [r4, #8]
/*0x7c5a*/      cbz r0, jump_7c6a
/*0x7c5c*/      b jump_7c7a
            jump_7c5e:
/*0x7c5e*/      strb r7, [r0]
/*0x7c60*/      b jump_7c22
            jump_7c62:
/*0x7c62*/      strb r5, [r0]
/*0x7c64*/      b jump_7c22
            jump_7c66:
/*0x7c66*/      movs r1, #2
/*0x7c68*/      b jump_7c20
            jump_7c6a:
/*0x7c6a*/      ldrb.w r0, [r6, #0x32]
/*0x7c6e*/      cmp r0, #6
/*0x7c70*/      bne jump_7cb0
/*0x7c72*/      movs r0, #0
/*0x7c74*/      str r5, [r4, #8]
/*0x7c76*/      bl function_37
            jump_7c7a:
/*0x7c7a*/      ldr r0, [r4, #8]
/*0x7c7c*/      cmp r0, #1
/*0x7c7e*/      bne jump_7cb0
/*0x7c80*/      ldr r0, [r4, #0x10]
/*0x7c82*/      cbz r0, jump_7c8e
/*0x7c84*/      str r7, [r4, #0x10]
/*0x7c86*/      movs r0, #1
/*0x7c88*/      str r7, [r4, #0xc]
/*0x7c8a*/      bl function_37
            jump_7c8e:
/*0x7c8e*/      ldr r0, [r4, #0xc]
/*0x7c90*/      cbnz r0, jump_7ca6
/*0x7c92*/      ldr r0, [r4, #0x10]
/*0x7c94*/      cbnz r0, jump_7cb0
/*0x7c96*/      ldrb.w r0, [r6, #0x32]
/*0x7c9a*/      cmp r0, #6
/*0x7c9c*/      bne jump_7cb0
/*0x7c9e*/      movs r0, #0
/*0x7ca0*/      str r5, [r4, #0xc]
/*0x7ca2*/      bl function_37
            jump_7ca6:
/*0x7ca6*/      ldr r0, [r4, #0xc]
/*0x7ca8*/      cmp r0, #1
/*0x7caa*/      bne jump_7cb0
/*0x7cac*/      bl function_e_21
            jump_7cb0:
/*0x7cb0*/      ldr r0, [pc, #0x24] /* data_7cd8 */
/*0x7cb2*/      bl function_75
/*0x7cb6*/      bl watchdog_reload_timer
/*0x7cba*/      b jump_7c58

            data_7cbc:
/*0x7cbc*/  .word 0x00061a80
            data_7cc0:
/*0x7cc0*/  .word 0x000186a0
            data_7cc4:
/*0x7cc4*/  .word 0x400b0000
            data_7cc8:
/*0x7cc8*/  .word 0x400b4000
            data_7ccc:
/*0x7ccc*/  .word 0x20000000
            data_7cd0:
/*0x7cd0*/  .word 0x2000007e
            data_7cd4:
/*0x7cd4*/  .word 0x2000007f
            data_7cd8:
/*0x7cd8*/  .word 0x20000234


            .thumb_func
            function_e_92:
/*0x7cdc*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x7ce0*/      sub.w r2, r0, #0xa0
/*0x7ce4*/      cmp r2, #7
/*0x7ce6*/      bhi jump_7dba
/*0x7ce8*/      ldr r3, [pc, #0xd4] /* data_7dc0 */
/*0x7cea*/      ldrb r2, [r3, #0x10]
/*0x7cec*/      cmp r2, #1
/*0x7cee*/      bne jump_7d00
/*0x7cf0*/      cmp r0, #0xa4
/*0x7cf2*/      beq jump_7cfa
/*0x7cf4*/      cmp r0, #0xa5
/*0x7cf6*/      beq jump_7cfe
/*0x7cf8*/      b jump_7d00
            jump_7cfa:
/*0x7cfa*/      movs r0, #0xa5
/*0x7cfc*/      b jump_7d00
            jump_7cfe:
/*0x7cfe*/      movs r0, #0xa4
            jump_7d00:
/*0x7d00*/      ldr r2, [pc, #0xc0] /* data_7dc4 */
/*0x7d02*/      subs r0, #0xa0
/*0x7d04*/      movs r6, #0
/*0x7d06*/      ldrsb.w r8, [r2, #3]
/*0x7d0a*/      ldrsb.w ip, [r2, #2]
/*0x7d0e*/      ldrsb.w r7, [r2, #4]
/*0x7d12*/      ldrb r4, [r2, #1]
/*0x7d14*/      movs r5, #1
/*0x7d16*/      mov.w sb, #-1
/*0x7d1a*/      cmp r0, #8
/*0x7d1c*/      bhs jump_7dae
/*0x7d1e*/      tbb [pc, r0]

/*0x7d22*/  .byte 0x04
/*0x7d23*/  .byte 0x0c
/*0x7d24*/  .byte 0x16
/*0x7d25*/  .byte 0x1e
/*0x7d26*/  .byte 0x38
/*0x7d27*/  .byte 0x3f
/*0x7d28*/  .byte 0x28
/*0x7d29*/  .byte 0x2e

            switch_7d2a:
/*0x7d2a*/      cbz r1, jump_7d32
/*0x7d2c*/      strb.w sb, [r2, #3]
/*0x7d30*/      b jump_7d3e
            jump_7d32:
/*0x7d32*/      lsls.w r0, r8, #0x18
/*0x7d36*/      bmi jump_7d48
/*0x7d38*/      b jump_7dae
            switch_7d3a:
/*0x7d3a*/      cbz r1, jump_7d42
/*0x7d3c*/      strb r5, [r2, #3]
            jump_7d3e:
/*0x7d3e*/      str r5, [r3, #0x74]
/*0x7d40*/      b jump_7dae
            jump_7d42:
/*0x7d42*/      lsls.w r0, r8, #0x18
/*0x7d46*/      bmi jump_7dae
            jump_7d48:
/*0x7d48*/      strb r6, [r2, #3]
/*0x7d4a*/      str r6, [r3, #0x74]
/*0x7d4c*/      b jump_7dae
            switch_7d4e:
/*0x7d4e*/      cbz r1, jump_7d56
/*0x7d50*/      strb.w sb, [r2, #2]
/*0x7d54*/      b jump_7d62
            jump_7d56:
/*0x7d56*/      lsls.w r0, ip, #0x18
/*0x7d5a*/      bmi jump_7d6c
/*0x7d5c*/      b jump_7dae
            switch_7d5e:
/*0x7d5e*/      cbz r1, jump_7d66
/*0x7d60*/      strb r5, [r2, #2]
            jump_7d62:
/*0x7d62*/      str r5, [r3, #0x70]
/*0x7d64*/      b jump_7dae
            jump_7d66:
/*0x7d66*/      lsls.w r0, ip, #0x18
/*0x7d6a*/      bmi jump_7dae
            jump_7d6c:
/*0x7d6c*/      strb r6, [r2, #2]
/*0x7d6e*/      str r6, [r3, #0x70]
/*0x7d70*/      b jump_7dae
            switch_7d72:
/*0x7d72*/      cbz r1, jump_7d78
/*0x7d74*/      strb r5, [r2, #4]
/*0x7d76*/      b jump_7d84
            jump_7d78:
/*0x7d78*/      lsls r0, r7, #0x18
/*0x7d7a*/      bpl jump_7d8c
/*0x7d7c*/      b jump_7dae
            switch_7d7e:
/*0x7d7e*/      cbz r1, jump_7d88
/*0x7d80*/      strb.w sb, [r2, #4]
            jump_7d84:
/*0x7d84*/      str r5, [r3, #0x78]
/*0x7d86*/      b jump_7dae
            jump_7d88:
/*0x7d88*/      lsls r0, r7, #0x18
/*0x7d8a*/      bpl jump_7dae
            jump_7d8c:
/*0x7d8c*/      strb r6, [r2, #4]
/*0x7d8e*/      str r6, [r3, #0x78]
/*0x7d90*/      b jump_7dae
            switch_7d92:
/*0x7d92*/      cbz r1, jump_7d9a
/*0x7d94*/      orr r0, r4, #1
/*0x7d98*/      b jump_7dac
            jump_7d9a:
/*0x7d9a*/      bic r0, r4, #1
/*0x7d9e*/      b jump_7dac
            switch_7da0:
/*0x7da0*/      cbz r1, jump_7da8
/*0x7da2*/      orr r0, r4, #2
/*0x7da6*/      b jump_7dac
            jump_7da8:
/*0x7da8*/      bic r0, r4, #2
            jump_7dac:
/*0x7dac*/      strb r0, [r2, #1]
            jump_7dae:
/*0x7dae*/      ldr r0, [pc, #0x10] /* data_7dc0 */
/*0x7db0*/      adds r0, #0x80
/*0x7db2*/      str r5, [r0, #0x20]
/*0x7db4*/      movs r0, #1
            jump_7db6:
/*0x7db6*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_7dba:
/*0x7dba*/      movs r0, #0
/*0x7dbc*/      b jump_7db6

/*0x7dbe*/  .byte 0x00
/*0x7dbf*/  .byte 0x00

            data_7dc0:
/*0x7dc0*/  .word 0x20000058
            data_7dc4:
/*0x7dc4*/  .word 0x20000034


            .thumb_func
            function_e_93:
/*0x7dc8*/      push {r4, r5, r6, r7, lr}
/*0x7dca*/      movs r1, #0
/*0x7dcc*/      ldr r7, [pc, #0x30] /* data_7e00 */
/*0x7dce*/      ldr.w ip, [pc, #0x34] /* data_7e04 */
/*0x7dd2*/      movs r3, #1
/*0x7dd4*/      mov.w r5, #0x1c2
            jump_7dd8:
/*0x7dd8*/      ldrb r2, [r7, r1]
/*0x7dda*/      movs r0, #0
/*0x7ddc*/      add.w r4, ip, r1, lsl #4
            jump_7de0:
/*0x7de0*/      lsl.w r6, r3, r0
/*0x7de4*/      tst r2, r6
/*0x7de6*/      beq jump_7dec
/*0x7de8*/      strh.w r5, [r4, r0, lsl #1]
            jump_7dec:
/*0x7dec*/      adds r0, r0, #1
/*0x7dee*/      uxtb r0, r0
/*0x7df0*/      cmp r0, #8
/*0x7df2*/      blo jump_7de0
/*0x7df4*/      adds r1, r1, #1
/*0x7df6*/      uxtb r1, r1
/*0x7df8*/      cmp r1, #9
/*0x7dfa*/      blo jump_7dd8
/*0x7dfc*/      pop {r4, r5, r6, r7, pc}

/*0x7dfe*/  .byte 0x00
/*0x7dff*/  .byte 0x00

            data_7e00:
/*0x7e00*/  .word 0x2000017c
            data_7e04:
/*0x7e04*/  .word 0x20002e2c


            .thumb_func
            function_e_94:
/*0x7e08*/      push {r4, r5, r6, lr}
/*0x7e0a*/      ldr r4, [pc, #0x64] /* data_7e70 */
/*0x7e0c*/      movs r5, #0
/*0x7e0e*/      mov r6, r0
/*0x7e10*/      strb r5, [r4]
/*0x7e12*/      ldrb r0, [r4, #0xe]
/*0x7e14*/      bl function_e_8
/*0x7e18*/      movs r0, #1
/*0x7e1a*/      strb r0, [r4]
/*0x7e1c*/      ldrb r0, [r4, #0xe]
/*0x7e1e*/      bl function_e_8
/*0x7e22*/      movs r0, #2
/*0x7e24*/      strb r0, [r4]
/*0x7e26*/      ldrb r0, [r4, #0xe]
/*0x7e28*/      bl function_e_8
/*0x7e2c*/      movs r0, #3
/*0x7e2e*/      strb r0, [r4]
/*0x7e30*/      ldrb r0, [r4, #0xe]
/*0x7e32*/      bl function_e_8
/*0x7e36*/      ldr r1, [pc, #0x3c] /* data_7e74 */
/*0x7e38*/      strb r5, [r4]
/*0x7e3a*/      strb r5, [r4, #0x13]
/*0x7e3c*/      strb r5, [r1]
/*0x7e3e*/      movs r0, #0x56
/*0x7e40*/      strb r0, [r1, #0xb]
/*0x7e42*/      movs r0, #0x31
/*0x7e44*/      strb r0, [r1, #0xc]
/*0x7e46*/      movs r0, #0x34
/*0x7e48*/      strb r0, [r1, #0xd]
/*0x7e4a*/      ldr r0, [pc, #0x2c] /* data_7e78 */
/*0x7e4c*/      mov.w r2, #0xff0
/*0x7e50*/      ldr.w r0, [r0, r6, lsl #2]
/*0x7e54*/      addw r1, r0, #0xffe
/*0x7e58*/      add.w r0, r0, #0xff0
/*0x7e5c*/      bl function_e_97
/*0x7e60*/      strb r5, [r4, #0x14]
/*0x7e62*/      strb r5, [r4, #0x15]
/*0x7e64*/      ldrb.w r0, [r4, #0x21]
/*0x7e68*/      pop.w {r4, r5, r6, lr}
/*0x7e6c*/      b.w function_e_18

            data_7e70:
/*0x7e70*/  .word 0x20000070
            data_7e74:
/*0x7e74*/  .word 0x20002caa
            data_7e78:
/*0x7e78*/  .word data_8d44


            .thumb_func
            function_e_95:
/*0x7e7c*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x7e80*/      movs r4, #0
/*0x7e82*/      ldr r5, [pc, #0x88] /* data_7f0c */
/*0x7e84*/      ldr.w sb, [pc, #0x88] /* data_7f10 */
/*0x7e88*/      ldr r7, [pc, #0x88] /* data_7f14 */
/*0x7e8a*/      mov r6, r4
/*0x7e8c*/      mov.w r8, #1
/*0x7e90*/      mov.w sl, #2
/*0x7e94*/      mov.w fp, #3
            jump_7e98:
/*0x7e98*/      strb r6, [r5, #0x18]
/*0x7e9a*/      mov r0, r4
/*0x7e9c*/      bl function_e_8
/*0x7ea0*/      strb.w r8, [r5, #0x18]
/*0x7ea4*/      mov r0, r4
/*0x7ea6*/      bl function_e_8
/*0x7eaa*/      strb.w sl, [r5, #0x18]
/*0x7eae*/      mov r0, r4
/*0x7eb0*/      bl function_e_8
/*0x7eb4*/      strb.w fp, [r5, #0x18]
/*0x7eb8*/      mov r0, r4
/*0x7eba*/      bl function_e_8
/*0x7ebe*/      strb.w r6, [r5, #0x2b]
/*0x7ec2*/      add.w r0, sb, #0xff0
/*0x7ec6*/      strb r6, [r5, #0x18]
/*0x7ec8*/      strb r6, [r0]
/*0x7eca*/      mov.w r1, #0x56
/*0x7ece*/      strb r1, [r0, #0xb]
/*0x7ed0*/      mov.w r1, #0x31
/*0x7ed4*/      strb r1, [r0, #0xc]
/*0x7ed6*/      mov.w r1, #0x34
/*0x7eda*/      strb.w r1, [sb, #0xffd]
/*0x7ede*/      ldr.w r0, [r7, r4, lsl #2]
/*0x7ee2*/      mov.w r2, #0xff0
/*0x7ee6*/      addw r1, r0, #0xffe
/*0x7eea*/      add.w r0, r0, #0xff0
/*0x7eee*/      bl function_e_97
/*0x7ef2*/      adds r4, r4, #1
/*0x7ef4*/      uxtb r4, r4
/*0x7ef6*/      cmp r4, #3
/*0x7ef8*/      blo jump_7e98
/*0x7efa*/      strb r6, [r5, #0x2c]!
/*0x7efe*/      strb r6, [r5, #1]
/*0x7f00*/      ldrb r0, [r5, #0xd]
/*0x7f02*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x7f06*/      b.w function_e_18

/*0x7f0a*/  .byte 0x00
/*0x7f0b*/  .byte 0x00

            data_7f0c:
/*0x7f0c*/  .word 0x20000058
            data_7f10:
/*0x7f10*/  .word 0x20001cba
            data_7f14:
/*0x7f14*/  .word data_8d44


            .thumb_func
            function_e_8:
/*0x7f18*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x7f1c*/      ldr r4, [pc, #0x174] /* data_8094 */
/*0x7f1e*/      mov sb, r0
/*0x7f20*/      movs r0, #2
/*0x7f22*/      strb r0, [r4, #6]
/*0x7f24*/      movs r6, #0x44
/*0x7f26*/      strb.w r6, [r4, #0x3d]
/*0x7f2a*/      movs r7, #0x45
/*0x7f2c*/      strb.w r7, [r4, #0x3e]
/*0x7f30*/      movs r3, #0
/*0x7f32*/      strb.w r3, [r4, #0x39]
/*0x7f36*/      ldr r0, [pc, #0x160] /* data_8098 */
/*0x7f38*/      ldrb r1, [r4, #0x18]
/*0x7f3a*/      ldr r5, [pc, #0x160] /* data_809c */
/*0x7f3c*/      mov.w r8, #0xe8
/*0x7f40*/      ldr.w r2, [r0, r1, lsl #2]
/*0x7f44*/      adds r0, r5, #3
/*0x7f46*/      adds r1, r0, #1
/*0x7f48*/      strb r3, [r5, r2]
/*0x7f4a*/      strb.w r8, [r2, r0]
/*0x7f4e*/      mov.w sl, #3
/*0x7f52*/      adds r0, r0, #2
/*0x7f54*/      strb.w sl, [r2, r1]
/*0x7f58*/      strb r3, [r2, r0]
/*0x7f5a*/      adds r0, r0, #1
/*0x7f5c*/      mov fp, r4
/*0x7f5e*/      strb r3, [r2, r0]
/*0x7f60*/      adds r0, r0, #3
/*0x7f62*/      strb r3, [r2, r0]
/*0x7f64*/      adds r0, r0, #1
/*0x7f66*/      strb r6, [r2, r0]
/*0x7f68*/      adds r0, r0, #1
/*0x7f6a*/      mov.w r6, #0x120
/*0x7f6e*/      strb r7, [r2, r0]
/*0x7f70*/      movs r0, #0
/*0x7f72*/      adds r1, r2, r5
            jump_7f74:
/*0x7f74*/      add.w r4, r0, #0xc
/*0x7f78*/      strb r3, [r1, r4]
/*0x7f7a*/      addw r4, r0, #0x12d
/*0x7f7e*/      adds r0, r0, #1
/*0x7f80*/      uxth r0, r0
/*0x7f82*/      strb r3, [r1, r4]
/*0x7f84*/      cmp r0, r6
/*0x7f86*/      blo jump_7f74
/*0x7f88*/      ldr r7, [pc, #0x114] /* data_80a0 */
/*0x7f8a*/      movs r1, #0
/*0x7f8c*/      add.w ip, r7, #0x120
            jump_7f90:
/*0x7f90*/      movs r0, #0
/*0x7f92*/      add.w r4, ip, r1, lsl #5
/*0x7f96*/      add.w r5, r7, r1, lsl #5
            jump_7f9a:
/*0x7f9a*/      add.w r6, r5, r0, lsl #2
/*0x7f9e*/      strh.w r3, [r5, r0, lsl #2]
/*0x7fa2*/      strh r3, [r6, #2]
/*0x7fa4*/      strh.w r3, [r4, r0, lsl #2]
/*0x7fa8*/      add.w r6, r4, r0, lsl #2
/*0x7fac*/      adds r0, r0, #1
/*0x7fae*/      uxth r0, r0
/*0x7fb0*/      strh r3, [r6, #2]
/*0x7fb2*/      cmp r0, #8
/*0x7fb4*/      blo jump_7f9a
/*0x7fb6*/      adds r1, r1, #1
/*0x7fb8*/      uxth r1, r1
/*0x7fba*/      cmp r1, #9
/*0x7fbc*/      blo jump_7f90
/*0x7fbe*/      ldr r0, [pc, #0xdc] /* data_809c */
/*0x7fc0*/      ldr r1, [pc, #0xd8] /* data_809c */
/*0x7fc2*/      adds r0, #0x34
/*0x7fc4*/      adds r1, #0x35
/*0x7fc6*/      strb.w r8, [r2, r0]
/*0x7fca*/      ldr r4, [pc, #0xd0] /* data_809c */
/*0x7fcc*/      strb.w sl, [r2, r1]
/*0x7fd0*/      movs r6, #0x32
/*0x7fd2*/      adds r4, #0x50
/*0x7fd4*/      strh r6, [r7, #0x28]
/*0x7fd6*/      movs r1, #0x64
/*0x7fd8*/      strb r1, [r2, r4]
/*0x7fda*/      adds r4, r4, #1
/*0x7fdc*/      ldr r5, [pc, #0xbc] /* data_809c */
/*0x7fde*/      strb r3, [r2, r4]
/*0x7fe0*/      movs r4, #0xc8
/*0x7fe2*/      adds r5, #0x54
/*0x7fe4*/      strh.w r4, [r7, #0x44]
/*0x7fe8*/      strb.w r8, [r2, r5]
/*0x7fec*/      adds r5, r5, #1
/*0x7fee*/      mov.w lr, #0x3e8
/*0x7ff2*/      strb.w sl, [r2, r5]
/*0x7ff6*/      adds r5, r5, #3
/*0x7ff8*/      strh.w lr, [r7, #0x48]
/*0x7ffc*/      strb r4, [r2, r5]
/*0x7ffe*/      adds r5, r5, #1
/*0x8000*/      mov r0, sl
/*0x8002*/      strb r3, [r2, r5]
/*0x8004*/      mov.w sl, #0x12c
/*0x8008*/      add.w r5, r5, #0x180
/*0x800c*/      strh.w sl, [r7, #0x4c]
/*0x8010*/      strb.w r8, [r2, r5]
/*0x8014*/      adds r5, r5, #1
/*0x8016*/      strb r0, [r2, r5]
/*0x8018*/      adds r5, #0x1f
/*0x801a*/      strh.w r6, [ip, #0xac]
/*0x801e*/      strb r1, [r2, r5]
/*0x8020*/      adds r5, r5, #1
/*0x8022*/      strb r3, [r2, r5]
/*0x8024*/      strh.w r1, [ip, #0xcc]
/*0x8028*/      sub.w r1, r5, #0x71
/*0x802c*/      strb.w r8, [r2, r1]
/*0x8030*/      adds r1, r1, #1
/*0x8032*/      strb r0, [r2, r1]
/*0x8034*/      adds r0, r5, #3
/*0x8036*/      strh.w sl, [ip, #0x5c]
/*0x803a*/      strb r4, [r2, r0]
/*0x803c*/      adds r0, r0, #1
/*0x803e*/      strb r3, [r2, r0]
/*0x8040*/      ldr r0, [pc, #0x54] /* data_8098 */
/*0x8042*/      strh.w lr, [ip, #0xd0]
/*0x8046*/      subs r0, #0x9c
/*0x8048*/      strb.w r3, [fp, #0x39]
/*0x804c*/      ldr.w r0, [r0, sb, lsl #2]
/*0x8050*/      add r0, r2
/*0x8052*/      add.w r1, r0, #0x3f0
/*0x8056*/      bl function_e_97
/*0x805a*/      ldrb.w r0, [fp, #0x18]
/*0x805e*/      cmp r0, #0
/*0x8060*/      beq jump_8090
/*0x8062*/      ldr r1, [pc, #0x34] /* data_8098 */
/*0x8064*/      movs r4, #0
/*0x8066*/      add.w r0, sb, sb, lsl #1
/*0x806a*/      subs r1, #0x90
/*0x806c*/      mov r6, fp
/*0x806e*/      add.w r5, r1, r0, lsl #4
            jump_8072:
/*0x8072*/      ldrb r0, [r6, #0x18]
/*0x8074*/      add.w r0, r5, r0, lsl #4
/*0x8078*/      ldr r0, [r0, #-0x10]
/*0x807c*/      add.w r0, r0, r4, lsl #12
/*0x8080*/      bl function_e_40
/*0x8084*/      bl watchdog_reload_timer
/*0x8088*/      adds r4, r4, #1
/*0x808a*/      lsls r4, r4, #0x10
/*0x808c*/      lsrs r4, r4, #0x10
/*0x808e*/      beq jump_8072
            jump_8090:
/*0x8090*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_8094:
/*0x8094*/  .word 0x20000058
            data_8098:
/*0x8098*/  .word data_8de0
            data_809c:
/*0x809c*/  .word 0x20001cba
            data_80a0:
/*0x80a0*/  .word 0x2000091e


            .thumb_func
            function_e_7:
/*0x80a4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x80a8*/      ldr r5, [pc, #0xac] /* data_8158 */
/*0x80aa*/      movs r4, #0
/*0x80ac*/      movs r7, #1
/*0x80ae*/      ldrb r2, [r5, #0xc]
/*0x80b0*/      add.w r6, r5, #0x80
/*0x80b4*/      mov.w r0, #0x3e8
/*0x80b8*/      cmp r2, #8
/*0x80ba*/      bhs switch_80e8
/*0x80bc*/      tbb [pc, r2]

/*0x80c0*/  .byte 0x14
/*0x80c1*/  .byte 0x04
/*0x80c2*/  .byte 0x0a
/*0x80c3*/  .byte 0x04
/*0x80c4*/  .byte 0x0a
/*0x80c5*/  .byte 0x04
/*0x80c6*/  .byte 0x16
/*0x80c7*/  .byte 0x27

            switch_80c8:
/*0x80c8*/      ldr r1, [r6, #0x34]
/*0x80ca*/      cmp r1, r0
/*0x80cc*/      bls switch_80e8
/*0x80ce*/      movs r1, #0
/*0x80d0*/      mov r0, r1
/*0x80d2*/      b jump_80dc
            switch_80d4:
/*0x80d4*/      ldr r2, [r6, #0x34]
/*0x80d6*/      cmp r2, r0
/*0x80d8*/      bls switch_80e8
/*0x80da*/      mov r1, r0
            jump_80dc:
/*0x80dc*/      bl function_e_42
/*0x80e0*/      ldrb r0, [r5, #0xc]
/*0x80e2*/      adds r0, r0, #1
/*0x80e4*/      strb r0, [r5, #0xc]
/*0x80e6*/      str r7, [r6, #0x34]
            switch_80e8:
/*0x80e8*/      pop.w {r4, r5, r6, r7, r8, pc}
            switch_80ec:
/*0x80ec*/      add.w r5, r5, #0xc
/*0x80f0*/      ldrb r0, [r5, #0x1a]
/*0x80f2*/      bl function_e_8
/*0x80f6*/      ldrb r0, [r5, #0x1a]
/*0x80f8*/      bl function_e_25
/*0x80fc*/      ldrb.w r0, [r5, #0x2d]
/*0x8100*/      bl function_e_18
/*0x8104*/      str r4, [r6, #0x34]
/*0x8106*/      ldrb r0, [r5]
/*0x8108*/      adds r0, r0, #1
/*0x810a*/      strb r0, [r5]
/*0x810c*/      b switch_80e8
            switch_810e:
/*0x810e*/      ldr r1, [pc, #0x4c] /* data_815c */
/*0x8110*/      movs r0, #0
            jump_8112:
/*0x8112*/      adds r2, r1, r0
/*0x8114*/      ldrb r2, [r2, #2]
/*0x8116*/      cmp r2, #0xff
/*0x8118*/      bne jump_8122
/*0x811a*/      adds r0, r0, #1
/*0x811c*/      uxtb r0, r0
/*0x811e*/      cmp r0, #9
/*0x8120*/      blo jump_8112
            jump_8122:
/*0x8122*/      cmp r0, #9
/*0x8124*/      bne switch_80e8
/*0x8126*/      movs r0, #0
/*0x8128*/      movs r2, #0xff
            jump_812a:
/*0x812a*/      adds r3, r1, r0
/*0x812c*/      adds r0, r0, #1
/*0x812e*/      uxtb r0, r0
/*0x8130*/      strb r2, [r3, #0x14]
/*0x8132*/      cmp r0, #9
/*0x8134*/      blo jump_812a
/*0x8136*/      bl call_8894
/*0x813a*/      cmp r0, #1
/*0x813c*/      bne switch_80e8
/*0x813e*/      ldr r0, [pc, #0x18] /* data_8158 */
/*0x8140*/      strb r4, [r5, #0xc]
/*0x8142*/      strb r4, [r5, #2]
/*0x8144*/      adds r0, #0xf8
/*0x8146*/      strb r4, [r5, #4]
/*0x8148*/      str r4, [r0]
/*0x814a*/      str r4, [r0, #4]
/*0x814c*/      adds r0, #8
/*0x814e*/      str r4, [r0]
/*0x8150*/      str r4, [r0, #4]
/*0x8152*/      str r4, [r5, #0x68]
/*0x8154*/      str r4, [r5, #0x6c]
/*0x8156*/      b switch_80e8

            data_8158:
/*0x8158*/  .word 0x20000058
            data_815c:
/*0x815c*/  .word 0x20002de4


            .thumb_func
            function_e_5:
/*0x8160*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp}
/*0x8164*/      ldr.w r8, [pc, #0x108] /* data_8270 */
/*0x8168*/      ldr r0, [pc, #0x100] /* data_826c */
/*0x816a*/      ldr.w sl, [pc, #0xfc] /* data_8268 */
/*0x816e*/      ldrb.w r1, [r8, #0x18]
/*0x8172*/      ldr.w sb, [pc, #0x100] /* data_8274 */
/*0x8176*/      movs r4, #0
/*0x8178*/      ldr.w r2, [r0, r1, lsl #2]
/*0x817c*/      add.w fp, sl, #0x120
/*0x8180*/      add.w r3, r2, sb
            jump_8184:
/*0x8184*/      movs r1, #0
/*0x8186*/      add.w r5, fp, r4, lsl #5
/*0x818a*/      add.w ip, sl, r4, lsl #5
            jump_818e:
/*0x818e*/      add.w r0, r1, r4, lsl #3
/*0x8192*/      lsls r0, r0, #2
/*0x8194*/      add.w r6, r0, #0xc
/*0x8198*/      ldrh.w r7, [ip, r1, lsl #2]
/*0x819c*/      strb r7, [r3, r6]
/*0x819e*/      lsrs r6, r7, #8
/*0x81a0*/      add.w r7, r0, #0xd
/*0x81a4*/      strb r6, [r3, r7]
/*0x81a6*/      add.w r6, ip, r1, lsl #2
/*0x81aa*/      adds r7, r7, #1
/*0x81ac*/      ldrh r6, [r6, #2]
/*0x81ae*/      strb r6, [r3, r7]
/*0x81b0*/      adds r7, r7, #1
/*0x81b2*/      lsrs r6, r6, #8
/*0x81b4*/      strb r6, [r3, r7]
/*0x81b6*/      addw r7, r0, #0x12d
/*0x81ba*/      ldrh.w r6, [r5, r1, lsl #2]
/*0x81be*/      strb r6, [r3, r7]
/*0x81c0*/      adds r7, r7, #1
/*0x81c2*/      lsrs r6, r6, #8
/*0x81c4*/      strb r6, [r3, r7]
/*0x81c6*/      add.w r6, r5, r1, lsl #2
/*0x81ca*/      adds r7, r7, #1
/*0x81cc*/      ldrh r6, [r6, #2]
/*0x81ce*/      strb r6, [r3, r7]
/*0x81d0*/      lsrs r6, r6, #8
/*0x81d2*/      adds r0, r7, #1
/*0x81d4*/      adds r1, r1, #1
/*0x81d6*/      uxtb r1, r1
/*0x81d8*/      strb r6, [r3, r0]
/*0x81da*/      cmp r1, #8
/*0x81dc*/      blo jump_818e
/*0x81de*/      adds r4, r4, #1
/*0x81e0*/      uxtb r4, r4
/*0x81e2*/      cmp r4, #9
/*0x81e4*/      blo jump_8184
/*0x81e6*/      ldrb.w r1, [r8, #0x39]
/*0x81ea*/      strb.w r1, [sb, r2]
/*0x81ee*/      ldr r1, [pc, #0x84] /* data_8274 */
/*0x81f0*/      ldrh.w r0, [r8, #0x48]
/*0x81f4*/      adds r1, r1, #3
/*0x81f6*/      strb r0, [r2, r1]
/*0x81f8*/      lsrs r1, r0, #8
/*0x81fa*/      ldr r0, [pc, #0x78] /* data_8274 */
/*0x81fc*/      adds r0, r0, #4
/*0x81fe*/      strb r1, [r2, r0]
/*0x8200*/      ldr r1, [pc, #0x70] /* data_8274 */
/*0x8202*/      ldrh.w r0, [r8, #0x46]
/*0x8206*/      adds r1, r1, #1
/*0x8208*/      strb r0, [r2, r1]
/*0x820a*/      lsrs r1, r0, #8
/*0x820c*/      ldr r0, [pc, #0x64] /* data_8274 */
/*0x820e*/      adds r0, r0, #2
/*0x8210*/      strb r1, [r2, r0]
/*0x8212*/      ldr r1, [pc, #0x60] /* data_8274 */
/*0x8214*/      ldrh.w r0, [r8, #0x4c]
/*0x8218*/      adds r1, r1, #7
/*0x821a*/      strb r0, [r2, r1]
/*0x821c*/      lsrs r1, r0, #8
/*0x821e*/      ldr r0, [pc, #0x54] /* data_8274 */
/*0x8220*/      adds r0, #8
/*0x8222*/      strb r1, [r2, r0]
/*0x8224*/      ldr r1, [pc, #0x4c] /* data_8274 */
/*0x8226*/      ldrh.w r0, [r8, #0x4a]
/*0x822a*/      adds r1, r1, #5
/*0x822c*/      strb r0, [r2, r1]
/*0x822e*/      lsrs r1, r0, #8
/*0x8230*/      ldr r0, [pc, #0x40] /* data_8274 */
/*0x8232*/      adds r0, r0, #6
/*0x8234*/      strb r1, [r2, r0]
/*0x8236*/      adds r0, r0, #3
/*0x8238*/      ldrb.w r1, [r8, #6]
/*0x823c*/      strb r1, [r2, r0]
/*0x823e*/      adds r0, r0, #1
/*0x8240*/      ldrb.w r1, [r8, #0x3d]
/*0x8244*/      strb r1, [r2, r0]
/*0x8246*/      adds r0, r0, #1
/*0x8248*/      ldrb.w r1, [r8, #0x3e]
/*0x824c*/      strb r1, [r2, r0]
/*0x824e*/      ldr r0, [pc, #0x1c] /* data_826c */
/*0x8250*/      ldrb.w r1, [r8, #0x26]
/*0x8254*/      subs r0, #0x9c
/*0x8256*/      ldr.w r0, [r0, r1, lsl #2]
/*0x825a*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp}
/*0x825e*/      add r0, r2
/*0x8260*/      add.w r1, r0, #0x3f0
/*0x8264*/      b.w function_e_97

            data_8268:
/*0x8268*/  .word 0x2000091e
            data_826c:
/*0x826c*/  .word data_8de0
            data_8270:
/*0x8270*/  .word 0x20000058
            data_8274:
/*0x8274*/  .word 0x20001cba


            .thumb_func
            function_e_9:
/*0x8278*/      ldr r1, [pc, #0x3c] /* data_82b8 */
/*0x827a*/      ldrb.w r0, [r1, #0x39]
/*0x827e*/      cmp r0, #1
/*0x8280*/      bne jump_82b6
/*0x8282*/      add.w r1, r1, #0x18
/*0x8286*/      ldr r2, [pc, #0x34] /* data_82bc */
/*0x8288*/      ldrh r0, [r1, #0x2e]
/*0x828a*/      strb r0, [r2]
/*0x828c*/      lsr.w r0, r0, #8
/*0x8290*/      strb r0, [r2, #1]
/*0x8292*/      ldr r0, [pc, #0x2c] /* data_82c0 */
/*0x8294*/      ldrb r2, [r1]
/*0x8296*/      ldrb r1, [r1, #0xe]
/*0x8298*/      ldr.w r2, [r0, r2, lsl #2]
/*0x829c*/      sub.w r0, r0, #0x9c
/*0x82a0*/      ldr.w r0, [r0, r1, lsl #2]
/*0x82a4*/      add r0, r2
/*0x82a6*/      add.w r1, r0, #2
/*0x82aa*/      add.w r0, r0, #1
/*0x82ae*/      mov.w r2, #0
/*0x82b2*/      b.w function_e_97
            jump_82b6:
/*0x82b6*/      bx lr

            data_82b8:
/*0x82b8*/  .word 0x20000058
            data_82bc:
/*0x82bc*/  .word 0x20001cba
            data_82c0:
/*0x82c0*/  .word data_8de0


            .thumb_func
            function_e_10:
/*0x82c4*/      ldr r1, [pc, #0x3c] /* data_8304 */
/*0x82c6*/      ldrb.w r0, [r1, #0x39]
/*0x82ca*/      cmp r0, #1
/*0x82cc*/      bne jump_8302
/*0x82ce*/      add.w r1, r1, #0x18
/*0x82d2*/      ldr r2, [pc, #0x34] /* data_8308 */
/*0x82d4*/      ldrh r0, [r1, #0x30]
/*0x82d6*/      strb r0, [r2]
/*0x82d8*/      lsr.w r0, r0, #8
/*0x82dc*/      strb r0, [r2, #1]
/*0x82de*/      ldr r0, [pc, #0x2c] /* data_830c */
/*0x82e0*/      ldrb r2, [r1]
/*0x82e2*/      ldrb r1, [r1, #0xe]
/*0x82e4*/      ldr.w r2, [r0, r2, lsl #2]
/*0x82e8*/      sub.w r0, r0, #0x9c
/*0x82ec*/      ldr.w r0, [r0, r1, lsl #2]
/*0x82f0*/      add r0, r2
/*0x82f2*/      add.w r1, r0, #4
/*0x82f6*/      add.w r0, r0, #3
/*0x82fa*/      mov.w r2, #0
/*0x82fe*/      b.w function_e_97
            jump_8302:
/*0x8302*/      bx lr

            data_8304:
/*0x8304*/  .word 0x20000058
            data_8308:
/*0x8308*/  .word 0x20001cba
            data_830c:
/*0x830c*/  .word data_8de0


            .thumb_func
            function_e_11:
/*0x8310*/      push {r4, lr}
/*0x8312*/      ldr r3, [pc, #0x24] /* data_8338 */
/*0x8314*/      ldr r4, [pc, #0x1c] /* data_8334 */
/*0x8316*/      ldrb r2, [r3, #2]
/*0x8318*/      strb.w r1, [r4, r2, lsl #2]
/*0x831c*/      add.w r1, r4, r2, lsl #2
/*0x8320*/      strb r0, [r1, #1]
/*0x8322*/      ldr r0, [r3, #0x30]
/*0x8324*/      movs r0, #0
/*0x8326*/      strb r0, [r1, #2]
/*0x8328*/      ldr r0, [r3, #0x30]
/*0x832a*/      strb r0, [r1, #3]
/*0x832c*/      adds r2, r2, #1
/*0x832e*/      strb r2, [r3, #2]
/*0x8330*/      pop {r4, pc}

/*0x8332*/  .byte 0x00
/*0x8333*/  .byte 0x00

            data_8334:
/*0x8334*/  .word 0x2000080c
            data_8338:
/*0x8338*/  .word 0x20000088


            .thumb_func
            function_1:
/*0x833c*/      cmp r0, #0x32
/*0x833e*/      beq jump_8346
/*0x8340*/      cmp r0, #0x64
/*0x8342*/      bhi jump_8348
/*0x8344*/      movs r0, #0x32
            jump_8346:
/*0x8346*/      bx lr
            jump_8348:
/*0x8348*/      cmp r0, #0xc8
/*0x834a*/      bhi jump_8350
/*0x834c*/      movs r0, #0x64
/*0x834e*/      bx lr
            jump_8350:
/*0x8350*/      mov.w r2, #0x12c
/*0x8354*/      cmp r0, r2
/*0x8356*/      bhi jump_835c
/*0x8358*/      movs r0, #0xc8
/*0x835a*/      bx lr
            jump_835c:
/*0x835c*/      mov.w r1, #0x1f4
/*0x8360*/      cmp r0, r1
/*0x8362*/      bhi jump_8368
            jump_8364:
/*0x8364*/      mov r0, r2
/*0x8366*/      bx lr
            jump_8368:
/*0x8368*/      mov.w r2, #0x2bc
/*0x836c*/      cmp r0, r2
/*0x836e*/      bhi jump_8374
/*0x8370*/      mov r0, r1
/*0x8372*/      bx lr
            jump_8374:
/*0x8374*/      cmp.w r0, #0x3e8
/*0x8378*/      bls jump_8364
/*0x837a*/      bx lr

            .thumb_func
            call_837c:
/*0x837c*/      mov.w r2, #0x3e8
/*0x8380*/      cmp r0, r2
/*0x8382*/      beq jump_838e
/*0x8384*/      mov.w r1, #0x2bc
/*0x8388*/      cmp r0, r1
/*0x838a*/      blo jump_8390
            jump_838c:
/*0x838c*/      mov r0, r2
            jump_838e:
/*0x838e*/      bx lr
            jump_8390:
/*0x8390*/      mov.w r2, #0x1f4
/*0x8394*/      cmp r0, r2
/*0x8396*/      blo jump_839c
            jump_8398:
/*0x8398*/      mov r0, r1
/*0x839a*/      bx lr
            jump_839c:
/*0x839c*/      mov.w r1, #0x12c
/*0x83a0*/      cmp r0, r1
/*0x83a2*/      bhs jump_838c
/*0x83a4*/      cmp r0, #0xc8
/*0x83a6*/      bhs jump_8398
/*0x83a8*/      cmp r0, #0x64
/*0x83aa*/      blo jump_83b0
/*0x83ac*/      movs r0, #0xc8
/*0x83ae*/      bx lr
            jump_83b0:
/*0x83b0*/      cmp r0, #0x32
/*0x83b2*/      blo jump_83b8
/*0x83b4*/      movs r0, #0x64
/*0x83b6*/      bx lr
            jump_83b8:
/*0x83b8*/      movs r0, #0
/*0x83ba*/      bx lr

            .thumb_func
            function_e_14:
/*0x83bc*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x83c0*/      ldr.w r8, [pc, #0x1b0] /* data_8574 */
/*0x83c4*/      mov.w sl, #0
/*0x83c8*/      ldrb.w r0, [r8, #0x29]
/*0x83cc*/      cbnz r0, jump_841c
/*0x83ce*/      bl function_80
/*0x83d2*/      cmp r0, #1
/*0x83d4*/      bne jump_841c
/*0x83d6*/      movs r0, #0
/*0x83d8*/      bl function_e_18
/*0x83dc*/      bl function_e_83
/*0x83e0*/      add.w r1, r8, #0x29
/*0x83e4*/      ldr r2, [pc, #0x190] /* data_8578 */
/*0x83e6*/      ldrb r0, [r1, #0x14]
/*0x83e8*/      mov.w r3, #0x1c2
/*0x83ec*/      lsr.w r4, r0, #3
/*0x83f0*/      add.w r4, r2, r4, lsl #4
/*0x83f4*/      and r0, r0, #7
/*0x83f8*/      strh.w r3, [r4, r0, lsl #1]
/*0x83fc*/      ldrb r0, [r1, #0x15]
/*0x83fe*/      lsr.w r4, r0, #3
/*0x8402*/      add.w r4, r2, r4, lsl #4
/*0x8406*/      and r0, r0, #7
/*0x840a*/      strh.w r3, [r4, r0, lsl #1]
/*0x840e*/      strh.w sl, [r2, #0x20]
/*0x8412*/      ldrb r0, [r1]
/*0x8414*/      add.w r0, r0, #1
/*0x8418*/      strb.w r0, [r8, #0x29]
            jump_841c:
/*0x841c*/      movs r6, #0
            jump_841e:
/*0x841e*/      ldr r0, [pc, #0x15c] /* data_857c */
/*0x8420*/      add r0, r6
/*0x8422*/      mov sb, r0
/*0x8424*/      ldrb r5, [r0, #2]
/*0x8426*/      ldrb r7, [r0, #0x14]
/*0x8428*/      eors r7, r5
/*0x842a*/      movs r4, #0
            jump_842c:
/*0x842c*/      lsls r0, r7, #0x1f
/*0x842e*/      beq jump_84c4
/*0x8430*/      lsls r0, r5, #0x1f
/*0x8432*/      beq jump_8444
/*0x8434*/      cmp r6, #8
/*0x8436*/      bne jump_8444
/*0x8438*/      cbnz r4, jump_8444
/*0x843a*/      movs r1, #0x14
/*0x843c*/      strb.w r1, [r8, #0x29]
/*0x8440*/      strb.w sl, [r8, #0x20]
            jump_8444:
/*0x8444*/      ldrb.w r0, [sb, #0x14]
/*0x8448*/      movs r1, #1
/*0x844a*/      lsls r1, r4
/*0x844c*/      eors r0, r1
/*0x844e*/      strb.w r0, [sb, #0x14]
/*0x8452*/      ldrb.w r0, [r8, #0x29]
/*0x8456*/      cmp r0, #3
/*0x8458*/      beq jump_84d2
/*0x845a*/      bgt jump_8466
/*0x845c*/      cmp r0, #1
/*0x845e*/      beq jump_8470
/*0x8460*/      cmp r0, #2
/*0x8462*/      bne jump_8558
/*0x8464*/      b jump_84c6
            jump_8466:
/*0x8466*/      cmp r0, #0xb
/*0x8468*/      beq jump_850c
/*0x846a*/      cmp r0, #0xc
/*0x846c*/      bne jump_8558
/*0x846e*/      b jump_851c
            jump_8470:
/*0x8470*/      lsls r0, r5, #0x1f
/*0x8472*/      bne jump_8558
/*0x8474*/      ldrb.w r1, [r8, #0x3d]
/*0x8478*/      add.w fp, r4, r6, lsl #3
/*0x847c*/      cmp fp, r1
/*0x847e*/      bne jump_849e
/*0x8480*/      bl function_e_93
/*0x8484*/      movs r1, #2
/*0x8486*/      strb.w r1, [r8, #0x29]
/*0x848a*/      ldrb.w r0, [r8, #0x3e]
/*0x848e*/      ldr r2, [pc, #0xe8] /* data_8578 */
/*0x8490*/      lsrs r3, r0, #3
/*0x8492*/      add.w r2, r2, r3, lsl #4
/*0x8496*/      and r0, r0, #7
/*0x849a*/      strh.w sl, [r2, r0, lsl #1]
            jump_849e:
/*0x849e*/      ldrb.w r1, [r8, #0x3e]
/*0x84a2*/      cmp fp, r1
/*0x84a4*/      bne jump_8558
/*0x84a6*/      bl function_e_93
/*0x84aa*/      movs r1, #0xb
/*0x84ac*/      strb.w r1, [r8, #0x29]
/*0x84b0*/      ldrb.w r0, [r8, #0x3e]
/*0x84b4*/      ldr r2, [pc, #0xc0] /* data_8578 */
/*0x84b6*/      lsrs r3, r0, #3
/*0x84b8*/      add.w r2, r2, r3, lsl #4
/*0x84bc*/      and r0, r0, #7
/*0x84c0*/      strh.w sl, [r2, r0, lsl #1]
            jump_84c4:
/*0x84c4*/      b jump_8558
            jump_84c6:
/*0x84c6*/      bl function_80
/*0x84ca*/      cmp r0, #1
/*0x84cc*/      bne jump_8558
/*0x84ce*/      movs r1, #3
/*0x84d0*/      b jump_8516
            jump_84d2:
/*0x84d2*/      lsls r0, r5, #0x1f
/*0x84d4*/      bne jump_8558
/*0x84d6*/      add.w r0, r4, r6, lsl #3
/*0x84da*/      uxtb r0, r0
/*0x84dc*/      cmp r0, #0x3e
/*0x84de*/      beq jump_8558
/*0x84e0*/      cmp r0, #0x47
/*0x84e2*/      beq jump_8558
/*0x84e4*/      cmp r0, #0x10
/*0x84e6*/      beq jump_8558
/*0x84e8*/      ldrb.w r2, [r8, #0x3e]
/*0x84ec*/      mov r1, r8
/*0x84ee*/      cmp r0, r2
/*0x84f0*/      beq jump_8558
/*0x84f2*/      cmp r0, #0x46
/*0x84f4*/      beq jump_8558
/*0x84f6*/      cmp r0, #0x42
/*0x84f8*/      beq jump_8558
/*0x84fa*/      cmp r0, #0x41
/*0x84fc*/      beq jump_8558
/*0x84fe*/      cmp r0, #0x40
/*0x8500*/      beq jump_8558
/*0x8502*/      strb.w sl, [r1, #0x29]
/*0x8506*/      strb.w r0, [r8, #0x3d]
/*0x850a*/      b jump_8554
            jump_850c:
/*0x850c*/      bl function_80
/*0x8510*/      cmp r0, #1
/*0x8512*/      bne jump_8558
/*0x8514*/      movs r1, #0xc
            jump_8516:
/*0x8516*/      strb.w r1, [r8, #0x29]
/*0x851a*/      b jump_8558
            jump_851c:
/*0x851c*/      lsls r0, r5, #0x1f
/*0x851e*/      bne jump_8558
/*0x8520*/      add.w r0, r4, r6, lsl #3
/*0x8524*/      uxtb r0, r0
/*0x8526*/      cmp r0, #0x3e
/*0x8528*/      beq jump_8558
/*0x852a*/      cmp r0, #0x47
/*0x852c*/      beq jump_8558
/*0x852e*/      cmp r0, #0x10
/*0x8530*/      beq jump_8558
/*0x8532*/      ldrb.w r2, [r8, #0x3d]
/*0x8536*/      mov r1, r8
/*0x8538*/      cmp r0, r2
/*0x853a*/      beq jump_8558
/*0x853c*/      cmp r0, #0x46
/*0x853e*/      beq jump_8558
/*0x8540*/      cmp r0, #0x42
/*0x8542*/      beq jump_8558
/*0x8544*/      cmp r0, #0x41
/*0x8546*/      beq jump_8558
/*0x8548*/      cmp r0, #0x40
/*0x854a*/      beq jump_8558
/*0x854c*/      strb.w sl, [r1, #0x29]
/*0x8550*/      strb.w r0, [r8, #0x3e]
            jump_8554:
/*0x8554*/      bl function_e_5
            jump_8558:
/*0x8558*/      adds r4, r4, #1
/*0x855a*/      lsrs r7, r7, #1
/*0x855c*/      lsrs r5, r5, #1
/*0x855e*/      uxtb r4, r4
/*0x8560*/      cmp r4, #8
/*0x8562*/      blo.w jump_842c
/*0x8566*/      adds r6, r6, #1
/*0x8568*/      uxtb r6, r6
/*0x856a*/      cmp r6, #9
/*0x856c*/      blo.w jump_841e
/*0x8570*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_8574:
/*0x8574*/  .word 0x20000058
            data_8578:
/*0x8578*/  .word 0x20002e2c
            data_857c:
/*0x857c*/  .word 0x20002de4


            .thumb_func
            function_e_1:
/*0x8580*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x8584*/      ldr r6, [pc, #0x17c] /* data_8704 */
/*0x8586*/      ldrb.w r0, [r6, #0x30]
/*0x858a*/      cbnz r0, jump_860a
/*0x858c*/      ldrb r1, [r6, #9]
/*0x858e*/      ldr r0, [pc, #0x178] /* data_8708 */
/*0x8590*/      mov.w lr, #0x3e8
/*0x8594*/      movs r2, #0
/*0x8596*/      cbz r1, jump_85b8
/*0x8598*/      ldrb r1, [r6, #9]
/*0x859a*/      cmp r1, #1
/*0x859c*/      beq jump_85b8
/*0x859e*/      strh.w r2, [r0, #0x52]
            jump_85a2:
/*0x85a2*/      ldr r1, [pc, #0x160] /* data_8704 */
/*0x85a4*/      ldrb r4, [r6, #5]
/*0x85a6*/      ldrb r3, [r1, #0x1f]
/*0x85a8*/      mov.w r1, #0x1c2
/*0x85ac*/      cbz r4, jump_85b4
/*0x85ae*/      ldrb.w r4, [r6, #0x29]
/*0x85b2*/      cbz r4, jump_85d8
            jump_85b4:
/*0x85b4*/      cbz r3, jump_85de
/*0x85b6*/      b jump_85e0
            jump_85b8:
/*0x85b8*/      ldrh.w r1, [r6, #0x52]
/*0x85bc*/      mov.w r3, #0x1c2
/*0x85c0*/      rsb r1, r1, r1, lsl #16
/*0x85c4*/      udiv r1, r1, lr
/*0x85c8*/      muls r1, r3, r1
/*0x85ca*/      movw r3, #0xffff
/*0x85ce*/      udiv r1, r1, r3
/*0x85d2*/      strh.w r1, [r0, #0x52]
/*0x85d6*/      b jump_85a2
            jump_85d8:
/*0x85d8*/      cbnz r3, jump_85e0
/*0x85da*/      strh r1, [r0, #0x20]
/*0x85dc*/      b jump_85e0
            jump_85de:
/*0x85de*/      strh r2, [r0, #0x20]
            jump_85e0:
/*0x85e0*/      ldr.w ip, [pc, #0x120] /* data_8704 */
/*0x85e4*/      add.w ip, ip, #0x80
/*0x85e8*/      ldr.w r5, [ip, #0x34]
/*0x85ec*/      ldr r3, [pc, #0x11c] /* data_870c */
/*0x85ee*/      mov.w r4, #0x7d0
/*0x85f2*/      cbz r5, jump_860c
/*0x85f4*/      ldr.w r5, [ip, #0x34]
/*0x85f8*/      udiv r7, r5, r4
/*0x85fc*/      mls r5, r4, r7, r5
/*0x8600*/      cmp r5, lr
/*0x8602*/      bhs jump_8630
            jump_8604:
/*0x8604*/      strh.w r1, [r0, #0x72]
/*0x8608*/      b jump_8634
            jump_860a:
/*0x860a*/      b function_e_96
            jump_860c:
/*0x860c*/      strh.w r2, [r0, #0x72]
/*0x8610*/      strh.w r2, [r3, #0x72]
/*0x8614*/      ldrb r5, [r6, #0x18]
/*0x8616*/      cmp r5, #1
/*0x8618*/      beq jump_8604
/*0x861a*/      cmp r5, #2
/*0x861c*/      beq jump_8624
/*0x861e*/      cmp r5, #3
/*0x8620*/      beq jump_862a
/*0x8622*/      b jump_8634
            jump_8624:
/*0x8624*/      strh.w r1, [r3, #0x72]
/*0x8628*/      b jump_8634
            jump_862a:
/*0x862a*/      strh.w r1, [r0, #0x72]
/*0x862e*/      b jump_8624
            jump_8630:
/*0x8630*/      strh.w r2, [r0, #0x72]
            jump_8634:
/*0x8634*/      ldrb r5, [r6, #0x16]
/*0x8636*/      cmp r5, #1
/*0x8638*/      beq jump_8662
/*0x863a*/      ldrb.w r4, [r6, #0x25]
/*0x863e*/      cmp r4, #1
/*0x8640*/      beq jump_86a2
/*0x8642*/      strh.w r2, [r0, #0x84]
/*0x8646*/      strh.w r2, [r3, #0x84]

            .thumb_func
            function_e_96:
/*0x864a*/      movs r2, #0x90
/*0x864c*/      ldr r1, [pc, #0xb8] /* data_8708 */
/*0x864e*/      ldr r0, [pc, #0xc0] /* data_8710 */
/*0x8650*/      bl memcpy
/*0x8654*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x8658*/      movs r2, #0x90
/*0x865a*/      ldr r1, [pc, #0xb0] /* data_870c */
/*0x865c*/      ldr r0, [pc, #0xb4] /* data_8714 */
/*0x865e*/      b.w memcpy
            jump_8662:
/*0x8662*/      strb.w r2, [r6, #0x25]
/*0x8666*/      strh.w r2, [r0, #0x84]
/*0x866a*/      strh.w r2, [r3, #0x84]
/*0x866e*/      ldrb r2, [r6]
/*0x8670*/      cmp r2, #2
/*0x8672*/      blo jump_869c
/*0x8674*/      ldrb r2, [r6]
/*0x8676*/      cmp r2, #2
/*0x8678*/      beq jump_869c
/*0x867a*/      ldrb r2, [r6]
/*0x867c*/      cmp r2, #4
/*0x867e*/      bne function_e_96
/*0x8680*/      ldr.w r2, [ip, #0x24]
/*0x8684*/      cmp r2, lr
/*0x8686*/      bls jump_868c
/*0x8688*/      strh.w r1, [r0, #0x84]
            jump_868c:
/*0x868c*/      ldr.w r0, [ip, #0x24]
/*0x8690*/      cmp r0, r4
/*0x8692*/      bls function_e_96
/*0x8694*/      movs r0, #1
/*0x8696*/      str.w r0, [ip, #0x24]
/*0x869a*/      b function_e_96
            jump_869c:
/*0x869c*/      strh.w r1, [r0, #0x84]
/*0x86a0*/      b function_e_96
            jump_86a2:
/*0x86a2*/      ldr.w r4, [ip, #0x24]
/*0x86a6*/      bic r4, r4, #0xff000000
/*0x86aa*/      cmp.w r4, #0x190
/*0x86ae*/      bhs jump_86ba
/*0x86b0*/      strh.w r1, [r0, #0x84]
/*0x86b4*/      strh.w r1, [r3, #0x84]
/*0x86b8*/      b function_e_96
            jump_86ba:
/*0x86ba*/      strh.w r2, [r0, #0x84]
/*0x86be*/      strh.w r2, [r3, #0x84]
/*0x86c2*/      ldr.w r0, [ip, #0x24]
/*0x86c6*/      bic r0, r0, #0xff000000
/*0x86ca*/      cmp.w r0, #0x320
/*0x86ce*/      bls function_e_96
/*0x86d0*/      ldr.w r0, [ip, #0x24]
/*0x86d4*/      and r0, r0, #0xf0000000
/*0x86d8*/      str.w r0, [ip, #0x24]
/*0x86dc*/      ldr.w r0, [ip, #0x24]
/*0x86e0*/      add.w r0, r0, #0x10000000
/*0x86e4*/      adds r0, r0, #1
/*0x86e6*/      str.w r0, [ip, #0x24]
/*0x86ea*/      ldr.w r0, [ip, #0x24]
/*0x86ee*/      and r0, r0, #0xf0000000
/*0x86f2*/      cmp.w r0, #0x40000000
/*0x86f6*/      bls function_e_96
/*0x86f8*/      str.w r2, [ip, #0x24]
/*0x86fc*/      strb.w r2, [r6, #0x25]
/*0x8700*/      b function_e_96

/*0x8702*/  .byte 0x00
/*0x8703*/  .byte 0x00

            data_8704:
/*0x8704*/  .word 0x20000058
            data_8708:
/*0x8708*/  .word 0x20002e2c
            data_870c:
/*0x870c*/  .word 0x20002ebc
            data_8710:
/*0x8710*/  .word 0x20002cc4
            data_8714:
/*0x8714*/  .word 0x20002d54


            .thumb_func
            function_e_12:
/*0x8718*/      push {r4, lr}
/*0x871a*/      add.w r2, r2, r1, lsl #3
/*0x871e*/      ldr r3, [pc, #0x64] /* data_8784 */
/*0x8720*/      cmp r2, #0x10
/*0x8722*/      beq jump_873e
/*0x8724*/      ldrb.w r1, [r3, #0x2c]
/*0x8728*/      cmp r1, #1
/*0x872a*/      bne jump_873c
/*0x872c*/      ldr r3, [pc, #0x58] /* data_8788 */
/*0x872e*/      movs r1, #0
            jump_8730:
/*0x8730*/      ldrb r4, [r3, r1]
/*0x8732*/      cmp r2, r4
/*0x8734*/      bne jump_8778
/*0x8736*/      ldr r0, [pc, #0x50] /* data_8788 */
/*0x8738*/      adds r0, r0, #4
/*0x873a*/      ldrb r0, [r0, r1]
            jump_873c:
/*0x873c*/      pop {r4, pc}
            jump_873e:
/*0x873e*/      ldrb.w r1, [r3, #0x21]
/*0x8742*/      cmp r1, #1
/*0x8744*/      beq jump_875e
/*0x8746*/      ldrb.w r1, [r3, #0x24]
/*0x874a*/      cmp r1, #0xff
/*0x874c*/      beq jump_8768
/*0x874e*/      ldrb r2, [r3, #0x18]
/*0x8750*/      cbz r2, jump_8768
/*0x8752*/      cmp r1, #0x12
/*0x8754*/      beq jump_873c
/*0x8756*/      cmp r1, #0x13
/*0x8758*/      beq jump_873c
/*0x875a*/      movs r0, #0
/*0x875c*/      pop {r4, pc}
            jump_875e:
/*0x875e*/      movs r0, #0
/*0x8760*/      strb.w r0, [r3, #0x21]
/*0x8764*/      movs r0, #0xe8
/*0x8766*/      pop {r4, pc}
            jump_8768:
/*0x8768*/      ldrb.w r0, [r3, #0x26]
/*0x876c*/      cmp r0, #2
/*0x876e*/      beq jump_8774
/*0x8770*/      movs r0, #0x39
/*0x8772*/      pop {r4, pc}
            jump_8774:
/*0x8774*/      movs r0, #0x2a
/*0x8776*/      pop {r4, pc}
            jump_8778:
/*0x8778*/      adds r1, r1, #1
/*0x877a*/      uxtb r1, r1
/*0x877c*/      cmp r1, #4
/*0x877e*/      blo jump_8730
/*0x8780*/      pop {r4, pc}

/*0x8782*/  .byte 0x00
/*0x8783*/  .byte 0x00

            data_8784:
/*0x8784*/  .word 0x20000058
            data_8788:
/*0x8788*/  .word data_8b70


            .thumb_func
            function_e_13:
/*0x878c*/      push {r4, lr}
/*0x878e*/      add.w r2, r2, r1, lsl #3
/*0x8792*/      ldr r3, [pc, #0x60] /* data_87f4 */
/*0x8794*/      cmp r2, #0x10
/*0x8796*/      beq jump_87b2
/*0x8798*/      ldrb.w r1, [r3, #0x2c]
/*0x879c*/      cmp r1, #1
/*0x879e*/      bne jump_87b0
/*0x87a0*/      ldr r3, [pc, #0x54] /* data_87f8 */
/*0x87a2*/      movs r1, #0
            jump_87a4:
/*0x87a4*/      ldrb r4, [r3, r1]
/*0x87a6*/      cmp r2, r4
/*0x87a8*/      bne jump_87ea
/*0x87aa*/      ldr r0, [pc, #0x4c] /* data_87f8 */
/*0x87ac*/      adds r0, r0, #4
/*0x87ae*/      ldrb r0, [r0, r1]
            jump_87b0:
/*0x87b0*/      pop {r4, pc}
            jump_87b2:
/*0x87b2*/      ldrb r1, [r3, #0x1f]
/*0x87b4*/      cmp r1, #1
/*0x87b6*/      beq jump_87d0
/*0x87b8*/      ldrb.w r1, [r3, #0x24]
/*0x87bc*/      cmp r1, #0xff
/*0x87be*/      beq jump_87da
/*0x87c0*/      ldrb r2, [r3, #0x18]
/*0x87c2*/      cbz r2, jump_87da
/*0x87c4*/      cmp r1, #0x12
/*0x87c6*/      beq jump_87b0
/*0x87c8*/      cmp r1, #0x13
/*0x87ca*/      beq jump_87b0
/*0x87cc*/      movs r0, #0
/*0x87ce*/      pop {r4, pc}
            jump_87d0:
/*0x87d0*/      movs r0, #1
/*0x87d2*/      strb.w r0, [r3, #0x21]
/*0x87d6*/      movs r0, #0xe8
/*0x87d8*/      pop {r4, pc}
            jump_87da:
/*0x87da*/      ldrb.w r0, [r3, #0x26]
/*0x87de*/      cmp r0, #2
/*0x87e0*/      beq jump_87e6
/*0x87e2*/      movs r0, #0x39
/*0x87e4*/      pop {r4, pc}
            jump_87e6:
/*0x87e6*/      movs r0, #0x2a
/*0x87e8*/      pop {r4, pc}
            jump_87ea:
/*0x87ea*/      adds r1, r1, #1
/*0x87ec*/      uxtb r1, r1
/*0x87ee*/      cmp r1, #4
/*0x87f0*/      blo jump_87a4
/*0x87f2*/      pop {r4, pc}

            data_87f4:
/*0x87f4*/  .word 0x20000058
            data_87f8:
/*0x87f8*/  .word data_8b70


            .thumb_func
            function_e_15:
/*0x87fc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x8800*/      ldr r5, [pc, #0x84] /* data_8888 */
/*0x8802*/      movs r0, #1
/*0x8804*/      ldr r6, [pc, #0x84] /* data_888c */
/*0x8806*/      ldrb.w r1, [r5, #0x30]
/*0x880a*/      ldr r7, [pc, #0x84] /* data_8890 */
/*0x880c*/      subs r1, r1, #2
/*0x880e*/      mov.w r4, #0x3e8
/*0x8812*/      movw r8, #0xffff
/*0x8816*/      cmp r1, #5
/*0x8818*/      bhs jump_8864
/*0x881a*/      tbb [pc, r1]

/*0x881e*/  .byte 0x03
/*0x881f*/  .byte 0x05
/*0x8820*/  .byte 0x0b
/*0x8821*/  .byte 0x25
/*0x8822*/  .byte 0x2b
/*0x8823*/  .byte 0x00

            switch_8824:
/*0x8824*/      movs r1, #0x64
/*0x8826*/      b jump_882c
            switch_8828:
/*0x8828*/      mov.w r1, #0x1f4
            jump_882c:
/*0x882c*/      add.w r5, r5, #0x38
/*0x8830*/      strh r1, [r5, #0x10]
/*0x8832*/      b jump_883a
            switch_8834:
/*0x8834*/      add.w r5, r5, #0x38
/*0x8838*/      strh r4, [r5, #0x10]
            jump_883a:
/*0x883a*/      strb r0, [r5, #1]
/*0x883c*/      mov.w r0, #1
/*0x8840*/      bl function_e_18
/*0x8844*/      ldrh r0, [r5, #0x10]
/*0x8846*/      mov.w r1, #0x1c2
/*0x884a*/      rsb r0, r0, r0, lsl #16
/*0x884e*/      udiv r0, r0, r4
/*0x8852*/      muls r0, r1, r0
/*0x8854*/      udiv r0, r0, r8
/*0x8858*/      strh r0, [r6, #0x72]!
/*0x885c*/      strh r0, [r7, #0x72]!
/*0x8860*/      strh r0, [r6, #0x12]
/*0x8862*/      strh r0, [r7, #0x12]
            jump_8864:
/*0x8864*/      pop.w {r4, r5, r6, r7, r8, pc}
            switch_8868:
/*0x8868*/      add.w r5, r5, #0x38
/*0x886c*/      mov.w r0, #5
/*0x8870*/      strh r4, [r5, #0x10]
/*0x8872*/      b jump_887e
            switch_8874:
/*0x8874*/      add.w r5, r5, #0x38
/*0x8878*/      mov.w r0, #6
/*0x887c*/      strh r4, [r5, #0x10]
            jump_887e:
/*0x887e*/      strb r0, [r5, #1]
/*0x8880*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x8884*/      b.w function_e_18

            data_8888:
/*0x8888*/  .word 0x20000058
            data_888c:
/*0x888c*/  .word 0x20002e2c
            data_8890:
/*0x8890*/  .word 0x20002ebc


            .thumb_func
            call_8894:
/*0x8894*/      push {lr}
/*0x8896*/      ldr r1, [pc, #0x20] /* data_88b8 */
/*0x8898*/      movs r0, #0
            jump_889a:
/*0x889a*/      adds r2, r1, r0
/*0x889c*/      ldrb r2, [r2, #0x14]
/*0x889e*/      cmp r2, #0xff
/*0x88a0*/      beq jump_88a6
/*0x88a2*/      movs r0, #0
/*0x88a4*/      pop {pc}
            jump_88a6:
/*0x88a6*/      adds r0, r0, #1
/*0x88a8*/      uxtb r0, r0
/*0x88aa*/      cmp r0, #9
/*0x88ac*/      blo jump_889a
/*0x88ae*/      bl function_e_83
/*0x88b2*/      movs r0, #1
/*0x88b4*/      pop {pc}

/*0x88b6*/  .byte 0x00
/*0x88b7*/  .byte 0x00

            data_88b8:
/*0x88b8*/  .word 0x20002de4


            .thumb_func
            function_80:
/*0x88bc*/      ldr r2, [pc, #0x28] /* data_88e8 */
/*0x88be*/      movs r0, #0
/*0x88c0*/      movs r1, #0xb8
/*0x88c2*/      ldrb r3, [r2, #0xa]
/*0x88c4*/      bics r1, r3
/*0x88c6*/      b jump_88cc
            jump_88c8:
/*0x88c8*/      cmp r0, #8
/*0x88ca*/      beq jump_88d8
            jump_88cc:
/*0x88cc*/      adds r3, r2, r0
/*0x88ce*/      ldrb r3, [r3, #2]
/*0x88d0*/      cmp r3, #0xff
/*0x88d2*/      beq jump_88dc
            jump_88d4:
/*0x88d4*/      movs r0, #0
/*0x88d6*/      bx lr
            jump_88d8:
/*0x88d8*/      cmp r1, #0
/*0x88da*/      bne jump_88d4
            jump_88dc:
/*0x88dc*/      adds r0, r0, #1
/*0x88de*/      uxtb r0, r0
/*0x88e0*/      cmp r0, #9
/*0x88e2*/      blo jump_88c8
/*0x88e4*/      movs r0, #1
/*0x88e6*/      bx lr

            data_88e8:
/*0x88e8*/  .word 0x20002de4


            .thumb_func
            function_26:
/*0x88ec*/      ldr r1, [pc, #0x40] /* data_8930 */
/*0x88ee*/      push {r4, lr}
/*0x88f0*/      ldrb.w r2, [r1, #0x3e]
/*0x88f4*/      movs r0, #0
/*0x88f6*/      ldr r4, [pc, #0x34] /* data_892c */
/*0x88f8*/      movs r3, #1
/*0x88fa*/      and r1, r2, #7
/*0x88fe*/      lsls r3, r1
            jump_8900:
/*0x8900*/      adds r1, r4, r0
/*0x8902*/      cmp r0, #8
/*0x8904*/      ldrb r1, [r1, #2]
/*0x8906*/      bne jump_890c
/*0x8908*/      orr r1, r1, #0x47
            jump_890c:
/*0x890c*/      cmp.w r0, r2, lsr #3
/*0x8910*/      bne jump_8916
/*0x8912*/      orrs r1, r3
/*0x8914*/      uxtb r1, r1
            jump_8916:
/*0x8916*/      cmp r1, #0xff
/*0x8918*/      beq jump_891e
/*0x891a*/      movs r0, #0
/*0x891c*/      pop {r4, pc}
            jump_891e:
/*0x891e*/      adds r0, r0, #1
/*0x8920*/      uxtb r0, r0
/*0x8922*/      cmp r0, #9
/*0x8924*/      blo jump_8900
/*0x8926*/      movs r0, #1
/*0x8928*/      pop {r4, pc}

/*0x892a*/  .byte 0x00
/*0x892b*/  .byte 0x00

            data_892c:
/*0x892c*/  .word 0x20002de4
            data_8930:
/*0x8930*/  .word 0x20000058


            .thumb_func
            function_e_97:
/*0x8934*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x8938*/      subs r4, r1, r0
/*0x893a*/      mov r7, r0
/*0x893c*/      mov r6, r2
/*0x893e*/      adds r4, r4, #1
/*0x8940*/      bl watchdog_reload_timer
/*0x8944*/      ubfx r5, r7, #0, #0xc
/*0x8948*/      subs r0, r7, r5
/*0x894a*/      mov r8, r0
/*0x894c*/      mov.w sb, #0x1000
/*0x8950*/      mov r1, r0
/*0x8952*/      mov r2, sb
/*0x8954*/      ldr r0, [pc, #0x3c] /* data_8994 */
/*0x8956*/      bl spi_flash_read_data
/*0x895a*/      bl watchdog_reload_timer
/*0x895e*/      mov r0, r8
/*0x8960*/      bl function_e_40
/*0x8964*/      bl watchdog_reload_timer
/*0x8968*/      ldr r1, [pc, #0x28] /* data_8994 */
/*0x896a*/      movs r0, #0
/*0x896c*/      add.w r2, r1, #0x1000
/*0x8970*/      b jump_897c
            jump_8972:
/*0x8972*/      adds r3, r0, r6
/*0x8974*/      adds r7, r5, r0
/*0x8976*/      ldrb r3, [r2, r3]
/*0x8978*/      strb r3, [r1, r7]
/*0x897a*/      adds r0, r0, #1
            jump_897c:
/*0x897c*/      cmp r0, r4
/*0x897e*/      blo jump_8972
/*0x8980*/      mov r2, sb
/*0x8982*/      mov r1, r8
/*0x8984*/      ldr r0, [pc, #0xc] /* data_8994 */
/*0x8986*/      bl function_27
/*0x898a*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x898e*/      b.w watchdog_reload_timer

/*0x8992*/  .byte 0x00
/*0x8993*/  .byte 0x00

            data_8994:
/*0x8994*/  .word 0x20000cba

            data_8998:
/*0x8998*/  .byte 0x05
/*0x8999*/  .byte 0x01
/*0x899a*/  .byte 0x09
/*0x899b*/  .byte 0x06
/*0x899c*/  .byte 0xa1
/*0x899d*/  .byte 0x01
/*0x899e*/  .byte 0x05
/*0x899f*/  .byte 0x07
/*0x89a0*/  .byte 0x19
/*0x89a1*/  .byte 0xe0
/*0x89a2*/  .byte 0x29
/*0x89a3*/  .byte 0xe7
/*0x89a4*/  .byte 0x15
/*0x89a5*/  .byte 0x00
/*0x89a6*/  .byte 0x25
/*0x89a7*/  .byte 0x01
/*0x89a8*/  .byte 0x75
/*0x89a9*/  .byte 0x01
/*0x89aa*/  .byte 0x95
/*0x89ab*/  .byte 0x08
/*0x89ac*/  .byte 0x81
/*0x89ad*/  .byte 0x02
/*0x89ae*/  .byte 0x95
/*0x89af*/  .byte 0x01
/*0x89b0*/  .byte 0x75
/*0x89b1*/  .byte 0x08
/*0x89b2*/  .byte 0x81
/*0x89b3*/  .byte 0x03
/*0x89b4*/  .byte 0x95
/*0x89b5*/  .byte 0x03
/*0x89b6*/  .byte 0x75
/*0x89b7*/  .byte 0x01
/*0x89b8*/  .byte 0x05
/*0x89b9*/  .byte 0x08
/*0x89ba*/  .byte 0x19
/*0x89bb*/  .byte 0x01
/*0x89bc*/  .byte 0x29
/*0x89bd*/  .byte 0x03
/*0x89be*/  .byte 0x91
/*0x89bf*/  .byte 0x02
/*0x89c0*/  .byte 0x95
/*0x89c1*/  .byte 0x01
/*0x89c2*/  .byte 0x75
/*0x89c3*/  .byte 0x05
/*0x89c4*/  .byte 0x91
/*0x89c5*/  .byte 0x03
/*0x89c6*/  .byte 0x95
/*0x89c7*/  .byte 0x06
/*0x89c8*/  .byte 0x75
/*0x89c9*/  .byte 0x08
/*0x89ca*/  .byte 0x15
/*0x89cb*/  .byte 0x00
/*0x89cc*/  .byte 0x26
/*0x89cd*/  .byte 0xa4
/*0x89ce*/  .byte 0x00
/*0x89cf*/  .byte 0x05
/*0x89d0*/  .byte 0x07
/*0x89d1*/  .byte 0x19
/*0x89d2*/  .byte 0x00
/*0x89d3*/  .byte 0x29
/*0x89d4*/  .byte 0xa4
/*0x89d5*/  .byte 0x81
/*0x89d6*/  .byte 0x00
/*0x89d7*/  .byte 0xc0
            usb_report1_desc:
/*0x89d8*/  .byte 0x06
/*0x89d9*/  .byte 0x00
/*0x89da*/  .byte 0xff
/*0x89db*/  .byte 0x09
/*0x89dc*/  .byte 0x01
/*0x89dd*/  .byte 0xa1
/*0x89de*/  .byte 0x01
/*0x89df*/  .byte 0x09
/*0x89e0*/  .byte 0x02
/*0x89e1*/  .byte 0x15
/*0x89e2*/  .byte 0x00
/*0x89e3*/  .byte 0x26
/*0x89e4*/  .byte 0xff
/*0x89e5*/  .byte 0x00
/*0x89e6*/  .byte 0x75
/*0x89e7*/  .byte 0x08
/*0x89e8*/  .byte 0x95
/*0x89e9*/  .byte 0x40
/*0x89ea*/  .byte 0x81
/*0x89eb*/  .byte 0x02
/*0x89ec*/  .byte 0x09
/*0x89ed*/  .byte 0x03
/*0x89ee*/  .byte 0x15
/*0x89ef*/  .byte 0x00
/*0x89f0*/  .byte 0x26
/*0x89f1*/  .byte 0xff
/*0x89f2*/  .byte 0x00
/*0x89f3*/  .byte 0x75
/*0x89f4*/  .byte 0x08
/*0x89f5*/  .byte 0x95
/*0x89f6*/  .byte 0x40
/*0x89f7*/  .byte 0x91
/*0x89f8*/  .byte 0x02
/*0x89f9*/  .byte 0xc0
/*0x89fa*/  .byte 0x00
/*0x89fb*/  .byte 0x00
            usb_report2_desc:
/*0x89fc*/  .byte 0x05
/*0x89fd*/  .byte 0x01
/*0x89fe*/  .byte 0x09
/*0x89ff*/  .byte 0x80
/*0x8a00*/  .byte 0xa1
/*0x8a01*/  .byte 0x01
/*0x8a02*/  .byte 0x85
/*0x8a03*/  .byte 0x01
/*0x8a04*/  .byte 0x19
/*0x8a05*/  .byte 0x81
/*0x8a06*/  .byte 0x29
/*0x8a07*/  .byte 0x83
/*0x8a08*/  .byte 0x15
/*0x8a09*/  .byte 0x00
/*0x8a0a*/  .byte 0x25
/*0x8a0b*/  .byte 0x01
/*0x8a0c*/  .byte 0x95
/*0x8a0d*/  .byte 0x03
/*0x8a0e*/  .byte 0x75
/*0x8a0f*/  .byte 0x01
/*0x8a10*/  .byte 0x81
/*0x8a11*/  .byte 0x02
/*0x8a12*/  .byte 0x95
/*0x8a13*/  .byte 0x01
/*0x8a14*/  .byte 0x75
/*0x8a15*/  .byte 0x05
/*0x8a16*/  .byte 0x81
/*0x8a17*/  .byte 0x01
/*0x8a18*/  .byte 0xc0
/*0x8a19*/  .byte 0x05
/*0x8a1a*/  .byte 0x0c
/*0x8a1b*/  .byte 0x09
/*0x8a1c*/  .byte 0x01
/*0x8a1d*/  .byte 0xa1
/*0x8a1e*/  .byte 0x01
/*0x8a1f*/  .byte 0x85
/*0x8a20*/  .byte 0x02
/*0x8a21*/  .byte 0x15
/*0x8a22*/  .byte 0x00
/*0x8a23*/  .byte 0x25
/*0x8a24*/  .byte 0x01
/*0x8a25*/  .byte 0x95
/*0x8a26*/  .byte 0x12
/*0x8a27*/  .byte 0x75
/*0x8a28*/  .byte 0x01
/*0x8a29*/  .byte 0x0a
/*0x8a2a*/  .byte 0x83
/*0x8a2b*/  .byte 0x01
/*0x8a2c*/  .byte 0x0a
/*0x8a2d*/  .byte 0x8a
/*0x8a2e*/  .byte 0x01
/*0x8a2f*/  .byte 0x0a
/*0x8a30*/  .byte 0x92
/*0x8a31*/  .byte 0x01
/*0x8a32*/  .byte 0x0a
/*0x8a33*/  .byte 0x94
/*0x8a34*/  .byte 0x01
/*0x8a35*/  .byte 0x09
/*0x8a36*/  .byte 0xcd
/*0x8a37*/  .byte 0x09
/*0x8a38*/  .byte 0xb7
/*0x8a39*/  .byte 0x09
/*0x8a3a*/  .byte 0xb6
/*0x8a3b*/  .byte 0x09
/*0x8a3c*/  .byte 0xb5
/*0x8a3d*/  .byte 0x09
/*0x8a3e*/  .byte 0xe2
/*0x8a3f*/  .byte 0x09
/*0x8a40*/  .byte 0xea
/*0x8a41*/  .byte 0x09
/*0x8a42*/  .byte 0xe9
/*0x8a43*/  .byte 0x0a
/*0x8a44*/  .byte 0x21
/*0x8a45*/  .byte 0x02
/*0x8a46*/  .byte 0x0a
/*0x8a47*/  .byte 0x23
/*0x8a48*/  .byte 0x02
/*0x8a49*/  .byte 0x0a
/*0x8a4a*/  .byte 0x24
/*0x8a4b*/  .byte 0x02
/*0x8a4c*/  .byte 0x0a
/*0x8a4d*/  .byte 0x25
/*0x8a4e*/  .byte 0x02
/*0x8a4f*/  .byte 0x0a
/*0x8a50*/  .byte 0x26
/*0x8a51*/  .byte 0x02
/*0x8a52*/  .byte 0x0a
/*0x8a53*/  .byte 0x27
/*0x8a54*/  .byte 0x02
/*0x8a55*/  .byte 0x0a
/*0x8a56*/  .byte 0x2a
/*0x8a57*/  .byte 0x02
/*0x8a58*/  .byte 0x81
/*0x8a59*/  .byte 0x02
/*0x8a5a*/  .byte 0x95
/*0x8a5b*/  .byte 0x01
/*0x8a5c*/  .byte 0x75
/*0x8a5d*/  .byte 0x0e
/*0x8a5e*/  .byte 0x81
/*0x8a5f*/  .byte 0x01
/*0x8a60*/  .byte 0xc0
/*0x8a61*/  .byte 0x05
/*0x8a62*/  .byte 0x01
/*0x8a63*/  .byte 0x09
/*0x8a64*/  .byte 0x02
/*0x8a65*/  .byte 0xa1
/*0x8a66*/  .byte 0x01
/*0x8a67*/  .byte 0x09
/*0x8a68*/  .byte 0x01
/*0x8a69*/  .byte 0xa1
/*0x8a6a*/  .byte 0x00
/*0x8a6b*/  .byte 0x85
/*0x8a6c*/  .byte 0x03
/*0x8a6d*/  .byte 0x05
/*0x8a6e*/  .byte 0x09
/*0x8a6f*/  .byte 0x19
/*0x8a70*/  .byte 0x01
/*0x8a71*/  .byte 0x29
/*0x8a72*/  .byte 0x03
/*0x8a73*/  .byte 0x15
/*0x8a74*/  .byte 0x00
/*0x8a75*/  .byte 0x25
/*0x8a76*/  .byte 0x01
/*0x8a77*/  .byte 0x75
/*0x8a78*/  .byte 0x01
/*0x8a79*/  .byte 0x95
/*0x8a7a*/  .byte 0x03
/*0x8a7b*/  .byte 0x81
/*0x8a7c*/  .byte 0x02
/*0x8a7d*/  .byte 0x95
/*0x8a7e*/  .byte 0x01
/*0x8a7f*/  .byte 0x75
/*0x8a80*/  .byte 0x05
/*0x8a81*/  .byte 0x81
/*0x8a82*/  .byte 0x01
/*0x8a83*/  .byte 0x05
/*0x8a84*/  .byte 0x01
/*0x8a85*/  .byte 0x09
/*0x8a86*/  .byte 0x30
/*0x8a87*/  .byte 0x09
/*0x8a88*/  .byte 0x31
/*0x8a89*/  .byte 0x15
/*0x8a8a*/  .byte 0x81
/*0x8a8b*/  .byte 0x25
/*0x8a8c*/  .byte 0x7f
/*0x8a8d*/  .byte 0x75
/*0x8a8e*/  .byte 0x08
/*0x8a8f*/  .byte 0x95
/*0x8a90*/  .byte 0x02
/*0x8a91*/  .byte 0x81
/*0x8a92*/  .byte 0x06
/*0x8a93*/  .byte 0x09
/*0x8a94*/  .byte 0x38
/*0x8a95*/  .byte 0x15
/*0x8a96*/  .byte 0x81
/*0x8a97*/  .byte 0x25
/*0x8a98*/  .byte 0x7f
/*0x8a99*/  .byte 0x75
/*0x8a9a*/  .byte 0x08
/*0x8a9b*/  .byte 0x95
/*0x8a9c*/  .byte 0x01
/*0x8a9d*/  .byte 0x81
/*0x8a9e*/  .byte 0x06
/*0x8a9f*/  .byte 0xc0
/*0x8aa0*/  .byte 0xc0
/*0x8aa1*/  .byte 0x05
/*0x8aa2*/  .byte 0x01
/*0x8aa3*/  .byte 0x09
/*0x8aa4*/  .byte 0x06
/*0x8aa5*/  .byte 0xa1
/*0x8aa6*/  .byte 0x01
/*0x8aa7*/  .byte 0x85
/*0x8aa8*/  .byte 0x04
/*0x8aa9*/  .byte 0x05
/*0x8aaa*/  .byte 0x07
/*0x8aab*/  .byte 0x95
/*0x8aac*/  .byte 0x01
/*0x8aad*/  .byte 0x75
/*0x8aae*/  .byte 0x08
/*0x8aaf*/  .byte 0x81
/*0x8ab0*/  .byte 0x03
/*0x8ab1*/  .byte 0x95
/*0x8ab2*/  .byte 0xe8
/*0x8ab3*/  .byte 0x75
/*0x8ab4*/  .byte 0x01
/*0x8ab5*/  .byte 0x15
/*0x8ab6*/  .byte 0x00
/*0x8ab7*/  .byte 0x25
/*0x8ab8*/  .byte 0x01
/*0x8ab9*/  .byte 0x05
/*0x8aba*/  .byte 0x07
/*0x8abb*/  .byte 0x19
/*0x8abc*/  .byte 0x00
/*0x8abd*/  .byte 0x29
/*0x8abe*/  .byte 0xe7
/*0x8abf*/  .byte 0x81
/*0x8ac0*/  .byte 0x00
/*0x8ac1*/  .byte 0xc0
/*0x8ac2*/  .byte 0x00
/*0x8ac3*/  .byte 0x00
            data_8ac4:
/*0x8ac4*/  .byte 0x12
/*0x8ac5*/  .byte 0x01
/*0x8ac6*/  .byte 0x10
/*0x8ac7*/  .byte 0x01
/*0x8ac8*/  .byte 0x00
/*0x8ac9*/  .byte 0x00
/*0x8aca*/  .byte 0x00
/*0x8acb*/  .byte 0x40
/*0x8acc*/  .byte 0xd9
/*0x8acd*/  .byte 0x04
/*0x8ace*/  .byte 0x41
/*0x8acf*/  .byte 0x01
/*0x8ad0*/  .byte 0x17
/*0x8ad1*/  .byte 0x01
/*0x8ad2*/  .byte 0x00
/*0x8ad3*/  .byte 0x02
/*0x8ad4*/  .byte 0x00
/*0x8ad5*/  .byte 0x01
/*0x8ad6*/  .byte 0x00
/*0x8ad7*/  .byte 0x00
/*0x8ad8*/  .byte 0x09
/*0x8ad9*/  .byte 0x02
/*0x8ada*/  .byte 0x5b
/*0x8adb*/  .byte 0x00
/*0x8adc*/  .byte 0x03
/*0x8add*/  .byte 0x01
/*0x8ade*/  .byte 0x00
/*0x8adf*/  .byte 0xa0
/*0x8ae0*/  .byte 0x32
/*0x8ae1*/  .byte 0x09
/*0x8ae2*/  .byte 0x04
/*0x8ae3*/  .byte 0x00
/*0x8ae4*/  .byte 0x00
/*0x8ae5*/  .byte 0x01
/*0x8ae6*/  .byte 0x03
/*0x8ae7*/  .byte 0x01
/*0x8ae8*/  .byte 0x01
/*0x8ae9*/  .byte 0x00
/*0x8aea*/  .byte 0x09
/*0x8aeb*/  .byte 0x21
/*0x8aec*/  .byte 0x11
/*0x8aed*/  .byte 0x01
/*0x8aee*/  .byte 0x00
/*0x8aef*/  .byte 0x01
/*0x8af0*/  .byte 0x22
/*0x8af1*/  .byte 0x40
/*0x8af2*/  .byte 0x00
/*0x8af3*/  .byte 0x07
/*0x8af4*/  .byte 0x05
/*0x8af5*/  .byte 0x81
/*0x8af6*/  .byte 0x03
/*0x8af7*/  .byte 0x08
/*0x8af8*/  .byte 0x00
/*0x8af9*/  .byte 0x01
/*0x8afa*/  .byte 0x09
/*0x8afb*/  .byte 0x04
/*0x8afc*/  .byte 0x01
/*0x8afd*/  .byte 0x00
/*0x8afe*/  .byte 0x02
/*0x8aff*/  .byte 0x03
/*0x8b00*/  .byte 0x00
/*0x8b01*/  .byte 0x00
/*0x8b02*/  .byte 0x00
/*0x8b03*/  .byte 0x09
/*0x8b04*/  .byte 0x21
/*0x8b05*/  .byte 0x11
/*0x8b06*/  .byte 0x01
/*0x8b07*/  .byte 0x00
/*0x8b08*/  .byte 0x01
/*0x8b09*/  .byte 0x22
/*0x8b0a*/  .byte 0x22
/*0x8b0b*/  .byte 0x00
/*0x8b0c*/  .byte 0x07
/*0x8b0d*/  .byte 0x05
/*0x8b0e*/  .byte 0x83
/*0x8b0f*/  .byte 0x03
/*0x8b10*/  .byte 0x40
/*0x8b11*/  .byte 0x00
/*0x8b12*/  .byte 0x01
/*0x8b13*/  .byte 0x07
/*0x8b14*/  .byte 0x05
/*0x8b15*/  .byte 0x04
/*0x8b16*/  .byte 0x03
/*0x8b17*/  .byte 0x40
/*0x8b18*/  .byte 0x00
/*0x8b19*/  .byte 0x01
/*0x8b1a*/  .byte 0x09
/*0x8b1b*/  .byte 0x04
/*0x8b1c*/  .byte 0x02
/*0x8b1d*/  .byte 0x00
/*0x8b1e*/  .byte 0x01
/*0x8b1f*/  .byte 0x03
/*0x8b20*/  .byte 0x00
/*0x8b21*/  .byte 0x00
/*0x8b22*/  .byte 0x00
/*0x8b23*/  .byte 0x09
/*0x8b24*/  .byte 0x21
/*0x8b25*/  .byte 0x11
/*0x8b26*/  .byte 0x01
/*0x8b27*/  .byte 0x00
/*0x8b28*/  .byte 0x01
/*0x8b29*/  .byte 0x22
/*0x8b2a*/  .byte 0xc6
/*0x8b2b*/  .byte 0x00
/*0x8b2c*/  .byte 0x07
/*0x8b2d*/  .byte 0x05
/*0x8b2e*/  .byte 0x82
/*0x8b2f*/  .byte 0x03
/*0x8b30*/  .byte 0x40
/*0x8b31*/  .byte 0x00
/*0x8b32*/  .byte 0x01
/*0x8b33*/  .byte 0x00
            usb_str0_desc:
/*0x8b34*/  .byte 0x04
/*0x8b35*/  .byte 0x03
/*0x8b36*/  .byte 0x09
/*0x8b37*/  .byte 0x04
            usb_str1_desc:
/*0x8b38*/  .byte 0x1a
/*0x8b39*/  .byte 0x03
/*0x8b3a*/  .byte 0x55
/*0x8b3b*/  .byte 0x00
/*0x8b3c*/  .byte 0x53
/*0x8b3d*/  .byte 0x00
/*0x8b3e*/  .byte 0x42
/*0x8b3f*/  .byte 0x00
/*0x8b40*/  .byte 0x20
/*0x8b41*/  .byte 0x00
/*0x8b42*/  .byte 0x4b
/*0x8b43*/  .byte 0x00
/*0x8b44*/  .byte 0x65
/*0x8b45*/  .byte 0x00
/*0x8b46*/  .byte 0x79
/*0x8b47*/  .byte 0x00
/*0x8b48*/  .byte 0x62
/*0x8b49*/  .byte 0x00
/*0x8b4a*/  .byte 0x6f
/*0x8b4b*/  .byte 0x00
/*0x8b4c*/  .byte 0x61
/*0x8b4d*/  .byte 0x00
/*0x8b4e*/  .byte 0x72
/*0x8b4f*/  .byte 0x00
/*0x8b50*/  .byte 0x64
/*0x8b51*/  .byte 0x00
/*0x8b52*/  .byte 0x00
/*0x8b53*/  .byte 0x00

            data_8b54:
/*0x8b54*/  .word loc_7178
/*0x8b58*/  .word loc_71b8
/*0x8b5c*/  .word loc_7158
/*0x8b60*/  .word loc_729c
/*0x8b64*/  .word loc_3068
/*0x8b68*/  .word loc_7154
/*0x8b6c*/  .word loc_5970

            data_8b70:
/*0x8b70*/  .byte 0x3e
/*0x8b71*/  .byte 0x47
/*0x8b72*/  .byte 0x45
/*0x8b73*/  .byte 0x44
/*0x8b74*/  .byte 0x52
/*0x8b75*/  .byte 0x4f
/*0x8b76*/  .byte 0x51
/*0x8b77*/  .byte 0x50
/*0x8b78*/  .byte 0x00
/*0x8b79*/  .byte 0x00
/*0x8b7a*/  .byte 0x00
/*0x8b7b*/  .byte 0x00
/*0x8b7c*/  .byte 0x00
/*0x8b7d*/  .byte 0x00
/*0x8b7e*/  .byte 0x00
/*0x8b7f*/  .byte 0x01
/*0x8b80*/  .byte 0x02
/*0x8b81*/  .byte 0x03
/*0x8b82*/  .byte 0x04
/*0x8b83*/  .byte 0x05
/*0x8b84*/  .byte 0x06
/*0x8b85*/  .byte 0x07
/*0x8b86*/  .byte 0x07
/*0x8b87*/  .byte 0x00
/*0x8b88*/  .byte 0x00
/*0x8b89*/  .byte 0x00
/*0x8b8a*/  .byte 0x00
/*0x8b8b*/  .byte 0x00
/*0x8b8c*/  .byte 0x00
/*0x8b8d*/  .byte 0x00
/*0x8b8e*/  .byte 0x04
/*0x8b8f*/  .byte 0x04
/*0x8b90*/  .byte 0x04
/*0x8b91*/  .byte 0x04
/*0x8b92*/  .byte 0x05
/*0x8b93*/  .byte 0x04
/*0x8b94*/  .byte 0x01
/*0x8b95*/  .byte 0x05
/*0x8b96*/  .byte 0x05
/*0x8b97*/  .byte 0x05
/*0x8b98*/  .byte 0x05
/*0x8b99*/  .byte 0x06
/*0x8b9a*/  .byte 0x02
/*0x8b9b*/  .byte 0x06
/*0x8b9c*/  .byte 0x06
/*0x8b9d*/  .byte 0x06
/*0x8b9e*/  .byte 0x06
/*0x8b9f*/  .byte 0x03
/*0x8ba0*/  .byte 0x03
/*0x8ba1*/  .byte 0x07
/*0x8ba2*/  .byte 0x07
/*0x8ba3*/  .byte 0x07
/*0x8ba4*/  .byte 0x02
/*0x8ba5*/  .byte 0x00
/*0x8ba6*/  .byte 0x01
/*0x8ba7*/  .byte 0x03
/*0x8ba8*/  .byte 0x08
/*0x8ba9*/  .byte 0x02
/*0x8baa*/  .byte 0x02
/*0x8bab*/  .byte 0x02
/*0x8bac*/  .byte 0x01
/*0x8bad*/  .byte 0x01
/*0x8bae*/  .byte 0x01
/*0x8baf*/  .byte 0x03
/*0x8bb0*/  .byte 0x03
/*0x8bb1*/  .byte 0x03
            data_8bb2:
/*0x8bb2*/  .byte 0x07
/*0x8bb3*/  .byte 0x01
/*0x8bb4*/  .byte 0x02
/*0x8bb5*/  .byte 0x03
/*0x8bb6*/  .byte 0x04
/*0x8bb7*/  .byte 0x05
/*0x8bb8*/  .byte 0x06
/*0x8bb9*/  .byte 0x07
/*0x8bba*/  .byte 0x03
/*0x8bbb*/  .byte 0x04
/*0x8bbc*/  .byte 0x05
/*0x8bbd*/  .byte 0x06
/*0x8bbe*/  .byte 0x02
/*0x8bbf*/  .byte 0x07
/*0x8bc0*/  .byte 0x07
/*0x8bc1*/  .byte 0x03
/*0x8bc2*/  .byte 0x04
/*0x8bc3*/  .byte 0x05
/*0x8bc4*/  .byte 0x06
/*0x8bc5*/  .byte 0x02
/*0x8bc6*/  .byte 0x07
/*0x8bc7*/  .byte 0x03
/*0x8bc8*/  .byte 0x04
/*0x8bc9*/  .byte 0x05
/*0x8bca*/  .byte 0x06
/*0x8bcb*/  .byte 0x01
/*0x8bcc*/  .byte 0x06
/*0x8bcd*/  .byte 0x03
/*0x8bce*/  .byte 0x04
/*0x8bcf*/  .byte 0x05
/*0x8bd0*/  .byte 0x06
/*0x8bd1*/  .byte 0x00
/*0x8bd2*/  .byte 0x06
/*0x8bd3*/  .byte 0x07
/*0x8bd4*/  .byte 0x07
/*0x8bd5*/  .byte 0x02
/*0x8bd6*/  .byte 0x03
/*0x8bd7*/  .byte 0x04
/*0x8bd8*/  .byte 0x01
/*0x8bd9*/  .byte 0x02
/*0x8bda*/  .byte 0x03
/*0x8bdb*/  .byte 0x02
/*0x8bdc*/  .byte 0x03
/*0x8bdd*/  .byte 0x04
/*0x8bde*/  .byte 0x29
/*0x8bdf*/  .byte 0x3a
/*0x8be0*/  .byte 0x3b
/*0x8be1*/  .byte 0x3c
/*0x8be2*/  .byte 0x3d
/*0x8be3*/  .byte 0x3e
/*0x8be4*/  .byte 0x3f
/*0x8be5*/  .byte 0x40
/*0x8be6*/  .byte 0x41
/*0x8be7*/  .byte 0x42
/*0x8be8*/  .byte 0x43
/*0x8be9*/  .byte 0x44
/*0x8bea*/  .byte 0x45
/*0x8beb*/  .byte 0x4c
/*0x8bec*/  .byte 0x4b
/*0x8bed*/  .byte 0x52
/*0x8bee*/  .byte 0x4e
/*0x8bef*/  .byte 0x46
/*0x8bf0*/  .byte 0x47
/*0x8bf1*/  .byte 0x48
/*0x8bf2*/  .byte 0x50
/*0x8bf3*/  .byte 0x51
/*0x8bf4*/  .byte 0x4f
/*0x8bf5*/  .byte 0x49
/*0x8bf6*/  .byte 0x4c
/*0x8bf7*/  .byte 0x65
/*0x8bf8*/  .byte 0x4d
/*0x8bf9*/  .byte 0xc1
/*0x8bfa*/  .byte 0xc2
/*0x8bfb*/  .byte 0xc3
/*0x8bfc*/  .byte 0x4a
/*0x8bfd*/  .byte 0x35
/*0x8bfe*/  .byte 0xee
/*0x8bff*/  .byte 0xc0
/*0x8c00*/  .byte 0xe4
/*0x8c01*/  .byte 0xf5
/*0x8c02*/  .byte 0xf6
/*0x8c03*/  .byte 0xf4
/*0x8c04*/  .byte 0xf2
/*0x8c05*/  .byte 0xf0
/*0x8c06*/  .byte 0xf3
/*0x8c07*/  .byte 0xc5
/*0x8c08*/  .byte 0xc6
/*0x8c09*/  .byte 0xc4
/*0x8c0a*/  .byte 0x29
/*0x8c0b*/  .byte 0x3a
/*0x8c0c*/  .byte 0x3b
/*0x8c0d*/  .byte 0x3c
/*0x8c0e*/  .byte 0x3d
/*0x8c0f*/  .byte 0x3e
/*0x8c10*/  .byte 0x3f
/*0x8c11*/  .byte 0x40
/*0x8c12*/  .byte 0x41
/*0x8c13*/  .byte 0x42
/*0x8c14*/  .byte 0x43
/*0x8c15*/  .byte 0x44
/*0x8c16*/  .byte 0x45
/*0x8c17*/  .byte 0x4c
/*0x8c18*/  .byte 0x4b
/*0x8c19*/  .byte 0x52
/*0x8c1a*/  .byte 0x4e
/*0x8c1b*/  .byte 0x46
/*0x8c1c*/  .byte 0x47
/*0x8c1d*/  .byte 0x48
/*0x8c1e*/  .byte 0x50
/*0x8c1f*/  .byte 0x51
/*0x8c20*/  .byte 0x4f
/*0x8c21*/  .byte 0x49
/*0x8c22*/  .byte 0x4c
/*0x8c23*/  .byte 0x65
/*0x8c24*/  .byte 0x4d
/*0x8c25*/  .byte 0x00
/*0x8c26*/  .byte 0x00
/*0x8c27*/  .byte 0x00
/*0x8c28*/  .byte 0x4a
/*0x8c29*/  .byte 0x35
/*0x8c2a*/  .byte 0xee
/*0x8c2b*/  .byte 0x00
/*0x8c2c*/  .byte 0x00
/*0x8c2d*/  .byte 0xf5
/*0x8c2e*/  .byte 0xf6
/*0x8c2f*/  .byte 0xf4
/*0x8c30*/  .byte 0xf2
/*0x8c31*/  .byte 0xf0
/*0x8c32*/  .byte 0xf3
/*0x8c33*/  .byte 0x00
/*0x8c34*/  .byte 0x00
/*0x8c35*/  .byte 0x00
            data_8c36:
/*0x8c36*/  .byte 0x07
/*0x8c37*/  .byte 0x00
/*0x8c38*/  .byte 0x00
/*0x8c39*/  .byte 0x00
/*0x8c3a*/  .byte 0x00
/*0x8c3b*/  .byte 0x00
/*0x8c3c*/  .byte 0x00
/*0x8c3d*/  .byte 0x00
/*0x8c3e*/  .byte 0x04
/*0x8c3f*/  .byte 0x04
/*0x8c40*/  .byte 0x04
/*0x8c41*/  .byte 0x04
/*0x8c42*/  .byte 0x05
/*0x8c43*/  .byte 0x04
/*0x8c44*/  .byte 0x01
/*0x8c45*/  .byte 0x05
/*0x8c46*/  .byte 0x05
/*0x8c47*/  .byte 0x05
/*0x8c48*/  .byte 0x05
/*0x8c49*/  .byte 0x06
/*0x8c4a*/  .byte 0x02
/*0x8c4b*/  .byte 0x06
/*0x8c4c*/  .byte 0x06
/*0x8c4d*/  .byte 0x06
/*0x8c4e*/  .byte 0x06
/*0x8c4f*/  .byte 0x03
/*0x8c50*/  .byte 0x03
/*0x8c51*/  .byte 0x02
/*0x8c52*/  .byte 0x00
/*0x8c53*/  .byte 0x01
/*0x8c54*/  .byte 0x01
/*0x8c55*/  .byte 0x02
/*0x8c56*/  .byte 0x03
/*0x8c57*/  .byte 0x02
/*0x8c58*/  .byte 0x02
/*0x8c59*/  .byte 0x02
/*0x8c5a*/  .byte 0x01
/*0x8c5b*/  .byte 0x01
/*0x8c5c*/  .byte 0x01
/*0x8c5d*/  .byte 0x03
/*0x8c5e*/  .byte 0x03
/*0x8c5f*/  .byte 0x03
/*0x8c60*/  .byte 0x07
/*0x8c61*/  .byte 0x01
/*0x8c62*/  .byte 0x02
/*0x8c63*/  .byte 0x03
/*0x8c64*/  .byte 0x04
/*0x8c65*/  .byte 0x05
/*0x8c66*/  .byte 0x06
/*0x8c67*/  .byte 0x07
/*0x8c68*/  .byte 0x03
/*0x8c69*/  .byte 0x04
/*0x8c6a*/  .byte 0x05
/*0x8c6b*/  .byte 0x06
/*0x8c6c*/  .byte 0x02
/*0x8c6d*/  .byte 0x07
/*0x8c6e*/  .byte 0x07
/*0x8c6f*/  .byte 0x03
/*0x8c70*/  .byte 0x04
/*0x8c71*/  .byte 0x05
/*0x8c72*/  .byte 0x06
/*0x8c73*/  .byte 0x02
/*0x8c74*/  .byte 0x07
/*0x8c75*/  .byte 0x03
/*0x8c76*/  .byte 0x04
/*0x8c77*/  .byte 0x05
/*0x8c78*/  .byte 0x06
/*0x8c79*/  .byte 0x01
/*0x8c7a*/  .byte 0x06
/*0x8c7b*/  .byte 0x06
/*0x8c7c*/  .byte 0x00
/*0x8c7d*/  .byte 0x06
/*0x8c7e*/  .byte 0x05
/*0x8c7f*/  .byte 0x05
/*0x8c80*/  .byte 0x05
/*0x8c81*/  .byte 0x02
/*0x8c82*/  .byte 0x03
/*0x8c83*/  .byte 0x04
/*0x8c84*/  .byte 0x01
/*0x8c85*/  .byte 0x02
/*0x8c86*/  .byte 0x03
/*0x8c87*/  .byte 0x02
/*0x8c88*/  .byte 0x03
/*0x8c89*/  .byte 0x04
/*0x8c8a*/  .byte 0x29
/*0x8c8b*/  .byte 0x3a
/*0x8c8c*/  .byte 0x3b
/*0x8c8d*/  .byte 0x3c
/*0x8c8e*/  .byte 0x3d
/*0x8c8f*/  .byte 0x3e
/*0x8c90*/  .byte 0x3f
/*0x8c91*/  .byte 0x40
/*0x8c92*/  .byte 0x41
/*0x8c93*/  .byte 0x42
/*0x8c94*/  .byte 0x43
/*0x8c95*/  .byte 0x44
/*0x8c96*/  .byte 0x45
/*0x8c97*/  .byte 0x4c
/*0x8c98*/  .byte 0x4b
/*0x8c99*/  .byte 0x52
/*0x8c9a*/  .byte 0x4e
/*0x8c9b*/  .byte 0x46
/*0x8c9c*/  .byte 0x47
/*0x8c9d*/  .byte 0x48
/*0x8c9e*/  .byte 0x50
/*0x8c9f*/  .byte 0x51
/*0x8ca0*/  .byte 0x4f
/*0x8ca1*/  .byte 0x49
/*0x8ca2*/  .byte 0x4c
/*0x8ca3*/  .byte 0x65
/*0x8ca4*/  .byte 0x4d
/*0x8ca5*/  .byte 0x4a
/*0x8ca6*/  .byte 0x35
/*0x8ca7*/  .byte 0xee
/*0x8ca8*/  .byte 0x17
/*0x8ca9*/  .byte 0x0a
/*0x8caa*/  .byte 0x05
/*0x8cab*/  .byte 0xf5
/*0x8cac*/  .byte 0xf6
/*0x8cad*/  .byte 0xf4
/*0x8cae*/  .byte 0xf2
/*0x8caf*/  .byte 0xf0
/*0x8cb0*/  .byte 0xf3
/*0x8cb1*/  .byte 0xc5
/*0x8cb2*/  .byte 0xc6
/*0x8cb3*/  .byte 0xc4
/*0x8cb4*/  .byte 0x29
/*0x8cb5*/  .byte 0x3a
/*0x8cb6*/  .byte 0x3b
/*0x8cb7*/  .byte 0x3c
/*0x8cb8*/  .byte 0x3d
/*0x8cb9*/  .byte 0x3e
/*0x8cba*/  .byte 0x3f
/*0x8cbb*/  .byte 0x40
/*0x8cbc*/  .byte 0x41
/*0x8cbd*/  .byte 0x42
/*0x8cbe*/  .byte 0x43
/*0x8cbf*/  .byte 0x44
/*0x8cc0*/  .byte 0x45
/*0x8cc1*/  .byte 0x4c
/*0x8cc2*/  .byte 0x4b
/*0x8cc3*/  .byte 0x52
/*0x8cc4*/  .byte 0x4e
/*0x8cc5*/  .byte 0x46
/*0x8cc6*/  .byte 0x47
/*0x8cc7*/  .byte 0x48
/*0x8cc8*/  .byte 0x50
/*0x8cc9*/  .byte 0x51
/*0x8cca*/  .byte 0x4f
/*0x8ccb*/  .byte 0x49
/*0x8ccc*/  .byte 0x4c
/*0x8ccd*/  .byte 0x65
/*0x8cce*/  .byte 0x4d
/*0x8ccf*/  .byte 0x4a
/*0x8cd0*/  .byte 0x35
/*0x8cd1*/  .byte 0xee
/*0x8cd2*/  .byte 0x00
/*0x8cd3*/  .byte 0x00
/*0x8cd4*/  .byte 0x00
/*0x8cd5*/  .byte 0xf5
/*0x8cd6*/  .byte 0xf6
/*0x8cd7*/  .byte 0xf4
/*0x8cd8*/  .byte 0xf2
/*0x8cd9*/  .byte 0xf0
/*0x8cda*/  .byte 0xf3
/*0x8cdb*/  .byte 0x00
/*0x8cdc*/  .byte 0x00
/*0x8cdd*/  .byte 0x00
/*0x8cde*/  .byte 0x01
/*0x8cdf*/  .byte 0x00
/*0x8ce0*/  .byte 0x00
/*0x8ce1*/  .byte 0x00
/*0x8ce2*/  .byte 0x00
/*0x8ce3*/  .byte 0x00
/*0x8ce4*/  .byte 0x00
/*0x8ce5*/  .byte 0x00
/*0x8ce6*/  .byte 0x00
/*0x8ce7*/  .byte 0x01
/*0x8ce8*/  .byte 0x00
/*0x8ce9*/  .byte 0x00
/*0x8cea*/  .byte 0x00
/*0x8ceb*/  .byte 0x00
/*0x8cec*/  .byte 0x00
/*0x8ced*/  .byte 0x00
/*0x8cee*/  .byte 0x01
/*0x8cef*/  .byte 0x00
/*0x8cf0*/  .byte 0x00
/*0x8cf1*/  .byte 0x00
/*0x8cf2*/  .byte 0x00
/*0x8cf3*/  .byte 0x00
/*0x8cf4*/  .byte 0x00
/*0x8cf5*/  .byte 0x00
/*0x8cf6*/  .byte 0x00
/*0x8cf7*/  .byte 0x00
/*0x8cf8*/  .byte 0x00
/*0x8cf9*/  .byte 0x00
/*0x8cfa*/  .byte 0x00
/*0x8cfb*/  .byte 0x00
/*0x8cfc*/  .byte 0x00
/*0x8cfd*/  .byte 0x01
/*0x8cfe*/  .byte 0x00
/*0x8cff*/  .byte 0x00
/*0x8d00*/  .byte 0x00
/*0x8d01*/  .byte 0x00
/*0x8d02*/  .byte 0x00
/*0x8d03*/  .byte 0x00
/*0x8d04*/  .byte 0x00
/*0x8d05*/  .byte 0x01
/*0x8d06*/  .byte 0x00
/*0x8d07*/  .byte 0x00
/*0x8d08*/  .byte 0x00
/*0x8d09*/  .byte 0x00
/*0x8d0a*/  .byte 0x00
/*0x8d0b*/  .byte 0x00
/*0x8d0c*/  .byte 0x00
/*0x8d0d*/  .byte 0x00
/*0x8d0e*/  .byte 0x00
/*0x8d0f*/  .byte 0x00
/*0x8d10*/  .byte 0x00
/*0x8d11*/  .byte 0x00
/*0x8d12*/  .byte 0x00
/*0x8d13*/  .byte 0x00
/*0x8d14*/  .byte 0x00
/*0x8d15*/  .byte 0x00
/*0x8d16*/  .byte 0x00
/*0x8d17*/  .byte 0x00
/*0x8d18*/  .byte 0x00
/*0x8d19*/  .byte 0x00
/*0x8d1a*/  .byte 0x00
/*0x8d1b*/  .byte 0x00
/*0x8d1c*/  .byte 0x00
/*0x8d1d*/  .byte 0x00
/*0x8d1e*/  .byte 0x00
/*0x8d1f*/  .byte 0x00
/*0x8d20*/  .byte 0x00
/*0x8d21*/  .byte 0x00
/*0x8d22*/  .byte 0x00
/*0x8d23*/  .byte 0x00
/*0x8d24*/  .byte 0x00
/*0x8d25*/  .byte 0x00
/*0x8d26*/  .byte 0x07
/*0x8d27*/  .byte 0x01
/*0x8d28*/  .byte 0x02
/*0x8d29*/  .byte 0x03
/*0x8d2a*/  .byte 0x04
/*0x8d2b*/  .byte 0x05
/*0x8d2c*/  .byte 0x06
/*0x8d2d*/  .byte 0x07
/*0x8d2e*/  .byte 0x03
/*0x8d2f*/  .byte 0x04
/*0x8d30*/  .byte 0x05
/*0x8d31*/  .byte 0x06
/*0x8d32*/  .byte 0x02
/*0x8d33*/  .byte 0x07
            data_8d34:
/*0x8d34*/  .byte 0x07
/*0x8d35*/  .byte 0x00
/*0x8d36*/  .byte 0x00
/*0x8d37*/  .byte 0x00
/*0x8d38*/  .byte 0x00
/*0x8d39*/  .byte 0x00
/*0x8d3a*/  .byte 0x00
/*0x8d3b*/  .byte 0x00
/*0x8d3c*/  .byte 0x04
/*0x8d3d*/  .byte 0x04
/*0x8d3e*/  .byte 0x04
/*0x8d3f*/  .byte 0x04
/*0x8d40*/  .byte 0x05
/*0x8d41*/  .byte 0x04
/*0x8d42*/  .byte 0x00
/*0x8d43*/  .byte 0x00
            data_8d44:
/*0x8d44*/  .byte 0x00
/*0x8d45*/  .byte 0x00
/*0x8d46*/  .byte 0x00
/*0x8d47*/  .byte 0x00
/*0x8d48*/  .byte 0x00
/*0x8d49*/  .byte 0x20
/*0x8d4a*/  .byte 0x02
/*0x8d4b*/  .byte 0x00
/*0x8d4c*/  .byte 0x00
/*0x8d4d*/  .byte 0x40
/*0x8d4e*/  .byte 0x04
/*0x8d4f*/  .byte 0x00
            data_8d50:
/*0x8d50*/  .byte 0x00
/*0x8d51*/  .byte 0x10
/*0x8d52*/  .byte 0x00
/*0x8d53*/  .byte 0x00
/*0x8d54*/  .byte 0x00
/*0x8d55*/  .byte 0x18
/*0x8d56*/  .byte 0x00
/*0x8d57*/  .byte 0x00
/*0x8d58*/  .byte 0x00
/*0x8d59*/  .byte 0x20
/*0x8d5a*/  .byte 0x00
/*0x8d5b*/  .byte 0x00
/*0x8d5c*/  .byte 0x00
/*0x8d5d*/  .byte 0x70
/*0x8d5e*/  .byte 0x00
/*0x8d5f*/  .byte 0x00
/*0x8d60*/  .byte 0x00
/*0x8d61*/  .byte 0xc0
/*0x8d62*/  .byte 0x00
/*0x8d63*/  .byte 0x00
/*0x8d64*/  .byte 0x00
/*0x8d65*/  .byte 0xc8
/*0x8d66*/  .byte 0x00
/*0x8d67*/  .byte 0x00
/*0x8d68*/  .byte 0x00
/*0x8d69*/  .byte 0xd0
/*0x8d6a*/  .byte 0x00
/*0x8d6b*/  .byte 0x00
/*0x8d6c*/  .byte 0x00
/*0x8d6d*/  .byte 0x20
/*0x8d6e*/  .byte 0x01
/*0x8d6f*/  .byte 0x00
/*0x8d70*/  .byte 0x00
/*0x8d71*/  .byte 0x70
/*0x8d72*/  .byte 0x01
/*0x8d73*/  .byte 0x00
/*0x8d74*/  .byte 0x00
/*0x8d75*/  .byte 0x78
/*0x8d76*/  .byte 0x01
/*0x8d77*/  .byte 0x00
/*0x8d78*/  .byte 0x00
/*0x8d79*/  .byte 0x80
/*0x8d7a*/  .byte 0x01
/*0x8d7b*/  .byte 0x00
/*0x8d7c*/  .byte 0x00
/*0x8d7d*/  .byte 0xd0
/*0x8d7e*/  .byte 0x01
/*0x8d7f*/  .byte 0x00
/*0x8d80*/  .byte 0x00
/*0x8d81*/  .byte 0x30
/*0x8d82*/  .byte 0x02
/*0x8d83*/  .byte 0x00
/*0x8d84*/  .byte 0x00
/*0x8d85*/  .byte 0x38
/*0x8d86*/  .byte 0x02
/*0x8d87*/  .byte 0x00
/*0x8d88*/  .byte 0x00
/*0x8d89*/  .byte 0x40
/*0x8d8a*/  .byte 0x02
/*0x8d8b*/  .byte 0x00
/*0x8d8c*/  .byte 0x00
/*0x8d8d*/  .byte 0x90
/*0x8d8e*/  .byte 0x02
/*0x8d8f*/  .byte 0x00
/*0x8d90*/  .byte 0x00
/*0x8d91*/  .byte 0xe0
/*0x8d92*/  .byte 0x02
/*0x8d93*/  .byte 0x00
/*0x8d94*/  .byte 0x00
/*0x8d95*/  .byte 0xe8
/*0x8d96*/  .byte 0x02
/*0x8d97*/  .byte 0x00
/*0x8d98*/  .byte 0x00
/*0x8d99*/  .byte 0xf0
/*0x8d9a*/  .byte 0x02
/*0x8d9b*/  .byte 0x00
/*0x8d9c*/  .byte 0x00
/*0x8d9d*/  .byte 0x40
/*0x8d9e*/  .byte 0x03
/*0x8d9f*/  .byte 0x00
/*0x8da0*/  .byte 0x00
/*0x8da1*/  .byte 0x90
/*0x8da2*/  .byte 0x03
/*0x8da3*/  .byte 0x00
/*0x8da4*/  .byte 0x00
/*0x8da5*/  .byte 0x98
/*0x8da6*/  .byte 0x03
/*0x8da7*/  .byte 0x00
/*0x8da8*/  .byte 0x00
/*0x8da9*/  .byte 0xa0
/*0x8daa*/  .byte 0x03
/*0x8dab*/  .byte 0x00
/*0x8dac*/  .byte 0x00
/*0x8dad*/  .byte 0xf0
/*0x8dae*/  .byte 0x03
/*0x8daf*/  .byte 0x00
/*0x8db0*/  .byte 0x00
/*0x8db1*/  .byte 0x50
/*0x8db2*/  .byte 0x04
/*0x8db3*/  .byte 0x00
/*0x8db4*/  .byte 0x00
/*0x8db5*/  .byte 0x58
/*0x8db6*/  .byte 0x04
/*0x8db7*/  .byte 0x00
/*0x8db8*/  .byte 0x00
/*0x8db9*/  .byte 0x60
/*0x8dba*/  .byte 0x04
/*0x8dbb*/  .byte 0x00
/*0x8dbc*/  .byte 0x00
/*0x8dbd*/  .byte 0xb0
/*0x8dbe*/  .byte 0x04
/*0x8dbf*/  .byte 0x00
/*0x8dc0*/  .byte 0x00
/*0x8dc1*/  .byte 0x00
/*0x8dc2*/  .byte 0x05
/*0x8dc3*/  .byte 0x00
/*0x8dc4*/  .byte 0x00
/*0x8dc5*/  .byte 0x08
/*0x8dc6*/  .byte 0x05
/*0x8dc7*/  .byte 0x00
/*0x8dc8*/  .byte 0x00
/*0x8dc9*/  .byte 0x10
/*0x8dca*/  .byte 0x05
/*0x8dcb*/  .byte 0x00
/*0x8dcc*/  .byte 0x00
/*0x8dcd*/  .byte 0x60
/*0x8dce*/  .byte 0x05
/*0x8dcf*/  .byte 0x00
/*0x8dd0*/  .byte 0x00
/*0x8dd1*/  .byte 0xb0
/*0x8dd2*/  .byte 0x05
/*0x8dd3*/  .byte 0x00
/*0x8dd4*/  .byte 0x00
/*0x8dd5*/  .byte 0xb8
/*0x8dd6*/  .byte 0x05
/*0x8dd7*/  .byte 0x00
/*0x8dd8*/  .byte 0x00
/*0x8dd9*/  .byte 0xc0
/*0x8dda*/  .byte 0x05
/*0x8ddb*/  .byte 0x00
/*0x8ddc*/  .byte 0x00
/*0x8ddd*/  .byte 0x10
/*0x8dde*/  .byte 0x06
/*0x8ddf*/  .byte 0x00
            data_8de0:
/*0x8de0*/  .byte 0x00
/*0x8de1*/  .byte 0x00
/*0x8de2*/  .byte 0x00
/*0x8de3*/  .byte 0x00
/*0x8de4*/  .byte 0x00
/*0x8de5*/  .byte 0x04
/*0x8de6*/  .byte 0x00
/*0x8de7*/  .byte 0x00
/*0x8de8*/  .byte 0x00
/*0x8de9*/  .byte 0x08
/*0x8dea*/  .byte 0x00
/*0x8deb*/  .byte 0x00
/*0x8dec*/  .byte 0x00
/*0x8ded*/  .byte 0x0c
/*0x8dee*/  .byte 0x00
/*0x8def*/  .byte 0x00
/*0x8df0*/  .byte 0x01
/*0x8df1*/  .byte 0x01
/*0x8df2*/  .byte 0x01
/*0x8df3*/  .byte 0x01
/*0x8df4*/  .byte 0x01
/*0x8df5*/  .byte 0x01
/*0x8df6*/  .byte 0x01
/*0x8df7*/  .byte 0x01
/*0x8df8*/  .byte 0x00
/*0x8df9*/  .byte 0x01
/*0x8dfa*/  .byte 0x01
/*0x8dfb*/  .byte 0x01
/*0x8dfc*/  .byte 0x01
/*0x8dfd*/  .byte 0x00
/*0x8dfe*/  .byte 0x01
/*0x8dff*/  .byte 0x01
/*0x8e00*/  .byte 0x00
/*0x8e01*/  .byte 0x01
/*0x8e02*/  .byte 0x01
/*0x8e03*/  .byte 0x01
/*0x8e04*/  .byte 0x01
/*0x8e05*/  .byte 0x00
/*0x8e06*/  .byte 0x00
/*0x8e07*/  .byte 0x01
/*0x8e08*/  .byte 0x00
/*0x8e09*/  .byte 0x00
/*0x8e0a*/  .byte 0x00
/*0x8e0b*/  .byte 0x00
/*0x8e0c*/  .byte 0x00
/*0x8e0d*/  .byte 0x00
/*0x8e0e*/  .byte 0x00
/*0x8e0f*/  .byte 0x01
/*0x8e10*/  .byte 0x00
/*0x8e11*/  .byte 0x00
/*0x8e12*/  .byte 0x01
/*0x8e13*/  .byte 0x01
/*0x8e14*/  .byte 0x01
/*0x8e15*/  .byte 0x01
/*0x8e16*/  .byte 0x01
/*0x8e17*/  .byte 0x01
/*0x8e18*/  .byte 0x00
/*0x8e19*/  .byte 0x00
/*0x8e1a*/  .byte 0x01
/*0x8e1b*/  .byte 0x01
/*0x8e1c*/  .byte 0x01
/*0x8e1d*/  .byte 0x01
/*0x8e1e*/  .byte 0x01
/*0x8e1f*/  .byte 0x01
/*0x8e20*/  .byte 0x00
/*0x8e21*/  .byte 0x00
/*0x8e22*/  .byte 0x01
/*0x8e23*/  .byte 0x01
/*0x8e24*/  .byte 0x01
/*0x8e25*/  .byte 0x01
/*0x8e26*/  .byte 0x01
/*0x8e27*/  .byte 0x00
/*0x8e28*/  .byte 0x00
/*0x8e29*/  .byte 0x00
/*0x8e2a*/  .byte 0x00
/*0x8e2b*/  .byte 0x01
/*0x8e2c*/  .byte 0x01
/*0x8e2d*/  .byte 0x01
/*0x8e2e*/  .byte 0x00
/*0x8e2f*/  .byte 0x00
/*0x8e30*/  .byte 0x00
/*0x8e31*/  .byte 0x00
/*0x8e32*/  .byte 0x01
/*0x8e33*/  .byte 0x01
/*0x8e34*/  .byte 0x00
/*0x8e35*/  .byte 0x00
/*0x8e36*/  .byte 0x00
/*0x8e37*/  .byte 0x00
/*0x8e38*/  .byte 0x00
/*0x8e39*/  .byte 0x00
/*0x8e3a*/  .byte 0x00
/*0x8e3b*/  .byte 0x00
/*0x8e3c*/  .byte 0x00
/*0x8e3d*/  .byte 0x00
/*0x8e3e*/  .byte 0x00
/*0x8e3f*/  .byte 0x00
/*0x8e40*/  .byte 0x00
/*0x8e41*/  .byte 0x00
/*0x8e42*/  .byte 0x00
/*0x8e43*/  .byte 0x00
/*0x8e44*/  .byte 0x00
/*0x8e45*/  .byte 0x00
/*0x8e46*/  .byte 0x00
/*0x8e47*/  .byte 0x00
/*0x8e48*/  .byte 0x00
/*0x8e49*/  .byte 0x00
/*0x8e4a*/  .byte 0x00
/*0x8e4b*/  .byte 0x00
/*0x8e4c*/  .byte 0x00
/*0x8e4d*/  .byte 0x01
/*0x8e4e*/  .byte 0x01
/*0x8e4f*/  .byte 0x00
/*0x8e50*/  .byte 0x00
/*0x8e51*/  .byte 0x01
/*0x8e52*/  .byte 0x01
/*0x8e53*/  .byte 0x01
/*0x8e54*/  .byte 0x01
/*0x8e55*/  .byte 0x01
/*0x8e56*/  .byte 0x01
/*0x8e57*/  .byte 0x00
/*0x8e58*/  .byte 0x00
/*0x8e59*/  .byte 0x00
/*0x8e5a*/  .byte 0x00
/*0x8e5b*/  .byte 0x00
/*0x8e5c*/  .byte 0x00
/*0x8e5d*/  .byte 0x00
/*0x8e5e*/  .byte 0x00
/*0x8e5f*/  .byte 0x00
/*0x8e60*/  .byte 0x00
/*0x8e61*/  .byte 0x01
/*0x8e62*/  .byte 0x00
/*0x8e63*/  .byte 0x00
/*0x8e64*/  .byte 0x00
/*0x8e65*/  .byte 0x00
/*0x8e66*/  .byte 0x00
/*0x8e67*/  .byte 0x00
/*0x8e68*/  .byte 0x00
/*0x8e69*/  .byte 0x00
/*0x8e6a*/  .byte 0x00
/*0x8e6b*/  .byte 0x00
/*0x8e6c*/  .byte 0x00
/*0x8e6d*/  .byte 0x00
/*0x8e6e*/  .byte 0x00
/*0x8e6f*/  .byte 0x00
/*0x8e70*/  .byte 0x00
/*0x8e71*/  .byte 0x00
/*0x8e72*/  .byte 0x00
/*0x8e73*/  .byte 0x00
/*0x8e74*/  .byte 0x00
/*0x8e75*/  .byte 0x00
/*0x8e76*/  .byte 0x00
/*0x8e77*/  .byte 0x00
/*0x8e78*/  .byte 0x00
/*0x8e79*/  .byte 0x00
/*0x8e7a*/  .byte 0x00
/*0x8e7b*/  .byte 0x00
/*0x8e7c*/  .byte 0x00
/*0x8e7d*/  .byte 0x00
/*0x8e7e*/  .byte 0x00
/*0x8e7f*/  .byte 0x00
            data_8e80:
/*0x8e80*/  .byte 0x01
/*0x8e81*/  .byte 0x02
/*0x8e82*/  .byte 0x03
/*0x8e83*/  .byte 0x04
/*0x8e84*/  .byte 0x05
/*0x8e85*/  .byte 0x06
/*0x8e86*/  .byte 0x07
/*0x8e87*/  .byte 0x08
/*0x8e88*/  .byte 0x1c
/*0x8e89*/  .byte 0x1b
/*0x8e8a*/  .byte 0x1a
/*0x8e8b*/  .byte 0x19
/*0x8e8c*/  .byte 0x18
/*0x8e8d*/  .byte 0x17
/*0x8e8e*/  .byte 0x16
/*0x8e8f*/  .byte 0x15
/*0x8e90*/  .byte 0x1d
/*0x8e91*/  .byte 0x1e
/*0x8e92*/  .byte 0x1f
/*0x8e93*/  .byte 0x20
/*0x8e94*/  .byte 0x21
/*0x8e95*/  .byte 0x22
/*0x8e96*/  .byte 0x23
/*0x8e97*/  .byte 0x24
/*0x8e98*/  .byte 0x35
/*0x8e99*/  .byte 0x34
/*0x8e9a*/  .byte 0x33
/*0x8e9b*/  .byte 0x32
/*0x8e9c*/  .byte 0x31
/*0x8e9d*/  .byte 0x30
/*0x8e9e*/  .byte 0x2f
/*0x8e9f*/  .byte 0x2e
/*0x8ea0*/  .byte 0x36
/*0x8ea1*/  .byte 0x37
/*0x8ea2*/  .byte 0x38
/*0x8ea3*/  .byte 0x09
/*0x8ea4*/  .byte 0x0a
/*0x8ea5*/  .byte 0x0b
/*0x8ea6*/  .byte 0x0c
/*0x8ea7*/  .byte 0x0e
/*0x8ea8*/  .byte 0x00
/*0x8ea9*/  .byte 0x00
/*0x8eaa*/  .byte 0x0d
/*0x8eab*/  .byte 0x14
/*0x8eac*/  .byte 0x13
/*0x8ead*/  .byte 0x12
/*0x8eae*/  .byte 0x11
/*0x8eaf*/  .byte 0x0f
/*0x8eb0*/  .byte 0x00
/*0x8eb1*/  .byte 0x00
/*0x8eb2*/  .byte 0x10
/*0x8eb3*/  .byte 0x25
/*0x8eb4*/  .byte 0x26
/*0x8eb5*/  .byte 0x27
/*0x8eb6*/  .byte 0x28
/*0x8eb7*/  .byte 0x29
/*0x8eb8*/  .byte 0x00
/*0x8eb9*/  .byte 0x39
/*0x8eba*/  .byte 0x3b
/*0x8ebb*/  .byte 0x2d
/*0x8ebc*/  .byte 0x2c
/*0x8ebd*/  .byte 0x2b
/*0x8ebe*/  .byte 0x2a
/*0x8ebf*/  .byte 0x00
/*0x8ec0*/  .byte 0x00
/*0x8ec1*/  .byte 0x00
/*0x8ec2*/  .byte 0x3c
/*0x8ec3*/  .byte 0x3e
/*0x8ec4*/  .byte 0x3f
/*0x8ec5*/  .byte 0x40
/*0x8ec6*/  .byte 0x00
/*0x8ec7*/  .byte 0x41
            data_8ec8:
/*0x8ec8*/  .byte 0x29
/*0x8ec9*/  .byte 0x1e
/*0x8eca*/  .byte 0x1f
/*0x8ecb*/  .byte 0x20
/*0x8ecc*/  .byte 0x21
/*0x8ecd*/  .byte 0x22
/*0x8ece*/  .byte 0x23
/*0x8ecf*/  .byte 0x24
/*0x8ed0*/  .byte 0x2b
/*0x8ed1*/  .byte 0x14
/*0x8ed2*/  .byte 0x1a
/*0x8ed3*/  .byte 0x08
/*0x8ed4*/  .byte 0x15
/*0x8ed5*/  .byte 0x17
/*0x8ed6*/  .byte 0x1c
/*0x8ed7*/  .byte 0x18
/*0x8ed8*/  .byte 0x39
/*0x8ed9*/  .byte 0x04
/*0x8eda*/  .byte 0x16
/*0x8edb*/  .byte 0x07
/*0x8edc*/  .byte 0x09
/*0x8edd*/  .byte 0x0a
/*0x8ede*/  .byte 0x0b
/*0x8edf*/  .byte 0x0d
/*0x8ee0*/  .byte 0xe1
/*0x8ee1*/  .byte 0x1d
/*0x8ee2*/  .byte 0x1b
/*0x8ee3*/  .byte 0x06
/*0x8ee4*/  .byte 0x19
/*0x8ee5*/  .byte 0x05
/*0x8ee6*/  .byte 0x11
/*0x8ee7*/  .byte 0x10
/*0x8ee8*/  .byte 0xe0
/*0x8ee9*/  .byte 0xe3
/*0x8eea*/  .byte 0xe2
/*0x8eeb*/  .byte 0x25
/*0x8eec*/  .byte 0x26
/*0x8eed*/  .byte 0x27
/*0x8eee*/  .byte 0x2d
/*0x8eef*/  .byte 0x2a
/*0x8ef0*/  .byte 0x64
/*0x8ef1*/  .byte 0x00
/*0x8ef2*/  .byte 0x2e
/*0x8ef3*/  .byte 0x0c
/*0x8ef4*/  .byte 0x12
/*0x8ef5*/  .byte 0x13
/*0x8ef6*/  .byte 0x2f
/*0x8ef7*/  .byte 0x31
/*0x8ef8*/  .byte 0x00
/*0x8ef9*/  .byte 0x00
/*0x8efa*/  .byte 0x30
/*0x8efb*/  .byte 0x0e
/*0x8efc*/  .byte 0x0f
/*0x8efd*/  .byte 0x33
/*0x8efe*/  .byte 0x34
/*0x8eff*/  .byte 0x28
/*0x8f00*/  .byte 0x00
/*0x8f01*/  .byte 0x00
/*0x8f02*/  .byte 0x2c
/*0x8f03*/  .byte 0x36
/*0x8f04*/  .byte 0x37
/*0x8f05*/  .byte 0x38
/*0x8f06*/  .byte 0xe5
/*0x8f07*/  .byte 0x35
/*0x8f08*/  .byte 0xce
/*0x8f09*/  .byte 0xcd
/*0x8f0a*/  .byte 0xcc
/*0x8f0b*/  .byte 0xe6
/*0x8f0c*/  .byte 0xe7
/*0x8f0d*/  .byte 0x65
/*0x8f0e*/  .byte 0xcb
/*0x8f0f*/  .byte 0xe4
            data_8f10:
/*0x8f10*/  .byte 0x29
/*0x8f11*/  .byte 0x1e
/*0x8f12*/  .byte 0x1f
/*0x8f13*/  .byte 0x20
/*0x8f14*/  .byte 0x21
/*0x8f15*/  .byte 0x22
/*0x8f16*/  .byte 0x23
/*0x8f17*/  .byte 0x24
/*0x8f18*/  .byte 0x2b
/*0x8f19*/  .byte 0x34
/*0x8f1a*/  .byte 0x36
/*0x8f1b*/  .byte 0x37
/*0x8f1c*/  .byte 0x13
/*0x8f1d*/  .byte 0x1c
/*0x8f1e*/  .byte 0x09
/*0x8f1f*/  .byte 0x0a
/*0x8f20*/  .byte 0x39
/*0x8f21*/  .byte 0x04
/*0x8f22*/  .byte 0x12
/*0x8f23*/  .byte 0x08
/*0x8f24*/  .byte 0x18
/*0x8f25*/  .byte 0x0c
/*0x8f26*/  .byte 0x07
/*0x8f27*/  .byte 0x0b
/*0x8f28*/  .byte 0xe1
/*0x8f29*/  .byte 0x33
/*0x8f2a*/  .byte 0x14
/*0x8f2b*/  .byte 0x0d
/*0x8f2c*/  .byte 0x0e
/*0x8f2d*/  .byte 0x1b
/*0x8f2e*/  .byte 0x05
/*0x8f2f*/  .byte 0x10
/*0x8f30*/  .byte 0xe0
/*0x8f31*/  .byte 0xe3
/*0x8f32*/  .byte 0xe2
/*0x8f33*/  .byte 0x25
/*0x8f34*/  .byte 0x26
/*0x8f35*/  .byte 0x27
/*0x8f36*/  .byte 0x2f
/*0x8f37*/  .byte 0x2a
/*0x8f38*/  .byte 0x64
/*0x8f39*/  .byte 0x00
/*0x8f3a*/  .byte 0x30
/*0x8f3b*/  .byte 0x06
/*0x8f3c*/  .byte 0x15
/*0x8f3d*/  .byte 0x0f
/*0x8f3e*/  .byte 0x38
/*0x8f3f*/  .byte 0x31
/*0x8f40*/  .byte 0x00
/*0x8f41*/  .byte 0x00
/*0x8f42*/  .byte 0x2e
/*0x8f43*/  .byte 0x17
/*0x8f44*/  .byte 0x11
/*0x8f45*/  .byte 0x16
/*0x8f46*/  .byte 0x2d
/*0x8f47*/  .byte 0x28
/*0x8f48*/  .byte 0x00
/*0x8f49*/  .byte 0x00
/*0x8f4a*/  .byte 0x2c
/*0x8f4b*/  .byte 0x1a
/*0x8f4c*/  .byte 0x19
/*0x8f4d*/  .byte 0x1d
/*0x8f4e*/  .byte 0xe5
/*0x8f4f*/  .byte 0x35
/*0x8f50*/  .byte 0xce
/*0x8f51*/  .byte 0xcd
/*0x8f52*/  .byte 0xcc
/*0x8f53*/  .byte 0xe6
/*0x8f54*/  .byte 0xe7
/*0x8f55*/  .byte 0x65
/*0x8f56*/  .byte 0xcb
/*0x8f57*/  .byte 0xe4
            data_8f58:
/*0x8f58*/  .byte 0x29
/*0x8f59*/  .byte 0x1e
/*0x8f5a*/  .byte 0x1f
/*0x8f5b*/  .byte 0x20
/*0x8f5c*/  .byte 0x21
/*0x8f5d*/  .byte 0x22
/*0x8f5e*/  .byte 0x23
/*0x8f5f*/  .byte 0x24
/*0x8f60*/  .byte 0x2b
/*0x8f61*/  .byte 0x14
/*0x8f62*/  .byte 0x1a
/*0x8f63*/  .byte 0x09
/*0x8f64*/  .byte 0x13
/*0x8f65*/  .byte 0x0a
/*0x8f66*/  .byte 0x0d
/*0x8f67*/  .byte 0x0f
/*0x8f68*/  .byte 0x2a
/*0x8f69*/  .byte 0x04
/*0x8f6a*/  .byte 0x15
/*0x8f6b*/  .byte 0x16
/*0x8f6c*/  .byte 0x17
/*0x8f6d*/  .byte 0x07
/*0x8f6e*/  .byte 0x0b
/*0x8f6f*/  .byte 0x11
/*0x8f70*/  .byte 0xe1
/*0x8f71*/  .byte 0x1d
/*0x8f72*/  .byte 0x1b
/*0x8f73*/  .byte 0x06
/*0x8f74*/  .byte 0x19
/*0x8f75*/  .byte 0x05
/*0x8f76*/  .byte 0x0e
/*0x8f77*/  .byte 0x10
/*0x8f78*/  .byte 0xe0
/*0x8f79*/  .byte 0xe3
/*0x8f7a*/  .byte 0xe2
/*0x8f7b*/  .byte 0x25
/*0x8f7c*/  .byte 0x26
/*0x8f7d*/  .byte 0x27
/*0x8f7e*/  .byte 0x2d
/*0x8f7f*/  .byte 0x2a
/*0x8f80*/  .byte 0x64
/*0x8f81*/  .byte 0x00
/*0x8f82*/  .byte 0x2e
/*0x8f83*/  .byte 0x18
/*0x8f84*/  .byte 0x1c
/*0x8f85*/  .byte 0x33
/*0x8f86*/  .byte 0x2f
/*0x8f87*/  .byte 0x31
/*0x8f88*/  .byte 0x00
/*0x8f89*/  .byte 0x00
/*0x8f8a*/  .byte 0x30
/*0x8f8b*/  .byte 0x08
/*0x8f8c*/  .byte 0x0c
/*0x8f8d*/  .byte 0x12
/*0x8f8e*/  .byte 0x34
/*0x8f8f*/  .byte 0x28
/*0x8f90*/  .byte 0x00
/*0x8f91*/  .byte 0x00
/*0x8f92*/  .byte 0x2c
/*0x8f93*/  .byte 0x36
/*0x8f94*/  .byte 0x37
/*0x8f95*/  .byte 0x38
/*0x8f96*/  .byte 0xe5
/*0x8f97*/  .byte 0x35
/*0x8f98*/  .byte 0xce
/*0x8f99*/  .byte 0xcd
/*0x8f9a*/  .byte 0xcc
/*0x8f9b*/  .byte 0xe6
/*0x8f9c*/  .byte 0xe7
/*0x8f9d*/  .byte 0x65
/*0x8f9e*/  .byte 0xcb
/*0x8f9f*/  .byte 0xe4
            data_8fa0:
/*0x8fa0*/  .byte 0x20
/*0x8fa1*/  .byte 0x10
/*0x8fa2*/  .byte 0x40
/*0x8fa3*/  .byte 0x80
/*0x8fa4*/  .byte 0x01
/*0x8fa5*/  .byte 0x02
/*0x8fa6*/  .byte 0x04
/*0x8fa7*/  .byte 0x08
            data_8fa8:
/*0x8fa8*/  .byte 0x00
/*0x8fa9*/  .byte 0x60
/*0x8faa*/  .byte 0x0b
/*0x8fab*/  .byte 0x40
/*0x8fac*/  .byte 0x01
/*0x8fad*/  .byte 0x00
/*0x8fae*/  .byte 0x00
/*0x8faf*/  .byte 0x00
/*0x8fb0*/  .byte 0x00
/*0x8fb1*/  .byte 0x00
/*0x8fb2*/  .byte 0x0b
/*0x8fb3*/  .byte 0x40
/*0x8fb4*/  .byte 0x00
/*0x8fb5*/  .byte 0x08
/*0x8fb6*/  .byte 0x00
/*0x8fb7*/  .byte 0x00
/*0x8fb8*/  .byte 0x00
/*0x8fb9*/  .byte 0x00
/*0x8fba*/  .byte 0x0b
/*0x8fbb*/  .byte 0x40
/*0x8fbc*/  .byte 0x00
/*0x8fbd*/  .byte 0x80
/*0x8fbe*/  .byte 0x00
/*0x8fbf*/  .byte 0x00
/*0x8fc0*/  .byte 0x00
/*0x8fc1*/  .byte 0x20
/*0x8fc2*/  .byte 0x0b
/*0x8fc3*/  .byte 0x40
/*0x8fc4*/  .byte 0x02
/*0x8fc5*/  .byte 0x00
/*0x8fc6*/  .byte 0x00
/*0x8fc7*/  .byte 0x00
/*0x8fc8*/  .byte 0x00
/*0x8fc9*/  .byte 0x40
/*0x8fca*/  .byte 0x0b
/*0x8fcb*/  .byte 0x40
/*0x8fcc*/  .byte 0x20
/*0x8fcd*/  .byte 0x00
/*0x8fce*/  .byte 0x00
/*0x8fcf*/  .byte 0x00
/*0x8fd0*/  .byte 0x00
/*0x8fd1*/  .byte 0x20
/*0x8fd2*/  .byte 0x0b
/*0x8fd3*/  .byte 0x40
/*0x8fd4*/  .byte 0x08
/*0x8fd5*/  .byte 0x00
/*0x8fd6*/  .byte 0x00
/*0x8fd7*/  .byte 0x00
/*0x8fd8*/  .byte 0x00
/*0x8fd9*/  .byte 0x20
/*0x8fda*/  .byte 0x0b
/*0x8fdb*/  .byte 0x40
/*0x8fdc*/  .byte 0x10
/*0x8fdd*/  .byte 0x00
/*0x8fde*/  .byte 0x00
/*0x8fdf*/  .byte 0x00
/*0x8fe0*/  .byte 0x00
/*0x8fe1*/  .byte 0x20
/*0x8fe2*/  .byte 0x0b
/*0x8fe3*/  .byte 0x40
/*0x8fe4*/  .byte 0x20
/*0x8fe5*/  .byte 0x00
/*0x8fe6*/  .byte 0x00
/*0x8fe7*/  .byte 0x00
/*0x8fe8*/  .byte 0x00
/*0x8fe9*/  .byte 0x40
/*0x8fea*/  .byte 0x0b
/*0x8feb*/  .byte 0x40
/*0x8fec*/  .byte 0x00
/*0x8fed*/  .byte 0x01
/*0x8fee*/  .byte 0x00
/*0x8fef*/  .byte 0x00

            data_8ff0:
/*0x8ff0*/  .word data_9010

/*0x8ff4*/  .byte 0x00
/*0x8ff5*/  .byte 0x00
/*0x8ff6*/  .byte 0x00
/*0x8ff7*/  .byte 0x20
/*0x8ff8*/  .byte 0x34
/*0x8ff9*/  .byte 0x02
/*0x8ffa*/  .byte 0x00
/*0x8ffb*/  .byte 0x00
/*0x8ffc*/  .byte 0x00
/*0x8ffd*/  .byte 0x2e
/*0x8ffe*/  .byte 0x00
/*0x8fff*/  .byte 0x00

            task_2:
/*0x9000*/  .word data_90d4

/*0x9004*/  .byte 0x34
/*0x9005*/  .byte 0x02
/*0x9006*/  .byte 0x00
/*0x9007*/  .byte 0x20
/*0x9008*/  .byte 0x2c
/*0x9009*/  .byte 0x35
/*0x900a*/  .byte 0x00
/*0x900b*/  .byte 0x00
/*0x900c*/  .byte 0xc0
/*0x900d*/  .byte 0x74
/*0x900e*/  .byte 0x00
/*0x900f*/  .byte 0x00
            data_9010:
/*0x9010*/  .byte 0x41
/*0x9011*/  .byte 0x02
/*0x9012*/  .byte 0x17
/*0x9013*/  .byte 0x01
/*0x9014*/  .byte 0x29
/*0x9015*/  .byte 0x18
/*0x9016*/  .byte 0x69
/*0x9017*/  .byte 0x04
/*0x9018*/  .byte 0x01
/*0x9019*/  .byte 0x1c
/*0x901a*/  .byte 0x63
/*0x901b*/  .byte 0x34
/*0x901c*/  .byte 0x8b
/*0x901d*/  .byte 0x5a
/*0x901e*/  .byte 0x38
/*0x901f*/  .byte 0x08
/*0x9020*/  .byte 0xa1
/*0x9021*/  .byte 0x1a
/*0x9022*/  .byte 0x02
/*0x9023*/  .byte 0x03
/*0x9024*/  .byte 0x62
/*0x9025*/  .byte 0x63
/*0x9026*/  .byte 0x59
/*0x9027*/  .byte 0x07
/*0x9028*/  .byte 0x01
/*0x9029*/  .byte 0x27
/*0x902a*/  .byte 0x03
/*0x902b*/  .byte 0x15
/*0x902c*/  .byte 0x2a
/*0x902d*/  .byte 0x4c
/*0x902e*/  .byte 0x04
/*0x902f*/  .byte 0x5f
/*0x9030*/  .byte 0x39
/*0x9031*/  .byte 0xe8
/*0x9032*/  .byte 0xe0
/*0x9033*/  .byte 0x2c
/*0x9034*/  .byte 0x08
/*0x9035*/  .byte 0x04
/*0x9036*/  .byte 0x08
/*0x9037*/  .byte 0x01
/*0x9038*/  .byte 0x11
/*0x9039*/  .byte 0x28
/*0x903a*/  .byte 0x0e
/*0x903b*/  .byte 0x01
/*0x903c*/  .byte 0x02
/*0x903d*/  .byte 0x03
/*0x903e*/  .byte 0x05
/*0x903f*/  .byte 0x05
/*0x9040*/  .byte 0x07
/*0x9041*/  .byte 0xe0
/*0x9042*/  .byte 0xe3
/*0x9043*/  .byte 0xe2
/*0x9044*/  .byte 0xe6
/*0x9045*/  .byte 0xe7
/*0x9046*/  .byte 0x65
/*0x9047*/  .byte 0xe4
/*0x9048*/  .byte 0x12
/*0x9049*/  .byte 0x19
/*0x904a*/  .byte 0x18
/*0x904b*/  .byte 0x17
/*0x904c*/  .byte 0x07
/*0x904d*/  .byte 0x05
/*0x904e*/  .byte 0x03
/*0x904f*/  .byte 0x02
/*0x9050*/  .byte 0x01
/*0x9051*/  .byte 0x05
/*0x9052*/  .byte 0x38
/*0x9053*/  .byte 0x0a
/*0x9054*/  .byte 0xe4
/*0x9055*/  .byte 0xe7
/*0x9056*/  .byte 0xe6
/*0x9057*/  .byte 0xe2
/*0x9058*/  .byte 0xe3
/*0x9059*/  .byte 0x65
/*0x905a*/  .byte 0xe0
/*0x905b*/  .byte 0x06
/*0x905c*/  .byte 0x04
/*0x905d*/  .byte 0x0e
/*0x905e*/  .byte 0x51
/*0x905f*/  .byte 0x02
/*0x9060*/  .byte 0x19
/*0x9061*/  .byte 0x01
/*0x9062*/  .byte 0x12
/*0x9063*/  .byte 0x47
/*0x9064*/  .byte 0x12
/*0x9065*/  .byte 0x8e
/*0x9066*/  .byte 0x12
/*0x9067*/  .byte 0xd5
/*0x9068*/  .byte 0x48
/*0x9069*/  .byte 0x18
/*0x906a*/  .byte 0x1c
/*0x906b*/  .byte 0x01
/*0x906c*/  .byte 0x63
/*0x906d*/  .byte 0x01
/*0x906e*/  .byte 0xaa
/*0x906f*/  .byte 0x01
/*0x9070*/  .byte 0xf1
/*0x9071*/  .byte 0x01
/*0x9072*/  .byte 0x38
/*0x9073*/  .byte 0x02
/*0x9074*/  .byte 0x7f
/*0x9075*/  .byte 0x02
/*0x9076*/  .byte 0xc6
/*0x9077*/  .byte 0x02
/*0x9078*/  .byte 0x0d
/*0x9079*/  .byte 0x03
/*0x907a*/  .byte 0x54
/*0x907b*/  .byte 0x03
/*0x907c*/  .byte 0x9b
/*0x907d*/  .byte 0x03
/*0x907e*/  .byte 0xe8
/*0x907f*/  .byte 0x03
/*0x9080*/  .byte 0xff
/*0x9081*/  .byte 0x01
/*0x9082*/  .byte 0x83
/*0x9083*/  .byte 0xbf
/*0x9084*/  .byte 0x7f
/*0x9085*/  .byte 0x5a
/*0x9086*/  .byte 0x01
/*0x9087*/  .byte 0x01
/*0x9088*/  .byte 0x5a
/*0x9089*/  .byte 0x02
/*0x908a*/  .byte 0x01
/*0x908b*/  .byte 0x5a
/*0x908c*/  .byte 0x03
/*0x908d*/  .byte 0x01
/*0x908e*/  .byte 0xe9
/*0x908f*/  .byte 0x20
/*0x9090*/  .byte 0x4c
/*0x9091*/  .byte 0x0a
/*0x9092*/  .byte 0x0a
/*0x9093*/  .byte 0x04
/*0x9094*/  .byte 0x20
/*0x9095*/  .byte 0x3b
/*0x9096*/  .byte 0x04
/*0x9097*/  .byte 0x04
/*0x9098*/  .byte 0x20
/*0x9099*/  .byte 0x5a
/*0x909a*/  .byte 0x04
/*0x909b*/  .byte 0x01
/*0x909c*/  .byte 0xf1
/*0x909d*/  .byte 0x18
/*0x909e*/  .byte 0x0a
/*0x909f*/  .byte 0x90
/*0x90a0*/  .byte 0xd0
/*0x90a1*/  .byte 0x02
/*0x90a2*/  .byte 0x40
/*0x90a3*/  .byte 0x90
/*0x90a4*/  .byte 0xf0
/*0x90a5*/  .byte 0x06
/*0x90a6*/  .byte 0x40
/*0x90a7*/  .byte 0x94
/*0x90a8*/  .byte 0x04
/*0x90a9*/  .byte 0x1a
/*0x90aa*/  .byte 0x98
/*0x90ab*/  .byte 0x04
/*0x90ac*/  .byte 0x1e
/*0x90ad*/  .byte 0x9c
/*0x90ae*/  .byte 0xe0
/*0x90af*/  .byte 0x06
/*0x90b0*/  .byte 0x40
/*0x90b1*/  .byte 0x90
/*0x90b2*/  .byte 0x04
/*0x90b3*/  .byte 0x1a
/*0x90b4*/  .byte 0x94
/*0x90b5*/  .byte 0x04
/*0x90b6*/  .byte 0x1a
/*0x90b7*/  .byte 0x98
/*0x90b8*/  .byte 0x04
/*0x90b9*/  .byte 0x1e
/*0x90ba*/  .byte 0x9c
/*0x90bb*/  .byte 0xc0
/*0x90bc*/  .byte 0x02
/*0x90bd*/  .byte 0x40
/*0x90be*/  .byte 0x98
/*0x90bf*/  .byte 0x04
/*0x90c0*/  .byte 0x2a
/*0x90c1*/  .byte 0x9c
/*0x90c2*/  .byte 0x24
/*0x90c3*/  .byte 0x29
/*0x90c4*/  .byte 0x2c
/*0x90c5*/  .byte 0x19
/*0x90c6*/  .byte 0x0c
/*0x90c7*/  .byte 0x2a
/*0x90c8*/  .byte 0x94
/*0x90c9*/  .byte 0x14
/*0x90ca*/  .byte 0x19
/*0x90cb*/  .byte 0x0c
/*0x90cc*/  .byte 0x1a
/*0x90cd*/  .byte 0x9c
/*0x90ce*/  .byte 0x04
/*0x90cf*/  .byte 0x81
/*0x90d0*/  .byte 0xcb
/*0x90d1*/  .byte 0xa0
/*0x90d2*/  .byte 0x0f
/*0x90d3*/  .byte 0xe6

            data_90d4:
