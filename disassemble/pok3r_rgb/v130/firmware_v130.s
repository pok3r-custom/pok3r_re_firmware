.syntax unified
.cpu cortex-m3
.text
.thumb


.byte 0xe0
.byte 0x21
.byte 0x0
.byte 0x20

data_3404:
.word reset
data_3408:
.word nmi
data_340c:
.word hard_fault
data_3410:
.word mcu_fault
data_3414:
.word bus_fault
data_3418:
.word usage_fault

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_342c:
.word svccall_intr
data_3430:
.word debug_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_3438:
.word pendsv_intr
data_343c:
.word systick_intr
data_3440:
.word generic_intr
data_3444:
.word generic_intr
data_3448:
.word generic_intr
data_344c:
.word generic_intr
data_3450:
.word generic_intr
data_3454:
.word generic_intr
data_3458:
.word generic_intr
data_345c:
.word generic_intr
data_3460:
.word generic_intr
data_3464:
.word generic_intr
data_3468:
.word generic_intr
data_346c:
.word generic_intr
data_3470:
.word generic_intr
data_3474:
.word generic_intr
data_3478:
.word generic_intr
data_347c:
.word generic_intr
data_3480:
.word generic_intr
data_3484:
.word generic_intr
data_3488:
.word generic_intr
data_348c:
.word generic_intr
data_3490:
.word generic_intr
data_3494:
.word generic_intr
data_3498:
.word generic_intr
data_349c:
.word generic_intr
data_34a0:
.word generic_intr
data_34a4:
.word generic_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_34ac:
.word generic_intr
data_34b0:
.word generic_intr
data_34b4:
.word generic_intr
data_34b8:
.word generic_intr
data_34bc:
.word generic_intr
data_34c0:
.word generic_intr
data_34c4:
.word generic_intr
data_34c8:
.word generic_intr
data_34cc:
.word generic_intr
data_34d0:
.word generic_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_34e4:
.word loc_366c
data_34e8:
.word loc_36fc
data_34ec:
.word generic_intr
data_34f0:
.word generic_intr
data_34f4:
.word generic_intr
data_34f8:
.word generic_intr
data_34fc:
.word generic_intr
data_3500:
.word generic_intr
data_3504:
.word generic_intr
data_3508:
.word generic_intr
data_350c:
.word generic_intr
data_3510:
.word generic_intr
data_3514:
.word usb_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_351c:
.word generic_intr
data_3520:
.word generic_intr
data_3524:
.word generic_intr
data_3528:
.word generic_intr
data_352c:
.word generic_intr
data_3530:
.word generic_intr
data_3534:
.word generic_intr
data_3538:
.word generic_intr

.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

data_3550:
.word generic_intr

