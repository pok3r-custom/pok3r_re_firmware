.syntax unified
.cpu cortex-m3
.text
.thumb

/*0x3400*/  .byte 0xe0
/*0x3401*/  .byte 0x21
/*0x3402*/  .byte 0x0
/*0x3403*/  .byte 0x20

/*0x3404*/  .word reset
/*0x3408*/  .word nmi
/*0x340c*/  .word hard_fault
/*0x3410*/  .word mcu_fault
/*0x3414*/  .word bus_fault
/*0x3418*/  .word usage_fault

/*0x341c*/  .byte 0x0
/*0x341d*/  .byte 0x0
/*0x341e*/  .byte 0x0
/*0x341f*/  .byte 0x0
/*0x3420*/  .byte 0x0
/*0x3421*/  .byte 0x0
/*0x3422*/  .byte 0x0
/*0x3423*/  .byte 0x0
/*0x3424*/  .byte 0x0
/*0x3425*/  .byte 0x0
/*0x3426*/  .byte 0x0
/*0x3427*/  .byte 0x0
/*0x3428*/  .byte 0x0
/*0x3429*/  .byte 0x0
/*0x342a*/  .byte 0x0
/*0x342b*/  .byte 0x0

/*0x342c*/  .word svccall_intr
/*0x3430*/  .word debug_intr

/*0x3434*/  .byte 0x0
/*0x3435*/  .byte 0x0
/*0x3436*/  .byte 0x0
/*0x3437*/  .byte 0x0

/*0x3438*/  .word pendsv_intr
/*0x343c*/  .word systick_intr
/*0x3440*/  .word generic_intr
/*0x3444*/  .word generic_intr
/*0x3448*/  .word generic_intr
/*0x344c*/  .word generic_intr
/*0x3450*/  .word generic_intr
/*0x3454*/  .word generic_intr
/*0x3458*/  .word generic_intr
/*0x345c*/  .word generic_intr
/*0x3460*/  .word generic_intr
/*0x3464*/  .word generic_intr
/*0x3468*/  .word generic_intr
/*0x346c*/  .word generic_intr
/*0x3470*/  .word generic_intr
/*0x3474*/  .word generic_intr
/*0x3478*/  .word generic_intr
/*0x347c*/  .word generic_intr
/*0x3480*/  .word generic_intr
/*0x3484*/  .word generic_intr
/*0x3488*/  .word generic_intr
/*0x348c*/  .word generic_intr
/*0x3490*/  .word generic_intr
/*0x3494*/  .word generic_intr
/*0x3498*/  .word generic_intr
/*0x349c*/  .word generic_intr
/*0x34a0*/  .word generic_intr
/*0x34a4*/  .word generic_intr

/*0x34a8*/  .byte 0x0
/*0x34a9*/  .byte 0x0
/*0x34aa*/  .byte 0x0
/*0x34ab*/  .byte 0x0

/*0x34ac*/  .word generic_intr
/*0x34b0*/  .word generic_intr
/*0x34b4*/  .word generic_intr
/*0x34b8*/  .word generic_intr
/*0x34bc*/  .word generic_intr
/*0x34c0*/  .word generic_intr
/*0x34c4*/  .word generic_intr
/*0x34c8*/  .word generic_intr
/*0x34cc*/  .word generic_intr
/*0x34d0*/  .word generic_intr

/*0x34d4*/  .byte 0x0
/*0x34d5*/  .byte 0x0
/*0x34d6*/  .byte 0x0
/*0x34d7*/  .byte 0x0
/*0x34d8*/  .byte 0x0
/*0x34d9*/  .byte 0x0
/*0x34da*/  .byte 0x0
/*0x34db*/  .byte 0x0
/*0x34dc*/  .byte 0x0
/*0x34dd*/  .byte 0x0
/*0x34de*/  .byte 0x0
/*0x34df*/  .byte 0x0
/*0x34e0*/  .byte 0x0
/*0x34e1*/  .byte 0x0
/*0x34e2*/  .byte 0x0
/*0x34e3*/  .byte 0x0

/*0x34e4*/  .word bftm0_intr
/*0x34e8*/  .word bftm1_intr
/*0x34ec*/  .word generic_intr
/*0x34f0*/  .word generic_intr
/*0x34f4*/  .word generic_intr
/*0x34f8*/  .word generic_intr
/*0x34fc*/  .word generic_intr
/*0x3500*/  .word generic_intr
/*0x3504*/  .word generic_intr
/*0x3508*/  .word generic_intr
/*0x350c*/  .word generic_intr
/*0x3510*/  .word generic_intr
/*0x3514*/  .word usb_intr

/*0x3518*/  .byte 0x0
/*0x3519*/  .byte 0x0
/*0x351a*/  .byte 0x0
/*0x351b*/  .byte 0x0

/*0x351c*/  .word generic_intr
/*0x3520*/  .word generic_intr
/*0x3524*/  .word generic_intr
/*0x3528*/  .word generic_intr
/*0x352c*/  .word generic_intr
/*0x3530*/  .word generic_intr
/*0x3534*/  .word generic_intr
/*0x3538*/  .word generic_intr

/*0x353c*/  .byte 0x0
/*0x353d*/  .byte 0x0
/*0x353e*/  .byte 0x0
/*0x353f*/  .byte 0x0
/*0x3540*/  .byte 0x0
/*0x3541*/  .byte 0x0
/*0x3542*/  .byte 0x0
/*0x3543*/  .byte 0x0
/*0x3544*/  .byte 0x0
/*0x3545*/  .byte 0x0
/*0x3546*/  .byte 0x0
/*0x3547*/  .byte 0x0
/*0x3548*/  .byte 0x0
/*0x3549*/  .byte 0x0
/*0x354a*/  .byte 0x0
/*0x354b*/  .byte 0x0
/*0x354c*/  .byte 0x0
/*0x354d*/  .byte 0x0
/*0x354e*/  .byte 0x0
/*0x354f*/  .byte 0x0

/*0x3550*/  .word generic_intr


            .thumb_func
            reset:
/*0x3554*/      ldr r0, [pc, #0x1c] /* data_3574 */
/*0x3556*/      blx r0 /*  /* watchdog_init */
/*0x3558*/      ldr r0, [pc, #0x1c] /* data_3578 */
/*0x355a*/      blx r0 /*  /* clock_init */
/*0x355c*/      ldr r0, [pc, #0x1c] /* data_357c */
/*0x355e*/      bx r0 /* entry */

            .thumb_func
            nmi:
/*0x3560*/      b nmi

            .thumb_func
            hard_fault:
/*0x3562*/      b hard_fault

            .thumb_func
            mcu_fault:
/*0x3564*/      b mcu_fault

            .thumb_func
            bus_fault:
/*0x3566*/      b bus_fault

            .thumb_func
            usage_fault:
/*0x3568*/      b usage_fault

            .thumb_func
            svccall_intr:
/*0x356a*/      b svccall_intr

            .thumb_func
            debug_intr:
/*0x356c*/      b debug_intr

            .thumb_func
            pendsv_intr:
/*0x356e*/      b pendsv_intr

            .thumb_func
            systick_intr:
/*0x3570*/      b systick_intr

            .thumb_func
            generic_intr:
/*0x3572*/      b generic_intr

            data_3574:
/*0x3574*/  .word watchdog_init
            data_3578:
/*0x3578*/  .word clock_init
            data_357c:
/*0x357c*/  .word entry


            .thumb_func
            entry:
/*0x3580*/      ldr.w sp, [pc, #0xc] /* data_3590 */
/*0x3584*/      bl sram_init

            .thumb_func
            call_3588:
/*0x3588*/      ldr r0, [pc, #0] /* data_358c */
/*0x358a*/      bx r0 /* main */

            data_358c:
/*0x358c*/  .word main
            data_3590:
/*0x3590*/  .word 0x200021e0


            .thumb_func
            rand:
/*0x3594*/      ldr r1, [pc, #0x18] /* data_35b0 */
/*0x3596*/      ldr r2, [pc, #0x1c] /* data_35b4 */
/*0x3598*/      ldr r0, [r1]
/*0x359a*/      muls r0, r2, r0
/*0x359c*/      movw r2, #0x3039
/*0x35a0*/      add r0, r2
/*0x35a2*/      str r0, [r1]
/*0x35a4*/      lsrs r0, r0, #1
/*0x35a6*/      bx lr

            .thumb_func
            srand:
/*0x35a8*/      ldr r1, [pc, #4] /* data_35b0 */
/*0x35aa*/      str r0, [r1]
/*0x35ac*/      bx lr

/*0x35ae*/  .byte 0x0
/*0x35af*/  .byte 0x0

            data_35b0:
/*0x35b0*/  .word 0x20000064
            data_35b4:
/*0x35b4*/  .word 0x41c64e6d


            .thumb_func
            memcpy:
/*0x35b8*/      orr.w r3, r0, r1
/*0x35bc*/      lsls r3, r3, #0x1e
/*0x35be*/      beq jump_35c8
/*0x35c0*/      b jump_35d6
            jump_35c2:
/*0x35c2*/      ldm r1!, {r3}
/*0x35c4*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x35c6*/      stm r0!, {r3}
            jump_35c8:
/*0x35c8*/      cmp r2, #4
/*0x35ca*/      bhs jump_35c2
/*0x35cc*/      b jump_35d6
            jump_35ce:
/*0x35ce*/      ldrb r3, [r1], #1
/*0x35d2*/      strb r3, [r0], #1
            jump_35d6:
/*0x35d6*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x35d8*/      bhs jump_35ce
/*0x35da*/      bx lr

            .thumb_func
            mem_set:
/*0x35dc*/      uxtb r2, r2
/*0x35de*/      b jump_35e4
            jump_35e0:
/*0x35e0*/      strb r2, [r0], #1
            jump_35e4:
/*0x35e4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x35e6*/      bhs jump_35e0
/*0x35e8*/      bx lr

            .thumb_func
            mem_zero:
/*0x35ea*/      movs r2, #0
/*0x35ec*/      b mem_set

            .thumb_func
            mem_set2:
/*0x35ee*/      push {r4, lr}
/*0x35f0*/      mov r3, r2
/*0x35f2*/      mov r2, r1
/*0x35f4*/      mov r4, r0
/*0x35f6*/      mov r1, r3
/*0x35f8*/      bl mem_set
/*0x35fc*/      mov r0, r4
/*0x35fe*/      pop {r4, pc}

            .thumb_func
            memcmp:
/*0x3600*/      push {r4, r5, lr}
/*0x3602*/      mov r4, r0
/*0x3604*/      movs r0, #0
/*0x3606*/      mov r3, r0
/*0x3608*/      b jump_360c
            jump_360a:
/*0x360a*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_360c:
/*0x360c*/      cmp r3, r2
/*0x360e*/      bhs jump_3618
/*0x3610*/      ldrb r0, [r4, r3]
/*0x3612*/      ldrb r5, [r1, r3]
/*0x3614*/      subs r0, r0, r5
/*0x3616*/      beq jump_360a
            jump_3618:
/*0x3618*/      pop {r4, r5, pc}

/*0x361a*/  .byte 0x0
/*0x361b*/  .byte 0x0


            .thumb_func
            sram_init:
/*0x361c*/      ldr r4, [pc, #0x18] /* data_3638 */
/*0x361e*/      ldr r5, [pc, #0x1c] /* data_363c */
/*0x3620*/      b jump_3630
            jump_3622:
/*0x3622*/      ldr r0, [r4, #0xc]
/*0x3624*/      orr r3, r0, #1
/*0x3628*/      ldm.w r4, {r0, r1, r2}
/*0x362c*/      blx r3
/*0x362e*/      adds r4, #0x10
            jump_3630:
/*0x3630*/      cmp r4, r5
/*0x3632*/      blo jump_3622
/*0x3634*/      bl call_3588
            data_3638:
/*0x3638*/      strh r4, [r3, #8]
/*0x363a*/      movs r0, r0
            data_363c:
/*0x363c*/      strh r4, [r7, #8]
/*0x363e*/      movs r0, r0

            .thumb_func
            afio_exti_ssr_write:
/*0x3640*/      push {r4, lr}
/*0x3642*/      movs r2, #0
/*0x3644*/      cmp r0, #7
/*0x3646*/      bls jump_364e
/*0x3648*/      movs r2, #1
/*0x364a*/      subs r0, #8
/*0x364c*/      uxtb r0, r0
            jump_364e:
/*0x364e*/      lsls r3, r2, #2
/*0x3650*/      ldr r2, [pc, #0x14] /* data_3668 */
/*0x3652*/      add r2, r3
/*0x3654*/      ldr r3, [r2]
/*0x3656*/      lsls r0, r0, #2
/*0x3658*/      movs r4, #0xf
/*0x365a*/      lsls r4, r0
/*0x365c*/      bics r3, r4
/*0x365e*/      lsls r1, r0
/*0x3660*/      orrs r1, r3
/*0x3662*/      str r1, [r2]
/*0x3664*/      pop {r4, pc}

/*0x3666*/  .byte 0x0
/*0x3667*/  .byte 0x0

            data_3668:
/*0x3668*/  .word 0x40022000


            .thumb_func
            bftm0_intr:
/*0x366c*/      push {r4, lr}
/*0x366e*/      ldr r0, [pc, #0x6c] /* data_36dc */
/*0x3670*/      bl bftm_clear
/*0x3674*/      bl call_5fc8
/*0x3678*/      ldr r0, [pc, #0x64] /* data_36e0 */
/*0x367a*/      ldr r1, [r0]
/*0x367c*/      cbz r1, jump_3684
/*0x367e*/      ldr r1, [r0]
/*0x3680*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3682*/      str r1, [r0]
            jump_3684:
/*0x3684*/      ldr r1, [r0, #4]
/*0x3686*/      cbz r1, jump_368e
/*0x3688*/      ldr r1, [r0, #4]
/*0x368a*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x368c*/      str r1, [r0, #4]
            jump_368e:
/*0x368e*/      ldr r0, [pc, #0x54] /* data_36e4 */
/*0x3690*/      ldrh r1, [r0]
/*0x3692*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3694*/      strh r1, [r0]
/*0x3696*/      ldr r0, [pc, #0x50] /* data_36e8 */
/*0x3698*/      ldr r1, [r0]
/*0x369a*/      cbz r1, jump_36a2
/*0x369c*/      ldr r1, [r0]
/*0x369e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36a0*/      str r1, [r0]
            jump_36a2:
/*0x36a2*/      ldr r0, [pc, #0x48] /* data_36ec */
/*0x36a4*/      ldr r1, [r0]
/*0x36a6*/      cbz r1, jump_36ae
/*0x36a8*/      ldr r1, [r0]
/*0x36aa*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x36ac*/      str r1, [r0]
            jump_36ae:
/*0x36ae*/      ldr r0, [pc, #0x40] /* data_36f0 */
/*0x36b0*/      ldrb r1, [r0]
/*0x36b2*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36b4*/      strb r1, [r0]
/*0x36b6*/      ldr r1, [pc, #0x3c] /* data_36f4 */
/*0x36b8*/      ldrh r0, [r1]
/*0x36ba*/      cmp r0, #1
/*0x36bc*/      bls jump_36c2
/*0x36be*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x36c0*/      strh r0, [r1]
            jump_36c2:
/*0x36c2*/      ldr r0, [pc, #0x34] /* data_36f8 */
/*0x36c4*/      ldrh r1, [r0]
/*0x36c6*/      cmp r1, #0
/*0x36c8*/      beq jump_36d8
/*0x36ca*/      ldrh r1, [r0]
/*0x36cc*/      cmp.w r1, #0xff00
/*0x36d0*/      bhs jump_36d8
/*0x36d2*/      ldrh r1, [r0]
/*0x36d4*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x36d6*/      strh r1, [r0]
            jump_36d8:
/*0x36d8*/      pop {r4, pc}

/*0x36da*/  .byte 0x0
/*0x36db*/  .byte 0x0

            data_36dc:
/*0x36dc*/  .word 0x40076000
            data_36e0:
/*0x36e0*/  .word 0x200006bc
            data_36e4:
/*0x36e4*/  .word 0x2000000e
            data_36e8:
/*0x36e8*/  .word 0x20000008
            data_36ec:
/*0x36ec*/  .word 0x20000060
            data_36f0:
/*0x36f0*/  .word 0x2000002a
            data_36f4:
/*0x36f4*/  .word 0x20000002
            data_36f8:
/*0x36f8*/  .word 0x2000001c


            .thumb_func
            bftm1_intr:
/*0x36fc*/      push {r4, lr}
/*0x36fe*/      ldr r0, [pc, #0x4c] /* data_374c */
/*0x3700*/      bl bftm_clear
/*0x3704*/      ldr r4, [pc, #0x48] /* data_3750 */
/*0x3706*/      ldr r0, [r4, #4]
/*0x3708*/      ldrh r1, [r0, #4]
/*0x370a*/      ldr r0, [r0]
/*0x370c*/      uxth r1, r1
/*0x370e*/      bl gpio_set_pin
/*0x3712*/      movs r0, #0xa
/*0x3714*/      bl spin_wait_maybe
/*0x3718*/      movs r0, #2
/*0x371a*/      bl call_7248
/*0x371e*/      ldr r1, [pc, #0x34] /* data_3754 */
/*0x3720*/      mov.w r0, #0x8000
/*0x3724*/      str r0, [r1, #0x24]
/*0x3726*/      ldr r0, [pc, #0x30] /* data_3758 */
/*0x3728*/      ldrb r1, [r4, #1]
/*0x372a*/      add.w r0, r0, r1, lsl #3
/*0x372e*/      str r0, [r4, #4]
/*0x3730*/      ldrh r1, [r0, #4]
/*0x3732*/      ldr r0, [r0]
/*0x3734*/      uxth r1, r1
/*0x3736*/      bl call_4534
/*0x373a*/      ldrb r0, [r4, #1]
/*0x373c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x373e*/      and r0, r0, #7
/*0x3742*/      strb r0, [r4, #1]
/*0x3744*/      pop.w {r4, lr}
/*0x3748*/      b.w call_6468

            data_374c:
/*0x374c*/  .word 0x40077000
            data_3750:
/*0x3750*/  .word 0x20000020
            data_3754:
/*0x3754*/  .word 0x400b0000
            data_3758:
/*0x3758*/  .word 0x7d24


            .thumb_func
            bftm_clear:
/*0x375c*/      ldr r1, [r0, #4]
/*0x375e*/      bic r1, r1, #1
/*0x3762*/      str r1, [r0, #4]
/*0x3764*/      dsb sy
/*0x3768*/      bx lr

            .thumb_func
            call_376a:
/*0x376a*/      cmp r1, #0
/*0x376c*/      ldr r1, [r0]
/*0x376e*/      beq jump_3776
/*0x3770*/      orr r1, r1, #4
/*0x3774*/      b jump_377a
            jump_3776:
/*0x3776*/      bic r1, r1, #4
            jump_377a:
/*0x377a*/      str r1, [r0]
/*0x377c*/      bx lr

            .thumb_func
            call_377e:
/*0x377e*/      cmp r1, #0
/*0x3780*/      ldr r1, [r0]
/*0x3782*/      beq jump_378a
/*0x3784*/      orr r1, r1, #1
/*0x3788*/      b jump_378e
            jump_378a:
/*0x378a*/      bic r1, r1, #1
            jump_378e:
/*0x378e*/      str r1, [r0]
/*0x3790*/      bx lr

            .thumb_func
            call_3792:
/*0x3792*/      str r1, [r0, #0xc]
/*0x3794*/      bx lr

            .thumb_func
            call_3796:
/*0x3796*/      str r1, [r0, #8]
/*0x3798*/      bx lr

/*0x379a*/  .byte 0x0
/*0x379b*/  .byte 0x0


            .thumb_func
            afio_pin_config:
/*0x379c*/      lsls r0, r0, #3
/*0x379e*/      lsrs r3, r1, #3
/*0x37a0*/      add.w r0, r0, r3, lsl #2
/*0x37a4*/      ldr r3, [pc, #0x18] /* data_37c0 */
/*0x37a6*/      push {r4, lr}
/*0x37a8*/      add r0, r3
/*0x37aa*/      lsls r1, r1, #0x1d
/*0x37ac*/      ldr r3, [r0]
/*0x37ae*/      lsrs r1, r1, #0x1b
/*0x37b0*/      movs r4, #0xf
/*0x37b2*/      lsls r4, r1
/*0x37b4*/      bics r3, r4
/*0x37b6*/      lsls r2, r1
/*0x37b8*/      orrs r3, r2
/*0x37ba*/      str r3, [r0]
/*0x37bc*/      pop {r4, pc}

/*0x37be*/  .byte 0x0
/*0x37bf*/  .byte 0x0

            data_37c0:
/*0x37c0*/  .word 0x40022020


            .thumb_func
            spin_wait_maybe:
/*0x37c4*/      add.w r0, r0, r0, lsl #2
/*0x37c8*/      lsls r0, r0, #2
            jump_37ca:
/*0x37ca*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x37cc*/      bhs jump_37ca
/*0x37ce*/      bx lr

            .thumb_func
            setup_afio_gpio:
/*0x37d0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x37d4*/      mov.w r5, #0x4000
/*0x37d8*/      movs r4, #0
/*0x37da*/      lsls r0, r5, #2
/*0x37dc*/      mov r2, r4
/*0x37de*/      mov r8, r0
/*0x37e0*/      movs r3, #1
/*0x37e2*/      mov r1, r5
/*0x37e4*/      bl ckcu_clocks_enable
/*0x37e8*/      ldr r6, [pc, #0x94] /* data_3880 */
/*0x37ea*/      movs r2, #0
/*0x37ec*/      mov r1, r5
/*0x37ee*/      mov r0, r6
/*0x37f0*/      bl gpio_set_input_enable
/*0x37f4*/      lsls r7, r5, #1
/*0x37f6*/      movs r2, #0
/*0x37f8*/      mov r1, r7
/*0x37fa*/      mov r0, r6
/*0x37fc*/      bl gpio_set_input_enable
/*0x3800*/      movs r2, #2
/*0x3802*/      mov r1, r5
/*0x3804*/      mov r0, r6
/*0x3806*/      bl gpio_set_pin_pull_up_down
/*0x380a*/      movs r2, #2
/*0x380c*/      mov r1, r7
/*0x380e*/      mov r0, r6
/*0x3810*/      bl gpio_set_pin_pull_up_down
/*0x3814*/      asrs r5, r5, #3
/*0x3816*/      movs r2, #0
/*0x3818*/      mov r1, r5
/*0x381a*/      mov r0, r6
/*0x381c*/      bl gpio_set_input_enable
/*0x3820*/      movs r2, #2
/*0x3822*/      mov r1, r5
/*0x3824*/      mov r0, r6
/*0x3826*/      bl gpio_set_pin_pull_up_down
/*0x382a*/      movs r2, #1
/*0x382c*/      movs r1, #0xb
/*0x382e*/      movs r0, #0
/*0x3830*/      bl afio_pin_config
/*0x3834*/      movs r2, #1
/*0x3836*/      movs r1, #0xd
/*0x3838*/      movs r0, #2
/*0x383a*/      bl afio_pin_config
/*0x383e*/      movs r2, #1
/*0x3840*/      movs r1, #0xe
/*0x3842*/      movs r0, #2
/*0x3844*/      bl afio_pin_config
/*0x3848*/      movs r2, #1
/*0x384a*/      movs r1, #0xf
/*0x384c*/      movs r0, #2
/*0x384e*/      bl afio_pin_config
/*0x3852*/      ldr r0, [pc, #0x30] /* data_3884 */
/*0x3854*/      ldr r0, [r0, #4]
/*0x3856*/      lsls r0, r0, #0x15
/*0x3858*/      bmi jump_386e
/*0x385a*/      movs r2, #1
/*0x385c*/      movs r1, #0xe
/*0x385e*/      mov r0, r2
/*0x3860*/      bl afio_pin_config
/*0x3864*/      movs r2, #1
/*0x3866*/      movs r1, #0xf
/*0x3868*/      mov r0, r2
/*0x386a*/      bl afio_pin_config
            jump_386e:
/*0x386e*/      mov r1, r4
/*0x3870*/      movs r3, #0
/*0x3872*/      mov r2, r4
/*0x3874*/      mov r0, r8
/*0x3876*/      bl ckcu_clocks_enable
/*0x387a*/      movs r0, #1
/*0x387c*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_3880:
/*0x3880*/  .word 0x400b0000
            data_3884:
/*0x3884*/  .word 0x40088000


            .thumb_func
            ckcu_clocks_enable:
/*0x3888*/      push {r4, r5, r6, r7, lr}
/*0x388a*/      ldr r7, [pc, #0x1c] /* data_38a8 */
/*0x388c*/      ldr r4, [r7, #0x24]
/*0x388e*/      ldr r5, [r7, #0x2c]
/*0x3890*/      ldr r6, [r7, #0x30]
/*0x3892*/      bics r4, r0
/*0x3894*/      bics r5, r1
/*0x3896*/      bics r6, r2
/*0x3898*/      cbz r3, jump_38a0
/*0x389a*/      orrs r4, r0
/*0x389c*/      orrs r5, r1
/*0x389e*/      orrs r6, r2
            jump_38a0:
/*0x38a0*/      str r4, [r7, #0x24]
/*0x38a2*/      str r5, [r7, #0x2c]
/*0x38a4*/      str r6, [r7, #0x30]
/*0x38a6*/      pop {r4, r5, r6, r7, pc}

            data_38a8:
/*0x38a8*/  .word 0x40088000


            .thumb_func
            ckcu_set_usb_prescaler:
/*0x38ac*/      ldr r1, [pc, #0xc] /* data_38bc */
/*0x38ae*/      ldr r2, [r1]
/*0x38b0*/      bic r2, r2, #0xc00000
/*0x38b4*/      orr.w r0, r2, r0, lsl #22
/*0x38b8*/      str r0, [r1]
/*0x38ba*/      bx lr

            data_38bc:
/*0x38bc*/  .word 0x40088000


            .thumb_func
            call_38c0:
/*0x38c0*/      push {r4, r5, r6, lr}
/*0x38c2*/      ldr r1, [pc, #0x40] /* data_3904 */
/*0x38c4*/      movs r5, #1
/*0x38c6*/      lsl.w r0, r5, r0
/*0x38ca*/      ldrb r1, [r1, #3]
/*0x38cc*/      ldr r3, [pc, #0x3c] /* data_390c */
/*0x38ce*/      lsls r6, r1, #0x1e
/*0x38d0*/      ldr r1, [pc, #0x34] /* data_3908 */
/*0x38d2*/      ldr r4, [pc, #0x3c] /* data_3910 */
/*0x38d4*/      uxtb r0, r0
/*0x38d6*/      ldrb r2, [r1, #2]
/*0x38d8*/      ldrb r1, [r3, #1]
/*0x38da*/      bpl jump_38ea
/*0x38dc*/      orrs r1, r0
/*0x38de*/      strb r1, [r3, #1]
/*0x38e0*/      cmp r0, #8
/*0x38e2*/      bne jump_38fe
/*0x38e4*/      cbz r2, jump_38fe
/*0x38e6*/      strb r5, [r4, #0xa]
/*0x38e8*/      b jump_38fe
            jump_38ea:
/*0x38ea*/      bics r1, r0
/*0x38ec*/      strb r1, [r3, #1]
/*0x38ee*/      cmp r0, #8
/*0x38f0*/      bne jump_38fe
/*0x38f2*/      cbz r2, jump_38fe
/*0x38f4*/      movs r0, #0
/*0x38f6*/      strb r0, [r4, #0xa]
/*0x38f8*/      strb r5, [r4]
/*0x38fa*/      bl call_3bec
            jump_38fe:
/*0x38fe*/      movs r0, #3
/*0x3900*/      strb r0, [r4, #4]
/*0x3902*/      pop {r4, r5, r6, pc}

            data_3904:
/*0x3904*/  .word 0x20000030
            data_3908:
/*0x3908*/  .word 0x2000005c
            data_390c:
/*0x390c*/  .word 0x20000000
            data_3910:
/*0x3910*/  .word 0x20000648


            .thumb_func
            call_3914:
/*0x3914*/      push {r4, r5, r6, lr}
/*0x3916*/      ldr r1, [pc, #0xac] /* data_39c4 */
/*0x3918*/      ldrb r0, [r1, #6]
/*0x391a*/      cmp r0, #0
/*0x391c*/      beq jump_3962
/*0x391e*/      ldr r5, [pc, #0xa8] /* data_39c8 */
/*0x3920*/      movs r2, #1
/*0x3922*/      str r2, [r5, #4]
/*0x3924*/      ldr r0, [pc, #0xa4] /* data_39cc */
/*0x3926*/      ldrb r0, [r0, #3]
/*0x3928*/      lsls r0, r0, #0x1e
/*0x392a*/      bpl jump_3962
/*0x392c*/      ldr r0, [pc, #0x9c] /* data_39cc */
/*0x392e*/      ldrb r3, [r1, #7]
/*0x3930*/      ldrb r0, [r0]
/*0x3932*/      cbz r3, jump_3978
/*0x3934*/      cmp r0, #0x27
/*0x3936*/      beq jump_3958
/*0x3938*/      bgt jump_394c
/*0x393a*/      cmp r0, #0x1e
/*0x393c*/      beq jump_3964
/*0x393e*/      cmp r0, #0x1f
/*0x3940*/      beq jump_3964
/*0x3942*/      cmp r0, #0x20
/*0x3944*/      beq jump_3964
/*0x3946*/      cmp r0, #0x26
/*0x3948*/      bne jump_3962
/*0x394a*/      b jump_3958
            jump_394c:
/*0x394c*/      cmp r0, #0x29
/*0x394e*/      beq jump_3960
/*0x3950*/      cmp r0, #0x2d
/*0x3952*/      beq jump_3958
/*0x3954*/      cmp r0, #0x2e
/*0x3956*/      bne jump_3962
            jump_3958:
/*0x3958*/      pop.w {r4, r5, r6, lr}
/*0x395c*/      b.w jump_6c68
            jump_3960:
/*0x3960*/      strb r2, [r1, #2]
            jump_3962:
/*0x3962*/      pop {r4, r5, r6, pc}
            jump_3964:
/*0x3964*/      subs r0, #0x1e
/*0x3966*/      uxtb r1, r0
/*0x3968*/      ldr r0, [pc, #0x5c] /* data_39c8 */
/*0x396a*/      movs r2, #1
/*0x396c*/      adds r4, r0, r1
/*0x396e*/      ldrb r0, [r4]
/*0x3970*/      bl call_51f8
/*0x3974*/      strb r0, [r4]
            jump_3976:
/*0x3976*/      pop {r4, r5, r6, pc}
            jump_3978:
/*0x3978*/      cmp r0, #0xcf
/*0x397a*/      beq jump_3976
/*0x397c*/      ldr r1, [pc, #0x50] /* data_39d0 */
/*0x397e*/      ldr r2, [pc, #0x54] /* data_39d4 */
/*0x3980*/      ldrb r3, [r1, #3]
/*0x3982*/      ldrb r0, [r2, r0]
/*0x3984*/      cmp r3, #5
/*0x3986*/      beq jump_39a8
/*0x3988*/      add.w r0, r0, r0, lsl #1
/*0x398c*/      adds r4, r0, r1
/*0x398e*/      add.w r4, r4, #0x1b2
            jump_3992:
/*0x3992*/      movs r2, #3
/*0x3994*/      mov r1, r4
/*0x3996*/      ldr r0, [pc, #0x30] /* data_39c8 */
/*0x3998*/      bl memcmp
/*0x399c*/      cbz r0, jump_39bc
/*0x399e*/      ldrh r0, [r5]
/*0x39a0*/      strh r0, [r4]
/*0x39a2*/      ldrb r0, [r5, #2]
            jump_39a4:
/*0x39a4*/      strb r0, [r4, #2]
/*0x39a6*/      pop {r4, r5, r6, pc}
            jump_39a8:
/*0x39a8*/      ldr r2, [pc, #0x2c] /* data_39d8 */
/*0x39aa*/      ldrb r0, [r2, r0]
/*0x39ac*/      and r0, r0, #7
/*0x39b0*/      add.w r0, r0, r0, lsl #1
/*0x39b4*/      adds r4, r0, r1
/*0x39b6*/      addw r4, r4, #0x28a
/*0x39ba*/      b jump_3992
            jump_39bc:
/*0x39bc*/      movs r0, #0
/*0x39be*/      strh r0, [r4]
/*0x39c0*/      b jump_39a4

/*0x39c2*/  .byte 0x0
/*0x39c3*/  .byte 0x0

            data_39c4:
/*0x39c4*/  .word 0x20000648
            data_39c8:
/*0x39c8*/  .word 0x20000004
            data_39cc:
/*0x39cc*/  .word 0x20000030
            data_39d0:
/*0x39d0*/  .word 0x20000730
            data_39d4:
/*0x39d4*/  .word 0x200001c0
            data_39d8:
/*0x39d8*/  .word 0x7b73


            .thumb_func
            call_39dc:
/*0x39dc*/      movs r1, #3
/*0x39de*/      ldr r2, [pc, #0x10] /* data_39f0 */
/*0x39e0*/      b jump_39e6
            jump_39e2:
/*0x39e2*/      ldrb r3, [r0, r1]
/*0x39e4*/      strb r3, [r2, r1]
            jump_39e6:
/*0x39e6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x39e8*/      uxtb r1, r1
/*0x39ea*/      bhs jump_39e2
/*0x39ec*/      bx lr

/*0x39ee*/  .byte 0x0
/*0x39ef*/  .byte 0x0

            data_39f0:
/*0x39f0*/  .word 0x20000004


            .thumb_func
            call_39f4:
/*0x39f4*/      ldr r0, [pc, #0x18] /* data_3a10 */
/*0x39f6*/      ldrb r0, [r0, #6]
/*0x39f8*/      cmp r0, #0
/*0x39fa*/      beq jump_3a0c
/*0x39fc*/      ldr r0, [pc, #0x14] /* data_3a14 */
/*0x39fe*/      ldr r0, [r0, #4]
/*0x3a00*/      movw r1, #0x9c40
/*0x3a04*/      cmp r0, r1
/*0x3a06*/      blo jump_3a0c
/*0x3a08*/      b.w jump_6c68
            jump_3a0c:
/*0x3a0c*/      bx lr

/*0x3a0e*/  .byte 0x0
/*0x3a0f*/  .byte 0x0

            data_3a10:
/*0x3a10*/  .word 0x20000648
            data_3a14:
/*0x3a14*/  .word 0x20000004

            jump_3a18:
/*0x3a18*/      push {r4, r5, r6, lr}
/*0x3a1a*/      cbz r0, jump_3a44
/*0x3a1c*/      ldr r5, [pc, #0x3c] /* data_3a5c */
/*0x3a1e*/      movs r4, #0x48
/*0x3a20*/      ldr r6, [pc, #0x3c] /* data_3a60 */
/*0x3a22*/      b jump_3a3c
            jump_3a24:
/*0x3a24*/      ldrb r0, [r5], #-1
/*0x3a28*/      and r0, r0, #7
/*0x3a2c*/      add.w r0, r0, r0, lsl #1
/*0x3a30*/      adds r1, r0, r6
/*0x3a32*/      mov r0, r4
/*0x3a34*/      addw r1, r1, #0x28a
/*0x3a38*/      bl call_408c
            jump_3a3c:
/*0x3a3c*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3a3e*/      uxtb r4, r4
/*0x3a40*/      bhs jump_3a24
/*0x3a42*/      pop {r4, r5, r6, pc}
            jump_3a44:
/*0x3a44*/      ldr r5, [pc, #0x1c] /* data_3a64 */
/*0x3a46*/      movs r4, #0x48
/*0x3a48*/      b jump_3a54
            jump_3a4a:
/*0x3a4a*/      mov r1, r5
/*0x3a4c*/      mov r0, r4
/*0x3a4e*/      bl call_408c
/*0x3a52*/      .short 0x1eed /* subs r5, r5, #3 */ 
            jump_3a54:
/*0x3a54*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3a56*/      uxtb r4, r4
/*0x3a58*/      bhs jump_3a4a
/*0x3a5a*/      pop {r4, r5, r6, pc}

            data_3a5c:
/*0x3a5c*/  .word 0x7bba
            data_3a60:
/*0x3a60*/  .word 0x20000730
            data_3a64:
/*0x3a64*/  .word 0x200009b7


            .thumb_func
            call_3a68:
/*0x3a68*/      cmp r0, #1
/*0x3a6a*/      beq jump_3a76
/*0x3a6c*/      movs r0, #5
            jump_3a6e:
/*0x3a6e*/      ldr r1, [pc, #0xc] /* data_3a7c */
/*0x3a70*/      strb r0, [r1, #3]
/*0x3a72*/      b.w call_3bec
            jump_3a76:
/*0x3a76*/      movs r0, #4
/*0x3a78*/      b jump_3a6e

/*0x3a7a*/  .byte 0x0
/*0x3a7b*/  .byte 0x0

            data_3a7c:
/*0x3a7c*/  .word 0x20000730


            .thumb_func
            call_3a80:
/*0x3a80*/      push {r4, lr}
/*0x3a82*/      bl call_3a68
/*0x3a86*/      ldr r0, [pc, #0x14] /* data_3a9c */
/*0x3a88*/      movs r1, #1
/*0x3a8a*/      strb r1, [r0, #6]
/*0x3a8c*/      ldr r0, [pc, #0x10] /* data_3aa0 */
/*0x3a8e*/      str r1, [r0, #4]
/*0x3a90*/      ldr r1, [pc, #0x10] /* data_3aa4 */
/*0x3a92*/      ldrh r2, [r1]
/*0x3a94*/      strh r2, [r0]
/*0x3a96*/      ldrb r1, [r1, #2]
/*0x3a98*/      strb r1, [r0, #2]
/*0x3a9a*/      pop {r4, pc}

            data_3a9c:
/*0x3a9c*/  .word 0x20000648
            data_3aa0:
/*0x3aa0*/  .word 0x20000004
            data_3aa4:
/*0x3aa4*/  .word 0x7aa2


            .thumb_func
            function_130_6:
/*0x3aa8*/      push {r4, r5, r6, lr}
/*0x3aaa*/      ldr r4, [pc, #0x5c] /* data_3b08 */
/*0x3aac*/      ldrb r0, [r4, #0xa]
/*0x3aae*/      cmp r0, #1
/*0x3ab0*/      beq jump_3ac4
/*0x3ab2*/      ldr r0, [pc, #0x58] /* data_3b0c */
/*0x3ab4*/      bl function_130_7
/*0x3ab8*/      movs r0, #5
/*0x3aba*/      ldr r1, [pc, #0x54] /* data_3b10 */
/*0x3abc*/      movs r2, #0
/*0x3abe*/      ldr r3, [pc, #0x54] /* data_3b14 */
/*0x3ac0*/      ldr r5, [pc, #0x54] /* data_3b18 */
/*0x3ac2*/      b jump_3aec
            jump_3ac4:
/*0x3ac4*/      ldr r0, [pc, #0x48] /* data_3b10 */
/*0x3ac6*/      movs r1, #0xd8
/*0x3ac8*/      subs r0, #0x90
/*0x3aca*/      bl mem_zero
/*0x3ace*/      ldr r4, [pc, #0x4c] /* data_3b1c */
/*0x3ad0*/      ldr r1, [pc, #0x38] /* data_3b0c */
/*0x3ad2*/      ldrb r0, [r4, #0xe8]!
/*0x3ad6*/      bl call_408c
/*0x3ada*/      ldrb r0, [r4, #1]
/*0x3adc*/      pop.w {r4, r5, r6, lr}
/*0x3ae0*/      ldr r1, [pc, #0x28] /* data_3b0c */
/*0x3ae2*/      b.w call_408c
            jump_3ae6:
/*0x3ae6*/      ldrb r6, [r3, r0]
/*0x3ae8*/      ldrb r6, [r5, r6]
/*0x3aea*/      strb r2, [r6, r1]
            jump_3aec:
/*0x3aec*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3aee*/      uxtb r0, r0
/*0x3af0*/      bhs jump_3ae6
/*0x3af2*/      ldr r3, [pc, #0x28] /* data_3b1c */
/*0x3af4*/      movs r2, #0xff
/*0x3af6*/      ldrb r0, [r4, #0xa]
/*0x3af8*/      adds r3, #0xe6
/*0x3afa*/      ldrb r3, [r0, r3]
/*0x3afc*/      strb r2, [r3, r1]
/*0x3afe*/      ldr r3, [pc, #0x20] /* data_3b20 */
/*0x3b00*/      ldrb r0, [r0, r3]
/*0x3b02*/      strb r2, [r0, r1]
/*0x3b04*/      pop {r4, r5, r6, pc}

/*0x3b06*/  .byte 0x0
/*0x3b07*/  .byte 0x0

            data_3b08:
/*0x3b08*/  .word 0x20000648
            data_3b0c:
/*0x3b0c*/  .word 0x7aa5
            data_3b10:
/*0x3b10*/  .word 0x200003be
            data_3b14:
/*0x3b14*/  .word 0x7a48
            data_3b18:
/*0x3b18*/  .word 0x200001c0
            data_3b1c:
/*0x3b1c*/  .word 0x20000730
            data_3b20:
/*0x3b20*/  .word 0x7a3a


            .thumb_func
            call_3b24:
/*0x3b24*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x3b28*/      bl call_6cd4
/*0x3b2c*/      ldr r4, [pc, #0x9c] /* data_3bcc */
/*0x3b2e*/      ldr r5, [pc, #0xa0] /* data_3bd0 */
/*0x3b30*/      ldrb r0, [r4, #7]
/*0x3b32*/      cbz r0, jump_3b7c
/*0x3b34*/      ldrb r0, [r4, #6]
/*0x3b36*/      cbnz r0, jump_3b3e
/*0x3b38*/      bl call_53b8
/*0x3b3c*/      cbz r0, jump_3b7c
            jump_3b3e:
/*0x3b3e*/      ldrb r0, [r4, #6]
/*0x3b40*/      cbz r0, jump_3b46
/*0x3b42*/      ldr r7, [pc, #0x90] /* data_3bd4 */
/*0x3b44*/      b jump_3b4a
            jump_3b46:
/*0x3b46*/      ldr r0, [pc, #0x90] /* data_3bd8 */
/*0x3b48*/      ldr r7, [r0]
            jump_3b4a:
/*0x3b4a*/      movs r1, #3
/*0x3b4c*/      ldr.w ip, [pc, #0x8c] /* data_3bdc */
/*0x3b50*/      b jump_3b76
            jump_3b52:
/*0x3b52*/      add.w r0, ip, r1
/*0x3b56*/      ldrb r3, [r0, #0x1e]
/*0x3b58*/      movs r0, #3
/*0x3b5a*/      b jump_3b70
            jump_3b5c:
/*0x3b5c*/      cmp r1, r0
/*0x3b5e*/      bne jump_3b64
/*0x3b60*/      ldrb r2, [r7, r0]
/*0x3b62*/      b jump_3b66
            jump_3b64:
/*0x3b64*/      movs r2, #0
            jump_3b66:
/*0x3b66*/      add.w r6, r0, r0, lsl #3
/*0x3b6a*/      add.w r6, r5, r6, lsl #3
/*0x3b6e*/      strb r2, [r6, r3]
            jump_3b70:
/*0x3b70*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3b72*/      uxtb r0, r0
/*0x3b74*/      bhs jump_3b5c
            jump_3b76:
/*0x3b76*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3b78*/      uxtb r1, r1
/*0x3b7a*/      bhs jump_3b52
            jump_3b7c:
/*0x3b7c*/      ldrb r0, [r4, #6]
/*0x3b7e*/      cbz r0, jump_3b8c
/*0x3b80*/      ldr r0, [pc, #0x5c] /* data_3be0 */
/*0x3b82*/      ldr r1, [pc, #0x50] /* data_3bd4 */
/*0x3b84*/      ldrb.w r0, [r0, #0xe9]
/*0x3b88*/      bl call_408c
            jump_3b8c:
/*0x3b8c*/      ldrb r0, [r4, #9]
/*0x3b8e*/      cbz r0, jump_3ba2
/*0x3b90*/      ldr r0, [pc, #0x50] /* data_3be4 */
/*0x3b92*/      ldrh r0, [r0]
/*0x3b94*/      lsls r0, r0, #0x15
/*0x3b96*/      asrs r0, r0, #8
/*0x3b98*/      lsrs r1, r0, #0x18
/*0x3b9a*/      movs r0, #0x39
/*0x3b9c*/      bl call_40d0
/*0x3ba0*/      b jump_3bbe
            jump_3ba2:
/*0x3ba2*/      movs r1, #0
/*0x3ba4*/      movs r0, #0x39
/*0x3ba6*/      bl call_40d0
/*0x3baa*/      ldr r0, [pc, #0x3c] /* data_3be8 */
/*0x3bac*/      ldrb r0, [r0, #2]
/*0x3bae*/      cbz r0, jump_3bbe
/*0x3bb0*/      add.w r0, r0, r0, lsl #3
/*0x3bb4*/      add.w r0, r5, r0, lsl #3
/*0x3bb8*/      movs r1, #0xff
/*0x3bba*/      strb r1, [r0, #-0xf]
            jump_3bbe:
/*0x3bbe*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x3bc2*/      movs r1, #0
/*0x3bc4*/      movs r0, #0x42
/*0x3bc6*/      b.w call_40d0

/*0x3bca*/  .byte 0x0
/*0x3bcb*/  .byte 0x0

            data_3bcc:
/*0x3bcc*/  .word 0x20000648
            data_3bd0:
/*0x3bd0*/  .word 0x2000032e
            data_3bd4:
/*0x3bd4*/  .word 0x20000004
            data_3bd8:
/*0x3bd8*/  .word 0x2000008c
            data_3bdc:
/*0x3bdc*/  .word 0x200001c0
            data_3be0:
/*0x3be0*/  .word 0x20000730
            data_3be4:
/*0x3be4*/  .word 0x2000001c
            data_3be8:
/*0x3be8*/  .word 0x2000005c


            .thumb_func
            call_3bec:
/*0x3bec*/      ldr r0, [pc, #4] /* data_3bf4 */
/*0x3bee*/      ldrb r0, [r0, #2]
/*0x3bf0*/      b.w jump_3f84

            data_3bf4:
/*0x3bf4*/  .word 0x2000005c

/*0x3bf8*/  .byte 0x0
/*0x3bf9*/  .byte 0x0
/*0x3bfa*/  .byte 0x4
/*0x3bfb*/  .byte 0x3
/*0x3bfc*/  .byte 0x1
/*0x3bfd*/  .byte 0x0
/*0x3bfe*/  .byte 0x0
/*0x3bff*/  .byte 0x34
/*0x3c00*/  .byte 0x4
/*0x3c01*/  .byte 0x0
/*0x3c02*/  .byte 0x2
/*0x3c03*/  .byte 0x0


            .thumb_func
            call_3c04:
/*0x3c04*/      push {r4, r5, r6, lr}
/*0x3c06*/      ldr r0, [pc, #0xf0] /* data_3cf8 */
/*0x3c08*/      ldr r5, [pc, #0xf0] /* data_3cfc */
/*0x3c0a*/      ldrb r0, [r0, #0xb]
/*0x3c0c*/      cmp r0, #8
/*0x3c0e*/      bhs switch_3c6e
/*0x3c10*/      tbb [pc, r0]

/*0x3c14*/  .byte 0x2d
/*0x3c15*/  .byte 0x4
/*0x3c16*/  .byte 0x4
/*0x3c17*/  .byte 0x4
/*0x3c18*/  .byte 0xd
/*0x3c19*/  .byte 0xf
/*0x3c1a*/  .byte 0x16
/*0x3c1b*/  .byte 0x3b

            switch_3c1c:
/*0x3c1c*/      ldr r1, [pc, #0xe0] /* data_3d00 */
/*0x3c1e*/      add.w r0, r0, r0, lsl #3
/*0x3c22*/      add.w r0, r1, r0, lsl #3
/*0x3c26*/      movs r2, #0xff
/*0x3c28*/      movs r1, #0x48
/*0x3c2a*/      subs r0, #0x48
/*0x3c2c*/      b jump_3c38
            switch_3c2e:
/*0x3c2e*/      movs r2, #0x80
/*0x3c30*/      b jump_3c34
            switch_3c32:
/*0x3c32*/      movs r2, #0xff
            jump_3c34:
/*0x3c34*/      ldr r0, [pc, #0xc8] /* data_3d00 */
/*0x3c36*/      movs r1, #0xd8
            jump_3c38:
/*0x3c38*/      pop.w {r4, r5, r6, lr}
/*0x3c3c*/      b.w mem_set
            switch_3c40:
/*0x3c40*/      movs r4, #0x48
/*0x3c42*/      b jump_3c68
            jump_3c44:
/*0x3c44*/      ldr r0, [pc, #0xbc] /* data_3d04 */
/*0x3c46*/      ldrb r1, [r5, #5]
/*0x3c48*/      ldrb r0, [r0, r4]
/*0x3c4a*/      cmp r1, r0
/*0x3c4c*/      bne jump_3c70
/*0x3c4e*/      movs r6, #0
/*0x3c50*/      b jump_3c78
            jump_3c52:
/*0x3c52*/      mov r1, r6
/*0x3c54*/      movs r0, #0x39
/*0x3c56*/      bl call_40d0
/*0x3c5a*/      mov r1, r6
/*0x3c5c*/      movs r0, #0x42
/*0x3c5e*/      b jump_3c64
            jump_3c60:
/*0x3c60*/      mov r1, r6
/*0x3c62*/      movs r0, #0x29
            jump_3c64:
/*0x3c64*/      bl call_40d0
            jump_3c68:
/*0x3c68*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3c6a*/      uxtb r4, r4
/*0x3c6c*/      bhs jump_3c44
            switch_3c6e:
/*0x3c6e*/      pop {r4, r5, r6, pc}
            jump_3c70:
/*0x3c70*/      ldrb r1, [r5, #4]
/*0x3c72*/      cmp r1, r0
/*0x3c74*/      bne jump_3c68
/*0x3c76*/      movs r6, #0xff
            jump_3c78:
/*0x3c78*/      mov r1, r6
/*0x3c7a*/      mov r0, r4
/*0x3c7c*/      bl call_40d0
/*0x3c80*/      cmp r4, #0x3a
/*0x3c82*/      beq jump_3c52
/*0x3c84*/      cmp r4, #0x10
/*0x3c86*/      bne jump_3c68
/*0x3c88*/      b jump_3c60
            switch_3c8a:
/*0x3c8a*/      movs r1, #0xd8
/*0x3c8c*/      ldr r0, [pc, #0x70] /* data_3d00 */
/*0x3c8e*/      bl mem_zero
/*0x3c92*/      ldrb r0, [r5, #4]
/*0x3c94*/      cbz r0, jump_3ca2
/*0x3c96*/      movs r0, #0
            jump_3c98:
/*0x3c98*/      bl call_3ddc
/*0x3c9c*/      cbz r0, jump_3ca8
/*0x3c9e*/      movs r0, #0x12
/*0x3ca0*/      b jump_3caa
            jump_3ca2:
/*0x3ca2*/      movs r0, #1
/*0x3ca4*/      strb r0, [r5, #4]
/*0x3ca6*/      b jump_3c98
            jump_3ca8:
/*0x3ca8*/      movs r0, #9
            jump_3caa:
/*0x3caa*/      ldr r4, [pc, #0x5c] /* data_3d08 */
/*0x3cac*/      movs r1, #0xb4
/*0x3cae*/      ldrb r0, [r4, r0]
/*0x3cb0*/      bl call_40d0
/*0x3cb4*/      ldr r5, [pc, #0x54] /* data_3d0c */
/*0x3cb6*/      ldrb r0, [r5]
/*0x3cb8*/      lsls r0, r0, #0x1f
/*0x3cba*/      beq jump_3cc4
/*0x3cbc*/      ldrb r0, [r4, #0x1e]
/*0x3cbe*/      movs r1, #0xb4
/*0x3cc0*/      bl call_40d0
            jump_3cc4:
/*0x3cc4*/      ldrb r0, [r5]
/*0x3cc6*/      lsls r0, r0, #0x1e
/*0x3cc8*/      bpl jump_3cd2
/*0x3cca*/      ldrb r0, [r4, #0x1f]
/*0x3ccc*/      movs r1, #0xb4
/*0x3cce*/      bl call_40d0
            jump_3cd2:
/*0x3cd2*/      ldrb r0, [r5]
/*0x3cd4*/      lsls r0, r0, #0x1d
/*0x3cd6*/      bpl jump_3ce2
/*0x3cd8*/      ldrb.w r0, [r4, #0x20]
/*0x3cdc*/      movs r1, #0xb4
/*0x3cde*/      bl call_40d0
            jump_3ce2:
/*0x3ce2*/      ldrb r0, [r5]
/*0x3ce4*/      lsls r0, r0, #0x1c
/*0x3ce6*/      bpl switch_3c6e
/*0x3ce8*/      ldrb.w r0, [r4, #0x21]
/*0x3cec*/      pop.w {r4, r5, r6, lr}
/*0x3cf0*/      movs r1, #0xb4
/*0x3cf2*/      b.w call_40d0

/*0x3cf6*/  .byte 0x0
/*0x3cf7*/  .byte 0x0

            data_3cf8:
/*0x3cf8*/  .word 0x20000648
            data_3cfc:
/*0x3cfc*/  .word 0x2000008c
            data_3d00:
/*0x3d00*/  .word 0x2000032e
            data_3d04:
/*0x3d04*/  .word 0x7ae3
            data_3d08:
/*0x3d08*/  .word 0x200001c0
            data_3d0c:
/*0x3d0c*/  .word 0x20000001


            .thumb_func
            call_3d10:
/*0x3d10*/      ldr r0, [pc, #0x4c] /* data_3d60 */
/*0x3d12*/      push {r4, lr}
/*0x3d14*/      ldrb r0, [r0, #7]
/*0x3d16*/      cmp r0, #4
/*0x3d18*/      beq jump_3d22
/*0x3d1a*/      cmp r0, #5
/*0x3d1c*/      beq jump_3d22
/*0x3d1e*/      ldr r1, [pc, #0x44] /* data_3d64 */
/*0x3d20*/      b jump_3d2e
            jump_3d22:
/*0x3d22*/      ldr r0, [pc, #0x44] /* data_3d68 */
/*0x3d24*/      ldrh r0, [r0, #2]
/*0x3d26*/      lsls r0, r0, #0x15
/*0x3d28*/      bpl jump_3d36
/*0x3d2a*/      ldr r1, [pc, #0x38] /* data_3d64 */
/*0x3d2c*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_3d2e:
/*0x3d2e*/      movs r0, #0x42
/*0x3d30*/      bl call_408c
/*0x3d34*/      b jump_3d3e
            jump_3d36:
/*0x3d36*/      movs r1, #0
/*0x3d38*/      movs r0, #0x42
/*0x3d3a*/      bl call_40d0
            jump_3d3e:
/*0x3d3e*/      movs r1, #0
/*0x3d40*/      movs r0, #0x39
/*0x3d42*/      bl call_40d0
/*0x3d46*/      ldr r0, [pc, #0x24] /* data_3d6c */
/*0x3d48*/      ldrb r0, [r0, #2]
/*0x3d4a*/      cmp r0, #0
/*0x3d4c*/      beq jump_3d5e
/*0x3d4e*/      ldr r2, [pc, #0x20] /* data_3d70 */
/*0x3d50*/      add.w r0, r0, r0, lsl #3
/*0x3d54*/      add.w r0, r2, r0, lsl #3
/*0x3d58*/      movs r1, #0xff
/*0x3d5a*/      strb r1, [r0, #-0xf]
            jump_3d5e:
/*0x3d5e*/      pop {r4, pc}

            data_3d60:
/*0x3d60*/  .word 0x200019d0
            data_3d64:
/*0x3d64*/  .word 0x7aa5
            data_3d68:
/*0x3d68*/  .word 0x2000000c
            data_3d6c:
/*0x3d6c*/  .word 0x2000005c
            data_3d70:
/*0x3d70*/  .word 0x2000032e


            .thumb_func
            call_3d74:
/*0x3d74*/      push {r4, lr}
/*0x3d76*/      bl call_5b90
/*0x3d7a*/      movs r1, #0
/*0x3d7c*/      movs r0, #0x39
/*0x3d7e*/      bl call_40d0
/*0x3d82*/      movs r1, #0
/*0x3d84*/      pop.w {r4, lr}
/*0x3d88*/      movs r0, #0x42
/*0x3d8a*/      b.w call_40d0

/*0x3d8e*/  .byte 0x0
/*0x3d8f*/  .byte 0x0


            .thumb_func
            call_3d90:
/*0x3d90*/      mov r3, r1
/*0x3d92*/      ldr r1, [pc, #0x40] /* data_3dd4 */
/*0x3d94*/      push {r4, lr}
/*0x3d96*/      ldrb r1, [r1, #2]
/*0x3d98*/      cmp r1, #0
/*0x3d9a*/      beq jump_3dd2
/*0x3d9c*/      add.w r1, r1, r1, lsl #1
/*0x3da0*/      add.w r4, r0, r1, lsl #5
/*0x3da4*/      subs r4, #0x60
/*0x3da6*/      lsrs r0, r4, #2
/*0x3da8*/      lsls r1, r0, #0xc
/*0x3daa*/      ldr r0, [pc, #0x2c] /* data_3dd8 */
/*0x3dac*/      mov.w r2, #0x1000
/*0x3db0*/      add.w r1, r1, #0x5000
/*0x3db4*/      cbz r3, jump_3dbe
/*0x3db6*/      pop.w {r4, lr}
/*0x3dba*/      b.w jump_6c88
            jump_3dbe:
/*0x3dbe*/      bl function_25
/*0x3dc2*/      ldr r1, [pc, #0x14] /* data_3dd8 */
/*0x3dc4*/      and r0, r4, #3
/*0x3dc8*/      add.w r0, r1, r0, lsl #10
/*0x3dcc*/      ldr r1, [pc, #4] /* data_3dd4 */
/*0x3dce*/      .short 0x1f09 /* subs r1, r1, #4 */ 
/*0x3dd0*/      str r0, [r1]
            jump_3dd2:
/*0x3dd2*/      pop {r4, pc}

            data_3dd4:
/*0x3dd4*/  .word 0x2000005c
            data_3dd8:
/*0x3dd8*/  .word 0x200009ca


            .thumb_func
            call_3ddc:
/*0x3ddc*/      push {r3, r4, r5, lr}
/*0x3dde*/      mov r5, r0
/*0x3de0*/      movs r2, #2
/*0x3de2*/      movs r1, #0
/*0x3de4*/      mov r0, sp
/*0x3de6*/      bl function_25
/*0x3dea*/      ldrh.w r1, [sp]
/*0x3dee*/      movw r4, #0x8001
/*0x3df2*/      cmp r1, r4
/*0x3df4*/      beq jump_3e16
/*0x3df6*/      cbz r5, jump_3e12
/*0x3df8*/      ldr r0, [pc, #0x20] /* data_3e1c */
/*0x3dfa*/      ldrb r0, [r0, #2]
/*0x3dfc*/      bl call_3f04
/*0x3e00*/      movs r2, #2
/*0x3e02*/      movs r1, #0
/*0x3e04*/      mov r0, sp
/*0x3e06*/      bl function_25
/*0x3e0a*/      ldrh.w r0, [sp]
/*0x3e0e*/      cmp r0, r4
/*0x3e10*/      beq jump_3e16
            jump_3e12:
/*0x3e12*/      movs r0, #0
/*0x3e14*/      pop {r3, r4, r5, pc}
            jump_3e16:
/*0x3e16*/      movs r0, #1
/*0x3e18*/      pop {r3, r4, r5, pc}

/*0x3e1a*/  .byte 0x0
/*0x3e1b*/  .byte 0x0

            data_3e1c:
/*0x3e1c*/  .word 0x2000005c


            .thumb_func
            call_3e20:
/*0x3e20*/      push {r4, r5, r6, lr}
/*0x3e22*/      mov r4, r0
/*0x3e24*/      movs r2, #4
/*0x3e26*/      movs r1, #0
/*0x3e28*/      ldr r0, [pc, #0x6c] /* data_3e98 */
/*0x3e2a*/      bl function_25
/*0x3e2e*/      ldr r5, [pc, #0x68] /* data_3e98 */
/*0x3e30*/      movw r1, #0x8001
/*0x3e34*/      ldrh r0, [r5]
/*0x3e36*/      cmp r0, r1
/*0x3e38*/      beq jump_3e52
/*0x3e3a*/      cmp.w r0, #0x1000
/*0x3e3e*/      bhs jump_3e44
/*0x3e40*/      ldrb r4, [r5, #2]
/*0x3e42*/      b jump_3e4a
            jump_3e44:
/*0x3e44*/      cmp r4, #0xff
/*0x3e46*/      bne jump_3e4a
/*0x3e48*/      movs r4, #0
            jump_3e4a:
/*0x3e4a*/      mov r0, r4
/*0x3e4c*/      bl call_3f04
/*0x3e50*/      b jump_3e62
            jump_3e52:
/*0x3e52*/      cmp r4, #0xff
/*0x3e54*/      beq jump_3e62
/*0x3e56*/      ldrb r0, [r5, #2]
/*0x3e58*/      cmp r0, r4
/*0x3e5a*/      beq jump_3e62
/*0x3e5c*/      strb r4, [r5, #2]
/*0x3e5e*/      bl call_3f98
            jump_3e62:
/*0x3e62*/      ldrb r0, [r5, #2]
/*0x3e64*/      movs r2, #2
/*0x3e66*/      lsls r1, r0, #0xc
/*0x3e68*/      ldr r0, [pc, #0x30] /* data_3e9c */
/*0x3e6a*/      add.w r1, r1, #0x1000
/*0x3e6e*/      bl function_25
/*0x3e72*/      ldr r0, [pc, #0x28] /* data_3e9c */
/*0x3e74*/      ldrh r0, [r0]
/*0x3e76*/      cmp r0, #9
/*0x3e78*/      beq jump_3e82
/*0x3e7a*/      pop.w {r4, r5, r6, lr}
/*0x3e7e*/      b.w call_3ea0
            jump_3e82:
/*0x3e82*/      ldrb r0, [r5, #2]
/*0x3e84*/      pop.w {r4, r5, r6, lr}
/*0x3e88*/      lsls r1, r0, #0xc
/*0x3e8a*/      movw r2, #0x29a
/*0x3e8e*/      ldr r0, [pc, #0xc] /* data_3e9c */
/*0x3e90*/      add.w r1, r1, #0x1000
/*0x3e94*/      b.w function_25

            data_3e98:
/*0x3e98*/  .word 0x2000005c
            data_3e9c:
/*0x3e9c*/  .word 0x20000730


            .thumb_func
            call_3ea0:
/*0x3ea0*/      ldr r1, [pc, #0x28] /* data_3ecc */
/*0x3ea2*/      push {r4, lr}
/*0x3ea4*/      movs r0, #9
/*0x3ea6*/      strh r0, [r1]
/*0x3ea8*/      ldr r0, [pc, #0x20] /* data_3ecc */
/*0x3eaa*/      movs r2, #0xff
/*0x3eac*/      movs r1, #0xc0
/*0x3eae*/      adds r0, #0x28
/*0x3eb0*/      bl mem_set
/*0x3eb4*/      ldr r0, [pc, #0x14] /* data_3ecc */
/*0x3eb6*/      movs r2, #0xff
/*0x3eb8*/      movs r1, #0xc8
/*0x3eba*/      adds r0, #0xea
/*0x3ebc*/      bl mem_set
/*0x3ec0*/      bl call_3f1c
/*0x3ec4*/      pop.w {r4, lr}
/*0x3ec8*/      b.w call_3bec

            data_3ecc:
/*0x3ecc*/  .word 0x20000730


            .thumb_func
            call_3ed0:
/*0x3ed0*/      push {r4, lr}
/*0x3ed2*/      ldr r4, [pc, #0x2c] /* data_3f00 */
/*0x3ed4*/      movs r0, #0
/*0x3ed6*/      strb r0, [r4, #2]
/*0x3ed8*/      bl call_3ea0
            jump_3edc:
/*0x3edc*/      ldrb r0, [r4, #2]
/*0x3ede*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x3ee0*/      uxtb r0, r0
/*0x3ee2*/      strb r0, [r4, #2]
/*0x3ee4*/      cmp r0, #4
/*0x3ee6*/      bhs jump_3eee
/*0x3ee8*/      bl call_3bec
/*0x3eec*/      b jump_3edc
            jump_3eee:
/*0x3eee*/      movs r0, #0
/*0x3ef0*/      bl call_3f04
/*0x3ef4*/      pop.w {r4, lr}
/*0x3ef8*/      movs r0, #0xff
/*0x3efa*/      b.w call_3e20

/*0x3efe*/  .byte 0x0
/*0x3eff*/  .byte 0x0

            data_3f00:
/*0x3f00*/  .word 0x2000005c


            .thumb_func
            call_3f04:
/*0x3f04*/      ldr r1, [pc, #0x10] /* data_3f18 */
/*0x3f06*/      movw r2, #0x8001
/*0x3f0a*/      strh r2, [r1]
/*0x3f0c*/      strb r0, [r1, #2]
/*0x3f0e*/      movs r0, #0xff
/*0x3f10*/      strb r0, [r1, #3]
/*0x3f12*/      b.w call_3f98

/*0x3f16*/  .byte 0x0
/*0x3f17*/  .byte 0x0

            data_3f18:
/*0x3f18*/  .word 0x2000005c


            .thumb_func
            call_3f1c:
/*0x3f1c*/      push {r4, r5, r6, lr}
/*0x3f1e*/      ldr r5, [pc, #0x54] /* data_3f74 */
/*0x3f20*/      movs r0, #0
/*0x3f22*/      strb r0, [r5, #2]
/*0x3f24*/      movs r0, #7
/*0x3f26*/      strb r0, [r5, #3]
/*0x3f28*/      adds r4, r5, #4
/*0x3f2a*/      mov r2, r0
/*0x3f2c*/      b jump_3f42
            jump_3f2e:
/*0x3f2e*/      ldr r1, [pc, #0x48] /* data_3f78 */
/*0x3f30*/      movs r0, #5
/*0x3f32*/      b jump_3f3c
            jump_3f34:
/*0x3f34*/      ldrb r3, [r1], #1
/*0x3f38*/      strb r3, [r4], #1
            jump_3f3c:
/*0x3f3c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3f3e*/      uxtb r0, r0
/*0x3f40*/      bhs jump_3f34
            jump_3f42:
/*0x3f42*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x3f44*/      uxtb r2, r2
/*0x3f46*/      bhs jump_3f2e
/*0x3f48*/      movs r0, #0
/*0x3f4a*/      bl call_60cc
/*0x3f4e*/      ldr r0, [pc, #0x24] /* data_3f74 */
/*0x3f50*/      ldr r1, [pc, #0x28] /* data_3f7c */
/*0x3f52*/      adds r0, #0x80
/*0x3f54*/      ldrh r1, [r1]
/*0x3f56*/      strh.w r1, [r0, #0x68]
/*0x3f5a*/      movs r0, #3
/*0x3f5c*/      strb r0, [r5, #0x11]
/*0x3f5e*/      movs r1, #0xd8
/*0x3f60*/      ldr r0, [pc, #0x1c] /* data_3f80 */
/*0x3f62*/      bl mem_zero
/*0x3f66*/      pop.w {r4, r5, r6, lr}
/*0x3f6a*/      ldr r0, [pc, #0x14] /* data_3f80 */
/*0x3f6c*/      movs r1, #0xf
/*0x3f6e*/      adds r0, #0xd8
/*0x3f70*/      b.w mem_zero

            data_3f74:
/*0x3f74*/  .word 0x20000730
            data_3f78:
/*0x3f78*/  .word 0x8114
            data_3f7c:
/*0x3f7c*/  .word 0x7a3c
            data_3f80:
/*0x3f80*/  .word 0x200008e2

            jump_3f84:
/*0x3f84*/      lsls r1, r0, #0xc
/*0x3f86*/      movw r2, #0x29a
/*0x3f8a*/      ldr r0, [pc, #8] /* data_3f94 */
/*0x3f8c*/      add.w r1, r1, #0x1000
/*0x3f90*/      b.w jump_6c88

            data_3f94:
/*0x3f94*/  .word 0x20000730


            .thumb_func
            call_3f98:
/*0x3f98*/      movs r2, #4
/*0x3f9a*/      movs r1, #0
/*0x3f9c*/      ldr r0, [pc, #4] /* data_3fa4 */
/*0x3f9e*/      b.w jump_6c88

/*0x3fa2*/  .byte 0x0
/*0x3fa3*/  .byte 0x0

            data_3fa4:
/*0x3fa4*/  .word 0x2000005c


            .thumb_func
            call_3fa8:
/*0x3fa8*/      add.w r0, r0, r1, lsr #3
/*0x3fac*/      and r3, r1, #7
/*0x3fb0*/      movs r1, #1
/*0x3fb2*/      lsls r1, r3
/*0x3fb4*/      cmp r2, #0
/*0x3fb6*/      ldrb r2, [r0]
/*0x3fb8*/      uxtb r1, r1
/*0x3fba*/      beq jump_3fc0
/*0x3fbc*/      orrs r2, r1
/*0x3fbe*/      b jump_3fc2
            jump_3fc0:
/*0x3fc0*/      bics r2, r1
            jump_3fc2:
/*0x3fc2*/      strb r2, [r0]
/*0x3fc4*/      bx lr

            .thumb_func
            call_3fc6:
/*0x3fc6*/      push {r4, r5, r6, lr}
/*0x3fc8*/      mov r6, r0
            jump_3fca:
/*0x3fca*/      movs r5, #0
/*0x3fcc*/      movs r4, #3
/*0x3fce*/      b jump_3fdc
            jump_3fd0:
/*0x3fd0*/      bl rand
/*0x3fd4*/      uxtb r0, r0
/*0x3fd6*/      strb r0, [r6, r4]
/*0x3fd8*/      add r0, r5
/*0x3fda*/      uxth r5, r0
            jump_3fdc:
/*0x3fdc*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3fde*/      uxtb r4, r4
/*0x3fe0*/      bhs jump_3fd0
/*0x3fe2*/      cmp r5, #0xe0
/*0x3fe4*/      blo jump_3fca
/*0x3fe6*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_3fe8:
/*0x3fe8*/      push {r4, r5, lr}
/*0x3fea*/      lsls r3, r1, #1
/*0x3fec*/      cmp r3, #0xff
/*0x3fee*/      bls jump_3ff6
/*0x3ff0*/      rsb.w r3, r3, #0x1fe
/*0x3ff4*/      uxth r3, r3
            jump_3ff6:
/*0x3ff6*/      movs r4, #0x2b
/*0x3ff8*/      udiv r4, r0, r4
/*0x3ffc*/      movs r5, #0x55
/*0x3ffe*/      mla r0, r4, r5, r0
/*0x4002*/      sub.w r1, r1, r3, lsr #1
/*0x4006*/      uxtb r1, r1
/*0x4008*/      add.w r0, r0, r0, lsl #1
/*0x400c*/      strb r1, [r2]
/*0x400e*/      lsls r0, r0, #0x19
/*0x4010*/      strb r1, [r2, #1]
/*0x4012*/      lsrs r0, r0, #0x18
/*0x4014*/      strb r1, [r2, #2]
/*0x4016*/      lsls r5, r4, #0x1f
/*0x4018*/      beq jump_401e
/*0x401a*/      rsb.w r0, r0, #0xff
            jump_401e:
/*0x401e*/      muls r0, r3, r0
/*0x4020*/      ubfx r0, r0, #8, #8
/*0x4024*/      cmp r4, #5
/*0x4026*/      bhs jump_405c
/*0x4028*/      tbb [pc, r4]

/*0x402c*/  .byte 0x3
/*0x402d*/  .byte 0x7
/*0x402e*/  .byte 0xc
/*0x402f*/  .byte 0x10
/*0x4030*/  .byte 0x13
/*0x4031*/  .byte 0x0

            switch_4032:
/*0x4032*/      add r3, r1
/*0x4034*/      strb r3, [r2]
/*0x4036*/      add r0, r1
/*0x4038*/      b jump_4040
            switch_403a:
/*0x403a*/      add r0, r1
/*0x403c*/      strb r0, [r2]
/*0x403e*/      adds r0, r1, r3
            jump_4040:
/*0x4040*/      strb r0, [r2, #1]
/*0x4042*/      pop {r4, r5, pc}
            switch_4044:
/*0x4044*/      add r3, r1
/*0x4046*/      strb r3, [r2, #1]
            jump_4048:
/*0x4048*/      add r0, r1
/*0x404a*/      b jump_4058
            switch_404c:
/*0x404c*/      add r0, r1
/*0x404e*/      strb r0, [r2, #1]
/*0x4050*/      b jump_4056
            switch_4052:
/*0x4052*/      add r0, r1
/*0x4054*/      strb r0, [r2]
            jump_4056:
/*0x4056*/      adds r0, r1, r3
            jump_4058:
/*0x4058*/      strb r0, [r2, #2]
/*0x405a*/      pop {r4, r5, pc}
            jump_405c:
/*0x405c*/      add r3, r1
/*0x405e*/      strb r3, [r2]
/*0x4060*/      b jump_4048

/*0x4062*/  .byte 0x0
/*0x4063*/  .byte 0x0

            jump_4064:
/*0x4064*/      push {r4, lr}
/*0x4066*/      ldr r1, [pc, #0x20] /* data_4088 */
/*0x4068*/      movs r3, #0x48
/*0x406a*/      b jump_4080
            jump_406c:
/*0x406c*/      movs r2, #3
/*0x406e*/      b jump_4078
            jump_4070:
/*0x4070*/      ldrb r4, [r0], #1
/*0x4074*/      strb r4, [r1], #0x48
            jump_4078:
/*0x4078*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x407a*/      uxtb r2, r2
/*0x407c*/      bhs jump_4070
/*0x407e*/      subs r1, #0xd7
            jump_4080:
/*0x4080*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4082*/      uxtb r3, r3
/*0x4084*/      bhs jump_406c
/*0x4086*/      pop {r4, pc}

            data_4088:
/*0x4088*/  .word 0x2000032e


            .thumb_func
            call_408c:
/*0x408c*/      cmp r0, #0xff
/*0x408e*/      beq jump_40a6
/*0x4090*/      ldr r2, [pc, #0x14] /* data_40a8 */
/*0x4092*/      add r2, r0
/*0x4094*/      movs r0, #0
            jump_4096:
/*0x4096*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4098*/      ldrb r3, [r1], #1
/*0x409c*/      uxtb r0, r0
/*0x409e*/      strb r3, [r2], #0x48
/*0x40a2*/      cmp r0, #3
/*0x40a4*/      blo jump_4096
            jump_40a6:
/*0x40a6*/      bx lr

            data_40a8:
/*0x40a8*/  .word 0x2000032e


            .thumb_func
            function_130_7:
/*0x40ac*/      push {r4, r5, r6, lr}
/*0x40ae*/      mov r5, r0
/*0x40b0*/      ldr r6, [pc, #0x18] /* data_40cc */
/*0x40b2*/      movs r4, #3
/*0x40b4*/      b jump_40c4
            jump_40b6:
/*0x40b6*/      ldrb r2, [r5]
/*0x40b8*/      movs r1, #0x48
/*0x40ba*/      mov r0, r6
/*0x40bc*/      bl mem_set
/*0x40c0*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x40c2*/      adds r6, #0x48
            jump_40c4:
/*0x40c4*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x40c6*/      uxtb r4, r4
/*0x40c8*/      bhs jump_40b6
/*0x40ca*/      pop {r4, r5, r6, pc}

            data_40cc:
/*0x40cc*/  .word 0x2000032e


            .thumb_func
            call_40d0:
/*0x40d0*/      cmp r0, #0xff
/*0x40d2*/      beq jump_40e6
/*0x40d4*/      ldr r2, [pc, #0x10] /* data_40e8 */
/*0x40d6*/      add r0, r2
/*0x40d8*/      movs r2, #3
/*0x40da*/      b jump_40e0
            jump_40dc:
/*0x40dc*/      strb r1, [r0], #0x48
            jump_40e0:
/*0x40e0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x40e2*/      uxtb r2, r2
/*0x40e4*/      bhs jump_40dc
            jump_40e6:
/*0x40e6*/      bx lr

            data_40e8:
/*0x40e8*/  .word 0x2000032e


            .thumb_func
            function_11:
/*0x40ec*/      push {r2, r3, r4, r5, r6, lr}
/*0x40ee*/      ldr r4, [pc, #0x20] /* data_4110 */
/*0x40f0*/      movs r0, #5
/*0x40f2*/      strh.w r0, [sp]
/*0x40f6*/      mov.w r5, #0x400
/*0x40fa*/      str r5, [r4, #0x28]
/*0x40fc*/      movs r2, #2
/*0x40fe*/      add r1, sp, #4
/*0x4100*/      mov r0, sp
/*0x4102*/      bl spi_write_read
/*0x4106*/      str r5, [r4, #0x24]
/*0x4108*/      ldrb.w r0, [sp, #5]
/*0x410c*/      pop {r2, r3, r4, r5, r6, pc}

/*0x410e*/  .byte 0x0
/*0x410f*/  .byte 0x0

            data_4110:
/*0x4110*/  .word 0x400b2000


            .thumb_func
            function_29:
/*0x4114*/      push {r4, r5, r6, lr}
/*0x4116*/      sub sp, #0x30
/*0x4118*/      bl function_82
/*0x411c*/      ldr r6, [pc, #0x60] /* data_4180 */
/*0x411e*/      ldrb r0, [r6]
/*0x4120*/      cmp r0, #1
/*0x4122*/      bne jump_4178
/*0x4124*/      movs r4, #0
/*0x4126*/      mov r2, r4
/*0x4128*/      movs r1, #0x20
/*0x412a*/      movs r3, #1
/*0x412c*/      mov r0, r2
/*0x412e*/      bl ckcu_clocks_enable
/*0x4132*/      mov.w r0, #0x4000
/*0x4136*/      asrs r5, r0, #4
/*0x4138*/      strd r0, r5, [sp]
/*0x413c*/      movs r0, #8
/*0x413e*/      strd r0, r4, [sp, #8]
/*0x4142*/      str r4, [sp, #0x10]
/*0x4144*/      str r4, [sp, #0x14]
/*0x4146*/      movs r0, #4
/*0x4148*/      str r4, [sp, #0x18]
/*0x414a*/      strd r4, r0, [sp, #0x1c]
/*0x414e*/      ldr r4, [pc, #0x34] /* data_4184 */
/*0x4150*/      str r0, [sp, #0x24]
/*0x4152*/      str r0, [sp, #0x28]
/*0x4154*/      mov r1, sp
/*0x4156*/      mov r0, r4
/*0x4158*/      bl function_e_54
/*0x415c*/      movs r1, #1
/*0x415e*/      mov r0, r4
/*0x4160*/      bl call_6552
/*0x4164*/      ldr r0, [pc, #0x20] /* data_4188 */
/*0x4166*/      str r5, [r0, #0x24]
/*0x4168*/      movs r1, #1
/*0x416a*/      mov r0, r4
/*0x416c*/      bl call_64f4
/*0x4170*/      bl pinmux_b789_spi
/*0x4174*/      movs r0, #2
/*0x4176*/      strb r0, [r6]
            jump_4178:
/*0x4178*/      add sp, #0x30
/*0x417a*/      movs r0, #1
/*0x417c*/      pop {r4, r5, r6, pc}

/*0x417e*/  .byte 0x0
/*0x417f*/  .byte 0x0

            data_4180:
/*0x4180*/  .word 0x20000018
            data_4184:
/*0x4184*/  .word 0x40044000
            data_4188:
/*0x4188*/  .word 0x400b2000


            .thumb_func
            function_10:
/*0x418c*/      push {r4, lr}
/*0x418e*/      bl function_11
/*0x4192*/      ubfx r0, r0, #0, #1
/*0x4196*/      pop {r4, pc}

            .thumb_func
            function_82:
/*0x4198*/      push {r4, r5, r6, lr}
/*0x419a*/      ldr r4, [pc, #0x48] /* data_41e4 */
/*0x419c*/      ldrb r0, [r4]
/*0x419e*/      cbnz r0, jump_41e0
/*0x41a0*/      movs r1, #0
/*0x41a2*/      mov.w r0, #0x20000
/*0x41a6*/      movs r3, #1
/*0x41a8*/      mov r2, r1
/*0x41aa*/      bl ckcu_clocks_enable
/*0x41ae*/      ldr r6, [pc, #0x38] /* data_41e8 */
/*0x41b0*/      mov.w r5, #0x400
/*0x41b4*/      movs r2, #0
/*0x41b6*/      mov r1, r5
/*0x41b8*/      mov r0, r6
/*0x41ba*/      bl gpio_set_pin_pull_up_down
/*0x41be*/      movs r2, #1
/*0x41c0*/      mov r1, r5
/*0x41c2*/      mov r0, r6
/*0x41c4*/      bl gpio_set_output_current
/*0x41c8*/      movs r2, #1
/*0x41ca*/      movs r1, #0x80
/*0x41cc*/      mov r0, r6
/*0x41ce*/      bl gpio_set_output_current
/*0x41d2*/      movs r2, #1
/*0x41d4*/      lsls r1, r2, #8
/*0x41d6*/      mov r0, r6
/*0x41d8*/      bl gpio_set_output_current
/*0x41dc*/      movs r0, #1
/*0x41de*/      strb r0, [r4]
            jump_41e0:
/*0x41e0*/      movs r0, #1
/*0x41e2*/      pop {r4, r5, r6, pc}

            data_41e4:
/*0x41e4*/  .word 0x20000018
            data_41e8:
/*0x41e8*/  .word 0x400b2000


            .thumb_func
            pinmux_b789_gpio:
/*0x41ec*/      push {r4, r5, r6, lr}
/*0x41ee*/      bl function_42
/*0x41f2*/      ldr r5, [pc, #0x3c] /* data_4230 */
/*0x41f4*/      mov.w r4, #0x400
/*0x41f8*/      movs r2, #0
/*0x41fa*/      mov r1, r4
/*0x41fc*/      mov r0, r5
/*0x41fe*/      bl gpio_set_pin_pull_up_down
/*0x4202*/      movs r2, #0
/*0x4204*/      mov r1, r4
/*0x4206*/      mov r0, r5
/*0x4208*/      bl gpio_set_input_output
/*0x420c*/      movs r2, #0
/*0x420e*/      movs r1, #7
/*0x4210*/      movs r0, #1
/*0x4212*/      bl afio_pin_config
/*0x4216*/      movs r2, #0
/*0x4218*/      movs r1, #8
/*0x421a*/      movs r0, #1
/*0x421c*/      bl afio_pin_config
/*0x4220*/      pop.w {r4, r5, r6, lr}
/*0x4224*/      movs r2, #0
/*0x4226*/      movs r1, #9
/*0x4228*/      movs r0, #1
/*0x422a*/      b.w afio_pin_config

/*0x422e*/  .byte 0x0
/*0x422f*/  .byte 0x0

            data_4230:
/*0x4230*/  .word 0x400b2000


            .thumb_func
            pinmux_b789_spi:
/*0x4234*/      push {r4, r5, r6, lr}
/*0x4236*/      movs r2, #1
/*0x4238*/      ldr r5, [pc, #0x38] /* data_4274 */
/*0x423a*/      lsls r4, r2, #0xa
/*0x423c*/      mov r1, r4
/*0x423e*/      mov r0, r5
/*0x4240*/      bl gpio_set_input_output
/*0x4244*/      movs r2, #2
/*0x4246*/      mov r1, r4
/*0x4248*/      mov r0, r5
/*0x424a*/      bl gpio_set_pin_pull_up_down
/*0x424e*/      movs r2, #5
/*0x4250*/      movs r1, #7
/*0x4252*/      movs r0, #1
/*0x4254*/      bl afio_pin_config
/*0x4258*/      movs r2, #5
/*0x425a*/      movs r1, #8
/*0x425c*/      movs r0, #1
/*0x425e*/      bl afio_pin_config
/*0x4262*/      movs r2, #5
/*0x4264*/      movs r1, #9
/*0x4266*/      movs r0, #1
/*0x4268*/      bl afio_pin_config
/*0x426c*/      pop.w {r4, r5, r6, lr}
/*0x4270*/      b.w jump_444c

            data_4274:
/*0x4274*/  .word 0x400b2000


            .thumb_func
            function_e_38:
/*0x4278*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x427c*/      mov r7, r2
/*0x427e*/      mov r4, r1
/*0x4280*/      mov r8, r0
/*0x4282*/      bl function_77
/*0x4286*/      ldr r6, [pc, #0x38] /* data_42c0 */
/*0x4288*/      mov.w r5, #0x400
/*0x428c*/      str r5, [r6, #0x28]
/*0x428e*/      movs r0, #2
/*0x4290*/      strb.w r0, [sp]
/*0x4294*/      lsrs r0, r4, #0x10
/*0x4296*/      strb.w r0, [sp, #1]
/*0x429a*/      lsrs r0, r4, #8
/*0x429c*/      strb.w r0, [sp, #2]
/*0x42a0*/      strb.w r4, [sp, #3]
/*0x42a4*/      movs r2, #4
/*0x42a6*/      movs r1, #0
/*0x42a8*/      mov r0, sp
/*0x42aa*/      bl spi_write_read
/*0x42ae*/      mov r2, r7
/*0x42b0*/      movs r1, #0
/*0x42b2*/      mov r0, r8
/*0x42b4*/      bl spi_write_read
/*0x42b8*/      str r5, [r6, #0x24]
/*0x42ba*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

/*0x42be*/  .byte 0x0
/*0x42bf*/  .byte 0x0

            data_42c0:
/*0x42c0*/  .word 0x400b2000


            .thumb_func
            function_e_39:
/*0x42c4*/      push {r3, r4, r5, r6, r7, lr}
/*0x42c6*/      mov r4, r0
/*0x42c8*/      bl function_77
/*0x42cc*/      ldr r6, [pc, #0x28] /* data_42f8 */
/*0x42ce*/      mov.w r5, #0x400
/*0x42d2*/      str r5, [r6, #0x28]
/*0x42d4*/      movs r0, #0x20
/*0x42d6*/      strb.w r0, [sp]
/*0x42da*/      lsrs r0, r4, #0x10
/*0x42dc*/      strb.w r0, [sp, #1]
/*0x42e0*/      lsrs r0, r4, #8
/*0x42e2*/      strb.w r0, [sp, #2]
/*0x42e6*/      strb.w r4, [sp, #3]
/*0x42ea*/      movs r2, #4
/*0x42ec*/      movs r1, #0
/*0x42ee*/      mov r0, sp
/*0x42f0*/      bl spi_write_read
/*0x42f4*/      str r5, [r6, #0x24]
/*0x42f6*/      pop {r3, r4, r5, r6, r7, pc}

            data_42f8:
/*0x42f8*/  .word 0x400b2000


            .thumb_func
            function_76:
/*0x42fc*/      push {r3, r4, r5, r6, r7, lr}
/*0x42fe*/      mov r6, r0
/*0x4300*/      bl function_77
/*0x4304*/      ldr r4, [pc, #0x1c] /* data_4324 */
/*0x4306*/      mov.w r5, #0x400
/*0x430a*/      str r5, [r4, #0x28]
/*0x430c*/      movs r0, #1
/*0x430e*/      strb.w r0, [sp]
/*0x4312*/      strb.w r6, [sp, #1]
/*0x4316*/      movs r2, #2
/*0x4318*/      movs r1, #0
/*0x431a*/      mov r0, sp
/*0x431c*/      bl spi_write_read
/*0x4320*/      str r5, [r4, #0x24]
/*0x4322*/      pop {r3, r4, r5, r6, r7, pc}

            data_4324:
/*0x4324*/  .word 0x400b2000


            .thumb_func
            function_78:
/*0x4328*/      push {r4, lr}
/*0x432a*/      movs r4, #0x3c
/*0x432c*/      bl function_e_38
/*0x4330*/      b jump_433e
            jump_4332:
/*0x4332*/      movs r0, #0x64
/*0x4334*/      bl spin_wait_maybe
/*0x4338*/      bl function_10
/*0x433c*/      cbz r0, jump_4346
            jump_433e:
/*0x433e*/      mov r0, r4
/*0x4340*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4342*/      bhs jump_4332
/*0x4344*/      pop {r4, pc}
            jump_4346:
/*0x4346*/      movs r0, #1
/*0x4348*/      pop {r4, pc}

/*0x434a*/  .byte 0x0
/*0x434b*/  .byte 0x0


            .thumb_func
            function_42:
/*0x434c*/      push {r3, r4, r5, lr}
/*0x434e*/      ldr r4, [pc, #0x20] /* data_4370 */
/*0x4350*/      movs r0, #0xb9
/*0x4352*/      strb.w r0, [sp]
/*0x4356*/      mov.w r5, #0x400
/*0x435a*/      str r5, [r4, #0x28]
/*0x435c*/      movs r2, #1
/*0x435e*/      movs r1, #0
/*0x4360*/      mov r0, sp
/*0x4362*/      bl spi_write_read
/*0x4366*/      str r5, [r4, #0x24]
/*0x4368*/      movs r0, #0xa
/*0x436a*/      bl spin_wait_maybe
/*0x436e*/      pop {r3, r4, r5, pc}

            data_4370:
/*0x4370*/  .word 0x400b2000


            .thumb_func
            function_25:
/*0x4374*/      push {r3, r4, r5, r6, r7, lr}
/*0x4376*/      ldr r5, [pc, #0x38] /* data_43b0 */
/*0x4378*/      mov.w r4, #0x400
/*0x437c*/      mov r7, r2
/*0x437e*/      mov r6, r0
/*0x4380*/      str r4, [r5, #0x28]
/*0x4382*/      movs r0, #3
/*0x4384*/      strb.w r0, [sp]
/*0x4388*/      lsrs r0, r1, #0x10
/*0x438a*/      strb.w r0, [sp, #1]
/*0x438e*/      lsrs r0, r1, #8
/*0x4390*/      strb.w r0, [sp, #2]
/*0x4394*/      strb.w r1, [sp, #3]
/*0x4398*/      movs r2, #4
/*0x439a*/      movs r1, #0
/*0x439c*/      mov r0, sp
/*0x439e*/      bl spi_write_read
/*0x43a2*/      mov r2, r7
/*0x43a4*/      mov r1, r6
/*0x43a6*/      movs r0, #0
/*0x43a8*/      bl spi_write_read
/*0x43ac*/      str r4, [r5, #0x24]
/*0x43ae*/      pop {r3, r4, r5, r6, r7, pc}

            data_43b0:
/*0x43b0*/  .word 0x400b2000


            .thumb_func
            spi_write_read:
/*0x43b4*/      push {r4, r5, r6, r7, lr}
/*0x43b6*/      movs r3, #0
/*0x43b8*/      cmp r2, #8
/*0x43ba*/      bls jump_43c0
/*0x43bc*/      movs r4, #8
/*0x43be*/      b jump_43c2
            jump_43c0:
/*0x43c0*/      mov r4, r2
            jump_43c2:
/*0x43c2*/      movs r5, #0
/*0x43c4*/      mov r7, r5
/*0x43c6*/      ldr r6, [pc, #0x58] /* data_4420 */
/*0x43c8*/      b jump_43d6
            jump_43ca:
/*0x43ca*/      cbz r0, jump_43dc
/*0x43cc*/      ldrb.w ip, [r0, r5]
/*0x43d0*/      str.w ip, [r6, #0x10]
            jump_43d4:
/*0x43d4*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_43d6:
/*0x43d6*/      cmp r5, r4
/*0x43d8*/      blo jump_43ca
/*0x43da*/      b jump_43fe
            jump_43dc:
/*0x43dc*/      str r7, [r6, #0x10]
/*0x43de*/      b jump_43d4
            jump_43e0:
/*0x43e0*/      ldr r5, [r6, #0x1c]
/*0x43e2*/      tst.w r5, #0xf0
/*0x43e6*/      beq jump_43e0
/*0x43e8*/      ldr r5, [r6, #0x10]
/*0x43ea*/      uxtb r5, r5
/*0x43ec*/      cbz r0, jump_4404
/*0x43ee*/      ldrb.w ip, [r0, r4]
/*0x43f2*/      str.w ip, [r6, #0x10]
            jump_43f6:
/*0x43f6*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x43f8*/      cbz r1, jump_43fc
/*0x43fa*/      strb r5, [r1, r3]
            jump_43fc:
/*0x43fc*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_43fe:
/*0x43fe*/      cmp r4, r2
/*0x4400*/      blo jump_43e0
/*0x4402*/      b jump_441a
            jump_4404:
/*0x4404*/      str r7, [r6, #0x10]
/*0x4406*/      b jump_43f6
            jump_4408:
/*0x4408*/      ldr r0, [r6, #0x1c]
/*0x440a*/      tst.w r0, #0xf0
/*0x440e*/      beq jump_4408
/*0x4410*/      ldr r0, [r6, #0x10]
/*0x4412*/      uxtb r0, r0
/*0x4414*/      cbz r1, jump_4418
/*0x4416*/      strb r0, [r1, r3]
            jump_4418:
/*0x4418*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_441a:
/*0x441a*/      cmp r3, r2
/*0x441c*/      blo jump_4408
/*0x441e*/      pop {r4, r5, r6, r7, pc}

            data_4420:
/*0x4420*/  .word 0x40044000


            .thumb_func
            function_e_40:
/*0x4424*/      push {r4, r5, r6, lr}
/*0x4426*/      movw r4, #0x12d
/*0x442a*/      bl function_e_39
/*0x442e*/      mov.w r5, #0x3e8
/*0x4432*/      b jump_4440
            jump_4434:
/*0x4434*/      mov r0, r5
/*0x4436*/      bl spin_wait_maybe
/*0x443a*/      bl function_10
/*0x443e*/      cbz r0, jump_4448
            jump_4440:
/*0x4440*/      mov r0, r4
/*0x4442*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4444*/      bhs jump_4434
/*0x4446*/      pop {r4, r5, r6, pc}
            jump_4448:
/*0x4448*/      movs r0, #1
/*0x444a*/      pop {r4, r5, r6, pc}
            jump_444c:
/*0x444c*/      push {r3, r4, r5, lr}
/*0x444e*/      ldr r4, [pc, #0x20] /* data_4470 */
/*0x4450*/      movs r0, #0xab
/*0x4452*/      strb.w r0, [sp]
/*0x4456*/      mov.w r5, #0x400
/*0x445a*/      str r5, [r4, #0x28]
/*0x445c*/      movs r2, #1
/*0x445e*/      movs r1, #0
/*0x4460*/      mov r0, sp
/*0x4462*/      bl spi_write_read
/*0x4466*/      str r5, [r4, #0x24]
/*0x4468*/      movs r0, #0xa
/*0x446a*/      bl spin_wait_maybe
/*0x446e*/      pop {r3, r4, r5, pc}

            data_4470:
/*0x4470*/  .word 0x400b2000


            .thumb_func
            function_27:
/*0x4474*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4478*/      mov r5, r1
/*0x447a*/      mov r6, r0
/*0x447c*/      rsbs r0, r5, #0
/*0x447e*/      uxtb r4, r0
/*0x4480*/      cmp r4, r2
/*0x4482*/      bhs jump_448e
/*0x4484*/      subs r0, r2, r4
/*0x4486*/      ubfx r7, r0, #8, #0x10
/*0x448a*/      uxtb r0, r0
/*0x448c*/      b jump_4494
            jump_448e:
/*0x448e*/      movs r7, #0
/*0x4490*/      uxth r4, r2
/*0x4492*/      mov r0, r7
            jump_4494:
/*0x4494*/      mov r8, r0
/*0x4496*/      cbz r4, jump_44a8
/*0x4498*/      mov r2, r4
/*0x449a*/      mov r0, r6
/*0x449c*/      bl function_78
/*0x44a0*/      cmp r0, #1
/*0x44a2*/      bne jump_44e0
/*0x44a4*/      add r5, r4
/*0x44a6*/      add r6, r4
            jump_44a8:
/*0x44a8*/      movs r4, #0
/*0x44aa*/      mov.w sb, #0x100
/*0x44ae*/      b jump_44c8
            jump_44b0:
/*0x44b0*/      mov r2, sb
/*0x44b2*/      mov r1, r5
/*0x44b4*/      mov r0, r6
/*0x44b6*/      bl function_78
/*0x44ba*/      cmp r0, #1
/*0x44bc*/      bne jump_44e0
/*0x44be*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x44c0*/      add.w r5, r5, #0x100
/*0x44c4*/      add.w r6, r6, #0x100
            jump_44c8:
/*0x44c8*/      cmp r4, r7
/*0x44ca*/      blt jump_44b0
/*0x44cc*/      movs.w r0, r8
/*0x44d0*/      beq jump_44e6
/*0x44d2*/      mov r2, r0
/*0x44d4*/      mov r1, r5
/*0x44d6*/      mov r0, r6
/*0x44d8*/      bl function_78
/*0x44dc*/      cmp r0, #1
/*0x44de*/      beq jump_44e6
            jump_44e0:
/*0x44e0*/      movs r0, #0
            jump_44e2:
/*0x44e2*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_44e6:
/*0x44e6*/      movs r0, #1
/*0x44e8*/      b jump_44e2

/*0x44ea*/  .byte 0x0
/*0x44eb*/  .byte 0x0


            .thumb_func
            function_77:
/*0x44ec*/      push {r3, r4, r5, lr}
/*0x44ee*/      ldr r4, [pc, #0x1c] /* data_450c */
/*0x44f0*/      movs r0, #6
/*0x44f2*/      strb.w r0, [sp]
/*0x44f6*/      mov.w r5, #0x400
/*0x44fa*/      str r5, [r4, #0x28]
/*0x44fc*/      movs r2, #1
/*0x44fe*/      movs r1, #0
/*0x4500*/      mov r0, sp
/*0x4502*/      bl spi_write_read
/*0x4506*/      str r5, [r4, #0x24]
/*0x4508*/      pop {r3, r4, r5, pc}

/*0x450a*/  .byte 0x0
/*0x450b*/  .byte 0x0

            data_450c:
/*0x450c*/  .word 0x400b2000


            .thumb_func
            function_28:
/*0x4510*/      push {r4, lr}
/*0x4512*/      mov.w r4, #0x19a
/*0x4516*/      bl function_76
/*0x451a*/      b jump_4528
            jump_451c:
/*0x451c*/      movs r0, #0x64
/*0x451e*/      bl spin_wait_maybe
/*0x4522*/      bl function_10
/*0x4526*/      cbz r0, jump_4530
            jump_4528:
/*0x4528*/      mov r0, r4
/*0x452a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x452c*/      bhs jump_451c
/*0x452e*/      pop {r4, pc}
            jump_4530:
/*0x4530*/      movs r0, #1
/*0x4532*/      pop {r4, pc}

            .thumb_func
            call_4534:
/*0x4534*/      str r1, [r0, #0x28]
/*0x4536*/      bx lr

            .thumb_func
            gpio_set_input_output:
/*0x4538*/      cmp r2, #0
/*0x453a*/      ldr r2, [r0]
/*0x453c*/      beq jump_4542
/*0x453e*/      orrs r2, r1
/*0x4540*/      b jump_4544
            jump_4542:
/*0x4542*/      bics r2, r1
            jump_4544:
/*0x4544*/      str r2, [r0]
/*0x4546*/      bx lr

            .thumb_func
            gpio_set_output_current:
/*0x4548*/      cmp r2, #0
/*0x454a*/      ldr r2, [r0, #0x14]
/*0x454c*/      beq jump_4552
/*0x454e*/      orrs r2, r1
/*0x4550*/      b jump_4554
            jump_4552:
/*0x4552*/      bics r2, r1
            jump_4554:
/*0x4554*/      str r2, [r0, #0x14]
/*0x4556*/      bx lr

            .thumb_func
            gpio_set_input_enable:
/*0x4558*/      cmp r2, #0
/*0x455a*/      ldr r2, [r0, #4]
/*0x455c*/      beq jump_4562
/*0x455e*/      orrs r2, r1
/*0x4560*/      b jump_4564
            jump_4562:
/*0x4562*/      bics r2, r1
            jump_4564:
/*0x4564*/      str r2, [r0, #4]
/*0x4566*/      bx lr

            .thumb_func
            gpio_set_open_drain:
/*0x4568*/      cmp r2, #0
/*0x456a*/      ldr r2, [r0, #0x10]
/*0x456c*/      beq jump_4572
/*0x456e*/      orrs r2, r1
/*0x4570*/      b jump_4574
            jump_4572:
/*0x4572*/      bics r2, r1
            jump_4574:
/*0x4574*/      str r2, [r0, #0x10]
/*0x4576*/      bx lr

            .thumb_func
            gpio_set_pin_pull_up_down:
/*0x4578*/      cbz r2, jump_458c
/*0x457a*/      cmp r2, #1
/*0x457c*/      beq jump_4592
/*0x457e*/      ldr r2, [r0, #8]
/*0x4580*/      bics r2, r1
            jump_4582:
/*0x4582*/      str r2, [r0, #8]
/*0x4584*/      ldr r2, [r0, #0xc]
/*0x4586*/      bics r2, r1
/*0x4588*/      str r2, [r0, #0xc]
/*0x458a*/      bx lr
            jump_458c:
/*0x458c*/      ldr r2, [r0, #8]
/*0x458e*/      orrs r2, r1
/*0x4590*/      b jump_4582
            jump_4592:
/*0x4592*/      ldr r2, [r0, #0xc]
/*0x4594*/      orrs r2, r1
/*0x4596*/      str r2, [r0, #0xc]
/*0x4598*/      ldr r2, [r0, #8]
/*0x459a*/      bics r2, r1
/*0x459c*/      str r2, [r0, #8]
/*0x459e*/      bx lr

            .thumb_func
            gpio_set_pin:
/*0x45a0*/      str r1, [r0, #0x24]
/*0x45a2*/      bx lr

            .thumb_func
            gpio_set_reset_pin:
/*0x45a4*/      cbz r2, jump_45aa
/*0x45a6*/      str r1, [r0, #0x24]
/*0x45a8*/      bx lr
            jump_45aa:
/*0x45aa*/      str r1, [r0, #0x28]
/*0x45ac*/      bx lr

            .thumb_func
            gptm_enable_disable:
/*0x45ae*/      cmp r1, #0
/*0x45b0*/      ldr r1, [r0, #0x10]
/*0x45b2*/      beq jump_45ba
/*0x45b4*/      orr r1, r1, #1
/*0x45b8*/      b jump_45be
            jump_45ba:
/*0x45ba*/      bic r1, r1, #1
            jump_45be:
/*0x45be*/      str r1, [r0, #0x10]
/*0x45c0*/      bx lr

            .thumb_func
            call_45c2:
/*0x45c2*/      push {r4, r5, r6, r7, lr}
/*0x45c4*/      ldrb r3, [r1]
/*0x45c6*/      ldr r7, [r0, #0x50]
/*0x45c8*/      add.w r4, r0, r3, lsl #2
/*0x45cc*/      add.w r2, r4, #0x40
/*0x45d0*/      add.w r5, r4, #0x90
/*0x45d4*/      add.w r6, r4, #0xa0
/*0x45d8*/      lsls r3, r3, #1
/*0x45da*/      movs r4, #1
/*0x45dc*/      lsls r4, r3
/*0x45de*/      mvns r4, r4
/*0x45e0*/      ands r7, r4
/*0x45e2*/      str r7, [r0, #0x50]
/*0x45e4*/      ldr r7, [r0, #0x54]
/*0x45e6*/      ands r7, r4
/*0x45e8*/      str r7, [r0, #0x54]
/*0x45ea*/      ldr r4, [r0, #0x54]
/*0x45ec*/      ldrb r7, [r1, #5]
/*0x45ee*/      lsls r7, r3
/*0x45f0*/      orrs r4, r7
/*0x45f2*/      str r4, [r0, #0x54]
/*0x45f4*/      ldr r4, [r2]
/*0x45f6*/      movw r7, #0x107
/*0x45fa*/      bics r4, r7
/*0x45fc*/      str r4, [r2]
/*0x45fe*/      ldr r4, [r2]
/*0x4600*/      ldrh r7, [r1, #2]
/*0x4602*/      orrs r4, r7
/*0x4604*/      str r4, [r2]
/*0x4606*/      ldrh r2, [r1, #6]
/*0x4608*/      str r2, [r5]
/*0x460a*/      ldrh r2, [r1, #8]
/*0x460c*/      str r2, [r6]
/*0x460e*/      ldr r2, [r0, #0x50]
/*0x4610*/      ldrb r1, [r1, #4]
/*0x4612*/      lsls r1, r3
/*0x4614*/      orrs r2, r1
/*0x4616*/      str r2, [r0, #0x50]
/*0x4618*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_461a:
/*0x461a*/      ldrh r2, [r1]
/*0x461c*/      str.w r2, [r0, #0x88]
/*0x4620*/      ldrh r2, [r1, #2]
/*0x4622*/      str.w r2, [r0, #0x84]
/*0x4626*/      ldr r2, [r0]
/*0x4628*/      bic r2, r2, #0x30000
/*0x462c*/      str r2, [r0]
/*0x462e*/      ldr r2, [r0]
/*0x4630*/      bic r2, r2, #0x1000000
/*0x4634*/      str r2, [r0]
/*0x4636*/      ldr r2, [r0]
/*0x4638*/      ldr r3, [r1, #4]
/*0x463a*/      orrs r2, r3
/*0x463c*/      str r2, [r0]
/*0x463e*/      ldrh r1, [r1, #8]
/*0x4640*/      str r1, [r0, #0x78]
/*0x4642*/      bx lr

            .thumb_func
            call_4644:
/*0x4644*/      ldr r0, [pc, #0x28] /* data_4670 */
/*0x4646*/      ldrb r1, [r0, #2]
/*0x4648*/      cbz r1, jump_464e
/*0x464a*/      movs r0, #0
/*0x464c*/      bx lr
            jump_464e:
/*0x464e*/      ldrb r1, [r0, #0xb]
/*0x4650*/      cbz r1, jump_4656
/*0x4652*/      movs r0, #1
/*0x4654*/      bx lr
            jump_4656:
/*0x4656*/      ldrb r0, [r0, #0xa]
/*0x4658*/      cbz r0, jump_465e
/*0x465a*/      movs r0, #2
/*0x465c*/      bx lr
            jump_465e:
/*0x465e*/      ldr r0, [pc, #0x14] /* data_4674 */
/*0x4660*/      ldrb r0, [r0, #6]
/*0x4662*/      cmp r0, #1
/*0x4664*/      beq jump_466a
/*0x4666*/      movs r0, #5
/*0x4668*/      bx lr
            jump_466a:
/*0x466a*/      movs r0, #3
/*0x466c*/      bx lr

/*0x466e*/  .byte 0x0
/*0x466f*/  .byte 0x0

            data_4670:
/*0x4670*/  .word 0x20000648
            data_4674:
/*0x4674*/  .word 0x200019d0


            .thumb_func
            call_4678:
/*0x4678*/      push {r4, lr}
/*0x467a*/      cbz r0, jump_46a2
/*0x467c*/      bl call_4ab0
/*0x4680*/      cmp r0, #0
/*0x4682*/      beq jump_46b8
/*0x4684*/      movs r1, #0xa
/*0x4686*/      ldr r0, [pc, #0x34] /* data_46bc */
/*0x4688*/      bl mem_zero
/*0x468c*/      ldr r0, [pc, #0x30] /* data_46c0 */
/*0x468e*/      ldrb r1, [r0, #1]
/*0x4690*/      lsls r2, r1, #0x19
/*0x4692*/      mov.w r1, #0
/*0x4696*/      str r1, [r0]
/*0x4698*/      bpl jump_46a2
/*0x469a*/      ldrb r1, [r0, #1]
/*0x469c*/      orr r1, r1, #0x40
/*0x46a0*/      strb r1, [r0, #1]
            jump_46a2:
/*0x46a2*/      bl call_6604
/*0x46a6*/      ldr r1, [pc, #0x1c] /* data_46c4 */
/*0x46a8*/      movs r0, #1
/*0x46aa*/      strb r0, [r1]
/*0x46ac*/      ldr r1, [pc, #0x18] /* data_46c8 */
/*0x46ae*/      strb r0, [r1]
/*0x46b0*/      ldr r1, [pc, #0x18] /* data_46cc */
/*0x46b2*/      strb r0, [r1]
/*0x46b4*/      ldr r1, [pc, #0x18] /* data_46d0 */
/*0x46b6*/      strb r0, [r1]
            jump_46b8:
/*0x46b8*/      pop {r4, pc}

/*0x46ba*/  .byte 0x0
/*0x46bb*/  .byte 0x0

            data_46bc:
/*0x46bc*/  .word 0x20000654
            data_46c0:
/*0x46c0*/  .word 0x20000030
            data_46c4:
/*0x46c4*/  .word 0x20000034
            data_46c8:
/*0x46c8*/  .word 0x20000037
            data_46cc:
/*0x46cc*/  .word 0x20000035
            data_46d0:
/*0x46d0*/  .word 0x20000036


            .thumb_func
            call_46d4:
/*0x46d4*/      movs r1, #0x50
/*0x46d6*/      ldr r2, [pc, #0x18] /* data_46f0 */
/*0x46d8*/      b jump_46e4
            jump_46da:
/*0x46da*/      ldrb r3, [r2, r1]
/*0x46dc*/      cmp r3, r0
/*0x46de*/      bne jump_46e4
/*0x46e0*/      uxtb r0, r1
/*0x46e2*/      bx lr
            jump_46e4:
/*0x46e4*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x46e6*/      uxth r1, r1
/*0x46e8*/      bhs jump_46da
/*0x46ea*/      movs r0, #0
/*0x46ec*/      bx lr

/*0x46ee*/  .byte 0x0
/*0x46ef*/  .byte 0x0

            data_46f0:
/*0x46f0*/  .word 0x2000065e


            .thumb_func
            call_46f4:
/*0x46f4*/      ldr r3, [pc, #0x2c] /* data_4724 */
/*0x46f6*/      push {r4, lr}
/*0x46f8*/      ldrb r2, [r3, r0]
/*0x46fa*/      cbz r2, jump_471c
/*0x46fc*/      cbz r1, jump_4700
/*0x46fe*/      strb r2, [r1]
            jump_4700:
/*0x4700*/      ldr r2, [pc, #0x20] /* data_4724 */
/*0x4702*/      lsrs r1, r0, #5
/*0x4704*/      adds r2, #0x52
/*0x4706*/      and r4, r0, #0x1f
/*0x470a*/      ldr.w r1, [r2, r1, lsl #2]
/*0x470e*/      movs r2, #1
/*0x4710*/      lsls r2, r4
/*0x4712*/      tst r1, r2
/*0x4714*/      beq jump_471c
/*0x4716*/      ldrb r0, [r3, r0]
/*0x4718*/      cmp r0, #0x2f
/*0x471a*/      blo jump_4720
            jump_471c:
/*0x471c*/      movs r0, #1
/*0x471e*/      pop {r4, pc}
            jump_4720:
/*0x4720*/      movs r0, #0
/*0x4722*/      pop {r4, pc}

            data_4724:
/*0x4724*/  .word 0x2000065e

            jump_4728:
/*0x4728*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x472c*/      mov r5, r1
/*0x472e*/      mov r4, r0
/*0x4730*/      movs r1, #0x50
/*0x4732*/      ldr r0, [pc, #0x48] /* data_477c */
/*0x4734*/      bl mem_zero
/*0x4738*/      ldr r0, [pc, #0x40] /* data_477c */
/*0x473a*/      movs r1, #0
/*0x473c*/      subs r0, #0xa
/*0x473e*/      ldr r6, [pc, #0x3c] /* data_477c */
/*0x4740*/      str r1, [r0, #0x5c]
/*0x4742*/      str r1, [r0, #0x60]
/*0x4744*/      add.w r2, r0, #0x5c
/*0x4748*/      movs r3, #1
/*0x474a*/      str r1, [r0, #0x64]
/*0x474c*/      b jump_4770
            jump_474e:
/*0x474e*/      ldrb r1, [r4]
/*0x4750*/      ldrb r0, [r4, #1]
/*0x4752*/      strb r0, [r6, r1]
/*0x4754*/      ldrb r0, [r4, #2]
/*0x4756*/      cbz r0, jump_476e
/*0x4758*/      ldrb r1, [r4]
/*0x475a*/      lsrs r0, r1, #5
/*0x475c*/      and r1, r1, #0x1f
/*0x4760*/      ldr.w r7, [r2, r0, lsl #2]
/*0x4764*/      lsl.w r1, r3, r1
/*0x4768*/      orrs r7, r1
/*0x476a*/      str.w r7, [r2, r0, lsl #2]
            jump_476e:
/*0x476e*/      .short 0x1ce4 /* adds r4, r4, #3 */ 
            jump_4770:
/*0x4770*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x4772*/      uxtb r5, r5
/*0x4774*/      bhs jump_474e
/*0x4776*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x477a*/  .byte 0x0
/*0x477b*/  .byte 0x0

            data_477c:
/*0x477c*/  .word 0x2000065e


            .thumb_func
            call_4780:
/*0x4780*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x4784*/      lsrs r1, r0, #8
/*0x4786*/      lsls r1, r1, #0x1f
/*0x4788*/      beq jump_4790
/*0x478a*/      bl call_4e7c
/*0x478e*/      b jump_4850
            jump_4790:
/*0x4790*/      uxtb r3, r0
/*0x4792*/      lsrs r2, r0, #0x18
/*0x4794*/      movs r4, #1
/*0x4796*/      cmp r3, #0xe8
/*0x4798*/      bls jump_47c4
/*0x479a*/      lsrs r0, r0, #0x18
/*0x479c*/      ubfx r2, r0, #1, #1
/*0x47a0*/      cmp r3, #0xec
/*0x47a2*/      bhs jump_47b2
/*0x47a4*/      subs r3, #0xe9
/*0x47a6*/      uxtb r1, r3
/*0x47a8*/      ldr r0, [pc, #0xac] /* data_4858 */
/*0x47aa*/      bl call_3fa8
/*0x47ae*/      ldr r0, [pc, #0xac] /* data_485c */
/*0x47b0*/      b jump_484e
            jump_47b2:
/*0x47b2*/      cmp r3, #0xfd
/*0x47b4*/      bhi jump_4850
/*0x47b6*/      subs r3, #0xec
/*0x47b8*/      uxtb r1, r3
/*0x47ba*/      ldr r0, [pc, #0xa4] /* data_4860 */
/*0x47bc*/      bl call_3fa8
/*0x47c0*/      ldr r0, [pc, #0xa0] /* data_4864 */
/*0x47c2*/      b jump_484e
            jump_47c4:
/*0x47c4*/      and r1, r0, #7
/*0x47c8*/      movs r6, #1
/*0x47ca*/      sub.w ip, r3, #0xe0
/*0x47ce*/      lsls r6, r1
/*0x47d0*/      ldr r7, [pc, #0x94] /* data_4868 */
/*0x47d2*/      ldr r5, [pc, #0x98] /* data_486c */
/*0x47d4*/      cmp.w ip, #7
/*0x47d8*/      bhi jump_47f0
/*0x47da*/      mov r0, r5
/*0x47dc*/      uxtb r1, r6
/*0x47de*/      ldrb r0, [r0]
/*0x47e0*/      lsls r2, r2, #0x1e
/*0x47e2*/      bpl jump_47e8
/*0x47e4*/      orrs r0, r1
/*0x47e6*/      b jump_47ea
            jump_47e8:
/*0x47e8*/      bics r0, r1
            jump_47ea:
/*0x47ea*/      strb r0, [r5]
            jump_47ec:
/*0x47ec*/      strb r4, [r7]
/*0x47ee*/      b jump_4850
            jump_47f0:
/*0x47f0*/      movs r1, #0
            jump_47f2:
/*0x47f2*/      add.w ip, r5, r1
/*0x47f6*/      ldrb.w ip, [ip, #2]
/*0x47fa*/      cmp ip, r3
/*0x47fc*/      bne jump_480a
/*0x47fe*/      lsls r0, r2, #0x1e
/*0x4800*/      bmi jump_47ec
/*0x4802*/      add r1, r5
/*0x4804*/      movs r0, #0
/*0x4806*/      strb r0, [r1, #2]
/*0x4808*/      b jump_47ec
            jump_480a:
/*0x480a*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x480c*/      uxtb r1, r1
/*0x480e*/      cmp r1, #6
/*0x4810*/      blo jump_47f2
/*0x4812*/      lsls r1, r2, #0x1e
/*0x4814*/      bpl jump_482e
/*0x4816*/      movs r1, #0
            jump_4818:
/*0x4818*/      add.w ip, r5, r1
/*0x481c*/      ldrb.w ip, [ip, #2]
/*0x4820*/      cmp.w ip, #0
/*0x4824*/      beq jump_4842
/*0x4826*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4828*/      uxtb r1, r1
/*0x482a*/      cmp r1, #6
/*0x482c*/      blo jump_4818
            jump_482e:
/*0x482e*/      lsls r3, r2, #0x1e
/*0x4830*/      ldr r2, [pc, #0x3c] /* data_4870 */
/*0x4832*/      ubfx r0, r0, #3, #5
/*0x4836*/      add r0, r2
/*0x4838*/      uxtb r1, r6
/*0x483a*/      ldrb r2, [r0, #2]
/*0x483c*/      bpl jump_4848
/*0x483e*/      orrs r2, r1
/*0x4840*/      b jump_484a
            jump_4842:
/*0x4842*/      adds r0, r5, r1
/*0x4844*/      strb r3, [r0, #2]
/*0x4846*/      b jump_47ec
            jump_4848:
/*0x4848*/      bics r2, r1
            jump_484a:
/*0x484a*/      strb r2, [r0, #2]
/*0x484c*/      ldr r0, [pc, #0x24] /* data_4874 */
            jump_484e:
/*0x484e*/      strb r4, [r0]
            jump_4850:
/*0x4850*/      movs r0, #1
/*0x4852*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x4856*/  .byte 0x0
/*0x4857*/  .byte 0x0

            data_4858:
/*0x4858*/  .word 0x2000003d
            data_485c:
/*0x485c*/  .word 0x20000035
            data_4860:
/*0x4860*/  .word 0x20000049
            data_4864:
/*0x4864*/  .word 0x20000036
            data_4868:
/*0x4868*/  .word 0x20000034
            data_486c:
/*0x486c*/  .word 0x20000050
            data_4870:
/*0x4870*/  .word 0x200006d4
            data_4874:
/*0x4874*/  .word 0x20000037


            .thumb_func
            call_4878:
/*0x4878*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x487c*/      ldr r4, [pc, #0x184] /* data_4a04 */
/*0x487e*/      ldr r2, [pc, #0x188] /* data_4a08 */
/*0x4880*/      lsrs r5, r0, #3
/*0x4882*/      strb r0, [r4, #2]
/*0x4884*/      ldrb r3, [r2, r0]
/*0x4886*/      strb r3, [r4]
/*0x4888*/      ldrb r2, [r4, #3]
/*0x488a*/      and r6, r0, #7
/*0x488e*/      bic r2, r2, #1
/*0x4892*/      bfi r2, r1, #1, #1
/*0x4896*/      strb r2, [r4, #3]
/*0x4898*/      mov r2, r4
/*0x489a*/      mov.w r8, #1
/*0x489e*/      ldrb r2, [r2, #1]
/*0x48a0*/      cmp r3, #0xe8
/*0x48a2*/      beq jump_48c6
/*0x48a4*/      lsl.w r7, r8, r6
/*0x48a8*/      movs r6, #0x1c
/*0x48aa*/      uxtb r7, r7
/*0x48ac*/      cmp.w r6, r3, lsr #3
/*0x48b0*/      bne jump_48e4
/*0x48b2*/      ands r6, r3, #3
/*0x48b6*/      beq jump_48cc
/*0x48b8*/      cmp r6, #1
/*0x48ba*/      beq jump_48d2
/*0x48bc*/      cmp r6, #2
/*0x48be*/      beq jump_48d8
/*0x48c0*/      cmp r6, #3
/*0x48c2*/      bne jump_48ee
/*0x48c4*/      b jump_48de
            jump_48c6:
/*0x48c6*/      bfi r2, r1, #6, #1
/*0x48ca*/      b jump_4938
            jump_48cc:
/*0x48cc*/      bfi r2, r1, #2, #1
/*0x48d0*/      b jump_48ec
            jump_48d2:
/*0x48d2*/      bfi r2, r1, #4, #1
/*0x48d6*/      b jump_48ec
            jump_48d8:
/*0x48d8*/      bfi r2, r1, #3, #1
/*0x48dc*/      b jump_48ec
            jump_48de:
/*0x48de*/      bfi r2, r1, #5, #1
/*0x48e2*/      b jump_48ec
            jump_48e4:
/*0x48e4*/      cmp r3, #0x39
/*0x48e6*/      bne jump_48ee
/*0x48e8*/      bfi r2, r1, #7, #1
            jump_48ec:
/*0x48ec*/      strb r2, [r4, #1]
            jump_48ee:
/*0x48ee*/      ldr r6, [pc, #0x11c] /* data_4a0c */
/*0x48f0*/      cbz r1, jump_4924
/*0x48f2*/      ldrb r2, [r4, #1]
/*0x48f4*/      lsls.w ip, r2, #0x19
/*0x48f8*/      bpl jump_4938
/*0x48fa*/      ldrb.w ip, [r6, r5]
/*0x48fe*/      orr.w ip, ip, r7
/*0x4902*/      strb.w ip, [r6, r5]
/*0x4906*/      b jump_4930
            jump_4908:
/*0x4908*/      ldr r6, [pc, #0x104] /* data_4a10 */
/*0x490a*/      strb r2, [r4, #1]
/*0x490c*/      sub.w r7, r3, #0xc0
/*0x4910*/      movs r5, #0
/*0x4912*/      ldrb r2, [r6, #2]
/*0x4914*/      cmp r7, #3
/*0x4916*/      bhi jump_493e
/*0x4918*/      cbz r2, jump_491c
/*0x491a*/      strb r5, [r6, #2]
            jump_491c:
/*0x491c*/      uxtb r0, r7
/*0x491e*/      bl call_38c0
/*0x4922*/      b jump_4994
            jump_4924:
/*0x4924*/      ldrb r2, [r6, r5]
/*0x4926*/      tst r2, r7
/*0x4928*/      beq jump_4936
/*0x492a*/      bics r2, r7
/*0x492c*/      strb r2, [r6, r5]
/*0x492e*/      ldrb r2, [r4, #1]
            jump_4930:
/*0x4930*/      orr r2, r2, #1
/*0x4934*/      b jump_4908
            jump_4936:
/*0x4936*/      ldrb r2, [r4, #1]
            jump_4938:
/*0x4938*/      bic r2, r2, #1
/*0x493c*/      b jump_4908
            jump_493e:
/*0x493e*/      cbz r2, jump_495e
/*0x4940*/      cbz r1, jump_495e
/*0x4942*/      strb r5, [r6, #2]
/*0x4944*/      mov r1, sp
/*0x4946*/      bl call_5bc8
/*0x494a*/      ldrb r0, [r6, #6]
/*0x494c*/      cmp r0, #0
/*0x494e*/      mov r0, sp
/*0x4950*/      beq jump_4958
/*0x4952*/      bl call_39dc
/*0x4956*/      b jump_4994
            jump_4958:
/*0x4958*/      bl call_51a8
/*0x495c*/      b jump_4994
            jump_495e:
/*0x495e*/      cbz r3, jump_4994
/*0x4960*/      ldr r0, [r4]
/*0x4962*/      bl call_5500
/*0x4966*/      bl call_4f5c
/*0x496a*/      cbz r0, jump_497e
/*0x496c*/      ldrb r0, [r4]
/*0x496e*/      cbz r0, jump_4994
            jump_4970:
/*0x4970*/      bl call_5138
/*0x4974*/      ldr r0, [r4]
/*0x4976*/      pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x497a*/      b.w call_4780
            jump_497e:
/*0x497e*/      ldrb r0, [r6, #6]
/*0x4980*/      cbz r0, jump_4988
/*0x4982*/      bl call_3914
/*0x4986*/      b jump_4994
            jump_4988:
/*0x4988*/      ldrb r0, [r4]
/*0x498a*/      cmp r0, #0xe8
/*0x498c*/      beq jump_4994
/*0x498e*/      bl call_58ec
/*0x4992*/      cbz r0, jump_499a
            jump_4994:
/*0x4994*/      movs r0, #1
/*0x4996*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}
            jump_499a:
/*0x499a*/      ldrb r1, [r4, #1]
/*0x499c*/      lsls r0, r1, #0x1f
/*0x499e*/      ldrb r0, [r4, #3]
/*0x49a0*/      lsl.w r0, r0, #0x1f
/*0x49a4*/      beq jump_49ec
/*0x49a6*/      cmp r0, #0
/*0x49a8*/      bne jump_4970
/*0x49aa*/      ldr r2, [pc, #0x60] /* data_4a0c */
/*0x49ac*/      ldrb r0, [r4, #2]
/*0x49ae*/      adds r2, #0xa
/*0x49b0*/      ldrb r2, [r2, r0]
/*0x49b2*/      cbz r2, jump_49da
/*0x49b4*/      ldr r5, [pc, #0x54] /* data_4a0c */
/*0x49b6*/      lsrs r3, r0, #5
/*0x49b8*/      adds r5, #0x5c
/*0x49ba*/      ldr.w r3, [r5, r3, lsl #2]
/*0x49be*/      and r5, r0, #0x1f
/*0x49c2*/      lsl.w r0, r8, r5
/*0x49c6*/      tst r3, r0
/*0x49c8*/      beq jump_49d0
/*0x49ca*/      orr r0, r1, #1
/*0x49ce*/      b jump_49d4
            jump_49d0:
/*0x49d0*/      bic r0, r1, #1
            jump_49d4:
/*0x49d4*/      strb r0, [r4, #1]
/*0x49d6*/      strb r2, [r4]
/*0x49d8*/      b jump_4970
            jump_49da:
/*0x49da*/      bl call_58b8
/*0x49de*/      cbnz r0, jump_49f8
/*0x49e0*/      ldrb r0, [r4, #1]
/*0x49e2*/      bic r0, r0, #1
/*0x49e6*/      strb r0, [r4, #1]
/*0x49e8*/      strb r5, [r4]
/*0x49ea*/      b jump_4970
            jump_49ec:
/*0x49ec*/      cmp r0, #0
/*0x49ee*/      bne jump_4970
/*0x49f0*/      bl call_58b8
/*0x49f4*/      cmp r0, #0
/*0x49f6*/      beq jump_4970
            jump_49f8:
/*0x49f8*/      ldrb r0, [r4, #3]
/*0x49fa*/      orr r0, r0, #1
/*0x49fe*/      strb r0, [r4, #3]
/*0x4a00*/      b jump_4970

/*0x4a02*/  .byte 0x0
/*0x4a03*/  .byte 0x0

            data_4a04:
/*0x4a04*/  .word 0x20000030
            data_4a08:
/*0x4a08*/  .word 0x200002c0
            data_4a0c:
/*0x4a0c*/  .word 0x20000654
            data_4a10:
/*0x4a10*/  .word 0x20000648


            .thumb_func
            call_4a14:
/*0x4a14*/      ldrh r2, [r1]
/*0x4a16*/      bfi r2, r0, #0, #9
/*0x4a1a*/      strh r2, [r1]
/*0x4a1c*/      bx lr

            .thumb_func
            call_4a1e:
/*0x4a1e*/      ubfx r0, r0, #0, #9
/*0x4a22*/      bx lr

            .thumb_func
            call_4a24:
/*0x4a24*/      push {r4, r5, r6, r7, lr}
/*0x4a26*/      movs r5, #0
/*0x4a28*/      b jump_4a4a
            jump_4a2a:
/*0x4a2a*/      movs r4, #0
/*0x4a2c*/      b jump_4a3a
            jump_4a2e:
/*0x4a2e*/      ldrb r6, [r0, r5]
/*0x4a30*/      ldrb r7, [r1, r4]
/*0x4a32*/      cmp r6, r7
/*0x4a34*/      beq jump_4a3e
/*0x4a36*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4a38*/      uxtb r4, r4
            jump_4a3a:
/*0x4a3a*/      cmp r4, r3
/*0x4a3c*/      blo jump_4a2e
            jump_4a3e:
/*0x4a3e*/      cmp r4, r3
/*0x4a40*/      bne jump_4a46
/*0x4a42*/      movs r0, #0
/*0x4a44*/      pop {r4, r5, r6, r7, pc}
            jump_4a46:
/*0x4a46*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4a48*/      uxtb r5, r5
            jump_4a4a:
/*0x4a4a*/      cmp r5, r2
/*0x4a4c*/      blo jump_4a2a
/*0x4a4e*/      movs r0, #1
/*0x4a50*/      pop {r4, r5, r6, r7, pc}

/*0x4a52*/  .byte 0x0
/*0x4a53*/  .byte 0x0


            .thumb_func
            call_4a54:
/*0x4a54*/      push {r4, r5, r6, r7, lr}
/*0x4a56*/      movs r3, #0xa
/*0x4a58*/      movs r5, #0
/*0x4a5a*/      b jump_4a9a
            jump_4a5c:
/*0x4a5c*/      ldr r2, [pc, #0x48] /* data_4aa8 */
/*0x4a5e*/      cmp r3, #9
/*0x4a60*/      ldrb r4, [r2, r3]
/*0x4a62*/      bne jump_4a68
/*0x4a64*/      orr r4, r4, #0xf
            jump_4a68:
/*0x4a68*/      cmp r4, #0xff
/*0x4a6a*/      beq jump_4a9a
/*0x4a6c*/      ldr r6, [pc, #0x3c] /* data_4aac */
/*0x4a6e*/      movs r2, #8
/*0x4a70*/      mov.w ip, #1
/*0x4a74*/      add.w r7, r6, r3, lsl #3
/*0x4a78*/      b jump_4a94
            jump_4a7a:
/*0x4a7a*/      lsl.w r6, ip, r2
/*0x4a7e*/      uxtb r6, r6
/*0x4a80*/      tst r4, r6
/*0x4a82*/      bne jump_4a94
/*0x4a84*/      cbz r1, jump_4aa4
/*0x4a86*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4a88*/      ldrb r6, [r7, r2]
/*0x4a8a*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4a8c*/      strb r6, [r0], #1
/*0x4a90*/      uxtb r1, r1
/*0x4a92*/      uxtb r5, r5
            jump_4a94:
/*0x4a94*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4a96*/      uxtb r2, r2
/*0x4a98*/      bhs jump_4a7a
            jump_4a9a:
/*0x4a9a*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4a9c*/      uxtb r3, r3
/*0x4a9e*/      bhs jump_4a5c
/*0x4aa0*/      mov r0, r5
/*0x4aa2*/      pop {r4, r5, r6, r7, pc}
            jump_4aa4:
/*0x4aa4*/      movs r0, #0xff
/*0x4aa6*/      pop {r4, r5, r6, r7, pc}

            data_4aa8:
/*0x4aa8*/  .word 0x200001ac
            data_4aac:
/*0x4aac*/  .word 0x200002c0


            .thumb_func
            call_4ab0:
/*0x4ab0*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x4ab2*/      bl call_609c
/*0x4ab6*/      cmp r0, #0
/*0x4ab8*/      beq jump_4b02
/*0x4aba*/      ldr r0, [pc, #0x54] /* data_4b10 */
/*0x4abc*/      mov r5, sp
/*0x4abe*/      ldr r6, [pc, #0x54] /* data_4b14 */
/*0x4ac0*/      ldr r1, [r0]
/*0x4ac2*/      str r1, [sp]
/*0x4ac4*/      ldr r1, [r0, #4]
/*0x4ac6*/      str r1, [sp, #4]
/*0x4ac8*/      ldrh r0, [r0, #8]
/*0x4aca*/      strh.w r0, [sp, #8]
/*0x4ace*/      movs r0, #5
/*0x4ad0*/      ldr r7, [pc, #0x44] /* data_4b18 */
/*0x4ad2*/      movs r3, #1
/*0x4ad4*/      b jump_4af0
            jump_4ad6:
/*0x4ad6*/      ldrb r1, [r6, r0]
/*0x4ad8*/      ldrb r1, [r7, r1]
/*0x4ada*/      cmp r1, #0xff
/*0x4adc*/      beq jump_4af0
/*0x4ade*/      add.w r2, r5, r1, lsr #3
/*0x4ae2*/      and r1, r1, #7
/*0x4ae6*/      ldrb r4, [r2]
/*0x4ae8*/      lsl.w r1, r3, r1
/*0x4aec*/      orrs r4, r1
/*0x4aee*/      strb r4, [r2]
            jump_4af0:
/*0x4af0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4af2*/      uxtb r0, r0
/*0x4af4*/      bhs jump_4ad6
/*0x4af6*/      movs r0, #0xa
/*0x4af8*/      b jump_4b04
            jump_4afa:
/*0x4afa*/      ldrb r1, [r5, r0]
/*0x4afc*/      cmp r1, #0xff
/*0x4afe*/      beq jump_4b04
/*0x4b00*/      movs r0, #0
            jump_4b02:
/*0x4b02*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}
            jump_4b04:
/*0x4b04*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4b06*/      uxtb r0, r0
/*0x4b08*/      bhs jump_4afa
/*0x4b0a*/      movs r0, #1
/*0x4b0c*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x4b0e*/  .byte 0x0
/*0x4b0f*/  .byte 0x0

            data_4b10:
/*0x4b10*/  .word 0x200001ac
            data_4b14:
/*0x4b14*/  .word 0x7f64
            data_4b18:
/*0x4b18*/  .word 0x200001c0


            .thumb_func
            call_4b1c:
/*0x4b1c*/      ldr r0, [pc, #0xc] /* data_4b2c */
/*0x4b1e*/      ldr r1, [pc, #0x10] /* data_4b30 */
/*0x4b20*/      ldrb r0, [r0, #1]
/*0x4b22*/      and r0, r0, #3
/*0x4b26*/      ldrb r0, [r1, r0]
/*0x4b28*/      b.w call_60cc

            data_4b2c:
/*0x4b2c*/  .word 0x20000000
            data_4b30:
/*0x4b30*/  .word 0x7a44


            .thumb_func
            call_4b34:
/*0x4b34*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4b38*/      ldr r5, [pc, #0x8c] /* data_4bc8 */
/*0x4b3a*/      ldrh r1, [r5]
/*0x4b3c*/      movw sl, #0xffff
/*0x4b40*/      cmp r1, sl
/*0x4b42*/      beq jump_4bc4
/*0x4b44*/      movs r1, #2
/*0x4b46*/      add r0, sp, #4
/*0x4b48*/      bl call_4a54
/*0x4b4c*/      movs r6, #0
/*0x4b4e*/      ldr r4, [pc, #0x7c] /* data_4bcc */
/*0x4b50*/      movw r7, #0x2710
/*0x4b54*/      cmp r0, #2
/*0x4b56*/      bne jump_4bb8
/*0x4b58*/      ldr.w sb, [pc, #0x74] /* data_4bd0 */
/*0x4b5c*/      movs r3, #2
/*0x4b5e*/      mov r2, r3
/*0x4b60*/      ldrb.w r1, [sb, #0x44]
/*0x4b64*/      strb.w r1, [sp]
/*0x4b68*/      ldrb.w r0, [sb, #0xc]
/*0x4b6c*/      strb.w r0, [sp, #1]
/*0x4b70*/      mov r1, sp
/*0x4b72*/      add r0, sp, #4
/*0x4b74*/      bl call_4a24
/*0x4b78*/      mov.w r8, #1
/*0x4b7c*/      cbz r0, jump_4b90
/*0x4b7e*/      ldrh r0, [r5]
/*0x4b80*/      cmp r0, r7
/*0x4b82*/      bls jump_4b8a
/*0x4b84*/      strb.w r8, [r4, #3]
/*0x4b88*/      b jump_4bb8
            jump_4b8a:
/*0x4b8a*/      strb.w r8, [r4, #9]
/*0x4b8e*/      b jump_4bba
            jump_4b90:
/*0x4b90*/      ldrb.w r1, [sb, #0x22]
/*0x4b94*/      strb.w r1, [sp]
/*0x4b98*/      ldrb.w r0, [sb, #0x43]
/*0x4b9c*/      strb.w r0, [sp, #1]
/*0x4ba0*/      movs r3, #2
/*0x4ba2*/      mov r2, r3
/*0x4ba4*/      mov r1, sp
/*0x4ba6*/      add r0, sp, #4
/*0x4ba8*/      bl call_4a24
/*0x4bac*/      cbz r0, jump_4bb8
/*0x4bae*/      ldrh r0, [r5]
/*0x4bb0*/      cmp r0, r7
/*0x4bb2*/      bls jump_4b8a
/*0x4bb4*/      movs r0, #2
/*0x4bb6*/      strb r0, [r4, #3]
            jump_4bb8:
/*0x4bb8*/      strb r6, [r4, #9]
            jump_4bba:
/*0x4bba*/      ldrh r0, [r5]
/*0x4bbc*/      cmp r0, r7
/*0x4bbe*/      bls jump_4bc4
/*0x4bc0*/      strh.w sl, [r5]
            jump_4bc4:
/*0x4bc4*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, pc}

            data_4bc8:
/*0x4bc8*/  .word 0x2000001c
            data_4bcc:
/*0x4bcc*/  .word 0x20000648
            data_4bd0:
/*0x4bd0*/  .word 0x200002c0


            .thumb_func
            call_4bd4:
/*0x4bd4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4bd8*/      ldr r0, [pc, #0x240] /* data_4e1c */
/*0x4bda*/      ldr.w ip, [pc, #0x244] /* data_4e20 */
/*0x4bde*/      movs r5, #0
/*0x4be0*/      ldrb r2, [r0, #0xb]
/*0x4be2*/      ldrb.w r1, [ip, #4]
/*0x4be6*/      cbz r2, jump_4c20
/*0x4be8*/      ldrb.w r0, [ip, #6]
/*0x4bec*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4bee*/      uxtb r0, r0
/*0x4bf0*/      strb.w r0, [ip, #6]
/*0x4bf4*/      cmp r0, #3
/*0x4bf6*/      bls jump_4cac
/*0x4bf8*/      mov r0, ip
/*0x4bfa*/      strb.w r5, [ip, #6]
/*0x4bfe*/      ldrb r0, [r0, #4]
/*0x4c00*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4c02*/      cmp r2, #6
/*0x4c04*/      beq jump_4c0c
/*0x4c06*/      cmp r2, #7
            jump_4c08:
/*0x4c08*/      bne jump_4cac
/*0x4c0a*/      b jump_4c14
            jump_4c0c:
/*0x4c0c*/      strb.w r1, [ip, #5]
/*0x4c10*/      movs r1, #0x3d
/*0x4c12*/      b jump_4c16
            jump_4c14:
/*0x4c14*/      movs r1, #0x18
            jump_4c16:
/*0x4c16*/      udiv r2, r0, r1
/*0x4c1a*/      mls r0, r1, r2, r0
/*0x4c1e*/      b jump_4cb0
            jump_4c20:
/*0x4c20*/      ldr r0, [pc, #0x200] /* data_4e24 */
/*0x4c22*/      ldr r3, [pc, #0x1fc] /* data_4e20 */
/*0x4c24*/      ldr r2, [pc, #0x200] /* data_4e28 */
/*0x4c26*/      ldrb r0, [r0, #3]
/*0x4c28*/      add.w r6, r3, #0xdb
/*0x4c2c*/      ldr r3, [r3]
/*0x4c2e*/      add.w r4, r2, #0xe
/*0x4c32*/      mov.w sb, #1
/*0x4c36*/      cmp r0, #3
/*0x4c38*/      bhi jump_4cf6
/*0x4c3a*/      ldrb r2, [r2, r0]
/*0x4c3c*/      cmp r0, #1
/*0x4c3e*/      add.w r2, r2, r2, lsl #1
/*0x4c42*/      add.w r2, r4, r2, lsl #1
/*0x4c46*/      ldrb r4, [r3, #4]
/*0x4c48*/      and r4, r4, #0xf
/*0x4c4c*/      ldrb r4, [r2, r4]
/*0x4c4e*/      beq jump_4c5a
/*0x4c50*/      cmp r0, #2
/*0x4c52*/      beq jump_4cae
/*0x4c54*/      cmp r0, #3
/*0x4c56*/      bne jump_4c08
/*0x4c58*/      b jump_4cb6
            jump_4c5a:
/*0x4c5a*/      movs r1, #3
/*0x4c5c*/      add.w r0, ip, #7
/*0x4c60*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x4c62*/      b jump_4ca6
            jump_4c64:
/*0x4c64*/      lsl.w r2, sb, r1
/*0x4c68*/      ldrb.w r6, [ip, #7]
/*0x4c6c*/      uxtb r2, r2
/*0x4c6e*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4c70*/      tst r6, r2
/*0x4c72*/      ldrb r6, [r0, #-0x1]!
/*0x4c76*/      beq jump_4c8a
/*0x4c78*/      cmp r6, r4
/*0x4c7a*/      bhi jump_4c86
/*0x4c7c*/      strb r5, [r0]
/*0x4c7e*/      ldrb.w r6, [ip, #7]
/*0x4c82*/      bics r6, r2
/*0x4c84*/      b jump_4c9c
            jump_4c86:
/*0x4c86*/      subs r2, r6, r4
/*0x4c88*/      b jump_4ca4
            jump_4c8a:
/*0x4c8a*/      ldrb r7, [r3]
/*0x4c8c*/      sub.w r8, r7, r4
/*0x4c90*/      cmp r6, r8
/*0x4c92*/      blt jump_4ca2
/*0x4c94*/      strb r7, [r0]
/*0x4c96*/      ldrb.w r6, [ip, #7]
/*0x4c9a*/      orrs r6, r2
            jump_4c9c:
/*0x4c9c*/      strb.w r6, [ip, #7]
/*0x4ca0*/      b jump_4ca6
            jump_4ca2:
/*0x4ca2*/      adds r2, r6, r4
            jump_4ca4:
/*0x4ca4*/      strb r2, [r0]
            jump_4ca6:
/*0x4ca6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4ca8*/      uxtb r1, r1
/*0x4caa*/      bhs jump_4c64
            jump_4cac:
/*0x4cac*/      b jump_4e14
            jump_4cae:
/*0x4cae*/      adds r0, r1, r4
            jump_4cb0:
/*0x4cb0*/      strb.w r0, [ip, #4]
/*0x4cb4*/      b jump_4e14
            jump_4cb6:
/*0x4cb6*/      movs r7, #0x48
/*0x4cb8*/      b jump_4cee
            jump_4cba:
/*0x4cba*/      bl rand
/*0x4cbe*/      sdiv r1, r0, r4
/*0x4cc2*/      mls r0, r4, r1, r0
/*0x4cc6*/      cbz r0, jump_4ccc
/*0x4cc8*/      movs r0, #3
/*0x4cca*/      b jump_4ce8
            jump_4ccc:
/*0x4ccc*/      subs r0, r6, #2
/*0x4cce*/      movs r1, #0
/*0x4cd0*/      bl call_6ea8
/*0x4cd4*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
/*0x4cd6*/      b jump_4cee
            jump_4cd8:
/*0x4cd8*/      ldrb r1, [r6]
/*0x4cda*/      cmp r1, #2
/*0x4cdc*/      bhi jump_4ce2
/*0x4cde*/      strb r5, [r6]
/*0x4ce0*/      b jump_4ce6
            jump_4ce2:
/*0x4ce2*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x4ce4*/      strb r1, [r6]
            jump_4ce6:
/*0x4ce6*/      .short 0x1e76 /* subs r6, r6, #1 */ 
            jump_4ce8:
/*0x4ce8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4cea*/      uxtb r0, r0
/*0x4cec*/      bhs jump_4cd8
            jump_4cee:
/*0x4cee*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x4cf0*/      uxtb r7, r7
/*0x4cf2*/      bhs jump_4cba
/*0x4cf4*/      b jump_4e14
            jump_4cf6:
/*0x4cf6*/      cmp r0, #7
/*0x4cf8*/      bls jump_4d72
/*0x4cfa*/      ldrb r1, [r2, r0]
/*0x4cfc*/      ldrb r2, [r3, #4]
/*0x4cfe*/      add.w r1, r1, r1, lsl #1
/*0x4d02*/      add.w r1, r4, r1, lsl #1
/*0x4d06*/      and r2, r2, #0xf
/*0x4d0a*/      bic r0, r0, #1
/*0x4d0e*/      ldrb r2, [r1, r2]
/*0x4d10*/      cmp r0, #8
/*0x4d12*/      beq jump_4d1e
/*0x4d14*/      cmp r0, #0xa
/*0x4d16*/      beq jump_4d74
/*0x4d18*/      cmp r0, #0xc
/*0x4d1a*/      bne jump_4e14
/*0x4d1c*/      b jump_4dd2
            jump_4d1e:
/*0x4d1e*/      movs r0, #0x48
/*0x4d20*/      b jump_4d6c
            jump_4d22:
/*0x4d22*/      ldrb r1, [r6], #-1
/*0x4d26*/      cbz r1, jump_4d2c
/*0x4d28*/      .short 0x1eb6 /* subs r6, r6, #2 */ 
/*0x4d2a*/      b jump_4d3c
            jump_4d2c:
/*0x4d2c*/      ldrb r1, [r6], #-1
/*0x4d30*/      cbz r1, jump_4d36
/*0x4d32*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x4d34*/      b jump_4d3c
            jump_4d36:
/*0x4d36*/      ldrb r1, [r6], #-1
/*0x4d3a*/      cbz r1, jump_4d6c
            jump_4d3c:
/*0x4d3c*/      ldr r1, [pc, #0xec] /* data_4e2c */
/*0x4d3e*/      and r4, r0, #7
/*0x4d42*/      add.w r1, r1, r0, lsr #3
/*0x4d46*/      ldrb r3, [r1]
/*0x4d48*/      lsl.w r1, sb, r4
/*0x4d4c*/      tst r3, r1
/*0x4d4e*/      beq jump_4d6c
/*0x4d50*/      movs r1, #3
/*0x4d52*/      b jump_4d64
            jump_4d54:
/*0x4d54*/      ldrb r3, [r6, #1]!
/*0x4d58*/      cmp r3, r2
/*0x4d5a*/      bhi jump_4d60
/*0x4d5c*/      strb r5, [r6]
/*0x4d5e*/      b jump_4d64
            jump_4d60:
/*0x4d60*/      subs r3, r3, r2
/*0x4d62*/      strb r3, [r6]
            jump_4d64:
/*0x4d64*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4d66*/      uxtb r1, r1
/*0x4d68*/      bhs jump_4d54
/*0x4d6a*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
            jump_4d6c:
/*0x4d6c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4d6e*/      uxtb r0, r0
/*0x4d70*/      bhs jump_4d22
            jump_4d72:
/*0x4d72*/      b jump_4e14
            jump_4d74:
/*0x4d74*/      ldrb.w r0, [ip, #0x58]
/*0x4d78*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4d7a*/      uxtb r0, r0
/*0x4d7c*/      strb.w r0, [ip, #0x58]
/*0x4d80*/      cmp r0, r2
/*0x4d82*/      blo jump_4e14
/*0x4d84*/      strb.w r5, [ip, #0x58]
/*0x4d88*/      movs r0, #1
            jump_4d8a:
/*0x4d8a*/      add.w r1, r0, r0, lsl #1
/*0x4d8e*/      add.w r1, ip, r1, lsl #1
/*0x4d92*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4d94*/      ldrh r2, [r1, #4]
/*0x4d96*/      strh r2, [r1, #-0x2]
/*0x4d9a*/      ldrb r2, [r1, #6]
/*0x4d9c*/      uxtb r0, r0
/*0x4d9e*/      strb r2, [r1]
/*0x4da0*/      cmp r0, #0xe
/*0x4da2*/      blo jump_4d8a
/*0x4da4*/      strh.w r5, [ip, #0x52]
/*0x4da8*/      strb.w r5, [ip, #0x54]
/*0x4dac*/      movs r0, #0xe
/*0x4dae*/      b jump_4dc2
            jump_4db0:
/*0x4db0*/      add.w r1, r0, r0, lsl #1
/*0x4db4*/      add.w r1, ip, r1, lsl #1
/*0x4db8*/      ldrh r2, [r1, #1]!
/*0x4dbc*/      strh r2, [r1, #6]
/*0x4dbe*/      ldrb r2, [r1, #2]
/*0x4dc0*/      strb r2, [r1, #8]
            jump_4dc2:
/*0x4dc2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4dc4*/      uxtb r0, r0
/*0x4dc6*/      bhs jump_4db0
/*0x4dc8*/      strh.w r5, [ip, #7]
/*0x4dcc*/      strb.w r5, [ip, #9]
/*0x4dd0*/      b jump_4e14
            jump_4dd2:
/*0x4dd2*/      ldrb.w r0, [ip, #0x27]
/*0x4dd6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4dd8*/      uxtb r0, r0
/*0x4dda*/      strb.w r0, [ip, #0x27]
/*0x4dde*/      cmp r0, r2
/*0x4de0*/      blo jump_4e14
/*0x4de2*/      ldr r0, [pc, #0x3c] /* data_4e20 */
/*0x4de4*/      strb.w r5, [ip, #0x27]
/*0x4de8*/      adds r0, #0x27
/*0x4dea*/      movs r2, #5
/*0x4dec*/      b jump_4e0e
            jump_4dee:
/*0x4dee*/      ldrsb r1, [r0, #-0x1]
/*0x4df2*/      .short 0x1f40 /* subs r0, r0, #5 */ 
/*0x4df4*/      cbz r1, jump_4e0e
/*0x4df6*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4df8*/      sxtb r1, r1
/*0x4dfa*/      strb r1, [r0, #4]
/*0x4dfc*/      ldrb r3, [r0, #3]
/*0x4dfe*/      adds r4, r1, r3
/*0x4e00*/      subs r4, #0xa
/*0x4e02*/      cmp r4, #0xe
/*0x4e04*/      ble jump_4e0e
/*0x4e06*/      subs r1, r3, r1
/*0x4e08*/      adds r1, #0xa
/*0x4e0a*/      bpl jump_4e0e
/*0x4e0c*/      strb r5, [r0, #4]
            jump_4e0e:
/*0x4e0e*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4e10*/      uxtb r2, r2
/*0x4e12*/      bhs jump_4dee
            jump_4e14:
/*0x4e14*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4e18*/      b.w call_55a8

            data_4e1c:
/*0x4e1c*/  .word 0x20000648
            data_4e20:
/*0x4e20*/  .word 0x2000008c
            data_4e24:
/*0x4e24*/  .word 0x20000730
            data_4e28:
/*0x4e28*/  .word 0x7aab
            data_4e2c:
/*0x4e2c*/  .word 0x200001ac


            .thumb_func
            call_4e30:
/*0x4e30*/      movs r1, #5
/*0x4e32*/      ldr r0, [pc, #4] /* data_4e38 */
/*0x4e34*/      b.w jump_4728

            data_4e38:
/*0x4e38*/  .word 0x7a4d


            .thumb_func
            call_4e3c:
/*0x4e3c*/      push {r3, r4, r5, lr}
/*0x4e3e*/      movs r1, #3
/*0x4e40*/      mov r0, sp
/*0x4e42*/      bl call_4a54
/*0x4e46*/      ldr r4, [pc, #0x2c] /* data_4e74 */
/*0x4e48*/      cmp r0, #3
/*0x4e4a*/      bne jump_4e6a
/*0x4e4c*/      movs r3, #3
/*0x4e4e*/      mov r2, r3
/*0x4e50*/      ldr r1, [pc, #0x24] /* data_4e78 */
/*0x4e52*/      mov r0, sp
/*0x4e54*/      bl call_4a24
/*0x4e58*/      cbz r0, jump_4e6a
/*0x4e5a*/      ldrb r0, [r4, #2]
/*0x4e5c*/      mvn.w r1, r0, lsr #1
/*0x4e60*/      bfi r0, r1, #1, #1
/*0x4e64*/      strb r0, [r4, #2]
/*0x4e66*/      bl call_3bec
            jump_4e6a:
/*0x4e6a*/      ldrb r0, [r4, #2]
/*0x4e6c*/      ubfx r0, r0, #1, #1
/*0x4e70*/      pop {r3, r4, r5, pc}

/*0x4e72*/  .byte 0x0
/*0x4e73*/  .byte 0x0

            data_4e74:
/*0x4e74*/  .word 0x20000730
            data_4e78:
/*0x4e78*/  .word 0x7a41


            .thumb_func
            call_4e7c:
/*0x4e7c*/      push {r4, lr}
/*0x4e7e*/      lsrs r1, r0, #0x18
/*0x4e80*/      lsls r1, r1, #0x1e
/*0x4e82*/      bpl jump_4eb6
/*0x4e84*/      uxtb r0, r0
/*0x4e86*/      cmp r0, #0x12
/*0x4e88*/      beq jump_4eb8
/*0x4e8a*/      bgt jump_4e96
/*0x4e8c*/      cmp r0, #0x10
/*0x4e8e*/      beq jump_4eb8
/*0x4e90*/      cmp r0, #0x11
/*0x4e92*/      bne jump_4eb6
/*0x4e94*/      b jump_4eb8
            jump_4e96:
/*0x4e96*/      cmp r0, #0x13
/*0x4e98*/      beq jump_4eb8
/*0x4e9a*/      cmp r0, #0x5f
/*0x4e9c*/      bne jump_4eb6
/*0x4e9e*/      ldr r0, [pc, #0x20] /* data_4ec0 */
/*0x4ea0*/      ldrb r0, [r0, #2]
/*0x4ea2*/      cmp r0, #0
/*0x4ea4*/      beq jump_4eb6
/*0x4ea6*/      bl call_559c
/*0x4eaa*/      bl call_5aac
/*0x4eae*/      ldr r1, [pc, #0x14] /* data_4ec4 */
/*0x4eb0*/      movw r0, #0x7530
/*0x4eb4*/      strh r0, [r1, #2]
            jump_4eb6:
/*0x4eb6*/      pop {r4, pc}
            jump_4eb8:
/*0x4eb8*/      ldr r1, [pc, #0xc] /* data_4ec8 */
/*0x4eba*/      subs r0, #0x10
/*0x4ebc*/      strb r0, [r1]
/*0x4ebe*/      pop {r4, pc}

            data_4ec0:
/*0x4ec0*/  .word 0x2000005c
            data_4ec4:
/*0x4ec4*/  .word 0x20000000
            data_4ec8:
/*0x4ec8*/  .word 0x20000029


            .thumb_func
            call_4ecc:
/*0x4ecc*/      ldr r0, [pc, #0x7c] /* data_4f4c */
/*0x4ece*/      push {r4, lr}
/*0x4ed0*/      ldrb r1, [r0, #3]
/*0x4ed2*/      lsls r1, r1, #0x1e
/*0x4ed4*/      bpl jump_4f26
/*0x4ed6*/      ldr r2, [pc, #0x78] /* data_4f50 */
/*0x4ed8*/      ldrb r4, [r0]
/*0x4eda*/      movs r3, #1
/*0x4edc*/      ldrb r1, [r2, #7]
/*0x4ede*/      cmp r4, #0xcf
/*0x4ee0*/      beq jump_4ef2
/*0x4ee2*/      ldrb r0, [r0, #1]
/*0x4ee4*/      lsls r0, r0, #0x1f
/*0x4ee6*/      beq jump_4f26
/*0x4ee8*/      ldr r0, [pc, #0x60] /* data_4f4c */
/*0x4eea*/      cmp r1, #2
/*0x4eec*/      ldrb r0, [r0, #2]
/*0x4eee*/      beq jump_4f06
/*0x4ef0*/      b jump_4f12
            jump_4ef2:
/*0x4ef2*/      cmp r1, #4
/*0x4ef4*/      beq jump_4f02
/*0x4ef6*/      cmp r1, #5
/*0x4ef8*/      bne jump_4f26
/*0x4efa*/      strb r3, [r2, #8]
/*0x4efc*/      movs r0, #6
/*0x4efe*/      strb r0, [r2, #7]
/*0x4f00*/      b jump_4f48
            jump_4f02:
/*0x4f02*/      strb r3, [r2, #7]
/*0x4f04*/      b jump_4f48
            jump_4f06:
/*0x4f06*/      cmp r0, #0xd
/*0x4f08*/      beq jump_4f26
/*0x4f0a*/      cmp r0, #0x15
/*0x4f0c*/      beq jump_4f26
/*0x4f0e*/      cmp r0, #0x1d
/*0x4f10*/      beq jump_4f26
            jump_4f12:
/*0x4f12*/      ldr r1, [pc, #0x3c] /* data_4f50 */
/*0x4f14*/      cmp r0, #0xd
/*0x4f16*/      ldr r1, [r1]
/*0x4f18*/      beq jump_4f2a
/*0x4f1a*/      cmp r0, #0x15
/*0x4f1c*/      beq jump_4f2e
/*0x4f1e*/      cmp r0, #0x1d
/*0x4f20*/      beq jump_4f34
/*0x4f22*/      cmp r0, #0x47
/*0x4f24*/      beq jump_4f3a
            jump_4f26:
/*0x4f26*/      movs r0, #0
/*0x4f28*/      pop {r4, pc}
            jump_4f2a:
/*0x4f2a*/      adds r1, #0xf
/*0x4f2c*/      b jump_4f30
            jump_4f2e:
/*0x4f2e*/      adds r1, #0x64
            jump_4f30:
/*0x4f30*/      str r1, [r2]
/*0x4f32*/      b jump_4f48
            jump_4f34:
/*0x4f34*/      add.w r1, r1, #0x1f4
/*0x4f38*/      b jump_4f30
            jump_4f3a:
/*0x4f3a*/      movs r0, #8
/*0x4f3c*/      ldr r1, [pc, #0x14] /* data_4f54 */
/*0x4f3e*/      strb r0, [r2, #7]
/*0x4f40*/      movs r0, #0
/*0x4f42*/      strh r0, [r1, #2]
/*0x4f44*/      ldr r0, [pc, #0x10] /* data_4f58 */
/*0x4f46*/      strb r3, [r0]
            jump_4f48:
/*0x4f48*/      movs r0, #1
/*0x4f4a*/      pop {r4, pc}

            data_4f4c:
/*0x4f4c*/  .word 0x20000030
            data_4f50:
/*0x4f50*/  .word 0x200019d0
            data_4f54:
/*0x4f54*/  .word 0x20000000
            data_4f58:
/*0x4f58*/  .word 0x20000648


            .thumb_func
            call_4f5c:
/*0x4f5c*/      push.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x4f60*/      ldr r0, [pc, #0x1b8] /* data_511c */
/*0x4f62*/      ldrh r1, [r0, #2]
/*0x4f64*/      cbz r1, jump_4f6c
/*0x4f66*/      movw r1, #0x7530
/*0x4f6a*/      strh r1, [r0, #2]
            jump_4f6c:
/*0x4f6c*/      ldr r6, [pc, #0x1b4] /* data_5124 */
/*0x4f6e*/      ldr r5, [pc, #0x1b0] /* data_5120 */
/*0x4f70*/      mov.w sb, #0
/*0x4f74*/      ldrb r2, [r6]
/*0x4f76*/      ldrb r3, [r5, #0xa]
/*0x4f78*/      ldrb r1, [r6, #3]
/*0x4f7a*/      ldrb r0, [r6, #2]
/*0x4f7c*/      mov.w fp, #3
/*0x4f80*/      movs r4, #1
/*0x4f82*/      cbz r3, jump_4fd8
/*0x4f84*/      lsls r1, r1, #0x1e
/*0x4f86*/      bpl jump_4fd2
/*0x4f88*/      cmp r3, #1
/*0x4f8a*/      beq jump_4f9c
/*0x4f8c*/      ldr r1, [pc, #0x198] /* data_5128 */
/*0x4f8e*/      ldrb r1, [r3, r1]
/*0x4f90*/      cmp r0, r1
/*0x4f92*/      beq jump_4fca
/*0x4f94*/      ldr r7, [pc, #0x190] /* data_5128 */
/*0x4f96*/      movs r1, #5
/*0x4f98*/      adds r7, #0xe
/*0x4f9a*/      b jump_4fc0
            jump_4f9c:
/*0x4f9c*/      ldr r1, [pc, #0x18c] /* data_512c */
/*0x4f9e*/      ldrb.w r2, [r1, #0xe8]
/*0x4fa2*/      cmp r0, r2
/*0x4fa4*/      bne jump_4faa
/*0x4fa6*/      movs r2, #2
/*0x4fa8*/      strb r2, [r5, #0xa]
            jump_4faa:
/*0x4faa*/      ldrb.w r1, [r1, #0xe9]
/*0x4fae*/      cmp r0, r1
/*0x4fb0*/      bne jump_4fd2
/*0x4fb2*/      strb.w fp, [r5, #0xa]
/*0x4fb6*/      b jump_4fd2
            jump_4fb8:
/*0x4fb8*/      ldrb.w ip, [r7, r1]
/*0x4fbc*/      cmp ip, r2
/*0x4fbe*/      beq jump_4fc6
            jump_4fc0:
/*0x4fc0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4fc2*/      uxtb r1, r1
/*0x4fc4*/      bhs jump_4fb8
            jump_4fc6:
/*0x4fc6*/      cmp r1, #0xff
/*0x4fc8*/      bne jump_4fd2
            jump_4fca:
/*0x4fca*/      ldr r1, [pc, #0x160] /* data_512c */
/*0x4fcc*/      adds r1, #0xe6
/*0x4fce*/      strb r0, [r3, r1]
/*0x4fd0*/      strb r4, [r5, #0xa]
            jump_4fd2:
/*0x4fd2*/      strb.w sb, [r6]
/*0x4fd6*/      b jump_5008
            jump_4fd8:
/*0x4fd8*/      ldr.w sl, [pc, #0x154] /* data_5130 */
/*0x4fdc*/      cmp r2, #0xcf
/*0x4fde*/      ldrb.w ip, [sl, #6]
/*0x4fe2*/      beq jump_4ffc
/*0x4fe4*/      ldr r7, [pc, #0x13c] /* data_5124 */
/*0x4fe6*/      ldrb r3, [r6, #1]
/*0x4fe8*/      ldrb r7, [r7, #3]
/*0x4fea*/      lsls.w r8, r3, #0x1f
/*0x4fee*/      orr r7, r7, #1
/*0x4ff2*/      beq jump_5044
/*0x4ff4*/      cmp.w ip, #1
/*0x4ff8*/      beq jump_5012
/*0x4ffa*/      b jump_500e
            jump_4ffc:
/*0x4ffc*/      ubfx r0, r1, #1, #1
/*0x5000*/      strb r0, [r5, #7]
/*0x5002*/      cmp.w ip, #1
/*0x5006*/      beq jump_500e
            jump_5008:
/*0x5008*/      movs r0, #1
            jump_500a:
/*0x500a*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_500e:
/*0x500e*/      movs r0, #0
/*0x5010*/      b jump_500a
            jump_5012:
/*0x5012*/      ldrb.w r1, [sl, #7]
/*0x5016*/      cmp r1, #2
/*0x5018*/      beq jump_500e
/*0x501a*/      ldr r2, [pc, #0x10c] /* data_5128 */
/*0x501c*/      movs r1, #0
/*0x501e*/      adds r2, #0x22
            jump_5020:
/*0x5020*/      ldrb.w r4, [r2, r1, lsl #1]
/*0x5024*/      cmp r0, r4
/*0x5026*/      bne jump_503a
/*0x5028*/      add.w r0, r2, r1, lsl #1
/*0x502c*/      ldrb r0, [r0, #1]
/*0x502e*/      strb r0, [r6]
/*0x5030*/      strb r7, [r6, #3]
/*0x5032*/      bic r0, r3, #1
/*0x5036*/      strb r0, [r6, #1]
            jump_5038:
/*0x5038*/      b jump_500e
            jump_503a:
/*0x503a*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x503c*/      uxtb r1, r1
/*0x503e*/      cmp r1, #0x22
/*0x5040*/      blo jump_5020
/*0x5042*/      b jump_500e
            jump_5044:
/*0x5044*/      ldrb.w ip, [r5, #7]
/*0x5048*/      cmp.w ip, #0
/*0x504c*/      beq jump_50bc
/*0x504e*/      ldrb r2, [r5, #6]
/*0x5050*/      cmp r2, #0
/*0x5052*/      bne jump_500e
/*0x5054*/      lsls r1, r1, #0x1e
/*0x5056*/      bpl jump_50b6
/*0x5058*/      ldr r1, [pc, #0xd8] /* data_5134 */
/*0x505a*/      cmp r0, #0x25
/*0x505c*/      ldrb r1, [r1, r0]
/*0x505e*/      strb r1, [r6]
/*0x5060*/      beq jump_5078
/*0x5062*/      bgt jump_506e
/*0x5064*/      cmp r0, #5
/*0x5066*/      beq jump_5092
/*0x5068*/      cmp r0, #0x24
/*0x506a*/      bne jump_50b0
/*0x506c*/      b jump_5078
            jump_506e:
/*0x506e*/      cmp r0, #0x26
/*0x5070*/      beq jump_5084
/*0x5072*/      cmp r0, #0x2a
/*0x5074*/      bne jump_50b0
/*0x5076*/      b jump_5084
            jump_5078:
/*0x5078*/      subs r0, #0x24
/*0x507a*/      lsls r4, r0
/*0x507c*/      uxtb r0, r4
/*0x507e*/      bl call_3a80
/*0x5082*/      b jump_50b6
            jump_5084:
/*0x5084*/      subs r0, #0x26
/*0x5086*/      lsl.w r0, r4, r0
/*0x508a*/      uxtb r0, r0
/*0x508c*/      bl call_3a68
/*0x5090*/      b jump_50ac
            jump_5092:
/*0x5092*/      lsls r0, r3, #0x1c
/*0x5094*/      bpl jump_50b0
/*0x5096*/      ldrb r0, [r5, #0xb]
/*0x5098*/      cbz r0, jump_50aa
/*0x509a*/      movs r1, #7
/*0x509c*/      udiv r2, r0, r1
/*0x50a0*/      mls r0, r1, r2, r0
/*0x50a4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x50a6*/      strb r0, [r5, #0xb]
/*0x50a8*/      b jump_50ac
            jump_50aa:
/*0x50aa*/      strb r4, [r5, #0xb]
            jump_50ac:
/*0x50ac*/      strb r4, [r5]
/*0x50ae*/      b jump_50b6
            jump_50b0:
/*0x50b0*/      ldr r0, [r6]
/*0x50b2*/      bl call_53e0
            jump_50b6:
/*0x50b6*/      strb.w sb, [r6]
/*0x50ba*/      b jump_500e
            jump_50bc:
/*0x50bc*/      lsls r0, r1, #0x1e
/*0x50be*/      ldr r1, [pc, #0x5c] /* data_511c */
/*0x50c0*/      bpl jump_5108
/*0x50c2*/      cmp r2, #0x29
/*0x50c4*/      beq jump_50fc
/*0x50c6*/      cmp r2, #0x2c
/*0x50c8*/      beq jump_50d2
/*0x50ca*/      cmp r2, #0xe3
/*0x50cc*/      beq jump_50d2
/*0x50ce*/      cmp r2, #0xe6
/*0x50d0*/      bne jump_500e
            jump_50d2:
/*0x50d2*/      movs r1, #3
/*0x50d4*/      mov r0, sp
/*0x50d6*/      bl call_4a54
/*0x50da*/      cmp r0, #3
/*0x50dc*/      bne jump_500e
/*0x50de*/      ldr r1, [pc, #0x48] /* data_5128 */
/*0x50e0*/      movs r3, #3
/*0x50e2*/      mov r2, r3
/*0x50e4*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x50e6*/      mov r0, sp
/*0x50e8*/      bl call_4a24
/*0x50ec*/      cmp r0, #0
/*0x50ee*/      beq jump_500e
/*0x50f0*/      ldrb r0, [r5, #8]
/*0x50f2*/      mvns r0, r0
/*0x50f4*/      strb r0, [r5, #8]
/*0x50f6*/      strb.w fp, [r5, #4]
/*0x50fa*/      b jump_50b6
            jump_50fc:
/*0x50fc*/      lsls r0, r3, #0x1b
/*0x50fe*/      bpl jump_500e
/*0x5100*/      movs r0, #0x35
/*0x5102*/      strb r0, [r6]
/*0x5104*/      strb r0, [r1]
/*0x5106*/      b jump_5118
            jump_5108:
/*0x5108*/      ldrb r0, [r1]
/*0x510a*/      cmp r0, #0
/*0x510c*/      beq jump_5038
/*0x510e*/      cmp r2, #0x29
/*0x5110*/      bne jump_5038
/*0x5112*/      strb r0, [r6]
/*0x5114*/      strb.w sb, [r1]
            jump_5118:
/*0x5118*/      strb r7, [r6, #3]
/*0x511a*/      b jump_500e

            data_511c:
/*0x511c*/  .word 0x20000000
            data_5120:
/*0x5120*/  .word 0x20000648
            data_5124:
/*0x5124*/  .word 0x20000030
            data_5128:
/*0x5128*/  .word 0x7a3a
            data_512c:
/*0x512c*/  .word 0x20000730
            data_5130:
/*0x5130*/  .word 0x200019d0
            data_5134:
/*0x5134*/  .word 0x200002c0


            .thumb_func
            call_5138:
/*0x5138*/      push {r4, r5, r6, lr}
/*0x513a*/      ldr r4, [pc, #0x60] /* data_519c */
/*0x513c*/      ldrb r0, [r4, #3]
/*0x513e*/      lsls r1, r0, #0x1f
/*0x5140*/      bne jump_516e
/*0x5142*/      mov r1, r4
/*0x5144*/      ldr r3, [pc, #0x58] /* data_51a0 */
/*0x5146*/      ldrb r1, [r1, #2]
/*0x5148*/      ldr r2, [pc, #0x58] /* data_51a4 */
/*0x514a*/      lsls r0, r0, #0x1e
/*0x514c*/      bpl jump_517a
/*0x514e*/      ldrb r5, [r4, #1]
/*0x5150*/      lsls r0, r5, #0x19
/*0x5152*/      bpl jump_516e
/*0x5154*/      movs r0, #0
            jump_5156:
/*0x5156*/      ldrb.w r6, [r3, r0, lsl #1]
/*0x515a*/      cmp r1, r6
/*0x515c*/      bne jump_5170
/*0x515e*/      add.w r1, r3, r0, lsl #1
/*0x5162*/      ldrb r1, [r1, #1]
/*0x5164*/      strb r1, [r4]
/*0x5166*/      strb r1, [r2, r0]
/*0x5168*/      bic r0, r5, #1
/*0x516c*/      strb r0, [r4, #1]
            jump_516e:
/*0x516e*/      pop {r4, r5, r6, pc}
            jump_5170:
/*0x5170*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5172*/      uxtb r0, r0
/*0x5174*/      cmp r0, #0x22
/*0x5176*/      blo jump_5156
/*0x5178*/      pop {r4, r5, r6, pc}
            jump_517a:
/*0x517a*/      movs r0, #0
            jump_517c:
/*0x517c*/      ldrb.w r5, [r3, r0, lsl #1]
/*0x5180*/      cmp r1, r5
/*0x5182*/      bne jump_5190
/*0x5184*/      ldrb r5, [r2, r0]
/*0x5186*/      cbz r5, jump_5190
/*0x5188*/      strb r5, [r4]
/*0x518a*/      movs r1, #0
/*0x518c*/      strb r1, [r2, r0]
/*0x518e*/      pop {r4, r5, r6, pc}
            jump_5190:
/*0x5190*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5192*/      uxtb r0, r0
/*0x5194*/      cmp r0, #0x22
/*0x5196*/      blo jump_517c
/*0x5198*/      pop {r4, r5, r6, pc}

/*0x519a*/  .byte 0x0
/*0x519b*/  .byte 0x0

            data_519c:
/*0x519c*/  .word 0x20000030
            data_51a0:
/*0x51a0*/  .word 0x7a5c
            data_51a4:
/*0x51a4*/  .word 0x20000068


            .thumb_func
            call_51a8:
/*0x51a8*/      ldr r1, [pc, #0x18] /* data_51c4 */
/*0x51aa*/      push {r4, lr}
/*0x51ac*/      ldr r1, [r1]
/*0x51ae*/      ldrh r2, [r0]
/*0x51b0*/      strh r2, [r1]
/*0x51b2*/      ldrb r0, [r0, #2]
/*0x51b4*/      strb r0, [r1, #2]
/*0x51b6*/      bl call_55a8
/*0x51ba*/      pop.w {r4, lr}
/*0x51be*/      b.w call_3bec

/*0x51c2*/  .byte 0x0
/*0x51c3*/  .byte 0x0

            data_51c4:
/*0x51c4*/  .word 0x2000008c


            .thumb_func
            call_51c8:
/*0x51c8*/      ldr r2, [pc, #0x20] /* data_51ec */
/*0x51ca*/      ldrh r0, [r2, #2]
/*0x51cc*/      cmp r0, #1
/*0x51ce*/      bne jump_51e6
/*0x51d0*/      ldr r0, [pc, #0x1c] /* data_51f0 */
/*0x51d2*/      ldrb r1, [r0, #7]
/*0x51d4*/      cbz r1, jump_51da
/*0x51d6*/      movs r1, #8
/*0x51d8*/      strb r1, [r0, #7]
            jump_51da:
/*0x51da*/      ldr r1, [pc, #0x18] /* data_51f4 */
/*0x51dc*/      movs r0, #0
/*0x51de*/      movs r3, #1
/*0x51e0*/      strb r0, [r1, #6]
/*0x51e2*/      strb r3, [r1]
/*0x51e4*/      strh r0, [r2, #2]
            jump_51e6:
/*0x51e6*/      movs r0, #1
/*0x51e8*/      bx lr

/*0x51ea*/  .byte 0x0
/*0x51eb*/  .byte 0x0

            data_51ec:
/*0x51ec*/  .word 0x20000000
            data_51f0:
/*0x51f0*/  .word 0x200019d0
            data_51f4:
/*0x51f4*/  .word 0x20000648


            .thumb_func
            call_51f8:
/*0x51f8*/      cmp r0, #0xff
/*0x51fa*/      bhs jump_520a
/*0x51fc*/      adds r0, #0x2b
/*0x51fe*/      cmp r0, #0xff
/*0x5200*/      bls jump_5206
/*0x5202*/      movs r0, #0xff
/*0x5204*/      bx lr
            jump_5206:
/*0x5206*/      uxtb r0, r0
/*0x5208*/      bx lr
            jump_520a:
/*0x520a*/      movs r0, #0
/*0x520c*/      bx lr

/*0x520e*/  .byte 0x0
/*0x520f*/  .byte 0x0


            .thumb_func
            call_5210:
/*0x5210*/      push {r0, r1, r4, r5, r6, lr}
/*0x5212*/      cmp.w r0, #0x200
/*0x5216*/      bhs jump_5270
/*0x5218*/      ldrh.w r4, [sp, #4]
/*0x521c*/      cmp.w r4, #0x400
/*0x5220*/      bhs jump_5270
/*0x5222*/      lsrs r1, r0, #8
/*0x5224*/      ldr r2, [pc, #0x6c] /* data_5294 */
/*0x5226*/      uxtb r0, r0
/*0x5228*/      add.w r1, r1, r1, lsl #2
/*0x522c*/      ldrb r0, [r2, r0]
/*0x522e*/      lsls r1, r1, #2
/*0x5230*/      cmp r0, #0xff
/*0x5232*/      beq jump_5270
/*0x5234*/      add.w r2, r1, r0, lsr #2
/*0x5238*/      add.w r3, r0, r1, lsl #2
/*0x523c*/      lsls r0, r0, #0x1e
/*0x523e*/      lsrs r1, r0, #0x1d
/*0x5240*/      movs r6, #3
/*0x5242*/      ldr r5, [pc, #0x54] /* data_5298 */
/*0x5244*/      adds r2, #0xa0
/*0x5246*/      cmp r4, #3
/*0x5248*/      beq jump_5274
/*0x524a*/      ldrb.w r0, [sp, #4]
/*0x524e*/      add r3, r5
/*0x5250*/      cmp r0, #0xff
/*0x5252*/      strb.w r0, [r3, #0xea]
/*0x5256*/      beq jump_526c
/*0x5258*/      adds r0, r5, r2
/*0x525a*/      lsls r6, r1
/*0x525c*/      ldrb r2, [r0, #0xea]!
/*0x5260*/      ldrb.w r3, [sp, #5]
/*0x5264*/      bics r2, r6
/*0x5266*/      lsls r3, r1
/*0x5268*/      orrs r2, r3
/*0x526a*/      strb r2, [r0]
            jump_526c:
/*0x526c*/      movs r0, #0
/*0x526e*/      pop {r2, r3, r4, r5, r6, pc}
            jump_5270:
/*0x5270*/      movs r0, #3
            jump_5272:
/*0x5272*/      pop {r2, r3, r4, r5, r6, pc}
            jump_5274:
/*0x5274*/      adds r0, r5, r3
/*0x5276*/      ldrb.w r0, [r0, #0xea]
/*0x527a*/      cmp r0, #0xff
/*0x527c*/      beq jump_5272
/*0x527e*/      add r2, r5
/*0x5280*/      lsls r6, r1
/*0x5282*/      ldrb.w r2, [r2, #0xea]
/*0x5286*/      rsb.w r1, r1, #8
/*0x528a*/      ands r2, r6
/*0x528c*/      lsls r2, r1
/*0x528e*/      add r0, r2
/*0x5290*/      uxth r0, r0
/*0x5292*/      pop {r2, r3, r4, r5, r6, pc}

            data_5294:
/*0x5294*/  .word 0x200001c0
            data_5298:
/*0x5298*/  .word 0x20000730


            .thumb_func
            call_529c:
/*0x529c*/      push {r4, r5, r6, r7, lr}
/*0x529e*/      ldr r0, [pc, #0x6c] /* data_530c */
/*0x52a0*/      ldrb r1, [r0, #2]
/*0x52a2*/      ldr r0, [pc, #0x6c] /* data_5310 */
/*0x52a4*/      ldrb r2, [r0, #1]
/*0x52a6*/      cbz r1, jump_52ac
/*0x52a8*/      lsls r0, r2, #0x1c
/*0x52aa*/      bmi jump_5300
            jump_52ac:
/*0x52ac*/      ldr r0, [pc, #0x64] /* data_5314 */
/*0x52ae*/      ldr r5, [pc, #0x68] /* data_5318 */
/*0x52b0*/      ldr r3, [pc, #0x68] /* data_531c */
/*0x52b2*/      ldrb.w r0, [r0, #0xe8]
/*0x52b6*/      lsls r1, r2, #0x1d
/*0x52b8*/      mov.w r4, #0xe8
/*0x52bc*/      bpl jump_52c6
/*0x52be*/      ldrb.w r1, [r5, #0x39]
/*0x52c2*/      strb r4, [r3, r1]
/*0x52c4*/      strb r4, [r3, r0]
            jump_52c6:
/*0x52c6*/      ldr r1, [pc, #0x58] /* data_5320 */
/*0x52c8*/      movs r6, #0xcf
/*0x52ca*/      ldrb r7, [r1, #8]
/*0x52cc*/      ldr r1, [pc, #0x44] /* data_5314 */
/*0x52ce*/      ldrb.w r1, [r1, #0xe9]
/*0x52d2*/      cbz r7, jump_5302
/*0x52d4*/      ldrb.w r2, [r5, #0xe7]
/*0x52d8*/      movs r7, #0x50
/*0x52da*/      cmp r0, r2
/*0x52dc*/      strb r7, [r3, r2]
/*0x52de*/      beq jump_52e2
/*0x52e0*/      strb r4, [r3, r0]
            jump_52e2:
/*0x52e2*/      ldrb.w r0, [r5, #0x65]
/*0x52e6*/      movs r2, #0x51
/*0x52e8*/      cmp r1, r0
/*0x52ea*/      strb r2, [r3, r0]
/*0x52ec*/      beq jump_52f0
/*0x52ee*/      strb r6, [r3, r1]
            jump_52f0:
/*0x52f0*/      ldrb.w r1, [r5, #0xe5]
/*0x52f4*/      movs r0, #0x52
/*0x52f6*/      strb r0, [r3, r1]
/*0x52f8*/      ldrb.w r1, [r5, #0xe4]
/*0x52fc*/      movs r0, #0x4f
/*0x52fe*/      strb r0, [r3, r1]
            jump_5300:
/*0x5300*/      pop {r4, r5, r6, r7, pc}
            jump_5302:
/*0x5302*/      lsls r2, r2, #0x1d
/*0x5304*/      bmi jump_5308
/*0x5306*/      strb r4, [r3, r0]
            jump_5308:
/*0x5308*/      strb r6, [r3, r1]
/*0x530a*/      pop {r4, r5, r6, r7, pc}

            data_530c:
/*0x530c*/  .word 0x2000005c
            data_5310:
/*0x5310*/  .word 0x20000000
            data_5314:
/*0x5314*/  .word 0x20000730
            data_5318:
/*0x5318*/  .word 0x200001c0
            data_531c:
/*0x531c*/  .word 0x200002c0
            data_5320:
/*0x5320*/  .word 0x20000648


            .thumb_func
            call_5324:
/*0x5324*/      ldr r3, [pc, #0x80] /* data_53a8 */
/*0x5326*/      push {r4, lr}
/*0x5328*/      ldrb r0, [r3, #3]
/*0x532a*/      ldr r1, [pc, #0x80] /* data_53ac */
/*0x532c*/      ldrb r0, [r1, r0]
/*0x532e*/      add.w r0, r0, r0, lsl #2
/*0x5332*/      adds r1, r0, r3
/*0x5334*/      ldr r0, [pc, #0x78] /* data_53b0 */
/*0x5336*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x5338*/      str r1, [r0]
/*0x533a*/      ldrb r2, [r1]
/*0x533c*/      cbnz r2, jump_534e
/*0x533e*/      ldrb r2, [r1, #1]
/*0x5340*/      cbnz r2, jump_534e
/*0x5342*/      movs r2, #0xff
/*0x5344*/      strb r2, [r1]
/*0x5346*/      ldr r1, [r0]
/*0x5348*/      strb r2, [r1, #1]
/*0x534a*/      ldr r1, [r0]
/*0x534c*/      strb r2, [r1, #2]
            jump_534e:
/*0x534e*/      ldrb r1, [r3, #3]
/*0x5350*/      cmp r1, #3
/*0x5352*/      bhi jump_5372
/*0x5354*/      movs r2, #0
/*0x5356*/      cmp r1, #1
/*0x5358*/      beq jump_5364
/*0x535a*/      cmp r1, #2
/*0x535c*/      beq jump_5368
/*0x535e*/      cmp r1, #3
/*0x5360*/      bne jump_539e
/*0x5362*/      b jump_536e
            jump_5364:
/*0x5364*/      str r2, [r0, #4]
/*0x5366*/      b jump_539e
            jump_5368:
/*0x5368*/      strb r2, [r0, #4]
/*0x536a*/      strb r2, [r0, #5]
/*0x536c*/      b jump_539e
            jump_536e:
/*0x536e*/      movs r1, #0xd8
/*0x5370*/      b jump_538a
            jump_5372:
/*0x5372*/      cmp r1, #7
/*0x5374*/      bls jump_539e
/*0x5376*/      bic r1, r1, #1
/*0x537a*/      cmp r1, #8
/*0x537c*/      beq jump_536e
/*0x537e*/      cmp r1, #0xa
/*0x5380*/      beq jump_5388
/*0x5382*/      cmp r1, #0xc
/*0x5384*/      bne jump_539e
/*0x5386*/      b jump_5392
            jump_5388:
/*0x5388*/      movs r1, #0x55
            jump_538a:
/*0x538a*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x538c*/      bl mem_zero
/*0x5390*/      b jump_539e
            jump_5392:
/*0x5392*/      movs r1, #0x24
/*0x5394*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5396*/      bl mem_zero
/*0x539a*/      bl call_6ca4
            jump_539e:
/*0x539e*/      ldr r1, [pc, #0x14] /* data_53b4 */
/*0x53a0*/      movs r0, #1
/*0x53a2*/      strb r0, [r1]
/*0x53a4*/      pop {r4, pc}

/*0x53a6*/  .byte 0x0
/*0x53a7*/  .byte 0x0

            data_53a8:
/*0x53a8*/  .word 0x20000730
            data_53ac:
/*0x53ac*/  .word 0x7aab
            data_53b0:
/*0x53b0*/  .word 0x2000008c
            data_53b4:
/*0x53b4*/  .word 0x20000648


            .thumb_func
            call_53b8:
/*0x53b8*/      ldr r0, [pc, #0x20] /* data_53dc */
/*0x53ba*/      ldrb r0, [r0, #3]
/*0x53bc*/      cmp r0, #8
/*0x53be*/      beq jump_53d6
/*0x53c0*/      bgt jump_53ca
/*0x53c2*/      cbz r0, jump_53d6
/*0x53c4*/      cmp r0, #1
/*0x53c6*/      bne jump_53d2
/*0x53c8*/      b jump_53d6
            jump_53ca:
/*0x53ca*/      cmp r0, #0xa
/*0x53cc*/      beq jump_53d6
/*0x53ce*/      cmp r0, #0xc
/*0x53d0*/      beq jump_53d6
            jump_53d2:
/*0x53d2*/      movs r0, #0
/*0x53d4*/      bx lr
            jump_53d6:
/*0x53d6*/      movs r0, #1
/*0x53d8*/      bx lr

/*0x53da*/  .byte 0x0
/*0x53db*/  .byte 0x0

            data_53dc:
/*0x53dc*/  .word 0x20000730


            .thumb_func
            call_53e0:
/*0x53e0*/      push {r4, r5, r6, lr}
/*0x53e2*/      ldr r5, [pc, #0x10c] /* data_54f0 */
/*0x53e4*/      mov r4, r0
/*0x53e6*/      uxtb r1, r0
/*0x53e8*/      ldrb r0, [r5, #3]
/*0x53ea*/      ldr r3, [pc, #0x108] /* data_54f4 */
/*0x53ec*/      adds r2, r0, #1
/*0x53ee*/      uxtb r2, r2
/*0x53f0*/      cmp r1, #0x21
/*0x53f2*/      beq jump_547e
/*0x53f4*/      bgt jump_5410
/*0x53f6*/      cmp r1, #0x1e
/*0x53f8*/      beq jump_5440
/*0x53fa*/      bgt jump_5406
/*0x53fc*/      cmp r1, #6
/*0x53fe*/      beq jump_5420
/*0x5400*/      cmp r1, #0x19
/*0x5402*/      bne jump_545e
/*0x5404*/      b jump_5420
            jump_5406:
/*0x5406*/      cmp r1, #0x1f
/*0x5408*/      beq jump_5440
/*0x540a*/      cmp r1, #0x20
/*0x540c*/      bne jump_545e
/*0x540e*/      b jump_5440
            jump_5410:
/*0x5410*/      cmp r1, #0x22
/*0x5412*/      beq jump_5474
/*0x5414*/      cmp r1, #0x29
/*0x5416*/      beq jump_5440
/*0x5418*/      cmp r1, #0x36
/*0x541a*/      beq jump_5420
/*0x541c*/      cmp r1, #0x37
/*0x541e*/      bne jump_545e
            jump_5420:
/*0x5420*/      ldr r2, [pc, #0xd4] /* data_54f8 */
/*0x5422*/      ldrb r0, [r2, r0]
/*0x5424*/      cmp r0, #0xff
/*0x5426*/      beq jump_54e4
/*0x5428*/      ldr r0, [pc, #0xc8] /* data_54f4 */
/*0x542a*/      movs r2, #6
/*0x542c*/      cmp r1, #6
/*0x542e*/      ldr r0, [r0]
/*0x5430*/      beq jump_54aa
/*0x5432*/      cmp r1, #0x19
/*0x5434*/      beq jump_549a
/*0x5436*/      cmp r1, #0x36
/*0x5438*/      beq jump_54be
/*0x543a*/      cmp r1, #0x37
/*0x543c*/      bne jump_54e4
/*0x543e*/      b jump_54d6
            jump_5440:
/*0x5440*/      bl call_53b8
/*0x5444*/      cmp r0, #0
/*0x5446*/      beq jump_545e
/*0x5448*/      cmp r1, #0x1e
/*0x544a*/      beq jump_5460
/*0x544c*/      cmp r1, #0x1f
/*0x544e*/      beq jump_5460
/*0x5450*/      cmp r1, #0x20
/*0x5452*/      beq jump_5460
/*0x5454*/      cmp r1, #0x29
/*0x5456*/      bne jump_545e
/*0x5458*/      ldr r1, [pc, #0xa0] /* data_54fc */
/*0x545a*/      movs r0, #1
/*0x545c*/      strb r0, [r1, #2]
            jump_545e:
/*0x545e*/      pop {r4, r5, r6, pc}
            jump_5460:
/*0x5460*/      subs r1, #0x1e
/*0x5462*/      ldr r0, [r3]
/*0x5464*/      uxtb r1, r1
/*0x5466*/      adds r4, r0, r1
/*0x5468*/      movs r2, #1
/*0x546a*/      ldrb r0, [r4]
/*0x546c*/      bl call_51f8
/*0x5470*/      strb r0, [r4]
/*0x5472*/      b jump_54e4
            jump_5474:
/*0x5474*/      strb r2, [r5, #3]
/*0x5476*/      cmp r2, #3
/*0x5478*/      bls jump_548a
/*0x547a*/      movs r0, #0
/*0x547c*/      b jump_5488
            jump_547e:
/*0x547e*/      strb r2, [r5, #3]
/*0x5480*/      .short 0x1fd2 /* subs r2, r2, #7 */ 
/*0x5482*/      cmp r2, #7
/*0x5484*/      blo jump_548a
/*0x5486*/      movs r0, #7
            jump_5488:
/*0x5488*/      strb r0, [r5, #3]
            jump_548a:
/*0x548a*/      bl call_5324
/*0x548e*/      bl call_559c
/*0x5492*/      mov r0, r4
/*0x5494*/      bl call_5500
/*0x5498*/      b jump_54e4
            jump_549a:
/*0x549a*/      ldrb r1, [r0, #3]
/*0x549c*/      cmp r1, #8
/*0x549e*/      bhs jump_54e4
/*0x54a0*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x54a2*/      b jump_54b2
            jump_54a4:
/*0x54a4*/      bl call_6ca4
/*0x54a8*/      b jump_54e4
            jump_54aa:
/*0x54aa*/      ldrb r1, [r0, #3]
/*0x54ac*/      cmp r1, #1
/*0x54ae*/      bls jump_54e4
/*0x54b0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
            jump_54b2:
/*0x54b2*/      strb r1, [r0, #3]
/*0x54b4*/      ldrb r0, [r5, #3]
/*0x54b6*/      cmp.w r2, r0, lsr #1
/*0x54ba*/      beq jump_54a4
/*0x54bc*/      b jump_54e4
            jump_54be:
/*0x54be*/      ldrb r1, [r0, #4]
/*0x54c0*/      and r2, r1, #0xf
/*0x54c4*/      cmp r2, #5
/*0x54c6*/      bhs jump_54e4
/*0x54c8*/      mov.w r2, #0x10000000
/*0x54cc*/      add.w r1, r2, r1, ror #4
/*0x54d0*/      ror.w r1, r1, #0x1c
/*0x54d4*/      b jump_54e2
            jump_54d6:
/*0x54d6*/      ldrb r1, [r0, #4]
/*0x54d8*/      lsls r2, r1, #0x1c
/*0x54da*/      beq jump_54e4
/*0x54dc*/      subs r2, r1, #1
/*0x54de*/      bfi r1, r2, #0, #4
            jump_54e2:
/*0x54e2*/      strb r1, [r0, #4]
            jump_54e4:
/*0x54e4*/      bl call_55a8
/*0x54e8*/      pop.w {r4, r5, r6, lr}
/*0x54ec*/      b.w call_3bec

            data_54f0:
/*0x54f0*/  .word 0x20000730
            data_54f4:
/*0x54f4*/  .word 0x2000008c
            data_54f8:
/*0x54f8*/  .word 0x7aab
            data_54fc:
/*0x54fc*/  .word 0x20000648


            .thumb_func
            call_5500:
/*0x5500*/      push {r4, r5, r6, lr}
/*0x5502*/      lsrs r1, r0, #0x18
/*0x5504*/      lsls r1, r1, #0x1e
/*0x5506*/      bpl jump_5552
/*0x5508*/      ldr r1, [pc, #0x84] /* data_5590 */
/*0x550a*/      ldrb r1, [r1, #3]
/*0x550c*/      cmp r1, #7
/*0x550e*/      bls jump_5552
/*0x5510*/      ldr r5, [pc, #0x80] /* data_5594 */
/*0x5512*/      and r2, r1, #1
/*0x5516*/      bic r3, r1, #1
/*0x551a*/      ldr r1, [r5]
/*0x551c*/      ubfx r0, r0, #0x10, #8
/*0x5520*/      cmp r3, #8
/*0x5522*/      beq jump_5554
/*0x5524*/      cmp r3, #0xa
/*0x5526*/      beq jump_5568
/*0x5528*/      cmp r3, #0xc
/*0x552a*/      bne jump_5552
/*0x552c*/      ldr r3, [pc, #0x68] /* data_5598 */
/*0x552e*/      ldrb r4, [r3, r0]
/*0x5530*/      cmp r4, #0xff
/*0x5532*/      beq jump_5552
/*0x5534*/      and r0, r4, #7
/*0x5538*/      add.w r0, r0, r0, lsl #2
/*0x553c*/      add r5, r0
/*0x553e*/      adds r5, #0xe
/*0x5540*/      cbz r2, jump_5544
/*0x5542*/      movs r1, #0
            jump_5544:
/*0x5544*/      mov r0, r5
/*0x5546*/      bl call_6ea8
/*0x554a*/      lsrs r0, r4, #3
/*0x554c*/      strb r0, [r5, #3]
/*0x554e*/      movs r0, #1
/*0x5550*/      strb r0, [r5, #4]
            jump_5552:
/*0x5552*/      pop {r4, r5, r6, pc}
            jump_5554:
/*0x5554*/      cbz r2, jump_5558
/*0x5556*/      movs r1, #0
            jump_5558:
/*0x5558*/      add.w r0, r0, r0, lsl #1
/*0x555c*/      add r0, r5
/*0x555e*/      pop.w {r4, r5, r6, lr}
/*0x5562*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5564*/      b.w call_6ea8
            jump_5568:
/*0x5568*/      ldr r3, [pc, #0x2c] /* data_5598 */
/*0x556a*/      subs r3, #0x48
/*0x556c*/      ldrb r0, [r3, r0]
/*0x556e*/      cmp r0, #0xff
/*0x5570*/      beq jump_5552
/*0x5572*/      cbz r2, jump_5576
/*0x5574*/      movs r1, #0
            jump_5576:
/*0x5576*/      add.w r0, r0, r0, lsl #1
/*0x557a*/      add.w r4, r5, r0, lsl #1
/*0x557e*/      adds r0, r4, #4
/*0x5580*/      bl call_6ea8
/*0x5584*/      ldrh r0, [r4, #4]
/*0x5586*/      strh.w r0, [r4, #7]
/*0x558a*/      ldrb r0, [r4, #6]
/*0x558c*/      strb r0, [r4, #9]
/*0x558e*/      pop {r4, r5, r6, pc}

            data_5590:
/*0x5590*/  .word 0x20000730
            data_5594:
/*0x5594*/  .word 0x2000008c
            data_5598:
/*0x5598*/  .word 0x7b73


            .thumb_func
            call_559c:
/*0x559c*/      movs r1, #0xd8
/*0x559e*/      ldr r0, [pc, #4] /* data_55a4 */
/*0x55a0*/      b.w mem_zero

            data_55a4:
/*0x55a4*/  .word 0x2000032e


            .thumb_func
            call_55a8:
/*0x55a8*/      push {r4, lr}
/*0x55aa*/      bl call_4644
/*0x55ae*/      cmp r0, #6
/*0x55b0*/      bhs switch_55d8
/*0x55b2*/      tbb [pc, r0]

/*0x55b6*/  .byte 0x3
/*0x55b7*/  .byte 0x6
/*0x55b8*/  .byte 0x9
/*0x55b9*/  .byte 0xc
/*0x55ba*/  .byte 0x11
/*0x55bb*/  .byte 0xf

            switch_55bc:
/*0x55bc*/      bl call_3d74
/*0x55c0*/      b switch_55d8
            switch_55c2:
/*0x55c2*/      bl call_3c04
/*0x55c6*/      b switch_55d8
            switch_55c8:
/*0x55c8*/      bl function_130_6
/*0x55cc*/      b switch_55d8
            switch_55ce:
/*0x55ce*/      bl call_3d10
/*0x55d2*/      b switch_55d8
            switch_55d4:
/*0x55d4*/      bl call_3b24
            switch_55d8:
/*0x55d8*/      pop.w {r4, lr}
/*0x55dc*/      nop.w 
            jump_55e0:
/*0x55e0*/      push {r4, lr}
/*0x55e2*/      ldr r4, [pc, #0x1c] /* data_5600 */
/*0x55e4*/      ldrb r0, [r4, #0xb]
/*0x55e6*/      cbnz r0, jump_55f8
/*0x55e8*/      ldr r0, [pc, #0x18] /* data_5604 */
/*0x55ea*/      ldrb r0, [r0]
/*0x55ec*/      lsls r0, r0, #0x1e
/*0x55ee*/      asrs r0, r0, #8
/*0x55f0*/      lsrs r1, r0, #0x18
/*0x55f2*/      movs r0, #0x29
/*0x55f4*/      bl call_40d0
            jump_55f8:
/*0x55f8*/      movs r0, #1
/*0x55fa*/      strb r0, [r4, #1]
/*0x55fc*/      pop {r4, pc}

/*0x55fe*/  .byte 0x0
/*0x55ff*/  .byte 0x0

            data_5600:
/*0x5600*/  .word 0x20000648
            data_5604:
/*0x5604*/  .word 0x2000000c


            .thumb_func
            function_130_10:
/*0x5608*/      push {r4, lr}
/*0x560a*/      ldr r4, [pc, #0x68] /* data_5674 */
/*0x560c*/      cbz r0, jump_5640
/*0x560e*/      movs r1, #0
/*0x5610*/      mov r0, r4
/*0x5612*/      bl call_377e
/*0x5616*/      movs r1, #0
/*0x5618*/      mov r0, r4
/*0x561a*/      bl call_376a
/*0x561e*/      mov r0, r4
/*0x5620*/      bl bftm_clear
/*0x5624*/      movs r0, #0x29
/*0x5626*/      bl nvic_disable_intr
/*0x562a*/      bl pinmux_c0_gpio
/*0x562e*/      bl jump_pinmux_b789_gpio
/*0x5632*/      movs r0, #1
/*0x5634*/      bl call_6118
/*0x5638*/      pop.w {r4, lr}
/*0x563c*/      b.w jump_62f8
            jump_5640:
/*0x5640*/      bl jump_pinmux_b789_spi
/*0x5644*/      movs r0, #0
/*0x5646*/      bl call_6118
/*0x564a*/      movs r1, #0
/*0x564c*/      mov r0, r4
/*0x564e*/      bl call_3796
/*0x5652*/      mov r0, r4
/*0x5654*/      bl bftm_clear
/*0x5658*/      movs r1, #1
/*0x565a*/      mov r0, r4
/*0x565c*/      bl call_376a
/*0x5660*/      movs r1, #1
/*0x5662*/      mov r0, r4
/*0x5664*/      bl call_377e
/*0x5668*/      ldr r1, [pc, #0xc] /* data_5678 */
/*0x566a*/      mov.w r0, #0x200
/*0x566e*/      str.w r0, [r1, #0x100]
/*0x5672*/      pop {r4, pc}

            data_5674:
/*0x5674*/  .word 0x40076000
            data_5678:
/*0x5678*/  .word 0xe000e004


            .thumb_func
            call_567c:
/*0x567c*/      push {r4, lr}
/*0x567e*/      movs r4, #0
/*0x5680*/      cmp r0, #2
/*0x5682*/      beq jump_568c
/*0x5684*/      ldr r1, [pc, #0x24] /* data_56ac */
/*0x5686*/      str r4, [r1, #0x40]
/*0x5688*/      str r4, [r1, #0x44]
/*0x568a*/      str r4, [r1, #0x48]
            jump_568c:
/*0x568c*/      cbz r0, jump_56a6
/*0x568e*/      movs r0, #2
            jump_5690:
/*0x5690*/      bl call_4b1c
/*0x5694*/      ldr r0, [pc, #0x14] /* data_56ac */
/*0x5696*/      adds r0, #0x40
/*0x5698*/      strb r4, [r0, #4]
/*0x569a*/      bl call_5324
/*0x569e*/      pop.w {r4, lr}
/*0x56a2*/      b.w call_5ac0
            jump_56a6:
/*0x56a6*/      movs r0, #1
/*0x56a8*/      b jump_5690

/*0x56aa*/  .byte 0x0
/*0x56ab*/  .byte 0x0

            data_56ac:
/*0x56ac*/  .word 0x20000608


            .thumb_func
            call_56b0:
/*0x56b0*/      push {r4, lr}
/*0x56b2*/      movs r0, #0
/*0x56b4*/      mov.w r2, #0x10000
/*0x56b8*/      movs r3, #1
/*0x56ba*/      mov r1, r0
/*0x56bc*/      bl ckcu_clocks_enable
/*0x56c0*/      pop.w {r4, lr}
/*0x56c4*/      movw r1, #0x8c9f
/*0x56c8*/      ldr r0, [pc, #4] /* data_56d0 */
/*0x56ca*/      b.w call_3792

/*0x56ce*/  .byte 0x0
/*0x56cf*/  .byte 0x0

            data_56d0:
/*0x56d0*/  .word 0x40076000


            .thumb_func
            setup_intr_priority:
/*0x56d4*/      push {r4, lr}
/*0x56d6*/      mov.w r1, #0x3400
/*0x56da*/      movs r0, #0
/*0x56dc*/      bl call_57c4
/*0x56e0*/      ldr r1, [pc, #0x70] /* data_5754 */
/*0x56e2*/      ldr r0, [r1]
/*0x56e4*/      movw r2, #0xf8ff
/*0x56e8*/      ands r0, r2
/*0x56ea*/      ldr r2, [pc, #0x6c] /* data_5758 */
/*0x56ec*/      orr r0, r0, #0x300
/*0x56f0*/      orrs r0, r2
/*0x56f2*/      str r0, [r1]
/*0x56f4*/      movs r2, #0
/*0x56f6*/      mov r1, r2
/*0x56f8*/      movs r0, #3
/*0x56fa*/      bl calc_nvic_priority
/*0x56fe*/      mov r1, r0
/*0x5700*/      movs r0, #0x2b
/*0x5702*/      bl call_57a4
/*0x5706*/      movs r2, #0
/*0x5708*/      mov r1, r2
/*0x570a*/      movs r0, #3
/*0x570c*/      bl calc_nvic_priority
/*0x5710*/      mov r1, r0
/*0x5712*/      movs r0, #0x2c
/*0x5714*/      bl call_57a4
/*0x5718*/      movs r2, #0
/*0x571a*/      movs r1, #1
/*0x571c*/      movs r0, #3
/*0x571e*/      bl calc_nvic_priority
/*0x5722*/      mov r1, r0
/*0x5724*/      movs r0, #0x2a
/*0x5726*/      bl call_57a4
/*0x572a*/      movs r2, #0
/*0x572c*/      movs r1, #2
/*0x572e*/      movs r0, #3
/*0x5730*/      bl calc_nvic_priority
/*0x5734*/      mov r1, r0
/*0x5736*/      movs r0, #0x29
/*0x5738*/      bl call_57a4
/*0x573c*/      movs r2, #0
/*0x573e*/      movs r1, #2
/*0x5740*/      movs r0, #3
/*0x5742*/      bl calc_nvic_priority
/*0x5746*/      mov r1, r0
/*0x5748*/      pop.w {r4, lr}
/*0x574c*/      movs r0, #0x35
/*0x574e*/      b.w call_57a4

/*0x5752*/  .byte 0x0
/*0x5753*/  .byte 0x0

            data_5754:
/*0x5754*/  .word 0xe000ed0c
            data_5758:
/*0x5758*/  .word 0x5fa0000


            .thumb_func
            nvic_disable_intr:
/*0x575c*/      and r2, r0, #0x1f
/*0x5760*/      movs r1, #1
/*0x5762*/      lsls r1, r2
/*0x5764*/      lsrs r0, r0, #5
/*0x5766*/      lsls r0, r0, #2
/*0x5768*/      add.w r0, r0, #-0x1fff2000
/*0x576c*/      str.w r1, [r0, #0x180]
/*0x5770*/      bx lr

            .thumb_func
            calc_nvic_priority:
/*0x5772*/      push {r4, r5, lr}
/*0x5774*/      and r3, r0, #7
/*0x5778*/      rsb.w r4, r3, #7
/*0x577c*/      cmp r4, #4
/*0x577e*/      bls jump_5782
/*0x5780*/      movs r4, #4
            jump_5782:
/*0x5782*/      adds r0, r3, #4
/*0x5784*/      cmp r0, #7
/*0x5786*/      bhs jump_578c
/*0x5788*/      movs r3, #0
/*0x578a*/      b jump_578e
            jump_578c:
/*0x578c*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_578e:
/*0x578e*/      movs r5, #1
/*0x5790*/      lsl.w r0, r5, r4
/*0x5794*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5796*/      ands r0, r1
/*0x5798*/      lsls r0, r3
/*0x579a*/      lsls r5, r3
/*0x579c*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x579e*/      ands r5, r2
/*0x57a0*/      orrs r0, r5
/*0x57a2*/      pop {r4, r5, pc}

            .thumb_func
            call_57a4:
/*0x57a4*/      lsls r1, r1, #0x1c
/*0x57a6*/      lsrs r1, r1, #0x18
/*0x57a8*/      cmp r0, #0
/*0x57aa*/      bge jump_57ba
/*0x57ac*/      and r0, r0, #0xf
/*0x57b0*/      add.w r0, r0, #-0x1fff2000
/*0x57b4*/      strb.w r1, [r0, #0xd14]
/*0x57b8*/      bx lr
            jump_57ba:
/*0x57ba*/      add.w r0, r0, #-0x1fff2000
/*0x57be*/      strb.w r1, [r0, #0x400]
/*0x57c2*/      bx lr

            .thumb_func
            call_57c4:
/*0x57c4*/      ldr r2, [pc, #8] /* data_57d0 */
/*0x57c6*/      ands r1, r2
/*0x57c8*/      orrs r1, r0
/*0x57ca*/      ldr r0, [pc, #8] /* data_57d4 */
/*0x57cc*/      str r1, [r0]
/*0x57ce*/      bx lr

            data_57d0:
/*0x57d0*/  .word 0x1fffff80
            data_57d4:
/*0x57d4*/  .word 0xe000ed08


            .thumb_func
            call_57d8:
/*0x57d8*/      push {r4, lr}
/*0x57da*/      bl function_82
/*0x57de*/      bl function_29
/*0x57e2*/      cmp r0, #1
/*0x57e4*/      bne jump_57f0
/*0x57e6*/      movs r0, #2
/*0x57e8*/      bl call_6566
/*0x57ec*/      cmp r0, #1
/*0x57ee*/      beq jump_57f2
            jump_57f0:
/*0x57f0*/      movs r0, #0
            jump_57f2:
/*0x57f2*/      pop {r4, pc}

            .thumb_func
            jump_pinmux_b789_gpio:
/*0x57f4*/      b.w pinmux_b789_gpio

            .thumb_func
            jump_pinmux_b789_spi:
/*0x57f8*/      b.w pinmux_b789_spi

            .thumb_func
            call_57fc:
/*0x57fc*/      push {r4, r5, r6, lr}
/*0x57fe*/      ldr r4, [pc, #0xa4] /* data_58a4 */
/*0x5800*/      movs r5, #0
/*0x5802*/      ldrb r0, [r4, #6]
/*0x5804*/      cmp r0, #1
/*0x5806*/      beq jump_583a
/*0x5808*/      cmp r0, #2
/*0x580a*/      bne jump_58a2
/*0x580c*/      subs r1, r4, #4
/*0x580e*/      ldrh r0, [r1]
/*0x5810*/      cbz r0, jump_588a
/*0x5812*/      ldr r2, [pc, #0x94] /* data_58a8 */
/*0x5814*/      ldr r2, [r2]
/*0x5816*/      cmp r2, #0
/*0x5818*/      bne jump_58a2
/*0x581a*/      cmp r0, #0xff
/*0x581c*/      bhi jump_5830
/*0x581e*/      ldr r2, [pc, #0x8c] /* data_58ac */
/*0x5820*/      ldr r2, [r2]
/*0x5822*/      add.w r0, r2, r0, lsl #2
/*0x5826*/      movs r2, #7
/*0x5828*/      ldrb r0, [r0, #1]
/*0x582a*/      cmp.w r2, r0, lsr #5
/*0x582e*/      bne jump_5892
            jump_5830:
/*0x5830*/      ldrb r0, [r4, #8]
/*0x5832*/      cmp r0, #1
/*0x5834*/      beq jump_589a
/*0x5836*/      strh r5, [r1]
/*0x5838*/      b jump_5892
            jump_583a:
/*0x583a*/      ldr r0, [pc, #0x74] /* data_58b0 */
/*0x583c*/      ldrb r0, [r0, #3]
/*0x583e*/      lsls r0, r0, #0x1e
/*0x5840*/      bmi jump_5858
/*0x5842*/      ldrb r0, [r4, #7]
/*0x5844*/      cmp r0, #1
/*0x5846*/      bne jump_5858
/*0x5848*/      bl call_4ab0
/*0x584c*/      cmp r0, #1
/*0x584e*/      bne jump_5858
/*0x5850*/      movs r0, #2
/*0x5852*/      strb r0, [r4, #7]
/*0x5854*/      ldr r0, [pc, #0x5c] /* data_58b4 */
/*0x5856*/      strh r5, [r0]
            jump_5858:
/*0x5858*/      ldrb r0, [r4, #7]
/*0x585a*/      cmp r0, #3
/*0x585c*/      beq jump_587a
/*0x585e*/      cmp r0, #6
/*0x5860*/      beq jump_586a
/*0x5862*/      cmp r0, #7
/*0x5864*/      beq jump_586a
/*0x5866*/      cmp r0, #8
/*0x5868*/      bne jump_58a2
            jump_586a:
/*0x586a*/      bl call_4ab0
/*0x586e*/      cmp r0, #1
/*0x5870*/      bne jump_58a2
/*0x5872*/      pop.w {r4, r5, r6, lr}
/*0x5876*/      b.w jump_59e0
            jump_587a:
/*0x587a*/      bl call_4ab0
/*0x587e*/      cmp r0, #1
/*0x5880*/      bne jump_58a2
/*0x5882*/      pop.w {r4, r5, r6, lr}
/*0x5886*/      b.w jump_711c
            jump_588a:
/*0x588a*/      ldrb r0, [r1, #2]
/*0x588c*/      movs r1, #0
/*0x588e*/      bl call_3d90
            jump_5892:
/*0x5892*/      pop.w {r4, r5, r6, lr}
/*0x5896*/      b.w jump_6ff0
            jump_589a:
/*0x589a*/      pop.w {r4, r5, r6, lr}
/*0x589e*/      b.w call_5ac0
            jump_58a2:
/*0x58a2*/      pop {r4, r5, r6, pc}

            data_58a4:
/*0x58a4*/  .word 0x200019d0
            data_58a8:
/*0x58a8*/  .word 0x20000060
            data_58ac:
/*0x58ac*/  .word 0x20000058
            data_58b0:
/*0x58b0*/  .word 0x20000030
            data_58b4:
/*0x58b4*/  .word 0x2000001c


            .thumb_func
            call_58b8:
/*0x58b8*/      ldr r0, [pc, #0x28] /* data_58e4 */
/*0x58ba*/      push {r4, lr}
/*0x58bc*/      ldrb r0, [r0, #6]
/*0x58be*/      cmp r0, #1
/*0x58c0*/      beq jump_58de
/*0x58c2*/      ldr r0, [pc, #0x24] /* data_58e8 */
/*0x58c4*/      ldr r0, [r0]
/*0x58c6*/      bl call_4a1e
/*0x58ca*/      movs r1, #3
/*0x58cc*/      bl call_5210
/*0x58d0*/      cmp r0, #0xff
/*0x58d2*/      beq jump_58de
/*0x58d4*/      ldr r1, [pc, #0x10] /* data_58e8 */
/*0x58d6*/      bl call_4a14
/*0x58da*/      movs r0, #1
/*0x58dc*/      pop {r4, pc}
            jump_58de:
/*0x58de*/      movs r0, #0
/*0x58e0*/      pop {r4, pc}

/*0x58e2*/  .byte 0x0
/*0x58e3*/  .byte 0x0

            data_58e4:
/*0x58e4*/  .word 0x200019d0
            data_58e8:
/*0x58e8*/  .word 0x20000030


            .thumb_func
            call_58ec:
/*0x58ec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x58f0*/      ldr r4, [pc, #0xdc] /* data_59d0 */
/*0x58f2*/      ldr r5, [pc, #0xe0] /* data_59d4 */
/*0x58f4*/      subs r6, r4, #4
/*0x58f6*/      ldrb r0, [r4, #6]
/*0x58f8*/      cbz r0, jump_5904
/*0x58fa*/      cmp r0, #1
/*0x58fc*/      beq jump_5976
/*0x58fe*/      cmp r0, #2
/*0x5900*/      bne jump_599a
/*0x5902*/      b jump_5944
            jump_5904:
/*0x5904*/      bl call_6f0c
/*0x5908*/      mov r7, r0
/*0x590a*/      cmp r0, #0x60
/*0x590c*/      bhs jump_599a
/*0x590e*/      ldrb r0, [r5, #3]
/*0x5910*/      lsls r0, r0, #0x1e
/*0x5912*/      bpl jump_59c6
/*0x5914*/      ldrb r0, [r4, #6]
/*0x5916*/      cbz r0, jump_591e
/*0x5918*/      movs r0, #0
/*0x591a*/      bl call_4678
            jump_591e:
/*0x591e*/      ldr r0, [r5]
/*0x5920*/      bl call_4a1e
/*0x5924*/      strh r0, [r4, #4]
/*0x5926*/      movs r0, #2
/*0x5928*/      strb r0, [r4, #6]
/*0x592a*/      ldr r0, [pc, #0xac] /* data_59d8 */
/*0x592c*/      add.w r0, r0, r7, lsl #1
/*0x5930*/      ldrb.w r0, [r0, #0x29]
/*0x5934*/      lsrs r0, r0, #5
/*0x5936*/      strb r0, [r4, #8]
/*0x5938*/      movs r0, #0
/*0x593a*/      strh r0, [r6]
/*0x593c*/      strb r7, [r6, #2]
/*0x593e*/      bl call_6f58
/*0x5942*/      b jump_59c6
            jump_5944:
/*0x5944*/      ldrb r0, [r5, #3]
/*0x5946*/      lsls r1, r0, #0x1e
/*0x5948*/      ldr r0, [pc, #0x88] /* data_59d4 */
/*0x594a*/      ldr r0, [r0]
/*0x594c*/      bpl jump_5964
/*0x594e*/      bl call_4a1e
/*0x5952*/      ldrh r1, [r4, #4]
/*0x5954*/      cmp r0, r1
/*0x5956*/      bne jump_5904
/*0x5958*/      ldrb r0, [r4, #8]
/*0x595a*/      cmp r0, #3
/*0x595c*/      bne jump_5904
            jump_595e:
/*0x595e*/      bl call_5ac0
/*0x5962*/      b jump_59c6
            jump_5964:
/*0x5964*/      bl call_4a1e
/*0x5968*/      ldrh r1, [r4, #4]
/*0x596a*/      cmp r0, r1
/*0x596c*/      bne jump_599a
/*0x596e*/      ldrb r0, [r4, #8]
/*0x5970*/      cmp r0, #2
/*0x5972*/      beq jump_595e
/*0x5974*/      b jump_59c6
            jump_5976:
/*0x5976*/      bl call_4ecc
/*0x597a*/      cbnz r0, jump_59c2
/*0x597c*/      ldrb r0, [r4, #7]
/*0x597e*/      cmp r0, #5
/*0x5980*/      beq jump_59a0
/*0x5982*/      ldrb r1, [r5, #3]
/*0x5984*/      lsls r1, r1, #0x1e
/*0x5986*/      bpl jump_599a
/*0x5988*/      cmp r0, #1
/*0x598a*/      beq jump_59c6
/*0x598c*/      movs r7, #1
/*0x598e*/      cmp r0, #2
/*0x5990*/      beq jump_59a8
/*0x5992*/      cmp r0, #3
/*0x5994*/      beq jump_59c4
/*0x5996*/      cmp r0, #4
/*0x5998*/      beq jump_59ca
            jump_599a:
/*0x599a*/      movs r0, #0
            jump_599c:
/*0x599c*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_59a0:
/*0x59a0*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x59a4*/      b.w jump_70a8
            jump_59a8:
/*0x59a8*/      bl call_6f6c
/*0x59ac*/      ldrb r0, [r6, #2]
/*0x59ae*/      cmp r0, #0x60
/*0x59b0*/      beq jump_59c4
/*0x59b2*/      ldr r0, [r5]
/*0x59b4*/      bl call_4a1e
/*0x59b8*/      strh r0, [r4, #4]
/*0x59ba*/      movs r0, #3
/*0x59bc*/      strb r0, [r4, #7]
/*0x59be*/      ldr r0, [pc, #0x1c] /* data_59dc */
/*0x59c0*/      strb r7, [r0]
            jump_59c2:
/*0x59c2*/      b jump_59c6
            jump_59c4:
/*0x59c4*/      strb r7, [r4, #7]
            jump_59c6:
/*0x59c6*/      movs r0, #1
/*0x59c8*/      b jump_599c
            jump_59ca:
/*0x59ca*/      movs r0, #5
/*0x59cc*/      strb r0, [r4, #7]
/*0x59ce*/      b jump_59a0

            data_59d0:
/*0x59d0*/  .word 0x200019d0
            data_59d4:
/*0x59d4*/  .word 0x20000030
            data_59d8:
/*0x59d8*/  .word 0x20000730
            data_59dc:
/*0x59dc*/  .word 0x20000648

            jump_59e0:
/*0x59e0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x59e4*/      ldr r5, [pc, #0xb0] /* data_5a98 */
/*0x59e6*/      mov.w r8, #1
/*0x59ea*/      ldrb r0, [r5, #7]
/*0x59ec*/      cmp r0, #8
/*0x59ee*/      beq jump_5a84
/*0x59f0*/      subs r6, r5, #4
/*0x59f2*/      ldr r1, [pc, #0xa8] /* data_5a9c */
/*0x59f4*/      ldrb r0, [r6, #2]
/*0x59f6*/      ldr r7, [pc, #0xa8] /* data_5aa0 */
/*0x59f8*/      add.w r4, r1, r0, lsl #1
/*0x59fc*/      mov r0, r5
/*0x59fe*/      ldrh r1, [r6]
/*0x5a00*/      ldrh r0, [r0, #4]
/*0x5a02*/      adds r4, #0x28
/*0x5a04*/      cmp r1, #2
/*0x5a06*/      bne jump_5a26
/*0x5a08*/      ldr r2, [r7]
/*0x5a0a*/      ldrh r1, [r2]
/*0x5a0c*/      ldrh r2, [r2, #4]
/*0x5a0e*/      ubfx r1, r1, #0, #0xa
/*0x5a12*/      ubfx r2, r2, #0, #0xa
/*0x5a16*/      cmp r1, r2
/*0x5a18*/      bne jump_5a26
/*0x5a1a*/      bl call_5210
/*0x5a1e*/      movw r0, #0xffff
/*0x5a22*/      strh r0, [r4]
/*0x5a24*/      b jump_5a6a
            jump_5a26:
/*0x5a26*/      movs r1, #0xff
/*0x5a28*/      bl call_5210
/*0x5a2c*/      ldrb r0, [r5, #8]
/*0x5a2e*/      cmp r0, #1
/*0x5a30*/      beq jump_5a7c
/*0x5a32*/      bl call_6ee8
            jump_5a36:
/*0x5a36*/      ldrh r1, [r6]
/*0x5a38*/      ldr r2, [r7]
/*0x5a3a*/      add.w r1, r2, r1, lsl #2
/*0x5a3e*/      mov.w r2, #0x1c00
/*0x5a42*/      strh r0, [r1, #-0x2]
/*0x5a46*/      ldrb r1, [r5, #8]
/*0x5a48*/      ldrh r0, [r5, #4]
/*0x5a4a*/      orr.w r1, r2, r1, lsl #13
/*0x5a4e*/      orrs r0, r1
/*0x5a50*/      strh r0, [r4]
/*0x5a52*/      ldrh r0, [r6]
/*0x5a54*/      cmp r0, #0xff
/*0x5a56*/      bhi jump_5a62
/*0x5a58*/      ldr r2, [r7]
/*0x5a5a*/      mov.w r1, #0xfc00
/*0x5a5e*/      strh.w r1, [r2, r0, lsl #2]
            jump_5a62:
/*0x5a62*/      ldrb r0, [r6, #2]
/*0x5a64*/      movs r1, #1
/*0x5a66*/      bl call_3d90
            jump_5a6a:
/*0x5a6a*/      bl call_3bec
/*0x5a6e*/      ldrb r0, [r5, #7]
/*0x5a70*/      cmp r0, #7
/*0x5a72*/      beq jump_5a80
/*0x5a74*/      strb.w r8, [r5, #7]
            jump_5a78:
/*0x5a78*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5a7c:
/*0x5a7c*/      movs r0, #0
/*0x5a7e*/      b jump_5a36
            jump_5a80:
/*0x5a80*/      movs r0, #8
/*0x5a82*/      strb r0, [r5, #7]
            jump_5a84:
/*0x5a84*/      ldr r1, [pc, #0x1c] /* data_5aa4 */
/*0x5a86*/      movs r0, #0
/*0x5a88*/      strb r0, [r5, #6]
/*0x5a8a*/      str r0, [r1]
/*0x5a8c*/      ldr r1, [pc, #0x18] /* data_5aa8 */
/*0x5a8e*/      strb r0, [r5, #7]
/*0x5a90*/      strb.w r8, [r1]
/*0x5a94*/      b jump_5a78

/*0x5a96*/  .byte 0x0
/*0x5a97*/  .byte 0x0

            data_5a98:
/*0x5a98*/  .word 0x200019d0
            data_5a9c:
/*0x5a9c*/  .word 0x20000730
            data_5aa0:
/*0x5aa0*/  .word 0x20000058
            data_5aa4:
/*0x5aa4*/  .word 0x20000060
            data_5aa8:
/*0x5aa8*/  .word 0x20000648


            .thumb_func
            call_5aac:
/*0x5aac*/      ldr r0, [pc, #0xc] /* data_5abc */
/*0x5aae*/      ldrb r1, [r0, #6]
/*0x5ab0*/      cmp r1, #0
/*0x5ab2*/      bne jump_5aba
/*0x5ab4*/      movs r1, #1
/*0x5ab6*/      strb r1, [r0, #6]
/*0x5ab8*/      strb r1, [r0, #7]
            jump_5aba:
/*0x5aba*/      bx lr

            data_5abc:
/*0x5abc*/  .word 0x200019d0


            .thumb_func
            call_5ac0:
/*0x5ac0*/      push {r3, r4, r5, r6, r7, lr}
/*0x5ac2*/      ldr r6, [pc, #0x78] /* data_5b3c */
/*0x5ac4*/      movs r7, #0
/*0x5ac6*/      ldrb r0, [r6, #6]
/*0x5ac8*/      cmp r0, #2
/*0x5aca*/      bne jump_5b38
/*0x5acc*/      subs r5, r6, #4
/*0x5ace*/      ldrh r0, [r5]
/*0x5ad0*/      cbz r0, jump_5b38
/*0x5ad2*/      ldr r1, [pc, #0x6c] /* data_5b40 */
/*0x5ad4*/      str r7, [sp]
/*0x5ad6*/      ldr r1, [r1]
/*0x5ad8*/      add.w r4, r1, r0, lsl #2
/*0x5adc*/      ldrb.w r0, [sp, #3]
/*0x5ae0*/      orr r0, r0, #5
/*0x5ae4*/      strb.w r0, [sp, #3]
/*0x5ae8*/      b jump_5b2e
            jump_5aea:
/*0x5aea*/      ldrb r0, [r4, #1]
/*0x5aec*/      lsrs r0, r0, #5
/*0x5aee*/      cmp r0, #2
/*0x5af0*/      beq jump_5af8
/*0x5af2*/      cmp r0, #7
/*0x5af4*/      bne jump_5b26
/*0x5af6*/      b jump_5b22
            jump_5af8:
/*0x5af8*/      ldrh r0, [r4]
/*0x5afa*/      mov r1, sp
/*0x5afc*/      bl call_4a14
/*0x5b00*/      ldrb.w r0, [sp, #1]
/*0x5b04*/      lsls r0, r0, #0x1f
/*0x5b06*/      ldrb.w r0, [sp]
/*0x5b0a*/      beq jump_5b12
/*0x5b0c*/      bl call_46d4
/*0x5b10*/      b jump_5b16
            jump_5b12:
/*0x5b12*/      ldr r1, [pc, #0x30] /* data_5b44 */
/*0x5b14*/      ldrb r0, [r1, r0]
            jump_5b16:
/*0x5b16*/      strb.w r0, [sp, #2]
/*0x5b1a*/      ldr r0, [sp]
/*0x5b1c*/      bl call_4780
/*0x5b20*/      b jump_5b26
            jump_5b22:
/*0x5b22*/      movs r0, #0xff
/*0x5b24*/      strh r0, [r5]
            jump_5b26:
/*0x5b26*/      ldrh r0, [r5]
/*0x5b28*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5b2a*/      strh r0, [r5]
/*0x5b2c*/      .short 0x1d24 /* adds r4, r4, #4 */ 
            jump_5b2e:
/*0x5b2e*/      ldrh r0, [r5]
/*0x5b30*/      cmp r0, #0xff
/*0x5b32*/      bls jump_5aea
/*0x5b34*/      bl call_6f58
            jump_5b38:
/*0x5b38*/      strb r7, [r6, #6]
/*0x5b3a*/      pop {r3, r4, r5, r6, r7, pc}

            data_5b3c:
/*0x5b3c*/  .word 0x200019d0
            data_5b40:
/*0x5b40*/  .word 0x20000058
            data_5b44:
/*0x5b44*/  .word 0x200001c0


            .thumb_func
            call_5b48:
/*0x5b48*/      ldr r0, [pc, #0x3c] /* data_5b88 */
/*0x5b4a*/      push {r4, lr}
/*0x5b4c*/      ldr r0, [r0]
/*0x5b4e*/      bl call_4a1e
/*0x5b52*/      mov r4, r0
/*0x5b54*/      movs r1, #3
/*0x5b56*/      bl call_5210
/*0x5b5a*/      cmp r0, #0xff
/*0x5b5c*/      beq jump_5b68
/*0x5b5e*/      movs r1, #0xff
/*0x5b60*/      mov r0, r4
/*0x5b62*/      bl call_5210
/*0x5b66*/      b jump_5b7c
            jump_5b68:
/*0x5b68*/      bl call_6f0c
/*0x5b6c*/      cmp r0, #0x60
/*0x5b6e*/      bhs jump_5b84
/*0x5b70*/      ldr r2, [pc, #0x18] /* data_5b8c */
/*0x5b72*/      movw r1, #0xffff
/*0x5b76*/      add.w r0, r2, r0, lsl #1
/*0x5b7a*/      strh r1, [r0, #0x28]
            jump_5b7c:
/*0x5b7c*/      bl call_3bec
/*0x5b80*/      movs r0, #1
/*0x5b82*/      pop {r4, pc}
            jump_5b84:
/*0x5b84*/      movs r0, #0
/*0x5b86*/      pop {r4, pc}

            data_5b88:
/*0x5b88*/  .word 0x20000030
            data_5b8c:
/*0x5b8c*/  .word 0x20000730


            .thumb_func
            call_5b90:
/*0x5b90*/      push {r3, r4, r5, lr}
/*0x5b92*/      ldr r4, [pc, #0x30] /* data_5bc4 */
/*0x5b94*/      movs r5, #0x48
/*0x5b96*/      b jump_5bba
            jump_5b98:
/*0x5b98*/      mov r1, sp
/*0x5b9a*/      mov r0, r5
/*0x5b9c*/      bl call_5bc8
/*0x5ba0*/      ldrb.w r0, [sp, #2]
/*0x5ba4*/      strb r0, [r4]
/*0x5ba6*/      sub.w r0, r4, #0x48
/*0x5baa*/      ldrb.w r1, [sp, #1]
/*0x5bae*/      strb r1, [r0]
/*0x5bb0*/      subs r0, #0x48
/*0x5bb2*/      ldrb.w r1, [sp]
/*0x5bb6*/      strb r1, [r0]
/*0x5bb8*/      .short 0x1e64 /* subs r4, r4, #1 */ 
            jump_5bba:
/*0x5bba*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5bbc*/      uxtb r5, r5
/*0x5bbe*/      bhs jump_5b98
/*0x5bc0*/      pop {r3, r4, r5, pc}

/*0x5bc2*/  .byte 0x0
/*0x5bc3*/  .byte 0x0

            data_5bc4:
/*0x5bc4*/  .word 0x20000405


            .thumb_func
            call_5bc8:
/*0x5bc8*/      ldr r2, [pc, #0x30] /* data_5bfc */
/*0x5bca*/      movs r3, #0xd
/*0x5bcc*/      ldrb r0, [r2, r0]
/*0x5bce*/      and r2, r0, #7
/*0x5bd2*/      lsrs r0, r0, #3
/*0x5bd4*/      rsb r0, r0, r0, lsl #8
/*0x5bd8*/      udiv r0, r0, r3
/*0x5bdc*/      uxtb r0, r0
/*0x5bde*/      strb r0, [r1]
/*0x5be0*/      cmp r2, #4
/*0x5be2*/      beq jump_5bf6
/*0x5be4*/      rsb.w r2, r2, #5
/*0x5be8*/      movs r3, #0x2b
/*0x5bea*/      muls r2, r3, r2
/*0x5bec*/      uxtb r3, r2
/*0x5bee*/      mov r2, r1
/*0x5bf0*/      mov r1, r3
/*0x5bf2*/      b.w call_3fe8
            jump_5bf6:
/*0x5bf6*/      strb r0, [r1, #1]
/*0x5bf8*/      strb r0, [r1, #2]
/*0x5bfa*/      bx lr

            data_5bfc:
/*0x5bfc*/  .word 0x7b73


            .thumb_func
            call_5c00:
/*0x5c00*/      ldr r1, [pc, #4] /* data_5c08 */
/*0x5c02*/      strb r0, [r1]
/*0x5c04*/      b.w jump_55e0

            data_5c08:
/*0x5c08*/  .word 0x2000000c


            .thumb_func
            call_5c0c:
/*0x5c0c*/      push {r4, lr}
/*0x5c0e*/      mov.w r2, #0x200
/*0x5c12*/      movs r1, #0
/*0x5c14*/      lsls r0, r2, #9
/*0x5c16*/      movs r3, #1
/*0x5c18*/      bl ckcu_clocks_enable
/*0x5c1c*/      movs r2, #1
/*0x5c1e*/      pop.w {r4, lr}
/*0x5c22*/      mov r1, r2
/*0x5c24*/      ldr r0, [pc, #4] /* data_5c2c */
/*0x5c26*/      b.w gpio_set_open_drain

/*0x5c2a*/  .byte 0x0
/*0x5c2b*/  .byte 0x0

            data_5c2c:
/*0x5c2c*/  .word 0x400b4000


            .thumb_func
            pinmux_c0_gpio:
/*0x5c30*/      movs r2, #0
/*0x5c32*/      mov r1, r2
/*0x5c34*/      movs r0, #2
/*0x5c36*/      b.w afio_pin_config

            .thumb_func
            pinmux_c0_gptm:
/*0x5c3a*/      movs r2, #4
/*0x5c3c*/      movs r1, #0
/*0x5c3e*/      movs r0, #2
/*0x5c40*/      b.w afio_pin_config

            .thumb_func
            call_5c44:
/*0x5c44*/      push {r4, r5, r6, lr}
/*0x5c46*/      ldr r1, [pc, #0x34] /* data_5c7c */
/*0x5c48*/      ldr r4, [r1]
/*0x5c4a*/      ldr r5, [pc, #0x30] /* data_5c7c */
/*0x5c4c*/      adds r5, #0x48
/*0x5c4e*/      ldr r3, [r5]
/*0x5c50*/      movs r2, #1
/*0x5c52*/      str r2, [r1]
/*0x5c54*/      movs r2, #0
/*0x5c56*/      str r2, [r5]
/*0x5c58*/      ldr r6, [pc, #0x24] /* data_5c80 */
/*0x5c5a*/      str.w r2, [r6, #0x9c]
/*0x5c5e*/      str.w r2, [r6, #0x8c]
/*0x5c62*/      str r4, [r1]
/*0x5c64*/      ldr r1, [pc, #0x1c] /* data_5c84 */
/*0x5c66*/      ldr r2, [r1]
/*0x5c68*/      orr r2, r2, #4
/*0x5c6c*/      str r2, [r1]
/*0x5c6e*/      cbz r0, jump_5c76
/*0x5c70*/      wfi 
            jump_5c72:
/*0x5c72*/      str r3, [r5]
/*0x5c74*/      pop {r4, r5, r6, pc}
            jump_5c76:
/*0x5c76*/      wfe 
/*0x5c78*/      b jump_5c72

/*0x5c7a*/  .byte 0x0
/*0x5c7b*/  .byte 0x0

            data_5c7c:
/*0x5c7c*/  .word 0x43100618
            data_5c80:
/*0x5c80*/  .word 0x42d42000
            data_5c84:
/*0x5c84*/  .word 0xe000ed10


            .thumb_func
            function_130_11:
/*0x5c88*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5c8c*/      ldr r4, [pc, #0x38] /* data_5cc8 */
/*0x5c8e*/      ldr r7, [r4]
/*0x5c90*/      ldr r5, [pc, #0x34] /* data_5cc8 */
/*0x5c92*/      adds r5, #0x48
/*0x5c94*/      ldr r6, [r5]
/*0x5c96*/      mov.w sb, #1
/*0x5c9a*/      str.w sb, [r4]
/*0x5c9e*/      mov.w r8, #0
/*0x5ca2*/      str.w r8, [r5]
/*0x5ca6*/      bl call_5eb8
/*0x5caa*/      ldr r0, [pc, #0x20] /* data_5ccc */
/*0x5cac*/      str.w r8, [r0, #0x9c]
/*0x5cb0*/      str.w sb, [r0, #0x8c]
/*0x5cb4*/      str r7, [r4]
/*0x5cb6*/      ldr r0, [pc, #0x18] /* data_5cd0 */
/*0x5cb8*/      ldr r1, [r0]
/*0x5cba*/      orr r1, r1, #4
/*0x5cbe*/      str r1, [r0]
/*0x5cc0*/      wfe 
/*0x5cc2*/      str r6, [r5]
/*0x5cc4*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5cc8:
/*0x5cc8*/  .word 0x43100618
            data_5ccc:
/*0x5ccc*/  .word 0x42d42000
            data_5cd0:
/*0x5cd0*/  .word 0xe000ed10


            .thumb_func
            function_130_12:
/*0x5cd4*/      ldr r1, [pc, #0x10] /* data_5ce8 */
/*0x5cd6*/      ldr r2, [r1]
/*0x5cd8*/      bic r2, r2, #4
/*0x5cdc*/      str r2, [r1]
/*0x5cde*/      cbz r0, jump_5ce4
/*0x5ce0*/      wfi 
/*0x5ce2*/      bx lr
            jump_5ce4:
/*0x5ce4*/      wfe 
/*0x5ce6*/      bx lr

            data_5ce8:
/*0x5ce8*/  .word 0xe000ed10


            .thumb_func
            handle_frame:
/*0x5cec*/      push {r4, r5, r6, lr}
/*0x5cee*/      ldr r6, [pc, #0xd4] /* data_5dc4 */
/*0x5cf0*/      ldrb r0, [r6]
/*0x5cf2*/      cmp r0, #1
/*0x5cf4*/      bne jump_5db0
/*0x5cf6*/      ldr r5, [pc, #0xd0] /* data_5dc8 */
/*0x5cf8*/      movs r4, #0
/*0x5cfa*/      mov r0, r5
/*0x5cfc*/      ldrb r2, [r5]
/*0x5cfe*/      ldrb r0, [r0, #1]
/*0x5d00*/      mov r1, r4
/*0x5d02*/      cmp r2, #0x10
/*0x5d04*/      beq jump_5d10
/*0x5d06*/      cmp r2, #0x11
/*0x5d08*/      beq jump_5d1a
/*0x5d0a*/      cmp r2, #0x12
/*0x5d0c*/      bne jump_5db2
/*0x5d0e*/      b jump_5d20
            jump_5d10:
/*0x5d10*/      cmp r0, #2
/*0x5d12*/      bne jump_5db2
/*0x5d14*/      str r1, [r5, #4]
/*0x5d16*/      movs r1, #4
/*0x5d18*/      b jump_5d94
            jump_5d1a:
/*0x5d1a*/      bl reset_builtin
/*0x5d1e*/      b jump_5d9c
            jump_5d20:
/*0x5d20*/      mov.w r3, #0x400
/*0x5d24*/      cmp r0, #0x20
/*0x5d26*/      blo jump_5d46
/*0x5d28*/      cmp r0, #0xff
/*0x5d2a*/      bne jump_5d36
/*0x5d2c*/      ldr r0, [r5, #4]
/*0x5d2e*/      movs r1, #0x3c
/*0x5d30*/      b jump_5d96

/*0x5d32*/  .byte 0xc0
/*0x5d33*/  .byte 0x46
/*0x5d34*/  .byte 0xc0
/*0x5d35*/  .byte 0x46

            jump_5d36:
/*0x5d36*/      rsb r0, r0, r0, lsl #4
/*0x5d3a*/      mov.w r1, #0x2880
/*0x5d3e*/      add.w r0, r1, r0, lsl #2
/*0x5d42*/      movs r1, #0x3c
/*0x5d44*/      b jump_5d96
            jump_5d46:
/*0x5d46*/      cbz r0, jump_5d52
/*0x5d48*/      cmp r0, #1
/*0x5d4a*/      beq jump_5d88
/*0x5d4c*/      cmp r0, #2
/*0x5d4e*/      bne jump_5db2
/*0x5d50*/      b jump_5d90
            jump_5d52:
/*0x5d52*/      ldrb.w r0, [r1, #0x10f]
/*0x5d56*/      cmp r0, #0xaa
/*0x5d58*/      beq jump_5d7e
/*0x5d5a*/      ldrb r2, [r3]
/*0x5d5c*/      mov r0, r3
/*0x5d5e*/      cmp r2, #4
/*0x5d60*/      beq jump_5d84
/*0x5d62*/      movs r2, #0x20
/*0x5d64*/      mov r1, r3
/*0x5d66*/      adds r0, r5, #4
/*0x5d68*/      bl memcpy
/*0x5d6c*/      ldr r0, [pc, #0x5c] /* data_5dcc */
/*0x5d6e*/      ldr.w r1, [r0, #0x180]
/*0x5d72*/      str r1, [r5, #0x24]
/*0x5d74*/      ldr.w r0, [r0, #0x18c]
/*0x5d78*/      movs r1, #0x28
/*0x5d7a*/      str r0, [r5, #0x28]
/*0x5d7c*/      b jump_5d94
            jump_5d7e:
/*0x5d7e*/      movs r1, #0x10
/*0x5d80*/      lsls r0, r1, #4
/*0x5d82*/      b jump_5d96
            jump_5d84:
/*0x5d84*/      movs r1, #0x34
/*0x5d86*/      b jump_5d96
            jump_5d88:
/*0x5d88*/      movs r1, #4
/*0x5d8a*/      mov.w r0, #0x3c00
/*0x5d8e*/      b jump_5d96
            jump_5d90:
/*0x5d90*/      movs r1, #1
/*0x5d92*/      strb r1, [r5, #4]
            jump_5d94:
/*0x5d94*/      adds r0, r5, #4
            jump_5d96:
/*0x5d96*/      bl flash_read_packet
/*0x5d9a*/      movs r4, #1
            jump_5d9c:
/*0x5d9c*/      ldrb r0, [r6]
/*0x5d9e*/      cmp r0, #1
/*0x5da0*/      bne jump_5db0
/*0x5da2*/      cbz r4, jump_5db2
/*0x5da4*/      movs r1, #0x3c
/*0x5da6*/      adds r0, r5, #4
            jump_5da8:
/*0x5da8*/      bl mem_zero
/*0x5dac*/      movs r0, #2
/*0x5dae*/      strb r0, [r6]
            jump_5db0:
/*0x5db0*/      pop {r4, r5, r6, pc}
            jump_5db2:
/*0x5db2*/      ldr r0, [r5]
/*0x5db4*/      str r0, [r5, #4]
/*0x5db6*/      movw r0, #0xaaff
/*0x5dba*/      str r0, [r5]
/*0x5dbc*/      ldr r0, [pc, #8] /* data_5dc8 */
/*0x5dbe*/      movs r1, #0x38
/*0x5dc0*/      adds r0, #8
/*0x5dc2*/      b jump_5da8

            data_5dc4:
/*0x5dc4*/  .word 0x20000028
            data_5dc8:
/*0x5dc8*/  .word 0x20000608
            data_5dcc:
/*0x5dcc*/  .word 0x40080000


            .thumb_func
            reset_builtin:
/*0x5dd0*/      push {r4, lr}
/*0x5dd2*/      ldr r1, [pc, #0x6c] /* data_5e40 */
/*0x5dd4*/      cbz r0, jump_5df2
/*0x5dd6*/      cmp r0, #1
/*0x5dd8*/      beq jump_5df6
/*0x5dda*/      cmp r0, #2
/*0x5ddc*/      bne jump_5e3e
/*0x5dde*/      movs r0, #0x35
/*0x5de0*/      bl nvic_disable_intr
/*0x5de4*/      movs r0, #0
/*0x5de6*/      bl usb_dp_pull_up
/*0x5dea*/      pop.w {r4, lr}
/*0x5dee*/      b.w function_130_11
            jump_5df2:
/*0x5df2*/      ldr r0, [pc, #0x50] /* data_5e44 */
/*0x5df4*/      b jump_5dfa
            jump_5df6:
/*0x5df6*/      ldr r0, [pc, #0x4c] /* data_5e44 */
/*0x5df8*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_5dfa:
/*0x5dfa*/      str r0, [r1]
/*0x5dfc*/      movs r1, #0
/*0x5dfe*/      mov.w r0, #0x10000
/*0x5e02*/      movs r3, #1
/*0x5e04*/      mov r2, r1
/*0x5e06*/      bl ckcu_clocks_enable
/*0x5e0a*/      ldr r1, [pc, #0x3c] /* data_5e48 */
/*0x5e0c*/      mov.w r0, #0x200
/*0x5e10*/      str r0, [r1, #0x24]
/*0x5e12*/      movs r0, #0x35
/*0x5e14*/      bl nvic_disable_intr
/*0x5e18*/      movs r0, #0
/*0x5e1a*/      bl usb_dp_pull_up
/*0x5e1e*/      movw r0, #0x4e20
/*0x5e22*/      bl spin_wait_maybe
/*0x5e26*/      dsb sy
/*0x5e2a*/      ldr r0, [pc, #0x20] /* data_5e4c */
/*0x5e2c*/      ldr r1, [r0]
/*0x5e2e*/      ldr r2, [pc, #0x20] /* data_5e50 */
/*0x5e30*/      and r1, r1, #0x700
/*0x5e34*/      orrs r1, r2
/*0x5e36*/      str r1, [r0]
/*0x5e38*/      dsb sy
            jump_5e3c:
/*0x5e3c*/      b jump_5e3c
            jump_5e3e:
/*0x5e3e*/      pop {r4, pc}

            data_5e40:
/*0x5e40*/  .word 0x20003ffc
            data_5e44:
/*0x5e44*/  .word 0x55aafaf5
            data_5e48:
/*0x5e48*/  .word 0x400b0000
            data_5e4c:
/*0x5e4c*/  .word 0xe000ed0c
            data_5e50:
/*0x5e50*/  .word 0x5fa0004


            .thumb_func
            flash_read_packet:
/*0x5e54*/      push {r4, r5, r6, lr}
/*0x5e56*/      mov r4, r1
/*0x5e58*/      ldr r2, [pc, #0x24] /* data_5e80 */
/*0x5e5a*/      mov r1, r0
/*0x5e5c*/      movs r0, #2
/*0x5e5e*/      strb r0, [r2]
/*0x5e60*/      ldr r0, [pc, #0x20] /* data_5e84 */
/*0x5e62*/      subs r5, r0, #4
/*0x5e64*/      cmp r1, r0
/*0x5e66*/      beq jump_5e70
/*0x5e68*/      mov r2, r4
/*0x5e6a*/      adds r0, r5, #4
/*0x5e6c*/      bl memcpy
            jump_5e70:
/*0x5e70*/      adds r0, r5, r4
/*0x5e72*/      rsb.w r1, r4, #0x3c
/*0x5e76*/      pop.w {r4, r5, r6, lr}
/*0x5e7a*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5e7c*/      b.w mem_zero

            data_5e80:
/*0x5e80*/  .word 0x20000028
            data_5e84:
/*0x5e84*/  .word 0x2000060c


            .thumb_func
            ckcu_voodoo1:
/*0x5e88*/      push {r4, r5, r6, r7, lr}
/*0x5e8a*/      ldr r7, [pc, #0x28] /* data_5eb4 */
/*0x5e8c*/      ldr.w r4, [r7, #0x104]
/*0x5e90*/      ldr.w r5, [r7, #0x108]
/*0x5e94*/      ldr.w r6, [r7, #0x10c]
/*0x5e98*/      bics r4, r0
/*0x5e9a*/      bics r5, r1
/*0x5e9c*/      bics r6, r2
/*0x5e9e*/      cbz r3, jump_5ea6
/*0x5ea0*/      orrs r4, r0
/*0x5ea2*/      orrs r5, r1
/*0x5ea4*/      orrs r6, r2
            jump_5ea6:
/*0x5ea6*/      str.w r4, [r7, #0x104]
/*0x5eaa*/      str.w r5, [r7, #0x108]
/*0x5eae*/      str.w r6, [r7, #0x10c]
/*0x5eb2*/      pop {r4, r5, r6, r7, pc}

            data_5eb4:
/*0x5eb4*/  .word 0x40088000


            .thumb_func
            call_5eb8:
/*0x5eb8*/      ldr r2, [pc, #0x1c] /* data_5ed8 */
/*0x5eba*/      movs r1, #0
/*0x5ebc*/      mov.w r0, #0x1c20
/*0x5ec0*/      str.w r1, [r2, #0x108]
            jump_5ec4:
/*0x5ec4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5ec6*/      bhs jump_5ec4
/*0x5ec8*/      movs r0, #1
/*0x5eca*/      str.w r0, [r2, #0x108]
/*0x5ece*/      ldr r0, [pc, #0xc] /* data_5edc */
            jump_5ed0:
/*0x5ed0*/      ldr r1, [r0, #8]
/*0x5ed2*/      lsls r1, r1, #0x1a
/*0x5ed4*/      bpl jump_5ed0
/*0x5ed6*/      bx lr

            data_5ed8:
/*0x5ed8*/  .word 0x42d40000
            data_5edc:
/*0x5edc*/  .word 0x40088000


            .thumb_func
            call_5ee0:
/*0x5ee0*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x5ee4*/      movs r7, #0xa
/*0x5ee6*/      ldr r5, [pc, #0x68] /* data_5f50 */
/*0x5ee8*/      b jump_5f46
            jump_5eea:
/*0x5eea*/      ldr r1, [pc, #0x68] /* data_5f54 */
/*0x5eec*/      add.w r0, r7, r7, lsl #1
/*0x5ef0*/      add r0, r1
/*0x5ef2*/      ldrb r1, [r5, #-0x1]!
/*0x5ef6*/      ldrb r0, [r0, #2]
/*0x5ef8*/      eors r0, r1
/*0x5efa*/      movs.w r8, r0
/*0x5efe*/      beq jump_5f46
/*0x5f00*/      movs r4, #0x80
/*0x5f02*/      movs r6, #8
/*0x5f04*/      b jump_5f40
            jump_5f06:
/*0x5f06*/      tst.w r8, r4
/*0x5f0a*/      beq jump_5f3e
/*0x5f0c*/      ldrb r0, [r5]
/*0x5f0e*/      eors r0, r4
/*0x5f10*/      strb r0, [r5]
/*0x5f12*/      tst r0, r4
/*0x5f14*/      bne jump_5f1a
/*0x5f16*/      movs r0, #1
/*0x5f18*/      b jump_5f1c
            jump_5f1a:
/*0x5f1a*/      movs r0, #0
            jump_5f1c:
/*0x5f1c*/      mov sb, r0
/*0x5f1e*/      add.w r0, r6, r7, lsl #3
/*0x5f22*/      uxtb r0, r0
/*0x5f24*/      mov r1, sb
/*0x5f26*/      bl call_4878
/*0x5f2a*/      cbnz r0, jump_5f32
/*0x5f2c*/      ldrb r0, [r5]
/*0x5f2e*/      eors r0, r4
/*0x5f30*/      strb r0, [r5]
            jump_5f32:
/*0x5f32*/      movs.w r0, sb
/*0x5f36*/      beq jump_5f3a
/*0x5f38*/      movs r0, #1
            jump_5f3a:
/*0x5f3a*/      ldr r1, [pc, #0x1c] /* data_5f58 */
/*0x5f3c*/      strh r0, [r1, #2]
            jump_5f3e:
/*0x5f3e*/      lsrs r4, r4, #1
            jump_5f40:
/*0x5f40*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x5f42*/      uxtb r6, r6
/*0x5f44*/      bhs jump_5f06
            jump_5f46:
/*0x5f46*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x5f48*/      uxtb r7, r7
/*0x5f4a*/      bhs jump_5eea
/*0x5f4c*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_5f50:
/*0x5f50*/  .word 0x200001b6
            data_5f54:
/*0x5f54*/  .word 0x20000310
            data_5f58:
/*0x5f58*/  .word 0x2000001a


            .thumb_func
            call_5f5c:
/*0x5f5c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5f60*/      mov r6, r0
/*0x5f62*/      movs r4, #2
/*0x5f64*/      ldr r5, [pc, #0x58] /* data_5fc0 */
/*0x5f66*/      mov.w r7, #0x1f4
            jump_5f6a:
/*0x5f6a*/      bl call_713c
/*0x5f6e*/      movs r0, #0xa
/*0x5f70*/      b jump_5f7a
            jump_5f72:
/*0x5f72*/      add.w r1, r0, r0, lsl #1
/*0x5f76*/      ldrb r1, [r5, r1]
/*0x5f78*/      cbnz r1, jump_5f80
            jump_5f7a:
/*0x5f7a*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5f7c*/      uxtb r0, r0
/*0x5f7e*/      bhs jump_5f72
            jump_5f80:
/*0x5f80*/      cmp r0, #0xff
/*0x5f82*/      beq jump_5f94
/*0x5f84*/      cmp r4, #0
/*0x5f86*/      bne jump_5f6a
            jump_5f88:
/*0x5f88*/      cmp r6, #0
/*0x5f8a*/      beq jump_5fbc
/*0x5f8c*/      ldr r2, [pc, #0x34] /* data_5fc4 */
/*0x5f8e*/      ldr r1, [pc, #0x30] /* data_5fc0 */
/*0x5f90*/      movs r0, #0xa
/*0x5f92*/      b jump_5fac
            jump_5f94:
/*0x5f94*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x5f96*/      ands r4, r4, #0xff
/*0x5f9a*/      beq jump_5f88
/*0x5f9c*/      mov r0, r7
/*0x5f9e*/      bl spin_wait_maybe
/*0x5fa2*/      b jump_5f6a
            jump_5fa4:
/*0x5fa4*/      ldrb r3, [r1, #2]
/*0x5fa6*/      strb r3, [r2], #1
/*0x5faa*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_5fac:
/*0x5fac*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x5fae*/      uxtb r0, r0
/*0x5fb0*/      bhs jump_5fa4
/*0x5fb2*/      ldr r0, [pc, #0x10] /* data_5fc4 */
/*0x5fb4*/      ldrb r1, [r0, #9]
/*0x5fb6*/      orr r1, r1, #0xf
/*0x5fba*/      strb r1, [r0, #9]
            jump_5fbc:
/*0x5fbc*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5fc0:
/*0x5fc0*/  .word 0x20000310
            data_5fc4:
/*0x5fc4*/  .word 0x200001ac


            .thumb_func
            call_5fc8:
/*0x5fc8*/      ldr r1, [pc, #0x10] /* data_5fdc */
/*0x5fca*/      ldrb r0, [r1]
/*0x5fcc*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5fce*/      strb r0, [r1]
/*0x5fd0*/      lsls r0, r0, #0x1e
/*0x5fd2*/      bne jump_5fd8
/*0x5fd4*/      b.w call_713c
            jump_5fd8:
/*0x5fd8*/      bx lr

/*0x5fda*/  .byte 0x0
/*0x5fdb*/  .byte 0x0

            data_5fdc:
/*0x5fdc*/  .word 0x2000001a


            .thumb_func
            call_5fe0:
/*0x5fe0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5fe4*/      movs r6, #0
/*0x5fe6*/      mov r1, r6
/*0x5fe8*/      mov.w r0, #0xf0000
/*0x5fec*/      movs r3, #1
/*0x5fee*/      mov r2, r6
/*0x5ff0*/      bl ckcu_clocks_enable
/*0x5ff4*/      movs r4, #8
/*0x5ff6*/      b jump_6028
            jump_5ff8:
/*0x5ff8*/      ldr r0, [pc, #0x94] /* data_6090 */
/*0x5ffa*/      movs r2, #0
/*0x5ffc*/      add.w r1, r0, r4, lsl #3
/*0x6000*/      ldrh r5, [r1, #4]
/*0x6002*/      ldr r0, [r1]
/*0x6004*/      uxth r1, r5
/*0x6006*/      mov r7, r0
/*0x6008*/      bl gpio_set_pin_pull_up_down
/*0x600c*/      uxth r1, r5
/*0x600e*/      mov r0, r7
/*0x6010*/      movs r2, #1
/*0x6012*/      bl gpio_set_input_enable
/*0x6016*/      ldr r0, [pc, #0x78] /* data_6090 */
/*0x6018*/      adds r0, #0x40
/*0x601a*/      ldrb.w r1, [r0, r4, lsl #1]
/*0x601e*/      add.w r0, r0, r4, lsl #1
/*0x6022*/      ldrb r0, [r0, #1]
/*0x6024*/      bl afio_exti_ssr_write
            jump_6028:
/*0x6028*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x602a*/      uxtb r4, r4
/*0x602c*/      bhs jump_5ff8
/*0x602e*/      movs r4, #0xa
/*0x6030*/      b jump_605a
            jump_6032:
/*0x6032*/      ldr r0, [pc, #0x5c] /* data_6090 */
/*0x6034*/      adds r0, #0x50
/*0x6036*/      add.w r1, r0, r4, lsl #3
/*0x603a*/      ldrh r5, [r1, #4]
/*0x603c*/      ldr r7, [r1]
/*0x603e*/      uxth r1, r5
/*0x6040*/      mov r0, r7
/*0x6042*/      bl gpio_set_pin
/*0x6046*/      uxth r1, r5
/*0x6048*/      mov r0, r7
/*0x604a*/      movs r2, #0
/*0x604c*/      bl gpio_set_open_drain
/*0x6050*/      uxth r1, r5
/*0x6052*/      mov r0, r7
/*0x6054*/      movs r2, #1
/*0x6056*/      bl gpio_set_input_output
            jump_605a:
/*0x605a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x605c*/      uxtb r4, r4
/*0x605e*/      bhs jump_6032
/*0x6060*/      movs r2, #0xff
/*0x6062*/      movs r1, #0xa
/*0x6064*/      ldr r0, [pc, #0x2c] /* data_6094 */
/*0x6066*/      bl mem_set
/*0x606a*/      movs r0, #0
/*0x606c*/      bl call_60cc
/*0x6070*/      movs r1, #0xa
/*0x6072*/      ldr r0, [pc, #0x24] /* data_6098 */
/*0x6074*/      movs r2, #0xff
/*0x6076*/      b jump_6084
            jump_6078:
/*0x6078*/      strb r6, [r0], #1
/*0x607c*/      strb r2, [r0], #1
/*0x6080*/      strb r2, [r0], #1
            jump_6084:
/*0x6084*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6086*/      uxtb r1, r1
/*0x6088*/      bhs jump_6078
/*0x608a*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x608e*/  .byte 0x0
/*0x608f*/  .byte 0x0

            data_6090:
/*0x6090*/  .word 0x7c18
            data_6094:
/*0x6094*/  .word 0x200001ac
            data_6098:
/*0x6098*/  .word 0x20000310


            .thumb_func
            call_609c:
/*0x609c*/      ldr r1, [pc, #0x28] /* data_60c8 */
/*0x609e*/      push {r4, lr}
/*0x60a0*/      add.w r0, r1, #0x164
/*0x60a4*/      movs r2, #0xa
/*0x60a6*/      b jump_60bc
            jump_60a8:
/*0x60a8*/      ldrb r3, [r0]
/*0x60aa*/      cbnz r3, jump_60b4
/*0x60ac*/      ldrb r3, [r0, #2]
/*0x60ae*/      ldrb r4, [r1]
/*0x60b0*/      cmp r3, r4
/*0x60b2*/      beq jump_60b8
            jump_60b4:
/*0x60b4*/      movs r0, #0
/*0x60b6*/      pop {r4, pc}
            jump_60b8:
/*0x60b8*/      .short 0x1cc0 /* adds r0, r0, #3 */ 
/*0x60ba*/      .short 0x1c49 /* adds r1, r1, #1 */ 
            jump_60bc:
/*0x60bc*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x60be*/      uxtb r2, r2
/*0x60c0*/      bhs jump_60a8
/*0x60c2*/      movs r0, #1
/*0x60c4*/      pop {r4, pc}

/*0x60c6*/  .byte 0x0
/*0x60c7*/  .byte 0x0

            data_60c8:
/*0x60c8*/  .word 0x200001ac


            .thumb_func
            call_60cc:
/*0x60cc*/      push {r4, lr}
/*0x60ce*/      mov r4, r0
/*0x60d0*/      movs r2, #0x50
/*0x60d2*/      ldr r1, [pc, #0x38] /* data_610c */
/*0x60d4*/      ldr r0, [pc, #0x38] /* data_6110 */
/*0x60d6*/      bl memcpy
/*0x60da*/      cbz r4, jump_60fa
/*0x60dc*/      bl call_6184
/*0x60e0*/      cmp r4, #1
/*0x60e2*/      beq jump_60ea
/*0x60e4*/      cmp r4, #2
/*0x60e6*/      bne jump_60fa
/*0x60e8*/      b jump_60f2
            jump_60ea:
/*0x60ea*/      ldr r1, [pc, #0x20] /* data_610c */
/*0x60ec*/      adds r1, #0xf0
/*0x60ee*/      movs r0, #0x22
/*0x60f0*/      b jump_60f6
            jump_60f2:
/*0x60f2*/      ldr r1, [pc, #0x20] /* data_6114 */
/*0x60f4*/      movs r0, #0x11
            jump_60f6:
/*0x60f6*/      bl call_61b0
            jump_60fa:
/*0x60fa*/      bl call_6184
/*0x60fe*/      bl call_529c
/*0x6102*/      pop.w {r4, lr}
/*0x6106*/      b.w call_6184

/*0x610a*/  .byte 0x0
/*0x610b*/  .byte 0x0

            data_610c:
/*0x610c*/  .word 0x7bc8
            data_6110:
/*0x6110*/  .word 0x200002c0
            data_6114:
/*0x6114*/  .word 0x7cfc


            .thumb_func
            call_6118:
/*0x6118*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x611c*/      movs r7, r0
/*0x611e*/      mov.w r4, #0xa
/*0x6122*/      beq jump_612c
/*0x6124*/      movs r0, #0
            jump_6126:
/*0x6126*/      mov r8, r0
/*0x6128*/      ldr r5, [pc, #0x50] /* data_617c */
/*0x612a*/      b jump_6150
            jump_612c:
/*0x612c*/      movs r0, #1
/*0x612e*/      b jump_6126
            jump_6130:
/*0x6130*/      add.w r6, r5, r4, lsl #3
/*0x6134*/      mov r2, r8
/*0x6136*/      ldrh r0, [r6, #4]
/*0x6138*/      uxth r1, r0
/*0x613a*/      ldr.w r0, [r5, r4, lsl #3]
/*0x613e*/      bl gpio_set_reset_pin
/*0x6142*/      ldrh r0, [r6, #4]
/*0x6144*/      movs r2, #1
/*0x6146*/      uxth r1, r0
/*0x6148*/      ldr.w r0, [r5, r4, lsl #3]
/*0x614c*/      bl gpio_set_input_output
            jump_6150:
/*0x6150*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6152*/      uxtb r4, r4
/*0x6154*/      bhs jump_6130
/*0x6156*/      cbz r7, jump_616a
/*0x6158*/      movs r2, #0
            jump_615a:
/*0x615a*/      ldr r4, [pc, #0x24] /* data_6180 */
/*0x615c*/      movs r1, #0x10
/*0x615e*/      mov r0, r4
/*0x6160*/      bl gpio_set_open_drain
/*0x6164*/      cbz r7, jump_616e
/*0x6166*/      movs r2, #1
/*0x6168*/      b jump_6170
            jump_616a:
/*0x616a*/      movs r2, #1
/*0x616c*/      b jump_615a
            jump_616e:
/*0x616e*/      movs r2, #0
            jump_6170:
/*0x6170*/      mov r0, r4
/*0x6172*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x6176*/      movs r1, #0x10
/*0x6178*/      b.w gpio_set_reset_pin

            data_617c:
/*0x617c*/  .word 0x7c68
            data_6180:
/*0x6180*/  .word 0x400b0000


            .thumb_func
            call_6184:
/*0x6184*/      push {r4, lr}
/*0x6186*/      ldr r4, [pc, #0x24] /* data_61ac */
/*0x6188*/      movs r2, #0xff
/*0x618a*/      adds r1, r2, #1
/*0x618c*/      subw r0, r4, #0x14f
/*0x6190*/      bl mem_set
/*0x6194*/      movs r0, #0x50
/*0x6196*/      subw r1, r4, #0x14f
/*0x619a*/      b jump_61a2
            jump_619c:
/*0x619c*/      ldrb r2, [r4], #-1
/*0x61a0*/      strb r0, [r1, r2]
            jump_61a2:
/*0x61a2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x61a4*/      uxtb r0, r0
/*0x61a6*/      bhs jump_619c
/*0x61a8*/      pop {r4, pc}

/*0x61aa*/  .byte 0x0
/*0x61ab*/  .byte 0x0

            data_61ac:
/*0x61ac*/  .word 0x2000030f


            .thumb_func
            call_61b0:
/*0x61b0*/      push {r4, r5, lr}
/*0x61b2*/      ldr r3, [pc, #0x18] /* data_61cc */
/*0x61b4*/      sub.w r4, r3, #0x100
/*0x61b8*/      b jump_61c4
            jump_61ba:
/*0x61ba*/      ldrb r2, [r1, #1]
/*0x61bc*/      ldrb r5, [r1], #2
/*0x61c0*/      ldrb r5, [r4, r5]
/*0x61c2*/      strb r2, [r3, r5]
            jump_61c4:
/*0x61c4*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x61c6*/      uxtb r0, r0
/*0x61c8*/      bhs jump_61ba
/*0x61ca*/      pop {r4, r5, pc}

            data_61cc:
/*0x61cc*/  .word 0x200002c0


            .thumb_func
            call_61d0:
/*0x61d0*/      push.w {r4, r5, r6, r7, r8, sb, lr}
/*0x61d4*/      ldr.w sb, [pc, #0x5c] /* data_6234 */
/*0x61d8*/      ldr.w ip, [pc, #0x5c] /* data_6238 */
/*0x61dc*/      movs r5, #0
/*0x61de*/      sub.w r8, sb, #0xd8
            jump_61e2:
/*0x61e2*/      ldr r7, [pc, #0x54] /* data_6238 */
/*0x61e4*/      movs r4, #0x10
/*0x61e6*/      movs r3, #0
/*0x61e8*/      add.w r0, sb, r5, lsl #6
/*0x61ec*/      adds r7, #0x44
            jump_61ee:
/*0x61ee*/      ldrb.w r1, [ip, r3]
/*0x61f2*/      add.w r1, r1, r1, lsl #3
/*0x61f6*/      add.w r1, r8, r1, lsl #3
/*0x61fa*/      adds r2, r1, r5
/*0x61fc*/      movs r1, #9
/*0x61fe*/      b jump_6214
            jump_6200:
/*0x6200*/      ldrb r6, [r2], #8
/*0x6204*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6206*/      ands r4, r4, #0xff
/*0x620a*/      ldrh.w r6, [r7, r6, lsl #1]
/*0x620e*/      strh r6, [r0]
/*0x6210*/      beq jump_622e
/*0x6212*/      .short 0x1d00 /* adds r0, r0, #4 */ 
            jump_6214:
/*0x6214*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6216*/      uxtb r1, r1
/*0x6218*/      bhs jump_6200
/*0x621a*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x621c*/      uxtb r3, r3
/*0x621e*/      cmp r3, #3
/*0x6220*/      blo jump_61ee
/*0x6222*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x6224*/      uxtb r5, r5
/*0x6226*/      cmp r5, #8
/*0x6228*/      blo jump_61e2
/*0x622a*/      pop.w {r4, r5, r6, r7, r8, sb, pc}
            jump_622e:
/*0x622e*/      movs r4, #0x10
/*0x6230*/      subs r0, #0x3a
/*0x6232*/      b jump_6214

            data_6234:
/*0x6234*/  .word 0x20000406
            data_6238:
/*0x6238*/  .word 0x7d20


            .thumb_func
            call_623c:
/*0x623c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6240*/      movs r1, #0
/*0x6242*/      mov.w r2, #0x20000
/*0x6246*/      mov.w r0, #0x70000
/*0x624a*/      movs r3, #1
/*0x624c*/      bl ckcu_clocks_enable
/*0x6250*/      movw r1, #0xea60
/*0x6254*/      ldr r0, [pc, #0x90] /* data_62e8 */
/*0x6256*/      bl call_3792
/*0x625a*/      ldr r4, [pc, #0x90] /* data_62ec */
/*0x625c*/      movs r1, #2
/*0x625e*/      mov r0, r4
/*0x6260*/      bl gpio_set_pin
/*0x6264*/      movs r2, #1
/*0x6266*/      movs r1, #2
/*0x6268*/      mov r0, r4
/*0x626a*/      bl gpio_set_open_drain
/*0x626e*/      movs r2, #1
/*0x6270*/      movs r1, #2
/*0x6272*/      mov r0, r4
/*0x6274*/      bl gpio_set_input_output
/*0x6278*/      movs r1, #4
/*0x627a*/      mov r0, r4
/*0x627c*/      bl gpio_set_pin
/*0x6280*/      ldr r6, [pc, #0x6c] /* data_62f0 */
/*0x6282*/      mov.w r5, #0x4000
/*0x6286*/      mov r1, r5
/*0x6288*/      mov r0, r6
/*0x628a*/      bl gpio_set_pin
/*0x628e*/      lsls r7, r5, #1
/*0x6290*/      mov r1, r7
/*0x6292*/      mov r0, r6
/*0x6294*/      bl gpio_set_pin
/*0x6298*/      movs r2, #1
/*0x629a*/      movs r1, #4
/*0x629c*/      mov r0, r4
/*0x629e*/      bl gpio_set_open_drain
/*0x62a2*/      movs r2, #1
/*0x62a4*/      mov r1, r5
/*0x62a6*/      mov r0, r6
/*0x62a8*/      bl gpio_set_open_drain
/*0x62ac*/      movs r2, #1
/*0x62ae*/      mov r1, r7
/*0x62b0*/      mov r0, r6
/*0x62b2*/      bl gpio_set_open_drain
/*0x62b6*/      movs r2, #1
/*0x62b8*/      movs r1, #4
/*0x62ba*/      mov r0, r4
/*0x62bc*/      bl gpio_set_input_output
/*0x62c0*/      movs r2, #1
/*0x62c2*/      mov r1, r5
/*0x62c4*/      mov r0, r6
/*0x62c6*/      bl gpio_set_input_output
/*0x62ca*/      movs r2, #1
/*0x62cc*/      mov r1, r7
/*0x62ce*/      mov r0, r6
/*0x62d0*/      bl gpio_set_input_output
/*0x62d4*/      movs r2, #1
/*0x62d6*/      mov r1, r2
/*0x62d8*/      ldr r0, [pc, #0x18] /* data_62f4 */
/*0x62da*/      bl gpio_set_input_enable
/*0x62de*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x62e2*/      b.w jump_71f4

/*0x62e6*/  .byte 0x0
/*0x62e7*/  .byte 0x0

            data_62e8:
/*0x62e8*/  .word 0x40077000
            data_62ec:
/*0x62ec*/  .word 0x400b4000
            data_62f0:
/*0x62f0*/  .word 0x400b0000
            data_62f4:
/*0x62f4*/  .word 0x400b2000

            jump_62f8:
/*0x62f8*/      push {r4, r5, r6, lr}
/*0x62fa*/      ldr r4, [pc, #0x60] /* data_635c */
/*0x62fc*/      movs r1, #0
/*0x62fe*/      mov r0, r4
/*0x6300*/      bl call_377e
/*0x6304*/      movs r1, #0
/*0x6306*/      mov r0, r4
/*0x6308*/      bl call_376a
/*0x630c*/      mov r0, r4
/*0x630e*/      bl bftm_clear
/*0x6312*/      ldr r1, [pc, #0x4c] /* data_6360 */
/*0x6314*/      asrs r0, r4, #0x14
/*0x6316*/      str.w r0, [r1, #0x180]
/*0x631a*/      movs r1, #0
/*0x631c*/      ldr r0, [pc, #0x44] /* data_6364 */
/*0x631e*/      bl gptm_enable_disable
/*0x6322*/      ldr r1, [pc, #0x44] /* data_6368 */
/*0x6324*/      movs r0, #2
/*0x6326*/      str r0, [r1, #0x24]
/*0x6328*/      ldr r4, [pc, #0x40] /* data_636c */
/*0x632a*/      movs r5, #8
/*0x632c*/      b jump_6354
            jump_632e:
/*0x632e*/      ldrh r0, [r4, #4]
/*0x6330*/      movs r2, #0
/*0x6332*/      uxth r1, r0
/*0x6334*/      ldr r0, [r4]
/*0x6336*/      bl gpio_set_input_output
/*0x633a*/      ldrh r0, [r4, #4]
/*0x633c*/      movs r2, #1
/*0x633e*/      uxth r1, r0
/*0x6340*/      ldr r0, [r4]
/*0x6342*/      bl gpio_set_input_enable
/*0x6346*/      ldrh r0, [r4, #4]
/*0x6348*/      movs r2, #2
/*0x634a*/      uxth r1, r0
/*0x634c*/      ldr r0, [r4]
/*0x634e*/      bl gpio_set_pin_pull_up_down
/*0x6352*/      adds r4, #8
            jump_6354:
/*0x6354*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6356*/      uxtb r5, r5
/*0x6358*/      bhs jump_632e
/*0x635a*/      pop {r4, r5, r6, pc}

            data_635c:
/*0x635c*/  .word 0x40077000
            data_6360:
/*0x6360*/  .word 0xe000e004
            data_6364:
/*0x6364*/  .word 0x4006f000
            data_6368:
/*0x6368*/  .word 0x400b4000
            data_636c:
/*0x636c*/  .word 0x7d24


            .thumb_func
            function_130_16:
/*0x6370*/      push {r4, r5, r6, lr}
/*0x6372*/      ldr r4, [pc, #0x8c] /* data_6400 */
/*0x6374*/      movs r5, #8
/*0x6376*/      b jump_639c
            jump_6378:
/*0x6378*/      ldrh r0, [r4, #4]
/*0x637a*/      uxth r1, r0
/*0x637c*/      ldr r0, [r4]
/*0x637e*/      bl gpio_set_pin
/*0x6382*/      ldrh r0, [r4, #4]
/*0x6384*/      movs r2, #1
/*0x6386*/      uxth r1, r0
/*0x6388*/      ldr r0, [r4]
/*0x638a*/      bl gpio_set_open_drain
/*0x638e*/      ldrh r0, [r4, #4]
/*0x6390*/      movs r2, #1
/*0x6392*/      uxth r1, r0
/*0x6394*/      ldr r0, [r4]
/*0x6396*/      bl gpio_set_input_output
/*0x639a*/      adds r4, #8
            jump_639c:
/*0x639c*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x639e*/      uxtb r5, r5
/*0x63a0*/      bhs jump_6378
/*0x63a2*/      ldr r1, [pc, #0x60] /* data_6404 */
/*0x63a4*/      movs r0, #2
/*0x63a6*/      str r0, [r1, #0x28]
/*0x63a8*/      lsls r1, r0, #8
/*0x63aa*/      ldr r0, [pc, #0x5c] /* data_6408 */
/*0x63ac*/      bl mem_zero
/*0x63b0*/      ldr r1, [pc, #0x58] /* data_640c */
/*0x63b2*/      movs r0, #0
/*0x63b4*/      strb r0, [r1, #1]
/*0x63b6*/      movs r0, #0x64
/*0x63b8*/      bl spin_wait_maybe
/*0x63bc*/      bl call_6468
/*0x63c0*/      movs r0, #2
/*0x63c2*/      bl call_7248
/*0x63c6*/      ldr r1, [pc, #0x48] /* data_6410 */
/*0x63c8*/      mov.w r0, #0x8000
/*0x63cc*/      str r0, [r1, #0x24]
/*0x63ce*/      movs r1, #1
/*0x63d0*/      ldr r0, [pc, #0x40] /* data_6414 */
/*0x63d2*/      bl gptm_enable_disable
/*0x63d6*/      ldr r4, [pc, #0x40] /* data_6418 */
/*0x63d8*/      movs r1, #0
/*0x63da*/      mov r0, r4
/*0x63dc*/      bl call_3796
/*0x63e0*/      mov r0, r4
/*0x63e2*/      bl bftm_clear
/*0x63e6*/      movs r1, #1
/*0x63e8*/      mov r0, r4
/*0x63ea*/      bl call_376a
/*0x63ee*/      movs r1, #1
/*0x63f0*/      mov r0, r4
/*0x63f2*/      bl call_377e
/*0x63f6*/      ldr r1, [pc, #0x24] /* data_641c */
/*0x63f8*/      asrs r0, r4, #0x14
/*0x63fa*/      str.w r0, [r1, #0x100]
/*0x63fe*/      pop {r4, r5, r6, pc}

            data_6400:
/*0x6400*/  .word 0x7d24
            data_6404:
/*0x6404*/  .word 0x400b4000
            data_6408:
/*0x6408*/  .word 0x20000406
            data_640c:
/*0x640c*/  .word 0x20000020
            data_6410:
/*0x6410*/  .word 0x400b0000
            data_6414:
/*0x6414*/  .word 0x4006f000
            data_6418:
/*0x6418*/  .word 0x40077000
            data_641c:
/*0x641c*/  .word 0xe000e004


            .thumb_func
            call_6420:
/*0x6420*/      push {r4, r5, lr}
/*0x6422*/      movs r0, #0x12
/*0x6424*/      bl call_7248
/*0x6428*/      movs r1, #0xa
/*0x642a*/      mov.w r0, #0x300
/*0x642e*/      bl call_7278
/*0x6432*/      movs r1, #2
/*0x6434*/      movs r0, #0
/*0x6436*/      bl call_7278
/*0x643a*/      ldr r4, [pc, #0x24] /* data_6460 */
/*0x643c*/      mov.w r0, #0x4000
/*0x6440*/      str r0, [r4, #0x28]
/*0x6442*/      lsls r5, r0, #1
/*0x6444*/      str r5, [r4, #0x24]
/*0x6446*/      movs r1, #8
/*0x6448*/      mov.w r0, #0xc00
/*0x644c*/      bl call_7278
/*0x6450*/      ldr r1, [pc, #0x10] /* data_6464 */
/*0x6452*/      movs r0, #4
/*0x6454*/      str r0, [r1, #0x24]
/*0x6456*/      str r5, [r4, #0x28]
/*0x6458*/      nop 
/*0x645a*/      nop 
/*0x645c*/      str r5, [r4, #0x24]
/*0x645e*/      pop {r4, r5, pc}

            data_6460:
/*0x6460*/  .word 0x400b0000
            data_6464:
/*0x6464*/  .word 0x400b4000


            .thumb_func
            call_6468:
/*0x6468*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x646c*/      ldr r1, [pc, #0x78] /* data_64e8 */
/*0x646e*/      ldr r0, [pc, #0x74] /* data_64e4 */
/*0x6470*/      movs r5, #0x10
/*0x6472*/      ldrb r2, [r1, #1]
/*0x6474*/      movs r7, #4
/*0x6476*/      add.w r4, r0, r2, lsl #6
/*0x647a*/      ldrb r0, [r1]
/*0x647c*/      ldr.w sl, [pc, #0x6c] /* data_64ec */
/*0x6480*/      ldr r6, [pc, #0x6c] /* data_64f0 */
/*0x6482*/      mov.w fp, #0x4000
/*0x6486*/      adds r4, #0x3e
/*0x6488*/      cbz r0, jump_6498
/*0x648a*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x648c*/      ands r0, r0, #0xff
/*0x6490*/      strb r0, [r1]
/*0x6492*/      bne jump_6498
/*0x6494*/      bl call_6420
            jump_6498:
/*0x6498*/      mov sb, r7
            jump_649a:
/*0x649a*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x649c*/      uxtb r5, r5
/*0x649e*/      blo jump_64da
/*0x64a0*/      mov.w r8, #0x8000
/*0x64a4*/      str.w r8, [r6, #0x28]
/*0x64a8*/      ldrh r0, [r4]
/*0x64aa*/      subs r7, r4, #2
/*0x64ac*/      movs r1, #0xa
/*0x64ae*/      bl call_7278
/*0x64b2*/      ldrh r0, [r7]
/*0x64b4*/      movs r1, #9
/*0x64b6*/      ubfx r7, r0, #6, #1
/*0x64ba*/      .short 0x1f24 /* subs r4, r4, #4 */ 
/*0x64bc*/      bl call_7278
/*0x64c0*/      mov r0, fp
/*0x64c2*/      str.w fp, [r6, #0x28]
/*0x64c6*/      str.w r8, [r6, #0x24]
/*0x64ca*/      mov r1, sb
/*0x64cc*/      mov r2, sl
/*0x64ce*/      cbz r7, jump_64d4
/*0x64d0*/      str r1, [r2, #0x24]
/*0x64d2*/      b jump_64d6
            jump_64d4:
/*0x64d4*/      str r1, [r2, #0x28]
            jump_64d6:
/*0x64d6*/      str r0, [r6, #0x24]
/*0x64d8*/      b jump_649a
            jump_64da:
/*0x64da*/      str.w sb, [sl, #0x24]
/*0x64de*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

/*0x64e2*/  .byte 0x0
/*0x64e3*/  .byte 0x0

            data_64e4:
/*0x64e4*/  .word 0x20000406
            data_64e8:
/*0x64e8*/  .word 0x20000020
            data_64ec:
/*0x64ec*/  .word 0x400b4000
            data_64f0:
/*0x64f0*/  .word 0x400b0000


            .thumb_func
            call_64f4:
/*0x64f4*/      cmp r1, #0
/*0x64f6*/      ldr r1, [r0]
/*0x64f8*/      beq jump_6500
/*0x64fa*/      orr r1, r1, #1
/*0x64fe*/      b jump_6504
            jump_6500:
/*0x6500*/      bic r1, r1, #1
            jump_6504:
/*0x6504*/      str r1, [r0]
/*0x6506*/      bx lr

            .thumb_func
            function_e_54:
/*0x6508*/      push {r4, r5, lr}
/*0x650a*/      ldrd r4, r3, [r1, #0x14]
/*0x650e*/      cbz r4, jump_654a
/*0x6510*/      mov.w r2, #0x200
/*0x6514*/      lsrs r2, r3
/*0x6516*/      orrs r2, r4
            jump_6518:
/*0x6518*/      ldr r4, [r1, #8]
/*0x651a*/      ldr r3, [r1]
/*0x651c*/      orrs r3, r4
/*0x651e*/      ldrd r4, r5, [r1, #0xc]
/*0x6522*/      orrs r4, r5
/*0x6524*/      orrs r3, r4
/*0x6526*/      ldr r4, [r1, #0x1c]
/*0x6528*/      orrs r3, r4
/*0x652a*/      orrs r3, r2
/*0x652c*/      str r3, [r0, #4]
/*0x652e*/      ldr r3, [r1, #0x24]
/*0x6530*/      ldr r2, [r1, #4]
/*0x6532*/      orrs r2, r3
/*0x6534*/      ldr r3, [r1, #0x20]
/*0x6536*/      orr.w r2, r2, r3, lsl #4
/*0x653a*/      str r2, [r0, #0x18]
/*0x653c*/      ldr r1, [r1, #0x28]
/*0x653e*/      mov.w r2, #-1
/*0x6542*/      add.w r1, r2, r1, lsr #1
/*0x6546*/      str r1, [r0, #0xc]
/*0x6548*/      pop {r4, r5, pc}
            jump_654a:
/*0x654a*/      mov.w r2, #0x100
/*0x654e*/      lsls r2, r3
/*0x6550*/      b jump_6518

            .thumb_func
            call_6552:
/*0x6552*/      cmp r1, #0
/*0x6554*/      ldr r1, [r0]
/*0x6556*/      beq jump_655e
/*0x6558*/      orr r1, r1, #8
/*0x655c*/      b jump_6562
            jump_655e:
/*0x655e*/      bic r1, r1, #8
            jump_6562:
/*0x6562*/      str r1, [r0]
/*0x6564*/      bx lr

            .thumb_func
            call_6566:
/*0x6566*/      push {r4, r5, r6, lr}
/*0x6568*/      mov r5, r0
/*0x656a*/      bl function_11
/*0x656e*/      bfi r4, r0, #0, #8
/*0x6572*/      cbz r5, jump_6598
/*0x6574*/      cmp r5, #1
/*0x6576*/      beq jump_6584
/*0x6578*/      cmp r5, #2
/*0x657a*/      bne jump_658a
/*0x657c*/      uxth r0, r4
/*0x657e*/      orr r4, r0, #2
/*0x6582*/      b jump_658a
            jump_6584:
/*0x6584*/      uxth r0, r4
/*0x6586*/      bic r4, r0, #2
            jump_658a:
/*0x658a*/      uxtb r0, r4
/*0x658c*/      bl function_28
/*0x6590*/      bl function_11
/*0x6594*/      bfi r4, r0, #0, #8
            jump_6598:
/*0x6598*/      lsls r0, r4, #0x1e
/*0x659a*/      bpl jump_65a0
/*0x659c*/      movs r0, #1
/*0x659e*/      pop {r4, r5, r6, pc}
            jump_65a0:
/*0x65a0*/      movs r0, #0
/*0x65a2*/      pop {r4, r5, r6, pc}

            .thumb_func
            clock_init:
/*0x65a4*/      ldr r0, [pc, #0x50] /* data_65f8 */
/*0x65a6*/      movs r1, #1
/*0x65a8*/      str.w r1, [r0, #0x300]
/*0x65ac*/      ldr r2, [pc, #0x4c] /* data_65fc */
/*0x65ae*/      str.w r1, [r2, #0xa8]
            jump_65b2:
/*0x65b2*/      ldr.w r3, [r2, #0x108]
/*0x65b6*/      cmp r3, #0
/*0x65b8*/      beq jump_65b2
/*0x65ba*/      movs r3, #0
/*0x65bc*/      str r3, [r2, #0x20]
/*0x65be*/      mov.w r3, #0x9000000
/*0x65c2*/      str r3, [r0, #0x18]
/*0x65c4*/      str.w r1, [r2, #0xa4]
            jump_65c8:
/*0x65c8*/      ldr.w r3, [r2, #0x104]
/*0x65cc*/      cmp r3, #0
/*0x65ce*/      beq jump_65c8
/*0x65d0*/      ldr r2, [pc, #0x2c] /* data_6600 */
/*0x65d2*/      ldr.w r3, [r2, #0x200]
/*0x65d6*/      bic r3, r3, #7
/*0x65da*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x65dc*/      str.w r3, [r2, #0x200]
/*0x65e0*/      str r1, [r0, #0x20]
/*0x65e2*/      ldr r2, [r0, #4]
/*0x65e4*/      bic r2, r2, #3
/*0x65e8*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x65ea*/      str r2, [r0, #4]
            jump_65ec:
/*0x65ec*/      ldr r2, [r0, #0x34]
/*0x65ee*/      cmp.w r1, r2, lsr #30
/*0x65f2*/      bne jump_65ec
/*0x65f4*/      bx lr

/*0x65f6*/  .byte 0x0
/*0x65f7*/  .byte 0x0

            data_65f8:
/*0x65f8*/  .word 0x40088000
            data_65fc:
/*0x65fc*/  .word 0x43100000
            data_6600:
/*0x6600*/  .word 0x40080000


            .thumb_func
            call_6604:
/*0x6604*/      ldr r0, [pc, #0x18] /* data_6620 */
/*0x6606*/      movs r1, #0
/*0x6608*/      add.w r2, r0, #8
/*0x660c*/      str r1, [r0, #0x1c]
/*0x660e*/      str r1, [r0, #0x20]
/*0x6610*/      strb r1, [r2, #1]
/*0x6612*/      str.w r1, [r0, #0x15]
/*0x6616*/      movs r1, #0x1d
/*0x6618*/      ldr r0, [pc, #8] /* data_6624 */
/*0x661a*/      b.w mem_zero

/*0x661e*/  .byte 0x0
/*0x661f*/  .byte 0x0

            data_6620:
/*0x6620*/  .word 0x20000034
            data_6624:
/*0x6624*/  .word 0x200006d6


            .thumb_func
            call_6628:
/*0x6628*/      push {r4, lr}
/*0x662a*/      ldr r0, [pc, #0x20] /* data_664c */
/*0x662c*/      ldr r1, [pc, #0x1c] /* data_664c */
/*0x662e*/      movs r4, #1
/*0x6630*/      strb r4, [r0]
/*0x6632*/      adds r1, #0xc
/*0x6634*/      movs r0, #2
/*0x6636*/      strb r0, [r1]
/*0x6638*/      ldr r1, [pc, #0x14] /* data_6650 */
/*0x663a*/      movs r0, #4
/*0x663c*/      strb r0, [r1]
/*0x663e*/      bl call_6604
/*0x6642*/      ldr r0, [pc, #8] /* data_664c */
/*0x6644*/      subs r0, #8
/*0x6646*/      strb r4, [r0, #5]
/*0x6648*/      pop {r4, pc}

/*0x664a*/  .byte 0x0
/*0x664b*/  .byte 0x0

            data_664c:
/*0x664c*/  .word 0x2000003c
            data_6650:
/*0x6650*/  .word 0x200006d4


            .thumb_func
            call_6654:
/*0x6654*/      ldrb.w r0, [r0, #0x34]
/*0x6658*/      ubfx r0, r0, #1, #1
/*0x665c*/      bx lr

/*0x665e*/  .byte 0x0
/*0x665f*/  .byte 0x0

            jump_6660:
/*0x6660*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6664*/      mov r4, r0
/*0x6666*/      bl usb_get_intr_flags
/*0x666a*/      mov r5, r0
/*0x666c*/      ldr r6, [pc, #0x158] /* data_67c8 */
/*0x666e*/      lsls r0, r0, #0x1e
/*0x6670*/      bpl jump_667e
/*0x6672*/      ldr r0, [r6, #4]
/*0x6674*/      cbz r0, jump_6678
/*0x6676*/      blx r0
            jump_6678:
/*0x6678*/      movs r0, #2
/*0x667a*/      bl usb_set_intr_flags
            jump_667e:
/*0x667e*/      lsls r0, r5, #0x1b
/*0x6680*/      bpl jump_66a2
/*0x6682*/      movs r0, #0x10
/*0x6684*/      bl usb_set_intr_flags
/*0x6688*/      ldrb.w r0, [r4, #0x32]
/*0x668c*/      cmp r0, #2
/*0x668e*/      blo jump_66a2
/*0x6690*/      bl usb_set_lpmode_pdwn
/*0x6694*/      ldrb.w r0, [r4, #0x32]
/*0x6698*/      strb.w r0, [r4, #0x33]
/*0x669c*/      movs r0, #3
/*0x669e*/      strb.w r0, [r4, #0x32]
            jump_66a2:
/*0x66a2*/      lsls r0, r5, #0x1d
/*0x66a4*/      mov.w r7, #0
/*0x66a8*/      bpl jump_66ee
/*0x66aa*/      subs r0, r7, #1
/*0x66ac*/      str r0, [r4, #0x20]
/*0x66ae*/      strb.w r7, [r4, #0x30]
/*0x66b2*/      strb.w r7, [r4, #0x31]
/*0x66b6*/      ldrb.w r0, [r4, #0x34]
/*0x66ba*/      bic r0, r0, #2
/*0x66be*/      strb.w r0, [r4, #0x34]
/*0x66c2*/      movs r0, #4
/*0x66c4*/      strb.w r0, [r4, #0x32]
/*0x66c8*/      str r7, [r4, #0x38]
/*0x66ca*/      bl usb_ckcu_voodoo
/*0x66ce*/      bl call_6ac8
/*0x66d2*/      ldr r1, [pc, #0xf8] /* data_67cc */
/*0x66d4*/      movs r0, #0
/*0x66d6*/      bl function_e_70
/*0x66da*/      ldr r0, [pc, #0xf0] /* data_67cc */
/*0x66dc*/      ldr r0, [r0]
/*0x66de*/      bl usb_enable_intr
/*0x66e2*/      ldr r0, [r6]
/*0x66e4*/      cbz r0, jump_66e8
/*0x66e6*/      blx r0
            jump_66e8:
/*0x66e8*/      movs r0, #4
/*0x66ea*/      bl usb_set_intr_flags
            jump_66ee:
/*0x66ee*/      lsls r0, r5, #0x1c
/*0x66f0*/      bpl jump_6704
/*0x66f2*/      bl call_6ac8
/*0x66f6*/      ldrb.w r0, [r4, #0x33]
/*0x66fa*/      strb.w r0, [r4, #0x32]
/*0x66fe*/      movs r0, #8
/*0x6700*/      bl usb_set_intr_flags
            jump_6704:
/*0x6704*/      lsls r0, r5, #0x17
/*0x6706*/      mov.w r8, #0x100
/*0x670a*/      bpl jump_6788
/*0x670c*/      movs r0, #0
/*0x670e*/      bl usb_get_ep_intr
/*0x6712*/      mov r5, r0
/*0x6714*/      lsls r0, r0, #0x16
/*0x6716*/      bpl jump_672e
/*0x6718*/      mov r0, r4
/*0x671a*/      bl call_6be8
/*0x671e*/      mov r0, r4
/*0x6720*/      bl call_7560
/*0x6724*/      mov.w r1, #0x200
/*0x6728*/      movs r0, #0
/*0x672a*/      bl usb_set_ep_intr
            jump_672e:
/*0x672e*/      lsls r0, r5, #0x1e
/*0x6730*/      bpl jump_6770
/*0x6732*/      movs r1, #2
/*0x6734*/      movs r0, #0
/*0x6736*/      bl usb_set_ep_intr
/*0x673a*/      ldr r0, [r4, #0x20]
/*0x673c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x673e*/      beq jump_6770
/*0x6740*/      ldrb.w r0, [r4, #0x24]
/*0x6744*/      cmp r0, #2
/*0x6746*/      bne jump_6770
/*0x6748*/      movs r2, #0x40
/*0x674a*/      movs r0, #0
/*0x674c*/      ldr r1, [r4, #0x1c]
/*0x674e*/      bl usb_recv
/*0x6752*/      ldr r1, [r4, #0x1c]
/*0x6754*/      add r1, r0
/*0x6756*/      str r1, [r4, #0x1c]
/*0x6758*/      ldr r1, [r4, #0x20]
/*0x675a*/      subs r0, r1, r0
/*0x675c*/      str r0, [r4, #0x20]
/*0x675e*/      bne jump_6770
/*0x6760*/      movs r0, #1
/*0x6762*/      strb.w r0, [r4, #0x24]
/*0x6766*/      ldr r1, [r4, #0x28]
/*0x6768*/      cbz r1, jump_6770
/*0x676a*/      ldr r0, [r4, #0x2c]
/*0x676c*/      blx r1
/*0x676e*/      str r7, [r4, #0x28]
            jump_6770:
/*0x6770*/      lsls r0, r5, #0x1b
/*0x6772*/      bpl jump_6782
/*0x6774*/      mov r0, r4
/*0x6776*/      bl call_751c
/*0x677a*/      movs r1, #0x10
/*0x677c*/      movs r0, #0
/*0x677e*/      bl usb_set_ep_intr
            jump_6782:
/*0x6782*/      mov r0, r8
/*0x6784*/      bl usb_set_intr_flags
            jump_6788:
/*0x6788*/      mov r4, r8
            jump_678a:
/*0x678a*/      bl usb_get_intr_flags
/*0x678e*/      bl function_e_75
/*0x6792*/      mov r5, r0
/*0x6794*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6796*/      beq jump_67c2
/*0x6798*/      mov r0, r5
/*0x679a*/      bl usb_get_ep_intr
/*0x679e*/      tst.w r0, #0x12
/*0x67a2*/      beq jump_678a
/*0x67a4*/      movs r1, #0x12
/*0x67a6*/      mov r0, r5
/*0x67a8*/      bl usb_set_ep_intr
/*0x67ac*/      lsl.w r0, r4, r5
/*0x67b0*/      bl usb_set_intr_flags
/*0x67b4*/      ldr r0, [r6, #0x18]
/*0x67b6*/      cmp r0, #0
/*0x67b8*/      beq jump_678a
/*0x67ba*/      mov r1, r0
/*0x67bc*/      mov r0, r5
/*0x67be*/      blx r1
/*0x67c0*/      b jump_678a
            jump_67c2:
/*0x67c2*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x67c6*/  .byte 0x0
/*0x67c7*/  .byte 0x0

            data_67c8:
/*0x67c8*/  .word 0x80f8
            data_67cc:
/*0x67cc*/  .word 0x20000168


            .thumb_func
            call_67d0:
/*0x67d0*/      movs r1, #2
/*0x67d2*/      strb.w r1, [r0, #0x32]
/*0x67d6*/      ldr r0, [pc, #4] /* data_67dc */
/*0x67d8*/      b.w jump_6ab4

            data_67dc:
/*0x67dc*/  .word 0x20000168


            .thumb_func
            call_67e0:
/*0x67e0*/      ldrb.w r0, [r0, #0x32]
/*0x67e4*/      cmp r0, #3
/*0x67e6*/      beq jump_67ec
/*0x67e8*/      movs r0, #0
/*0x67ea*/      bx lr
            jump_67ec:
/*0x67ec*/      movs r0, #1
/*0x67ee*/      bx lr

            .thumb_func
            call_67f0:
/*0x67f0*/      push {r4, lr}
/*0x67f2*/      bl call_6ac8
/*0x67f6*/      pop.w {r4, lr}
/*0x67fa*/      b.w jump_6bf8

/*0x67fe*/  .byte 0x0
/*0x67ff*/  .byte 0x0


            .thumb_func
            usb_set_intr_flags:
/*0x6800*/      ldr r1, [pc, #4] /* data_6808 */
/*0x6802*/      str r0, [r1, #8]
/*0x6804*/      bx lr

/*0x6806*/  .byte 0x0
/*0x6807*/  .byte 0x0

            data_6808:
/*0x6808*/  .word 0x400a8000


            .thumb_func
            usb_init:
/*0x680c*/      push {r4, lr}
/*0x680e*/      movs r1, #0
/*0x6810*/      mov.w r0, #0x400
/*0x6814*/      movs r2, #0x40
/*0x6816*/      movs r3, #1
/*0x6818*/      bl ckcu_clocks_enable
/*0x681c*/      movs r0, #2
/*0x681e*/      bl ckcu_set_usb_prescaler
/*0x6822*/      ldr r4, [pc, #0x48] /* data_686c */
/*0x6824*/      ldr r0, [pc, #0x40] /* data_6868 */
/*0x6826*/      str r0, [r4, #8]
/*0x6828*/      subs r0, #0x5c
/*0x682a*/      str r0, [r4, #0xc]
/*0x682c*/      subs r0, #0xf4
/*0x682e*/      str r0, [r4, #0x10]
/*0x6830*/      movs r0, #2
/*0x6832*/      str r0, [r4, #0x14]
/*0x6834*/      bl call_6628
/*0x6838*/      mov r0, r4
/*0x683a*/      bl call_67d0
/*0x683e*/      ldr r1, [pc, #0x30] /* data_6870 */
/*0x6840*/      mov.w r0, #0x200000
/*0x6844*/      str.w r0, [r1, #0x100]
/*0x6848*/      movs r0, #1
/*0x684a*/      bl usb_dp_pull_up
/*0x684e*/      movs r0, #0xfa
/*0x6850*/      bl spin_wait_maybe
/*0x6854*/      ldrb.w r0, [r4, #0x34]
/*0x6858*/      pop.w {r4, lr}
/*0x685c*/      and r1, r0, #1
/*0x6860*/      ldr r0, [pc, #0x10] /* data_6874 */
/*0x6862*/      b.w function_28

/*0x6866*/  .byte 0x0
/*0x6867*/  .byte 0x0

            data_6868:
/*0x6868*/  .word 0x80bc
            data_686c:
/*0x686c*/  .word 0x200006f4
            data_6870:
/*0x6870*/  .word 0xe000e004
            data_6874:
/*0x6874*/  .word 0x20000168


            .thumb_func
            usb_dp_wake_up:
/*0x6878*/      ldr r1, [pc, #0x14] /* data_6890 */
/*0x687a*/      cmp r0, #1
/*0x687c*/      ldr r0, [r1]
/*0x687e*/      beq jump_6888
/*0x6880*/      bic r0, r0, #0x800
            jump_6884:
/*0x6884*/      str r0, [r1]
/*0x6886*/      bx lr
            jump_6888:
/*0x6888*/      orr r0, r0, #0x800
/*0x688c*/      b jump_6884

/*0x688e*/  .byte 0x0
/*0x688f*/  .byte 0x0

            data_6890:
/*0x6890*/  .word 0x400a8000


            .thumb_func
            usb_dp_pull_up:
/*0x6894*/      ldr r1, [pc, #0x14] /* data_68ac */
/*0x6896*/      cmp r0, #1
/*0x6898*/      ldr r0, [r1]
/*0x689a*/      beq jump_68a4
/*0x689c*/      bic r0, r0, #0x400
            jump_68a0:
/*0x68a0*/      str r0, [r1]
/*0x68a2*/      bx lr
            jump_68a4:
/*0x68a4*/      orr r0, r0, #0x400
/*0x68a8*/      b jump_68a0

/*0x68aa*/  .byte 0x0
/*0x68ab*/  .byte 0x0

            data_68ac:
/*0x68ac*/  .word 0x400a8000


            .thumb_func
            usb_ckcu_voodoo:
/*0x68b0*/      movs r1, #0
/*0x68b2*/      movs r0, #0x20
/*0x68b4*/      movs r3, #1
/*0x68b6*/      mov r2, r1
/*0x68b8*/      b.w ckcu_voodoo1

            .thumb_func
            usb_ep_data_toggle:
/*0x68bc*/      push {r4, lr}
/*0x68be*/      bl usb_get_ep_reg
/*0x68c2*/      ldr r1, [r0]
/*0x68c4*/      and r1, r1, #9

            .thumb_func
            usb_clear_csr:
/*0x68c8*/      str r1, [r0]
/*0x68ca*/      pop {r4, pc}

            .thumb_func
            usb_ep_stall:
/*0x68cc*/      push {r4, lr}
/*0x68ce*/      bl usb_get_ep_reg
/*0x68d2*/      ldr r1, [r0]
/*0x68d4*/      and r1, r1, #0x24
/*0x68d8*/      str r1, [r0]
/*0x68da*/      pop {r4, pc}

            .thumb_func
            usb_set_ep_intr:
/*0x68dc*/      push {r4, lr}
/*0x68de*/      mov r4, r1
/*0x68e0*/      bl usb_get_ep_reg
/*0x68e4*/      str r4, [r0, #8]
/*0x68e6*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_buff:
/*0x68e8*/      push {r4, lr}
/*0x68ea*/      bl usb_get_ep_reg
/*0x68ee*/      ldr r0, [r0, #0x10]
/*0x68f0*/      ldr r1, [pc, #8] /* data_68fc */
/*0x68f2*/      ubfx r0, r0, #0, #0xa
/*0x68f6*/      add r0, r1
/*0x68f8*/      pop {r4, pc}

/*0x68fa*/  .byte 0x0
/*0x68fb*/  .byte 0x0

            data_68fc:
/*0x68fc*/  .word 0x400aa000


            .thumb_func
            usb_get_ep_buff_end:
/*0x6900*/      push {r4, r5, r6, lr}
/*0x6902*/      mov r5, r0
/*0x6904*/      bl usb_get_ep_reg
/*0x6908*/      mov r4, r0
/*0x690a*/      mov r0, r5
/*0x690c*/      bl usb_get_ep_len
/*0x6910*/      ldr r1, [r4, #0x10]
/*0x6912*/      ubfx r1, r1, #0, #0xa
/*0x6916*/      add r0, r1
/*0x6918*/      ldr r1, [pc, #4] /* data_6920 */
/*0x691a*/      add r0, r1
/*0x691c*/      pop {r4, r5, r6, pc}

/*0x691e*/  .byte 0x0
/*0x691f*/  .byte 0x0

            data_6920:
/*0x6920*/  .word 0x400aa000


            .thumb_func
            usb_get_ep_len:
/*0x6924*/      push {r4, lr}
/*0x6926*/      bl usb_get_ep_reg
/*0x692a*/      ldr r0, [r0, #0x10]
/*0x692c*/      ubfx r0, r0, #0xa, #0xa
/*0x6930*/      pop {r4, pc}

            .thumb_func
            function_e_67:
/*0x6932*/      push {r4, lr}
/*0x6934*/      bl usb_get_ep_reg
/*0x6938*/      ldr r1, [r0, #0x10]
/*0x693a*/      ldr r0, [r0]
/*0x693c*/      lsls r1, r1, #3
/*0x693e*/      bpl jump_6946
/*0x6940*/      ubfx r0, r0, #2, #1
/*0x6944*/      pop {r4, pc}
            jump_6946:
/*0x6946*/      ubfx r0, r0, #5, #1
/*0x694a*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_intr:
/*0x694c*/      push {r4, lr}
/*0x694e*/      bl usb_get_ep_reg
/*0x6952*/      ldr r1, [r0, #4]
/*0x6954*/      ldr r0, [r0, #8]
/*0x6956*/      ands r0, r1
/*0x6958*/      pop {r4, pc}

            .thumb_func
            usb_get_ep_tcnt:
/*0x695a*/      push {r4, lr}
/*0x695c*/      mov r4, r1
/*0x695e*/      bl usb_get_ep_reg
/*0x6962*/      ldr r0, [r0, #0xc]
/*0x6964*/      lsrs r0, r4
/*0x6966*/      ubfx r0, r0, #0, #9
/*0x696a*/      pop {r4, pc}

            .thumb_func
            function_e_70:
/*0x696c*/      push {r4, r5, r6, lr}
/*0x696e*/      mov r4, r1
/*0x6970*/      mov r5, r0
/*0x6972*/      bl usb_get_ep_reg
/*0x6976*/      add.w r1, r4, r5, lsl #3
/*0x697a*/      ldr r2, [r1, #4]
/*0x697c*/      str r2, [r0, #0x10]
/*0x697e*/      ldr r1, [r1, #8]
/*0x6980*/      str r1, [r0, #4]
/*0x6982*/      mov.w r1, #-1
/*0x6986*/      str r1, [r0, #8]
/*0x6988*/      mov r0, r5
/*0x698a*/      pop.w {r4, r5, r6, lr}
/*0x698e*/      b.w function_e_71

            .thumb_func
            usb_read_ep_buff:
/*0x6992*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6996*/      mov r6, r2
/*0x6998*/      mov r7, r1
/*0x699a*/      movs r5, r0
/*0x699c*/      beq jump_69c2
/*0x699e*/      movs r1, #0
            jump_69a0:
/*0x69a0*/      bl usb_get_ep_tcnt
/*0x69a4*/      mov r4, r0
/*0x69a6*/      cmp r0, r6
/*0x69a8*/      bhi jump_69bc
/*0x69aa*/      mov r0, r5
/*0x69ac*/      cbz r5, jump_69c6
/*0x69ae*/      bl usb_get_ep_buff
            jump_69b2:
/*0x69b2*/      adds r1, r4, #3
/*0x69b4*/      lsrs r2, r1, #2
/*0x69b6*/      mov r1, r7
/*0x69b8*/      bl copy_words
            jump_69bc:
/*0x69bc*/      mov r0, r4
/*0x69be*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_69c2:
/*0x69c2*/      movs r1, #0x10
/*0x69c4*/      b jump_69a0
            jump_69c6:
/*0x69c6*/      bl usb_get_ep_buff_end
/*0x69ca*/      b jump_69b2

            .thumb_func
            usb_recv:
/*0x69cc*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x69d0*/      mov r5, r2
/*0x69d2*/      mov r6, r1
/*0x69d4*/      mov r7, r0
/*0x69d6*/      bl usb_get_ep_reg
/*0x69da*/      mov r4, r0
/*0x69dc*/      movs r0, #0
/*0x69de*/      cbz r5, jump_69f0
/*0x69e0*/      mov r2, r5
/*0x69e2*/      mov r1, r6
/*0x69e4*/      mov r0, r7
/*0x69e6*/      bl usb_read_ep_buff
/*0x69ea*/      cbnz r0, jump_69f0
/*0x69ec*/      cmp r5, #0
/*0x69ee*/      bne jump_69f8
            jump_69f0:
/*0x69f0*/      ldr r1, [r4]
/*0x69f2*/      and r1, r1, #0x10
/*0x69f6*/      str r1, [r4]
            jump_69f8:
/*0x69f8*/      pop.w {r4, r5, r6, r7, r8, pc}

            .thumb_func
            function_e_71:
/*0x69fc*/      push {r4, lr}
/*0x69fe*/      bl usb_get_ep_reg
/*0x6a02*/      ldr r1, [r0]
/*0x6a04*/      and r1, r1, #0x19
/*0x6a08*/      str r1, [r0]
/*0x6a0a*/      pop {r4, pc}

            .thumb_func
            function_e_72:
/*0x6a0c*/      push {r4, lr}
/*0x6a0e*/      bl usb_get_ep_reg
/*0x6a12*/      movs r1, #4
/*0x6a14*/      str r1, [r0]
/*0x6a16*/      pop {r4, pc}

            .thumb_func
            function_e_73:
/*0x6a18*/      push {r4, lr}
/*0x6a1a*/      bl usb_get_ep_reg
/*0x6a1e*/      movs r1, #0x40
/*0x6a20*/      str r1, [r0, #8]
/*0x6a22*/      ldr r2, [r0]
/*0x6a24*/      movs r1, #0x24
/*0x6a26*/      bics r1, r2
/*0x6a28*/      str r1, [r0]
/*0x6a2a*/      pop {r4, pc}

            .thumb_func
            usb_copy_send:
/*0x6a2c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6a30*/      mov r4, r2
/*0x6a32*/      mov r8, r1
/*0x6a34*/      mov r7, r0
/*0x6a36*/      bl usb_get_ep_len
/*0x6a3a*/      mov r6, r0
/*0x6a3c*/      mov r0, r7
/*0x6a3e*/      bl usb_get_ep_reg
/*0x6a42*/      mov r5, r0
/*0x6a44*/      movs r1, #0
/*0x6a46*/      mov r0, r7
/*0x6a48*/      bl usb_get_ep_tcnt
/*0x6a4c*/      cmp r4, r6
/*0x6a4e*/      bhi jump_6a52
/*0x6a50*/      cbz r0, jump_6a58
            jump_6a52:
/*0x6a52*/      movs r0, #0
            jump_6a54:
/*0x6a54*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_6a58:
/*0x6a58*/      mov r0, r7
/*0x6a5a*/      bl usb_get_ep_buff
/*0x6a5e*/      mov r1, r0
/*0x6a60*/      adds r0, r4, #3
/*0x6a62*/      lsrs r2, r0, #2
/*0x6a64*/      mov r0, r8
/*0x6a66*/      bl copy_words
/*0x6a6a*/      str r4, [r5, #0xc]
/*0x6a6c*/      movs r0, #2
/*0x6a6e*/      str r0, [r5]
/*0x6a70*/      mov r0, r4
/*0x6a72*/      b jump_6a54

            .thumb_func
            usb_enable_intr:
/*0x6a74*/      ldr r1, [pc, #8] /* data_6a80 */
/*0x6a76*/      ldr r2, [r1, #4]
/*0x6a78*/      orrs r2, r0
/*0x6a7a*/      str r2, [r1, #4]
/*0x6a7c*/      bx lr

/*0x6a7e*/  .byte 0x0
/*0x6a7f*/  .byte 0x0

            data_6a80:
/*0x6a80*/  .word 0x400a8000


            .thumb_func
            function_e_75:
/*0x6a84*/      mov r3, r0
/*0x6a86*/      movs r1, #7
            jump_6a88:
/*0x6a88*/      add.w r2, r1, #8
/*0x6a8c*/      lsr.w r0, r3, r2
/*0x6a90*/      lsls r2, r0, #0x1f
/*0x6a92*/      beq jump_6a98
/*0x6a94*/      sxtb r0, r1
/*0x6a96*/      bx lr
            jump_6a98:
/*0x6a98*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6a9a*/      cmp r1, #0
/*0x6a9c*/      bgt jump_6a88
/*0x6a9e*/      mov.w r0, #-1
/*0x6aa2*/      bx lr

            .thumb_func
            usb_get_intr_flags:
/*0x6aa4*/      ldr r0, [pc, #8] /* data_6ab0 */
/*0x6aa6*/      ldr r1, [r0, #4]
/*0x6aa8*/      ldr r0, [r0, #8]
/*0x6aaa*/      ands r0, r1
/*0x6aac*/      bx lr

/*0x6aae*/  .byte 0x0
/*0x6aaf*/  .byte 0x0

            data_6ab0:
/*0x6ab0*/  .word 0x400a8000

            jump_6ab4:
/*0x6ab4*/      b.w ptr_write_data

            .thumb_func
            usb_set_lpmode_pdwn:
/*0x6ab8*/      ldr r0, [pc, #8] /* data_6ac4 */
/*0x6aba*/      ldr r1, [r0]
/*0x6abc*/      orr r1, r1, #0xc
/*0x6ac0*/      str r1, [r0]
/*0x6ac2*/      bx lr

            data_6ac4:
/*0x6ac4*/  .word 0x400a8000


            .thumb_func
            call_6ac8:
/*0x6ac8*/      ldr r0, [pc, #8] /* data_6ad4 */
/*0x6aca*/      ldr r1, [r0]
/*0x6acc*/      and r1, r1, #0x400
/*0x6ad0*/      str r1, [r0]
/*0x6ad2*/      bx lr

            data_6ad4:
/*0x6ad4*/  .word 0x400a8000


            .thumb_func
            function_28:
/*0x6ad8*/      push {r4, lr}
/*0x6ada*/      mov r4, r0
/*0x6adc*/      ldr r0, [pc, #0x68] /* data_6b48 */
/*0x6ade*/      ldr r2, [r0]
/*0x6ae0*/      cmp r2, #1
/*0x6ae2*/      bne jump_6b44
/*0x6ae4*/      movs r2, #0
/*0x6ae6*/      str r2, [r0]
/*0x6ae8*/      ldr r0, [pc, #0x60] /* data_6b4c */
/*0x6aea*/      ldr r2, [r0]
/*0x6aec*/      lsls r3, r2, #0x19
/*0x6aee*/      mov.w r2, #-1
/*0x6af2*/      bpl jump_6b0e
/*0x6af4*/      movw r3, #0x40c
/*0x6af8*/      str r3, [r0]
/*0x6afa*/      str r2, [r0, #8]
/*0x6afc*/      cbnz r1, jump_6b04
/*0x6afe*/      movs r0, #0
/*0x6b00*/      bl call_5c44
            jump_6b04:
/*0x6b04*/      ldr r0, [r4]
/*0x6b06*/      pop.w {r4, lr}
/*0x6b0a*/      b.w usb_enable_intr
            jump_6b0e:
/*0x6b0e*/      movw r3, #0xc0c
/*0x6b12*/      str r3, [r0]
/*0x6b14*/      str r2, [r0, #8]
/*0x6b16*/      cbnz r1, jump_6b1e
/*0x6b18*/      movs r0, #0
/*0x6b1a*/      bl call_5c44
            jump_6b1e:
/*0x6b1e*/      movs r0, #0
/*0x6b20*/      bl usb_dp_wake_up
/*0x6b24*/      ldr r0, [r4]
/*0x6b26*/      bl usb_enable_intr
/*0x6b2a*/      movs r0, #0
/*0x6b2c*/      bl usb_dp_pull_up
/*0x6b30*/      movs r1, #0xc8
/*0x6b32*/      movs r0, #0
            jump_6b34:
/*0x6b34*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6b36*/      cmp r0, r1
/*0x6b38*/      blo jump_6b34
/*0x6b3a*/      pop.w {r4, lr}
/*0x6b3e*/      movs r0, #1
/*0x6b40*/      b.w usb_dp_pull_up
            jump_6b44:
/*0x6b44*/      pop {r4, pc}

/*0x6b46*/  .byte 0x0
/*0x6b47*/  .byte 0x0

            data_6b48:
/*0x6b48*/  .word 0x20000014
            data_6b4c:
/*0x6b4c*/  .word 0x400a8000


            .thumb_func
            ptr_write_data:
/*0x6b50*/      movw r1, #0x111d
/*0x6b54*/      str r1, [r0]
/*0x6b56*/      ldr r1, [pc, #0x28] /* data_6b80 */
/*0x6b58*/      str r1, [r0, #4]
/*0x6b5a*/      movw r1, #0x212
/*0x6b5e*/      str r1, [r0, #8]
/*0x6b60*/      ldr r1, [pc, #0x20] /* data_6b84 */
/*0x6b62*/      str r1, [r0, #0xc]
/*0x6b64*/      ldr r2, [pc, #0x20] /* data_6b88 */
/*0x6b66*/      movs r1, #0x10
/*0x6b68*/      strd r1, r2, [r0, #0x10]
/*0x6b6c*/      str r1, [r0, #0x18]
/*0x6b6e*/      ldr r1, [pc, #0x1c] /* data_6b8c */
/*0x6b70*/      str r1, [r0, #0x1c]
/*0x6b72*/      movs r1, #0
/*0x6b74*/      str r1, [r0, #0x20]
/*0x6b76*/      ldr r1, [pc, #0x18] /* data_6b90 */
/*0x6b78*/      str r1, [r0, #0x24]
/*0x6b7a*/      movs r1, #2
/*0x6b7c*/      str r1, [r0, #0x28]
/*0x6b7e*/      bx lr

            data_6b80:
/*0x6b80*/  .word 0x80010008
            data_6b84:
/*0x6b84*/  .word 0x91002088
            data_6b88:
/*0x6b88*/  .word 0x92010090
            data_6b8c:
/*0x6b8c*/  .word 0x930100d0
            data_6b90:
/*0x6b90*/  .word 0x84010110


            .thumb_func
            function_130_2:
/*0x6b94*/      push {r4, lr}
/*0x6b96*/      ldr r4, [pc, #0x48] /* data_6be0 */
/*0x6b98*/      ldrb.w r0, [r4, #0x32]
/*0x6b9c*/      cmp r0, #3
/*0x6b9e*/      bne jump_6ba4
/*0x6ba0*/      bl function_130_9
            jump_6ba4:
/*0x6ba4*/      ldr r1, [pc, #0x3c] /* data_6be4 */
/*0x6ba6*/      ldrb r0, [r1, #5]
/*0x6ba8*/      cbz r0, jump_6bca
/*0x6baa*/      cmp r0, #1
/*0x6bac*/      beq jump_6bc2
/*0x6bae*/      cmp r0, #2
/*0x6bb0*/      bne jump_6bd2
/*0x6bb2*/      ldrb.w r0, [r4, #0x32]
/*0x6bb6*/      cmp r0, #6
/*0x6bb8*/      bne jump_6bbe
/*0x6bba*/      bl function_130_1
            jump_6bbe:
/*0x6bbe*/      movs r0, #2
/*0x6bc0*/      pop {r4, pc}
            jump_6bc2:
/*0x6bc2*/      movs r0, #0
/*0x6bc4*/      strb r0, [r1, #5]
/*0x6bc6*/      movs r0, #3
/*0x6bc8*/      pop {r4, pc}
            jump_6bca:
/*0x6bca*/      ldrb.w r0, [r4, #0x32]
/*0x6bce*/      cmp r0, #6
/*0x6bd0*/      beq jump_6bd6
            jump_6bd2:
/*0x6bd2*/      movs r0, #0
/*0x6bd4*/      pop {r4, pc}
            jump_6bd6:
/*0x6bd6*/      movs r0, #2
/*0x6bd8*/      strb r0, [r1, #5]
/*0x6bda*/      movs r0, #1
/*0x6bdc*/      pop {r4, pc}

/*0x6bde*/  .byte 0x0
/*0x6bdf*/  .byte 0x0

            data_6be0:
/*0x6be0*/  .word 0x200006f4
            data_6be4:
/*0x6be4*/  .word 0x20000034


            .thumb_func
            call_6be8:
/*0x6be8*/      ldr r1, [pc, #8] /* data_6bf4 */
/*0x6bea*/      ldr r2, [r1]
/*0x6bec*/      str r2, [r0]
/*0x6bee*/      ldr r1, [r1, #4]
/*0x6bf0*/      str r1, [r0, #4]
/*0x6bf2*/      bx lr

            data_6bf4:
/*0x6bf4*/  .word 0x400aa000

            jump_6bf8:
/*0x6bf8*/      ldr r0, [pc, #8] /* data_6c04 */
/*0x6bfa*/      ldr r1, [r0]
/*0x6bfc*/      orr r1, r1, #0x20
/*0x6c00*/      str r1, [r0]
/*0x6c02*/      bx lr

            data_6c04:
/*0x6c04*/  .word 0x400a8000


            .thumb_func
            call_6c08:
/*0x6c08*/      ldr r1, [pc, #0xc] /* data_6c18 */
/*0x6c0a*/      ldr r2, [r1]
/*0x6c0c*/      orr r2, r2, #0x100
/*0x6c10*/      str r2, [r1]
/*0x6c12*/      str r0, [r1, #0x10]
/*0x6c14*/      bx lr

/*0x6c16*/  .byte 0x0
/*0x6c17*/  .byte 0x0

            data_6c18:
/*0x6c18*/  .word 0x400a8000


            .thumb_func
            usb_intr:
/*0x6c1c*/      ldr r0, [pc, #4] /* data_6c24 */
/*0x6c1e*/      b.w jump_6660

/*0x6c22*/  .byte 0x0
/*0x6c23*/  .byte 0x0

            data_6c24:
/*0x6c24*/  .word 0x200006f4


            .thumb_func
            watchdog_init:
/*0x6c28*/      ldr r1, [pc, #0x1c] /* data_6c48 */
/*0x6c2a*/      movs r0, #0x10
/*0x6c2c*/      str.w r0, [r1, #0x10c]
/*0x6c30*/      ldr r0, [pc, #0x18] /* data_6c4c */
/*0x6c32*/      movw r1, #0x5fff
/*0x6c36*/      str r1, [r0, #8]
/*0x6c38*/      ldr r1, [pc, #0x14] /* data_6c50 */
/*0x6c3a*/      str r1, [r0, #4]
/*0x6c3c*/      movw r1, #0xca35
/*0x6c40*/      str r1, [r0, #0x10]
/*0x6c42*/      ldr r1, [pc, #0x10] /* data_6c54 */
/*0x6c44*/      str r1, [r0]
/*0x6c46*/      bx lr

            data_6c48:
/*0x6c48*/  .word 0x40088000
            data_6c4c:
/*0x6c4c*/  .word 0x40068000
            data_6c50:
/*0x6c50*/  .word 0x1a7d0
            data_6c54:
/*0x6c54*/  .word 0x5fa00001


            .thumb_func
            watchdog_reload_timer:
/*0x6c58*/      ldr r1, [pc, #8] /* data_6c64 */
/*0x6c5a*/      ldr r0, [pc, #4] /* data_6c60 */
/*0x6c5c*/      str r0, [r1]
/*0x6c5e*/      bx lr

            data_6c60:
/*0x6c60*/  .word 0x5fa00001
            data_6c64:
/*0x6c64*/  .word 0x40068000

            jump_6c68:
/*0x6c68*/      push {r4, lr}
/*0x6c6a*/      bl call_3bec
/*0x6c6e*/      ldr r1, [pc, #0x10] /* data_6c80 */
/*0x6c70*/      movs r0, #0
/*0x6c72*/      str r0, [r1, #4]
/*0x6c74*/      ldr r1, [pc, #0xc] /* data_6c84 */
/*0x6c76*/      strb r0, [r1, #6]
/*0x6c78*/      movs r0, #1
/*0x6c7a*/      strb r0, [r1]
/*0x6c7c*/      pop {r4, pc}

/*0x6c7e*/  .byte 0x0
/*0x6c7f*/  .byte 0x0

            data_6c80:
/*0x6c80*/  .word 0x20000004
            data_6c84:
/*0x6c84*/  .word 0x20000648

            jump_6c88:
/*0x6c88*/      push {r4, r5, r6, lr}
/*0x6c8a*/      mov r6, r0
/*0x6c8c*/      mov r5, r2
/*0x6c8e*/      mov r4, r1
/*0x6c90*/      mov r0, r1
/*0x6c92*/      bl function_e_40
/*0x6c96*/      mov r2, r5
/*0x6c98*/      mov r1, r4
/*0x6c9a*/      mov r0, r6
/*0x6c9c*/      pop.w {r4, r5, r6, lr}
/*0x6ca0*/      b.w function_27

            .thumb_func
            call_6ca4:
/*0x6ca4*/      push {r4, r5, lr}
/*0x6ca6*/      ldr r1, [pc, #0x24] /* data_6ccc */
/*0x6ca8*/      movs r0, #0xa
/*0x6caa*/      ldr r2, [pc, #0x1c] /* data_6cc8 */
/*0x6cac*/      ldr r3, [pc, #0x20] /* data_6cd0 */
/*0x6cae*/      ldrb.w r1, [r1, #0x25]
/*0x6cb2*/      b jump_6cbe
            jump_6cb4:
/*0x6cb4*/      ldrb r4, [r2, r0]
/*0x6cb6*/      muls r4, r1, r4
/*0x6cb8*/      lsrs r4, r4, #3
/*0x6cba*/      adds r5, r3, r0
/*0x6cbc*/      strb r4, [r5, #4]
            jump_6cbe:
/*0x6cbe*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6cc0*/      uxtb r0, r0
/*0x6cc2*/      bhs jump_6cb4
/*0x6cc4*/      pop {r4, r5, pc}

/*0x6cc6*/  .byte 0x0
/*0x6cc7*/  .byte 0x0

            data_6cc8:
/*0x6cc8*/  .word 0x7bbb
            data_6ccc:
/*0x6ccc*/  .word 0x20000730
            data_6cd0:
/*0x6cd0*/  .word 0x2000008c


            .thumb_func
            call_6cd4:
/*0x6cd4*/      push {r4, r5, r6, r7, lr}
/*0x6cd6*/      ldr r6, [pc, #0x194] /* data_6e6c */
/*0x6cd8*/      ldr r4, [pc, #0x194] /* data_6e70 */
/*0x6cda*/      sub sp, #0x2c
/*0x6cdc*/      ldrb r0, [r6, #3]
/*0x6cde*/      cmp r0, #5
/*0x6ce0*/      bhi jump_6d7e
/*0x6ce2*/      cmp r0, #6
/*0x6ce4*/      bhs jump_6d1a
/*0x6ce6*/      tbb [pc, r0]

/*0x6cea*/  .byte 0x3
/*0x6ceb*/  .byte 0x3
/*0x6cec*/  .byte 0x1d
/*0x6ced*/  .byte 0x56
/*0x6cee*/  .byte 0x43
/*0x6cef*/  .byte 0x43

            switch_6cf0:
/*0x6cf0*/      movs r5, #3
/*0x6cf2*/      ldr r7, [pc, #0x180] /* data_6e74 */
/*0x6cf4*/      b jump_6d14
            jump_6cf6:
/*0x6cf6*/      ldrb r0, [r6, #3]
/*0x6cf8*/      cbz r0, jump_6d1e
/*0x6cfa*/      adds r0, r4, r5
/*0x6cfc*/      ldrb r0, [r0, #4]
            jump_6cfe:
/*0x6cfe*/      ldr r1, [r4]
/*0x6d00*/      ldrb r1, [r1, #3]
/*0x6d02*/      muls r0, r1, r0
/*0x6d04*/      lsrs r2, r0, #3
/*0x6d06*/      add.w r0, r5, r5, lsl #3
/*0x6d0a*/      add.w r0, r7, r0, lsl #3
/*0x6d0e*/      movs r1, #0x48
/*0x6d10*/      bl mem_set
            jump_6d14:
/*0x6d14*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6d16*/      uxtb r5, r5
/*0x6d18*/      bhs jump_6cf6
            jump_6d1a:
/*0x6d1a*/      add sp, #0x2c
/*0x6d1c*/      pop {r4, r5, r6, r7, pc}
            jump_6d1e:
/*0x6d1e*/      ldr r0, [r4]
/*0x6d20*/      ldrb r0, [r0, r5]
/*0x6d22*/      b jump_6cfe
            switch_6d24:
/*0x6d24*/      ldrb r7, [r4, #4]
/*0x6d26*/      movs r5, #0xe
/*0x6d28*/      mov r6, sp
/*0x6d2a*/      b jump_6d48
            jump_6d2c:
/*0x6d2c*/      ldr r0, [r4]
/*0x6d2e*/      ldrb r0, [r0, #3]
/*0x6d30*/      lsls r1, r0, #5
/*0x6d32*/      sub.w r0, r1, r0, lsl #1
/*0x6d36*/      uxtb r1, r0
/*0x6d38*/      add.w r0, r5, r5, lsl #1
/*0x6d3c*/      adds r2, r0, r6
/*0x6d3e*/      mov r0, r7
/*0x6d40*/      bl call_3fe8
/*0x6d44*/      adds r7, #0x20
/*0x6d46*/      uxtb r7, r7
            jump_6d48:
/*0x6d48*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6d4a*/      uxtb r5, r5
/*0x6d4c*/      bhs jump_6d2c
/*0x6d4e*/      ldr r5, [pc, #0x128] /* data_6e78 */
/*0x6d50*/      movs r4, #0x48
/*0x6d52*/      b jump_6d68
            jump_6d54:
/*0x6d54*/      ldrb r0, [r5]
/*0x6d56*/      cmp r0, #0xe
/*0x6d58*/      bhs jump_6d66
/*0x6d5a*/      add.w r0, r0, r0, lsl #1
/*0x6d5e*/      adds r1, r0, r6
/*0x6d60*/      mov r0, r4
/*0x6d62*/      bl call_408c
            jump_6d66:
/*0x6d66*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6d68:
/*0x6d68*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6d6a*/      uxtb r4, r4
/*0x6d6c*/      bhs jump_6d54
/*0x6d6e*/      b jump_6d1a
            switch_6d70:
/*0x6d70*/      add sp, #0x2c
/*0x6d72*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x6d74*/      pop.w {r4, r5, r6, r7, lr}
/*0x6d78*/      uxtb r0, r0
/*0x6d7a*/      b.w jump_3a18
            jump_6d7e:
/*0x6d7e*/      cmp r0, #7
/*0x6d80*/      bls jump_6d1a
/*0x6d82*/      bic r0, r0, #1
/*0x6d86*/      cmp r0, #8
/*0x6d88*/      beq switch_6d96
/*0x6d8a*/      cmp r0, #0xa
/*0x6d8c*/      beq jump_6da2
/*0x6d8e*/      cmp r0, #0xc
/*0x6d90*/      bne jump_6d1a
/*0x6d92*/      movs r5, #0x48
/*0x6d94*/      b jump_6e62
            switch_6d96:
/*0x6d96*/      add sp, #0x2c
/*0x6d98*/      adds r0, r4, #4
/*0x6d9a*/      pop.w {r4, r5, r6, r7, lr}
/*0x6d9e*/      b.w jump_4064
            jump_6da2:
/*0x6da2*/      movs r0, #0
/*0x6da4*/      movs r5, #0xe
/*0x6da6*/      str r0, [sp, #4]
/*0x6da8*/      b jump_6e00
            jump_6daa:
/*0x6daa*/      add.w r0, r5, r5, lsl #1
/*0x6dae*/      add.w r1, r4, r0, lsl #1
/*0x6db2*/      ldrb r0, [r1, #4]!
/*0x6db6*/      cbnz r0, jump_6dc0
/*0x6db8*/      ldrb r0, [r1, #1]
/*0x6dba*/      cbnz r0, jump_6dc0
/*0x6dbc*/      ldrb r0, [r1, #2]
/*0x6dbe*/      cbz r0, jump_6dec
            jump_6dc0:
/*0x6dc0*/      ldrb r0, [r1, #3]
/*0x6dc2*/      cbnz r0, jump_6dcc
/*0x6dc4*/      ldrb r0, [r1, #4]
/*0x6dc6*/      cbnz r0, jump_6dcc
/*0x6dc8*/      ldrb r0, [r1, #5]
/*0x6dca*/      cbz r0, jump_6de8
            jump_6dcc:
/*0x6dcc*/      movs r2, #3
/*0x6dce*/      mov r6, sp
/*0x6dd0*/      b jump_6de0
            jump_6dd2:
/*0x6dd2*/      adds r3, r1, r2
/*0x6dd4*/      ldrb r0, [r1, r2]
/*0x6dd6*/      ldrb r3, [r3, #3]
/*0x6dd8*/      cmp r0, r3
/*0x6dda*/      bhi jump_6dde
/*0x6ddc*/      mov r0, r3
            jump_6dde:
/*0x6dde*/      strb r0, [r6, r2]
            jump_6de0:
/*0x6de0*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6de2*/      uxtb r2, r2
/*0x6de4*/      bhs jump_6dd2
/*0x6de6*/      mov r1, r6
            jump_6de8:
/*0x6de8*/      mov r0, r5
/*0x6dea*/      b jump_6dfc
            jump_6dec:
/*0x6dec*/      ldrb r0, [r1, #3]
/*0x6dee*/      cbnz r0, jump_6df8
/*0x6df0*/      ldrb r0, [r1, #4]
/*0x6df2*/      cbnz r0, jump_6df8
/*0x6df4*/      ldrb r0, [r1, #5]
/*0x6df6*/      cbz r0, jump_6e08
            jump_6df8:
/*0x6df8*/      mov r0, r5
/*0x6dfa*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_6dfc:
/*0x6dfc*/      bl call_6e7c
            jump_6e00:
/*0x6e00*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6e02*/      uxtb r5, r5
/*0x6e04*/      bhs jump_6daa
/*0x6e06*/      b jump_6d1a
            jump_6e08:
/*0x6e08*/      add r1, sp, #4
/*0x6e0a*/      b jump_6de8
            jump_6e0c:
/*0x6e0c*/      ldr r0, [pc, #0x68] /* data_6e78 */
/*0x6e0e*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6e10*/      ldrb r1, [r0, r5]
/*0x6e12*/      and r0, r1, #7
/*0x6e16*/      add.w r0, r0, r0, lsl #2
/*0x6e1a*/      add r0, r4
/*0x6e1c*/      ldrsb.w r2, [r0, #0x12]
/*0x6e20*/      adds r0, #0xe
/*0x6e22*/      cbz r2, jump_6e5a
/*0x6e24*/      ldrb r3, [r0, #3]
/*0x6e26*/      rsbs r1, r3, r1, lsr #3
/*0x6e2a*/      bpl jump_6e2e
/*0x6e2c*/      rsbs r1, r1, #0
            jump_6e2e:
/*0x6e2e*/      subs r1, r1, r2
/*0x6e30*/      adds r1, #0xa
/*0x6e32*/      uxtb r2, r1
/*0x6e34*/      cmp r2, #0xa
/*0x6e36*/      bhs jump_6e5a
/*0x6e38*/      movs r1, #3
/*0x6e3a*/      mov r3, sp
/*0x6e3c*/      adds r6, r4, r2
/*0x6e3e*/      b jump_6e4a
            jump_6e40:
/*0x6e40*/      ldrb r2, [r0, r1]
/*0x6e42*/      ldrb r7, [r6, #4]
/*0x6e44*/      muls r2, r7, r2
/*0x6e46*/      lsrs r2, r2, #8
/*0x6e48*/      strb r2, [r3, r1]
            jump_6e4a:
/*0x6e4a*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6e4c*/      uxtb r1, r1
/*0x6e4e*/      bhs jump_6e40
/*0x6e50*/      mov r1, r3
/*0x6e52*/      mov r0, r5
/*0x6e54*/      bl call_408c
/*0x6e58*/      b jump_6e62
            jump_6e5a:
/*0x6e5a*/      movs r1, #0
/*0x6e5c*/      mov r0, r5
/*0x6e5e*/      bl call_40d0
            jump_6e62:
/*0x6e62*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6e64*/      uxtb r5, r5
/*0x6e66*/      bhs jump_6e0c
/*0x6e68*/      b jump_6d1a

/*0x6e6a*/  .byte 0x0
/*0x6e6b*/  .byte 0x0

            data_6e6c:
/*0x6e6c*/  .word 0x20000730
            data_6e70:
/*0x6e70*/  .word 0x2000008c
            data_6e74:
/*0x6e74*/  .word 0x2000032e
            data_6e78:
/*0x6e78*/  .word 0x7b72


            .thumb_func
            call_6e7c:
/*0x6e7c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6e80*/      mov r7, r1
/*0x6e82*/      mov r6, r0
/*0x6e84*/      movs r4, #0x48
/*0x6e86*/      ldr r5, [pc, #0x1c] /* data_6ea4 */
/*0x6e88*/      b jump_6e9a
            jump_6e8a:
/*0x6e8a*/      ldrb r0, [r5]
/*0x6e8c*/      cmp r0, r6
/*0x6e8e*/      bne jump_6e98
/*0x6e90*/      mov r1, r7
/*0x6e92*/      mov r0, r4
/*0x6e94*/      bl call_408c
            jump_6e98:
/*0x6e98*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6e9a:
/*0x6e9a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6e9c*/      uxtb r4, r4
/*0x6e9e*/      bhs jump_6e8a
/*0x6ea0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6ea4:
/*0x6ea4*/  .word 0x7b72


            .thumb_func
            call_6ea8:
/*0x6ea8*/      push {r3, r4, r5, lr}
/*0x6eaa*/      mov r4, r0
/*0x6eac*/      ldr r0, [pc, #0x24] /* data_6ed4 */
/*0x6eae*/      ldr r0, [r0]
/*0x6eb0*/      ldrb r5, [r0, #3]
/*0x6eb2*/      cbnz r1, jump_6ebc
/*0x6eb4*/      mov r0, sp
/*0x6eb6*/      bl call_3fc6
/*0x6eba*/      mov r1, sp
            jump_6ebc:
/*0x6ebc*/      movs r2, #3
/*0x6ebe*/      b jump_6ecc
            jump_6ec0:
/*0x6ec0*/      ldrb r0, [r1], #1
/*0x6ec4*/      muls r0, r5, r0
/*0x6ec6*/      lsrs r0, r0, #3
/*0x6ec8*/      strb r0, [r4], #1
            jump_6ecc:
/*0x6ecc*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6ece*/      uxtb r2, r2
/*0x6ed0*/      bhs jump_6ec0
/*0x6ed2*/      pop {r3, r4, r5, pc}

            data_6ed4:
/*0x6ed4*/  .word 0x2000008c


            .thumb_func
            call_6ed8:
/*0x6ed8*/      mov.w r1, #0x8000
/*0x6edc*/      cmp r0, r1
/*0x6ede*/      blo jump_6ee4
/*0x6ee0*/      and.w r0, r1, r0, lsr #10
            jump_6ee4:
/*0x6ee4*/      uxth r0, r0
/*0x6ee6*/      bx lr

            .thumb_func
            call_6ee8:
/*0x6ee8*/      ldr r2, [pc, #0x14] /* data_6f00 */
/*0x6eea*/      push {lr}
/*0x6eec*/      ldr r0, [r2]
/*0x6eee*/      cbz r0, jump_6efa
/*0x6ef0*/      bl call_6ed8
/*0x6ef4*/      movs r1, #0x1e
/*0x6ef6*/      str r1, [r2]
/*0x6ef8*/      pop {pc}
            jump_6efa:
/*0x6efa*/      movs r0, #0x1e
/*0x6efc*/      pop {pc}

/*0x6efe*/  .byte 0x0
/*0x6eff*/  .byte 0x0

            data_6f00:
/*0x6f00*/  .word 0x200019d0


            .thumb_func
            call_6f04:
/*0x6f04*/      lsls r1, r0, #0x10
/*0x6f06*/      bpl jump_6f0a
/*0x6f08*/      lsls r0, r0, #0xa
            jump_6f0a:
/*0x6f0a*/      bx lr

            .thumb_func
            call_6f0c:
/*0x6f0c*/      ldr r0, [pc, #0x3c] /* data_6f4c */
/*0x6f0e*/      push {r4, lr}
/*0x6f10*/      ldrb r0, [r0]
/*0x6f12*/      and r0, r0, #3
/*0x6f16*/      add.w r0, r0, r0, lsl #1
/*0x6f1a*/      lsls r4, r0, #3
/*0x6f1c*/      ldr r0, [pc, #0x30] /* data_6f50 */
/*0x6f1e*/      ldr r0, [r0]
/*0x6f20*/      bl call_4a1e
/*0x6f24*/      mov r3, r0
/*0x6f26*/      movs r0, #0x18
/*0x6f28*/      ldr r1, [pc, #0x28] /* data_6f54 */
/*0x6f2a*/      b jump_6f42
            jump_6f2c:
/*0x6f2c*/      add.w r2, r1, r4, lsl #1
/*0x6f30*/      ldrh r2, [r2, #0x28]
/*0x6f32*/      ubfx r2, r2, #0, #0xa
/*0x6f36*/      cmp r2, r3
/*0x6f38*/      bne jump_6f3e
/*0x6f3a*/      mov r0, r4
/*0x6f3c*/      pop {r4, pc}
            jump_6f3e:
/*0x6f3e*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x6f40*/      uxtb r4, r4
            jump_6f42:
/*0x6f42*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6f44*/      uxtb r0, r0
/*0x6f46*/      bhs jump_6f2c
/*0x6f48*/      movs r0, #0x60
/*0x6f4a*/      pop {r4, pc}

            data_6f4c:
/*0x6f4c*/  .word 0x20000001
            data_6f50:
/*0x6f50*/  .word 0x20000030
            data_6f54:
/*0x6f54*/  .word 0x20000730


            .thumb_func
            call_6f58:
/*0x6f58*/      ldr r0, [pc, #0xc] /* data_6f68 */
/*0x6f5a*/      movs r1, #0
/*0x6f5c*/      str r1, [r0, #0xa]!
/*0x6f60*/      str r1, [r0, #4]
/*0x6f62*/      strh r1, [r0, #8]
/*0x6f64*/      bx lr

/*0x6f66*/  .byte 0x0
/*0x6f67*/  .byte 0x0

            data_6f68:
/*0x6f68*/  .word 0x200001ac


            .thumb_func
            call_6f6c:
/*0x6f6c*/      push {r4, r5, r6, lr}
/*0x6f6e*/      ldr r4, [pc, #0x68] /* data_6fd8 */
/*0x6f70*/      ldr r1, [pc, #0x68] /* data_6fdc */
/*0x6f72*/      movs r0, #0x60
/*0x6f74*/      strb r0, [r4, #2]
/*0x6f76*/      ldrb r0, [r1, #1]
/*0x6f78*/      lsls r0, r0, #0x1f
/*0x6f7a*/      beq jump_6f8a
/*0x6f7c*/      ldrb r0, [r1, #2]
/*0x6f7e*/      movs r1, #0
/*0x6f80*/      bl call_46f4
/*0x6f84*/      cmp r0, #0
/*0x6f86*/      beq jump_6fd6
/*0x6f88*/      b jump_6f9e
            jump_6f8a:
/*0x6f8a*/      movs r0, #2
/*0x6f8c*/      ldr r2, [pc, #0x50] /* data_6fe0 */
/*0x6f8e*/      ldrb r1, [r1]
/*0x6f90*/      b jump_6f98
            jump_6f92:
/*0x6f92*/      ldrb r3, [r2, r0]
/*0x6f94*/      cmp r1, r3
/*0x6f96*/      beq jump_6fd6
            jump_6f98:
/*0x6f98*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6f9a*/      uxtb r0, r0
/*0x6f9c*/      bhs jump_6f92
            jump_6f9e:
/*0x6f9e*/      bl call_5b48
/*0x6fa2*/      cmp r0, #0
/*0x6fa4*/      bne jump_6fd6
/*0x6fa6*/      ldr r0, [pc, #0x3c] /* data_6fe4 */
/*0x6fa8*/      ldr r2, [pc, #0x3c] /* data_6fe8 */
/*0x6faa*/      ldr r3, [pc, #0x40] /* data_6fec */
/*0x6fac*/      ldrb r0, [r0]
/*0x6fae*/      and r0, r0, #3
/*0x6fb2*/      add.w r0, r0, r0, lsl #1
/*0x6fb6*/      lsls r0, r0, #3
/*0x6fb8*/      strb r0, [r4, #2]
/*0x6fba*/      movs r0, #0x18
/*0x6fbc*/      b jump_6fd0
            jump_6fbe:
/*0x6fbe*/      ldrb r1, [r4, #2]
/*0x6fc0*/      add.w r5, r2, r1, lsl #1
/*0x6fc4*/      ldrh r5, [r5, #0x28]
/*0x6fc6*/      cmp.w r3, r5, lsl #22
/*0x6fca*/      beq jump_6fd6
/*0x6fcc*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x6fce*/      strb r1, [r4, #2]
            jump_6fd0:
/*0x6fd0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6fd2*/      uxtb r0, r0
/*0x6fd4*/      bhs jump_6fbe
            jump_6fd6:
/*0x6fd6*/      pop {r4, r5, r6, pc}

            data_6fd8:
/*0x6fd8*/  .word 0x200019cc
            data_6fdc:
/*0x6fdc*/  .word 0x20000030
            data_6fe0:
/*0x6fe0*/  .word 0x7aa0
            data_6fe4:
/*0x6fe4*/  .word 0x20000001
            data_6fe8:
/*0x6fe8*/  .word 0x20000730
            data_6fec:
/*0x6fec*/  .word 0xffc00000

            jump_6ff0:
/*0x6ff0*/      push {r3, r4, r5, lr}
/*0x6ff2*/      ldr r1, [pc, #0xa0] /* data_7094 */
/*0x6ff4*/      ldr r2, [pc, #0xa0] /* data_7098 */
/*0x6ff6*/      ldrh r0, [r1]
/*0x6ff8*/      ldr r2, [r2]
/*0x6ffa*/      add.w r4, r2, r0, lsl #2
/*0x6ffe*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7000*/      strh r0, [r1]
/*0x7002*/      ldrb r0, [r4, #1]
/*0x7004*/      movs r1, #4
/*0x7006*/      cmp.w r1, r0, lsr #5
/*0x700a*/      beq jump_7088
/*0x700c*/      movs r0, #0
/*0x700e*/      str r0, [sp]
/*0x7010*/      ldrh r0, [r4]
/*0x7012*/      mov r1, sp
/*0x7014*/      bl call_4a14
/*0x7018*/      ldrb r0, [r4, #1]
/*0x701a*/      lsrs r0, r0, #5
/*0x701c*/      cmp r0, #1
/*0x701e*/      beq jump_7026
/*0x7020*/      cmp r0, #2
/*0x7022*/      bne jump_703c
/*0x7024*/      b jump_7030
            jump_7026:
/*0x7026*/      ldrb.w r0, [sp, #3]
/*0x702a*/      orr r0, r0, #2
/*0x702e*/      b jump_7038
            jump_7030:
/*0x7030*/      ldrb.w r0, [sp, #3]
/*0x7034*/      bic r0, r0, #2
            jump_7038:
/*0x7038*/      strb.w r0, [sp, #3]
            jump_703c:
/*0x703c*/      ldrb.w r0, [sp, #1]
/*0x7040*/      lsls r0, r0, #0x1f
/*0x7042*/      ldrb.w r0, [sp]
/*0x7046*/      beq jump_704e
/*0x7048*/      bl call_46d4
/*0x704c*/      b jump_7052
            jump_704e:
/*0x704e*/      ldr r1, [pc, #0x4c] /* data_709c */
/*0x7050*/      ldrb r0, [r1, r0]
            jump_7052:
/*0x7052*/      strb.w r0, [sp, #2]
/*0x7056*/      ldrb.w r0, [sp, #3]
/*0x705a*/      orr r0, r0, #5
/*0x705e*/      strb.w r0, [sp, #3]
/*0x7062*/      ldrb.w r1, [sp, #1]
/*0x7066*/      ldrb.w r2, [sp, #2]
/*0x706a*/      and r1, r1, #1
/*0x706e*/      add.w r1, r1, r1, lsl #2
/*0x7072*/      add.w r1, r2, r1, lsl #1
/*0x7076*/      ubfx r2, r0, #1, #1
/*0x707a*/      uxtb r1, r1
/*0x707c*/      ldr r0, [pc, #0x20] /* data_70a0 */
/*0x707e*/      bl call_3fa8
/*0x7082*/      ldr r0, [sp]
/*0x7084*/      bl call_4780
            jump_7088:
/*0x7088*/      ldrh r0, [r4, #2]
/*0x708a*/      bl call_6f04
/*0x708e*/      ldr r1, [pc, #0x14] /* data_70a4 */
/*0x7090*/      str r0, [r1]
/*0x7092*/      pop {r3, r4, r5, pc}

            data_7094:
/*0x7094*/  .word 0x200019cc
            data_7098:
/*0x7098*/  .word 0x20000058
            data_709c:
/*0x709c*/  .word 0x200001c0
            data_70a0:
/*0x70a0*/  .word 0x200001b6
            data_70a4:
/*0x70a4*/  .word 0x20000060

            jump_70a8:
/*0x70a8*/      push {r4, r5, r6, lr}
/*0x70aa*/      ldr r5, [pc, #0x60] /* data_710c */
/*0x70ac*/      ldrh r0, [r5]
/*0x70ae*/      cmp r0, #0xff
/*0x70b0*/      bls jump_70ba
/*0x70b2*/      movs r0, #1
/*0x70b4*/      adds r1, r5, #4
/*0x70b6*/      strb r0, [r1, #7]
/*0x70b8*/      b jump_70c8
            jump_70ba:
/*0x70ba*/      ldr r6, [pc, #0x54] /* data_7110 */
/*0x70bc*/      ldrb r1, [r6, #1]
/*0x70be*/      lsls r1, r1, #0x1f
/*0x70c0*/      beq jump_70cc
/*0x70c2*/      ldrb r1, [r6]
/*0x70c4*/      cmp r1, #0xc0
/*0x70c6*/      bhs jump_70cc
            jump_70c8:
/*0x70c8*/      movs r0, #1
/*0x70ca*/      pop {r4, r5, r6, pc}
            jump_70cc:
/*0x70cc*/      ldr r1, [pc, #0x44] /* data_7114 */
/*0x70ce*/      ldr r1, [r1]
/*0x70d0*/      add.w r4, r1, r0, lsl #2
/*0x70d4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x70d6*/      strh r0, [r5]
/*0x70d8*/      ldr r0, [r6]
/*0x70da*/      bl call_4a1e
/*0x70de*/      strh r0, [r4]
/*0x70e0*/      ldrb r1, [r6, #3]
/*0x70e2*/      lsls r1, r1, #0x1e
/*0x70e4*/      bpl jump_70ec
/*0x70e6*/      add.w r0, r0, #0x3c00
/*0x70ea*/      b jump_70f0
            jump_70ec:
/*0x70ec*/      add.w r0, r0, #0x5c00
            jump_70f0:
/*0x70f0*/      strh r0, [r4]
/*0x70f2*/      ldrh r0, [r5]
/*0x70f4*/      cmp r0, #1
/*0x70f6*/      bls jump_7100
/*0x70f8*/      bl call_6ee8
/*0x70fc*/      strh r0, [r4, #-0x2]
            jump_7100:
/*0x7100*/      ldr r1, [pc, #0x14] /* data_7118 */
/*0x7102*/      mov.w r0, #-1
/*0x7106*/      str r0, [r1]
/*0x7108*/      movs r0, #0
/*0x710a*/      pop {r4, r5, r6, pc}

            data_710c:
/*0x710c*/  .word 0x200019cc
            data_7110:
/*0x7110*/  .word 0x20000030
            data_7114:
/*0x7114*/  .word 0x20000058
            data_7118:
/*0x7118*/  .word 0x20000060

            jump_711c:
/*0x711c*/      push {r4, lr}
/*0x711e*/      ldr r4, [pc, #0x18] /* data_7138 */
/*0x7120*/      movs r1, #0
/*0x7122*/      ldrb r0, [r4, #2]
/*0x7124*/      bl call_3d90
/*0x7128*/      movs r0, #0
/*0x712a*/      adds r1, r4, #4
/*0x712c*/      strh r0, [r4]
/*0x712e*/      str r0, [r1]
/*0x7130*/      movs r0, #4
/*0x7132*/      strb r0, [r1, #7]
/*0x7134*/      pop {r4, pc}

/*0x7136*/  .byte 0x0
/*0x7137*/  .byte 0x0

            data_7138:
/*0x7138*/  .word 0x200019cc


            .thumb_func
            call_713c:
/*0x713c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7140*/      ldr r4, [pc, #0xa0] /* data_71e4 */
/*0x7142*/      ldr r5, [pc, #0xa4] /* data_71e8 */
/*0x7144*/      ldr.w r8, [pc, #0xa4] /* data_71ec */
/*0x7148*/      ldr r7, [pc, #0xa4] /* data_71f0 */
/*0x714a*/      movs r6, #0xa
            jump_714c:
/*0x714c*/      ldrd r0, r1, [r5]
/*0x7150*/      str r1, [r0, #0x28]
/*0x7152*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x7154*/      uxtb r6, r6
/*0x7156*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x7158*/      nop 
/*0x715a*/      nop 
/*0x715c*/      movs r0, #0xff
/*0x715e*/      ldr r1, [r7, #0x1c]
/*0x7160*/      lsls r1, r1, #0x16
/*0x7162*/      bmi jump_7166
/*0x7164*/      movs r0, #0xfe
            jump_7166:
/*0x7166*/      ldr.w r2, [r8, #0x1c]
/*0x716a*/      mov r1, r8
/*0x716c*/      lsls r2, r2, #0x1a
/*0x716e*/      bmi jump_7174
/*0x7170*/      bic r0, r0, #2
            jump_7174:
/*0x7174*/      ldr r2, [r1, #0x1c]
/*0x7176*/      lsls r2, r2, #0x19
/*0x7178*/      bmi jump_717e
/*0x717a*/      bic r0, r0, #4
            jump_717e:
/*0x717e*/      ldr r1, [r1, #0x1c]
/*0x7180*/      lsls r1, r1, #0x18
/*0x7182*/      bmi jump_7188
/*0x7184*/      bic r0, r0, #8
            jump_7188:
/*0x7188*/      ldr r1, [r7, #0x1c]
/*0x718a*/      lsls r1, r1, #0x14
/*0x718c*/      bmi jump_7192
/*0x718e*/      bic r0, r0, #0x10
            jump_7192:
/*0x7192*/      ldr r1, [r7, #0x1c]
/*0x7194*/      lsls r1, r1, #0x12
/*0x7196*/      bmi jump_719c
/*0x7198*/      bic r0, r0, #0x20
            jump_719c:
/*0x719c*/      ldr r1, [r7, #0x1c]
/*0x719e*/      lsls r1, r1, #0x11
/*0x71a0*/      bmi jump_71a6
/*0x71a2*/      bic r0, r0, #0x40
            jump_71a6:
/*0x71a6*/      ldr r1, [r7, #0x1c]
/*0x71a8*/      lsls r1, r1, #0x10
/*0x71aa*/      bmi jump_71b0
/*0x71ac*/      bic r0, r0, #0x80
            jump_71b0:
/*0x71b0*/      ldrd r1, r2, [r5]
/*0x71b4*/      str r2, [r1, #0x24]
/*0x71b6*/      ldrb r1, [r4, #1]
/*0x71b8*/      cmp r1, r0
/*0x71ba*/      beq jump_71c2
/*0x71bc*/      strb r0, [r4, #1]
/*0x71be*/      movs r0, #3
/*0x71c0*/      b jump_71ce
            jump_71c2:
/*0x71c2*/      ldrb r0, [r4]
/*0x71c4*/      cbz r0, jump_71d0
/*0x71c6*/      cmp r0, #1
/*0x71c8*/      bne jump_71cc
/*0x71ca*/      strb r1, [r4, #2]
            jump_71cc:
/*0x71cc*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_71ce:
/*0x71ce*/      strb r0, [r4]
            jump_71d0:
/*0x71d0*/      cmp r6, #0
/*0x71d2*/      beq jump_71de
/*0x71d4*/      movs r0, #5
/*0x71d6*/      bl spin_wait_maybe
/*0x71da*/      subs r5, #8
/*0x71dc*/      b jump_714c
            jump_71de:
/*0x71de*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x71e2*/  .byte 0x0
/*0x71e3*/  .byte 0x0

            data_71e4:
/*0x71e4*/  .word 0x2000032e
            data_71e8:
/*0x71e8*/  .word 0x7cb0
            data_71ec:
/*0x71ec*/  .word 0x400b0000
            data_71f0:
/*0x71f0*/  .word 0x400b4000

            jump_71f4:
/*0x71f4*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x71f6*/      ldr r0, [pc, #0x44] /* data_723c */
/*0x71f8*/      ldr r0, [r0]
/*0x71fa*/      ldr r1, [pc, #0x44] /* data_7240 */
/*0x71fc*/      ldr r6, [pc, #0x44] /* data_7244 */
/*0x71fe*/      udiv r4, r0, r1
/*0x7202*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x7204*/      strh.w r4, [sp]
/*0x7208*/      movs r5, #0
/*0x720a*/      strh.w r5, [sp, #2]
/*0x720e*/      mov r1, sp
/*0x7210*/      mov r0, r6
/*0x7212*/      bl call_461a
/*0x7216*/      strb.w r5, [sp]
/*0x721a*/      movs r0, #7
/*0x721c*/      strh.w r0, [sp, #2]
/*0x7220*/      movs r0, #1
/*0x7222*/      strb.w r0, [sp, #4]
/*0x7226*/      strb.w r5, [sp, #5]
/*0x722a*/      lsrs r0, r4, #1
/*0x722c*/      strh.w r0, [sp, #6]
/*0x7230*/      mov r1, sp
/*0x7232*/      mov r0, r6
/*0x7234*/      bl call_45c2
/*0x7238*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x723a*/  .byte 0x0
/*0x723b*/  .byte 0x0

            data_723c:
/*0x723c*/  .word 0x20000010
            data_7240:
/*0x7240*/  .word 0xdbba00
            data_7244:
/*0x7244*/  .word 0x4006f000


            .thumb_func
            call_7248:
/*0x7248*/      push {r4, lr}
/*0x724a*/      ldr r1, [pc, #0x28] /* data_7274 */
/*0x724c*/      mov.w r4, #0x8000
/*0x7250*/      str r4, [r1, #0x28]
/*0x7252*/      nop 
/*0x7254*/      nop 
/*0x7256*/      str r4, [r1, #0x24]
/*0x7258*/      mov.w r2, #0x4000
/*0x725c*/      b jump_7268
            jump_725e:
/*0x725e*/      str r2, [r1, #0x28]
/*0x7260*/      nop 
/*0x7262*/      nop 
/*0x7264*/      str r2, [r1, #0x24]
/*0x7266*/      nop 
            jump_7268:
/*0x7268*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x726a*/      uxtb r0, r0
/*0x726c*/      bhs jump_725e
/*0x726e*/      str r4, [r1, #0x28]
/*0x7270*/      pop {r4, pc}

/*0x7272*/  .byte 0x0
/*0x7273*/  .byte 0x0

            data_7274:
/*0x7274*/  .word 0x400b0000


            .thumb_func
            call_7278:
/*0x7278*/      push {r4, r5, r6, r7, lr}
/*0x727a*/      movs r2, #4
/*0x727c*/      ldr r3, [pc, #0x24] /* data_72a4 */
/*0x727e*/      lsls r4, r2, #0xc
/*0x7280*/      ldr r5, [pc, #0x24] /* data_72a8 */
/*0x7282*/      movw r6, #0xffff
/*0x7286*/      b jump_729c
            jump_7288:
/*0x7288*/      nop 
/*0x728a*/      str r4, [r5, #0x28]
/*0x728c*/      lsls r7, r0, #0x10
/*0x728e*/      bpl jump_7294
/*0x7290*/      str r2, [r3, #0x24]
/*0x7292*/      b jump_7296
            jump_7294:
/*0x7294*/      str r2, [r3, #0x28]
            jump_7296:
/*0x7296*/      str r4, [r5, #0x24]
/*0x7298*/      and.w r0, r6, r0, lsl #1
            jump_729c:
/*0x729c*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x729e*/      uxtb r1, r1
/*0x72a0*/      bhs jump_7288
/*0x72a2*/      pop {r4, r5, r6, r7, pc}

            data_72a4:
/*0x72a4*/  .word 0x400b4000
            data_72a8:
/*0x72a8*/  .word 0x400b0000

/*0x72ac*/  .byte 0x1
/*0x72ad*/  .byte 0x21
/*0x72ae*/  .byte 0x81
/*0x72af*/  .byte 0x40
/*0x72b0*/  .byte 0x2
/*0x72b1*/  .byte 0x48
/*0x72b2*/  .byte 0x82
/*0x72b3*/  .byte 0x79
/*0x72b4*/  .byte 0x11
/*0x72b5*/  .byte 0x43
/*0x72b6*/  .byte 0x81
/*0x72b7*/  .byte 0x71
/*0x72b8*/  .byte 0x70
/*0x72b9*/  .byte 0x47
/*0x72ba*/  .byte 0x0
/*0x72bb*/  .byte 0x0
/*0x72bc*/  .byte 0x34
/*0x72bd*/  .byte 0x0
/*0x72be*/  .byte 0x0
/*0x72bf*/  .byte 0x20


            .thumb_func
            function_130_1:
/*0x72c0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x72c4*/      ldr r0, [pc, #0xdc] /* data_73a4 */
/*0x72c6*/      ldrb r1, [r0]
/*0x72c8*/      movs r4, #0
/*0x72ca*/      sub.w r5, r0, #0xa
/*0x72ce*/      cmp r1, #1
/*0x72d0*/      bne jump_72de
/*0x72d2*/      strb r4, [r0]
/*0x72d4*/      ldrb r0, [r5, #0x10]
/*0x72d6*/      and r0, r0, #7
/*0x72da*/      bl call_5c00
            jump_72de:
/*0x72de*/      ldr r6, [pc, #0xc8] /* data_73a8 */
/*0x72e0*/      ldr r7, [pc, #0xc8] /* data_73ac */
/*0x72e2*/      ldrb r0, [r6]
/*0x72e4*/      cbz r0, jump_72f2
/*0x72e6*/      cmp r0, #2
/*0x72e8*/      beq jump_731c
/*0x72ea*/      cmp r0, #4
/*0x72ec*/      beq jump_72f2
/*0x72ee*/      cmp r0, #5
/*0x72f0*/      bne jump_732e
            jump_72f2:
/*0x72f2*/      ldrb r0, [r5, #6]
/*0x72f4*/      lsls r0, r0, #0x1b
/*0x72f6*/      bpl jump_732e
/*0x72f8*/      movs r0, #1
/*0x72fa*/      strb r0, [r6]
/*0x72fc*/      movs r2, #0x40
/*0x72fe*/      ldr r1, [pc, #0xb0] /* data_73b0 */
/*0x7300*/      movs r0, #4
/*0x7302*/      bl usb_recv
/*0x7306*/      ldr r2, [pc, #0xa8] /* data_73b0 */
/*0x7308*/      rsb.w r1, r0, #0x40
/*0x730c*/      add r0, r2
/*0x730e*/      bl mem_zero
/*0x7312*/      ldrb r0, [r5, #6]
/*0x7314*/      bic r0, r0, #0x10
/*0x7318*/      strb r0, [r5, #6]
/*0x731a*/      b jump_732e
            jump_731c:
/*0x731c*/      ldr r0, [r7, #0x50]
/*0x731e*/      lsls r0, r0, #0x1e
/*0x7320*/      bpl jump_732e
/*0x7322*/      movs r2, #0x40
/*0x7324*/      ldr r1, [pc, #0x88] /* data_73b0 */
/*0x7326*/      movs r0, #3
/*0x7328*/      bl usb_copy_send
/*0x732c*/      strb r4, [r6]
            jump_732e:
/*0x732e*/      ldr r0, [r7, #0x28]
/*0x7330*/      lsls r0, r0, #0x1e
/*0x7332*/      bpl jump_7364
/*0x7334*/      ldrb r0, [r5]
/*0x7336*/      cbz r0, jump_733c
/*0x7338*/      strb r4, [r5]
/*0x733a*/      b jump_7358
            jump_733c:
/*0x733c*/      ldr r1, [pc, #0x74] /* data_73b4 */
/*0x733e*/      ldr r0, [r1]
/*0x7340*/      cbnz r0, jump_7364
/*0x7342*/      add.w r0, r1, #0xc
/*0x7346*/      ldr r0, [r0]
/*0x7348*/      cbz r0, jump_7364
/*0x734a*/      mov.w r2, #0xfa0
/*0x734e*/      muls r0, r2, r0
/*0x7350*/      asrs r2, r2, #3
/*0x7352*/      udiv r0, r0, r2
/*0x7356*/      str r0, [r1]
            jump_7358:
/*0x7358*/      ldr r1, [pc, #0x48] /* data_73a4 */
/*0x735a*/      movs r2, #8
/*0x735c*/      adds r1, #0x12
/*0x735e*/      movs r0, #1
/*0x7360*/      bl usb_copy_send
            jump_7364:
/*0x7364*/      ldr r0, [r7, #0x3c]
/*0x7366*/      lsls r0, r0, #0x1e
/*0x7368*/      bpl jump_739e
/*0x736a*/      ldrb r0, [r5, #2]
/*0x736c*/      cbz r0, jump_7378
/*0x736e*/      ldr r1, [pc, #0x34] /* data_73a4 */
/*0x7370*/      movs r2, #5
/*0x7372*/      strb r4, [r5, #2]
/*0x7374*/      adds r1, #0xa
/*0x7376*/      b jump_7394
            jump_7378:
/*0x7378*/      ldrb r0, [r5, #1]
/*0x737a*/      cbz r0, jump_7386
/*0x737c*/      ldr r1, [pc, #0x24] /* data_73a4 */
/*0x737e*/      movs r2, #2
/*0x7380*/      strb r4, [r5, #1]
/*0x7382*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x7384*/      b jump_7394
            jump_7386:
/*0x7386*/      ldrb r0, [r5, #3]
/*0x7388*/      cmp r0, #0
/*0x738a*/      beq jump_739e
/*0x738c*/      ldr r1, [pc, #0x24] /* data_73b4 */
/*0x738e*/      movs r2, #0x1f
/*0x7390*/      strb r4, [r5, #3]
/*0x7392*/      adds r1, #0x18
            jump_7394:
/*0x7394*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x7398*/      movs r0, #2
/*0x739a*/      b.w usb_copy_send
            jump_739e:
/*0x739e*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x73a2*/  .byte 0x0
/*0x73a3*/  .byte 0x0

            data_73a4:
/*0x73a4*/  .word 0x2000003e
            data_73a8:
/*0x73a8*/  .word 0x20000028
            data_73ac:
/*0x73ac*/  .word 0x400a8000
            data_73b0:
/*0x73b0*/  .word 0x20000608
            data_73b4:
/*0x73b4*/  .word 0x200006bc


            .thumb_func
            function_unused_1:
/*0x73b8*/      push {r4, r5, r6, r7, lr}
/*0x73ba*/      ldrh r1, [r0]
/*0x73bc*/      mov.w r6, #0x100
/*0x73c0*/      movw r5, #0x921
/*0x73c4*/      lsls r7, r6, #1
/*0x73c6*/      movs r3, #1
/*0x73c8*/      ldr r4, [pc, #0xd4] /* data_74a0 */
/*0x73ca*/      subw r2, r1, #0x921
/*0x73ce*/      cmp r1, r5
/*0x73d0*/      beq jump_744c
/*0x73d2*/      bgt jump_73f0
/*0x73d4*/      adds.w r1, r2, #0x780
/*0x73d8*/      beq jump_7402
/*0x73da*/      cmp r1, r6
/*0x73dc*/      beq jump_7440
/*0x73de*/      cmp r1, r7
/*0x73e0*/      bne jump_746e
/*0x73e2*/      ldrh r1, [r0, #4]
/*0x73e4*/      cmp r1, #0
/*0x73e6*/      bne jump_746e
/*0x73e8*/      ldr r1, [pc, #0xb8] /* data_74a4 */
/*0x73ea*/      strd r1, r3, [r0, #0x1c]
/*0x73ee*/      b jump_7498
            jump_73f0:
/*0x73f0*/      movs r5, #0
/*0x73f2*/      cmp r2, r6
/*0x73f4*/      beq jump_7472
/*0x73f6*/      cmp r2, r7
/*0x73f8*/      bne jump_746e
/*0x73fa*/      ldrh r2, [r0, #4]
/*0x73fc*/      ldrb r1, [r0, #2]
/*0x73fe*/      cbz r2, jump_7470
/*0x7400*/      b jump_7496
            jump_7402:
/*0x7402*/      ldrb r5, [r0, #3]
/*0x7404*/      ldrb r2, [r0, #2]
/*0x7406*/      ldrh r4, [r0, #6]
/*0x7408*/      ldrh r1, [r0, #4]
/*0x740a*/      cmp r5, #1
/*0x740c*/      bne jump_746e
/*0x740e*/      cbz r1, jump_742a
/*0x7410*/      cmp r1, #1
/*0x7412*/      beq jump_746e
/*0x7414*/      cmp r1, #2
/*0x7416*/      bne jump_746e
/*0x7418*/      cmp r2, #1
/*0x741a*/      beq jump_7430
/*0x741c*/      cmp r2, #2
/*0x741e*/      beq jump_743a
/*0x7420*/      cmp r2, #4
/*0x7422*/      bne jump_746e
/*0x7424*/      ldr r1, [pc, #0x78] /* data_74a0 */
/*0x7426*/      adds r1, #0xc
/*0x7428*/      b jump_7434
            jump_742a:
/*0x742a*/      ldr r1, [pc, #0x78] /* data_74a4 */
/*0x742c*/      adds r1, #0x18
/*0x742e*/      b jump_7434
            jump_7430:
/*0x7430*/      ldr r1, [pc, #0x70] /* data_74a4 */
/*0x7432*/      .short 0x1d09 /* adds r1, r1, #4 */ 
            jump_7434:
/*0x7434*/      strd r1, r4, [r0, #0x1c]
/*0x7438*/      b jump_7498
            jump_743a:
/*0x743a*/      ldr r1, [pc, #0x68] /* data_74a4 */
/*0x743c*/      adds r1, #0x10
/*0x743e*/      b jump_7434
            jump_7440:
/*0x7440*/      ldrh r1, [r0, #4]
/*0x7442*/      cmp r1, #0
/*0x7444*/      bne jump_746e
/*0x7446*/      strd r4, r3, [r0, #0x1c]
/*0x744a*/      b jump_7498
            jump_744c:
/*0x744c*/      ldrb r3, [r0, #3]
/*0x744e*/      ldrh r2, [r0, #6]
/*0x7450*/      ldrh r1, [r0, #4]
/*0x7452*/      str r2, [r0, #0x20]
/*0x7454*/      cmp r3, #2
/*0x7456*/      bne jump_746e
/*0x7458*/      cmp r1, #0
/*0x745a*/      bne jump_746e
/*0x745c*/      ldr r2, [pc, #0x44] /* data_74a4 */
/*0x745e*/      adds r2, #0xc
/*0x7460*/      str r2, [r0, #0x1c]
/*0x7462*/      ldr r2, [pc, #0x44] /* data_74a8 */
/*0x7464*/      strd r2, r1, [r0, #0x28]
/*0x7468*/      movs r1, #2
/*0x746a*/      strb.w r1, [r0, #0x24]
            jump_746e:
/*0x746e*/      pop {r4, r5, r6, r7, pc}
            jump_7470:
/*0x7470*/      b jump_7490
            jump_7472:
/*0x7472*/      ldrh r2, [r0, #4]
/*0x7474*/      ldrb r1, [r0, #3]
/*0x7476*/      cmp r2, #0
/*0x7478*/      bne jump_746e
/*0x747a*/      mov.w r2, #0xfa0
/*0x747e*/      str r1, [r4]
/*0x7480*/      muls r1, r2, r1
/*0x7482*/      asrs r2, r2, #3
/*0x7484*/      udiv r1, r1, r2
/*0x7488*/      ldr r2, [pc, #0x14] /* data_74a0 */
/*0x748a*/      subs r2, #0xc
/*0x748c*/      str r1, [r2]
/*0x748e*/      b jump_7496
            jump_7490:
/*0x7490*/      ldr r2, [pc, #0x10] /* data_74a4 */
/*0x7492*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x7494*/      strb r1, [r2, #4]
            jump_7496:
/*0x7496*/      str r5, [r0, #0x20]
            jump_7498:
/*0x7498*/      strb.w r3, [r0, #0x24]
/*0x749c*/      b jump_746e

/*0x749e*/  .byte 0x0
/*0x749f*/  .byte 0x0

            data_74a0:
/*0x74a0*/  .word 0x200006c8
            data_74a4:
/*0x74a4*/  .word 0x20000038
            data_74a8:
/*0x74a8*/  .word 0x74ad


            .thumb_func
            function_unused_2:
/*0x74ac*/      ldr r2, [pc, #4] /* data_74b4 */
/*0x74ae*/      movs r1, #1
/*0x74b0*/      strb r1, [r2, r0]
/*0x74b2*/      bx lr

            data_74b4:
/*0x74b4*/  .word 0x2000003e


            .thumb_func
            function_unused_2:
/*0x74b8*/      ldrb r2, [r0, #3]
/*0x74ba*/      ldrh r1, [r0, #4]
/*0x74bc*/      movs r3, #1
/*0x74be*/      cmp r2, #0x21
/*0x74c0*/      beq jump_74d2
/*0x74c2*/      cmp r2, #0x22
/*0x74c4*/      bne jump_750a
/*0x74c6*/      cbz r1, jump_74f4
/*0x74c8*/      cmp r1, #1
/*0x74ca*/      beq jump_74fc
/*0x74cc*/      cmp r1, #2
/*0x74ce*/      bne jump_7506
/*0x74d0*/      b jump_750c
            jump_74d2:
/*0x74d2*/      cbz r1, jump_74de
/*0x74d4*/      cmp r1, #1
/*0x74d6*/      beq jump_74e4
/*0x74d8*/      cmp r1, #2
/*0x74da*/      bne jump_74ea
/*0x74dc*/      b jump_74ee
            jump_74de:
/*0x74de*/      ldr r1, [r0, #0xc]
/*0x74e0*/      adds r1, #9
/*0x74e2*/      b jump_74e8
            jump_74e4:
/*0x74e4*/      ldr r1, [r0, #0xc]
/*0x74e6*/      adds r1, #0x22
            jump_74e8:
/*0x74e8*/      str r1, [r0, #0x1c]
            jump_74ea:
/*0x74ea*/      movs r1, #9
/*0x74ec*/      b jump_7504
            jump_74ee:
/*0x74ee*/      ldr r1, [r0, #0xc]
/*0x74f0*/      adds r1, #0x42
/*0x74f2*/      b jump_74e8
            jump_74f4:
/*0x74f4*/      ldr r1, [pc, #0x20] /* data_7518 */
/*0x74f6*/      str r1, [r0, #0x1c]
/*0x74f8*/      movs r1, #0x40
/*0x74fa*/      b jump_7504
            jump_74fc:
/*0x74fc*/      ldr r1, [pc, #0x18] /* data_7518 */
/*0x74fe*/      subs r1, #0xac
/*0x7500*/      str r1, [r0, #0x1c]
/*0x7502*/      movs r1, #0x22
            jump_7504:
/*0x7504*/      str r1, [r0, #0x20]
            jump_7506:
/*0x7506*/      strb.w r3, [r0, #0x24]
            jump_750a:
/*0x750a*/      bx lr
            jump_750c:
/*0x750c*/      ldr r1, [pc, #8] /* data_7518 */
/*0x750e*/      subs r1, #0x88
/*0x7510*/      str r1, [r0, #0x1c]
/*0x7512*/      movs r1, #0x86
/*0x7514*/      b jump_7504

/*0x7516*/  .byte 0x0
/*0x7517*/  .byte 0x0

            data_7518:
/*0x7518*/  .word 0x8020


            .thumb_func
            call_751c:
/*0x751c*/      push {r4, r5, r6, lr}
/*0x751e*/      mov r4, r0
/*0x7520*/      movs r0, #0
/*0x7522*/      bl usb_get_ep_len
/*0x7526*/      mov r5, r0
/*0x7528*/      ldr r0, [r4, #0x20]
/*0x752a*/      adds r1, r0, #1
/*0x752c*/      beq jump_755c
/*0x752e*/      ldrb.w r1, [r4, #0x24]
/*0x7532*/      cmp r1, #1
/*0x7534*/      bne jump_755c
/*0x7536*/      cmp r0, r5
/*0x7538*/      blo jump_7540
/*0x753a*/      subs r0, r0, r5
/*0x753c*/      str r0, [r4, #0x20]
/*0x753e*/      b jump_754c
            jump_7540:
/*0x7540*/      mov r5, r0
/*0x7542*/      movs r0, #0
/*0x7544*/      str r0, [r4, #0x20]
/*0x7546*/      movs r0, #2
/*0x7548*/      strb.w r0, [r4, #0x24]
            jump_754c:
/*0x754c*/      mov r2, r5
/*0x754e*/      movs r0, #0
/*0x7550*/      ldr r1, [r4, #0x1c]
/*0x7552*/      bl usb_copy_send
/*0x7556*/      ldr r0, [r4, #0x1c]
/*0x7558*/      add r0, r5
/*0x755a*/      str r0, [r4, #0x1c]
            jump_755c:
/*0x755c*/      pop {r4, r5, r6, pc}

/*0x755e*/  .byte 0x0
/*0x755f*/  .byte 0x0


            .thumb_func
            call_7560:
/*0x7560*/      push {r4, lr}
/*0x7562*/      mov r4, r0
/*0x7564*/      movs r0, #0
/*0x7566*/      strb.w r0, [r4, #0x24]
/*0x756a*/      str r0, [r4, #0x20]
/*0x756c*/      ldrb r0, [r4]
/*0x756e*/      ands r0, r0, #0x60
/*0x7572*/      beq jump_757a
/*0x7574*/      cmp r0, #0x20
/*0x7576*/      bne jump_758c
/*0x7578*/      b jump_7582
            jump_757a:
/*0x757a*/      mov r0, r4
/*0x757c*/      bl call_7600
/*0x7580*/      b jump_758c
            jump_7582:
/*0x7582*/      ldr r0, [pc, #0x40] /* data_75c4 */
/*0x7584*/      ldr r1, [r0, #0x14]
/*0x7586*/      cbz r1, jump_758c
/*0x7588*/      mov r0, r4
/*0x758a*/      blx r1
            jump_758c:
/*0x758c*/      ldrb.w r0, [r4, #0x24]
/*0x7590*/      cmp r0, #1
/*0x7592*/      beq jump_75a2
/*0x7594*/      cmp r0, #2
/*0x7596*/      beq jump_75b6
/*0x7598*/      pop.w {r4, lr}
/*0x759c*/      movs r0, #0
/*0x759e*/      b.w function_e_72
            jump_75a2:
/*0x75a2*/      ldrh r0, [r4, #6]
/*0x75a4*/      ldr r1, [r4, #0x20]
/*0x75a6*/      cmp r1, r0
/*0x75a8*/      ble jump_75ac
/*0x75aa*/      str r0, [r4, #0x20]
            jump_75ac:
/*0x75ac*/      mov r0, r4
/*0x75ae*/      pop.w {r4, lr}
/*0x75b2*/      b.w call_751c
            jump_75b6:
/*0x75b6*/      movs r2, #0
/*0x75b8*/      pop.w {r4, lr}
/*0x75bc*/      mov r1, r2
/*0x75be*/      mov r0, r2
/*0x75c0*/      b.w usb_copy_send

            data_75c4:
/*0x75c4*/  .word 0x80f8

            jump_75c8:
/*0x75c8*/      push {r4, lr}
/*0x75ca*/      mov r4, r0
/*0x75cc*/      movs r0, #0
/*0x75ce*/      strb r0, [r4, #0x19]
/*0x75d0*/      cbz r1, jump_75e6
/*0x75d2*/      cmp r1, #1
/*0x75d4*/      beq jump_75ea
/*0x75d6*/      cmp r1, #2
/*0x75d8*/      bne jump_75fc
/*0x75da*/      ldrb r0, [r4, #4]
/*0x75dc*/      and r0, r0, #0xf
/*0x75e0*/      bl function_e_67
/*0x75e4*/      b jump_75ea
            jump_75e6:
/*0x75e6*/      ldrb.w r0, [r4, #0x34]
            jump_75ea:
/*0x75ea*/      strb r0, [r4, #0x18]
/*0x75ec*/      add.w r0, r4, #0x18
/*0x75f0*/      str r0, [r4, #0x1c]
/*0x75f2*/      movs r0, #2
/*0x75f4*/      str r0, [r4, #0x20]
/*0x75f6*/      movs r0, #1
/*0x75f8*/      strb.w r0, [r4, #0x24]
            jump_75fc:
/*0x75fc*/      pop {r4, pc}

/*0x75fe*/  .byte 0x0
/*0x75ff*/  .byte 0x0


            .thumb_func
            call_7600:
/*0x7600*/      push {r4, r5, r6, lr}
/*0x7602*/      mov r4, r0
/*0x7604*/      ldrh r0, [r0]
/*0x7606*/      movs r5, #1
/*0x7608*/      cmp.w r0, #0x500
/*0x760c*/      beq jump_76ae
/*0x760e*/      bgt jump_7652
/*0x7610*/      cmp.w r0, #0x100
/*0x7614*/      beq jump_76a0
/*0x7616*/      bgt jump_7630
/*0x7618*/      cmp r0, #0x80
/*0x761a*/      beq jump_7698
/*0x761c*/      cmp r0, #0x81
/*0x761e*/      beq jump_769c
/*0x7620*/      cmp r0, #0x82
/*0x7622*/      bne jump_76f2
/*0x7624*/      movs r1, #2
            jump_7626:
/*0x7626*/      mov r0, r4
/*0x7628*/      pop.w {r4, r5, r6, lr}
/*0x762c*/      b.w jump_75c8
            jump_7630:
/*0x7630*/      cmp.w r0, #0x102
/*0x7634*/      beq jump_76a4
/*0x7636*/      cmp.w r0, #0x300
/*0x763a*/      beq jump_76a8
/*0x763c*/      sub.w r0, r0, #0x300
/*0x7640*/      subs r0, #2
/*0x7642*/      bne jump_76f2
/*0x7644*/      movs r2, #1
            jump_7646:
/*0x7646*/      movs r1, #2
            jump_7648:
/*0x7648*/      mov r0, r4
/*0x764a*/      pop.w {r4, r5, r6, lr}
/*0x764e*/      b.w jump_7728
            jump_7652:
/*0x7652*/      ldr r1, [pc, #0xcc] /* data_7720 */
/*0x7654*/      cmp.w r0, #0x900
/*0x7658*/      beq jump_76f8
/*0x765a*/      bgt jump_767c
/*0x765c*/      cmp.w r0, #0x680
/*0x7660*/      beq jump_76bc
/*0x7662*/      sub.w r0, r0, #0x600
/*0x7666*/      subs r0, #0x81
/*0x7668*/      beq jump_76f4
/*0x766a*/      sub.w r0, r0, #0x100
/*0x766e*/      subs r0, #0xff
/*0x7670*/      bne jump_76f2
/*0x7672*/      add.w r0, r4, #0x30
/*0x7676*/      strd r0, r5, [r4, #0x1c]
/*0x767a*/      b jump_76ee
            jump_767c:
/*0x767c*/      sub.w r0, r0, #0xa00
/*0x7680*/      subs r0, #0x81
/*0x7682*/      beq jump_771a
/*0x7684*/      cmp r0, #0x80
/*0x7686*/      bne jump_76f2
/*0x7688*/      ldr r0, [r1, #0xc]
            jump_768a:
/*0x768a*/      cmp r0, #0
/*0x768c*/      beq jump_76f2
/*0x768e*/      mov r1, r0
/*0x7690*/      mov r0, r4
/*0x7692*/      pop.w {r4, r5, r6, lr}
/*0x7696*/      bx r1
            jump_7698:
/*0x7698*/      movs r1, #0
/*0x769a*/      b jump_7626
            jump_769c:
/*0x769c*/      movs r1, #1
/*0x769e*/      b jump_7626
            jump_76a0:
/*0x76a0*/      movs r2, #0
/*0x76a2*/      b jump_76aa
            jump_76a4:
/*0x76a4*/      movs r2, #0
/*0x76a6*/      b jump_7646
            jump_76a8:
/*0x76a8*/      movs r2, #1
            jump_76aa:
/*0x76aa*/      movs r1, #0
/*0x76ac*/      b jump_7648
            jump_76ae:
/*0x76ae*/      ldrb r0, [r4, #2]
/*0x76b0*/      bl call_6c08
/*0x76b4*/      strb.w r5, [r4, #0x24]
/*0x76b8*/      movs r0, #5
/*0x76ba*/      b jump_7714
            jump_76bc:
/*0x76bc*/      ldrb r0, [r4, #3]
/*0x76be*/      cmp r0, #1
/*0x76c0*/      beq jump_76e2
/*0x76c2*/      cmp r0, #2
/*0x76c4*/      beq jump_76e6
/*0x76c6*/      cmp r0, #3
/*0x76c8*/      bne jump_76f2
/*0x76ca*/      ldrb r0, [r4, #2]
/*0x76cc*/      ldr r1, [r4, #0x14]
/*0x76ce*/      cmp r1, r0
/*0x76d0*/      bls jump_76f2
/*0x76d2*/      ldr r1, [r4, #0x10]
/*0x76d4*/      ldr.w r0, [r1, r0, lsl #2]
/*0x76d8*/      cmp r0, #0
/*0x76da*/      beq jump_76f2
            jump_76dc:
/*0x76dc*/      str r0, [r4, #0x1c]
/*0x76de*/      ldrb r0, [r0]
/*0x76e0*/      b jump_76ec
            jump_76e2:
/*0x76e2*/      ldr r0, [r4, #8]
/*0x76e4*/      b jump_76dc
            jump_76e6:
/*0x76e6*/      ldr r0, [r4, #0xc]
/*0x76e8*/      str r0, [r4, #0x1c]
/*0x76ea*/      ldrh r0, [r0, #2]
            jump_76ec:
/*0x76ec*/      str r0, [r4, #0x20]
            jump_76ee:
/*0x76ee*/      strb.w r5, [r4, #0x24]
            jump_76f2:
/*0x76f2*/      pop {r4, r5, r6, pc}
            jump_76f4:
/*0x76f4*/      ldr r0, [r1, #8]
/*0x76f6*/      b jump_768a
            jump_76f8:
/*0x76f8*/      ldrb r0, [r4, #2]
/*0x76fa*/      strb.w r0, [r4, #0x30]
/*0x76fe*/      strb.w r5, [r4, #0x24]
/*0x7702*/      movs r5, #1
            jump_7704:
/*0x7704*/      ldr r1, [pc, #0x1c] /* data_7724 */
/*0x7706*/      sxtb r0, r5
/*0x7708*/      bl function_e_70
/*0x770c*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x770e*/      cmp r5, #8
/*0x7710*/      blo jump_7704
/*0x7712*/      movs r0, #6
            jump_7714:
/*0x7714*/      strb.w r0, [r4, #0x32]
/*0x7718*/      pop {r4, r5, r6, pc}
            jump_771a:
/*0x771a*/      ldr r0, [r1, #0x10]
/*0x771c*/      b jump_768a

/*0x771e*/  .byte 0x0
/*0x771f*/  .byte 0x0

            data_7720:
/*0x7720*/  .word 0x80f8
            data_7724:
/*0x7724*/  .word 0x20000168

            jump_7728:
/*0x7728*/      push {r4, r5, r6, lr}
/*0x772a*/      mov r4, r0
/*0x772c*/      movs r6, #1
/*0x772e*/      cbz r1, jump_774a
/*0x7730*/      cmp r1, #2
/*0x7732*/      bne jump_7748
/*0x7734*/      ldrb r0, [r4, #4]
/*0x7736*/      ands r5, r0, #0xf
/*0x773a*/      beq jump_7744
/*0x773c*/      cbz r2, jump_7760
/*0x773e*/      mov r0, r5
/*0x7740*/      bl function_e_73
            jump_7744:
/*0x7744*/      strb.w r6, [r4, #0x24]
            jump_7748:
/*0x7748*/      pop {r4, r5, r6, pc}
            jump_774a:
/*0x774a*/      ldrb r0, [r4, #2]
/*0x774c*/      cmp r0, #1
/*0x774e*/      bne jump_7748
/*0x7750*/      ldrb r0, [r4, #0x34]!
/*0x7754*/      bfi r0, r2, #1, #1
/*0x7758*/      strb r0, [r4], #-0x10
/*0x775c*/      strb r6, [r4]
/*0x775e*/      pop {r4, r5, r6, pc}
            jump_7760:
/*0x7760*/      ldr r0, [r4, #0x38]
/*0x7762*/      cmp r0, #0
/*0x7764*/      bne jump_7744
/*0x7766*/      mov r0, r5
/*0x7768*/      bl usb_ep_stall
/*0x776c*/      mov r0, r5
/*0x776e*/      bl usb_ep_data_toggle
/*0x7772*/      b jump_7744

            .thumb_func
            copy_words:
/*0x7774*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x7776*/      bmi jump_7782
/*0x7778*/      ldr.w r3, [r0, r2, lsl #2]
/*0x777c*/      str.w r3, [r1, r2, lsl #2]
/*0x7780*/      b copy_words
            jump_7782:
/*0x7782*/      bx lr

            .thumb_func
            usb_get_ep_reg:
/*0x7784*/      ldr r1, [pc, #8] /* data_7790 */
/*0x7786*/      add.w r0, r0, r0, lsl #2
/*0x778a*/      add.w r0, r1, r0, lsl #2
/*0x778e*/      bx lr

            data_7790:
/*0x7790*/  .word 0x400a8014


            .thumb_func
            function_130_9:
/*0x7794*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x7798*/      movs r7, #0
/*0x779a*/      mov.w r1, #0x8000
/*0x779e*/      mov r2, r7
/*0x77a0*/      mov sl, r1
/*0x77a2*/      movs r3, #1
/*0x77a4*/      mov r0, r2
/*0x77a6*/      bl ckcu_clocks_enable
/*0x77aa*/      ldr r0, [pc, #0x90] /* data_783c */
/*0x77ac*/      bl call_6654
/*0x77b0*/      ldr r5, [pc, #0x8c] /* data_7840 */
/*0x77b2*/      mov r4, r0
/*0x77b4*/      movw r6, #0xeae0
/*0x77b8*/      cmp r0, #1
/*0x77ba*/      bne jump_77ca
/*0x77bc*/      ldr r0, [r5, #0x54]
/*0x77be*/      orrs r0, r6
/*0x77c0*/      str r0, [r5, #0x54]
/*0x77c2*/      str r6, [r5, #0x58]
/*0x77c4*/      ldr r0, [r5, #0x50]
/*0x77c6*/      orrs r0, r6
/*0x77c8*/      str r0, [r5, #0x50]
            jump_77ca:
/*0x77ca*/      ldr.w r8, [pc, #0x70] /* data_783c */
/*0x77ce*/      ldrb.w r0, [r8, #0x32]
/*0x77d2*/      cmp r0, #3
/*0x77d4*/      bne jump_7814
/*0x77d6*/      ldr.w sb, [pc, #0x6c] /* data_7844 */
/*0x77da*/      ldr.w r0, [sb]
/*0x77de*/      tst.w r0, #0xc0
/*0x77e2*/      beq jump_7814
/*0x77e4*/      movs r0, #1
/*0x77e6*/      bl function_130_10
/*0x77ea*/      ldr r1, [pc, #0x5c] /* data_7848 */
/*0x77ec*/      strb r7, [r1, #5]
/*0x77ee*/      ldrb.w r0, [r8, #0x32]
/*0x77f2*/      cmp r0, #3
/*0x77f4*/      bne jump_7814
/*0x77f6*/      ldr.w r0, [sb]
/*0x77fa*/      tst.w r0, #0xc0
/*0x77fe*/      beq jump_7814
/*0x7800*/      bl watchdog_reload_timer
/*0x7804*/      mov.w r0, #0x3e8
/*0x7808*/      bl spin_wait_maybe
/*0x780c*/      str r6, [r5, #0x58]
/*0x780e*/      movs r0, #0
/*0x7810*/      bl call_5c44
            jump_7814:
/*0x7814*/      ldr r0, [r5, #0x58]
/*0x7816*/      tst r0, r6
/*0x7818*/      beq jump_782c
/*0x781a*/      cmp r4, #1
/*0x781c*/      bne jump_782c
/*0x781e*/      ldr r0, [pc, #0x1c] /* data_783c */
/*0x7820*/      bl call_67e0
/*0x7824*/      cmp r0, #1
/*0x7826*/      bne jump_782c
/*0x7828*/      bl call_67f0
            jump_782c:
/*0x782c*/      mov r2, r7
/*0x782e*/      mov r1, sl
/*0x7830*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x7834*/      movs r3, #0
/*0x7836*/      mov r0, r2
/*0x7838*/      b.w ckcu_clocks_enable

            data_783c:
/*0x783c*/  .word 0x200006f4
            data_7840:
/*0x7840*/  .word 0x40024000
            data_7844:
/*0x7844*/  .word 0x400a8000
            data_7848:
/*0x7848*/  .word 0x20000034


            .thumb_func
            sram_init_func_1:
/*0x784c*/      b jump_7854
            jump_784e:
/*0x784e*/      ldm r0!, {r3}
/*0x7850*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x7852*/      stm r1!, {r3}
            jump_7854:
/*0x7854*/      cmp r2, #0
/*0x7856*/      bne jump_784e
/*0x7858*/      bx lr

/*0x785a*/  .byte 0x70
/*0x785b*/  .byte 0x47


            .thumb_func
            sram_init_func_2:
/*0x785c*/      movs r0, #0
/*0x785e*/      b jump_7864
            jump_7860:
/*0x7860*/      stm r1!, {r0}
/*0x7862*/      .short 0x1f12 /* subs r2, r2, #4 */ 
            jump_7864:
/*0x7864*/      cmp r2, #0
/*0x7866*/      bne jump_7860
/*0x7868*/      bx lr

/*0x786a*/  .byte 0x0
/*0x786b*/  .byte 0x0


            .thumb_func
            main:
/*0x786c*/      bl setup_intr_priority
/*0x7870*/      bl setup_afio_gpio
/*0x7874*/      bl call_57d8
/*0x7878*/      movs r0, #0xff
/*0x787a*/      bl call_3e20
/*0x787e*/      bl call_5fe0
/*0x7882*/      bl call_5c0c
/*0x7886*/      bl call_623c
/*0x788a*/      bl call_4e30
/*0x788e*/      movs r0, #0
/*0x7890*/      bl call_4678
/*0x7894*/      ldr r1, [pc, #0xbc] /* data_7954 */
/*0x7896*/      movs r0, #0
/*0x7898*/      str r0, [r1]
/*0x789a*/      bl call_567c
/*0x789e*/      bl call_56b0
/*0x78a2*/      movs r0, #0
/*0x78a4*/      bl function_130_10
/*0x78a8*/      movs r0, #0xa
/*0x78aa*/      bl spin_wait_maybe
/*0x78ae*/      movs r0, #1
/*0x78b0*/      bl call_5f5c
/*0x78b4*/      bl call_4e3c
/*0x78b8*/      ldr r4, [pc, #0x9c] /* data_7958 */
/*0x78ba*/      cbz r0, jump_78c0
/*0x78bc*/      movs r0, #1
/*0x78be*/      strh r0, [r4, #4]
            jump_78c0:
/*0x78c0*/      ldrh r0, [r4, #4]
/*0x78c2*/      cbz r0, jump_78e8
/*0x78c4*/      bl function_130_16
/*0x78c8*/      bl pinmux_c0_gptm
/*0x78cc*/      movs r0, #0
/*0x78ce*/      bl call_5f5c
            jump_78d2:
/*0x78d2*/      ldrh r0, [r4, #4]
/*0x78d4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x78d6*/      strh r0, [r4, #4]
/*0x78d8*/      bl function_130_15
/*0x78dc*/      movs r0, #1
/*0x78de*/      bl function_130_12
/*0x78e2*/      bl watchdog_reload_timer
/*0x78e6*/      b jump_78d2
            jump_78e8:
/*0x78e8*/      movs r0, #1
/*0x78ea*/      bl function_130_10
/*0x78ee*/      bl usb_init
/*0x78f2*/      ldr r6, [pc, #0x68] /* data_795c */
/*0x78f4*/      ldr r5, [pc, #0x68] /* data_7960 */
            jump_78f6:
/*0x78f6*/      bl function_130_2
/*0x78fa*/      cmp r0, #1
/*0x78fc*/      beq jump_790e
/*0x78fe*/      cmp r0, #2
/*0x7900*/      beq jump_7922
/*0x7902*/      cmp r0, #3
/*0x7904*/      bne jump_794c
/*0x7906*/      movs r0, #1
/*0x7908*/      bl function_130_10
/*0x790c*/      b jump_794c
            jump_790e:
/*0x790e*/      movs r0, #0
/*0x7910*/      bl function_130_10
/*0x7914*/      bl function_130_16
/*0x7918*/      bl pinmux_c0_gptm
/*0x791c*/      movs r0, #0
/*0x791e*/      bl call_5f5c
            jump_7922:
/*0x7922*/      ldrh r0, [r4, #4]
/*0x7924*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7926*/      lsls r0, r0, #0x10
/*0x7928*/      lsrs r0, r0, #0x10
/*0x792a*/      strh r0, [r4, #4]
/*0x792c*/      bne jump_793a
/*0x792e*/      ldr r0, [r5]
/*0x7930*/      cmp r0, r6
/*0x7932*/      bls jump_793a
/*0x7934*/      ldr r0, [r5]
/*0x7936*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7938*/      str r0, [r5]
            jump_793a:
/*0x793a*/      bl handle_frame
/*0x793e*/      bl function_130_15
/*0x7942*/      ldrb r0, [r4]
/*0x7944*/      cbnz r0, jump_794c
/*0x7946*/      movs r0, #1
/*0x7948*/      bl function_130_12
            jump_794c:
/*0x794c*/      bl watchdog_reload_timer
/*0x7950*/      b jump_78f6

/*0x7952*/  .byte 0x0
/*0x7953*/  .byte 0x0

            data_7954:
/*0x7954*/  .word 0x20000030
            data_7958:
/*0x7958*/  .word 0x20000028
            data_795c:
/*0x795c*/  .word 0x55aafaf0
            data_7960:
/*0x7960*/  .word 0x20003ffc


            .thumb_func
            function_130_15:
/*0x7964*/      push {r4, r5, r6, lr}
/*0x7966*/      ldr r6, [pc, #0xc8] /* data_7a30 */
/*0x7968*/      movs r4, #0
/*0x796a*/      ldrb r0, [r6, #3]
/*0x796c*/      cbz r0, jump_7988
/*0x796e*/      movs r0, #1
/*0x7970*/      bl call_4678
/*0x7974*/      cbz r0, jump_7988
/*0x7976*/      ldrb r0, [r6, #3]
/*0x7978*/      cmp r0, #2
/*0x797a*/      beq jump_79b0
/*0x797c*/      bl call_3ea0
            jump_7980:
/*0x7980*/      strb r4, [r6, #3]
/*0x7982*/      movs r0, #1
/*0x7984*/      bl call_567c
            jump_7988:
/*0x7988*/      bl call_51c8
/*0x798c*/      cmp r0, #0
/*0x798e*/      beq jump_7a2c
/*0x7990*/      ldr r5, [pc, #0xa0] /* data_7a34 */
/*0x7992*/      ldrb r0, [r5, #2]
/*0x7994*/      cmp r0, #0x20
/*0x7996*/      blo jump_79a0
/*0x7998*/      subs r0, #0x20
/*0x799a*/      strb r0, [r5, #2]
/*0x799c*/      movs r0, #1
/*0x799e*/      strb r0, [r5, #3]
            jump_79a0:
/*0x79a0*/      ldrb r0, [r5, #1]
/*0x79a2*/      cmp r0, #0xff
/*0x79a4*/      beq jump_79c6
/*0x79a6*/      bl call_4ab0
/*0x79aa*/      cmp r0, #1
/*0x79ac*/      beq jump_79b6
/*0x79ae*/      b jump_79c6
            jump_79b0:
/*0x79b0*/      bl call_3ed0
/*0x79b4*/      b jump_7980
            jump_79b6:
/*0x79b6*/      ldrb r0, [r5, #1]
/*0x79b8*/      bl call_3e20
/*0x79bc*/      movs r0, #0xff
/*0x79be*/      strb r0, [r5, #1]
/*0x79c0*/      movs r0, #2
/*0x79c2*/      bl call_567c
            jump_79c6:
/*0x79c6*/      ldrb r0, [r6, #4]
/*0x79c8*/      cbz r0, jump_79da
/*0x79ca*/      bl call_4ab0
/*0x79ce*/      cmp r0, #1
/*0x79d0*/      bne jump_79da
/*0x79d2*/      ldrb r0, [r6, #4]
/*0x79d4*/      bl call_4b1c
/*0x79d8*/      strb r4, [r6, #4]
            jump_79da:
/*0x79da*/      bl call_5ee0
/*0x79de*/      bl call_57fc
/*0x79e2*/      ldr r0, [pc, #0x54] /* data_7a38 */
/*0x79e4*/      ldrb r0, [r0, #6]
/*0x79e6*/      cmp r0, #1
/*0x79e8*/      beq jump_79f2
/*0x79ea*/      bl call_4b34
/*0x79ee*/      bl call_39f4
            jump_79f2:
/*0x79f2*/      ldrb r0, [r5, #3]
/*0x79f4*/      cbz r0, jump_79fa
/*0x79f6*/      bl call_4bd4
            jump_79fa:
/*0x79fa*/      ldrb r0, [r6]
/*0x79fc*/      cbz r0, jump_7a08
/*0x79fe*/      strb r4, [r6]
/*0x7a00*/      bl call_559c
/*0x7a04*/      bl call_55a8
            jump_7a08:
/*0x7a08*/      ldrb r0, [r6, #1]
/*0x7a0a*/      cbz r0, jump_7a12
/*0x7a0c*/      strb r4, [r6, #1]
/*0x7a0e*/      bl call_61d0
            jump_7a12:
/*0x7a12*/      ldrb r0, [r5, #3]
/*0x7a14*/      cmp r0, #0
/*0x7a16*/      beq jump_7a2c
/*0x7a18*/      ldr r0, [pc, #0x18] /* data_7a34 */
/*0x7a1a*/      ldrb r2, [r5, #2]
/*0x7a1c*/      .short 0x1d80 /* adds r0, r0, #6 */ 
/*0x7a1e*/      ldrb r1, [r0, #1]
/*0x7a20*/      add r1, r2
/*0x7a22*/      strb r1, [r0, #1]
/*0x7a24*/      ldrh r0, [r5, #6]
/*0x7a26*/      lsrs r0, r0, #1
/*0x7a28*/      strh r0, [r5, #6]
/*0x7a2a*/      strb r4, [r5, #3]
            jump_7a2c:
/*0x7a2c*/      pop {r4, r5, r6, pc}

/*0x7a2e*/  .byte 0x0
/*0x7a2f*/  .byte 0x0

            data_7a30:
/*0x7a30*/  .word 0x20000648
            data_7a34:
/*0x7a34*/  .word 0x20000028
            data_7a38:
/*0x7a38*/  .word 0x200019d0

            data_1:
/*0x7a3c*/  .byte 0x44
/*0x7a3d*/  .byte 0x45
/*0x7a3e*/  .byte 0xe6
/*0x7a3f*/  .byte 0xe3
/*0x7a40*/  .byte 0x2c
/*0x7a41*/  .byte 0x8
/*0x7a42*/  .byte 0x14
/*0x7a43*/  .byte 0x1a
/*0x7a44*/  .byte 0x0
/*0x7a45*/  .byte 0x1
/*0x7a46*/  .byte 0x0
/*0x7a47*/  .byte 0x2
            data_2:
/*0x7a48*/  .byte 0x39
/*0x7a49*/  .byte 0xe5
/*0x7a4a*/  .byte 0xe4
/*0x7a4b*/  .byte 0x65
/*0x7a4c*/  .byte 0xe7
/*0x7a4d*/  .byte 0x1f
/*0x7a4e*/  .byte 0x10
/*0x7a4f*/  .byte 0x1
/*0x7a50*/  .byte 0x3b
/*0x7a51*/  .byte 0x11
/*0x7a52*/  .byte 0x1
/*0x7a53*/  .byte 0x3c
/*0x7a54*/  .byte 0x12
/*0x7a55*/  .byte 0x1
/*0x7a56*/  .byte 0x3d
/*0x7a57*/  .byte 0x13
/*0x7a58*/  .byte 0x1
/*0x7a59*/  .byte 0x47
/*0x7a5a*/  .byte 0x5f
/*0x7a5b*/  .byte 0x1
/*0x7a5c*/  .byte 0x0
/*0x7a5d*/  .byte 0x35
/*0x7a5e*/  .byte 0x1
/*0x7a5f*/  .byte 0x3a
/*0x7a60*/  .byte 0x2
/*0x7a61*/  .byte 0x3b
/*0x7a62*/  .byte 0x3
/*0x7a63*/  .byte 0x3c
/*0x7a64*/  .byte 0x4
/*0x7a65*/  .byte 0x3d
/*0x7a66*/  .byte 0x5
/*0x7a67*/  .byte 0x3e
/*0x7a68*/  .byte 0x6
/*0x7a69*/  .byte 0x3f
/*0x7a6a*/  .byte 0x7
/*0x7a6b*/  .byte 0x40
/*0x7a6c*/  .byte 0x23
/*0x7a6d*/  .byte 0x41
/*0x7a6e*/  .byte 0x24
/*0x7a6f*/  .byte 0x42
/*0x7a70*/  .byte 0x25
/*0x7a71*/  .byte 0x43
/*0x7a72*/  .byte 0x26
/*0x7a73*/  .byte 0x44
/*0x7a74*/  .byte 0x2a
/*0x7a75*/  .byte 0x45
/*0x7a76*/  .byte 0x2b
/*0x7a77*/  .byte 0x52
/*0x7a78*/  .byte 0x17
/*0x7a79*/  .byte 0x50
/*0x7a7a*/  .byte 0x33
/*0x7a7b*/  .byte 0x51
/*0x7a7c*/  .byte 0x34
/*0x7a7d*/  .byte 0x4f
/*0x7a7e*/  .byte 0x2d
/*0x7a7f*/  .byte 0x46
/*0x7a80*/  .byte 0x2e
/*0x7a81*/  .byte 0x47
/*0x7a82*/  .byte 0x32
/*0x7a83*/  .byte 0x48
/*0x7a84*/  .byte 0x19
/*0x7a85*/  .byte 0x65
/*0x7a86*/  .byte 0x16
/*0x7a87*/  .byte 0x4a
/*0x7a88*/  .byte 0x1e
/*0x7a89*/  .byte 0x4d
/*0x7a8a*/  .byte 0xf
/*0x7a8b*/  .byte 0x4b
/*0x7a8c*/  .byte 0x2c
/*0x7a8d*/  .byte 0x4e
/*0x7a8e*/  .byte 0x27
/*0x7a8f*/  .byte 0x4c
/*0x7a90*/  .byte 0x36
/*0x7a91*/  .byte 0x4c
/*0x7a92*/  .byte 0x35
/*0x7a93*/  .byte 0x49
/*0x7a94*/  .byte 0x12
/*0x7a95*/  .byte 0xf5
/*0x7a96*/  .byte 0x13
/*0x7a97*/  .byte 0xf6
/*0x7a98*/  .byte 0x14
/*0x7a99*/  .byte 0xf4
/*0x7a9a*/  .byte 0x9
/*0x7a9b*/  .byte 0xf2
/*0x7a9c*/  .byte 0xa
/*0x7a9d*/  .byte 0xf0
/*0x7a9e*/  .byte 0xb
/*0x7a9f*/  .byte 0xf3
/*0x7aa0*/  .byte 0xe8
/*0x7aa1*/  .byte 0xcf
/*0x7aa2*/  .byte 0xff
/*0x7aa3*/  .byte 0xff
/*0x7aa4*/  .byte 0xff
/*0x7aa5*/  .byte 0x0
/*0x7aa6*/  .byte 0x0
/*0x7aa7*/  .byte 0xff
/*0x7aa8*/  .byte 0xff
/*0x7aa9*/  .byte 0x0
/*0x7aaa*/  .byte 0x0
/*0x7aab*/  .byte 0x0
/*0x7aac*/  .byte 0x1
/*0x7aad*/  .byte 0x2
/*0x7aae*/  .byte 0x3
/*0x7aaf*/  .byte 0xff
/*0x7ab0*/  .byte 0xff
/*0x7ab1*/  .byte 0xff
/*0x7ab2*/  .byte 0xff
/*0x7ab3*/  .byte 0x4
/*0x7ab4*/  .byte 0x4
/*0x7ab5*/  .byte 0x5
/*0x7ab6*/  .byte 0x5
/*0x7ab7*/  .byte 0x6
/*0x7ab8*/  .byte 0x6
/*0x7ab9*/  .byte 0x1
/*0x7aba*/  .byte 0x1
/*0x7abb*/  .byte 0x1
/*0x7abc*/  .byte 0x1
/*0x7abd*/  .byte 0x1
/*0x7abe*/  .byte 0x1
/*0x7abf*/  .byte 0x1
/*0x7ac0*/  .byte 0x3
/*0x7ac1*/  .byte 0x5
/*0x7ac2*/  .byte 0x7
/*0x7ac3*/  .byte 0x9
/*0x7ac4*/  .byte 0xb
/*0x7ac5*/  .byte 0x1
/*0x7ac6*/  .byte 0x3
/*0x7ac7*/  .byte 0x5
/*0x7ac8*/  .byte 0x7
/*0x7ac9*/  .byte 0x9
/*0x7aca*/  .byte 0xb
/*0x7acb*/  .byte 0xaa
/*0x7acc*/  .byte 0x6e
/*0x7acd*/  .byte 0x46
/*0x7ace*/  .byte 0x28
/*0x7acf*/  .byte 0x14
/*0x7ad0*/  .byte 0xa
/*0x7ad1*/  .byte 0x1
/*0x7ad2*/  .byte 0x2
/*0x7ad3*/  .byte 0x3
/*0x7ad4*/  .byte 0x4
/*0x7ad5*/  .byte 0x6
/*0x7ad6*/  .byte 0x9
/*0x7ad7*/  .byte 0x10
/*0x7ad8*/  .byte 0xb
/*0x7ad9*/  .byte 0x7
/*0x7ada*/  .byte 0x4
/*0x7adb*/  .byte 0x2
/*0x7adc*/  .byte 0x1
/*0x7add*/  .byte 0x10
/*0x7ade*/  .byte 0xb
/*0x7adf*/  .byte 0x7
/*0x7ae0*/  .byte 0x4
/*0x7ae1*/  .byte 0x2
/*0x7ae2*/  .byte 0x1
/*0x7ae3*/  .byte 0x0
/*0x7ae4*/  .byte 0x1
/*0x7ae5*/  .byte 0x2
/*0x7ae6*/  .byte 0x3
/*0x7ae7*/  .byte 0x4
/*0x7ae8*/  .byte 0x5
/*0x7ae9*/  .byte 0x6
/*0x7aea*/  .byte 0x7
/*0x7aeb*/  .byte 0x1b
/*0x7aec*/  .byte 0x1a
/*0x7aed*/  .byte 0x19
/*0x7aee*/  .byte 0x18
/*0x7aef*/  .byte 0x17
/*0x7af0*/  .byte 0x16
/*0x7af1*/  .byte 0x15
/*0x7af2*/  .byte 0x14
/*0x7af3*/  .byte 0x1c
/*0x7af4*/  .byte 0x1d
/*0x7af5*/  .byte 0x1e
/*0x7af6*/  .byte 0x1f
/*0x7af7*/  .byte 0x20
/*0x7af8*/  .byte 0x21
/*0x7af9*/  .byte 0x22
/*0x7afa*/  .byte 0x23
/*0x7afb*/  .byte 0x34
/*0x7afc*/  .byte 0x33
/*0x7afd*/  .byte 0x32
/*0x7afe*/  .byte 0x31
/*0x7aff*/  .byte 0x30
/*0x7b00*/  .byte 0x2f
/*0x7b01*/  .byte 0x2e
/*0x7b02*/  .byte 0x2d
/*0x7b03*/  .byte 0x35
/*0x7b04*/  .byte 0x36
/*0x7b05*/  .byte 0x37
/*0x7b06*/  .byte 0x8
/*0x7b07*/  .byte 0x9
/*0x7b08*/  .byte 0xa
/*0x7b09*/  .byte 0xb
/*0x7b0a*/  .byte 0xd
/*0x7b0b*/  .byte 0xff
/*0x7b0c*/  .byte 0xff
/*0x7b0d*/  .byte 0xc
/*0x7b0e*/  .byte 0x13
/*0x7b0f*/  .byte 0x12
/*0x7b10*/  .byte 0x11
/*0x7b11*/  .byte 0x10
/*0x7b12*/  .byte 0xe
/*0x7b13*/  .byte 0xff
/*0x7b14*/  .byte 0xff
/*0x7b15*/  .byte 0xf
/*0x7b16*/  .byte 0x24
/*0x7b17*/  .byte 0x25
/*0x7b18*/  .byte 0x26
/*0x7b19*/  .byte 0x27
/*0x7b1a*/  .byte 0x28
/*0x7b1b*/  .byte 0xff
/*0x7b1c*/  .byte 0xff
/*0x7b1d*/  .byte 0x38
/*0x7b1e*/  .byte 0x2c
/*0x7b1f*/  .byte 0x2b
/*0x7b20*/  .byte 0x2a
/*0x7b21*/  .byte 0x29
/*0x7b22*/  .byte 0xff
/*0x7b23*/  .byte 0xff
/*0x7b24*/  .byte 0xff
/*0x7b25*/  .byte 0xff
/*0x7b26*/  .byte 0x39
/*0x7b27*/  .byte 0x3a
/*0x7b28*/  .byte 0x3b
/*0x7b29*/  .byte 0xff
/*0x7b2a*/  .byte 0x3c
/*0x7b2b*/  .byte 0x1
/*0x7b2c*/  .byte 0x1
/*0x7b2d*/  .byte 0x1
/*0x7b2e*/  .byte 0x1
/*0x7b2f*/  .byte 0x2
/*0x7b30*/  .byte 0x2
/*0x7b31*/  .byte 0x2
/*0x7b32*/  .byte 0x2
/*0x7b33*/  .byte 0x8
/*0x7b34*/  .byte 0x8
/*0x7b35*/  .byte 0x1
/*0x7b36*/  .byte 0x1
/*0x7b37*/  .byte 0x1
/*0x7b38*/  .byte 0x2
/*0x7b39*/  .byte 0x2
/*0x7b3a*/  .byte 0x2
/*0x7b3b*/  .byte 0x8
/*0x7b3c*/  .byte 0x8
/*0x7b3d*/  .byte 0x8
/*0x7b3e*/  .byte 0x8
/*0x7b3f*/  .byte 0x1
/*0x7b40*/  .byte 0x1
/*0x7b41*/  .byte 0x2
/*0x7b42*/  .byte 0x3
/*0x7b43*/  .byte 0x7
/*0x7b44*/  .byte 0x7
/*0x7b45*/  .byte 0x7
/*0x7b46*/  .byte 0x7
/*0x7b47*/  .byte 0x6
/*0x7b48*/  .byte 0x6
/*0x7b49*/  .byte 0x6
/*0x7b4a*/  .byte 0x6
/*0x7b4b*/  .byte 0x7
/*0x7b4c*/  .byte 0x7
/*0x7b4d*/  .byte 0x6
/*0x7b4e*/  .byte 0x2
/*0x7b4f*/  .byte 0x2
/*0x7b50*/  .byte 0x2
/*0x7b51*/  .byte 0x3
/*0x7b52*/  .byte 0x3
/*0x7b53*/  .byte 0xff
/*0x7b54*/  .byte 0xff
/*0x7b55*/  .byte 0x3
/*0x7b56*/  .byte 0x3
/*0x7b57*/  .byte 0x3
/*0x7b58*/  .byte 0x3
/*0x7b59*/  .byte 0x3
/*0x7b5a*/  .byte 0x4
/*0x7b5b*/  .byte 0xff
/*0x7b5c*/  .byte 0xff
/*0x7b5d*/  .byte 0x4
/*0x7b5e*/  .byte 0x3
/*0x7b5f*/  .byte 0x4
/*0x7b60*/  .byte 0x4
/*0x7b61*/  .byte 0x4
/*0x7b62*/  .byte 0x4
/*0x7b63*/  .byte 0xff
/*0x7b64*/  .byte 0xff
/*0x7b65*/  .byte 0x6
/*0x7b66*/  .byte 0x5
/*0x7b67*/  .byte 0x5
/*0x7b68*/  .byte 0x5
/*0x7b69*/  .byte 0x5
/*0x7b6a*/  .byte 0xff
/*0x7b6b*/  .byte 0xff
/*0x7b6c*/  .byte 0xff
/*0x7b6d*/  .byte 0xff
/*0x7b6e*/  .byte 0x6
/*0x7b6f*/  .byte 0x6
/*0x7b70*/  .byte 0x5
/*0x7b71*/  .byte 0xff
/*0x7b72*/  .byte 0x5
/*0x7b73*/  .byte 0x0
/*0x7b74*/  .byte 0x8
/*0x7b75*/  .byte 0x10
/*0x7b76*/  .byte 0x18
/*0x7b77*/  .byte 0x20
/*0x7b78*/  .byte 0x28
/*0x7b79*/  .byte 0x30
/*0x7b7a*/  .byte 0x38
/*0x7b7b*/  .byte 0x1
/*0x7b7c*/  .byte 0x9
/*0x7b7d*/  .byte 0x11
/*0x7b7e*/  .byte 0x19
/*0x7b7f*/  .byte 0x21
/*0x7b80*/  .byte 0x29
/*0x7b81*/  .byte 0x31
/*0x7b82*/  .byte 0x39
/*0x7b83*/  .byte 0x2
/*0x7b84*/  .byte 0xa
/*0x7b85*/  .byte 0x12
/*0x7b86*/  .byte 0x1a
/*0x7b87*/  .byte 0x22
/*0x7b88*/  .byte 0x2a
/*0x7b89*/  .byte 0x32
/*0x7b8a*/  .byte 0x3a
/*0x7b8b*/  .byte 0x3
/*0x7b8c*/  .byte 0x13
/*0x7b8d*/  .byte 0x1b
/*0x7b8e*/  .byte 0x23
/*0x7b8f*/  .byte 0x2b
/*0x7b90*/  .byte 0x33
/*0x7b91*/  .byte 0x3b
/*0x7b92*/  .byte 0x43
/*0x7b93*/  .byte 0x4
/*0x7b94*/  .byte 0xc
/*0x7b95*/  .byte 0x14
/*0x7b96*/  .byte 0x40
/*0x7b97*/  .byte 0x48
/*0x7b98*/  .byte 0x50
/*0x7b99*/  .byte 0x58
/*0x7b9a*/  .byte 0x68
/*0x7b9b*/  .byte 0xff
/*0x7b9c*/  .byte 0xff
/*0x7b9d*/  .byte 0x60
/*0x7b9e*/  .byte 0x41
/*0x7b9f*/  .byte 0x49
/*0x7ba0*/  .byte 0x51
/*0x7ba1*/  .byte 0x59
/*0x7ba2*/  .byte 0x69
/*0x7ba3*/  .byte 0xff
/*0x7ba4*/  .byte 0xff
/*0x7ba5*/  .byte 0x61
/*0x7ba6*/  .byte 0x42
/*0x7ba7*/  .byte 0x4a
/*0x7ba8*/  .byte 0x52
/*0x7ba9*/  .byte 0x5a
/*0x7baa*/  .byte 0x6a
/*0x7bab*/  .byte 0xff
/*0x7bac*/  .byte 0xff
/*0x7bad*/  .byte 0x34
/*0x7bae*/  .byte 0x4b
/*0x7baf*/  .byte 0x53
/*0x7bb0*/  .byte 0x5b
/*0x7bb1*/  .byte 0x63
/*0x7bb2*/  .byte 0xff
/*0x7bb3*/  .byte 0xff
/*0x7bb4*/  .byte 0xff
/*0x7bb5*/  .byte 0xff
/*0x7bb6*/  .byte 0x54
/*0x7bb7*/  .byte 0x5c
/*0x7bb8*/  .byte 0x64
/*0x7bb9*/  .byte 0xff
/*0x7bba*/  .byte 0x6c
/*0x7bbb*/  .byte 0x0
/*0x7bbc*/  .byte 0x24
/*0x7bbd*/  .byte 0x49
/*0x7bbe*/  .byte 0x6d
/*0x7bbf*/  .byte 0x92
/*0x7bc0*/  .byte 0xb6
/*0x7bc1*/  .byte 0xdb
/*0x7bc2*/  .byte 0xff
/*0x7bc3*/  .byte 0xaa
/*0x7bc4*/  .byte 0x55
/*0x7bc5*/  .byte 0x0
/*0x7bc6*/  .byte 0x0
/*0x7bc7*/  .byte 0x0
/*0x7bc8*/  .byte 0x29
/*0x7bc9*/  .byte 0x1e
/*0x7bca*/  .byte 0x1f
/*0x7bcb*/  .byte 0x20
/*0x7bcc*/  .byte 0x21
/*0x7bcd*/  .byte 0x22
/*0x7bce*/  .byte 0x23
/*0x7bcf*/  .byte 0x24
/*0x7bd0*/  .byte 0x2b
/*0x7bd1*/  .byte 0x14
/*0x7bd2*/  .byte 0x1a
/*0x7bd3*/  .byte 0x8
/*0x7bd4*/  .byte 0x15
/*0x7bd5*/  .byte 0x17
/*0x7bd6*/  .byte 0x1c
/*0x7bd7*/  .byte 0x18
/*0x7bd8*/  .byte 0x39
/*0x7bd9*/  .byte 0x4
/*0x7bda*/  .byte 0x16
/*0x7bdb*/  .byte 0x7
/*0x7bdc*/  .byte 0x9
/*0x7bdd*/  .byte 0xa
/*0x7bde*/  .byte 0xb
/*0x7bdf*/  .byte 0xd
/*0x7be0*/  .byte 0xe1
/*0x7be1*/  .byte 0x1d
/*0x7be2*/  .byte 0x1b
/*0x7be3*/  .byte 0x6
/*0x7be4*/  .byte 0x19
/*0x7be5*/  .byte 0x5
/*0x7be6*/  .byte 0x11
/*0x7be7*/  .byte 0x10
/*0x7be8*/  .byte 0xe0
/*0x7be9*/  .byte 0xe3
/*0x7bea*/  .byte 0xe2
/*0x7beb*/  .byte 0x25
/*0x7bec*/  .byte 0x26
/*0x7bed*/  .byte 0x27
/*0x7bee*/  .byte 0x2d
/*0x7bef*/  .byte 0x2a
/*0x7bf0*/  .byte 0x64
/*0x7bf1*/  .byte 0x0
/*0x7bf2*/  .byte 0x2e
/*0x7bf3*/  .byte 0xc
/*0x7bf4*/  .byte 0x12
/*0x7bf5*/  .byte 0x13
/*0x7bf6*/  .byte 0x2f
/*0x7bf7*/  .byte 0x31
/*0x7bf8*/  .byte 0x0
/*0x7bf9*/  .byte 0x0
/*0x7bfa*/  .byte 0x30
/*0x7bfb*/  .byte 0xe
/*0x7bfc*/  .byte 0xf
/*0x7bfd*/  .byte 0x33
/*0x7bfe*/  .byte 0x34
/*0x7bff*/  .byte 0x28
/*0x7c00*/  .byte 0x0
/*0x7c01*/  .byte 0x0
/*0x7c02*/  .byte 0x2c
/*0x7c03*/  .byte 0x36
/*0x7c04*/  .byte 0x37
/*0x7c05*/  .byte 0x38
/*0x7c06*/  .byte 0xe5
/*0x7c07*/  .byte 0x35
/*0x7c08*/  .byte 0x0
/*0x7c09*/  .byte 0x0
/*0x7c0a*/  .byte 0x0
/*0x7c0b*/  .byte 0xe6
/*0x7c0c*/  .byte 0xe7
/*0x7c0d*/  .byte 0x65
/*0x7c0e*/  .byte 0x0
/*0x7c0f*/  .byte 0xe4
/*0x7c10*/  .byte 0xc0
/*0x7c11*/  .byte 0xc1
/*0x7c12*/  .byte 0xc2
/*0x7c13*/  .byte 0xc3
/*0x7c14*/  .byte 0x0
/*0x7c15*/  .byte 0x0
/*0x7c16*/  .byte 0x0
/*0x7c17*/  .byte 0x0
            gpio_map_3:
/*0x7c18*/  .byte 0x0
/*0x7c19*/  .byte 0x40
/*0x7c1a*/  .byte 0xb
/*0x7c1b*/  .byte 0x40
/*0x7c1c*/  .byte 0x0
/*0x7c1d*/  .byte 0x2
/*0x7c1e*/  .byte 0x0
/*0x7c1f*/  .byte 0x0
/*0x7c20*/  .byte 0x0
/*0x7c21*/  .byte 0x0
/*0x7c22*/  .byte 0xb
/*0x7c23*/  .byte 0x40
/*0x7c24*/  .byte 0x20
/*0x7c25*/  .byte 0x0
/*0x7c26*/  .byte 0x0
/*0x7c27*/  .byte 0x0
/*0x7c28*/  .byte 0x0
/*0x7c29*/  .byte 0x0
/*0x7c2a*/  .byte 0xb
/*0x7c2b*/  .byte 0x40
/*0x7c2c*/  .byte 0x40
/*0x7c2d*/  .byte 0x0
/*0x7c2e*/  .byte 0x0
/*0x7c2f*/  .byte 0x0
/*0x7c30*/  .byte 0x0
/*0x7c31*/  .byte 0x0
/*0x7c32*/  .byte 0xb
/*0x7c33*/  .byte 0x40
/*0x7c34*/  .byte 0x80
/*0x7c35*/  .byte 0x0
/*0x7c36*/  .byte 0x0
/*0x7c37*/  .byte 0x0
/*0x7c38*/  .byte 0x0
/*0x7c39*/  .byte 0x40
/*0x7c3a*/  .byte 0xb
/*0x7c3b*/  .byte 0x40
/*0x7c3c*/  .byte 0x0
/*0x7c3d*/  .byte 0x8
/*0x7c3e*/  .byte 0x0
/*0x7c3f*/  .byte 0x0
/*0x7c40*/  .byte 0x0
/*0x7c41*/  .byte 0x40
/*0x7c42*/  .byte 0xb
/*0x7c43*/  .byte 0x40
/*0x7c44*/  .byte 0x0
/*0x7c45*/  .byte 0x20
/*0x7c46*/  .byte 0x0
/*0x7c47*/  .byte 0x0
/*0x7c48*/  .byte 0x0
/*0x7c49*/  .byte 0x40
/*0x7c4a*/  .byte 0xb
/*0x7c4b*/  .byte 0x40
/*0x7c4c*/  .byte 0x0
/*0x7c4d*/  .byte 0x40
/*0x7c4e*/  .byte 0x0
/*0x7c4f*/  .byte 0x0
/*0x7c50*/  .byte 0x0
/*0x7c51*/  .byte 0x40
/*0x7c52*/  .byte 0xb
/*0x7c53*/  .byte 0x40
/*0x7c54*/  .byte 0x0
/*0x7c55*/  .byte 0x80
/*0x7c56*/  .byte 0x0
/*0x7c57*/  .byte 0x0
/*0x7c58*/  .byte 0x2
/*0x7c59*/  .byte 0x9
/*0x7c5a*/  .byte 0x0
/*0x7c5b*/  .byte 0x5
/*0x7c5c*/  .byte 0x0
/*0x7c5d*/  .byte 0x6
/*0x7c5e*/  .byte 0x0
/*0x7c5f*/  .byte 0x7
/*0x7c60*/  .byte 0x2
/*0x7c61*/  .byte 0xb
/*0x7c62*/  .byte 0x2
/*0x7c63*/  .byte 0xd
/*0x7c64*/  .byte 0x2
/*0x7c65*/  .byte 0xe
/*0x7c66*/  .byte 0x2
/*0x7c67*/  .byte 0xf
            gpio_map_2:
/*0x7c68*/  .byte 0x0
/*0x7c69*/  .byte 0x40
/*0x7c6a*/  .byte 0xb
/*0x7c6b*/  .byte 0x40
/*0x7c6c*/  .byte 0x10
/*0x7c6d*/  .byte 0x0
/*0x7c6e*/  .byte 0x0
/*0x7c6f*/  .byte 0x0
/*0x7c70*/  .byte 0x0
/*0x7c71*/  .byte 0x20
/*0x7c72*/  .byte 0xb
/*0x7c73*/  .byte 0x40
/*0x7c74*/  .byte 0x40
/*0x7c75*/  .byte 0x0
/*0x7c76*/  .byte 0x0
/*0x7c77*/  .byte 0x0
/*0x7c78*/  .byte 0x0
/*0x7c79*/  .byte 0x60
/*0x7c7a*/  .byte 0xb
/*0x7c7b*/  .byte 0x40
/*0x7c7c*/  .byte 0x1
/*0x7c7d*/  .byte 0x0
/*0x7c7e*/  .byte 0x0
/*0x7c7f*/  .byte 0x0
/*0x7c80*/  .byte 0x0
/*0x7c81*/  .byte 0x20
/*0x7c82*/  .byte 0xb
/*0x7c83*/  .byte 0x40
/*0x7c84*/  .byte 0x0
/*0x7c85*/  .byte 0x8
/*0x7c86*/  .byte 0x0
/*0x7c87*/  .byte 0x0
/*0x7c88*/  .byte 0x0
/*0x7c89*/  .byte 0x0
/*0x7c8a*/  .byte 0xb
/*0x7c8b*/  .byte 0x40
/*0x7c8c*/  .byte 0x0
/*0x7c8d*/  .byte 0x8
/*0x7c8e*/  .byte 0x0
/*0x7c8f*/  .byte 0x0
/*0x7c90*/  .byte 0x0
/*0x7c91*/  .byte 0x0
/*0x7c92*/  .byte 0xb
/*0x7c93*/  .byte 0x40
/*0x7c94*/  .byte 0x1
/*0x7c95*/  .byte 0x0
/*0x7c96*/  .byte 0x0
/*0x7c97*/  .byte 0x0
/*0x7c98*/  .byte 0x0
/*0x7c99*/  .byte 0x0
/*0x7c9a*/  .byte 0xb
/*0x7c9b*/  .byte 0x40
/*0x7c9c*/  .byte 0x2
/*0x7c9d*/  .byte 0x0
/*0x7c9e*/  .byte 0x0
/*0x7c9f*/  .byte 0x0
/*0x7ca0*/  .byte 0x0
/*0x7ca1*/  .byte 0x0
/*0x7ca2*/  .byte 0xb
/*0x7ca3*/  .byte 0x40
/*0x7ca4*/  .byte 0x4
/*0x7ca5*/  .byte 0x0
/*0x7ca6*/  .byte 0x0
/*0x7ca7*/  .byte 0x0
/*0x7ca8*/  .byte 0x0
/*0x7ca9*/  .byte 0x0
/*0x7caa*/  .byte 0xb
/*0x7cab*/  .byte 0x40
/*0x7cac*/  .byte 0x8
/*0x7cad*/  .byte 0x0
/*0x7cae*/  .byte 0x0
/*0x7caf*/  .byte 0x0
/*0x7cb0*/  .byte 0x0
/*0x7cb1*/  .byte 0x0
/*0x7cb2*/  .byte 0xb
/*0x7cb3*/  .byte 0x40
/*0x7cb4*/  .byte 0x10
/*0x7cb5*/  .byte 0x0
/*0x7cb6*/  .byte 0x0
/*0x7cb7*/  .byte 0x0
/*0x7cb8*/  .byte 0x2d
/*0x7cb9*/  .byte 0x2f
/*0x7cba*/  .byte 0x2e
/*0x7cbb*/  .byte 0x30
/*0x7cbc*/  .byte 0x14
/*0x7cbd*/  .byte 0x34
/*0x7cbe*/  .byte 0x1a
/*0x7cbf*/  .byte 0x36
/*0x7cc0*/  .byte 0x8
/*0x7cc1*/  .byte 0x37
/*0x7cc2*/  .byte 0x15
/*0x7cc3*/  .byte 0x13
/*0x7cc4*/  .byte 0x17
/*0x7cc5*/  .byte 0x1c
/*0x7cc6*/  .byte 0x1c
/*0x7cc7*/  .byte 0x9
/*0x7cc8*/  .byte 0x18
/*0x7cc9*/  .byte 0xa
/*0x7cca*/  .byte 0xc
/*0x7ccb*/  .byte 0x6
/*0x7ccc*/  .byte 0x12
/*0x7ccd*/  .byte 0x15
/*0x7cce*/  .byte 0x13
/*0x7ccf*/  .byte 0xf
/*0x7cd0*/  .byte 0x2f
/*0x7cd1*/  .byte 0x38
/*0x7cd2*/  .byte 0x30
/*0x7cd3*/  .byte 0x2e
/*0x7cd4*/  .byte 0x16
/*0x7cd5*/  .byte 0x12
/*0x7cd6*/  .byte 0x7
/*0x7cd7*/  .byte 0x8
/*0x7cd8*/  .byte 0x9
/*0x7cd9*/  .byte 0x18
/*0x7cda*/  .byte 0xa
/*0x7cdb*/  .byte 0xc
/*0x7cdc*/  .byte 0xb
/*0x7cdd*/  .byte 0x7
/*0x7cde*/  .byte 0xd
/*0x7cdf*/  .byte 0xb
/*0x7ce0*/  .byte 0xe
/*0x7ce1*/  .byte 0x17
/*0x7ce2*/  .byte 0xf
/*0x7ce3*/  .byte 0x11
/*0x7ce4*/  .byte 0x33
/*0x7ce5*/  .byte 0x16
/*0x7ce6*/  .byte 0x34
/*0x7ce7*/  .byte 0x2d
/*0x7ce8*/  .byte 0x1d
/*0x7ce9*/  .byte 0x33
/*0x7cea*/  .byte 0x1b
/*0x7ceb*/  .byte 0x14
/*0x7cec*/  .byte 0x6
/*0x7ced*/  .byte 0xd
/*0x7cee*/  .byte 0x19
/*0x7cef*/  .byte 0xe
/*0x7cf0*/  .byte 0x5
/*0x7cf1*/  .byte 0x1b
/*0x7cf2*/  .byte 0x11
/*0x7cf3*/  .byte 0x5
/*0x7cf4*/  .byte 0x10
/*0x7cf5*/  .byte 0x10
/*0x7cf6*/  .byte 0x36
/*0x7cf7*/  .byte 0x1a
/*0x7cf8*/  .byte 0x37
/*0x7cf9*/  .byte 0x19
/*0x7cfa*/  .byte 0x38
/*0x7cfb*/  .byte 0x1d
/*0x7cfc*/  .byte 0x8
/*0x7cfd*/  .byte 0x9
/*0x7cfe*/  .byte 0x15
/*0x7cff*/  .byte 0x13
/*0x7d00*/  .byte 0x17
/*0x7d01*/  .byte 0xa
/*0x7d02*/  .byte 0x1c
/*0x7d03*/  .byte 0xd
/*0x7d04*/  .byte 0x18
/*0x7d05*/  .byte 0xf
/*0x7d06*/  .byte 0xc
/*0x7d07*/  .byte 0x18
/*0x7d08*/  .byte 0x12
/*0x7d09*/  .byte 0x1c
/*0x7d0a*/  .byte 0x13
/*0x7d0b*/  .byte 0x33
/*0x7d0c*/  .byte 0x16
/*0x7d0d*/  .byte 0x15
/*0x7d0e*/  .byte 0x7
/*0x7d0f*/  .byte 0x16
/*0x7d10*/  .byte 0x9
/*0x7d11*/  .byte 0x17
/*0x7d12*/  .byte 0xa
/*0x7d13*/  .byte 0x7
/*0x7d14*/  .byte 0xd
/*0x7d15*/  .byte 0x11
/*0x7d16*/  .byte 0xe
/*0x7d17*/  .byte 0x8
/*0x7d18*/  .byte 0xf
/*0x7d19*/  .byte 0xc
/*0x7d1a*/  .byte 0x33
/*0x7d1b*/  .byte 0x12
/*0x7d1c*/  .byte 0x11
/*0x7d1d*/  .byte 0xe
/*0x7d1e*/  .byte 0x0
/*0x7d1f*/  .byte 0x0
/*0x7d20*/  .byte 0x0
/*0x7d21*/  .byte 0x1
/*0x7d22*/  .byte 0x2
/*0x7d23*/  .byte 0x0
            gpio_map_1:
/*0x7d24*/  .byte 0x0
/*0x7d25*/  .byte 0x40
/*0x7d26*/  .byte 0xb
/*0x7d27*/  .byte 0x40
/*0x7d28*/  .byte 0x0
/*0x7d29*/  .byte 0x1
/*0x7d2a*/  .byte 0x0
/*0x7d2b*/  .byte 0x0
/*0x7d2c*/  .byte 0x0
/*0x7d2d*/  .byte 0x40
/*0x7d2e*/  .byte 0xb
/*0x7d2f*/  .byte 0x40
/*0x7d30*/  .byte 0x80
/*0x7d31*/  .byte 0x0
/*0x7d32*/  .byte 0x0
/*0x7d33*/  .byte 0x0
/*0x7d34*/  .byte 0x0
/*0x7d35*/  .byte 0x20
/*0x7d36*/  .byte 0xb
/*0x7d37*/  .byte 0x40
/*0x7d38*/  .byte 0x20
/*0x7d39*/  .byte 0x0
/*0x7d3a*/  .byte 0x0
/*0x7d3b*/  .byte 0x0
/*0x7d3c*/  .byte 0x0
/*0x7d3d*/  .byte 0x20
/*0x7d3e*/  .byte 0xb
/*0x7d3f*/  .byte 0x40
/*0x7d40*/  .byte 0x10
/*0x7d41*/  .byte 0x0
/*0x7d42*/  .byte 0x0
/*0x7d43*/  .byte 0x0
/*0x7d44*/  .byte 0x0
/*0x7d45*/  .byte 0x20
/*0x7d46*/  .byte 0xb
/*0x7d47*/  .byte 0x40
/*0x7d48*/  .byte 0x8
/*0x7d49*/  .byte 0x0
/*0x7d4a*/  .byte 0x0
/*0x7d4b*/  .byte 0x0
/*0x7d4c*/  .byte 0x0
/*0x7d4d*/  .byte 0x20
/*0x7d4e*/  .byte 0xb
/*0x7d4f*/  .byte 0x40
/*0x7d50*/  .byte 0x4
/*0x7d51*/  .byte 0x0
/*0x7d52*/  .byte 0x0
/*0x7d53*/  .byte 0x0
/*0x7d54*/  .byte 0x0
/*0x7d55*/  .byte 0x40
/*0x7d56*/  .byte 0xb
/*0x7d57*/  .byte 0x40
/*0x7d58*/  .byte 0x40
/*0x7d59*/  .byte 0x0
/*0x7d5a*/  .byte 0x0
/*0x7d5b*/  .byte 0x0
/*0x7d5c*/  .byte 0x0
/*0x7d5d*/  .byte 0x40
/*0x7d5e*/  .byte 0xb
/*0x7d5f*/  .byte 0x40
/*0x7d60*/  .byte 0x20
/*0x7d61*/  .byte 0x0
/*0x7d62*/  .byte 0x0
/*0x7d63*/  .byte 0x0
/*0x7d64*/  .byte 0x0
/*0x7d65*/  .byte 0x0
/*0x7d66*/  .byte 0x13
/*0x7d67*/  .byte 0x0
/*0x7d68*/  .byte 0x26
/*0x7d69*/  .byte 0x0
/*0x7d6a*/  .byte 0x3a
/*0x7d6b*/  .byte 0x0
/*0x7d6c*/  .byte 0x4e
/*0x7d6d*/  .byte 0x0
/*0x7d6e*/  .byte 0x62
/*0x7d6f*/  .byte 0x0
/*0x7d70*/  .byte 0x77
/*0x7d71*/  .byte 0x0
/*0x7d72*/  .byte 0x8c
/*0x7d73*/  .byte 0x0
/*0x7d74*/  .byte 0xa1
/*0x7d75*/  .byte 0x0
/*0x7d76*/  .byte 0xb7
/*0x7d77*/  .byte 0x0
/*0x7d78*/  .byte 0xcd
/*0x7d79*/  .byte 0x0
/*0x7d7a*/  .byte 0xe3
/*0x7d7b*/  .byte 0x0
/*0x7d7c*/  .byte 0xfa
/*0x7d7d*/  .byte 0x0
/*0x7d7e*/  .byte 0x11
/*0x7d7f*/  .byte 0x1
/*0x7d80*/  .byte 0x28
/*0x7d81*/  .byte 0x1
/*0x7d82*/  .byte 0x40
/*0x7d83*/  .byte 0x1
/*0x7d84*/  .byte 0x58
/*0x7d85*/  .byte 0x1
/*0x7d86*/  .byte 0x71
/*0x7d87*/  .byte 0x1
/*0x7d88*/  .byte 0x8a
/*0x7d89*/  .byte 0x1
/*0x7d8a*/  .byte 0xa3
/*0x7d8b*/  .byte 0x1
/*0x7d8c*/  .byte 0xbd
/*0x7d8d*/  .byte 0x1
/*0x7d8e*/  .byte 0xd7
/*0x7d8f*/  .byte 0x1
/*0x7d90*/  .byte 0xf1
/*0x7d91*/  .byte 0x1
/*0x7d92*/  .byte 0xc
/*0x7d93*/  .byte 0x2
/*0x7d94*/  .byte 0x28
/*0x7d95*/  .byte 0x2
/*0x7d96*/  .byte 0x43
/*0x7d97*/  .byte 0x2
/*0x7d98*/  .byte 0x60
/*0x7d99*/  .byte 0x2
/*0x7d9a*/  .byte 0x7c
/*0x7d9b*/  .byte 0x2
/*0x7d9c*/  .byte 0x9a
/*0x7d9d*/  .byte 0x2
/*0x7d9e*/  .byte 0xb7
/*0x7d9f*/  .byte 0x2
/*0x7da0*/  .byte 0xd5
/*0x7da1*/  .byte 0x2
/*0x7da2*/  .byte 0xf4
/*0x7da3*/  .byte 0x2
/*0x7da4*/  .byte 0x13
/*0x7da5*/  .byte 0x3
/*0x7da6*/  .byte 0x32
/*0x7da7*/  .byte 0x3
/*0x7da8*/  .byte 0x53
/*0x7da9*/  .byte 0x3
/*0x7daa*/  .byte 0x73
/*0x7dab*/  .byte 0x3
/*0x7dac*/  .byte 0x94
/*0x7dad*/  .byte 0x3
/*0x7dae*/  .byte 0xb6
/*0x7daf*/  .byte 0x3
/*0x7db0*/  .byte 0xd8
/*0x7db1*/  .byte 0x3
/*0x7db2*/  .byte 0xfb
/*0x7db3*/  .byte 0x3
/*0x7db4*/  .byte 0x1e
/*0x7db5*/  .byte 0x4
/*0x7db6*/  .byte 0x42
/*0x7db7*/  .byte 0x4
/*0x7db8*/  .byte 0x66
/*0x7db9*/  .byte 0x4
/*0x7dba*/  .byte 0x8b
/*0x7dbb*/  .byte 0x4
/*0x7dbc*/  .byte 0xb1
/*0x7dbd*/  .byte 0x4
/*0x7dbe*/  .byte 0xd7
/*0x7dbf*/  .byte 0x4
/*0x7dc0*/  .byte 0xfd
/*0x7dc1*/  .byte 0x4
/*0x7dc2*/  .byte 0x25
/*0x7dc3*/  .byte 0x5
/*0x7dc4*/  .byte 0x4d
/*0x7dc5*/  .byte 0x5
/*0x7dc6*/  .byte 0x75
/*0x7dc7*/  .byte 0x5
/*0x7dc8*/  .byte 0x9f
/*0x7dc9*/  .byte 0x5
/*0x7dca*/  .byte 0xc8
/*0x7dcb*/  .byte 0x5
/*0x7dcc*/  .byte 0xf3
/*0x7dcd*/  .byte 0x5
/*0x7dce*/  .byte 0x1e
/*0x7dcf*/  .byte 0x6
/*0x7dd0*/  .byte 0x4a
/*0x7dd1*/  .byte 0x6
/*0x7dd2*/  .byte 0x77
/*0x7dd3*/  .byte 0x6
/*0x7dd4*/  .byte 0xa4
/*0x7dd5*/  .byte 0x6
/*0x7dd6*/  .byte 0xd2
/*0x7dd7*/  .byte 0x6
/*0x7dd8*/  .byte 0x1
/*0x7dd9*/  .byte 0x7
/*0x7dda*/  .byte 0x31
/*0x7ddb*/  .byte 0x7
/*0x7ddc*/  .byte 0x61
/*0x7ddd*/  .byte 0x7
/*0x7dde*/  .byte 0x92
/*0x7ddf*/  .byte 0x7
/*0x7de0*/  .byte 0xc4
/*0x7de1*/  .byte 0x7
/*0x7de2*/  .byte 0xf6
/*0x7de3*/  .byte 0x7
/*0x7de4*/  .byte 0x2a
/*0x7de5*/  .byte 0x8
/*0x7de6*/  .byte 0x5e
/*0x7de7*/  .byte 0x8
/*0x7de8*/  .byte 0x93
/*0x7de9*/  .byte 0x8
/*0x7dea*/  .byte 0xc9
/*0x7deb*/  .byte 0x8
/*0x7dec*/  .byte 0x0
/*0x7ded*/  .byte 0x9
/*0x7dee*/  .byte 0x38
/*0x7def*/  .byte 0x9
/*0x7df0*/  .byte 0x70
/*0x7df1*/  .byte 0x9
/*0x7df2*/  .byte 0xaa
/*0x7df3*/  .byte 0x9
/*0x7df4*/  .byte 0xe4
/*0x7df5*/  .byte 0x9
/*0x7df6*/  .byte 0x1f
/*0x7df7*/  .byte 0xa
/*0x7df8*/  .byte 0x5b
/*0x7df9*/  .byte 0xa
/*0x7dfa*/  .byte 0x99
/*0x7dfb*/  .byte 0xa
/*0x7dfc*/  .byte 0xd7
/*0x7dfd*/  .byte 0xa
/*0x7dfe*/  .byte 0x16
/*0x7dff*/  .byte 0xb
/*0x7e00*/  .byte 0x56
/*0x7e01*/  .byte 0xb
/*0x7e02*/  .byte 0x97
/*0x7e03*/  .byte 0xb
/*0x7e04*/  .byte 0xd9
/*0x7e05*/  .byte 0xb
/*0x7e06*/  .byte 0x1d
/*0x7e07*/  .byte 0xc
/*0x7e08*/  .byte 0x61
/*0x7e09*/  .byte 0xc
/*0x7e0a*/  .byte 0xa6
/*0x7e0b*/  .byte 0xc
/*0x7e0c*/  .byte 0xed
/*0x7e0d*/  .byte 0xc
/*0x7e0e*/  .byte 0x34
/*0x7e0f*/  .byte 0xd
/*0x7e10*/  .byte 0x7d
/*0x7e11*/  .byte 0xd
/*0x7e12*/  .byte 0xc7
/*0x7e13*/  .byte 0xd
/*0x7e14*/  .byte 0x12
/*0x7e15*/  .byte 0xe
/*0x7e16*/  .byte 0x5e
/*0x7e17*/  .byte 0xe
/*0x7e18*/  .byte 0xac
/*0x7e19*/  .byte 0xe
/*0x7e1a*/  .byte 0xfb
/*0x7e1b*/  .byte 0xe
/*0x7e1c*/  .byte 0x4b
/*0x7e1d*/  .byte 0xf
/*0x7e1e*/  .byte 0x9c
/*0x7e1f*/  .byte 0xf
/*0x7e20*/  .byte 0xee
/*0x7e21*/  .byte 0xf
/*0x7e22*/  .byte 0x42
/*0x7e23*/  .byte 0x10
/*0x7e24*/  .byte 0x97
/*0x7e25*/  .byte 0x10
/*0x7e26*/  .byte 0xee
/*0x7e27*/  .byte 0x10
/*0x7e28*/  .byte 0x46
/*0x7e29*/  .byte 0x11
/*0x7e2a*/  .byte 0x9f
/*0x7e2b*/  .byte 0x11
/*0x7e2c*/  .byte 0xfa
/*0x7e2d*/  .byte 0x11
/*0x7e2e*/  .byte 0x56
/*0x7e2f*/  .byte 0x12
/*0x7e30*/  .byte 0xb4
/*0x7e31*/  .byte 0x12
/*0x7e32*/  .byte 0x13
/*0x7e33*/  .byte 0x13
/*0x7e34*/  .byte 0x73
/*0x7e35*/  .byte 0x13
/*0x7e36*/  .byte 0xd5
/*0x7e37*/  .byte 0x13
/*0x7e38*/  .byte 0x39
/*0x7e39*/  .byte 0x14
/*0x7e3a*/  .byte 0x9e
/*0x7e3b*/  .byte 0x14
/*0x7e3c*/  .byte 0x5
/*0x7e3d*/  .byte 0x15
/*0x7e3e*/  .byte 0x6e
/*0x7e3f*/  .byte 0x15
/*0x7e40*/  .byte 0xd8
/*0x7e41*/  .byte 0x15
/*0x7e42*/  .byte 0x44
/*0x7e43*/  .byte 0x16
/*0x7e44*/  .byte 0xb2
/*0x7e45*/  .byte 0x16
/*0x7e46*/  .byte 0x21
/*0x7e47*/  .byte 0x17
/*0x7e48*/  .byte 0x92
/*0x7e49*/  .byte 0x17
/*0x7e4a*/  .byte 0x5
/*0x7e4b*/  .byte 0x18
/*0x7e4c*/  .byte 0x7a
/*0x7e4d*/  .byte 0x18
/*0x7e4e*/  .byte 0xf0
/*0x7e4f*/  .byte 0x18
/*0x7e50*/  .byte 0x69
/*0x7e51*/  .byte 0x19
/*0x7e52*/  .byte 0xe3
/*0x7e53*/  .byte 0x19
/*0x7e54*/  .byte 0x5f
/*0x7e55*/  .byte 0x1a
/*0x7e56*/  .byte 0xde
/*0x7e57*/  .byte 0x1a
/*0x7e58*/  .byte 0x5e
/*0x7e59*/  .byte 0x1b
/*0x7e5a*/  .byte 0xe0
/*0x7e5b*/  .byte 0x1b
/*0x7e5c*/  .byte 0x65
/*0x7e5d*/  .byte 0x1c
/*0x7e5e*/  .byte 0xeb
/*0x7e5f*/  .byte 0x1c
/*0x7e60*/  .byte 0x74
/*0x7e61*/  .byte 0x1d
/*0x7e62*/  .byte 0xff
/*0x7e63*/  .byte 0x1d
/*0x7e64*/  .byte 0x8c
/*0x7e65*/  .byte 0x1e
/*0x7e66*/  .byte 0x1b
/*0x7e67*/  .byte 0x1f
/*0x7e68*/  .byte 0xac
/*0x7e69*/  .byte 0x1f
/*0x7e6a*/  .byte 0x40
/*0x7e6b*/  .byte 0x20
/*0x7e6c*/  .byte 0xd6
/*0x7e6d*/  .byte 0x20
/*0x7e6e*/  .byte 0x6f
/*0x7e6f*/  .byte 0x21
/*0x7e70*/  .byte 0xa
/*0x7e71*/  .byte 0x22
/*0x7e72*/  .byte 0xa8
/*0x7e73*/  .byte 0x22
/*0x7e74*/  .byte 0x48
/*0x7e75*/  .byte 0x23
/*0x7e76*/  .byte 0xea
/*0x7e77*/  .byte 0x23
/*0x7e78*/  .byte 0x8f
/*0x7e79*/  .byte 0x24
/*0x7e7a*/  .byte 0x37
/*0x7e7b*/  .byte 0x25
/*0x7e7c*/  .byte 0xe1
/*0x7e7d*/  .byte 0x25
/*0x7e7e*/  .byte 0x8e
/*0x7e7f*/  .byte 0x26
/*0x7e80*/  .byte 0x3e
/*0x7e81*/  .byte 0x27
/*0x7e82*/  .byte 0xf1
/*0x7e83*/  .byte 0x27
/*0x7e84*/  .byte 0xa6
/*0x7e85*/  .byte 0x28
/*0x7e86*/  .byte 0x5f
/*0x7e87*/  .byte 0x29
/*0x7e88*/  .byte 0x1a
/*0x7e89*/  .byte 0x2a
/*0x7e8a*/  .byte 0xd8
/*0x7e8b*/  .byte 0x2a
/*0x7e8c*/  .byte 0x99
/*0x7e8d*/  .byte 0x2b
/*0x7e8e*/  .byte 0x5e
/*0x7e8f*/  .byte 0x2c
/*0x7e90*/  .byte 0x25
/*0x7e91*/  .byte 0x2d
/*0x7e92*/  .byte 0xf0
/*0x7e93*/  .byte 0x2d
/*0x7e94*/  .byte 0xbe
/*0x7e95*/  .byte 0x2e
/*0x7e96*/  .byte 0x8f
/*0x7e97*/  .byte 0x2f
/*0x7e98*/  .byte 0x63
/*0x7e99*/  .byte 0x30
/*0x7e9a*/  .byte 0x3b
/*0x7e9b*/  .byte 0x31
/*0x7e9c*/  .byte 0x16
/*0x7e9d*/  .byte 0x32
/*0x7e9e*/  .byte 0xf5
/*0x7e9f*/  .byte 0x32
/*0x7ea0*/  .byte 0xd7
/*0x7ea1*/  .byte 0x33
/*0x7ea2*/  .byte 0xbd
/*0x7ea3*/  .byte 0x34
/*0x7ea4*/  .byte 0xa7
/*0x7ea5*/  .byte 0x35
/*0x7ea6*/  .byte 0x94
/*0x7ea7*/  .byte 0x36
/*0x7ea8*/  .byte 0x85
/*0x7ea9*/  .byte 0x37
/*0x7eaa*/  .byte 0x7a
/*0x7eab*/  .byte 0x38
/*0x7eac*/  .byte 0x72
/*0x7ead*/  .byte 0x39
/*0x7eae*/  .byte 0x6f
/*0x7eaf*/  .byte 0x3a
/*0x7eb0*/  .byte 0x70
/*0x7eb1*/  .byte 0x3b
/*0x7eb2*/  .byte 0x74
/*0x7eb3*/  .byte 0x3c
/*0x7eb4*/  .byte 0x7d
/*0x7eb5*/  .byte 0x3d
/*0x7eb6*/  .byte 0x8a
/*0x7eb7*/  .byte 0x3e
/*0x7eb8*/  .byte 0x9c
/*0x7eb9*/  .byte 0x3f
/*0x7eba*/  .byte 0xb1
/*0x7ebb*/  .byte 0x40
/*0x7ebc*/  .byte 0xcb
/*0x7ebd*/  .byte 0x41
/*0x7ebe*/  .byte 0xea
/*0x7ebf*/  .byte 0x42
/*0x7ec0*/  .byte 0xd
/*0x7ec1*/  .byte 0x44
/*0x7ec2*/  .byte 0x35
/*0x7ec3*/  .byte 0x45
/*0x7ec4*/  .byte 0x61
/*0x7ec5*/  .byte 0x46
/*0x7ec6*/  .byte 0x93
/*0x7ec7*/  .byte 0x47
/*0x7ec8*/  .byte 0xc9
/*0x7ec9*/  .byte 0x48
/*0x7eca*/  .byte 0x4
/*0x7ecb*/  .byte 0x4a
/*0x7ecc*/  .byte 0x44
/*0x7ecd*/  .byte 0x4b
/*0x7ece*/  .byte 0x89
/*0x7ecf*/  .byte 0x4c
/*0x7ed0*/  .byte 0xd3
/*0x7ed1*/  .byte 0x4d
/*0x7ed2*/  .byte 0x22
/*0x7ed3*/  .byte 0x4f
/*0x7ed4*/  .byte 0x77
/*0x7ed5*/  .byte 0x50
/*0x7ed6*/  .byte 0xd2
/*0x7ed7*/  .byte 0x51
/*0x7ed8*/  .byte 0x31
/*0x7ed9*/  .byte 0x53
/*0x7eda*/  .byte 0x97
/*0x7edb*/  .byte 0x54
/*0x7edc*/  .byte 0x2
/*0x7edd*/  .byte 0x56
/*0x7ede*/  .byte 0x72
/*0x7edf*/  .byte 0x57
/*0x7ee0*/  .byte 0xe9
/*0x7ee1*/  .byte 0x58
/*0x7ee2*/  .byte 0x66
/*0x7ee3*/  .byte 0x5a
/*0x7ee4*/  .byte 0xe8
/*0x7ee5*/  .byte 0x5b
/*0x7ee6*/  .byte 0x71
/*0x7ee7*/  .byte 0x5d
/*0x7ee8*/  .byte 0x0
/*0x7ee9*/  .byte 0x5f
/*0x7eea*/  .byte 0x95
/*0x7eeb*/  .byte 0x60
/*0x7eec*/  .byte 0x31
/*0x7eed*/  .byte 0x62
/*0x7eee*/  .byte 0xd3
/*0x7eef*/  .byte 0x63
/*0x7ef0*/  .byte 0x7c
/*0x7ef1*/  .byte 0x65
/*0x7ef2*/  .byte 0x2c
/*0x7ef3*/  .byte 0x67
/*0x7ef4*/  .byte 0xe3
/*0x7ef5*/  .byte 0x68
/*0x7ef6*/  .byte 0xa0
/*0x7ef7*/  .byte 0x6a
/*0x7ef8*/  .byte 0x65
/*0x7ef9*/  .byte 0x6c
/*0x7efa*/  .byte 0x31
/*0x7efb*/  .byte 0x6e
/*0x7efc*/  .byte 0x4
/*0x7efd*/  .byte 0x70
/*0x7efe*/  .byte 0xde
/*0x7eff*/  .byte 0x71
/*0x7f00*/  .byte 0xc0
/*0x7f01*/  .byte 0x73
/*0x7f02*/  .byte 0xaa
/*0x7f03*/  .byte 0x75
/*0x7f04*/  .byte 0x9c
/*0x7f05*/  .byte 0x77
/*0x7f06*/  .byte 0x95
/*0x7f07*/  .byte 0x79
/*0x7f08*/  .byte 0x96
/*0x7f09*/  .byte 0x7b
/*0x7f0a*/  .byte 0xa0
/*0x7f0b*/  .byte 0x7d
/*0x7f0c*/  .byte 0xb2
/*0x7f0d*/  .byte 0x7f
/*0x7f0e*/  .byte 0xcc
/*0x7f0f*/  .byte 0x81
/*0x7f10*/  .byte 0xef
/*0x7f11*/  .byte 0x83
/*0x7f12*/  .byte 0x1a
/*0x7f13*/  .byte 0x86
/*0x7f14*/  .byte 0x4f
/*0x7f15*/  .byte 0x88
/*0x7f16*/  .byte 0x8c
/*0x7f17*/  .byte 0x8a
/*0x7f18*/  .byte 0xd3
/*0x7f19*/  .byte 0x8c
/*0x7f1a*/  .byte 0x22
/*0x7f1b*/  .byte 0x8f
/*0x7f1c*/  .byte 0x7b
/*0x7f1d*/  .byte 0x91
/*0x7f1e*/  .byte 0xde
/*0x7f1f*/  .byte 0x93
/*0x7f20*/  .byte 0x4a
/*0x7f21*/  .byte 0x96
/*0x7f22*/  .byte 0xc0
/*0x7f23*/  .byte 0x98
/*0x7f24*/  .byte 0x40
/*0x7f25*/  .byte 0x9b
/*0x7f26*/  .byte 0xcb
/*0x7f27*/  .byte 0x9d
/*0x7f28*/  .byte 0x5f
/*0x7f29*/  .byte 0xa0
/*0x7f2a*/  .byte 0xff
/*0x7f2b*/  .byte 0xa2
/*0x7f2c*/  .byte 0xa8
/*0x7f2d*/  .byte 0xa5
/*0x7f2e*/  .byte 0x5d
/*0x7f2f*/  .byte 0xa8
/*0x7f30*/  .byte 0x1d
/*0x7f31*/  .byte 0xab
/*0x7f32*/  .byte 0xe8
/*0x7f33*/  .byte 0xad
/*0x7f34*/  .byte 0xbe
/*0x7f35*/  .byte 0xb0
/*0x7f36*/  .byte 0x9f
/*0x7f37*/  .byte 0xb3
/*0x7f38*/  .byte 0x8d
/*0x7f39*/  .byte 0xb6
/*0x7f3a*/  .byte 0x86
/*0x7f3b*/  .byte 0xb9
/*0x7f3c*/  .byte 0x8c
/*0x7f3d*/  .byte 0xbc
/*0x7f3e*/  .byte 0x9d
/*0x7f3f*/  .byte 0xbf
/*0x7f40*/  .byte 0xbc
/*0x7f41*/  .byte 0xc2
/*0x7f42*/  .byte 0xe6
/*0x7f43*/  .byte 0xc5
/*0x7f44*/  .byte 0x1e
/*0x7f45*/  .byte 0xc9
/*0x7f46*/  .byte 0x63
/*0x7f47*/  .byte 0xcc
/*0x7f48*/  .byte 0xb5
/*0x7f49*/  .byte 0xcf
/*0x7f4a*/  .byte 0x15
/*0x7f4b*/  .byte 0xd3
/*0x7f4c*/  .byte 0x82
/*0x7f4d*/  .byte 0xd6
/*0x7f4e*/  .byte 0xfd
/*0x7f4f*/  .byte 0xd9
/*0x7f50*/  .byte 0x87
/*0x7f51*/  .byte 0xdd
/*0x7f52*/  .byte 0x1f
/*0x7f53*/  .byte 0xe1
/*0x7f54*/  .byte 0xc5
/*0x7f55*/  .byte 0xe4
/*0x7f56*/  .byte 0x7a
/*0x7f57*/  .byte 0xe8
/*0x7f58*/  .byte 0x3f
/*0x7f59*/  .byte 0xec
/*0x7f5a*/  .byte 0x12
/*0x7f5b*/  .byte 0xf0
/*0x7f5c*/  .byte 0xf5
/*0x7f5d*/  .byte 0xf3
/*0x7f5e*/  .byte 0xe9
/*0x7f5f*/  .byte 0xf7
/*0x7f60*/  .byte 0xec
/*0x7f61*/  .byte 0xfb
/*0x7f62*/  .byte 0xff
/*0x7f63*/  .byte 0xff
/*0x7f64*/  .byte 0xe8
/*0x7f65*/  .byte 0xc0
/*0x7f66*/  .byte 0xc1
/*0x7f67*/  .byte 0xc2
/*0x7f68*/  .byte 0xc3
/*0x7f69*/  .byte 0x0
/*0x7f6a*/  .byte 0x0
/*0x7f6b*/  .byte 0x0
/*0x7f6c*/  .byte 0xd0
/*0x7f6d*/  .byte 0x80
/*0x7f6e*/  .byte 0x0
/*0x7f6f*/  .byte 0x0
/*0x7f70*/  .byte 0xd4
/*0x7f71*/  .byte 0x80
/*0x7f72*/  .byte 0x0
/*0x7f73*/  .byte 0x0
            usb_report1_desc:
/*0x7f74*/  .byte 0x6
/*0x7f75*/  .byte 0x0
/*0x7f76*/  .byte 0xff
/*0x7f77*/  .byte 0x9
/*0x7f78*/  .byte 0x1
/*0x7f79*/  .byte 0xa1
/*0x7f7a*/  .byte 0x1
/*0x7f7b*/  .byte 0x9
/*0x7f7c*/  .byte 0x2
/*0x7f7d*/  .byte 0x15
/*0x7f7e*/  .byte 0x0
/*0x7f7f*/  .byte 0x26
/*0x7f80*/  .byte 0xff
/*0x7f81*/  .byte 0x0
/*0x7f82*/  .byte 0x75
/*0x7f83*/  .byte 0x8
/*0x7f84*/  .byte 0x95
/*0x7f85*/  .byte 0x40
/*0x7f86*/  .byte 0x81
/*0x7f87*/  .byte 0x2
/*0x7f88*/  .byte 0x9
/*0x7f89*/  .byte 0x3
/*0x7f8a*/  .byte 0x15
/*0x7f8b*/  .byte 0x0
/*0x7f8c*/  .byte 0x26
/*0x7f8d*/  .byte 0xff
/*0x7f8e*/  .byte 0x0
/*0x7f8f*/  .byte 0x75
/*0x7f90*/  .byte 0x8
/*0x7f91*/  .byte 0x95
/*0x7f92*/  .byte 0x40
/*0x7f93*/  .byte 0x91
/*0x7f94*/  .byte 0x2
/*0x7f95*/  .byte 0xc0
/*0x7f96*/  .byte 0x0
/*0x7f97*/  .byte 0x0
            usb_report2_desc:
/*0x7f98*/  .byte 0x5
/*0x7f99*/  .byte 0x1
/*0x7f9a*/  .byte 0x9
/*0x7f9b*/  .byte 0x80
/*0x7f9c*/  .byte 0xa1
/*0x7f9d*/  .byte 0x1
/*0x7f9e*/  .byte 0x85
/*0x7f9f*/  .byte 0x1
/*0x7fa0*/  .byte 0x19
/*0x7fa1*/  .byte 0x81
/*0x7fa2*/  .byte 0x29
/*0x7fa3*/  .byte 0x83
/*0x7fa4*/  .byte 0x15
/*0x7fa5*/  .byte 0x0
/*0x7fa6*/  .byte 0x25
/*0x7fa7*/  .byte 0x1
/*0x7fa8*/  .byte 0x95
/*0x7fa9*/  .byte 0x3
/*0x7faa*/  .byte 0x75
/*0x7fab*/  .byte 0x1
/*0x7fac*/  .byte 0x81
/*0x7fad*/  .byte 0x2
/*0x7fae*/  .byte 0x95
/*0x7faf*/  .byte 0x1
/*0x7fb0*/  .byte 0x75
/*0x7fb1*/  .byte 0x5
/*0x7fb2*/  .byte 0x81
/*0x7fb3*/  .byte 0x1
/*0x7fb4*/  .byte 0xc0
/*0x7fb5*/  .byte 0x5
/*0x7fb6*/  .byte 0xc
/*0x7fb7*/  .byte 0x9
/*0x7fb8*/  .byte 0x1
/*0x7fb9*/  .byte 0xa1
/*0x7fba*/  .byte 0x1
/*0x7fbb*/  .byte 0x85
/*0x7fbc*/  .byte 0x2
/*0x7fbd*/  .byte 0x15
/*0x7fbe*/  .byte 0x0
/*0x7fbf*/  .byte 0x25
/*0x7fc0*/  .byte 0x1
/*0x7fc1*/  .byte 0x95
/*0x7fc2*/  .byte 0x12
/*0x7fc3*/  .byte 0x75
/*0x7fc4*/  .byte 0x1
/*0x7fc5*/  .byte 0xa
/*0x7fc6*/  .byte 0x83
/*0x7fc7*/  .byte 0x1
/*0x7fc8*/  .byte 0xa
/*0x7fc9*/  .byte 0x8a
/*0x7fca*/  .byte 0x1
/*0x7fcb*/  .byte 0xa
/*0x7fcc*/  .byte 0x92
/*0x7fcd*/  .byte 0x1
/*0x7fce*/  .byte 0xa
/*0x7fcf*/  .byte 0x94
/*0x7fd0*/  .byte 0x1
/*0x7fd1*/  .byte 0x9
/*0x7fd2*/  .byte 0xcd
/*0x7fd3*/  .byte 0x9
/*0x7fd4*/  .byte 0xb7
/*0x7fd5*/  .byte 0x9
/*0x7fd6*/  .byte 0xb6
/*0x7fd7*/  .byte 0x9
/*0x7fd8*/  .byte 0xb5
/*0x7fd9*/  .byte 0x9
/*0x7fda*/  .byte 0xe2
/*0x7fdb*/  .byte 0x9
/*0x7fdc*/  .byte 0xea
/*0x7fdd*/  .byte 0x9
/*0x7fde*/  .byte 0xe9
/*0x7fdf*/  .byte 0xa
/*0x7fe0*/  .byte 0x21
/*0x7fe1*/  .byte 0x2
/*0x7fe2*/  .byte 0xa
/*0x7fe3*/  .byte 0x23
/*0x7fe4*/  .byte 0x2
/*0x7fe5*/  .byte 0xa
/*0x7fe6*/  .byte 0x24
/*0x7fe7*/  .byte 0x2
/*0x7fe8*/  .byte 0xa
/*0x7fe9*/  .byte 0x25
/*0x7fea*/  .byte 0x2
/*0x7feb*/  .byte 0xa
/*0x7fec*/  .byte 0x26
/*0x7fed*/  .byte 0x2
/*0x7fee*/  .byte 0xa
/*0x7fef*/  .byte 0x27
/*0x7ff0*/  .byte 0x2
/*0x7ff1*/  .byte 0xa
/*0x7ff2*/  .byte 0x2a
/*0x7ff3*/  .byte 0x2
/*0x7ff4*/  .byte 0x81
/*0x7ff5*/  .byte 0x2
/*0x7ff6*/  .byte 0x95
/*0x7ff7*/  .byte 0x1
/*0x7ff8*/  .byte 0x75
/*0x7ff9*/  .byte 0xe
/*0x7ffa*/  .byte 0x81
/*0x7ffb*/  .byte 0x1
/*0x7ffc*/  .byte 0xc0
/*0x7ffd*/  .byte 0x5
/*0x7ffe*/  .byte 0x1
/*0x7fff*/  .byte 0x9
/*0x8000*/  .byte 0x6
/*0x8001*/  .byte 0xa1
/*0x8002*/  .byte 0x1
/*0x8003*/  .byte 0x85
/*0x8004*/  .byte 0x4
/*0x8005*/  .byte 0x5
/*0x8006*/  .byte 0x7
/*0x8007*/  .byte 0x95
/*0x8008*/  .byte 0x1
/*0x8009*/  .byte 0x75
/*0x800a*/  .byte 0x8
/*0x800b*/  .byte 0x81
/*0x800c*/  .byte 0x3
/*0x800d*/  .byte 0x95
/*0x800e*/  .byte 0xe8
/*0x800f*/  .byte 0x75
/*0x8010*/  .byte 0x1
/*0x8011*/  .byte 0x15
/*0x8012*/  .byte 0x0
/*0x8013*/  .byte 0x25
/*0x8014*/  .byte 0x1
/*0x8015*/  .byte 0x5
/*0x8016*/  .byte 0x7
/*0x8017*/  .byte 0x19
/*0x8018*/  .byte 0x0
/*0x8019*/  .byte 0x29
/*0x801a*/  .byte 0xe7
/*0x801b*/  .byte 0x81
/*0x801c*/  .byte 0x0
/*0x801d*/  .byte 0xc0
/*0x801e*/  .byte 0x0
/*0x801f*/  .byte 0x0
            usb_report0_desc:
/*0x8020*/  .byte 0x5
/*0x8021*/  .byte 0x1
/*0x8022*/  .byte 0x9
/*0x8023*/  .byte 0x6
/*0x8024*/  .byte 0xa1
/*0x8025*/  .byte 0x1
/*0x8026*/  .byte 0x5
/*0x8027*/  .byte 0x7
/*0x8028*/  .byte 0x19
/*0x8029*/  .byte 0xe0
/*0x802a*/  .byte 0x29
/*0x802b*/  .byte 0xe7
/*0x802c*/  .byte 0x15
/*0x802d*/  .byte 0x0
/*0x802e*/  .byte 0x25
/*0x802f*/  .byte 0x1
/*0x8030*/  .byte 0x75
/*0x8031*/  .byte 0x1
/*0x8032*/  .byte 0x95
/*0x8033*/  .byte 0x8
/*0x8034*/  .byte 0x81
/*0x8035*/  .byte 0x2
/*0x8036*/  .byte 0x95
/*0x8037*/  .byte 0x1
/*0x8038*/  .byte 0x75
/*0x8039*/  .byte 0x8
/*0x803a*/  .byte 0x81
/*0x803b*/  .byte 0x3
/*0x803c*/  .byte 0x95
/*0x803d*/  .byte 0x3
/*0x803e*/  .byte 0x75
/*0x803f*/  .byte 0x1
/*0x8040*/  .byte 0x5
/*0x8041*/  .byte 0x8
/*0x8042*/  .byte 0x19
/*0x8043*/  .byte 0x1
/*0x8044*/  .byte 0x29
/*0x8045*/  .byte 0x3
/*0x8046*/  .byte 0x91
/*0x8047*/  .byte 0x2
/*0x8048*/  .byte 0x95
/*0x8049*/  .byte 0x1
/*0x804a*/  .byte 0x75
/*0x804b*/  .byte 0x5
/*0x804c*/  .byte 0x91
/*0x804d*/  .byte 0x3
/*0x804e*/  .byte 0x95
/*0x804f*/  .byte 0x6
/*0x8050*/  .byte 0x75
/*0x8051*/  .byte 0x8
/*0x8052*/  .byte 0x15
/*0x8053*/  .byte 0x0
/*0x8054*/  .byte 0x26
/*0x8055*/  .byte 0xa4
/*0x8056*/  .byte 0x0
/*0x8057*/  .byte 0x5
/*0x8058*/  .byte 0x7
/*0x8059*/  .byte 0x19
/*0x805a*/  .byte 0x0
/*0x805b*/  .byte 0x29
/*0x805c*/  .byte 0xa4
/*0x805d*/  .byte 0x81
/*0x805e*/  .byte 0x0
/*0x805f*/  .byte 0xc0
            usb_config_desc:
/*0x8060*/  .byte 0x9
/*0x8061*/  .byte 0x2
/*0x8062*/  .byte 0x5b
/*0x8063*/  .byte 0x0
/*0x8064*/  .byte 0x3
/*0x8065*/  .byte 0x1
/*0x8066*/  .byte 0x0
/*0x8067*/  .byte 0xa0
/*0x8068*/  .byte 0x32
            usb_interface0_desc:
/*0x8069*/  .byte 0x9
/*0x806a*/  .byte 0x4
/*0x806b*/  .byte 0x0
/*0x806c*/  .byte 0x0
/*0x806d*/  .byte 0x1
/*0x806e*/  .byte 0x3
/*0x806f*/  .byte 0x1
/*0x8070*/  .byte 0x1
/*0x8071*/  .byte 0x0
            usb_hid0_desc:
/*0x8072*/  .byte 0x9
/*0x8073*/  .byte 0x21
/*0x8074*/  .byte 0x11
/*0x8075*/  .byte 0x1
/*0x8076*/  .byte 0x0
/*0x8077*/  .byte 0x1
/*0x8078*/  .byte 0x22
/*0x8079*/  .byte 0x40
/*0x807a*/  .byte 0x0
            usb_endpoint1_desc:
/*0x807b*/  .byte 0x7
/*0x807c*/  .byte 0x5
/*0x807d*/  .byte 0x81
/*0x807e*/  .byte 0x3
/*0x807f*/  .byte 0x8
/*0x8080*/  .byte 0x0
/*0x8081*/  .byte 0x1
            usb_interface1_desc:
/*0x8082*/  .byte 0x9
/*0x8083*/  .byte 0x4
/*0x8084*/  .byte 0x1
/*0x8085*/  .byte 0x0
/*0x8086*/  .byte 0x2
/*0x8087*/  .byte 0x3
/*0x8088*/  .byte 0x0
/*0x8089*/  .byte 0x0
/*0x808a*/  .byte 0x0
            usb_hid1_desc:
/*0x808b*/  .byte 0x9
/*0x808c*/  .byte 0x21
/*0x808d*/  .byte 0x11
/*0x808e*/  .byte 0x1
/*0x808f*/  .byte 0x0
/*0x8090*/  .byte 0x1
/*0x8091*/  .byte 0x22
/*0x8092*/  .byte 0x22
/*0x8093*/  .byte 0x0
            usb_endpoint3_desc:
/*0x8094*/  .byte 0x7
/*0x8095*/  .byte 0x5
/*0x8096*/  .byte 0x83
/*0x8097*/  .byte 0x3
/*0x8098*/  .byte 0x40
/*0x8099*/  .byte 0x0
/*0x809a*/  .byte 0x1
            usb_endpoint4_desc:
/*0x809b*/  .byte 0x7
/*0x809c*/  .byte 0x5
/*0x809d*/  .byte 0x4
/*0x809e*/  .byte 0x3
/*0x809f*/  .byte 0x40
/*0x80a0*/  .byte 0x0
/*0x80a1*/  .byte 0x1
            usb_interface2_desc:
/*0x80a2*/  .byte 0x9
/*0x80a3*/  .byte 0x4
/*0x80a4*/  .byte 0x2
/*0x80a5*/  .byte 0x0
/*0x80a6*/  .byte 0x1
/*0x80a7*/  .byte 0x3
/*0x80a8*/  .byte 0x0
/*0x80a9*/  .byte 0x0
/*0x80aa*/  .byte 0x0
            usb_hid2_desc:
/*0x80ab*/  .byte 0x9
/*0x80ac*/  .byte 0x21
/*0x80ad*/  .byte 0x11
/*0x80ae*/  .byte 0x1
/*0x80af*/  .byte 0x0
/*0x80b0*/  .byte 0x1
/*0x80b1*/  .byte 0x22
            usb_endpoint2_desc:
/*0x80b2*/  .byte 0x86
/*0x80b3*/  .byte 0x0
/*0x80b4*/  .byte 0x7
/*0x80b5*/  .byte 0x5
/*0x80b6*/  .byte 0x82
/*0x80b7*/  .byte 0x3
/*0x80b8*/  .byte 0x40
/*0x80b9*/  .byte 0x0
/*0x80ba*/  .byte 0x1
/*0x80bb*/  .byte 0x0
            usb_device_desc:
/*0x80bc*/  .byte 0x12
/*0x80bd*/  .byte 0x1
/*0x80be*/  .byte 0x10
/*0x80bf*/  .byte 0x1
/*0x80c0*/  .byte 0x0
/*0x80c1*/  .byte 0x0
/*0x80c2*/  .byte 0x0
/*0x80c3*/  .byte 0x40
/*0x80c4*/  .byte 0xd9
/*0x80c5*/  .byte 0x4
/*0x80c6*/  .byte 0x67
/*0x80c7*/  .byte 0x1
/*0x80c8*/  .byte 0x3
/*0x80c9*/  .byte 0x11
/*0x80ca*/  .byte 0x0
/*0x80cb*/  .byte 0x1
/*0x80cc*/  .byte 0x0
/*0x80cd*/  .byte 0x1
/*0x80ce*/  .byte 0x0
/*0x80cf*/  .byte 0x0
            usb_str0_desc:
/*0x80d0*/  .byte 0x4
/*0x80d1*/  .byte 0x3
/*0x80d2*/  .byte 0x9
/*0x80d3*/  .byte 0x4
            usb_str1_desc:
/*0x80d4*/  .byte 0x22
/*0x80d5*/  .byte 0x3
/*0x80d6*/  .byte 0x55
/*0x80d7*/  .byte 0x0
/*0x80d8*/  .byte 0x53
/*0x80d9*/  .byte 0x0
/*0x80da*/  .byte 0x42
/*0x80db*/  .byte 0x0
/*0x80dc*/  .byte 0x2d
/*0x80dd*/  .byte 0x0
/*0x80de*/  .byte 0x48
/*0x80df*/  .byte 0x0
/*0x80e0*/  .byte 0x49
/*0x80e1*/  .byte 0x0
/*0x80e2*/  .byte 0x44
/*0x80e3*/  .byte 0x0
/*0x80e4*/  .byte 0x20
/*0x80e5*/  .byte 0x0
/*0x80e6*/  .byte 0x4b
/*0x80e7*/  .byte 0x0
/*0x80e8*/  .byte 0x65
/*0x80e9*/  .byte 0x0
/*0x80ea*/  .byte 0x79
/*0x80eb*/  .byte 0x0
/*0x80ec*/  .byte 0x62
/*0x80ed*/  .byte 0x0
/*0x80ee*/  .byte 0x6f
/*0x80ef*/  .byte 0x0
/*0x80f0*/  .byte 0x61
/*0x80f1*/  .byte 0x0
/*0x80f2*/  .byte 0x72
/*0x80f3*/  .byte 0x0
/*0x80f4*/  .byte 0x64
/*0x80f5*/  .byte 0x0
/*0x80f6*/  .byte 0x0
/*0x80f7*/  .byte 0x0
/*0x80f8*/  .byte 0x29
/*0x80f9*/  .byte 0x66
/*0x80fa*/  .byte 0x0
/*0x80fb*/  .byte 0x0
/*0x80fc*/  .byte 0x0
/*0x80fd*/  .byte 0x0
/*0x80fe*/  .byte 0x0
/*0x80ff*/  .byte 0x0
/*0x8100*/  .byte 0xb9
/*0x8101*/  .byte 0x74
/*0x8102*/  .byte 0x0
/*0x8103*/  .byte 0x0
/*0x8104*/  .byte 0x0
/*0x8105*/  .byte 0x0
/*0x8106*/  .byte 0x0
/*0x8107*/  .byte 0x0
/*0x8108*/  .byte 0x0
/*0x8109*/  .byte 0x0
/*0x810a*/  .byte 0x0
/*0x810b*/  .byte 0x0
/*0x810c*/  .byte 0xb9
/*0x810d*/  .byte 0x73
/*0x810e*/  .byte 0x0
/*0x810f*/  .byte 0x0
/*0x8110*/  .byte 0xad
/*0x8111*/  .byte 0x72
/*0x8112*/  .byte 0x0
/*0x8113*/  .byte 0x0
/*0x8114*/  .byte 0xff
/*0x8115*/  .byte 0xff
/*0x8116*/  .byte 0xff
/*0x8117*/  .byte 0x8
/*0x8118*/  .byte 0x3
/*0x8119*/  .byte 0x0
/*0x811a*/  .byte 0x0
/*0x811b*/  .byte 0x0
            task_1:
/*0x811c*/  .byte 0x3c
/*0x811d*/  .byte 0x81
/*0x811e*/  .byte 0x0
/*0x811f*/  .byte 0x0
/*0x8120*/  .byte 0x0
/*0x8121*/  .byte 0x0
/*0x8122*/  .byte 0x0
/*0x8123*/  .byte 0x20
/*0x8124*/  .byte 0x68
/*0x8125*/  .byte 0x0
/*0x8126*/  .byte 0x0
/*0x8127*/  .byte 0x0
/*0x8128*/  .byte 0x4c
/*0x8129*/  .byte 0x78
/*0x812a*/  .byte 0x0
/*0x812b*/  .byte 0x0
            task_2:
/*0x812c*/  .byte 0xa4
/*0x812d*/  .byte 0x81
/*0x812e*/  .byte 0x0
/*0x812f*/  .byte 0x0
/*0x8130*/  .byte 0x68
/*0x8131*/  .byte 0x0
/*0x8132*/  .byte 0x0
/*0x8133*/  .byte 0x20
/*0x8134*/  .byte 0x78
/*0x8135*/  .byte 0x21
/*0x8136*/  .byte 0x0
/*0x8137*/  .byte 0x0
/*0x8138*/  .byte 0x5c
/*0x8139*/  .byte 0x78
/*0x813a*/  .byte 0x0
/*0x813b*/  .byte 0x0
            sram_init_data:
/*0x813c*/  .byte 0x0
/*0x813d*/  .byte 0x0
/*0x813e*/  .byte 0x0
/*0x813f*/  .byte 0x0
/*0x8140*/  .byte 0x0
/*0x8141*/  .byte 0x0
/*0x8142*/  .byte 0x0
/*0x8143*/  .byte 0x0
/*0x8144*/  .byte 0x0
/*0x8145*/  .byte 0x0
/*0x8146*/  .byte 0x0
/*0x8147*/  .byte 0x0
/*0x8148*/  .byte 0x0
/*0x8149*/  .byte 0x0
/*0x814a*/  .byte 0x0
/*0x814b*/  .byte 0x0
/*0x814c*/  .byte 0x0
/*0x814d*/  .byte 0xa2
/*0x814e*/  .byte 0x4a
/*0x814f*/  .byte 0x4
/*0x8150*/  .byte 0x1
/*0x8151*/  .byte 0x0
/*0x8152*/  .byte 0x0
/*0x8153*/  .byte 0x0
/*0x8154*/  .byte 0x0
/*0x8155*/  .byte 0x0
/*0x8156*/  .byte 0x0
/*0x8157*/  .byte 0x0
/*0x8158*/  .byte 0x0
/*0x8159*/  .byte 0x0
/*0x815a*/  .byte 0x0
/*0x815b*/  .byte 0x0
/*0x815c*/  .byte 0xff
/*0x815d*/  .byte 0x0
/*0x815e*/  .byte 0x0
/*0x815f*/  .byte 0x0
/*0x8160*/  .byte 0x5c
/*0x8161*/  .byte 0x7d
/*0x8162*/  .byte 0x0
/*0x8163*/  .byte 0x0
/*0x8164*/  .byte 0x0
/*0x8165*/  .byte 0xff
/*0x8166*/  .byte 0x0
/*0x8167*/  .byte 0x0
/*0x8168*/  .byte 0x0
/*0x8169*/  .byte 0x0
/*0x816a*/  .byte 0x0
/*0x816b*/  .byte 0x0
/*0x816c*/  .byte 0x0
/*0x816d*/  .byte 0x0
/*0x816e*/  .byte 0x0
/*0x816f*/  .byte 0x0
/*0x8170*/  .byte 0x0
/*0x8171*/  .byte 0x0
/*0x8172*/  .byte 0x0
/*0x8173*/  .byte 0x0
/*0x8174*/  .byte 0x1
/*0x8175*/  .byte 0x0
/*0x8176*/  .byte 0x0
/*0x8177*/  .byte 0x0
/*0x8178*/  .byte 0x0
/*0x8179*/  .byte 0x0
/*0x817a*/  .byte 0x0
/*0x817b*/  .byte 0x0
/*0x817c*/  .byte 0x0
/*0x817d*/  .byte 0x0
/*0x817e*/  .byte 0x0
/*0x817f*/  .byte 0x0
/*0x8180*/  .byte 0x0
/*0x8181*/  .byte 0x0
/*0x8182*/  .byte 0x0
/*0x8183*/  .byte 0x0
/*0x8184*/  .byte 0x0
/*0x8185*/  .byte 0x0
/*0x8186*/  .byte 0x0
/*0x8187*/  .byte 0x0
/*0x8188*/  .byte 0x0
/*0x8189*/  .byte 0x0
/*0x818a*/  .byte 0x0
/*0x818b*/  .byte 0x0
/*0x818c*/  .byte 0x0
/*0x818d*/  .byte 0x0
/*0x818e*/  .byte 0x0
/*0x818f*/  .byte 0x0
/*0x8190*/  .byte 0x0
/*0x8191*/  .byte 0x0
/*0x8192*/  .byte 0x0
/*0x8193*/  .byte 0x0
/*0x8194*/  .byte 0xca
/*0x8195*/  .byte 0x9
/*0x8196*/  .byte 0x0
/*0x8197*/  .byte 0x20
/*0x8198*/  .byte 0x0
/*0x8199*/  .byte 0x0
/*0x819a*/  .byte 0x0
/*0x819b*/  .byte 0x0
/*0x819c*/  .byte 0x0
/*0x819d*/  .byte 0x0
/*0x819e*/  .byte 0x0
/*0x819f*/  .byte 0x0
/*0x81a0*/  .byte 0x0
/*0x81a1*/  .byte 0x0
/*0x81a2*/  .byte 0x0
/*0x81a3*/  .byte 0x0
