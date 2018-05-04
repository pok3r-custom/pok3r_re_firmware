.syntax unified
.cpu cortex-m3
.text
.thumb


            vectors:
/*0x3400*/  .word 0x20003fe0
/*0x3404*/  .word reset
/*0x3408*/  .word nmi
/*0x340c*/  .word hard_fault
/*0x3410*/  .word mcu_fault
/*0x3414*/  .word bus_fault
/*0x3418*/  .word usage_fault

/*0x341c*/  .byte 0x00
/*0x341d*/  .byte 0x00
/*0x341e*/  .byte 0x00
/*0x341f*/  .byte 0x00
/*0x3420*/  .byte 0x00
/*0x3421*/  .byte 0x00
/*0x3422*/  .byte 0x00
/*0x3423*/  .byte 0x00
/*0x3424*/  .byte 0x00
/*0x3425*/  .byte 0x00
/*0x3426*/  .byte 0x00
/*0x3427*/  .byte 0x00
/*0x3428*/  .byte 0x00
/*0x3429*/  .byte 0x00
/*0x342a*/  .byte 0x00
/*0x342b*/  .byte 0x00

/*0x342c*/  .word svccall_intr
/*0x3430*/  .word debug_intr

/*0x3434*/  .byte 0x00
/*0x3435*/  .byte 0x00
/*0x3436*/  .byte 0x00
/*0x3437*/  .byte 0x00

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

/*0x34a8*/  .byte 0x00
/*0x34a9*/  .byte 0x00
/*0x34aa*/  .byte 0x00
/*0x34ab*/  .byte 0x00

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

/*0x34d4*/  .byte 0x00
/*0x34d5*/  .byte 0x00
/*0x34d6*/  .byte 0x00
/*0x34d7*/  .byte 0x00
/*0x34d8*/  .byte 0x00
/*0x34d9*/  .byte 0x00
/*0x34da*/  .byte 0x00
/*0x34db*/  .byte 0x00
/*0x34dc*/  .byte 0x00
/*0x34dd*/  .byte 0x00
/*0x34de*/  .byte 0x00
/*0x34df*/  .byte 0x00
/*0x34e0*/  .byte 0x00
/*0x34e1*/  .byte 0x00
/*0x34e2*/  .byte 0x00
/*0x34e3*/  .byte 0x00

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

/*0x3518*/  .byte 0x00
/*0x3519*/  .byte 0x00
/*0x351a*/  .byte 0x00
/*0x351b*/  .byte 0x00

/*0x351c*/  .word generic_intr
/*0x3520*/  .word generic_intr
/*0x3524*/  .word generic_intr
/*0x3528*/  .word generic_intr
/*0x352c*/  .word generic_intr
/*0x3530*/  .word generic_intr
/*0x3534*/  .word generic_intr
/*0x3538*/  .word generic_intr

/*0x353c*/  .byte 0x00
/*0x353d*/  .byte 0x00
/*0x353e*/  .byte 0x00
/*0x353f*/  .byte 0x00
/*0x3540*/  .byte 0x00
/*0x3541*/  .byte 0x00
/*0x3542*/  .byte 0x00
/*0x3543*/  .byte 0x00
/*0x3544*/  .byte 0x00
/*0x3545*/  .byte 0x00
/*0x3546*/  .byte 0x00
/*0x3547*/  .byte 0x00
/*0x3548*/  .byte 0x00
/*0x3549*/  .byte 0x00
/*0x354a*/  .byte 0x00
/*0x354b*/  .byte 0x00
/*0x354c*/  .byte 0x00
/*0x354d*/  .byte 0x00
/*0x354e*/  .byte 0x00
/*0x354f*/  .byte 0x00

/*0x3550*/  .word generic_intr


            .thumb_func
            reset:
/*0x3554*/      ldr r0, [pc, #0x18] /* data_3570 */
/*0x3556*/      blx r0 /* call_3768 */
/*0x3558*/      ldr r0, [pc, #0x18] /* data_3574 */
/*0x355a*/      bx r0 /* jump_3578 */

            .thumb_func
            nmi:
/*0x355c*/      b nmi

            .thumb_func
            hard_fault:
/*0x355e*/      b hard_fault

            .thumb_func
            mcu_fault:
/*0x3560*/      b mcu_fault

            .thumb_func
            bus_fault:
/*0x3562*/      b bus_fault

            .thumb_func
            usage_fault:
/*0x3564*/      b usage_fault

            .thumb_func
            svccall_intr:
/*0x3566*/      b svccall_intr

            .thumb_func
            debug_intr:
/*0x3568*/      b debug_intr

            .thumb_func
            pendsv_intr:
/*0x356a*/      b pendsv_intr

            .thumb_func
            systick_intr:
/*0x356c*/      b systick_intr

            .thumb_func
            generic_intr:
/*0x356e*/      b generic_intr

            data_3570:
/*0x3570*/  .word call_3768
            data_3574:
/*0x3574*/  .word jump_3578


            .thumb_func
            jump_3578:
/*0x3578*/      ldr.w sp, [pc, #0xc] /* data_3588 */
/*0x357c*/      bl call_35f0

            .thumb_func
            call_3580:
/*0x3580*/      ldr r0, [pc, #0] /* data_3584 */
/*0x3582*/      bx r0 /* main */

            data_3584:
/*0x3584*/  .word main
            data_3588:
/*0x3588*/  .word 0x20003fe0


            .thumb_func
            call_358c:
/*0x358c*/      orr.w r3, r0, r1
/*0x3590*/      lsls r3, r3, #0x1e
/*0x3592*/      beq jump_359c
/*0x3594*/      b jump_35aa
            jump_3596:
/*0x3596*/      ldm r1!, {r3}
/*0x3598*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x359a*/      stm r0!, {r3}
            jump_359c:
/*0x359c*/      cmp r2, #4
/*0x359e*/      bhs jump_3596
/*0x35a0*/      b jump_35aa
            jump_35a2:
/*0x35a2*/      ldrb r3, [r1], #1
/*0x35a6*/      strb r3, [r0], #1
            jump_35aa:
/*0x35aa*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x35ac*/      bhs jump_35a2
/*0x35ae*/      bx lr

            .thumb_func
            call_35b0:
/*0x35b0*/      uxtb r2, r2
/*0x35b2*/      b jump_35b8
            jump_35b4:
/*0x35b4*/      strb r2, [r0], #1
            jump_35b8:
/*0x35b8*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x35ba*/      bhs jump_35b4
/*0x35bc*/      bx lr

            .thumb_func
            call_35be:
/*0x35be*/      movs r2, #0
/*0x35c0*/      b call_35b0

            .thumb_func
            loc_35c2:
/*0x35c2*/      push {r4, lr}
/*0x35c4*/      mov r3, r2
/*0x35c6*/      mov r2, r1
/*0x35c8*/      mov r4, r0
/*0x35ca*/      mov r1, r3
/*0x35cc*/      bl call_35b0
/*0x35d0*/      mov r0, r4
/*0x35d2*/      pop {r4, pc}

            .thumb_func
            call_35d4:
/*0x35d4*/      push {r4, r5, lr}
/*0x35d6*/      mov r4, r0
/*0x35d8*/      movs r0, #0
/*0x35da*/      mov r3, r0
/*0x35dc*/      b jump_35e0
            jump_35de:
/*0x35de*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_35e0:
/*0x35e0*/      cmp r3, r2
/*0x35e2*/      bhs jump_35ec
/*0x35e4*/      ldrb r0, [r4, r3]
/*0x35e6*/      ldrb r5, [r1, r3]
/*0x35e8*/      subs r0, r0, r5
/*0x35ea*/      beq jump_35de
            jump_35ec:
/*0x35ec*/      pop {r4, r5, pc}

/*0x35ee*/  .byte 0x00
/*0x35ef*/  .byte 0x00


            .thumb_func
            call_35f0:
/*0x35f0*/      ldr r4, [pc, #0x18] /* data_360c */
/*0x35f2*/      ldr r5, [pc, #0x1c] /* data_3610 */
/*0x35f4*/      b jump_3604
            jump_35f6:
/*0x35f6*/      ldr r0, [r4, #0xc]
/*0x35f8*/      orr r3, r0, #1
/*0x35fc*/      ldm.w r4, {r0, r1, r2}
/*0x3600*/      blx r3
/*0x3602*/      adds r4, #0x10
            jump_3604:
/*0x3604*/      cmp r4, r5
/*0x3606*/      blo jump_35f6
/*0x3608*/      bl call_3580
            data_360c:
/*0x360c*/      strh r0, [r7, #0xe]
/*0x360e*/      movs r0, r0
            data_3610:
/*0x3610*/      strh r0, [r3, #0x10]
/*0x3612*/      movs r0, r0

            .thumb_func
            bftm0_intr:
/*0x3614*/      push {r4, lr}
/*0x3616*/      ldr r0, [pc, #0x60] /* data_3678 */
/*0x3618*/      bl call_3728
/*0x361c*/      bl call_61b4
/*0x3620*/      ldr r0, [pc, #0x58] /* data_367c */
/*0x3622*/      ldrh r1, [r0]
/*0x3624*/      cbz r1, jump_362c
/*0x3626*/      ldrh r1, [r0]
/*0x3628*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x362a*/      strh r1, [r0]
            jump_362c:
/*0x362c*/      ldr r0, [pc, #0x50] /* data_3680 */
/*0x362e*/      ldrh r1, [r0]
/*0x3630*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3632*/      strh r1, [r0]
/*0x3634*/      ldr r0, [pc, #0x4c] /* data_3684 */
/*0x3636*/      ldr r1, [r0]
/*0x3638*/      cbz r1, jump_3640
/*0x363a*/      ldr r1, [r0]
/*0x363c*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x363e*/      str r1, [r0]
            jump_3640:
/*0x3640*/      ldr r0, [pc, #0x44] /* data_3688 */
/*0x3642*/      ldr r1, [r0]
/*0x3644*/      cbz r1, jump_364c
/*0x3646*/      ldr r1, [r0]
/*0x3648*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x364a*/      str r1, [r0]
            jump_364c:
/*0x364c*/      ldr r0, [pc, #0x3c] /* data_368c */
/*0x364e*/      ldrb r1, [r0]
/*0x3650*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3652*/      strb r1, [r0]
/*0x3654*/      ldr r1, [pc, #0x38] /* data_3690 */
/*0x3656*/      ldrh r0, [r1]
/*0x3658*/      cmp r0, #1
/*0x365a*/      bls jump_3660
/*0x365c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x365e*/      strh r0, [r1]
            jump_3660:
/*0x3660*/      ldr r0, [pc, #0x30] /* data_3694 */
/*0x3662*/      ldrh r1, [r0]
/*0x3664*/      cmp r1, #0
/*0x3666*/      beq jump_3676
/*0x3668*/      ldrh r1, [r0]
/*0x366a*/      cmp.w r1, #0xff00
/*0x366e*/      bhs jump_3676
/*0x3670*/      ldrh r1, [r0]
/*0x3672*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x3674*/      strh r1, [r0]
            jump_3676:
/*0x3676*/      pop {r4, pc}

            data_3678:
/*0x3678*/  .word 0x40076000
            data_367c:
/*0x367c*/  .word 0x2000081a
            data_3680:
/*0x3680*/  .word 0x20000056
            data_3684:
/*0x3684*/  .word 0x20000050
            data_3688:
/*0x3688*/  .word 0x20001b78
            data_368c:
/*0x368c*/  .word 0x20000749
            data_3690:
/*0x3690*/  .word 0x20000012
            data_3694:
/*0x3694*/  .word 0x20000192


            .thumb_func
            bftm1_intr:
/*0x3698*/      push {r4, r5, r6, lr}
/*0x369a*/      ldr r6, [pc, #0x74] /* data_3710 */
/*0x369c*/      movs r5, #2
/*0x369e*/      str r5, [r6, #0x24]
/*0x36a0*/      movs r0, #0xa
/*0x36a2*/      bl call_3794
/*0x36a6*/      movs r0, #2
/*0x36a8*/      bl call_6f4c
/*0x36ac*/      ldr r1, [pc, #0x64] /* data_3714 */
/*0x36ae*/      lsls r0, r5, #0xe
/*0x36b0*/      str r0, [r1, #0x24]
/*0x36b2*/      ldr r4, [pc, #0x64] /* data_3718 */
/*0x36b4*/      ldr r1, [pc, #0x64] /* data_371c */
/*0x36b6*/      ldrb r0, [r4, #1]
/*0x36b8*/      strb r0, [r1, #1]
/*0x36ba*/      lsls r1, r0, #0x1f
/*0x36bc*/      beq jump_36f2
/*0x36be*/      movs r1, #0
            jump_36c0:
/*0x36c0*/      movs r2, #0x10
/*0x36c2*/      lsls r2, r1
/*0x36c4*/      ldr r1, [pc, #0x58] /* data_3720 */
/*0x36c6*/      str r2, [r1, #0x24]
/*0x36c8*/      mvn.w r2, r0, lsl #30
/*0x36cc*/      lsrs r2, r2, #0x1f
/*0x36ce*/      lsls r3, r2, #4
/*0x36d0*/      movs r2, #0x20
/*0x36d2*/      lsls r2, r3
/*0x36d4*/      str r2, [r1, #0x24]
/*0x36d6*/      mvn.w r2, r0, lsl #29
/*0x36da*/      lsrs r2, r2, #0x1f
/*0x36dc*/      lsls r3, r2, #4
/*0x36de*/      movs r2, #0x40
/*0x36e0*/      lsls r2, r3
/*0x36e2*/      str r2, [r1, #0x24]
/*0x36e4*/      str r5, [r6, #0x28]
/*0x36e6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x36e8*/      ands r0, r0, #7
/*0x36ec*/      strb r0, [r4, #1]
/*0x36ee*/      beq jump_36f6
/*0x36f0*/      b jump_3702
            jump_36f2:
/*0x36f2*/      movs r1, #0x10
/*0x36f4*/      b jump_36c0
            jump_36f6:
/*0x36f6*/      ldrb r0, [r4]
/*0x36f8*/      cbz r0, jump_3702
/*0x36fa*/      bl call_6304
/*0x36fe*/      movs r0, #0
/*0x3700*/      strb r0, [r4]
            jump_3702:
/*0x3702*/      bl call_651c
/*0x3706*/      pop.w {r4, r5, r6, lr}
/*0x370a*/      ldr r0, [pc, #0x18] /* data_3724 */
/*0x370c*/      b.w call_3728

            data_3710:
/*0x3710*/  .word 0x400b2000
            data_3714:
/*0x3714*/  .word 0x400b0000
            data_3718:
/*0x3718*/  .word 0x20000324
            data_371c:
/*0x371c*/  .word 0x20000008
            data_3720:
/*0x3720*/  .word 0x400b4000
            data_3724:
/*0x3724*/  .word 0x40077000


            .thumb_func
            call_3728:
/*0x3728*/      ldr r1, [r0, #4]
/*0x372a*/      bic r1, r1, #1
/*0x372e*/      str r1, [r0, #4]
/*0x3730*/      dsb sy
/*0x3734*/      bx lr

            .thumb_func
            call_3736:
/*0x3736*/      cmp r1, #0
/*0x3738*/      ldr r1, [r0]
/*0x373a*/      beq jump_3742
/*0x373c*/      orr r1, r1, #4
/*0x3740*/      b jump_3746
            jump_3742:
/*0x3742*/      bic r1, r1, #4
            jump_3746:
/*0x3746*/      str r1, [r0]
/*0x3748*/      bx lr

            .thumb_func
            call_374a:
/*0x374a*/      cmp r1, #0
/*0x374c*/      ldr r1, [r0]
/*0x374e*/      beq jump_3756
/*0x3750*/      orr r1, r1, #1
/*0x3754*/      b jump_375a
            jump_3756:
/*0x3756*/      bic r1, r1, #1
            jump_375a:
/*0x375a*/      str r1, [r0]
/*0x375c*/      bx lr

            .thumb_func
            call_375e:
/*0x375e*/      str r1, [r0, #0xc]
/*0x3760*/      bx lr

            .thumb_func
            call_3762:
/*0x3762*/      str r1, [r0, #8]
/*0x3764*/      bx lr

/*0x3766*/  .byte 0x00
/*0x3767*/  .byte 0x00


            .thumb_func
            call_3768:
/*0x3768*/      ldr r1, [pc, #0x18] /* data_3784 */
/*0x376a*/      movs r0, #0x10
/*0x376c*/      str.w r0, [r1, #0x10c]
/*0x3770*/      ldr r0, [pc, #0x14] /* data_3788 */
/*0x3772*/      movw r1, #0x5fff
/*0x3776*/      str r1, [r0, #8]
/*0x3778*/      ldr r1, [pc, #0x10] /* data_378c */
/*0x377a*/      str r1, [r0, #4]
/*0x377c*/      ldr r1, [pc, #0x10] /* data_3790 */
/*0x377e*/      str r1, [r0]
/*0x3780*/      bx lr

/*0x3782*/  .byte 0x00
/*0x3783*/  .byte 0x00

            data_3784:
/*0x3784*/  .word 0x40088000
            data_3788:
/*0x3788*/  .word 0x40068000
            data_378c:
/*0x378c*/  .word 0x0001a7d0
            data_3790:
/*0x3790*/  .word 0x5fa00001


            .thumb_func
            call_3794:
/*0x3794*/      add.w r0, r0, r0, lsl #2
/*0x3798*/      lsls r0, r0, #2
            jump_379a:
/*0x379a*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x379c*/      bhs jump_379a
/*0x379e*/      bx lr

            .thumb_func
            call_37a0:
/*0x37a0*/      ldr r1, [pc, #8] /* data_37ac */
/*0x37a2*/      movw r0, #0xeae0
/*0x37a6*/      str r0, [r1, #0x58]
/*0x37a8*/      bx lr

/*0x37aa*/  .byte 0x00
/*0x37ab*/  .byte 0x00

            data_37ac:
/*0x37ac*/  .word 0x40024000

            jump_37b0:
/*0x37b0*/      ldr r0, [pc, #0xc] /* data_37c0 */
/*0x37b2*/      ldr r2, [r0, #0x50]
/*0x37b4*/      movw r1, #0xeae0
/*0x37b8*/      bics r2, r1
/*0x37ba*/      str r2, [r0, #0x50]
/*0x37bc*/      str r1, [r0, #0x58]
/*0x37be*/      bx lr

            data_37c0:
/*0x37c0*/  .word 0x40024000


            .thumb_func
            call_37c4:
/*0x37c4*/      ldr r0, [pc, #0xc] /* data_37d4 */
/*0x37c6*/      movw r1, #0xeae0
/*0x37ca*/      str r1, [r0, #0x58]
/*0x37cc*/      ldr r2, [r0, #0x50]
/*0x37ce*/      orrs r2, r1
/*0x37d0*/      str r2, [r0, #0x50]
/*0x37d2*/      bx lr

            data_37d4:
/*0x37d4*/  .word 0x40024000


            .thumb_func
            call_37d8:
/*0x37d8*/      ldr r0, [pc, #8] /* data_37e4 */
/*0x37da*/      ldr r0, [r0, #0x58]
/*0x37dc*/      movw r1, #0xeae0
/*0x37e0*/      ands r0, r1
/*0x37e2*/      bx lr

            data_37e4:
/*0x37e4*/  .word 0x40024000


            .thumb_func
            call_37e8:
/*0x37e8*/      ldr r1, [pc, #8] /* data_37f4 */
/*0x37ea*/      ldr r0, [pc, #4] /* data_37f0 */
/*0x37ec*/      str r0, [r1]
/*0x37ee*/      bx lr

            data_37f0:
/*0x37f0*/  .word 0x5fa00001
            data_37f4:
/*0x37f4*/  .word 0x40068000


            .thumb_func
            call_37f8:
/*0x37f8*/      push {r4, lr}
/*0x37fa*/      movs r2, #0
/*0x37fc*/      mov.w r1, #0xc000
/*0x3800*/      mov.w r0, #0xf0000
/*0x3804*/      movs r3, #1
/*0x3806*/      bl call_3b30
/*0x380a*/      ldr r0, [pc, #0x1c] /* data_3828 */
/*0x380c*/      ldr r1, [r0, #4]
/*0x380e*/      bic r1, r1, #0x800
/*0x3812*/      str r1, [r0, #4]
/*0x3814*/      ldr r1, [r0, #8]
/*0x3816*/      bic r1, r1, #0x800
/*0x381a*/      str r1, [r0, #8]
/*0x381c*/      movs r1, #1
/*0x381e*/      pop.w {r4, lr}
/*0x3822*/      movs r0, #0xb
/*0x3824*/      b.w call_6b80

            data_3828:
/*0x3828*/  .word 0x400b0000


            .thumb_func
            call_382c:
/*0x382c*/      push {r4, r5, r6, lr}
/*0x382e*/      mov r6, r2
/*0x3830*/      mov r4, r1
/*0x3832*/      lsls r5, r0, #4
/*0x3834*/      b jump_3846
            jump_3836:
/*0x3836*/      lsls r0, r4, #0x1f
/*0x3838*/      beq jump_3842
/*0x383a*/      mov r1, r6
/*0x383c*/      mov r0, r5
/*0x383e*/      bl call_6b80
            jump_3842:
/*0x3842*/      lsrs r4, r4, #1
/*0x3844*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_3846:
/*0x3846*/      cmp r4, #0
/*0x3848*/      bne jump_3836
/*0x384a*/      pop {r4, r5, r6, pc}
            jump_384c:
/*0x384c*/      push {r4, r5, r6, lr}
/*0x384e*/      mov r4, r1
/*0x3850*/      mov r5, r0
/*0x3852*/      tst.w r1, #0xff
/*0x3856*/      beq jump_3862
/*0x3858*/      uxtb r1, r5
/*0x385a*/      mov r2, r4
/*0x385c*/      ldr r0, [pc, #0x1c] /* data_387c */
/*0x385e*/      bl call_6bf2
            jump_3862:
/*0x3862*/      tst.w r4, #0xff00
/*0x3866*/      beq jump_3878
/*0x3868*/      lsrs r2, r4, #8
/*0x386a*/      uxtb r1, r5
/*0x386c*/      pop.w {r4, r5, r6, lr}
/*0x3870*/      ldr r0, [pc, #8] /* data_387c */
/*0x3872*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x3874*/      b.w call_6bf2
            jump_3878:
/*0x3878*/      pop {r4, r5, r6, pc}

/*0x387a*/  .byte 0x00
/*0x387b*/  .byte 0x00

            data_387c:
/*0x387c*/  .word 0x40022000


            .thumb_func
            call_3880:
/*0x3880*/      push {r4, r5}
/*0x3882*/      mov r3, r1
/*0x3884*/      ldrb r2, [r0, #1]
/*0x3886*/      movs r1, #1
/*0x3888*/      lsls r1, r2
/*0x388a*/      ldrb r4, [r0]
/*0x388c*/      adds r2, r0, #2
/*0x388e*/      mov r0, r4
/*0x3890*/      pop {r4, r5}
/*0x3892*/      b.w call_38e0

            .thumb_func
            call_3896:
/*0x3896*/      push {r4, r5, r6, lr}
/*0x3898*/      mov r6, r2
/*0x389a*/      mov r4, r1
/*0x389c*/      mov r5, r0
/*0x389e*/      b jump_38aa
            jump_38a0:
/*0x38a0*/      mov r0, r5
/*0x38a2*/      .short 0x1ded /* adds r5, r5, #7 */ 
/*0x38a4*/      mov r1, r6
/*0x38a6*/      bl call_3880
            jump_38aa:
/*0x38aa*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x38ac*/      uxtb r4, r4
/*0x38ae*/      bhs jump_38a0
/*0x38b0*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_38b2:
/*0x38b2*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x38b6*/      mov r7, r3
/*0x38b8*/      mov r8, r2
/*0x38ba*/      mov r5, r1
/*0x38bc*/      mov r4, r0
/*0x38be*/      movs r6, #1
/*0x38c0*/      b jump_38d4
            jump_38c2:
/*0x38c2*/      ldrb r0, [r4, #1]
/*0x38c4*/      mov r3, r7
/*0x38c6*/      lsl.w r1, r6, r0
/*0x38ca*/      ldrb r0, [r4]
/*0x38cc*/      mov r2, r8
/*0x38ce*/      bl call_38e0
/*0x38d2*/      .short 0x1ca4 /* adds r4, r4, #2 */ 
            jump_38d4:
/*0x38d4*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x38d6*/      uxtb r5, r5
/*0x38d8*/      bhs jump_38c2
/*0x38da*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x38de*/  .byte 0x00
/*0x38df*/  .byte 0x00


            .thumb_func
            call_38e0:
/*0x38e0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x38e4*/      mov r6, r1
/*0x38e6*/      ldr r1, [pc, #0xe4] /* data_39cc */
/*0x38e8*/      mov r8, r0
/*0x38ea*/      mov r5, r2
/*0x38ec*/      add.w r4, r1, r8, lsl #13
/*0x38f0*/      mvns r7, r6
/*0x38f2*/      cbz r3, jump_3912
/*0x38f4*/      ldrb r0, [r5]
/*0x38f6*/      cmp r0, #4
/*0x38f8*/      bhs jump_3972
/*0x38fa*/      ldr r0, [r4]
/*0x38fc*/      ands r0, r7
/*0x38fe*/      str r0, [r4]
/*0x3900*/      ldrb r2, [r5]
/*0x3902*/      mov r1, r6
/*0x3904*/      mov r0, r4
/*0x3906*/      bl call_6bcc
/*0x390a*/      ldr r0, [r4, #4]
/*0x390c*/      orrs r0, r6
/*0x390e*/      str r0, [r4, #4]
/*0x3910*/      b jump_39be
            jump_3912:
/*0x3912*/      movs r2, #1
/*0x3914*/      mov r1, r6
/*0x3916*/      bl call_382c
/*0x391a*/      ldrb r0, [r5, #1]
/*0x391c*/      cmp r0, #4
/*0x391e*/      bhs jump_3932
/*0x3920*/      ldr r0, [r4]
/*0x3922*/      ands r0, r7
/*0x3924*/      str r0, [r4]
/*0x3926*/      ldrb r2, [r5, #1]
/*0x3928*/      mov r1, r6
/*0x392a*/      mov r0, r4
/*0x392c*/      bl call_6bcc
/*0x3930*/      b jump_3952
            jump_3932:
/*0x3932*/      lsls r0, r0, #0x1f
/*0x3934*/      beq jump_393a
/*0x3936*/      str r6, [r4, #0x28]
/*0x3938*/      b jump_393c
            jump_393a:
/*0x393a*/      str r6, [r4, #0x24]
            jump_393c:
/*0x393c*/      ldr r0, [r4, #0x10]
/*0x393e*/      ands r0, r7
/*0x3940*/      str r0, [r4, #0x10]
/*0x3942*/      movs r2, #0
/*0x3944*/      mov r1, r6
/*0x3946*/      mov r0, r4
/*0x3948*/      bl call_6bcc
/*0x394c*/      ldr r0, [r4]
/*0x394e*/      orrs r0, r6
/*0x3950*/      str r0, [r4]
            jump_3952:
/*0x3952*/      ldrb r0, [r5, #4]
/*0x3954*/      lsls r0, r0, #0x1e
/*0x3956*/      ldr r0, [r4, #4]
/*0x3958*/      bpl jump_396a
/*0x395a*/      orrs r0, r6
/*0x395c*/      str r0, [r4, #4]
/*0x395e*/      mov r1, r6
/*0x3960*/      mov r0, r8
/*0x3962*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x3966*/      b.w jump_384c
            jump_396a:
/*0x396a*/      ands r0, r7
/*0x396c*/      str r0, [r4, #4]
/*0x396e*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_3972:
/*0x3972*/      cmp r3, #2
/*0x3974*/      beq jump_397c
/*0x3976*/      ldrb r0, [r5, #4]
/*0x3978*/      lsls r0, r0, #0x1d
/*0x397a*/      bpl jump_3988
            jump_397c:
/*0x397c*/      ldrb r0, [r5, #4]
/*0x397e*/      lsls r0, r0, #0x1f
/*0x3980*/      beq jump_3986
/*0x3982*/      str r6, [r4, #0x24]
/*0x3984*/      b jump_3988
            jump_3986:
/*0x3986*/      str r6, [r4, #0x28]
            jump_3988:
/*0x3988*/      ldrb r0, [r5]
/*0x398a*/      mvns r0, r0
/*0x398c*/      lsls r0, r0, #0x1d
/*0x398e*/      ldr r0, [r4, #0x10]
/*0x3990*/      beq jump_39ac
/*0x3992*/      orrs r0, r6
/*0x3994*/      str r0, [r4, #0x10]
/*0x3996*/      ldrb r2, [r5]
            jump_3998:
/*0x3998*/      mov r1, r6
/*0x399a*/      mov r0, r4
/*0x399c*/      bl call_6bcc
/*0x39a0*/      ldrb r0, [r5]
/*0x39a2*/      lsls r0, r0, #0x1c
/*0x39a4*/      ldr r0, [r4, #4]
/*0x39a6*/      bpl jump_39b4
/*0x39a8*/      orrs r0, r6
/*0x39aa*/      b jump_39b6
            jump_39ac:
/*0x39ac*/      ands r0, r7
/*0x39ae*/      str r0, [r4, #0x10]
/*0x39b0*/      movs r2, #0
/*0x39b2*/      b jump_3998
            jump_39b4:
/*0x39b4*/      ands r0, r7
            jump_39b6:
/*0x39b6*/      str r0, [r4, #4]
/*0x39b8*/      ldr r0, [r4]
/*0x39ba*/      orrs r0, r6
/*0x39bc*/      str r0, [r4]
            jump_39be:
/*0x39be*/      ldrb r2, [r5, #3]
/*0x39c0*/      mov r1, r6
/*0x39c2*/      mov r0, r8
/*0x39c4*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x39c8*/      b.w call_382c

            data_39cc:
/*0x39cc*/  .word 0x400b0000


            .thumb_func
            call_39d0:
/*0x39d0*/      ldr r1, [pc, #0x14] /* data_39e8 */
/*0x39d2*/      cmp r0, #1
/*0x39d4*/      ldr r0, [r1]
/*0x39d6*/      beq jump_39e0
/*0x39d8*/      bic r0, r0, #0x800
            jump_39dc:
/*0x39dc*/      str r0, [r1]
/*0x39de*/      bx lr
            jump_39e0:
/*0x39e0*/      orr r0, r0, #0x800
/*0x39e4*/      b jump_39dc

/*0x39e6*/  .byte 0x00
/*0x39e7*/  .byte 0x00

            data_39e8:
/*0x39e8*/  .word 0x400a8000


            .thumb_func
            call_39ec:
/*0x39ec*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x39f0*/      mov r7, r1
/*0x39f2*/      mov r5, r0
/*0x39f4*/      adds r1, r0, #1
/*0x39f6*/      mov r6, r2
/*0x39f8*/      ldr r0, [pc, #0x48] /* data_3a44 */
/*0x39fa*/      bl call_3a98
/*0x39fe*/      mov r4, r0
/*0x3a00*/      cbz r6, jump_3a30
/*0x3a02*/      ldr r0, [r4, #0xc]
/*0x3a04*/      ldr r1, [r4, #0x10]
/*0x3a06*/      ldr r2, [pc, #0x40] /* data_3a48 */
/*0x3a08*/      ubfx r1, r1, #0, #0xa
/*0x3a0c*/      add r1, r2
/*0x3a0e*/      cbnz r5, jump_3a1c
/*0x3a10*/      ldr r2, [r4, #0x10]
/*0x3a12*/      lsrs r0, r0, #0x10
/*0x3a14*/      ubfx r2, r2, #0xc, #8
/*0x3a18*/      add.w r1, r1, r2, lsl #2
            jump_3a1c:
/*0x3a1c*/      lsls r5, r0, #0x17
/*0x3a1e*/      lsrs r5, r5, #0x17
/*0x3a20*/      beq jump_3a3e
/*0x3a22*/      cmp r6, r5
/*0x3a24*/      bls jump_3a28
/*0x3a26*/      mov r6, r5
            jump_3a28:
/*0x3a28*/      mov r2, r6
/*0x3a2a*/      mov r0, r7
/*0x3a2c*/      bl call_6c12
            jump_3a30:
/*0x3a30*/      ldr r0, [r4]
/*0x3a32*/      and r0, r0, #0x10
/*0x3a36*/      str r0, [r4]
/*0x3a38*/      mov r0, r6
            jump_3a3a:
/*0x3a3a*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_3a3e:
/*0x3a3e*/      movs r0, #0
/*0x3a40*/      b jump_3a3a

/*0x3a42*/  .byte 0x00
/*0x3a43*/  .byte 0x00

            data_3a44:
/*0x3a44*/  .word 0x400a8000
            data_3a48:
/*0x3a48*/  .word 0x400aa000


            .thumb_func
            call_3a4c:
/*0x3a4c*/      push {r4, r5, r6, lr}
/*0x3a4e*/      mov r6, r1
/*0x3a50*/      adds r1, r0, #1
/*0x3a52*/      mov r5, r2
/*0x3a54*/      ldr r0, [pc, #0x20] /* data_3a78 */
/*0x3a56*/      bl call_3a98
/*0x3a5a*/      mov r4, r0
/*0x3a5c*/      cbz r5, jump_3a70
/*0x3a5e*/      ldr r0, [r4, #0x10]
/*0x3a60*/      ldr r1, [pc, #0x18] /* data_3a7c */
/*0x3a62*/      ubfx r0, r0, #0, #0xa
/*0x3a66*/      add r0, r1
/*0x3a68*/      mov r2, r5
/*0x3a6a*/      mov r1, r6
/*0x3a6c*/      bl call_6c12
            jump_3a70:
/*0x3a70*/      str r5, [r4, #0xc]
/*0x3a72*/      movs r0, #2
/*0x3a74*/      str r0, [r4]
/*0x3a76*/      pop {r4, r5, r6, pc}

            data_3a78:
/*0x3a78*/  .word 0x400a8000
            data_3a7c:
/*0x3a7c*/  .word 0x400aa000


            .thumb_func
            call_3a80:
/*0x3a80*/      push {r4, lr}
/*0x3a82*/      mov r1, r0
/*0x3a84*/      ldr r0, [pc, #0xc] /* data_3a94 */
/*0x3a86*/      bl call_3a98
/*0x3a8a*/      mov r1, r0
/*0x3a8c*/      ldr r0, [r0]
/*0x3a8e*/      ldr r1, [r1, #4]
/*0x3a90*/      ands r0, r1
/*0x3a92*/      pop {r4, pc}

            data_3a94:
/*0x3a94*/  .word 0x400a8004


            .thumb_func
            call_3a98:
/*0x3a98*/      add.w r1, r1, r1, lsl #2
/*0x3a9c*/      add.w r0, r0, r1, lsl #2
/*0x3aa0*/      bx lr

/*0x3aa2*/  .byte 0x00
/*0x3aa3*/  .byte 0x00


            .thumb_func
            call_3aa4:
/*0x3aa4*/      ldr r0, [pc, #8] /* data_3ab0 */
/*0x3aa6*/      ldr r1, [r0]
/*0x3aa8*/      and r1, r1, #0x400
/*0x3aac*/      str r1, [r0]
/*0x3aae*/      bx lr

            data_3ab0:
/*0x3ab0*/  .word 0x400a8000


            .thumb_func
            call_3ab4:
/*0x3ab4*/      push {r4, r5, r6, lr}
/*0x3ab6*/      mov r5, r0
/*0x3ab8*/      movs r0, #1
/*0x3aba*/      bl call_39d0
/*0x3abe*/      movs r0, #0xfa
/*0x3ac0*/      bl call_3794
/*0x3ac4*/      ldr r4, [pc, #0x50] /* data_3b18 */
/*0x3ac6*/      ldr r0, [r4]
/*0x3ac8*/      movw r6, #0x111d
/*0x3acc*/      lsls r1, r0, #0x19
/*0x3ace*/      mov.w r0, #-1
/*0x3ad2*/      bpl jump_3ae8
/*0x3ad4*/      movw r1, #0x40c
/*0x3ad8*/      str r1, [r4]
/*0x3ada*/      str r0, [r4, #8]
/*0x3adc*/      cbnz r5, jump_3ae4
/*0x3ade*/      movs r0, #0
/*0x3ae0*/      bl call_5e54
            jump_3ae4:
/*0x3ae4*/      str r6, [r4, #4]
/*0x3ae6*/      pop {r4, r5, r6, pc}
            jump_3ae8:
/*0x3ae8*/      movw r1, #0xc0c
/*0x3aec*/      str r1, [r4]
/*0x3aee*/      str r0, [r4, #8]
/*0x3af0*/      cbnz r5, jump_3af8
/*0x3af2*/      movs r0, #0
/*0x3af4*/      bl call_5e54
            jump_3af8:
/*0x3af8*/      ldr r0, [r4]
/*0x3afa*/      bic r0, r0, #0x800
/*0x3afe*/      str r0, [r4]
/*0x3b00*/      str r6, [r4, #4]
/*0x3b02*/      movs r0, #0
/*0x3b04*/      bl call_39d0
/*0x3b08*/      movs r0, #0x19
/*0x3b0a*/      bl call_3794
/*0x3b0e*/      pop.w {r4, r5, r6, lr}
/*0x3b12*/      movs r0, #1
/*0x3b14*/      b.w call_39d0

            data_3b18:
/*0x3b18*/  .word 0x400a8000


            .thumb_func
            call_3b1c:
/*0x3b1c*/      ldr r0, [pc, #0xc] /* data_3b2c */
/*0x3b1e*/      ldr r0, [r0]
/*0x3b20*/      ands r0, r0, #0xc0
/*0x3b24*/      beq jump_3b28
/*0x3b26*/      movs r0, #1
            jump_3b28:
/*0x3b28*/      bx lr

/*0x3b2a*/  .byte 0x00
/*0x3b2b*/  .byte 0x00

            data_3b2c:
/*0x3b2c*/  .word 0x400a8000


            .thumb_func
            call_3b30:
/*0x3b30*/      push {r4, r5, r6, r7, lr}
/*0x3b32*/      ldr r7, [pc, #0x1c] /* data_3b50 */
/*0x3b34*/      ldr r4, [r7, #0x24]
/*0x3b36*/      ldr r5, [r7, #0x2c]
/*0x3b38*/      ldr r6, [r7, #0x30]
/*0x3b3a*/      bics r4, r0
/*0x3b3c*/      bics r5, r1
/*0x3b3e*/      bics r6, r2
/*0x3b40*/      cbz r3, jump_3b48
/*0x3b42*/      orrs r4, r0
/*0x3b44*/      orrs r5, r1
/*0x3b46*/      orrs r6, r2
            jump_3b48:
/*0x3b48*/      str r4, [r7, #0x24]
/*0x3b4a*/      str r5, [r7, #0x2c]
/*0x3b4c*/      str r6, [r7, #0x30]
/*0x3b4e*/      pop {r4, r5, r6, r7, pc}

            data_3b50:
/*0x3b50*/  .word 0x40088000


            .thumb_func
            call_3b54:
/*0x3b54*/      ldr r1, [pc, #0xc] /* data_3b64 */
/*0x3b56*/      ldr r2, [r1]
/*0x3b58*/      bic r2, r2, #0xc00000
/*0x3b5c*/      orr.w r0, r2, r0, lsl #22
/*0x3b60*/      str r0, [r1]
/*0x3b62*/      bx lr

            data_3b64:
/*0x3b64*/  .word 0x40088000


            .thumb_func
            call_3b68:
/*0x3b68*/      movs r1, #3
/*0x3b6a*/      ldr r2, [pc, #0x10] /* data_3b7c */
/*0x3b6c*/      b jump_3b72
            jump_3b6e:
/*0x3b6e*/      ldrb r3, [r0, r1]
/*0x3b70*/      strb r3, [r2, r1]
            jump_3b72:
/*0x3b72*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3b74*/      uxtb r1, r1
/*0x3b76*/      bhs jump_3b6e
/*0x3b78*/      bx lr

/*0x3b7a*/  .byte 0x00
/*0x3b7b*/  .byte 0x00

            data_3b7c:
/*0x3b7c*/  .word 0x2000004c


            .thumb_func
            call_3b80:
/*0x3b80*/      ldr r0, [pc, #0x18] /* data_3b9c */
/*0x3b82*/      ldrb r0, [r0, #5]
/*0x3b84*/      cmp r0, #0
/*0x3b86*/      beq jump_3b98
/*0x3b88*/      ldr r0, [pc, #0x14] /* data_3ba0 */
/*0x3b8a*/      ldr r0, [r0, #4]
/*0x3b8c*/      movw r1, #0x9c40
/*0x3b90*/      cmp r0, r1
/*0x3b92*/      blo jump_3b98
/*0x3b94*/      b.w jump_6c58
            jump_3b98:
/*0x3b98*/      bx lr

/*0x3b9a*/  .byte 0x00
/*0x3b9b*/  .byte 0x00

            data_3b9c:
/*0x3b9c*/  .word 0x20000790
            data_3ba0:
/*0x3ba0*/  .word 0x2000004c

            jump_3ba4:
/*0x3ba4*/      push {r4, r5, r6, lr}
/*0x3ba6*/      cbz r0, jump_3bd0
/*0x3ba8*/      ldr r5, [pc, #0x3c] /* data_3be8 */
/*0x3baa*/      movs r4, #0x60
/*0x3bac*/      ldr r6, [pc, #0x3c] /* data_3bec */
/*0x3bae*/      b jump_3bc8
            jump_3bb0:
/*0x3bb0*/      ldrb r0, [r5], #-1
/*0x3bb4*/      and r0, r0, #7
/*0x3bb8*/      add.w r0, r0, r0, lsl #1
/*0x3bbc*/      adds r1, r0, r6
/*0x3bbe*/      mov r0, r4
/*0x3bc0*/      addw r1, r1, #0x2e6
/*0x3bc4*/      bl call_44cc
            jump_3bc8:
/*0x3bc8*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3bca*/      uxtb r4, r4
/*0x3bcc*/      bhs jump_3bb0
/*0x3bce*/      pop {r4, r5, r6, pc}
            jump_3bd0:
/*0x3bd0*/      ldr r5, [pc, #0x1c] /* data_3bf0 */
/*0x3bd2*/      movs r4, #0x60
/*0x3bd4*/      b jump_3be0
            jump_3bd6:
/*0x3bd6*/      mov r1, r5
/*0x3bd8*/      mov r0, r4
/*0x3bda*/      bl call_44cc
/*0x3bde*/      .short 0x1eed /* subs r5, r5, #3 */ 
            jump_3be0:
/*0x3be0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3be2*/      uxtb r4, r4
/*0x3be4*/      bhs jump_3bd6
/*0x3be6*/      pop {r4, r5, r6, pc}

            data_3be8:
/*0x3be8*/  .word 0x00007ba4 /* possible pointer */
            data_3bec:
/*0x3bec*/  .word 0x2000087c
            data_3bf0:
/*0x3bf0*/  .word 0x20000b5f


            .thumb_func
            call_3bf4:
/*0x3bf4*/      bx lr

            .thumb_func
            call_3bf6:
/*0x3bf6*/      bx lr

            bootloader_crc_magic:
/*0x3bf8*/  .byte 0x00
/*0x3bf9*/  .byte 0x50
/*0x3bfa*/  .byte 0x04
/*0x3bfb*/  .byte 0x03
/*0x3bfc*/  .byte 0x01
/*0x3bfd*/  .byte 0x00
/*0x3bfe*/  .byte 0x00
/*0x3bff*/  .byte 0x34
            flash_3c00_data:
/*0x3c00*/  .byte 0x04
/*0x3c01*/  .byte 0x00
/*0x3c02*/  .byte 0x02
/*0x3c03*/  .byte 0x00


            .thumb_func
            call_3c04:
/*0x3c04*/      push {r4, r5, r6, lr}
/*0x3c06*/      ldr r1, [pc, #0xac] /* data_3cb4 */
/*0x3c08*/      ldrb r0, [r1, #5]
/*0x3c0a*/      cmp r0, #0
/*0x3c0c*/      beq jump_3c52
/*0x3c0e*/      ldr r5, [pc, #0xa8] /* data_3cb8 */
/*0x3c10*/      movs r2, #1
/*0x3c12*/      str r2, [r5, #4]
/*0x3c14*/      ldr r0, [pc, #0xa4] /* data_3cbc */
/*0x3c16*/      ldrb r0, [r0, #3]
/*0x3c18*/      lsls r0, r0, #0x1e
/*0x3c1a*/      bpl jump_3c52
/*0x3c1c*/      ldr r0, [pc, #0x9c] /* data_3cbc */
/*0x3c1e*/      ldrb r3, [r1, #6]
/*0x3c20*/      ldrb r0, [r0]
/*0x3c22*/      cbz r3, jump_3c68
/*0x3c24*/      cmp r0, #0x27
/*0x3c26*/      beq jump_3c48
/*0x3c28*/      bgt jump_3c3c
/*0x3c2a*/      cmp r0, #0x1e
/*0x3c2c*/      beq jump_3c54
/*0x3c2e*/      cmp r0, #0x1f
/*0x3c30*/      beq jump_3c54
/*0x3c32*/      cmp r0, #0x20
/*0x3c34*/      beq jump_3c54
/*0x3c36*/      cmp r0, #0x26
/*0x3c38*/      bne jump_3c52
/*0x3c3a*/      b jump_3c48
            jump_3c3c:
/*0x3c3c*/      cmp r0, #0x29
/*0x3c3e*/      beq jump_3c50
/*0x3c40*/      cmp r0, #0x2d
/*0x3c42*/      beq jump_3c48
/*0x3c44*/      cmp r0, #0x2e
/*0x3c46*/      bne jump_3c52
            jump_3c48:
/*0x3c48*/      pop.w {r4, r5, r6, lr}
/*0x3c4c*/      b.w jump_6c58
            jump_3c50:
/*0x3c50*/      strb r2, [r1, #1]
            jump_3c52:
/*0x3c52*/      pop {r4, r5, r6, pc}
            jump_3c54:
/*0x3c54*/      subs r0, #0x1e
/*0x3c56*/      uxtb r1, r0
/*0x3c58*/      ldr r0, [pc, #0x5c] /* data_3cb8 */
/*0x3c5a*/      movs r2, #1
/*0x3c5c*/      adds r4, r0, r1
/*0x3c5e*/      ldrb r0, [r4]
/*0x3c60*/      bl call_52a0
/*0x3c64*/      strb r0, [r4]
            jump_3c66:
/*0x3c66*/      pop {r4, r5, r6, pc}
            jump_3c68:
/*0x3c68*/      cmp r0, #0xcf
/*0x3c6a*/      beq jump_3c66
/*0x3c6c*/      ldr r1, [pc, #0x50] /* data_3cc0 */
/*0x3c6e*/      ldr r2, [pc, #0x54] /* data_3cc4 */
/*0x3c70*/      ldrb r3, [r1, #3]
/*0x3c72*/      ldrb r0, [r2, r0]
/*0x3c74*/      cmp r3, #5
/*0x3c76*/      beq jump_3c98
/*0x3c78*/      add.w r0, r0, r0, lsl #1
/*0x3c7c*/      adds r4, r0, r1
/*0x3c7e*/      add.w r4, r4, #0x1c6
            jump_3c82:
/*0x3c82*/      movs r2, #3
/*0x3c84*/      mov r1, r4
/*0x3c86*/      ldr r0, [pc, #0x30] /* data_3cb8 */
/*0x3c88*/      bl call_35d4
/*0x3c8c*/      cbz r0, jump_3cac
/*0x3c8e*/      ldrh r0, [r5]
/*0x3c90*/      strh r0, [r4]
/*0x3c92*/      ldrb r0, [r5, #2]
            jump_3c94:
/*0x3c94*/      strb r0, [r4, #2]
/*0x3c96*/      pop {r4, r5, r6, pc}
            jump_3c98:
/*0x3c98*/      ldr r2, [pc, #0x2c] /* data_3cc8 */
/*0x3c9a*/      ldrb r0, [r2, r0]
/*0x3c9c*/      and r0, r0, #7
/*0x3ca0*/      add.w r0, r0, r0, lsl #1
/*0x3ca4*/      adds r4, r0, r1
/*0x3ca6*/      addw r4, r4, #0x2e6
/*0x3caa*/      b jump_3c82
            jump_3cac:
/*0x3cac*/      movs r0, #0
/*0x3cae*/      strh r0, [r4]
/*0x3cb0*/      b jump_3c94

/*0x3cb2*/  .byte 0x00
/*0x3cb3*/  .byte 0x00

            data_3cb4:
/*0x3cb4*/  .word 0x20000790
            data_3cb8:
/*0x3cb8*/  .word 0x2000004c
            data_3cbc:
/*0x3cbc*/  .word 0x2000079c
            data_3cc0:
/*0x3cc0*/  .word 0x2000087c
            data_3cc4:
/*0x3cc4*/  .word 0x20000202
            data_3cc8:
/*0x3cc8*/  .word 0x00007b45 /* possible pointer */


            .thumb_func
            call_3ccc:
/*0x3ccc*/      cmp r0, #1
/*0x3cce*/      beq jump_3cde
/*0x3cd0*/      movs r0, #5
            jump_3cd2:
/*0x3cd2*/      ldr r1, [pc, #0x10] /* data_3ce4 */
/*0x3cd4*/      strb r0, [r1, #3]
/*0x3cd6*/      ldr r0, [pc, #0x10] /* data_3ce8 */
/*0x3cd8*/      ldrb r0, [r0, #2]
/*0x3cda*/      b.w call_43b8
            jump_3cde:
/*0x3cde*/      movs r0, #4
/*0x3ce0*/      b jump_3cd2

/*0x3ce2*/  .byte 0x00
/*0x3ce3*/  .byte 0x00

            data_3ce4:
/*0x3ce4*/  .word 0x2000087c
            data_3ce8:
/*0x3ce8*/  .word 0x20000870


            .thumb_func
            call_3cec:
/*0x3cec*/      push {r4, lr}
/*0x3cee*/      bl call_3ccc
/*0x3cf2*/      ldr r0, [pc, #0x14] /* data_3d08 */
/*0x3cf4*/      movs r1, #1
/*0x3cf6*/      strb r1, [r0, #5]
/*0x3cf8*/      ldr r0, [pc, #0x10] /* data_3d0c */
/*0x3cfa*/      str r1, [r0, #4]
/*0x3cfc*/      ldr r1, [pc, #0x10] /* data_3d10 */
/*0x3cfe*/      ldrh r2, [r1]
/*0x3d00*/      strh r2, [r0]
/*0x3d02*/      ldrb r1, [r1, #2]
/*0x3d04*/      strb r1, [r0, #2]
/*0x3d06*/      pop {r4, pc}

            data_3d08:
/*0x3d08*/  .word 0x20000790
            data_3d0c:
/*0x3d0c*/  .word 0x2000004c
            data_3d10:
/*0x3d10*/  .word 0x00007aa4 /* possible pointer */


            .thumb_func
            call_3d14:
/*0x3d14*/      push {r4, r5, r6, lr}
/*0x3d16*/      ldr r4, [pc, #0x5c] /* data_3d74 */
/*0x3d18*/      ldrb r0, [r4, #9]
/*0x3d1a*/      cmp r0, #1
/*0x3d1c*/      beq jump_3d30
/*0x3d1e*/      ldr r0, [pc, #0x58] /* data_3d78 */
/*0x3d20*/      bl call_44ec
/*0x3d24*/      movs r0, #4
/*0x3d26*/      ldr r1, [pc, #0x54] /* data_3d7c */
/*0x3d28*/      movs r2, #0
/*0x3d2a*/      ldr r3, [pc, #0x54] /* data_3d80 */
/*0x3d2c*/      ldr r5, [pc, #0x54] /* data_3d84 */
/*0x3d2e*/      b jump_3d5a
            jump_3d30:
/*0x3d30*/      ldr r0, [pc, #0x48] /* data_3d7c */
/*0x3d32*/      mov.w r1, #0x120
/*0x3d36*/      subs r0, #0xc0
/*0x3d38*/      bl call_35be
/*0x3d3c*/      ldr r4, [pc, #0x48] /* data_3d88 */
/*0x3d3e*/      ldr r1, [pc, #0x38] /* data_3d78 */
/*0x3d40*/      ldrb r0, [r4, #0xe8]!
/*0x3d44*/      bl call_44cc
/*0x3d48*/      ldrb r0, [r4, #1]
/*0x3d4a*/      pop.w {r4, r5, r6, lr}
/*0x3d4e*/      ldr r1, [pc, #0x28] /* data_3d78 */
/*0x3d50*/      b.w call_44cc
            jump_3d54:
/*0x3d54*/      ldrb r6, [r3, r0]
/*0x3d56*/      ldrb r6, [r5, r6]
/*0x3d58*/      strb r2, [r6, r1]
            jump_3d5a:
/*0x3d5a*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3d5c*/      uxtb r0, r0
/*0x3d5e*/      bhs jump_3d54
/*0x3d60*/      ldr r3, [pc, #0x24] /* data_3d88 */
/*0x3d62*/      movs r2, #0xff
/*0x3d64*/      ldrb r0, [r4, #9]
/*0x3d66*/      adds r3, #0xe6
/*0x3d68*/      ldrb r3, [r0, r3]
/*0x3d6a*/      strb r2, [r3, r1]
/*0x3d6c*/      ldr r3, [pc, #0x1c] /* data_3d8c */
/*0x3d6e*/      ldrb r0, [r0, r3]
/*0x3d70*/      strb r2, [r0, r1]
/*0x3d72*/      pop {r4, r5, r6, pc}

            data_3d74:
/*0x3d74*/  .word 0x20000790
            data_3d78:
/*0x3d78*/  .word 0x00007aa7 /* possible pointer */
            data_3d7c:
/*0x3d7c*/  .word 0x200003e6
            data_3d80:
/*0x3d80*/  .word 0x000079e9 /* possible pointer */
            data_3d84:
/*0x3d84*/  .word 0x20000202
            data_3d88:
/*0x3d88*/  .word 0x2000087c
            data_3d8c:
/*0x3d8c*/  .word 0x000079e2 /* possible pointer */


            .thumb_func
            call_3d90:
/*0x3d90*/      push.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x3d94*/      ldr r0, [pc, #0x108] /* data_3ea0 */
/*0x3d96*/      ldrb r1, [r0, #8]
/*0x3d98*/      cbz r1, jump_3da6
/*0x3d9a*/      ldr r0, [pc, #0x108] /* data_3ea4 */
/*0x3d9c*/      ldrh r0, [r0]
/*0x3d9e*/      lsls r0, r0, #0x15
/*0x3da0*/      asrs r0, r0, #8
/*0x3da2*/      lsrs r1, r0, #0x18
/*0x3da4*/      b jump_3dac
            jump_3da6:
/*0x3da6*/      ldrb r1, [r0, #2]
/*0x3da8*/      cbz r1, jump_3db6
/*0x3daa*/      movs r1, #0
            jump_3dac:
/*0x3dac*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x3db0*/      movs r0, #0x59
/*0x3db2*/      b.w call_4510
            jump_3db6:
/*0x3db6*/      ldrb r0, [r0, #0xa]
/*0x3db8*/      ldr r6, [pc, #0xec] /* data_3ea8 */
/*0x3dba*/      mov.w r1, #0x120
/*0x3dbe*/      mov.w sl, #1
/*0x3dc2*/      mov.w r8, #0xff
/*0x3dc6*/      mov.w sb, #0
/*0x3dca*/      cmp r0, #8
/*0x3dcc*/      bhs switch_3e6a
/*0x3dce*/      tbb [pc, r0]

/*0x3dd2*/  .byte 0x4c /* case switch_3e6a */
/*0x3dd3*/  .byte 0x04 /* case switch_3dda */
/*0x3dd4*/  .byte 0x04 /* case switch_3dda */
/*0x3dd5*/  .byte 0x04 /* case switch_3dda */
/*0x3dd6*/  .byte 0x0d /* case switch_3dec */
/*0x3dd7*/  .byte 0x0f /* case switch_3df0 */
/*0x3dd8*/  .byte 0x15 /* case switch_3dfc */
/*0x3dd9*/  .byte 0x4e /* case switch_3e6e */

            switch_3dda:
/*0x3dda*/      ldr r1, [pc, #0xd0] /* data_3eac */
/*0x3ddc*/      add.w r0, r0, r0, lsl #1
/*0x3de0*/      add.w r0, r1, r0, lsl #5
/*0x3de4*/      movs r2, #0xff
/*0x3de6*/      movs r1, #0x60
/*0x3de8*/      subs r0, #0x60
/*0x3dea*/      b jump_3df4
            switch_3dec:
/*0x3dec*/      movs r2, #0x80
/*0x3dee*/      b jump_3df2
            switch_3df0:
/*0x3df0*/      movs r2, #0xff
            jump_3df2:
/*0x3df2*/      ldr r0, [pc, #0xb8] /* data_3eac */
            jump_3df4:
/*0x3df4*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x3df8*/      b.w call_35b0
            switch_3dfc:
/*0x3dfc*/      ldr r0, [pc, #0xac] /* data_3eac */
/*0x3dfe*/      bl call_35be
/*0x3e02*/      movs r4, #0x60
/*0x3e04*/      b jump_3e64
            jump_3e06:
/*0x3e06*/      ldr r0, [pc, #0xa8] /* data_3eb0 */
/*0x3e08*/      and r2, r4, #7
/*0x3e0c*/      add.w r0, r0, r4, lsr #3
/*0x3e10*/      ldrb r1, [r0]
/*0x3e12*/      lsl.w r0, sl, r2
/*0x3e16*/      tst r1, r0
/*0x3e18*/      bne jump_3e20
/*0x3e1a*/      adds r1, r6, r4
/*0x3e1c*/      strb.w r8, [r1, #7]
            jump_3e20:
/*0x3e20*/      adds r5, r6, r4
/*0x3e22*/      mov r0, r4
/*0x3e24*/      ldrb r1, [r5, #7]
/*0x3e26*/      bl call_4510
/*0x3e2a*/      cmp r4, #4
/*0x3e2c*/      beq jump_3e34
/*0x3e2e*/      cmp r4, #0x40
/*0x3e30*/      bne jump_3e54
/*0x3e32*/      b jump_3e3c
            jump_3e34:
/*0x3e34*/      ldr r0, [pc, #0x70] /* data_3ea8 */
/*0x3e36*/      ldrb r1, [r0, #0xb]
/*0x3e38*/      movs r0, #0x3a
/*0x3e3a*/      b jump_3e50
            jump_3e3c:
/*0x3e3c*/      ldr r0, [pc, #0x68] /* data_3ea8 */
/*0x3e3e*/      add.w r7, r0, #0x40
/*0x3e42*/      ldrb.w r1, [r0, #0x47]
/*0x3e46*/      movs r0, #0x59
/*0x3e48*/      bl call_4510
/*0x3e4c*/      ldrb r1, [r7, #7]
/*0x3e4e*/      movs r0, #0x58
            jump_3e50:
/*0x3e50*/      bl call_4510
            jump_3e54:
/*0x3e54*/      ldrb r0, [r5, #7]
/*0x3e56*/      cmp r0, #1
/*0x3e58*/      bls jump_3e60
/*0x3e5a*/      .short 0x1e80 /* subs r0, r0, #2 */ 
/*0x3e5c*/      strb r0, [r5, #7]
/*0x3e5e*/      b jump_3e64
            jump_3e60:
/*0x3e60*/      strb.w sb, [r5, #7]
            jump_3e64:
/*0x3e64*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x3e66*/      uxtb r4, r4
/*0x3e68*/      bhs jump_3e06
            switch_3e6a:
/*0x3e6a*/      pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
            switch_3e6e:
/*0x3e6e*/      ldr r0, [pc, #0x3c] /* data_3eac */
/*0x3e70*/      bl call_35be
/*0x3e74*/      str.w sb, [sp]
/*0x3e78*/      ldrb r0, [r6, #4]
/*0x3e7a*/      cbz r0, jump_3e8a
/*0x3e7c*/      movs r0, #0
            jump_3e7e:
/*0x3e7e*/      bl call_41f4
/*0x3e82*/      cbz r0, jump_3e92
/*0x3e84*/      strb.w r8, [sp, #1]
/*0x3e88*/      b jump_3e96
            jump_3e8a:
/*0x3e8a*/      strb.w sl, [r6, #4]
/*0x3e8e*/      movs r0, #1
/*0x3e90*/      b jump_3e7e
            jump_3e92:
/*0x3e92*/      strb.w r8, [sp]
            jump_3e96:
/*0x3e96*/      mov r1, sp
/*0x3e98*/      movs r0, #0x3a
/*0x3e9a*/      bl call_44cc
/*0x3e9e*/      b switch_3e6a

            data_3ea0:
/*0x3ea0*/  .word 0x20000790
            data_3ea4:
/*0x3ea4*/  .word 0x20000192
            data_3ea8:
/*0x3ea8*/  .word 0x2000005c
            data_3eac:
/*0x3eac*/  .word 0x20000326
            data_3eb0:
/*0x3eb0*/  .word 0x20000194


            .thumb_func
            call_3eb4:
/*0x3eb4*/      push {r3, r4, r5, r6, r7, lr}
/*0x3eb6*/      bl call_6d1c
/*0x3eba*/      ldr r4, [pc, #0xc0] /* data_3f7c */
/*0x3ebc*/      ldr r5, [pc, #0xc0] /* data_3f80 */
/*0x3ebe*/      ldrb r0, [r4, #6]
/*0x3ec0*/      cbz r0, jump_3f0a
/*0x3ec2*/      ldrb r0, [r4, #5]
/*0x3ec4*/      cbnz r0, jump_3ecc
/*0x3ec6*/      bl call_5440
/*0x3eca*/      cbz r0, jump_3f0a
            jump_3ecc:
/*0x3ecc*/      ldrb r0, [r4, #5]
/*0x3ece*/      cbz r0, jump_3ed4
/*0x3ed0*/      ldr r7, [pc, #0xb0] /* data_3f84 */
/*0x3ed2*/      b jump_3ed8
            jump_3ed4:
/*0x3ed4*/      ldr r0, [pc, #0xb0] /* data_3f88 */
/*0x3ed6*/      ldr r7, [r0]
            jump_3ed8:
/*0x3ed8*/      movs r1, #3
/*0x3eda*/      ldr.w ip, [pc, #0xb0] /* data_3f8c */
/*0x3ede*/      b jump_3f04
            jump_3ee0:
/*0x3ee0*/      add.w r0, ip, r1
/*0x3ee4*/      ldrb r3, [r0, #0x1e]
/*0x3ee6*/      movs r0, #3
/*0x3ee8*/      b jump_3efe
            jump_3eea:
/*0x3eea*/      cmp r1, r0
/*0x3eec*/      bne jump_3ef2
/*0x3eee*/      ldrb r2, [r7, r0]
/*0x3ef0*/      b jump_3ef4
            jump_3ef2:
/*0x3ef2*/      movs r2, #0
            jump_3ef4:
/*0x3ef4*/      add.w r6, r0, r0, lsl #1
/*0x3ef8*/      add.w r6, r5, r6, lsl #5
/*0x3efc*/      strb r2, [r6, r3]
            jump_3efe:
/*0x3efe*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x3f00*/      uxtb r0, r0
/*0x3f02*/      bhs jump_3eea
            jump_3f04:
/*0x3f04*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x3f06*/      uxtb r1, r1
/*0x3f08*/      bhs jump_3ee0
            jump_3f0a:
/*0x3f0a*/      ldrb r0, [r4, #5]
/*0x3f0c*/      ldr r6, [pc, #0x80] /* data_3f90 */
/*0x3f0e*/      cbz r0, jump_3f1a
/*0x3f10*/      ldrb.w r0, [r6, #0xe9]
/*0x3f14*/      ldr r1, [pc, #0x6c] /* data_3f84 */
/*0x3f16*/      bl call_44cc
            jump_3f1a:
/*0x3f1a*/      ldrb r0, [r4, #8]
/*0x3f1c*/      movs r4, #0xff
/*0x3f1e*/      cbz r0, jump_3f32
/*0x3f20*/      ldr r0, [pc, #0x70] /* data_3f94 */
/*0x3f22*/      ldrh r0, [r0]
/*0x3f24*/      lsls r0, r0, #0x15
/*0x3f26*/      asrs r0, r0, #8
/*0x3f28*/      lsrs r1, r0, #0x18
/*0x3f2a*/      movs r0, #0x59
/*0x3f2c*/      bl call_4510
/*0x3f30*/      b jump_3f4c
            jump_3f32:
/*0x3f32*/      movs r1, #0
/*0x3f34*/      movs r0, #0x59
/*0x3f36*/      bl call_4510
/*0x3f3a*/      ldr r0, [pc, #0x5c] /* data_3f98 */
/*0x3f3c*/      ldrb r0, [r0, #2]
/*0x3f3e*/      cbz r0, jump_3f4c
/*0x3f40*/      add.w r0, r0, r0, lsl #1
/*0x3f44*/      add.w r0, r5, r0, lsl #5
/*0x3f48*/      strb r4, [r0, #-0x7]
            jump_3f4c:
/*0x3f4c*/      movs r0, #0
/*0x3f4e*/      str r0, [sp]
/*0x3f50*/      ldrb r0, [r6, #2]
/*0x3f52*/      lsls r0, r0, #0x1f
/*0x3f54*/      beq jump_3f5a
/*0x3f56*/      strb.w r4, [sp, #2]
            jump_3f5a:
/*0x3f5a*/      ldrb.w r0, [r6, #0x2f5]
/*0x3f5e*/      cmp r0, #1
/*0x3f60*/      beq jump_3f68
/*0x3f62*/      cmp r0, #2
/*0x3f64*/      bne jump_3f72
/*0x3f66*/      b jump_3f6e
            jump_3f68:
/*0x3f68*/      strb.w r4, [sp, #1]
/*0x3f6c*/      b jump_3f72
            jump_3f6e:
/*0x3f6e*/      strb.w r4, [sp]
            jump_3f72:
/*0x3f72*/      mov r1, sp
/*0x3f74*/      movs r0, #0x58
/*0x3f76*/      bl call_44cc
/*0x3f7a*/      pop {r3, r4, r5, r6, r7, pc}

            data_3f7c:
/*0x3f7c*/  .word 0x20000790
            data_3f80:
/*0x3f80*/  .word 0x20000326
            data_3f84:
/*0x3f84*/  .word 0x2000004c
            data_3f88:
/*0x3f88*/  .word 0x2000005c
            data_3f8c:
/*0x3f8c*/  .word 0x20000202
            data_3f90:
/*0x3f90*/  .word 0x2000087c
            data_3f94:
/*0x3f94*/  .word 0x20000192
            data_3f98:
/*0x3f98*/  .word 0x20000870


            .thumb_func
            call_3f9c:
/*0x3f9c*/      ldr r0, [pc, #0x4c] /* data_3fec */
/*0x3f9e*/      push {r4, lr}
/*0x3fa0*/      ldrb r0, [r0, #6]
/*0x3fa2*/      cmp r0, #4
/*0x3fa4*/      beq jump_3fae
/*0x3fa6*/      cmp r0, #5
/*0x3fa8*/      beq jump_3fae
/*0x3faa*/      ldr r1, [pc, #0x44] /* data_3ff0 */
/*0x3fac*/      b jump_3fba
            jump_3fae:
/*0x3fae*/      ldr r0, [pc, #0x44] /* data_3ff4 */
/*0x3fb0*/      ldrh r0, [r0, #2]
/*0x3fb2*/      lsls r0, r0, #0x15
/*0x3fb4*/      bpl jump_3fc2
/*0x3fb6*/      ldr r1, [pc, #0x38] /* data_3ff0 */
/*0x3fb8*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_3fba:
/*0x3fba*/      movs r0, #0x58
/*0x3fbc*/      bl call_44cc
/*0x3fc0*/      b jump_3fca
            jump_3fc2:
/*0x3fc2*/      movs r1, #0
/*0x3fc4*/      movs r0, #0x58
/*0x3fc6*/      bl call_4510
            jump_3fca:
/*0x3fca*/      movs r1, #0
/*0x3fcc*/      movs r0, #0x59
/*0x3fce*/      bl call_4510
/*0x3fd2*/      ldr r0, [pc, #0x24] /* data_3ff8 */
/*0x3fd4*/      ldrb r0, [r0, #2]
/*0x3fd6*/      cmp r0, #0
/*0x3fd8*/      beq jump_3fea
/*0x3fda*/      ldr r2, [pc, #0x20] /* data_3ffc */
/*0x3fdc*/      add.w r0, r0, r0, lsl #1
/*0x3fe0*/      add.w r0, r2, r0, lsl #5
/*0x3fe4*/      movs r1, #0xff
/*0x3fe6*/      strb r1, [r0, #-0x7]
            jump_3fea:
/*0x3fea*/      pop {r4, pc}

            data_3fec:
/*0x3fec*/  .word 0x20001b7c
            data_3ff0:
/*0x3ff0*/  .word 0x00007aa7 /* possible pointer */
            data_3ff4:
/*0x3ff4*/  .word 0x20000054
            data_3ff8:
/*0x3ff8*/  .word 0x20000870
            data_3ffc:
/*0x3ffc*/  .word 0x20000326


            .thumb_func
            call_4000:
/*0x4000*/      push {r4, lr}
/*0x4002*/      bl call_5d88
/*0x4006*/      movs r1, #0
/*0x4008*/      movs r0, #0x59
/*0x400a*/      bl call_4510
/*0x400e*/      movs r1, #0
/*0x4010*/      pop.w {r4, lr}
/*0x4014*/      movs r0, #0x58
/*0x4016*/      b.w call_4510

/*0x401a*/  .byte 0x00
/*0x401b*/  .byte 0x00


            .thumb_func
            call_401c:
/*0x401c*/      push {r4, r5, r6, lr}
/*0x401e*/      movs r4, #0
/*0x4020*/      mov r2, r4
/*0x4022*/      sub sp, #0x30
/*0x4024*/      movs r1, #0x20
/*0x4026*/      movs r3, #1
/*0x4028*/      mov r0, r2
/*0x402a*/      bl call_3b30
/*0x402e*/      mov.w r0, #0x4000
/*0x4032*/      str r0, [sp]
/*0x4034*/      asrs r0, r0, #4
/*0x4036*/      movs r5, #8
/*0x4038*/      str r0, [sp, #4]
/*0x403a*/      strd r5, r4, [sp, #8]
/*0x403e*/      str r4, [sp, #0x10]
/*0x4040*/      str r4, [sp, #0x14]
/*0x4042*/      movs r0, #4
/*0x4044*/      str r4, [sp, #0x18]
/*0x4046*/      strd r4, r0, [sp, #0x1c]
/*0x404a*/      ldr r6, [pc, #0x1c] /* data_4068 */
/*0x404c*/      str r0, [sp, #0x24]
/*0x404e*/      str r0, [sp, #0x28]
/*0x4050*/      mov r1, sp
/*0x4052*/      mov r0, r6
/*0x4054*/      bl call_65f0
/*0x4058*/      ldr r0, [pc, #0x10] /* data_406c */
/*0x405a*/      strb r4, [r0]
/*0x405c*/      str r5, [r6]
/*0x405e*/      add sp, #0x30
/*0x4060*/      pop.w {r4, r5, r6, lr}
/*0x4064*/      b.w call_4098

            data_4068:
/*0x4068*/  .word 0x40044000
            data_406c:
/*0x406c*/  .word 0x2000086c


            .thumb_func
            call_4070:
/*0x4070*/      push {r4, lr}
/*0x4072*/      ldr r4, [pc, #0x1c] /* data_4090 */
/*0x4074*/      ldr r0, [r4]
/*0x4076*/      lsls r0, r0, #0x1f
/*0x4078*/      beq jump_4082
/*0x407a*/      bl call_6a24
/*0x407e*/      movs r0, #0
/*0x4080*/      str r0, [r4]
            jump_4082:
/*0x4082*/      movs r2, #0
/*0x4084*/      pop.w {r4, lr}
/*0x4088*/      movs r1, #4
/*0x408a*/      ldr r0, [pc, #8] /* data_4094 */
/*0x408c*/      b.w call_3896

            data_4090:
/*0x4090*/  .word 0x40044000
            data_4094:
/*0x4094*/  .word 0x000081da /* possible pointer */


            .thumb_func
            call_4098:
/*0x4098*/      push {r4, r5, r6, lr}
/*0x409a*/      ldr r1, [pc, #0x38] /* data_40d4 */
/*0x409c*/      movs r0, #9
/*0x409e*/      str r0, [r1]
/*0x40a0*/      movs r2, #1
/*0x40a2*/      movs r1, #4
/*0x40a4*/      ldr r0, [pc, #0x30] /* data_40d8 */
/*0x40a6*/      bl call_3896
/*0x40aa*/      ldr r1, [pc, #0x30] /* data_40dc */
/*0x40ac*/      movs r0, #0x40
/*0x40ae*/      str r0, [r1, #0x24]
/*0x40b0*/      lsls r4, r0, #4
/*0x40b2*/      movw r5, #0x40c8
/*0x40b6*/      b jump_40c6
            jump_40b8:
/*0x40b8*/      bl call_6b14
/*0x40bc*/      bl call_6a4c
/*0x40c0*/      uxth r0, r0
/*0x40c2*/      cmp r0, r5
/*0x40c4*/      beq jump_40ca
            jump_40c6:
/*0x40c6*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x40c8*/      bhs jump_40b8
            jump_40ca:
/*0x40ca*/      pop.w {r4, r5, r6, lr}
/*0x40ce*/      movs r0, #2
/*0x40d0*/      b.w jump_6b5c

            data_40d4:
/*0x40d4*/  .word 0x40044000
            data_40d8:
/*0x40d8*/  .word 0x000081da /* possible pointer */
            data_40dc:
/*0x40dc*/  .word 0x400b2000


            .thumb_func
            call_40e0:
/*0x40e0*/      push {r3, r4, r5, r6, r7, lr}
/*0x40e2*/      ldr r5, [pc, #0x38] /* data_411c */
/*0x40e4*/      movs r4, #0x40
/*0x40e6*/      mov r7, r2
/*0x40e8*/      mov r6, r0
/*0x40ea*/      str r4, [r5, #0x28]
/*0x40ec*/      movs r0, #3
/*0x40ee*/      strb.w r0, [sp]
/*0x40f2*/      lsrs r0, r1, #0x10
/*0x40f4*/      strb.w r0, [sp, #1]
/*0x40f8*/      lsrs r0, r1, #8
/*0x40fa*/      strb.w r0, [sp, #2]
/*0x40fe*/      strb.w r1, [sp, #3]
/*0x4102*/      movs r2, #4
/*0x4104*/      movs r1, #0
/*0x4106*/      mov r0, sp
/*0x4108*/      bl call_6a7c
/*0x410c*/      mov r2, r7
/*0x410e*/      mov r1, r6
/*0x4110*/      movs r0, #0
/*0x4112*/      bl call_6a7c
/*0x4116*/      str r4, [r5, #0x24]
/*0x4118*/      pop {r3, r4, r5, r6, r7, pc}

/*0x411a*/  .byte 0x00
/*0x411b*/  .byte 0x00

            data_411c:
/*0x411c*/  .word 0x400b2000

            jump_4120:
/*0x4120*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4124*/      mov r5, r1
/*0x4126*/      mov r6, r0
/*0x4128*/      rsbs r0, r5, #0
/*0x412a*/      uxtb r4, r0
/*0x412c*/      cmp r4, r2
/*0x412e*/      bhs jump_413a
/*0x4130*/      subs r0, r2, r4
/*0x4132*/      ubfx r7, r0, #8, #0x10
/*0x4136*/      uxtb r0, r0
/*0x4138*/      b jump_4140
            jump_413a:
/*0x413a*/      movs r7, #0
/*0x413c*/      uxth r4, r2
/*0x413e*/      mov r0, r7
            jump_4140:
/*0x4140*/      mov r8, r0
/*0x4142*/      cbz r4, jump_4154
/*0x4144*/      mov r2, r4
/*0x4146*/      mov r0, r6
/*0x4148*/      bl call_6a00
/*0x414c*/      cmp r0, #1
/*0x414e*/      bne jump_418c
/*0x4150*/      add r5, r4
/*0x4152*/      add r6, r4
            jump_4154:
/*0x4154*/      movs r4, #0
/*0x4156*/      mov.w sb, #0x100
/*0x415a*/      b jump_4174
            jump_415c:
/*0x415c*/      mov r2, sb
/*0x415e*/      mov r1, r5
/*0x4160*/      mov r0, r6
/*0x4162*/      bl call_6a00
/*0x4166*/      cmp r0, #1
/*0x4168*/      bne jump_418c
/*0x416a*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x416c*/      add.w r5, r5, #0x100
/*0x4170*/      add.w r6, r6, #0x100
            jump_4174:
/*0x4174*/      cmp r4, r7
/*0x4176*/      blt jump_415c
/*0x4178*/      subs.w r0, r8, #0
/*0x417c*/      beq jump_4192
/*0x417e*/      mov r2, r0
/*0x4180*/      mov r1, r5
/*0x4182*/      mov r0, r6
/*0x4184*/      bl call_6a00
/*0x4188*/      cmp r0, #1
/*0x418a*/      beq jump_4192
            jump_418c:
/*0x418c*/      movs r0, #0
            jump_418e:
/*0x418e*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_4192:
/*0x4192*/      movs r0, #1
/*0x4194*/      b jump_418e

/*0x4196*/  .byte 0x00
/*0x4197*/  .byte 0x00


            .thumb_func
            call_4198:
/*0x4198*/      mov r3, r1
/*0x419a*/      ldr r1, [pc, #0x4c] /* data_41e8 */
/*0x419c*/      push {r4, lr}
/*0x419e*/      ldrb r1, [r1, #2]
/*0x41a0*/      cmp r1, #0
/*0x41a2*/      beq jump_41e4
/*0x41a4*/      add.w r1, r1, r1, lsl #1
/*0x41a8*/      mvn r2, #0x5f
/*0x41ac*/      add.w r1, r2, r1, lsl #5
/*0x41b0*/      add r0, r1
/*0x41b2*/      lsrs r1, r0, #2
/*0x41b4*/      lsls r0, r0, #0x1e
/*0x41b6*/      lsrs r4, r0, #0x14
/*0x41b8*/      ldr r0, [pc, #0x2c] /* data_41e8 */
/*0x41ba*/      lsls r1, r1, #0xc
/*0x41bc*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x41be*/      add.w r1, r1, #0x5000
/*0x41c2*/      strd r1, r4, [r0]
/*0x41c6*/      mov.w r2, #0x1000
/*0x41ca*/      add.w r0, r0, #0x300
/*0x41ce*/      cbz r3, jump_41d8
/*0x41d0*/      pop.w {r4, lr}
/*0x41d4*/      b.w jump_6c80
            jump_41d8:
/*0x41d8*/      bl call_40e0
/*0x41dc*/      ldr r0, [pc, #0xc] /* data_41ec */
/*0x41de*/      ldr r1, [pc, #0x10] /* data_41f0 */
/*0x41e0*/      add r0, r4
/*0x41e2*/      str r0, [r1]
            jump_41e4:
/*0x41e4*/      pop {r4, pc}

/*0x41e6*/  .byte 0x00
/*0x41e7*/  .byte 0x00

            data_41e8:
/*0x41e8*/  .word 0x20000870
            data_41ec:
/*0x41ec*/  .word 0x20000b74
            data_41f0:
/*0x41f0*/  .word 0x2000000c


            .thumb_func
            call_41f4:
/*0x41f4*/      push {r3, r4, r5, lr}
/*0x41f6*/      mov r5, r0
/*0x41f8*/      movs r2, #2
/*0x41fa*/      movs r1, #0
/*0x41fc*/      mov r0, sp
/*0x41fe*/      bl call_40e0
/*0x4202*/      ldrh.w r1, [sp]
/*0x4206*/      movw r4, #0x8001
/*0x420a*/      cmp r1, r4
/*0x420c*/      beq jump_422e
/*0x420e*/      cbz r5, jump_422a
/*0x4210*/      ldr r0, [pc, #0x20] /* data_4234 */
/*0x4212*/      ldrb r0, [r0, #2]
/*0x4214*/      bl call_4328
/*0x4218*/      movs r2, #2
/*0x421a*/      movs r1, #0
/*0x421c*/      mov r0, sp
/*0x421e*/      bl call_40e0
/*0x4222*/      ldrh.w r0, [sp]
/*0x4226*/      cmp r0, r4
/*0x4228*/      beq jump_422e
            jump_422a:
/*0x422a*/      movs r0, #0
/*0x422c*/      pop {r3, r4, r5, pc}
            jump_422e:
/*0x422e*/      movs r0, #1
/*0x4230*/      pop {r3, r4, r5, pc}

/*0x4232*/  .byte 0x00
/*0x4233*/  .byte 0x00

            data_4234:
/*0x4234*/  .word 0x20000870


            .thumb_func
            call_4238:
/*0x4238*/      push {r4, r5, r6, lr}
/*0x423a*/      mov r4, r0
/*0x423c*/      movs r2, #4
/*0x423e*/      movs r1, #0
/*0x4240*/      ldr r0, [pc, #0x74] /* data_42b8 */
/*0x4242*/      bl call_40e0
/*0x4246*/      ldr r5, [pc, #0x70] /* data_42b8 */
/*0x4248*/      movw r1, #0x8001
/*0x424c*/      ldrh r0, [r5]
/*0x424e*/      cmp r0, r1
/*0x4250*/      beq jump_426a
/*0x4252*/      cmp.w r0, #0x1000
/*0x4256*/      bhs jump_425c
/*0x4258*/      ldrb r4, [r5, #2]
/*0x425a*/      b jump_4262
            jump_425c:
/*0x425c*/      cmp r4, #0xff
/*0x425e*/      bne jump_4262
/*0x4260*/      movs r4, #0
            jump_4262:
/*0x4262*/      mov r0, r4
/*0x4264*/      bl call_4328
/*0x4268*/      b jump_427a
            jump_426a:
/*0x426a*/      cmp r4, #0xff
/*0x426c*/      beq jump_427a
/*0x426e*/      ldrb r0, [r5, #2]
/*0x4270*/      cmp r0, r4
/*0x4272*/      beq jump_427a
/*0x4274*/      strb r4, [r5, #2]
/*0x4276*/      bl call_43cc
            jump_427a:
/*0x427a*/      ldrb r0, [r5, #2]
/*0x427c*/      movs r2, #2
/*0x427e*/      lsls r1, r0, #0xc
/*0x4280*/      ldr r0, [pc, #0x34] /* data_42b8 */
/*0x4282*/      add.w r1, r1, #0x1000
/*0x4286*/      adds r0, #0xc
/*0x4288*/      bl call_40e0
/*0x428c*/      ldr r0, [pc, #0x28] /* data_42b8 */
/*0x428e*/      adds r0, #0xc
/*0x4290*/      ldrh r0, [r0]
/*0x4292*/      cmp r0, #3
/*0x4294*/      beq jump_429e
/*0x4296*/      pop.w {r4, r5, r6, lr}
/*0x429a*/      b.w call_42bc
            jump_429e:
/*0x429e*/      ldrb r0, [r5, #2]
/*0x42a0*/      pop.w {r4, r5, r6, lr}
/*0x42a4*/      lsls r1, r0, #0xc
/*0x42a6*/      ldr r0, [pc, #0x10] /* data_42b8 */
/*0x42a8*/      mov.w r2, #0x2f8
/*0x42ac*/      adds r0, #0xc
/*0x42ae*/      add.w r1, r1, #0x1000
/*0x42b2*/      b.w call_40e0

/*0x42b6*/  .byte 0x00
/*0x42b7*/  .byte 0x00

            data_42b8:
/*0x42b8*/  .word 0x20000870


            .thumb_func
            call_42bc:
/*0x42bc*/      ldr r1, [pc, #0x30] /* data_42f0 */
/*0x42be*/      push {r4, lr}
/*0x42c0*/      movs r0, #3
/*0x42c2*/      strh r0, [r1]
/*0x42c4*/      ldr r0, [pc, #0x28] /* data_42f0 */
/*0x42c6*/      movs r2, #0xff
/*0x42c8*/      movs r1, #0xc0
/*0x42ca*/      adds r0, #0x28
/*0x42cc*/      bl call_35b0
/*0x42d0*/      ldr r0, [pc, #0x1c] /* data_42f0 */
/*0x42d2*/      movs r2, #0xff
/*0x42d4*/      movs r1, #0xdc
/*0x42d6*/      adds r0, #0xea
/*0x42d8*/      bl call_35b0
/*0x42dc*/      bl call_4340
/*0x42e0*/      ldr r0, [pc, #0xc] /* data_42f0 */
/*0x42e2*/      subs r0, #0xc
/*0x42e4*/      ldrb r0, [r0, #2]
/*0x42e6*/      pop.w {r4, lr}
/*0x42ea*/      b.w call_43b8

/*0x42ee*/  .byte 0x00
/*0x42ef*/  .byte 0x00

            data_42f0:
/*0x42f0*/  .word 0x2000087c


            .thumb_func
            call_42f4:
/*0x42f4*/      push {r4, lr}
/*0x42f6*/      ldr r4, [pc, #0x2c] /* data_4324 */
/*0x42f8*/      movs r0, #0
/*0x42fa*/      strb r0, [r4, #2]
/*0x42fc*/      bl call_42bc
            jump_4300:
/*0x4300*/      ldrb r0, [r4, #2]
/*0x4302*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4304*/      uxtb r0, r0
/*0x4306*/      strb r0, [r4, #2]
/*0x4308*/      cmp r0, #4
/*0x430a*/      bhs jump_4312
/*0x430c*/      bl call_43b8
/*0x4310*/      b jump_4300
            jump_4312:
/*0x4312*/      movs r0, #0
/*0x4314*/      bl call_4328
/*0x4318*/      pop.w {r4, lr}
/*0x431c*/      movs r0, #0xff
/*0x431e*/      b.w call_4238

/*0x4322*/  .byte 0x00
/*0x4323*/  .byte 0x00

            data_4324:
/*0x4324*/  .word 0x20000870


            .thumb_func
            call_4328:
/*0x4328*/      ldr r1, [pc, #0x10] /* data_433c */
/*0x432a*/      movw r2, #0x8001
/*0x432e*/      strh r2, [r1]
/*0x4330*/      strb r0, [r1, #2]
/*0x4332*/      movs r0, #0xff
/*0x4334*/      strb r0, [r1, #3]
/*0x4336*/      b.w call_43cc

/*0x433a*/  .byte 0x00
/*0x433b*/  .byte 0x00

            data_433c:
/*0x433c*/  .word 0x20000870


            .thumb_func
            call_4340:
/*0x4340*/      push {r4, r5, r6, lr}
/*0x4342*/      ldr r5, [pc, #0x60] /* data_43a4 */
/*0x4344*/      movs r3, #0
/*0x4346*/      movs r0, #7
/*0x4348*/      strb r3, [r5, #2]
/*0x434a*/      strb r0, [r5, #3]
/*0x434c*/      adds r4, r5, #4
/*0x434e*/      mov r2, r0
/*0x4350*/      b jump_4366
            jump_4352:
/*0x4352*/      ldr r1, [pc, #0x54] /* data_43a8 */
/*0x4354*/      movs r0, #5
/*0x4356*/      b jump_4360
            jump_4358:
/*0x4358*/      ldrb r6, [r1], #1
/*0x435c*/      strb r6, [r4], #1
            jump_4360:
/*0x4360*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4362*/      uxtb r0, r0
/*0x4364*/      bhs jump_4358
            jump_4366:
/*0x4366*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4368*/      uxtb r2, r2
/*0x436a*/      bhs jump_4352
/*0x436c*/      strb.w r3, [r5, #0x2f5]
/*0x4370*/      movs r0, #0
/*0x4372*/      bl call_6254
/*0x4376*/      ldr r0, [pc, #0x2c] /* data_43a4 */
/*0x4378*/      ldr r1, [pc, #0x30] /* data_43ac */
/*0x437a*/      adds r0, #0x70
/*0x437c*/      ldrh r1, [r1]
/*0x437e*/      strh.w r1, [r0, #0x78]
/*0x4382*/      movs r0, #3
/*0x4384*/      strb r0, [r5, #0x11]
/*0x4386*/      mov.w r1, #0x120
/*0x438a*/      ldr r0, [pc, #0x24] /* data_43b0 */
/*0x438c*/      bl call_35be
/*0x4390*/      movs r1, #0xf
/*0x4392*/      ldr r0, [pc, #0x20] /* data_43b4 */
/*0x4394*/      bl call_35be
/*0x4398*/      ldrb r0, [r5, #2]
/*0x439a*/      bic r0, r0, #1
/*0x439e*/      strb r0, [r5, #2]
/*0x43a0*/      pop {r4, r5, r6, pc}

/*0x43a2*/  .byte 0x00
/*0x43a3*/  .byte 0x00

            data_43a4:
/*0x43a4*/  .word 0x2000087c
            data_43a8:
/*0x43a8*/  .word 0x000081d5 /* possible pointer */
            data_43ac:
/*0x43ac*/  .word 0x000079e4 /* possible pointer */
            data_43b0:
/*0x43b0*/  .word 0x20000a42
            data_43b4:
/*0x43b4*/  .word 0x20000b62


            .thumb_func
            call_43b8:
/*0x43b8*/      lsls r1, r0, #0xc
/*0x43ba*/      mov.w r2, #0x2f8
/*0x43be*/      ldr r0, [pc, #8] /* data_43c8 */
/*0x43c0*/      add.w r1, r1, #0x1000
/*0x43c4*/      b.w jump_6c80

            data_43c8:
/*0x43c8*/  .word 0x2000087c


            .thumb_func
            call_43cc:
/*0x43cc*/      movs r2, #4
/*0x43ce*/      movs r1, #0
/*0x43d0*/      ldr r0, [pc, #4] /* data_43d8 */
/*0x43d2*/      b.w jump_6c80

/*0x43d6*/  .byte 0x00
/*0x43d7*/  .byte 0x00

            data_43d8:
/*0x43d8*/  .word 0x20000870


            .thumb_func
            call_43dc:
/*0x43dc*/      add.w r0, r0, r1, lsr #3
/*0x43e0*/      and r3, r1, #7
/*0x43e4*/      movs r1, #1
/*0x43e6*/      lsls r1, r3
/*0x43e8*/      cmp r2, #0
/*0x43ea*/      ldrb r2, [r0]
/*0x43ec*/      uxtb r1, r1
/*0x43ee*/      beq jump_43f4
/*0x43f0*/      orrs r2, r1
/*0x43f2*/      b jump_43f6
            jump_43f4:
/*0x43f4*/      bics r2, r1
            jump_43f6:
/*0x43f6*/      strb r2, [r0]
/*0x43f8*/      bx lr

            .thumb_func
            call_43fa:
/*0x43fa*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x43fe*/      mov r6, r0
/*0x4400*/      mov.w r7, #0x100
            jump_4404:
/*0x4404*/      movs r5, #0
/*0x4406*/      movs r4, #3
/*0x4408*/      b jump_4418
            jump_440a:
/*0x440a*/      mov r0, r7
/*0x440c*/      bl call_452c
/*0x4410*/      uxtb r0, r0
/*0x4412*/      strb r0, [r6, r4]
/*0x4414*/      add r0, r5
/*0x4416*/      uxth r5, r0
            jump_4418:
/*0x4418*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x441a*/      uxtb r4, r4
/*0x441c*/      bhs jump_440a
/*0x441e*/      cmp r5, #0xe0
/*0x4420*/      blo jump_4404
/*0x4422*/      pop.w {r4, r5, r6, r7, r8, pc}

            .thumb_func
            call_4426:
/*0x4426*/      push {r4, r5, lr}
/*0x4428*/      lsls r3, r1, #1
/*0x442a*/      cmp r3, #0xff
/*0x442c*/      bls jump_4434
/*0x442e*/      rsb.w r3, r3, #0x1fe
/*0x4432*/      uxth r3, r3
            jump_4434:
/*0x4434*/      movs r4, #0x2b
/*0x4436*/      udiv r4, r0, r4
/*0x443a*/      movs r5, #0x55
/*0x443c*/      mla r0, r4, r5, r0
/*0x4440*/      sub.w r1, r1, r3, lsr #1
/*0x4444*/      uxtb r1, r1
/*0x4446*/      add.w r0, r0, r0, lsl #1
/*0x444a*/      strb r1, [r2]
/*0x444c*/      lsls r0, r0, #0x19
/*0x444e*/      strb r1, [r2, #1]
/*0x4450*/      lsrs r0, r0, #0x18
/*0x4452*/      strb r1, [r2, #2]
/*0x4454*/      lsls r5, r4, #0x1f
/*0x4456*/      beq jump_445c
/*0x4458*/      rsb.w r0, r0, #0xff
            jump_445c:
/*0x445c*/      muls r0, r3, r0
/*0x445e*/      ubfx r0, r0, #8, #8
/*0x4462*/      cmp r4, #5
/*0x4464*/      bhs jump_449a
/*0x4466*/      tbb [pc, r4]

/*0x446a*/  .byte 0x03 /* case switch_4470 */
/*0x446b*/  .byte 0x07 /* case switch_4478 */
/*0x446c*/  .byte 0x0c /* case switch_4482 */
/*0x446d*/  .byte 0x10 /* case switch_448a */
/*0x446e*/  .byte 0x13 /* case switch_4490 */
/*0x446f*/  .byte 0x00

            switch_4470:
/*0x4470*/      add r3, r1
/*0x4472*/      strb r3, [r2]
/*0x4474*/      add r0, r1
/*0x4476*/      b jump_447e
            switch_4478:
/*0x4478*/      add r0, r1
/*0x447a*/      strb r0, [r2]
/*0x447c*/      adds r0, r1, r3
            jump_447e:
/*0x447e*/      strb r0, [r2, #1]
/*0x4480*/      pop {r4, r5, pc}
            switch_4482:
/*0x4482*/      add r3, r1
/*0x4484*/      strb r3, [r2, #1]
            jump_4486:
/*0x4486*/      add r0, r1
/*0x4488*/      b jump_4496
            switch_448a:
/*0x448a*/      add r0, r1
/*0x448c*/      strb r0, [r2, #1]
/*0x448e*/      b jump_4494
            switch_4490:
/*0x4490*/      add r0, r1
/*0x4492*/      strb r0, [r2]
            jump_4494:
/*0x4494*/      adds r0, r1, r3
            jump_4496:
/*0x4496*/      strb r0, [r2, #2]
/*0x4498*/      pop {r4, r5, pc}
            jump_449a:
/*0x449a*/      add r3, r1
/*0x449c*/      strb r3, [r2]
/*0x449e*/      b jump_4486
            jump_44a0:
/*0x44a0*/      push {r4, lr}
/*0x44a2*/      ldr r1, [pc, #0x24] /* data_44c8 */
/*0x44a4*/      movs r3, #0x60
/*0x44a6*/      b jump_44be
            jump_44a8:
/*0x44a8*/      movs r2, #3
/*0x44aa*/      b jump_44b4
            jump_44ac:
/*0x44ac*/      ldrb r4, [r0], #1
/*0x44b0*/      strb r4, [r1], #0x60
            jump_44b4:
/*0x44b4*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x44b6*/      uxtb r2, r2
/*0x44b8*/      bhs jump_44ac
/*0x44ba*/      subw r1, r1, #0x11f
            jump_44be:
/*0x44be*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x44c0*/      uxtb r3, r3
/*0x44c2*/      bhs jump_44a8
/*0x44c4*/      pop {r4, pc}

/*0x44c6*/  .byte 0x00
/*0x44c7*/  .byte 0x00

            data_44c8:
/*0x44c8*/  .word 0x20000326


            .thumb_func
            call_44cc:
/*0x44cc*/      cmp r0, #0xff
/*0x44ce*/      beq jump_44e6
/*0x44d0*/      ldr r2, [pc, #0x14] /* data_44e8 */
/*0x44d2*/      add r2, r0
/*0x44d4*/      movs r0, #0
            jump_44d6:
/*0x44d6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x44d8*/      ldrb r3, [r1], #1
/*0x44dc*/      uxtb r0, r0
/*0x44de*/      strb r3, [r2], #0x60
/*0x44e2*/      cmp r0, #3
/*0x44e4*/      blo jump_44d6
            jump_44e6:
/*0x44e6*/      bx lr

            data_44e8:
/*0x44e8*/  .word 0x20000326


            .thumb_func
            call_44ec:
/*0x44ec*/      push {r4, r5, r6, lr}
/*0x44ee*/      mov r5, r0
/*0x44f0*/      ldr r6, [pc, #0x18] /* data_450c */
/*0x44f2*/      movs r4, #3
/*0x44f4*/      b jump_4504
            jump_44f6:
/*0x44f6*/      ldrb r2, [r5]
/*0x44f8*/      movs r1, #0x60
/*0x44fa*/      mov r0, r6
/*0x44fc*/      bl call_35b0
/*0x4500*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x4502*/      adds r6, #0x60
            jump_4504:
/*0x4504*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4506*/      uxtb r4, r4
/*0x4508*/      bhs jump_44f6
/*0x450a*/      pop {r4, r5, r6, pc}

            data_450c:
/*0x450c*/  .word 0x20000326


            .thumb_func
            call_4510:
/*0x4510*/      cmp r0, #0xff
/*0x4512*/      beq jump_4526
/*0x4514*/      ldr r2, [pc, #0x10] /* data_4528 */
/*0x4516*/      add r0, r2
/*0x4518*/      movs r2, #3
/*0x451a*/      b jump_4520
            jump_451c:
/*0x451c*/      strb r1, [r0], #0x60
            jump_4520:
/*0x4520*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4522*/      uxtb r2, r2
/*0x4524*/      bhs jump_451c
            jump_4526:
/*0x4526*/      bx lr

            data_4528:
/*0x4528*/  .word 0x20000326


            .thumb_func
            call_452c:
/*0x452c*/      push {r4, lr}
/*0x452e*/      mov r4, r0
/*0x4530*/      bl call_6c9c
/*0x4534*/      ldr r0, [pc, #0x34] /* data_456c */
/*0x4536*/      ldr r0, [r0]
/*0x4538*/      ldr r2, [r0]
/*0x453a*/      ldr r1, [r0, #0xc]
/*0x453c*/      ldr r0, [r0, #8]
/*0x453e*/      add.w r0, r2, r0, lsr #8
/*0x4542*/      ldr r2, [pc, #0x28] /* data_456c */
/*0x4544*/      eors r1, r0
/*0x4546*/      .short 0x1d12 /* adds r2, r2, #4 */ 
/*0x4548*/      and r0, r0, #1
/*0x454c*/      ldr r2, [r2, #8]
/*0x454e*/      rsbs r0, r0, #0
/*0x4550*/      ands r0, r2
/*0x4552*/      eors r0, r1
/*0x4554*/      cmp r4, #0
/*0x4556*/      beq jump_4560
/*0x4558*/      subs r1, r4, #1
/*0x455a*/      tst r4, r1
/*0x455c*/      bne jump_4562
/*0x455e*/      ands r0, r1
            jump_4560:
/*0x4560*/      pop {r4, pc}
            jump_4562:
/*0x4562*/      udiv r1, r0, r4
/*0x4566*/      mls r0, r4, r1, r0
/*0x456a*/      pop {r4, pc}

            data_456c:
/*0x456c*/  .word 0x20000180


            .thumb_func
            call_4570:
/*0x4570*/      ldr r1, [pc, #0x48] /* data_45bc */
/*0x4572*/      push {r4, lr}
/*0x4574*/      str r0, [r1]
/*0x4576*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x4578*/      ldr r2, [r0, #4]
/*0x457a*/      str r2, [r1]
/*0x457c*/      ldr r2, [r0, #8]
/*0x457e*/      str r2, [r1, #4]
/*0x4580*/      ldr r2, [r0, #0xc]
/*0x4582*/      str r2, [r1, #8]
/*0x4584*/      movs r1, #1
            jump_4586:
/*0x4586*/      subs r2, r1, #1
/*0x4588*/      and r2, r2, #3
/*0x458c*/      ldr r3, [pc, #0x30] /* data_45c0 */
/*0x458e*/      ldr.w r2, [r0, r2, lsl #2]
/*0x4592*/      eor.w r2, r2, r2, lsr #30
/*0x4596*/      mla r3, r3, r2, r1
/*0x459a*/      and r2, r1, #3
/*0x459e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x45a0*/      ldr.w r4, [r0, r2, lsl #2]
/*0x45a4*/      eors r3, r4
/*0x45a6*/      str.w r3, [r0, r2, lsl #2]
/*0x45aa*/      cmp r1, #8
/*0x45ac*/      blo jump_4586
/*0x45ae*/      movs r4, #0
            jump_45b0:
/*0x45b0*/      bl call_6c9c
/*0x45b4*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x45b6*/      cmp r4, #8
/*0x45b8*/      blo jump_45b0
/*0x45ba*/      pop {r4, pc}

            data_45bc:
/*0x45bc*/  .word 0x20000180
            data_45c0:
/*0x45c0*/  .word 0x6c078965


            .thumb_func
            call_45c4:
/*0x45c4*/      cmp r1, #0
/*0x45c6*/      ldr r1, [r0, #0x10]
/*0x45c8*/      beq jump_45d0
/*0x45ca*/      orr r1, r1, #1
/*0x45ce*/      b jump_45d4
            jump_45d0:
/*0x45d0*/      bic r1, r1, #1
            jump_45d4:
/*0x45d4*/      str r1, [r0, #0x10]
/*0x45d6*/      bx lr

            .thumb_func
            call_45d8:
/*0x45d8*/      push {r4, r5, r6, r7, lr}
/*0x45da*/      ldrb r3, [r1]
/*0x45dc*/      ldr r7, [r0, #0x50]
/*0x45de*/      add.w r4, r0, r3, lsl #2
/*0x45e2*/      add.w r2, r4, #0x40
/*0x45e6*/      add.w r5, r4, #0x90
/*0x45ea*/      add.w r6, r4, #0xa0
/*0x45ee*/      lsls r3, r3, #1
/*0x45f0*/      movs r4, #1
/*0x45f2*/      lsls r4, r3
/*0x45f4*/      mvns r4, r4
/*0x45f6*/      ands r7, r4
/*0x45f8*/      str r7, [r0, #0x50]
/*0x45fa*/      ldr r7, [r0, #0x54]
/*0x45fc*/      ands r7, r4
/*0x45fe*/      str r7, [r0, #0x54]
/*0x4600*/      ldr r4, [r0, #0x54]
/*0x4602*/      ldrb r7, [r1, #5]
/*0x4604*/      lsls r7, r3
/*0x4606*/      orrs r4, r7
/*0x4608*/      str r4, [r0, #0x54]
/*0x460a*/      ldr r4, [r2]
/*0x460c*/      movw r7, #0x107
/*0x4610*/      bics r4, r7
/*0x4612*/      str r4, [r2]
/*0x4614*/      ldr r4, [r2]
/*0x4616*/      ldrh r7, [r1, #2]
/*0x4618*/      orrs r4, r7
/*0x461a*/      str r4, [r2]
/*0x461c*/      ldrh r2, [r1, #6]
/*0x461e*/      str r2, [r5]
/*0x4620*/      ldrh r2, [r1, #8]
/*0x4622*/      str r2, [r6]
/*0x4624*/      ldr r2, [r0, #0x50]
/*0x4626*/      ldrb r1, [r1, #4]
/*0x4628*/      lsls r1, r3
/*0x462a*/      orrs r2, r1
/*0x462c*/      str r2, [r0, #0x50]
/*0x462e*/      pop {r4, r5, r6, r7, pc}

            .thumb_func
            call_4630:
/*0x4630*/      ldrh r2, [r1]
/*0x4632*/      str.w r2, [r0, #0x88]
/*0x4636*/      ldrh r2, [r1, #2]
/*0x4638*/      str.w r2, [r0, #0x84]
/*0x463c*/      ldr r2, [r0]
/*0x463e*/      bic r2, r2, #0x30000
/*0x4642*/      str r2, [r0]
/*0x4644*/      ldr r2, [r0]
/*0x4646*/      bic r2, r2, #0x1000000
/*0x464a*/      str r2, [r0]
/*0x464c*/      ldr r2, [r0]
/*0x464e*/      ldr r3, [r1, #4]
/*0x4650*/      orrs r2, r3
/*0x4652*/      str r2, [r0]
/*0x4654*/      ldrh r1, [r1, #8]
/*0x4656*/      str r1, [r0, #0x78]
/*0x4658*/      bx lr

/*0x465a*/  .byte 0x00
/*0x465b*/  .byte 0x00


            .thumb_func
            call_465c:
/*0x465c*/      ldr r0, [pc, #0x28] /* data_4688 */
/*0x465e*/      ldrb r1, [r0, #1]
/*0x4660*/      cbz r1, jump_4666
/*0x4662*/      movs r0, #0
/*0x4664*/      bx lr
            jump_4666:
/*0x4666*/      ldrb r1, [r0, #0xa]
/*0x4668*/      cbz r1, jump_466e
/*0x466a*/      movs r0, #1
/*0x466c*/      bx lr
            jump_466e:
/*0x466e*/      ldrb r0, [r0, #9]
/*0x4670*/      cbz r0, jump_4676
/*0x4672*/      movs r0, #2
/*0x4674*/      bx lr
            jump_4676:
/*0x4676*/      ldr r0, [pc, #0x14] /* data_468c */
/*0x4678*/      ldrb r0, [r0, #8]
/*0x467a*/      cmp r0, #1
/*0x467c*/      beq jump_4682
/*0x467e*/      movs r0, #5
/*0x4680*/      bx lr
            jump_4682:
/*0x4682*/      movs r0, #3
/*0x4684*/      bx lr

/*0x4686*/  .byte 0x00
/*0x4687*/  .byte 0x00

            data_4688:
/*0x4688*/  .word 0x20000790
            data_468c:
/*0x468c*/  .word 0x20001b7c


            .thumb_func
            call_4690:
/*0x4690*/      bx lr

/*0x4692*/  .byte 0x00
/*0x4693*/  .byte 0x00


            .thumb_func
            call_4694:
/*0x4694*/      push {r4, lr}
/*0x4696*/      cbz r0, jump_46c0
/*0x4698*/      bl call_4acc
/*0x469c*/      cmp r0, #0
/*0x469e*/      beq jump_46d6
/*0x46a0*/      movs r1, #0xb
/*0x46a2*/      ldr r0, [pc, #0x34] /* data_46d8 */
/*0x46a4*/      bl call_35be
/*0x46a8*/      ldr r0, [pc, #0x2c] /* data_46d8 */
/*0x46aa*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x46ac*/      ldrb r1, [r0, #1]
/*0x46ae*/      lsls r2, r1, #0x19
/*0x46b0*/      mov.w r1, #0
/*0x46b4*/      str r1, [r0]
/*0x46b6*/      bpl jump_46c0
/*0x46b8*/      ldrb r1, [r0, #1]
/*0x46ba*/      orr r1, r1, #0x40
/*0x46be*/      strb r1, [r0, #1]
            jump_46c0:
/*0x46c0*/      bl call_669c
/*0x46c4*/      ldr r1, [pc, #0x14] /* data_46dc */
/*0x46c6*/      movs r0, #1
/*0x46c8*/      strb r0, [r1]
/*0x46ca*/      ldr r1, [pc, #0x14] /* data_46e0 */
/*0x46cc*/      strb r0, [r1]
/*0x46ce*/      ldr r1, [pc, #0x14] /* data_46e4 */
/*0x46d0*/      strb r0, [r1]
/*0x46d2*/      ldr r1, [pc, #0x14] /* data_46e8 */
/*0x46d4*/      strb r0, [r1]
            jump_46d6:
/*0x46d6*/      pop {r4, pc}

            data_46d8:
/*0x46d8*/  .word 0x200007a0
            data_46dc:
/*0x46dc*/  .word 0x20000810
            data_46e0:
/*0x46e0*/  .word 0x20000811
            data_46e4:
/*0x46e4*/  .word 0x20000812
            data_46e8:
/*0x46e8*/  .word 0x20000813


            .thumb_func
            call_46ec:
/*0x46ec*/      push {r4, r5, lr}
/*0x46ee*/      ldr r3, [pc, #0x40] /* data_4730 */
/*0x46f0*/      add.w r2, r3, #0xf
/*0x46f4*/      ldrb r1, [r3, #2]
/*0x46f6*/      ldrb r2, [r2, r1]
/*0x46f8*/      cbz r2, jump_472c
/*0x46fa*/      lsrs r4, r1, #5
/*0x46fc*/      add.w r5, r3, #0x68
/*0x4700*/      ldr.w r4, [r5, r4, lsl #2]
/*0x4704*/      and r5, r1, #0x1f
/*0x4708*/      movs r1, #1
/*0x470a*/      lsls r1, r5
/*0x470c*/      tst r4, r1
/*0x470e*/      beq jump_4714
/*0x4710*/      movs r1, #1
/*0x4712*/      b jump_4716
            jump_4714:
/*0x4714*/      movs r1, #0
            jump_4716:
/*0x4716*/      cmp r0, #0xff
/*0x4718*/      beq jump_471e
/*0x471a*/      cmp r0, r1
/*0x471c*/      bne jump_472c
            jump_471e:
/*0x471e*/      ldrb r0, [r3, #1]
/*0x4720*/      bfi r0, r1, #0, #1
/*0x4724*/      strb r0, [r3, #1]
/*0x4726*/      strb r2, [r3]
/*0x4728*/      movs r0, #1
/*0x472a*/      pop {r4, r5, pc}
            jump_472c:
/*0x472c*/      movs r0, #0
/*0x472e*/      pop {r4, r5, pc}

            data_4730:
/*0x4730*/  .word 0x2000079c


            .thumb_func
            call_4734:
/*0x4734*/      movs r1, #0x58
/*0x4736*/      ldr r2, [pc, #0x18] /* data_4750 */
/*0x4738*/      b jump_4744
            jump_473a:
/*0x473a*/      ldrb r3, [r2, r1]
/*0x473c*/      cmp r3, r0
/*0x473e*/      bne jump_4744
/*0x4740*/      uxtb r0, r1
/*0x4742*/      bx lr
            jump_4744:
/*0x4744*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4746*/      uxth r1, r1
/*0x4748*/      bhs jump_473a
/*0x474a*/      movs r0, #0
/*0x474c*/      bx lr

/*0x474e*/  .byte 0x00
/*0x474f*/  .byte 0x00

            data_4750:
/*0x4750*/  .word 0x200007ab


            .thumb_func
            call_4754:
/*0x4754*/      ldr r3, [pc, #0x2c] /* data_4784 */
/*0x4756*/      push {r4, lr}
/*0x4758*/      ldrb r2, [r3, r0]
/*0x475a*/      cbz r2, jump_477c
/*0x475c*/      cbz r1, jump_4760
/*0x475e*/      strb r2, [r1]
            jump_4760:
/*0x4760*/      ldr r2, [pc, #0x20] /* data_4784 */
/*0x4762*/      lsrs r1, r0, #5
/*0x4764*/      adds r2, #0x59
/*0x4766*/      and r4, r0, #0x1f
/*0x476a*/      ldr.w r1, [r2, r1, lsl #2]
/*0x476e*/      movs r2, #1
/*0x4770*/      lsls r2, r4
/*0x4772*/      tst r1, r2
/*0x4774*/      beq jump_477c
/*0x4776*/      ldrb r0, [r3, r0]
/*0x4778*/      cmp r0, #0x2f
/*0x477a*/      blo jump_4780
            jump_477c:
/*0x477c*/      movs r0, #1
/*0x477e*/      pop {r4, pc}
            jump_4780:
/*0x4780*/      movs r0, #0
/*0x4782*/      pop {r4, pc}

            data_4784:
/*0x4784*/  .word 0x200007ab

            jump_4788:
/*0x4788*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x478c*/      mov r5, r1
/*0x478e*/      mov r4, r0
/*0x4790*/      movs r1, #0x58
/*0x4792*/      ldr r0, [pc, #0x48] /* data_47dc */
/*0x4794*/      bl call_35be
/*0x4798*/      ldr r0, [pc, #0x40] /* data_47dc */
/*0x479a*/      movs r1, #0
/*0x479c*/      subs r0, #0xf
/*0x479e*/      ldr r6, [pc, #0x3c] /* data_47dc */
/*0x47a0*/      str r1, [r0, #0x68]
/*0x47a2*/      str r1, [r0, #0x6c]
/*0x47a4*/      add.w r2, r0, #0x68
/*0x47a8*/      movs r3, #1
/*0x47aa*/      str r1, [r0, #0x70]
/*0x47ac*/      b jump_47d0
            jump_47ae:
/*0x47ae*/      ldrb r1, [r4]
/*0x47b0*/      ldrb r0, [r4, #1]
/*0x47b2*/      strb r0, [r6, r1]
/*0x47b4*/      ldrb r0, [r4, #2]
/*0x47b6*/      cbz r0, jump_47ce
/*0x47b8*/      ldrb r1, [r4]
/*0x47ba*/      lsrs r0, r1, #5
/*0x47bc*/      and r1, r1, #0x1f
/*0x47c0*/      ldr.w r7, [r2, r0, lsl #2]
/*0x47c4*/      lsl.w r1, r3, r1
/*0x47c8*/      orrs r7, r1
/*0x47ca*/      str.w r7, [r2, r0, lsl #2]
            jump_47ce:
/*0x47ce*/      .short 0x1ce4 /* adds r4, r4, #3 */ 
            jump_47d0:
/*0x47d0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x47d2*/      uxtb r5, r5
/*0x47d4*/      bhs jump_47ae
/*0x47d6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x47da*/  .byte 0x00
/*0x47db*/  .byte 0x00

            data_47dc:
/*0x47dc*/  .word 0x200007ab


            .thumb_func
            call_47e0:
/*0x47e0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x47e4*/      lsrs r1, r0, #8
/*0x47e6*/      lsls r1, r1, #0x1f
/*0x47e8*/      beq jump_47f0
/*0x47ea*/      bl call_4ebc
/*0x47ee*/      b jump_48b0
            jump_47f0:
/*0x47f0*/      uxtb r3, r0
/*0x47f2*/      lsrs r2, r0, #0x18
/*0x47f4*/      movs r4, #1
/*0x47f6*/      cmp r3, #0xe8
/*0x47f8*/      bls jump_4824
/*0x47fa*/      lsrs r0, r0, #0x18
/*0x47fc*/      ubfx r2, r0, #1, #1
/*0x4800*/      cmp r3, #0xec
/*0x4802*/      bhs jump_4812
/*0x4804*/      subs r3, #0xe9
/*0x4806*/      uxtb r1, r3
/*0x4808*/      ldr r0, [pc, #0xac] /* data_48b8 */
/*0x480a*/      bl call_43dc
/*0x480e*/      ldr r0, [pc, #0xac] /* data_48bc */
/*0x4810*/      b jump_48ae
            jump_4812:
/*0x4812*/      cmp r3, #0xfd
/*0x4814*/      bhi jump_48b0
/*0x4816*/      subs r3, #0xec
/*0x4818*/      uxtb r1, r3
/*0x481a*/      ldr r0, [pc, #0xa4] /* data_48c0 */
/*0x481c*/      bl call_43dc
/*0x4820*/      ldr r0, [pc, #0xa0] /* data_48c4 */
/*0x4822*/      b jump_48ae
            jump_4824:
/*0x4824*/      and r1, r0, #7
/*0x4828*/      movs r6, #1
/*0x482a*/      sub.w ip, r3, #0xe0
/*0x482e*/      lsls r6, r1
/*0x4830*/      ldr r7, [pc, #0x94] /* data_48c8 */
/*0x4832*/      ldr r5, [pc, #0x98] /* data_48cc */
/*0x4834*/      cmp.w ip, #7
/*0x4838*/      bhi jump_4850
/*0x483a*/      mov r0, r5
/*0x483c*/      uxtb r1, r6
/*0x483e*/      ldrb r0, [r0]
/*0x4840*/      lsls r2, r2, #0x1e
/*0x4842*/      bpl jump_4848
/*0x4844*/      orrs r0, r1
/*0x4846*/      b jump_484a
            jump_4848:
/*0x4848*/      bics r0, r1
            jump_484a:
/*0x484a*/      strb r0, [r5]
            jump_484c:
/*0x484c*/      strb r4, [r7]
/*0x484e*/      b jump_48b0
            jump_4850:
/*0x4850*/      movs r1, #0
            jump_4852:
/*0x4852*/      add.w ip, r5, r1
/*0x4856*/      ldrb.w ip, [ip, #2]
/*0x485a*/      cmp ip, r3
/*0x485c*/      bne jump_486a
/*0x485e*/      lsls r0, r2, #0x1e
/*0x4860*/      bmi jump_484c
/*0x4862*/      add r1, r5
/*0x4864*/      movs r0, #0
/*0x4866*/      strb r0, [r1, #2]
/*0x4868*/      b jump_484c
            jump_486a:
/*0x486a*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x486c*/      uxtb r1, r1
/*0x486e*/      cmp r1, #6
/*0x4870*/      blo jump_4852
/*0x4872*/      lsls r1, r2, #0x1e
/*0x4874*/      bpl jump_488e
/*0x4876*/      movs r1, #0
            jump_4878:
/*0x4878*/      add.w ip, r5, r1
/*0x487c*/      ldrb.w ip, [ip, #2]
/*0x4880*/      cmp.w ip, #0
/*0x4884*/      beq jump_48a2
/*0x4886*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4888*/      uxtb r1, r1
/*0x488a*/      cmp r1, #6
/*0x488c*/      blo jump_4878
            jump_488e:
/*0x488e*/      lsls r3, r2, #0x1e
/*0x4890*/      ldr r2, [pc, #0x3c] /* data_48d0 */
/*0x4892*/      ubfx r0, r0, #3, #5
/*0x4896*/      add r0, r2
/*0x4898*/      uxtb r1, r6
/*0x489a*/      ldrb r2, [r0, #2]
/*0x489c*/      bpl jump_48a8
/*0x489e*/      orrs r2, r1
/*0x48a0*/      b jump_48aa
            jump_48a2:
/*0x48a2*/      adds r0, r5, r1
/*0x48a4*/      strb r3, [r0, #2]
/*0x48a6*/      b jump_484c
            jump_48a8:
/*0x48a8*/      bics r2, r1
            jump_48aa:
/*0x48aa*/      strb r2, [r0, #2]
/*0x48ac*/      ldr r0, [pc, #0x24] /* data_48d4 */
            jump_48ae:
/*0x48ae*/      strb r4, [r0]
            jump_48b0:
/*0x48b0*/      movs r0, #1
/*0x48b2*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x48b6*/  .byte 0x00
/*0x48b7*/  .byte 0x00

            data_48b8:
/*0x48b8*/  .word 0x2000081d
            data_48bc:
/*0x48bc*/  .word 0x20000811
            data_48c0:
/*0x48c0*/  .word 0x20000821
            data_48c4:
/*0x48c4*/  .word 0x20000812
            data_48c8:
/*0x48c8*/  .word 0x20000810
            data_48cc:
/*0x48cc*/  .word 0x20000828
            data_48d0:
/*0x48d0*/  .word 0x20000830
            data_48d4:
/*0x48d4*/  .word 0x20000813


            .thumb_func
            call_48d8:
/*0x48d8*/      push {r3, r4, r5, r6, r7, lr}
/*0x48da*/      ldr r4, [pc, #0x148] /* data_4a24 */
/*0x48dc*/      ldr r2, [pc, #0x148] /* data_4a28 */
/*0x48de*/      lsrs r5, r0, #3
/*0x48e0*/      strb r0, [r4, #2]
/*0x48e2*/      ldrb r3, [r2, r0]
/*0x48e4*/      strb r3, [r4]
/*0x48e6*/      ldrb r2, [r4, #3]
/*0x48e8*/      and r6, r0, #7
/*0x48ec*/      bic r2, r2, #1
/*0x48f0*/      bfi r2, r1, #1, #1
/*0x48f4*/      strb r2, [r4, #3]
/*0x48f6*/      mov r2, r4
/*0x48f8*/      cmp r3, #0xe8
/*0x48fa*/      ldrb r2, [r2, #1]
/*0x48fc*/      beq jump_4920
/*0x48fe*/      movs r7, #1
/*0x4900*/      lsls r7, r6
/*0x4902*/      movs r6, #0x1c
/*0x4904*/      uxtb r7, r7
/*0x4906*/      cmp.w r6, r3, lsr #3
/*0x490a*/      bne jump_493e
/*0x490c*/      ands r6, r3, #3
/*0x4910*/      beq jump_4926
/*0x4912*/      cmp r6, #1
/*0x4914*/      beq jump_492c
/*0x4916*/      cmp r6, #2
/*0x4918*/      beq jump_4932
/*0x491a*/      cmp r6, #3
/*0x491c*/      bne jump_4948
/*0x491e*/      b jump_4938
            jump_4920:
/*0x4920*/      bfi r2, r1, #6, #1
/*0x4924*/      b jump_4996
            jump_4926:
/*0x4926*/      bfi r2, r1, #2, #1
/*0x492a*/      b jump_4946
            jump_492c:
/*0x492c*/      bfi r2, r1, #4, #1
/*0x4930*/      b jump_4946
            jump_4932:
/*0x4932*/      bfi r2, r1, #3, #1
/*0x4936*/      b jump_4946
            jump_4938:
/*0x4938*/      bfi r2, r1, #5, #1
/*0x493c*/      b jump_4946
            jump_493e:
/*0x493e*/      cmp r3, #0x39
/*0x4940*/      bne jump_4948
/*0x4942*/      bfi r2, r1, #7, #1
            jump_4946:
/*0x4946*/      strb r2, [r4, #1]
            jump_4948:
/*0x4948*/      ldr r6, [pc, #0xd8] /* data_4a24 */
/*0x494a*/      .short 0x1d36 /* adds r6, r6, #4 */ 
/*0x494c*/      cbz r1, jump_4982
/*0x494e*/      ldrb r2, [r4, #1]
/*0x4950*/      lsls.w ip, r2, #0x19
/*0x4954*/      bpl jump_4996
/*0x4956*/      ldrb.w ip, [r6, r5]
/*0x495a*/      orr.w ip, ip, r7
/*0x495e*/      strb.w ip, [r6, r5]
/*0x4962*/      b jump_498e
            jump_4964:
/*0x4964*/      ldr r5, [pc, #0xc4] /* data_4a2c */
/*0x4966*/      strb r2, [r4, #1]
/*0x4968*/      ldrb r2, [r5, #1]
/*0x496a*/      cbz r2, jump_49a6
/*0x496c*/      cbz r1, jump_49a6
/*0x496e*/      mov r1, sp
/*0x4970*/      bl call_5dc0
/*0x4974*/      ldrb r0, [r5, #5]
/*0x4976*/      cmp r0, #0
/*0x4978*/      mov r0, sp
/*0x497a*/      beq jump_499c
/*0x497c*/      bl call_3b68
/*0x4980*/      b jump_49a0
            jump_4982:
/*0x4982*/      ldrb r2, [r6, r5]
/*0x4984*/      tst r2, r7
/*0x4986*/      beq jump_4994
/*0x4988*/      bics r2, r7
/*0x498a*/      strb r2, [r6, r5]
/*0x498c*/      ldrb r2, [r4, #1]
            jump_498e:
/*0x498e*/      orr r2, r2, #1
/*0x4992*/      b jump_4964
            jump_4994:
/*0x4994*/      ldrb r2, [r4, #1]
            jump_4996:
/*0x4996*/      bic r2, r2, #1
/*0x499a*/      b jump_4964
            jump_499c:
/*0x499c*/      bl call_5234
            jump_49a0:
/*0x49a0*/      movs r0, #0
/*0x49a2*/      strb r0, [r5, #1]
/*0x49a4*/      b jump_49e0
            jump_49a6:
/*0x49a6*/      cbz r3, jump_49e0
/*0x49a8*/      ldr r0, [r4]
/*0x49aa*/      bl call_55a0
/*0x49ae*/      bl call_4ff4
/*0x49b2*/      cbz r0, jump_49ca
/*0x49b4*/      ldrb r0, [r4]
/*0x49b6*/      cbz r0, jump_49e0
            jump_49b8:
/*0x49b8*/      bl call_51a8
/*0x49bc*/      ldrb r0, [r4]
/*0x49be*/      cbz r0, jump_49e0
/*0x49c0*/      ldr r0, [r4]
/*0x49c2*/      pop.w {r3, r4, r5, r6, r7, lr}
/*0x49c6*/      b.w call_47e0
            jump_49ca:
/*0x49ca*/      ldrb r0, [r5, #5]
/*0x49cc*/      cbz r0, jump_49d4
/*0x49ce*/      bl call_3c04
/*0x49d2*/      b jump_49e0
            jump_49d4:
/*0x49d4*/      ldrb r0, [r4]
/*0x49d6*/      cmp r0, #0xe8
/*0x49d8*/      beq jump_49e0
/*0x49da*/      bl call_5a98
/*0x49de*/      cbz r0, jump_49e4
            jump_49e0:
/*0x49e0*/      movs r0, #1
/*0x49e2*/      pop {r3, r4, r5, r6, r7, pc}
            jump_49e4:
/*0x49e4*/      ldrb r0, [r4, #1]
/*0x49e6*/      lsls r0, r0, #0x1f
/*0x49e8*/      ldrb r0, [r4, #3]
/*0x49ea*/      lsl.w r0, r0, #0x1f
/*0x49ee*/      beq jump_4a0e
/*0x49f0*/      cmp r0, #0
/*0x49f2*/      bne jump_49b8
/*0x49f4*/      movs r0, #0xff
/*0x49f6*/      bl call_46ec
/*0x49fa*/      cmp r0, #0
/*0x49fc*/      bne jump_49b8
/*0x49fe*/      bl call_5a60
/*0x4a02*/      cbnz r0, jump_4a1a
/*0x4a04*/      ldrb r0, [r4, #1]
/*0x4a06*/      bic r0, r0, #1
/*0x4a0a*/      strb r0, [r4, #1]
/*0x4a0c*/      b jump_49b8
            jump_4a0e:
/*0x4a0e*/      cmp r0, #0
/*0x4a10*/      bne jump_49b8
/*0x4a12*/      bl call_5a60
/*0x4a16*/      cmp r0, #0
/*0x4a18*/      beq jump_49b8
            jump_4a1a:
/*0x4a1a*/      ldrb r0, [r4, #3]
/*0x4a1c*/      orr r0, r0, #1
/*0x4a20*/      strb r0, [r4, #3]
/*0x4a22*/      b jump_49b8

            data_4a24:
/*0x4a24*/  .word 0x2000079c
            data_4a28:
/*0x4a28*/  .word 0x200001aa
            data_4a2c:
/*0x4a2c*/  .word 0x20000790


            .thumb_func
            call_4a30:
/*0x4a30*/      ldrh r2, [r1]
/*0x4a32*/      bfi r2, r0, #0, #9
/*0x4a36*/      strh r2, [r1]
/*0x4a38*/      bx lr

            .thumb_func
            call_4a3a:
/*0x4a3a*/      ubfx r0, r0, #0, #9
/*0x4a3e*/      bx lr

            .thumb_func
            call_4a40:
/*0x4a40*/      push {r4, r5, r6, lr}
/*0x4a42*/      movs r4, #0
/*0x4a44*/      b jump_4a66
            jump_4a46:
/*0x4a46*/      movs r3, #0
/*0x4a48*/      b jump_4a56
            jump_4a4a:
/*0x4a4a*/      ldrb r5, [r0, r4]
/*0x4a4c*/      ldrb r6, [r1, r3]
/*0x4a4e*/      cmp r5, r6
/*0x4a50*/      beq jump_4a5a
/*0x4a52*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x4a54*/      uxtb r3, r3
            jump_4a56:
/*0x4a56*/      cmp r3, r2
/*0x4a58*/      blo jump_4a4a
            jump_4a5a:
/*0x4a5a*/      cmp r3, r2
/*0x4a5c*/      bne jump_4a62
/*0x4a5e*/      movs r0, #0
/*0x4a60*/      pop {r4, r5, r6, pc}
            jump_4a62:
/*0x4a62*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x4a64*/      uxtb r4, r4
            jump_4a66:
/*0x4a66*/      cmp r4, r2
/*0x4a68*/      blo jump_4a46
/*0x4a6a*/      movs r0, #1
/*0x4a6c*/      pop {r4, r5, r6, pc}

/*0x4a6e*/  .byte 0x00
/*0x4a6f*/  .byte 0x00


            .thumb_func
            call_4a70:
/*0x4a70*/      push {r4, r5, r6, r7, lr}
/*0x4a72*/      movs r4, #0xb
/*0x4a74*/      movs r6, #0
/*0x4a76*/      b jump_4ab8
            jump_4a78:
/*0x4a78*/      ldr r3, [pc, #0x48] /* data_4ac4 */
/*0x4a7a*/      ldrb r7, [r3, r4]
/*0x4a7c*/      cmp r7, #0xff
/*0x4a7e*/      beq jump_4ab8
/*0x4a80*/      movs r3, #8
/*0x4a82*/      mov.w lr, #1
/*0x4a86*/      ldr.w ip, [pc, #0x40] /* data_4ac8 */
/*0x4a8a*/      b jump_4ab2
            jump_4a8c:
/*0x4a8c*/      lsl.w r5, lr, r3
/*0x4a90*/      tst r5, r7
/*0x4a92*/      bne jump_4ab2
/*0x4a94*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4a96*/      uxtb r1, r1
/*0x4a98*/      bhs jump_4a9e
/*0x4a9a*/      movs r0, #0xff
/*0x4a9c*/      pop {r4, r5, r6, r7, pc}
            jump_4a9e:
/*0x4a9e*/      add.w r5, r3, r4, lsl #3
/*0x4aa2*/      uxtb r5, r5
/*0x4aa4*/      cbz r2, jump_4aaa
/*0x4aa6*/      ldrb.w r5, [ip, r5]
            jump_4aaa:
/*0x4aaa*/      .short 0x1c76 /* adds r6, r6, #1 */ 
/*0x4aac*/      strb r5, [r0], #1
/*0x4ab0*/      uxtb r6, r6
            jump_4ab2:
/*0x4ab2*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4ab4*/      uxtb r3, r3
/*0x4ab6*/      bhs jump_4a8c
            jump_4ab8:
/*0x4ab8*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x4aba*/      uxtb r4, r4
/*0x4abc*/      bhs jump_4a78
/*0x4abe*/      mov r0, r6
/*0x4ac0*/      pop {r4, r5, r6, r7, pc}

/*0x4ac2*/  .byte 0x00
/*0x4ac3*/  .byte 0x00

            data_4ac4:
/*0x4ac4*/  .word 0x20000194
            data_4ac8:
/*0x4ac8*/  .word 0x200001aa


            .thumb_func
            call_4acc:
/*0x4acc*/      push {r4, lr}
/*0x4ace*/      bl call_6224
/*0x4ad2*/      cmp r0, #0
/*0x4ad4*/      beq jump_4aec
/*0x4ad6*/      movs r1, #0xb
/*0x4ad8*/      ldr r0, [pc, #0x24] /* data_4b00 */
/*0x4ada*/      movs r3, #0xfb
/*0x4adc*/      b jump_4af6
            jump_4ade:
/*0x4ade*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4ae0*/      cmp r1, #7
/*0x4ae2*/      beq jump_4aee
/*0x4ae4*/      ldrb r2, [r0]
/*0x4ae6*/      cmp r2, #0xff
/*0x4ae8*/      beq jump_4af6
            jump_4aea:
/*0x4aea*/      movs r0, #0
            jump_4aec:
/*0x4aec*/      pop {r4, pc}
            jump_4aee:
/*0x4aee*/      ldrb r4, [r0]
/*0x4af0*/      bics.w r2, r3, r4
/*0x4af4*/      bne jump_4aea
            jump_4af6:
/*0x4af6*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4af8*/      uxtb r1, r1
/*0x4afa*/      bhs jump_4ade
/*0x4afc*/      movs r0, #1
/*0x4afe*/      pop {r4, pc}

            data_4b00:
/*0x4b00*/  .word 0x2000019f


            .thumb_func
            call_4b04:
/*0x4b04*/      ldr r0, [pc, #8] /* data_4b10 */
/*0x4b06*/      ldrb.w r0, [r0, #0x2f5]
/*0x4b0a*/      b.w call_6254

/*0x4b0e*/  .byte 0x00
/*0x4b0f*/  .byte 0x00

            data_4b10:
/*0x4b10*/  .word 0x2000087c


            .thumb_func
            call_4b14:
/*0x4b14*/      push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x4b18*/      ldr r5, [pc, #0xf4] /* data_4c10 */
/*0x4b1a*/      ldrh r1, [r5]
/*0x4b1c*/      movw fp, #0xffff
/*0x4b20*/      cmp r1, fp
/*0x4b22*/      beq jump_4c0c
/*0x4b24*/      movs r2, #1
/*0x4b26*/      movs r1, #3
/*0x4b28*/      add r0, sp, #4
/*0x4b2a*/      bl call_4a70
/*0x4b2e*/      movs r6, #1
/*0x4b30*/      movs r7, #0
/*0x4b32*/      ldr r4, [pc, #0xe0] /* data_4c14 */
/*0x4b34*/      movw r8, #0x1770
/*0x4b38*/      movw sb, #0x2710
/*0x4b3c*/      cmp r0, #2
/*0x4b3e*/      beq jump_4b4e
/*0x4b40*/      cmp r0, #3
/*0x4b42*/      beq jump_4bca
/*0x4b44*/      ldrb r0, [r4, #8]
/*0x4b46*/      cmp r0, #0
/*0x4b48*/      beq jump_4c00
/*0x4b4a*/      strb r6, [r4]
/*0x4b4c*/      b jump_4c00
            jump_4b4e:
/*0x4b4e*/      movs r3, #0x12
/*0x4b50*/      movs r2, #0x47
/*0x4b52*/      movs r1, #2
/*0x4b54*/      add r0, sp, #4
/*0x4b56*/      str r7, [sp]
/*0x4b58*/      bl call_777c
/*0x4b5c*/      cbz r0, jump_4b68
/*0x4b5e*/      ldrh r1, [r5]
/*0x4b60*/      cmp r1, sb
/*0x4b62*/      bls jump_4b88
/*0x4b64*/      strb r6, [r4, #2]
/*0x4b66*/      b jump_4c00
            jump_4b68:
/*0x4b68*/      movs r3, #0x46
/*0x4b6a*/      movs r2, #0x44
/*0x4b6c*/      movs r1, #2
/*0x4b6e*/      add r0, sp, #4
/*0x4b70*/      str r7, [sp]
/*0x4b72*/      bl call_777c
/*0x4b76*/      mov.w sl, #2
/*0x4b7a*/      cbz r0, jump_4b8c
/*0x4b7c*/      ldrh r1, [r5]
/*0x4b7e*/      cmp r1, sb
/*0x4b80*/      bls jump_4b88
/*0x4b82*/      strb.w sl, [r4, #2]
/*0x4b86*/      b jump_4c00
            jump_4b88:
/*0x4b88*/      strb r6, [r4, #8]
/*0x4b8a*/      b jump_4c02
            jump_4b8c:
/*0x4b8c*/      movs r3, #6
/*0x4b8e*/      movs r2, #0x47
/*0x4b90*/      movs r1, #2
/*0x4b92*/      add r0, sp, #4
/*0x4b94*/      str r7, [sp]
/*0x4b96*/      bl call_777c
/*0x4b9a*/      ldr r6, [pc, #0x7c] /* data_4c18 */
/*0x4b9c*/      cbz r0, jump_4bac
/*0x4b9e*/      ldrh r1, [r5]
/*0x4ba0*/      cmp r1, r8
/*0x4ba2*/      bls jump_4c02
/*0x4ba4*/      strh r7, [r5]
/*0x4ba6*/      strb.w sl, [r6]
/*0x4baa*/      b jump_4c02
            jump_4bac:
/*0x4bac*/      movs r3, #6
/*0x4bae*/      movs r2, #0x3c
/*0x4bb0*/      movs r1, #2
/*0x4bb2*/      add r0, sp, #4
/*0x4bb4*/      str r7, [sp]
/*0x4bb6*/      bl call_777c
/*0x4bba*/      cbz r0, jump_4c00
/*0x4bbc*/      ldrh r1, [r5]
/*0x4bbe*/      cmp r1, r8
/*0x4bc0*/      bls jump_4c02
/*0x4bc2*/      strh r7, [r5]
/*0x4bc4*/      movs r0, #3
/*0x4bc6*/      strb r0, [r6]
/*0x4bc8*/      b jump_4c02
            jump_4bca:
/*0x4bca*/      mov.w sl, #0x11
/*0x4bce*/      movs r3, #0x44
/*0x4bd0*/      movs r2, #0x3c
/*0x4bd2*/      movs r1, #3
/*0x4bd4*/      add r0, sp, #4
/*0x4bd6*/      str.w sl, [sp]
/*0x4bda*/      bl call_777c
/*0x4bde*/      cbnz r0, jump_4bf2
/*0x4be0*/      movs r3, #0x46
/*0x4be2*/      movs r2, #0x3c
/*0x4be4*/      movs r1, #3
/*0x4be6*/      add r0, sp, #4
/*0x4be8*/      str.w sl, [sp]
/*0x4bec*/      bl call_777c
/*0x4bf0*/      cbz r0, jump_4c00
            jump_4bf2:
/*0x4bf2*/      ldrh r1, [r5]
/*0x4bf4*/      cmp r1, r8
/*0x4bf6*/      bls jump_4c02
/*0x4bf8*/      strh r7, [r5]
/*0x4bfa*/      strb r6, [r4, #0xa]
/*0x4bfc*/      strb r6, [r4]
/*0x4bfe*/      b jump_4c02
            jump_4c00:
/*0x4c00*/      strb r7, [r4, #8]
            jump_4c02:
/*0x4c02*/      ldrh r1, [r5]
/*0x4c04*/      cmp r1, sb
/*0x4c06*/      bls jump_4c0c
/*0x4c08*/      strh.w fp, [r5]
            jump_4c0c:
/*0x4c0c*/      pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

            data_4c10:
/*0x4c10*/  .word 0x20000192
            data_4c14:
/*0x4c14*/  .word 0x20000790
            data_4c18:
/*0x4c18*/  .word 0x20000010


            .thumb_func
            call_4c1c:
/*0x4c1c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4c20*/      ldr r0, [pc, #0x230] /* data_4e54 */
/*0x4c22*/      ldr.w ip, [pc, #0x234] /* data_4e58 */
/*0x4c26*/      movs r5, #0
/*0x4c28*/      ldrb r0, [r0, #0xa]
/*0x4c2a*/      ldrb.w r1, [ip, #4]
/*0x4c2e*/      cbz r0, jump_4c5a
/*0x4c30*/      ldrb.w r2, [ip, #6]
/*0x4c34*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x4c36*/      uxtb r2, r2
/*0x4c38*/      strb.w r2, [ip, #6]
/*0x4c3c*/      cmp r2, #3
/*0x4c3e*/      bls jump_4ce6
/*0x4c40*/      strb.w r5, [ip, #6]
/*0x4c44*/      cmp r0, #6
/*0x4c46*/      beq jump_4ce6
/*0x4c48*/      cmp r0, #7
            jump_4c4a:
/*0x4c4a*/      bne jump_4ce6
/*0x4c4c*/      movs r0, #0x18
/*0x4c4e*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4c50*/      udiv r2, r1, r0
/*0x4c54*/      mls r0, r0, r2, r1
/*0x4c58*/      b jump_4cea
            jump_4c5a:
/*0x4c5a*/      ldr r0, [pc, #0x200] /* data_4e5c */
/*0x4c5c*/      ldr r3, [pc, #0x1f8] /* data_4e58 */
/*0x4c5e*/      ldr r2, [pc, #0x200] /* data_4e60 */
/*0x4c60*/      ldrb r0, [r0, #3]
/*0x4c62*/      addw r6, r3, #0x123
/*0x4c66*/      ldr r3, [r3]
/*0x4c68*/      add.w r4, r2, #0xe
/*0x4c6c*/      mov.w sb, #1
/*0x4c70*/      cmp r0, #3
/*0x4c72*/      bhi jump_4d2a
/*0x4c74*/      ldrb r2, [r2, r0]
/*0x4c76*/      cmp r0, #1
/*0x4c78*/      add.w r2, r2, r2, lsl #1
/*0x4c7c*/      add.w r2, r4, r2, lsl #1
/*0x4c80*/      ldrb r4, [r3, #4]
/*0x4c82*/      and r4, r4, #0xf
/*0x4c86*/      ldrb r4, [r2, r4]
/*0x4c88*/      beq jump_4c94
/*0x4c8a*/      cmp r0, #2
/*0x4c8c*/      beq jump_4ce8
/*0x4c8e*/      cmp r0, #3
/*0x4c90*/      bne jump_4c4a
/*0x4c92*/      b jump_4cf0
            jump_4c94:
/*0x4c94*/      movs r0, #3
/*0x4c96*/      add.w r1, ip, #7
/*0x4c9a*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x4c9c*/      b jump_4ce0
            jump_4c9e:
/*0x4c9e*/      lsl.w r2, sb, r0
/*0x4ca2*/      ldrb.w r6, [ip, #7]
/*0x4ca6*/      uxtb r2, r2
/*0x4ca8*/      .short 0x1e5b /* subs r3, r3, #1 */ 
/*0x4caa*/      tst r6, r2
/*0x4cac*/      ldrb r6, [r1, #-0x1]!
/*0x4cb0*/      beq jump_4cc4
/*0x4cb2*/      cmp r6, r4
/*0x4cb4*/      bhi jump_4cc0
/*0x4cb6*/      strb r5, [r1]
/*0x4cb8*/      ldrb.w r6, [ip, #7]
/*0x4cbc*/      bics r6, r2
/*0x4cbe*/      b jump_4cd6
            jump_4cc0:
/*0x4cc0*/      subs r2, r6, r4
/*0x4cc2*/      b jump_4cde
            jump_4cc4:
/*0x4cc4*/      ldrb r7, [r3]
/*0x4cc6*/      sub.w r8, r7, r4
/*0x4cca*/      cmp r6, r8
/*0x4ccc*/      blt jump_4cdc
/*0x4cce*/      strb r7, [r1]
/*0x4cd0*/      ldrb.w r6, [ip, #7]
/*0x4cd4*/      orrs r6, r2
            jump_4cd6:
/*0x4cd6*/      strb.w r6, [ip, #7]
/*0x4cda*/      b jump_4ce0
            jump_4cdc:
/*0x4cdc*/      adds r2, r6, r4
            jump_4cde:
/*0x4cde*/      strb r2, [r1]
            jump_4ce0:
/*0x4ce0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4ce2*/      uxtb r0, r0
/*0x4ce4*/      bhs jump_4c9e
            jump_4ce6:
/*0x4ce6*/      b jump_4e4a
            jump_4ce8:
/*0x4ce8*/      adds r0, r1, r4
            jump_4cea:
/*0x4cea*/      strb.w r0, [ip, #4]
/*0x4cee*/      b jump_4e4a
            jump_4cf0:
/*0x4cf0*/      movs r7, #0x60
/*0x4cf2*/      b jump_4d22
            jump_4cf4:
/*0x4cf4*/      mov r0, r4
/*0x4cf6*/      bl call_452c
/*0x4cfa*/      cbz r0, jump_4d00
/*0x4cfc*/      movs r0, #3
/*0x4cfe*/      b jump_4d1c
            jump_4d00:
/*0x4d00*/      subs r0, r6, #2
/*0x4d02*/      movs r1, #0
/*0x4d04*/      bl call_6ef0
/*0x4d08*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
/*0x4d0a*/      b jump_4d22
            jump_4d0c:
/*0x4d0c*/      ldrb r1, [r6]
/*0x4d0e*/      cmp r1, #2
/*0x4d10*/      bhi jump_4d16
/*0x4d12*/      strb r5, [r6]
/*0x4d14*/      b jump_4d1a
            jump_4d16:
/*0x4d16*/      .short 0x1e89 /* subs r1, r1, #2 */ 
/*0x4d18*/      strb r1, [r6]
            jump_4d1a:
/*0x4d1a*/      .short 0x1e76 /* subs r6, r6, #1 */ 
            jump_4d1c:
/*0x4d1c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4d1e*/      uxtb r0, r0
/*0x4d20*/      bhs jump_4d0c
            jump_4d22:
/*0x4d22*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x4d24*/      uxtb r7, r7
/*0x4d26*/      bhs jump_4cf4
/*0x4d28*/      b jump_4e4a
            jump_4d2a:
/*0x4d2a*/      cmp r0, #7
/*0x4d2c*/      bls jump_4da6
/*0x4d2e*/      ldrb r1, [r2, r0]
/*0x4d30*/      ldrb r2, [r3, #4]
/*0x4d32*/      add.w r1, r1, r1, lsl #1
/*0x4d36*/      add.w r1, r4, r1, lsl #1
/*0x4d3a*/      and r2, r2, #0xf
/*0x4d3e*/      bic r0, r0, #1
/*0x4d42*/      ldrb r2, [r1, r2]
/*0x4d44*/      cmp r0, #8
/*0x4d46*/      beq jump_4d52
/*0x4d48*/      cmp r0, #0xa
/*0x4d4a*/      beq jump_4da8
/*0x4d4c*/      cmp r0, #0xc
/*0x4d4e*/      bne jump_4e4a
/*0x4d50*/      b jump_4e08
            jump_4d52:
/*0x4d52*/      movs r0, #0x60
/*0x4d54*/      b jump_4da0
            jump_4d56:
/*0x4d56*/      ldrb r1, [r6], #-1
/*0x4d5a*/      cbz r1, jump_4d60
/*0x4d5c*/      .short 0x1eb6 /* subs r6, r6, #2 */ 
/*0x4d5e*/      b jump_4d70
            jump_4d60:
/*0x4d60*/      ldrb r1, [r6], #-1
/*0x4d64*/      cbz r1, jump_4d6a
/*0x4d66*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x4d68*/      b jump_4d70
            jump_4d6a:
/*0x4d6a*/      ldrb r1, [r6], #-1
/*0x4d6e*/      cbz r1, jump_4da0
            jump_4d70:
/*0x4d70*/      ldr r1, [pc, #0xf0] /* data_4e64 */
/*0x4d72*/      and r4, r0, #7
/*0x4d76*/      add.w r1, r1, r0, lsr #3
/*0x4d7a*/      lsl.w r3, sb, r4
/*0x4d7e*/      ldrb r1, [r1]
/*0x4d80*/      tst r1, r3
/*0x4d82*/      beq jump_4da0
/*0x4d84*/      movs r1, #3
/*0x4d86*/      b jump_4d98
            jump_4d88:
/*0x4d88*/      ldrb r3, [r6, #1]!
/*0x4d8c*/      cmp r3, r2
/*0x4d8e*/      bhi jump_4d94
/*0x4d90*/      strb r5, [r6]
/*0x4d92*/      b jump_4d98
            jump_4d94:
/*0x4d94*/      subs r3, r3, r2
/*0x4d96*/      strb r3, [r6]
            jump_4d98:
/*0x4d98*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x4d9a*/      uxtb r1, r1
/*0x4d9c*/      bhs jump_4d88
/*0x4d9e*/      .short 0x1ef6 /* subs r6, r6, #3 */ 
            jump_4da0:
/*0x4da0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4da2*/      uxtb r0, r0
/*0x4da4*/      bhs jump_4d56
            jump_4da6:
/*0x4da6*/      b jump_4e4a
            jump_4da8:
/*0x4da8*/      ldrb.w r0, [ip, #0x6a]
/*0x4dac*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4dae*/      uxtb r0, r0
/*0x4db0*/      strb.w r0, [ip, #0x6a]
/*0x4db4*/      cmp r0, r2
/*0x4db6*/      blo jump_4e4a
/*0x4db8*/      strb.w r5, [ip, #0x6a]
/*0x4dbc*/      movs r0, #1
            jump_4dbe:
/*0x4dbe*/      add.w r1, r0, r0, lsl #1
/*0x4dc2*/      add.w r1, ip, r1, lsl #1
/*0x4dc6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4dc8*/      ldrh r2, [r1, #4]
/*0x4dca*/      strh r2, [r1, #-0x2]
/*0x4dce*/      ldrb r2, [r1, #6]
/*0x4dd0*/      uxtb r0, r0
/*0x4dd2*/      strb r2, [r1]
/*0x4dd4*/      cmp r0, #0x11
/*0x4dd6*/      blo jump_4dbe
/*0x4dd8*/      ldr r2, [pc, #0x7c] /* data_4e58 */
/*0x4dda*/      subs r2, #8
/*0x4ddc*/      movs r0, #0x11
/*0x4dde*/      strh.w r5, [r2, #0x6c]
/*0x4de2*/      strb.w r5, [r2, #0x6e]
/*0x4de6*/      b jump_4dfa
            jump_4de8:
/*0x4de8*/      add.w r1, r0, r0, lsl #1
/*0x4dec*/      add.w r1, ip, r1, lsl #1
/*0x4df0*/      ldrh r3, [r1, #1]!
/*0x4df4*/      strh r3, [r1, #6]
/*0x4df6*/      ldrb r3, [r1, #2]
/*0x4df8*/      strb r3, [r1, #8]
            jump_4dfa:
/*0x4dfa*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x4dfc*/      uxtb r0, r0
/*0x4dfe*/      bhs jump_4de8
/*0x4e00*/      strh.w r5, [r2, #0xf]
/*0x4e04*/      strb r5, [r2, #0x11]
/*0x4e06*/      b jump_4e4a
            jump_4e08:
/*0x4e08*/      ldrb.w r0, [ip, #0x27]
/*0x4e0c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x4e0e*/      uxtb r0, r0
/*0x4e10*/      strb.w r0, [ip, #0x27]
/*0x4e14*/      cmp r0, r2
/*0x4e16*/      blo jump_4e4a
/*0x4e18*/      ldr r0, [pc, #0x3c] /* data_4e58 */
/*0x4e1a*/      strb.w r5, [ip, #0x27]
/*0x4e1e*/      adds r0, #0x27
/*0x4e20*/      movs r2, #5
/*0x4e22*/      b jump_4e44
            jump_4e24:
/*0x4e24*/      ldrsb r1, [r0, #-0x1]
/*0x4e28*/      .short 0x1f40 /* subs r0, r0, #5 */ 
/*0x4e2a*/      cbz r1, jump_4e44
/*0x4e2c*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x4e2e*/      sxtb r1, r1
/*0x4e30*/      strb r1, [r0, #4]
/*0x4e32*/      ldrb r3, [r0, #3]
/*0x4e34*/      adds r4, r1, r3
/*0x4e36*/      subs r4, #0xa
/*0x4e38*/      cmp r4, #0xe
/*0x4e3a*/      ble jump_4e44
/*0x4e3c*/      subs r1, r3, r1
/*0x4e3e*/      adds r1, #0xa
/*0x4e40*/      bpl jump_4e44
/*0x4e42*/      strb r5, [r0, #4]
            jump_4e44:
/*0x4e44*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x4e46*/      uxtb r2, r2
/*0x4e48*/      bhs jump_4e24
            jump_4e4a:
/*0x4e4a*/      pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4e4e*/      b.w call_5690

/*0x4e52*/  .byte 0x00
/*0x4e53*/  .byte 0x00

            data_4e54:
/*0x4e54*/  .word 0x20000790
            data_4e58:
/*0x4e58*/  .word 0x2000005c
            data_4e5c:
/*0x4e5c*/  .word 0x2000087c
            data_4e60:
/*0x4e60*/  .word 0x00007aad /* possible pointer */
            data_4e64:
/*0x4e64*/  .word 0x20000194


            .thumb_func
            call_4e68:
/*0x4e68*/      movs r1, #9
/*0x4e6a*/      ldr r0, [pc, #4] /* data_4e70 */
/*0x4e6c*/      b.w jump_4788

            data_4e70:
/*0x4e70*/  .word 0x000079f8 /* possible pointer */


            .thumb_func
            call_4e74:
/*0x4e74*/      push {r3, r4, r5, lr}
/*0x4e76*/      movs r2, #1
/*0x4e78*/      movs r1, #3
/*0x4e7a*/      mov r0, sp
/*0x4e7c*/      bl call_4a70
/*0x4e80*/      ldr r4, [pc, #0x2c] /* data_4eb0 */
/*0x4e82*/      cmp r0, #3
/*0x4e84*/      bne jump_4ea6
/*0x4e86*/      movs r2, #3
/*0x4e88*/      ldr r1, [pc, #0x28] /* data_4eb4 */
/*0x4e8a*/      mov r0, sp
/*0x4e8c*/      bl call_4a40
/*0x4e90*/      cbz r0, jump_4ea6
/*0x4e92*/      ldrb r0, [r4, #2]
/*0x4e94*/      mvn.w r1, r0, lsr #1
/*0x4e98*/      bfi r0, r1, #1, #1
/*0x4e9c*/      strb r0, [r4, #2]
/*0x4e9e*/      ldr r0, [pc, #0x18] /* data_4eb8 */
/*0x4ea0*/      ldrb r0, [r0, #2]
/*0x4ea2*/      bl call_43b8
            jump_4ea6:
/*0x4ea6*/      ldrb r0, [r4, #2]
/*0x4ea8*/      ubfx r0, r0, #1, #1
/*0x4eac*/      pop {r3, r4, r5, pc}

/*0x4eae*/  .byte 0x00
/*0x4eaf*/  .byte 0x00

            data_4eb0:
/*0x4eb0*/  .word 0x2000087c
            data_4eb4:
/*0x4eb4*/  .word 0x000079e6 /* possible pointer */
            data_4eb8:
/*0x4eb8*/  .word 0x20000870


            .thumb_func
            call_4ebc:
/*0x4ebc*/      push {r4, lr}
/*0x4ebe*/      lsrs r1, r0, #0x18
/*0x4ec0*/      lsls r1, r1, #0x1e
/*0x4ec2*/      bpl jump_4ee6
/*0x4ec4*/      uxtb r1, r0
/*0x4ec6*/      movs r2, #3
/*0x4ec8*/      ldr r3, [pc, #0x7c] /* data_4f48 */
/*0x4eca*/      cmp r1, #0x3f
/*0x4ecc*/      beq jump_4f2c
/*0x4ece*/      bgt jump_4ee8
/*0x4ed0*/      cmp r1, #0x10
/*0x4ed2*/      beq jump_4ee0
/*0x4ed4*/      cmp r1, #0x11
/*0x4ed6*/      beq jump_4ee0
/*0x4ed8*/      cmp r1, #0x12
/*0x4eda*/      beq jump_4ee0
/*0x4edc*/      cmp r1, #0x13
/*0x4ede*/      bne jump_4ee6
            jump_4ee0:
/*0x4ee0*/      ldr r0, [pc, #0x68] /* data_4f4c */
/*0x4ee2*/      subs r1, #0x10
/*0x4ee4*/      strb r1, [r0]
            jump_4ee6:
/*0x4ee6*/      pop {r4, pc}
            jump_4ee8:
/*0x4ee8*/      ldr r0, [pc, #0x64] /* data_4f50 */
/*0x4eea*/      cmp r1, #0x5f
/*0x4eec*/      ldrb r0, [r0, #2]
/*0x4eee*/      beq jump_4f02
/*0x4ef0*/      ldr r4, [pc, #0x60] /* data_4f54 */
/*0x4ef2*/      cmp r1, #0x68
/*0x4ef4*/      beq jump_4f18
/*0x4ef6*/      cmp r1, #0x69
/*0x4ef8*/      beq jump_4f1c
/*0x4efa*/      cmp r1, #0x6a
/*0x4efc*/      bne jump_4ee6
/*0x4efe*/      movs r1, #0
/*0x4f00*/      b jump_4f1e
            jump_4f02:
/*0x4f02*/      cmp r0, #0
/*0x4f04*/      beq jump_4ee6
/*0x4f06*/      bl call_5680
/*0x4f0a*/      bl call_5c94
/*0x4f0e*/      ldr r1, [pc, #0x48] /* data_4f58 */
/*0x4f10*/      movw r0, #0x7530
/*0x4f14*/      strh r0, [r1, #2]
            jump_4f16:
/*0x4f16*/      pop {r4, pc}
            jump_4f18:
/*0x4f18*/      movs r1, #1
/*0x4f1a*/      b jump_4f1e
            jump_4f1c:
/*0x4f1c*/      movs r1, #2
            jump_4f1e:
/*0x4f1e*/      strb.w r1, [r4, #0x2f5]
/*0x4f22*/      strb r2, [r3, #3]
/*0x4f24*/      pop.w {r4, lr}
/*0x4f28*/      b.w call_43b8
            jump_4f2c:
/*0x4f2c*/      ldr r1, [pc, #0x2c] /* data_4f5c */
/*0x4f2e*/      ldrb r0, [r1]
/*0x4f30*/      cbz r0, jump_4f44
/*0x4f32*/      movs r0, #0
            jump_4f34:
/*0x4f34*/      strb r0, [r1]
/*0x4f36*/      ldr r1, [pc, #0x28] /* data_4f60 */
/*0x4f38*/      ldrb r4, [r1]
/*0x4f3a*/      cmp r4, r0
/*0x4f3c*/      beq jump_4f16
/*0x4f3e*/      strb r0, [r1]
/*0x4f40*/      strb r2, [r3, #3]
/*0x4f42*/      pop {r4, pc}
            jump_4f44:
/*0x4f44*/      movs r0, #1
/*0x4f46*/      b jump_4f34

            data_4f48:
/*0x4f48*/  .word 0x20000790
            data_4f4c:
/*0x4f4c*/  .word 0x2000000a
            data_4f50:
/*0x4f50*/  .word 0x20000870
            data_4f54:
/*0x4f54*/  .word 0x2000087c
            data_4f58:
/*0x4f58*/  .word 0x20000010
            data_4f5c:
/*0x4f5c*/  .word 0x20000000
            data_4f60:
/*0x4f60*/  .word 0x20000001


            .thumb_func
            call_4f64:
/*0x4f64*/      ldr r0, [pc, #0x7c] /* data_4fe4 */
/*0x4f66*/      push {r4, lr}
/*0x4f68*/      ldrb r1, [r0, #3]
/*0x4f6a*/      lsls r1, r1, #0x1e
/*0x4f6c*/      bpl jump_4fbe
/*0x4f6e*/      ldr r2, [pc, #0x78] /* data_4fe8 */
/*0x4f70*/      ldrb r4, [r0]
/*0x4f72*/      movs r3, #1
/*0x4f74*/      ldrb r1, [r2, #6]
/*0x4f76*/      cmp r4, #0xcf
/*0x4f78*/      beq jump_4f8a
/*0x4f7a*/      ldrb r0, [r0, #1]
/*0x4f7c*/      lsls r0, r0, #0x1f
/*0x4f7e*/      beq jump_4fbe
/*0x4f80*/      ldr r0, [pc, #0x60] /* data_4fe4 */
/*0x4f82*/      cmp r1, #2
/*0x4f84*/      ldrb r0, [r0, #2]
/*0x4f86*/      beq jump_4f9e
/*0x4f88*/      b jump_4faa
            jump_4f8a:
/*0x4f8a*/      cmp r1, #4
/*0x4f8c*/      beq jump_4f9a
/*0x4f8e*/      cmp r1, #5
/*0x4f90*/      bne jump_4fbe
/*0x4f92*/      strb r3, [r2, #9]
/*0x4f94*/      movs r0, #6
/*0x4f96*/      strb r0, [r2, #6]
/*0x4f98*/      b jump_4fe0
            jump_4f9a:
/*0x4f9a*/      strb r3, [r2, #6]
/*0x4f9c*/      b jump_4fe0
            jump_4f9e:
/*0x4f9e*/      cmp r0, #0x13
/*0x4fa0*/      beq jump_4fbe
/*0x4fa2*/      cmp r0, #0x15
/*0x4fa4*/      beq jump_4fbe
/*0x4fa6*/      cmp r0, #0x17
/*0x4fa8*/      beq jump_4fbe
            jump_4faa:
/*0x4faa*/      ldr r1, [pc, #0x3c] /* data_4fe8 */
/*0x4fac*/      cmp r0, #0x13
/*0x4fae*/      ldr r1, [r1]
/*0x4fb0*/      beq jump_4fc2
/*0x4fb2*/      cmp r0, #0x15
/*0x4fb4*/      beq jump_4fc6
/*0x4fb6*/      cmp r0, #0x17
/*0x4fb8*/      beq jump_4fcc
/*0x4fba*/      cmp r0, #0x36
/*0x4fbc*/      beq jump_4fd2
            jump_4fbe:
/*0x4fbe*/      movs r0, #0
/*0x4fc0*/      pop {r4, pc}
            jump_4fc2:
/*0x4fc2*/      adds r1, #0xf
/*0x4fc4*/      b jump_4fc8
            jump_4fc6:
/*0x4fc6*/      adds r1, #0x64
            jump_4fc8:
/*0x4fc8*/      str r1, [r2]
/*0x4fca*/      b jump_4fe0
            jump_4fcc:
/*0x4fcc*/      add.w r1, r1, #0x1f4
/*0x4fd0*/      b jump_4fc8
            jump_4fd2:
/*0x4fd2*/      movs r0, #8
/*0x4fd4*/      ldr r1, [pc, #0x14] /* data_4fec */
/*0x4fd6*/      strb r0, [r2, #6]
/*0x4fd8*/      movs r0, #0
/*0x4fda*/      strh r0, [r1, #2]
/*0x4fdc*/      ldr r0, [pc, #0x10] /* data_4ff0 */
/*0x4fde*/      strb r3, [r0]
            jump_4fe0:
/*0x4fe0*/      movs r0, #1
/*0x4fe2*/      pop {r4, pc}

            data_4fe4:
/*0x4fe4*/  .word 0x2000079c
            data_4fe8:
/*0x4fe8*/  .word 0x20001b7c
            data_4fec:
/*0x4fec*/  .word 0x20000010
            data_4ff0:
/*0x4ff0*/  .word 0x20000790


            .thumb_func
            call_4ff4:
/*0x4ff4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x4ff8*/      ldr r0, [pc, #0x18c] /* data_5188 */
/*0x4ffa*/      ldrh r1, [r0, #2]
/*0x4ffc*/      cbz r1, jump_5004
/*0x4ffe*/      movw r1, #0x7530
/*0x5002*/      strh r1, [r0, #2]
            jump_5004:
/*0x5004*/      ldr r4, [pc, #0x184] /* data_518c */
/*0x5006*/      ldrb r0, [r4]
/*0x5008*/      cmp r0, #0xc7
/*0x500a*/      beq jump_501c
/*0x500c*/      cmp r0, #0xc8
/*0x500e*/      beq jump_501c
/*0x5010*/      movs r1, #0x2a
/*0x5012*/      cmp r0, #0xc6
/*0x5014*/      beq jump_5022
/*0x5016*/      cmp r0, #0xc5
/*0x5018*/      beq jump_5022
/*0x501a*/      b jump_5024
            jump_501c:
/*0x501c*/      movs r0, #0x2c
/*0x501e*/      strb r0, [r4]
/*0x5020*/      b jump_5024
            jump_5022:
/*0x5022*/      strb r1, [r4]
            jump_5024:
/*0x5024*/      ldr r0, [pc, #0x164] /* data_518c */
/*0x5026*/      ldr r7, [pc, #0x168] /* data_5190 */
/*0x5028*/      movs r6, #0
/*0x502a*/      ldrb r1, [r0, #3]
/*0x502c*/      ldrb r2, [r7, #9]
/*0x502e*/      ldrb r0, [r0, #2]
/*0x5030*/      mov.w r8, #1
/*0x5034*/      cbz r2, jump_5090
/*0x5036*/      lsls r1, r1, #0x1e
/*0x5038*/      bpl jump_508c
/*0x503a*/      cmp r2, #1
/*0x503c*/      beq jump_5050
/*0x503e*/      ldr r1, [pc, #0x154] /* data_5194 */
/*0x5040*/      ldrb r1, [r2, r1]
/*0x5042*/      cmp r0, r1
/*0x5044*/      beq jump_507e
/*0x5046*/      ldr r3, [pc, #0x14c] /* data_5194 */
/*0x5048*/      movs r1, #4
/*0x504a*/      .short 0x1ddb /* adds r3, r3, #7 */ 
/*0x504c*/      ldrb r5, [r4]
/*0x504e*/      b jump_5074
            jump_5050:
/*0x5050*/      ldr r1, [pc, #0x144] /* data_5198 */
/*0x5052*/      ldrb.w r2, [r1, #0xe8]
/*0x5056*/      cmp r0, r2
/*0x5058*/      bne jump_505e
/*0x505a*/      movs r2, #2
/*0x505c*/      strb r2, [r7, #9]
            jump_505e:
/*0x505e*/      ldrb.w r1, [r1, #0xe9]
/*0x5062*/      cmp r0, r1
/*0x5064*/      bne jump_508c
/*0x5066*/      movs r0, #3
/*0x5068*/      strb r0, [r7, #9]
/*0x506a*/      b jump_508c
            jump_506c:
/*0x506c*/      ldrb.w ip, [r3, r1]
/*0x5070*/      cmp ip, r5
/*0x5072*/      beq jump_507a
            jump_5074:
/*0x5074*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x5076*/      uxtb r1, r1
/*0x5078*/      bhs jump_506c
            jump_507a:
/*0x507a*/      cmp r1, #0xff
/*0x507c*/      bne jump_508c
            jump_507e:
/*0x507e*/      ldr r1, [pc, #0x118] /* data_5198 */
/*0x5080*/      adds r1, #0xe6
/*0x5082*/      strb r0, [r2, r1]
/*0x5084*/      strb.w r8, [r7, #9]
/*0x5088*/      bl call_7998
            jump_508c:
/*0x508c*/      strb r6, [r4]
/*0x508e*/      b jump_50be
            jump_5090:
/*0x5090*/      ldr r5, [pc, #0x108] /* data_519c */
/*0x5092*/      ldrb r2, [r4]
/*0x5094*/      ldrb r3, [r5, #8]
/*0x5096*/      mov sb, r2
/*0x5098*/      cmp r2, #0xcf
/*0x509a*/      beq jump_50b4
/*0x509c*/      ldrb r2, [r4, #1]
/*0x509e*/      mov sl, r2
/*0x50a0*/      lsls.w ip, r2, #0x1f
/*0x50a4*/      ldr r2, [pc, #0xe4] /* data_518c */
/*0x50a6*/      ldrb r2, [r2, #3]
/*0x50a8*/      orr r2, r2, #1
/*0x50ac*/      beq jump_50f8
/*0x50ae*/      cmp r3, #1
/*0x50b0*/      beq jump_50c8
/*0x50b2*/      b jump_50c4
            jump_50b4:
/*0x50b4*/      ubfx r0, r1, #1, #1
/*0x50b8*/      strb r0, [r7, #6]
/*0x50ba*/      cmp r3, #1
/*0x50bc*/      beq jump_50c4
            jump_50be:
/*0x50be*/      movs r0, #1
            jump_50c0:
/*0x50c0*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
            jump_50c4:
/*0x50c4*/      movs r0, #0
/*0x50c6*/      b jump_50c0
            jump_50c8:
/*0x50c8*/      ldrb r1, [r5, #6]
/*0x50ca*/      cmp r1, #2
/*0x50cc*/      beq jump_50c4
/*0x50ce*/      ldr r3, [pc, #0xc4] /* data_5194 */
/*0x50d0*/      movs r1, #0
/*0x50d2*/      adds r3, #0x31
            jump_50d4:
/*0x50d4*/      ldrb.w r5, [r3, r1, lsl #1]
/*0x50d8*/      cmp r0, r5
/*0x50da*/      bne jump_50ee
/*0x50dc*/      add.w r0, r3, r1, lsl #1
/*0x50e0*/      ldrb r0, [r0, #1]
/*0x50e2*/      strb r0, [r4]
/*0x50e4*/      strb r2, [r4, #3]
/*0x50e6*/      bic r0, sl, #1
/*0x50ea*/      strb r0, [r4, #1]
/*0x50ec*/      b jump_50c4
            jump_50ee:
/*0x50ee*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x50f0*/      uxtb r1, r1
/*0x50f2*/      cmp r1, #0x2d
/*0x50f4*/      blo jump_50d4
/*0x50f6*/      b jump_50c4
            jump_50f8:
/*0x50f8*/      ldrb r3, [r7, #6]
/*0x50fa*/      cbz r3, jump_5148
/*0x50fc*/      ldrb r2, [r7, #5]
/*0x50fe*/      cmp r2, #0
/*0x5100*/      bne jump_50c4
/*0x5102*/      lsls r1, r1, #0x1e
/*0x5104*/      bpl jump_50c4
/*0x5106*/      ldr r1, [pc, #0x98] /* data_51a0 */
/*0x5108*/      cmp r0, #0x21
/*0x510a*/      ldrb r1, [r1, r0]
/*0x510c*/      strb r1, [r4]
/*0x510e*/      beq jump_5126
/*0x5110*/      cmp r0, #0x28
/*0x5112*/      beq jump_5126
/*0x5114*/      cmp r0, #0x29
/*0x5116*/      beq jump_5136
/*0x5118*/      cmp r0, #0x30
/*0x511a*/      beq jump_5136
/*0x511c*/      ldr r0, [r4]
/*0x511e*/      bl call_5468
            jump_5122:
/*0x5122*/      strb r6, [r4]
/*0x5124*/      b jump_50c4
            jump_5126:
/*0x5126*/      subs r0, #0x21
/*0x5128*/      lsl.w r8, r8, r0
/*0x512c*/      and r0, r8, #0xff
/*0x5130*/      bl call_3cec
/*0x5134*/      b jump_5122
            jump_5136:
/*0x5136*/      subs r0, #0x29
/*0x5138*/      lsl.w r0, r8, r0
/*0x513c*/      uxtb r0, r0
/*0x513e*/      bl call_3ccc
/*0x5142*/      strb.w r8, [r7]
/*0x5146*/      b jump_5122
            jump_5148:
/*0x5148*/      lsls r1, r1, #0x1e
/*0x514a*/      bpl jump_5170
/*0x514c*/      cmp r0, #0x3e
/*0x514e*/      bne jump_50c4
/*0x5150*/      ldr r1, [pc, #0x50] /* data_51a4 */
/*0x5152*/      ldrb r1, [r1]
/*0x5154*/      cmp r1, #0
/*0x5156*/      beq jump_50c4
/*0x5158*/      bl call_5714
/*0x515c*/      cmp r0, #0
/*0x515e*/      bne jump_50c4
/*0x5160*/      ldrb r0, [r5, #8]
/*0x5162*/      cmp r0, #0
/*0x5164*/      bne jump_50c4
/*0x5166*/      ldr r0, [pc, #0x2c] /* data_5194 */
/*0x5168*/      adds r0, #0xe
/*0x516a*/      bl call_591c
/*0x516e*/      b jump_50c4
            jump_5170:
/*0x5170*/      ldr r1, [pc, #0x14] /* data_5188 */
/*0x5172*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x5174*/      ldrb r0, [r1]
/*0x5176*/      cmp r0, #0
/*0x5178*/      beq jump_50c4
/*0x517a*/      cmp.w sb, #0x29
/*0x517e*/      bne jump_50c4
/*0x5180*/      strb r0, [r4]
/*0x5182*/      strb r6, [r1]
/*0x5184*/      strb r2, [r4, #3]
/*0x5186*/      b jump_50c4

            data_5188:
/*0x5188*/  .word 0x20000010
            data_518c:
/*0x518c*/  .word 0x2000079c
            data_5190:
/*0x5190*/  .word 0x20000790
            data_5194:
/*0x5194*/  .word 0x000079e2 /* possible pointer */
            data_5198:
/*0x5198*/  .word 0x2000087c
            data_519c:
/*0x519c*/  .word 0x20001b7c
            data_51a0:
/*0x51a0*/  .word 0x200001aa
            data_51a4:
/*0x51a4*/  .word 0x20000000


            .thumb_func
            call_51a8:
/*0x51a8*/      push {r4, r5, r6, lr}
/*0x51aa*/      ldr r4, [pc, #0x7c] /* data_5228 */
/*0x51ac*/      ldrb r0, [r4, #3]
/*0x51ae*/      lsls r1, r0, #0x1f
/*0x51b0*/      bne jump_51f4
/*0x51b2*/      ldr r6, [pc, #0x78] /* data_522c */
/*0x51b4*/      ldr r3, [pc, #0x78] /* data_5230 */
/*0x51b6*/      sub.w r2, r6, #0x2d
/*0x51ba*/      ldrb r1, [r6]
/*0x51bc*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x51be*/      strb r1, [r6]
/*0x51c0*/      mov r1, r4
/*0x51c2*/      lsls r0, r0, #0x1e
/*0x51c4*/      ldrb r1, [r1, #2]
/*0x51c6*/      bpl jump_5200
/*0x51c8*/      ldrb r0, [r6, #1]
/*0x51ca*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x51cc*/      strb r0, [r6, #1]
/*0x51ce*/      ldrb r5, [r4, #1]
/*0x51d0*/      lsls r0, r5, #0x19
/*0x51d2*/      bpl jump_51f4
/*0x51d4*/      ldrb r0, [r6, #2]
/*0x51d6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x51d8*/      strb r0, [r6, #2]
/*0x51da*/      movs r0, #0
            jump_51dc:
/*0x51dc*/      ldrb.w r6, [r3, r0, lsl #1]
/*0x51e0*/      cmp r1, r6
/*0x51e2*/      bne jump_51f6
/*0x51e4*/      add.w r1, r3, r0, lsl #1
/*0x51e8*/      ldrb r1, [r1, #1]
/*0x51ea*/      strb r1, [r4]
/*0x51ec*/      strb r1, [r2, r0]
/*0x51ee*/      bic r0, r5, #1
/*0x51f2*/      strb r0, [r4, #1]
            jump_51f4:
/*0x51f4*/      pop {r4, r5, r6, pc}
            jump_51f6:
/*0x51f6*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x51f8*/      uxtb r0, r0
/*0x51fa*/      cmp r0, #0x2d
/*0x51fc*/      blo jump_51dc
/*0x51fe*/      pop {r4, r5, r6, pc}
            jump_5200:
/*0x5200*/      ldrb r0, [r6, #3]
/*0x5202*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5204*/      strb r0, [r6, #3]
/*0x5206*/      movs r0, #0
            jump_5208:
/*0x5208*/      ldrb.w r5, [r3, r0, lsl #1]
/*0x520c*/      cmp r1, r5
/*0x520e*/      bne jump_521c
/*0x5210*/      ldrb r5, [r2, r0]
/*0x5212*/      cbz r5, jump_521c
/*0x5214*/      strb r5, [r4]
/*0x5216*/      movs r1, #0
/*0x5218*/      strb r1, [r2, r0]
/*0x521a*/      pop {r4, r5, r6, pc}
            jump_521c:
/*0x521c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x521e*/      uxtb r0, r0
/*0x5220*/      cmp r0, #0x2d
/*0x5222*/      blo jump_5208
/*0x5224*/      pop {r4, r5, r6, pc}

/*0x5226*/  .byte 0x00
/*0x5227*/  .byte 0x00

            data_5228:
/*0x5228*/  .word 0x2000079c
            data_522c:
/*0x522c*/  .word 0x20000041
            data_5230:
/*0x5230*/  .word 0x00007a13 /* possible pointer */


            .thumb_func
            call_5234:
/*0x5234*/      ldr r1, [pc, #0x1c] /* data_5254 */
/*0x5236*/      push {r4, lr}
/*0x5238*/      ldr r1, [r1]
/*0x523a*/      ldrh r2, [r0]
/*0x523c*/      strh r2, [r1]
/*0x523e*/      ldrb r0, [r0, #2]
/*0x5240*/      strb r0, [r1, #2]
/*0x5242*/      bl call_5690
/*0x5246*/      ldr r0, [pc, #0x10] /* data_5258 */
/*0x5248*/      ldrb r0, [r0, #2]
/*0x524a*/      pop.w {r4, lr}
/*0x524e*/      b.w call_43b8

/*0x5252*/  .byte 0x00
/*0x5253*/  .byte 0x00

            data_5254:
/*0x5254*/  .word 0x2000005c
            data_5258:
/*0x5258*/  .word 0x20000870


            .thumb_func
            call_525c:
/*0x525c*/      push {r4, r5, r6, lr}
/*0x525e*/      ldr r4, [pc, #0x34] /* data_5294 */
/*0x5260*/      movs r5, #0
/*0x5262*/      ldrb r0, [r4]
/*0x5264*/      cbz r0, jump_5274
/*0x5266*/      movs r0, #1
/*0x5268*/      bl call_4694
/*0x526c*/      cbz r0, jump_5274
/*0x526e*/      bl call_7998
/*0x5272*/      strb r5, [r4]
            jump_5274:
/*0x5274*/      ldrh r0, [r4, #2]
/*0x5276*/      cmp r0, #1
/*0x5278*/      bne jump_528e
/*0x527a*/      ldr r0, [pc, #0x1c] /* data_5298 */
/*0x527c*/      ldrb r1, [r0, #6]
/*0x527e*/      cbz r1, jump_5284
/*0x5280*/      movs r1, #8
/*0x5282*/      strb r1, [r0, #6]
            jump_5284:
/*0x5284*/      ldr r0, [pc, #0x14] /* data_529c */
/*0x5286*/      movs r1, #1
/*0x5288*/      strb r5, [r0, #5]
/*0x528a*/      strb r1, [r0]
/*0x528c*/      strh r5, [r4, #2]
            jump_528e:
/*0x528e*/      movs r0, #1
/*0x5290*/      pop {r4, r5, r6, pc}

/*0x5292*/  .byte 0x00
/*0x5293*/  .byte 0x00

            data_5294:
/*0x5294*/  .word 0x20000010
            data_5298:
/*0x5298*/  .word 0x20001b7c
            data_529c:
/*0x529c*/  .word 0x20000790


            .thumb_func
            call_52a0:
/*0x52a0*/      cmp r0, #0xff
/*0x52a2*/      bhs jump_52b2
/*0x52a4*/      adds r0, #0x2b
/*0x52a6*/      cmp r0, #0xff
/*0x52a8*/      bls jump_52ae
/*0x52aa*/      movs r0, #0xff
/*0x52ac*/      bx lr
            jump_52ae:
/*0x52ae*/      uxtb r0, r0
/*0x52b0*/      bx lr
            jump_52b2:
/*0x52b2*/      movs r0, #0
/*0x52b4*/      bx lr

/*0x52b6*/  .byte 0x00
/*0x52b7*/  .byte 0x00


            .thumb_func
            call_52b8:
/*0x52b8*/      push {r0, r1, r4, r5, r6, r7, lr}
/*0x52ba*/      movs r5, #0
/*0x52bc*/      sub sp, #4
/*0x52be*/      movw r1, #0x1ff
/*0x52c2*/      cmp.w r0, #0x200
/*0x52c6*/      bhs jump_5328
/*0x52c8*/      ldrh.w r4, [sp, #8]
/*0x52cc*/      cmp.w r4, #0x400
/*0x52d0*/      bhs jump_5328
/*0x52d2*/      lsrs r2, r0, #8
/*0x52d4*/      movs r3, #0x16
/*0x52d6*/      muls r2, r3, r2
/*0x52d8*/      ldr r3, [pc, #0x74] /* data_5350 */
/*0x52da*/      uxtb r0, r0
/*0x52dc*/      ldrb r0, [r3, r0]
/*0x52de*/      cmp r0, #0xff
/*0x52e0*/      beq jump_5328
/*0x52e2*/      add.w r1, r0, r2, lsl #2
/*0x52e6*/      add.w r3, r2, r0, lsr #2
/*0x52ea*/      lsls r0, r0, #0x1e
/*0x52ec*/      ldr r7, [pc, #0x64] /* data_5354 */
/*0x52ee*/      lsrs r0, r0, #0x1d
/*0x52f0*/      movs r6, #3
/*0x52f2*/      adds r3, #0xb0
/*0x52f4*/      strh.w r1, [sp]
/*0x52f8*/      add.w r2, r7, #0xea
/*0x52fc*/      cmp r4, #3
/*0x52fe*/      beq jump_532e
/*0x5300*/      ldrb.w r4, [sp, #8]
/*0x5304*/      strb r4, [r1, r2]
/*0x5306*/      cmp r4, #0xff
/*0x5308*/      beq jump_531e
/*0x530a*/      adds r1, r7, r3
/*0x530c*/      lsls r6, r0
/*0x530e*/      ldrb r2, [r1, #0xea]!
/*0x5312*/      ldrb.w r3, [sp, #9]
/*0x5316*/      bics r2, r6
/*0x5318*/      lsls r3, r0
/*0x531a*/      orrs r2, r3
/*0x531c*/      strb r2, [r1]
            jump_531e:
/*0x531e*/      strh.w r5, [sp]
            jump_5322:
/*0x5322*/      ldrh.w r0, [sp]
/*0x5326*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}
            jump_5328:
/*0x5328*/      strh.w r1, [sp]
/*0x532c*/      b jump_5322
            jump_532e:
/*0x532e*/      ldrb r1, [r1, r2]
/*0x5330*/      strh.w r1, [sp]
/*0x5334*/      cmp r1, #0xff
/*0x5336*/      beq jump_5322
/*0x5338*/      adds r2, r7, r3
/*0x533a*/      lsls r6, r0
/*0x533c*/      ldrb.w r2, [r2, #0xea]
/*0x5340*/      rsb.w r0, r0, #8
/*0x5344*/      ands r2, r6
/*0x5346*/      lsls r2, r0
/*0x5348*/      adds r0, r2, r1
/*0x534a*/      strh.w r0, [sp]
/*0x534e*/      b jump_5322

            data_5350:
/*0x5350*/  .word 0x20000202
            data_5354:
/*0x5354*/  .word 0x2000087c


            .thumb_func
            call_5358:
/*0x5358*/      ldr r0, [pc, #0x30] /* data_538c */
/*0x535a*/      push {r4, lr}
/*0x535c*/      ldrb r0, [r0]
/*0x535e*/      cbnz r0, jump_5368
/*0x5360*/      ldr r1, [pc, #0x2c] /* data_5390 */
/*0x5362*/      movs r0, #0xf
/*0x5364*/      bl call_62e0
            jump_5368:
/*0x5368*/      ldr r0, [pc, #0x28] /* data_5394 */
/*0x536a*/      ldrb r0, [r0, #2]
/*0x536c*/      cbz r0, jump_5376
/*0x536e*/      ldr r0, [pc, #0x28] /* data_5398 */
/*0x5370*/      ldrb r0, [r0, #9]
/*0x5372*/      cmp r0, #0
/*0x5374*/      bne jump_5388
            jump_5376:
/*0x5376*/      ldr r1, [pc, #0x24] /* data_539c */
/*0x5378*/      ldr r0, [pc, #0x24] /* data_53a0 */
/*0x537a*/      movs r2, #0xe8
/*0x537c*/      ldrb r3, [r1, #0xe8]!
/*0x5380*/      strb r2, [r0, r3]
/*0x5382*/      ldrb r1, [r1, #1]
/*0x5384*/      movs r2, #0xcf
/*0x5386*/      strb r2, [r0, r1]
            jump_5388:
/*0x5388*/      pop {r4, pc}

/*0x538a*/  .byte 0x00
/*0x538b*/  .byte 0x00

            data_538c:
/*0x538c*/  .word 0x20000000
            data_5390:
/*0x5390*/  .word 0x00007a6d /* possible pointer */
            data_5394:
/*0x5394*/  .word 0x20000870
            data_5398:
/*0x5398*/  .word 0x20000790
            data_539c:
/*0x539c*/  .word 0x2000087c
            data_53a0:
/*0x53a0*/  .word 0x200001aa


            .thumb_func
            call_53a4:
/*0x53a4*/      ldr r3, [pc, #0x88] /* data_5430 */
/*0x53a6*/      push {r4, lr}
/*0x53a8*/      ldrb r0, [r3, #3]
/*0x53aa*/      ldr r1, [pc, #0x88] /* data_5434 */
/*0x53ac*/      ldrb r0, [r1, r0]
/*0x53ae*/      add.w r0, r0, r0, lsl #2
/*0x53b2*/      adds r1, r0, r3
/*0x53b4*/      ldr r0, [pc, #0x80] /* data_5438 */
/*0x53b6*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x53b8*/      str r1, [r0]
/*0x53ba*/      ldrb r2, [r1]
/*0x53bc*/      cbnz r2, jump_53d2
/*0x53be*/      ldrb r2, [r1, #1]
/*0x53c0*/      cbnz r2, jump_53d2
/*0x53c2*/      ldrb r2, [r1, #2]
/*0x53c4*/      cbnz r2, jump_53d2
/*0x53c6*/      movs r2, #0xff
/*0x53c8*/      strb r2, [r1]
/*0x53ca*/      ldr r1, [r0]
/*0x53cc*/      strb r2, [r1, #1]
/*0x53ce*/      ldr r1, [r0]
/*0x53d0*/      strb r2, [r1, #2]
            jump_53d2:
/*0x53d2*/      ldrb r2, [r3, #3]
/*0x53d4*/      mov.w r1, #0x120
/*0x53d8*/      cmp r2, #3
/*0x53da*/      bhi jump_53fa
/*0x53dc*/      movs r3, #0
/*0x53de*/      cmp r2, #1
/*0x53e0*/      beq jump_53ec
/*0x53e2*/      cmp r2, #2
/*0x53e4*/      beq jump_53f4
/*0x53e6*/      cmp r2, #3
/*0x53e8*/      bne jump_5428
/*0x53ea*/      b jump_5410
            jump_53ec:
/*0x53ec*/      ldr r0, [pc, #0x48] /* data_5438 */
/*0x53ee*/      subs r0, #8
/*0x53f0*/      str r3, [r0, #0xc]
/*0x53f2*/      b jump_5428
            jump_53f4:
/*0x53f4*/      strb r3, [r0, #4]
/*0x53f6*/      strb r3, [r0, #5]
/*0x53f8*/      b jump_5428
            jump_53fa:
/*0x53fa*/      cmp r2, #7
/*0x53fc*/      bls jump_5428
/*0x53fe*/      bic r2, r2, #1
/*0x5402*/      cmp r2, #8
/*0x5404*/      beq jump_5410
/*0x5406*/      cmp r2, #0xa
/*0x5408*/      beq jump_5418
/*0x540a*/      cmp r2, #0xc
/*0x540c*/      bne jump_5428
/*0x540e*/      b jump_541c
            jump_5410:
/*0x5410*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5412*/      bl call_35be
/*0x5416*/      b jump_5428
            jump_5418:
/*0x5418*/      movs r1, #0x67
/*0x541a*/      b jump_5410
            jump_541c:
/*0x541c*/      movs r1, #0x24
/*0x541e*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5420*/      bl call_35be
/*0x5424*/      bl call_6cec
            jump_5428:
/*0x5428*/      ldr r1, [pc, #0x10] /* data_543c */
/*0x542a*/      movs r0, #1
/*0x542c*/      strb r0, [r1]
/*0x542e*/      pop {r4, pc}

            data_5430:
/*0x5430*/  .word 0x2000087c
            data_5434:
/*0x5434*/  .word 0x00007aad /* possible pointer */
            data_5438:
/*0x5438*/  .word 0x2000005c
            data_543c:
/*0x543c*/  .word 0x20000790


            .thumb_func
            call_5440:
/*0x5440*/      ldr r0, [pc, #0x20] /* data_5464 */
/*0x5442*/      ldrb r0, [r0, #3]
/*0x5444*/      cmp r0, #8
/*0x5446*/      beq jump_545e
/*0x5448*/      bgt jump_5452
/*0x544a*/      cbz r0, jump_545e
/*0x544c*/      cmp r0, #1
/*0x544e*/      bne jump_545a
/*0x5450*/      b jump_545e
            jump_5452:
/*0x5452*/      cmp r0, #0xa
/*0x5454*/      beq jump_545e
/*0x5456*/      cmp r0, #0xc
/*0x5458*/      beq jump_545e
            jump_545a:
/*0x545a*/      movs r0, #0
/*0x545c*/      bx lr
            jump_545e:
/*0x545e*/      movs r0, #1
/*0x5460*/      bx lr

/*0x5462*/  .byte 0x00
/*0x5463*/  .byte 0x00

            data_5464:
/*0x5464*/  .word 0x2000087c


            .thumb_func
            call_5468:
/*0x5468*/      push {r4, r5, r6, lr}
/*0x546a*/      ldr r5, [pc, #0x120] /* data_558c */
/*0x546c*/      mov r4, r0
/*0x546e*/      ubfx r2, r0, #0x10, #8
/*0x5472*/      ldrb r0, [r5, #3]
/*0x5474*/      ldr r3, [pc, #0x118] /* data_5590 */
/*0x5476*/      adds r1, r0, #1
/*0x5478*/      uxtb r1, r1
/*0x547a*/      cmp r2, #0x10
/*0x547c*/      beq jump_5516
/*0x547e*/      bgt jump_5498
/*0x5480*/      cmp r2, #8
/*0x5482*/      beq jump_54c8
/*0x5484*/      bgt jump_548e
/*0x5486*/      cbz r2, jump_54c8
/*0x5488*/      cmp r2, #1
/*0x548a*/      bne jump_550a
/*0x548c*/      b jump_54c8
            jump_548e:
/*0x548e*/      cmp r2, #9
/*0x5490*/      beq jump_54c8
/*0x5492*/      cmp r2, #0xe
/*0x5494*/      bne jump_550a
/*0x5496*/      b jump_54a8
            jump_5498:
/*0x5498*/      cmp r2, #0x11
/*0x549a*/      beq jump_550c
/*0x549c*/      cmp r2, #0x16
/*0x549e*/      beq jump_54a8
/*0x54a0*/      cmp r2, #0x26
/*0x54a2*/      beq jump_54a8
/*0x54a4*/      cmp r2, #0x27
/*0x54a6*/      bne jump_550a
            jump_54a8:
/*0x54a8*/      ldr r1, [pc, #0xe8] /* data_5594 */
/*0x54aa*/      ldrb r0, [r1, r0]
/*0x54ac*/      cmp r0, #0xff
/*0x54ae*/      beq jump_557c
/*0x54b0*/      ldr r0, [pc, #0xdc] /* data_5590 */
/*0x54b2*/      movs r3, #6
/*0x54b4*/      cmp r2, #0xe
/*0x54b6*/      ldr r0, [r0]
/*0x54b8*/      beq jump_5542
/*0x54ba*/      cmp r2, #0x16
/*0x54bc*/      beq jump_5532
/*0x54be*/      cmp r2, #0x26
/*0x54c0*/      beq jump_5556
/*0x54c2*/      cmp r2, #0x27
/*0x54c4*/      bne jump_557c
/*0x54c6*/      b jump_556e
            jump_54c8:
/*0x54c8*/      bl call_5440
/*0x54cc*/      cmp r0, #0
/*0x54ce*/      beq jump_550a
/*0x54d0*/      cbz r2, jump_5504
/*0x54d2*/      cmp r2, #1
/*0x54d4*/      beq jump_54de
/*0x54d6*/      cmp r2, #8
/*0x54d8*/      beq jump_54de
/*0x54da*/      cmp r2, #9
/*0x54dc*/      bne jump_550a
            jump_54de:
/*0x54de*/      movs r1, #0
/*0x54e0*/      cmp r2, #1
/*0x54e2*/      beq jump_54f4
/*0x54e4*/      cmp r2, #8
/*0x54e6*/      beq jump_54ee
/*0x54e8*/      cmp r2, #9
/*0x54ea*/      beq jump_54f2
/*0x54ec*/      b jump_54f4
            jump_54ee:
/*0x54ee*/      movs r1, #1
/*0x54f0*/      b jump_54f4
            jump_54f2:
/*0x54f2*/      movs r1, #2
            jump_54f4:
/*0x54f4*/      ldr r0, [r3]
/*0x54f6*/      movs r2, #1
/*0x54f8*/      adds r4, r0, r1
/*0x54fa*/      ldrb r0, [r4]
/*0x54fc*/      bl call_52a0
/*0x5500*/      strb r0, [r4]
/*0x5502*/      b jump_557c
            jump_5504:
/*0x5504*/      ldr r1, [pc, #0x90] /* data_5598 */
/*0x5506*/      movs r0, #1
/*0x5508*/      strb r0, [r1, #1]
            jump_550a:
/*0x550a*/      pop {r4, r5, r6, pc}
            jump_550c:
/*0x550c*/      strb r1, [r5, #3]
/*0x550e*/      cmp r1, #3
/*0x5510*/      bls jump_5522
/*0x5512*/      movs r0, #0
/*0x5514*/      b jump_5520
            jump_5516:
/*0x5516*/      strb r1, [r5, #3]
/*0x5518*/      .short 0x1fc9 /* subs r1, r1, #7 */ 
/*0x551a*/      cmp r1, #7
/*0x551c*/      blo jump_5522
/*0x551e*/      movs r0, #7
            jump_5520:
/*0x5520*/      strb r0, [r5, #3]
            jump_5522:
/*0x5522*/      bl call_53a4
/*0x5526*/      bl call_5680
/*0x552a*/      mov r0, r4
/*0x552c*/      bl call_55a0
/*0x5530*/      b jump_557c
            jump_5532:
/*0x5532*/      ldrb r1, [r0, #3]
/*0x5534*/      cmp r1, #8
/*0x5536*/      bhs jump_557c
/*0x5538*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x553a*/      b jump_554a
            jump_553c:
/*0x553c*/      bl call_6cec
/*0x5540*/      b jump_557c
            jump_5542:
/*0x5542*/      ldrb r1, [r0, #3]
/*0x5544*/      cmp r1, #1
/*0x5546*/      bls jump_557c
/*0x5548*/      .short 0x1e49 /* subs r1, r1, #1 */ 
            jump_554a:
/*0x554a*/      strb r1, [r0, #3]
/*0x554c*/      ldrb r0, [r5, #3]
/*0x554e*/      cmp.w r3, r0, lsr #1
/*0x5552*/      beq jump_553c
/*0x5554*/      b jump_557c
            jump_5556:
/*0x5556*/      ldrb r1, [r0, #4]
/*0x5558*/      and r2, r1, #0xf
/*0x555c*/      cmp r2, #5
/*0x555e*/      bhs jump_557c
/*0x5560*/      mov.w r2, #0x10000000
/*0x5564*/      add.w r1, r2, r1, ror #4
/*0x5568*/      ror.w r1, r1, #0x1c
/*0x556c*/      b jump_557a
            jump_556e:
/*0x556e*/      ldrb r1, [r0, #4]
/*0x5570*/      lsls r2, r1, #0x1c
/*0x5572*/      beq jump_557c
/*0x5574*/      subs r2, r1, #1
/*0x5576*/      bfi r1, r2, #0, #4
            jump_557a:
/*0x557a*/      strb r1, [r0, #4]
            jump_557c:
/*0x557c*/      bl call_5690
/*0x5580*/      ldr r0, [pc, #0x18] /* data_559c */
/*0x5582*/      ldrb r0, [r0, #2]
/*0x5584*/      pop.w {r4, r5, r6, lr}
/*0x5588*/      b.w call_43b8

            data_558c:
/*0x558c*/  .word 0x2000087c
            data_5590:
/*0x5590*/  .word 0x2000005c
            data_5594:
/*0x5594*/  .word 0x00007aad /* possible pointer */
            data_5598:
/*0x5598*/  .word 0x20000790
            data_559c:
/*0x559c*/  .word 0x20000870


            .thumb_func
            call_55a0:
/*0x55a0*/      push {r4, r5, r6, lr}
/*0x55a2*/      lsrs r1, r0, #0x18
/*0x55a4*/      lsls r1, r1, #0x1e
/*0x55a6*/      bpl jump_5600
/*0x55a8*/      ldr r4, [pc, #0xc4] /* data_5670 */
/*0x55aa*/      ldr r5, [pc, #0xc8] /* data_5674 */
/*0x55ac*/      movs r6, #1
/*0x55ae*/      ldrb r1, [r4, #0xa]
/*0x55b0*/      cbz r1, jump_55b8
/*0x55b2*/      uxtb r2, r0
/*0x55b4*/      cmp r2, #0xcf
/*0x55b6*/      beq jump_5602
            jump_55b8:
/*0x55b8*/      ldr r1, [pc, #0xbc] /* data_5678 */
/*0x55ba*/      ldrb r1, [r1, #3]
/*0x55bc*/      cmp r1, #7
/*0x55be*/      bls jump_5600
/*0x55c0*/      and r2, r1, #1
/*0x55c4*/      bic r3, r1, #1
/*0x55c8*/      ldr r1, [pc, #0xa8] /* data_5674 */
/*0x55ca*/      ubfx r0, r0, #0x10, #8
/*0x55ce*/      cmp r3, #8
/*0x55d0*/      ldr r1, [r1]
/*0x55d2*/      beq jump_5634
/*0x55d4*/      cmp r3, #0xa
/*0x55d6*/      beq jump_5648
/*0x55d8*/      cmp r3, #0xc
/*0x55da*/      bne jump_5600
/*0x55dc*/      ldr r3, [pc, #0x9c] /* data_567c */
/*0x55de*/      ldrb r4, [r3, r0]
/*0x55e0*/      cmp r4, #0xff
/*0x55e2*/      beq jump_5600
/*0x55e4*/      and r0, r4, #7
/*0x55e8*/      add.w r0, r0, r0, lsl #2
/*0x55ec*/      add r5, r0
/*0x55ee*/      adds r5, #0xe
/*0x55f0*/      cbz r2, jump_55f4
/*0x55f2*/      movs r1, #0
            jump_55f4:
/*0x55f4*/      mov r0, r5
/*0x55f6*/      bl call_6ef0
/*0x55fa*/      lsrs r0, r4, #3
/*0x55fc*/      strb r0, [r5, #3]
/*0x55fe*/      strb r6, [r5, #4]
            jump_5600:
/*0x5600*/      pop {r4, r5, r6, pc}
            jump_5602:
/*0x5602*/      cmp r1, #8
/*0x5604*/      bhs switch_5630
/*0x5606*/      tbb [pc, r1]

/*0x560a*/  .byte 0x13 /* case switch_5630 */
/*0x560b*/  .byte 0x04 /* case switch_5612 */
/*0x560c*/  .byte 0x06 /* case switch_5616 */
/*0x560d*/  .byte 0x09 /* case switch_561c */
/*0x560e*/  .byte 0x13 /* case switch_5630 */
/*0x560f*/  .byte 0x0b /* case switch_5620 */
/*0x5610*/  .byte 0x13 /* case switch_5630 */
/*0x5611*/  .byte 0x0d /* case switch_5624 */

            switch_5612:
/*0x5612*/      movs r0, #2
/*0x5614*/      b jump_5618
            switch_5616:
/*0x5616*/      movs r0, #3
            jump_5618:
/*0x5618*/      strb r0, [r4, #0xa]
/*0x561a*/      b switch_5630
            switch_561c:
/*0x561c*/      movs r0, #5
/*0x561e*/      b jump_5618
            switch_5620:
/*0x5620*/      movs r0, #7
/*0x5622*/      b jump_5618
            switch_5624:
/*0x5624*/      movs r0, #6
/*0x5626*/      strb r0, [r4, #0xa]
/*0x5628*/      movs r1, #0x80
/*0x562a*/      adds r0, r5, #7
/*0x562c*/      bl call_35be
            switch_5630:
/*0x5630*/      strb r6, [r4]
            jump_5632:
/*0x5632*/      pop {r4, r5, r6, pc}
            jump_5634:
/*0x5634*/      cbz r2, jump_5638
/*0x5636*/      movs r1, #0
            jump_5638:
/*0x5638*/      add.w r0, r0, r0, lsl #1
/*0x563c*/      add r0, r5
/*0x563e*/      pop.w {r4, r5, r6, lr}
/*0x5642*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x5644*/      b.w call_6ef0
            jump_5648:
/*0x5648*/      ldr r3, [pc, #0x30] /* data_567c */
/*0x564a*/      subs r3, #0x60
/*0x564c*/      ldrb r0, [r3, r0]
/*0x564e*/      cmp r0, #0xff
/*0x5650*/      beq jump_5632
/*0x5652*/      cbz r2, jump_5656
/*0x5654*/      movs r1, #0
            jump_5656:
/*0x5656*/      add.w r0, r0, r0, lsl #1
/*0x565a*/      add.w r4, r5, r0, lsl #1
/*0x565e*/      adds r0, r4, #4
/*0x5660*/      bl call_6ef0
/*0x5664*/      ldrh r0, [r4, #4]
/*0x5666*/      strh.w r0, [r4, #7]
/*0x566a*/      ldrb r0, [r4, #6]
/*0x566c*/      strb r0, [r4, #9]
/*0x566e*/      pop {r4, r5, r6, pc}

            data_5670:
/*0x5670*/  .word 0x20000790
            data_5674:
/*0x5674*/  .word 0x2000005c
            data_5678:
/*0x5678*/  .word 0x2000087c
            data_567c:
/*0x567c*/  .word 0x00007b45 /* possible pointer */


            .thumb_func
            call_5680:
/*0x5680*/      mov.w r1, #0x120
/*0x5684*/      ldr r0, [pc, #4] /* data_568c */
/*0x5686*/      b.w call_35be

/*0x568a*/  .byte 0x00
/*0x568b*/  .byte 0x00

            data_568c:
/*0x568c*/  .word 0x20000326


            .thumb_func
            call_5690:
/*0x5690*/      push {r4, lr}
/*0x5692*/      bl call_465c
/*0x5696*/      cmp r0, #6
/*0x5698*/      bhs switch_56c0
/*0x569a*/      tbb [pc, r0]

/*0x569e*/  .byte 0x03 /* case switch_56a4 */
/*0x569f*/  .byte 0x06 /* case switch_56aa */
/*0x56a0*/  .byte 0x09 /* case switch_56b0 */
/*0x56a1*/  .byte 0x0c /* case switch_56b6 */
/*0x56a2*/  .byte 0x11 /* case switch_56c0 */
/*0x56a3*/  .byte 0x0f /* case switch_56bc */

            switch_56a4:
/*0x56a4*/      bl call_4000
/*0x56a8*/      b switch_56c0
            switch_56aa:
/*0x56aa*/      bl call_3d90
/*0x56ae*/      b switch_56c0
            switch_56b0:
/*0x56b0*/      bl call_3d14
/*0x56b4*/      b switch_56c0
            switch_56b6:
/*0x56b6*/      bl call_3f9c
/*0x56ba*/      b switch_56c0
            switch_56bc:
/*0x56bc*/      bl call_3eb4
            switch_56c0:
/*0x56c0*/      pop.w {r4, lr}
/*0x56c4*/      nop.w 
            jump_56c8:
/*0x56c8*/      ldr r0, [pc, #0x38] /* data_5704 */
/*0x56ca*/      push {r4, lr}
/*0x56cc*/      ldrb r0, [r0, #0xa]
/*0x56ce*/      cbnz r0, jump_56fa
/*0x56d0*/      ldr r0, [pc, #0x34] /* data_5708 */
/*0x56d2*/      ldrb r0, [r0]
/*0x56d4*/      ldr r1, [pc, #0x30] /* data_5708 */
/*0x56d6*/      lsls r0, r0, #0x1e
/*0x56d8*/      asrs r0, r0, #8
/*0x56da*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x56dc*/      lsrs r0, r0, #0x18
/*0x56de*/      strb r0, [r1]
/*0x56e0*/      ldr r0, [pc, #0x28] /* data_570c */
/*0x56e2*/      ldrb r0, [r0]
/*0x56e4*/      lsls r0, r0, #0x1f
/*0x56e6*/      beq jump_56ea
/*0x56e8*/      movs r0, #0xff
            jump_56ea:
/*0x56ea*/      strb r0, [r1, #1]
/*0x56ec*/      movs r0, #0
/*0x56ee*/      strb r0, [r1, #2]
/*0x56f0*/      ldr r1, [pc, #0x14] /* data_5708 */
/*0x56f2*/      movs r0, #0x3a
/*0x56f4*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x56f6*/      bl call_44cc
            jump_56fa:
/*0x56fa*/      ldr r1, [pc, #0x14] /* data_5710 */
/*0x56fc*/      movs r0, #1
/*0x56fe*/      strb r0, [r1]
/*0x5700*/      pop {r4, pc}

/*0x5702*/  .byte 0x00
/*0x5703*/  .byte 0x00

            data_5704:
/*0x5704*/  .word 0x20000790
            data_5708:
/*0x5708*/  .word 0x20000054
            data_570c:
/*0x570c*/  .word 0x20000000
            data_5710:
/*0x5710*/  .word 0x20000324


            .thumb_func
            call_5714:
/*0x5714*/      movs r1, #0x60
/*0x5716*/      ldr r3, [pc, #0x28] /* data_5740 */
/*0x5718*/      b jump_5726
            jump_571a:
/*0x571a*/      add.w r2, r3, r1, lsl #1
/*0x571e*/      ldrb.w r2, [r2, #0x28]
/*0x5722*/      cmp r2, r0
/*0x5724*/      beq jump_5736
            jump_5726:
/*0x5726*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x5728*/      uxtb r1, r1
/*0x572a*/      bhs jump_571a
/*0x572c*/      add r0, r3
/*0x572e*/      ldrb.w r0, [r0, #0xea]
/*0x5732*/      cmp r0, #0xff
/*0x5734*/      beq jump_573a
            jump_5736:
/*0x5736*/      movs r0, #1
/*0x5738*/      bx lr
            jump_573a:
/*0x573a*/      movs r0, #0
/*0x573c*/      bx lr

/*0x573e*/  .byte 0x00
/*0x573f*/  .byte 0x00

            data_5740:
/*0x5740*/  .word 0x2000087c


            .thumb_func
            call_5744:
/*0x5744*/      push {r4, lr}
/*0x5746*/      ldr r4, [pc, #0x70] /* data_57b8 */
/*0x5748*/      cbz r0, jump_5780
/*0x574a*/      movs r1, #0
/*0x574c*/      mov r0, r4
/*0x574e*/      bl call_374a
/*0x5752*/      movs r1, #0
/*0x5754*/      mov r0, r4
/*0x5756*/      bl call_3736
/*0x575a*/      mov r0, r4
/*0x575c*/      bl call_3728
/*0x5760*/      movs r0, #0x29
/*0x5762*/      bl call_58a0
/*0x5766*/      bl call_3bf6
/*0x576a*/      bl call_5e34
/*0x576e*/      bl call_4070
/*0x5772*/      movs r0, #1
/*0x5774*/      bl call_62a0
/*0x5778*/      pop.w {r4, lr}
/*0x577c*/      b.w jump_641c
            jump_5780:
/*0x5780*/      bl call_4690
/*0x5784*/      bl call_4098
/*0x5788*/      movs r0, #0
/*0x578a*/      bl call_62a0
/*0x578e*/      movs r1, #0
/*0x5790*/      mov r0, r4
/*0x5792*/      bl call_3762
/*0x5796*/      mov r0, r4
/*0x5798*/      bl call_3728
/*0x579c*/      movs r1, #1
/*0x579e*/      mov r0, r4
/*0x57a0*/      bl call_3736
/*0x57a4*/      movs r1, #1
/*0x57a6*/      mov r0, r4
/*0x57a8*/      bl call_374a
/*0x57ac*/      ldr r1, [pc, #0xc] /* data_57bc */
/*0x57ae*/      mov.w r0, #0x200
/*0x57b2*/      str.w r0, [r1, #0x100]
/*0x57b6*/      pop {r4, pc}

            data_57b8:
/*0x57b8*/  .word 0x40076000
            data_57bc:
/*0x57bc*/  .word 0xe000e004


            .thumb_func
            call_57c0:
/*0x57c0*/      push {r4, lr}
/*0x57c2*/      mov r4, r0
/*0x57c4*/      cmp r0, #2
/*0x57c6*/      beq jump_57d0
/*0x57c8*/      movs r1, #0xb
/*0x57ca*/      ldr r0, [pc, #0x24] /* data_57f0 */
/*0x57cc*/      bl call_35be
            jump_57d0:
/*0x57d0*/      cbz r4, jump_57ea
/*0x57d2*/      movs r0, #2
            jump_57d4:
/*0x57d4*/      bl call_4b04
/*0x57d8*/      ldr r1, [pc, #0x14] /* data_57f0 */
/*0x57da*/      movs r0, #0
/*0x57dc*/      strb r0, [r1, #3]
/*0x57de*/      bl call_53a4
/*0x57e2*/      pop.w {r4, lr}
/*0x57e6*/      b.w call_5ca8
            jump_57ea:
/*0x57ea*/      movs r0, #1
/*0x57ec*/      b jump_57d4

/*0x57ee*/  .byte 0x00
/*0x57ef*/  .byte 0x00

            data_57f0:
/*0x57f0*/  .word 0x20000790


            .thumb_func
            call_57f4:
/*0x57f4*/      push {r4, lr}
/*0x57f6*/      movs r0, #0
/*0x57f8*/      mov.w r2, #0x10000
/*0x57fc*/      movs r3, #1
/*0x57fe*/      mov r1, r0
/*0x5800*/      bl call_3b30
/*0x5804*/      pop.w {r4, lr}
/*0x5808*/      movw r1, #0x8c9f
/*0x580c*/      ldr r0, [pc, #4] /* data_5814 */
/*0x580e*/      b.w call_375e

/*0x5812*/  .byte 0x00
/*0x5813*/  .byte 0x00

            data_5814:
/*0x5814*/  .word 0x40076000


            .thumb_func
            call_5818:
/*0x5818*/      push {r4, lr}
/*0x581a*/      mov.w r1, #0x3400
/*0x581e*/      movs r0, #0
/*0x5820*/      bl call_5908
/*0x5824*/      ldr r1, [pc, #0x70] /* data_5898 */
/*0x5826*/      ldr r0, [r1]
/*0x5828*/      movw r2, #0xf8ff
/*0x582c*/      ands r0, r2
/*0x582e*/      ldr r2, [pc, #0x6c] /* data_589c */
/*0x5830*/      orr r0, r0, #0x300
/*0x5834*/      orrs r0, r2
/*0x5836*/      str r0, [r1]
/*0x5838*/      movs r2, #0
/*0x583a*/      mov r1, r2
/*0x583c*/      movs r0, #3
/*0x583e*/      bl call_58b6
/*0x5842*/      mov r1, r0
/*0x5844*/      movs r0, #0x2b
/*0x5846*/      bl call_58e8
/*0x584a*/      movs r2, #0
/*0x584c*/      mov r1, r2
/*0x584e*/      movs r0, #3
/*0x5850*/      bl call_58b6
/*0x5854*/      mov r1, r0
/*0x5856*/      movs r0, #0x2c
/*0x5858*/      bl call_58e8
/*0x585c*/      movs r2, #0
/*0x585e*/      movs r1, #1
/*0x5860*/      movs r0, #3
/*0x5862*/      bl call_58b6
/*0x5866*/      mov r1, r0
/*0x5868*/      movs r0, #0x2a
/*0x586a*/      bl call_58e8
/*0x586e*/      movs r2, #0
/*0x5870*/      movs r1, #2
/*0x5872*/      movs r0, #3
/*0x5874*/      bl call_58b6
/*0x5878*/      mov r1, r0
/*0x587a*/      movs r0, #0x29
/*0x587c*/      bl call_58e8
/*0x5880*/      movs r2, #0
/*0x5882*/      movs r1, #2
/*0x5884*/      movs r0, #3
/*0x5886*/      bl call_58b6
/*0x588a*/      mov r1, r0
/*0x588c*/      pop.w {r4, lr}
/*0x5890*/      movs r0, #0x35
/*0x5892*/      b.w call_58e8

/*0x5896*/  .byte 0x00
/*0x5897*/  .byte 0x00

            data_5898:
/*0x5898*/  .word 0xe000ed0c
            data_589c:
/*0x589c*/  .word 0x05fa0000


            .thumb_func
            call_58a0:
/*0x58a0*/      and r2, r0, #0x1f
/*0x58a4*/      movs r1, #1
/*0x58a6*/      lsls r1, r2
/*0x58a8*/      lsrs r0, r0, #5
/*0x58aa*/      lsls r0, r0, #2
/*0x58ac*/      add.w r0, r0, #-0x1fff2000
/*0x58b0*/      str.w r1, [r0, #0x180]
/*0x58b4*/      bx lr

            .thumb_func
            call_58b6:
/*0x58b6*/      push {r4, r5, lr}
/*0x58b8*/      and r3, r0, #7
/*0x58bc*/      rsb.w r4, r3, #7
/*0x58c0*/      cmp r4, #4
/*0x58c2*/      bls jump_58c6
/*0x58c4*/      movs r4, #4
            jump_58c6:
/*0x58c6*/      adds r0, r3, #4
/*0x58c8*/      cmp r0, #7
/*0x58ca*/      bhs jump_58d0
/*0x58cc*/      movs r3, #0
/*0x58ce*/      b jump_58d2
            jump_58d0:
/*0x58d0*/      .short 0x1edb /* subs r3, r3, #3 */ 
            jump_58d2:
/*0x58d2*/      movs r5, #1
/*0x58d4*/      lsl.w r0, r5, r4
/*0x58d8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x58da*/      ands r0, r1
/*0x58dc*/      lsls r0, r3
/*0x58de*/      lsls r5, r3
/*0x58e0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x58e2*/      ands r5, r2
/*0x58e4*/      orrs r0, r5
/*0x58e6*/      pop {r4, r5, pc}

            .thumb_func
            call_58e8:
/*0x58e8*/      lsls r1, r1, #0x1c
/*0x58ea*/      lsrs r1, r1, #0x18
/*0x58ec*/      cmp r0, #0
/*0x58ee*/      bge jump_58fe
/*0x58f0*/      and r0, r0, #0xf
/*0x58f4*/      add.w r0, r0, #-0x1fff2000
/*0x58f8*/      strb.w r1, [r0, #0xd14]
/*0x58fc*/      bx lr
            jump_58fe:
/*0x58fe*/      add.w r0, r0, #-0x1fff2000
/*0x5902*/      strb.w r1, [r0, #0x400]
/*0x5906*/      bx lr

            .thumb_func
            call_5908:
/*0x5908*/      ldr r2, [pc, #8] /* data_5914 */
/*0x590a*/      ands r1, r2
/*0x590c*/      orrs r1, r0
/*0x590e*/      ldr r0, [pc, #8] /* data_5918 */
/*0x5910*/      str r1, [r0]
/*0x5912*/      bx lr

            data_5914:
/*0x5914*/  .word 0x1fffff80
            data_5918:
/*0x5918*/  .word 0xe000ed08


            .thumb_func
            call_591c:
/*0x591c*/      push {r4, lr}
/*0x591e*/      mov r4, r0
/*0x5920*/      ldrb r2, [r0, #6]
/*0x5922*/      ldr r1, [r0]
/*0x5924*/      ldr r0, [pc, #0x10] /* data_5938 */
/*0x5926*/      ldr r0, [r0]
/*0x5928*/      bl call_358c
/*0x592c*/      ldr r1, [r4, #4]
/*0x592e*/      pop.w {r4, lr}
/*0x5932*/      movs r0, #0xff
/*0x5934*/      b.w call_5c3c

            data_5938:
/*0x5938*/  .word 0x2000000c


            .thumb_func
            call_593c:
/*0x593c*/      ldr r0, [pc, #0x10] /* data_5950 */
/*0x593e*/      ldr r2, [pc, #0x14] /* data_5954 */
/*0x5940*/      ldrh r0, [r0, #4]
/*0x5942*/      and r1, r0, #0xf00
/*0x5946*/      uxtb r0, r0
/*0x5948*/      ldrb r0, [r2, r0]
/*0x594a*/      add r0, r1
/*0x594c*/      bx lr

/*0x594e*/  .byte 0x00
/*0x594f*/  .byte 0x00

            data_5950:
/*0x5950*/  .word 0x20001b7c
            data_5954:
/*0x5954*/  .word 0x200001aa


            .thumb_func
            call_5958:
/*0x5958*/      push {r4, r5, r6, lr}
/*0x595a*/      ldr r4, [pc, #0x84] /* data_59e0 */
/*0x595c*/      sub.w r5, r4, #8
/*0x5960*/      ldrb r0, [r4, #8]
/*0x5962*/      cmp r0, #1
/*0x5964*/      beq jump_5970
/*0x5966*/      cmp r0, #2
/*0x5968*/      bne jump_59cc
/*0x596a*/      ldrh r0, [r5]
/*0x596c*/      cbz r0, jump_59ce
/*0x596e*/      b jump_59d8
            jump_5970:
/*0x5970*/      ldr r0, [pc, #0x70] /* data_59e4 */
/*0x5972*/      mov.w r6, #0
/*0x5976*/      ldrb r0, [r0, #3]
/*0x5978*/      lsls r0, r0, #0x1e
/*0x597a*/      bmi jump_5992
/*0x597c*/      ldrb r0, [r4, #6]
/*0x597e*/      cmp r0, #1
/*0x5980*/      bne jump_5992
/*0x5982*/      bl call_4acc
/*0x5986*/      cmp r0, #1
/*0x5988*/      bne jump_5992
/*0x598a*/      movs r0, #2
/*0x598c*/      strb r0, [r4, #6]
/*0x598e*/      ldr r0, [pc, #0x58] /* data_59e8 */
/*0x5990*/      strh r6, [r0]
            jump_5992:
/*0x5992*/      ldrb r0, [r4, #6]
/*0x5994*/      cmp r0, #3
/*0x5996*/      beq jump_59b4
/*0x5998*/      cmp r0, #6
/*0x599a*/      beq jump_59a4
/*0x599c*/      cmp r0, #7
/*0x599e*/      beq jump_59a4
/*0x59a0*/      cmp r0, #8
/*0x59a2*/      bne jump_59cc
            jump_59a4:
/*0x59a4*/      bl call_4acc
/*0x59a8*/      cmp r0, #1
/*0x59aa*/      bne jump_59cc
/*0x59ac*/      pop.w {r4, r5, r6, lr}
/*0x59b0*/      b.w jump_5b5c
            jump_59b4:
/*0x59b4*/      bl call_4acc
/*0x59b8*/      cmp r0, #1
/*0x59ba*/      bne jump_59cc
/*0x59bc*/      ldrb r0, [r4, #7]
/*0x59be*/      movs r1, #0
/*0x59c0*/      bl call_4198
/*0x59c4*/      strh r6, [r5]
/*0x59c6*/      movs r0, #4
/*0x59c8*/      str r6, [r4]
/*0x59ca*/      strb r0, [r4, #6]
            jump_59cc:
/*0x59cc*/      pop {r4, r5, r6, pc}
            jump_59ce:
/*0x59ce*/      b jump_59d0
            jump_59d0:
/*0x59d0*/      ldrb r0, [r4, #7]
/*0x59d2*/      movs r1, #0
/*0x59d4*/      bl call_4198
            jump_59d8:
/*0x59d8*/      pop.w {r4, r5, r6, lr}
/*0x59dc*/      b.w jump_7084

            data_59e0:
/*0x59e0*/  .word 0x20001b7c
            data_59e4:
/*0x59e4*/  .word 0x2000079c
            data_59e8:
/*0x59e8*/  .word 0x20000192

            jump_59ec:
/*0x59ec*/      push {r4, r5, r6, lr}
/*0x59ee*/      ldr r5, [pc, #0x64] /* data_5a54 */
/*0x59f0*/      ldrh r0, [r5]
/*0x59f2*/      cmp r0, #0xff
/*0x59f4*/      bls jump_5a00
/*0x59f6*/      add.w r1, r5, #8
/*0x59fa*/      movs r0, #1
/*0x59fc*/      strb r0, [r1, #6]
/*0x59fe*/      b jump_5a0e
            jump_5a00:
/*0x5a00*/      ldr r6, [pc, #0x54] /* data_5a58 */
/*0x5a02*/      ldrb r1, [r6, #1]
/*0x5a04*/      lsls r1, r1, #0x1f
/*0x5a06*/      beq jump_5a12
/*0x5a08*/      ldrb r1, [r6]
/*0x5a0a*/      cmp r1, #0xc0
/*0x5a0c*/      bhs jump_5a12
            jump_5a0e:
/*0x5a0e*/      movs r0, #1
/*0x5a10*/      pop {r4, r5, r6, pc}
            jump_5a12:
/*0x5a12*/      ldr r1, [pc, #0x48] /* data_5a5c */
/*0x5a14*/      ldr r1, [r1]
/*0x5a16*/      add.w r4, r1, r0, lsl #2
/*0x5a1a*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5a1c*/      strh r0, [r5]
/*0x5a1e*/      ldr r0, [r6]
/*0x5a20*/      bl call_4a3a
/*0x5a24*/      strh r0, [r4]
/*0x5a26*/      ldrb r1, [r6, #3]
/*0x5a28*/      lsls r1, r1, #0x1e
/*0x5a2a*/      bpl jump_5a32
/*0x5a2c*/      add.w r0, r0, #0x3c00
/*0x5a30*/      b jump_5a36
            jump_5a32:
/*0x5a32*/      add.w r0, r0, #0x5c00
            jump_5a36:
/*0x5a36*/      strh r0, [r4]
/*0x5a38*/      ldrh r0, [r5]
/*0x5a3a*/      cmp r0, #1
/*0x5a3c*/      bls jump_5a46
/*0x5a3e*/      bl call_6f20
/*0x5a42*/      strh r0, [r4, #-0x2]
            jump_5a46:
/*0x5a46*/      ldr r1, [pc, #0xc] /* data_5a54 */
/*0x5a48*/      mov.w r0, #-1
/*0x5a4c*/      str r0, [r1, #4]
/*0x5a4e*/      movs r0, #0
/*0x5a50*/      pop {r4, r5, r6, pc}

/*0x5a52*/  .byte 0x00
/*0x5a53*/  .byte 0x00

            data_5a54:
/*0x5a54*/  .word 0x20001b74
            data_5a58:
/*0x5a58*/  .word 0x2000079c
            data_5a5c:
/*0x5a5c*/  .word 0x2000000c


            .thumb_func
            call_5a60:
/*0x5a60*/      ldr r0, [pc, #0x2c] /* data_5a90 */
/*0x5a62*/      push {r4, lr}
/*0x5a64*/      ldrb r0, [r0, #8]
/*0x5a66*/      cmp r0, #1
/*0x5a68*/      beq jump_5a8a
/*0x5a6a*/      ldr r0, [pc, #0x28] /* data_5a94 */
/*0x5a6c*/      ldr r0, [r0]
/*0x5a6e*/      bl call_4a3a
/*0x5a72*/      movs r1, #3
/*0x5a74*/      bl call_52b8
/*0x5a78*/      uxtb r1, r0
/*0x5a7a*/      cmp r1, #0xff
/*0x5a7c*/      beq jump_5a8a
/*0x5a7e*/      uxth r0, r0
/*0x5a80*/      ldr r1, [pc, #0x10] /* data_5a94 */
/*0x5a82*/      bl call_4a30
/*0x5a86*/      movs r0, #1
/*0x5a88*/      pop {r4, pc}
            jump_5a8a:
/*0x5a8a*/      movs r0, #0
/*0x5a8c*/      pop {r4, pc}

/*0x5a8e*/  .byte 0x00
/*0x5a8f*/  .byte 0x00

            data_5a90:
/*0x5a90*/  .word 0x20001b7c
            data_5a94:
/*0x5a94*/  .word 0x2000079c


            .thumb_func
            call_5a98:
/*0x5a98*/      push {r4, r5, r6, lr}
/*0x5a9a*/      ldr r5, [pc, #0xb4] /* data_5b50 */
/*0x5a9c*/      ldr r4, [pc, #0xb4] /* data_5b54 */
/*0x5a9e*/      ldrb r0, [r5, #8]
/*0x5aa0*/      cbz r0, jump_5aac
/*0x5aa2*/      cmp r0, #1
/*0x5aa4*/      beq jump_5af2
/*0x5aa6*/      cmp r0, #2
/*0x5aa8*/      bne jump_5b16
/*0x5aaa*/      b jump_5ac0
            jump_5aac:
/*0x5aac*/      bl call_6fac
/*0x5ab0*/      cmp r0, #0x60
/*0x5ab2*/      bhs jump_5b16
/*0x5ab4*/      ldrb r1, [r4, #3]
/*0x5ab6*/      lsls r1, r1, #0x1e
/*0x5ab8*/      bpl jump_5b46
/*0x5aba*/      bl call_5c3c
/*0x5abe*/      b jump_5b46
            jump_5ac0:
/*0x5ac0*/      ldrb r0, [r4, #3]
/*0x5ac2*/      ldr r1, [pc, #0x90] /* data_5b54 */
/*0x5ac4*/      lsls r3, r0, #0x1e
/*0x5ac6*/      ldrb r0, [r1, #2]
/*0x5ac8*/      ldrb r1, [r1, #1]
/*0x5aca*/      and r1, r1, #1
/*0x5ace*/      add.w r2, r0, r1, lsl #8
/*0x5ad2*/      ldr r0, [pc, #0x7c] /* data_5b50 */
/*0x5ad4*/      ldrh r1, [r0, #4]
/*0x5ad6*/      ldrb r0, [r0, #9]
/*0x5ad8*/      bpl jump_5ae8
/*0x5ada*/      cmp r2, r1
/*0x5adc*/      bne jump_5aac
/*0x5ade*/      cmp r0, #3
/*0x5ae0*/      bne jump_5aac
            jump_5ae2:
/*0x5ae2*/      bl call_5ca8
/*0x5ae6*/      b jump_5b46
            jump_5ae8:
/*0x5ae8*/      cmp r2, r1
/*0x5aea*/      bne jump_5b16
/*0x5aec*/      cmp r0, #2
/*0x5aee*/      beq jump_5ae2
/*0x5af0*/      b jump_5b46
            jump_5af2:
/*0x5af2*/      bl call_4f64
/*0x5af6*/      cbnz r0, jump_5b42
/*0x5af8*/      ldrb r0, [r5, #6]
/*0x5afa*/      cmp r0, #5
/*0x5afc*/      beq jump_5b1a
/*0x5afe*/      ldrb r1, [r4, #3]
/*0x5b00*/      lsls r1, r1, #0x1e
/*0x5b02*/      bpl jump_5b16
/*0x5b04*/      cmp r0, #1
/*0x5b06*/      beq jump_5b46
/*0x5b08*/      movs r6, #1
/*0x5b0a*/      cmp r0, #2
/*0x5b0c*/      beq jump_5b22
/*0x5b0e*/      cmp r0, #3
/*0x5b10*/      beq jump_5b44
/*0x5b12*/      cmp r0, #4
/*0x5b14*/      beq jump_5b4a
            jump_5b16:
/*0x5b16*/      movs r0, #0
/*0x5b18*/      pop {r4, r5, r6, pc}
            jump_5b1a:
/*0x5b1a*/      pop.w {r4, r5, r6, lr}
/*0x5b1e*/      b.w jump_59ec
            jump_5b22:
/*0x5b22*/      bl call_7008
/*0x5b26*/      ldrb r0, [r5, #7]
/*0x5b28*/      cmp r0, #0x60
/*0x5b2a*/      beq jump_5b44
/*0x5b2c*/      ldrb r1, [r4, #1]
/*0x5b2e*/      ldrb r0, [r4, #2]
/*0x5b30*/      and r1, r1, #1
/*0x5b34*/      add.w r0, r0, r1, lsl #8
/*0x5b38*/      strh r0, [r5, #4]
/*0x5b3a*/      movs r0, #3
/*0x5b3c*/      strb r0, [r5, #6]
/*0x5b3e*/      ldr r0, [pc, #0x18] /* data_5b58 */
/*0x5b40*/      strb r6, [r0]
            jump_5b42:
/*0x5b42*/      b jump_5b46
            jump_5b44:
/*0x5b44*/      strb r6, [r5, #6]
            jump_5b46:
/*0x5b46*/      movs r0, #1
/*0x5b48*/      pop {r4, r5, r6, pc}
            jump_5b4a:
/*0x5b4a*/      movs r0, #5
/*0x5b4c*/      strb r0, [r5, #6]
/*0x5b4e*/      b jump_5b1a

            data_5b50:
/*0x5b50*/  .word 0x20001b7c
            data_5b54:
/*0x5b54*/  .word 0x2000079c
            data_5b58:
/*0x5b58*/  .word 0x20000790

            jump_5b5c:
/*0x5b5c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5b60*/      ldr r5, [pc, #0xc4] /* data_5c28 */
/*0x5b62*/      mov.w r8, #1
/*0x5b66*/      ldrb r0, [r5, #6]
/*0x5b68*/      cmp r0, #8
/*0x5b6a*/      beq jump_5c12
/*0x5b6c*/      ldrb r0, [r5, #7]
/*0x5b6e*/      ldr r1, [pc, #0xbc] /* data_5c2c */
/*0x5b70*/      sub.w r7, r5, #8
/*0x5b74*/      add.w r4, r1, r0, lsl #1
/*0x5b78*/      ldrh r0, [r7]
/*0x5b7a*/      ldr r6, [pc, #0xb4] /* data_5c30 */
/*0x5b7c*/      adds r4, #0x28
/*0x5b7e*/      cmp r0, #2
/*0x5b80*/      bne jump_5bac
/*0x5b82*/      ldr r0, [r6]
/*0x5b84*/      ldrh r1, [r0]
/*0x5b86*/      ldrh r0, [r0, #4]
/*0x5b88*/      ubfx r1, r1, #0, #0xa
/*0x5b8c*/      ubfx r0, r0, #0, #0xa
/*0x5b90*/      cmp r1, r0
/*0x5b92*/      bne jump_5bac
/*0x5b94*/      bl call_593c
/*0x5b98*/      ldr r1, [r6]
/*0x5b9a*/      ldrh r1, [r1]
/*0x5b9c*/      ubfx r1, r1, #0, #0xa
/*0x5ba0*/      bl call_52b8
/*0x5ba4*/      movw r0, #0xffff
/*0x5ba8*/      strh r0, [r4]
/*0x5baa*/      b jump_5bf4
            jump_5bac:
/*0x5bac*/      bl call_593c
/*0x5bb0*/      movs r1, #0xff
/*0x5bb2*/      bl call_52b8
/*0x5bb6*/      ldrb r0, [r5, #9]
/*0x5bb8*/      cmp r0, #1
/*0x5bba*/      beq jump_5c0a
/*0x5bbc*/      bl call_6f20
            jump_5bc0:
/*0x5bc0*/      ldrh r1, [r7]
/*0x5bc2*/      ldr r2, [r6]
/*0x5bc4*/      add.w r1, r2, r1, lsl #2
/*0x5bc8*/      mov.w r2, #0x1c00
/*0x5bcc*/      strh r0, [r1, #-0x2]
/*0x5bd0*/      ldrb r1, [r5, #9]
/*0x5bd2*/      ldrh r0, [r5, #4]
/*0x5bd4*/      orr.w r1, r2, r1, lsl #13
/*0x5bd8*/      orrs r0, r1
/*0x5bda*/      strh r0, [r4]
/*0x5bdc*/      ldrh r0, [r7]
/*0x5bde*/      cmp r0, #0xff
/*0x5be0*/      bhi jump_5bec
/*0x5be2*/      ldr r2, [r6]
/*0x5be4*/      mov.w r1, #0xfc00
/*0x5be8*/      strh.w r1, [r2, r0, lsl #2]
            jump_5bec:
/*0x5bec*/      ldrb r0, [r5, #7]
/*0x5bee*/      movs r1, #1
/*0x5bf0*/      bl call_4198
            jump_5bf4:
/*0x5bf4*/      ldr r0, [pc, #0x3c] /* data_5c34 */
/*0x5bf6*/      ldrb r0, [r0, #2]
/*0x5bf8*/      bl call_43b8
/*0x5bfc*/      ldrb r0, [r5, #6]
/*0x5bfe*/      cmp r0, #7
/*0x5c00*/      beq jump_5c0e
/*0x5c02*/      strb.w r8, [r5, #6]
            jump_5c06:
/*0x5c06*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_5c0a:
/*0x5c0a*/      movs r0, #0
/*0x5c0c*/      b jump_5bc0
            jump_5c0e:
/*0x5c0e*/      movs r0, #8
/*0x5c10*/      strb r0, [r5, #6]
            jump_5c12:
/*0x5c12*/      ldr r1, [pc, #0x14] /* data_5c28 */
/*0x5c14*/      movs r0, #0
/*0x5c16*/      subs r1, #8
/*0x5c18*/      strb r0, [r5, #8]
/*0x5c1a*/      str r0, [r1, #4]
/*0x5c1c*/      ldr r1, [pc, #0x18] /* data_5c38 */
/*0x5c1e*/      strb r0, [r5, #6]
/*0x5c20*/      strb.w r8, [r1]
/*0x5c24*/      b jump_5c06

/*0x5c26*/  .byte 0x00
/*0x5c27*/  .byte 0x00

            data_5c28:
/*0x5c28*/  .word 0x20001b7c
            data_5c2c:
/*0x5c2c*/  .word 0x2000087c
            data_5c30:
/*0x5c30*/  .word 0x2000000c
            data_5c34:
/*0x5c34*/  .word 0x20000870
            data_5c38:
/*0x5c38*/  .word 0x20000790


            .thumb_func
            call_5c3c:
/*0x5c3c*/      push {r0, r1, r4, lr}
/*0x5c3e*/      mov r4, r0
/*0x5c40*/      bl call_5ca8
/*0x5c44*/      bl call_6ff4
/*0x5c48*/      ldr r0, [pc, #0x40] /* data_5c8c */
/*0x5c4a*/      movs r1, #2
/*0x5c4c*/      sub.w r2, r0, #8
/*0x5c50*/      strb r1, [r0, #8]
/*0x5c52*/      movs r1, #0
/*0x5c54*/      strh r1, [r2]
/*0x5c56*/      str r1, [r2, #4]
/*0x5c58*/      strb r4, [r0, #7]
/*0x5c5a*/      cmp r4, #0xff
/*0x5c5c*/      beq jump_5c6a
/*0x5c5e*/      ldr r1, [pc, #0x30] /* data_5c90 */
/*0x5c60*/      add.w r1, r1, r4, lsl #1
/*0x5c64*/      ldrh r1, [r1, #0x28]
/*0x5c66*/      strh.w r1, [sp, #4]
            jump_5c6a:
/*0x5c6a*/      ldrh.w r1, [sp, #4]
/*0x5c6e*/      ubfx r1, r1, #0, #0xa
/*0x5c72*/      strh r1, [r0, #4]
/*0x5c74*/      ldrb.w r1, [sp, #5]
/*0x5c78*/      lsr.w r1, r1, #5
/*0x5c7c*/      strb r1, [r0, #9]
/*0x5c7e*/      bne jump_5c88
/*0x5c80*/      pop.w {r2, r3, r4, lr}
/*0x5c84*/      b.w jump_7084
            jump_5c88:
/*0x5c88*/      pop {r2, r3, r4, pc}

/*0x5c8a*/  .byte 0x00
/*0x5c8b*/  .byte 0x00

            data_5c8c:
/*0x5c8c*/  .word 0x20001b7c
            data_5c90:
/*0x5c90*/  .word 0x2000087c


            .thumb_func
            call_5c94:
/*0x5c94*/      ldr r0, [pc, #0xc] /* data_5ca4 */
/*0x5c96*/      ldrb r1, [r0, #8]
/*0x5c98*/      cmp r1, #0
/*0x5c9a*/      bne jump_5ca2
/*0x5c9c*/      movs r1, #1
/*0x5c9e*/      strb r1, [r0, #8]
/*0x5ca0*/      strb r1, [r0, #6]
            jump_5ca2:
/*0x5ca2*/      bx lr

            data_5ca4:
/*0x5ca4*/  .word 0x20001b7c


            .thumb_func
            call_5ca8:
/*0x5ca8*/      push {r3, r4, r5, r6, r7, lr}
/*0x5caa*/      ldr r6, [pc, #0x7c] /* data_5d28 */
/*0x5cac*/      movs r7, #0
/*0x5cae*/      ldrb r0, [r6, #8]
/*0x5cb0*/      cmp r0, #2
/*0x5cb2*/      bne jump_5d22
/*0x5cb4*/      sub.w r5, r6, #8
/*0x5cb8*/      ldrh r0, [r5]
/*0x5cba*/      cbz r0, jump_5d22
/*0x5cbc*/      ldr r1, [pc, #0x6c] /* data_5d2c */
/*0x5cbe*/      str r7, [sp]
/*0x5cc0*/      ldr r1, [r1]
/*0x5cc2*/      add.w r4, r1, r0, lsl #2
/*0x5cc6*/      ldrb.w r0, [sp, #3]
/*0x5cca*/      orr r0, r0, #5
/*0x5cce*/      strb.w r0, [sp, #3]
/*0x5cd2*/      b jump_5d18
            jump_5cd4:
/*0x5cd4*/      ldrb r0, [r4, #1]
/*0x5cd6*/      lsrs r0, r0, #5
/*0x5cd8*/      cmp r0, #2
/*0x5cda*/      beq jump_5ce2
/*0x5cdc*/      cmp r0, #7
/*0x5cde*/      bne jump_5d10
/*0x5ce0*/      b jump_5d0c
            jump_5ce2:
/*0x5ce2*/      ldrh r0, [r4]
/*0x5ce4*/      mov r1, sp
/*0x5ce6*/      bl call_4a30
/*0x5cea*/      ldrb.w r0, [sp, #1]
/*0x5cee*/      lsls r0, r0, #0x1f
/*0x5cf0*/      ldrb.w r0, [sp]
/*0x5cf4*/      beq jump_5cfc
/*0x5cf6*/      bl call_4734
/*0x5cfa*/      b jump_5d00
            jump_5cfc:
/*0x5cfc*/      ldr r1, [pc, #0x30] /* data_5d30 */
/*0x5cfe*/      ldrb r0, [r1, r0]
            jump_5d00:
/*0x5d00*/      strb.w r0, [sp, #2]
/*0x5d04*/      ldr r0, [sp]
/*0x5d06*/      bl call_47e0
/*0x5d0a*/      b jump_5d10
            jump_5d0c:
/*0x5d0c*/      movs r0, #0xff
/*0x5d0e*/      strh r0, [r5]
            jump_5d10:
/*0x5d10*/      ldrh r0, [r5]
/*0x5d12*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x5d14*/      strh r0, [r5]
/*0x5d16*/      .short 0x1d24 /* adds r4, r4, #4 */ 
            jump_5d18:
/*0x5d18*/      ldrh r0, [r5]
/*0x5d1a*/      cmp r0, #0xff
/*0x5d1c*/      bls jump_5cd4
/*0x5d1e*/      bl call_6ff4
            jump_5d22:
/*0x5d22*/      strb r7, [r6, #8]
/*0x5d24*/      pop {r3, r4, r5, r6, r7, pc}

/*0x5d26*/  .byte 0x00
/*0x5d27*/  .byte 0x00

            data_5d28:
/*0x5d28*/  .word 0x20001b7c
            data_5d2c:
/*0x5d2c*/  .word 0x2000000c
            data_5d30:
/*0x5d30*/  .word 0x20000202


            .thumb_func
            call_5d34:
/*0x5d34*/      ldr r0, [pc, #0x44] /* data_5d7c */
/*0x5d36*/      push {r4, lr}
/*0x5d38*/      ldr r0, [r0]
/*0x5d3a*/      bl call_4a3a
/*0x5d3e*/      mov r4, r0
/*0x5d40*/      movs r1, #3
/*0x5d42*/      bl call_52b8
/*0x5d46*/      uxtb r0, r0
/*0x5d48*/      cmp r0, #0xff
/*0x5d4a*/      beq jump_5d56
/*0x5d4c*/      movs r1, #0xff
/*0x5d4e*/      mov r0, r4
/*0x5d50*/      bl call_52b8
/*0x5d54*/      b jump_5d6a
            jump_5d56:
/*0x5d56*/      bl call_6fac
/*0x5d5a*/      cmp r0, #0x60
/*0x5d5c*/      bhs jump_5d76
/*0x5d5e*/      ldr r2, [pc, #0x20] /* data_5d80 */
/*0x5d60*/      movw r1, #0xffff
/*0x5d64*/      add.w r0, r2, r0, lsl #1
/*0x5d68*/      strh r1, [r0, #0x28]
            jump_5d6a:
/*0x5d6a*/      ldr r0, [pc, #0x18] /* data_5d84 */
/*0x5d6c*/      ldrb r0, [r0, #2]
/*0x5d6e*/      bl call_43b8
/*0x5d72*/      movs r0, #1
/*0x5d74*/      pop {r4, pc}
            jump_5d76:
/*0x5d76*/      movs r0, #0
/*0x5d78*/      pop {r4, pc}

/*0x5d7a*/  .byte 0x00
/*0x5d7b*/  .byte 0x00

            data_5d7c:
/*0x5d7c*/  .word 0x2000079c
            data_5d80:
/*0x5d80*/  .word 0x2000087c
            data_5d84:
/*0x5d84*/  .word 0x20000870


            .thumb_func
            call_5d88:
/*0x5d88*/      push {r3, r4, r5, lr}
/*0x5d8a*/      ldr r4, [pc, #0x30] /* data_5dbc */
/*0x5d8c*/      movs r5, #0x60
/*0x5d8e*/      b jump_5db2
            jump_5d90:
/*0x5d90*/      mov r1, sp
/*0x5d92*/      mov r0, r5
/*0x5d94*/      bl call_5dc0
/*0x5d98*/      ldrb.w r0, [sp, #2]
/*0x5d9c*/      strb r0, [r4]
/*0x5d9e*/      sub.w r0, r4, #0x60
/*0x5da2*/      ldrb.w r1, [sp, #1]
/*0x5da6*/      strb r1, [r0]
/*0x5da8*/      subs r0, #0x60
/*0x5daa*/      ldrb.w r1, [sp]
/*0x5dae*/      strb r1, [r0]
/*0x5db0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
            jump_5db2:
/*0x5db2*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x5db4*/      uxtb r5, r5
/*0x5db6*/      bhs jump_5d90
/*0x5db8*/      pop {r3, r4, r5, pc}

/*0x5dba*/  .byte 0x00
/*0x5dbb*/  .byte 0x00

            data_5dbc:
/*0x5dbc*/  .word 0x20000445


            .thumb_func
            call_5dc0:
/*0x5dc0*/      ldr r2, [pc, #0x30] /* data_5df4 */
/*0x5dc2*/      movs r3, #0xd
/*0x5dc4*/      ldrb r0, [r2, r0]
/*0x5dc6*/      and r2, r0, #7
/*0x5dca*/      lsrs r0, r0, #3
/*0x5dcc*/      rsb r0, r0, r0, lsl #8
/*0x5dd0*/      udiv r0, r0, r3
/*0x5dd4*/      uxtb r0, r0
/*0x5dd6*/      strb r0, [r1]
/*0x5dd8*/      cmp r2, #4
/*0x5dda*/      beq jump_5dee
/*0x5ddc*/      rsb.w r2, r2, #4
/*0x5de0*/      movs r3, #0x2b
/*0x5de2*/      muls r2, r3, r2
/*0x5de4*/      uxtb r3, r2
/*0x5de6*/      mov r2, r1
/*0x5de8*/      mov r1, r3
/*0x5dea*/      b.w call_4426
            jump_5dee:
/*0x5dee*/      strb r0, [r1, #1]
/*0x5df0*/      strb r0, [r1, #2]
/*0x5df2*/      bx lr

            data_5df4:
/*0x5df4*/  .word 0x00007b45 /* possible pointer */


            .thumb_func
            call_5df8:
/*0x5df8*/      ldr r1, [pc, #0x1c] /* data_5e18 */
/*0x5dfa*/      strb r0, [r1]
/*0x5dfc*/      ldrb r0, [r1]
/*0x5dfe*/      ldr r1, [pc, #0x1c] /* data_5e1c */
/*0x5e00*/      and r0, r0, #1
/*0x5e04*/      strb r0, [r1]
/*0x5e06*/      ldrb r2, [r1, #1]
/*0x5e08*/      cmp r2, r0
/*0x5e0a*/      beq jump_5e14
/*0x5e0c*/      strb r0, [r1, #1]
/*0x5e0e*/      ldr r1, [pc, #0x10] /* data_5e20 */
/*0x5e10*/      movs r0, #3
/*0x5e12*/      strb r0, [r1, #3]
            jump_5e14:
/*0x5e14*/      b.w jump_56c8

            data_5e18:
/*0x5e18*/  .word 0x20000054
            data_5e1c:
/*0x5e1c*/  .word 0x20000000
            data_5e20:
/*0x5e20*/  .word 0x20000790


            .thumb_func
            call_5e24:
/*0x5e24*/      movs r0, #0
/*0x5e26*/      mov.w r2, #0x200
/*0x5e2a*/      movs r3, #1
/*0x5e2c*/      mov r1, r0
/*0x5e2e*/      b.w call_3b30

/*0x5e32*/  .byte 0x00
/*0x5e33*/  .byte 0x00


            .thumb_func
            call_5e34:
/*0x5e34*/      movs r2, #0
/*0x5e36*/      movs r1, #1
/*0x5e38*/      ldr r0, [pc, #4] /* data_5e40 */
/*0x5e3a*/      b.w call_3896

/*0x5e3e*/  .byte 0x00
/*0x5e3f*/  .byte 0x00

            data_5e40:
/*0x5e40*/  .word 0x00007fb8 /* possible pointer */


            .thumb_func
            call_5e44:
/*0x5e44*/      movs r2, #1
/*0x5e46*/      mov r1, r2
/*0x5e48*/      ldr r0, [pc, #4] /* data_5e50 */
/*0x5e4a*/      b.w call_3896

/*0x5e4e*/  .byte 0x00
/*0x5e4f*/  .byte 0x00

            data_5e50:
/*0x5e50*/  .word 0x00007fb8 /* possible pointer */


            .thumb_func
            call_5e54:
/*0x5e54*/      push {r4, r5, r6, lr}
/*0x5e56*/      ldr r1, [pc, #0x34] /* data_5e8c */
/*0x5e58*/      ldr r4, [r1]
/*0x5e5a*/      ldr r5, [pc, #0x30] /* data_5e8c */
/*0x5e5c*/      adds r5, #0x48
/*0x5e5e*/      ldr r3, [r5]
/*0x5e60*/      movs r2, #1
/*0x5e62*/      str r2, [r1]
/*0x5e64*/      movs r2, #0
/*0x5e66*/      str r2, [r5]
/*0x5e68*/      ldr r6, [pc, #0x24] /* data_5e90 */
/*0x5e6a*/      str.w r2, [r6, #0x9c]
/*0x5e6e*/      str.w r2, [r6, #0x8c]
/*0x5e72*/      str r4, [r1]
/*0x5e74*/      ldr r1, [pc, #0x1c] /* data_5e94 */
/*0x5e76*/      ldr r2, [r1]
/*0x5e78*/      orr r2, r2, #4
/*0x5e7c*/      str r2, [r1]
/*0x5e7e*/      cbz r0, jump_5e86
/*0x5e80*/      wfi 
            jump_5e82:
/*0x5e82*/      str r3, [r5]
/*0x5e84*/      pop {r4, r5, r6, pc}
            jump_5e86:
/*0x5e86*/      wfe 
/*0x5e88*/      b jump_5e82

/*0x5e8a*/  .byte 0x00
/*0x5e8b*/  .byte 0x00

            data_5e8c:
/*0x5e8c*/  .word 0x43100618
            data_5e90:
/*0x5e90*/  .word 0x42d42000
            data_5e94:
/*0x5e94*/  .word 0xe000ed10

            jump_5e98:
/*0x5e98*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x5e9c*/      ldr r3, [pc, #0x34] /* data_5ed4 */
/*0x5e9e*/      ldr r6, [r3]
/*0x5ea0*/      ldr r4, [pc, #0x30] /* data_5ed4 */
/*0x5ea2*/      adds r4, #0x48
/*0x5ea4*/      ldr r5, [r4]
/*0x5ea6*/      mov.w r8, #1
/*0x5eaa*/      str.w r8, [r3]
/*0x5eae*/      movs r7, #0
/*0x5eb0*/      str r7, [r4]
/*0x5eb2*/      bl call_60ac
/*0x5eb6*/      ldr r0, [pc, #0x20] /* data_5ed8 */
/*0x5eb8*/      str.w r7, [r0, #0x9c]
/*0x5ebc*/      str.w r8, [r0, #0x8c]
/*0x5ec0*/      str r6, [r3]
/*0x5ec2*/      ldr r0, [pc, #0x18] /* data_5edc */
/*0x5ec4*/      ldr r1, [r0]
/*0x5ec6*/      orr r1, r1, #4
/*0x5eca*/      str r1, [r0]
/*0x5ecc*/      wfe 
/*0x5ece*/      str r5, [r4]
/*0x5ed0*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_5ed4:
/*0x5ed4*/  .word 0x43100618
            data_5ed8:
/*0x5ed8*/  .word 0x42d42000
            data_5edc:
/*0x5edc*/  .word 0xe000ed10


            .thumb_func
            call_5ee0:
/*0x5ee0*/      ldr r1, [pc, #0x10] /* data_5ef4 */
/*0x5ee2*/      ldr r2, [r1]
/*0x5ee4*/      bic r2, r2, #4
/*0x5ee8*/      str r2, [r1]
/*0x5eea*/      cbz r0, jump_5ef0
/*0x5eec*/      wfi 
/*0x5eee*/      bx lr
            jump_5ef0:
/*0x5ef0*/      wfe 
/*0x5ef2*/      bx lr

            data_5ef4:
/*0x5ef4*/  .word 0xe000ed10


            .thumb_func
            handle_frame:
/*0x5ef8*/      push {r4, r5, r6, lr}
/*0x5efa*/      ldr r6, [pc, #0xd8] /* data_5fd4 */
/*0x5efc*/      ldrb r0, [r6]
/*0x5efe*/      cmp r0, #1
/*0x5f00*/      bne jump_5fbe
/*0x5f02*/      add.w r5, r6, #8
/*0x5f06*/      mov r0, r5
/*0x5f08*/      movs r4, #0
/*0x5f0a*/      ldrb r2, [r5]
/*0x5f0c*/      ldrb r0, [r0, #1]
/*0x5f0e*/      mov r1, r4
/*0x5f10*/      cmp r2, #0x10
/*0x5f12*/      beq jump_5f1e
/*0x5f14*/      cmp r2, #0x11
/*0x5f16*/      beq jump_5f28
/*0x5f18*/      cmp r2, #0x12
/*0x5f1a*/      bne jump_5fc0
/*0x5f1c*/      b jump_5f2e
            jump_5f1e:
/*0x5f1e*/      cmp r0, #2
/*0x5f20*/      bne jump_5fc0
/*0x5f22*/      str r1, [r5, #4]
/*0x5f24*/      movs r1, #4
/*0x5f26*/      b jump_5fa2
            jump_5f28:
/*0x5f28*/      bl call_5fdc
/*0x5f2c*/      b jump_5faa
            jump_5f2e:
/*0x5f2e*/      mov.w r3, #0x400
/*0x5f32*/      cmp r0, #0x20
/*0x5f34*/      blo jump_5f54
/*0x5f36*/      sub.w r2, r0, #0x1f
/*0x5f3a*/      rsb r2, r2, r2, lsl #4
/*0x5f3e*/      cmp.w r3, r2, lsl #2
/*0x5f42*/      blt jump_5f54
/*0x5f44*/      rsb r0, r0, r0, lsl #4
/*0x5f48*/      mov.w r1, #0x2880
/*0x5f4c*/      add.w r0, r1, r0, lsl #2
/*0x5f50*/      movs r1, #0x3c
/*0x5f52*/      b jump_5fa4
            jump_5f54:
/*0x5f54*/      cbz r0, jump_5f60
/*0x5f56*/      cmp r0, #1
/*0x5f58*/      beq jump_5f96
/*0x5f5a*/      cmp r0, #2
/*0x5f5c*/      bne jump_5fc0
/*0x5f5e*/      b jump_5f9e
            jump_5f60:
/*0x5f60*/      ldrb.w r0, [r1, #0x10f]
/*0x5f64*/      cmp r0, #0xaa
/*0x5f66*/      beq jump_5f8c
/*0x5f68*/      ldrb r2, [r3]
/*0x5f6a*/      mov r0, r3
/*0x5f6c*/      cmp r2, #4
/*0x5f6e*/      beq jump_5f92
/*0x5f70*/      movs r2, #0x20
/*0x5f72*/      mov r1, r3
/*0x5f74*/      adds r0, r5, #4
/*0x5f76*/      bl call_358c
/*0x5f7a*/      ldr r0, [pc, #0x5c] /* data_5fd8 */
/*0x5f7c*/      ldr.w r1, [r0, #0x180]
/*0x5f80*/      str r1, [r5, #0x24]
/*0x5f82*/      ldr.w r0, [r0, #0x18c]
/*0x5f86*/      movs r1, #0x28
/*0x5f88*/      str r0, [r5, #0x28]
/*0x5f8a*/      b jump_5fa2
            jump_5f8c:
/*0x5f8c*/      movs r1, #0x10
/*0x5f8e*/      lsls r0, r1, #4
/*0x5f90*/      b jump_5fa4
            jump_5f92:
/*0x5f92*/      movs r1, #0x34
/*0x5f94*/      b jump_5fa4
            jump_5f96:
/*0x5f96*/      movs r1, #4
/*0x5f98*/      mov.w r0, #0x3c00
/*0x5f9c*/      b jump_5fa4
            jump_5f9e:
/*0x5f9e*/      movs r1, #1
/*0x5fa0*/      strb r1, [r5, #4]
            jump_5fa2:
/*0x5fa2*/      adds r0, r5, #4
            jump_5fa4:
/*0x5fa4*/      bl call_6048
/*0x5fa8*/      movs r4, #1
            jump_5faa:
/*0x5faa*/      ldrb r0, [r6]
/*0x5fac*/      cmp r0, #1
/*0x5fae*/      bne jump_5fbe
/*0x5fb0*/      cbz r4, jump_5fc0
/*0x5fb2*/      movs r1, #0x3c
/*0x5fb4*/      adds r0, r5, #4
            jump_5fb6:
/*0x5fb6*/      bl call_35be
/*0x5fba*/      movs r0, #2
/*0x5fbc*/      strb r0, [r6]
            jump_5fbe:
/*0x5fbe*/      pop {r4, r5, r6, pc}
            jump_5fc0:
/*0x5fc0*/      ldr r0, [r5]
/*0x5fc2*/      str r0, [r5, #4]
/*0x5fc4*/      movw r0, #0xaaff
/*0x5fc8*/      str r0, [r5]
/*0x5fca*/      ldr r0, [pc, #8] /* data_5fd4 */
/*0x5fcc*/      movs r1, #0x38
/*0x5fce*/      adds r0, #0x10
/*0x5fd0*/      b jump_5fb6

/*0x5fd2*/  .byte 0x00
/*0x5fd3*/  .byte 0x00

            data_5fd4:
/*0x5fd4*/  .word 0x20000748
            data_5fd8:
/*0x5fd8*/  .word 0x40080000


            .thumb_func
            call_5fdc:
/*0x5fdc*/      push {r4, lr}
/*0x5fde*/      ldr r1, [pc, #0x58] /* data_6038 */
/*0x5fe0*/      cbz r0, jump_5ffe
/*0x5fe2*/      cmp r0, #1
/*0x5fe4*/      beq jump_6002
/*0x5fe6*/      cmp r0, #2
/*0x5fe8*/      bne jump_6034
/*0x5fea*/      movs r0, #0x35
/*0x5fec*/      bl call_58a0
/*0x5ff0*/      movs r0, #0
/*0x5ff2*/      bl call_39d0
/*0x5ff6*/      pop.w {r4, lr}
/*0x5ffa*/      b.w jump_5e98
            jump_5ffe:
/*0x5ffe*/      ldr r0, [pc, #0x3c] /* data_603c */
/*0x6000*/      b jump_6006
            jump_6002:
/*0x6002*/      ldr r0, [pc, #0x38] /* data_603c */
/*0x6004*/      .short 0x1f40 /* subs r0, r0, #5 */ 
            jump_6006:
/*0x6006*/      str r0, [r1]
/*0x6008*/      movs r0, #0x35
/*0x600a*/      bl call_58a0
/*0x600e*/      movs r0, #0
/*0x6010*/      bl call_39d0
/*0x6014*/      movw r0, #0x4e20
/*0x6018*/      bl call_3794
/*0x601c*/      dsb sy
/*0x6020*/      ldr r0, [pc, #0x1c] /* data_6040 */
/*0x6022*/      ldr r1, [r0]
/*0x6024*/      ldr r2, [pc, #0x1c] /* data_6044 */
/*0x6026*/      and r1, r1, #0x700
/*0x602a*/      orrs r1, r2
/*0x602c*/      str r1, [r0]
/*0x602e*/      dsb sy
            jump_6032:
/*0x6032*/      b jump_6032
            jump_6034:
/*0x6034*/      pop {r4, pc}

/*0x6036*/  .byte 0x00
/*0x6037*/  .byte 0x00

            data_6038:
/*0x6038*/  .word 0x20003ffc
            data_603c:
/*0x603c*/  .word 0x55aafaf5
            data_6040:
/*0x6040*/  .word 0xe000ed0c
            data_6044:
/*0x6044*/  .word 0x05fa0004


            .thumb_func
            call_6048:
/*0x6048*/      push {r4, r5, r6, lr}
/*0x604a*/      mov r4, r1
/*0x604c*/      ldr r2, [pc, #0x28] /* data_6078 */
/*0x604e*/      mov r1, r0
/*0x6050*/      movs r0, #2
/*0x6052*/      strb r0, [r2]
/*0x6054*/      add.w r0, r2, #0xc
/*0x6058*/      subs r5, r0, #4
/*0x605a*/      cmp r1, r0
/*0x605c*/      beq jump_6066
/*0x605e*/      mov r2, r4
/*0x6060*/      adds r0, r5, #4
/*0x6062*/      bl call_358c
            jump_6066:
/*0x6066*/      adds r0, r5, r4
/*0x6068*/      rsb.w r1, r4, #0x3c
/*0x606c*/      pop.w {r4, r5, r6, lr}
/*0x6070*/      .short 0x1d00 /* adds r0, r0, #4 */ 
/*0x6072*/      b.w call_35be

/*0x6076*/  .byte 0x00
/*0x6077*/  .byte 0x00

            data_6078:
/*0x6078*/  .word 0x20000748


            .thumb_func
            call_607c:
/*0x607c*/      push {r4, r5, r6, r7, lr}
/*0x607e*/      ldr r7, [pc, #0x28] /* data_60a8 */
/*0x6080*/      ldr.w r4, [r7, #0x104]
/*0x6084*/      ldr.w r5, [r7, #0x108]
/*0x6088*/      ldr.w r6, [r7, #0x10c]
/*0x608c*/      bics r4, r0
/*0x608e*/      bics r5, r1
/*0x6090*/      bics r6, r2
/*0x6092*/      cbz r3, jump_609a
/*0x6094*/      orrs r4, r0
/*0x6096*/      orrs r5, r1
/*0x6098*/      orrs r6, r2
            jump_609a:
/*0x609a*/      str.w r4, [r7, #0x104]
/*0x609e*/      str.w r5, [r7, #0x108]
/*0x60a2*/      str.w r6, [r7, #0x10c]
/*0x60a6*/      pop {r4, r5, r6, r7, pc}

            data_60a8:
/*0x60a8*/  .word 0x40088000


            .thumb_func
            call_60ac:
/*0x60ac*/      ldr r2, [pc, #0x1c] /* data_60cc */
/*0x60ae*/      movs r1, #0
/*0x60b0*/      mov.w r0, #0x1c20
/*0x60b4*/      str.w r1, [r2, #0x108]
            jump_60b8:
/*0x60b8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x60ba*/      bhs jump_60b8
/*0x60bc*/      movs r0, #1
/*0x60be*/      str.w r0, [r2, #0x108]
/*0x60c2*/      ldr r0, [pc, #0xc] /* data_60d0 */
            jump_60c4:
/*0x60c4*/      ldr r1, [r0, #8]
/*0x60c6*/      lsls r1, r1, #0x1a
/*0x60c8*/      bpl jump_60c4
/*0x60ca*/      bx lr

            data_60cc:
/*0x60cc*/  .word 0x42d40000
            data_60d0:
/*0x60d0*/  .word 0x40088000


            .thumb_func
            call_60d4:
/*0x60d4*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x60d8*/      movs r7, #0xb
/*0x60da*/      ldr r5, [pc, #0x6c] /* data_6148 */
/*0x60dc*/      b jump_613c
            jump_60de:
/*0x60de*/      ldr r1, [pc, #0x6c] /* data_614c */
/*0x60e0*/      add.w r0, r7, r7, lsl #1
/*0x60e4*/      add r0, r1
/*0x60e6*/      ldrb r1, [r5, #-0x1]!
/*0x60ea*/      ldrb r0, [r0, #2]
/*0x60ec*/      eors r0, r1
/*0x60ee*/      movs.w r8, r0
/*0x60f2*/      beq jump_613c
/*0x60f4*/      movs r4, #0x80
/*0x60f6*/      movs r6, #8
/*0x60f8*/      b jump_6136
            jump_60fa:
/*0x60fa*/      tst.w r8, r4
/*0x60fe*/      beq jump_6134
/*0x6100*/      ldrb r0, [r5]
/*0x6102*/      eors r0, r4
/*0x6104*/      strb r0, [r5]
/*0x6106*/      tst r0, r4
/*0x6108*/      bne jump_610e
/*0x610a*/      movs r0, #1
/*0x610c*/      b jump_6110
            jump_610e:
/*0x610e*/      movs r0, #0
            jump_6110:
/*0x6110*/      mov sb, r0
/*0x6112*/      add.w r0, r6, r7, lsl #3
/*0x6116*/      uxtb r0, r0
/*0x6118*/      mov r1, sb
/*0x611a*/      bl call_48d8
/*0x611e*/      cbnz r0, jump_6126
/*0x6120*/      ldrb r0, [r5]
/*0x6122*/      eors r0, r4
/*0x6124*/      strb r0, [r5]
            jump_6126:
/*0x6126*/      movs.w r0, sb
/*0x612a*/      beq jump_612e
/*0x612c*/      movs r0, #1
            jump_612e:
/*0x612e*/      ldr r1, [pc, #0x18] /* data_6148 */
/*0x6130*/      subs r1, #0xf
/*0x6132*/      strh r0, [r1, #2]
            jump_6134:
/*0x6134*/      lsrs r4, r4, #1
            jump_6136:
/*0x6136*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x6138*/      uxtb r6, r6
/*0x613a*/      bhs jump_60fa
            jump_613c:
/*0x613c*/      .short 0x1e7f /* subs r7, r7, #1 */ 
/*0x613e*/      uxtb r7, r7
/*0x6140*/      bhs jump_60de
/*0x6142*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

/*0x6146*/  .byte 0x00
/*0x6147*/  .byte 0x00

            data_6148:
/*0x6148*/  .word 0x2000019f
            data_614c:
/*0x614c*/  .word 0x20000302


            .thumb_func
            call_6150:
/*0x6150*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6154*/      mov r6, r0
/*0x6156*/      movs r4, #2
/*0x6158*/      ldr r5, [pc, #0x50] /* data_61ac */
/*0x615a*/      mov.w r7, #0x1f4
            jump_615e:
/*0x615e*/      bl call_717c
/*0x6162*/      movs r0, #0xb
/*0x6164*/      b jump_616e
            jump_6166:
/*0x6166*/      add.w r1, r0, r0, lsl #1
/*0x616a*/      ldrb r1, [r5, r1]
/*0x616c*/      cbnz r1, jump_6174
            jump_616e:
/*0x616e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6170*/      uxtb r0, r0
/*0x6172*/      bhs jump_6166
            jump_6174:
/*0x6174*/      cmp r0, #0xff
/*0x6176*/      beq jump_6188
/*0x6178*/      cmp r4, #0
/*0x617a*/      bne jump_615e
            jump_617c:
/*0x617c*/      cmp r6, #0
/*0x617e*/      beq jump_61a6
/*0x6180*/      ldr r2, [pc, #0x2c] /* data_61b0 */
/*0x6182*/      ldr r1, [pc, #0x28] /* data_61ac */
/*0x6184*/      movs r0, #0xb
/*0x6186*/      b jump_61a0
            jump_6188:
/*0x6188*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x618a*/      ands r4, r4, #0xff
/*0x618e*/      beq jump_617c
/*0x6190*/      mov r0, r7
/*0x6192*/      bl call_3794
/*0x6196*/      b jump_615e
            jump_6198:
/*0x6198*/      ldrb r3, [r1, #2]
/*0x619a*/      strb r3, [r2], #1
/*0x619e*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_61a0:
/*0x61a0*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x61a2*/      uxtb r0, r0
/*0x61a4*/      bhs jump_6198
            jump_61a6:
/*0x61a6*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x61aa*/  .byte 0x00
/*0x61ab*/  .byte 0x00

            data_61ac:
/*0x61ac*/  .word 0x20000302
            data_61b0:
/*0x61b0*/  .word 0x20000194


            .thumb_func
            call_61b4:
/*0x61b4*/      ldr r1, [pc, #0x10] /* data_61c8 */
/*0x61b6*/      ldrb r0, [r1]
/*0x61b8*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x61ba*/      strb r0, [r1]
/*0x61bc*/      lsls r0, r0, #0x1e
/*0x61be*/      bne jump_61c4
/*0x61c0*/      b.w call_717c
            jump_61c4:
/*0x61c4*/      bx lr

/*0x61c6*/  .byte 0x00
/*0x61c7*/  .byte 0x00

            data_61c8:
/*0x61c8*/  .word 0x20000190


            .thumb_func
            call_61cc:
/*0x61cc*/      ldr r2, [pc, #0x44] /* data_6214 */
/*0x61ce*/      push {r4, lr}
/*0x61d0*/      movs r3, #0
/*0x61d2*/      movs r1, #8
/*0x61d4*/      add.w r0, r2, #0x62
/*0x61d8*/      bl call_38b2
/*0x61dc*/      ldr r1, [pc, #0x38] /* data_6218 */
/*0x61de*/      movw r0, #0xeae0
/*0x61e2*/      str r0, [r1, #0x54]
/*0x61e4*/      movs r2, #0xff
/*0x61e6*/      movs r1, #0xb
/*0x61e8*/      ldr r0, [pc, #0x30] /* data_621c */
/*0x61ea*/      bl call_35b0
/*0x61ee*/      movs r0, #0
/*0x61f0*/      bl call_6254
/*0x61f4*/      movs r1, #0xb
/*0x61f6*/      movs r3, #0
/*0x61f8*/      ldr r0, [pc, #0x24] /* data_6220 */
/*0x61fa*/      movs r2, #0xff
/*0x61fc*/      b jump_620a
            jump_61fe:
/*0x61fe*/      strb r3, [r0], #1
/*0x6202*/      strb r2, [r0], #1
/*0x6206*/      strb r2, [r0], #1
            jump_620a:
/*0x620a*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x620c*/      uxtb r1, r1
/*0x620e*/      bhs jump_61fe
/*0x6210*/      pop {r4, pc}

/*0x6212*/  .byte 0x00
/*0x6213*/  .byte 0x00

            data_6214:
/*0x6214*/  .word 0x00007bb0 /* possible pointer */
            data_6218:
/*0x6218*/  .word 0x40024000
            data_621c:
/*0x621c*/  .word 0x20000194
            data_6220:
/*0x6220*/  .word 0x20000302


            .thumb_func
            call_6224:
/*0x6224*/      ldr r1, [pc, #0x28] /* data_6250 */
/*0x6226*/      push {r4, lr}
/*0x6228*/      add.w r0, r1, #0x16e
/*0x622c*/      movs r2, #0xb
/*0x622e*/      b jump_6244
            jump_6230:
/*0x6230*/      ldrb r3, [r0]
/*0x6232*/      cbnz r3, jump_623c
/*0x6234*/      ldrb r3, [r0, #2]
/*0x6236*/      ldrb r4, [r1]
/*0x6238*/      cmp r3, r4
/*0x623a*/      beq jump_6240
            jump_623c:
/*0x623c*/      movs r0, #0
/*0x623e*/      pop {r4, pc}
            jump_6240:
/*0x6240*/      .short 0x1cc0 /* adds r0, r0, #3 */ 
/*0x6242*/      .short 0x1c49 /* adds r1, r1, #1 */ 
            jump_6244:
/*0x6244*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6246*/      uxtb r2, r2
/*0x6248*/      bhs jump_6230
/*0x624a*/      movs r0, #1
/*0x624c*/      pop {r4, pc}

/*0x624e*/  .byte 0x00
/*0x624f*/  .byte 0x00

            data_6250:
/*0x6250*/  .word 0x20000194


            .thumb_func
            call_6254:
/*0x6254*/      push {r4, lr}
/*0x6256*/      mov r4, r0
/*0x6258*/      movs r2, #0x58
/*0x625a*/      ldr r1, [pc, #0x38] /* data_6294 */
/*0x625c*/      ldr r0, [pc, #0x38] /* data_6298 */
/*0x625e*/      bl call_358c
/*0x6262*/      cbz r4, jump_6282
/*0x6264*/      bl call_62b8
/*0x6268*/      cmp r4, #1
/*0x626a*/      beq jump_6272
/*0x626c*/      cmp r4, #2
/*0x626e*/      bne jump_6282
/*0x6270*/      b jump_627a
            jump_6272:
/*0x6272*/      ldr r1, [pc, #0x20] /* data_6294 */
/*0x6274*/      adds r1, #0xd6
/*0x6276*/      movs r0, #0x22
/*0x6278*/      b jump_627e
            jump_627a:
/*0x627a*/      ldr r1, [pc, #0x20] /* data_629c */
/*0x627c*/      movs r0, #0x11
            jump_627e:
/*0x627e*/      bl call_62e0
            jump_6282:
/*0x6282*/      bl call_62b8
/*0x6286*/      bl call_5358
/*0x628a*/      pop.w {r4, lr}
/*0x628e*/      b.w call_62b8

/*0x6292*/  .byte 0x00
/*0x6293*/  .byte 0x00

            data_6294:
/*0x6294*/  .word 0x00007bba /* possible pointer */
            data_6298:
/*0x6298*/  .word 0x200001aa
            data_629c:
/*0x629c*/  .word 0x00007cd4 /* possible pointer */


            .thumb_func
            call_62a0:
/*0x62a0*/      cbz r0, jump_62b0
/*0x62a2*/      movs r3, #0
            jump_62a4:
/*0x62a4*/      ldr r2, [pc, #0xc] /* data_62b4 */
/*0x62a6*/      movs r1, #0xb
/*0x62a8*/      add.w r0, r2, #0x6d
/*0x62ac*/      b.w call_38b2
            jump_62b0:
/*0x62b0*/      movs r3, #1
/*0x62b2*/      b jump_62a4

            data_62b4:
/*0x62b4*/  .word 0x00007bb5 /* possible pointer */


            .thumb_func
            call_62b8:
/*0x62b8*/      push {r4, lr}
/*0x62ba*/      ldr r4, [pc, #0x20] /* data_62dc */
/*0x62bc*/      movs r2, #0xff
/*0x62be*/      adds r1, r2, #1
/*0x62c0*/      adds r0, r4, #1
/*0x62c2*/      bl call_35b0
/*0x62c6*/      movs r0, #0x58
/*0x62c8*/      adds r1, r4, #1
/*0x62ca*/      b jump_62d2
            jump_62cc:
/*0x62cc*/      ldrb r2, [r4], #-1
/*0x62d0*/      strb r0, [r1, r2]
            jump_62d2:
/*0x62d2*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x62d4*/      uxtb r0, r0
/*0x62d6*/      bhs jump_62cc
/*0x62d8*/      pop {r4, pc}

/*0x62da*/  .byte 0x00
/*0x62db*/  .byte 0x00

            data_62dc:
/*0x62dc*/  .word 0x20000201


            .thumb_func
            call_62e0:
/*0x62e0*/      push {r4, r5, lr}
/*0x62e2*/      ldr r3, [pc, #0x1c] /* data_6300 */
/*0x62e4*/      add.w r4, r3, #0x58
/*0x62e8*/      b jump_62f8
            jump_62ea:
/*0x62ea*/      ldrb r2, [r1]
/*0x62ec*/      ldrb r2, [r4, r2]
/*0x62ee*/      cmp r2, #0xff
/*0x62f0*/      beq jump_62f6
/*0x62f2*/      ldrb r5, [r1, #1]
/*0x62f4*/      strb r5, [r3, r2]
            jump_62f6:
/*0x62f6*/      .short 0x1c89 /* adds r1, r1, #2 */ 
            jump_62f8:
/*0x62f8*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x62fa*/      uxtb r0, r0
/*0x62fc*/      bhs jump_62ea
/*0x62fe*/      pop {r4, r5, pc}

            data_6300:
/*0x6300*/  .word 0x200001aa


            .thumb_func
            call_6304:
/*0x6304*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
/*0x6308*/      ldr.w lr, [pc, #0x74] /* data_6380 */
/*0x630c*/      ldr.w sb, [pc, #0x74] /* data_6384 */
/*0x6310*/      movs r6, #0
/*0x6312*/      sub.w sl, lr, #0x120
/*0x6316*/      addw fp, sb, #0x242
            jump_631a:
/*0x631a*/      add.w r1, r6, r6, lsl #1
/*0x631e*/      movs r4, #0x10
/*0x6320*/      add.w r0, lr, r1, lsl #5
/*0x6324*/      movs r3, #0
/*0x6326*/      add.w ip, fp, r6, lsl #4
            jump_632a:
/*0x632a*/      ldrb.w r1, [sb, r3]
/*0x632e*/      ldr.w r8, [pc, #0x54] /* data_6384 */
/*0x6332*/      add.w r2, r1, r1, lsl #1
/*0x6336*/      add.w r7, sl, r2, lsl #5
/*0x633a*/      mov r1, ip
/*0x633c*/      movs r2, #0x10
/*0x633e*/      add.w r8, r8, #0x42
/*0x6342*/      b jump_635e
            jump_6344:
/*0x6344*/      ldrb r5, [r1]
/*0x6346*/      cmp r5, #0xff
/*0x6348*/      beq jump_6352
/*0x634a*/      ldrb r5, [r7, r5]
/*0x634c*/      ldrh.w r5, [r8, r5, lsl #1]
/*0x6350*/      strh r5, [r0]
            jump_6352:
/*0x6352*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x6354*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6356*/      ands r4, r4, #0xff
/*0x635a*/      beq jump_6378
/*0x635c*/      .short 0x1d80 /* adds r0, r0, #6 */ 
            jump_635e:
/*0x635e*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6360*/      uxtb r2, r2
/*0x6362*/      bhs jump_6344
/*0x6364*/      .short 0x1c5b /* adds r3, r3, #1 */ 
/*0x6366*/      uxtb r3, r3
/*0x6368*/      cmp r3, #3
/*0x636a*/      blo jump_632a
/*0x636c*/      .short 0x1c76 /* adds r6, r6, #1 */ 
/*0x636e*/      uxtb r6, r6
/*0x6370*/      cmp r6, #8
/*0x6372*/      blo jump_631a
/*0x6374*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}
            jump_6378:
/*0x6378*/      movs r4, #0x10
/*0x637a*/      subs r0, #0x58
/*0x637c*/      b jump_635e

/*0x637e*/  .byte 0x00
/*0x637f*/  .byte 0x00

            data_6380:
/*0x6380*/  .word 0x20000446
            data_6384:
/*0x6384*/  .word 0x00007cf6 /* possible pointer */


            .thumb_func
            call_6388:
/*0x6388*/      push {r1, r2, r3, r4, r5, r6, r7, lr}
/*0x638a*/      movs r5, #0
/*0x638c*/      mov r1, r5
/*0x638e*/      mov.w r2, #0x20000
/*0x6392*/      movs r3, #1
/*0x6394*/      mov r0, r1
/*0x6396*/      bl call_3b30
/*0x639a*/      movw r1, #0xea60
/*0x639e*/      ldr r0, [pc, #0x68] /* data_6408 */
/*0x63a0*/      bl call_375e
/*0x63a4*/      movs r1, #2
/*0x63a6*/      ldr r0, [pc, #0x64] /* data_640c */
/*0x63a8*/      bl call_3880
/*0x63ac*/      ldr r0, [pc, #0x5c] /* data_640c */
/*0x63ae*/      movs r2, #2
/*0x63b0*/      movs r1, #4
/*0x63b2*/      adds r0, #0x23
/*0x63b4*/      bl call_3896
/*0x63b8*/      ldr r0, [pc, #0x50] /* data_640c */
/*0x63ba*/      movs r2, #2
/*0x63bc*/      movs r1, #4
/*0x63be*/      .short 0x1dc0 /* adds r0, r0, #7 */ 
/*0x63c0*/      bl call_3896
/*0x63c4*/      ldr r0, [pc, #0x48] /* data_6410 */
/*0x63c6*/      ldr r0, [r0]
/*0x63c8*/      ldr r1, [pc, #0x48] /* data_6414 */
/*0x63ca*/      ldr r6, [pc, #0x4c] /* data_6418 */
/*0x63cc*/      udiv r4, r0, r1
/*0x63d0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x63d2*/      strh.w r4, [sp]
/*0x63d6*/      strh.w r5, [sp, #2]
/*0x63da*/      mov r1, sp
/*0x63dc*/      mov r0, r6
/*0x63de*/      bl call_4630
/*0x63e2*/      strb.w r5, [sp]
/*0x63e6*/      movs r0, #7
/*0x63e8*/      strh.w r0, [sp, #2]
/*0x63ec*/      movs r0, #1
/*0x63ee*/      strb.w r0, [sp, #4]
/*0x63f2*/      strb.w r5, [sp, #5]
/*0x63f6*/      lsrs r0, r4, #1
/*0x63f8*/      strh.w r0, [sp, #6]
/*0x63fc*/      mov r1, sp
/*0x63fe*/      mov r0, r6
/*0x6400*/      bl call_45d8
/*0x6404*/      pop {r1, r2, r3, r4, r5, r6, r7, pc}

/*0x6406*/  .byte 0x00
/*0x6407*/  .byte 0x00

            data_6408:
/*0x6408*/  .word 0x40077000
            data_640c:
/*0x640c*/  .word 0x00007cf9 /* possible pointer */
            data_6410:
/*0x6410*/  .word 0x20000004
            data_6414:
/*0x6414*/  .word 0x00dbba00
            data_6418:
/*0x6418*/  .word 0x4006f000

            jump_641c:
/*0x641c*/      push {r4, lr}
/*0x641e*/      ldr r4, [pc, #0x40] /* data_6460 */
/*0x6420*/      movs r1, #0
/*0x6422*/      mov r0, r4
/*0x6424*/      bl call_374a
/*0x6428*/      movs r1, #0
/*0x642a*/      mov r0, r4
/*0x642c*/      bl call_3736
/*0x6430*/      mov r0, r4
/*0x6432*/      bl call_3728
/*0x6436*/      ldr r1, [pc, #0x2c] /* data_6464 */
/*0x6438*/      asrs r0, r4, #0x14
/*0x643a*/      str.w r0, [r1, #0x180]
/*0x643e*/      movs r1, #0
/*0x6440*/      ldr r0, [pc, #0x24] /* data_6468 */
/*0x6442*/      bl call_45c4
/*0x6446*/      ldr r1, [pc, #0x24] /* data_646c */
/*0x6448*/      movs r0, #2
/*0x644a*/      str r0, [r1, #0x28]
/*0x644c*/      ldr r1, [pc, #0x20] /* data_6470 */
/*0x644e*/      str r0, [r1, #0x24]
/*0x6450*/      movs r2, #0
/*0x6452*/      pop.w {r4, lr}
/*0x6456*/      movs r1, #4
/*0x6458*/      ldr r0, [pc, #0x18] /* data_6474 */
/*0x645a*/      b.w call_3896

/*0x645e*/  .byte 0x00
/*0x645f*/  .byte 0x00

            data_6460:
/*0x6460*/  .word 0x40077000
            data_6464:
/*0x6464*/  .word 0xe000e004
            data_6468:
/*0x6468*/  .word 0x4006f000
            data_646c:
/*0x646c*/  .word 0x400b4000
            data_6470:
/*0x6470*/  .word 0x400b2000
            data_6474:
/*0x6474*/  .word 0x00007d1c /* possible pointer */


            .thumb_func
            call_6478:
/*0x6478*/      push {r4, lr}
/*0x647a*/      ldr r0, [pc, #0x78] /* data_64f4 */
/*0x647c*/      movs r4, #2
/*0x647e*/      str r4, [r0, #0x24]
/*0x6480*/      movs r2, #1
/*0x6482*/      movs r1, #4
/*0x6484*/      ldr r0, [pc, #0x70] /* data_64f8 */
/*0x6486*/      bl call_3896
/*0x648a*/      movs r0, #0xa
/*0x648c*/      bl call_3794
/*0x6490*/      ldr r0, [pc, #0x68] /* data_64fc */
/*0x6492*/      str r4, [r0, #0x24]
/*0x6494*/      mov.w r1, #0x300
/*0x6498*/      ldr r0, [pc, #0x64] /* data_6500 */
/*0x649a*/      bl call_35be
/*0x649e*/      ldr r1, [pc, #0x64] /* data_6504 */
/*0x64a0*/      movs r0, #0
/*0x64a2*/      strb r0, [r1, #1]
/*0x64a4*/      movs r0, #0x64
/*0x64a6*/      bl call_3794
/*0x64aa*/      ldr r1, [pc, #0x5c] /* data_6508 */
/*0x64ac*/      movs r0, #0xff
/*0x64ae*/      strb r0, [r1]
/*0x64b0*/      bl call_651c
/*0x64b4*/      movs r0, #2
/*0x64b6*/      bl call_6f4c
/*0x64ba*/      ldr r1, [pc, #0x50] /* data_650c */
/*0x64bc*/      lsls r0, r4, #0xe
/*0x64be*/      str r0, [r1, #0x24]
/*0x64c0*/      movs r1, #1
/*0x64c2*/      ldr r0, [pc, #0x4c] /* data_6510 */
/*0x64c4*/      bl call_45c4
/*0x64c8*/      ldr r4, [pc, #0x48] /* data_6514 */
/*0x64ca*/      movs r1, #0
/*0x64cc*/      mov r0, r4
/*0x64ce*/      bl call_3762
/*0x64d2*/      mov r0, r4
/*0x64d4*/      bl call_3728
/*0x64d8*/      movs r1, #1
/*0x64da*/      mov r0, r4
/*0x64dc*/      bl call_3736
/*0x64e0*/      movs r1, #1
/*0x64e2*/      mov r0, r4
/*0x64e4*/      bl call_374a
/*0x64e8*/      ldr r1, [pc, #0x2c] /* data_6518 */
/*0x64ea*/      asrs r0, r4, #0x14
/*0x64ec*/      str.w r0, [r1, #0x100]
/*0x64f0*/      pop {r4, pc}

/*0x64f2*/  .byte 0x00
/*0x64f3*/  .byte 0x00

            data_64f4:
/*0x64f4*/  .word 0x400b2000
            data_64f8:
/*0x64f8*/  .word 0x00007d1c /* possible pointer */
            data_64fc:
/*0x64fc*/  .word 0x400b4000
            data_6500:
/*0x6500*/  .word 0x20000446
            data_6504:
/*0x6504*/  .word 0x20000324
            data_6508:
/*0x6508*/  .word 0x20000008
            data_650c:
/*0x650c*/  .word 0x400b0000
            data_6510:
/*0x6510*/  .word 0x4006f000
            data_6514:
/*0x6514*/  .word 0x40077000
            data_6518:
/*0x6518*/  .word 0xe000e004


            .thumb_func
            call_651c:
/*0x651c*/      push.w {r4, r5, r6, r7, r8, sb, sl, lr}
/*0x6520*/      ldr r1, [pc, #0xbc] /* data_65e0 */
/*0x6522*/      ldr r6, [pc, #0xc0] /* data_65e4 */
/*0x6524*/      mov.w r8, #0x8000
/*0x6528*/      ldrb r0, [r1]
/*0x652a*/      mov.w r7, #0x100
/*0x652e*/      mov.w sl, #0x4000
/*0x6532*/      cbz r0, jump_6580
/*0x6534*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6536*/      uxtb r0, r0
/*0x6538*/      strb r0, [r1]
/*0x653a*/      bics r0, r0, #0xc
/*0x653e*/      bne jump_6580
/*0x6540*/      movs r0, #0x12
/*0x6542*/      bl call_6f4c
/*0x6546*/      mov.w r4, #0x300
/*0x654a*/      movs r1, #0xa
/*0x654c*/      mov r0, r4
/*0x654e*/      bl call_6f7c
/*0x6552*/      movs r1, #0xa
/*0x6554*/      mov r0, r4
/*0x6556*/      bl call_6f7c
/*0x655a*/      movs r1, #2
/*0x655c*/      movs r0, #0
/*0x655e*/      bl call_6f7c
/*0x6562*/      str.w sl, [r6, #0x28]
/*0x6566*/      mov r4, r8
/*0x6568*/      str.w r8, [r6, #0x24]
/*0x656c*/      movs r1, #8
/*0x656e*/      mov.w r0, #0xc00
/*0x6572*/      bl call_6f7c
/*0x6576*/      str r7, [r6, #0x24]
/*0x6578*/      str r4, [r6, #0x28]
/*0x657a*/      nop 
/*0x657c*/      nop 
/*0x657e*/      str r4, [r6, #0x24]
            jump_6580:
/*0x6580*/      ldr r0, [pc, #0x64] /* data_65e8 */
/*0x6582*/      ldr r1, [pc, #0x68] /* data_65ec */
/*0x6584*/      movs r4, #0x10
/*0x6586*/      ldrb r0, [r0, #1]
/*0x6588*/      mov sb, r7
/*0x658a*/      add.w r0, r0, r0, lsl #1
/*0x658e*/      add.w r5, r1, r0, lsl #5
/*0x6592*/      adds r5, #0x5e
/*0x6594*/      b jump_65d2
            jump_6596:
/*0x6596*/      str.w r8, [r6, #0x28]
/*0x659a*/      ldrh r0, [r5]
/*0x659c*/      subs r7, r5, #2
/*0x659e*/      movs r1, #0xa
/*0x65a0*/      bl call_6f7c
/*0x65a4*/      ldrh r0, [r7]
/*0x65a6*/      movs r1, #0xa
/*0x65a8*/      bl call_6f7c
/*0x65ac*/      ldrh r0, [r5, #-0x4]
/*0x65b0*/      movs r1, #9
/*0x65b2*/      ubfx r7, r0, #6, #1
/*0x65b6*/      .short 0x1fad /* subs r5, r5, #6 */ 
/*0x65b8*/      bl call_6f7c
/*0x65bc*/      mov r0, sl
/*0x65be*/      str.w sl, [r6, #0x28]
/*0x65c2*/      str.w r8, [r6, #0x24]
/*0x65c6*/      mov r1, sb
/*0x65c8*/      cbz r7, jump_65ce
/*0x65ca*/      str r1, [r6, #0x24]
/*0x65cc*/      b jump_65d0
            jump_65ce:
/*0x65ce*/      str r1, [r6, #0x28]
            jump_65d0:
/*0x65d0*/      str r0, [r6, #0x24]
            jump_65d2:
/*0x65d2*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x65d4*/      uxtb r4, r4
/*0x65d6*/      bhs jump_6596
/*0x65d8*/      str.w sb, [r6, #0x24]
/*0x65dc*/      pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

            data_65e0:
/*0x65e0*/  .word 0x20000008
            data_65e4:
/*0x65e4*/  .word 0x400b0000
            data_65e8:
/*0x65e8*/  .word 0x20000324
            data_65ec:
/*0x65ec*/  .word 0x20000446


            .thumb_func
            call_65f0:
/*0x65f0*/      push {r4, r5, lr}
/*0x65f2*/      ldrd r4, r3, [r1, #0x14]
/*0x65f6*/      cbz r4, jump_6632
/*0x65f8*/      mov.w r2, #0x200
/*0x65fc*/      lsrs r2, r3
/*0x65fe*/      orrs r2, r4
            jump_6600:
/*0x6600*/      ldr r4, [r1, #8]
/*0x6602*/      ldr r3, [r1]
/*0x6604*/      orrs r3, r4
/*0x6606*/      ldrd r4, r5, [r1, #0xc]
/*0x660a*/      orrs r4, r5
/*0x660c*/      orrs r3, r4
/*0x660e*/      ldr r4, [r1, #0x1c]
/*0x6610*/      orrs r3, r4
/*0x6612*/      orrs r3, r2
/*0x6614*/      str r3, [r0, #4]
/*0x6616*/      ldr r3, [r1, #0x24]
/*0x6618*/      ldr r2, [r1, #4]
/*0x661a*/      orrs r2, r3
/*0x661c*/      ldr r3, [r1, #0x20]
/*0x661e*/      orr.w r2, r2, r3, lsl #4
/*0x6622*/      str r2, [r0, #0x18]
/*0x6624*/      ldr r1, [r1, #0x28]
/*0x6626*/      mov.w r2, #-1
/*0x662a*/      add.w r1, r2, r1, lsr #1
/*0x662e*/      str r1, [r0, #0xc]
/*0x6630*/      pop {r4, r5, pc}
            jump_6632:
/*0x6632*/      mov.w r2, #0x100
/*0x6636*/      lsls r2, r3
/*0x6638*/      b jump_6600

/*0x663a*/  .byte 0x00
/*0x663b*/  .byte 0x00


            .thumb_func
            call_663c:
/*0x663c*/      ldr r0, [pc, #0x50] /* data_6690 */
/*0x663e*/      movs r1, #1
/*0x6640*/      str.w r1, [r0, #0x300]
/*0x6644*/      ldr r2, [pc, #0x4c] /* data_6694 */
/*0x6646*/      str.w r1, [r2, #0xa8]
            jump_664a:
/*0x664a*/      ldr.w r3, [r2, #0x108]
/*0x664e*/      cmp r3, #0
/*0x6650*/      beq jump_664a
/*0x6652*/      movs r3, #0
/*0x6654*/      str r3, [r2, #0x20]
/*0x6656*/      mov.w r3, #0x9000000
/*0x665a*/      str r3, [r0, #0x18]
/*0x665c*/      str.w r1, [r2, #0xa4]
            jump_6660:
/*0x6660*/      ldr.w r3, [r2, #0x104]
/*0x6664*/      cmp r3, #0
/*0x6666*/      beq jump_6660
/*0x6668*/      ldr r2, [pc, #0x2c] /* data_6698 */
/*0x666a*/      ldr.w r3, [r2, #0x200]
/*0x666e*/      bic r3, r3, #7
/*0x6672*/      .short 0x1cdb /* adds r3, r3, #3 */ 
/*0x6674*/      str.w r3, [r2, #0x200]
/*0x6678*/      str r1, [r0, #0x20]
/*0x667a*/      ldr r2, [r0, #4]
/*0x667c*/      bic r2, r2, #3
/*0x6680*/      .short 0x1c52 /* adds r2, r2, #1 */ 
/*0x6682*/      str r2, [r0, #4]
            jump_6684:
/*0x6684*/      ldr r2, [r0, #0x34]
/*0x6686*/      cmp.w r1, r2, lsr #30
/*0x668a*/      bne jump_6684
/*0x668c*/      bx lr

/*0x668e*/  .byte 0x00
/*0x668f*/  .byte 0x00

            data_6690:
/*0x6690*/  .word 0x40088000
            data_6694:
/*0x6694*/  .word 0x43100000
            data_6698:
/*0x6698*/  .word 0x40080000


            .thumb_func
            call_669c:
/*0x669c*/      ldr r0, [pc, #0x18] /* data_66b8 */
/*0x669e*/      movs r1, #0
/*0x66a0*/      add.w r2, r0, #0xc
/*0x66a4*/      str r1, [r0, #0x18]
/*0x66a6*/      str r1, [r0, #0x1c]
/*0x66a8*/      strb r1, [r2, #1]
/*0x66aa*/      str.w r1, [r0, #0x11]
/*0x66ae*/      movs r1, #0x1d
/*0x66b0*/      adds r0, #0x22
/*0x66b2*/      b.w call_35be

/*0x66b6*/  .byte 0x00
/*0x66b7*/  .byte 0x00

            data_66b8:
/*0x66b8*/  .word 0x20000810


            .thumb_func
            usb_intr:
/*0x66bc*/      push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
/*0x66c0*/      movs r0, #0
/*0x66c2*/      bl call_3a80
/*0x66c6*/      mov r5, r0
/*0x66c8*/      ldr.w r8, [pc, #0x1b8] /* data_6884 */
/*0x66cc*/      ldr r6, [pc, #0x1b8] /* data_6888 */
/*0x66ce*/      lsls r0, r0, #0x1b
/*0x66d0*/      bpl jump_66f0
/*0x66d2*/      movs r0, #0x10
/*0x66d4*/      str r0, [r6, #8]
/*0x66d6*/      ldrb.w r1, [r8, #0x15]
/*0x66da*/      mov r0, r8
/*0x66dc*/      cmp r1, #2
/*0x66de*/      blo jump_66f0
/*0x66e0*/      ldr r1, [r6]
/*0x66e2*/      orr r1, r1, #0xc
/*0x66e6*/      str r1, [r6]
/*0x66e8*/      ldrb r1, [r0, #0x15]
/*0x66ea*/      strb r1, [r0, #0x16]
/*0x66ec*/      movs r1, #3
/*0x66ee*/      strb r1, [r0, #0x15]
            jump_66f0:
/*0x66f0*/      ldr.w sl, [pc, #0x190] /* data_6884 */
/*0x66f4*/      lsls r0, r5, #0x1d
/*0x66f6*/      mov.w fp, #4
/*0x66fa*/      mov.w sb, #0
/*0x66fe*/      sub.w sl, sl, #0x40
/*0x6702*/      bpl jump_6748
/*0x6704*/      ldr r0, [pc, #0x17c] /* data_6884 */
/*0x6706*/      mov r1, sb
/*0x6708*/      mov r4, fp
/*0x670a*/      strb.w sb, [r0, #0x12]
/*0x670e*/      strb.w sb, [r0, #0x14]
/*0x6712*/      ldrb r2, [r0, #0x17]
/*0x6714*/      bic r2, r2, #2
/*0x6718*/      strb r2, [r0, #0x17]
/*0x671a*/      strb.w fp, [r0, #0x15]
/*0x671e*/      strb.w sb, [r0, #0x18]
/*0x6722*/      movs r0, #0x20
/*0x6724*/      movs r3, #1
/*0x6726*/      mov r2, r1
/*0x6728*/      bl call_607c
/*0x672c*/      bl call_3aa4
/*0x6730*/      movs r0, #0
/*0x6732*/      bl call_6c24
/*0x6736*/      movw r0, #0x111d
/*0x673a*/      str r0, [r6, #4]
/*0x673c*/      bl call_73a8
/*0x6740*/      movs r0, #2
/*0x6742*/      strb.w r0, [sl, #6]
/*0x6746*/      str r4, [r6, #8]
            jump_6748:
/*0x6748*/      lsls r0, r5, #0x1c
/*0x674a*/      bpl jump_675c
/*0x674c*/      bl call_3aa4
/*0x6750*/      ldrb.w r1, [r8, #0x16]
/*0x6754*/      strb.w r1, [r8, #0x15]
/*0x6758*/      movs r0, #8
/*0x675a*/      str r0, [r6, #8]
            jump_675c:
/*0x675c*/      lsls r0, r5, #0x17
/*0x675e*/      bpl jump_6834
/*0x6760*/      movs r0, #1
/*0x6762*/      bl call_3a80
/*0x6766*/      mov r7, r0
/*0x6768*/      lsls r0, r0, #0x16
/*0x676a*/      bpl jump_67b4
/*0x676c*/      ldr r1, [pc, #0x11c] /* data_688c */
/*0x676e*/      ldr r4, [pc, #0x114] /* data_6884 */
/*0x6770*/      ldr r2, [r1]
/*0x6772*/      str.w r2, [r8]
/*0x6776*/      ldr r1, [r1, #4]
/*0x6778*/      str.w r1, [r8, #4]
/*0x677c*/      strb.w sb, [r4, #0x12]
/*0x6780*/      strh.w sb, [r4, #0x10]
/*0x6784*/      ldrb r0, [r4]
/*0x6786*/      ands r0, r0, #0x60
/*0x678a*/      beq jump_6792
/*0x678c*/      cmp r0, #0x20
/*0x678e*/      bne jump_67a0
/*0x6790*/      b jump_679a
            jump_6792:
/*0x6792*/      mov r0, r4
/*0x6794*/      bl call_74fc
/*0x6798*/      b jump_67a0
            jump_679a:
/*0x679a*/      mov r0, r4
/*0x679c*/      bl call_72c0
            jump_67a0:
/*0x67a0*/      ldrb r0, [r4, #0x12]
/*0x67a2*/      cmp r0, #1
/*0x67a4*/      beq jump_67c6
/*0x67a6*/      cmp r0, #2
/*0x67a8*/      beq jump_67d8
/*0x67aa*/      str.w fp, [r6, #0x14]
            jump_67ae:
/*0x67ae*/      mov.w r0, #0x200
/*0x67b2*/      str r0, [r6, #0x1c]
            jump_67b4:
/*0x67b4*/      lsls r0, r7, #0x1e
/*0x67b6*/      bpl jump_6818
/*0x67b8*/      movs r0, #2
/*0x67ba*/      str r0, [r6, #0x1c]
/*0x67bc*/      ldrb.w r0, [r8, #0x12]
/*0x67c0*/      cmp r0, #2
/*0x67c2*/      beq jump_67e4
/*0x67c4*/      b jump_6818
            jump_67c6:
/*0x67c6*/      ldrh r1, [r4, #0x10]
/*0x67c8*/      ldrh r0, [r4, #6]
/*0x67ca*/      cmp r1, r0
/*0x67cc*/      bls jump_67d0
/*0x67ce*/      strh r0, [r4, #0x10]
            jump_67d0:
/*0x67d0*/      mov r0, r4
/*0x67d2*/      bl call_73c4
/*0x67d6*/      b jump_67ae
            jump_67d8:
/*0x67d8*/      movs r2, #0
/*0x67da*/      mov r1, r2
/*0x67dc*/      mov r0, r2
/*0x67de*/      bl call_3a4c
/*0x67e2*/      b jump_67ae
            jump_67e4:
/*0x67e4*/      ldr r4, [pc, #0x9c] /* data_6884 */
/*0x67e6*/      movs r0, #0
/*0x67e8*/      ldrh r2, [r4, #0x10]
/*0x67ea*/      ldr r1, [r4, #8]
/*0x67ec*/      bl call_39ec
/*0x67f0*/      ldr r1, [r4, #8]
/*0x67f2*/      add r1, r0
/*0x67f4*/      str r1, [r4, #8]
/*0x67f6*/      ldrh r1, [r4, #0x10]
/*0x67f8*/      subs r0, r1, r0
/*0x67fa*/      lsls r0, r0, #0x10
/*0x67fc*/      lsrs r0, r0, #0x10
/*0x67fe*/      strh r0, [r4, #0x10]
/*0x6800*/      bne jump_6818
/*0x6802*/      strb.w sb, [r4, #0x12]
/*0x6806*/      ldrb r0, [r4, #0x13]
/*0x6808*/      cbnz r0, jump_6818
/*0x680a*/      ldrb r1, [r4, #0xc]
/*0x680c*/      strb.w r1, [sl, #8]
/*0x6810*/      sub.w r1, r4, #0x3c
/*0x6814*/      movs r0, #1
/*0x6816*/      strb r0, [r1]
            jump_6818:
/*0x6818*/      lsls r0, r7, #0x1b
/*0x681a*/      bpl jump_682e
/*0x681c*/      ldrb.w r0, [r8, #0x12]
/*0x6820*/      cmp r0, #1
/*0x6822*/      bne jump_682a
/*0x6824*/      ldr r0, [pc, #0x5c] /* data_6884 */
/*0x6826*/      bl call_73c4
            jump_682a:
/*0x682a*/      movs r0, #0x10
/*0x682c*/      str r0, [r6, #0x1c]
            jump_682e:
/*0x682e*/      mov.w r0, #0x100
/*0x6832*/      str r0, [r6, #8]
            jump_6834:
/*0x6834*/      movs r4, #1
/*0x6836*/      mov r8, r4
/*0x6838*/      mov.w fp, #0x12
/*0x683c*/      mov sb, r6
/*0x683e*/      lsls r7, r4, #8
            jump_6840:
/*0x6840*/      lsl.w r6, r7, r4
/*0x6844*/      tst r6, r5
/*0x6846*/      beq jump_6876
/*0x6848*/      adds r0, r4, #1
/*0x684a*/      uxtb r0, r0
/*0x684c*/      bl call_3a80
/*0x6850*/      tst.w r0, #0x12
/*0x6854*/      beq jump_6872
/*0x6856*/      ldr r0, [pc, #0x30] /* data_6888 */
/*0x6858*/      adds r1, r4, #1
/*0x685a*/      adds r0, #8
/*0x685c*/      bl call_3a98
/*0x6860*/      str.w fp, [r0]
/*0x6864*/      ldrb.w r2, [sl, #7]
/*0x6868*/      lsl.w r0, r8, r4
/*0x686c*/      orrs r0, r2
/*0x686e*/      strb.w r0, [sl, #7]
            jump_6872:
/*0x6872*/      str.w r6, [sb, #8]
            jump_6876:
/*0x6876*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x6878*/      uxtb r4, r4
/*0x687a*/      cmp r4, #8
/*0x687c*/      blo jump_6840
/*0x687e*/      pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

/*0x6882*/  .byte 0x00
/*0x6883*/  .byte 0x00

            data_6884:
/*0x6884*/  .word 0x20000850
            data_6888:
/*0x6888*/  .word 0x400a8000
            data_688c:
/*0x688c*/  .word 0x400aa000


            .thumb_func
            call_6890:
/*0x6890*/      push {r4, lr}
/*0x6892*/      bl call_73a8
/*0x6896*/      ldr r1, [pc, #0xc] /* data_68a4 */
/*0x6898*/      movs r0, #0
/*0x689a*/      strb r0, [r1, #6]
/*0x689c*/      movs r0, #2
/*0x689e*/      adds r1, #0x40
/*0x68a0*/      strb r0, [r1, #0x15]
/*0x68a2*/      pop {r4, pc}

            data_68a4:
/*0x68a4*/  .word 0x20000810


            .thumb_func
            call_68a8:
/*0x68a8*/      push {r4, r5, r6, lr}
/*0x68aa*/      ldr r4, [pc, #0x70] /* data_691c */
/*0x68ac*/      ldrb r0, [r4, #0x15]
/*0x68ae*/      cmp r0, #3
/*0x68b0*/      bne jump_68b6
/*0x68b2*/      bl call_76e0
            jump_68b6:
/*0x68b6*/      ldr r5, [pc, #0x64] /* data_691c */
/*0x68b8*/      subs r5, #0x40
/*0x68ba*/      movs r6, #1
/*0x68bc*/      ldrb r0, [r5, #6]
/*0x68be*/      cbz r0, jump_68ee
/*0x68c0*/      cmp r0, #1
/*0x68c2*/      beq jump_68e0
/*0x68c4*/      cmp r0, #2
/*0x68c6*/      beq jump_68da
/*0x68c8*/      cmp r0, #3
/*0x68ca*/      bne jump_6916
/*0x68cc*/      ldrb r0, [r4, #0x15]
/*0x68ce*/      cmp r0, #6
/*0x68d0*/      bne jump_68d6
/*0x68d2*/      bl call_7418
            jump_68d6:
/*0x68d6*/      movs r0, #2
/*0x68d8*/      pop {r4, r5, r6, pc}
            jump_68da:
/*0x68da*/      strb r6, [r5, #6]
/*0x68dc*/      movs r0, #3
/*0x68de*/      pop {r4, r5, r6, pc}
            jump_68e0:
/*0x68e0*/      ldrb r0, [r4, #0x15]
/*0x68e2*/      cmp r0, #6
/*0x68e4*/      bne jump_6916
/*0x68e6*/      movs r0, #3
/*0x68e8*/      strb r0, [r5, #6]
/*0x68ea*/      movs r0, #1
/*0x68ec*/      pop {r4, r5, r6, pc}
            jump_68ee:
/*0x68ee*/      ldr r1, [pc, #0x30] /* data_6920 */
/*0x68f0*/      mov.w r0, #0x200000
/*0x68f4*/      str.w r0, [r1, #0x100]
/*0x68f8*/      movs r1, #0
/*0x68fa*/      asrs r0, r0, #0xb
/*0x68fc*/      movs r2, #0x40
/*0x68fe*/      movs r3, #1
/*0x6900*/      bl call_3b30
/*0x6904*/      movs r0, #2
/*0x6906*/      bl call_3b54
/*0x690a*/      ldrb r0, [r4, #0x17]
/*0x690c*/      ubfx r0, r0, #0, #1
/*0x6910*/      bl call_3ab4
/*0x6914*/      strb r6, [r5, #6]
            jump_6916:
/*0x6916*/      movs r0, #0
/*0x6918*/      pop {r4, r5, r6, pc}

/*0x691a*/  .byte 0x00
/*0x691b*/  .byte 0x00

            data_691c:
/*0x691c*/  .word 0x20000850
            data_6920:
/*0x6920*/  .word 0xe000e004


            .thumb_func
            call_6924:
/*0x6924*/      push {r2, r3, r4, r5, r6, lr}
/*0x6926*/      movs r0, #5
/*0x6928*/      ldr r4, [pc, #0x18] /* data_6944 */
/*0x692a*/      strh.w r0, [sp]
/*0x692e*/      movs r5, #0x40
/*0x6930*/      str r5, [r4, #0x28]
/*0x6932*/      movs r2, #2
/*0x6934*/      add r1, sp, #4
/*0x6936*/      mov r0, sp
/*0x6938*/      bl call_6a7c
/*0x693c*/      str r5, [r4, #0x24]
/*0x693e*/      ldrb.w r0, [sp, #5]
/*0x6942*/      pop {r2, r3, r4, r5, r6, pc}

            data_6944:
/*0x6944*/  .word 0x400b2000


            .thumb_func
            call_6948:
/*0x6948*/      push {r4, lr}
/*0x694a*/      bl call_6924
/*0x694e*/      ubfx r0, r0, #0, #1
/*0x6952*/      pop {r4, pc}

            .thumb_func
            call_6954:
/*0x6954*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x6958*/      mov r7, r2
/*0x695a*/      mov r4, r1
/*0x695c*/      mov r8, r0
/*0x695e*/      bl call_6b3c
/*0x6962*/      ldr r6, [pc, #0x34] /* data_6998 */
/*0x6964*/      movs r5, #0x40
/*0x6966*/      str r5, [r6, #0x28]
/*0x6968*/      movs r0, #2
/*0x696a*/      strb.w r0, [sp]
/*0x696e*/      lsrs r0, r4, #0x10
/*0x6970*/      strb.w r0, [sp, #1]
/*0x6974*/      lsrs r0, r4, #8
/*0x6976*/      strb.w r0, [sp, #2]
/*0x697a*/      strb.w r4, [sp, #3]
/*0x697e*/      movs r2, #4
/*0x6980*/      movs r1, #0
/*0x6982*/      mov r0, sp
/*0x6984*/      bl call_6a7c
/*0x6988*/      mov r2, r7
/*0x698a*/      movs r1, #0
/*0x698c*/      mov r0, r8
/*0x698e*/      bl call_6a7c
/*0x6992*/      str r5, [r6, #0x24]
/*0x6994*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

            data_6998:
/*0x6998*/  .word 0x400b2000


            .thumb_func
            call_699c:
/*0x699c*/      push {r3, r4, r5, r6, r7, lr}
/*0x699e*/      mov r4, r0
/*0x69a0*/      bl call_6b3c
/*0x69a4*/      ldr r6, [pc, #0x28] /* data_69d0 */
/*0x69a6*/      movs r5, #0x40
/*0x69a8*/      str r5, [r6, #0x28]
/*0x69aa*/      movs r0, #0x20
/*0x69ac*/      strb.w r0, [sp]
/*0x69b0*/      lsrs r0, r4, #0x10
/*0x69b2*/      strb.w r0, [sp, #1]
/*0x69b6*/      lsrs r0, r4, #8
/*0x69b8*/      strb.w r0, [sp, #2]
/*0x69bc*/      strb.w r4, [sp, #3]
/*0x69c0*/      movs r2, #4
/*0x69c2*/      movs r1, #0
/*0x69c4*/      mov r0, sp
/*0x69c6*/      bl call_6a7c
/*0x69ca*/      str r5, [r6, #0x24]
/*0x69cc*/      pop {r3, r4, r5, r6, r7, pc}

/*0x69ce*/  .byte 0x00
/*0x69cf*/  .byte 0x00

            data_69d0:
/*0x69d0*/  .word 0x400b2000


            .thumb_func
            call_69d4:
/*0x69d4*/      push {r3, r4, r5, r6, r7, lr}
/*0x69d6*/      mov r6, r0
/*0x69d8*/      bl call_6b3c
/*0x69dc*/      ldr r4, [pc, #0x1c] /* data_69fc */
/*0x69de*/      movs r5, #0x40
/*0x69e0*/      str r5, [r4, #0x28]
/*0x69e2*/      movs r0, #1
/*0x69e4*/      strb.w r0, [sp]
/*0x69e8*/      strb.w r6, [sp, #1]
/*0x69ec*/      movs r2, #2
/*0x69ee*/      movs r1, #0
/*0x69f0*/      mov r0, sp
/*0x69f2*/      bl call_6a7c
/*0x69f6*/      str r5, [r4, #0x24]
/*0x69f8*/      pop {r3, r4, r5, r6, r7, pc}

/*0x69fa*/  .byte 0x00
/*0x69fb*/  .byte 0x00

            data_69fc:
/*0x69fc*/  .word 0x400b2000


            .thumb_func
            call_6a00:
/*0x6a00*/      push {r4, lr}
/*0x6a02*/      movs r4, #0x3c
/*0x6a04*/      bl call_6954
/*0x6a08*/      b jump_6a16
            jump_6a0a:
/*0x6a0a*/      movs r0, #0x64
/*0x6a0c*/      bl call_3794
/*0x6a10*/      bl call_6948
/*0x6a14*/      cbz r0, jump_6a1e
            jump_6a16:
/*0x6a16*/      mov r0, r4
/*0x6a18*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6a1a*/      bhs jump_6a0a
/*0x6a1c*/      pop {r4, pc}
            jump_6a1e:
/*0x6a1e*/      movs r0, #1
/*0x6a20*/      pop {r4, pc}

/*0x6a22*/  .byte 0x00
/*0x6a23*/  .byte 0x00


            .thumb_func
            call_6a24:
/*0x6a24*/      push {r3, r4, r5, lr}
/*0x6a26*/      movs r0, #0xb9
/*0x6a28*/      ldr r4, [pc, #0x1c] /* data_6a48 */
/*0x6a2a*/      strb.w r0, [sp]
/*0x6a2e*/      movs r5, #0x40
/*0x6a30*/      str r5, [r4, #0x28]
/*0x6a32*/      movs r2, #1
/*0x6a34*/      movs r1, #0
/*0x6a36*/      mov r0, sp
/*0x6a38*/      bl call_6a7c
/*0x6a3c*/      str r5, [r4, #0x24]
/*0x6a3e*/      movs r0, #0xa
/*0x6a40*/      bl call_3794
/*0x6a44*/      pop {r3, r4, r5, pc}

/*0x6a46*/  .byte 0x00
/*0x6a47*/  .byte 0x00

            data_6a48:
/*0x6a48*/  .word 0x400b2000


            .thumb_func
            call_6a4c:
/*0x6a4c*/      push {r2, r3, r4, r5, r6, lr}
/*0x6a4e*/      ldr r4, [pc, #0x28] /* data_6a78 */
/*0x6a50*/      movs r5, #0x40
/*0x6a52*/      str r5, [r4, #0x28]
/*0x6a54*/      movs r0, #0x9f
/*0x6a56*/      strb.w r0, [sp, #4]
/*0x6a5a*/      movs r0, #0
/*0x6a5c*/      mov r1, r0
/*0x6a5e*/      str r0, [sp]
/*0x6a60*/      movs r2, #1
/*0x6a62*/      add r0, sp, #4
/*0x6a64*/      bl call_6a7c
/*0x6a68*/      movs r2, #3
/*0x6a6a*/      mov r1, sp
/*0x6a6c*/      movs r0, #0
/*0x6a6e*/      bl call_6a7c
/*0x6a72*/      str r5, [r4, #0x24]
/*0x6a74*/      ldr r0, [sp]
/*0x6a76*/      pop {r2, r3, r4, r5, r6, pc}

            data_6a78:
/*0x6a78*/  .word 0x400b2000


            .thumb_func
            call_6a7c:
/*0x6a7c*/      push {r4, r5, r6, r7, lr}
/*0x6a7e*/      movs r3, #0
/*0x6a80*/      cmp r2, #8
/*0x6a82*/      bls jump_6a88
/*0x6a84*/      movs r4, #8
/*0x6a86*/      b jump_6a8a
            jump_6a88:
/*0x6a88*/      mov r4, r2
            jump_6a8a:
/*0x6a8a*/      movs r5, #0
/*0x6a8c*/      mov r7, r5
/*0x6a8e*/      ldr r6, [pc, #0x58] /* data_6ae8 */
/*0x6a90*/      b jump_6a9e
            jump_6a92:
/*0x6a92*/      cbz r0, jump_6aa4
/*0x6a94*/      ldrb.w ip, [r0, r5]
/*0x6a98*/      str.w ip, [r6, #0x10]
            jump_6a9c:
/*0x6a9c*/      .short 0x1c6d /* adds r5, r5, #1 */ 
            jump_6a9e:
/*0x6a9e*/      cmp r5, r4
/*0x6aa0*/      blo jump_6a92
/*0x6aa2*/      b jump_6ac6
            jump_6aa4:
/*0x6aa4*/      str r7, [r6, #0x10]
/*0x6aa6*/      b jump_6a9c
            jump_6aa8:
/*0x6aa8*/      ldr r5, [r6, #0x1c]
/*0x6aaa*/      tst.w r5, #0xf0
/*0x6aae*/      beq jump_6aa8
/*0x6ab0*/      ldr r5, [r6, #0x10]
/*0x6ab2*/      uxtb r5, r5
/*0x6ab4*/      cbz r0, jump_6acc
/*0x6ab6*/      ldrb.w ip, [r0, r4]
/*0x6aba*/      str.w ip, [r6, #0x10]
            jump_6abe:
/*0x6abe*/      .short 0x1c64 /* adds r4, r4, #1 */ 
/*0x6ac0*/      cbz r1, jump_6ac4
/*0x6ac2*/      strb r5, [r1, r3]
            jump_6ac4:
/*0x6ac4*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_6ac6:
/*0x6ac6*/      cmp r4, r2
/*0x6ac8*/      blo jump_6aa8
/*0x6aca*/      b jump_6ae2
            jump_6acc:
/*0x6acc*/      str r7, [r6, #0x10]
/*0x6ace*/      b jump_6abe
            jump_6ad0:
/*0x6ad0*/      ldr r0, [r6, #0x1c]
/*0x6ad2*/      tst.w r0, #0xf0
/*0x6ad6*/      beq jump_6ad0
/*0x6ad8*/      ldr r0, [r6, #0x10]
/*0x6ada*/      uxtb r0, r0
/*0x6adc*/      cbz r1, jump_6ae0
/*0x6ade*/      strb r0, [r1, r3]
            jump_6ae0:
/*0x6ae0*/      .short 0x1c5b /* adds r3, r3, #1 */ 
            jump_6ae2:
/*0x6ae2*/      cmp r3, r2
/*0x6ae4*/      blo jump_6ad0
/*0x6ae6*/      pop {r4, r5, r6, r7, pc}

            data_6ae8:
/*0x6ae8*/  .word 0x40044000


            .thumb_func
            call_6aec:
/*0x6aec*/      push {r4, r5, r6, lr}
/*0x6aee*/      movw r4, #0x12d
/*0x6af2*/      bl call_699c
/*0x6af6*/      mov.w r5, #0x3e8
/*0x6afa*/      b jump_6b08
            jump_6afc:
/*0x6afc*/      mov r0, r5
/*0x6afe*/      bl call_3794
/*0x6b02*/      bl call_6948
/*0x6b06*/      cbz r0, jump_6b10
            jump_6b08:
/*0x6b08*/      mov r0, r4
/*0x6b0a*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6b0c*/      bhs jump_6afc
/*0x6b0e*/      pop {r4, r5, r6, pc}
            jump_6b10:
/*0x6b10*/      movs r0, #1
/*0x6b12*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_6b14:
/*0x6b14*/      push {r3, r4, r5, lr}
/*0x6b16*/      movs r0, #0xab
/*0x6b18*/      ldr r4, [pc, #0x1c] /* data_6b38 */
/*0x6b1a*/      strb.w r0, [sp]
/*0x6b1e*/      movs r5, #0x40
/*0x6b20*/      str r5, [r4, #0x28]
/*0x6b22*/      movs r2, #1
/*0x6b24*/      movs r1, #0
/*0x6b26*/      mov r0, sp
/*0x6b28*/      bl call_6a7c
/*0x6b2c*/      str r5, [r4, #0x24]
/*0x6b2e*/      movs r0, #0xa
/*0x6b30*/      bl call_3794
/*0x6b34*/      pop {r3, r4, r5, pc}

/*0x6b36*/  .byte 0x00
/*0x6b37*/  .byte 0x00

            data_6b38:
/*0x6b38*/  .word 0x400b2000


            .thumb_func
            call_6b3c:
/*0x6b3c*/      push {r3, r4, r5, lr}
/*0x6b3e*/      movs r0, #6
/*0x6b40*/      ldr r4, [pc, #0x14] /* data_6b58 */
/*0x6b42*/      strb.w r0, [sp]
/*0x6b46*/      movs r5, #0x40
/*0x6b48*/      str r5, [r4, #0x28]
/*0x6b4a*/      movs r2, #1
/*0x6b4c*/      movs r1, #0
/*0x6b4e*/      mov r0, sp
/*0x6b50*/      bl call_6a7c
/*0x6b54*/      str r5, [r4, #0x24]
/*0x6b56*/      pop {r3, r4, r5, pc}

            data_6b58:
/*0x6b58*/  .word 0x400b2000

            jump_6b5c:
/*0x6b5c*/      push {r4, lr}
/*0x6b5e*/      mov.w r4, #0x19a
/*0x6b62*/      bl call_69d4
/*0x6b66*/      b jump_6b74
            jump_6b68:
/*0x6b68*/      movs r0, #0x64
/*0x6b6a*/      bl call_3794
/*0x6b6e*/      bl call_6948
/*0x6b72*/      cbz r0, jump_6b7c
            jump_6b74:
/*0x6b74*/      mov r0, r4
/*0x6b76*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6b78*/      bhs jump_6b68
/*0x6b7a*/      pop {r4, pc}
            jump_6b7c:
/*0x6b7c*/      movs r0, #1
/*0x6b7e*/      pop {r4, pc}

            .thumb_func
            call_6b80:
/*0x6b80*/      push {r4, lr}
/*0x6b82*/      cmp r1, #1
/*0x6b84*/      bne jump_6bac
/*0x6b86*/      cmp r0, #0x1f
/*0x6b88*/      beq jump_6bac
/*0x6b8a*/      bgt jump_6b9e
/*0x6b8c*/      cmp r0, #0xb
/*0x6b8e*/      beq jump_6bac
/*0x6b90*/      cmp r0, #0xc
/*0x6b92*/      beq jump_6bac
/*0x6b94*/      cmp r0, #0xd
/*0x6b96*/      beq jump_6bac
/*0x6b98*/      cmp r0, #0x1e
/*0x6b9a*/      bne jump_6baa
/*0x6b9c*/      b jump_6bac
            jump_6b9e:
/*0x6b9e*/      cmp r0, #0x2d
/*0x6ba0*/      beq jump_6bac
/*0x6ba2*/      cmp r0, #0x2e
/*0x6ba4*/      beq jump_6bac
/*0x6ba6*/      cmp r0, #0x2f
/*0x6ba8*/      beq jump_6bac
            jump_6baa:
/*0x6baa*/      movs r1, #0
            jump_6bac:
/*0x6bac*/      ldr r3, [pc, #0x18] /* data_6bc8 */
/*0x6bae*/      lsrs r2, r0, #3
/*0x6bb0*/      add.w r2, r3, r2, lsl #2
/*0x6bb4*/      lsls r0, r0, #0x1d
/*0x6bb6*/      ldr r3, [r2]
/*0x6bb8*/      lsrs r0, r0, #0x1b
/*0x6bba*/      movs r4, #0xf
/*0x6bbc*/      lsls r4, r0
/*0x6bbe*/      bics r3, r4
/*0x6bc0*/      lsls r1, r0
/*0x6bc2*/      orrs r3, r1
/*0x6bc4*/      str r3, [r2]
/*0x6bc6*/      pop {r4, pc}

            data_6bc8:
/*0x6bc8*/  .word 0x40022020


            .thumb_func
            call_6bcc:
/*0x6bcc*/      push {r4, lr}
/*0x6bce*/      mvns r3, r1
/*0x6bd0*/      lsls r4, r2, #0x1f
/*0x6bd2*/      ldr r4, [r0, #8]
/*0x6bd4*/      beq jump_6bda
/*0x6bd6*/      orrs r4, r1
/*0x6bd8*/      b jump_6bdc
            jump_6bda:
/*0x6bda*/      ands r4, r3
            jump_6bdc:
/*0x6bdc*/      str r4, [r0, #8]
/*0x6bde*/      lsls r2, r2, #0x1e
/*0x6be0*/      bpl jump_6bea
/*0x6be2*/      ldr r2, [r0, #0xc]
/*0x6be4*/      orrs r2, r1
/*0x6be6*/      str r2, [r0, #0xc]
/*0x6be8*/      pop {r4, pc}
            jump_6bea:
/*0x6bea*/      ldr r1, [r0, #0xc]
/*0x6bec*/      ands r1, r3
/*0x6bee*/      str r1, [r0, #0xc]
/*0x6bf0*/      pop {r4, pc}

            .thumb_func
            call_6bf2:
/*0x6bf2*/      push {r4, r5, r6, lr}
/*0x6bf4*/      movs r5, #0x80
            jump_6bf6:
/*0x6bf6*/      lsls r4, r4, #4
/*0x6bf8*/      lsls r3, r3, #4
/*0x6bfa*/      tst r2, r5
/*0x6bfc*/      beq jump_6c02
/*0x6bfe*/      add r4, r1
/*0x6c00*/      b jump_6c04
            jump_6c02:
/*0x6c02*/      adds r3, #0xf
            jump_6c04:
/*0x6c04*/      lsrs r5, r5, #1
/*0x6c06*/      bne jump_6bf6
/*0x6c08*/      ldr r1, [r0]
/*0x6c0a*/      ands r1, r3
/*0x6c0c*/      orrs r1, r4
/*0x6c0e*/      str r1, [r0]
/*0x6c10*/      pop {r4, r5, r6, pc}

            .thumb_func
            call_6c12:
/*0x6c12*/      .short 0x1cd2 /* adds r2, r2, #3 */ 
/*0x6c14*/      lsrs r2, r2, #2
/*0x6c16*/      b jump_6c1c
            jump_6c18:
/*0x6c18*/      ldm r1!, {r3}
/*0x6c1a*/      stm r0!, {r3}
            jump_6c1c:
/*0x6c1c*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6c1e*/      bhs jump_6c18
/*0x6c20*/      bx lr

/*0x6c22*/  .byte 0x00
/*0x6c23*/  .byte 0x00


            .thumb_func
            call_6c24:
/*0x6c24*/      push {r4, lr}
/*0x6c26*/      mov r4, r0
/*0x6c28*/      adds r1, r0, #1
/*0x6c2a*/      ldr r0, [pc, #0x24] /* data_6c50 */
/*0x6c2c*/      bl call_3a98
/*0x6c30*/      ldr r1, [pc, #0x20] /* data_6c54 */
/*0x6c32*/      ldr.w r2, [r1, r4, lsl #3]
/*0x6c36*/      str r2, [r0, #0x10]
/*0x6c38*/      add.w r1, r1, r4, lsl #3
/*0x6c3c*/      ldr r1, [r1, #4]
/*0x6c3e*/      str r1, [r0, #4]
/*0x6c40*/      mov.w r1, #-1
/*0x6c44*/      str r1, [r0, #8]
/*0x6c46*/      ldr r1, [r0]
/*0x6c48*/      and r1, r1, #0x19
/*0x6c4c*/      str r1, [r0]
/*0x6c4e*/      pop {r4, pc}

            data_6c50:
/*0x6c50*/  .word 0x400a8000
            data_6c54:
/*0x6c54*/  .word 0x00007fc4 /* possible pointer */

            jump_6c58:
/*0x6c58*/      ldr r0, [pc, #0x18] /* data_6c74 */
/*0x6c5a*/      push {r4, lr}
/*0x6c5c*/      ldrb r0, [r0, #2]
/*0x6c5e*/      bl call_43b8
/*0x6c62*/      ldr r1, [pc, #0x14] /* data_6c78 */
/*0x6c64*/      movs r0, #0
/*0x6c66*/      str r0, [r1, #4]
/*0x6c68*/      ldr r1, [pc, #0x10] /* data_6c7c */
/*0x6c6a*/      strb r0, [r1, #5]
/*0x6c6c*/      movs r0, #1
/*0x6c6e*/      strb r0, [r1]
/*0x6c70*/      pop {r4, pc}

/*0x6c72*/  .byte 0x00
/*0x6c73*/  .byte 0x00

            data_6c74:
/*0x6c74*/  .word 0x20000870
            data_6c78:
/*0x6c78*/  .word 0x2000004c
            data_6c7c:
/*0x6c7c*/  .word 0x20000790

            jump_6c80:
/*0x6c80*/      push {r4, r5, r6, lr}
/*0x6c82*/      mov r6, r0
/*0x6c84*/      mov r5, r2
/*0x6c86*/      mov r4, r1
/*0x6c88*/      mov r0, r1
/*0x6c8a*/      bl call_6aec
/*0x6c8e*/      mov r2, r5
/*0x6c90*/      mov r1, r4
/*0x6c92*/      mov r0, r6
/*0x6c94*/      pop.w {r4, r5, r6, lr}
/*0x6c98*/      b.w jump_4120

            .thumb_func
            call_6c9c:
/*0x6c9c*/      push {r4, r5, r6, lr}
/*0x6c9e*/      ldr r0, [pc, #0x48] /* data_6ce8 */
/*0x6ca0*/      ldr r0, [r0]
/*0x6ca2*/      ldr r4, [r0, #4]
/*0x6ca4*/      ldrd r5, r3, [r0, #8]
/*0x6ca8*/      ldr r1, [r0]
/*0x6caa*/      mov r6, r4
/*0x6cac*/      eors r4, r5
/*0x6cae*/      bic r1, r1, #0x80000000
/*0x6cb2*/      eors r4, r1
/*0x6cb4*/      eor.w r2, r4, r4, lsl #1
/*0x6cb8*/      eor.w r1, r2, r3, lsr #1
/*0x6cbc*/      eors r1, r3
/*0x6cbe*/      eor.w r2, r2, r1, lsl #10
/*0x6cc2*/      strd r2, r1, [r0, #8]
/*0x6cc6*/      and r1, r1, #1
/*0x6cca*/      ldr r4, [pc, #0x1c] /* data_6ce8 */
/*0x6ccc*/      rsbs r1, r1, #0
/*0x6cce*/      strd r6, r5, [r0]
/*0x6cd2*/      .short 0x1d24 /* adds r4, r4, #4 */ 
/*0x6cd4*/      ldr r3, [r4]
/*0x6cd6*/      ands r3, r1
/*0x6cd8*/      eors r3, r5
/*0x6cda*/      str r3, [r0, #4]
/*0x6cdc*/      ldr r3, [r4, #4]
/*0x6cde*/      ands r1, r3
/*0x6ce0*/      eors r1, r2
/*0x6ce2*/      str r1, [r0, #8]
/*0x6ce4*/      pop {r4, r5, r6, pc}

/*0x6ce6*/  .byte 0x00
/*0x6ce7*/  .byte 0x00

            data_6ce8:
/*0x6ce8*/  .word 0x20000180


            .thumb_func
            call_6cec:
/*0x6cec*/      push {r4, r5, lr}
/*0x6cee*/      ldr r1, [pc, #0x24] /* data_6d14 */
/*0x6cf0*/      movs r0, #0xa
/*0x6cf2*/      ldr r2, [pc, #0x1c] /* data_6d10 */
/*0x6cf4*/      ldr r3, [pc, #0x20] /* data_6d18 */
/*0x6cf6*/      ldrb.w r1, [r1, #0x25]
/*0x6cfa*/      b jump_6d06
            jump_6cfc:
/*0x6cfc*/      ldrb r4, [r2, r0]
/*0x6cfe*/      muls r4, r1, r4
/*0x6d00*/      lsrs r4, r4, #3
/*0x6d02*/      adds r5, r3, r0
/*0x6d04*/      strb r4, [r5, #4]
            jump_6d06:
/*0x6d06*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6d08*/      uxtb r0, r0
/*0x6d0a*/      bhs jump_6cfc
/*0x6d0c*/      pop {r4, r5, pc}

/*0x6d0e*/  .byte 0x00
/*0x6d0f*/  .byte 0x00

            data_6d10:
/*0x6d10*/  .word 0x00007ba5 /* possible pointer */
            data_6d14:
/*0x6d14*/  .word 0x2000087c
            data_6d18:
/*0x6d18*/  .word 0x2000005c


            .thumb_func
            call_6d1c:
/*0x6d1c*/      push {r4, r5, r6, r7, lr}
/*0x6d1e*/      ldr r6, [pc, #0x194] /* data_6eb4 */
/*0x6d20*/      ldr r4, [pc, #0x194] /* data_6eb8 */
/*0x6d22*/      sub sp, #0x34
/*0x6d24*/      ldrb r0, [r6, #3]
/*0x6d26*/      cmp r0, #5
/*0x6d28*/      bhi jump_6dc6
/*0x6d2a*/      cmp r0, #6
/*0x6d2c*/      bhs jump_6d62
/*0x6d2e*/      tbb [pc, r0]

/*0x6d32*/  .byte 0x03 /* case switch_6d38 */
/*0x6d33*/  .byte 0x03 /* case switch_6d38 */
/*0x6d34*/  .byte 0x1d /* case switch_6d6c */
/*0x6d35*/  .byte 0x56 /* case switch_6dde */
/*0x6d36*/  .byte 0x43 /* case switch_6db8 */
/*0x6d37*/  .byte 0x43 /* case switch_6db8 */

            switch_6d38:
/*0x6d38*/      movs r5, #3
/*0x6d3a*/      ldr r7, [pc, #0x180] /* data_6ebc */
/*0x6d3c*/      b jump_6d5c
            jump_6d3e:
/*0x6d3e*/      ldrb r0, [r6, #3]
/*0x6d40*/      cbz r0, jump_6d66
/*0x6d42*/      adds r0, r4, r5
/*0x6d44*/      ldrb r0, [r0, #4]
            jump_6d46:
/*0x6d46*/      ldr r1, [r4]
/*0x6d48*/      ldrb r1, [r1, #3]
/*0x6d4a*/      muls r0, r1, r0
/*0x6d4c*/      lsrs r2, r0, #3
/*0x6d4e*/      add.w r0, r5, r5, lsl #1
/*0x6d52*/      add.w r0, r7, r0, lsl #5
/*0x6d56*/      movs r1, #0x60
/*0x6d58*/      bl call_35b0
            jump_6d5c:
/*0x6d5c*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6d5e*/      uxtb r5, r5
/*0x6d60*/      bhs jump_6d3e
            jump_6d62:
/*0x6d62*/      add sp, #0x34
/*0x6d64*/      pop {r4, r5, r6, r7, pc}
            jump_6d66:
/*0x6d66*/      ldr r0, [r4]
/*0x6d68*/      ldrb r0, [r0, r5]
/*0x6d6a*/      b jump_6d46
            switch_6d6c:
/*0x6d6c*/      ldrb r7, [r4, #4]
/*0x6d6e*/      movs r5, #0x11
/*0x6d70*/      mov r6, sp
/*0x6d72*/      b jump_6d90
            jump_6d74:
/*0x6d74*/      ldr r0, [r4]
/*0x6d76*/      ldrb r0, [r0, #3]
/*0x6d78*/      lsls r1, r0, #5
/*0x6d7a*/      sub.w r0, r1, r0, lsl #1
/*0x6d7e*/      uxtb r1, r0
/*0x6d80*/      add.w r0, r5, r5, lsl #1
/*0x6d84*/      adds r2, r0, r6
/*0x6d86*/      mov r0, r7
/*0x6d88*/      bl call_4426
/*0x6d8c*/      adds r7, #0x20
/*0x6d8e*/      uxtb r7, r7
            jump_6d90:
/*0x6d90*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6d92*/      uxtb r5, r5
/*0x6d94*/      bhs jump_6d74
/*0x6d96*/      ldr r5, [pc, #0x128] /* data_6ec0 */
/*0x6d98*/      movs r4, #0x60
/*0x6d9a*/      b jump_6db0
            jump_6d9c:
/*0x6d9c*/      ldrb r0, [r5]
/*0x6d9e*/      cmp r0, #0x11
/*0x6da0*/      bhs jump_6dae
/*0x6da2*/      add.w r0, r0, r0, lsl #1
/*0x6da6*/      adds r1, r0, r6
/*0x6da8*/      mov r0, r4
/*0x6daa*/      bl call_44cc
            jump_6dae:
/*0x6dae*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6db0:
/*0x6db0*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6db2*/      uxtb r4, r4
/*0x6db4*/      bhs jump_6d9c
/*0x6db6*/      b jump_6d62
            switch_6db8:
/*0x6db8*/      add sp, #0x34
/*0x6dba*/      .short 0x1f00 /* subs r0, r0, #4 */ 
/*0x6dbc*/      pop.w {r4, r5, r6, r7, lr}
/*0x6dc0*/      uxtb r0, r0
/*0x6dc2*/      b.w jump_3ba4
            jump_6dc6:
/*0x6dc6*/      cmp r0, #7
/*0x6dc8*/      bls jump_6d62
/*0x6dca*/      bic r0, r0, #1
/*0x6dce*/      cmp r0, #8
/*0x6dd0*/      beq switch_6dde
/*0x6dd2*/      cmp r0, #0xa
/*0x6dd4*/      beq jump_6dea
/*0x6dd6*/      cmp r0, #0xc
/*0x6dd8*/      bne jump_6d62
/*0x6dda*/      movs r5, #0x60
/*0x6ddc*/      b jump_6eaa
            switch_6dde:
/*0x6dde*/      add sp, #0x34
/*0x6de0*/      adds r0, r4, #4
/*0x6de2*/      pop.w {r4, r5, r6, r7, lr}
/*0x6de6*/      b.w jump_44a0
            jump_6dea:
/*0x6dea*/      movs r0, #0
/*0x6dec*/      movs r5, #0x11
/*0x6dee*/      str r0, [sp, #4]
/*0x6df0*/      b jump_6e48
            jump_6df2:
/*0x6df2*/      add.w r0, r5, r5, lsl #1
/*0x6df6*/      add.w r1, r4, r0, lsl #1
/*0x6dfa*/      ldrb r0, [r1, #4]!
/*0x6dfe*/      cbnz r0, jump_6e08
/*0x6e00*/      ldrb r0, [r1, #1]
/*0x6e02*/      cbnz r0, jump_6e08
/*0x6e04*/      ldrb r0, [r1, #2]
/*0x6e06*/      cbz r0, jump_6e34
            jump_6e08:
/*0x6e08*/      ldrb r0, [r1, #3]
/*0x6e0a*/      cbnz r0, jump_6e14
/*0x6e0c*/      ldrb r0, [r1, #4]
/*0x6e0e*/      cbnz r0, jump_6e14
/*0x6e10*/      ldrb r0, [r1, #5]
/*0x6e12*/      cbz r0, jump_6e30
            jump_6e14:
/*0x6e14*/      movs r2, #3
/*0x6e16*/      mov r6, sp
/*0x6e18*/      b jump_6e28
            jump_6e1a:
/*0x6e1a*/      adds r3, r1, r2
/*0x6e1c*/      ldrb r0, [r1, r2]
/*0x6e1e*/      ldrb r3, [r3, #3]
/*0x6e20*/      cmp r0, r3
/*0x6e22*/      bhi jump_6e26
/*0x6e24*/      mov r0, r3
            jump_6e26:
/*0x6e26*/      strb r0, [r6, r2]
            jump_6e28:
/*0x6e28*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6e2a*/      uxtb r2, r2
/*0x6e2c*/      bhs jump_6e1a
/*0x6e2e*/      mov r1, r6
            jump_6e30:
/*0x6e30*/      mov r0, r5
/*0x6e32*/      b jump_6e44
            jump_6e34:
/*0x6e34*/      ldrb r0, [r1, #3]
/*0x6e36*/      cbnz r0, jump_6e40
/*0x6e38*/      ldrb r0, [r1, #4]
/*0x6e3a*/      cbnz r0, jump_6e40
/*0x6e3c*/      ldrb r0, [r1, #5]
/*0x6e3e*/      cbz r0, jump_6e50
            jump_6e40:
/*0x6e40*/      mov r0, r5
/*0x6e42*/      .short 0x1cc9 /* adds r1, r1, #3 */ 
            jump_6e44:
/*0x6e44*/      bl call_6ec4
            jump_6e48:
/*0x6e48*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6e4a*/      uxtb r5, r5
/*0x6e4c*/      bhs jump_6df2
/*0x6e4e*/      b jump_6d62
            jump_6e50:
/*0x6e50*/      add r1, sp, #4
/*0x6e52*/      b jump_6e30
            jump_6e54:
/*0x6e54*/      ldr r0, [pc, #0x68] /* data_6ec0 */
/*0x6e56*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6e58*/      ldrb r1, [r0, r5]
/*0x6e5a*/      and r0, r1, #7
/*0x6e5e*/      add.w r0, r0, r0, lsl #2
/*0x6e62*/      add r0, r4
/*0x6e64*/      ldrsb.w r2, [r0, #0x12]
/*0x6e68*/      adds r0, #0xe
/*0x6e6a*/      cbz r2, jump_6ea2
/*0x6e6c*/      ldrb r3, [r0, #3]
/*0x6e6e*/      rsbs r1, r3, r1, lsr #3
/*0x6e72*/      bpl jump_6e76
/*0x6e74*/      rsbs r1, r1, #0
            jump_6e76:
/*0x6e76*/      subs r1, r1, r2
/*0x6e78*/      adds r1, #0xa
/*0x6e7a*/      uxtb r2, r1
/*0x6e7c*/      cmp r2, #0xa
/*0x6e7e*/      bhs jump_6ea2
/*0x6e80*/      movs r1, #3
/*0x6e82*/      mov r3, sp
/*0x6e84*/      adds r6, r4, r2
/*0x6e86*/      b jump_6e92
            jump_6e88:
/*0x6e88*/      ldrb r2, [r0, r1]
/*0x6e8a*/      ldrb r7, [r6, #4]
/*0x6e8c*/      muls r2, r7, r2
/*0x6e8e*/      lsrs r2, r2, #8
/*0x6e90*/      strb r2, [r3, r1]
            jump_6e92:
/*0x6e92*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6e94*/      uxtb r1, r1
/*0x6e96*/      bhs jump_6e88
/*0x6e98*/      mov r1, r3
/*0x6e9a*/      mov r0, r5
/*0x6e9c*/      bl call_44cc
/*0x6ea0*/      b jump_6eaa
            jump_6ea2:
/*0x6ea2*/      movs r1, #0
/*0x6ea4*/      mov r0, r5
/*0x6ea6*/      bl call_4510
            jump_6eaa:
/*0x6eaa*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x6eac*/      uxtb r5, r5
/*0x6eae*/      bhs jump_6e54
/*0x6eb0*/      b jump_6d62

/*0x6eb2*/  .byte 0x00
/*0x6eb3*/  .byte 0x00

            data_6eb4:
/*0x6eb4*/  .word 0x2000087c
            data_6eb8:
/*0x6eb8*/  .word 0x2000005c
            data_6ebc:
/*0x6ebc*/  .word 0x20000326
            data_6ec0:
/*0x6ec0*/  .word 0x00007b44 /* possible pointer */


            .thumb_func
            call_6ec4:
/*0x6ec4*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x6ec8*/      mov r7, r1
/*0x6eca*/      mov r6, r0
/*0x6ecc*/      movs r4, #0x60
/*0x6ece*/      ldr r5, [pc, #0x1c] /* data_6eec */
/*0x6ed0*/      b jump_6ee2
            jump_6ed2:
/*0x6ed2*/      ldrb r0, [r5]
/*0x6ed4*/      cmp r0, r6
/*0x6ed6*/      bne jump_6ee0
/*0x6ed8*/      mov r1, r7
/*0x6eda*/      mov r0, r4
/*0x6edc*/      bl call_44cc
            jump_6ee0:
/*0x6ee0*/      .short 0x1e6d /* subs r5, r5, #1 */ 
            jump_6ee2:
/*0x6ee2*/      .short 0x1e64 /* subs r4, r4, #1 */ 
/*0x6ee4*/      uxtb r4, r4
/*0x6ee6*/      bhs jump_6ed2
/*0x6ee8*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_6eec:
/*0x6eec*/  .word 0x00007b44 /* possible pointer */


            .thumb_func
            call_6ef0:
/*0x6ef0*/      push {r3, r4, r5, lr}
/*0x6ef2*/      mov r4, r0
/*0x6ef4*/      ldr r0, [pc, #0x24] /* data_6f1c */
/*0x6ef6*/      ldr r0, [r0]
/*0x6ef8*/      ldrb r5, [r0, #3]
/*0x6efa*/      cbnz r1, jump_6f04
/*0x6efc*/      mov r0, sp
/*0x6efe*/      bl call_43fa
/*0x6f02*/      mov r1, sp
            jump_6f04:
/*0x6f04*/      movs r2, #3
/*0x6f06*/      b jump_6f14
            jump_6f08:
/*0x6f08*/      ldrb r0, [r1], #1
/*0x6f0c*/      muls r0, r5, r0
/*0x6f0e*/      lsrs r0, r0, #3
/*0x6f10*/      strb r0, [r4], #1
            jump_6f14:
/*0x6f14*/      .short 0x1e52 /* subs r2, r2, #1 */ 
/*0x6f16*/      uxtb r2, r2
/*0x6f18*/      bhs jump_6f08
/*0x6f1a*/      pop {r3, r4, r5, pc}

            data_6f1c:
/*0x6f1c*/  .word 0x2000005c


            .thumb_func
            call_6f20:
/*0x6f20*/      ldr r1, [pc, #0x24] /* data_6f48 */
/*0x6f22*/      ldr r0, [r1]
/*0x6f24*/      cbz r0, jump_6f44
/*0x6f26*/      cmp.w r0, #0x8000
/*0x6f2a*/      bhs jump_6f30
/*0x6f2c*/      uxth r0, r0
/*0x6f2e*/      b jump_6f3e
            jump_6f30:
/*0x6f30*/      lsrs r0, r0, #0xa
/*0x6f32*/      beq jump_6f3a
/*0x6f34*/      and r0, r0, #0x8000
/*0x6f38*/      b jump_6f3e
            jump_6f3a:
/*0x6f3a*/      movw r0, #0x8001
            jump_6f3e:
/*0x6f3e*/      movs r2, #0x1e
/*0x6f40*/      str r2, [r1]
/*0x6f42*/      bx lr
            jump_6f44:
/*0x6f44*/      movs r0, #0x1e
/*0x6f46*/      bx lr

            data_6f48:
/*0x6f48*/  .word 0x20001b7c


            .thumb_func
            call_6f4c:
/*0x6f4c*/      push {r4, lr}
/*0x6f4e*/      ldr r1, [pc, #0x28] /* data_6f78 */
/*0x6f50*/      mov.w r4, #0x8000
/*0x6f54*/      str r4, [r1, #0x28]
/*0x6f56*/      nop 
/*0x6f58*/      nop 
/*0x6f5a*/      str r4, [r1, #0x24]
/*0x6f5c*/      mov.w r2, #0x4000
/*0x6f60*/      b jump_6f6c
            jump_6f62:
/*0x6f62*/      str r2, [r1, #0x28]
/*0x6f64*/      nop 
/*0x6f66*/      nop 
/*0x6f68*/      str r2, [r1, #0x24]
/*0x6f6a*/      nop 
            jump_6f6c:
/*0x6f6c*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x6f6e*/      uxtb r0, r0
/*0x6f70*/      bhs jump_6f62
/*0x6f72*/      str r4, [r1, #0x28]
/*0x6f74*/      pop {r4, pc}

/*0x6f76*/  .byte 0x00
/*0x6f77*/  .byte 0x00

            data_6f78:
/*0x6f78*/  .word 0x400b0000


            .thumb_func
            call_6f7c:
/*0x6f7c*/      push {r4, r5, r6, lr}
/*0x6f7e*/      mov.w r4, #0x100
/*0x6f82*/      lsls r3, r4, #6
/*0x6f84*/      ldr r2, [pc, #0x20] /* data_6fa8 */
/*0x6f86*/      movw r5, #0xffff
/*0x6f8a*/      b jump_6fa0
            jump_6f8c:
/*0x6f8c*/      nop 
/*0x6f8e*/      str r3, [r2, #0x28]
/*0x6f90*/      lsls r6, r0, #0x10
/*0x6f92*/      bpl jump_6f98
/*0x6f94*/      str r4, [r2, #0x24]
/*0x6f96*/      b jump_6f9a
            jump_6f98:
/*0x6f98*/      str r4, [r2, #0x28]
            jump_6f9a:
/*0x6f9a*/      str r3, [r2, #0x24]
/*0x6f9c*/      and.w r0, r5, r0, lsl #1
            jump_6fa0:
/*0x6fa0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6fa2*/      uxtb r1, r1
/*0x6fa4*/      bhs jump_6f8c
/*0x6fa6*/      pop {r4, r5, r6, pc}

            data_6fa8:
/*0x6fa8*/  .word 0x400b0000


            .thumb_func
            call_6fac:
/*0x6fac*/      push {r4, lr}
/*0x6fae*/      ldr r2, [pc, #0x3c] /* data_6fec */
/*0x6fb0*/      ldr r1, [pc, #0x3c] /* data_6ff0 */
/*0x6fb2*/      ldrb.w r0, [r2, #0x2f5]
/*0x6fb6*/      ldrb r3, [r1, #2]
/*0x6fb8*/      ldrb r1, [r1, #1]
/*0x6fba*/      add.w r0, r0, r0, lsl #1
/*0x6fbe*/      lsls r0, r0, #0x1b
/*0x6fc0*/      and r1, r1, #1
/*0x6fc4*/      lsrs r0, r0, #0x18
/*0x6fc6*/      add.w r4, r3, r1, lsl #8
/*0x6fca*/      movs r1, #0x18
/*0x6fcc*/      b jump_6fe0
            jump_6fce:
/*0x6fce*/      add.w r3, r2, r0, lsl #1
/*0x6fd2*/      ldrh r3, [r3, #0x28]
/*0x6fd4*/      ubfx r3, r3, #0, #0xa
/*0x6fd8*/      cmp r3, r4
/*0x6fda*/      beq jump_6fe8
/*0x6fdc*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x6fde*/      uxtb r0, r0
            jump_6fe0:
/*0x6fe0*/      .short 0x1e49 /* subs r1, r1, #1 */ 
/*0x6fe2*/      uxtb r1, r1
/*0x6fe4*/      bhs jump_6fce
/*0x6fe6*/      movs r0, #0x60
            jump_6fe8:
/*0x6fe8*/      pop {r4, pc}

/*0x6fea*/  .byte 0x00
/*0x6feb*/  .byte 0x00

            data_6fec:
/*0x6fec*/  .word 0x2000087c
            data_6ff0:
/*0x6ff0*/  .word 0x2000079c


            .thumb_func
            call_6ff4:
/*0x6ff4*/      ldr r0, [pc, #0xc] /* data_7004 */
/*0x6ff6*/      movs r1, #0
/*0x6ff8*/      str r1, [r0, #0xb]!
/*0x6ffc*/      str r1, [r0, #4]
/*0x6ffe*/      strh r1, [r0, #8]
/*0x7000*/      strb r1, [r0, #0xa]
/*0x7002*/      bx lr

            data_7004:
/*0x7004*/  .word 0x20000194


            .thumb_func
            call_7008:
/*0x7008*/      push {r4, r5, r6, lr}
/*0x700a*/      ldr r4, [pc, #0x64] /* data_7070 */
/*0x700c*/      ldr r1, [pc, #0x64] /* data_7074 */
/*0x700e*/      movs r0, #0x60
/*0x7010*/      strb r0, [r4, #7]
/*0x7012*/      ldrb r0, [r1, #1]
/*0x7014*/      lsls r0, r0, #0x1f
/*0x7016*/      beq jump_7026
/*0x7018*/      ldrb r0, [r1, #2]
/*0x701a*/      movs r1, #0
/*0x701c*/      bl call_4754
/*0x7020*/      cmp r0, #0
/*0x7022*/      beq jump_706e
/*0x7024*/      b jump_703a
            jump_7026:
/*0x7026*/      movs r0, #2
/*0x7028*/      ldr r2, [pc, #0x4c] /* data_7078 */
/*0x702a*/      ldrb r1, [r1]
/*0x702c*/      b jump_7034
            jump_702e:
/*0x702e*/      ldrb r3, [r2, r0]
/*0x7030*/      cmp r1, r3
/*0x7032*/      beq jump_706e
            jump_7034:
/*0x7034*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7036*/      uxtb r0, r0
/*0x7038*/      bhs jump_702e
            jump_703a:
/*0x703a*/      bl call_5d34
/*0x703e*/      cmp r0, #0
/*0x7040*/      bne jump_706e
/*0x7042*/      ldr r2, [pc, #0x38] /* data_707c */
/*0x7044*/      ldr r3, [pc, #0x38] /* data_7080 */
/*0x7046*/      ldrb.w r0, [r2, #0x2f5]
/*0x704a*/      add.w r0, r0, r0, lsl #1
/*0x704e*/      lsls r0, r0, #3
/*0x7050*/      strb r0, [r4, #7]
/*0x7052*/      movs r0, #0x18
/*0x7054*/      b jump_7068
            jump_7056:
/*0x7056*/      ldrb r1, [r4, #7]
/*0x7058*/      add.w r5, r2, r1, lsl #1
/*0x705c*/      ldrh r5, [r5, #0x28]
/*0x705e*/      cmp.w r3, r5, lsl #22
/*0x7062*/      beq jump_706e
/*0x7064*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x7066*/      strb r1, [r4, #7]
            jump_7068:
/*0x7068*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x706a*/      uxtb r0, r0
/*0x706c*/      bhs jump_7056
            jump_706e:
/*0x706e*/      pop {r4, r5, r6, pc}

            data_7070:
/*0x7070*/  .word 0x20001b7c
            data_7074:
/*0x7074*/  .word 0x2000079c
            data_7078:
/*0x7078*/  .word 0x00007a8b /* possible pointer */
            data_707c:
/*0x707c*/  .word 0x2000087c
            data_7080:
/*0x7080*/  .word 0xffc00000

            jump_7084:
/*0x7084*/      push.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x7088*/      ldr.w r8, [pc, #0xe0] /* data_716c */
/*0x708c*/      ldr r6, [pc, #0xe0] /* data_7170 */
/*0x708e*/      movs r7, #0
/*0x7090*/      mov r5, r8
/*0x7092*/      b jump_7162
            jump_7094:
/*0x7094*/      ldrh.w r0, [r8]
/*0x7098*/      mov r1, r8
/*0x709a*/      cmp r0, #0xff
/*0x709c*/      bhi jump_70ae
/*0x709e*/      ldr r2, [r6]
/*0x70a0*/      add.w r0, r2, r0, lsl #2
/*0x70a4*/      movs r2, #7
/*0x70a6*/      ldrb r0, [r0, #1]
/*0x70a8*/      cmp.w r2, r0, lsr #5
/*0x70ac*/      bne jump_70ba
            jump_70ae:
/*0x70ae*/      ldr r0, [pc, #0xbc] /* data_716c */
/*0x70b0*/      adds r0, #8
/*0x70b2*/      ldrb r0, [r0, #9]
/*0x70b4*/      cmp r0, #1
/*0x70b6*/      beq jump_70ea
/*0x70b8*/      strh r7, [r1]
            jump_70ba:
/*0x70ba*/      ldrh r0, [r1]
/*0x70bc*/      ldr r2, [r6]
/*0x70be*/      movs r1, #4
/*0x70c0*/      add.w r4, r2, r0, lsl #2
/*0x70c4*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x70c6*/      strh.w r0, [r8]
/*0x70ca*/      ldrb r0, [r4, #1]
/*0x70cc*/      cmp.w r1, r0, lsr #5
/*0x70d0*/      beq jump_7156
/*0x70d2*/      str r7, [sp]
/*0x70d4*/      ldrh r0, [r4]
/*0x70d6*/      mov r1, sp
/*0x70d8*/      bl call_4a30
/*0x70dc*/      ldrb r0, [r4, #1]
/*0x70de*/      lsrs r0, r0, #5
/*0x70e0*/      cmp r0, #1
/*0x70e2*/      beq jump_70f2
/*0x70e4*/      cmp r0, #2
/*0x70e6*/      bne jump_7108
/*0x70e8*/      b jump_70fc
            jump_70ea:
/*0x70ea*/      pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
/*0x70ee*/      b.w call_5ca8
            jump_70f2:
/*0x70f2*/      ldrb.w r0, [sp, #3]
/*0x70f6*/      orr r0, r0, #2
/*0x70fa*/      b jump_7104
            jump_70fc:
/*0x70fc*/      ldrb.w r0, [sp, #3]
/*0x7100*/      bic r0, r0, #2
            jump_7104:
/*0x7104*/      strb.w r0, [sp, #3]
            jump_7108:
/*0x7108*/      ldrb.w r0, [sp, #1]
/*0x710c*/      lsls r0, r0, #0x1f
/*0x710e*/      ldrb.w r0, [sp]
/*0x7112*/      beq jump_711a
/*0x7114*/      bl call_4734
/*0x7118*/      b jump_711e
            jump_711a:
/*0x711a*/      ldr r1, [pc, #0x58] /* data_7174 */
/*0x711c*/      ldrb r0, [r1, r0]
            jump_711e:
/*0x711e*/      strb.w r0, [sp, #2]
/*0x7122*/      ldrb.w r0, [sp, #3]
/*0x7126*/      orr r2, r0, #5
/*0x712a*/      strb.w r2, [sp, #3]
/*0x712e*/      ldrb.w r0, [sp, #1]
/*0x7132*/      ldrb.w r1, [sp, #2]
/*0x7136*/      and r0, r0, #1
/*0x713a*/      add.w r3, r0, r0, lsl #1
/*0x713e*/      add.w r0, r3, r0, lsl #3
/*0x7142*/      add r0, r1
/*0x7144*/      uxtb r1, r0
/*0x7146*/      ubfx r2, r2, #1, #1
/*0x714a*/      ldr r0, [pc, #0x2c] /* data_7178 */
/*0x714c*/      bl call_43dc
/*0x7150*/      ldr r0, [sp]
/*0x7152*/      bl call_47e0
            jump_7156:
/*0x7156*/      ldrh r0, [r4, #2]
/*0x7158*/      lsls r1, r0, #0x10
/*0x715a*/      bpl jump_7160
/*0x715c*/      lsls r0, r0, #0x11
/*0x715e*/      lsrs r0, r0, #7
            jump_7160:
/*0x7160*/      str r0, [r5, #4]
            jump_7162:
/*0x7162*/      ldr r0, [r5, #4]
/*0x7164*/      cmp r0, #0
/*0x7166*/      beq jump_7094
/*0x7168*/      pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

            data_716c:
/*0x716c*/  .word 0x20001b74
            data_7170:
/*0x7170*/  .word 0x2000000c
            data_7174:
/*0x7174*/  .word 0x20000202
            data_7178:
/*0x7178*/  .word 0x2000019f


            .thumb_func
            call_717c:
/*0x717c*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x7180*/      ldr r4, [pc, #0xa0] /* data_7224 */
/*0x7182*/      ldr r5, [pc, #0xa4] /* data_7228 */
/*0x7184*/      ldr.w r8, [pc, #0xa4] /* data_722c */
/*0x7188*/      ldr r7, [pc, #0xa4] /* data_7230 */
/*0x718a*/      movs r6, #0xb
            jump_718c:
/*0x718c*/      ldrd r0, r1, [r5]
/*0x7190*/      str r1, [r0, #4]
/*0x7192*/      .short 0x1e76 /* subs r6, r6, #1 */ 
/*0x7194*/      uxtb r6, r6
/*0x7196*/      movs r0, #3
/*0x7198*/      .short 0x1ee4 /* subs r4, r4, #3 */ 
/*0x719a*/      bl call_3794
/*0x719e*/      ldr r1, [r7, #0x1c]
/*0x71a0*/      movs r0, #0xff
/*0x71a2*/      lsls r1, r1, #0x16
/*0x71a4*/      bmi jump_71a8
/*0x71a6*/      movs r0, #0xfe
            jump_71a8:
/*0x71a8*/      ldr.w r2, [r8, #0x1c]
/*0x71ac*/      mov r1, r8
/*0x71ae*/      lsls r2, r2, #0x1a
/*0x71b0*/      bmi jump_71b6
/*0x71b2*/      bic r0, r0, #2
            jump_71b6:
/*0x71b6*/      ldr r2, [r1, #0x1c]
/*0x71b8*/      lsls r2, r2, #0x19
/*0x71ba*/      bmi jump_71c0
/*0x71bc*/      bic r0, r0, #4
            jump_71c0:
/*0x71c0*/      ldr r1, [r1, #0x1c]
/*0x71c2*/      lsls r1, r1, #0x18
/*0x71c4*/      bmi jump_71ca
/*0x71c6*/      bic r0, r0, #8
            jump_71ca:
/*0x71ca*/      ldr r1, [r7, #0x1c]
/*0x71cc*/      lsls r1, r1, #0x14
/*0x71ce*/      bmi jump_71d4
/*0x71d0*/      bic r0, r0, #0x10
            jump_71d4:
/*0x71d4*/      ldr r1, [r7, #0x1c]
/*0x71d6*/      lsls r1, r1, #0x12
/*0x71d8*/      bmi jump_71de
/*0x71da*/      bic r0, r0, #0x20
            jump_71de:
/*0x71de*/      ldr r1, [r7, #0x1c]
/*0x71e0*/      lsls r1, r1, #0x11
/*0x71e2*/      bmi jump_71e8
/*0x71e4*/      bic r0, r0, #0x40
            jump_71e8:
/*0x71e8*/      ldr r1, [r7, #0x1c]
/*0x71ea*/      lsls r1, r1, #0x10
/*0x71ec*/      bmi jump_71f2
/*0x71ee*/      bic r0, r0, #0x80
            jump_71f2:
/*0x71f2*/      ldrd r1, r2, [r5]
/*0x71f6*/      str r2, [r1]
/*0x71f8*/      ldrb r1, [r4, #1]
/*0x71fa*/      cmp r1, r0
/*0x71fc*/      beq jump_7204
/*0x71fe*/      strb r0, [r4, #1]
/*0x7200*/      movs r0, #3
/*0x7202*/      b jump_7210
            jump_7204:
/*0x7204*/      ldrb r0, [r4]
/*0x7206*/      cbz r0, jump_7212
/*0x7208*/      cmp r0, #1
/*0x720a*/      bne jump_720e
/*0x720c*/      strb r1, [r4, #2]
            jump_720e:
/*0x720e*/      .short 0x1e40 /* subs r0, r0, #1 */ 
            jump_7210:
/*0x7210*/      strb r0, [r4]
            jump_7212:
/*0x7212*/      cmp r6, #0
/*0x7214*/      beq jump_7220
/*0x7216*/      movs r0, #5
/*0x7218*/      bl call_3794
/*0x721c*/      subs r5, #8
/*0x721e*/      b jump_718c
            jump_7220:
/*0x7220*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_7224:
/*0x7224*/  .word 0x20000323
            data_7228:
/*0x7228*/  .word 0x00007c88 /* possible pointer */
            data_722c:
/*0x722c*/  .word 0x400b0000
            data_7230:
/*0x7230*/  .word 0x400b4000


            .thumb_func
            call_7234:
/*0x7234*/      push {r4, r5, r6, r7, lr}
/*0x7236*/      ldr r5, [pc, #0x7c] /* data_72b4 */
/*0x7238*/      sub sp, #0x44
/*0x723a*/      ubfx r2, r0, #0xc, #8
/*0x723e*/      ubfx r3, r0, #0, #0xc
/*0x7242*/      movs r4, #4
/*0x7244*/      cbz r2, jump_7258
/*0x7246*/      cmp r2, #1
/*0x7248*/      beq jump_7256
/*0x724a*/      cmp r2, #2
/*0x724c*/      beq jump_7254
/*0x724e*/      cmp r2, #3
/*0x7250*/      bne jump_726c
/*0x7252*/      adds r3, #0x20
            jump_7254:
/*0x7254*/      adds r3, #0x19
            jump_7256:
/*0x7256*/      adds r3, #0x12
            jump_7258:
/*0x7258*/      ldr r6, [pc, #0x5c] /* data_72b8 */
/*0x725a*/      movs r0, #0
            jump_725c:
/*0x725c*/      ldrb r2, [r6, r0]
/*0x725e*/      cmp r2, r3
/*0x7260*/      bhi jump_7272
/*0x7262*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7264*/      subs r3, r3, r2
/*0x7266*/      uxtb r0, r0
/*0x7268*/      cmp r0, #4
/*0x726a*/      bne jump_725c
            jump_726c:
/*0x726c*/      str r4, [r5, #0x14]
            jump_726e:
/*0x726e*/      add sp, #0x44
/*0x7270*/      pop {r4, r5, r6, r7, pc}
            jump_7272:
/*0x7272*/      ldr r2, [pc, #0x48] /* data_72bc */
/*0x7274*/      mov r4, sp
/*0x7276*/      mov r5, r1
/*0x7278*/      ldr.w r7, [r2, r0, lsl #2]
/*0x727c*/      add r3, r7
/*0x727e*/      b jump_72a4
            jump_7280:
/*0x7280*/      ldr.w r7, [r2, r0, lsl #2]
/*0x7284*/      ldrb.w ip, [r6, r0]
/*0x7288*/      add r7, ip
/*0x728a*/      b jump_7298
            jump_728c:
/*0x728c*/      ldrb ip, [r3], #1
/*0x7290*/      strb ip, [r4], #1
/*0x7294*/      .short 0x1e6d /* subs r5, r5, #1 */ 
/*0x7296*/      beq jump_729c
            jump_7298:
/*0x7298*/      cmp r3, r7
/*0x729a*/      blo jump_728c
            jump_729c:
/*0x729c*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x729e*/      uxtb r0, r0
/*0x72a0*/      ldr.w r3, [r2, r0, lsl #2]
            jump_72a4:
/*0x72a4*/      cmp r5, #0
/*0x72a6*/      bne jump_7280
/*0x72a8*/      mov r2, r1
/*0x72aa*/      mov r1, sp
/*0x72ac*/      movs r0, #0
/*0x72ae*/      bl call_3a4c
/*0x72b2*/      b jump_726e

            data_72b4:
/*0x72b4*/  .word 0x400a8000
            data_72b8:
/*0x72b8*/  .word 0x00007fc0 /* possible pointer */
            data_72bc:
/*0x72bc*/  .word 0x00008110 /* possible pointer */


            .thumb_func
            call_72c0:
/*0x72c0*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x72c4*/      ldrh r1, [r0]
/*0x72c6*/      movw lr, #0x921
/*0x72ca*/      movs r4, #0
/*0x72cc*/      movs r3, #1
/*0x72ce*/      ldr r6, [pc, #0xd0] /* data_73a0 */
/*0x72d0*/      ldr r5, [pc, #0xd0] /* data_73a4 */
/*0x72d2*/      subw r2, r1, #0x921
/*0x72d6*/      mov.w r7, #0x100
/*0x72da*/      mov.w ip, #0x200
/*0x72de*/      cmp r1, lr
/*0x72e0*/      beq jump_735c
/*0x72e2*/      bgt jump_7304
/*0x72e4*/      adds.w r1, r2, #0x780
/*0x72e8*/      beq jump_7314
/*0x72ea*/      cmp r1, r7
/*0x72ec*/      beq jump_7350
/*0x72ee*/      cmp r1, ip
/*0x72f0*/      bne jump_7378
/*0x72f2*/      ldrh r1, [r0, #4]
/*0x72f4*/      cmp r1, #0
/*0x72f6*/      bne jump_7378
/*0x72f8*/      ldrb r1, [r5]
/*0x72fa*/      movs r2, #1
            jump_72fc:
/*0x72fc*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x7300*/      b.w jump_7406
            jump_7304:
/*0x7304*/      cmp r2, r7
/*0x7306*/      beq jump_737e
/*0x7308*/      cmp r2, ip
/*0x730a*/      bne jump_7378
/*0x730c*/      ldrh r2, [r0, #4]
/*0x730e*/      ldrb r1, [r0, #2]
/*0x7310*/      cbz r2, jump_737c
/*0x7312*/      b jump_739a
            jump_7314:
/*0x7314*/      ldrb r5, [r0, #3]
/*0x7316*/      ldrb r1, [r0, #2]
/*0x7318*/      ldrh r4, [r0, #6]
/*0x731a*/      ldrh r2, [r0, #4]
/*0x731c*/      cmp r5, #1
/*0x731e*/      bne jump_7378
/*0x7320*/      cbz r2, jump_733c
/*0x7322*/      cmp r2, #1
/*0x7324*/      beq jump_7378
/*0x7326*/      cmp r2, #2
/*0x7328*/      bne jump_7378
/*0x732a*/      cmp r1, #1
/*0x732c*/      beq jump_7342
/*0x732e*/      cmp r1, #2
/*0x7330*/      beq jump_734a
/*0x7332*/      cmp r1, #4
/*0x7334*/      bne jump_7378
/*0x7336*/      ldr r1, [pc, #0x68] /* data_73a0 */
/*0x7338*/      adds r1, #0x1b
/*0x733a*/      b jump_7346
            jump_733c:
/*0x733c*/      ldr r1, [pc, #0x60] /* data_73a0 */
/*0x733e*/      adds r1, #0x13
/*0x7340*/      b jump_7346
            jump_7342:
/*0x7342*/      ldr r1, [pc, #0x5c] /* data_73a0 */
/*0x7344*/      .short 0x1dc9 /* adds r1, r1, #7 */ 
            jump_7346:
/*0x7346*/      str r1, [r0, #8]
/*0x7348*/      b jump_739a
            jump_734a:
/*0x734a*/      ldr r1, [pc, #0x54] /* data_73a0 */
/*0x734c*/      adds r1, #0xb
/*0x734e*/      b jump_7346
            jump_7350:
/*0x7350*/      ldrh r1, [r0, #4]
/*0x7352*/      cmp r1, #0
/*0x7354*/      bne jump_7378
/*0x7356*/      ldrb r1, [r6]
/*0x7358*/      movs r2, #1
/*0x735a*/      b jump_72fc
            jump_735c:
/*0x735c*/      ldrb r3, [r0, #3]
/*0x735e*/      ldrh r1, [r0, #6]
/*0x7360*/      ldrh r2, [r0, #4]
/*0x7362*/      strh r1, [r0, #0x10]
/*0x7364*/      cmp r3, #2
/*0x7366*/      bne jump_7378
/*0x7368*/      cmp r2, #0
/*0x736a*/      bne jump_7378
/*0x736c*/      add.w r1, r0, #0xc
/*0x7370*/      str r1, [r0, #8]
/*0x7372*/      strb r4, [r0, #0x13]
/*0x7374*/      movs r1, #2
/*0x7376*/      strb r1, [r0, #0x12]
            jump_7378:
/*0x7378*/      pop.w {r4, r5, r6, r7, r8, pc}
            jump_737c:
/*0x737c*/      b jump_7398
            jump_737e:
/*0x737e*/      ldrh r2, [r0, #4]
/*0x7380*/      ldrb r1, [r0, #3]
/*0x7382*/      cmp r2, #0
/*0x7384*/      bne jump_7378
/*0x7386*/      strb r1, [r6]
/*0x7388*/      movw r2, #0xffff
/*0x738c*/      and.w r1, r2, r1, lsl #3
/*0x7390*/      ldr r2, [pc, #0xc] /* data_73a0 */
/*0x7392*/      .short 0x1f52 /* subs r2, r2, #5 */ 
/*0x7394*/      strh r1, [r2, #0xa]
/*0x7396*/      b jump_739a
            jump_7398:
/*0x7398*/      strb r1, [r5]
            jump_739a:
/*0x739a*/      strh r4, [r0, #0x10]
/*0x739c*/      strb r3, [r0, #0x12]
/*0x739e*/      b jump_7378

            data_73a0:
/*0x73a0*/  .word 0x20000815
            data_73a4:
/*0x73a4*/  .word 0x2000000b


            .thumb_func
            call_73a8:
/*0x73a8*/      ldr r1, [pc, #0x14] /* data_73c0 */
/*0x73aa*/      movs r0, #1
/*0x73ac*/      strb r0, [r1]
/*0x73ae*/      .short 0x1d09 /* adds r1, r1, #4 */ 
/*0x73b0*/      movs r0, #2
/*0x73b2*/      strb r0, [r1]
/*0x73b4*/      movs r0, #4
/*0x73b6*/      adds r1, #0x10
/*0x73b8*/      strb r0, [r1]
/*0x73ba*/      b.w call_669c

/*0x73be*/  .byte 0x00
/*0x73bf*/  .byte 0x00

            data_73c0:
/*0x73c0*/  .word 0x2000081c


            .thumb_func
            call_73c4:
/*0x73c4*/      push {r4, r5, r6, lr}
/*0x73c6*/      mov r4, r0
/*0x73c8*/      ldrh r0, [r0, #0x10]
/*0x73ca*/      ldr r3, [r4, #8]
/*0x73cc*/      cmp r0, #0x40
/*0x73ce*/      blo jump_73d8
/*0x73d0*/      movs r5, #0x40
/*0x73d2*/      subs r0, #0x40
/*0x73d4*/      strh r0, [r4, #0x10]
/*0x73d6*/      b jump_73e2
            jump_73d8:
/*0x73d8*/      movs r5, r0
/*0x73da*/      mov.w r0, #0
/*0x73de*/      strb r0, [r4, #0x12]
/*0x73e0*/      beq jump_73f4
            jump_73e2:
/*0x73e2*/      movs r0, #9
/*0x73e4*/      cmp.w r0, r3, lsr #28
/*0x73e8*/      bne jump_73f4
/*0x73ea*/      mov r1, r5
/*0x73ec*/      mov r0, r3
/*0x73ee*/      bl call_7234
/*0x73f2*/      b jump_73fe
            jump_73f4:
/*0x73f4*/      mov r2, r5
/*0x73f6*/      mov r1, r3
/*0x73f8*/      movs r0, #0
/*0x73fa*/      bl call_3a4c
            jump_73fe:
/*0x73fe*/      ldr r0, [r4, #8]
/*0x7400*/      add r0, r5
/*0x7402*/      str r0, [r4, #8]
/*0x7404*/      pop {r4, r5, r6, pc}
            jump_7406:
/*0x7406*/      str r1, [r0, #0xc]
/*0x7408*/      add.w r1, r0, #0xc
/*0x740c*/      str r1, [r0, #8]
/*0x740e*/      strh r2, [r0, #0x10]
/*0x7410*/      movs r1, #1
/*0x7412*/      strb r1, [r0, #0x12]
/*0x7414*/      bx lr

/*0x7416*/  .byte 0x00
/*0x7417*/  .byte 0x00


            .thumb_func
            call_7418:
/*0x7418*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x741c*/      ldr r0, [pc, #0xcc] /* data_74ec */
/*0x741e*/      ldrb r1, [r0]
/*0x7420*/      movs r4, #0
/*0x7422*/      subs r5, r0, #4
/*0x7424*/      cmp r1, #1
/*0x7426*/      bne jump_7434
/*0x7428*/      strb r4, [r0]
/*0x742a*/      ldrb r0, [r5, #8]
/*0x742c*/      and r0, r0, #7
/*0x7430*/      bl call_5df8
            jump_7434:
/*0x7434*/      ldr r6, [pc, #0xb8] /* data_74f0 */
/*0x7436*/      ldr r7, [pc, #0xbc] /* data_74f4 */
/*0x7438*/      ldrb r0, [r6]
/*0x743a*/      cbz r0, jump_7448
/*0x743c*/      cmp r0, #2
/*0x743e*/      beq jump_7472
/*0x7440*/      cmp r0, #4
/*0x7442*/      beq jump_7448
/*0x7444*/      cmp r0, #5
/*0x7446*/      bne jump_7484
            jump_7448:
/*0x7448*/      ldrb r0, [r5, #7]
/*0x744a*/      lsls r0, r0, #0x1b
/*0x744c*/      bpl jump_7484
/*0x744e*/      movs r0, #1
/*0x7450*/      strb r0, [r6]
/*0x7452*/      movs r2, #0x40
/*0x7454*/      ldr r1, [pc, #0xa0] /* data_74f8 */
/*0x7456*/      movs r0, #4
/*0x7458*/      bl call_39ec
/*0x745c*/      ldr r2, [pc, #0x98] /* data_74f8 */
/*0x745e*/      rsb.w r1, r0, #0x40
/*0x7462*/      add r0, r2
/*0x7464*/      bl call_35be
/*0x7468*/      ldrb r0, [r5, #7]
/*0x746a*/      bic r0, r0, #0x10
/*0x746e*/      strb r0, [r5, #7]
/*0x7470*/      b jump_7484
            jump_7472:
/*0x7472*/      ldr r0, [r7, #0x50]
/*0x7474*/      lsls r0, r0, #0x1e
/*0x7476*/      bpl jump_7484
/*0x7478*/      movs r2, #0x40
/*0x747a*/      ldr r1, [pc, #0x7c] /* data_74f8 */
/*0x747c*/      movs r0, #3
/*0x747e*/      bl call_3a4c
/*0x7482*/      strb r4, [r6]
            jump_7484:
/*0x7484*/      ldr r0, [r7, #0x28]
/*0x7486*/      lsls r0, r0, #0x1e
/*0x7488*/      bpl jump_74ae
/*0x748a*/      ldrb r0, [r5]
/*0x748c*/      cbz r0, jump_7492
/*0x748e*/      strb r4, [r5]
/*0x7490*/      b jump_74a2
            jump_7492:
/*0x7492*/      ldrh r0, [r5, #0xa]
/*0x7494*/      cbnz r0, jump_74ae
/*0x7496*/      ldr r0, [pc, #0x54] /* data_74ec */
/*0x7498*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x749a*/      ldrb r0, [r0]
/*0x749c*/      cbz r0, jump_74ae
/*0x749e*/      lsls r0, r0, #3
/*0x74a0*/      strh r0, [r5, #0xa]
            jump_74a2:
/*0x74a2*/      ldr r1, [pc, #0x48] /* data_74ec */
/*0x74a4*/      movs r2, #8
/*0x74a6*/      adds r1, #0x14
/*0x74a8*/      movs r0, #1
/*0x74aa*/      bl call_3a4c
            jump_74ae:
/*0x74ae*/      ldr r0, [r7, #0x3c]
/*0x74b0*/      lsls r0, r0, #0x1e
/*0x74b2*/      bpl jump_74e8
/*0x74b4*/      ldrb r0, [r5, #2]
/*0x74b6*/      cbz r0, jump_74c2
/*0x74b8*/      ldr r1, [pc, #0x30] /* data_74ec */
/*0x74ba*/      movs r2, #5
/*0x74bc*/      strb r4, [r5, #2]
/*0x74be*/      adds r1, #0xc
/*0x74c0*/      b jump_74de
            jump_74c2:
/*0x74c2*/      ldrb r0, [r5, #1]
/*0x74c4*/      cbz r0, jump_74d0
/*0x74c6*/      ldr r1, [pc, #0x24] /* data_74ec */
/*0x74c8*/      movs r2, #2
/*0x74ca*/      strb r4, [r5, #1]
/*0x74cc*/      adds r1, #8
/*0x74ce*/      b jump_74de
            jump_74d0:
/*0x74d0*/      ldrb r0, [r5, #3]
/*0x74d2*/      cmp r0, #0
/*0x74d4*/      beq jump_74e8
/*0x74d6*/      ldr r1, [pc, #0x14] /* data_74ec */
/*0x74d8*/      movs r2, #0x1f
/*0x74da*/      strb r4, [r5, #3]
/*0x74dc*/      adds r1, #0x1c
            jump_74de:
/*0x74de*/      pop.w {r4, r5, r6, r7, r8, lr}
/*0x74e2*/      movs r0, #2
/*0x74e4*/      b.w call_3a4c
            jump_74e8:
/*0x74e8*/      pop.w {r4, r5, r6, r7, r8, pc}

            data_74ec:
/*0x74ec*/  .word 0x20000814
            data_74f0:
/*0x74f0*/  .word 0x20000748
            data_74f4:
/*0x74f4*/  .word 0x400a8000
            data_74f8:
/*0x74f8*/  .word 0x20000750


            .thumb_func
            call_74fc:
/*0x74fc*/      push {r4, r5, r6, lr}
/*0x74fe*/      mov r4, r0
/*0x7500*/      ldrh r0, [r0]
/*0x7502*/      movs r1, #1
/*0x7504*/      cmp.w r0, #0x500
/*0x7508*/      beq jump_7590
/*0x750a*/      bgt jump_754e
/*0x750c*/      cmp.w r0, #0x100
/*0x7510*/      beq jump_7582
/*0x7512*/      bgt jump_752c
/*0x7514*/      cmp r0, #0x80
/*0x7516*/      beq jump_757a
/*0x7518*/      cmp r0, #0x81
/*0x751a*/      beq jump_757e
/*0x751c*/      cmp r0, #0x82
/*0x751e*/      bne jump_75f2
/*0x7520*/      movs r1, #2
            jump_7522:
/*0x7522*/      mov r0, r4
/*0x7524*/      pop.w {r4, r5, r6, lr}
/*0x7528*/      b.w jump_7644
            jump_752c:
/*0x752c*/      cmp.w r0, #0x102
/*0x7530*/      beq jump_7586
/*0x7532*/      cmp.w r0, #0x300
/*0x7536*/      beq jump_758a
/*0x7538*/      sub.w r0, r0, #0x300
/*0x753c*/      subs r0, #2
/*0x753e*/      bne jump_75f2
/*0x7540*/      movs r2, #1
            jump_7542:
/*0x7542*/      movs r1, #2
            jump_7544:
/*0x7544*/      mov r0, r4
/*0x7546*/      pop.w {r4, r5, r6, lr}
/*0x754a*/      b.w jump_768c
            jump_754e:
/*0x754e*/      cmp.w r0, #0x900
/*0x7552*/      beq jump_761e
/*0x7554*/      bgt jump_75f2
/*0x7556*/      cmp.w r0, #0x680
/*0x755a*/      beq jump_75a4
/*0x755c*/      sub.w r0, r0, #0x600
/*0x7560*/      subs r0, #0x81
/*0x7562*/      beq jump_75da
/*0x7564*/      sub.w r0, r0, #0x100
/*0x7568*/      subs r0, #0xff
/*0x756a*/      bne jump_75f2
/*0x756c*/      mov r0, r4
/*0x756e*/      ldrb r1, [r4, #0x14]
/*0x7570*/      pop.w {r4, r5, r6, lr}
/*0x7574*/      movs r2, #1
/*0x7576*/      b.w jump_7406
            jump_757a:
/*0x757a*/      movs r1, #0
/*0x757c*/      b jump_7522
            jump_757e:
/*0x757e*/      movs r1, #1
/*0x7580*/      b jump_7522
            jump_7582:
/*0x7582*/      movs r2, #0
/*0x7584*/      b jump_758c
            jump_7586:
/*0x7586*/      movs r2, #0
/*0x7588*/      b jump_7542
            jump_758a:
/*0x758a*/      movs r2, #1
            jump_758c:
/*0x758c*/      movs r1, #0
/*0x758e*/      b jump_7544
            jump_7590:
/*0x7590*/      ldr r0, [pc, #0xa4] /* data_7638 */
/*0x7592*/      ldr r2, [r0]
/*0x7594*/      orr r2, r2, #0x100
/*0x7598*/      str r2, [r0]
/*0x759a*/      ldrb r2, [r4, #2]
/*0x759c*/      str r2, [r0, #0x10]
/*0x759e*/      strb r1, [r4, #0x12]
/*0x75a0*/      movs r0, #5
/*0x75a2*/      b jump_7634
            jump_75a4:
/*0x75a4*/      ldrb r0, [r4, #3]
/*0x75a6*/      cmp r0, #1
/*0x75a8*/      beq jump_75c6
/*0x75aa*/      cmp r0, #2
/*0x75ac*/      beq jump_75d0
/*0x75ae*/      cmp r0, #3
/*0x75b0*/      bne jump_75f2
/*0x75b2*/      ldrb r0, [r4, #2]
/*0x75b4*/      cmp r0, #3
/*0x75b6*/      bhs jump_75f2
/*0x75b8*/      ldr r2, [pc, #0x80] /* data_763c */
/*0x75ba*/      ldr.w r0, [r2, r0, lsl #2]
/*0x75be*/      str r0, [r4, #8]
/*0x75c0*/      ldrb r0, [r0]
            jump_75c2:
/*0x75c2*/      strh r0, [r4, #0x10]
/*0x75c4*/      b jump_75f0
            jump_75c6:
/*0x75c6*/      ldr r0, [pc, #0x74] /* data_763c */
/*0x75c8*/      adds r0, #0xc
/*0x75ca*/      str r0, [r4, #8]
/*0x75cc*/      movs r0, #0x12
/*0x75ce*/      b jump_75c2
            jump_75d0:
/*0x75d0*/      mov.w r0, #-0x70000000
/*0x75d4*/      str r0, [r4, #8]
/*0x75d6*/      movs r0, #0x5b
/*0x75d8*/      b jump_75c2
            jump_75da:
/*0x75da*/      ldrb r2, [r4, #3]
/*0x75dc*/      ldrh r0, [r4, #4]
/*0x75de*/      cmp r2, #0x21
/*0x75e0*/      beq jump_75f4
/*0x75e2*/      cmp r2, #0x22
/*0x75e4*/      bne jump_75f2
/*0x75e6*/      cbz r0, jump_7600
/*0x75e8*/      cmp r0, #1
/*0x75ea*/      beq jump_760a
/*0x75ec*/      cmp r0, #2
/*0x75ee*/      beq jump_7614
            jump_75f0:
/*0x75f0*/      strb r1, [r4, #0x12]
            jump_75f2:
/*0x75f2*/      pop {r4, r5, r6, pc}
            jump_75f4:
/*0x75f4*/      ldr r2, [pc, #0x48] /* data_7640 */
/*0x75f6*/      add.w r0, r2, r0, lsl #12
/*0x75fa*/      str r0, [r4, #8]
/*0x75fc*/      movs r0, #9
/*0x75fe*/      b jump_75c2
            jump_7600:
/*0x7600*/      ldr r0, [pc, #0x38] /* data_763c */
/*0x7602*/      subs r0, #0xec
/*0x7604*/      str r0, [r4, #8]
/*0x7606*/      movs r0, #0x40
/*0x7608*/      b jump_75c2
            jump_760a:
/*0x760a*/      ldr r0, [pc, #0x30] /* data_763c */
/*0x760c*/      subs r0, #0xac
/*0x760e*/      str r0, [r4, #8]
/*0x7610*/      movs r0, #0x22
/*0x7612*/      b jump_75c2
            jump_7614:
/*0x7614*/      ldr r0, [pc, #0x24] /* data_763c */
/*0x7616*/      subs r0, #0x88
/*0x7618*/      str r0, [r4, #8]
/*0x761a*/      movs r0, #0x86
/*0x761c*/      b jump_75c2
            jump_761e:
/*0x761e*/      ldrb r0, [r4, #2]
/*0x7620*/      strb r0, [r4, #0x14]
/*0x7622*/      strb r1, [r4, #0x12]
/*0x7624*/      movs r5, #1
            jump_7626:
/*0x7626*/      uxtb r0, r5
/*0x7628*/      bl call_6c24
/*0x762c*/      .short 0x1c6d /* adds r5, r5, #1 */ 
/*0x762e*/      cmp r5, #8
/*0x7630*/      blo jump_7626
/*0x7632*/      movs r0, #6
            jump_7634:
/*0x7634*/      strb r0, [r4, #0x15]
/*0x7636*/      pop {r4, r5, r6, pc}

            data_7638:
/*0x7638*/  .word 0x400a8000
            data_763c:
/*0x763c*/  .word 0x000080f0 /* possible pointer */
            data_7640:
/*0x7640*/  .word 0x90001000

            jump_7644:
/*0x7644*/      push {r4, lr}
/*0x7646*/      mov r4, r0
/*0x7648*/      cbz r1, jump_766e
/*0x764a*/      cmp r1, #1
/*0x764c*/      beq jump_7672
/*0x764e*/      cmp r1, #2
/*0x7650*/      bne jump_7686
/*0x7652*/      ldrb r0, [r4, #4]
/*0x7654*/      and r1, r0, #0xf
/*0x7658*/      ldr r0, [pc, #0x2c] /* data_7688 */
/*0x765a*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x765c*/      bl call_3a98
/*0x7660*/      ldr r1, [r0, #0x10]
/*0x7662*/      ldr r0, [r0]
/*0x7664*/      lsls r1, r1, #3
/*0x7666*/      bpl jump_7676
/*0x7668*/      ubfx r1, r0, #2, #1
/*0x766c*/      b jump_767a
            jump_766e:
/*0x766e*/      ldrb r1, [r4, #0x17]
/*0x7670*/      b jump_767a
            jump_7672:
/*0x7672*/      movs r1, #0
/*0x7674*/      b jump_767a
            jump_7676:
/*0x7676*/      ubfx r1, r0, #5, #1
            jump_767a:
/*0x767a*/      mov r0, r4
/*0x767c*/      pop.w {r4, lr}
/*0x7680*/      movs r2, #2
/*0x7682*/      b.w jump_7406
            jump_7686:
/*0x7686*/      pop {r4, pc}

            data_7688:
/*0x7688*/  .word 0x400a8000

            jump_768c:
/*0x768c*/      push {r4, r5, r6, lr}
/*0x768e*/      mov r4, r0
/*0x7690*/      movs r5, #1
/*0x7692*/      cbz r1, jump_76b6
/*0x7694*/      cmp r1, #2
/*0x7696*/      bne jump_76da
/*0x7698*/      ldrb r0, [r4, #4]
/*0x769a*/      ands r1, r0, #0xf
/*0x769e*/      beq jump_76d8
/*0x76a0*/      ldr r0, [pc, #0x38] /* data_76dc */
/*0x76a2*/      cbz r2, jump_76c6
/*0x76a4*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x76a6*/      bl call_3a98
/*0x76aa*/      movs r1, #0x40
/*0x76ac*/      str r1, [r0, #8]
/*0x76ae*/      ldr r2, [r0]
/*0x76b0*/      movs r1, #0x24
/*0x76b2*/      bics r1, r2
/*0x76b4*/      b jump_76d6
            jump_76b6:
/*0x76b6*/      ldrb r0, [r4, #2]
/*0x76b8*/      cmp r0, #1
/*0x76ba*/      bne jump_76da
/*0x76bc*/      ldrb r0, [r4, #0x17]
/*0x76be*/      bfi r0, r2, #1, #1
/*0x76c2*/      strb r0, [r4, #0x17]
/*0x76c4*/      b jump_76d8
            jump_76c6:
/*0x76c6*/      ldrb r2, [r4, #0x18]
/*0x76c8*/      cbnz r2, jump_76d8
/*0x76ca*/      .short 0x1c49 /* adds r1, r1, #1 */ 
/*0x76cc*/      bl call_3a98
/*0x76d0*/      ldr r1, [r0]
/*0x76d2*/      and r1, r1, #0x2d
            jump_76d6:
/*0x76d6*/      str r1, [r0]
            jump_76d8:
/*0x76d8*/      strb r5, [r4, #0x12]
            jump_76da:
/*0x76da*/      pop {r4, r5, r6, pc}

            data_76dc:
/*0x76dc*/  .word 0x400a8000


            .thumb_func
            call_76e0:
/*0x76e0*/      push {r4, r5, r6, lr}
/*0x76e2*/      ldr r5, [pc, #0x70] /* data_7754 */
/*0x76e4*/      ldrb r0, [r5, #0x17]
/*0x76e6*/      ubfx r4, r0, #1, #1
/*0x76ea*/      cbz r4, jump_76f0
/*0x76ec*/      bl call_37c4
            jump_76f0:
/*0x76f0*/      ldrb r0, [r5, #0x15]
/*0x76f2*/      cmp r0, #3
/*0x76f4*/      bne jump_772c
/*0x76f6*/      bl call_3b1c
/*0x76fa*/      cbz r0, jump_772c
/*0x76fc*/      movs r0, #1
/*0x76fe*/      bl call_5744
/*0x7702*/      ldr r1, [pc, #0x50] /* data_7754 */
/*0x7704*/      movs r0, #1
/*0x7706*/      subs r1, #0x40
/*0x7708*/      strb r0, [r1, #6]
/*0x770a*/      ldrb r0, [r5, #0x15]
/*0x770c*/      cmp r0, #3
/*0x770e*/      bne jump_772c
/*0x7710*/      bl call_3b1c
/*0x7714*/      cbz r0, jump_772c
/*0x7716*/      bl call_37e8
/*0x771a*/      mov.w r0, #0x3e8
/*0x771e*/      bl call_3794
/*0x7722*/      bl call_37a0
/*0x7726*/      movs r0, #0
/*0x7728*/      bl call_5e54
            jump_772c:
/*0x772c*/      cmp r4, #0
/*0x772e*/      beq jump_7752
/*0x7730*/      bl call_37d8
/*0x7734*/      cbz r0, jump_774a
/*0x7736*/      ldrb r0, [r5, #0x15]
/*0x7738*/      cmp r0, #3
/*0x773a*/      bne jump_774a
/*0x773c*/      bl call_3aa4
/*0x7740*/      ldr r0, [pc, #0x14] /* data_7758 */
/*0x7742*/      ldr r1, [r0]
/*0x7744*/      orr r1, r1, #0x20
/*0x7748*/      str r1, [r0]
            jump_774a:
/*0x774a*/      pop.w {r4, r5, r6, lr}
/*0x774e*/      b.w jump_37b0
            jump_7752:
/*0x7752*/      pop {r4, r5, r6, pc}

            data_7754:
/*0x7754*/  .word 0x20000850
            data_7758:
/*0x7758*/  .word 0x400a8000


            .thumb_func
            loc_775c:
/*0x775c*/      b jump_7764
            jump_775e:
/*0x775e*/      ldm r0!, {r3}
/*0x7760*/      .short 0x1f12 /* subs r2, r2, #4 */ 
/*0x7762*/      stm r1!, {r3}
            jump_7764:
/*0x7764*/      cmp r2, #0
/*0x7766*/      bne jump_775e
/*0x7768*/      bx lr

            .thumb_func
            loc_776a:
/*0x776a*/      bx lr

            .thumb_func
            loc_776c:
/*0x776c*/      movs r0, #0
/*0x776e*/      b jump_7774
            jump_7770:
/*0x7770*/      stm r1!, {r0}
/*0x7772*/      .short 0x1f12 /* subs r2, r2, #4 */ 
            jump_7774:
/*0x7774*/      cmp r2, #0
/*0x7776*/      bne jump_7770
/*0x7778*/      bx lr

/*0x777a*/  .byte 0x00
/*0x777b*/  .byte 0x00


            .thumb_func
            call_777c:
/*0x777c*/      push {r3, r4, r5, lr}
/*0x777e*/      mov r4, r2
/*0x7780*/      movs r2, #0
/*0x7782*/      str r2, [sp]
/*0x7784*/      ldr r2, [pc, #0x1c] /* data_77a4 */
/*0x7786*/      ldr r5, [sp, #0x10]
/*0x7788*/      ldrb r4, [r2, r4]
/*0x778a*/      strb.w r4, [sp]
/*0x778e*/      ldrb r3, [r2, r3]
/*0x7790*/      strb.w r3, [sp, #1]
/*0x7794*/      ldrb r2, [r2, r5]
/*0x7796*/      strb.w r2, [sp, #2]
/*0x779a*/      mov r2, r1
/*0x779c*/      mov r1, sp
/*0x779e*/      bl call_4a40
/*0x77a2*/      pop {r3, r4, r5, pc}

            data_77a4:
/*0x77a4*/  .word 0x200001aa


            .thumb_func
            main:
/*0x77a8*/      bl call_663c
/*0x77ac*/      bl call_5818
/*0x77b0*/      bl call_37f8
/*0x77b4*/      bl call_3bf4
/*0x77b8*/      ldr r0, [pc, #0xe0] /* data_789c */
/*0x77ba*/      bl call_4570
/*0x77be*/      bl call_401c
/*0x77c2*/      movs r0, #0xff
/*0x77c4*/      bl call_4238
/*0x77c8*/      bl call_61cc
/*0x77cc*/      bl call_5e24
/*0x77d0*/      bl call_6388
/*0x77d4*/      bl call_4e68
/*0x77d8*/      movs r0, #0
/*0x77da*/      bl call_4694
/*0x77de*/      ldr r1, [pc, #0xc0] /* data_78a0 */
/*0x77e0*/      movs r0, #0
/*0x77e2*/      str r0, [r1]
/*0x77e4*/      bl call_57c0
/*0x77e8*/      bl call_57f4
/*0x77ec*/      movs r0, #0
/*0x77ee*/      bl call_5744
/*0x77f2*/      movs r0, #0xa
/*0x77f4*/      bl call_3794
/*0x77f8*/      movs r0, #1
/*0x77fa*/      bl call_6150
/*0x77fe*/      bl call_4e74
/*0x7802*/      ldr r4, [pc, #0xa0] /* data_78a4 */
/*0x7804*/      cbz r0, jump_780a
/*0x7806*/      movs r0, #1
/*0x7808*/      strh r0, [r4, #4]
            jump_780a:
/*0x780a*/      ldrh r0, [r4, #4]
/*0x780c*/      cbz r0, jump_7832
/*0x780e*/      bl call_6478
/*0x7812*/      bl call_5e44
/*0x7816*/      movs r0, #0
/*0x7818*/      bl call_6150
            jump_781c:
/*0x781c*/      ldrh r0, [r4, #4]
/*0x781e*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7820*/      strh r0, [r4, #4]
/*0x7822*/      bl call_78ac
/*0x7826*/      movs r0, #1
/*0x7828*/      bl call_5ee0
/*0x782c*/      bl call_37e8
/*0x7830*/      b jump_781c
            jump_7832:
/*0x7832*/      movs r0, #1
/*0x7834*/      bl call_5744
/*0x7838*/      bl call_6890
/*0x783c*/      ldr r5, [pc, #0x5c] /* data_789c */
/*0x783e*/      ldr r6, [pc, #0x68] /* data_78a8 */
/*0x7840*/      adds r5, #0x10
            jump_7842:
/*0x7842*/      bl call_68a8
/*0x7846*/      cmp r0, #1
/*0x7848*/      beq jump_785a
/*0x784a*/      cmp r0, #2
/*0x784c*/      beq jump_786e
/*0x784e*/      cmp r0, #3
/*0x7850*/      bne jump_7896
/*0x7852*/      movs r0, #1
/*0x7854*/      bl call_5744
/*0x7858*/      b jump_7896
            jump_785a:
/*0x785a*/      movs r0, #0
/*0x785c*/      bl call_5744
/*0x7860*/      bl call_6478
/*0x7864*/      bl call_5e44
/*0x7868*/      movs r0, #0
/*0x786a*/      bl call_6150
            jump_786e:
/*0x786e*/      ldrh r0, [r4, #4]
/*0x7870*/      .short 0x1c40 /* adds r0, r0, #1 */ 
/*0x7872*/      strh r0, [r4, #4]
/*0x7874*/      lsls r0, r0, #0x11
/*0x7876*/      bne jump_7884
/*0x7878*/      ldr r0, [r5]
/*0x787a*/      cmp r0, r6
/*0x787c*/      bls jump_7884
/*0x787e*/      ldr r0, [r5]
/*0x7880*/      .short 0x1e40 /* subs r0, r0, #1 */ 
/*0x7882*/      str r0, [r5]
            jump_7884:
/*0x7884*/      bl handle_frame
/*0x7888*/      bl call_78ac
/*0x788c*/      ldrb r0, [r4]
/*0x788e*/      cbnz r0, jump_7896
/*0x7890*/      movs r0, #1
/*0x7892*/      bl call_5ee0
            jump_7896:
/*0x7896*/      bl call_37e8
/*0x789a*/      b jump_7842

            data_789c:
/*0x789c*/  .word 0x20003fec
            data_78a0:
/*0x78a0*/  .word 0x2000079c
            data_78a4:
/*0x78a4*/  .word 0x20000748
            data_78a8:
/*0x78a8*/  .word 0x55aafaf0


            .thumb_func
            call_78ac:
/*0x78ac*/      push.w {r4, r5, r6, r7, r8, lr}
/*0x78b0*/      ldr r5, [pc, #0xd4] /* data_7988 */
/*0x78b2*/      movs r4, #0
/*0x78b4*/      ldrb r0, [r5, #2]
/*0x78b6*/      cbz r0, jump_78d6
/*0x78b8*/      cmp r0, #0x80
/*0x78ba*/      bhs jump_78d6
/*0x78bc*/      movs r0, #1
/*0x78be*/      bl call_4694
/*0x78c2*/      cbz r0, jump_78d6
/*0x78c4*/      ldrb r0, [r5, #2]
/*0x78c6*/      cmp r0, #2
/*0x78c8*/      beq jump_7906
/*0x78ca*/      bl call_42bc
            jump_78ce:
/*0x78ce*/      strb r4, [r5, #2]
/*0x78d0*/      movs r0, #1
/*0x78d2*/      bl call_57c0
            jump_78d6:
/*0x78d6*/      bl call_525c
/*0x78da*/      cmp r0, #0
/*0x78dc*/      beq jump_7982
/*0x78de*/      ldr r6, [pc, #0xa8] /* data_7988 */
/*0x78e0*/      mov.w r8, #1
/*0x78e4*/      subs r6, #0x48
/*0x78e6*/      ldrb r0, [r6, #1]
/*0x78e8*/      cmp r0, #0x20
/*0x78ea*/      blo jump_78f4
/*0x78ec*/      subs r0, #0x20
/*0x78ee*/      strb r0, [r6, #1]
/*0x78f0*/      strb.w r8, [r6, #2]
            jump_78f4:
/*0x78f4*/      ldr r7, [pc, #0x94] /* data_798c */
/*0x78f6*/      ldrb r0, [r7]
/*0x78f8*/      cmp r0, #0xff
/*0x78fa*/      beq jump_791c
/*0x78fc*/      bl call_4acc
/*0x7900*/      cmp r0, #1
/*0x7902*/      beq jump_790c
/*0x7904*/      b jump_791c
            jump_7906:
/*0x7906*/      bl call_42f4
/*0x790a*/      b jump_78ce
            jump_790c:
/*0x790c*/      ldrb r0, [r7]
/*0x790e*/      bl call_4238
/*0x7912*/      movs r0, #0xff
/*0x7914*/      strb r0, [r7]
/*0x7916*/      movs r0, #2
/*0x7918*/      bl call_57c0
            jump_791c:
/*0x791c*/      ldrb r0, [r5, #3]
/*0x791e*/      cbz r0, jump_7930
/*0x7920*/      bl call_4acc
/*0x7924*/      cmp r0, #1
/*0x7926*/      bne jump_7930
/*0x7928*/      ldrb r0, [r5, #3]
/*0x792a*/      bl call_4b04
/*0x792e*/      strb r4, [r5, #3]
            jump_7930:
/*0x7930*/      bl call_60d4
/*0x7934*/      bl call_5958
/*0x7938*/      ldr r0, [pc, #0x54] /* data_7990 */
/*0x793a*/      ldrb r0, [r0, #8]
/*0x793c*/      cmp r0, #1
/*0x793e*/      beq jump_7948
/*0x7940*/      bl call_4b14
/*0x7944*/      bl call_3b80
            jump_7948:
/*0x7948*/      ldrb r0, [r6, #2]
/*0x794a*/      cbz r0, jump_7950
/*0x794c*/      bl call_4c1c
            jump_7950:
/*0x7950*/      ldrb r0, [r5]
/*0x7952*/      cbz r0, jump_7968
/*0x7954*/      ldr r7, [pc, #0x3c] /* data_7994 */
/*0x7956*/      ldrb r0, [r7]
/*0x7958*/      cbnz r0, jump_7968
/*0x795a*/      strb r4, [r5]
/*0x795c*/      bl call_5680
/*0x7960*/      bl call_5690
/*0x7964*/      strb.w r8, [r7]
            jump_7968:
/*0x7968*/      ldrb r0, [r6, #2]
/*0x796a*/      cmp r0, #0
/*0x796c*/      beq jump_7982
/*0x796e*/      ldr r0, [pc, #0x18] /* data_7988 */
/*0x7970*/      ldrb r2, [r6, #1]
/*0x7972*/      subs r0, #0x42
/*0x7974*/      ldrb r1, [r0, #1]
/*0x7976*/      add r1, r2
/*0x7978*/      strb r1, [r0, #1]
/*0x797a*/      ldrh r0, [r6, #6]
/*0x797c*/      lsrs r0, r0, #1
/*0x797e*/      strh r0, [r6, #6]
/*0x7980*/      strb r4, [r6, #2]
            jump_7982:
/*0x7982*/      pop.w {r4, r5, r6, r7, r8, pc}

/*0x7986*/  .byte 0x00
/*0x7987*/  .byte 0x00

            data_7988:
/*0x7988*/  .word 0x20000790
            data_798c:
/*0x798c*/  .word 0x2000000a
            data_7990:
/*0x7990*/  .word 0x20001b7c
            data_7994:
/*0x7994*/  .word 0x20000324


            .thumb_func
            call_7998:
/*0x7998*/      ldr r0, [pc, #0x3c] /* data_79d8 */
/*0x799a*/      push {r4, r5}
/*0x799c*/      ldrb r0, [r0, #2]
/*0x799e*/      cmp r0, #0
/*0x79a0*/      beq jump_79bc
/*0x79a2*/      ldr r1, [pc, #0x38] /* data_79dc */
/*0x79a4*/      movs r4, #1
/*0x79a6*/      ldr r2, [pc, #0x38] /* data_79e0 */
/*0x79a8*/      ldrb r1, [r1]
/*0x79aa*/      movs r3, #3
/*0x79ac*/      cbz r1, jump_79c0
/*0x79ae*/      cmp r1, #1
/*0x79b0*/      beq jump_79ce
/*0x79b2*/      cmp r1, #2
/*0x79b4*/      beq jump_79d2
/*0x79b6*/      cmp r1, #3
/*0x79b8*/      bne jump_79bc
/*0x79ba*/      strb r3, [r2, #9]
            jump_79bc:
/*0x79bc*/      pop {r4, r5}
/*0x79be*/      bx lr
            jump_79c0:
/*0x79c0*/      movs r1, #0
/*0x79c2*/      strb r1, [r2, #9]
/*0x79c4*/      strb r4, [r2]
/*0x79c6*/      strb r3, [r2, #3]
/*0x79c8*/      pop {r4, r5}
/*0x79ca*/      b.w call_43b8
            jump_79ce:
/*0x79ce*/      strb r4, [r2, #9]
/*0x79d0*/      b jump_79bc
            jump_79d2:
/*0x79d2*/      movs r0, #2
/*0x79d4*/      strb r0, [r2, #9]
/*0x79d6*/      b jump_79bc

            data_79d8:
/*0x79d8*/  .word 0x20000870
            data_79dc:
/*0x79dc*/  .word 0x20000010
            data_79e0:
/*0x79e0*/  .word 0x20000790

/*0x79e4*/  .byte 0x47
/*0x79e5*/  .byte 0x3c
/*0x79e6*/  .byte 0x08
/*0x79e7*/  .byte 0x14
/*0x79e8*/  .byte 0x1a
/*0x79e9*/  .byte 0xe5
/*0x79ea*/  .byte 0xe4
/*0x79eb*/  .byte 0x65
/*0x79ec*/  .byte 0xe7
/*0x79ed*/  .byte 0x00
/*0x79ee*/  .byte 0x00
/*0x79ef*/  .byte 0x00
/*0x79f0*/  .byte 0x90
/*0x79f1*/  .byte 0x7a
/*0x79f2*/  .byte 0x00
/*0x79f3*/  .byte 0x00
/*0x79f4*/  .byte 0x3e
/*0x79f5*/  .byte 0x5c
/*0x79f6*/  .byte 0x14
/*0x79f7*/  .byte 0x00
/*0x79f8*/  .byte 0x1f
/*0x79f9*/  .byte 0x10
/*0x79fa*/  .byte 0x01
/*0x79fb*/  .byte 0x26
/*0x79fc*/  .byte 0x11
/*0x79fd*/  .byte 0x01
/*0x79fe*/  .byte 0x27
/*0x79ff*/  .byte 0x12
/*0x7a00*/  .byte 0x01
/*0x7a01*/  .byte 0x2e
/*0x7a02*/  .byte 0x13
/*0x7a03*/  .byte 0x01
/*0x7a04*/  .byte 0x36
/*0x7a05*/  .byte 0x5f
/*0x7a06*/  .byte 0x01
/*0x7a07*/  .byte 0x49
/*0x7a08*/  .byte 0x68
/*0x7a09*/  .byte 0x01
/*0x7a0a*/  .byte 0x50
/*0x7a0b*/  .byte 0x69
/*0x7a0c*/  .byte 0x01
/*0x7a0d*/  .byte 0x51
/*0x7a0e*/  .byte 0x6a
/*0x7a0f*/  .byte 0x01
/*0x7a10*/  .byte 0x48
/*0x7a11*/  .byte 0x3f
/*0x7a12*/  .byte 0x01
/*0x7a13*/  .byte 0x00
/*0x7a14*/  .byte 0x35
/*0x7a15*/  .byte 0x01
/*0x7a16*/  .byte 0x3a
/*0x7a17*/  .byte 0x08
/*0x7a18*/  .byte 0x3b
/*0x7a19*/  .byte 0x09
/*0x7a1a*/  .byte 0x3c
/*0x7a1b*/  .byte 0x10
/*0x7a1c*/  .byte 0x3d
/*0x7a1d*/  .byte 0x11
/*0x7a1e*/  .byte 0x3e
/*0x7a1f*/  .byte 0x18
/*0x7a20*/  .byte 0x3f
/*0x7a21*/  .byte 0x19
/*0x7a22*/  .byte 0x40
/*0x7a23*/  .byte 0x20
/*0x7a24*/  .byte 0x41
/*0x7a25*/  .byte 0x21
/*0x7a26*/  .byte 0x42
/*0x7a27*/  .byte 0x28
/*0x7a28*/  .byte 0x43
/*0x7a29*/  .byte 0x29
/*0x7a2a*/  .byte 0x44
/*0x7a2b*/  .byte 0x30
/*0x7a2c*/  .byte 0x45
/*0x7a2d*/  .byte 0x22
/*0x7a2e*/  .byte 0x52
/*0x7a2f*/  .byte 0x1d
/*0x7a30*/  .byte 0x50
/*0x7a31*/  .byte 0x24
/*0x7a32*/  .byte 0x51
/*0x7a33*/  .byte 0x25
/*0x7a34*/  .byte 0x4f
/*0x7a35*/  .byte 0x2a
/*0x7a36*/  .byte 0x46
/*0x7a37*/  .byte 0x2b
/*0x7a38*/  .byte 0x47
/*0x7a39*/  .byte 0x32
/*0x7a3a*/  .byte 0x48
/*0x7a3b*/  .byte 0x07
/*0x7a3c*/  .byte 0x65
/*0x7a3d*/  .byte 0x1c
/*0x7a3e*/  .byte 0x4a
/*0x7a3f*/  .byte 0x1e
/*0x7a40*/  .byte 0x4d
/*0x7a41*/  .byte 0x1b
/*0x7a42*/  .byte 0x4b
/*0x7a43*/  .byte 0x23
/*0x7a44*/  .byte 0x4e
/*0x7a45*/  .byte 0x38
/*0x7a46*/  .byte 0x4c
/*0x7a47*/  .byte 0x2d
/*0x7a48*/  .byte 0x4c
/*0x7a49*/  .byte 0x2c
/*0x7a4a*/  .byte 0x49
/*0x7a4b*/  .byte 0x0c
/*0x7a4c*/  .byte 0xf5
/*0x7a4d*/  .byte 0x0d
/*0x7a4e*/  .byte 0xf6
/*0x7a4f*/  .byte 0x14
/*0x7a50*/  .byte 0xf4
/*0x7a51*/  .byte 0x03
/*0x7a52*/  .byte 0xf2
/*0x7a53*/  .byte 0x0a
/*0x7a54*/  .byte 0xf0
/*0x7a55*/  .byte 0x0b
/*0x7a56*/  .byte 0xf3
/*0x7a57*/  .byte 0x1a
/*0x7a58*/  .byte 0xee
/*0x7a59*/  .byte 0x4a
/*0x7a5a*/  .byte 0x49
/*0x7a5b*/  .byte 0x4b
/*0x7a5c*/  .byte 0x4a
/*0x7a5d*/  .byte 0x52
/*0x7a5e*/  .byte 0x4b
/*0x7a5f*/  .byte 0x4c
/*0x7a60*/  .byte 0x4c
/*0x7a61*/  .byte 0x4d
/*0x7a62*/  .byte 0x4d
/*0x7a63*/  .byte 0x54
/*0x7a64*/  .byte 0x4e
/*0x7a65*/  .byte 0x3f
/*0x7a66*/  .byte 0x50
/*0x7a67*/  .byte 0x3e
/*0x7a68*/  .byte 0x51
/*0x7a69*/  .byte 0x37
/*0x7a6a*/  .byte 0x4f
/*0x7a6b*/  .byte 0x3d
/*0x7a6c*/  .byte 0x52
/*0x7a6d*/  .byte 0x54
/*0x7a6e*/  .byte 0x46
/*0x7a6f*/  .byte 0x55
/*0x7a70*/  .byte 0x47
/*0x7a71*/  .byte 0x56
/*0x7a72*/  .byte 0x48
/*0x7a73*/  .byte 0x59
/*0x7a74*/  .byte 0xcd
/*0x7a75*/  .byte 0x5a
/*0x7a76*/  .byte 0x52
/*0x7a77*/  .byte 0x5b
/*0x7a78*/  .byte 0xcd
/*0x7a79*/  .byte 0x5c
/*0x7a7a*/  .byte 0x4c
/*0x7a7b*/  .byte 0x5d
/*0x7a7c*/  .byte 0x4d
/*0x7a7d*/  .byte 0x5e
/*0x7a7e*/  .byte 0x4e
/*0x7a7f*/  .byte 0x5f
/*0x7a80*/  .byte 0x49
/*0x7a81*/  .byte 0x60
/*0x7a82*/  .byte 0x4a
/*0x7a83*/  .byte 0x61
/*0x7a84*/  .byte 0x4b
/*0x7a85*/  .byte 0x62
/*0x7a86*/  .byte 0x50
/*0x7a87*/  .byte 0x63
/*0x7a88*/  .byte 0x4f
/*0x7a89*/  .byte 0xcc
/*0x7a8a*/  .byte 0x51
/*0x7a8b*/  .byte 0xe8
/*0x7a8c*/  .byte 0xcf
/*0x7a8d*/  .byte 0x00
/*0x7a8e*/  .byte 0x00
/*0x7a8f*/  .byte 0x00
/*0x7a90*/  .byte 0x62
/*0x7a91*/  .byte 0x3c
/*0x7a92*/  .byte 0x08
/*0x7a93*/  .byte 0x00
/*0x7a94*/  .byte 0x62
/*0x7a95*/  .byte 0x5c
/*0x7a96*/  .byte 0x08
/*0x7a97*/  .byte 0x00
/*0x7a98*/  .byte 0x62
/*0x7a99*/  .byte 0x3c
/*0x7a9a*/  .byte 0x08
/*0x7a9b*/  .byte 0x00
/*0x7a9c*/  .byte 0x62
/*0x7a9d*/  .byte 0x5c
/*0x7a9e*/  .byte 0x50
/*0x7a9f*/  .byte 0x03
/*0x7aa0*/  .byte 0x00
/*0x7aa1*/  .byte 0xfc
/*0x7aa2*/  .byte 0x00
/*0x7aa3*/  .byte 0x00
/*0x7aa4*/  .byte 0xff
/*0x7aa5*/  .byte 0xff
/*0x7aa6*/  .byte 0xff
/*0x7aa7*/  .byte 0x00
/*0x7aa8*/  .byte 0x00
/*0x7aa9*/  .byte 0xff
/*0x7aaa*/  .byte 0xff
/*0x7aab*/  .byte 0x00
/*0x7aac*/  .byte 0x00
/*0x7aad*/  .byte 0x00
/*0x7aae*/  .byte 0x01
/*0x7aaf*/  .byte 0x02
/*0x7ab0*/  .byte 0x03
/*0x7ab1*/  .byte 0xff
/*0x7ab2*/  .byte 0xff
/*0x7ab3*/  .byte 0xff
/*0x7ab4*/  .byte 0xff
/*0x7ab5*/  .byte 0x04
/*0x7ab6*/  .byte 0x04
/*0x7ab7*/  .byte 0x05
/*0x7ab8*/  .byte 0x05
/*0x7ab9*/  .byte 0x06
/*0x7aba*/  .byte 0x06
/*0x7abb*/  .byte 0x01
/*0x7abc*/  .byte 0x01
/*0x7abd*/  .byte 0x01
/*0x7abe*/  .byte 0x01
/*0x7abf*/  .byte 0x01
/*0x7ac0*/  .byte 0x01
/*0x7ac1*/  .byte 0x01
/*0x7ac2*/  .byte 0x03
/*0x7ac3*/  .byte 0x05
/*0x7ac4*/  .byte 0x07
/*0x7ac5*/  .byte 0x09
/*0x7ac6*/  .byte 0x0b
/*0x7ac7*/  .byte 0x01
/*0x7ac8*/  .byte 0x03
/*0x7ac9*/  .byte 0x05
/*0x7aca*/  .byte 0x07
/*0x7acb*/  .byte 0x09
/*0x7acc*/  .byte 0x0b
/*0x7acd*/  .byte 0xaa
/*0x7ace*/  .byte 0x6e
/*0x7acf*/  .byte 0x46
/*0x7ad0*/  .byte 0x28
/*0x7ad1*/  .byte 0x14
/*0x7ad2*/  .byte 0x0a
/*0x7ad3*/  .byte 0x01
/*0x7ad4*/  .byte 0x02
/*0x7ad5*/  .byte 0x03
/*0x7ad6*/  .byte 0x04
/*0x7ad7*/  .byte 0x06
/*0x7ad8*/  .byte 0x09
/*0x7ad9*/  .byte 0x10
/*0x7ada*/  .byte 0x0b
/*0x7adb*/  .byte 0x07
/*0x7adc*/  .byte 0x04
/*0x7add*/  .byte 0x02
/*0x7ade*/  .byte 0x01
/*0x7adf*/  .byte 0x10
/*0x7ae0*/  .byte 0x0b
/*0x7ae1*/  .byte 0x07
/*0x7ae2*/  .byte 0x04
/*0x7ae3*/  .byte 0x02
/*0x7ae4*/  .byte 0x01
/*0x7ae5*/  .byte 0x01
/*0x7ae6*/  .byte 0x02
/*0x7ae7*/  .byte 0x01
/*0x7ae8*/  .byte 0x02
/*0x7ae9*/  .byte 0x01
/*0x7aea*/  .byte 0x02
/*0x7aeb*/  .byte 0x01
/*0x7aec*/  .byte 0x02
/*0x7aed*/  .byte 0x02
/*0x7aee*/  .byte 0x03
/*0x7aef*/  .byte 0x02
/*0x7af0*/  .byte 0x03
/*0x7af1*/  .byte 0x02
/*0x7af2*/  .byte 0x03
/*0x7af3*/  .byte 0x03
/*0x7af4*/  .byte 0x04
/*0x7af5*/  .byte 0x04
/*0x7af6*/  .byte 0x05
/*0x7af7*/  .byte 0x04
/*0x7af8*/  .byte 0x05
/*0x7af9*/  .byte 0x04
/*0x7afa*/  .byte 0x05
/*0x7afb*/  .byte 0x05
/*0x7afc*/  .byte 0x06
/*0x7afd*/  .byte 0x06
/*0x7afe*/  .byte 0x07
/*0x7aff*/  .byte 0x06
/*0x7b00*/  .byte 0x07
/*0x7b01*/  .byte 0x06
/*0x7b02*/  .byte 0x07
/*0x7b03*/  .byte 0x07
/*0x7b04*/  .byte 0x08
/*0x7b05*/  .byte 0x08
/*0x7b06*/  .byte 0x09
/*0x7b07*/  .byte 0x08
/*0x7b08*/  .byte 0x09
/*0x7b09*/  .byte 0x08
/*0x7b0a*/  .byte 0x09
/*0x7b0b*/  .byte 0x09
/*0x7b0c*/  .byte 0x0a
/*0x7b0d*/  .byte 0x0a
/*0x7b0e*/  .byte 0x0b
/*0x7b0f*/  .byte 0x0a
/*0x7b10*/  .byte 0x0b
/*0x7b11*/  .byte 0x0a
/*0x7b12*/  .byte 0x0b
/*0x7b13*/  .byte 0x0b
/*0x7b14*/  .byte 0x0c
/*0x7b15*/  .byte 0x0b
/*0x7b16*/  .byte 0xff
/*0x7b17*/  .byte 0x0b
/*0x7b18*/  .byte 0x0c
/*0x7b19*/  .byte 0x0c
/*0x7b1a*/  .byte 0xff
/*0x7b1b*/  .byte 0x0c
/*0x7b1c*/  .byte 0x0f
/*0x7b1d*/  .byte 0x0c
/*0x7b1e*/  .byte 0xff
/*0x7b1f*/  .byte 0xff
/*0x7b20*/  .byte 0xff
/*0x7b21*/  .byte 0x0c
/*0x7b22*/  .byte 0x0e
/*0x7b23*/  .byte 0x0e
/*0x7b24*/  .byte 0x0d
/*0x7b25*/  .byte 0x06
/*0x7b26*/  .byte 0xff
/*0x7b27*/  .byte 0x02
/*0x7b28*/  .byte 0x01
/*0x7b29*/  .byte 0x02
/*0x7b2a*/  .byte 0xff
/*0x7b2b*/  .byte 0x0a
/*0x7b2c*/  .byte 0x0b
/*0x7b2d*/  .byte 0x0d
/*0x7b2e*/  .byte 0x0e
/*0x7b2f*/  .byte 0x0d
/*0x7b30*/  .byte 0x0e
/*0x7b31*/  .byte 0x0d
/*0x7b32*/  .byte 0x0e
/*0x7b33*/  .byte 0x0d
/*0x7b34*/  .byte 0xff
/*0x7b35*/  .byte 0x0f
/*0x7b36*/  .byte 0x10
/*0x7b37*/  .byte 0x0f
/*0x7b38*/  .byte 0x10
/*0x7b39*/  .byte 0x0f
/*0x7b3a*/  .byte 0x10
/*0x7b3b*/  .byte 0x0f
/*0x7b3c*/  .byte 0xff
/*0x7b3d*/  .byte 0xff
/*0x7b3e*/  .byte 0xff
/*0x7b3f*/  .byte 0xff
/*0x7b40*/  .byte 0xff
/*0x7b41*/  .byte 0xff
/*0x7b42*/  .byte 0xff
/*0x7b43*/  .byte 0xff
/*0x7b44*/  .byte 0xff
/*0x7b45*/  .byte 0x00
/*0x7b46*/  .byte 0x08
/*0x7b47*/  .byte 0x01
/*0x7b48*/  .byte 0x09
/*0x7b49*/  .byte 0x02
/*0x7b4a*/  .byte 0x0a
/*0x7b4b*/  .byte 0x03
/*0x7b4c*/  .byte 0x13
/*0x7b4d*/  .byte 0x10
/*0x7b4e*/  .byte 0x18
/*0x7b4f*/  .byte 0x11
/*0x7b50*/  .byte 0x19
/*0x7b51*/  .byte 0x12
/*0x7b52*/  .byte 0x1a
/*0x7b53*/  .byte 0x1b
/*0x7b54*/  .byte 0x23
/*0x7b55*/  .byte 0x20
/*0x7b56*/  .byte 0x28
/*0x7b57*/  .byte 0x21
/*0x7b58*/  .byte 0x29
/*0x7b59*/  .byte 0x22
/*0x7b5a*/  .byte 0x2a
/*0x7b5b*/  .byte 0x2b
/*0x7b5c*/  .byte 0x33
/*0x7b5d*/  .byte 0x30
/*0x7b5e*/  .byte 0x38
/*0x7b5f*/  .byte 0x31
/*0x7b60*/  .byte 0x39
/*0x7b61*/  .byte 0x32
/*0x7b62*/  .byte 0x3a
/*0x7b63*/  .byte 0x3b
/*0x7b64*/  .byte 0x43
/*0x7b65*/  .byte 0x40
/*0x7b66*/  .byte 0x48
/*0x7b67*/  .byte 0x41
/*0x7b68*/  .byte 0x49
/*0x7b69*/  .byte 0x42
/*0x7b6a*/  .byte 0x4a
/*0x7b6b*/  .byte 0x4b
/*0x7b6c*/  .byte 0x53
/*0x7b6d*/  .byte 0x50
/*0x7b6e*/  .byte 0x58
/*0x7b6f*/  .byte 0x51
/*0x7b70*/  .byte 0x59
/*0x7b71*/  .byte 0x52
/*0x7b72*/  .byte 0x5a
/*0x7b73*/  .byte 0x5b
/*0x7b74*/  .byte 0x6b
/*0x7b75*/  .byte 0x60
/*0x7b76*/  .byte 0xff
/*0x7b77*/  .byte 0x61
/*0x7b78*/  .byte 0x71
/*0x7b79*/  .byte 0x72
/*0x7b7a*/  .byte 0xff
/*0x7b7b*/  .byte 0x74
/*0x7b7c*/  .byte 0x8c
/*0x7b7d*/  .byte 0x70
/*0x7b7e*/  .byte 0xff
/*0x7b7f*/  .byte 0xff
/*0x7b80*/  .byte 0xff
/*0x7b81*/  .byte 0x6c
/*0x7b82*/  .byte 0x83
/*0x7b83*/  .byte 0x84
/*0x7b84*/  .byte 0x7c
/*0x7b85*/  .byte 0x34
/*0x7b86*/  .byte 0xff
/*0x7b87*/  .byte 0x0c
/*0x7b88*/  .byte 0x04
/*0x7b89*/  .byte 0x14
/*0x7b8a*/  .byte 0xff
/*0x7b8b*/  .byte 0x5c
/*0x7b8c*/  .byte 0x64
/*0x7b8d*/  .byte 0x78
/*0x7b8e*/  .byte 0x80
/*0x7b8f*/  .byte 0x79
/*0x7b90*/  .byte 0x81
/*0x7b91*/  .byte 0x7a
/*0x7b92*/  .byte 0x82
/*0x7b93*/  .byte 0x7b
/*0x7b94*/  .byte 0x0b
/*0x7b95*/  .byte 0x88
/*0x7b96*/  .byte 0x90
/*0x7b97*/  .byte 0x89
/*0x7b98*/  .byte 0x91
/*0x7b99*/  .byte 0x8a
/*0x7b9a*/  .byte 0x94
/*0x7b9b*/  .byte 0x8b
/*0x7b9c*/  .byte 0xff
/*0x7b9d*/  .byte 0xff
/*0x7b9e*/  .byte 0xff
/*0x7b9f*/  .byte 0xff
/*0x7ba0*/  .byte 0xff
/*0x7ba1*/  .byte 0xff
/*0x7ba2*/  .byte 0xff
/*0x7ba3*/  .byte 0xff
/*0x7ba4*/  .byte 0xff
/*0x7ba5*/  .byte 0x00
/*0x7ba6*/  .byte 0x24
/*0x7ba7*/  .byte 0x49
/*0x7ba8*/  .byte 0x6d
/*0x7ba9*/  .byte 0x92
/*0x7baa*/  .byte 0xb6
/*0x7bab*/  .byte 0xdb
/*0x7bac*/  .byte 0xff
/*0x7bad*/  .byte 0xaa
/*0x7bae*/  .byte 0x55
/*0x7baf*/  .byte 0x00
/*0x7bb0*/  .byte 0x01
/*0x7bb1*/  .byte 0x01
/*0x7bb2*/  .byte 0x00
/*0x7bb3*/  .byte 0x01
/*0x7bb4*/  .byte 0x02
/*0x7bb5*/  .byte 0x07
/*0x7bb6*/  .byte 0x05
/*0x7bb7*/  .byte 0x00
/*0x7bb8*/  .byte 0x01
/*0x7bb9*/  .byte 0x05
/*0x7bba*/  .byte 0x29
/*0x7bbb*/  .byte 0x1e
/*0x7bbc*/  .byte 0x2b
/*0x7bbd*/  .byte 0x14
/*0x7bbe*/  .byte 0x39
/*0x7bbf*/  .byte 0x04
/*0x7bc0*/  .byte 0xe1
/*0x7bc1*/  .byte 0x1d
/*0x7bc2*/  .byte 0x1f
/*0x7bc3*/  .byte 0x20
/*0x7bc4*/  .byte 0x1a
/*0x7bc5*/  .byte 0x08
/*0x7bc6*/  .byte 0x16
/*0x7bc7*/  .byte 0x07
/*0x7bc8*/  .byte 0x1b
/*0x7bc9*/  .byte 0x06
/*0x7bca*/  .byte 0x21
/*0x7bcb*/  .byte 0x22
/*0x7bcc*/  .byte 0x15
/*0x7bcd*/  .byte 0x17
/*0x7bce*/  .byte 0x09
/*0x7bcf*/  .byte 0x0a
/*0x7bd0*/  .byte 0x19
/*0x7bd1*/  .byte 0x05
/*0x7bd2*/  .byte 0x23
/*0x7bd3*/  .byte 0x24
/*0x7bd4*/  .byte 0x1c
/*0x7bd5*/  .byte 0x18
/*0x7bd6*/  .byte 0x0b
/*0x7bd7*/  .byte 0x0d
/*0x7bd8*/  .byte 0x11
/*0x7bd9*/  .byte 0x10
/*0x7bda*/  .byte 0x25
/*0x7bdb*/  .byte 0x26
/*0x7bdc*/  .byte 0x0c
/*0x7bdd*/  .byte 0x12
/*0x7bde*/  .byte 0x0e
/*0x7bdf*/  .byte 0x0f
/*0x7be0*/  .byte 0x36
/*0x7be1*/  .byte 0x37
/*0x7be2*/  .byte 0x27
/*0x7be3*/  .byte 0x2d
/*0x7be4*/  .byte 0x13
/*0x7be5*/  .byte 0x2f
/*0x7be6*/  .byte 0x33
/*0x7be7*/  .byte 0x34
/*0x7be8*/  .byte 0x38
/*0x7be9*/  .byte 0xe5
/*0x7bea*/  .byte 0x2e
/*0x7beb*/  .byte 0xc5
/*0x7bec*/  .byte 0x30
/*0x7bed*/  .byte 0x31
/*0x7bee*/  .byte 0x28
/*0x7bef*/  .byte 0x32
/*0x7bf0*/  .byte 0xe4
/*0x7bf1*/  .byte 0x63
/*0x7bf2*/  .byte 0x2a
/*0x7bf3*/  .byte 0x35
/*0x7bf4*/  .byte 0xcb
/*0x7bf5*/  .byte 0x00
/*0x7bf6*/  .byte 0xcf
/*0x7bf7*/  .byte 0x5a
/*0x7bf8*/  .byte 0xcc
/*0x7bf9*/  .byte 0x62
/*0x7bfa*/  .byte 0x2c
/*0x7bfb*/  .byte 0xc8
/*0x7bfc*/  .byte 0xe3
/*0x7bfd*/  .byte 0xe0
/*0x7bfe*/  .byte 0xe2
/*0x7bff*/  .byte 0xc7
/*0x7c00*/  .byte 0xe6
/*0x7c01*/  .byte 0xe8
/*0x7c02*/  .byte 0x53
/*0x7c03*/  .byte 0x54
/*0x7c04*/  .byte 0x5f
/*0x7c05*/  .byte 0x60
/*0x7c06*/  .byte 0x5c
/*0x7c07*/  .byte 0x5d
/*0x7c08*/  .byte 0x59
/*0x7c09*/  .byte 0x64
/*0x7c0a*/  .byte 0x55
/*0x7c0b*/  .byte 0x56
/*0x7c0c*/  .byte 0x61
/*0x7c0d*/  .byte 0x57
/*0x7c0e*/  .byte 0x5e
/*0x7c0f*/  .byte 0x58
/*0x7c10*/  .byte 0x5b
/*0x7c11*/  .byte 0xc6
/*0x7c12*/  .byte 0x02
/*0x7c13*/  .byte 0x09
/*0x7c14*/  .byte 0x00
/*0x7c15*/  .byte 0x05
/*0x7c16*/  .byte 0x00
/*0x7c17*/  .byte 0x06
/*0x7c18*/  .byte 0x00
/*0x7c19*/  .byte 0x07
/*0x7c1a*/  .byte 0x02
/*0x7c1b*/  .byte 0x0b
/*0x7c1c*/  .byte 0x02
/*0x7c1d*/  .byte 0x0d
/*0x7c1e*/  .byte 0x02
/*0x7c1f*/  .byte 0x0e
/*0x7c20*/  .byte 0x02
/*0x7c21*/  .byte 0x0f
/*0x7c22*/  .byte 0x00
/*0x7c23*/  .byte 0x04
/*0x7c24*/  .byte 0x01
/*0x7c25*/  .byte 0x0a
/*0x7c26*/  .byte 0x03
/*0x7c27*/  .byte 0x00
/*0x7c28*/  .byte 0x01
/*0x7c29*/  .byte 0x0b
/*0x7c2a*/  .byte 0x00
/*0x7c2b*/  .byte 0x0b
/*0x7c2c*/  .byte 0x00
/*0x7c2d*/  .byte 0x00
/*0x7c2e*/  .byte 0x00
/*0x7c2f*/  .byte 0x01
/*0x7c30*/  .byte 0x00
/*0x7c31*/  .byte 0x02
/*0x7c32*/  .byte 0x00
/*0x7c33*/  .byte 0x03
/*0x7c34*/  .byte 0x03
/*0x7c35*/  .byte 0x01
/*0x7c36*/  .byte 0x02
/*0x7c37*/  .byte 0x0a
/*0x7c38*/  .byte 0x24
/*0x7c39*/  .byte 0x00
/*0x7c3a*/  .byte 0x0b
/*0x7c3b*/  .byte 0x40
/*0x7c3c*/  .byte 0x10
/*0x7c3d*/  .byte 0x00
/*0x7c3e*/  .byte 0x00
/*0x7c3f*/  .byte 0x00
/*0x7c40*/  .byte 0x24
/*0x7c41*/  .byte 0x20
/*0x7c42*/  .byte 0x0b
/*0x7c43*/  .byte 0x40
/*0x7c44*/  .byte 0x00
/*0x7c45*/  .byte 0x04
/*0x7c46*/  .byte 0x00
/*0x7c47*/  .byte 0x00
/*0x7c48*/  .byte 0x24
/*0x7c49*/  .byte 0x60
/*0x7c4a*/  .byte 0x0b
/*0x7c4b*/  .byte 0x40
/*0x7c4c*/  .byte 0x01
/*0x7c4d*/  .byte 0x00
/*0x7c4e*/  .byte 0x00
/*0x7c4f*/  .byte 0x00
/*0x7c50*/  .byte 0x24
/*0x7c51*/  .byte 0x20
/*0x7c52*/  .byte 0x0b
/*0x7c53*/  .byte 0x40
/*0x7c54*/  .byte 0x00
/*0x7c55*/  .byte 0x08
/*0x7c56*/  .byte 0x00
/*0x7c57*/  .byte 0x00
/*0x7c58*/  .byte 0x24
/*0x7c59*/  .byte 0x00
/*0x7c5a*/  .byte 0x0b
/*0x7c5b*/  .byte 0x40
/*0x7c5c*/  .byte 0x00
/*0x7c5d*/  .byte 0x08
/*0x7c5e*/  .byte 0x00
/*0x7c5f*/  .byte 0x00
/*0x7c60*/  .byte 0x24
/*0x7c61*/  .byte 0x00
/*0x7c62*/  .byte 0x0b
/*0x7c63*/  .byte 0x40
/*0x7c64*/  .byte 0x01
/*0x7c65*/  .byte 0x00
/*0x7c66*/  .byte 0x00
/*0x7c67*/  .byte 0x00
/*0x7c68*/  .byte 0x24
/*0x7c69*/  .byte 0x00
/*0x7c6a*/  .byte 0x0b
/*0x7c6b*/  .byte 0x40
/*0x7c6c*/  .byte 0x02
/*0x7c6d*/  .byte 0x00
/*0x7c6e*/  .byte 0x00
/*0x7c6f*/  .byte 0x00
/*0x7c70*/  .byte 0x24
/*0x7c71*/  .byte 0x00
/*0x7c72*/  .byte 0x0b
/*0x7c73*/  .byte 0x40
/*0x7c74*/  .byte 0x04
/*0x7c75*/  .byte 0x00
/*0x7c76*/  .byte 0x00
/*0x7c77*/  .byte 0x00
/*0x7c78*/  .byte 0x24
/*0x7c79*/  .byte 0x00
/*0x7c7a*/  .byte 0x0b
/*0x7c7b*/  .byte 0x40
/*0x7c7c*/  .byte 0x08
/*0x7c7d*/  .byte 0x00
/*0x7c7e*/  .byte 0x00
/*0x7c7f*/  .byte 0x00
/*0x7c80*/  .byte 0x24
/*0x7c81*/  .byte 0x60
/*0x7c82*/  .byte 0x0b
/*0x7c83*/  .byte 0x40
/*0x7c84*/  .byte 0x02
/*0x7c85*/  .byte 0x00
/*0x7c86*/  .byte 0x00
/*0x7c87*/  .byte 0x00
/*0x7c88*/  .byte 0x24
/*0x7c89*/  .byte 0x40
/*0x7c8a*/  .byte 0x0b
/*0x7c8b*/  .byte 0x40
/*0x7c8c*/  .byte 0x00
/*0x7c8d*/  .byte 0x04
/*0x7c8e*/  .byte 0x00
/*0x7c8f*/  .byte 0x00
/*0x7c90*/  .byte 0x2d
/*0x7c91*/  .byte 0x2f
/*0x7c92*/  .byte 0x2e
/*0x7c93*/  .byte 0x30
/*0x7c94*/  .byte 0x14
/*0x7c95*/  .byte 0x34
/*0x7c96*/  .byte 0x1a
/*0x7c97*/  .byte 0x36
/*0x7c98*/  .byte 0x08
/*0x7c99*/  .byte 0x37
/*0x7c9a*/  .byte 0x15
/*0x7c9b*/  .byte 0x13
/*0x7c9c*/  .byte 0x17
/*0x7c9d*/  .byte 0x1c
/*0x7c9e*/  .byte 0x1c
/*0x7c9f*/  .byte 0x09
/*0x7ca0*/  .byte 0x18
/*0x7ca1*/  .byte 0x0a
/*0x7ca2*/  .byte 0x0c
/*0x7ca3*/  .byte 0x06
/*0x7ca4*/  .byte 0x12
/*0x7ca5*/  .byte 0x15
/*0x7ca6*/  .byte 0x13
/*0x7ca7*/  .byte 0x0f
/*0x7ca8*/  .byte 0x2f
/*0x7ca9*/  .byte 0x38
/*0x7caa*/  .byte 0x30
/*0x7cab*/  .byte 0x2e
/*0x7cac*/  .byte 0x16
/*0x7cad*/  .byte 0x12
/*0x7cae*/  .byte 0x07
/*0x7caf*/  .byte 0x08
/*0x7cb0*/  .byte 0x09
/*0x7cb1*/  .byte 0x18
/*0x7cb2*/  .byte 0x0a
/*0x7cb3*/  .byte 0x0c
/*0x7cb4*/  .byte 0x0b
/*0x7cb5*/  .byte 0x07
/*0x7cb6*/  .byte 0x0d
/*0x7cb7*/  .byte 0x0b
/*0x7cb8*/  .byte 0x0e
/*0x7cb9*/  .byte 0x17
/*0x7cba*/  .byte 0x0f
/*0x7cbb*/  .byte 0x11
/*0x7cbc*/  .byte 0x33
/*0x7cbd*/  .byte 0x16
/*0x7cbe*/  .byte 0x34
/*0x7cbf*/  .byte 0x2d
/*0x7cc0*/  .byte 0x1d
/*0x7cc1*/  .byte 0x33
/*0x7cc2*/  .byte 0x1b
/*0x7cc3*/  .byte 0x14
/*0x7cc4*/  .byte 0x06
/*0x7cc5*/  .byte 0x0d
/*0x7cc6*/  .byte 0x19
/*0x7cc7*/  .byte 0x0e
/*0x7cc8*/  .byte 0x05
/*0x7cc9*/  .byte 0x1b
/*0x7cca*/  .byte 0x11
/*0x7ccb*/  .byte 0x05
/*0x7ccc*/  .byte 0x10
/*0x7ccd*/  .byte 0x10
/*0x7cce*/  .byte 0x36
/*0x7ccf*/  .byte 0x1a
/*0x7cd0*/  .byte 0x37
/*0x7cd1*/  .byte 0x19
/*0x7cd2*/  .byte 0x38
/*0x7cd3*/  .byte 0x1d
/*0x7cd4*/  .byte 0x08
/*0x7cd5*/  .byte 0x09
/*0x7cd6*/  .byte 0x15
/*0x7cd7*/  .byte 0x13
/*0x7cd8*/  .byte 0x17
/*0x7cd9*/  .byte 0x0a
/*0x7cda*/  .byte 0x1c
/*0x7cdb*/  .byte 0x0d
/*0x7cdc*/  .byte 0x18
/*0x7cdd*/  .byte 0x0f
/*0x7cde*/  .byte 0x0c
/*0x7cdf*/  .byte 0x18
/*0x7ce0*/  .byte 0x12
/*0x7ce1*/  .byte 0x1c
/*0x7ce2*/  .byte 0x13
/*0x7ce3*/  .byte 0x33
/*0x7ce4*/  .byte 0x16
/*0x7ce5*/  .byte 0x15
/*0x7ce6*/  .byte 0x07
/*0x7ce7*/  .byte 0x16
/*0x7ce8*/  .byte 0x09
/*0x7ce9*/  .byte 0x17
/*0x7cea*/  .byte 0x0a
/*0x7ceb*/  .byte 0x07
/*0x7cec*/  .byte 0x0d
/*0x7ced*/  .byte 0x11
/*0x7cee*/  .byte 0x0e
/*0x7cef*/  .byte 0x08
/*0x7cf0*/  .byte 0x0f
/*0x7cf1*/  .byte 0x0c
/*0x7cf2*/  .byte 0x33
/*0x7cf3*/  .byte 0x12
/*0x7cf4*/  .byte 0x11
/*0x7cf5*/  .byte 0x0e
/*0x7cf6*/  .byte 0x00
/*0x7cf7*/  .byte 0x01
/*0x7cf8*/  .byte 0x02
/*0x7cf9*/  .byte 0x02
/*0x7cfa*/  .byte 0x01
/*0x7cfb*/  .byte 0x07
/*0x7cfc*/  .byte 0x02
/*0x7cfd*/  .byte 0x00
/*0x7cfe*/  .byte 0x01
/*0x7cff*/  .byte 0x05
/*0x7d00*/  .byte 0x02
/*0x7d01*/  .byte 0x04
/*0x7d02*/  .byte 0x07
/*0x7d03*/  .byte 0x01
/*0x7d04*/  .byte 0x00
/*0x7d05*/  .byte 0x01
/*0x7d06*/  .byte 0x05
/*0x7d07*/  .byte 0x02
/*0x7d08*/  .byte 0x05
/*0x7d09*/  .byte 0x07
/*0x7d0a*/  .byte 0x01
/*0x7d0b*/  .byte 0x00
/*0x7d0c*/  .byte 0x01
/*0x7d0d*/  .byte 0x05
/*0x7d0e*/  .byte 0x02
/*0x7d0f*/  .byte 0x06
/*0x7d10*/  .byte 0x07
/*0x7d11*/  .byte 0x01
/*0x7d12*/  .byte 0x00
/*0x7d13*/  .byte 0x01
/*0x7d14*/  .byte 0x05
/*0x7d15*/  .byte 0x01
/*0x7d16*/  .byte 0x01
/*0x7d17*/  .byte 0x07
/*0x7d18*/  .byte 0x01
/*0x7d19*/  .byte 0x00
/*0x7d1a*/  .byte 0x01
/*0x7d1b*/  .byte 0x05
/*0x7d1c*/  .byte 0x00
/*0x7d1d*/  .byte 0x08
/*0x7d1e*/  .byte 0x07
/*0x7d1f*/  .byte 0x00
/*0x7d20*/  .byte 0x00
/*0x7d21*/  .byte 0x01
/*0x7d22*/  .byte 0x05
/*0x7d23*/  .byte 0x00
/*0x7d24*/  .byte 0x0e
/*0x7d25*/  .byte 0x07
/*0x7d26*/  .byte 0x00
/*0x7d27*/  .byte 0x00
/*0x7d28*/  .byte 0x01
/*0x7d29*/  .byte 0x05
/*0x7d2a*/  .byte 0x00
/*0x7d2b*/  .byte 0x0f
/*0x7d2c*/  .byte 0x07
/*0x7d2d*/  .byte 0x00
/*0x7d2e*/  .byte 0x00
/*0x7d2f*/  .byte 0x01
/*0x7d30*/  .byte 0x05
/*0x7d31*/  .byte 0x02
/*0x7d32*/  .byte 0x03
/*0x7d33*/  .byte 0x00
/*0x7d34*/  .byte 0x00
/*0x7d35*/  .byte 0x00
/*0x7d36*/  .byte 0x01
/*0x7d37*/  .byte 0x05
/*0x7d38*/  .byte 0x00
/*0x7d39*/  .byte 0x00
/*0x7d3a*/  .byte 0x13
/*0x7d3b*/  .byte 0x00
/*0x7d3c*/  .byte 0x26
/*0x7d3d*/  .byte 0x00
/*0x7d3e*/  .byte 0x3a
/*0x7d3f*/  .byte 0x00
/*0x7d40*/  .byte 0x4e
/*0x7d41*/  .byte 0x00
/*0x7d42*/  .byte 0x62
/*0x7d43*/  .byte 0x00
/*0x7d44*/  .byte 0x77
/*0x7d45*/  .byte 0x00
/*0x7d46*/  .byte 0x8c
/*0x7d47*/  .byte 0x00
/*0x7d48*/  .byte 0xa1
/*0x7d49*/  .byte 0x00
/*0x7d4a*/  .byte 0xb7
/*0x7d4b*/  .byte 0x00
/*0x7d4c*/  .byte 0xcd
/*0x7d4d*/  .byte 0x00
/*0x7d4e*/  .byte 0xe3
/*0x7d4f*/  .byte 0x00
/*0x7d50*/  .byte 0xfa
/*0x7d51*/  .byte 0x00
/*0x7d52*/  .byte 0x11
/*0x7d53*/  .byte 0x01
/*0x7d54*/  .byte 0x28
/*0x7d55*/  .byte 0x01
/*0x7d56*/  .byte 0x40
/*0x7d57*/  .byte 0x01
/*0x7d58*/  .byte 0x58
/*0x7d59*/  .byte 0x01
/*0x7d5a*/  .byte 0x71
/*0x7d5b*/  .byte 0x01
/*0x7d5c*/  .byte 0x8a
/*0x7d5d*/  .byte 0x01
/*0x7d5e*/  .byte 0xa3
/*0x7d5f*/  .byte 0x01
/*0x7d60*/  .byte 0xbd
/*0x7d61*/  .byte 0x01
/*0x7d62*/  .byte 0xd7
/*0x7d63*/  .byte 0x01
/*0x7d64*/  .byte 0xf1
/*0x7d65*/  .byte 0x01
/*0x7d66*/  .byte 0x0c
/*0x7d67*/  .byte 0x02
/*0x7d68*/  .byte 0x28
/*0x7d69*/  .byte 0x02
/*0x7d6a*/  .byte 0x43
/*0x7d6b*/  .byte 0x02
/*0x7d6c*/  .byte 0x60
/*0x7d6d*/  .byte 0x02
/*0x7d6e*/  .byte 0x7c
/*0x7d6f*/  .byte 0x02
/*0x7d70*/  .byte 0x9a
/*0x7d71*/  .byte 0x02
/*0x7d72*/  .byte 0xb7
/*0x7d73*/  .byte 0x02
/*0x7d74*/  .byte 0xd5
/*0x7d75*/  .byte 0x02
/*0x7d76*/  .byte 0xf4
/*0x7d77*/  .byte 0x02
/*0x7d78*/  .byte 0x13
/*0x7d79*/  .byte 0x03
/*0x7d7a*/  .byte 0x32
/*0x7d7b*/  .byte 0x03
/*0x7d7c*/  .byte 0x53
/*0x7d7d*/  .byte 0x03
/*0x7d7e*/  .byte 0x73
/*0x7d7f*/  .byte 0x03
/*0x7d80*/  .byte 0x94
/*0x7d81*/  .byte 0x03
/*0x7d82*/  .byte 0xb6
/*0x7d83*/  .byte 0x03
/*0x7d84*/  .byte 0xd8
/*0x7d85*/  .byte 0x03
/*0x7d86*/  .byte 0xfb
/*0x7d87*/  .byte 0x03
/*0x7d88*/  .byte 0x1e
/*0x7d89*/  .byte 0x04
/*0x7d8a*/  .byte 0x42
/*0x7d8b*/  .byte 0x04
/*0x7d8c*/  .byte 0x66
/*0x7d8d*/  .byte 0x04
/*0x7d8e*/  .byte 0x8b
/*0x7d8f*/  .byte 0x04
/*0x7d90*/  .byte 0xb1
/*0x7d91*/  .byte 0x04
/*0x7d92*/  .byte 0xd7
/*0x7d93*/  .byte 0x04
/*0x7d94*/  .byte 0xfd
/*0x7d95*/  .byte 0x04
/*0x7d96*/  .byte 0x25
/*0x7d97*/  .byte 0x05
/*0x7d98*/  .byte 0x4d
/*0x7d99*/  .byte 0x05
/*0x7d9a*/  .byte 0x75
/*0x7d9b*/  .byte 0x05
/*0x7d9c*/  .byte 0x9f
/*0x7d9d*/  .byte 0x05
/*0x7d9e*/  .byte 0xc8
/*0x7d9f*/  .byte 0x05
/*0x7da0*/  .byte 0xf3
/*0x7da1*/  .byte 0x05
/*0x7da2*/  .byte 0x1e
/*0x7da3*/  .byte 0x06
/*0x7da4*/  .byte 0x4a
/*0x7da5*/  .byte 0x06
/*0x7da6*/  .byte 0x77
/*0x7da7*/  .byte 0x06
/*0x7da8*/  .byte 0xa4
/*0x7da9*/  .byte 0x06
/*0x7daa*/  .byte 0xd2
/*0x7dab*/  .byte 0x06
/*0x7dac*/  .byte 0x01
/*0x7dad*/  .byte 0x07
/*0x7dae*/  .byte 0x31
/*0x7daf*/  .byte 0x07
/*0x7db0*/  .byte 0x61
/*0x7db1*/  .byte 0x07
/*0x7db2*/  .byte 0x92
/*0x7db3*/  .byte 0x07
/*0x7db4*/  .byte 0xc4
/*0x7db5*/  .byte 0x07
/*0x7db6*/  .byte 0xf6
/*0x7db7*/  .byte 0x07
/*0x7db8*/  .byte 0x2a
/*0x7db9*/  .byte 0x08
/*0x7dba*/  .byte 0x5e
/*0x7dbb*/  .byte 0x08
/*0x7dbc*/  .byte 0x93
/*0x7dbd*/  .byte 0x08
/*0x7dbe*/  .byte 0xc9
/*0x7dbf*/  .byte 0x08
/*0x7dc0*/  .byte 0x00
/*0x7dc1*/  .byte 0x09
/*0x7dc2*/  .byte 0x38
/*0x7dc3*/  .byte 0x09
/*0x7dc4*/  .byte 0x70
/*0x7dc5*/  .byte 0x09
/*0x7dc6*/  .byte 0xaa
/*0x7dc7*/  .byte 0x09
/*0x7dc8*/  .byte 0xe4
/*0x7dc9*/  .byte 0x09
/*0x7dca*/  .byte 0x1f
/*0x7dcb*/  .byte 0x0a
/*0x7dcc*/  .byte 0x5b
/*0x7dcd*/  .byte 0x0a
/*0x7dce*/  .byte 0x99
/*0x7dcf*/  .byte 0x0a
/*0x7dd0*/  .byte 0xd7
/*0x7dd1*/  .byte 0x0a
/*0x7dd2*/  .byte 0x16
/*0x7dd3*/  .byte 0x0b
/*0x7dd4*/  .byte 0x56
/*0x7dd5*/  .byte 0x0b
/*0x7dd6*/  .byte 0x97
/*0x7dd7*/  .byte 0x0b
/*0x7dd8*/  .byte 0xd9
/*0x7dd9*/  .byte 0x0b
/*0x7dda*/  .byte 0x1d
/*0x7ddb*/  .byte 0x0c
/*0x7ddc*/  .byte 0x61
/*0x7ddd*/  .byte 0x0c
/*0x7dde*/  .byte 0xa6
/*0x7ddf*/  .byte 0x0c
/*0x7de0*/  .byte 0xed
/*0x7de1*/  .byte 0x0c
/*0x7de2*/  .byte 0x34
/*0x7de3*/  .byte 0x0d
/*0x7de4*/  .byte 0x7d
/*0x7de5*/  .byte 0x0d
/*0x7de6*/  .byte 0xc7
/*0x7de7*/  .byte 0x0d
/*0x7de8*/  .byte 0x12
/*0x7de9*/  .byte 0x0e
/*0x7dea*/  .byte 0x5e
/*0x7deb*/  .byte 0x0e
/*0x7dec*/  .byte 0xac
/*0x7ded*/  .byte 0x0e
/*0x7dee*/  .byte 0xfb
/*0x7def*/  .byte 0x0e
/*0x7df0*/  .byte 0x4b
/*0x7df1*/  .byte 0x0f
/*0x7df2*/  .byte 0x9c
/*0x7df3*/  .byte 0x0f
/*0x7df4*/  .byte 0xee
/*0x7df5*/  .byte 0x0f
/*0x7df6*/  .byte 0x42
/*0x7df7*/  .byte 0x10
/*0x7df8*/  .byte 0x97
/*0x7df9*/  .byte 0x10
/*0x7dfa*/  .byte 0xee
/*0x7dfb*/  .byte 0x10
/*0x7dfc*/  .byte 0x46
/*0x7dfd*/  .byte 0x11
/*0x7dfe*/  .byte 0x9f
/*0x7dff*/  .byte 0x11
/*0x7e00*/  .byte 0xfa
/*0x7e01*/  .byte 0x11
/*0x7e02*/  .byte 0x56
/*0x7e03*/  .byte 0x12
/*0x7e04*/  .byte 0xb4
/*0x7e05*/  .byte 0x12
/*0x7e06*/  .byte 0x13
/*0x7e07*/  .byte 0x13
/*0x7e08*/  .byte 0x73
/*0x7e09*/  .byte 0x13
/*0x7e0a*/  .byte 0xd5
/*0x7e0b*/  .byte 0x13
/*0x7e0c*/  .byte 0x39
/*0x7e0d*/  .byte 0x14
/*0x7e0e*/  .byte 0x9e
/*0x7e0f*/  .byte 0x14
/*0x7e10*/  .byte 0x05
/*0x7e11*/  .byte 0x15
/*0x7e12*/  .byte 0x6e
/*0x7e13*/  .byte 0x15
/*0x7e14*/  .byte 0xd8
/*0x7e15*/  .byte 0x15
/*0x7e16*/  .byte 0x44
/*0x7e17*/  .byte 0x16
/*0x7e18*/  .byte 0xb2
/*0x7e19*/  .byte 0x16
/*0x7e1a*/  .byte 0x21
/*0x7e1b*/  .byte 0x17
/*0x7e1c*/  .byte 0x92
/*0x7e1d*/  .byte 0x17
/*0x7e1e*/  .byte 0x05
/*0x7e1f*/  .byte 0x18
/*0x7e20*/  .byte 0x7a
/*0x7e21*/  .byte 0x18
/*0x7e22*/  .byte 0xf0
/*0x7e23*/  .byte 0x18
/*0x7e24*/  .byte 0x69
/*0x7e25*/  .byte 0x19
/*0x7e26*/  .byte 0xe3
/*0x7e27*/  .byte 0x19
/*0x7e28*/  .byte 0x5f
/*0x7e29*/  .byte 0x1a
/*0x7e2a*/  .byte 0xde
/*0x7e2b*/  .byte 0x1a
/*0x7e2c*/  .byte 0x5e
/*0x7e2d*/  .byte 0x1b
/*0x7e2e*/  .byte 0xe0
/*0x7e2f*/  .byte 0x1b
/*0x7e30*/  .byte 0x65
/*0x7e31*/  .byte 0x1c
/*0x7e32*/  .byte 0xeb
/*0x7e33*/  .byte 0x1c
/*0x7e34*/  .byte 0x74
/*0x7e35*/  .byte 0x1d
/*0x7e36*/  .byte 0xff
/*0x7e37*/  .byte 0x1d
/*0x7e38*/  .byte 0x8c
/*0x7e39*/  .byte 0x1e
/*0x7e3a*/  .byte 0x1b
/*0x7e3b*/  .byte 0x1f
/*0x7e3c*/  .byte 0xac
/*0x7e3d*/  .byte 0x1f
/*0x7e3e*/  .byte 0x40
/*0x7e3f*/  .byte 0x20
/*0x7e40*/  .byte 0xd6
/*0x7e41*/  .byte 0x20
/*0x7e42*/  .byte 0x6f
/*0x7e43*/  .byte 0x21
/*0x7e44*/  .byte 0x0a
/*0x7e45*/  .byte 0x22
/*0x7e46*/  .byte 0xa8
/*0x7e47*/  .byte 0x22
/*0x7e48*/  .byte 0x48
/*0x7e49*/  .byte 0x23
/*0x7e4a*/  .byte 0xea
/*0x7e4b*/  .byte 0x23
/*0x7e4c*/  .byte 0x8f
/*0x7e4d*/  .byte 0x24
/*0x7e4e*/  .byte 0x37
/*0x7e4f*/  .byte 0x25
/*0x7e50*/  .byte 0xe1
/*0x7e51*/  .byte 0x25
/*0x7e52*/  .byte 0x8e
/*0x7e53*/  .byte 0x26
/*0x7e54*/  .byte 0x3e
/*0x7e55*/  .byte 0x27
/*0x7e56*/  .byte 0xf1
/*0x7e57*/  .byte 0x27
/*0x7e58*/  .byte 0xa6
/*0x7e59*/  .byte 0x28
/*0x7e5a*/  .byte 0x5f
/*0x7e5b*/  .byte 0x29
/*0x7e5c*/  .byte 0x1a
/*0x7e5d*/  .byte 0x2a
/*0x7e5e*/  .byte 0xd8
/*0x7e5f*/  .byte 0x2a
/*0x7e60*/  .byte 0x99
/*0x7e61*/  .byte 0x2b
/*0x7e62*/  .byte 0x5e
/*0x7e63*/  .byte 0x2c
/*0x7e64*/  .byte 0x25
/*0x7e65*/  .byte 0x2d
/*0x7e66*/  .byte 0xf0
/*0x7e67*/  .byte 0x2d
/*0x7e68*/  .byte 0xbe
/*0x7e69*/  .byte 0x2e
/*0x7e6a*/  .byte 0x8f
/*0x7e6b*/  .byte 0x2f
/*0x7e6c*/  .byte 0x63
/*0x7e6d*/  .byte 0x30
/*0x7e6e*/  .byte 0x3b
/*0x7e6f*/  .byte 0x31
/*0x7e70*/  .byte 0x16
/*0x7e71*/  .byte 0x32
/*0x7e72*/  .byte 0xf5
/*0x7e73*/  .byte 0x32
/*0x7e74*/  .byte 0xd7
/*0x7e75*/  .byte 0x33
/*0x7e76*/  .byte 0xbd
/*0x7e77*/  .byte 0x34
/*0x7e78*/  .byte 0xa7
/*0x7e79*/  .byte 0x35
/*0x7e7a*/  .byte 0x94
/*0x7e7b*/  .byte 0x36
/*0x7e7c*/  .byte 0x85
/*0x7e7d*/  .byte 0x37
/*0x7e7e*/  .byte 0x7a
/*0x7e7f*/  .byte 0x38
/*0x7e80*/  .byte 0x72
/*0x7e81*/  .byte 0x39
/*0x7e82*/  .byte 0x6f
/*0x7e83*/  .byte 0x3a
/*0x7e84*/  .byte 0x70
/*0x7e85*/  .byte 0x3b
/*0x7e86*/  .byte 0x74
/*0x7e87*/  .byte 0x3c
/*0x7e88*/  .byte 0x7d
/*0x7e89*/  .byte 0x3d
/*0x7e8a*/  .byte 0x8a
/*0x7e8b*/  .byte 0x3e
/*0x7e8c*/  .byte 0x9c
/*0x7e8d*/  .byte 0x3f
/*0x7e8e*/  .byte 0xb1
/*0x7e8f*/  .byte 0x40
/*0x7e90*/  .byte 0xcb
/*0x7e91*/  .byte 0x41
/*0x7e92*/  .byte 0xea
/*0x7e93*/  .byte 0x42
/*0x7e94*/  .byte 0x0d
/*0x7e95*/  .byte 0x44
/*0x7e96*/  .byte 0x35
/*0x7e97*/  .byte 0x45
/*0x7e98*/  .byte 0x61
/*0x7e99*/  .byte 0x46
/*0x7e9a*/  .byte 0x93
/*0x7e9b*/  .byte 0x47
/*0x7e9c*/  .byte 0xc9
/*0x7e9d*/  .byte 0x48
/*0x7e9e*/  .byte 0x04
/*0x7e9f*/  .byte 0x4a
/*0x7ea0*/  .byte 0x44
/*0x7ea1*/  .byte 0x4b
/*0x7ea2*/  .byte 0x89
/*0x7ea3*/  .byte 0x4c
/*0x7ea4*/  .byte 0xd3
/*0x7ea5*/  .byte 0x4d
/*0x7ea6*/  .byte 0x22
/*0x7ea7*/  .byte 0x4f
/*0x7ea8*/  .byte 0x77
/*0x7ea9*/  .byte 0x50
/*0x7eaa*/  .byte 0xd2
/*0x7eab*/  .byte 0x51
/*0x7eac*/  .byte 0x31
/*0x7ead*/  .byte 0x53
/*0x7eae*/  .byte 0x97
/*0x7eaf*/  .byte 0x54
/*0x7eb0*/  .byte 0x02
/*0x7eb1*/  .byte 0x56
/*0x7eb2*/  .byte 0x72
/*0x7eb3*/  .byte 0x57
/*0x7eb4*/  .byte 0xe9
/*0x7eb5*/  .byte 0x58
/*0x7eb6*/  .byte 0x66
/*0x7eb7*/  .byte 0x5a
/*0x7eb8*/  .byte 0xe8
/*0x7eb9*/  .byte 0x5b
/*0x7eba*/  .byte 0x71
/*0x7ebb*/  .byte 0x5d
/*0x7ebc*/  .byte 0x00
/*0x7ebd*/  .byte 0x5f
/*0x7ebe*/  .byte 0x95
/*0x7ebf*/  .byte 0x60
/*0x7ec0*/  .byte 0x31
/*0x7ec1*/  .byte 0x62
/*0x7ec2*/  .byte 0xd3
/*0x7ec3*/  .byte 0x63
/*0x7ec4*/  .byte 0x7c
/*0x7ec5*/  .byte 0x65
/*0x7ec6*/  .byte 0x2c
/*0x7ec7*/  .byte 0x67
/*0x7ec8*/  .byte 0xe3
/*0x7ec9*/  .byte 0x68
/*0x7eca*/  .byte 0xa0
/*0x7ecb*/  .byte 0x6a
/*0x7ecc*/  .byte 0x65
/*0x7ecd*/  .byte 0x6c
/*0x7ece*/  .byte 0x31
/*0x7ecf*/  .byte 0x6e
/*0x7ed0*/  .byte 0x04
/*0x7ed1*/  .byte 0x70
/*0x7ed2*/  .byte 0xde
/*0x7ed3*/  .byte 0x71
/*0x7ed4*/  .byte 0xc0
/*0x7ed5*/  .byte 0x73
/*0x7ed6*/  .byte 0xaa
/*0x7ed7*/  .byte 0x75
/*0x7ed8*/  .byte 0x9c
/*0x7ed9*/  .byte 0x77
/*0x7eda*/  .byte 0x95
/*0x7edb*/  .byte 0x79
/*0x7edc*/  .byte 0x96
/*0x7edd*/  .byte 0x7b
/*0x7ede*/  .byte 0xa0
/*0x7edf*/  .byte 0x7d
/*0x7ee0*/  .byte 0xb2
/*0x7ee1*/  .byte 0x7f
/*0x7ee2*/  .byte 0xcc
/*0x7ee3*/  .byte 0x81
/*0x7ee4*/  .byte 0xef
/*0x7ee5*/  .byte 0x83
/*0x7ee6*/  .byte 0x1a
/*0x7ee7*/  .byte 0x86
/*0x7ee8*/  .byte 0x4f
/*0x7ee9*/  .byte 0x88
/*0x7eea*/  .byte 0x8c
/*0x7eeb*/  .byte 0x8a
/*0x7eec*/  .byte 0xd3
/*0x7eed*/  .byte 0x8c
/*0x7eee*/  .byte 0x22
/*0x7eef*/  .byte 0x8f
/*0x7ef0*/  .byte 0x7b
/*0x7ef1*/  .byte 0x91
/*0x7ef2*/  .byte 0xde
/*0x7ef3*/  .byte 0x93
/*0x7ef4*/  .byte 0x4a
/*0x7ef5*/  .byte 0x96
/*0x7ef6*/  .byte 0xc0
/*0x7ef7*/  .byte 0x98
/*0x7ef8*/  .byte 0x40
/*0x7ef9*/  .byte 0x9b
/*0x7efa*/  .byte 0xcb
/*0x7efb*/  .byte 0x9d
/*0x7efc*/  .byte 0x5f
/*0x7efd*/  .byte 0xa0
/*0x7efe*/  .byte 0xff
/*0x7eff*/  .byte 0xa2
/*0x7f00*/  .byte 0xa8
/*0x7f01*/  .byte 0xa5
/*0x7f02*/  .byte 0x5d
/*0x7f03*/  .byte 0xa8
/*0x7f04*/  .byte 0x1d
/*0x7f05*/  .byte 0xab
/*0x7f06*/  .byte 0xe8
/*0x7f07*/  .byte 0xad
/*0x7f08*/  .byte 0xbe
/*0x7f09*/  .byte 0xb0
/*0x7f0a*/  .byte 0x9f
/*0x7f0b*/  .byte 0xb3
/*0x7f0c*/  .byte 0x8d
/*0x7f0d*/  .byte 0xb6
/*0x7f0e*/  .byte 0x86
/*0x7f0f*/  .byte 0xb9
/*0x7f10*/  .byte 0x8c
/*0x7f11*/  .byte 0xbc
/*0x7f12*/  .byte 0x9d
/*0x7f13*/  .byte 0xbf
/*0x7f14*/  .byte 0xbc
/*0x7f15*/  .byte 0xc2
/*0x7f16*/  .byte 0xe6
/*0x7f17*/  .byte 0xc5
/*0x7f18*/  .byte 0x1e
/*0x7f19*/  .byte 0xc9
/*0x7f1a*/  .byte 0x63
/*0x7f1b*/  .byte 0xcc
/*0x7f1c*/  .byte 0xb5
/*0x7f1d*/  .byte 0xcf
/*0x7f1e*/  .byte 0x15
/*0x7f1f*/  .byte 0xd3
/*0x7f20*/  .byte 0x82
/*0x7f21*/  .byte 0xd6
/*0x7f22*/  .byte 0xfd
/*0x7f23*/  .byte 0xd9
/*0x7f24*/  .byte 0x87
/*0x7f25*/  .byte 0xdd
/*0x7f26*/  .byte 0x1f
/*0x7f27*/  .byte 0xe1
/*0x7f28*/  .byte 0xc5
/*0x7f29*/  .byte 0xe4
/*0x7f2a*/  .byte 0x7a
/*0x7f2b*/  .byte 0xe8
/*0x7f2c*/  .byte 0x3f
/*0x7f2d*/  .byte 0xec
/*0x7f2e*/  .byte 0x12
/*0x7f2f*/  .byte 0xf0
/*0x7f30*/  .byte 0xf5
/*0x7f31*/  .byte 0xf3
/*0x7f32*/  .byte 0xe9
/*0x7f33*/  .byte 0xf7
/*0x7f34*/  .byte 0xec
/*0x7f35*/  .byte 0xfb
/*0x7f36*/  .byte 0xff
/*0x7f37*/  .byte 0xff
/*0x7f38*/  .byte 0x00
/*0x7f39*/  .byte 0x08
/*0x7f3a*/  .byte 0x10
/*0x7f3b*/  .byte 0x18
/*0x7f3c*/  .byte 0x20
/*0x7f3d*/  .byte 0x28
/*0x7f3e*/  .byte 0x30
/*0x7f3f*/  .byte 0x38
/*0x7f40*/  .byte 0x40
/*0x7f41*/  .byte 0x48
/*0x7f42*/  .byte 0x50
/*0x7f43*/  .byte 0x58
/*0x7f44*/  .byte 0x00
/*0x7f45*/  .byte 0x00
/*0x7f46*/  .byte 0x00
/*0x7f47*/  .byte 0x00
/*0x7f48*/  .byte 0x01
/*0x7f49*/  .byte 0x09
/*0x7f4a*/  .byte 0x11
/*0x7f4b*/  .byte 0x19
/*0x7f4c*/  .byte 0x21
/*0x7f4d*/  .byte 0x29
/*0x7f4e*/  .byte 0x31
/*0x7f4f*/  .byte 0x39
/*0x7f50*/  .byte 0x41
/*0x7f51*/  .byte 0x49
/*0x7f52*/  .byte 0x51
/*0x7f53*/  .byte 0x59
/*0x7f54*/  .byte 0x00
/*0x7f55*/  .byte 0x00
/*0x7f56*/  .byte 0x00
/*0x7f57*/  .byte 0x00
/*0x7f58*/  .byte 0x02
/*0x7f59*/  .byte 0x0a
/*0x7f5a*/  .byte 0x12
/*0x7f5b*/  .byte 0x1a
/*0x7f5c*/  .byte 0x22
/*0x7f5d*/  .byte 0x2a
/*0x7f5e*/  .byte 0x32
/*0x7f5f*/  .byte 0x3a
/*0x7f60*/  .byte 0x42
/*0x7f61*/  .byte 0x4a
/*0x7f62*/  .byte 0x52
/*0x7f63*/  .byte 0xff
/*0x7f64*/  .byte 0x00
/*0x7f65*/  .byte 0x00
/*0x7f66*/  .byte 0x00
/*0x7f67*/  .byte 0x00
/*0x7f68*/  .byte 0x03
/*0x7f69*/  .byte 0x0b
/*0x7f6a*/  .byte 0x13
/*0x7f6b*/  .byte 0x1b
/*0x7f6c*/  .byte 0x23
/*0x7f6d*/  .byte 0x2b
/*0x7f6e*/  .byte 0x33
/*0x7f6f*/  .byte 0xff
/*0x7f70*/  .byte 0x43
/*0x7f71*/  .byte 0x4b
/*0x7f72*/  .byte 0x53
/*0x7f73*/  .byte 0xff
/*0x7f74*/  .byte 0x00
/*0x7f75*/  .byte 0x00
/*0x7f76*/  .byte 0x00
/*0x7f77*/  .byte 0x00
/*0x7f78*/  .byte 0x04
/*0x7f79*/  .byte 0x0c
/*0x7f7a*/  .byte 0x14
/*0x7f7b*/  .byte 0x1c
/*0x7f7c*/  .byte 0x24
/*0x7f7d*/  .byte 0x2c
/*0x7f7e*/  .byte 0x34
/*0x7f7f*/  .byte 0x3c
/*0x7f80*/  .byte 0x44
/*0x7f81*/  .byte 0x4c
/*0x7f82*/  .byte 0x54
/*0x7f83*/  .byte 0xff
/*0x7f84*/  .byte 0x00
/*0x7f85*/  .byte 0x00
/*0x7f86*/  .byte 0x00
/*0x7f87*/  .byte 0x00
/*0x7f88*/  .byte 0x05
/*0x7f89*/  .byte 0x0d
/*0x7f8a*/  .byte 0x15
/*0x7f8b*/  .byte 0x1d
/*0x7f8c*/  .byte 0x25
/*0x7f8d*/  .byte 0x2d
/*0x7f8e*/  .byte 0x35
/*0x7f8f*/  .byte 0x3d
/*0x7f90*/  .byte 0x45
/*0x7f91*/  .byte 0x4d
/*0x7f92*/  .byte 0x55
/*0x7f93*/  .byte 0xff
/*0x7f94*/  .byte 0x00
/*0x7f95*/  .byte 0x00
/*0x7f96*/  .byte 0x00
/*0x7f97*/  .byte 0x00
/*0x7f98*/  .byte 0x06
/*0x7f99*/  .byte 0x0e
/*0x7f9a*/  .byte 0x16
/*0x7f9b*/  .byte 0x1e
/*0x7f9c*/  .byte 0x26
/*0x7f9d*/  .byte 0x2e
/*0x7f9e*/  .byte 0x36
/*0x7f9f*/  .byte 0x3e
/*0x7fa0*/  .byte 0x46
/*0x7fa1*/  .byte 0x4e
/*0x7fa2*/  .byte 0x56
/*0x7fa3*/  .byte 0xff
/*0x7fa4*/  .byte 0x00
/*0x7fa5*/  .byte 0x00
/*0x7fa6*/  .byte 0x00
/*0x7fa7*/  .byte 0x00
/*0x7fa8*/  .byte 0x07
/*0x7fa9*/  .byte 0x0f
/*0x7faa*/  .byte 0x17
/*0x7fab*/  .byte 0x1f
/*0x7fac*/  .byte 0x27
/*0x7fad*/  .byte 0x2f
/*0x7fae*/  .byte 0x37
/*0x7faf*/  .byte 0x3f
/*0x7fb0*/  .byte 0x47
/*0x7fb1*/  .byte 0x4f
/*0x7fb2*/  .byte 0x57
/*0x7fb3*/  .byte 0xff
/*0x7fb4*/  .byte 0x00
/*0x7fb5*/  .byte 0x00
/*0x7fb6*/  .byte 0x00
/*0x7fb7*/  .byte 0x00
/*0x7fb8*/  .byte 0x02
/*0x7fb9*/  .byte 0x00
/*0x7fba*/  .byte 0x07
/*0x7fbb*/  .byte 0x01
/*0x7fbc*/  .byte 0x00
/*0x7fbd*/  .byte 0x04
/*0x7fbe*/  .byte 0x05
/*0x7fbf*/  .byte 0x00
/*0x7fc0*/  .byte 0x09
/*0x7fc1*/  .byte 0x19
/*0x7fc2*/  .byte 0x20
/*0x7fc3*/  .byte 0x19
/*0x7fc4*/  .byte 0x08
/*0x7fc5*/  .byte 0x00
/*0x7fc6*/  .byte 0x01
/*0x7fc7*/  .byte 0x80
/*0x7fc8*/  .byte 0x12
/*0x7fc9*/  .byte 0x02
/*0x7fca*/  .byte 0x00
/*0x7fcb*/  .byte 0x00
/*0x7fcc*/  .byte 0x88
/*0x7fcd*/  .byte 0x20
/*0x7fce*/  .byte 0x00
/*0x7fcf*/  .byte 0x91
/*0x7fd0*/  .byte 0x00
/*0x7fd1*/  .byte 0x00
/*0x7fd2*/  .byte 0x00
/*0x7fd3*/  .byte 0x00
/*0x7fd4*/  .byte 0x90
/*0x7fd5*/  .byte 0x00
/*0x7fd6*/  .byte 0x01
/*0x7fd7*/  .byte 0x92
/*0x7fd8*/  .byte 0x00
/*0x7fd9*/  .byte 0x00
/*0x7fda*/  .byte 0x00
/*0x7fdb*/  .byte 0x00
/*0x7fdc*/  .byte 0xd0
/*0x7fdd*/  .byte 0x00
/*0x7fde*/  .byte 0x01
/*0x7fdf*/  .byte 0x93
/*0x7fe0*/  .byte 0x00
/*0x7fe1*/  .byte 0x00
/*0x7fe2*/  .byte 0x00
/*0x7fe3*/  .byte 0x00
/*0x7fe4*/  .byte 0x10
/*0x7fe5*/  .byte 0x01
/*0x7fe6*/  .byte 0x01
/*0x7fe7*/  .byte 0x84
/*0x7fe8*/  .byte 0x02
/*0x7fe9*/  .byte 0x00
/*0x7fea*/  .byte 0x00
/*0x7feb*/  .byte 0x00
/*0x7fec*/  .byte 0x50
/*0x7fed*/  .byte 0x21
/*0x7fee*/  .byte 0x00
/*0x7fef*/  .byte 0x85
/*0x7ff0*/  .byte 0x00
/*0x7ff1*/  .byte 0x00
/*0x7ff2*/  .byte 0x00
/*0x7ff3*/  .byte 0x00
/*0x7ff4*/  .byte 0x00
/*0x7ff5*/  .byte 0x00
/*0x7ff6*/  .byte 0x00
/*0x7ff7*/  .byte 0x00
/*0x7ff8*/  .byte 0x00
/*0x7ff9*/  .byte 0x00
/*0x7ffa*/  .byte 0x00
/*0x7ffb*/  .byte 0x00
/*0x7ffc*/  .byte 0x00
/*0x7ffd*/  .byte 0x00
/*0x7ffe*/  .byte 0x00
/*0x7fff*/  .byte 0x00
/*0x8000*/  .byte 0x00
/*0x8001*/  .byte 0x00
/*0x8002*/  .byte 0x00
/*0x8003*/  .byte 0x00
/*0x8004*/  .byte 0x05
/*0x8005*/  .byte 0x01
/*0x8006*/  .byte 0x09
/*0x8007*/  .byte 0x06
/*0x8008*/  .byte 0xa1
/*0x8009*/  .byte 0x01
/*0x800a*/  .byte 0x05
/*0x800b*/  .byte 0x07
/*0x800c*/  .byte 0x19
/*0x800d*/  .byte 0xe0
/*0x800e*/  .byte 0x29
/*0x800f*/  .byte 0xe7
/*0x8010*/  .byte 0x15
/*0x8011*/  .byte 0x00
/*0x8012*/  .byte 0x25
/*0x8013*/  .byte 0x01
/*0x8014*/  .byte 0x75
/*0x8015*/  .byte 0x01
/*0x8016*/  .byte 0x95
/*0x8017*/  .byte 0x08
/*0x8018*/  .byte 0x81
/*0x8019*/  .byte 0x02
/*0x801a*/  .byte 0x95
/*0x801b*/  .byte 0x01
/*0x801c*/  .byte 0x75
/*0x801d*/  .byte 0x08
/*0x801e*/  .byte 0x81
/*0x801f*/  .byte 0x03
/*0x8020*/  .byte 0x95
/*0x8021*/  .byte 0x03
/*0x8022*/  .byte 0x75
/*0x8023*/  .byte 0x01
/*0x8024*/  .byte 0x05
/*0x8025*/  .byte 0x08
/*0x8026*/  .byte 0x19
/*0x8027*/  .byte 0x01
/*0x8028*/  .byte 0x29
/*0x8029*/  .byte 0x03
/*0x802a*/  .byte 0x91
/*0x802b*/  .byte 0x02
/*0x802c*/  .byte 0x95
/*0x802d*/  .byte 0x01
/*0x802e*/  .byte 0x75
/*0x802f*/  .byte 0x05
/*0x8030*/  .byte 0x91
/*0x8031*/  .byte 0x03
/*0x8032*/  .byte 0x95
/*0x8033*/  .byte 0x06
/*0x8034*/  .byte 0x75
/*0x8035*/  .byte 0x08
/*0x8036*/  .byte 0x15
/*0x8037*/  .byte 0x00
/*0x8038*/  .byte 0x26
/*0x8039*/  .byte 0xa4
/*0x803a*/  .byte 0x00
/*0x803b*/  .byte 0x05
/*0x803c*/  .byte 0x07
/*0x803d*/  .byte 0x19
/*0x803e*/  .byte 0x00
/*0x803f*/  .byte 0x29
/*0x8040*/  .byte 0xa4
/*0x8041*/  .byte 0x81
/*0x8042*/  .byte 0x00
/*0x8043*/  .byte 0xc0
/*0x8044*/  .byte 0x06
/*0x8045*/  .byte 0x00
/*0x8046*/  .byte 0xff
/*0x8047*/  .byte 0x09
/*0x8048*/  .byte 0x01
/*0x8049*/  .byte 0xa1
/*0x804a*/  .byte 0x01
/*0x804b*/  .byte 0x09
/*0x804c*/  .byte 0x02
/*0x804d*/  .byte 0x15
/*0x804e*/  .byte 0x00
/*0x804f*/  .byte 0x26
/*0x8050*/  .byte 0xff
/*0x8051*/  .byte 0x00
/*0x8052*/  .byte 0x75
/*0x8053*/  .byte 0x08
/*0x8054*/  .byte 0x95
/*0x8055*/  .byte 0x40
/*0x8056*/  .byte 0x81
/*0x8057*/  .byte 0x02
/*0x8058*/  .byte 0x09
/*0x8059*/  .byte 0x03
/*0x805a*/  .byte 0x15
/*0x805b*/  .byte 0x00
/*0x805c*/  .byte 0x26
/*0x805d*/  .byte 0xff
/*0x805e*/  .byte 0x00
/*0x805f*/  .byte 0x75
/*0x8060*/  .byte 0x08
/*0x8061*/  .byte 0x95
/*0x8062*/  .byte 0x40
/*0x8063*/  .byte 0x91
/*0x8064*/  .byte 0x02
/*0x8065*/  .byte 0xc0
/*0x8066*/  .byte 0x00
/*0x8067*/  .byte 0x00
/*0x8068*/  .byte 0x05
/*0x8069*/  .byte 0x01
/*0x806a*/  .byte 0x09
/*0x806b*/  .byte 0x80
/*0x806c*/  .byte 0xa1
/*0x806d*/  .byte 0x01
/*0x806e*/  .byte 0x85
/*0x806f*/  .byte 0x01
/*0x8070*/  .byte 0x19
/*0x8071*/  .byte 0x81
/*0x8072*/  .byte 0x29
/*0x8073*/  .byte 0x83
/*0x8074*/  .byte 0x15
/*0x8075*/  .byte 0x00
/*0x8076*/  .byte 0x25
/*0x8077*/  .byte 0x01
/*0x8078*/  .byte 0x95
/*0x8079*/  .byte 0x03
/*0x807a*/  .byte 0x75
/*0x807b*/  .byte 0x01
/*0x807c*/  .byte 0x81
/*0x807d*/  .byte 0x02
/*0x807e*/  .byte 0x95
/*0x807f*/  .byte 0x01
/*0x8080*/  .byte 0x75
/*0x8081*/  .byte 0x05
/*0x8082*/  .byte 0x81
/*0x8083*/  .byte 0x01
/*0x8084*/  .byte 0xc0
/*0x8085*/  .byte 0x05
/*0x8086*/  .byte 0x0c
/*0x8087*/  .byte 0x09
/*0x8088*/  .byte 0x01
/*0x8089*/  .byte 0xa1
/*0x808a*/  .byte 0x01
/*0x808b*/  .byte 0x85
/*0x808c*/  .byte 0x02
/*0x808d*/  .byte 0x15
/*0x808e*/  .byte 0x00
/*0x808f*/  .byte 0x25
/*0x8090*/  .byte 0x01
/*0x8091*/  .byte 0x95
/*0x8092*/  .byte 0x12
/*0x8093*/  .byte 0x75
/*0x8094*/  .byte 0x01
/*0x8095*/  .byte 0x0a
/*0x8096*/  .byte 0x83
/*0x8097*/  .byte 0x01
/*0x8098*/  .byte 0x0a
/*0x8099*/  .byte 0x8a
/*0x809a*/  .byte 0x01
/*0x809b*/  .byte 0x0a
/*0x809c*/  .byte 0x92
/*0x809d*/  .byte 0x01
/*0x809e*/  .byte 0x0a
/*0x809f*/  .byte 0x94
/*0x80a0*/  .byte 0x01
/*0x80a1*/  .byte 0x09
/*0x80a2*/  .byte 0xcd
/*0x80a3*/  .byte 0x09
/*0x80a4*/  .byte 0xb7
/*0x80a5*/  .byte 0x09
/*0x80a6*/  .byte 0xb6
/*0x80a7*/  .byte 0x09
/*0x80a8*/  .byte 0xb5
/*0x80a9*/  .byte 0x09
/*0x80aa*/  .byte 0xe2
/*0x80ab*/  .byte 0x09
/*0x80ac*/  .byte 0xea
/*0x80ad*/  .byte 0x09
/*0x80ae*/  .byte 0xe9
/*0x80af*/  .byte 0x0a
/*0x80b0*/  .byte 0x21
/*0x80b1*/  .byte 0x02
/*0x80b2*/  .byte 0x0a
/*0x80b3*/  .byte 0x23
/*0x80b4*/  .byte 0x02
/*0x80b5*/  .byte 0x0a
/*0x80b6*/  .byte 0x24
/*0x80b7*/  .byte 0x02
/*0x80b8*/  .byte 0x0a
/*0x80b9*/  .byte 0x25
/*0x80ba*/  .byte 0x02
/*0x80bb*/  .byte 0x0a
/*0x80bc*/  .byte 0x26
/*0x80bd*/  .byte 0x02
/*0x80be*/  .byte 0x0a
/*0x80bf*/  .byte 0x27
/*0x80c0*/  .byte 0x02
/*0x80c1*/  .byte 0x0a
/*0x80c2*/  .byte 0x2a
/*0x80c3*/  .byte 0x02
/*0x80c4*/  .byte 0x81
/*0x80c5*/  .byte 0x02
/*0x80c6*/  .byte 0x95
/*0x80c7*/  .byte 0x01
/*0x80c8*/  .byte 0x75
/*0x80c9*/  .byte 0x0e
/*0x80ca*/  .byte 0x81
/*0x80cb*/  .byte 0x01
/*0x80cc*/  .byte 0xc0
/*0x80cd*/  .byte 0x05
/*0x80ce*/  .byte 0x01
/*0x80cf*/  .byte 0x09
/*0x80d0*/  .byte 0x06
/*0x80d1*/  .byte 0xa1
/*0x80d2*/  .byte 0x01
/*0x80d3*/  .byte 0x85
/*0x80d4*/  .byte 0x04
/*0x80d5*/  .byte 0x05
/*0x80d6*/  .byte 0x07
/*0x80d7*/  .byte 0x95
/*0x80d8*/  .byte 0x01
/*0x80d9*/  .byte 0x75
/*0x80da*/  .byte 0x08
/*0x80db*/  .byte 0x81
/*0x80dc*/  .byte 0x03
/*0x80dd*/  .byte 0x95
/*0x80de*/  .byte 0xe8
/*0x80df*/  .byte 0x75
/*0x80e0*/  .byte 0x01
/*0x80e1*/  .byte 0x15
/*0x80e2*/  .byte 0x00
/*0x80e3*/  .byte 0x25
/*0x80e4*/  .byte 0x01
/*0x80e5*/  .byte 0x05
/*0x80e6*/  .byte 0x07
/*0x80e7*/  .byte 0x19
/*0x80e8*/  .byte 0x00
/*0x80e9*/  .byte 0x29
/*0x80ea*/  .byte 0xe7
/*0x80eb*/  .byte 0x81
/*0x80ec*/  .byte 0x00
/*0x80ed*/  .byte 0xc0
/*0x80ee*/  .byte 0x00
/*0x80ef*/  .byte 0x00
/*0x80f0*/  .byte 0x3c
/*0x80f1*/  .byte 0x81
/*0x80f2*/  .byte 0x00
/*0x80f3*/  .byte 0x00
/*0x80f4*/  .byte 0x40
/*0x80f5*/  .byte 0x81
/*0x80f6*/  .byte 0x00
/*0x80f7*/  .byte 0x00
/*0x80f8*/  .byte 0x64
/*0x80f9*/  .byte 0x81
/*0x80fa*/  .byte 0x00
/*0x80fb*/  .byte 0x00
/*0x80fc*/  .byte 0x12
/*0x80fd*/  .byte 0x01
/*0x80fe*/  .byte 0x10
/*0x80ff*/  .byte 0x01
/*0x8100*/  .byte 0x00
/*0x8101*/  .byte 0x00
/*0x8102*/  .byte 0x00
/*0x8103*/  .byte 0x40
/*0x8104*/  .byte 0xd9
/*0x8105*/  .byte 0x04
/*0x8106*/  .byte 0x16
/*0x8107*/  .byte 0x02
/*0x8108*/  .byte 0x01
/*0x8109*/  .byte 0x11
/*0x810a*/  .byte 0x00
/*0x810b*/  .byte 0x01
/*0x810c*/  .byte 0x00
/*0x810d*/  .byte 0x01
/*0x810e*/  .byte 0x00
/*0x810f*/  .byte 0x00
/*0x8110*/  .byte 0x90
/*0x8111*/  .byte 0x81
/*0x8112*/  .byte 0x00
/*0x8113*/  .byte 0x00
/*0x8114*/  .byte 0x20
/*0x8115*/  .byte 0x81
/*0x8116*/  .byte 0x00
/*0x8117*/  .byte 0x00
/*0x8118*/  .byte 0x9c
/*0x8119*/  .byte 0x81
/*0x811a*/  .byte 0x00
/*0x811b*/  .byte 0x00
/*0x811c*/  .byte 0xbc
/*0x811d*/  .byte 0x81
/*0x811e*/  .byte 0x00
/*0x811f*/  .byte 0x00
/*0x8120*/  .byte 0x09
/*0x8121*/  .byte 0x04
/*0x8122*/  .byte 0x00
/*0x8123*/  .byte 0x00
/*0x8124*/  .byte 0x01
/*0x8125*/  .byte 0x03
/*0x8126*/  .byte 0x01
/*0x8127*/  .byte 0x01
/*0x8128*/  .byte 0x00
/*0x8129*/  .byte 0x09
/*0x812a*/  .byte 0x21
/*0x812b*/  .byte 0x11
/*0x812c*/  .byte 0x01
/*0x812d*/  .byte 0x00
/*0x812e*/  .byte 0x01
/*0x812f*/  .byte 0x22
/*0x8130*/  .byte 0x40
/*0x8131*/  .byte 0x00
/*0x8132*/  .byte 0x07
/*0x8133*/  .byte 0x05
/*0x8134*/  .byte 0x81
/*0x8135*/  .byte 0x03
/*0x8136*/  .byte 0x08
/*0x8137*/  .byte 0x00
/*0x8138*/  .byte 0x01
/*0x8139*/  .byte 0x00
/*0x813a*/  .byte 0x00
/*0x813b*/  .byte 0x00
/*0x813c*/  .byte 0x04
/*0x813d*/  .byte 0x03
/*0x813e*/  .byte 0x09
/*0x813f*/  .byte 0x04
/*0x8140*/  .byte 0x22
/*0x8141*/  .byte 0x03
/*0x8142*/  .byte 0x55
/*0x8143*/  .byte 0x00
/*0x8144*/  .byte 0x53
/*0x8145*/  .byte 0x00
/*0x8146*/  .byte 0x42
/*0x8147*/  .byte 0x00
/*0x8148*/  .byte 0x2d
/*0x8149*/  .byte 0x00
/*0x814a*/  .byte 0x48
/*0x814b*/  .byte 0x00
/*0x814c*/  .byte 0x49
/*0x814d*/  .byte 0x00
/*0x814e*/  .byte 0x44
/*0x814f*/  .byte 0x00
/*0x8150*/  .byte 0x20
/*0x8151*/  .byte 0x00
/*0x8152*/  .byte 0x4b
/*0x8153*/  .byte 0x00
/*0x8154*/  .byte 0x65
/*0x8155*/  .byte 0x00
/*0x8156*/  .byte 0x79
/*0x8157*/  .byte 0x00
/*0x8158*/  .byte 0x62
/*0x8159*/  .byte 0x00
/*0x815a*/  .byte 0x6f
/*0x815b*/  .byte 0x00
/*0x815c*/  .byte 0x61
/*0x815d*/  .byte 0x00
/*0x815e*/  .byte 0x72
/*0x815f*/  .byte 0x00
/*0x8160*/  .byte 0x64
/*0x8161*/  .byte 0x00
/*0x8162*/  .byte 0x00
/*0x8163*/  .byte 0x00
/*0x8164*/  .byte 0x2c
/*0x8165*/  .byte 0x03
/*0x8166*/  .byte 0x43
/*0x8167*/  .byte 0x00
/*0x8168*/  .byte 0x59
/*0x8169*/  .byte 0x00
/*0x816a*/  .byte 0x52
/*0x816b*/  .byte 0x00
/*0x816c*/  .byte 0x4d
/*0x816d*/  .byte 0x00
/*0x816e*/  .byte 0x30
/*0x816f*/  .byte 0x00
/*0x8170*/  .byte 0x32
/*0x8171*/  .byte 0x00
/*0x8172*/  .byte 0x70
/*0x8173*/  .byte 0x00
/*0x8174*/  .byte 0x30
/*0x8175*/  .byte 0x00
/*0x8176*/  .byte 0x32
/*0x8177*/  .byte 0x00
/*0x8178*/  .byte 0x31
/*0x8179*/  .byte 0x00
/*0x817a*/  .byte 0x36
/*0x817b*/  .byte 0x00
/*0x817c*/  .byte 0x68
/*0x817d*/  .byte 0x00
/*0x817e*/  .byte 0x30
/*0x817f*/  .byte 0x00
/*0x8180*/  .byte 0x30
/*0x8181*/  .byte 0x00
/*0x8182*/  .byte 0x39
/*0x8183*/  .byte 0x00
/*0x8184*/  .byte 0x37
/*0x8185*/  .byte 0x00
/*0x8186*/  .byte 0x72
/*0x8187*/  .byte 0x00
/*0x8188*/  .byte 0x30
/*0x8189*/  .byte 0x00
/*0x818a*/  .byte 0x31
/*0x818b*/  .byte 0x00
/*0x818c*/  .byte 0x30
/*0x818d*/  .byte 0x00
/*0x818e*/  .byte 0x33
/*0x818f*/  .byte 0x00
/*0x8190*/  .byte 0x09
/*0x8191*/  .byte 0x02
/*0x8192*/  .byte 0x5b
/*0x8193*/  .byte 0x00
/*0x8194*/  .byte 0x03
/*0x8195*/  .byte 0x01
/*0x8196*/  .byte 0x00
/*0x8197*/  .byte 0xa0
/*0x8198*/  .byte 0x32
/*0x8199*/  .byte 0x00
/*0x819a*/  .byte 0x00
/*0x819b*/  .byte 0x00
/*0x819c*/  .byte 0x09
/*0x819d*/  .byte 0x04
/*0x819e*/  .byte 0x01
/*0x819f*/  .byte 0x00
/*0x81a0*/  .byte 0x02
/*0x81a1*/  .byte 0x03
/*0x81a2*/  .byte 0x00
/*0x81a3*/  .byte 0x00
/*0x81a4*/  .byte 0x02
/*0x81a5*/  .byte 0x09
/*0x81a6*/  .byte 0x21
/*0x81a7*/  .byte 0x11
/*0x81a8*/  .byte 0x01
/*0x81a9*/  .byte 0x00
/*0x81aa*/  .byte 0x01
/*0x81ab*/  .byte 0x22
/*0x81ac*/  .byte 0x22
/*0x81ad*/  .byte 0x00
/*0x81ae*/  .byte 0x07
/*0x81af*/  .byte 0x05
/*0x81b0*/  .byte 0x83
/*0x81b1*/  .byte 0x03
/*0x81b2*/  .byte 0x40
/*0x81b3*/  .byte 0x00
/*0x81b4*/  .byte 0x01
/*0x81b5*/  .byte 0x07
/*0x81b6*/  .byte 0x05
/*0x81b7*/  .byte 0x04
/*0x81b8*/  .byte 0x03
/*0x81b9*/  .byte 0x40
/*0x81ba*/  .byte 0x00
/*0x81bb*/  .byte 0x01
/*0x81bc*/  .byte 0x09
/*0x81bd*/  .byte 0x04
/*0x81be*/  .byte 0x02
/*0x81bf*/  .byte 0x00
/*0x81c0*/  .byte 0x01
/*0x81c1*/  .byte 0x03
/*0x81c2*/  .byte 0x00
/*0x81c3*/  .byte 0x00
/*0x81c4*/  .byte 0x00
/*0x81c5*/  .byte 0x09
/*0x81c6*/  .byte 0x21
/*0x81c7*/  .byte 0x11
/*0x81c8*/  .byte 0x01
/*0x81c9*/  .byte 0x00
/*0x81ca*/  .byte 0x01
/*0x81cb*/  .byte 0x22
/*0x81cc*/  .byte 0x86
/*0x81cd*/  .byte 0x00
/*0x81ce*/  .byte 0x07
/*0x81cf*/  .byte 0x05
/*0x81d0*/  .byte 0x82
/*0x81d1*/  .byte 0x03
/*0x81d2*/  .byte 0x40
/*0x81d3*/  .byte 0x00
/*0x81d4*/  .byte 0x01
/*0x81d5*/  .byte 0xff
/*0x81d6*/  .byte 0xff
/*0x81d7*/  .byte 0xff
/*0x81d8*/  .byte 0x08
/*0x81d9*/  .byte 0x03
/*0x81da*/  .byte 0x01
/*0x81db*/  .byte 0x06
/*0x81dc*/  .byte 0x07
/*0x81dd*/  .byte 0x00
/*0x81de*/  .byte 0x00
/*0x81df*/  .byte 0x01
/*0x81e0*/  .byte 0x05
/*0x81e1*/  .byte 0x01
/*0x81e2*/  .byte 0x07
/*0x81e3*/  .byte 0x07
/*0x81e4*/  .byte 0x00
/*0x81e5*/  .byte 0x00
/*0x81e6*/  .byte 0x05
/*0x81e7*/  .byte 0x05
/*0x81e8*/  .byte 0x01
/*0x81e9*/  .byte 0x08
/*0x81ea*/  .byte 0x07
/*0x81eb*/  .byte 0x00
/*0x81ec*/  .byte 0x00
/*0x81ed*/  .byte 0x05
/*0x81ee*/  .byte 0x05
/*0x81ef*/  .byte 0x01
/*0x81f0*/  .byte 0x09
/*0x81f1*/  .byte 0x00
/*0x81f2*/  .byte 0x00
/*0x81f3*/  .byte 0x00
/*0x81f4*/  .byte 0x05
/*0x81f5*/  .byte 0x05
/*0x81f6*/  .byte 0x00
/*0x81f7*/  .byte 0x00
/*0x81f8*/  .byte 0x18
/*0x81f9*/  .byte 0x82
/*0x81fa*/  .byte 0x00
/*0x81fb*/  .byte 0x00
/*0x81fc*/  .byte 0x00
/*0x81fd*/  .byte 0x00
/*0x81fe*/  .byte 0x00
/*0x81ff*/  .byte 0x20
/*0x8200*/  .byte 0x10
/*0x8201*/  .byte 0x00
/*0x8202*/  .byte 0x00
/*0x8203*/  .byte 0x00
/*0x8204*/  .byte 0x5c
/*0x8205*/  .byte 0x77
/*0x8206*/  .byte 0x00
/*0x8207*/  .byte 0x00
/*0x8208*/  .byte 0x28
/*0x8209*/  .byte 0x82
/*0x820a*/  .byte 0x00
/*0x820b*/  .byte 0x00
/*0x820c*/  .byte 0x10
/*0x820d*/  .byte 0x00
/*0x820e*/  .byte 0x00
/*0x820f*/  .byte 0x20
/*0x8210*/  .byte 0x78
/*0x8211*/  .byte 0x1b
/*0x8212*/  .byte 0x00
/*0x8213*/  .byte 0x00
/*0x8214*/  .byte 0x6c
/*0x8215*/  .byte 0x77
/*0x8216*/  .byte 0x00
/*0x8217*/  .byte 0x00
/*0x8218*/  .byte 0xff
/*0x8219*/  .byte 0xff
/*0x821a*/  .byte 0x00
/*0x821b*/  .byte 0x00
/*0x821c*/  .byte 0x00
/*0x821d*/  .byte 0xa2
/*0x821e*/  .byte 0x4a
/*0x821f*/  .byte 0x04
/*0x8220*/  .byte 0xff
/*0x8221*/  .byte 0x07
/*0x8222*/  .byte 0xff
/*0x8223*/  .byte 0x01
/*0x8224*/  .byte 0x74
/*0x8225*/  .byte 0x0b
/*0x8226*/  .byte 0x00
/*0x8227*/  .byte 0x20