.thumb_func
reset:
    ldr r0, [pc, #0x1c] /* data_3574 */ 
    blx r0 /* watchdog_init */ 
    ldr r0, [pc, #0x1c] /* data_3578 */ 
    blx r0 /* clock_init */ 
    ldr r0, [pc, #0x1c] /* data_357c */ 
    bx r0 /* entry */ 
.thumb_func
nmi:
    b nmi
.thumb_func
hard_fault:
    b hard_fault
.thumb_func
mcu_fault:
    b mcu_fault
.thumb_func
bus_fault:
    b bus_fault
.thumb_func
usage_fault:
    b usage_fault
.thumb_func
svccall_intr:
    b svccall_intr
.thumb_func
debug_intr:
    b debug_intr
.thumb_func
pendsv_intr:
    b pendsv_intr
.thumb_func
systick_intr:
    b systick_intr
.thumb_func
generic_intr:
    b generic_intr

data_3574:
.word watchdog_init
data_3578:
.word clock_init
data_357c:
.word entry

.thumb_func
entry:
    ldr.w sp, [pc, #0xc] /* data_3590 */ 
    bl sram_init
call_3588:
    ldr r0, [pc, #0] /* data_358c */ 
    bx r0 /* main */ 

data_358c:
.word main
data_3590:
.word 0x200021e0

rand:
    ldr r1, [pc, #0x18] /* data_35b0 */ 
    ldr r2, [pc, #0x1c] /* data_35b4 */ 
    ldr r0, [r1]
    muls r0, r2, r0
    movw r2, #0x3039
    add r0, r2
    str r0, [r1]
    lsrs r0, r0, #1
    bx lr
srand:
    ldr r1, [pc, #4] /* data_35b0 */ 
    str r0, [r1]
    bx lr

.byte 0x0
.byte 0x0

data_35b0:
.word 0x20000064
data_35b4:
.word 0x41c64e6d

memcpy:
    orr.w r3, r0, r1
    lsls r3, r3, #0x1e
    beq jump_35c8
    b jump_35d6
jump_35c2:
    ldm r1!, {r3}
    .short 0x1f12 /* subs r2, r2, #4 */ 
    stm r0!, {r3}
jump_35c8:
    cmp r2, #4
    bhs jump_35c2
    b jump_35d6
jump_35ce:
    ldrb r3, [r1], #1
    strb r3, [r0], #1
jump_35d6:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bhs jump_35ce
    bx lr
mem_set:
    uxtb r2, r2
    b jump_35e4
jump_35e0:
    strb r2, [r0], #1
jump_35e4:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    bhs jump_35e0
    bx lr
mem_zero:
    movs r2, #0
    b mem_set
mem_set2:
    push {r4, lr}
    mov r3, r2
    mov r2, r1
    mov r4, r0
    mov r1, r3
    bl mem_set
    mov r0, r4
    pop {r4, pc}
memcmp:
    push {r4, r5, lr}
    mov r4, r0
    movs r0, #0
    mov r3, r0
    b jump_360c
jump_360a:
    .short 0x1c5b /* adds r3, r3, #1 */ 
jump_360c:
    cmp r3, r2
    bhs jump_3618
    ldrb r0, [r4, r3]
    ldrb r5, [r1, r3]
    subs r0, r0, r5
    beq jump_360a
jump_3618:
    pop {r4, r5, pc}

.byte 0x0
.byte 0x0

sram_init:
    ldr r4, [pc, #0x18] /* data_3638 */ 
    ldr r5, [pc, #0x1c] /* data_363c */ 
    b jump_3630
jump_3622:
    ldr r0, [r4, #0xc]
    orr r3, r0, #1
    ldm.w r4, {r0, r1, r2}
    blx r3
    adds r4, #0x10
jump_3630:
    cmp r4, r5
    blo jump_3622
    bl call_3588

data_3638:
.word 0x811c
data_363c:
.word 0x813c

afio_exti_ssr_write:
    push {r4, lr}
    movs r2, #0
    cmp r0, #7
    bls jump_364e
    movs r2, #1
    subs r0, #8
    uxtb r0, r0
jump_364e:
    lsls r3, r2, #2
    ldr r2, [pc, #0x14] /* data_3668 */ 
    add r2, r3
    ldr r3, [r2]
    lsls r0, r0, #2
    movs r4, #0xf
    lsls r4, r0
    bics r3, r4
    lsls r1, r0
    orrs r1, r3
    str r1, [r2]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_3668:
.word 0x40022000

.thumb_func
loc_366c:
    push {r4, lr}
    ldr r0, [pc, #0x6c] /* data_36dc */ 
    bl bftm_clear
    bl call_5fc8
    ldr r0, [pc, #0x64] /* data_36e0 */ 
    ldr r1, [r0]
    cbz r1, jump_3684
    ldr r1, [r0]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0]
jump_3684:
    ldr r1, [r0, #4]
    cbz r1, jump_368e
    ldr r1, [r0, #4]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0, #4]
jump_368e:
    ldr r0, [pc, #0x54] /* data_36e4 */ 
    ldrh r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strh r1, [r0]
    ldr r0, [pc, #0x50] /* data_36e8 */ 
    ldr r1, [r0]
    cbz r1, jump_36a2
    ldr r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    str r1, [r0]
jump_36a2:
    ldr r0, [pc, #0x48] /* data_36ec */ 
    ldr r1, [r0]
    cbz r1, jump_36ae
    ldr r1, [r0]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0]
jump_36ae:
    ldr r0, [pc, #0x40] /* data_36f0 */ 
    ldrb r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strb r1, [r0]
    ldr r1, [pc, #0x3c] /* data_36f4 */ 
    ldrh r0, [r1]
    cmp r0, #1
    bls jump_36c2
    .short 0x1e40 /* subs r0, r0, #1 */ 
    strh r0, [r1]
jump_36c2:
    ldr r0, [pc, #0x34] /* data_36f8 */ 
    ldrh r1, [r0]
    cmp r1, #0
    beq jump_36d8
    ldrh r1, [r0]
    cmp.w r1, #0xff00
    bhs jump_36d8
    ldrh r1, [r0]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strh r1, [r0]
jump_36d8:
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_36dc:
.word 0x40076000
data_36e0:
.word 0x200006bc
data_36e4:
.word 0x2000000e
data_36e8:
.word 0x20000008
data_36ec:
.word 0x20000060
data_36f0:
.word 0x2000002a
data_36f4:
.word 0x20000002
data_36f8:
.word 0x2000001c

.thumb_func
loc_36fc:
    push {r4, lr}
    ldr r0, [pc, #0x4c] /* data_374c */ 
    bl bftm_clear
    ldr r4, [pc, #0x48] /* data_3750 */ 
    ldr r0, [r4, #4]
    ldrh r1, [r0, #4]
    ldr r0, [r0]
    uxth r1, r1
    bl gpio_set_pin
    movs r0, #0xa
    bl spin_wait_maybe
    movs r0, #2
    bl call_7248
    ldr r1, [pc, #0x34] /* data_3754 */ 
    mov.w r0, #0x8000
    str r0, [r1, #0x24]
    ldr r0, [pc, #0x30] /* data_3758 */ 
    ldrb r1, [r4, #1]
    add.w r0, r0, r1, lsl #3
    str r0, [r4, #4]
    ldrh r1, [r0, #4]
    ldr r0, [r0]
    uxth r1, r1
    bl call_4534
    ldrb r0, [r4, #1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    and r0, r0, #7
    strb r0, [r4, #1]
    pop.w {r4, lr}
    b.w call_6468

data_374c:
.word 0x40077000
data_3750:
.word 0x20000020
data_3754:
.word 0x400b0000
data_3758:
.word 0x7d24

bftm_clear:
    ldr r1, [r0, #4]
    bic r1, r1, #1
    str r1, [r0, #4]
    dsb sy
    bx lr
call_376a:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_3776
    orr r1, r1, #4
    b jump_377a
jump_3776:
    bic r1, r1, #4
jump_377a:
    str r1, [r0]
    bx lr
call_377e:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_378a
    orr r1, r1, #1
    b jump_378e
jump_378a:
    bic r1, r1, #1
jump_378e:
    str r1, [r0]
    bx lr
call_3792:
    str r1, [r0, #0xc]
    bx lr
call_3796:
    str r1, [r0, #8]
    bx lr

.byte 0x0
.byte 0x0

afio_pin_config:
    lsls r0, r0, #3
    lsrs r3, r1, #3
    add.w r0, r0, r3, lsl #2
    ldr r3, [pc, #0x18] /* data_37c0 */ 
    push {r4, lr}
    add r0, r3
    lsls r1, r1, #0x1d
    ldr r3, [r0]
    lsrs r1, r1, #0x1b
    movs r4, #0xf
    lsls r4, r1
    bics r3, r4
    lsls r2, r1
    orrs r3, r2
    str r3, [r0]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_37c0:
.word 0x40022020

spin_wait_maybe:
    add.w r0, r0, r0, lsl #2
    lsls r0, r0, #2
jump_37ca:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_37ca
    bx lr
setup_afio_gpio:
    push.w {r4, r5, r6, r7, r8, lr}
    mov.w r5, #0x4000
    movs r4, #0
    lsls r0, r5, #2
    mov r2, r4
    mov r8, r0
    movs r3, #1
    mov r1, r5
    bl ckcu_clocks_enable
    ldr r6, [pc, #0x94] /* data_3880 */ 
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    lsls r7, r5, #1
    movs r2, #0
    mov r1, r7
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #2
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #2
    mov r1, r7
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    asrs r5, r5, #3
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #2
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #1
    movs r1, #0xb
    movs r0, #0
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xd
    movs r0, #2
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xe
    movs r0, #2
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xf
    movs r0, #2
    bl afio_pin_config
    ldr r0, [pc, #0x30] /* data_3884 */ 
    ldr r0, [r0, #4]
    lsls r0, r0, #0x15
    bmi jump_386e
    movs r2, #1
    movs r1, #0xe
    mov r0, r2
    bl afio_pin_config
    movs r2, #1
    movs r1, #0xf
    mov r0, r2
    bl afio_pin_config
jump_386e:
    mov r1, r4
    movs r3, #0
    mov r2, r4
    mov r0, r8
    bl ckcu_clocks_enable
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, pc}

data_3880:
.word 0x400b0000
data_3884:
.word 0x40088000

ckcu_clocks_enable:
    push {r4, r5, r6, r7, lr}
    ldr r7, [pc, #0x1c] /* data_38a8 */ 
    ldr r4, [r7, #0x24]
    ldr r5, [r7, #0x2c]
    ldr r6, [r7, #0x30]
    bics r4, r0
    bics r5, r1
    bics r6, r2
    cbz r3, jump_38a0
    orrs r4, r0
    orrs r5, r1
    orrs r6, r2
jump_38a0:
    str r4, [r7, #0x24]
    str r5, [r7, #0x2c]
    str r6, [r7, #0x30]
    pop {r4, r5, r6, r7, pc}

data_38a8:
.word 0x40088000

ckcu_set_usb_prescaler:
    ldr r1, [pc, #0xc] /* data_38bc */ 
    ldr r2, [r1]
    bic r2, r2, #0xc00000
    orr.w r0, r2, r0, lsl #22
    str r0, [r1]
    bx lr

data_38bc:
.word 0x40088000

call_38c0:
    push {r4, r5, r6, lr}
    ldr r1, [pc, #0x40] /* data_3904 */ 
    movs r5, #1
    lsl.w r0, r5, r0
    ldrb r1, [r1, #3]
    ldr r3, [pc, #0x3c] /* data_390c */ 
    lsls r6, r1, #0x1e
    ldr r1, [pc, #0x34] /* data_3908 */ 
    ldr r4, [pc, #0x3c] /* data_3910 */ 
    uxtb r0, r0
    ldrb r2, [r1, #2]
    ldrb r1, [r3, #1]
    bpl jump_38ea
    orrs r1, r0
    strb r1, [r3, #1]
    cmp r0, #8
    bne jump_38fe
    cbz r2, jump_38fe
    strb r5, [r4, #0xa]
    b jump_38fe
jump_38ea:
    bics r1, r0
    strb r1, [r3, #1]
    cmp r0, #8
    bne jump_38fe
    cbz r2, jump_38fe
    movs r0, #0
    strb r0, [r4, #0xa]
    strb r5, [r4]
    bl call_3bec
jump_38fe:
    movs r0, #3
    strb r0, [r4, #4]
    pop {r4, r5, r6, pc}

data_3904:
.word 0x20000030
data_3908:
.word 0x2000005c
data_390c:
.word 0x20000000
data_3910:
.word 0x20000648

call_3914:
    push {r4, r5, r6, lr}
    ldr r1, [pc, #0xac] /* data_39c4 */ 
    ldrb r0, [r1, #6]
    cmp r0, #0
    beq jump_3962
    ldr r5, [pc, #0xa8] /* data_39c8 */ 
    movs r2, #1
    str r2, [r5, #4]
    ldr r0, [pc, #0xa4] /* data_39cc */ 
    ldrb r0, [r0, #3]
    lsls r0, r0, #0x1e
    bpl jump_3962
    ldr r0, [pc, #0x9c] /* data_39cc */ 
    ldrb r3, [r1, #7]
    ldrb r0, [r0]
    cbz r3, jump_3978
    cmp r0, #0x27
    beq jump_3958
    bgt jump_394c
    cmp r0, #0x1e
    beq jump_3964
    cmp r0, #0x1f
    beq jump_3964
    cmp r0, #0x20
    beq jump_3964
    cmp r0, #0x26
    bne jump_3962
    b jump_3958
jump_394c:
    cmp r0, #0x29
    beq jump_3960
    cmp r0, #0x2d
    beq jump_3958
    cmp r0, #0x2e
    bne jump_3962
jump_3958:
    pop.w {r4, r5, r6, lr}
    b.w jump_6c68
jump_3960:
    strb r2, [r1, #2]
jump_3962:
    pop {r4, r5, r6, pc}
jump_3964:
    subs r0, #0x1e
    uxtb r1, r0
    ldr r0, [pc, #0x5c] /* data_39c8 */ 
    movs r2, #1
    adds r4, r0, r1
    ldrb r0, [r4]
    bl call_51f8
    strb r0, [r4]
jump_3976:
    pop {r4, r5, r6, pc}
jump_3978:
    cmp r0, #0xcf
    beq jump_3976
    ldr r1, [pc, #0x50] /* data_39d0 */ 
    ldr r2, [pc, #0x54] /* data_39d4 */ 
    ldrb r3, [r1, #3]
    ldrb r0, [r2, r0]
    cmp r3, #5
    beq jump_39a8
    add.w r0, r0, r0, lsl #1
    adds r4, r0, r1
    add.w r4, r4, #0x1b2
jump_3992:
    movs r2, #3
    mov r1, r4
    ldr r0, [pc, #0x30] /* data_39c8 */ 
    bl memcmp
    cbz r0, jump_39bc
    ldrh r0, [r5]
    strh r0, [r4]
    ldrb r0, [r5, #2]
jump_39a4:
    strb r0, [r4, #2]
    pop {r4, r5, r6, pc}
jump_39a8:
    ldr r2, [pc, #0x2c] /* data_39d8 */ 
    ldrb r0, [r2, r0]
    and r0, r0, #7
    add.w r0, r0, r0, lsl #1
    adds r4, r0, r1
    addw r4, r4, #0x28a
    b jump_3992
jump_39bc:
    movs r0, #0
    strh r0, [r4]
    b jump_39a4

.byte 0x0
.byte 0x0

data_39c4:
.word 0x20000648
data_39c8:
.word 0x20000004
data_39cc:
.word 0x20000030
data_39d0:
.word 0x20000730
data_39d4:
.word 0x200001c0
data_39d8:
.word 0x7b73

call_39dc:
    movs r1, #3
    ldr r2, [pc, #0x10] /* data_39f0 */ 
    b jump_39e6
jump_39e2:
    ldrb r3, [r0, r1]
    strb r3, [r2, r1]
jump_39e6:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_39e2
    bx lr

.byte 0x0
.byte 0x0

data_39f0:
.word 0x20000004

call_39f4:
    ldr r0, [pc, #0x18] /* data_3a10 */ 
    ldrb r0, [r0, #6]
    cmp r0, #0
    beq jump_3a0c
    ldr r0, [pc, #0x14] /* data_3a14 */ 
    ldr r0, [r0, #4]
    movw r1, #0x9c40
    cmp r0, r1
    blo jump_3a0c
    b.w jump_6c68
jump_3a0c:
    bx lr

.byte 0x0
.byte 0x0

data_3a10:
.word 0x20000648
data_3a14:
.word 0x20000004

jump_3a18:
    push {r4, r5, r6, lr}
    cbz r0, jump_3a44
    ldr r5, [pc, #0x3c] /* data_3a5c */ 
    movs r4, #0x48
    ldr r6, [pc, #0x3c] /* data_3a60 */ 
    b jump_3a3c
jump_3a24:
    ldrb r0, [r5], #-1
    and r0, r0, #7
    add.w r0, r0, r0, lsl #1
    adds r1, r0, r6
    mov r0, r4
    addw r1, r1, #0x28a
    bl call_408c
jump_3a3c:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_3a24
    pop {r4, r5, r6, pc}
jump_3a44:
    ldr r5, [pc, #0x1c] /* data_3a64 */ 
    movs r4, #0x48
    b jump_3a54
jump_3a4a:
    mov r1, r5
    mov r0, r4
    bl call_408c
    .short 0x1eed /* subs r5, r5, #3 */ 
jump_3a54:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_3a4a
    pop {r4, r5, r6, pc}

data_3a5c:
.word 0x7bba
data_3a60:
.word 0x20000730
data_3a64:
.word 0x200009b7

call_3a68:
    cmp r0, #1
    beq jump_3a76
    movs r0, #5
jump_3a6e:
    ldr r1, [pc, #0xc] /* data_3a7c */ 
    strb r0, [r1, #3]
    b.w call_3bec
jump_3a76:
    movs r0, #4
    b jump_3a6e

.byte 0x0
.byte 0x0

data_3a7c:
.word 0x20000730

call_3a80:
    push {r4, lr}
    bl call_3a68
    ldr r0, [pc, #0x14] /* data_3a9c */ 
    movs r1, #1
    strb r1, [r0, #6]
    ldr r0, [pc, #0x10] /* data_3aa0 */ 
    str r1, [r0, #4]
    ldr r1, [pc, #0x10] /* data_3aa4 */ 
    ldrh r2, [r1]
    strh r2, [r0]
    ldrb r1, [r1, #2]
    strb r1, [r0, #2]
    pop {r4, pc}

data_3a9c:
.word 0x20000648
data_3aa0:
.word 0x20000004
data_3aa4:
.word 0x7aa2

function_130_6:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x5c] /* data_3b08 */ 
    ldrb r0, [r4, #0xa]
    cmp r0, #1
    beq jump_3ac4
    ldr r0, [pc, #0x58] /* data_3b0c */ 
    bl function_130_7
    movs r0, #5
    ldr r1, [pc, #0x54] /* data_3b10 */ 
    movs r2, #0
    ldr r3, [pc, #0x54] /* data_3b14 */ 
    ldr r5, [pc, #0x54] /* data_3b18 */ 
    b jump_3aec
jump_3ac4:
    ldr r0, [pc, #0x48] /* data_3b10 */ 
    movs r1, #0xd8
    subs r0, #0x90
    bl mem_zero
    ldr r4, [pc, #0x4c] /* data_3b1c */ 
    ldr r1, [pc, #0x38] /* data_3b0c */ 
    ldrb r0, [r4, #0xe8]!
    bl call_408c
    ldrb r0, [r4, #1]
    pop.w {r4, r5, r6, lr}
    ldr r1, [pc, #0x28] /* data_3b0c */ 
    b.w call_408c
jump_3ae6:
    ldrb r6, [r3, r0]
    ldrb r6, [r5, r6]
    strb r2, [r6, r1]
jump_3aec:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_3ae6
    ldr r3, [pc, #0x28] /* data_3b1c */ 
    movs r2, #0xff
    ldrb r0, [r4, #0xa]
    adds r3, #0xe6
    ldrb r3, [r0, r3]
    strb r2, [r3, r1]
    ldr r3, [pc, #0x20] /* data_3b20 */ 
    ldrb r0, [r0, r3]
    strb r2, [r0, r1]
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_3b08:
.word 0x20000648
data_3b0c:
.word 0x7aa5
data_3b10:
.word 0x200003be
data_3b14:
.word 0x7a48
data_3b18:
.word 0x200001c0
data_3b1c:
.word 0x20000730
data_3b20:
.word 0x7a3a

call_3b24:
    push.w {r4, r5, r6, r7, r8, lr}
    bl call_6cd4
    ldr r4, [pc, #0x9c] /* data_3bcc */ 
    ldr r5, [pc, #0xa0] /* data_3bd0 */ 
    ldrb r0, [r4, #7]
    cbz r0, jump_3b7c
    ldrb r0, [r4, #6]
    cbnz r0, jump_3b3e
    bl call_53b8
    cbz r0, jump_3b7c
jump_3b3e:
    ldrb r0, [r4, #6]
    cbz r0, jump_3b46
    ldr r7, [pc, #0x90] /* data_3bd4 */ 
    b jump_3b4a
jump_3b46:
    ldr r0, [pc, #0x90] /* data_3bd8 */ 
    ldr r7, [r0]
jump_3b4a:
    movs r1, #3
    ldr.w ip, [pc, #0x8c] /* data_3bdc */ 
    b jump_3b76
jump_3b52:
    add.w r0, ip, r1
    ldrb r3, [r0, #0x1e]
    movs r0, #3
    b jump_3b70
jump_3b5c:
    cmp r1, r0
    bne jump_3b64
    ldrb r2, [r7, r0]
    b jump_3b66
jump_3b64:
    movs r2, #0
jump_3b66:
    add.w r6, r0, r0, lsl #3
    add.w r6, r5, r6, lsl #3
    strb r2, [r6, r3]
jump_3b70:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_3b5c
jump_3b76:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_3b52
jump_3b7c:
    ldrb r0, [r4, #6]
    cbz r0, jump_3b8c
    ldr r0, [pc, #0x5c] /* data_3be0 */ 
    ldr r1, [pc, #0x50] /* data_3bd4 */ 
    ldrb.w r0, [r0, #0xe9]
    bl call_408c
jump_3b8c:
    ldrb r0, [r4, #9]
    cbz r0, jump_3ba2
    ldr r0, [pc, #0x50] /* data_3be4 */ 
    ldrh r0, [r0]
    lsls r0, r0, #0x15
    asrs r0, r0, #8
    lsrs r1, r0, #0x18
    movs r0, #0x39
    bl call_40d0
    b jump_3bbe
jump_3ba2:
    movs r1, #0
    movs r0, #0x39
    bl call_40d0
    ldr r0, [pc, #0x3c] /* data_3be8 */ 
    ldrb r0, [r0, #2]
    cbz r0, jump_3bbe
    add.w r0, r0, r0, lsl #3
    add.w r0, r5, r0, lsl #3
    movs r1, #0xff
    strb r1, [r0, #-0xf]
jump_3bbe:
    pop.w {r4, r5, r6, r7, r8, lr}
    movs r1, #0
    movs r0, #0x42
    b.w call_40d0

.byte 0x0
.byte 0x0

data_3bcc:
.word 0x20000648
data_3bd0:
.word 0x2000032e
data_3bd4:
.word 0x20000004
data_3bd8:
.word 0x2000008c
data_3bdc:
.word 0x200001c0
data_3be0:
.word 0x20000730
data_3be4:
.word 0x2000001c
data_3be8:
.word 0x2000005c

call_3bec:
    ldr r0, [pc, #4] /* data_3bf4 */ 
    ldrb r0, [r0, #2]
    b.w jump_3f84

data_3bf4:
.word 0x2000005c

.byte 0x0
.byte 0x0
.byte 0x4
.byte 0x3
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x34
.byte 0x4
.byte 0x0
.byte 0x2
.byte 0x0

call_3c04:
    push {r4, r5, r6, lr}
    ldr r0, [pc, #0xf0] /* data_3cf8 */ 
    ldr r5, [pc, #0xf0] /* data_3cfc */ 
    ldrb r0, [r0, #0xb]
    cmp r0, #8
    bhs switch_3c6e
    tbb [pc, r0]

.byte 0x2d
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0xd
.byte 0xf
.byte 0x16
.byte 0x3b

switch_3c1c:
    ldr r1, [pc, #0xe0] /* data_3d00 */ 
    add.w r0, r0, r0, lsl #3
    add.w r0, r1, r0, lsl #3
    movs r2, #0xff
    movs r1, #0x48
    subs r0, #0x48
    b jump_3c38
switch_3c2e:
    movs r2, #0x80
    b jump_3c34
switch_3c32:
    movs r2, #0xff
jump_3c34:
    ldr r0, [pc, #0xc8] /* data_3d00 */ 
    movs r1, #0xd8
jump_3c38:
    pop.w {r4, r5, r6, lr}
    b.w mem_set
switch_3c40:
    movs r4, #0x48
    b jump_3c68
jump_3c44:
    ldr r0, [pc, #0xbc] /* data_3d04 */ 
    ldrb r1, [r5, #5]
    ldrb r0, [r0, r4]
    cmp r1, r0
    bne jump_3c70
    movs r6, #0
    b jump_3c78
jump_3c52:
    mov r1, r6
    movs r0, #0x39
    bl call_40d0
    mov r1, r6
    movs r0, #0x42
    b jump_3c64
jump_3c60:
    mov r1, r6
    movs r0, #0x29
jump_3c64:
    bl call_40d0
jump_3c68:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_3c44
switch_3c6e:
    pop {r4, r5, r6, pc}
jump_3c70:
    ldrb r1, [r5, #4]
    cmp r1, r0
    bne jump_3c68
    movs r6, #0xff
jump_3c78:
    mov r1, r6
    mov r0, r4
    bl call_40d0
    cmp r4, #0x3a
    beq jump_3c52
switch_3c84:
    cmp r4, #0x10
    bne jump_3c68
    b jump_3c60
switch_3c8a:
    movs r1, #0xd8
    ldr r0, [pc, #0x70] /* data_3d00 */ 
    bl mem_zero
    ldrb r0, [r5, #4]
    cbz r0, jump_3ca2
    movs r0, #0
jump_3c98:
    bl call_3ddc
    cbz r0, jump_3ca8
    movs r0, #0x12
    b jump_3caa
jump_3ca2:
    movs r0, #1
    strb r0, [r5, #4]
switch_3ca6:
    b jump_3c98
jump_3ca8:
    movs r0, #9
jump_3caa:
    ldr r4, [pc, #0x5c] /* data_3d08 */ 
    movs r1, #0xb4
    ldrb r0, [r4, r0]
    bl call_40d0
    ldr r5, [pc, #0x54] /* data_3d0c */ 
    ldrb r0, [r5]
    lsls r0, r0, #0x1f
    beq jump_3cc4
    ldrb r0, [r4, #0x1e]
    movs r1, #0xb4
    bl call_40d0
jump_3cc4:
    ldrb r0, [r5]
    lsls r0, r0, #0x1e
    bpl jump_3cd2
    ldrb r0, [r4, #0x1f]
    movs r1, #0xb4
    bl call_40d0
jump_3cd2:
    ldrb r0, [r5]
    lsls r0, r0, #0x1d
    bpl jump_3ce2
    ldrb.w r0, [r4, #0x20]
    movs r1, #0xb4
    bl call_40d0
jump_3ce2:
    ldrb r0, [r5]
    lsls r0, r0, #0x1c
    bpl switch_3c6e
    ldrb.w r0, [r4, #0x21]
    pop.w {r4, r5, r6, lr}
    movs r1, #0xb4
    b.w call_40d0

.byte 0x0
.byte 0x0

data_3cf8:
.word 0x20000648
data_3cfc:
.word 0x2000008c
data_3d00:
.word 0x2000032e
data_3d04:
.word 0x7ae3
data_3d08:
.word 0x200001c0
data_3d0c:
.word 0x20000001

call_3d10:
    ldr r0, [pc, #0x4c] /* data_3d60 */ 
    push {r4, lr}
    ldrb r0, [r0, #7]
    cmp r0, #4
    beq jump_3d22
    cmp r0, #5
    beq jump_3d22
    ldr r1, [pc, #0x44] /* data_3d64 */ 
    b jump_3d2e
jump_3d22:
    ldr r0, [pc, #0x44] /* data_3d68 */ 
    ldrh r0, [r0, #2]
    lsls r0, r0, #0x15
    bpl jump_3d36
    ldr r1, [pc, #0x38] /* data_3d64 */ 
    .short 0x1cc9 /* adds r1, r1, #3 */ 
jump_3d2e:
    movs r0, #0x42
    bl call_408c
    b jump_3d3e
jump_3d36:
    movs r1, #0
    movs r0, #0x42
    bl call_40d0
jump_3d3e:
    movs r1, #0
    movs r0, #0x39
    bl call_40d0
    ldr r0, [pc, #0x24] /* data_3d6c */ 
    ldrb r0, [r0, #2]
    cmp r0, #0
    beq jump_3d5e
    ldr r2, [pc, #0x20] /* data_3d70 */ 
    add.w r0, r0, r0, lsl #3
    add.w r0, r2, r0, lsl #3
    movs r1, #0xff
    strb r1, [r0, #-0xf]
jump_3d5e:
    pop {r4, pc}

data_3d60:
.word 0x200019d0
data_3d64:
.word 0x7aa5
data_3d68:
.word 0x2000000c
data_3d6c:
.word 0x2000005c
data_3d70:
.word 0x2000032e

call_3d74:
    push {r4, lr}
    bl call_5b90
    movs r1, #0
    movs r0, #0x39
    bl call_40d0
    movs r1, #0
    pop.w {r4, lr}
    movs r0, #0x42
    b.w call_40d0

.byte 0x0
.byte 0x0

call_3d90:
    mov r3, r1
    ldr r1, [pc, #0x40] /* data_3dd4 */ 
    push {r4, lr}
    ldrb r1, [r1, #2]
    cmp r1, #0
    beq jump_3dd2
    add.w r1, r1, r1, lsl #1
    add.w r4, r0, r1, lsl #5
    subs r4, #0x60
    lsrs r0, r4, #2
    lsls r1, r0, #0xc
    ldr r0, [pc, #0x2c] /* data_3dd8 */ 
    mov.w r2, #0x1000
    add.w r1, r1, #0x5000
    cbz r3, jump_3dbe
    pop.w {r4, lr}
    b.w jump_6c88
jump_3dbe:
    bl function_25
    ldr r1, [pc, #0x14] /* data_3dd8 */ 
    and r0, r4, #3
    add.w r0, r1, r0, lsl #10
    ldr r1, [pc, #4] /* data_3dd4 */ 
    .short 0x1f09 /* subs r1, r1, #4 */ 
    str r0, [r1]
jump_3dd2:
    pop {r4, pc}

data_3dd4:
.word 0x2000005c
data_3dd8:
.word 0x200009ca

call_3ddc:
    push {r3, r4, r5, lr}
    mov r5, r0
    movs r2, #2
    movs r1, #0
    mov r0, sp
    bl function_25
    ldrh.w r1, [sp]
    movw r4, #0x8001
    cmp r1, r4
    beq jump_3e16
    cbz r5, jump_3e12
    ldr r0, [pc, #0x20] /* data_3e1c */ 
    ldrb r0, [r0, #2]
    bl call_3f04
    movs r2, #2
    movs r1, #0
    mov r0, sp
    bl function_25
    ldrh.w r0, [sp]
    cmp r0, r4
    beq jump_3e16
jump_3e12:
    movs r0, #0
    pop {r3, r4, r5, pc}
jump_3e16:
    movs r0, #1
    pop {r3, r4, r5, pc}

.byte 0x0
.byte 0x0

data_3e1c:
.word 0x2000005c

call_3e20:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r2, #4
    movs r1, #0
    ldr r0, [pc, #0x6c] /* data_3e98 */ 
    bl function_25
    ldr r5, [pc, #0x68] /* data_3e98 */ 
    movw r1, #0x8001
    ldrh r0, [r5]
    cmp r0, r1
    beq jump_3e52
    cmp.w r0, #0x1000
    bhs jump_3e44
    ldrb r4, [r5, #2]
    b jump_3e4a
jump_3e44:
    cmp r4, #0xff
    bne jump_3e4a
    movs r4, #0
jump_3e4a:
    mov r0, r4
    bl call_3f04
    b jump_3e62
jump_3e52:
    cmp r4, #0xff
    beq jump_3e62
    ldrb r0, [r5, #2]
    cmp r0, r4
    beq jump_3e62
    strb r4, [r5, #2]
    bl call_3f98
jump_3e62:
    ldrb r0, [r5, #2]
    movs r2, #2
    lsls r1, r0, #0xc
    ldr r0, [pc, #0x30] /* data_3e9c */ 
    add.w r1, r1, #0x1000
    bl function_25
    ldr r0, [pc, #0x28] /* data_3e9c */ 
    ldrh r0, [r0]
    cmp r0, #9
    beq jump_3e82
    pop.w {r4, r5, r6, lr}
    b.w call_3ea0
jump_3e82:
    ldrb r0, [r5, #2]
    pop.w {r4, r5, r6, lr}
    lsls r1, r0, #0xc
    movw r2, #0x29a
    ldr r0, [pc, #0xc] /* data_3e9c */ 
    add.w r1, r1, #0x1000
    b.w function_25

data_3e98:
.word 0x2000005c
data_3e9c:
.word 0x20000730

call_3ea0:
    ldr r1, [pc, #0x28] /* data_3ecc */ 
    push {r4, lr}
    movs r0, #9
    strh r0, [r1]
    ldr r0, [pc, #0x20] /* data_3ecc */ 
    movs r2, #0xff
    movs r1, #0xc0
    adds r0, #0x28
    bl mem_set
    ldr r0, [pc, #0x14] /* data_3ecc */ 
    movs r2, #0xff
    movs r1, #0xc8
    adds r0, #0xea
    bl mem_set
    bl call_3f1c
    pop.w {r4, lr}
    b.w call_3bec

data_3ecc:
.word 0x20000730

call_3ed0:
    push {r4, lr}
    ldr r4, [pc, #0x2c] /* data_3f00 */ 
    movs r0, #0
    strb r0, [r4, #2]
    bl call_3ea0
jump_3edc:
    ldrb r0, [r4, #2]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb r0, [r4, #2]
    cmp r0, #4
    bhs jump_3eee
    bl call_3bec
    b jump_3edc
jump_3eee:
    movs r0, #0
    bl call_3f04
    pop.w {r4, lr}
    movs r0, #0xff
    b.w call_3e20

.byte 0x0
.byte 0x0

data_3f00:
.word 0x2000005c

call_3f04:
    ldr r1, [pc, #0x10] /* data_3f18 */ 
    movw r2, #0x8001
    strh r2, [r1]
    strb r0, [r1, #2]
    movs r0, #0xff
    strb r0, [r1, #3]
    b.w call_3f98

.byte 0x0
.byte 0x0

data_3f18:
.word 0x2000005c

call_3f1c:
    push {r4, r5, r6, lr}
    ldr r5, [pc, #0x54] /* data_3f74 */ 
    movs r0, #0
    strb r0, [r5, #2]
    movs r0, #7
    strb r0, [r5, #3]
    adds r4, r5, #4
    mov r2, r0
    b jump_3f42
jump_3f2e:
    ldr r1, [pc, #0x48] /* data_3f78 */ 
    movs r0, #5
    b jump_3f3c
jump_3f34:
    ldrb r3, [r1], #1
    strb r3, [r4], #1
jump_3f3c:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_3f34
jump_3f42:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_3f2e
    movs r0, #0
    bl call_60cc
    ldr r0, [pc, #0x24] /* data_3f74 */ 
    ldr r1, [pc, #0x28] /* data_3f7c */ 
    adds r0, #0x80
    ldrh r1, [r1]
    strh.w r1, [r0, #0x68]
    movs r0, #3
    strb r0, [r5, #0x11]
    movs r1, #0xd8
    ldr r0, [pc, #0x1c] /* data_3f80 */ 
    bl mem_zero
    pop.w {r4, r5, r6, lr}
    ldr r0, [pc, #0x14] /* data_3f80 */ 
    movs r1, #0xf
    adds r0, #0xd8
    b.w mem_zero

data_3f74:
.word 0x20000730
data_3f78:
.word 0x8114
data_3f7c:
.word 0x7a3c
data_3f80:
.word 0x200008e2

jump_3f84:
    lsls r1, r0, #0xc
    movw r2, #0x29a
    ldr r0, [pc, #8] /* data_3f94 */ 
    add.w r1, r1, #0x1000
    b.w jump_6c88

data_3f94:
.word 0x20000730

call_3f98:
    movs r2, #4
    movs r1, #0
    ldr r0, [pc, #4] /* data_3fa4 */ 
    b.w jump_6c88

.byte 0x0
.byte 0x0

data_3fa4:
.word 0x2000005c

call_3fa8:
    add.w r0, r0, r1, lsr #3
    and r3, r1, #7
    movs r1, #1
    lsls r1, r3
    cmp r2, #0
    ldrb r2, [r0]
    uxtb r1, r1
    beq jump_3fc0
    orrs r2, r1
    b jump_3fc2
jump_3fc0:
    bics r2, r1
jump_3fc2:
    strb r2, [r0]
    bx lr
call_3fc6:
    push {r4, r5, r6, lr}
    mov r6, r0
jump_3fca:
    movs r5, #0
    movs r4, #3
    b jump_3fdc
jump_3fd0:
    bl rand
    uxtb r0, r0
    strb r0, [r6, r4]
    add r0, r5
    uxth r5, r0
jump_3fdc:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_3fd0
    cmp r5, #0xe0
    blo jump_3fca
    pop {r4, r5, r6, pc}
call_3fe8:
    push {r4, r5, lr}
    lsls r3, r1, #1
    cmp r3, #0xff
    bls jump_3ff6
    rsb.w r3, r3, #0x1fe
    uxth r3, r3
jump_3ff6:
    movs r4, #0x2b
    udiv r4, r0, r4
    movs r5, #0x55
    mla r0, r4, r5, r0
    sub.w r1, r1, r3, lsr #1
    uxtb r1, r1
    add.w r0, r0, r0, lsl #1
    strb r1, [r2]
    lsls r0, r0, #0x19
    strb r1, [r2, #1]
    lsrs r0, r0, #0x18
    strb r1, [r2, #2]
    lsls r5, r4, #0x1f
    beq jump_401e
    rsb.w r0, r0, #0xff
jump_401e:
    muls r0, r3, r0
    ubfx r0, r0, #8, #8
    cmp r4, #5
    bhs jump_405c
    tbb [pc, r4]

.byte 0x3
.byte 0x7
.byte 0xc
.byte 0x10
.byte 0x13
.byte 0x0

switch_4032:
    add r3, r1
    strb r3, [r2]
    add r0, r1
    b jump_4040
switch_403a:
    add r0, r1
    strb r0, [r2]
    adds r0, r1, r3
jump_4040:
    strb r0, [r2, #1]
    pop {r4, r5, pc}
switch_4044:
    add r3, r1
    strb r3, [r2, #1]
jump_4048:
    add r0, r1
    b jump_4058
switch_404c:
    add r0, r1
    strb r0, [r2, #1]
    b jump_4056
switch_4052:
    add r0, r1
    strb r0, [r2]
jump_4056:
    adds r0, r1, r3
jump_4058:
    strb r0, [r2, #2]
    pop {r4, r5, pc}
jump_405c:
    add r3, r1
    strb r3, [r2]
    b jump_4048

.byte 0x0
.byte 0x0

jump_4064:
    push {r4, lr}
    ldr r1, [pc, #0x20] /* data_4088 */ 
    movs r3, #0x48
    b jump_4080
jump_406c:
    movs r2, #3
    b jump_4078
jump_4070:
    ldrb r4, [r0], #1
    strb r4, [r1], #0x48
jump_4078:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_4070
    subs r1, #0xd7
jump_4080:
    .short 0x1e5b /* subs r3, r3, #1 */ 
    uxtb r3, r3
    bhs jump_406c
    pop {r4, pc}

data_4088:
.word 0x2000032e

call_408c:
    cmp r0, #0xff
    beq jump_40a6
    ldr r2, [pc, #0x14] /* data_40a8 */ 
    add r2, r0
    movs r0, #0
jump_4096:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    ldrb r3, [r1], #1
    uxtb r0, r0
    strb r3, [r2], #0x48
    cmp r0, #3
    blo jump_4096
jump_40a6:
    bx lr

data_40a8:
.word 0x2000032e

function_130_7:
    push {r4, r5, r6, lr}
    mov r5, r0
    ldr r6, [pc, #0x18] /* data_40cc */ 
    movs r4, #3
    b jump_40c4
jump_40b6:
    ldrb r2, [r5]
    movs r1, #0x48
    mov r0, r6
    bl mem_set
    .short 0x1c6d /* adds r5, r5, #1 */ 
    adds r6, #0x48
jump_40c4:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_40b6
    pop {r4, r5, r6, pc}

data_40cc:
.word 0x2000032e

call_40d0:
    cmp r0, #0xff
    beq jump_40e6
    ldr r2, [pc, #0x10] /* data_40e8 */ 
    add r0, r2
    movs r2, #3
    b jump_40e0
jump_40dc:
    strb r1, [r0], #0x48
jump_40e0:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_40dc
jump_40e6:
    bx lr

data_40e8:
.word 0x2000032e

function_11:
    push {r2, r3, r4, r5, r6, lr}
    ldr r4, [pc, #0x20] /* data_4110 */ 
    movs r0, #5
    strh.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #2
    add r1, sp, #4
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    ldrb.w r0, [sp, #5]
    pop {r2, r3, r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_4110:
.word 0x400b2000

function_29:
    push {r4, r5, r6, lr}
    sub sp, #0x30
    bl function_82
    ldr r6, [pc, #0x60] /* data_4180 */ 
    ldrb r0, [r6]
    cmp r0, #1
    bne jump_4178
    movs r4, #0
    mov r2, r4
    movs r1, #0x20
    movs r3, #1
    mov r0, r2
    bl ckcu_clocks_enable
    mov.w r0, #0x4000
    asrs r5, r0, #4
    strd r0, r5, [sp]
    movs r0, #8
    strd r0, r4, [sp, #8]
    str r4, [sp, #0x10]
    str r4, [sp, #0x14]
    movs r0, #4
    str r4, [sp, #0x18]
    strd r4, r0, [sp, #0x1c]
    ldr r4, [pc, #0x34] /* data_4184 */ 
    str r0, [sp, #0x24]
    str r0, [sp, #0x28]
    mov r1, sp
    mov r0, r4
    bl function_e_54
    movs r1, #1
    mov r0, r4
    bl call_6552
    ldr r0, [pc, #0x20] /* data_4188 */ 
    str r5, [r0, #0x24]
    movs r1, #1
    mov r0, r4
    bl call_64f4
    bl pinmux_b789_spi
    movs r0, #2
    strb r0, [r6]
jump_4178:
    add sp, #0x30
    movs r0, #1
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_4180:
.word 0x20000018
data_4184:
.word 0x40044000
data_4188:
.word 0x400b2000

function_10:
    push {r4, lr}
    bl function_11
    ubfx r0, r0, #0, #1
    pop {r4, pc}
function_82:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x48] /* data_41e4 */ 
    ldrb r0, [r4]
    cbnz r0, jump_41e0
    movs r1, #0
    mov.w r0, #0x20000
    movs r3, #1
    mov r2, r1
    bl ckcu_clocks_enable
    ldr r6, [pc, #0x38] /* data_41e8 */ 
    mov.w r5, #0x400
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl gpio_set_output_current
    movs r2, #1
    movs r1, #0x80
    mov r0, r6
    bl gpio_set_output_current
    movs r2, #1
    lsls r1, r2, #8
    mov r0, r6
    bl gpio_set_output_current
    movs r0, #1
    strb r0, [r4]
jump_41e0:
    movs r0, #1
    pop {r4, r5, r6, pc}

data_41e4:
.word 0x20000018
data_41e8:
.word 0x400b2000

pinmux_b789_gpio:
    push {r4, r5, r6, lr}
    bl function_42
    ldr r5, [pc, #0x3c] /* data_4230 */ 
    mov.w r4, #0x400
    movs r2, #0
    mov r1, r4
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r4
    mov r0, r5
    bl gpio_set_input_output
    movs r2, #0
    movs r1, #7
    movs r0, #1
    bl afio_pin_config
    movs r2, #0
    movs r1, #8
    movs r0, #1
    bl afio_pin_config
    pop.w {r4, r5, r6, lr}
    movs r2, #0
    movs r1, #9
    movs r0, #1
    b.w afio_pin_config

.byte 0x0
.byte 0x0

data_4230:
.word 0x400b2000

pinmux_b789_spi:
    push {r4, r5, r6, lr}
    movs r2, #1
    ldr r5, [pc, #0x38] /* data_4274 */ 
    lsls r4, r2, #0xa
    mov r1, r4
    mov r0, r5
    bl gpio_set_input_output
    movs r2, #2
    mov r1, r4
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #5
    movs r1, #7
    movs r0, #1
    bl afio_pin_config
    movs r2, #5
    movs r1, #8
    movs r0, #1
    bl afio_pin_config
    movs r2, #5
    movs r1, #9
    movs r0, #1
    bl afio_pin_config
    pop.w {r4, r5, r6, lr}
    b.w jump_444c

data_4274:
.word 0x400b2000

function_e_38:
    push.w {r3, r4, r5, r6, r7, r8, sb, lr}
    mov r7, r2
    mov r4, r1
    mov r8, r0
    bl function_77
    ldr r6, [pc, #0x38] /* data_42c0 */ 
    mov.w r5, #0x400
    str r5, [r6, #0x28]
    movs r0, #2
    strb.w r0, [sp]
    lsrs r0, r4, #0x10
    strb.w r0, [sp, #1]
    lsrs r0, r4, #8
    strb.w r0, [sp, #2]
    strb.w r4, [sp, #3]
    movs r2, #4
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    mov r2, r7
    movs r1, #0
    mov r0, r8
    bl spi_write_read
    str r5, [r6, #0x24]
    pop.w {r3, r4, r5, r6, r7, r8, sb, pc}

.byte 0x0
.byte 0x0

data_42c0:
.word 0x400b2000

function_e_39:
    push {r3, r4, r5, r6, r7, lr}
    mov r4, r0
    bl function_77
    ldr r6, [pc, #0x28] /* data_42f8 */ 
    mov.w r5, #0x400
    str r5, [r6, #0x28]
    movs r0, #0x20
    strb.w r0, [sp]
    lsrs r0, r4, #0x10
    strb.w r0, [sp, #1]
    lsrs r0, r4, #8
    strb.w r0, [sp, #2]
    strb.w r4, [sp, #3]
    movs r2, #4
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r6, #0x24]
    pop {r3, r4, r5, r6, r7, pc}

data_42f8:
.word 0x400b2000

function_76:
    push {r3, r4, r5, r6, r7, lr}
    mov r6, r0
    bl function_77
    ldr r4, [pc, #0x1c] /* data_4324 */ 
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r0, #1
    strb.w r0, [sp]
    strb.w r6, [sp, #1]
    movs r2, #2
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    pop {r3, r4, r5, r6, r7, pc}

data_4324:
.word 0x400b2000

function_78:
    push {r4, lr}
    movs r4, #0x3c
    bl function_e_38
    b jump_433e
jump_4332:
    movs r0, #0x64
    bl spin_wait_maybe
    bl function_10
    cbz r0, jump_4346
jump_433e:
    mov r0, r4
    .short 0x1e64 /* subs r4, r4, #1 */ 
    bhs jump_4332
    pop {r4, pc}
jump_4346:
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

function_42:
    push {r3, r4, r5, lr}
    ldr r4, [pc, #0x20] /* data_4370 */ 
    movs r0, #0xb9
    strb.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #1
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    movs r0, #0xa
    bl spin_wait_maybe
    pop {r3, r4, r5, pc}

data_4370:
.word 0x400b2000

function_25:
    push {r3, r4, r5, r6, r7, lr}
    ldr r5, [pc, #0x38] /* data_43b0 */ 
    mov.w r4, #0x400
    mov r7, r2
    mov r6, r0
    str r4, [r5, #0x28]
    movs r0, #3
    strb.w r0, [sp]
    lsrs r0, r1, #0x10
    strb.w r0, [sp, #1]
    lsrs r0, r1, #8
    strb.w r0, [sp, #2]
    strb.w r1, [sp, #3]
    movs r2, #4
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    mov r2, r7
    mov r1, r6
    movs r0, #0
    bl spi_write_read
    str r4, [r5, #0x24]
    pop {r3, r4, r5, r6, r7, pc}

data_43b0:
.word 0x400b2000

spi_write_read:
    push {r4, r5, r6, r7, lr}
    movs r3, #0
    cmp r2, #8
    bls jump_43c0
    movs r4, #8
    b jump_43c2
jump_43c0:
    mov r4, r2
jump_43c2:
    movs r5, #0
    mov r7, r5
    ldr r6, [pc, #0x58] /* data_4420 */ 
    b jump_43d6
jump_43ca:
    cbz r0, jump_43dc
    ldrb.w ip, [r0, r5]
    str.w ip, [r6, #0x10]
jump_43d4:
    .short 0x1c6d /* adds r5, r5, #1 */ 
jump_43d6:
    cmp r5, r4
    blo jump_43ca
    b jump_43fe
jump_43dc:
    str r7, [r6, #0x10]
    b jump_43d4
jump_43e0:
    ldr r5, [r6, #0x1c]
    tst.w r5, #0xf0
    beq jump_43e0
    ldr r5, [r6, #0x10]
    uxtb r5, r5
    cbz r0, jump_4404
    ldrb.w ip, [r0, r4]
    str.w ip, [r6, #0x10]
jump_43f6:
    .short 0x1c64 /* adds r4, r4, #1 */ 
    cbz r1, jump_43fc
    strb r5, [r1, r3]
jump_43fc:
    .short 0x1c5b /* adds r3, r3, #1 */ 
jump_43fe:
    cmp r4, r2
    blo jump_43e0
    b jump_441a
jump_4404:
    str r7, [r6, #0x10]
    b jump_43f6
jump_4408:
    ldr r0, [r6, #0x1c]
    tst.w r0, #0xf0
    beq jump_4408
    ldr r0, [r6, #0x10]
    uxtb r0, r0
    cbz r1, jump_4418
    strb r0, [r1, r3]
jump_4418:
    .short 0x1c5b /* adds r3, r3, #1 */ 
jump_441a:
    cmp r3, r2
    blo jump_4408
    pop {r4, r5, r6, r7, pc}

data_4420:
.word 0x40044000

function_e_40:
    push {r4, r5, r6, lr}
    movw r4, #0x12d
    bl function_e_39
    mov.w r5, #0x3e8
    b jump_4440
jump_4434:
    mov r0, r5
    bl spin_wait_maybe
    bl function_10
    cbz r0, jump_4448
jump_4440:
    mov r0, r4
    .short 0x1e64 /* subs r4, r4, #1 */ 
    bhs jump_4434
    pop {r4, r5, r6, pc}
jump_4448:
    movs r0, #1
    pop {r4, r5, r6, pc}
jump_444c:
    push {r3, r4, r5, lr}
    ldr r4, [pc, #0x20] /* data_4470 */ 
    movs r0, #0xab
    strb.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #1
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    movs r0, #0xa
    bl spin_wait_maybe
    pop {r3, r4, r5, pc}

data_4470:
.word 0x400b2000

function_27:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    mov r5, r1
    mov r6, r0
    rsbs r0, r5, #0
    uxtb r4, r0
    cmp r4, r2
    bhs jump_448e
    subs r0, r2, r4
    ubfx r7, r0, #8, #0x10
    uxtb r0, r0
    b jump_4494
jump_448e:
    movs r7, #0
    uxth r4, r2
    mov r0, r7
jump_4494:
    mov r8, r0
    cbz r4, jump_44a8
    mov r2, r4
    mov r0, r6
    bl function_78
    cmp r0, #1
    bne jump_44e0
    add r5, r4
    add r6, r4
jump_44a8:
    movs r4, #0
    mov.w sb, #0x100
    b jump_44c8
jump_44b0:
    mov r2, sb
    mov r1, r5
    mov r0, r6
    bl function_78
    cmp r0, #1
    bne jump_44e0
    .short 0x1c64 /* adds r4, r4, #1 */ 
    add.w r5, r5, #0x100
    add.w r6, r6, #0x100
jump_44c8:
    cmp r4, r7
    blt jump_44b0
    movs.w r0, r8
    beq jump_44e6
    mov r2, r0
    mov r1, r5
    mov r0, r6
    bl function_78
    cmp r0, #1
    beq jump_44e6
jump_44e0:
    movs r0, #0
jump_44e2:
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
jump_44e6:
    movs r0, #1
    b jump_44e2

.byte 0x0
.byte 0x0

function_77:
    push {r3, r4, r5, lr}
    ldr r4, [pc, #0x1c] /* data_450c */ 
    movs r0, #6
    strb.w r0, [sp]
    mov.w r5, #0x400
    str r5, [r4, #0x28]
    movs r2, #1
    movs r1, #0
    mov r0, sp
    bl spi_write_read
    str r5, [r4, #0x24]
    pop {r3, r4, r5, pc}

.byte 0x0
.byte 0x0

data_450c:
.word 0x400b2000

function_28:
    push {r4, lr}
    mov.w r4, #0x19a
    bl function_76
    b jump_4528
jump_451c:
    movs r0, #0x64
    bl spin_wait_maybe
    bl function_10
    cbz r0, jump_4530
jump_4528:
    mov r0, r4
    .short 0x1e64 /* subs r4, r4, #1 */ 
    bhs jump_451c
    pop {r4, pc}
jump_4530:
    movs r0, #1
    pop {r4, pc}
call_4534:
    str r1, [r0, #0x28]
    bx lr
gpio_set_input_output:
    cmp r2, #0
    ldr r2, [r0]
    beq jump_4542
    orrs r2, r1
    b jump_4544
jump_4542:
    bics r2, r1
jump_4544:
    str r2, [r0]
    bx lr
gpio_set_output_current:
    cmp r2, #0
    ldr r2, [r0, #0x14]
    beq jump_4552
    orrs r2, r1
    b jump_4554
jump_4552:
    bics r2, r1
jump_4554:
    str r2, [r0, #0x14]
    bx lr
gpio_set_input_enable:
    cmp r2, #0
    ldr r2, [r0, #4]
    beq jump_4562
    orrs r2, r1
    b jump_4564
jump_4562:
    bics r2, r1
jump_4564:
    str r2, [r0, #4]
    bx lr
call_4568:
    cmp r2, #0
    ldr r2, [r0, #0x10]
    beq jump_4572
    orrs r2, r1
    b jump_4574
jump_4572:
    bics r2, r1
jump_4574:
    str r2, [r0, #0x10]
    bx lr
gpio_set_pin_pull_up_down:
    cbz r2, jump_458c
    cmp r2, #1
    beq jump_4592
    ldr r2, [r0, #8]
    bics r2, r1
jump_4582:
    str r2, [r0, #8]
    ldr r2, [r0, #0xc]
    bics r2, r1
    str r2, [r0, #0xc]
    bx lr
jump_458c:
    ldr r2, [r0, #8]
    orrs r2, r1
    b jump_4582
jump_4592:
    ldr r2, [r0, #0xc]
    orrs r2, r1
    str r2, [r0, #0xc]
    ldr r2, [r0, #8]
    bics r2, r1
    str r2, [r0, #8]
    bx lr
gpio_set_pin:
    str r1, [r0, #0x24]
    bx lr
gpio_set_reset_pin:
    cbz r2, jump_45aa
    str r1, [r0, #0x24]
    bx lr
jump_45aa:
    str r1, [r0, #0x28]
    bx lr
gptm_enable_disable:
    cmp r1, #0
    ldr r1, [r0, #0x10]
    beq jump_45ba
    orr r1, r1, #1
    b jump_45be
jump_45ba:
    bic r1, r1, #1
jump_45be:
    str r1, [r0, #0x10]
    bx lr
call_45c2:
    push {r4, r5, r6, r7, lr}
    ldrb r3, [r1]
    ldr r7, [r0, #0x50]
    add.w r4, r0, r3, lsl #2
    add.w r2, r4, #0x40
    add.w r5, r4, #0x90
    add.w r6, r4, #0xa0
    lsls r3, r3, #1
    movs r4, #1
    lsls r4, r3
    mvns r4, r4
    ands r7, r4
    str r7, [r0, #0x50]
    ldr r7, [r0, #0x54]
    ands r7, r4
    str r7, [r0, #0x54]
    ldr r4, [r0, #0x54]
    ldrb r7, [r1, #5]
    lsls r7, r3
    orrs r4, r7
    str r4, [r0, #0x54]
    ldr r4, [r2]
    movw r7, #0x107
    bics r4, r7
    str r4, [r2]
    ldr r4, [r2]
    ldrh r7, [r1, #2]
    orrs r4, r7
    str r4, [r2]
    ldrh r2, [r1, #6]
    str r2, [r5]
    ldrh r2, [r1, #8]
    str r2, [r6]
    ldr r2, [r0, #0x50]
    ldrb r1, [r1, #4]
    lsls r1, r3
    orrs r2, r1
    str r2, [r0, #0x50]
    pop {r4, r5, r6, r7, pc}
call_461a:
    ldrh r2, [r1]
    str.w r2, [r0, #0x88]
    ldrh r2, [r1, #2]
    str.w r2, [r0, #0x84]
    ldr r2, [r0]
    bic r2, r2, #0x30000
    str r2, [r0]
    ldr r2, [r0]
    bic r2, r2, #0x1000000
    str r2, [r0]
    ldr r2, [r0]
    ldr r3, [r1, #4]
    orrs r2, r3
    str r2, [r0]
    ldrh r1, [r1, #8]
    str r1, [r0, #0x78]
    bx lr
call_4644:
    ldr r0, [pc, #0x28] /* data_4670 */ 
    ldrb r1, [r0, #2]
    cbz r1, jump_464e
    movs r0, #0
    bx lr
jump_464e:
    ldrb r1, [r0, #0xb]
    cbz r1, jump_4656
    movs r0, #1
    bx lr
jump_4656:
    ldrb r0, [r0, #0xa]
    cbz r0, jump_465e
    movs r0, #2
    bx lr
jump_465e:
    ldr r0, [pc, #0x14] /* data_4674 */ 
    ldrb r0, [r0, #6]
    cmp r0, #1
    beq jump_466a
    movs r0, #5
    bx lr
jump_466a:
    movs r0, #3
    bx lr

.byte 0x0
.byte 0x0

data_4670:
.word 0x20000648
data_4674:
.word 0x200019d0

call_4678:
    push {r4, lr}
    cbz r0, jump_46a2
    bl call_4ab0
    cmp r0, #0
    beq jump_46b8
    movs r1, #0xa
    ldr r0, [pc, #0x34] /* data_46bc */ 
    bl mem_zero
    ldr r0, [pc, #0x30] /* data_46c0 */ 
    ldrb r1, [r0, #1]
    lsls r2, r1, #0x19
    mov.w r1, #0
    str r1, [r0]
    bpl jump_46a2
    ldrb r1, [r0, #1]
    orr r1, r1, #0x40
    strb r1, [r0, #1]
jump_46a2:
    bl call_6604
    ldr r1, [pc, #0x1c] /* data_46c4 */ 
    movs r0, #1
    strb r0, [r1]
    ldr r1, [pc, #0x18] /* data_46c8 */ 
    strb r0, [r1]
    ldr r1, [pc, #0x18] /* data_46cc */ 
    strb r0, [r1]
    ldr r1, [pc, #0x18] /* data_46d0 */ 
    strb r0, [r1]
jump_46b8:
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_46bc:
.word 0x20000654
data_46c0:
.word 0x20000030
data_46c4:
.word 0x20000034
data_46c8:
.word 0x20000037
data_46cc:
.word 0x20000035
data_46d0:
.word 0x20000036

call_46d4:
    movs r1, #0x50
    ldr r2, [pc, #0x18] /* data_46f0 */ 
    b jump_46e4
jump_46da:
    ldrb r3, [r2, r1]
    cmp r3, r0
    bne jump_46e4
    uxtb r0, r1
    bx lr
jump_46e4:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxth r1, r1
    bhs jump_46da
    movs r0, #0
    bx lr

.byte 0x0
.byte 0x0

data_46f0:
.word 0x2000065e

call_46f4:
    ldr r3, [pc, #0x2c] /* data_4724 */ 
    push {r4, lr}
    ldrb r2, [r3, r0]
    cbz r2, jump_471c
    cbz r1, jump_4700
    strb r2, [r1]
jump_4700:
    ldr r2, [pc, #0x20] /* data_4724 */ 
    lsrs r1, r0, #5
    adds r2, #0x52
    and r4, r0, #0x1f
    ldr.w r1, [r2, r1, lsl #2]
    movs r2, #1
    lsls r2, r4
    tst r1, r2
    beq jump_471c
    ldrb r0, [r3, r0]
    cmp r0, #0x2f
    blo jump_4720
jump_471c:
    movs r0, #1
    pop {r4, pc}
jump_4720:
    movs r0, #0
    pop {r4, pc}

data_4724:
.word 0x2000065e

jump_4728:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r5, r1
    mov r4, r0
    movs r1, #0x50
    ldr r0, [pc, #0x48] /* data_477c */ 
    bl mem_zero
    ldr r0, [pc, #0x40] /* data_477c */ 
    movs r1, #0
    subs r0, #0xa
    ldr r6, [pc, #0x3c] /* data_477c */ 
    str r1, [r0, #0x5c]
    str r1, [r0, #0x60]
    add.w r2, r0, #0x5c
    movs r3, #1
    str r1, [r0, #0x64]
    b jump_4770
jump_474e:
    ldrb r1, [r4]
    ldrb r0, [r4, #1]
    strb r0, [r6, r1]
    ldrb r0, [r4, #2]
    cbz r0, jump_476e
    ldrb r1, [r4]
    lsrs r0, r1, #5
    and r1, r1, #0x1f
    ldr.w r7, [r2, r0, lsl #2]
    lsl.w r1, r3, r1
    orrs r7, r1
    str.w r7, [r2, r0, lsl #2]
jump_476e:
    .short 0x1ce4 /* adds r4, r4, #3 */ 
jump_4770:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_474e
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_477c:
.word 0x2000065e

call_4780:
    push.w {r4, r5, r6, r7, r8, lr}
    lsrs r1, r0, #8
    lsls r1, r1, #0x1f
    beq jump_4790
    bl call_4e7c
    b jump_4850
jump_4790:
    uxtb r3, r0
    lsrs r2, r0, #0x18
    movs r4, #1
    cmp r3, #0xe8
    bls jump_47c4
    lsrs r0, r0, #0x18
    ubfx r2, r0, #1, #1
    cmp r3, #0xec
    bhs jump_47b2
    subs r3, #0xe9
    uxtb r1, r3
    ldr r0, [pc, #0xac] /* data_4858 */ 
    bl call_3fa8
    ldr r0, [pc, #0xac] /* data_485c */ 
    b jump_484e
jump_47b2:
    cmp r3, #0xfd
    bhi jump_4850
    subs r3, #0xec
    uxtb r1, r3
    ldr r0, [pc, #0xa4] /* data_4860 */ 
    bl call_3fa8
    ldr r0, [pc, #0xa0] /* data_4864 */ 
    b jump_484e
jump_47c4:
    and r1, r0, #7
    movs r6, #1
    sub.w ip, r3, #0xe0
    lsls r6, r1
    ldr r7, [pc, #0x94] /* data_4868 */ 
    ldr r5, [pc, #0x98] /* data_486c */ 
    cmp.w ip, #7
    bhi jump_47f0
    mov r0, r5
    uxtb r1, r6
    ldrb r0, [r0]
    lsls r2, r2, #0x1e
    bpl jump_47e8
    orrs r0, r1
    b jump_47ea
jump_47e8:
    bics r0, r1
jump_47ea:
    strb r0, [r5]
jump_47ec:
    strb r4, [r7]
    b jump_4850
jump_47f0:
    movs r1, #0
jump_47f2:
    add.w ip, r5, r1
    ldrb.w ip, [ip, #2]
    cmp ip, r3
    bne jump_480a
    lsls r0, r2, #0x1e
    bmi jump_47ec
    add r1, r5
    movs r0, #0
    strb r0, [r1, #2]
    b jump_47ec
jump_480a:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #6
    blo jump_47f2
    lsls r1, r2, #0x1e
    bpl jump_482e
    movs r1, #0
jump_4818:
    add.w ip, r5, r1
    ldrb.w ip, [ip, #2]
    cmp.w ip, #0
    beq jump_4842
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #6
    blo jump_4818
jump_482e:
    lsls r3, r2, #0x1e
    ldr r2, [pc, #0x3c] /* data_4870 */ 
    ubfx r0, r0, #3, #5
    add r0, r2
    uxtb r1, r6
    ldrb r2, [r0, #2]
    bpl jump_4848
    orrs r2, r1
    b jump_484a
jump_4842:
    adds r0, r5, r1
    strb r3, [r0, #2]
    b jump_47ec
jump_4848:
    bics r2, r1
jump_484a:
    strb r2, [r0, #2]
    ldr r0, [pc, #0x24] /* data_4874 */ 
jump_484e:
    strb r4, [r0]
jump_4850:
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_4858:
.word 0x2000003d
data_485c:
.word 0x20000035
data_4860:
.word 0x20000049
data_4864:
.word 0x20000036
data_4868:
.word 0x20000034
data_486c:
.word 0x20000050
data_4870:
.word 0x200006d4
data_4874:
.word 0x20000037

call_4878:
    push.w {r3, r4, r5, r6, r7, r8, sb, lr}
    ldr r4, [pc, #0x184] /* data_4a04 */ 
    ldr r2, [pc, #0x188] /* data_4a08 */ 
    lsrs r5, r0, #3
    strb r0, [r4, #2]
    ldrb r3, [r2, r0]
    strb r3, [r4]
    ldrb r2, [r4, #3]
    and r6, r0, #7
    bic r2, r2, #1
    bfi r2, r1, #1, #1
    strb r2, [r4, #3]
    mov r2, r4
    mov.w r8, #1
    ldrb r2, [r2, #1]
    cmp r3, #0xe8
    beq jump_48c6
    lsl.w r7, r8, r6
    movs r6, #0x1c
    uxtb r7, r7
    cmp.w r6, r3, lsr #3
    bne jump_48e4
    ands r6, r3, #3
    beq jump_48cc
    cmp r6, #1
    beq jump_48d2
    cmp r6, #2
    beq jump_48d8
    cmp r6, #3
    bne jump_48ee
    b jump_48de
jump_48c6:
    bfi r2, r1, #6, #1
    b jump_4938
jump_48cc:
    bfi r2, r1, #2, #1
    b jump_48ec
jump_48d2:
    bfi r2, r1, #4, #1
    b jump_48ec
jump_48d8:
    bfi r2, r1, #3, #1
    b jump_48ec
jump_48de:
    bfi r2, r1, #5, #1
    b jump_48ec
jump_48e4:
    cmp r3, #0x39
    bne jump_48ee
    bfi r2, r1, #7, #1
jump_48ec:
    strb r2, [r4, #1]
jump_48ee:
    ldr r6, [pc, #0x11c] /* data_4a0c */ 
    cbz r1, jump_4924
    ldrb r2, [r4, #1]
    lsls.w ip, r2, #0x19
    bpl jump_4938
    ldrb.w ip, [r6, r5]
    orr.w ip, ip, r7
    strb.w ip, [r6, r5]
    b jump_4930
jump_4908:
    ldr r6, [pc, #0x104] /* data_4a10 */ 
    strb r2, [r4, #1]
    sub.w r7, r3, #0xc0
    movs r5, #0
    ldrb r2, [r6, #2]
    cmp r7, #3
    bhi jump_493e
    cbz r2, jump_491c
    strb r5, [r6, #2]
jump_491c:
    uxtb r0, r7
    bl call_38c0
    b jump_4994
jump_4924:
    ldrb r2, [r6, r5]
    tst r2, r7
    beq jump_4936
    bics r2, r7
    strb r2, [r6, r5]
    ldrb r2, [r4, #1]
jump_4930:
    orr r2, r2, #1
    b jump_4908
jump_4936:
    ldrb r2, [r4, #1]
jump_4938:
    bic r2, r2, #1
    b jump_4908
jump_493e:
    cbz r2, jump_495e
    cbz r1, jump_495e
    strb r5, [r6, #2]
    mov r1, sp
    bl call_5bc8
    ldrb r0, [r6, #6]
    cmp r0, #0
    mov r0, sp
    beq jump_4958
    bl call_39dc
    b jump_4994
jump_4958:
    bl call_51a8
    b jump_4994
jump_495e:
    cbz r3, jump_4994
    ldr r0, [r4]
    bl call_5500
    bl call_4f5c
    cbz r0, jump_497e
    ldrb r0, [r4]
    cbz r0, jump_4994
jump_4970:
    bl call_5138
    ldr r0, [r4]
    pop.w {r3, r4, r5, r6, r7, r8, sb, lr}
    b.w call_4780
jump_497e:
    ldrb r0, [r6, #6]
    cbz r0, jump_4988
    bl call_3914
    b jump_4994
jump_4988:
    ldrb r0, [r4]
    cmp r0, #0xe8
    beq jump_4994
    bl call_58ec
    cbz r0, jump_499a
jump_4994:
    movs r0, #1
    pop.w {r3, r4, r5, r6, r7, r8, sb, pc}
jump_499a:
    ldrb r1, [r4, #1]
    lsls r0, r1, #0x1f
    ldrb r0, [r4, #3]
    lsl.w r0, r0, #0x1f
    beq jump_49ec
    cmp r0, #0
    bne jump_4970
    ldr r2, [pc, #0x60] /* data_4a0c */ 
    ldrb r0, [r4, #2]
    adds r2, #0xa
    ldrb r2, [r2, r0]
    cbz r2, jump_49da
    ldr r5, [pc, #0x54] /* data_4a0c */ 
    lsrs r3, r0, #5
    adds r5, #0x5c
    ldr.w r3, [r5, r3, lsl #2]
    and r5, r0, #0x1f
    lsl.w r0, r8, r5
    tst r3, r0
    beq jump_49d0
    orr r0, r1, #1
    b jump_49d4
jump_49d0:
    bic r0, r1, #1
jump_49d4:
    strb r0, [r4, #1]
    strb r2, [r4]
    b jump_4970
jump_49da:
    bl call_58b8
    cbnz r0, jump_49f8
    ldrb r0, [r4, #1]
    bic r0, r0, #1
    strb r0, [r4, #1]
    strb r5, [r4]
    b jump_4970
jump_49ec:
    cmp r0, #0
    bne jump_4970
    bl call_58b8
    cmp r0, #0
    beq jump_4970
jump_49f8:
    ldrb r0, [r4, #3]
    orr r0, r0, #1
    strb r0, [r4, #3]
    b jump_4970

.byte 0x0
.byte 0x0

data_4a04:
.word 0x20000030
data_4a08:
.word 0x200002c0
data_4a0c:
.word 0x20000654
data_4a10:
.word 0x20000648

call_4a14:
    ldrh r2, [r1]
    bfi r2, r0, #0, #9
    strh r2, [r1]
    bx lr
call_4a1e:
    ubfx r0, r0, #0, #9
    bx lr
call_4a24:
    push {r4, r5, r6, r7, lr}
    movs r5, #0
    b jump_4a4a
jump_4a2a:
    movs r4, #0
    b jump_4a3a
jump_4a2e:
    ldrb r6, [r0, r5]
    ldrb r7, [r1, r4]
    cmp r6, r7
    beq jump_4a3e
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
jump_4a3a:
    cmp r4, r3
    blo jump_4a2e
jump_4a3e:
    cmp r4, r3
    bne jump_4a46
    movs r0, #0
    pop {r4, r5, r6, r7, pc}
jump_4a46:
    .short 0x1c6d /* adds r5, r5, #1 */ 
    uxtb r5, r5
jump_4a4a:
    cmp r5, r2
    blo jump_4a2a
    movs r0, #1
    pop {r4, r5, r6, r7, pc}

.byte 0x0
.byte 0x0

call_4a54:
    push {r4, r5, r6, r7, lr}
    movs r3, #0xa
    movs r5, #0
    b jump_4a9a
jump_4a5c:
    ldr r2, [pc, #0x48] /* data_4aa8 */ 
    cmp r3, #9
    ldrb r4, [r2, r3]
    bne jump_4a68
    orr r4, r4, #0xf
jump_4a68:
    cmp r4, #0xff
    beq jump_4a9a
    ldr r6, [pc, #0x3c] /* data_4aac */ 
    movs r2, #8
    mov.w ip, #1
    add.w r7, r6, r3, lsl #3
    b jump_4a94
jump_4a7a:
    lsl.w r6, ip, r2
    uxtb r6, r6
    tst r4, r6
    bne jump_4a94
    cbz r1, jump_4aa4
    .short 0x1e49 /* subs r1, r1, #1 */ 
    ldrb r6, [r7, r2]
    .short 0x1c6d /* adds r5, r5, #1 */ 
    strb r6, [r0], #1
    uxtb r1, r1
    uxtb r5, r5
jump_4a94:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_4a7a
jump_4a9a:
    .short 0x1e5b /* subs r3, r3, #1 */ 
    uxtb r3, r3
    bhs jump_4a5c
    mov r0, r5
    pop {r4, r5, r6, r7, pc}
jump_4aa4:
    movs r0, #0xff
    pop {r4, r5, r6, r7, pc}

data_4aa8:
.word 0x200001ac
data_4aac:
.word 0x200002c0

call_4ab0:
    push {r1, r2, r3, r4, r5, r6, r7, lr}
    bl call_609c
    cmp r0, #0
    beq jump_4b02
    ldr r0, [pc, #0x54] /* data_4b10 */ 
    mov r5, sp
    ldr r6, [pc, #0x54] /* data_4b14 */ 
    ldr r1, [r0]
    str r1, [sp]
    ldr r1, [r0, #4]
    str r1, [sp, #4]
    ldrh r0, [r0, #8]
    strh.w r0, [sp, #8]
    movs r0, #5
    ldr r7, [pc, #0x44] /* data_4b18 */ 
    movs r3, #1
    b jump_4af0
jump_4ad6:
    ldrb r1, [r6, r0]
    ldrb r1, [r7, r1]
    cmp r1, #0xff
    beq jump_4af0
    add.w r2, r5, r1, lsr #3
    and r1, r1, #7
    ldrb r4, [r2]
    lsl.w r1, r3, r1
    orrs r4, r1
    strb r4, [r2]
jump_4af0:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_4ad6
    movs r0, #0xa
    b jump_4b04
jump_4afa:
    ldrb r1, [r5, r0]
    cmp r1, #0xff
    beq jump_4b04
    movs r0, #0
jump_4b02:
    pop {r1, r2, r3, r4, r5, r6, r7, pc}
jump_4b04:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_4afa
    movs r0, #1
    pop {r1, r2, r3, r4, r5, r6, r7, pc}

.byte 0x0
.byte 0x0

data_4b10:
.word 0x200001ac
data_4b14:
.word 0x7f64
data_4b18:
.word 0x200001c0

call_4b1c:
    ldr r0, [pc, #0xc] /* data_4b2c */ 
    ldr r1, [pc, #0x10] /* data_4b30 */ 
    ldrb r0, [r0, #1]
    and r0, r0, #3
    ldrb r0, [r1, r0]
    b.w call_60cc

data_4b2c:
.word 0x20000000
data_4b30:
.word 0x7a44

call_4b34:
    push.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, lr}
    ldr r5, [pc, #0x8c] /* data_4bc8 */ 
    ldrh r1, [r5]
    movw sl, #0xffff
    cmp r1, sl
    beq jump_4bc4
    movs r1, #2
    add r0, sp, #4
    bl call_4a54
    movs r6, #0
    ldr r4, [pc, #0x7c] /* data_4bcc */ 
    movw r7, #0x2710
    cmp r0, #2
    bne jump_4bb8
    ldr.w sb, [pc, #0x74] /* data_4bd0 */ 
    movs r3, #2
    mov r2, r3
    ldrb.w r1, [sb, #0x44]
    strb.w r1, [sp]
    ldrb.w r0, [sb, #0xc]
    strb.w r0, [sp, #1]
    mov r1, sp
    add r0, sp, #4
    bl call_4a24
    mov.w r8, #1
    cbz r0, jump_4b90
    ldrh r0, [r5]
    cmp r0, r7
    bls jump_4b8a
    strb.w r8, [r4, #3]
    b jump_4bb8
jump_4b8a:
    strb.w r8, [r4, #9]
    b jump_4bba
jump_4b90:
    ldrb.w r1, [sb, #0x22]
    strb.w r1, [sp]
    ldrb.w r0, [sb, #0x43]
    strb.w r0, [sp, #1]
    movs r3, #2
    mov r2, r3
    mov r1, sp
    add r0, sp, #4
    bl call_4a24
    cbz r0, jump_4bb8
    ldrh r0, [r5]
    cmp r0, r7
    bls jump_4b8a
    movs r0, #2
    strb r0, [r4, #3]
jump_4bb8:
    strb r6, [r4, #9]
jump_4bba:
    ldrh r0, [r5]
    cmp r0, r7
    bls jump_4bc4
    strh.w sl, [r5]
jump_4bc4:
    pop.w {r2, r3, r4, r5, r6, r7, r8, sb, sl, pc}

data_4bc8:
.word 0x2000001c
data_4bcc:
.word 0x20000648
data_4bd0:
.word 0x200002c0

call_4bd4:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    ldr r0, [pc, #0x240] /* data_4e1c */ 
    ldr.w ip, [pc, #0x244] /* data_4e20 */ 
    movs r5, #0
    ldrb r2, [r0, #0xb]
    ldrb.w r1, [ip, #4]
    cbz r2, jump_4c20
    ldrb.w r0, [ip, #6]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb.w r0, [ip, #6]
    cmp r0, #3
    bls jump_4cac
    mov r0, ip
    strb.w r5, [ip, #6]
    ldrb r0, [r0, #4]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r2, #6
    beq jump_4c0c
    cmp r2, #7
jump_4c08:
    bne jump_4cac
    b jump_4c14
jump_4c0c:
    strb.w r1, [ip, #5]
    movs r1, #0x3d
    b jump_4c16
jump_4c14:
    movs r1, #0x18
jump_4c16:
    udiv r2, r0, r1
    mls r0, r1, r2, r0
    b jump_4cb0
jump_4c20:
    ldr r0, [pc, #0x200] /* data_4e24 */ 
    ldr r3, [pc, #0x1fc] /* data_4e20 */ 
    ldr r2, [pc, #0x200] /* data_4e28 */ 
    ldrb r0, [r0, #3]
    add.w r6, r3, #0xdb
    ldr r3, [r3]
    add.w r4, r2, #0xe
    mov.w sb, #1
    cmp r0, #3
    bhi jump_4cf6
    ldrb r2, [r2, r0]
    cmp r0, #1
    add.w r2, r2, r2, lsl #1
    add.w r2, r4, r2, lsl #1
    ldrb r4, [r3, #4]
    and r4, r4, #0xf
    ldrb r4, [r2, r4]
    beq jump_4c5a
    cmp r0, #2
    beq jump_4cae
    cmp r0, #3
    bne jump_4c08
    b jump_4cb6
jump_4c5a:
    movs r1, #3
    add.w r0, ip, #7
    .short 0x1cdb /* adds r3, r3, #3 */ 
    b jump_4ca6
jump_4c64:
    lsl.w r2, sb, r1
    ldrb.w r6, [ip, #7]
    uxtb r2, r2
    .short 0x1e5b /* subs r3, r3, #1 */ 
    tst r6, r2
    ldrb r6, [r0, #-0x1]!
    beq jump_4c8a
    cmp r6, r4
    bhi jump_4c86
    strb r5, [r0]
    ldrb.w r6, [ip, #7]
    bics r6, r2
    b jump_4c9c
jump_4c86:
    subs r2, r6, r4
    b jump_4ca4
jump_4c8a:
    ldrb r7, [r3]
    sub.w r8, r7, r4
    cmp r6, r8
    blt jump_4ca2
    strb r7, [r0]
    ldrb.w r6, [ip, #7]
    orrs r6, r2
jump_4c9c:
    strb.w r6, [ip, #7]
    b jump_4ca6
jump_4ca2:
    adds r2, r6, r4
jump_4ca4:
    strb r2, [r0]
jump_4ca6:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_4c64
jump_4cac:
    b jump_4e14
jump_4cae:
    adds r0, r1, r4
jump_4cb0:
    strb.w r0, [ip, #4]
    b jump_4e14
jump_4cb6:
    movs r7, #0x48
    b jump_4cee
jump_4cba:
    bl rand
    sdiv r1, r0, r4
    mls r0, r4, r1, r0
    cbz r0, jump_4ccc
    movs r0, #3
    b jump_4ce8
jump_4ccc:
    subs r0, r6, #2
    movs r1, #0
    bl call_6ea8
    .short 0x1ef6 /* subs r6, r6, #3 */ 
    b jump_4cee
jump_4cd8:
    ldrb r1, [r6]
    cmp r1, #2
    bhi jump_4ce2
    strb r5, [r6]
    b jump_4ce6
jump_4ce2:
    .short 0x1e89 /* subs r1, r1, #2 */ 
    strb r1, [r6]
jump_4ce6:
    .short 0x1e76 /* subs r6, r6, #1 */ 
jump_4ce8:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_4cd8
jump_4cee:
    .short 0x1e7f /* subs r7, r7, #1 */ 
    uxtb r7, r7
    bhs jump_4cba
    b jump_4e14
jump_4cf6:
    cmp r0, #7
    bls jump_4d72
    ldrb r1, [r2, r0]
    ldrb r2, [r3, #4]
    add.w r1, r1, r1, lsl #1
    add.w r1, r4, r1, lsl #1
    and r2, r2, #0xf
    bic r0, r0, #1
    ldrb r2, [r1, r2]
    cmp r0, #8
    beq jump_4d1e
    cmp r0, #0xa
    beq jump_4d74
    cmp r0, #0xc
    bne jump_4e14
    b jump_4dd2
jump_4d1e:
    movs r0, #0x48
    b jump_4d6c
jump_4d22:
    ldrb r1, [r6], #-1
    cbz r1, jump_4d2c
    .short 0x1eb6 /* subs r6, r6, #2 */ 
    b jump_4d3c
jump_4d2c:
    ldrb r1, [r6], #-1
    cbz r1, jump_4d36
    .short 0x1e76 /* subs r6, r6, #1 */ 
    b jump_4d3c
jump_4d36:
    ldrb r1, [r6], #-1
    cbz r1, jump_4d6c
jump_4d3c:
    ldr r1, [pc, #0xec] /* data_4e2c */ 
    and r4, r0, #7
    add.w r1, r1, r0, lsr #3
    ldrb r3, [r1]
    lsl.w r1, sb, r4
    tst r3, r1
    beq jump_4d6c
    movs r1, #3
    b jump_4d64
jump_4d54:
    ldrb r3, [r6, #1]!
    cmp r3, r2
    bhi jump_4d60
    strb r5, [r6]
    b jump_4d64
jump_4d60:
    subs r3, r3, r2
    strb r3, [r6]
jump_4d64:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_4d54
    .short 0x1ef6 /* subs r6, r6, #3 */ 
jump_4d6c:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_4d22
jump_4d72:
    b jump_4e14
jump_4d74:
    ldrb.w r0, [ip, #0x58]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb.w r0, [ip, #0x58]
    cmp r0, r2
    blo jump_4e14
    strb.w r5, [ip, #0x58]
    movs r0, #1
jump_4d8a:
    add.w r1, r0, r0, lsl #1
    add.w r1, ip, r1, lsl #1
    .short 0x1c40 /* adds r0, r0, #1 */ 
    ldrh r2, [r1, #4]
    strh r2, [r1, #-0x2]
    ldrb r2, [r1, #6]
    uxtb r0, r0
    strb r2, [r1]
    cmp r0, #0xe
    blo jump_4d8a
    strh.w r5, [ip, #0x52]
    strb.w r5, [ip, #0x54]
    movs r0, #0xe
    b jump_4dc2
jump_4db0:
    add.w r1, r0, r0, lsl #1
    add.w r1, ip, r1, lsl #1
    ldrh r2, [r1, #1]!
    strh r2, [r1, #6]
    ldrb r2, [r1, #2]
    strb r2, [r1, #8]
jump_4dc2:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_4db0
    strh.w r5, [ip, #7]
    strb.w r5, [ip, #9]
    b jump_4e14
jump_4dd2:
    ldrb.w r0, [ip, #0x27]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    strb.w r0, [ip, #0x27]
    cmp r0, r2
    blo jump_4e14
    ldr r0, [pc, #0x3c] /* data_4e20 */ 
    strb.w r5, [ip, #0x27]
    adds r0, #0x27
    movs r2, #5
    b jump_4e0e
jump_4dee:
    ldrsb r1, [r0, #-0x1]
    .short 0x1f40 /* subs r0, r0, #5 */ 
    cbz r1, jump_4e0e
    .short 0x1c49 /* adds r1, r1, #1 */ 
    sxtb r1, r1
    strb r1, [r0, #4]
    ldrb r3, [r0, #3]
    adds r4, r1, r3
    subs r4, #0xa
    cmp r4, #0xe
    ble jump_4e0e
    subs r1, r3, r1
    adds r1, #0xa
    bpl jump_4e0e
    strb r5, [r0, #4]
jump_4e0e:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_4dee
jump_4e14:
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    b.w call_55a8

data_4e1c:
.word 0x20000648
data_4e20:
.word 0x2000008c
data_4e24:
.word 0x20000730
data_4e28:
.word 0x7aab
data_4e2c:
.word 0x200001ac

call_4e30:
    movs r1, #5
    ldr r0, [pc, #4] /* data_4e38 */ 
    b.w jump_4728

data_4e38:
.word 0x7a4d

call_4e3c:
    push {r3, r4, r5, lr}
    movs r1, #3
    mov r0, sp
    bl call_4a54
    ldr r4, [pc, #0x2c] /* data_4e74 */ 
    cmp r0, #3
    bne jump_4e6a
    movs r3, #3
    mov r2, r3
    ldr r1, [pc, #0x24] /* data_4e78 */ 
    mov r0, sp
    bl call_4a24
    cbz r0, jump_4e6a
    ldrb r0, [r4, #2]
    mvn.w r1, r0, lsr #1
    bfi r0, r1, #1, #1
    strb r0, [r4, #2]
    bl call_3bec
jump_4e6a:
    ldrb r0, [r4, #2]
    ubfx r0, r0, #1, #1
    pop {r3, r4, r5, pc}

.byte 0x0
.byte 0x0

data_4e74:
.word 0x20000730
data_4e78:
.word 0x7a41

call_4e7c:
    push {r4, lr}
    lsrs r1, r0, #0x18
    lsls r1, r1, #0x1e
    bpl jump_4eb6
    uxtb r0, r0
    cmp r0, #0x12
    beq jump_4eb8
    bgt jump_4e96
    cmp r0, #0x10
    beq jump_4eb8
    cmp r0, #0x11
    bne jump_4eb6
    b jump_4eb8
jump_4e96:
    cmp r0, #0x13
    beq jump_4eb8
    cmp r0, #0x5f
    bne jump_4eb6
    ldr r0, [pc, #0x20] /* data_4ec0 */ 
    ldrb r0, [r0, #2]
    cmp r0, #0
    beq jump_4eb6
    bl call_559c
    bl call_5aac
    ldr r1, [pc, #0x14] /* data_4ec4 */ 
    movw r0, #0x7530
    strh r0, [r1, #2]
jump_4eb6:
    pop {r4, pc}
jump_4eb8:
    ldr r1, [pc, #0xc] /* data_4ec8 */ 
    subs r0, #0x10
    strb r0, [r1]
    pop {r4, pc}

data_4ec0:
.word 0x2000005c
data_4ec4:
.word 0x20000000
data_4ec8:
.word 0x20000029

call_4ecc:
    ldr r0, [pc, #0x7c] /* data_4f4c */ 
    push {r4, lr}
    ldrb r1, [r0, #3]
    lsls r1, r1, #0x1e
    bpl jump_4f26
    ldr r2, [pc, #0x78] /* data_4f50 */ 
    ldrb r4, [r0]
    movs r3, #1
    ldrb r1, [r2, #7]
    cmp r4, #0xcf
    beq jump_4ef2
    ldrb r0, [r0, #1]
    lsls r0, r0, #0x1f
    beq jump_4f26
    ldr r0, [pc, #0x60] /* data_4f4c */ 
    cmp r1, #2
    ldrb r0, [r0, #2]
    beq jump_4f06
    b jump_4f12
jump_4ef2:
    cmp r1, #4
    beq jump_4f02
    cmp r1, #5
    bne jump_4f26
    strb r3, [r2, #8]
    movs r0, #6
    strb r0, [r2, #7]
    b jump_4f48
jump_4f02:
    strb r3, [r2, #7]
    b jump_4f48
jump_4f06:
    cmp r0, #0xd
    beq jump_4f26
    cmp r0, #0x15
    beq jump_4f26
    cmp r0, #0x1d
    beq jump_4f26
jump_4f12:
    ldr r1, [pc, #0x3c] /* data_4f50 */ 
    cmp r0, #0xd
    ldr r1, [r1]
    beq jump_4f2a
    cmp r0, #0x15
    beq jump_4f2e
    cmp r0, #0x1d
    beq jump_4f34
    cmp r0, #0x47
    beq jump_4f3a
jump_4f26:
    movs r0, #0
    pop {r4, pc}
jump_4f2a:
    adds r1, #0xf
    b jump_4f30
jump_4f2e:
    adds r1, #0x64
jump_4f30:
    str r1, [r2]
    b jump_4f48
jump_4f34:
    add.w r1, r1, #0x1f4
    b jump_4f30
jump_4f3a:
    movs r0, #8
    ldr r1, [pc, #0x14] /* data_4f54 */ 
    strb r0, [r2, #7]
    movs r0, #0
    strh r0, [r1, #2]
    ldr r0, [pc, #0x10] /* data_4f58 */ 
    strb r3, [r0]
jump_4f48:
    movs r0, #1
    pop {r4, pc}

data_4f4c:
.word 0x20000030
data_4f50:
.word 0x200019d0
data_4f54:
.word 0x20000000
data_4f58:
.word 0x20000648

call_4f5c:
    push.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, lr}
    ldr r0, [pc, #0x1b8] /* data_511c */ 
    ldrh r1, [r0, #2]
    cbz r1, jump_4f6c
    movw r1, #0x7530
    strh r1, [r0, #2]
jump_4f6c:
    ldr r6, [pc, #0x1b4] /* data_5124 */ 
    ldr r5, [pc, #0x1b0] /* data_5120 */ 
    mov.w sb, #0
    ldrb r2, [r6]
    ldrb r3, [r5, #0xa]
    ldrb r1, [r6, #3]
    ldrb r0, [r6, #2]
    mov.w fp, #3
    movs r4, #1
    cbz r3, jump_4fd8
    lsls r1, r1, #0x1e
    bpl jump_4fd2
    cmp r3, #1
    beq jump_4f9c
    ldr r1, [pc, #0x198] /* data_5128 */ 
    ldrb r1, [r3, r1]
    cmp r0, r1
    beq jump_4fca
    ldr r7, [pc, #0x190] /* data_5128 */ 
    movs r1, #5
    adds r7, #0xe
    b jump_4fc0
jump_4f9c:
    ldr r1, [pc, #0x18c] /* data_512c */ 
    ldrb.w r2, [r1, #0xe8]
    cmp r0, r2
    bne jump_4faa
    movs r2, #2
    strb r2, [r5, #0xa]
jump_4faa:
    ldrb.w r1, [r1, #0xe9]
    cmp r0, r1
    bne jump_4fd2
    strb.w fp, [r5, #0xa]
    b jump_4fd2
jump_4fb8:
    ldrb.w ip, [r7, r1]
    cmp ip, r2
    beq jump_4fc6
jump_4fc0:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_4fb8
jump_4fc6:
    cmp r1, #0xff
    bne jump_4fd2
jump_4fca:
    ldr r1, [pc, #0x160] /* data_512c */ 
    adds r1, #0xe6
    strb r0, [r3, r1]
    strb r4, [r5, #0xa]
jump_4fd2:
    strb.w sb, [r6]
    b jump_5008
jump_4fd8:
    ldr.w sl, [pc, #0x154] /* data_5130 */ 
    cmp r2, #0xcf
    ldrb.w ip, [sl, #6]
    beq jump_4ffc
    ldr r7, [pc, #0x13c] /* data_5124 */ 
    ldrb r3, [r6, #1]
    ldrb r7, [r7, #3]
    lsls.w r8, r3, #0x1f
    orr r7, r7, #1
    beq jump_5044
    cmp.w ip, #1
    beq jump_5012
    b jump_500e
jump_4ffc:
    ubfx r0, r1, #1, #1
    strb r0, [r5, #7]
    cmp.w ip, #1
    beq jump_500e
jump_5008:
    movs r0, #1
jump_500a:
    pop.w {r3, r4, r5, r6, r7, r8, sb, sl, fp, pc}
jump_500e:
    movs r0, #0
    b jump_500a
jump_5012:
    ldrb.w r1, [sl, #7]
    cmp r1, #2
    beq jump_500e
    ldr r2, [pc, #0x10c] /* data_5128 */ 
    movs r1, #0
    adds r2, #0x22
jump_5020:
    ldrb.w r4, [r2, r1, lsl #1]
    cmp r0, r4
    bne jump_503a
    add.w r0, r2, r1, lsl #1
    ldrb r0, [r0, #1]
    strb r0, [r6]
    strb r7, [r6, #3]
    bic r0, r3, #1
    strb r0, [r6, #1]
jump_5038:
    b jump_500e
jump_503a:
    .short 0x1c49 /* adds r1, r1, #1 */ 
    uxtb r1, r1
    cmp r1, #0x22
    blo jump_5020
    b jump_500e
jump_5044:
    ldrb.w ip, [r5, #7]
    cmp.w ip, #0
    beq jump_50bc
    ldrb r2, [r5, #6]
    cmp r2, #0
    bne jump_500e
    lsls r1, r1, #0x1e
    bpl jump_50b6
    ldr r1, [pc, #0xd8] /* data_5134 */ 
    cmp r0, #0x25
    ldrb r1, [r1, r0]
    strb r1, [r6]
    beq jump_5078
    bgt jump_506e
    cmp r0, #5
    beq jump_5092
    cmp r0, #0x24
    bne jump_50b0
    b jump_5078
jump_506e:
    cmp r0, #0x26
    beq jump_5084
    cmp r0, #0x2a
    bne jump_50b0
    b jump_5084
jump_5078:
    subs r0, #0x24
    lsls r4, r0
    uxtb r0, r4
    bl call_3a80
    b jump_50b6
jump_5084:
    subs r0, #0x26
    lsl.w r0, r4, r0
    uxtb r0, r0
    bl call_3a68
    b jump_50ac
jump_5092:
    lsls r0, r3, #0x1c
    bpl jump_50b0
    ldrb r0, [r5, #0xb]
    cbz r0, jump_50aa
    movs r1, #7
    udiv r2, r0, r1
    mls r0, r1, r2, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r5, #0xb]
    b jump_50ac
jump_50aa:
    strb r4, [r5, #0xb]
jump_50ac:
    strb r4, [r5]
    b jump_50b6
jump_50b0:
    ldr r0, [r6]
    bl call_53e0
jump_50b6:
    strb.w sb, [r6]
    b jump_500e
jump_50bc:
    lsls r0, r1, #0x1e
    ldr r1, [pc, #0x5c] /* data_511c */ 
    bpl jump_5108
    cmp r2, #0x29
    beq jump_50fc
    cmp r2, #0x2c
    beq jump_50d2
    cmp r2, #0xe3
    beq jump_50d2
    cmp r2, #0xe6
    bne jump_500e
jump_50d2:
    movs r1, #3
    mov r0, sp
    bl call_4a54
    cmp r0, #3
    bne jump_500e
    ldr r1, [pc, #0x48] /* data_5128 */ 
    movs r3, #3
    mov r2, r3
    .short 0x1d09 /* adds r1, r1, #4 */ 
    mov r0, sp
    bl call_4a24
    cmp r0, #0
    beq jump_500e
    ldrb r0, [r5, #8]
    mvns r0, r0
    strb r0, [r5, #8]
    strb.w fp, [r5, #4]
    b jump_50b6
jump_50fc:
    lsls r0, r3, #0x1b
    bpl jump_500e
    movs r0, #0x35
    strb r0, [r6]
    strb r0, [r1]
    b jump_5118
jump_5108:
    ldrb r0, [r1]
    cmp r0, #0
    beq jump_5038
    cmp r2, #0x29
    bne jump_5038
    strb r0, [r6]
    strb.w sb, [r1]
jump_5118:
    strb r7, [r6, #3]
    b jump_500e

data_511c:
.word 0x20000000
data_5120:
.word 0x20000648
data_5124:
.word 0x20000030
data_5128:
.word 0x7a3a
data_512c:
.word 0x20000730
data_5130:
.word 0x200019d0
data_5134:
.word 0x200002c0

call_5138:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x60] /* data_519c */ 
    ldrb r0, [r4, #3]
    lsls r1, r0, #0x1f
    bne jump_516e
    mov r1, r4
    ldr r3, [pc, #0x58] /* data_51a0 */ 
    ldrb r1, [r1, #2]
    ldr r2, [pc, #0x58] /* data_51a4 */ 
    lsls r0, r0, #0x1e
    bpl jump_517a
    ldrb r5, [r4, #1]
    lsls r0, r5, #0x19
    bpl jump_516e
    movs r0, #0
jump_5156:
    ldrb.w r6, [r3, r0, lsl #1]
    cmp r1, r6
    bne jump_5170
    add.w r1, r3, r0, lsl #1
    ldrb r1, [r1, #1]
    strb r1, [r4]
    strb r1, [r2, r0]
    bic r0, r5, #1
    strb r0, [r4, #1]
jump_516e:
    pop {r4, r5, r6, pc}
jump_5170:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #0x22
    blo jump_5156
    pop {r4, r5, r6, pc}
jump_517a:
    movs r0, #0
jump_517c:
    ldrb.w r5, [r3, r0, lsl #1]
    cmp r1, r5
    bne jump_5190
    ldrb r5, [r2, r0]
    cbz r5, jump_5190
    strb r5, [r4]
    movs r1, #0
    strb r1, [r2, r0]
    pop {r4, r5, r6, pc}
jump_5190:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    uxtb r0, r0
    cmp r0, #0x22
    blo jump_517c
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_519c:
.word 0x20000030
data_51a0:
.word 0x7a5c
data_51a4:
.word 0x20000068

call_51a8:
    ldr r1, [pc, #0x18] /* data_51c4 */ 
    push {r4, lr}
    ldr r1, [r1]
    ldrh r2, [r0]
    strh r2, [r1]
    ldrb r0, [r0, #2]
    strb r0, [r1, #2]
    bl call_55a8
    pop.w {r4, lr}
    b.w call_3bec

.byte 0x0
.byte 0x0

data_51c4:
.word 0x2000008c

call_51c8:
    ldr r2, [pc, #0x20] /* data_51ec */ 
    ldrh r0, [r2, #2]
    cmp r0, #1
    bne jump_51e6
    ldr r0, [pc, #0x1c] /* data_51f0 */ 
    ldrb r1, [r0, #7]
    cbz r1, jump_51da
    movs r1, #8
    strb r1, [r0, #7]
jump_51da:
    ldr r1, [pc, #0x18] /* data_51f4 */ 
    movs r0, #0
    movs r3, #1
    strb r0, [r1, #6]
    strb r3, [r1]
    strh r0, [r2, #2]
jump_51e6:
    movs r0, #1
    bx lr

.byte 0x0
.byte 0x0

data_51ec:
.word 0x20000000
data_51f0:
.word 0x200019d0
data_51f4:
.word 0x20000648

call_51f8:
    cmp r0, #0xff
    bhs jump_520a
    adds r0, #0x2b
    cmp r0, #0xff
    bls jump_5206
    movs r0, #0xff
    bx lr
jump_5206:
    uxtb r0, r0
    bx lr
jump_520a:
    movs r0, #0
    bx lr

.byte 0x0
.byte 0x0

call_5210:
    push {r0, r1, r4, r5, r6, lr}
    cmp.w r0, #0x200
    bhs jump_5270
    ldrh.w r4, [sp, #4]
    cmp.w r4, #0x400
    bhs jump_5270
    lsrs r1, r0, #8
    ldr r2, [pc, #0x6c] /* data_5294 */ 
    uxtb r0, r0
    add.w r1, r1, r1, lsl #2
    ldrb r0, [r2, r0]
    lsls r1, r1, #2
    cmp r0, #0xff
    beq jump_5270
    add.w r2, r1, r0, lsr #2
    add.w r3, r0, r1, lsl #2
    lsls r0, r0, #0x1e
    lsrs r1, r0, #0x1d
    movs r6, #3
    ldr r5, [pc, #0x54] /* data_5298 */ 
    adds r2, #0xa0
    cmp r4, #3
    beq jump_5274
    ldrb.w r0, [sp, #4]
    add r3, r5
    cmp r0, #0xff
    strb.w r0, [r3, #0xea]
    beq jump_526c
    adds r0, r5, r2
    lsls r6, r1
    ldrb r2, [r0, #0xea]!
    ldrb.w r3, [sp, #5]
    bics r2, r6
    lsls r3, r1
    orrs r2, r3
    strb r2, [r0]
jump_526c:
    movs r0, #0
    pop {r2, r3, r4, r5, r6, pc}
jump_5270:
    movs r0, #3
jump_5272:
    pop {r2, r3, r4, r5, r6, pc}
jump_5274:
    adds r0, r5, r3
    ldrb.w r0, [r0, #0xea]
    cmp r0, #0xff
    beq jump_5272
    add r2, r5
    lsls r6, r1
    ldrb.w r2, [r2, #0xea]
    rsb.w r1, r1, #8
    ands r2, r6
    lsls r2, r1
    add r0, r2
    uxth r0, r0
    pop {r2, r3, r4, r5, r6, pc}

data_5294:
.word 0x200001c0
data_5298:
.word 0x20000730

call_529c:
    push {r4, r5, r6, r7, lr}
    ldr r0, [pc, #0x6c] /* data_530c */ 
    ldrb r1, [r0, #2]
    ldr r0, [pc, #0x6c] /* data_5310 */ 
    ldrb r2, [r0, #1]
    cbz r1, jump_52ac
    lsls r0, r2, #0x1c
    bmi jump_5300
jump_52ac:
    ldr r0, [pc, #0x64] /* data_5314 */ 
    ldr r5, [pc, #0x68] /* data_5318 */ 
    ldr r3, [pc, #0x68] /* data_531c */ 
    ldrb.w r0, [r0, #0xe8]
    lsls r1, r2, #0x1d
    mov.w r4, #0xe8
    bpl jump_52c6
    ldrb.w r1, [r5, #0x39]
    strb r4, [r3, r1]
    strb r4, [r3, r0]
jump_52c6:
    ldr r1, [pc, #0x58] /* data_5320 */ 
    movs r6, #0xcf
    ldrb r7, [r1, #8]
    ldr r1, [pc, #0x44] /* data_5314 */ 
    ldrb.w r1, [r1, #0xe9]
    cbz r7, jump_5302
    ldrb.w r2, [r5, #0xe7]
    movs r7, #0x50
    cmp r0, r2
    strb r7, [r3, r2]
    beq jump_52e2
    strb r4, [r3, r0]
jump_52e2:
    ldrb.w r0, [r5, #0x65]
    movs r2, #0x51
    cmp r1, r0
    strb r2, [r3, r0]
    beq jump_52f0
    strb r6, [r3, r1]
jump_52f0:
    ldrb.w r1, [r5, #0xe5]
    movs r0, #0x52
    strb r0, [r3, r1]
    ldrb.w r1, [r5, #0xe4]
    movs r0, #0x4f
    strb r0, [r3, r1]
jump_5300:
    pop {r4, r5, r6, r7, pc}
jump_5302:
    lsls r2, r2, #0x1d
    bmi jump_5308
    strb r4, [r3, r0]
jump_5308:
    strb r6, [r3, r1]
    pop {r4, r5, r6, r7, pc}

data_530c:
.word 0x2000005c
data_5310:
.word 0x20000000
data_5314:
.word 0x20000730
data_5318:
.word 0x200001c0
data_531c:
.word 0x200002c0
data_5320:
.word 0x20000648

call_5324:
    ldr r3, [pc, #0x80] /* data_53a8 */ 
    push {r4, lr}
    ldrb r0, [r3, #3]
    ldr r1, [pc, #0x80] /* data_53ac */ 
    ldrb r0, [r1, r0]
    add.w r0, r0, r0, lsl #2
    adds r1, r0, r3
    ldr r0, [pc, #0x78] /* data_53b0 */ 
    .short 0x1d09 /* adds r1, r1, #4 */ 
    str r1, [r0]
    ldrb r2, [r1]
    cbnz r2, jump_534e
    ldrb r2, [r1, #1]
    cbnz r2, jump_534e
    movs r2, #0xff
    strb r2, [r1]
    ldr r1, [r0]
    strb r2, [r1, #1]
    ldr r1, [r0]
    strb r2, [r1, #2]
jump_534e:
    ldrb r1, [r3, #3]
    cmp r1, #3
    bhi jump_5372
    movs r2, #0
    cmp r1, #1
    beq jump_5364
    cmp r1, #2
    beq jump_5368
    cmp r1, #3
    bne jump_539e
    b jump_536e
jump_5364:
    str r2, [r0, #4]
    b jump_539e
jump_5368:
    strb r2, [r0, #4]
    strb r2, [r0, #5]
    b jump_539e
jump_536e:
    movs r1, #0xd8
    b jump_538a
jump_5372:
    cmp r1, #7
    bls jump_539e
    bic r1, r1, #1
    cmp r1, #8
    beq jump_536e
    cmp r1, #0xa
    beq jump_5388
    cmp r1, #0xc
    bne jump_539e
    b jump_5392
jump_5388:
    movs r1, #0x55
jump_538a:
    .short 0x1d00 /* adds r0, r0, #4 */ 
    bl mem_zero
    b jump_539e
jump_5392:
    movs r1, #0x24
    .short 0x1d00 /* adds r0, r0, #4 */ 
    bl mem_zero
    bl call_6ca4
jump_539e:
    ldr r1, [pc, #0x14] /* data_53b4 */ 
    movs r0, #1
    strb r0, [r1]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_53a8:
.word 0x20000730
data_53ac:
.word 0x7aab
data_53b0:
.word 0x2000008c
data_53b4:
.word 0x20000648

call_53b8:
    ldr r0, [pc, #0x20] /* data_53dc */ 
    ldrb r0, [r0, #3]
    cmp r0, #8
    beq jump_53d6
    bgt jump_53ca
    cbz r0, jump_53d6
    cmp r0, #1
    bne jump_53d2
    b jump_53d6
jump_53ca:
    cmp r0, #0xa
    beq jump_53d6
    cmp r0, #0xc
    beq jump_53d6
jump_53d2:
    movs r0, #0
    bx lr
jump_53d6:
    movs r0, #1
    bx lr

.byte 0x0
.byte 0x0

data_53dc:
.word 0x20000730

call_53e0:
    push {r4, r5, r6, lr}
    ldr r5, [pc, #0x10c] /* data_54f0 */ 
    mov r4, r0
    uxtb r1, r0
    ldrb r0, [r5, #3]
    ldr r3, [pc, #0x108] /* data_54f4 */ 
    adds r2, r0, #1
    uxtb r2, r2
    cmp r1, #0x21
    beq jump_547e
    bgt jump_5410
    cmp r1, #0x1e
    beq jump_5440
    bgt jump_5406
    cmp r1, #6
    beq jump_5420
    cmp r1, #0x19
    bne jump_545e
    b jump_5420
jump_5406:
    cmp r1, #0x1f
    beq jump_5440
    cmp r1, #0x20
    bne jump_545e
    b jump_5440
jump_5410:
    cmp r1, #0x22
    beq jump_5474
    cmp r1, #0x29
    beq jump_5440
    cmp r1, #0x36
    beq jump_5420
    cmp r1, #0x37
    bne jump_545e
jump_5420:
    ldr r2, [pc, #0xd4] /* data_54f8 */ 
    ldrb r0, [r2, r0]
    cmp r0, #0xff
    beq jump_54e4
    ldr r0, [pc, #0xc8] /* data_54f4 */ 
    movs r2, #6
    cmp r1, #6
    ldr r0, [r0]
    beq jump_54aa
    cmp r1, #0x19
    beq jump_549a
    cmp r1, #0x36
    beq jump_54be
    cmp r1, #0x37
    bne jump_54e4
    b jump_54d6
jump_5440:
    bl call_53b8
    cmp r0, #0
    beq jump_545e
    cmp r1, #0x1e
    beq jump_5460
    cmp r1, #0x1f
    beq jump_5460
    cmp r1, #0x20
    beq jump_5460
    cmp r1, #0x29
    bne jump_545e
    ldr r1, [pc, #0xa0] /* data_54fc */ 
    movs r0, #1
    strb r0, [r1, #2]
jump_545e:
    pop {r4, r5, r6, pc}
jump_5460:
    subs r1, #0x1e
    ldr r0, [r3]
    uxtb r1, r1
    adds r4, r0, r1
    movs r2, #1
    ldrb r0, [r4]
    bl call_51f8
    strb r0, [r4]
    b jump_54e4
jump_5474:
    strb r2, [r5, #3]
    cmp r2, #3
    bls jump_548a
    movs r0, #0
    b jump_5488
jump_547e:
    strb r2, [r5, #3]
    .short 0x1fd2 /* subs r2, r2, #7 */ 
    cmp r2, #7
    blo jump_548a
    movs r0, #7
jump_5488:
    strb r0, [r5, #3]
jump_548a:
    bl call_5324
    bl call_559c
    mov r0, r4
    bl call_5500
    b jump_54e4
jump_549a:
    ldrb r1, [r0, #3]
    cmp r1, #8
    bhs jump_54e4
    .short 0x1c49 /* adds r1, r1, #1 */ 
    b jump_54b2
jump_54a4:
    bl call_6ca4
    b jump_54e4
jump_54aa:
    ldrb r1, [r0, #3]
    cmp r1, #1
    bls jump_54e4
    .short 0x1e49 /* subs r1, r1, #1 */ 
jump_54b2:
    strb r1, [r0, #3]
    ldrb r0, [r5, #3]
    cmp.w r2, r0, lsr #1
    beq jump_54a4
    b jump_54e4
jump_54be:
    ldrb r1, [r0, #4]
    and r2, r1, #0xf
    cmp r2, #5
    bhs jump_54e4
    mov.w r2, #0x10000000
    add.w r1, r2, r1, ror #4
    ror.w r1, r1, #0x1c
    b jump_54e2
jump_54d6:
    ldrb r1, [r0, #4]
    lsls r2, r1, #0x1c
    beq jump_54e4
    subs r2, r1, #1
    bfi r1, r2, #0, #4
jump_54e2:
    strb r1, [r0, #4]
jump_54e4:
    bl call_55a8
    pop.w {r4, r5, r6, lr}
    b.w call_3bec

data_54f0:
.word 0x20000730
data_54f4:
.word 0x2000008c
data_54f8:
.word 0x7aab
data_54fc:
.word 0x20000648

call_5500:
    push {r4, r5, r6, lr}
    lsrs r1, r0, #0x18
    lsls r1, r1, #0x1e
    bpl jump_5552
    ldr r1, [pc, #0x84] /* data_5590 */ 
    ldrb r1, [r1, #3]
    cmp r1, #7
    bls jump_5552
    ldr r5, [pc, #0x80] /* data_5594 */ 
    and r2, r1, #1
    bic r3, r1, #1
    ldr r1, [r5]
    ubfx r0, r0, #0x10, #8
    cmp r3, #8
    beq jump_5554
    cmp r3, #0xa
    beq jump_5568
    cmp r3, #0xc
    bne jump_5552
    ldr r3, [pc, #0x68] /* data_5598 */ 
    ldrb r4, [r3, r0]
    cmp r4, #0xff
    beq jump_5552
    and r0, r4, #7
    add.w r0, r0, r0, lsl #2
    add r5, r0
    adds r5, #0xe
    cbz r2, jump_5544
    movs r1, #0
jump_5544:
    mov r0, r5
    bl call_6ea8
    lsrs r0, r4, #3
    strb r0, [r5, #3]
    movs r0, #1
    strb r0, [r5, #4]
jump_5552:
    pop {r4, r5, r6, pc}
jump_5554:
    cbz r2, jump_5558
    movs r1, #0
jump_5558:
    add.w r0, r0, r0, lsl #1
    add r0, r5
    pop.w {r4, r5, r6, lr}
    .short 0x1d00 /* adds r0, r0, #4 */ 
    b.w call_6ea8
jump_5568:
    ldr r3, [pc, #0x2c] /* data_5598 */ 
    subs r3, #0x48
    ldrb r0, [r3, r0]
    cmp r0, #0xff
    beq jump_5552
    cbz r2, jump_5576
    movs r1, #0
jump_5576:
    add.w r0, r0, r0, lsl #1
    add.w r4, r5, r0, lsl #1
    adds r0, r4, #4
    bl call_6ea8
    ldrh r0, [r4, #4]
    strh.w r0, [r4, #7]
    ldrb r0, [r4, #6]
    strb r0, [r4, #9]
    pop {r4, r5, r6, pc}

data_5590:
.word 0x20000730
data_5594:
.word 0x2000008c
data_5598:
.word 0x7b73

call_559c:
    movs r1, #0xd8
    ldr r0, [pc, #4] /* data_55a4 */ 
    b.w mem_zero

data_55a4:
.word 0x2000032e

call_55a8:
    push {r4, lr}
    bl call_4644
    cmp r0, #6
    bhs switch_55d8
    tbb [pc, r0]

.byte 0x3
.byte 0x6
.byte 0x9
.byte 0xc
.byte 0x11
.byte 0xf

switch_55bc:
    bl call_3d74
    b switch_55d8
switch_55c2:
    bl call_3c04
    b switch_55d8
switch_55c8:
    bl function_130_6
    b switch_55d8
switch_55ce:
    bl call_3d10
    b switch_55d8
switch_55d4:
    bl call_3b24
switch_55d8:
    pop.w {r4, lr}
    nop.w 
jump_55e0:
    push {r4, lr}
    ldr r4, [pc, #0x1c] /* data_5600 */ 
    ldrb r0, [r4, #0xb]
    cbnz r0, jump_55f8
    ldr r0, [pc, #0x18] /* data_5604 */ 
    ldrb r0, [r0]
    lsls r0, r0, #0x1e
    asrs r0, r0, #8
    lsrs r1, r0, #0x18
    movs r0, #0x29
switch_55f4:
    bl call_40d0
jump_55f8:
    movs r0, #1
    strb r0, [r4, #1]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_5600:
.word 0x20000648
data_5604:
.word 0x2000000c

function_130_10:
    push {r4, lr}
    ldr r4, [pc, #0x68] /* data_5674 */ 
    cbz r0, jump_5640
    movs r1, #0
    mov r0, r4
    bl call_377e
    movs r1, #0
    mov r0, r4
    bl call_376a
    mov r0, r4
    bl bftm_clear
    movs r0, #0x29
    bl nvic_disable_intr
    bl pinmux_c0_gpio
    bl jump_pinmux_b789_gpio
    movs r0, #1
    bl call_6118
    pop.w {r4, lr}
    b.w jump_62f8
jump_5640:
    bl jump_pinmux_b789_spi
    movs r0, #0
    bl call_6118
    movs r1, #0
    mov r0, r4
    bl call_3796
    mov r0, r4
    bl bftm_clear
    movs r1, #1
    mov r0, r4
    bl call_376a
    movs r1, #1
    mov r0, r4
    bl call_377e
    ldr r1, [pc, #0xc] /* data_5678 */ 
    mov.w r0, #0x200
    str.w r0, [r1, #0x100]
    pop {r4, pc}

data_5674:
.word 0x40076000
data_5678:
.word 0xe000e004

call_567c:
    push {r4, lr}
    movs r4, #0
    cmp r0, #2
    beq jump_568c
    ldr r1, [pc, #0x24] /* data_56ac */ 
    str r4, [r1, #0x40]
    str r4, [r1, #0x44]
    str r4, [r1, #0x48]
jump_568c:
    cbz r0, jump_56a6
    movs r0, #2
jump_5690:
    bl call_4b1c
    ldr r0, [pc, #0x14] /* data_56ac */ 
    adds r0, #0x40
    strb r4, [r0, #4]
    bl call_5324
    pop.w {r4, lr}
    b.w call_5ac0
jump_56a6:
    movs r0, #1
    b jump_5690

.byte 0x0
.byte 0x0

data_56ac:
.word 0x20000608

call_56b0:
    push {r4, lr}
    movs r0, #0
    mov.w r2, #0x10000
    movs r3, #1
    mov r1, r0
    bl ckcu_clocks_enable
    pop.w {r4, lr}
    movw r1, #0x8c9f
    ldr r0, [pc, #4] /* data_56d0 */ 
    b.w call_3792

.byte 0x0
.byte 0x0

data_56d0:
.word 0x40076000

setup_intr_priority:
    push {r4, lr}
    mov.w r1, #0x3400
    movs r0, #0
    bl call_57c4
    ldr r1, [pc, #0x70] /* data_5754 */ 
    ldr r0, [r1]
    movw r2, #0xf8ff
    ands r0, r2
    ldr r2, [pc, #0x6c] /* data_5758 */ 
    orr r0, r0, #0x300
    orrs r0, r2
    str r0, [r1]
    movs r2, #0
    mov r1, r2
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x2b
    bl call_57a4
    movs r2, #0
    mov r1, r2
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x2c
    bl call_57a4
    movs r2, #0
    movs r1, #1
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x2a
    bl call_57a4
    movs r2, #0
    movs r1, #2
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    movs r0, #0x29
    bl call_57a4
    movs r2, #0
    movs r1, #2
    movs r0, #3
    bl calc_nvic_priority
    mov r1, r0
    pop.w {r4, lr}
    movs r0, #0x35
    b.w call_57a4

.byte 0x0
.byte 0x0

data_5754:
.word 0xe000ed0c
data_5758:
.word 0x5fa0000

nvic_disable_intr:
    and r2, r0, #0x1f
    movs r1, #1
    lsls r1, r2
    lsrs r0, r0, #5
    lsls r0, r0, #2
    add.w r0, r0, #-0x1fff2000
    str.w r1, [r0, #0x180]
    bx lr
calc_nvic_priority:
    push {r4, r5, lr}
    and r3, r0, #7
    rsb.w r4, r3, #7
    cmp r4, #4
    bls jump_5782
    movs r4, #4
jump_5782:
    adds r0, r3, #4
    cmp r0, #7
    bhs jump_578c
    movs r3, #0
    b jump_578e
jump_578c:
    .short 0x1edb /* subs r3, r3, #3 */ 
jump_578e:
    movs r5, #1
    lsl.w r0, r5, r4
    .short 0x1e40 /* subs r0, r0, #1 */ 
    ands r0, r1
    lsls r0, r3
    lsls r5, r3
    .short 0x1e6d /* subs r5, r5, #1 */ 
    ands r5, r2
    orrs r0, r5
    pop {r4, r5, pc}
call_57a4:
    lsls r1, r1, #0x1c
    lsrs r1, r1, #0x18
    cmp r0, #0
    bge jump_57ba
switch_57ac:
    and r0, r0, #0xf
    add.w r0, r0, #-0x1fff2000
    strb.w r1, [r0, #0xd14]
    bx lr
jump_57ba:
    add.w r0, r0, #-0x1fff2000
    strb.w r1, [r0, #0x400]
    bx lr
call_57c4:
    ldr r2, [pc, #8] /* data_57d0 */ 
    ands r1, r2
    orrs r1, r0
    ldr r0, [pc, #8] /* data_57d4 */ 
    str r1, [r0]
    bx lr

data_57d0:
.word 0x1fffff80
data_57d4:
.word 0xe000ed08

call_57d8:
    push {r4, lr}
    bl function_82
    bl function_29
    cmp r0, #1
    bne jump_57f0
    movs r0, #2
    bl call_6566
    cmp r0, #1
    beq jump_57f2
jump_57f0:
    movs r0, #0
jump_57f2:
    pop {r4, pc}
jump_pinmux_b789_gpio:
    b.w pinmux_b789_gpio
jump_pinmux_b789_spi:
    b.w pinmux_b789_spi
call_57fc:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0xa4] /* data_58a4 */ 
    movs r5, #0
    ldrb r0, [r4, #6]
    cmp r0, #1
    beq jump_583a
    cmp r0, #2
    bne jump_58a2
    subs r1, r4, #4
    ldrh r0, [r1]
    cbz r0, jump_588a
    ldr r2, [pc, #0x94] /* data_58a8 */ 
    ldr r2, [r2]
    cmp r2, #0
    bne jump_58a2
    cmp r0, #0xff
    bhi jump_5830
    ldr r2, [pc, #0x8c] /* data_58ac */ 
    ldr r2, [r2]
    add.w r0, r2, r0, lsl #2
    movs r2, #7
    ldrb r0, [r0, #1]
    cmp.w r2, r0, lsr #5
    bne jump_5892
jump_5830:
    ldrb r0, [r4, #8]
    cmp r0, #1
    beq jump_589a
    strh r5, [r1]
    b jump_5892
jump_583a:
    ldr r0, [pc, #0x74] /* data_58b0 */ 
    ldrb r0, [r0, #3]
    lsls r0, r0, #0x1e
    bmi jump_5858
    ldrb r0, [r4, #7]
    cmp r0, #1
    bne jump_5858
    bl call_4ab0
    cmp r0, #1
    bne jump_5858
    movs r0, #2
    strb r0, [r4, #7]
    ldr r0, [pc, #0x5c] /* data_58b4 */ 
    strh r5, [r0]
jump_5858:
    ldrb r0, [r4, #7]
    cmp r0, #3
    beq jump_587a
    cmp r0, #6
    beq jump_586a
    cmp r0, #7
    beq jump_586a
    cmp r0, #8
    bne jump_58a2
jump_586a:
    bl call_4ab0
    cmp r0, #1
    bne jump_58a2
    pop.w {r4, r5, r6, lr}
    b.w jump_59e0
jump_587a:
    bl call_4ab0
    cmp r0, #1
    bne jump_58a2
    pop.w {r4, r5, r6, lr}
    b.w jump_711c
jump_588a:
    ldrb r0, [r1, #2]
    movs r1, #0
    bl call_3d90
jump_5892:
    pop.w {r4, r5, r6, lr}
    b.w jump_6ff0
jump_589a:
    pop.w {r4, r5, r6, lr}
    b.w call_5ac0
jump_58a2:
    pop {r4, r5, r6, pc}

data_58a4:
.word 0x200019d0
data_58a8:
.word 0x20000060
data_58ac:
.word 0x20000058
data_58b0:
.word 0x20000030
data_58b4:
.word 0x2000001c

call_58b8:
    ldr r0, [pc, #0x28] /* data_58e4 */ 
    push {r4, lr}
    ldrb r0, [r0, #6]
    cmp r0, #1
    beq jump_58de
    ldr r0, [pc, #0x24] /* data_58e8 */ 
    ldr r0, [r0]
    bl call_4a1e
    movs r1, #3
    bl call_5210
    cmp r0, #0xff
    beq jump_58de
    ldr r1, [pc, #0x10] /* data_58e8 */ 
    bl call_4a14
    movs r0, #1
    pop {r4, pc}
jump_58de:
    movs r0, #0
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_58e4:
.word 0x200019d0
data_58e8:
.word 0x20000030

call_58ec:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r4, [pc, #0xdc] /* data_59d0 */ 
    ldr r5, [pc, #0xe0] /* data_59d4 */ 
    subs r6, r4, #4
    ldrb r0, [r4, #6]
    cbz r0, jump_5904
    cmp r0, #1
    beq jump_5976
    cmp r0, #2
    bne jump_599a
    b jump_5944
jump_5904:
    bl call_6f0c
    mov r7, r0
    cmp r0, #0x60
    bhs jump_599a
    ldrb r0, [r5, #3]
    lsls r0, r0, #0x1e
    bpl jump_59c6
    ldrb r0, [r4, #6]
    cbz r0, jump_591e
    movs r0, #0
    bl call_4678
jump_591e:
    ldr r0, [r5]
    bl call_4a1e
    strh r0, [r4, #4]
    movs r0, #2
    strb r0, [r4, #6]
    ldr r0, [pc, #0xac] /* data_59d8 */ 
    add.w r0, r0, r7, lsl #1
    ldrb.w r0, [r0, #0x29]
    lsrs r0, r0, #5
    strb r0, [r4, #8]
    movs r0, #0
    strh r0, [r6]
    strb r7, [r6, #2]
    bl call_6f58
    b jump_59c6
jump_5944:
    ldrb r0, [r5, #3]
    lsls r1, r0, #0x1e
    ldr r0, [pc, #0x88] /* data_59d4 */ 
    ldr r0, [r0]
    bpl jump_5964
    bl call_4a1e
    ldrh r1, [r4, #4]
    cmp r0, r1
    bne jump_5904
    ldrb r0, [r4, #8]
    cmp r0, #3
    bne jump_5904
jump_595e:
    bl call_5ac0
    b jump_59c6
jump_5964:
    bl call_4a1e
    ldrh r1, [r4, #4]
    cmp r0, r1
    bne jump_599a
    ldrb r0, [r4, #8]
    cmp r0, #2
    beq jump_595e
    b jump_59c6
jump_5976:
    bl call_4ecc
    cbnz r0, jump_59c2
    ldrb r0, [r4, #7]
    cmp r0, #5
    beq jump_59a0
    ldrb r1, [r5, #3]
    lsls r1, r1, #0x1e
    bpl jump_599a
    cmp r0, #1
    beq jump_59c6
    movs r7, #1
    cmp r0, #2
    beq jump_59a8
    cmp r0, #3
    beq jump_59c4
    cmp r0, #4
    beq jump_59ca
jump_599a:
    movs r0, #0
jump_599c:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_59a0:
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w jump_70a8
jump_59a8:
    bl call_6f6c
    ldrb r0, [r6, #2]
    cmp r0, #0x60
    beq jump_59c4
    ldr r0, [r5]
    bl call_4a1e
    strh r0, [r4, #4]
    movs r0, #3
    strb r0, [r4, #7]
    ldr r0, [pc, #0x1c] /* data_59dc */ 
    strb r7, [r0]
jump_59c2:
    b jump_59c6
jump_59c4:
    strb r7, [r4, #7]
jump_59c6:
    movs r0, #1
    b jump_599c
jump_59ca:
    movs r0, #5
    strb r0, [r4, #7]
    b jump_59a0

data_59d0:
.word 0x200019d0
data_59d4:
.word 0x20000030
data_59d8:
.word 0x20000730
data_59dc:
.word 0x20000648

jump_59e0:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r5, [pc, #0xb0] /* data_5a98 */ 
    mov.w r8, #1
    ldrb r0, [r5, #7]
    cmp r0, #8
    beq jump_5a84
    subs r6, r5, #4
    ldr r1, [pc, #0xa8] /* data_5a9c */ 
    ldrb r0, [r6, #2]
    ldr r7, [pc, #0xa8] /* data_5aa0 */ 
    add.w r4, r1, r0, lsl #1
    mov r0, r5
    ldrh r1, [r6]
    ldrh r0, [r0, #4]
    adds r4, #0x28
    cmp r1, #2
    bne jump_5a26
    ldr r2, [r7]
    ldrh r1, [r2]
    ldrh r2, [r2, #4]
    ubfx r1, r1, #0, #0xa
    ubfx r2, r2, #0, #0xa
    cmp r1, r2
    bne jump_5a26
    bl call_5210
    movw r0, #0xffff
    strh r0, [r4]
    b jump_5a6a
jump_5a26:
    movs r1, #0xff
    bl call_5210
    ldrb r0, [r5, #8]
    cmp r0, #1
    beq jump_5a7c
    bl call_6ee8
jump_5a36:
    ldrh r1, [r6]
    ldr r2, [r7]
    add.w r1, r2, r1, lsl #2
    mov.w r2, #0x1c00
    strh r0, [r1, #-0x2]
    ldrb r1, [r5, #8]
    ldrh r0, [r5, #4]
    orr.w r1, r2, r1, lsl #13
    orrs r0, r1
    strh r0, [r4]
    ldrh r0, [r6]
    cmp r0, #0xff
    bhi jump_5a62
    ldr r2, [r7]
    mov.w r1, #0xfc00
    strh.w r1, [r2, r0, lsl #2]
jump_5a62:
    ldrb r0, [r6, #2]
    movs r1, #1
    bl call_3d90
jump_5a6a:
    bl call_3bec
    ldrb r0, [r5, #7]
    cmp r0, #7
    beq jump_5a80
    strb.w r8, [r5, #7]
jump_5a78:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_5a7c:
    movs r0, #0
    b jump_5a36
jump_5a80:
    movs r0, #8
    strb r0, [r5, #7]
jump_5a84:
    ldr r1, [pc, #0x1c] /* data_5aa4 */ 
    movs r0, #0
    strb r0, [r5, #6]
    str r0, [r1]
    ldr r1, [pc, #0x18] /* data_5aa8 */ 
    strb r0, [r5, #7]
    strb.w r8, [r1]
    b jump_5a78

.byte 0x0
.byte 0x0

data_5a98:
.word 0x200019d0
data_5a9c:
.word 0x20000730
data_5aa0:
.word 0x20000058
data_5aa4:
.word 0x20000060
data_5aa8:
.word 0x20000648

call_5aac:
    ldr r0, [pc, #0xc] /* data_5abc */ 
    ldrb r1, [r0, #6]
    cmp r1, #0
    bne jump_5aba
    movs r1, #1
    strb r1, [r0, #6]
    strb r1, [r0, #7]
jump_5aba:
    bx lr

data_5abc:
.word 0x200019d0

call_5ac0:
    push {r3, r4, r5, r6, r7, lr}
    ldr r6, [pc, #0x78] /* data_5b3c */ 
    movs r7, #0
    ldrb r0, [r6, #6]
    cmp r0, #2
    bne jump_5b38
    subs r5, r6, #4
    ldrh r0, [r5]
    cbz r0, jump_5b38
    ldr r1, [pc, #0x6c] /* data_5b40 */ 
    str r7, [sp]
    ldr r1, [r1]
    add.w r4, r1, r0, lsl #2
    ldrb.w r0, [sp, #3]
    orr r0, r0, #5
    strb.w r0, [sp, #3]
    b jump_5b2e
jump_5aea:
    ldrb r0, [r4, #1]
    lsrs r0, r0, #5
    cmp r0, #2
    beq jump_5af8
    cmp r0, #7
    bne jump_5b26
    b jump_5b22
jump_5af8:
    ldrh r0, [r4]
    mov r1, sp
    bl call_4a14
    ldrb.w r0, [sp, #1]
    lsls r0, r0, #0x1f
    ldrb.w r0, [sp]
    beq jump_5b12
    bl call_46d4
    b jump_5b16
jump_5b12:
    ldr r1, [pc, #0x30] /* data_5b44 */ 
    ldrb r0, [r1, r0]
jump_5b16:
    strb.w r0, [sp, #2]
    ldr r0, [sp]
    bl call_4780
    b jump_5b26
jump_5b22:
    movs r0, #0xff
    strh r0, [r5]
jump_5b26:
    ldrh r0, [r5]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strh r0, [r5]
    .short 0x1d24 /* adds r4, r4, #4 */ 
jump_5b2e:
    ldrh r0, [r5]
    cmp r0, #0xff
    bls jump_5aea
    bl call_6f58
jump_5b38:
    strb r7, [r6, #6]
    pop {r3, r4, r5, r6, r7, pc}

data_5b3c:
.word 0x200019d0
data_5b40:
.word 0x20000058
data_5b44:
.word 0x200001c0

call_5b48:
    ldr r0, [pc, #0x3c] /* data_5b88 */ 
    push {r4, lr}
    ldr r0, [r0]
    bl call_4a1e
    mov r4, r0
    movs r1, #3
    bl call_5210
    cmp r0, #0xff
    beq jump_5b68
    movs r1, #0xff
    mov r0, r4
    bl call_5210
    b jump_5b7c
jump_5b68:
    bl call_6f0c
    cmp r0, #0x60
    bhs jump_5b84
    ldr r2, [pc, #0x18] /* data_5b8c */ 
    movw r1, #0xffff
    add.w r0, r2, r0, lsl #1
    strh r1, [r0, #0x28]
jump_5b7c:
    bl call_3bec
    movs r0, #1
    pop {r4, pc}
jump_5b84:
    movs r0, #0
    pop {r4, pc}

data_5b88:
.word 0x20000030
data_5b8c:
.word 0x20000730

call_5b90:
    push {r3, r4, r5, lr}
    ldr r4, [pc, #0x30] /* data_5bc4 */ 
    movs r5, #0x48
    b jump_5bba
jump_5b98:
    mov r1, sp
    mov r0, r5
    bl call_5bc8
    ldrb.w r0, [sp, #2]
    strb r0, [r4]
    sub.w r0, r4, #0x48
    ldrb.w r1, [sp, #1]
    strb r1, [r0]
    subs r0, #0x48
    ldrb.w r1, [sp]
    strb r1, [r0]
    .short 0x1e64 /* subs r4, r4, #1 */ 
jump_5bba:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_5b98
    pop {r3, r4, r5, pc}

.byte 0x0
.byte 0x0

data_5bc4:
.word 0x20000405

call_5bc8:
    ldr r2, [pc, #0x30] /* data_5bfc */ 
    movs r3, #0xd
    ldrb r0, [r2, r0]
    and r2, r0, #7
    lsrs r0, r0, #3
    rsb r0, r0, r0, lsl #8
    udiv r0, r0, r3
    uxtb r0, r0
    strb r0, [r1]
    cmp r2, #4
    beq jump_5bf6
    rsb.w r2, r2, #5
    movs r3, #0x2b
    muls r2, r3, r2
    uxtb r3, r2
    mov r2, r1
    mov r1, r3
    b.w call_3fe8
jump_5bf6:
    strb r0, [r1, #1]
    strb r0, [r1, #2]
    bx lr

data_5bfc:
.word 0x7b73

call_5c00:
    ldr r1, [pc, #4] /* data_5c08 */ 
    strb r0, [r1]
    b.w jump_55e0

data_5c08:
.word 0x2000000c

call_5c0c:
    push {r4, lr}
    mov.w r2, #0x200
    movs r1, #0
    lsls r0, r2, #9
    movs r3, #1
    bl ckcu_clocks_enable
    movs r2, #1
    pop.w {r4, lr}
    mov r1, r2
    ldr r0, [pc, #4] /* data_5c2c */ 
    b.w call_4568

.byte 0x0
.byte 0x0

data_5c2c:
.word 0x400b4000

pinmux_c0_gpio:
    movs r2, #0
    mov r1, r2
    movs r0, #2
    b.w afio_pin_config
pinmux_c0_gptm:
    movs r2, #4
    movs r1, #0
    movs r0, #2
    b.w afio_pin_config
call_5c44:
    push {r4, r5, r6, lr}
    ldr r1, [pc, #0x34] /* data_5c7c */ 
    ldr r4, [r1]
    ldr r5, [pc, #0x30] /* data_5c7c */ 
    adds r5, #0x48
    ldr r3, [r5]
    movs r2, #1
    str r2, [r1]
    movs r2, #0
    str r2, [r5]
    ldr r6, [pc, #0x24] /* data_5c80 */ 
    str.w r2, [r6, #0x9c]
    str.w r2, [r6, #0x8c]
    str r4, [r1]
    ldr r1, [pc, #0x1c] /* data_5c84 */ 
    ldr r2, [r1]
    orr r2, r2, #4
    str r2, [r1]
    cbz r0, jump_5c76
    wfi 
jump_5c72:
    str r3, [r5]
    pop {r4, r5, r6, pc}
jump_5c76:
    wfe 
    b jump_5c72

.byte 0x0
.byte 0x0

data_5c7c:
.word 0x43100618
data_5c80:
.word 0x42d42000
data_5c84:
.word 0xe000ed10

function_130_11:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    ldr r4, [pc, #0x38] /* data_5cc8 */ 
    ldr r7, [r4]
    ldr r5, [pc, #0x34] /* data_5cc8 */ 
    adds r5, #0x48
    ldr r6, [r5]
    mov.w sb, #1
    str.w sb, [r4]
    mov.w r8, #0
    str.w r8, [r5]
    bl call_5eb8
    ldr r0, [pc, #0x20] /* data_5ccc */ 
    str.w r8, [r0, #0x9c]
    str.w sb, [r0, #0x8c]
    str r7, [r4]
    ldr r0, [pc, #0x18] /* data_5cd0 */ 
    ldr r1, [r0]
    orr r1, r1, #4
    str r1, [r0]
    wfe 
    str r6, [r5]
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

data_5cc8:
.word 0x43100618
data_5ccc:
.word 0x42d42000
data_5cd0:
.word 0xe000ed10

function_130_12:
    ldr r1, [pc, #0x10] /* data_5ce8 */ 
    ldr r2, [r1]
    bic r2, r2, #4
    str r2, [r1]
    cbz r0, jump_5ce4
    wfi 
    bx lr
jump_5ce4:
    wfe 
    bx lr

data_5ce8:
.word 0xe000ed10

handle_frame:
    push {r4, r5, r6, lr}
    ldr r6, [pc, #0xd4] /* data_5dc4 */ 
    ldrb r0, [r6]
    cmp r0, #1
    bne jump_5db0
    ldr r5, [pc, #0xd0] /* data_5dc8 */ 
    movs r4, #0
    mov r0, r5
    ldrb r2, [r5]
    ldrb r0, [r0, #1]
    mov r1, r4
    cmp r2, #0x10
    beq jump_5d10
    cmp r2, #0x11
    beq jump_5d1a
    cmp r2, #0x12
    bne jump_5db2
    b jump_5d20
jump_5d10:
    cmp r0, #2
    bne jump_5db2
    str r1, [r5, #4]
    movs r1, #4
    b jump_5d94
jump_5d1a:
    bl reset_builtin
    b jump_5d9c
jump_5d20:
    mov.w r3, #0x400
    cmp r0, #0x20
    blo jump_5d46
    sub.w r2, r0, #0x1f
    rsb r2, r2, r2, lsl #4
    cmp.w r3, r2, lsl #2
    blt jump_5d46
    rsb r0, r0, r0, lsl #4
    mov.w r1, #0x2880
    add.w r0, r1, r0, lsl #2
    movs r1, #0x3c
    b jump_5d96
jump_5d46:
    cbz r0, jump_5d52
    cmp r0, #1
    beq jump_5d88
    cmp r0, #2
    bne jump_5db2
    b jump_5d90
jump_5d52:
    ldrb.w r0, [r1, #0x10f]
    cmp r0, #0xaa
    beq jump_5d7e
    ldrb r2, [r3]
    mov r0, r3
    cmp r2, #4
    beq jump_5d84
    movs r2, #0x20
    mov r1, r3
    adds r0, r5, #4
    bl memcpy
    ldr r0, [pc, #0x5c] /* data_5dcc */ 
    ldr.w r1, [r0, #0x180]
    str r1, [r5, #0x24]
    ldr.w r0, [r0, #0x18c]
    movs r1, #0x28
    str r0, [r5, #0x28]
    b jump_5d94
jump_5d7e:
    movs r1, #0x10
    lsls r0, r1, #4
    b jump_5d96
jump_5d84:
    movs r1, #0x34
    b jump_5d96
jump_5d88:
    movs r1, #4
    mov.w r0, #0x3c00
    b jump_5d96
jump_5d90:
    movs r1, #1
    strb r1, [r5, #4]
jump_5d94:
    adds r0, r5, #4
jump_5d96:
    bl flash_read_packet
    movs r4, #1
jump_5d9c:
    ldrb r0, [r6]
    cmp r0, #1
    bne jump_5db0
    cbz r4, jump_5db2
    movs r1, #0x3c
    adds r0, r5, #4
jump_5da8:
    bl mem_zero
    movs r0, #2
    strb r0, [r6]
jump_5db0:
    pop {r4, r5, r6, pc}
jump_5db2:
    ldr r0, [r5]
    str r0, [r5, #4]
    movw r0, #0xaaff
    str r0, [r5]
    ldr r0, [pc, #8] /* data_5dc8 */ 
    movs r1, #0x38
    adds r0, #8
    b jump_5da8

data_5dc4:
.word 0x20000028
data_5dc8:
.word 0x20000608
data_5dcc:
.word 0x40080000

reset_builtin:
    push {r4, lr}
    ldr r1, [pc, #0x6c] /* data_5e40 */ 
    cbz r0, jump_5df2
    cmp r0, #1
    beq jump_5df6
    cmp r0, #2
    bne jump_5e3e
    movs r0, #0x35
    bl nvic_disable_intr
    movs r0, #0
    bl usb_dp_pull_up
    pop.w {r4, lr}
    b.w function_130_11
jump_5df2:
    ldr r0, [pc, #0x50] /* data_5e44 */ 
    b jump_5dfa
jump_5df6:
    ldr r0, [pc, #0x4c] /* data_5e44 */ 
    .short 0x1f40 /* subs r0, r0, #5 */ 
jump_5dfa:
    str r0, [r1]
    movs r1, #0
    mov.w r0, #0x10000
    movs r3, #1
    mov r2, r1
    bl ckcu_clocks_enable
    ldr r1, [pc, #0x3c] /* data_5e48 */ 
    mov.w r0, #0x200
    str r0, [r1, #0x24]
    movs r0, #0x35
    bl nvic_disable_intr
    movs r0, #0
    bl usb_dp_pull_up
    movw r0, #0x4e20
    bl spin_wait_maybe
    dsb sy
    ldr r0, [pc, #0x20] /* data_5e4c */ 
    ldr r1, [r0]
    ldr r2, [pc, #0x20] /* data_5e50 */ 
    and r1, r1, #0x700
    orrs r1, r2
    str r1, [r0]
    dsb sy
jump_5e3c:
    b jump_5e3c
jump_5e3e:
    pop {r4, pc}

data_5e40:
.word 0x20003ffc
data_5e44:
.word 0x55aafaf5
data_5e48:
.word 0x400b0000
data_5e4c:
.word 0xe000ed0c
data_5e50:
.word 0x5fa0004

flash_read_packet:
    push {r4, r5, r6, lr}
    mov r4, r1
    ldr r2, [pc, #0x24] /* data_5e80 */ 
    mov r1, r0
    movs r0, #2
    strb r0, [r2]
    ldr r0, [pc, #0x20] /* data_5e84 */ 
    subs r5, r0, #4
    cmp r1, r0
    beq jump_5e70
    mov r2, r4
    adds r0, r5, #4
    bl memcpy
jump_5e70:
    adds r0, r5, r4
    rsb.w r1, r4, #0x3c
    pop.w {r4, r5, r6, lr}
    .short 0x1d00 /* adds r0, r0, #4 */ 
    b.w mem_zero

data_5e80:
.word 0x20000028
data_5e84:
.word 0x2000060c

ckcu_voodoo1:
    push {r4, r5, r6, r7, lr}
    ldr r7, [pc, #0x28] /* data_5eb4 */ 
    ldr.w r4, [r7, #0x104]
    ldr.w r5, [r7, #0x108]
    ldr.w r6, [r7, #0x10c]
    bics r4, r0
    bics r5, r1
    bics r6, r2
    cbz r3, jump_5ea6
    orrs r4, r0
    orrs r5, r1
    orrs r6, r2
jump_5ea6:
    str.w r4, [r7, #0x104]
    str.w r5, [r7, #0x108]
    str.w r6, [r7, #0x10c]
    pop {r4, r5, r6, r7, pc}

data_5eb4:
.word 0x40088000

call_5eb8:
    ldr r2, [pc, #0x1c] /* data_5ed8 */ 
    movs r1, #0
    mov.w r0, #0x1c20
    str.w r1, [r2, #0x108]
jump_5ec4:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_5ec4
    movs r0, #1
    str.w r0, [r2, #0x108]
    ldr r0, [pc, #0xc] /* data_5edc */ 
jump_5ed0:
    ldr r1, [r0, #8]
    lsls r1, r1, #0x1a
    bpl jump_5ed0
    bx lr

data_5ed8:
.word 0x42d40000
data_5edc:
.word 0x40088000

call_5ee0:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    movs r7, #0xa
    ldr r5, [pc, #0x68] /* data_5f50 */ 
    b jump_5f46
jump_5eea:
    ldr r1, [pc, #0x68] /* data_5f54 */ 
    add.w r0, r7, r7, lsl #1
    add r0, r1
    ldrb r1, [r5, #-0x1]!
    ldrb r0, [r0, #2]
    eors r0, r1
    movs.w r8, r0
    beq jump_5f46
    movs r4, #0x80
    movs r6, #8
    b jump_5f40
jump_5f06:
    tst.w r8, r4
    beq jump_5f3e
    ldrb r0, [r5]
    eors r0, r4
    strb r0, [r5]
    tst r0, r4
    bne jump_5f1a
    movs r0, #1
    b jump_5f1c
jump_5f1a:
    movs r0, #0
jump_5f1c:
    mov sb, r0
    add.w r0, r6, r7, lsl #3
    uxtb r0, r0
    mov r1, sb
    bl call_4878
    cbnz r0, jump_5f32
    ldrb r0, [r5]
    eors r0, r4
    strb r0, [r5]
jump_5f32:
    movs.w r0, sb
    beq jump_5f3a
    movs r0, #1
jump_5f3a:
    ldr r1, [pc, #0x1c] /* data_5f58 */ 
    strh r0, [r1, #2]
jump_5f3e:
    lsrs r4, r4, #1
jump_5f40:
    .short 0x1e76 /* subs r6, r6, #1 */ 
    uxtb r6, r6
    bhs jump_5f06
jump_5f46:
    .short 0x1e7f /* subs r7, r7, #1 */ 
    uxtb r7, r7
    bhs jump_5eea
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}

data_5f50:
.word 0x200001b6
data_5f54:
.word 0x20000310
data_5f58:
.word 0x2000001a

call_5f5c:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r6, r0
    movs r4, #2
    ldr r5, [pc, #0x58] /* data_5fc0 */ 
    mov.w r7, #0x1f4
jump_5f6a:
    bl call_713c
    movs r0, #0xa
    b jump_5f7a
jump_5f72:
    add.w r1, r0, r0, lsl #1
    ldrb r1, [r5, r1]
    cbnz r1, jump_5f80
jump_5f7a:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_5f72
jump_5f80:
    cmp r0, #0xff
    beq jump_5f94
    cmp r4, #0
    bne jump_5f6a
jump_5f88:
    cmp r6, #0
    beq jump_5fbc
    ldr r2, [pc, #0x34] /* data_5fc4 */ 
    ldr r1, [pc, #0x30] /* data_5fc0 */ 
    movs r0, #0xa
    b jump_5fac
jump_5f94:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    ands r4, r4, #0xff
    beq jump_5f88
    mov r0, r7
    bl spin_wait_maybe
    b jump_5f6a
jump_5fa4:
    ldrb r3, [r1, #2]
    strb r3, [r2], #1
    .short 0x1cc9 /* adds r1, r1, #3 */ 
jump_5fac:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_5fa4
    ldr r0, [pc, #0x10] /* data_5fc4 */ 
    ldrb r1, [r0, #9]
    orr r1, r1, #0xf
    strb r1, [r0, #9]
jump_5fbc:
    pop.w {r4, r5, r6, r7, r8, pc}

data_5fc0:
.word 0x20000310
data_5fc4:
.word 0x200001ac

call_5fc8:
    ldr r1, [pc, #0x10] /* data_5fdc */ 
    ldrb r0, [r1]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r0, [r1]
    lsls r0, r0, #0x1e
    bne jump_5fd8
    b.w call_713c
jump_5fd8:
    bx lr

.byte 0x0
.byte 0x0

data_5fdc:
.word 0x2000001a

call_5fe0:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r6, #0
    mov r1, r6
    mov.w r0, #0xf0000
    movs r3, #1
    mov r2, r6
    bl ckcu_clocks_enable
    movs r4, #8
    b jump_6028
jump_5ff8:
    ldr r0, [pc, #0x94] /* data_6090 */ 
    movs r2, #0
    add.w r1, r0, r4, lsl #3
    ldrh r5, [r1, #4]
    ldr r0, [r1]
    uxth r1, r5
    mov r7, r0
    bl gpio_set_pin_pull_up_down
    uxth r1, r5
    mov r0, r7
    movs r2, #1
    bl gpio_set_input_enable
    ldr r0, [pc, #0x78] /* data_6090 */ 
    adds r0, #0x40
    ldrb.w r1, [r0, r4, lsl #1]
    add.w r0, r0, r4, lsl #1
    ldrb r0, [r0, #1]
    bl afio_exti_ssr_write
jump_6028:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_5ff8
    movs r4, #0xa
    b jump_605a
jump_6032:
    ldr r0, [pc, #0x5c] /* data_6090 */ 
    adds r0, #0x50
    add.w r1, r0, r4, lsl #3
    ldrh r5, [r1, #4]
    ldr r7, [r1]
    uxth r1, r5
    mov r0, r7
    bl gpio_set_pin
    uxth r1, r5
    mov r0, r7
    movs r2, #0
    bl call_4568
    uxth r1, r5
    mov r0, r7
    movs r2, #1
    bl gpio_set_input_output
jump_605a:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_6032
    movs r2, #0xff
    movs r1, #0xa
    ldr r0, [pc, #0x2c] /* data_6094 */ 
    bl mem_set
    movs r0, #0
    bl call_60cc
    movs r1, #0xa
    ldr r0, [pc, #0x24] /* data_6098 */ 
    movs r2, #0xff
    b jump_6084
jump_6078:
    strb r6, [r0], #1
    strb r2, [r0], #1
    strb r2, [r0], #1
jump_6084:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_6078
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_6090:
.word 0x7c18
data_6094:
.word 0x200001ac
data_6098:
.word 0x20000310

call_609c:
    ldr r1, [pc, #0x28] /* data_60c8 */ 
    push {r4, lr}
    add.w r0, r1, #0x164
    movs r2, #0xa
    b jump_60bc
jump_60a8:
    ldrb r3, [r0]
    cbnz r3, jump_60b4
    ldrb r3, [r0, #2]
    ldrb r4, [r1]
    cmp r3, r4
    beq jump_60b8
jump_60b4:
    movs r0, #0
    pop {r4, pc}
jump_60b8:
    .short 0x1cc0 /* adds r0, r0, #3 */ 
    .short 0x1c49 /* adds r1, r1, #1 */ 
jump_60bc:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_60a8
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_60c8:
.word 0x200001ac

call_60cc:
    push {r4, lr}
    mov r4, r0
    movs r2, #0x50
    ldr r1, [pc, #0x38] /* data_610c */ 
    ldr r0, [pc, #0x38] /* data_6110 */ 
    bl memcpy
    cbz r4, jump_60fa
    bl call_6184
    cmp r4, #1
    beq jump_60ea
    cmp r4, #2
    bne jump_60fa
    b jump_60f2
jump_60ea:
    ldr r1, [pc, #0x20] /* data_610c */ 
    adds r1, #0xf0
    movs r0, #0x22
    b jump_60f6
jump_60f2:
    ldr r1, [pc, #0x20] /* data_6114 */ 
    movs r0, #0x11
jump_60f6:
    bl call_61b0
jump_60fa:
    bl call_6184
    bl call_529c
    pop.w {r4, lr}
    b.w call_6184

.byte 0x0
.byte 0x0

data_610c:
.word 0x7bc8
data_6110:
.word 0x200002c0
data_6114:
.word 0x7cfc

call_6118:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r7, r0
    mov.w r4, #0xa
    beq jump_612c
    movs r0, #0
jump_6126:
    mov r8, r0
    ldr r5, [pc, #0x50] /* data_617c */ 
    b jump_6150
jump_612c:
    movs r0, #1
    b jump_6126
jump_6130:
    add.w r6, r5, r4, lsl #3
    mov r2, r8
    ldrh r0, [r6, #4]
    uxth r1, r0
    ldr.w r0, [r5, r4, lsl #3]
    bl gpio_set_reset_pin
    ldrh r0, [r6, #4]
    movs r2, #1
    uxth r1, r0
    ldr.w r0, [r5, r4, lsl #3]
    bl gpio_set_input_output
jump_6150:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_6130
    cbz r7, jump_616a
    movs r2, #0
jump_615a:
    ldr r4, [pc, #0x24] /* data_6180 */ 
    movs r1, #0x10
    mov r0, r4
    bl call_4568
    cbz r7, jump_616e
    movs r2, #1
    b jump_6170
jump_616a:
    movs r2, #1
    b jump_615a
jump_616e:
    movs r2, #0
jump_6170:
    mov r0, r4
    pop.w {r4, r5, r6, r7, r8, lr}
    movs r1, #0x10
    b.w gpio_set_reset_pin

data_617c:
.word 0x7c68
data_6180:
.word 0x400b0000

call_6184:
    push {r4, lr}
    ldr r4, [pc, #0x24] /* data_61ac */ 
    movs r2, #0xff
    adds r1, r2, #1
    subw r0, r4, #0x14f
    bl mem_set
    movs r0, #0x50
    subw r1, r4, #0x14f
    b jump_61a2
jump_619c:
    ldrb r2, [r4], #-1
    strb r0, [r1, r2]
jump_61a2:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_619c
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_61ac:
.word 0x2000030f

call_61b0:
    push {r4, r5, lr}
    ldr r3, [pc, #0x18] /* data_61cc */ 
    sub.w r4, r3, #0x100
    b jump_61c4
jump_61ba:
    ldrb r2, [r1, #1]
    ldrb r5, [r1], #2
    ldrb r5, [r4, r5]
    strb r2, [r3, r5]
jump_61c4:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_61ba
    pop {r4, r5, pc}

data_61cc:
.word 0x200002c0

call_61d0:
    push.w {r4, r5, r6, r7, r8, sb, lr}
    ldr.w sb, [pc, #0x5c] /* data_6234 */ 
    ldr.w ip, [pc, #0x5c] /* data_6238 */ 
    movs r5, #0
    sub.w r8, sb, #0xd8
jump_61e2:
    ldr r7, [pc, #0x54] /* data_6238 */ 
    movs r4, #0x10
    movs r3, #0
    add.w r0, sb, r5, lsl #6
    adds r7, #0x44
jump_61ee:
    ldrb.w r1, [ip, r3]
    add.w r1, r1, r1, lsl #3
    add.w r1, r8, r1, lsl #3
    adds r2, r1, r5
    movs r1, #9
    b jump_6214
jump_6200:
    ldrb r6, [r2], #8
    .short 0x1e64 /* subs r4, r4, #1 */ 
    ands r4, r4, #0xff
    ldrh.w r6, [r7, r6, lsl #1]
    strh r6, [r0]
    beq jump_622e
    .short 0x1d00 /* adds r0, r0, #4 */ 
jump_6214:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_6200
    .short 0x1c5b /* adds r3, r3, #1 */ 
    uxtb r3, r3
    cmp r3, #3
    blo jump_61ee
    .short 0x1c6d /* adds r5, r5, #1 */ 
    uxtb r5, r5
    cmp r5, #8
    blo jump_61e2
    pop.w {r4, r5, r6, r7, r8, sb, pc}
jump_622e:
    movs r4, #0x10
    subs r0, #0x3a
    b jump_6214

data_6234:
.word 0x20000406
data_6238:
.word 0x7d20

call_623c:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r1, #0
    mov.w r2, #0x20000
    mov.w r0, #0x70000
    movs r3, #1
    bl ckcu_clocks_enable
    movw r1, #0xea60
    ldr r0, [pc, #0x90] /* data_62e8 */ 
    bl call_3792
    ldr r4, [pc, #0x90] /* data_62ec */ 
    movs r1, #2
    mov r0, r4
    bl gpio_set_pin
    movs r2, #1
    movs r1, #2
    mov r0, r4
    bl call_4568
    movs r2, #1
    movs r1, #2
    mov r0, r4
    bl gpio_set_input_output
    movs r1, #4
    mov r0, r4
    bl gpio_set_pin
    ldr r6, [pc, #0x6c] /* data_62f0 */ 
    mov.w r5, #0x4000
    mov r1, r5
    mov r0, r6
    bl gpio_set_pin
    lsls r7, r5, #1
    mov r1, r7
    mov r0, r6
    bl gpio_set_pin
    movs r2, #1
    movs r1, #4
    mov r0, r4
    bl call_4568
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl call_4568
    movs r2, #1
    mov r1, r7
    mov r0, r6
    bl call_4568
    movs r2, #1
    movs r1, #4
    mov r0, r4
    bl gpio_set_input_output
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_output
    movs r2, #1
    mov r1, r7
    mov r0, r6
    bl gpio_set_input_output
    movs r2, #1
    mov r1, r2
    ldr r0, [pc, #0x18] /* data_62f4 */ 
    bl gpio_set_input_enable
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w jump_71f4

.byte 0x0
.byte 0x0

data_62e8:
.word 0x40077000
data_62ec:
.word 0x400b4000
data_62f0:
.word 0x400b0000
data_62f4:
.word 0x400b2000

jump_62f8:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x60] /* data_635c */ 
    movs r1, #0
    mov r0, r4
    bl call_377e
    movs r1, #0
    mov r0, r4
    bl call_376a
    mov r0, r4
    bl bftm_clear
    ldr r1, [pc, #0x4c] /* data_6360 */ 
    asrs r0, r4, #0x14
    str.w r0, [r1, #0x180]
    movs r1, #0
    ldr r0, [pc, #0x44] /* data_6364 */ 
    bl gptm_enable_disable
    ldr r1, [pc, #0x44] /* data_6368 */ 
    movs r0, #2
    str r0, [r1, #0x24]
    ldr r4, [pc, #0x40] /* data_636c */ 
    movs r5, #8
    b jump_6354
jump_632e:
    ldrh r0, [r4, #4]
    movs r2, #0
    uxth r1, r0
    ldr r0, [r4]
    bl gpio_set_input_output
    ldrh r0, [r4, #4]
    movs r2, #1
    uxth r1, r0
    ldr r0, [r4]
    bl gpio_set_input_enable
    ldrh r0, [r4, #4]
    movs r2, #2
    uxth r1, r0
    ldr r0, [r4]
    bl gpio_set_pin_pull_up_down
    adds r4, #8
jump_6354:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_632e
    pop {r4, r5, r6, pc}

data_635c:
.word 0x40077000
data_6360:
.word 0xe000e004
data_6364:
.word 0x4006f000
data_6368:
.word 0x400b4000
data_636c:
.word 0x7d24

function_130_16:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x8c] /* data_6400 */ 
    movs r5, #8
    b jump_639c
jump_6378:
    ldrh r0, [r4, #4]
    uxth r1, r0
    ldr r0, [r4]
    bl gpio_set_pin
    ldrh r0, [r4, #4]
    movs r2, #1
    uxth r1, r0
    ldr r0, [r4]
    bl call_4568
    ldrh r0, [r4, #4]
    movs r2, #1
    uxth r1, r0
    ldr r0, [r4]
    bl gpio_set_input_output
    adds r4, #8
jump_639c:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_6378
    ldr r1, [pc, #0x60] /* data_6404 */ 
    movs r0, #2
    str r0, [r1, #0x28]
    lsls r1, r0, #8
    ldr r0, [pc, #0x5c] /* data_6408 */ 
    bl mem_zero
    ldr r1, [pc, #0x58] /* data_640c */ 
    movs r0, #0
    strb r0, [r1, #1]
    movs r0, #0x64
    bl spin_wait_maybe
    bl call_6468
    movs r0, #2
    bl call_7248
    ldr r1, [pc, #0x48] /* data_6410 */ 
    mov.w r0, #0x8000
    str r0, [r1, #0x24]
    movs r1, #1
    ldr r0, [pc, #0x40] /* data_6414 */ 
    bl gptm_enable_disable
    ldr r4, [pc, #0x40] /* data_6418 */ 
    movs r1, #0
    mov r0, r4
    bl call_3796
    mov r0, r4
    bl bftm_clear
    movs r1, #1
    mov r0, r4
    bl call_376a
    movs r1, #1
    mov r0, r4
    bl call_377e
    ldr r1, [pc, #0x24] /* data_641c */ 
    asrs r0, r4, #0x14
    str.w r0, [r1, #0x100]
    pop {r4, r5, r6, pc}

data_6400:
.word 0x7d24
data_6404:
.word 0x400b4000
data_6408:
.word 0x20000406
data_640c:
.word 0x20000020
data_6410:
.word 0x400b0000
data_6414:
.word 0x4006f000
data_6418:
.word 0x40077000
data_641c:
.word 0xe000e004

call_6420:
    push {r4, r5, lr}
    movs r0, #0x12
    bl call_7248
    movs r1, #0xa
    mov.w r0, #0x300
    bl call_7278
    movs r1, #2
    movs r0, #0
    bl call_7278
    ldr r4, [pc, #0x24] /* data_6460 */ 
    mov.w r0, #0x4000
    str r0, [r4, #0x28]
    lsls r5, r0, #1
    str r5, [r4, #0x24]
    movs r1, #8
    mov.w r0, #0xc00
    bl call_7278
    ldr r1, [pc, #0x10] /* data_6464 */ 
    movs r0, #4
    str r0, [r1, #0x24]
    str r5, [r4, #0x28]
    nop 
    nop 
    str r5, [r4, #0x24]
    pop {r4, r5, pc}

data_6460:
.word 0x400b0000
data_6464:
.word 0x400b4000

call_6468:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, lr}
    ldr r1, [pc, #0x78] /* data_64e8 */ 
    ldr r0, [pc, #0x74] /* data_64e4 */ 
    movs r5, #0x10
    ldrb r2, [r1, #1]
    movs r7, #4
    add.w r4, r0, r2, lsl #6
    ldrb r0, [r1]
    ldr.w sl, [pc, #0x6c] /* data_64ec */ 
    ldr r6, [pc, #0x6c] /* data_64f0 */ 
    mov.w fp, #0x4000
    adds r4, #0x3e
    cbz r0, jump_6498
    .short 0x1e40 /* subs r0, r0, #1 */ 
    ands r0, r0, #0xff
    strb r0, [r1]
    bne jump_6498
    bl call_6420
jump_6498:
    mov sb, r7
jump_649a:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    blo jump_64da
    mov.w r8, #0x8000
    str.w r8, [r6, #0x28]
    ldrh r0, [r4]
    subs r7, r4, #2
    movs r1, #0xa
    bl call_7278
    ldrh r0, [r7]
    movs r1, #9
    ubfx r7, r0, #6, #1
    .short 0x1f24 /* subs r4, r4, #4 */ 
    bl call_7278
    mov r0, fp
    str.w fp, [r6, #0x28]
    str.w r8, [r6, #0x24]
    mov r1, sb
    mov r2, sl
    cbz r7, jump_64d4
    str r1, [r2, #0x24]
    b jump_64d6
jump_64d4:
    str r1, [r2, #0x28]
jump_64d6:
    str r0, [r6, #0x24]
    b jump_649a
jump_64da:
    str.w sb, [sl, #0x24]
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, pc}

.byte 0x0
.byte 0x0

data_64e4:
.word 0x20000406
data_64e8:
.word 0x20000020
data_64ec:
.word 0x400b4000
data_64f0:
.word 0x400b0000

call_64f4:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_6500
    orr r1, r1, #1
    b jump_6504
jump_6500:
    bic r1, r1, #1
jump_6504:
    str r1, [r0]
    bx lr
function_e_54:
    push {r4, r5, lr}
    ldrd r4, r3, [r1, #0x14]
    cbz r4, jump_654a
    mov.w r2, #0x200
    lsrs r2, r3
    orrs r2, r4
jump_6518:
    ldr r4, [r1, #8]
    ldr r3, [r1]
    orrs r3, r4
    ldrd r4, r5, [r1, #0xc]
    orrs r4, r5
    orrs r3, r4
    ldr r4, [r1, #0x1c]
    orrs r3, r4
    orrs r3, r2
    str r3, [r0, #4]
    ldr r3, [r1, #0x24]
    ldr r2, [r1, #4]
    orrs r2, r3
    ldr r3, [r1, #0x20]
    orr.w r2, r2, r3, lsl #4
    str r2, [r0, #0x18]
    ldr r1, [r1, #0x28]
    mov.w r2, #-1
    add.w r1, r2, r1, lsr #1
    str r1, [r0, #0xc]
    pop {r4, r5, pc}
jump_654a:
    mov.w r2, #0x100
    lsls r2, r3
    b jump_6518
call_6552:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_655e
    orr r1, r1, #8
    b jump_6562
jump_655e:
    bic r1, r1, #8
jump_6562:
    str r1, [r0]
    bx lr
call_6566:
    push {r4, r5, r6, lr}
    mov r5, r0
    bl function_11
    bfi r4, r0, #0, #8
    cbz r5, jump_6598
    cmp r5, #1
    beq jump_6584
    cmp r5, #2
    bne jump_658a
    uxth r0, r4
    orr r4, r0, #2
    b jump_658a
jump_6584:
    uxth r0, r4
    bic r4, r0, #2
jump_658a:
    uxtb r0, r4
    bl function_28
    bl function_11
    bfi r4, r0, #0, #8
jump_6598:
    lsls r0, r4, #0x1e
    bpl jump_65a0
    movs r0, #1
    pop {r4, r5, r6, pc}
jump_65a0:
    movs r0, #0
    pop {r4, r5, r6, pc}
.thumb_func
clock_init:
    ldr r0, [pc, #0x50] /* data_65f8 */ 
    movs r1, #1
    str.w r1, [r0, #0x300]
    ldr r2, [pc, #0x4c] /* data_65fc */ 
    str.w r1, [r2, #0xa8]
jump_65b2:
    ldr.w r3, [r2, #0x108]
    cmp r3, #0
    beq jump_65b2
    movs r3, #0
    str r3, [r2, #0x20]
    mov.w r3, #0x9000000
    str r3, [r0, #0x18]
    str.w r1, [r2, #0xa4]
jump_65c8:
    ldr.w r3, [r2, #0x104]
    cmp r3, #0
    beq jump_65c8
    ldr r2, [pc, #0x2c] /* data_6600 */ 
    ldr.w r3, [r2, #0x200]
    bic r3, r3, #7
    .short 0x1cdb /* adds r3, r3, #3 */ 
    str.w r3, [r2, #0x200]
    str r1, [r0, #0x20]
    ldr r2, [r0, #4]
    bic r2, r2, #3
    .short 0x1c52 /* adds r2, r2, #1 */ 
    str r2, [r0, #4]
jump_65ec:
    ldr r2, [r0, #0x34]
    cmp.w r1, r2, lsr #30
    bne jump_65ec
    bx lr

.byte 0x0
.byte 0x0

data_65f8:
.word 0x40088000
data_65fc:
.word 0x43100000
data_6600:
.word 0x40080000

call_6604:
    ldr r0, [pc, #0x18] /* data_6620 */ 
    movs r1, #0
    add.w r2, r0, #8
    str r1, [r0, #0x1c]
    str r1, [r0, #0x20]
    strb r1, [r2, #1]
    str.w r1, [r0, #0x15]
    movs r1, #0x1d
    ldr r0, [pc, #8] /* data_6624 */ 
    b.w mem_zero

.byte 0x0
.byte 0x0

data_6620:
.word 0x20000034
data_6624:
.word 0x200006d6

call_6628:
    push {r4, lr}
    ldr r0, [pc, #0x20] /* data_664c */ 
    ldr r1, [pc, #0x1c] /* data_664c */ 
    movs r4, #1
    strb r4, [r0]
    adds r1, #0xc
    movs r0, #2
    strb r0, [r1]
    ldr r1, [pc, #0x14] /* data_6650 */ 
    movs r0, #4
    strb r0, [r1]
    bl call_6604
    ldr r0, [pc, #8] /* data_664c */ 
    subs r0, #8
    strb r4, [r0, #5]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_664c:
.word 0x2000003c
data_6650:
.word 0x200006d4

call_6654:
    ldrb.w r0, [r0, #0x34]
    ubfx r0, r0, #1, #1
    bx lr

.byte 0x0
.byte 0x0

jump_6660:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    bl usb_get_intr_flags
    mov r5, r0
    ldr r6, [pc, #0x158] /* data_67c8 */ 
    lsls r0, r0, #0x1e
    bpl jump_667e
    ldr r0, [r6, #4]
    cbz r0, jump_6678
    blx r0
jump_6678:
    movs r0, #2
    bl usb_set_intr_flags
jump_667e:
    lsls r0, r5, #0x1b
    bpl jump_66a2
    movs r0, #0x10
    bl usb_set_intr_flags
    ldrb.w r0, [r4, #0x32]
    cmp r0, #2
    blo jump_66a2
    bl usb_set_lpmode_pdwn
    ldrb.w r0, [r4, #0x32]
    strb.w r0, [r4, #0x33]
    movs r0, #3
    strb.w r0, [r4, #0x32]
jump_66a2:
    lsls r0, r5, #0x1d
    mov.w r7, #0
    bpl jump_66ee
    subs r0, r7, #1
    str r0, [r4, #0x20]
    strb.w r7, [r4, #0x30]
    strb.w r7, [r4, #0x31]
    ldrb.w r0, [r4, #0x34]
    bic r0, r0, #2
    strb.w r0, [r4, #0x34]
    movs r0, #4
    strb.w r0, [r4, #0x32]
    str r7, [r4, #0x38]
    bl usb_ckcu_voodoo
    bl call_6ac8
    ldr r1, [pc, #0xf8] /* data_67cc */ 
    movs r0, #0
    bl function_e_70
    ldr r0, [pc, #0xf0] /* data_67cc */ 
    ldr r0, [r0]
    bl usb_enable_intr
    ldr r0, [r6]
    cbz r0, jump_66e8
    blx r0
jump_66e8:
    movs r0, #4
    bl usb_set_intr_flags
jump_66ee:
    lsls r0, r5, #0x1c
    bpl jump_6704
    bl call_6ac8
    ldrb.w r0, [r4, #0x33]
    strb.w r0, [r4, #0x32]
    movs r0, #8
    bl usb_set_intr_flags
jump_6704:
    lsls r0, r5, #0x17
    mov.w r8, #0x100
    bpl jump_6788
    movs r0, #0
    bl usb_get_ep_intr
    mov r5, r0
    lsls r0, r0, #0x16
    bpl jump_672e
    mov r0, r4
    bl call_6be8
    mov r0, r4
    bl call_7560
    mov.w r1, #0x200
    movs r0, #0
    bl usb_set_ep_intr
jump_672e:
    lsls r0, r5, #0x1e
    bpl jump_6770
    movs r1, #2
    movs r0, #0
    bl usb_set_ep_intr
    ldr r0, [r4, #0x20]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    beq jump_6770
    ldrb.w r0, [r4, #0x24]
    cmp r0, #2
    bne jump_6770
    movs r2, #0x40
    movs r0, #0
    ldr r1, [r4, #0x1c]
    bl usb_recv
    ldr r1, [r4, #0x1c]
    add r1, r0
    str r1, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    subs r0, r1, r0
    str r0, [r4, #0x20]
    bne jump_6770
    movs r0, #1
    strb.w r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    cbz r1, jump_6770
    ldr r0, [r4, #0x2c]
    blx r1
    str r7, [r4, #0x28]
jump_6770:
    lsls r0, r5, #0x1b
    bpl jump_6782
    mov r0, r4
    bl call_751c
    movs r1, #0x10
    movs r0, #0
    bl usb_set_ep_intr
jump_6782:
    mov r0, r8
    bl usb_set_intr_flags
jump_6788:
    mov r4, r8
jump_678a:
    bl usb_get_intr_flags
    bl function_e_75
    mov r5, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    beq jump_67c2
    mov r0, r5
    bl usb_get_ep_intr
    tst.w r0, #0x12
    beq jump_678a
    movs r1, #0x12
    mov r0, r5
    bl usb_set_ep_intr
    lsl.w r0, r4, r5
    bl usb_set_intr_flags
    ldr r0, [r6, #0x18]
    cmp r0, #0
    beq jump_678a
    mov r1, r0
    mov r0, r5
    blx r1
    b jump_678a
jump_67c2:
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_67c8:
.word 0x80f8
data_67cc:
.word 0x20000168

call_67d0:
    movs r1, #2
    strb.w r1, [r0, #0x32]
    ldr r0, [pc, #4] /* data_67dc */ 
    b.w jump_6ab4

data_67dc:
.word 0x20000168

call_67e0:
    ldrb.w r0, [r0, #0x32]
    cmp r0, #3
    beq jump_67ec
    movs r0, #0
    bx lr
jump_67ec:
    movs r0, #1
    bx lr
call_67f0:
    push {r4, lr}
    bl call_6ac8
    pop.w {r4, lr}
    b.w jump_6bf8

.byte 0x0
.byte 0x0

usb_set_intr_flags:
    ldr r1, [pc, #4] /* data_6808 */ 
    str r0, [r1, #8]
    bx lr

.byte 0x0
.byte 0x0

data_6808:
.word 0x400a8000

usb_init:
    push {r4, lr}
    movs r1, #0
    mov.w r0, #0x400
    movs r2, #0x40
    movs r3, #1
    bl ckcu_clocks_enable
    movs r0, #2
    bl ckcu_set_usb_prescaler
    ldr r4, [pc, #0x48] /* data_686c */ 
    ldr r0, [pc, #0x40] /* data_6868 */ 
    str r0, [r4, #8]
    subs r0, #0x5c
    str r0, [r4, #0xc]
    subs r0, #0xf4
    str r0, [r4, #0x10]
    movs r0, #2
    str r0, [r4, #0x14]
    bl call_6628
    mov r0, r4
    bl call_67d0
    ldr r1, [pc, #0x30] /* data_6870 */ 
    mov.w r0, #0x200000
    str.w r0, [r1, #0x100]
    movs r0, #1
    bl usb_dp_pull_up
    movs r0, #0xfa
    bl spin_wait_maybe
    ldrb.w r0, [r4, #0x34]
    pop.w {r4, lr}
    and r1, r0, #1
    ldr r0, [pc, #0x10] /* data_6874 */ 
    b.w function_28

.byte 0x0
.byte 0x0

data_6868:
.word 0x80bc
data_686c:
.word 0x200006f4
data_6870:
.word 0xe000e004
data_6874:
.word 0x20000168

usb_dp_wake_up:
    ldr r1, [pc, #0x14] /* data_6890 */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_6888
    bic r0, r0, #0x800
jump_6884:
    str r0, [r1]
    bx lr
jump_6888:
    orr r0, r0, #0x800
    b jump_6884

.byte 0x0
.byte 0x0

data_6890:
.word 0x400a8000

usb_dp_pull_up:
    ldr r1, [pc, #0x14] /* data_68ac */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_68a4
    bic r0, r0, #0x400
jump_68a0:
    str r0, [r1]
    bx lr
jump_68a4:
    orr r0, r0, #0x400
    b jump_68a0

.byte 0x0
.byte 0x0

data_68ac:
.word 0x400a8000

usb_ckcu_voodoo:
    movs r1, #0
    movs r0, #0x20
    movs r3, #1
    mov r2, r1
    b.w ckcu_voodoo1
usb_ep_data_toggle:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #9
usb_clear_csr:
    str r1, [r0]
    pop {r4, pc}
usb_ep_stall:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #0x24
    str r1, [r0]
    pop {r4, pc}
usb_set_ep_intr:
    push {r4, lr}
    mov r4, r1
    bl usb_get_ep_reg
    str r4, [r0, #8]
    pop {r4, pc}
usb_get_ep_buff:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r0, [r0, #0x10]
    ldr r1, [pc, #8] /* data_68fc */ 
    ubfx r0, r0, #0, #0xa
    add r0, r1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_68fc:
.word 0x400aa000

usb_get_ep_buff_end:
    push {r4, r5, r6, lr}
    mov r5, r0
    bl usb_get_ep_reg
    mov r4, r0
    mov r0, r5
    bl usb_get_ep_len
    ldr r1, [r4, #0x10]
    ubfx r1, r1, #0, #0xa
    add r0, r1
    ldr r1, [pc, #4] /* data_6920 */ 
    add r0, r1
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_6920:
.word 0x400aa000

usb_get_ep_len:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r0, [r0, #0x10]
    ubfx r0, r0, #0xa, #0xa
    pop {r4, pc}
function_e_67:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0, #0x10]
    ldr r0, [r0]
    lsls r1, r1, #3
    bpl jump_6946
    ubfx r0, r0, #2, #1
    pop {r4, pc}
jump_6946:
    ubfx r0, r0, #5, #1
    pop {r4, pc}
usb_get_ep_intr:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0, #4]
    ldr r0, [r0, #8]
    ands r0, r1
    pop {r4, pc}
usb_get_ep_tcnt:
    push {r4, lr}
    mov r4, r1
    bl usb_get_ep_reg
    ldr r0, [r0, #0xc]
    lsrs r0, r4
    ubfx r0, r0, #0, #9
    pop {r4, pc}
function_e_70:
    push {r4, r5, r6, lr}
    mov r4, r1
    mov r5, r0
    bl usb_get_ep_reg
    add.w r1, r4, r5, lsl #3
    ldr r2, [r1, #4]
    str r2, [r0, #0x10]
    ldr r1, [r1, #8]
    str r1, [r0, #4]
    mov.w r1, #-1
    str r1, [r0, #8]
    mov r0, r5
    pop.w {r4, r5, r6, lr}
    b.w function_e_71
usb_read_ep_buff:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r6, r2
    mov r7, r1
    movs r5, r0
    beq jump_69c2
    movs r1, #0
jump_69a0:
    bl usb_get_ep_tcnt
    mov r4, r0
    cmp r0, r6
    bhi jump_69bc
    mov r0, r5
    cbz r5, jump_69c6
    bl usb_get_ep_buff
jump_69b2:
    adds r1, r4, #3
    lsrs r2, r1, #2
    mov r1, r7
    bl copy_words
jump_69bc:
    mov r0, r4
    pop.w {r4, r5, r6, r7, r8, pc}
jump_69c2:
    movs r1, #0x10
    b jump_69a0
jump_69c6:
    bl usb_get_ep_buff_end
    b jump_69b2
usb_recv:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r5, r2
    mov r6, r1
    mov r7, r0
    bl usb_get_ep_reg
    mov r4, r0
    movs r0, #0
    cbz r5, jump_69f0
    mov r2, r5
    mov r1, r6
    mov r0, r7
    bl usb_read_ep_buff
    cbnz r0, jump_69f0
    cmp r5, #0
    bne jump_69f8
jump_69f0:
    ldr r1, [r4]
    and r1, r1, #0x10
    str r1, [r4]
jump_69f8:
    pop.w {r4, r5, r6, r7, r8, pc}
function_e_71:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #0x19
    str r1, [r0]
    pop {r4, pc}
function_e_72:
    push {r4, lr}
    bl usb_get_ep_reg
    movs r1, #4
    str r1, [r0]
    pop {r4, pc}
function_e_73:
    push {r4, lr}
    bl usb_get_ep_reg
    movs r1, #0x40
    str r1, [r0, #8]
    ldr r2, [r0]
    movs r1, #0x24
    bics r1, r2
    str r1, [r0]
    pop {r4, pc}
usb_copy_send:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r4, r2
    mov r8, r1
    mov r7, r0
    bl usb_get_ep_len
    mov r6, r0
    mov r0, r7
    bl usb_get_ep_reg
    mov r5, r0
    movs r1, #0
    mov r0, r7
    bl usb_get_ep_tcnt
    cmp r4, r6
    bhi jump_6a52
    cbz r0, jump_6a58
jump_6a52:
    movs r0, #0
jump_6a54:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_6a58:
    mov r0, r7
    bl usb_get_ep_buff
    mov r1, r0
    adds r0, r4, #3
    lsrs r2, r0, #2
    mov r0, r8
    bl copy_words
    str r4, [r5, #0xc]
    movs r0, #2
    str r0, [r5]
    mov r0, r4
    b jump_6a54
usb_enable_intr:
    ldr r1, [pc, #8] /* data_6a80 */ 
    ldr r2, [r1, #4]
    orrs r2, r0
    str r2, [r1, #4]
    bx lr

.byte 0x0
.byte 0x0

data_6a80:
.word 0x400a8000

function_e_75:
    mov r3, r0
    movs r1, #7
jump_6a88:
    add.w r2, r1, #8
    lsr.w r0, r3, r2
    lsls r2, r0, #0x1f
    beq jump_6a98
    sxtb r0, r1
    bx lr
jump_6a98:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    cmp r1, #0
    bgt jump_6a88
    mov.w r0, #-1
    bx lr
usb_get_intr_flags:
    ldr r0, [pc, #8] /* data_6ab0 */ 
    ldr r1, [r0, #4]
    ldr r0, [r0, #8]
    ands r0, r1
    bx lr

.byte 0x0
.byte 0x0

data_6ab0:
.word 0x400a8000

jump_6ab4:
    b.w ptr_write_data
usb_set_lpmode_pdwn:
    ldr r0, [pc, #8] /* data_6ac4 */ 
    ldr r1, [r0]
    orr r1, r1, #0xc
    str r1, [r0]
    bx lr

data_6ac4:
.word 0x400a8000

call_6ac8:
    ldr r0, [pc, #8] /* data_6ad4 */ 
    ldr r1, [r0]
    and r1, r1, #0x400
    str r1, [r0]
    bx lr

data_6ad4:
.word 0x400a8000

function_28:
    push {r4, lr}
    mov r4, r0
    ldr r0, [pc, #0x68] /* data_6b48 */ 
    ldr r2, [r0]
    cmp r2, #1
    bne jump_6b44
    movs r2, #0
    str r2, [r0]
    ldr r0, [pc, #0x60] /* data_6b4c */ 
    ldr r2, [r0]
    lsls r3, r2, #0x19
    mov.w r2, #-1
    bpl jump_6b0e
    movw r3, #0x40c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_6b04
    movs r0, #0
    bl call_5c44
jump_6b04:
    ldr r0, [r4]
    pop.w {r4, lr}
    b.w usb_enable_intr
jump_6b0e:
    movw r3, #0xc0c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_6b1e
    movs r0, #0
    bl call_5c44
jump_6b1e:
    movs r0, #0
    bl usb_dp_wake_up
    ldr r0, [r4]
    bl usb_enable_intr
    movs r0, #0
    bl usb_dp_pull_up
    movs r1, #0xc8
    movs r0, #0
jump_6b34:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, r1
    blo jump_6b34
    pop.w {r4, lr}
    movs r0, #1
    b.w usb_dp_pull_up
jump_6b44:
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_6b48:
.word 0x20000014
data_6b4c:
.word 0x400a8000

ptr_write_data:
    movw r1, #0x111d
    str r1, [r0]
    ldr r1, [pc, #0x28] /* data_6b80 */ 
    str r1, [r0, #4]
    movw r1, #0x212
    str r1, [r0, #8]
    ldr r1, [pc, #0x20] /* data_6b84 */ 
    str r1, [r0, #0xc]
    ldr r2, [pc, #0x20] /* data_6b88 */ 
    movs r1, #0x10
    strd r1, r2, [r0, #0x10]
    str r1, [r0, #0x18]
    ldr r1, [pc, #0x1c] /* data_6b8c */ 
    str r1, [r0, #0x1c]
    movs r1, #0
    str r1, [r0, #0x20]
    ldr r1, [pc, #0x18] /* data_6b90 */ 
    str r1, [r0, #0x24]
    movs r1, #2
    str r1, [r0, #0x28]
    bx lr

data_6b80:
.word 0x80010008
data_6b84:
.word 0x91002088
data_6b88:
.word 0x92010090
data_6b8c:
.word 0x930100d0
data_6b90:
.word 0x84010110

function_130_2:
    push {r4, lr}
    ldr r4, [pc, #0x48] /* data_6be0 */ 
    ldrb.w r0, [r4, #0x32]
    cmp r0, #3
    bne jump_6ba4
    bl function_130_9
jump_6ba4:
    ldr r1, [pc, #0x3c] /* data_6be4 */ 
    ldrb r0, [r1, #5]
    cbz r0, jump_6bca
    cmp r0, #1
    beq jump_6bc2
    cmp r0, #2
    bne jump_6bd2
    ldrb.w r0, [r4, #0x32]
    cmp r0, #6
    bne jump_6bbe
    bl function_130_1
jump_6bbe:
    movs r0, #2
    pop {r4, pc}
jump_6bc2:
    movs r0, #0
    strb r0, [r1, #5]
    movs r0, #3
    pop {r4, pc}
jump_6bca:
    ldrb.w r0, [r4, #0x32]
    cmp r0, #6
    beq jump_6bd6
jump_6bd2:
    movs r0, #0
    pop {r4, pc}
jump_6bd6:
    movs r0, #2
    strb r0, [r1, #5]
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_6be0:
.word 0x200006f4
data_6be4:
.word 0x20000034

call_6be8:
    ldr r1, [pc, #8] /* data_6bf4 */ 
    ldr r2, [r1]
    str r2, [r0]
    ldr r1, [r1, #4]
    str r1, [r0, #4]
    bx lr

data_6bf4:
.word 0x400aa000

jump_6bf8:
    ldr r0, [pc, #8] /* data_6c04 */ 
    ldr r1, [r0]
    orr r1, r1, #0x20
    str r1, [r0]
    bx lr

data_6c04:
.word 0x400a8000

call_6c08:
    ldr r1, [pc, #0xc] /* data_6c18 */ 
    ldr r2, [r1]
    orr r2, r2, #0x100
    str r2, [r1]
    str r0, [r1, #0x10]
    bx lr

.byte 0x0
.byte 0x0

data_6c18:
.word 0x400a8000

.thumb_func
usb_intr:
    ldr r0, [pc, #4] /* data_6c24 */ 
    b.w jump_6660

.byte 0x0
.byte 0x0

data_6c24:
.word 0x200006f4

.thumb_func
watchdog_init:
    ldr r1, [pc, #0x1c] /* data_6c48 */ 
    movs r0, #0x10
    str.w r0, [r1, #0x10c]
    ldr r0, [pc, #0x18] /* data_6c4c */ 
    movw r1, #0x5fff
    str r1, [r0, #8]
    ldr r1, [pc, #0x14] /* data_6c50 */ 
    str r1, [r0, #4]
    movw r1, #0xca35
    str r1, [r0, #0x10]
    ldr r1, [pc, #0x10] /* data_6c54 */ 
    str r1, [r0]
    bx lr

data_6c48:
.word 0x40088000
data_6c4c:
.word 0x40068000
data_6c50:
.word 0x1a7d0
data_6c54:
.word 0x5fa00001

watchdog_reload_timer:
    ldr r1, [pc, #8] /* data_6c64 */ 
    ldr r0, [pc, #4] /* data_6c60 */ 
    str r0, [r1]
    bx lr

data_6c60:
.word 0x5fa00001
data_6c64:
.word 0x40068000

jump_6c68:
    push {r4, lr}
    bl call_3bec
    ldr r1, [pc, #0x10] /* data_6c80 */ 
    movs r0, #0
    str r0, [r1, #4]
    ldr r1, [pc, #0xc] /* data_6c84 */ 
    strb r0, [r1, #6]
    movs r0, #1
    strb r0, [r1]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_6c80:
.word 0x20000004
data_6c84:
.word 0x20000648

jump_6c88:
    push {r4, r5, r6, lr}
    mov r6, r0
    mov r5, r2
    mov r4, r1
    mov r0, r1
    bl function_e_40
    mov r2, r5
    mov r1, r4
    mov r0, r6
    pop.w {r4, r5, r6, lr}
    b.w function_27
call_6ca4:
    push {r4, r5, lr}
    ldr r1, [pc, #0x24] /* data_6ccc */ 
    movs r0, #0xa
    ldr r2, [pc, #0x1c] /* data_6cc8 */ 
    ldr r3, [pc, #0x20] /* data_6cd0 */ 
    ldrb.w r1, [r1, #0x25]
    b jump_6cbe
jump_6cb4:
    ldrb r4, [r2, r0]
    muls r4, r1, r4
    lsrs r4, r4, #3
    adds r5, r3, r0
    strb r4, [r5, #4]
jump_6cbe:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_6cb4
    pop {r4, r5, pc}

.byte 0x0
.byte 0x0

data_6cc8:
.word 0x7bbb
data_6ccc:
.word 0x20000730
data_6cd0:
.word 0x2000008c

call_6cd4:
    push {r4, r5, r6, r7, lr}
    ldr r6, [pc, #0x194] /* data_6e6c */ 
    ldr r4, [pc, #0x194] /* data_6e70 */ 
    sub sp, #0x2c
    ldrb r0, [r6, #3]
    cmp r0, #5
    bhi jump_6d7e
    cmp r0, #6
    bhs jump_6d1a
    tbb [pc, r0]

.byte 0x3
.byte 0x3
.byte 0x1d
.byte 0x56
.byte 0x43
.byte 0x43

switch_6cf0:
    movs r5, #3
    ldr r7, [pc, #0x180] /* data_6e74 */ 
    b jump_6d14
jump_6cf6:
    ldrb r0, [r6, #3]
    cbz r0, jump_6d1e
    adds r0, r4, r5
    ldrb r0, [r0, #4]
jump_6cfe:
    ldr r1, [r4]
    ldrb r1, [r1, #3]
    muls r0, r1, r0
    lsrs r2, r0, #3
    add.w r0, r5, r5, lsl #3
    add.w r0, r7, r0, lsl #3
    movs r1, #0x48
    bl mem_set
jump_6d14:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_6cf6
jump_6d1a:
    add sp, #0x2c
    pop {r4, r5, r6, r7, pc}
jump_6d1e:
    ldr r0, [r4]
    ldrb r0, [r0, r5]
    b jump_6cfe
switch_6d24:
    ldrb r7, [r4, #4]
    movs r5, #0xe
    mov r6, sp
    b jump_6d48
jump_6d2c:
    ldr r0, [r4]
    ldrb r0, [r0, #3]
    lsls r1, r0, #5
    sub.w r0, r1, r0, lsl #1
    uxtb r1, r0
    add.w r0, r5, r5, lsl #1
    adds r2, r0, r6
    mov r0, r7
    bl call_3fe8
    adds r7, #0x20
    uxtb r7, r7
jump_6d48:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_6d2c
    ldr r5, [pc, #0x128] /* data_6e78 */ 
    movs r4, #0x48
    b jump_6d68
jump_6d54:
    ldrb r0, [r5]
    cmp r0, #0xe
    bhs jump_6d66
    add.w r0, r0, r0, lsl #1
    adds r1, r0, r6
    mov r0, r4
    bl call_408c
jump_6d66:
    .short 0x1e6d /* subs r5, r5, #1 */ 
jump_6d68:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_6d54
    b jump_6d1a
switch_6d70:
    add sp, #0x2c
    .short 0x1f00 /* subs r0, r0, #4 */ 
    pop.w {r4, r5, r6, r7, lr}
    uxtb r0, r0
    b.w jump_3a18
jump_6d7e:
    cmp r0, #7
    bls jump_6d1a
    bic r0, r0, #1
    cmp r0, #8
    beq switch_6d96
    cmp r0, #0xa
    beq jump_6da2
    cmp r0, #0xc
    bne jump_6d1a
    movs r5, #0x48
    b jump_6e62
switch_6d96:
    add sp, #0x2c
    adds r0, r4, #4
    pop.w {r4, r5, r6, r7, lr}
    b.w jump_4064
jump_6da2:
    movs r0, #0
    movs r5, #0xe
    str r0, [sp, #4]
    b jump_6e00
jump_6daa:
    add.w r0, r5, r5, lsl #1
    add.w r1, r4, r0, lsl #1
    ldrb r0, [r1, #4]!
    cbnz r0, jump_6dc0
    ldrb r0, [r1, #1]
    cbnz r0, jump_6dc0
    ldrb r0, [r1, #2]
    cbz r0, jump_6dec
jump_6dc0:
    ldrb r0, [r1, #3]
    cbnz r0, jump_6dcc
    ldrb r0, [r1, #4]
    cbnz r0, jump_6dcc
    ldrb r0, [r1, #5]
    cbz r0, jump_6de8
jump_6dcc:
    movs r2, #3
    mov r6, sp
    b jump_6de0
jump_6dd2:
    adds r3, r1, r2
    ldrb r0, [r1, r2]
    ldrb r3, [r3, #3]
    cmp r0, r3
    bhi jump_6dde
    mov r0, r3
jump_6dde:
    strb r0, [r6, r2]
jump_6de0:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_6dd2
    mov r1, r6
jump_6de8:
    mov r0, r5
    b jump_6dfc
jump_6dec:
    ldrb r0, [r1, #3]
    cbnz r0, jump_6df8
    ldrb r0, [r1, #4]
    cbnz r0, jump_6df8
    ldrb r0, [r1, #5]
    cbz r0, jump_6e08
jump_6df8:
    mov r0, r5
    .short 0x1cc9 /* adds r1, r1, #3 */ 
jump_6dfc:
    bl call_6e7c
jump_6e00:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_6daa
    b jump_6d1a
jump_6e08:
    add r1, sp, #4
    b jump_6de8
jump_6e0c:
    ldr r0, [pc, #0x68] /* data_6e78 */ 
    .short 0x1c40 /* adds r0, r0, #1 */ 
    ldrb r1, [r0, r5]
    and r0, r1, #7
    add.w r0, r0, r0, lsl #2
    add r0, r4
    ldrsb.w r2, [r0, #0x12]
    adds r0, #0xe
    cbz r2, jump_6e5a
    ldrb r3, [r0, #3]
    rsbs r1, r3, r1, lsr #3
    bpl jump_6e2e
    rsbs r1, r1, #0
jump_6e2e:
    subs r1, r1, r2
    adds r1, #0xa
    uxtb r2, r1
    cmp r2, #0xa
    bhs jump_6e5a
    movs r1, #3
    mov r3, sp
    adds r6, r4, r2
    b jump_6e4a
jump_6e40:
    ldrb r2, [r0, r1]
    ldrb r7, [r6, #4]
    muls r2, r7, r2
    lsrs r2, r2, #8
    strb r2, [r3, r1]
jump_6e4a:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_6e40
    mov r1, r3
    mov r0, r5
    bl call_408c
    b jump_6e62
jump_6e5a:
    movs r1, #0
    mov r0, r5
    bl call_40d0
jump_6e62:
    .short 0x1e6d /* subs r5, r5, #1 */ 
    uxtb r5, r5
    bhs jump_6e0c
    b jump_6d1a

.byte 0x0
.byte 0x0

data_6e6c:
.word 0x20000730
data_6e70:
.word 0x2000008c
data_6e74:
.word 0x2000032e
data_6e78:
.word 0x7b72

call_6e7c:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r6, r0
    movs r4, #0x48
    ldr r5, [pc, #0x1c] /* data_6ea4 */ 
    b jump_6e9a
jump_6e8a:
    ldrb r0, [r5]
    cmp r0, r6
    bne jump_6e98
    mov r1, r7
    mov r0, r4
    bl call_408c
jump_6e98:
    .short 0x1e6d /* subs r5, r5, #1 */ 
jump_6e9a:
    .short 0x1e64 /* subs r4, r4, #1 */ 
    uxtb r4, r4
    bhs jump_6e8a
    pop.w {r4, r5, r6, r7, r8, pc}

data_6ea4:
.word 0x7b72

call_6ea8:
    push {r3, r4, r5, lr}
    mov r4, r0
    ldr r0, [pc, #0x24] /* data_6ed4 */ 
    ldr r0, [r0]
    ldrb r5, [r0, #3]
    cbnz r1, jump_6ebc
    mov r0, sp
    bl call_3fc6
    mov r1, sp
jump_6ebc:
    movs r2, #3
    b jump_6ecc
jump_6ec0:
    ldrb r0, [r1], #1
    muls r0, r5, r0
    lsrs r0, r0, #3
    strb r0, [r4], #1
jump_6ecc:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    uxtb r2, r2
    bhs jump_6ec0
    pop {r3, r4, r5, pc}

data_6ed4:
.word 0x2000008c

call_6ed8:
    mov.w r1, #0x8000
    cmp r0, r1
    blo jump_6ee4
    and.w r0, r1, r0, lsr #10
jump_6ee4:
    uxth r0, r0
    bx lr
call_6ee8:
    ldr r2, [pc, #0x14] /* data_6f00 */ 
    push {lr}
    ldr r0, [r2]
    cbz r0, jump_6efa
    bl call_6ed8
    movs r1, #0x1e
    str r1, [r2]
    pop {pc}
jump_6efa:
    movs r0, #0x1e
    pop {pc}

.byte 0x0
.byte 0x0

data_6f00:
.word 0x200019d0

call_6f04:
    lsls r1, r0, #0x10
    bpl jump_6f0a
    lsls r0, r0, #0xa
jump_6f0a:
    bx lr
call_6f0c:
    ldr r0, [pc, #0x3c] /* data_6f4c */ 
    push {r4, lr}
    ldrb r0, [r0]
    and r0, r0, #3
    add.w r0, r0, r0, lsl #1
    lsls r4, r0, #3
    ldr r0, [pc, #0x30] /* data_6f50 */ 
    ldr r0, [r0]
    bl call_4a1e
    mov r3, r0
    movs r0, #0x18
    ldr r1, [pc, #0x28] /* data_6f54 */ 
    b jump_6f42
jump_6f2c:
    add.w r2, r1, r4, lsl #1
    ldrh r2, [r2, #0x28]
    ubfx r2, r2, #0, #0xa
    cmp r2, r3
    bne jump_6f3e
    mov r0, r4
    pop {r4, pc}
jump_6f3e:
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
jump_6f42:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_6f2c
    movs r0, #0x60
    pop {r4, pc}

data_6f4c:
.word 0x20000001
data_6f50:
.word 0x20000030
data_6f54:
.word 0x20000730

call_6f58:
    ldr r0, [pc, #0xc] /* data_6f68 */ 
    movs r1, #0
    str r1, [r0, #0xa]!
    str r1, [r0, #4]
    strh r1, [r0, #8]
    bx lr

.byte 0x0
.byte 0x0

data_6f68:
.word 0x200001ac

call_6f6c:
    push {r4, r5, r6, lr}
    ldr r4, [pc, #0x68] /* data_6fd8 */ 
    ldr r1, [pc, #0x68] /* data_6fdc */ 
    movs r0, #0x60
    strb r0, [r4, #2]
    ldrb r0, [r1, #1]
    lsls r0, r0, #0x1f
    beq jump_6f8a
    ldrb r0, [r1, #2]
    movs r1, #0
    bl call_46f4
    cmp r0, #0
    beq jump_6fd6
    b jump_6f9e
jump_6f8a:
    movs r0, #2
    ldr r2, [pc, #0x50] /* data_6fe0 */ 
    ldrb r1, [r1]
    b jump_6f98
jump_6f92:
    ldrb r3, [r2, r0]
    cmp r1, r3
    beq jump_6fd6
jump_6f98:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_6f92
jump_6f9e:
    bl call_5b48
    cmp r0, #0
    bne jump_6fd6
    ldr r0, [pc, #0x3c] /* data_6fe4 */ 
    ldr r2, [pc, #0x3c] /* data_6fe8 */ 
    ldr r3, [pc, #0x40] /* data_6fec */ 
    ldrb r0, [r0]
    and r0, r0, #3
    add.w r0, r0, r0, lsl #1
    lsls r0, r0, #3
    strb r0, [r4, #2]
    movs r0, #0x18
    b jump_6fd0
jump_6fbe:
    ldrb r1, [r4, #2]
    add.w r5, r2, r1, lsl #1
    ldrh r5, [r5, #0x28]
    cmp.w r3, r5, lsl #22
    beq jump_6fd6
    .short 0x1c49 /* adds r1, r1, #1 */ 
    strb r1, [r4, #2]
jump_6fd0:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_6fbe
jump_6fd6:
    pop {r4, r5, r6, pc}

data_6fd8:
.word 0x200019cc
data_6fdc:
.word 0x20000030
data_6fe0:
.word 0x7aa0
data_6fe4:
.word 0x20000001
data_6fe8:
.word 0x20000730
data_6fec:
.word 0xffc00000

jump_6ff0:
    push {r3, r4, r5, lr}
    ldr r1, [pc, #0xa0] /* data_7094 */ 
    ldr r2, [pc, #0xa0] /* data_7098 */ 
    ldrh r0, [r1]
    ldr r2, [r2]
    add.w r4, r2, r0, lsl #2
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strh r0, [r1]
    ldrb r0, [r4, #1]
    movs r1, #4
    cmp.w r1, r0, lsr #5
    beq jump_7088
    movs r0, #0
    str r0, [sp]
    ldrh r0, [r4]
    mov r1, sp
    bl call_4a14
    ldrb r0, [r4, #1]
    lsrs r0, r0, #5
    cmp r0, #1
    beq jump_7026
    cmp r0, #2
    bne jump_703c
    b jump_7030
jump_7026:
    ldrb.w r0, [sp, #3]
    orr r0, r0, #2
    b jump_7038
jump_7030:
    ldrb.w r0, [sp, #3]
    bic r0, r0, #2
jump_7038:
    strb.w r0, [sp, #3]
jump_703c:
    ldrb.w r0, [sp, #1]
    lsls r0, r0, #0x1f
    ldrb.w r0, [sp]
    beq jump_704e
    bl call_46d4
    b jump_7052
jump_704e:
    ldr r1, [pc, #0x4c] /* data_709c */ 
    ldrb r0, [r1, r0]
jump_7052:
    strb.w r0, [sp, #2]
    ldrb.w r0, [sp, #3]
    orr r0, r0, #5
    strb.w r0, [sp, #3]
    ldrb.w r1, [sp, #1]
    ldrb.w r2, [sp, #2]
    and r1, r1, #1
    add.w r1, r1, r1, lsl #2
    add.w r1, r2, r1, lsl #1
    ubfx r2, r0, #1, #1
    uxtb r1, r1
    ldr r0, [pc, #0x20] /* data_70a0 */ 
    bl call_3fa8
    ldr r0, [sp]
    bl call_4780
jump_7088:
    ldrh r0, [r4, #2]
    bl call_6f04
    ldr r1, [pc, #0x14] /* data_70a4 */ 
    str r0, [r1]
    pop {r3, r4, r5, pc}

data_7094:
.word 0x200019cc
data_7098:
.word 0x20000058
data_709c:
.word 0x200001c0
data_70a0:
.word 0x200001b6
data_70a4:
.word 0x20000060

jump_70a8:
    push {r4, r5, r6, lr}
    ldr r5, [pc, #0x60] /* data_710c */ 
    ldrh r0, [r5]
    cmp r0, #0xff
    bls jump_70ba
    movs r0, #1
    adds r1, r5, #4
    strb r0, [r1, #7]
    b jump_70c8
jump_70ba:
    ldr r6, [pc, #0x54] /* data_7110 */ 
    ldrb r1, [r6, #1]
    lsls r1, r1, #0x1f
    beq jump_70cc
    ldrb r1, [r6]
    cmp r1, #0xc0
    bhs jump_70cc
jump_70c8:
    movs r0, #1
    pop {r4, r5, r6, pc}
jump_70cc:
    ldr r1, [pc, #0x44] /* data_7114 */ 
    ldr r1, [r1]
    add.w r4, r1, r0, lsl #2
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strh r0, [r5]
    ldr r0, [r6]
    bl call_4a1e
    strh r0, [r4]
    ldrb r1, [r6, #3]
    lsls r1, r1, #0x1e
    bpl jump_70ec
    add.w r0, r0, #0x3c00
    b jump_70f0
jump_70ec:
    add.w r0, r0, #0x5c00
jump_70f0:
    strh r0, [r4]
    ldrh r0, [r5]
    cmp r0, #1
    bls jump_7100
    bl call_6ee8
    strh r0, [r4, #-0x2]
jump_7100:
    ldr r1, [pc, #0x14] /* data_7118 */ 
    mov.w r0, #-1
    str r0, [r1]
    movs r0, #0
    pop {r4, r5, r6, pc}

data_710c:
.word 0x200019cc
data_7110:
.word 0x20000030
data_7114:
.word 0x20000058
data_7118:
.word 0x20000060

jump_711c:
    push {r4, lr}
    ldr r4, [pc, #0x18] /* data_7138 */ 
    movs r1, #0
    ldrb r0, [r4, #2]
    bl call_3d90
    movs r0, #0
    adds r1, r4, #4
    strh r0, [r4]
    str r0, [r1]
    movs r0, #4
    strb r0, [r1, #7]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_7138:
.word 0x200019cc

call_713c:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r4, [pc, #0xa0] /* data_71e4 */ 
    ldr r5, [pc, #0xa4] /* data_71e8 */ 
    ldr.w r8, [pc, #0xa4] /* data_71ec */ 
    ldr r7, [pc, #0xa4] /* data_71f0 */ 
    movs r6, #0xa
jump_714c:
    ldrd r0, r1, [r5]
    str r1, [r0, #0x28]
    .short 0x1e76 /* subs r6, r6, #1 */ 
    uxtb r6, r6
    .short 0x1ee4 /* subs r4, r4, #3 */ 
    nop 
    nop 
    movs r0, #0xff
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x16
    bmi jump_7166
    movs r0, #0xfe
jump_7166:
    ldr.w r2, [r8, #0x1c]
    mov r1, r8
    lsls r2, r2, #0x1a
    bmi jump_7174
    bic r0, r0, #2
jump_7174:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x19
    bmi jump_717e
    bic r0, r0, #4
jump_717e:
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x18
    bmi jump_7188
    bic r0, r0, #8
jump_7188:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x14
    bmi jump_7192
    bic r0, r0, #0x10
jump_7192:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x12
    bmi jump_719c
    bic r0, r0, #0x20
jump_719c:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x11
    bmi jump_71a6
    bic r0, r0, #0x40
jump_71a6:
    ldr r1, [r7, #0x1c]
    lsls r1, r1, #0x10
    bmi jump_71b0
    bic r0, r0, #0x80
jump_71b0:
    ldrd r1, r2, [r5]
    str r2, [r1, #0x24]
    ldrb r1, [r4, #1]
    cmp r1, r0
    beq jump_71c2
    strb r0, [r4, #1]
    movs r0, #3
    b jump_71ce
jump_71c2:
    ldrb r0, [r4]
    cbz r0, jump_71d0
    cmp r0, #1
    bne jump_71cc
    strb r1, [r4, #2]
jump_71cc:
    .short 0x1e40 /* subs r0, r0, #1 */ 
jump_71ce:
    strb r0, [r4]
jump_71d0:
    cmp r6, #0
    beq jump_71de
    movs r0, #5
    bl spin_wait_maybe
    subs r5, #8
    b jump_714c
jump_71de:
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_71e4:
.word 0x2000032e
data_71e8:
.word 0x7cb0
data_71ec:
.word 0x400b0000
data_71f0:
.word 0x400b4000

jump_71f4:
    push {r1, r2, r3, r4, r5, r6, r7, lr}
    ldr r0, [pc, #0x44] /* data_723c */ 
    ldr r0, [r0]
    ldr r1, [pc, #0x44] /* data_7240 */ 
    ldr r6, [pc, #0x44] /* data_7244 */ 
    udiv r4, r0, r1
    .short 0x1e64 /* subs r4, r4, #1 */ 
    strh.w r4, [sp]
    movs r5, #0
    strh.w r5, [sp, #2]
    mov r1, sp
    mov r0, r6
    bl call_461a
    strb.w r5, [sp]
    movs r0, #7
    strh.w r0, [sp, #2]
    movs r0, #1
    strb.w r0, [sp, #4]
    strb.w r5, [sp, #5]
    lsrs r0, r4, #1
    strh.w r0, [sp, #6]
    mov r1, sp
    mov r0, r6
    bl call_45c2
    pop {r1, r2, r3, r4, r5, r6, r7, pc}

.byte 0x0
.byte 0x0

data_723c:
.word 0x20000010
data_7240:
.word 0xdbba00
data_7244:
.word 0x4006f000

call_7248:
    push {r4, lr}
    ldr r1, [pc, #0x28] /* data_7274 */ 
    mov.w r4, #0x8000
    str r4, [r1, #0x28]
    nop 
    nop 
    str r4, [r1, #0x24]
    mov.w r2, #0x4000
    b jump_7268
jump_725e:
    str r2, [r1, #0x28]
    nop 
    nop 
    str r2, [r1, #0x24]
    nop 
jump_7268:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    uxtb r0, r0
    bhs jump_725e
    str r4, [r1, #0x28]
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_7274:
.word 0x400b0000

call_7278:
    push {r4, r5, r6, r7, lr}
    movs r2, #4
    ldr r3, [pc, #0x24] /* data_72a4 */ 
    lsls r4, r2, #0xc
    ldr r5, [pc, #0x24] /* data_72a8 */ 
    movw r6, #0xffff
    b jump_729c
jump_7288:
    nop 
    str r4, [r5, #0x28]
    lsls r7, r0, #0x10
    bpl jump_7294
    str r2, [r3, #0x24]
    b jump_7296
jump_7294:
    str r2, [r3, #0x28]
jump_7296:
    str r4, [r5, #0x24]
    and.w r0, r6, r0, lsl #1
jump_729c:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    uxtb r1, r1
    bhs jump_7288
    pop {r4, r5, r6, r7, pc}

data_72a4:
.word 0x400b4000
data_72a8:
.word 0x400b0000

.byte 0x1
.byte 0x21
.byte 0x81
.byte 0x40
.byte 0x2
.byte 0x48
.byte 0x82
.byte 0x79
.byte 0x11
.byte 0x43
.byte 0x81
.byte 0x71
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0
.byte 0x34
.byte 0x0
.byte 0x0
.byte 0x20

function_130_1:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r0, [pc, #0xdc] /* data_73a4 */ 
    ldrb r1, [r0]
    movs r4, #0
    sub.w r5, r0, #0xa
    cmp r1, #1
    bne jump_72de
    strb r4, [r0]
    ldrb r0, [r5, #0x10]
    and r0, r0, #7
    bl call_5c00
jump_72de:
    ldr r6, [pc, #0xc8] /* data_73a8 */ 
    ldr r7, [pc, #0xc8] /* data_73ac */ 
    ldrb r0, [r6]
    cbz r0, jump_72f2
    cmp r0, #2
    beq jump_731c
    cmp r0, #4
    beq jump_72f2
    cmp r0, #5
    bne jump_732e
jump_72f2:
    ldrb r0, [r5, #6]
    lsls r0, r0, #0x1b
    bpl jump_732e
    movs r0, #1
    strb r0, [r6]
    movs r2, #0x40
    ldr r1, [pc, #0xb0] /* data_73b0 */ 
    movs r0, #4
    bl usb_recv
    ldr r2, [pc, #0xa8] /* data_73b0 */ 
    rsb.w r1, r0, #0x40
    add r0, r2
    bl mem_zero
    ldrb r0, [r5, #6]
    bic r0, r0, #0x10
    strb r0, [r5, #6]
    b jump_732e
jump_731c:
    ldr r0, [r7, #0x50]
    lsls r0, r0, #0x1e
    bpl jump_732e
    movs r2, #0x40
    ldr r1, [pc, #0x88] /* data_73b0 */ 
    movs r0, #3
    bl usb_copy_send
    strb r4, [r6]
jump_732e:
    ldr r0, [r7, #0x28]
    lsls r0, r0, #0x1e
    bpl jump_7364
    ldrb r0, [r5]
    cbz r0, jump_733c
    strb r4, [r5]
    b jump_7358
jump_733c:
    ldr r1, [pc, #0x74] /* data_73b4 */ 
    ldr r0, [r1]
    cbnz r0, jump_7364
    add.w r0, r1, #0xc
    ldr r0, [r0]
    cbz r0, jump_7364
    mov.w r2, #0xfa0
    muls r0, r2, r0
    asrs r2, r2, #3
    udiv r0, r0, r2
    str r0, [r1]
jump_7358:
    ldr r1, [pc, #0x48] /* data_73a4 */ 
    movs r2, #8
    adds r1, #0x12
    movs r0, #1
    bl usb_copy_send
jump_7364:
    ldr r0, [r7, #0x3c]
    lsls r0, r0, #0x1e
    bpl jump_739e
    ldrb r0, [r5, #2]
    cbz r0, jump_7378
    ldr r1, [pc, #0x34] /* data_73a4 */ 
    movs r2, #5
    strb r4, [r5, #2]
    adds r1, #0xa
    b jump_7394
jump_7378:
    ldrb r0, [r5, #1]
    cbz r0, jump_7386
    ldr r1, [pc, #0x24] /* data_73a4 */ 
    movs r2, #2
    strb r4, [r5, #1]
    .short 0x1e89 /* subs r1, r1, #2 */ 
    b jump_7394
jump_7386:
    ldrb r0, [r5, #3]
    cmp r0, #0
    beq jump_739e
    ldr r1, [pc, #0x24] /* data_73b4 */ 
    movs r2, #0x1f
    strb r4, [r5, #3]
    adds r1, #0x18
jump_7394:
    pop.w {r4, r5, r6, r7, r8, lr}
    movs r0, #2
    b.w usb_copy_send
jump_739e:
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_73a4:
.word 0x2000003e
data_73a8:
.word 0x20000028
data_73ac:
.word 0x400a8000
data_73b0:
.word 0x20000608
data_73b4:
.word 0x200006bc

.byte 0xf0
.byte 0xb5
.byte 0x1
.byte 0x88
.byte 0x4f
.byte 0xf4
.byte 0x80
.byte 0x76
.byte 0x40
.byte 0xf6
.byte 0x21
.byte 0x15
.byte 0x77
.byte 0x0
.byte 0x1
.byte 0x23
.byte 0x35
.byte 0x4c
.byte 0xa1
.byte 0xf6
.byte 0x21
.byte 0x12
.byte 0xa9
.byte 0x42
.byte 0x3c
.byte 0xd0
.byte 0xd
.byte 0xdc
.byte 0x12
.byte 0xf5
.byte 0xf0
.byte 0x61
.byte 0x13
.byte 0xd0
.byte 0xb1
.byte 0x42
.byte 0x30
.byte 0xd0
.byte 0xb9
.byte 0x42
.byte 0x45
.byte 0xd1
.byte 0x81
.byte 0x88
.byte 0x0
.byte 0x29
.byte 0x42
.byte 0xd1
.byte 0x2e
.byte 0x49
.byte 0xc0
.byte 0xe9
.byte 0x7
.byte 0x13
.byte 0x53
.byte 0xe0
.byte 0x0
.byte 0x25
.byte 0xb2
.byte 0x42
.byte 0x3d
.byte 0xd0
.byte 0xba
.byte 0x42
.byte 0x39
.byte 0xd1
.byte 0x82
.byte 0x88
.byte 0x81
.byte 0x78
.byte 0xba
.byte 0xb3
.byte 0x49
.byte 0xe0
.byte 0xc5
.byte 0x78
.byte 0x82
.byte 0x78
.byte 0xc4
.byte 0x88
.byte 0x81
.byte 0x88
.byte 0x1
.byte 0x2d
.byte 0x2f
.byte 0xd1
.byte 0x61
.byte 0xb1
.byte 0x1
.byte 0x29
.byte 0x2c
.byte 0xd0
.byte 0x2
.byte 0x29
.byte 0x2a
.byte 0xd1
.byte 0x1
.byte 0x2a
.byte 0x9
.byte 0xd0
.byte 0x2
.byte 0x2a
.byte 0xc
.byte 0xd0
.byte 0x4
.byte 0x2a
.byte 0x24
.byte 0xd1
.byte 0x1e
.byte 0x49
.byte 0xc
.byte 0x31
.byte 0x4
.byte 0xe0
.byte 0x1e
.byte 0x49
.byte 0x18
.byte 0x31
.byte 0x1
.byte 0xe0
.byte 0x1c
.byte 0x49
.byte 0x9
.byte 0x1d
.byte 0xc0
.byte 0xe9
.byte 0x7
.byte 0x14
.byte 0x2e
.byte 0xe0
.byte 0x1a
.byte 0x49
.byte 0x10
.byte 0x31
.byte 0xf9
.byte 0xe7
.byte 0x81
.byte 0x88
.byte 0x0
.byte 0x29
.byte 0x13
.byte 0xd1
.byte 0xc0
.byte 0xe9
.byte 0x7
.byte 0x43
.byte 0x25
.byte 0xe0
.byte 0xc3
.byte 0x78
.byte 0xc2
.byte 0x88
.byte 0x81
.byte 0x88
.byte 0x2
.byte 0x62
.byte 0x2
.byte 0x2b
.byte 0xa
.byte 0xd1
.byte 0x0
.byte 0x29
.byte 0x8
.byte 0xd1
.byte 0x11
.byte 0x4a
.byte 0xc
.byte 0x32
.byte 0xc2
.byte 0x61
.byte 0x11
.byte 0x4a
.byte 0xc0
.byte 0xe9
.byte 0xa
.byte 0x21
.byte 0x2
.byte 0x21
.byte 0x80
.byte 0xf8
.byte 0x24
.byte 0x10
.byte 0xf0
.byte 0xbd
.byte 0xe
.byte 0xe0
.byte 0x82
.byte 0x88
.byte 0xc1
.byte 0x78
.byte 0x0
.byte 0x2a
.byte 0xf9
.byte 0xd1
.byte 0x4f
.byte 0xf4
.byte 0x7a
.byte 0x62
.byte 0x21
.byte 0x60
.byte 0x51
.byte 0x43
.byte 0xd2
.byte 0x10
.byte 0xb1
.byte 0xfb
.byte 0xf2
.byte 0xf1
.byte 0x5
.byte 0x4a
.byte 0xc
.byte 0x3a
.byte 0x11
.byte 0x60
.byte 0x2
.byte 0xe0
.byte 0x4
.byte 0x4a
.byte 0x12
.byte 0x1f
.byte 0x11
.byte 0x71
.byte 0x5
.byte 0x62
.byte 0x80
.byte 0xf8
.byte 0x24
.byte 0x30
.byte 0xe7
.byte 0xe7
.byte 0x0
.byte 0x0
.byte 0xc8
.byte 0x6
.byte 0x0
.byte 0x20
.byte 0x38
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xad
.byte 0x74
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x4a
.byte 0x1
.byte 0x21
.byte 0x11
.byte 0x54
.byte 0x70
.byte 0x47
.byte 0x3e
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xc2
.byte 0x78
.byte 0x81
.byte 0x88
.byte 0x1
.byte 0x23
.byte 0x21
.byte 0x2a
.byte 0x7
.byte 0xd0
.byte 0x22
.byte 0x2a
.byte 0x21
.byte 0xd1
.byte 0xa9
.byte 0xb1
.byte 0x1
.byte 0x29
.byte 0x17
.byte 0xd0
.byte 0x2
.byte 0x29
.byte 0x1a
.byte 0xd1
.byte 0x1c
.byte 0xe0
.byte 0x21
.byte 0xb1
.byte 0x1
.byte 0x29
.byte 0x5
.byte 0xd0
.byte 0x2
.byte 0x29
.byte 0x6
.byte 0xd1
.byte 0x7
.byte 0xe0
.byte 0xc1
.byte 0x68
.byte 0x9
.byte 0x31
.byte 0x1
.byte 0xe0
.byte 0xc1
.byte 0x68
.byte 0x22
.byte 0x31
.byte 0xc1
.byte 0x61
.byte 0x9
.byte 0x21
.byte 0xa
.byte 0xe0
.byte 0xc1
.byte 0x68
.byte 0x42
.byte 0x31
.byte 0xf9
.byte 0xe7
.byte 0x8
.byte 0x49
.byte 0xc1
.byte 0x61
.byte 0x40
.byte 0x21
.byte 0x3
.byte 0xe0
.byte 0x6
.byte 0x49
.byte 0xac
.byte 0x39
.byte 0xc1
.byte 0x61
.byte 0x22
.byte 0x21
.byte 0x1
.byte 0x62
.byte 0x80
.byte 0xf8
.byte 0x24
.byte 0x30
.byte 0x70
.byte 0x47
.byte 0x2
.byte 0x49
.byte 0x88
.byte 0x39
.byte 0xc1
.byte 0x61
.byte 0x86
.byte 0x21
.byte 0xf6
.byte 0xe7
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x80
.byte 0x0
.byte 0x0

call_751c:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r0, #0
    bl usb_get_ep_len
    mov r5, r0
    ldr r0, [r4, #0x20]
    adds r1, r0, #1
    beq jump_755c
    ldrb.w r1, [r4, #0x24]
    cmp r1, #1
    bne jump_755c
    cmp r0, r5
    blo jump_7540
    subs r0, r0, r5
    str r0, [r4, #0x20]
    b jump_754c
jump_7540:
    mov r5, r0
    movs r0, #0
    str r0, [r4, #0x20]
    movs r0, #2
    strb.w r0, [r4, #0x24]
jump_754c:
    mov r2, r5
    movs r0, #0
    ldr r1, [r4, #0x1c]
    bl usb_copy_send
    ldr r0, [r4, #0x1c]
    add r0, r5
    str r0, [r4, #0x1c]
jump_755c:
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

call_7560:
    push {r4, lr}
    mov r4, r0
    movs r0, #0
    strb.w r0, [r4, #0x24]
    str r0, [r4, #0x20]
    ldrb r0, [r4]
    ands r0, r0, #0x60
    beq jump_757a
    cmp r0, #0x20
    bne jump_758c
    b jump_7582
jump_757a:
    mov r0, r4
    bl call_7600
    b jump_758c
jump_7582:
    ldr r0, [pc, #0x40] /* data_75c4 */ 
    ldr r1, [r0, #0x14]
    cbz r1, jump_758c
    mov r0, r4
    blx r1
jump_758c:
    ldrb.w r0, [r4, #0x24]
    cmp r0, #1
    beq jump_75a2
    cmp r0, #2
    beq jump_75b6
    pop.w {r4, lr}
    movs r0, #0
    b.w function_e_72
jump_75a2:
    ldrh r0, [r4, #6]
    ldr r1, [r4, #0x20]
    cmp r1, r0
    ble jump_75ac
    str r0, [r4, #0x20]
jump_75ac:
    mov r0, r4
    pop.w {r4, lr}
    b.w call_751c
jump_75b6:
    movs r2, #0
    pop.w {r4, lr}
    mov r1, r2
    mov r0, r2
    b.w usb_copy_send

data_75c4:
.word 0x80f8

jump_75c8:
    push {r4, lr}
    mov r4, r0
    movs r0, #0
    strb r0, [r4, #0x19]
    cbz r1, jump_75e6
    cmp r1, #1
    beq jump_75ea
    cmp r1, #2
    bne jump_75fc
    ldrb r0, [r4, #4]
    and r0, r0, #0xf
    bl function_e_67
    b jump_75ea
jump_75e6:
    ldrb.w r0, [r4, #0x34]
jump_75ea:
    strb r0, [r4, #0x18]
    add.w r0, r4, #0x18
    str r0, [r4, #0x1c]
    movs r0, #2
    str r0, [r4, #0x20]
    movs r0, #1
    strb.w r0, [r4, #0x24]
jump_75fc:
    pop {r4, pc}

.byte 0x0
.byte 0x0

call_7600:
    push {r4, r5, r6, lr}
    mov r4, r0
    ldrh r0, [r0]
    movs r5, #1
    cmp.w r0, #0x500
    beq jump_76ae
    bgt jump_7652
    cmp.w r0, #0x100
    beq jump_76a0
    bgt jump_7630
    cmp r0, #0x80
    beq jump_7698
    cmp r0, #0x81
    beq jump_769c
    cmp r0, #0x82
    bne jump_76f2
    movs r1, #2
jump_7626:
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    b.w jump_75c8
jump_7630:
    cmp.w r0, #0x102
    beq jump_76a4
    cmp.w r0, #0x300
    beq jump_76a8
    sub.w r0, r0, #0x300
    subs r0, #2
    bne jump_76f2
    movs r2, #1
jump_7646:
    movs r1, #2
jump_7648:
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    b.w jump_7728
jump_7652:
    ldr r1, [pc, #0xcc] /* data_7720 */ 
    cmp.w r0, #0x900
    beq jump_76f8
    bgt jump_767c
    cmp.w r0, #0x680
    beq jump_76bc
    sub.w r0, r0, #0x600
    subs r0, #0x81
    beq jump_76f4
    sub.w r0, r0, #0x100
    subs r0, #0xff
    bne jump_76f2
    add.w r0, r4, #0x30
    strd r0, r5, [r4, #0x1c]
    b jump_76ee
jump_767c:
    sub.w r0, r0, #0xa00
    subs r0, #0x81
    beq jump_771a
    cmp r0, #0x80
    bne jump_76f2
    ldr r0, [r1, #0xc]
jump_768a:
    cmp r0, #0
    beq jump_76f2
    mov r1, r0
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    bx r1
jump_7698:
    movs r1, #0
    b jump_7626
jump_769c:
    movs r1, #1
    b jump_7626
jump_76a0:
    movs r2, #0
    b jump_76aa
jump_76a4:
    movs r2, #0
    b jump_7646
jump_76a8:
    movs r2, #1
jump_76aa:
    movs r1, #0
    b jump_7648
jump_76ae:
    ldrb r0, [r4, #2]
    bl call_6c08
    strb.w r5, [r4, #0x24]
    movs r0, #5
    b jump_7714
jump_76bc:
    ldrb r0, [r4, #3]
    cmp r0, #1
    beq jump_76e2
    cmp r0, #2
    beq jump_76e6
    cmp r0, #3
    bne jump_76f2
    ldrb r0, [r4, #2]
    ldr r1, [r4, #0x14]
    cmp r1, r0
    bls jump_76f2
    ldr r1, [r4, #0x10]
    ldr.w r0, [r1, r0, lsl #2]
    cmp r0, #0
    beq jump_76f2
jump_76dc:
    str r0, [r4, #0x1c]
    ldrb r0, [r0]
    b jump_76ec
jump_76e2:
    ldr r0, [r4, #8]
    b jump_76dc
jump_76e6:
    ldr r0, [r4, #0xc]
    str r0, [r4, #0x1c]
    ldrh r0, [r0, #2]
jump_76ec:
    str r0, [r4, #0x20]
jump_76ee:
    strb.w r5, [r4, #0x24]
jump_76f2:
    pop {r4, r5, r6, pc}
jump_76f4:
    ldr r0, [r1, #8]
    b jump_768a
jump_76f8:
    ldrb r0, [r4, #2]
    strb.w r0, [r4, #0x30]
    strb.w r5, [r4, #0x24]
    movs r5, #1
jump_7704:
    ldr r1, [pc, #0x1c] /* data_7724 */ 
    sxtb r0, r5
    bl function_e_70
    .short 0x1c6d /* adds r5, r5, #1 */ 
    cmp r5, #8
    blo jump_7704
    movs r0, #6
jump_7714:
    strb.w r0, [r4, #0x32]
    pop {r4, r5, r6, pc}
jump_771a:
    ldr r0, [r1, #0x10]
    b jump_768a

.byte 0x0
.byte 0x0

data_7720:
.word 0x80f8
data_7724:
.word 0x20000168

jump_7728:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r6, #1
    cbz r1, jump_774a
    cmp r1, #2
    bne jump_7748
    ldrb r0, [r4, #4]
    ands r5, r0, #0xf
    beq jump_7744
    cbz r2, jump_7760
    mov r0, r5
    bl function_e_73
jump_7744:
    strb.w r6, [r4, #0x24]
jump_7748:
    pop {r4, r5, r6, pc}
jump_774a:
    ldrb r0, [r4, #2]
    cmp r0, #1
    bne jump_7748
    ldrb r0, [r4, #0x34]!
    bfi r0, r2, #1, #1
    strb r0, [r4], #-0x10
    strb r6, [r4]
    pop {r4, r5, r6, pc}
jump_7760:
    ldr r0, [r4, #0x38]
    cmp r0, #0
    bne jump_7744
    mov r0, r5
    bl usb_ep_stall
    mov r0, r5
    bl usb_ep_data_toggle
    b jump_7744
copy_words:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bmi jump_7782
    ldr.w r3, [r0, r2, lsl #2]
    str.w r3, [r1, r2, lsl #2]
    b copy_words
jump_7782:
    bx lr
usb_get_ep_reg:
    ldr r1, [pc, #8] /* data_7790 */ 
    add.w r0, r0, r0, lsl #2
    add.w r0, r1, r0, lsl #2
    bx lr

data_7790:
.word 0x400a8014

function_130_9:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    movs r7, #0
    mov.w r1, #0x8000
    mov r2, r7
    mov sl, r1
    movs r3, #1
    mov r0, r2
    bl ckcu_clocks_enable
    ldr r0, [pc, #0x90] /* data_783c */ 
    bl call_6654
    ldr r5, [pc, #0x8c] /* data_7840 */ 
    mov r4, r0
    movw r6, #0xeae0
    cmp r0, #1
    bne jump_77ca
    ldr r0, [r5, #0x54]
    orrs r0, r6
    str r0, [r5, #0x54]
    str r6, [r5, #0x58]
    ldr r0, [r5, #0x50]
    orrs r0, r6
    str r0, [r5, #0x50]
jump_77ca:
    ldr.w r8, [pc, #0x70] /* data_783c */ 
    ldrb.w r0, [r8, #0x32]
    cmp r0, #3
    bne jump_7814
    ldr.w sb, [pc, #0x6c] /* data_7844 */ 
    ldr.w r0, [sb]
    tst.w r0, #0xc0
    beq jump_7814
    movs r0, #1
    bl function_130_10
    ldr r1, [pc, #0x5c] /* data_7848 */ 
    strb r7, [r1, #5]
    ldrb.w r0, [r8, #0x32]
    cmp r0, #3
    bne jump_7814
    ldr.w r0, [sb]
    tst.w r0, #0xc0
    beq jump_7814
    bl watchdog_reload_timer
    mov.w r0, #0x3e8
    bl spin_wait_maybe
    str r6, [r5, #0x58]
    movs r0, #0
    bl call_5c44
jump_7814:
    ldr r0, [r5, #0x58]
    tst r0, r6
    beq jump_782c
    cmp r4, #1
    bne jump_782c
    ldr r0, [pc, #0x1c] /* data_783c */ 
    bl call_67e0
    cmp r0, #1
    bne jump_782c
    bl call_67f0
jump_782c:
    mov r2, r7
    mov r1, sl
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    movs r3, #0
    mov r0, r2
    b.w ckcu_clocks_enable

data_783c:
.word 0x200006f4
data_7840:
.word 0x40024000
data_7844:
.word 0x400a8000
data_7848:
.word 0x20000034

sram_init_func_1:
    b jump_7854
jump_784e:
    ldm r0!, {r3}
    .short 0x1f12 /* subs r2, r2, #4 */ 
    stm r1!, {r3}
jump_7854:
    cmp r2, #0
    bne jump_784e
    bx lr

.byte 0x70
.byte 0x47

sram_init_func_2:
    movs r0, #0
    b jump_7864
jump_7860:
    stm r1!, {r0}
    .short 0x1f12 /* subs r2, r2, #4 */ 
jump_7864:
    cmp r2, #0
    bne jump_7860
    bx lr

.byte 0x0
.byte 0x0

.thumb_func
main:
    bl setup_intr_priority
    bl setup_afio_gpio
    bl call_57d8
    movs r0, #0xff
    bl call_3e20
    bl call_5fe0
    bl call_5c0c
    bl call_623c
    bl call_4e30
    movs r0, #0
    bl call_4678
    ldr r1, [pc, #0xbc] /* data_7954 */ 
    movs r0, #0
    str r0, [r1]
    bl call_567c
    bl call_56b0
    movs r0, #0
    bl function_130_10
    movs r0, #0xa
    bl spin_wait_maybe
    movs r0, #1
    bl call_5f5c
    bl call_4e3c
    ldr r4, [pc, #0x9c] /* data_7958 */ 
    cbz r0, jump_78c0
    movs r0, #1
    strh r0, [r4, #4]
jump_78c0:
    ldrh r0, [r4, #4]
    cbz r0, jump_78e8
    bl function_130_16
    bl pinmux_c0_gptm
    movs r0, #0
    bl call_5f5c
jump_78d2:
    ldrh r0, [r4, #4]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strh r0, [r4, #4]
    bl function_130_15
    movs r0, #1
    bl function_130_12
    bl watchdog_reload_timer
    b jump_78d2
jump_78e8:
    movs r0, #1
    bl function_130_10
    bl usb_init
    ldr r6, [pc, #0x68] /* data_795c */ 
    ldr r5, [pc, #0x68] /* data_7960 */ 
jump_78f6:
    bl function_130_2
    cmp r0, #1
    beq jump_790e
    cmp r0, #2
    beq jump_7922
    cmp r0, #3
    bne jump_794c
    movs r0, #1
    bl function_130_10
    b jump_794c
jump_790e:
    movs r0, #0
    bl function_130_10
    bl function_130_16
    bl pinmux_c0_gptm
    movs r0, #0
    bl call_5f5c
jump_7922:
    ldrh r0, [r4, #4]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    lsls r0, r0, #0x10
    lsrs r0, r0, #0x10
    strh r0, [r4, #4]
    bne jump_793a
    ldr r0, [r5]
    cmp r0, r6
    bls jump_793a
    ldr r0, [r5]
    .short 0x1e40 /* subs r0, r0, #1 */ 
    str r0, [r5]
jump_793a:
    bl handle_frame
    bl function_130_15
    ldrb r0, [r4]
    cbnz r0, jump_794c
    movs r0, #1
    bl function_130_12
jump_794c:
    bl watchdog_reload_timer
    b jump_78f6

.byte 0x0
.byte 0x0

data_7954:
.word 0x20000030
data_7958:
.word 0x20000028
data_795c:
.word 0x55aafaf0
data_7960:
.word 0x20003ffc

function_130_15:
    push {r4, r5, r6, lr}
    ldr r6, [pc, #0xc8] /* data_7a30 */ 
    movs r4, #0
    ldrb r0, [r6, #3]
    cbz r0, jump_7988
    movs r0, #1
    bl call_4678
    cbz r0, jump_7988
    ldrb r0, [r6, #3]
    cmp r0, #2
    beq jump_79b0
    bl call_3ea0
jump_7980:
    strb r4, [r6, #3]
    movs r0, #1
    bl call_567c
jump_7988:
    bl call_51c8
    cmp r0, #0
    beq jump_7a2c
    ldr r5, [pc, #0xa0] /* data_7a34 */ 
    ldrb r0, [r5, #2]
    cmp r0, #0x20
    blo jump_79a0
    subs r0, #0x20
    strb r0, [r5, #2]
    movs r0, #1
    strb r0, [r5, #3]
jump_79a0:
    ldrb r0, [r5, #1]
    cmp r0, #0xff
    beq jump_79c6
    bl call_4ab0
    cmp r0, #1
    beq jump_79b6
    b jump_79c6
jump_79b0:
    bl call_3ed0
    b jump_7980
jump_79b6:
    ldrb r0, [r5, #1]
    bl call_3e20
    movs r0, #0xff
    strb r0, [r5, #1]
    movs r0, #2
    bl call_567c
jump_79c6:
    ldrb r0, [r6, #4]
    cbz r0, jump_79da
    bl call_4ab0
    cmp r0, #1
    bne jump_79da
    ldrb r0, [r6, #4]
    bl call_4b1c
    strb r4, [r6, #4]
jump_79da:
    bl call_5ee0
    bl call_57fc
    ldr r0, [pc, #0x54] /* data_7a38 */ 
    ldrb r0, [r0, #6]
    cmp r0, #1
    beq jump_79f2
    bl call_4b34
    bl call_39f4
jump_79f2:
    ldrb r0, [r5, #3]
    cbz r0, jump_79fa
    bl call_4bd4
jump_79fa:
    ldrb r0, [r6]
    cbz r0, jump_7a08
    strb r4, [r6]
    bl call_559c
    bl call_55a8
jump_7a08:
    ldrb r0, [r6, #1]
    cbz r0, jump_7a12
    strb r4, [r6, #1]
    bl call_61d0
jump_7a12:
    ldrb r0, [r5, #3]
    cmp r0, #0
    beq jump_7a2c
    ldr r0, [pc, #0x18] /* data_7a34 */ 
    ldrb r2, [r5, #2]
    .short 0x1d80 /* adds r0, r0, #6 */ 
    ldrb r1, [r0, #1]
    add r1, r2
    strb r1, [r0, #1]
    ldrh r0, [r5, #6]
    lsrs r0, r0, #1
    strh r0, [r5, #6]
    strb r4, [r5, #3]
jump_7a2c:
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_7a30:
.word 0x20000648
data_7a34:
.word 0x20000028
data_7a38:
.word 0x200019d0

data_1:
.byte 0x44
.byte 0x45
.byte 0xe6
.byte 0xe3
.byte 0x2c
.byte 0x8
.byte 0x14
.byte 0x1a
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x2

data_2:
.byte 0x39
.byte 0xe5
.byte 0xe4
.byte 0x65
.byte 0xe7
.byte 0x1f
.byte 0x10
.byte 0x1
.byte 0x3b
.byte 0x11
.byte 0x1
.byte 0x3c
.byte 0x12
.byte 0x1
.byte 0x3d
.byte 0x13
.byte 0x1
.byte 0x47
.byte 0x5f
.byte 0x1
.byte 0x0
.byte 0x35
.byte 0x1
.byte 0x3a
.byte 0x2
.byte 0x3b
.byte 0x3
.byte 0x3c
.byte 0x4
.byte 0x3d
.byte 0x5
.byte 0x3e
.byte 0x6
.byte 0x3f
.byte 0x7
.byte 0x40
.byte 0x23
.byte 0x41
.byte 0x24
.byte 0x42
.byte 0x25
.byte 0x43
.byte 0x26
.byte 0x44
.byte 0x2a
.byte 0x45
.byte 0x2b
.byte 0x52
.byte 0x17
.byte 0x50
.byte 0x33
.byte 0x51
.byte 0x34
.byte 0x4f
.byte 0x2d
.byte 0x46
.byte 0x2e
.byte 0x47
.byte 0x32
.byte 0x48
.byte 0x19
.byte 0x65
.byte 0x16
.byte 0x4a
.byte 0x1e
.byte 0x4d
.byte 0xf
.byte 0x4b
.byte 0x2c
.byte 0x4e
.byte 0x27
.byte 0x4c
.byte 0x36
.byte 0x4c
.byte 0x35
.byte 0x49
.byte 0x12
.byte 0xf5
.byte 0x13
.byte 0xf6
.byte 0x14
.byte 0xf4
.byte 0x9
.byte 0xf2
.byte 0xa
.byte 0xf0
.byte 0xb
.byte 0xf3
.byte 0xe8
.byte 0xcf
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x4
.byte 0x4
.byte 0x5
.byte 0x5
.byte 0x6
.byte 0x6
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x3
.byte 0x5
.byte 0x7
.byte 0x9
.byte 0xb
.byte 0x1
.byte 0x3
.byte 0x5
.byte 0x7
.byte 0x9
.byte 0xb
.byte 0xaa
.byte 0x6e
.byte 0x46
.byte 0x28
.byte 0x14
.byte 0xa
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x6
.byte 0x9
.byte 0x10
.byte 0xb
.byte 0x7
.byte 0x4
.byte 0x2
.byte 0x1
.byte 0x10
.byte 0xb
.byte 0x7
.byte 0x4
.byte 0x2
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x4
.byte 0x5
.byte 0x6
.byte 0x7
.byte 0x1b
.byte 0x1a
.byte 0x19
.byte 0x18
.byte 0x17
.byte 0x16
.byte 0x15
.byte 0x14
.byte 0x1c
.byte 0x1d
.byte 0x1e
.byte 0x1f
.byte 0x20
.byte 0x21
.byte 0x22
.byte 0x23
.byte 0x34
.byte 0x33
.byte 0x32
.byte 0x31
.byte 0x30
.byte 0x2f
.byte 0x2e
.byte 0x2d
.byte 0x35
.byte 0x36
.byte 0x37
.byte 0x8
.byte 0x9
.byte 0xa
.byte 0xb
.byte 0xd
.byte 0xff
.byte 0xff
.byte 0xc
.byte 0x13
.byte 0x12
.byte 0x11
.byte 0x10
.byte 0xe
.byte 0xff
.byte 0xff
.byte 0xf
.byte 0x24
.byte 0x25
.byte 0x26
.byte 0x27
.byte 0x28
.byte 0xff
.byte 0xff
.byte 0x38
.byte 0x2c
.byte 0x2b
.byte 0x2a
.byte 0x29
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x39
.byte 0x3a
.byte 0x3b
.byte 0xff
.byte 0x3c
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x2
.byte 0x2
.byte 0x2
.byte 0x2
.byte 0x8
.byte 0x8
.byte 0x1
.byte 0x1
.byte 0x1
.byte 0x2
.byte 0x2
.byte 0x2
.byte 0x8
.byte 0x8
.byte 0x8
.byte 0x8
.byte 0x1
.byte 0x1
.byte 0x2
.byte 0x3
.byte 0x7
.byte 0x7
.byte 0x7
.byte 0x7
.byte 0x6
.byte 0x6
.byte 0x6
.byte 0x6
.byte 0x7
.byte 0x7
.byte 0x6
.byte 0x2
.byte 0x2
.byte 0x2
.byte 0x3
.byte 0x3
.byte 0xff
.byte 0xff
.byte 0x3
.byte 0x3
.byte 0x3
.byte 0x3
.byte 0x3
.byte 0x4
.byte 0xff
.byte 0xff
.byte 0x4
.byte 0x3
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0x4
.byte 0xff
.byte 0xff
.byte 0x6
.byte 0x5
.byte 0x5
.byte 0x5
.byte 0x5
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x6
.byte 0x6
.byte 0x5
.byte 0xff
.byte 0x5
.byte 0x0
.byte 0x8
.byte 0x10
.byte 0x18
.byte 0x20
.byte 0x28
.byte 0x30
.byte 0x38
.byte 0x1
.byte 0x9
.byte 0x11
.byte 0x19
.byte 0x21
.byte 0x29
.byte 0x31
.byte 0x39
.byte 0x2
.byte 0xa
.byte 0x12
.byte 0x1a
.byte 0x22
.byte 0x2a
.byte 0x32
.byte 0x3a
.byte 0x3
.byte 0x13
.byte 0x1b
.byte 0x23
.byte 0x2b
.byte 0x33
.byte 0x3b
.byte 0x43
.byte 0x4
.byte 0xc
.byte 0x14
.byte 0x40
.byte 0x48
.byte 0x50
.byte 0x58
.byte 0x68
.byte 0xff
.byte 0xff
.byte 0x60
.byte 0x41
.byte 0x49
.byte 0x51
.byte 0x59
.byte 0x69
.byte 0xff
.byte 0xff
.byte 0x61
.byte 0x42
.byte 0x4a
.byte 0x52
.byte 0x5a
.byte 0x6a
.byte 0xff
.byte 0xff
.byte 0x34
.byte 0x4b
.byte 0x53
.byte 0x5b
.byte 0x63
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x54
.byte 0x5c
.byte 0x64
.byte 0xff
.byte 0x6c
.byte 0x0
.byte 0x24
.byte 0x49
.byte 0x6d
.byte 0x92
.byte 0xb6
.byte 0xdb
.byte 0xff
.byte 0xaa
.byte 0x55
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x29
.byte 0x1e
.byte 0x1f
.byte 0x20
.byte 0x21
.byte 0x22
.byte 0x23
.byte 0x24
.byte 0x2b
.byte 0x14
.byte 0x1a
.byte 0x8
.byte 0x15
.byte 0x17
.byte 0x1c
.byte 0x18
.byte 0x39
.byte 0x4
.byte 0x16
.byte 0x7
.byte 0x9
.byte 0xa
.byte 0xb
.byte 0xd
.byte 0xe1
.byte 0x1d
.byte 0x1b
.byte 0x6
.byte 0x19
.byte 0x5
.byte 0x11
.byte 0x10
.byte 0xe0
.byte 0xe3
.byte 0xe2
.byte 0x25
.byte 0x26
.byte 0x27
.byte 0x2d
.byte 0x2a
.byte 0x64
.byte 0x0
.byte 0x2e
.byte 0xc
.byte 0x12
.byte 0x13
.byte 0x2f
.byte 0x31
.byte 0x0
.byte 0x0
.byte 0x30
.byte 0xe
.byte 0xf
.byte 0x33
.byte 0x34
.byte 0x28
.byte 0x0
.byte 0x0
.byte 0x2c
.byte 0x36
.byte 0x37
.byte 0x38
.byte 0xe5
.byte 0x35
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xe6
.byte 0xe7
.byte 0x65
.byte 0x0
.byte 0xe4
.byte 0xc0
.byte 0xc1
.byte 0xc2
.byte 0xc3
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

gpio_map_3:
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x2
.byte 0x9
.byte 0x0
.byte 0x5
.byte 0x0
.byte 0x6
.byte 0x0
.byte 0x7
.byte 0x2
.byte 0xb
.byte 0x2
.byte 0xd
.byte 0x2
.byte 0xe
.byte 0x2
.byte 0xf

gpio_map_2:
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x60
.byte 0xb
.byte 0x40
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x2
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x2d
.byte 0x2f
.byte 0x2e
.byte 0x30
.byte 0x14
.byte 0x34
.byte 0x1a
.byte 0x36
.byte 0x8
.byte 0x37
.byte 0x15
.byte 0x13
.byte 0x17
.byte 0x1c
.byte 0x1c
.byte 0x9
.byte 0x18
.byte 0xa
.byte 0xc
.byte 0x6
.byte 0x12
.byte 0x15
.byte 0x13
.byte 0xf
.byte 0x2f
.byte 0x38
.byte 0x30
.byte 0x2e
.byte 0x16
.byte 0x12
.byte 0x7
.byte 0x8
.byte 0x9
.byte 0x18
.byte 0xa
.byte 0xc
.byte 0xb
.byte 0x7
.byte 0xd
.byte 0xb
.byte 0xe
.byte 0x17
.byte 0xf
.byte 0x11
.byte 0x33
.byte 0x16
.byte 0x34
.byte 0x2d
.byte 0x1d
.byte 0x33
.byte 0x1b
.byte 0x14
.byte 0x6
.byte 0xd
.byte 0x19
.byte 0xe
.byte 0x5
.byte 0x1b
.byte 0x11
.byte 0x5
.byte 0x10
.byte 0x10
.byte 0x36
.byte 0x1a
.byte 0x37
.byte 0x19
.byte 0x38
.byte 0x1d
.byte 0x8
.byte 0x9
.byte 0x15
.byte 0x13
.byte 0x17
.byte 0xa
.byte 0x1c
.byte 0xd
.byte 0x18
.byte 0xf
.byte 0xc
.byte 0x18
.byte 0x12
.byte 0x1c
.byte 0x13
.byte 0x33
.byte 0x16
.byte 0x15
.byte 0x7
.byte 0x16
.byte 0x9
.byte 0x17
.byte 0xa
.byte 0x7
.byte 0xd
.byte 0x11
.byte 0xe
.byte 0x8
.byte 0xf
.byte 0xc
.byte 0x33
.byte 0x12
.byte 0x11
.byte 0xe
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x2
.byte 0x0

gpio_map_1:
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x13
.byte 0x0
.byte 0x26
.byte 0x0
.byte 0x3a
.byte 0x0
.byte 0x4e
.byte 0x0
.byte 0x62
.byte 0x0
.byte 0x77
.byte 0x0
.byte 0x8c
.byte 0x0
.byte 0xa1
.byte 0x0
.byte 0xb7
.byte 0x0
.byte 0xcd
.byte 0x0
.byte 0xe3
.byte 0x0
.byte 0xfa
.byte 0x0
.byte 0x11
.byte 0x1
.byte 0x28
.byte 0x1
.byte 0x40
.byte 0x1
.byte 0x58
.byte 0x1
.byte 0x71
.byte 0x1
.byte 0x8a
.byte 0x1
.byte 0xa3
.byte 0x1
.byte 0xbd
.byte 0x1
.byte 0xd7
.byte 0x1
.byte 0xf1
.byte 0x1
.byte 0xc
.byte 0x2
.byte 0x28
.byte 0x2
.byte 0x43
.byte 0x2
.byte 0x60
.byte 0x2
.byte 0x7c
.byte 0x2
.byte 0x9a
.byte 0x2
.byte 0xb7
.byte 0x2
.byte 0xd5
.byte 0x2
.byte 0xf4
.byte 0x2
.byte 0x13
.byte 0x3
.byte 0x32
.byte 0x3
.byte 0x53
.byte 0x3
.byte 0x73
.byte 0x3
.byte 0x94
.byte 0x3
.byte 0xb6
.byte 0x3
.byte 0xd8
.byte 0x3
.byte 0xfb
.byte 0x3
.byte 0x1e
.byte 0x4
.byte 0x42
.byte 0x4
.byte 0x66
.byte 0x4
.byte 0x8b
.byte 0x4
.byte 0xb1
.byte 0x4
.byte 0xd7
.byte 0x4
.byte 0xfd
.byte 0x4
.byte 0x25
.byte 0x5
.byte 0x4d
.byte 0x5
.byte 0x75
.byte 0x5
.byte 0x9f
.byte 0x5
.byte 0xc8
.byte 0x5
.byte 0xf3
.byte 0x5
.byte 0x1e
.byte 0x6
.byte 0x4a
.byte 0x6
.byte 0x77
.byte 0x6
.byte 0xa4
.byte 0x6
.byte 0xd2
.byte 0x6
.byte 0x1
.byte 0x7
.byte 0x31
.byte 0x7
.byte 0x61
.byte 0x7
.byte 0x92
.byte 0x7
.byte 0xc4
.byte 0x7
.byte 0xf6
.byte 0x7
.byte 0x2a
.byte 0x8
.byte 0x5e
.byte 0x8
.byte 0x93
.byte 0x8
.byte 0xc9
.byte 0x8
.byte 0x0
.byte 0x9
.byte 0x38
.byte 0x9
.byte 0x70
.byte 0x9
.byte 0xaa
.byte 0x9
.byte 0xe4
.byte 0x9
.byte 0x1f
.byte 0xa
.byte 0x5b
.byte 0xa
.byte 0x99
.byte 0xa
.byte 0xd7
.byte 0xa
.byte 0x16
.byte 0xb
.byte 0x56
.byte 0xb
.byte 0x97
.byte 0xb
.byte 0xd9
.byte 0xb
.byte 0x1d
.byte 0xc
.byte 0x61
.byte 0xc
.byte 0xa6
.byte 0xc
.byte 0xed
.byte 0xc
.byte 0x34
.byte 0xd
.byte 0x7d
.byte 0xd
.byte 0xc7
.byte 0xd
.byte 0x12
.byte 0xe
.byte 0x5e
.byte 0xe
.byte 0xac
.byte 0xe
.byte 0xfb
.byte 0xe
.byte 0x4b
.byte 0xf
.byte 0x9c
.byte 0xf
.byte 0xee
.byte 0xf
.byte 0x42
.byte 0x10
.byte 0x97
.byte 0x10
.byte 0xee
.byte 0x10
.byte 0x46
.byte 0x11
.byte 0x9f
.byte 0x11
.byte 0xfa
.byte 0x11
.byte 0x56
.byte 0x12
.byte 0xb4
.byte 0x12
.byte 0x13
.byte 0x13
.byte 0x73
.byte 0x13
.byte 0xd5
.byte 0x13
.byte 0x39
.byte 0x14
.byte 0x9e
.byte 0x14
.byte 0x5
.byte 0x15
.byte 0x6e
.byte 0x15
.byte 0xd8
.byte 0x15
.byte 0x44
.byte 0x16
.byte 0xb2
.byte 0x16
.byte 0x21
.byte 0x17
.byte 0x92
.byte 0x17
.byte 0x5
.byte 0x18
.byte 0x7a
.byte 0x18
.byte 0xf0
.byte 0x18
.byte 0x69
.byte 0x19
.byte 0xe3
.byte 0x19
.byte 0x5f
.byte 0x1a
.byte 0xde
.byte 0x1a
.byte 0x5e
.byte 0x1b
.byte 0xe0
.byte 0x1b
.byte 0x65
.byte 0x1c
.byte 0xeb
.byte 0x1c
.byte 0x74
.byte 0x1d
.byte 0xff
.byte 0x1d
.byte 0x8c
.byte 0x1e
.byte 0x1b
.byte 0x1f
.byte 0xac
.byte 0x1f
.byte 0x40
.byte 0x20
.byte 0xd6
.byte 0x20
.byte 0x6f
.byte 0x21
.byte 0xa
.byte 0x22
.byte 0xa8
.byte 0x22
.byte 0x48
.byte 0x23
.byte 0xea
.byte 0x23
.byte 0x8f
.byte 0x24
.byte 0x37
.byte 0x25
.byte 0xe1
.byte 0x25
.byte 0x8e
.byte 0x26
.byte 0x3e
.byte 0x27
.byte 0xf1
.byte 0x27
.byte 0xa6
.byte 0x28
.byte 0x5f
.byte 0x29
.byte 0x1a
.byte 0x2a
.byte 0xd8
.byte 0x2a
.byte 0x99
.byte 0x2b
.byte 0x5e
.byte 0x2c
.byte 0x25
.byte 0x2d
.byte 0xf0
.byte 0x2d
.byte 0xbe
.byte 0x2e
.byte 0x8f
.byte 0x2f
.byte 0x63
.byte 0x30
.byte 0x3b
.byte 0x31
.byte 0x16
.byte 0x32
.byte 0xf5
.byte 0x32
.byte 0xd7
.byte 0x33
.byte 0xbd
.byte 0x34
.byte 0xa7
.byte 0x35
.byte 0x94
.byte 0x36
.byte 0x85
.byte 0x37
.byte 0x7a
.byte 0x38
.byte 0x72
.byte 0x39
.byte 0x6f
.byte 0x3a
.byte 0x70
.byte 0x3b
.byte 0x74
.byte 0x3c
.byte 0x7d
.byte 0x3d
.byte 0x8a
.byte 0x3e
.byte 0x9c
.byte 0x3f
.byte 0xb1
.byte 0x40
.byte 0xcb
.byte 0x41
.byte 0xea
.byte 0x42
.byte 0xd
.byte 0x44
.byte 0x35
.byte 0x45
.byte 0x61
.byte 0x46
.byte 0x93
.byte 0x47
.byte 0xc9
.byte 0x48
.byte 0x4
.byte 0x4a
.byte 0x44
.byte 0x4b
.byte 0x89
.byte 0x4c
.byte 0xd3
.byte 0x4d
.byte 0x22
.byte 0x4f
.byte 0x77
.byte 0x50
.byte 0xd2
.byte 0x51
.byte 0x31
.byte 0x53
.byte 0x97
.byte 0x54
.byte 0x2
.byte 0x56
.byte 0x72
.byte 0x57
.byte 0xe9
.byte 0x58
.byte 0x66
.byte 0x5a
.byte 0xe8
.byte 0x5b
.byte 0x71
.byte 0x5d
.byte 0x0
.byte 0x5f
.byte 0x95
.byte 0x60
.byte 0x31
.byte 0x62
.byte 0xd3
.byte 0x63
.byte 0x7c
.byte 0x65
.byte 0x2c
.byte 0x67
.byte 0xe3
.byte 0x68
.byte 0xa0
.byte 0x6a
.byte 0x65
.byte 0x6c
.byte 0x31
.byte 0x6e
.byte 0x4
.byte 0x70
.byte 0xde
.byte 0x71
.byte 0xc0
.byte 0x73
.byte 0xaa
.byte 0x75
.byte 0x9c
.byte 0x77
.byte 0x95
.byte 0x79
.byte 0x96
.byte 0x7b
.byte 0xa0
.byte 0x7d
.byte 0xb2
.byte 0x7f
.byte 0xcc
.byte 0x81
.byte 0xef
.byte 0x83
.byte 0x1a
.byte 0x86
.byte 0x4f
.byte 0x88
.byte 0x8c
.byte 0x8a
.byte 0xd3
.byte 0x8c
.byte 0x22
.byte 0x8f
.byte 0x7b
.byte 0x91
.byte 0xde
.byte 0x93
.byte 0x4a
.byte 0x96
.byte 0xc0
.byte 0x98
.byte 0x40
.byte 0x9b
.byte 0xcb
.byte 0x9d
.byte 0x5f
.byte 0xa0
.byte 0xff
.byte 0xa2
.byte 0xa8
.byte 0xa5
.byte 0x5d
.byte 0xa8
.byte 0x1d
.byte 0xab
.byte 0xe8
.byte 0xad
.byte 0xbe
.byte 0xb0
.byte 0x9f
.byte 0xb3
.byte 0x8d
.byte 0xb6
.byte 0x86
.byte 0xb9
.byte 0x8c
.byte 0xbc
.byte 0x9d
.byte 0xbf
.byte 0xbc
.byte 0xc2
.byte 0xe6
.byte 0xc5
.byte 0x1e
.byte 0xc9
.byte 0x63
.byte 0xcc
.byte 0xb5
.byte 0xcf
.byte 0x15
.byte 0xd3
.byte 0x82
.byte 0xd6
.byte 0xfd
.byte 0xd9
.byte 0x87
.byte 0xdd
.byte 0x1f
.byte 0xe1
.byte 0xc5
.byte 0xe4
.byte 0x7a
.byte 0xe8
.byte 0x3f
.byte 0xec
.byte 0x12
.byte 0xf0
.byte 0xf5
.byte 0xf3
.byte 0xe9
.byte 0xf7
.byte 0xec
.byte 0xfb
.byte 0xff
.byte 0xff
.byte 0xe8
.byte 0xc0
.byte 0xc1
.byte 0xc2
.byte 0xc3
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xd0
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0xd4
.byte 0x80
.byte 0x0
.byte 0x0

usb_report1_desc:
.byte 0x6
.byte 0x0
.byte 0xff
.byte 0x9
.byte 0x1
.byte 0xa1
.byte 0x1
.byte 0x9
.byte 0x2
.byte 0x15
.byte 0x0
.byte 0x26
.byte 0xff
.byte 0x0
.byte 0x75
.byte 0x8
.byte 0x95
.byte 0x40
.byte 0x81
.byte 0x2
.byte 0x9
.byte 0x3
.byte 0x15
.byte 0x0
.byte 0x26
.byte 0xff
.byte 0x0
.byte 0x75
.byte 0x8
.byte 0x95
.byte 0x40
.byte 0x91
.byte 0x2
.byte 0xc0
.byte 0x0
.byte 0x0

usb_report2_desc:
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x80
.byte 0xa1
.byte 0x1
.byte 0x85
.byte 0x1
.byte 0x19
.byte 0x81
.byte 0x29
.byte 0x83
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x95
.byte 0x3
.byte 0x75
.byte 0x1
.byte 0x81
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x5
.byte 0x81
.byte 0x1
.byte 0xc0
.byte 0x5
.byte 0xc
.byte 0x9
.byte 0x1
.byte 0xa1
.byte 0x1
.byte 0x85
.byte 0x2
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x95
.byte 0x12
.byte 0x75
.byte 0x1
.byte 0xa
.byte 0x83
.byte 0x1
.byte 0xa
.byte 0x8a
.byte 0x1
.byte 0xa
.byte 0x92
.byte 0x1
.byte 0xa
.byte 0x94
.byte 0x1
.byte 0x9
.byte 0xcd
.byte 0x9
.byte 0xb7
.byte 0x9
.byte 0xb6
.byte 0x9
.byte 0xb5
.byte 0x9
.byte 0xe2
.byte 0x9
.byte 0xea
.byte 0x9
.byte 0xe9
.byte 0xa
.byte 0x21
.byte 0x2
.byte 0xa
.byte 0x23
.byte 0x2
.byte 0xa
.byte 0x24
.byte 0x2
.byte 0xa
.byte 0x25
.byte 0x2
.byte 0xa
.byte 0x26
.byte 0x2
.byte 0xa
.byte 0x27
.byte 0x2
.byte 0xa
.byte 0x2a
.byte 0x2
.byte 0x81
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0xe
.byte 0x81
.byte 0x1
.byte 0xc0
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x6
.byte 0xa1
.byte 0x1
.byte 0x85
.byte 0x4
.byte 0x5
.byte 0x7
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x8
.byte 0x81
.byte 0x3
.byte 0x95
.byte 0xe8
.byte 0x75
.byte 0x1
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x5
.byte 0x7
.byte 0x19
.byte 0x0
.byte 0x29
.byte 0xe7
.byte 0x81
.byte 0x0
.byte 0xc0
.byte 0x0
.byte 0x0

usb_report0_desc:
.byte 0x5
.byte 0x1
.byte 0x9
.byte 0x6
.byte 0xa1
.byte 0x1
.byte 0x5
.byte 0x7
.byte 0x19
.byte 0xe0
.byte 0x29
.byte 0xe7
.byte 0x15
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x75
.byte 0x1
.byte 0x95
.byte 0x8
.byte 0x81
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x8
.byte 0x81
.byte 0x3
.byte 0x95
.byte 0x3
.byte 0x75
.byte 0x1
.byte 0x5
.byte 0x8
.byte 0x19
.byte 0x1
.byte 0x29
.byte 0x3
.byte 0x91
.byte 0x2
.byte 0x95
.byte 0x1
.byte 0x75
.byte 0x5
.byte 0x91
.byte 0x3
.byte 0x95
.byte 0x6
.byte 0x75
.byte 0x8
.byte 0x15
.byte 0x0
.byte 0x26
.byte 0xa4
.byte 0x0
.byte 0x5
.byte 0x7
.byte 0x19
.byte 0x0
.byte 0x29
.byte 0xa4
.byte 0x81
.byte 0x0
.byte 0xc0

usb_config_desc:
.byte 0x9
.byte 0x2
.byte 0x5b
.byte 0x0
.byte 0x3
.byte 0x1
.byte 0x0
.byte 0xa0
.byte 0x32

usb_interface0_desc:
.byte 0x9
.byte 0x4
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x3
.byte 0x1
.byte 0x1
.byte 0x0

usb_hid0_desc:
.byte 0x9
.byte 0x21
.byte 0x11
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x22
.byte 0x40
.byte 0x0

usb_endpoint1_desc:
.byte 0x7
.byte 0x5
.byte 0x81
.byte 0x3
.byte 0x8
.byte 0x0
.byte 0x1

usb_interface1_desc:
.byte 0x9
.byte 0x4
.byte 0x1
.byte 0x0
.byte 0x2
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x0

usb_hid1_desc:
.byte 0x9
.byte 0x21
.byte 0x11
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x22
.byte 0x22
.byte 0x0

usb_endpoint3_desc:
.byte 0x7
.byte 0x5
.byte 0x83
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1

usb_endpoint4_desc:
.byte 0x7
.byte 0x5
.byte 0x4
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1

usb_interface2_desc:
.byte 0x9
.byte 0x4
.byte 0x2
.byte 0x0
.byte 0x1
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x0

usb_hid2_desc:
.byte 0x9
.byte 0x21
.byte 0x11
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x22

usb_endpoint2_desc:
.byte 0x86
.byte 0x0
.byte 0x7
.byte 0x5
.byte 0x82
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x0

usb_device_desc:
.byte 0x12
.byte 0x1
.byte 0x10
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xd9
.byte 0x4
.byte 0x67
.byte 0x1
.byte 0x3
.byte 0x11
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0

usb_str0_desc:
.byte 0x4
.byte 0x3
.byte 0x9
.byte 0x4

usb_str1_desc:
.byte 0x22
.byte 0x3
.byte 0x55
.byte 0x0
.byte 0x53
.byte 0x0
.byte 0x42
.byte 0x0
.byte 0x2d
.byte 0x0
.byte 0x48
.byte 0x0
.byte 0x49
.byte 0x0
.byte 0x44
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x4b
.byte 0x0
.byte 0x65
.byte 0x0
.byte 0x79
.byte 0x0
.byte 0x62
.byte 0x0
.byte 0x6f
.byte 0x0
.byte 0x61
.byte 0x0
.byte 0x72
.byte 0x0
.byte 0x64
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x29
.byte 0x66
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb9
.byte 0x74
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb9
.byte 0x73
.byte 0x0
.byte 0x0
.byte 0xad
.byte 0x72
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0x8
.byte 0x3
.byte 0x0
.byte 0x0
.byte 0x0

task_1:
.byte 0x3c
.byte 0x81
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x68
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x4c
.byte 0x78
.byte 0x0
.byte 0x0

task_2:
.byte 0xa4
.byte 0x81
.byte 0x0
.byte 0x0
.byte 0x68
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x78
.byte 0x21
.byte 0x0
.byte 0x0
.byte 0x5c
.byte 0x78
.byte 0x0
.byte 0x0

sram_init_data:
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xa2
.byte 0x4a
.byte 0x4
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x5c
.byte 0x7d
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xca
.byte 0x9
.byte 0x0
.byte 0x20
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
