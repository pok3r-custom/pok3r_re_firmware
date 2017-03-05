.syntax unified
.cpu cortex-m3
.text
.thumb


.byte 0xd8
.byte 0xe
.byte 0x0
.byte 0x20
.byte 0x19
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x25
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

.thumb_func
entry:
    ldr.w sp, [pc, #0xc] /* data_30 */ 
    bl sram_init
call_28:
    ldr r0, [pc, #0] /* data_2c */ 
    bx r0 /* main */ 

data_2c:
.word main
data_30:
.word 0x20000ed8

call_34:
    str r1, [r0, #0xc]
    bx lr
call_38:
    str r1, [r0, #8]
    bx lr

.byte 0xe1
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x40
.byte 0xba
.byte 0x70
.byte 0x47
.byte 0xc0
.byte 0xba
.byte 0x70
.byte 0x47

load_jump_fw:
    ldr r1, [r0]
    mov sp, r1
    ldr r1, [r0, #4]
    bx r1
sram_init:
    ldr r4, [pc, #0x18] /* data_6c */ 
    ldr r5, [pc, #0x1c] /* data_70 */ 
    b jump_64
jump_56:
    ldr r0, [r4, #0xc]
    orr r3, r0, #1
    ldm.w r4, {r0, r1, r2}
    blx r3
    adds r4, #0x10
jump_64:
    cmp r4, r5
    blo jump_56
    bl call_28

data_6c:
.word 0x22ac
data_70:
.word 0x22cc

call_74:
    push {r4, lr}
    movs r2, #0
    cmp r0, #0x1c
    bls jump_82
    movs r2, #1
    subs r0, #0x20
    uxtb r0, r0
jump_82:
    ldr r3, [pc, #0x14] /* data_98 */ 
    add.w r2, r3, r2, lsl #2
    ldr r3, [r2]
    movs r4, #0xf
    lsls r4, r0
    bics r3, r4
    lsls r1, r0
    orrs r1, r3
    str r1, [r2]
    pop {r4, pc}

data_98:
.word 0x40022000

bftm0_intr:
    push {r4, lr}
    ldr r0, [pc, #0x20] /* data_c0 */ 
    bl call_f4
    ldr r0, [pc, #0x1c] /* data_c4 */ 
    ldr r1, [r0]
    cbz r1, jump_b0
    ldr r1, [r0]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0]
jump_b0:
    ldr r1, [r0, #4]
    cmp r1, #0
    beq jump_bc
    ldr r1, [r0, #4]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str r1, [r0, #4]
jump_bc:
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_c0:
.word 0x40076000
data_c4:
.word 0x2000018c

bftm1_intr:
    push {r4, lr}
    ldr r0, [pc, #0xc] /* data_d8 */ 
    bl call_f4
    pop.w {r4, lr}
    b.w jump_c3c

data_d8:
.word 0x40077000

usb_disable_dppu:
    movs r0, #0
    b.w usb_dp_pull_up

.byte 0x70
.byte 0x47
.byte 0x9d
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xc9
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x27
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0xf1
.byte 0x4
.byte 0x0
.byte 0x0

call_f4:
    ldr r1, [r0, #4]
    bic r1, r1, #1
    str r1, [r0, #4]
    dsb sy
    bx lr
call_102:
    add.w r0, r0, r0, lsl #2
    lsls r0, r0, #2
jump_108:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_108
    bx lr
call_10e:
    str r1, [r0, #0x24]
    bx lr

.byte 0x70
.byte 0x47
.byte 0x8d
.byte 0x1a
.byte 0x0
.byte 0x0

reset:
    ldr r0, [pc, #0xc] /* data_128 */ 
    blx r0 /* call_1a98 */ 
    ldr r0, [pc, #0xc] /* data_12c */ 
    blx r0 /* clock_init */ 
    ldr r0, [pc, #0xc] /* data_130 */ 
    bx r0 /* entry */ 
generic_fault:
    b generic_fault

.byte 0xfe
.byte 0xe7

data_128:
.word call_1a98
data_12c:
.word clock_init
data_130:
.word entry

.byte 0xf0
.byte 0xb5
.byte 0x32
.byte 0x4b
.byte 0x1
.byte 0x25
.byte 0x32
.byte 0x4e
.byte 0x5a
.byte 0x78
.byte 0x1
.byte 0xf0
.byte 0x1
.byte 0x1
.byte 0xe9
.byte 0x28
.byte 0x4
.byte 0xd0
.byte 0xea
.byte 0x28
.byte 0x5
.byte 0xd0
.byte 0xeb
.byte 0x28
.byte 0x7
.byte 0xd1
.byte 0x1a
.byte 0xe0
.byte 0x61
.byte 0xf3
.byte 0x0
.byte 0x2
.byte 0x1
.byte 0xe0
.byte 0x61
.byte 0xf3
.byte 0x41
.byte 0x2
.byte 0x5a
.byte 0x70
.byte 0xf5
.byte 0x60
.byte 0xec
.byte 0x38
.byte 0x11
.byte 0x28
.byte 0x4c
.byte 0xd8
.byte 0x28
.byte 0x4a
.byte 0x12
.byte 0x28
.byte 0x53
.byte 0x78
.byte 0x94
.byte 0x78
.byte 0xd7
.byte 0x78
.byte 0x45
.byte 0xd2
.byte 0xdf
.byte 0xe8
.byte 0x0
.byte 0xf0
.byte 0xc
.byte 0xf
.byte 0x13
.byte 0x16
.byte 0x19
.byte 0x1c
.byte 0x1f
.byte 0x22
.byte 0x25
.byte 0x28
.byte 0x2c
.byte 0x2f
.byte 0x32
.byte 0x35
.byte 0x38
.byte 0x3b
.byte 0x3e
.byte 0x41
.byte 0x61
.byte 0xf3
.byte 0x82
.byte 0x2
.byte 0xe6
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x0
.byte 0x3
.byte 0x1
.byte 0xe0
.byte 0x61
.byte 0xf3
.byte 0x41
.byte 0x3
.byte 0x53
.byte 0x70
.byte 0x30
.byte 0xe0
.byte 0x61
.byte 0xf3
.byte 0x82
.byte 0x3
.byte 0xfa
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0xc3
.byte 0x3
.byte 0xf7
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x4
.byte 0x13
.byte 0xf4
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x45
.byte 0x13
.byte 0xf1
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x86
.byte 0x13
.byte 0xee
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0xc7
.byte 0x13
.byte 0xeb
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x0
.byte 0x4
.byte 0x1
.byte 0xe0
.byte 0x61
.byte 0xf3
.byte 0x41
.byte 0x4
.byte 0x94
.byte 0x70
.byte 0x17
.byte 0xe0
.byte 0x61
.byte 0xf3
.byte 0x82
.byte 0x4
.byte 0xfa
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0xc3
.byte 0x4
.byte 0xf7
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x4
.byte 0x14
.byte 0xf4
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x45
.byte 0x14
.byte 0xf1
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x86
.byte 0x14
.byte 0xee
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0xc7
.byte 0x14
.byte 0xeb
.byte 0xe7
.byte 0x61
.byte 0xf3
.byte 0x0
.byte 0x7
.byte 0x1
.byte 0xe0
.byte 0x61
.byte 0xf3
.byte 0x41
.byte 0x7
.byte 0xd7
.byte 0x70
.byte 0xb5
.byte 0x60
.byte 0xf0
.byte 0xbd
.byte 0x14
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x54
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x28
.byte 0x0
.byte 0x0
.byte 0x20

call_20c:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_218
    orr r1, r1, #4
    b jump_21c
jump_218:
    bic r1, r1, #4
jump_21c:
    str r1, [r0]
    bx lr
call_220:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_22c
    orr r1, r1, #1
    b jump_230
jump_22c:
    bic r1, r1, #1
jump_230:
    str r1, [r0]
    bx lr
call_234:
    lsls r0, r0, #3
    lsrs r3, r1, #3
    add.w r0, r0, r3, lsl #2
    ldr r3, [pc, #0x18] /* data_258 */ 
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

data_258:
.word 0x40022020

setup_afio_gpio:
    push.w {r4, r5, r6, r7, r8, lr}
    movs r1, #1
    lsls r5, r1, #0xe
    mov r0, r5
    bl call_3b8
    movs r1, #1
    lsls r4, r1, #0x10
    mov r0, r4
    bl ckcu_ahb_clock_enable
    ldr r6, [pc, #0x90] /* data_308 */ 
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    asrs r7, r4, #1
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
    asrs r5, r4, #5
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
    bl call_234
    movs r2, #1
    movs r1, #0xd
    movs r0, #2
    bl call_234
    movs r2, #1
    movs r1, #0xe
    movs r0, #2
    bl call_234
    movs r2, #1
    movs r1, #0xf
    movs r0, #2
    bl call_234
    ldr r0, [pc, #0x2c] /* data_30c */ 
    ldr r0, [r0, #4]
    lsls r0, r0, #0x15
    bmi jump_2fa
    movs r2, #1
    movs r1, #0xe
    mov r0, r2
    bl call_234
    movs r2, #1
    movs r1, #0xf
    mov r0, r2
    bl call_234
jump_2fa:
    movs r1, #0
    mov r0, r4
    bl ckcu_ahb_clock_enable
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, pc}

data_308:
.word 0x400b0000
data_30c:
.word 0x40088000

jump_310:
    push {r4, lr}
    movs r0, #1
    bl usb_dp_pull_up
    pop.w {r4, lr}
    movs r0, #0xfa
    b.w call_102
clear_two_words:
    movs r1, #0
    str r1, [r0, #4]
    str r1, [r0]
    bx lr
clear_two_words_and_write_two_bytes:
    movs r3, #0
    str r3, [r0]
    str r3, [r0, #4]
    strd r1, r2, [r0, #8]
    bx lr
function_e_2:
    push {r4, lr}
    ldr r4, [r0, #4]
    movs r2, #0
    ldr r3, [r0]
    cmp r4, r3
    beq jump_35a
    ldr r2, [r0, #8]
    ldrb r2, [r2, r3]
    strb r2, [r1]
    ldr r1, [r0]
    ldr r2, [r0, #0xc]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    udiv r3, r1, r2
    mls r1, r2, r3, r1
    movs r2, #1
    str r1, [r0]
jump_35a:
    mov r0, r2
    pop {r4, pc}
function_14:
    push {r4, r5, lr}
    ldr r3, [r0, #4]
    movs r2, #0
    ldr r4, [r0, #0xc]
    .short 0x1c5b /* adds r3, r3, #1 */ 
    udiv r5, r3, r4
    mls r3, r4, r5, r3
    ldr r4, [r0]
    cmp r3, r4
    beq jump_38c
    ldr r2, [r0, #4]
    ldr r3, [r0, #8]
    strb r1, [r3, r2]
    ldr r1, [r0, #0xc]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    udiv r3, r2, r1
    mls r1, r1, r3, r2
    str r1, [r0, #4]
    movs r2, #1
jump_38c:
    mov r0, r2
    pop {r4, r5, pc}
call_390:
    ldr r1, [r0, #4]
    ldr r0, [r0]
    cmp r1, r0
    bne jump_39c
    movs r0, #1
    bx lr
jump_39c:
    movs r0, #0
    bx lr
ckcu_ahb_clock_enable:
    ldr r2, [pc, #0x10] /* data_3b4 */ 
    cmp r1, #1
    ldr r1, [r2, #0x24]
    beq jump_3ae
    bics r1, r0
jump_3aa:
    str r1, [r2, #0x24]
    bx lr
jump_3ae:
    orrs r1, r0
    b jump_3aa

.byte 0x0
.byte 0x0

data_3b4:
.word 0x40088000

call_3b8:
    ldr r2, [pc, #0x10] /* data_3cc */ 
    cmp r1, #1
    ldr r1, [r2, #0x2c]
    beq jump_3c6
    bics r1, r0
jump_3c2:
    str r1, [r2, #0x2c]
    bx lr
jump_3c6:
    orrs r1, r0
    b jump_3c2

.byte 0x0
.byte 0x0

data_3cc:
.word 0x40088000

call_3d0:
    ldr r2, [pc, #0x10] /* data_3e4 */ 
    cmp r1, #1
    ldr r1, [r2, #0x30]
    beq jump_3de
    bics r1, r0
jump_3da:
    str r1, [r2, #0x30]
    bx lr
jump_3de:
    orrs r1, r0
    b jump_3da

.byte 0x0
.byte 0x0

data_3e4:
.word 0x40088000

call_3e8:
    ldr r1, [pc, #0xc] /* data_3f8 */ 
    ldr r2, [r1]
    bic r2, r2, #0xc00000
    orr.w r0, r2, r0, lsl #22
    str r0, [r1]
    bx lr

data_3f8:
.word 0x40088000

crc16:
    push {r4, r5, r6, r7, lr}
    movs r6, #0
    b jump_438
jump_402:
    ldrb r3, [r1, r6]
    movw ip, #0x1021
    eor.w r3, r3, r0, lsr #8
    lsl.w r4, r3, #8
    movs r3, #0
    movs r5, #8
jump_414:
    eor.w lr, r4, r3
    lsl.w r7, r3, #1
    lsls.w lr, lr, #0x10
    bpl jump_426
    eor.w r7, ip, r3, lsl #1
jump_426:
    mov r3, r7
    .short 0x1e6d /* subs r5, r5, #1 */ 
    lsl.w r4, r4, #1
    bne jump_414
    uxth r3, r7
    eor.w r0, r3, r0, lsl #8
    .short 0x1c76 /* adds r6, r6, #1 */ 
jump_438:
    cmp r6, r2
    blo jump_402
    uxth r0, r0
    pop {r4, r5, r6, r7, pc}
flash_page_erase:
    ldr r1, [pc, #0xc] /* data_450 */ 
    str r0, [r1]
    movs r0, #8
    str r0, [r1, #0xc]
    movs r0, #0x14
    str r0, [r1, #0x10]
    b.w jump_474

data_450:
.word 0x40080000

flash_get_protection_status:
    ldr r0, [pc, #4] /* data_45c */ 
    ldr r0, [r0, #0x30]
    bx lr

.byte 0x0
.byte 0x0

data_45c:
.word 0x40080000

flash_write:
    ldr r3, [pc, #0xc] /* data_470 */ 
    str r0, [r3, #0xc]
    str r1, [r3]
    str r2, [r3, #4]
    movs r0, #0x14
    str r0, [r3, #0x10]
    bx lr

.byte 0x0
.byte 0x0

data_470:
.word 0x40080000

jump_474:
    ldr r0, [pc, #0x18] /* data_490 */ 
    ldr r1, [pc, #0x1c] /* data_494 */ 
    b jump_484
jump_47a:
    ldr r2, [r1, #0x10]
    ubfx r2, r2, #2, #2
    cmp r2, #3
    beq jump_48c
jump_484:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_47a
    movs r0, #8
    bx lr
jump_48c:
    movs r0, #0
    bx lr

data_490:
.word 0xfffff
data_494:
.word 0x40080000

call_498:
    cmp r2, #0
    ldr r2, [r0]
    beq jump_4a2
    orrs r2, r1
    b jump_4a4
jump_4a2:
    bics r2, r1
jump_4a4:
    str r2, [r0]
    bx lr
gpio_set_input_enable:
    cmp r2, #0
    ldr r2, [r0, #4]
    beq jump_4b2
    orrs r2, r1
    b jump_4b4
jump_4b2:
    bics r2, r1
jump_4b4:
    str r2, [r0, #4]
    bx lr
call_4b8:
    cmp r2, #0
    ldr r2, [r0, #0x10]
    beq jump_4c2
    orrs r2, r1
    b jump_4c4
jump_4c2:
    bics r2, r1
jump_4c4:
    str r2, [r0, #0x10]
    bx lr
gpio_set_pin_pull_up_down:
    cbz r2, jump_4dc
    cmp r2, #1
    beq jump_4e2
    ldr r2, [r0, #8]
    bics r2, r1
jump_4d2:
    str r2, [r0, #8]
    ldr r2, [r0, #0xc]
    bics r2, r1
    str r2, [r0, #0xc]
    bx lr
jump_4dc:
    ldr r2, [r0, #8]
    orrs r2, r1
    b jump_4d2
jump_4e2:
    ldr r2, [r0, #0xc]
    orrs r2, r1
    str r2, [r0, #0xc]
    ldr r2, [r0, #8]
    bics r2, r1
    str r2, [r0, #8]
    bx lr
i2c1_intr:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    ldr r0, [pc, #0x11c] /* data_614 */ 
    ldr r2, [r0, #0xc]
    str r2, [r0, #0xc]
    ldr r4, [pc, #0x11c] /* data_618 */ 
    lsls r1, r2, #0x15
    mov.w sb, #0
    bpl jump_508
    movs r1, #5
    b jump_608
jump_508:
    lsls r1, r2, #0x17
    bpl jump_510
    movs r1, #4
    b jump_608
jump_510:
    lsls r1, r2, #0x14
    bpl jump_518
    movs r1, #6
    b jump_608
jump_518:
    ldr r1, [pc, #0xfc] /* data_618 */ 
    lsls r3, r2, #0x16
    ldrb r1, [r1]
    bpl jump_530
    ldrh r2, [r4, #0xa]
    cbz r2, jump_52c
    .short 0x1e52 /* subs r2, r2, #1 */ 
    strh r2, [r4, #0xa]
    movs r2, #0
    b jump_5a4
jump_52c:
    movs r1, #2
    b jump_608
jump_530:
    ldr.w ip, [r4, #0x10]
    cmp.w ip, #0
    beq jump_606
    ldr r5, [pc, #0xdc] /* data_618 */ 
    ldrh r3, [r5, #8]
    ldrh r5, [r5, #6]
    adds r6, r3, #1
    uxth r6, r6
    cmp.w r2, #0x190000
    beq jump_5cc
    bgt jump_566
    mvn r1, #0x180000
    adds r1, r2, r1
    beq jump_592
    cmp r1, #3
    bne jump_592
    cmp r5, #1
    bls jump_592
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    movs r1, #1
    b.w call_620
jump_566:
    ldr r7, [pc, #0xb0] /* data_618 */ 
    ldr.w r8, [pc, #0xb0] /* data_61c */ 
    mov.w sl, #1
    ldrh r7, [r7, #4]
    cmp.w r2, #0x3a0000
    beq jump_596
    sub.w r2, r2, #0x3a0000
    .short 0x1f12 /* subs r2, r2, #4 */ 
    bne jump_592
    ldrb r1, [r4, #1]
    cmp r1, #1
    beq jump_58a
    str r7, [r0, #0x18]
    b jump_5c6
jump_58a:
    lsrs r1, r7, #8
    str r1, [r0, #0x18]
    strb.w sb, [r8, #1]
jump_592:
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
jump_596:
    ldrb.w r2, [r8, #1]
    cbz r2, jump_5c2
    ldrb r2, [r4, #2]
    cbz r2, jump_5ac
    mov.w r2, #0x400
jump_5a4:
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    b.w jump_63e
jump_5ac:
    cmp r3, r5
    bhs jump_5ba
    ldrb.w r1, [ip, r3]
    str r1, [r0, #0x18]
    strh r6, [r4, #8]
    b jump_592
jump_5ba:
    mov r5, sb
    strb.w sb, [r4, #3]
    b jump_5f4
jump_5c2:
    uxtb r1, r7
    str r1, [r0, #0x18]
jump_5c6:
    strb.w sl, [r8, #1]
    b jump_592
jump_5cc:
    mov r7, r0
    ldr r0, [r0, #0x18]
    strb.w r0, [ip, r3]
    .short 0x1e6d /* subs r5, r5, #1 */ 
    strh r6, [r4, #8]
    cmp r6, r5
    bne jump_5e4
    movs r1, #0
    mov r0, r7
    bl call_620
jump_5e4:
    ldrh r0, [r4, #8]
    ldrh r1, [r4, #6]
    cmp r0, r1
    bne jump_592
    mov r5, sb
    strb.w sb, [r4, #3]
    mov r0, r7
jump_5f4:
    bl call_634
    str r5, [r4, #0x10]
    ldr r0, [r4, #0xc]
    cmp r0, #0
    beq jump_592
    pop.w {r4, r5, r6, r7, r8, sb, sl, lr}
    bx r0
jump_606:
    movs r1, #3
jump_608:
    strb r1, [r4, #3]
    bl call_634
    str.w sb, [r4, #0x10]
    b jump_592

data_614:
.word 0x40049000
data_618:
.word 0x200006c4
data_61c:
.word 0x200000b1

call_620:
    cmp r1, #0
    ldr r1, [r0]
    beq jump_62c
    orr r1, r1, #1
    b jump_630
jump_62c:
    bic r1, r1, #1
jump_630:
    str r1, [r0]
    bx lr
call_634:
    ldr r1, [r0]
    orr r1, r1, #2
    str r1, [r0]
    bx lr
jump_63e:
    ldr r3, [r0]
    lsls r3, r3, #0x1e
    bmi jump_63e
    cbz r2, jump_64a
    orr r1, r1, #0x400
jump_64a:
    str r1, [r0, #0x1c]
    bx lr

.byte 0x0
.byte 0x0

handle_update_packet:
    push {r4, r5, r6, lr}
    ldr r0, [pc, #0x74] /* data_6c8 */ 
    ldr r1, [r0]
    cmp r1, #1
    bne jump_6c4
    movs r6, #0
    str r6, [r0]
    ldr r4, [pc, #0x6c] /* data_6cc */ 
    ldr r5, [pc, #0x6c] /* data_6d0 */ 
    str r6, [r4, #8]
jump_664:
    ldr r0, [r4, #8]
    adds r1, r5, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    str r0, [r4, #8]
    ldr r0, [pc, #0x64] /* data_6d4 */ 
    bl function_e_2
    ldr r0, [r4, #8]
    cmp r0, #0x40
    blo jump_664
    ldrh r4, [r5, #2]
    strb r6, [r5, #3]
    strb r6, [r5, #2]
    movs r2, #0x40
    ldr r1, [pc, #0x4c] /* data_6d0 */ 
    movs r0, #0
    bl crc16
    ldrb r1, [r5]
    cmp r1, #6
    bhi jump_692
    cmp r4, r0
    beq jump_69c
jump_692:
    movs r4, #0x46
    ldr r0, [pc, #0x3c] /* data_6d4 */ 
    bl clear_two_words
    b jump_6b6
jump_69c:
    mvn r0, #1
    bl function_e_4
    ldrb r3, [r5]
    ldr r4, [pc, #0x30] /* data_6d8 */ 
    ldrd r1, r2, [r5, #4]
    ldr.w r3, [r4, r3, lsl #2]
    ldrb r0, [r5, #1]
    blx r3
    mov r4, r0
jump_6b6:
    mov r1, r4
    pop.w {r4, r5, r6, lr}
    ldr r0, [pc, #0x14] /* data_6d4 */ 
    subs r0, #0x10
    b.w function_14
jump_6c4:
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_6c8:
.word 0x20000024
data_6cc:
.word 0x20000048
data_6d0:
.word 0x20000630
data_6d4:
.word 0x200001cc
data_6d8:
.word 0x21bc

function_b_3:
    ldr r0, [pc, #0x54] /* data_734 */ 
    push {r4, lr}
    ldr r1, [r0]
    uxth r1, r1
    orr r2, r1, #0x11000000
    ldr r1, [pc, #0x4c] /* data_738 */ 
    str r2, [r1]
    ldr r2, [r0, #8]
    mov.w r3, #0x2c00
    orr.w r2, r3, r2, lsl #16
    str r2, [r1, #4]
    ldr r2, [r0, #4]
    ldr r0, [r0, #4]
    sub.w r2, r2, #0xa
    sub.w r0, r0, #0xa
    orr.w r0, r2, r0, lsl #16
    str r0, [r1, #8]
    mov.w r0, #0x2800
    str r0, [r1, #0xc]
    sub.w r1, r1, #0x44
    mov.w r2, #0x44
    sub.w r0, r1, #0x420
    bl clear_two_words_and_write_two_bytes
    ldr r1, [pc, #0x18] /* data_73c */ 
    pop.w {r4, lr}
    mov.w r2, #0x400
    sub.w r0, r1, #0x10
    b.w clear_two_words_and_write_two_bytes

.byte 0x0
.byte 0x0

data_734:
.word 0x40080180
data_738:
.word 0x20000620
data_73c:
.word 0x200001dc

reset_cmd:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r1, #1
    lsls r0, r1, #0x10
    bl ckcu_ahb_clock_enable
    ldr r1, [pc, #0x58] /* data_7a8 */ 
    mov.w r2, #0x200
    str r2, [r1, #0x24]
    ldr r5, [pc, #0x54] /* data_7ac */ 
    cbz r4, jump_75c
    ldr r0, [pc, #0x54] /* data_7b0 */ 
    b jump_76c
jump_75c:
    bl check_ver_str
    cbz r0, jump_7a2
    bl call_7e8
    cbz r0, jump_7a2
    ldr r0, [pc, #0x44] /* data_7b0 */ 
    .short 0x1f40 /* subs r0, r0, #5 */ 
jump_76c:
    str.w r0, [r5, #0x304]
    ldr r1, [pc, #0x40] /* data_7b4 */ 
    mov.w r0, #0x200000
    mov.w r4, #-0x1fff2000
    str r0, [r1]
    bl usb_disable_dppu
    ldr r0, [pc, #0x34] /* data_7b8 */ 
jump_782:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bne jump_782
    dsb sy
    ldr.w r0, [r4, #0xd0c]
    ldr r1, [pc, #0x2c] /* data_7bc */ 
    and r0, r0, #0x700
    orr.w r0, r0, r1
    str.w r0, [r4, #0xd0c]
    dsb sy
jump_7a0:
    b jump_7a0
jump_7a2:
    movs r0, #0
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_7a8:
.word 0x400b0000
data_7ac:
.word 0x40080000
data_7b0:
.word 0x55aafaf5
data_7b4:
.word 0xe000e184
data_7b8:
.word 0x61a80
data_7bc:
.word 0x5fa0004

check_ver_str:
    mov.w r1, #0x2000
    ldr.w r0, [r1, #0xc00]
    sub.w r0, r0, #0x20000000
    cmp.w r0, #0x10001
    bhs jump_7e0
    ldr.w r0, [r1, #0xc04]
    sub.w r0, r0, #0x2c00
    cmp.w r0, #0x1d000
    blo jump_7e4
jump_7e0:
    movs r0, #0
    bx lr
jump_7e4:
    movs r0, #1
    bx lr
call_7e8:
    mov.w r0, #0x2800
    ldr r1, [r0]
    adds r0, r1, #1
    beq jump_808
    movw r3, #0x2804
    movs r0, #0
    b jump_802
jump_7fa:
    ldr r2, [r3, r0]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    beq jump_80a
    .short 0x1d00 /* adds r0, r0, #4 */ 
jump_802:
    cmp r0, r1
    blo jump_7fa
    movs r0, #1
jump_808:
    bx lr
jump_80a:
    movs r0, #0
    bx lr

.byte 0x0
.byte 0x0

call_810:
    push {r4, lr}
    bl call_830
    ldr r4, [pc, #0x14] /* data_82c */ 
    ldrb r0, [r4]
    cmp r0, #1
    bne jump_826
    bl call_858
    movs r0, #2
    strb r0, [r4]
jump_826:
    movs r0, #1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_82c:
.word 0x200000b0

call_830:
    push {r4, lr}
    ldr r4, [pc, #0x14] /* data_848 */ 
    ldrb r0, [r4]
    cbnz r0, jump_844
    movs r1, #1
    lsls r0, r1, #0x11
    bl ckcu_ahb_clock_enable
    movs r0, #1
    strb r0, [r4]
jump_844:
    movs r0, #1
    pop {r4, pc}

data_848:
.word 0x200000b0

call_84c:
    cbz r0, jump_852
    b.w jump_868
jump_852:
    b.w call_858

.byte 0x0
.byte 0x0

call_858:
    movs r2, #1
    movs r1, #0x40
    ldr r0, [pc, #4] /* data_864 */ 
    b.w call_498

.byte 0x0
.byte 0x0

data_864:
.word 0x400b2000

jump_868:
    movs r2, #0
    movs r1, #0x40
    ldr r0, [pc, #4] /* data_874 */ 
    b.w call_498

.byte 0x0
.byte 0x0

data_874:
.word 0x400b2000

.byte 0x10
.byte 0xb5
.byte 0xe
.byte 0x21
.byte 0x15
.byte 0x4b
.byte 0xb1
.byte 0xeb
.byte 0x10
.byte 0x1f
.byte 0x9
.byte 0xd1
.byte 0x0
.byte 0xf0
.byte 0xf
.byte 0x0
.byte 0x8
.byte 0x28
.byte 0x1b
.byte 0xd2
.byte 0x19
.byte 0x78
.byte 0x1
.byte 0x22
.byte 0x82
.byte 0x40
.byte 0x11
.byte 0x43
.byte 0x19
.byte 0x70
.byte 0x15
.byte 0xe0
.byte 0x0
.byte 0x22
.byte 0x11
.byte 0x46
.byte 0x5c
.byte 0x18
.byte 0xa4
.byte 0x78
.byte 0x84
.byte 0x42
.byte 0x0
.byte 0xd1
.byte 0x1
.byte 0x22
.byte 0x49
.byte 0x1c
.byte 0xc9
.byte 0xb2
.byte 0x6
.byte 0x29
.byte 0xf6
.byte 0xd3
.byte 0x4a
.byte 0xb9
.byte 0x0
.byte 0x21
.byte 0x5a
.byte 0x18
.byte 0x92
.byte 0x78
.byte 0x3a
.byte 0xb1
.byte 0x49
.byte 0x1c
.byte 0xc9
.byte 0xb2
.byte 0x6
.byte 0x29
.byte 0xf8
.byte 0xd3
.byte 0x6
.byte 0x29
.byte 0x4
.byte 0xd0
.byte 0x1
.byte 0x20
.byte 0x10
.byte 0xbd
.byte 0x5a
.byte 0x18
.byte 0x90
.byte 0x70
.byte 0xf8
.byte 0xe7
.byte 0x0
.byte 0x20
.byte 0x10
.byte 0xbd
.byte 0x0
.byte 0x0
.byte 0x30
.byte 0x0
.byte 0x0
.byte 0x20

jump_8d8:
    ldr r1, [pc, #8] /* data_8e4 */ 
    movw r0, #0xe878
    str r0, [r1, #0x58]
    bx lr

.byte 0x0
.byte 0x0

data_8e4:
.word 0x40024000

call_8e8:
    ldr r0, [pc, #0xc] /* data_8f8 */ 
    ldr r0, [r0, #0x58]
    movw r1, #0xe878
    ands r0, r1
    beq jump_8f6
    movs r0, #1
jump_8f6:
    bx lr

data_8f8:
.word 0x40024000

function_b_1:
    push {lr}
    sub sp, #0x14
    bl call_810
    bl call_aa0
    ldr r0, [pc, #0x2c] /* data_938 */ 
    str r0, [sp, #0xc]
    movs r0, #9
    strb.w r0, [sp, #0x13]
    movs r0, #0x49
    strh.w r0, [sp, #0x10]
    ldr r0, [pc, #0x20] /* data_93c */ 
    str r0, [sp]
    movs r0, #1
    strb.w r0, [sp, #0x12]
    movs r0, #0
    str r0, [sp, #4]
    str r0, [sp, #8]
    mov r0, sp
    bl call_cbc
    bl call_b14
    add sp, #0x14
    pop {pc}

.byte 0x0
.byte 0x0

data_938:
.word 0x2264
data_93c:
.word 0x941

.byte 0x2d
.byte 0xe9
.byte 0xf0
.byte 0x47
.byte 0xb
.byte 0x46
.byte 0x11
.byte 0x46
.byte 0x32
.byte 0x4a
.byte 0x4f
.byte 0xf0
.byte 0x1
.byte 0x9
.byte 0x2
.byte 0xeb
.byte 0xc0
.byte 0x0
.byte 0xc4
.byte 0x5c
.byte 0xe7
.byte 0x2c
.byte 0x0
.byte 0xd1
.byte 0xe8
.byte 0x24
.byte 0xdf
.byte 0xf8
.byte 0xbc
.byte 0x80
.byte 0x2f
.byte 0x4d
.byte 0xa8
.byte 0xf1
.byte 0x20
.byte 0x7
.byte 0x5
.byte 0xf1
.byte 0x10
.byte 0x2
.byte 0x1
.byte 0x26
.byte 0x61
.byte 0xb3
.byte 0xe8
.byte 0x2c
.byte 0x3
.byte 0xd0
.byte 0x28
.byte 0x78
.byte 0x1
.byte 0x28
.byte 0x1
.byte 0xd0
.byte 0x17
.byte 0xe0
.byte 0x2e
.byte 0x70
.byte 0x0
.byte 0x20
.byte 0x3b
.byte 0x5c
.byte 0xa3
.byte 0x42
.byte 0x4
.byte 0xd0
.byte 0x40
.byte 0x1c
.byte 0xc0
.byte 0xb2
.byte 0x20
.byte 0x28
.byte 0xf8
.byte 0xd3
.byte 0xd
.byte 0xe0
.byte 0x20
.byte 0x28
.byte 0xb
.byte 0xd2
.byte 0x1
.byte 0x24
.byte 0x0
.byte 0xf0
.byte 0x1f
.byte 0x3
.byte 0x9c
.byte 0x40
.byte 0x43
.byte 0x9
.byte 0x52
.byte 0xf8
.byte 0x23
.byte 0x70
.byte 0x27
.byte 0x43
.byte 0x42
.byte 0xf8
.byte 0x23
.byte 0x70
.byte 0x18
.byte 0xf8
.byte 0x0
.byte 0x40
.byte 0x20
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0xc3
.byte 0xfb
.byte 0x20
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0x62
.byte 0xff
.byte 0x1
.byte 0x28
.byte 0x2
.byte 0xd0
.byte 0x4f
.byte 0xf0
.byte 0x0
.byte 0x9
.byte 0x0
.byte 0xe0
.byte 0x6e
.byte 0x60
.byte 0x48
.byte 0x46
.byte 0xbd
.byte 0xe8
.byte 0xf0
.byte 0x87
.byte 0xe8
.byte 0x2c
.byte 0x1
.byte 0xd1
.byte 0x0
.byte 0x20
.byte 0x28
.byte 0x70
.byte 0x0
.byte 0x23
.byte 0xf8
.byte 0x5c
.byte 0xa0
.byte 0x42
.byte 0x4
.byte 0xd0
.byte 0x5b
.byte 0x1c
.byte 0xdb
.byte 0xb2
.byte 0x20
.byte 0x2b
.byte 0xf8
.byte 0xd3
.byte 0x11
.byte 0xe0
.byte 0x20
.byte 0x2b
.byte 0xf
.byte 0xd2
.byte 0x4f
.byte 0xea
.byte 0x53
.byte 0x1c
.byte 0x92
.byte 0x46
.byte 0x52
.byte 0xf8
.byte 0x2c
.byte 0x20
.byte 0x3
.byte 0xf0
.byte 0x1f
.byte 0x7
.byte 0x6
.byte 0xfa
.byte 0x7
.byte 0xf0
.byte 0x2
.byte 0x42
.byte 0x4
.byte 0xd0
.byte 0x18
.byte 0xf8
.byte 0x3
.byte 0x40
.byte 0x82
.byte 0x43
.byte 0x4a
.byte 0xf8
.byte 0x2c
.byte 0x20
.byte 0x20
.byte 0x46
.byte 0xff
.byte 0xf7
.byte 0x95
.byte 0xfb
.byte 0x20
.byte 0x46
.byte 0x0
.byte 0xf0
.byte 0x64
.byte 0xf8
.byte 0xd5
.byte 0xe7
.byte 0x0
.byte 0x0
.byte 0x14
.byte 0x22
.byte 0x0
.byte 0x0
.byte 0xf4
.byte 0x21
.byte 0x0
.byte 0x0
.byte 0x54
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x2
.byte 0x49
.byte 0x0
.byte 0xb1
.byte 0x1
.byte 0x20
.byte 0x48
.byte 0x70
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0
.byte 0x54
.byte 0x0
.byte 0x0
.byte 0x20

function_b_2:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    bl call_84c
    mov r0, r4
    bl call_ef0
    mov.w r7, #0x1000
    ldr r6, [pc, #0x50] /* data_a98 */ 
    lsls r5, r7, #1
    cbz r4, jump_a6c
    movs r2, #0
    mov r1, r7
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #0
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #2
    mov r1, r7
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #2
    b jump_a8c
jump_a6c:
    movs r2, #1
    mov r1, r7
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, r5
    mov r0, r6
    bl gpio_set_input_enable
    movs r2, #0
    mov r1, r7
    mov r0, r6
    bl gpio_set_pin_pull_up_down
    movs r2, #0
jump_a8c:
    mov r1, r5
    mov r0, r6
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w gpio_set_pin_pull_up_down

data_a98:
.word 0x400b0000

call_a9c:
    b.w jump_bcc
call_aa0:
    ldr r0, [pc, #0xc] /* data_ab0 */ 
    movs r1, #0
    strb r1, [r0, #6]
    .short 0x1e49 /* subs r1, r1, #1 */ 
    str.w r1, [r0, #2]
    bx lr

.byte 0x0
.byte 0x0

data_ab0:
.word 0x20000670

call_ab4:
    ldr r1, [pc, #0x1c] /* data_ad4 */ 
    movw r2, #0xe878
    cbz r0, jump_aca
    ldr r0, [r1, #0x54]
    orrs r0, r2
    str r0, [r1, #0x54]
    str r2, [r1, #0x58]
    ldr r0, [r1, #0x50]
    orrs r0, r2
    b jump_ace
jump_aca:
    ldr r0, [r1, #0x50]
    bics r0, r2
jump_ace:
    str r0, [r1, #0x50]
    bx lr

.byte 0x0
.byte 0x0

data_ad4:
.word 0x40024000

.byte 0x30
.byte 0xb5
.byte 0xe
.byte 0x21
.byte 0xc
.byte 0x4b
.byte 0xb1
.byte 0xeb
.byte 0x10
.byte 0x1f
.byte 0x9
.byte 0xd1
.byte 0x0
.byte 0xf0
.byte 0xf
.byte 0x0
.byte 0x8
.byte 0x28
.byte 0x4
.byte 0xd2
.byte 0x19
.byte 0x78
.byte 0x1
.byte 0x22
.byte 0x82
.byte 0x40
.byte 0x91
.byte 0x43
.byte 0x19
.byte 0x70
.byte 0x30
.byte 0xbd
.byte 0x0
.byte 0x21
.byte 0xc
.byte 0x46
.byte 0x5a
.byte 0x18
.byte 0x95
.byte 0x78
.byte 0x85
.byte 0x42
.byte 0x0
.byte 0xd1
.byte 0x94
.byte 0x70
.byte 0x49
.byte 0x1c
.byte 0xc9
.byte 0xb2
.byte 0x6
.byte 0x29
.byte 0xf6
.byte 0xd3
.byte 0x30
.byte 0xbd
.byte 0x30
.byte 0x0
.byte 0x0
.byte 0x20

call_b14:
    push {r4, lr}
    movs r1, #1
    lsls r0, r1, #0x10
    bl call_3d0
    ldr r4, [pc, #0x28] /* data_b48 */ 
    movw r1, #0x8c9f
    mov r0, r4
    bl call_34
    movs r1, #1
    mov r0, r4
    bl call_220
    ldr r2, [pc, #0x18] /* data_b4c */ 
    asrs r1, r4, #0x15
    str r1, [r2]
    mov r0, r4
    pop.w {r4, lr}
    mov.w r1, #1
    b.w call_20c

.byte 0x0
.byte 0x0

data_b48:
.word 0x40076000
data_b4c:
.word 0xe000e104

call_b50:
    push {r4, r5, lr}
    ldr r1, [pc, #0x34] /* data_b88 */ 
    ldr r4, [r1]
    ldr r3, [r1, #0x48]
    mov.w r2, #1
    str r2, [r1]
    mov.w r2, #0
    str r2, [r1, #0x48]
    ldr r5, [pc, #0x24] /* data_b8c */ 
    str r2, [r5, #0x10]
    str r2, [r5]
    str r4, [r1]
    ldr r2, [pc, #0x20] /* data_b90 */ 
    sub.w r1, r1, #0x618
    ldr r4, [r2]
    orr r4, r4, #4
    str r4, [r2]
    cbz r0, jump_b84
    wfi 
jump_b7e:
    str.w r3, [r1, #0x660]
    pop {r4, r5, pc}
jump_b84:
    wfe 
    b jump_b7e

data_b88:
.word 0x43100618
data_b8c:
.word 0x42d4208c
data_b90:
.word 0xe000ed10

jump_b94:
    ldr r2, [pc, #0x14] /* data_bac */ 
    cmp r1, #1
    ldr.w r1, [r2, #0x104]
    beq jump_ba6
    bics r1, r0
jump_ba0:
    str.w r1, [r2, #0x104]
    bx lr
jump_ba6:
    orrs r1, r0
    b jump_ba0

.byte 0x0
.byte 0x0

data_bac:
.word 0x40088000

ckcu_set_wtf:
    ldr r2, [pc, #0x14] /* data_bc8 */ 
    cmp r1, #1
    ldr.w r1, [r2, #0x10c]
    beq jump_bc2
    bics r1, r0
jump_bbc:
    str.w r1, [r2, #0x10c]
    bx lr
jump_bc2:
    orrs r1, r0
    b jump_bbc

.byte 0x0
.byte 0x0

data_bc8:
.word 0x40088000

jump_bcc:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr r0, [pc, #0x64] /* data_c38 */ 
    ldrh r0, [r0]
    cmp r0, #0
    bne jump_c34
    ldr.w sb, [pc, #0x5c] /* data_c38 */ 
    movs r7, #0
    add.w sb, sb, #0x28
    ldrb.w fp, [sb, #0x1c]
    b jump_c30
jump_be8:
    ldr r0, [pc, #0x4c] /* data_c38 */ 
    mov.w sl, #1
    add r0, r7
    mov r8, r0
    ldrb r5, [r0, #2]
    ldrb r6, [r0, #0x14]
    eors r6, r5
    movs r4, #0
jump_bfa:
    lsls r0, r6, #0x1f
    beq jump_c20
    sbfx r2, r5, #0, #1
    ldr.w r3, [sb, #0xc]
    .short 0x1c52 /* adds r2, r2, #1 */ 
    mov r1, r4
    mov r0, r7
    blx r3
    cmp r0, #1
    bne jump_c20
    ldrb.w r1, [r8, #0x14]
    lsl.w r0, sl, r4
    eors r1, r0
    strb.w r1, [r8, #0x14]
jump_c20:
    .short 0x1c64 /* adds r4, r4, #1 */ 
    lsrs r6, r6, #1
    lsrs r5, r5, #1
    uxtb r4, r4
    cmp r4, #8
    blo jump_bfa
    .short 0x1c7f /* adds r7, r7, #1 */ 
    uxtb r7, r7
jump_c30:
    cmp r7, fp
    blo jump_be8
jump_c34:
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_c38:
.word 0x2000067c

jump_c3c:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr.w r8, [pc, #0x68] /* data_cac */ 
    ldr r0, [pc, #0x68] /* data_cb0 */ 
    sub.w r7, r8, #0x28
    ldrb.w r3, [r8, #0x1b]
    lsrs r4, r3, #1
    add.w r0, r0, r4, lsl #3
    ldr r5, [r0]
    ldr r6, [r0, #4]
    ldrh r0, [r7]
    cbz r0, jump_c62
    ldrh r0, [r7]
    .short 0x1e40 /* subs r0, r0, #1 */ 
    strh r0, [r7]
jump_c62:
    lsls r0, r3, #0x1f
    beq jump_c92
    bl call_f74
    str r6, [r5, #0x24]
    adds r1, r7, r4
    ldrb r2, [r1, #2]
    cmp r2, r0
    beq jump_c7c
    ldrh.w r2, [r8, #0x18]
    strh r2, [r7]
    strb r0, [r1, #2]
jump_c7c:
    ldrb.w r0, [r8, #0x1a]
    .short 0x1c5b /* adds r3, r3, #1 */ 
    udiv r2, r3, r0
    mls r0, r0, r2, r3
    strb.w r0, [r8, #0x1b]
    pop.w {r4, r5, r6, r7, r8, pc}
jump_c92:
    movs r0, #0x40
    ldr r1, [pc, #0x1c] /* data_cb4 */ 
    cmp r4, #2
    bne jump_ca4
    ldr r2, [pc, #0x1c] /* data_cb8 */ 
    ldrb r2, [r2]
    cbz r2, jump_ca4
    str r0, [r1, #0x24]
    b jump_ca6
jump_ca4:
    str r0, [r1, #0x28]
jump_ca6:
    str r6, [r5, #0x28]
    b jump_c7c

.byte 0x0
.byte 0x0

data_cac:
.word 0x200006a4
data_cb0:
.word 0x2264
data_cb4:
.word 0x400b2000
data_cb8:
.word 0x20000055

call_cbc:
    push {r4, r5, r6, lr}
    mov r4, r0
    bl call_d34
    ldr r5, [pc, #0x60] /* data_d28 */ 
    ldrb r0, [r5]
    cmp r0, #1
    bne jump_d24
    ldr r6, [pc, #0x5c] /* data_d2c */ 
    ldrh r0, [r4, #0x10]
    sub.w r3, r6, #0x28
    strh r0, [r6, #0x18]
    ldr r0, [r4, #0xc]
    str r0, [r6]
    ldrb r0, [r4, #0x13]
    lsls r0, r0, #1
    strb r0, [r6, #0x1a]
    movs r0, #0
    strb r0, [r6, #0x1b]
    movs r2, #0xff
    b jump_cf2
jump_ce8:
    adds r1, r3, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    strb r2, [r1, #2]
    strb r2, [r1, #0x14]
    uxtb r0, r0
jump_cf2:
    ldrb r1, [r4, #0x13]
    cmp r1, r0
    bhi jump_ce8
    ldr r0, [r4]
    str r0, [r6, #0xc]
    ldr r0, [r4, #4]
    str r0, [r6, #0x10]
    ldr r0, [r4, #8]
    str r0, [r6, #0x14]
    ldrb r0, [r4, #0x13]
    strb r0, [r6, #0x1c]
    movs r1, #1
    lsls r0, r1, #0x11
    bl call_3d0
    mov.w r1, #0x3200
    ldr r0, [pc, #0x18] /* data_d30 */ 
    bl call_34
    movs r0, #1
    bl call_ef0
    movs r0, #2
    strb r0, [r5]
jump_d24:
    movs r0, #1
    pop {r4, r5, r6, pc}

data_d28:
.word 0x2000006c
data_d2c:
.word 0x200006a4
data_d30:
.word 0x40077000

call_d34:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    ldr.w r8, [pc, #0x1a0] /* data_edc */ 
    ldrb.w r0, [r8]
    cbnz r0, jump_dc0
    movs r1, #1
    lsls r4, r1, #0xf
    mov r0, r4
    bl call_3b8
    movs r1, #1
    mov.w r0, #0xf0000
    bl ckcu_ahb_clock_enable
    ldr r7, [pc, #0x188] /* data_ee0 */ 
    movs r2, #0
    movs r1, #8
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0x10
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0x20
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    movs r1, #0x40
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    ldr.w sb, [pc, #0x160] /* data_ee4 */ 
    asrs r6, r4, #4
    movs r2, #0
    mov r1, r6
    mov r0, sb
    bl gpio_set_pin_pull_up_down
    ldr.w sl, [pc, #0x154] /* data_ee8 */ 
    mov.w fp, #0x2000
    movs r2, #0
    mov r1, fp
    mov r5, sl
    mov r0, sl
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    asrs r1, r4, #1
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r4
    mov r0, r5
    bl gpio_set_pin_pull_up_down
    movs r2, #1
    movs r1, #8
    mov r0, r7
    b jump_dc2
jump_dc0:
    b jump_ed6
jump_dc2:
    bl gpio_set_input_enable
    movs r2, #1
    movs r1, #0x10
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    movs r1, #0x20
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    movs r1, #0x40
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, r6
    mov r0, sb
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, fp
    mov r0, r5
    bl gpio_set_input_enable
    movs r2, #1
    lsls r1, r2, #0xe
    mov r0, r5
    bl gpio_set_input_enable
    movs r2, #1
    mov r1, r4
    mov r0, r5
    bl gpio_set_input_enable
    movs r1, #0
    movs r0, #0xc
    bl call_74
    movs r1, #0
    movs r0, #0x10
    bl call_74
    movs r1, #0
    movs r0, #0x14
    bl call_74
    movs r1, #0
    movs r0, #0x18
    bl call_74
    movs r1, #1
    movs r0, #0x2c
    bl call_74
    movs r1, #2
    movs r0, #0x34
    bl call_74
    movs r1, #2
    movs r0, #0x38
    bl call_74
    movs r1, #2
    movs r0, #0x3c
    bl call_74
    ldr.w sb, [pc, #0x9c] /* data_eec */ 
    movs r4, #0
jump_e52:
    add.w r0, sb, r4, lsl #3
    ldr r5, [r0]
    ldr r6, [r0, #4]
    mov r0, r5
    uxth r1, r6
    bl call_10e
    uxth r1, r6
    movs r2, #1
    mov r0, r5
    bl call_4b8
    uxth r1, r6
    movs r2, #1
    mov r0, r5
    bl call_498
    .short 0x1c64 /* adds r4, r4, #1 */ 
    uxtb r4, r4
    cmp r4, #9
    blo jump_e52
    movs r2, #2
    lsls r4, r2, #7
    mov r1, r4
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r4
    mov r0, r7
    bl gpio_set_input_enable
    movs r2, #1
    movs r1, #4
    mov r0, sl
    bl call_498
    movs r2, #2
    lsls r4, r2, #8
    mov r1, r4
    mov r0, r7
    bl gpio_set_pin_pull_up_down
    movs r2, #0
    mov r1, r4
    mov r0, r7
    bl gpio_set_input_enable
    mov r1, r4
    mov r0, r7
    bl call_10e
    movs r2, #1
    mov r1, r4
    mov r0, r7
    bl call_4b8
    movs r2, #1
    mov r1, r4
    mov r0, r7
    bl call_498
    movs r1, #1
    strb.w r1, [r8]
jump_ed6:
    movs r0, #1
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}

data_edc:
.word 0x2000006c
data_ee0:
.word 0x400b0000
data_ee4:
.word 0x400b2000
data_ee8:
.word 0x400b4000
data_eec:
.word 0x2264

call_ef0:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r4, [pc, #0x70] /* data_f68 */ 
    ldr r6, [pc, #0x74] /* data_f6c */ 
    asrs r5, r4, #0x14
    ldr.w r8, [pc, #0x74] /* data_f70 */ 
    asrs r7, r4, #0x15
    cbz r0, jump_f2a
    movs r1, #0
    mov r0, r4
    bl call_220
    movs r1, #0
    mov r0, r4
    bl call_20c
    mov r0, r4
    bl call_f4
    str.w r5, [r6, #0x180]
    str.w r7, [r8, #0x24]
    pop.w {r4, r5, r6, r7, r8, lr}
    movs r0, #0
    b.w call_fd8
jump_f2a:
    movs r0, #1
    bl call_fd8
    movs r0, #0xa
    bl call_102
    str.w r7, [r8, #0x28]
    movs r0, #0xa
    bl call_102
    movs r1, #0
    mov r0, r4
    bl call_38
    mov r0, r4
    bl call_f4
    movs r1, #1
    mov r0, r4
    bl call_20c
    movs r1, #1
    mov r0, r4
    bl call_220
    str.w r5, [r6, #0x100]
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_f68:
.word 0x40077000
data_f6c:
.word 0xe000e004
data_f70:
.word 0x400b0000

call_f74:
    ldr r1, [pc, #0x54] /* data_fcc */ 
    movs r0, #0
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x1c
    bpl jump_f80
    movs r0, #1
jump_f80:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x1b
    bpl jump_f8a
    orr r0, r0, #2
jump_f8a:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x1a
    bpl jump_f94
    orr r0, r0, #4
jump_f94:
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x19
    bpl jump_f9e
    orr r0, r0, #8
jump_f9e:
    ldr r1, [pc, #0x30] /* data_fd0 */ 
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x14
    bpl jump_faa
    orr r0, r0, #0x10
jump_faa:
    ldr r1, [pc, #0x28] /* data_fd4 */ 
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x12
    bpl jump_fb6
    orr r0, r0, #0x20
jump_fb6:
    ldr r2, [r1, #0x1c]
    lsls r2, r2, #0x11
    bpl jump_fc0
    orr r0, r0, #0x40
jump_fc0:
    ldr r1, [r1, #0x1c]
    lsls r1, r1, #0x10
    bpl jump_fca
    orr r0, r0, #0x80
jump_fca:
    bx lr

data_fcc:
.word 0x400b0000
data_fd0:
.word 0x400b2000
data_fd4:
.word 0x400b4000

call_fd8:
    push {r4, lr}
    movs r2, #9
    ldr r4, [pc, #0x48] /* data_1028 */ 
    movs r1, #0
    cbnz r0, jump_ff2
    b jump_101c
jump_fe4:
    add.w r0, r4, r1, lsl #3
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldr r3, [r0]
    ldr r0, [r0, #4]
    uxtb r1, r1
    str r0, [r3, #0x24]
jump_ff2:
    movs r0, r2
    sub.w r2, r2, #1
    uxtb r2, r2
    bne jump_fe4
    pop {r4, pc}
jump_ffe:
    cmp r1, #8
    beq jump_1012
    add.w r0, r4, r1, lsl #3
    .short 0x1c49 /* adds r1, r1, #1 */ 
    ldr r3, [r0]
    ldr r0, [r0, #4]
    uxtb r1, r1
    str r0, [r3, #0x28]
    b jump_101c
jump_1012:
    ldr r0, [pc, #0x14] /* data_1028 */ 
    movs r1, #9
    ldr r3, [r0, #0x40]
    ldr r0, [r0, #0x44]
    str r0, [r3, #0x24]
jump_101c:
    movs r0, r2
    sub.w r2, r2, #1
    uxtb r2, r2
    bne jump_ffe
    pop {r4, pc}

data_1028:
.word 0x2264

function_e_4:
    mov.w r1, #-0x1fff2000
    cbz r0, jump_1040
    cmp r0, #1
    ldr r0, [r1, #0x10]
    beq jump_1046
    bic r0, r0, #1
jump_103c:
    str r0, [r1, #0x10]
    bx lr
jump_1040:
    movs r0, #0
    str r0, [r1, #0x18]
    bx lr
jump_1046:
    orr r0, r0, #1
    b jump_103c
function_17:
    push.w {r4, r5, r6, r7, r8, lr}
    ldr r5, [pc, #0x80] /* data_10d4 */ 
    ldr r0, [r5]
    cmp r0, #0
    beq jump_10ce
    ldr r0, [pc, #0x7c] /* data_10d8 */ 
    bl function_6
    mov r4, r0
    cmp r0, #1
    bne jump_1068
    bl call_ab4
jump_1068:
    ldr r7, [pc, #0x6c] /* data_10d8 */ 
    ldrb.w r0, [r7, #0x32]
    cmp r0, #3
    bne jump_10a0
    ldr r6, [pc, #0x68] /* data_10dc */ 
    ldr r0, [r6]
    tst.w r0, #0xc0
    beq jump_10a0
    movs r0, #1
    bl function_b_2
    movs r0, #0
    str r0, [r5, #8]
    ldrb.w r0, [r7, #0x32]
    cmp r0, #3
    bne jump_10a0
    ldr r0, [r6]
    tst.w r0, #0xc0
    beq jump_10a0
    bl watchdog_reload_timer
    movs r0, #0
    bl call_b50
jump_10a0:
    bl call_8e8
    cmp r0, #1
    beq jump_10ba
    cmp r4, #1
    bne jump_10ce
jump_10ac:
    movs r0, #0
    bl call_ab4
    pop.w {r4, r5, r6, r7, r8, lr}
    b.w jump_8d8
jump_10ba:
    cmp r4, #1
    bne jump_10ce
    ldr r0, [pc, #0x18] /* data_10d8 */ 
    bl call_1666
    cmp r0, #1
    bne jump_10ac
    bl call_16b6
    b jump_10ac
jump_10ce:
    pop.w {r4, r5, r6, r7, r8, pc}

.byte 0x0
.byte 0x0

data_10d4:
.word 0x20000000
data_10d8:
.word 0x200000b8
data_10dc:
.word 0x400a8000

.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0

.thumb_func
clock_init:
    ldr r0, [pc, #0x50] /* data_1138 */ 
    movs r1, #1
    str.w r1, [r0, #0x300]
    ldr r2, [pc, #0x4c] /* data_113c */ 
    str.w r1, [r2, #0xa8]
jump_10f2:
    ldr.w r3, [r2, #0x108]
    cmp r3, #0
    beq jump_10f2
    movs r3, #0
    str r3, [r2, #0x20]
    mov.w r3, #0x9000000
    str r3, [r0, #0x18]
    str.w r1, [r2, #0xa4]
jump_1108:
    ldr.w r3, [r2, #0x104]
    cmp r3, #0
    beq jump_1108
    ldr r2, [pc, #0x2c] /* data_1140 */ 
    ldr r3, [r2]
    bic r3, r3, #7
    add.w r3, r3, #3
    str r3, [r2]
    str r1, [r0, #0x20]
    ldr r2, [r0, #4]
    bic r2, r2, #3
    add.w r2, r2, #1
    str r2, [r0, #4]
jump_112c:
    ldr r2, [r0, #0x34]
    cmp.w r1, r2, lsr #30
    bne jump_112c
    bx lr

.byte 0x0
.byte 0x0

data_1138:
.word 0x40088000
data_113c:
.word 0x43100000
data_1140:
.word 0x40080200

.byte 0x70
.byte 0xb5
.byte 0x16
.byte 0x4d
.byte 0x16
.byte 0x48
.byte 0x0
.byte 0x24
.byte 0x29
.byte 0x68
.byte 0x59
.byte 0xb1
.byte 0xc1
.byte 0x68
.byte 0x1
.byte 0x29
.byte 0x7
.byte 0xd1
.byte 0xc4
.byte 0x60
.byte 0x0
.byte 0xf1
.byte 0x20
.byte 0x1
.byte 0x8
.byte 0x22
.byte 0x1
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0xc8
.byte 0xfb
.byte 0x2c
.byte 0x60
.byte 0x70
.byte 0xbd
.byte 0xf
.byte 0x4d
.byte 0x29
.byte 0x68
.byte 0x0
.byte 0x29
.byte 0xfa
.byte 0xd1
.byte 0x5
.byte 0xf1
.byte 0xc
.byte 0x6
.byte 0x31
.byte 0x68
.byte 0x0
.byte 0x29
.byte 0xf5
.byte 0xd0
.byte 0xc1
.byte 0x68
.byte 0x1
.byte 0x29
.byte 0xf2
.byte 0xd1
.byte 0xc4
.byte 0x60
.byte 0x8
.byte 0x49
.byte 0x8
.byte 0x22
.byte 0x20
.byte 0x31
.byte 0x1
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0xb3
.byte 0xfb
.byte 0x30
.byte 0x68
.byte 0x4f
.byte 0xf4
.byte 0x7a
.byte 0x61
.byte 0x48
.byte 0x43
.byte 0xc9
.byte 0x10
.byte 0xb0
.byte 0xfb
.byte 0xf1
.byte 0xf0
.byte 0x28
.byte 0x60
.byte 0x70
.byte 0xbd
.byte 0x58
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x8c
.byte 0x1
.byte 0x0
.byte 0x20
.byte 0x70
.byte 0xb5
.byte 0xe
.byte 0x4d
.byte 0xe
.byte 0x48
.byte 0x0
.byte 0x24
.byte 0x29
.byte 0x68
.byte 0x39
.byte 0xb1
.byte 0x1
.byte 0x69
.byte 0x1
.byte 0x29
.byte 0x13
.byte 0xd1
.byte 0x4
.byte 0x61
.byte 0x5
.byte 0x22
.byte 0x0
.byte 0xf1
.byte 0x18
.byte 0x1
.byte 0xa
.byte 0xe0
.byte 0x9
.byte 0x4d
.byte 0x29
.byte 0x68
.byte 0x0
.byte 0x29
.byte 0xa
.byte 0xd0
.byte 0x1
.byte 0x69
.byte 0x1
.byte 0x29
.byte 0x7
.byte 0xd1
.byte 0x4
.byte 0x61
.byte 0x4
.byte 0x49
.byte 0x2
.byte 0x22
.byte 0x9
.byte 0x1d
.byte 0x2
.byte 0x20
.byte 0x0
.byte 0xf0
.byte 0x88
.byte 0xfb
.byte 0x2c
.byte 0x60
.byte 0x70
.byte 0xbd
.byte 0x5c
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x60
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x1
.byte 0x49
.byte 0x1
.byte 0x20
.byte 0xc8
.byte 0x60
.byte 0x70
.byte 0x47
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x1
.byte 0x49
.byte 0x1
.byte 0x20
.byte 0x8
.byte 0x61
.byte 0x70
.byte 0x47
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x20

function_70:
    push {r4, lr}
    ldr r4, [pc, #0x28] /* data_1238 */ 
    ldrd r1, r0, [r4, #4]
    add r1, r0
    movs r2, #0x40
    movs r0, #4
    bl call_1894
    ldr r1, [r4, #4]
    add r0, r1
    ubfx r0, r0, #0, #0xa
    str r0, [r4, #4]
    ldr r1, [pc, #0x10] /* data_123c */ 
    movs r0, #1
    str r0, [r1, #0x14]
    pop.w {r4, lr}
    b.w handle_update_packet

.byte 0x0
.byte 0x0

data_1238:
.word 0x200001cc
data_123c:
.word 0x20000010

jump_1240:
    push {r4, r5, r6, lr}
    mov r4, r0
    ldrb r2, [r0, #3]
    ldrb r1, [r0, #2]
    ldrh r5, [r0, #6]
    ldrh r0, [r0, #4]
    cmp r2, #1
    bne jump_12a2
    cbz r0, jump_1266
    cmp r0, #1
    beq jump_126c
    cmp r0, #2
    bne jump_12a2
    cmp r1, #1
    beq jump_1294
    cmp r1, #2
    bne jump_12a2
    ldr r0, [pc, #0x40] /* data_12a4 */ 
    b jump_1298
jump_1266:
    ldr r0, [pc, #0x3c] /* data_12a4 */ 
    adds r0, #8
    b jump_1298
jump_126c:
    ldr r0, [pc, #0x38] /* data_12a8 */ 
    bl call_390
    cmp r0, #0
    bne jump_12a2
    ldr r2, [pc, #0x30] /* data_12a8 */ 
    movs r0, #0x43
    movs r3, #0
    ldr r1, [r2, #8]
    b jump_1284
jump_1280:
    strb r3, [r1, r0]
    .short 0x1e40 /* subs r0, r0, #1 */ 
jump_1284:
    ldr r6, [r2, #4]
    cmp r6, r0
    bls jump_1280
    ldr r0, [pc, #0x1c] /* data_12a8 */ 
    str r1, [r4, #0x1c]
    bl clear_two_words
    b jump_129a
jump_1294:
    ldr r0, [pc, #0xc] /* data_12a4 */ 
    subs r0, #0x14
jump_1298:
    str r0, [r4, #0x1c]
jump_129a:
    movs r0, #1
    str r5, [r4, #0x20]
    strb.w r0, [r4, #0x24]
jump_12a2:
    pop {r4, r5, r6, pc}

data_12a4:
.word 0x20000028
data_12a8:
.word 0x200001bc

ptr_write_func_ptrs:
    ldr r1, [pc, #0x20] /* data_12d0 */ 
    str r1, [r0]
    ldr r1, [pc, #0x20] /* data_12d4 */ 
    str r1, [r0, #8]
    ldr r1, [pc, #0x20] /* data_12d8 */ 
    str r1, [r0, #0x18]
    ldr r1, [pc, #0x20] /* data_12dc */ 
    str r1, [r0, #0x24]
    ldr r1, [pc, #0x20] /* data_12e0 */ 
    str r1, [r0, #0x2c]
    ldr r1, [pc, #0x20] /* data_12e4 */ 
    str r1, [r0, #0x30]
    ldr r1, [pc, #0x20] /* data_12e8 */ 
    str r1, [r0, #0x38]
    movs r0, #0
    b.w jump_13e4

.byte 0x0
.byte 0x0

data_12d0:
.word 0x12ed
data_12d4:
.word 0x13e5
data_12d8:
.word 0x1435
data_12dc:
.word 0x1331
data_12e0:
.word 0x11f5
data_12e4:
.word 0x1201
data_12e8:
.word 0x120d

.byte 0xe
.byte 0x48
.byte 0x10
.byte 0xb5
.byte 0x1
.byte 0x68
.byte 0x1
.byte 0x29
.byte 0x11
.byte 0xd1
.byte 0x0
.byte 0x21
.byte 0x1
.byte 0x60
.byte 0xc
.byte 0x4c
.byte 0x20
.byte 0x78
.byte 0x0
.byte 0xf0
.byte 0x1
.byte 0x0
.byte 0xfe
.byte 0xf7
.byte 0xee
.byte 0xfe
.byte 0x20
.byte 0x78
.byte 0xc0
.byte 0xf3
.byte 0x40
.byte 0x0
.byte 0xff
.byte 0xf7
.byte 0x88
.byte 0xfb
.byte 0x20
.byte 0x78
.byte 0xc0
.byte 0xf3
.byte 0x80
.byte 0x0
.byte 0xfe
.byte 0xf7
.byte 0xfc
.byte 0xfe
.byte 0xff
.byte 0xf7
.byte 0x13
.byte 0xff
.byte 0xbd
.byte 0xe8
.byte 0x10
.byte 0x40
.byte 0xff
.byte 0xf7
.byte 0x43
.byte 0xbf
.byte 0x0
.byte 0x0
.byte 0xa4
.byte 0x1
.byte 0x0
.byte 0x20
.byte 0x10
.byte 0x0
.byte 0x0
.byte 0x20

function_67:
    push {r4, r5, r6, r7}
    ldrh r1, [r0]
    mov.w r5, #0x100
    movw r7, #0x921
    lsls r6, r5, #1
    ldr r4, [pc, #0x98] /* data_13d8 */ 
    movs r3, #1
    subw r2, r1, #0x921
    cmp r1, r7
    beq jump_1388
    bgt jump_1362
    adds.w r1, r2, #0x780
    beq jump_1376
    cmp r1, r5
    beq jump_137c
    cmp r1, r6
    bne jump_13b0
    ldr r1, [pc, #0x80] /* data_13dc */ 
    strd r1, r3, [r0, #0x1c]
    b jump_13d2
jump_1362:
    movs r7, #0
    cmp r2, r5
    beq jump_13b4
    cmp r2, r6
    bne jump_13b0
    ldr r2, [pc, #0x6c] /* data_13dc */ 
    ldrb r1, [r0, #2]
    subs r2, #8
    str r1, [r2, #8]
    b jump_13d0
jump_1376:
    pop {r4, r5, r6, r7}
    b.w jump_1240
jump_137c:
    ldrh r1, [r0, #4]
    cmp r1, #0
    bne jump_13b0
    strd r4, r3, [r0, #0x1c]
    b jump_13d2
jump_1388:
    ldrb r3, [r0, #3]
    ldrh r1, [r0, #6]
    ldrh r2, [r0, #4]
    str r1, [r0, #0x20]
    cmp r3, #2
    bne jump_13b0
    cmp r2, #0
    bne jump_13b0
    ldr r3, [pc, #0x40] /* data_13dc */ 
    subs r3, #8
    str r3, [r0, #0x1c]
    ldr r3, [pc, #0x40] /* data_13e0 */ 
    strd r3, r2, [r0, #0x28]
    movs r2, #2
    strb.w r2, [r0, #0x24]
    ldr r0, [pc, #0x2c] /* data_13d8 */ 
    adds r0, #0x18
    str r1, [r0]
jump_13b0:
    pop {r4, r5, r6, r7}
    bx lr
jump_13b4:
    ldrh r2, [r0, #4]
    ldrb r1, [r0, #3]
    cmp r2, #0
    bne jump_13b0
    mov.w r2, #0xfa0
    str r1, [r4]
    muls r1, r2, r1
    asrs r2, r2, #3
    udiv r1, r1, r2
    ldr r2, [pc, #0xc] /* data_13d8 */ 
    subs r2, #0xc
    str r1, [r2]
jump_13d0:
    str r7, [r0, #0x20]
jump_13d2:
    strb.w r3, [r0, #0x24]
    b jump_13b0

data_13d8:
.word 0x20000198
data_13dc:
.word 0x20000018
data_13e0:
.word 0x1425

jump_13e4:
    ldr r0, [pc, #0x34] /* data_141c */ 
    push {r4, lr}
    movs r3, #1
    str r3, [r0, #0xc]
    str r3, [r0, #0x10]
    movs r1, #0
    str r1, [r0, #0x14]
    add.w r2, r0, #0x20
    movs r0, #5
    strb r1, [r2]
jump_13fa:
    add.w r4, r2, r0
    .short 0x1e40 /* subs r0, r0, #1 */ 
    strb r1, [r4, #2]
    bpl jump_13fa
    ldr r0, [pc, #0x14] /* data_141c */ 
    movs r2, #2
    .short 0x1d00 /* adds r0, r0, #4 */ 
    strb r3, [r0]
    strb r1, [r0, #1]
    adds r0, #0x14
    strb r2, [r0]
    str.w r1, [r0, #1]
    ldr r0, [pc, #8] /* data_1420 */ 
    str r3, [r0]
    pop {r4, pc}

data_141c:
.word 0x20000010
data_1420:
.word 0x2000000c

function_81:
    ldr r2, [pc, #8] /* data_1430 */ 
    movs r1, #1
    str.w r1, [r2, r0, lsl #2]
    bx lr

.byte 0x0
.byte 0x0

data_1430:
.word 0x200001a4

usb_get_descriptor:
    ldrb r2, [r0, #3]
    ldrh r1, [r0, #4]
    movs r3, #1
    cmp r2, #0x21
    beq jump_144e
    cmp r2, #0x22
    bne jump_1486
    cbz r1, jump_1470
    cmp r1, #1
    beq jump_1478
    cmp r1, #2
    bne jump_1482
    b jump_1488
jump_144e:
    cbz r1, jump_145a
    cmp r1, #1
    beq jump_1460
    cmp r1, #2
    bne jump_1466
    b jump_146a
jump_145a:
    ldr r1, [r0, #0xc]
    adds r1, #0x12
    b jump_1464
jump_1460:
    ldr r1, [r0, #0xc]
    adds r1, #0x2b
jump_1464:
    str r1, [r0, #0x1c]
jump_1466:
    movs r1, #9
    b jump_1480
jump_146a:
    ldr r1, [r0, #0xc]
    adds r1, #0x4b
    b jump_1464
jump_1470:
    ldr r1, [pc, #0x20] /* data_1494 */ 
    str r1, [r0, #0x1c]
    movs r1, #0x40
    b jump_1480
jump_1478:
    ldr r1, [pc, #0x18] /* data_1494 */ 
    adds r1, #0x40
    str r1, [r0, #0x1c]
    movs r1, #0x22
jump_1480:
    str r1, [r0, #0x20]
jump_1482:
    strb.w r3, [r0, #0x24]
jump_1486:
    bx lr
jump_1488:
    ldr r1, [pc, #8] /* data_1494 */ 
    adds r1, #0x64
    str r1, [r0, #0x1c]
    movs r1, #0x65
    b jump_1480

.byte 0x0
.byte 0x0

data_1494:
.word 0x2024

function_6:
    ldrb.w r0, [r0, #0x34]
    ubfx r0, r0, #1, #1
    bx lr
usb_entry:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r4, r0
    bl call_196c
    mov r5, r0
    lsls r0, r0, #0x1e
    bpl jump_14c0
    ldr r1, [r4, #0x4c]
    cbz r1, jump_14ba
    ldr r0, [r4, #0x50]
    blx r1
jump_14ba:
    movs r0, #2
    bl call_16e0
jump_14c0:
    lsls r0, r5, #0x1b
    bpl jump_14e2
    movs r0, #0x10
    bl call_16e0
    ldrb.w r0, [r4, #0x32]
    cmp r0, #2
    blo jump_14e2
    bl call_1980
    ldrb r0, [r4, #0x32]!
    strb r0, [r4, #1]
    movs r0, #3
    strb r0, [r4], #-0x32
jump_14e2:
    lsls r0, r5, #0x1d
    mov.w r7, #0
    bpl jump_1532
    add.w r4, r4, #0x20
    mov.w r0, #-1
    ldr r6, [r4, #0x64]
    str r0, [r4]
    strb r7, [r4, #0x10]
    strb r7, [r4, #0x11]
    ldrb r0, [r4, #0x14]
    bic r0, r0, #2
    strb r0, [r4, #0x14]
    mov.w r0, #4
    strb r0, [r4, #0x12]
    str r7, [r4, #0x18]
    bl call_177c
    bl usb_clear_csr
    movs r0, #0
    ldr r1, [r4, #0x64]
    bl call_1834
    ldr r0, [r6]
    bl call_193c
    ldr r1, [r4, #0x24]
    sub.w r4, r4, #0x20
    cbz r1, jump_152c
    ldr r0, [r4, #0x48]
    blx r1
jump_152c:
    movs r0, #4
    bl call_16e0
jump_1532:
    lsls r0, r5, #0x1c
    bpl jump_1548
    bl usb_clear_csr
    ldrb.w r0, [r4, #0x33]
    strb.w r0, [r4, #0x32]
    movs r0, #8
    bl call_16e0
jump_1548:
    lsls r0, r5, #0x17
    mov.w r6, #0x100
    bpl jump_1646
    movs r0, #0
    bl call_1814
    mov r5, r0
    lsls r0, r0, #0x16
    bpl jump_15a2
    mov r0, r4
    bl call_1a58
    strb.w r7, [r4, #0x24]
    str r7, [r4, #0x20]
    ldrb r0, [r4]
    ands r0, r0, #0x60
    beq jump_1576
    cmp r0, #0x20
    bne jump_1586
    b jump_157e
jump_1576:
    mov r0, r4
    bl call_1d38
    b jump_1586
jump_157e:
    ldr r1, [r4, #0x60]
    cbz r1, jump_1586
    mov r0, r4
    blx r1
jump_1586:
    ldrb.w r0, [r4, #0x24]
    cmp r0, #1
    beq jump_15be
    cmp r0, #2
    beq jump_15d0
    movs r0, #0
    bl call_18d4
jump_1598:
    mov.w r1, #0x200
    movs r0, #0
    bl call_17a4
jump_15a2:
    lsls r0, r5, #0x1e
    bpl jump_1604
    movs r1, #2
    movs r0, #0
    bl call_17a4
    ldr r0, [r4, #0x20]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    beq jump_1604
    ldrb.w r0, [r4, #0x24]
    cmp r0, #2
    beq jump_15dc
    b jump_1604
jump_15be:
    ldrh r0, [r4, #6]
    ldr r1, [r4, #0x20]
    cmp r1, r0
    ble jump_15c8
    str r0, [r4, #0x20]
jump_15c8:
    mov r0, r4
    bl call_1cc0
    b jump_1598
jump_15d0:
    movs r2, #0
    mov r1, r2
    mov r0, r2
    bl usb_copy_send
    b jump_1598
jump_15dc:
    movs r2, #0x40
    movs r0, #0
    ldr r1, [r4, #0x1c]
    bl call_1894
    ldr r1, [r4, #0x1c]
    add r1, r0
    str r1, [r4, #0x1c]
    ldr r1, [r4, #0x20]
    subs r0, r1, r0
    str r0, [r4, #0x20]
    bne jump_1604
    movs r0, #1
    strb.w r0, [r4, #0x24]
    ldr r1, [r4, #0x28]
    cbz r1, jump_1604
    ldr r0, [r4, #0x2c]
    blx r1
    str r7, [r4, #0x28]
jump_1604:
    lsls r0, r5, #0x1b
    bpl jump_1616
    mov r0, r4
    bl call_1cc0
    movs r1, #0x10
    movs r0, #0
    bl call_17a4
jump_1616:
    mov r0, r6
    bl call_16e0
    b jump_1646
jump_161e:
    mov r0, r5
    bl call_1814
    tst.w r0, #0x12
    beq jump_1646
    movs r1, #0x12
    mov r0, r5
    bl call_17a4
    lsl.w r0, r6, r5
    bl call_16e0
    add.w r0, r4, r5, lsl #2
    ldr r1, [r0, #0x64]
    cbz r1, jump_1646
    mov r0, r5
    blx r1
jump_1646:
    bl call_196c
    bl call_194c
    mov r5, r0
    .short 0x1c40 /* adds r0, r0, #1 */ 
    bne jump_161e
    pop.w {r4, r5, r6, r7, r8, pc}
call_1658:
    add.w r0, r0, #0x30
    movs r1, #2
    strb r1, [r0, #2]
    ldr r0, [r0, #0x54]
    b.w jump_197c
call_1666:
    ldrb.w r0, [r0, #0x32]
    cmp r0, #3
    beq jump_1672
    movs r0, #0
    bx lr
jump_1672:
    movs r0, #1
    bx lr
call_1676:
    push {r4, lr}
    add.w r4, r0, #0x30
    ldrb r0, [r4, #4]
    ubfx r1, r0, #0, #1
    ldr r0, [r4, #0x54]
    bl call_19a0
    ldrb r0, [r4, #2]
    sub.w r4, r4, #0x30
    cmp r0, #3
    bne jump_169e
    ldr.w r1, [r4, #0x88]
    cbz r1, jump_169e
    ldr.w r0, [r4, #0x8c]
    blx r1
jump_169e:
    ldr r1, [r4, #0x3c]
    cmp r1, #0
    beq jump_16b4
    ldrb.w r0, [r4, #0x32]
    cmp r0, #6
    bne jump_16b4
    ldr r0, [r4, #0x40]
    pop.w {r4, lr}
    bx r1
jump_16b4:
    pop {r4, pc}
call_16b6:
    push {r4, lr}
    bl usb_clear_csr
    pop.w {r4, lr}
    b.w jump_1a68
call_16c4:
    ldr r1, [pc, #0x10] /* data_16d8 */ 
    str r1, [r0]
    adds r1, #0x14
    str r1, [r0, #4]
    ldr r1, [pc, #0xc] /* data_16dc */ 
    str r1, [r0, #8]
    movs r1, #4
    str r1, [r0, #0xc]
    bx lr

.byte 0x0
.byte 0x0

data_16d8:
.word 0x20f0
data_16dc:
.word 0x20000038

call_16e0:
    ldr r1, [pc, #4] /* data_16e8 */ 
    str r0, [r1, #8]
    bx lr

.byte 0x0
.byte 0x0

data_16e8:
.word 0x400a8000

usb_init:
    push {r4, lr}
    movs r1, #1
    movs r0, #0x40
    bl call_3d0
    movs r1, #1
    lsls r0, r1, #0xa
    bl ckcu_ahb_clock_enable
    movs r0, #2
    bl call_3e8
    ldr r1, [pc, #0x30] /* data_1738 */ 
    sub.w r0, r1, #0xc
    str r1, [r0]
    ldr r1, [pc, #0x2c] /* data_173c */ 
    str r1, [r0, #4]
    subs r0, #0x7c
    bl call_16c4
    ldr r0, [pc, #0x20] /* data_1738 */ 
    subs r0, #0x54
    bl ptr_write_func_ptrs
    ldr r0, [pc, #0x18] /* data_1738 */ 
    subs r0, #0x90
    bl call_1658
    ldr r1, [pc, #0x18] /* data_1740 */ 
    mov.w r0, #0x200000
    str.w r0, [r1, #0x100]
    pop.w {r4, lr}
    b.w jump_310

data_1738:
.word 0x20000148
data_173c:
.word 0x104d
data_1740:
.word 0xe000e004

call_1744:
    ldr r1, [pc, #0x14] /* data_175c */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_1754
    bic r0, r0, #0x800
jump_1750:
    str r0, [r1]
    bx lr
jump_1754:
    orr r0, r0, #0x800
    b jump_1750

.byte 0x0
.byte 0x0

data_175c:
.word 0x400a8000

usb_dp_pull_up:
    ldr r1, [pc, #0x14] /* data_1778 */ 
    cmp r0, #1
    ldr r0, [r1]
    beq jump_1770
    bic r0, r0, #0x400
jump_176c:
    str r0, [r1]
    bx lr
jump_1770:
    orr r0, r0, #0x400
    b jump_176c

.byte 0x0
.byte 0x0

data_1778:
.word 0x400a8000

call_177c:
    movs r1, #1
    movs r0, #0x20
    b.w jump_b94
call_1784:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #9
    str r1, [r0]
    pop {r4, pc}
call_1794:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #0x24
    str r1, [r0]
    pop {r4, pc}
call_17a4:
    push {r4, lr}
    mov r4, r1
    bl usb_get_ep_reg
    str r4, [r0, #8]
    pop {r4, pc}
usb_get_ep_buff:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r0, [r0, #0x10]
    ldr r1, [pc, #8] /* data_17c4 */ 
    ubfx r0, r0, #0, #0xa
    add r0, r1
    pop {r4, pc}

.byte 0x0
.byte 0x0

data_17c4:
.word 0x400aa000

call_17c8:
    push {r4, r5, r6, lr}
    mov r5, r0
    bl usb_get_ep_reg
    mov r4, r0
    mov r0, r5
    bl usb_get_ep_len
    ldr r1, [r4, #0x10]
    ubfx r1, r1, #0, #0xa
    add r0, r1
    ldr r1, [pc, #4] /* data_17e8 */ 
    add r0, r1
    pop {r4, r5, r6, pc}

.byte 0x0
.byte 0x0

data_17e8:
.word 0x400aa000

usb_get_ep_len:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r0, [r0, #0x10]
    ubfx r0, r0, #0xa, #0xa
    pop {r4, pc}
call_17fa:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0, #0x10]
    ldr r0, [r0]
    lsls r1, r1, #3
    bpl jump_180e
    ubfx r0, r0, #2, #1
    pop {r4, pc}
jump_180e:
    ubfx r0, r0, #5, #1
    pop {r4, pc}
call_1814:
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
call_1834:
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
    b.w jump_18c4
call_185a:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r6, r2
    movs r5, r0
    beq jump_188a
    movs r1, #0
jump_1868:
    bl usb_get_ep_tcnt
    mov r4, r0
    cmp r0, r6
    bhi jump_1884
    mov r0, r5
    cbz r5, jump_188e
    bl usb_get_ep_buff
jump_187a:
    adds r1, r4, #3
    lsrs r2, r1, #2
    mov r1, r7
    bl call_1ea0
jump_1884:
    mov r0, r4
    pop.w {r4, r5, r6, r7, r8, pc}
jump_188a:
    movs r1, #0x10
    b jump_1868
jump_188e:
    bl call_17c8
    b jump_187a
call_1894:
    push.w {r4, r5, r6, r7, r8, lr}
    mov r7, r1
    mov r5, r2
    mov r6, r0
    bl usb_get_ep_reg
    mov r4, r0
    movs r0, #0
    cbz r5, jump_18b8
    mov r2, r5
    mov r1, r7
    mov r0, r6
    bl call_185a
    cbnz r0, jump_18b8
    cmp r5, #0
    bne jump_18c0
jump_18b8:
    ldr r1, [r4]
    and r1, r1, #0x10
    str r1, [r4]
jump_18c0:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_18c4:
    push {r4, lr}
    bl usb_get_ep_reg
    ldr r1, [r0]
    and r1, r1, #0x19
    str r1, [r0]
    pop {r4, pc}
call_18d4:
    push {r4, lr}
    bl usb_get_ep_reg
    movs r1, #4
    str r1, [r0]
    pop {r4, pc}
call_18e0:
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
    mov r8, r1
    mov r4, r2
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
    bhi jump_191a
    cbz r0, jump_1920
jump_191a:
    movs r0, #0
jump_191c:
    pop.w {r4, r5, r6, r7, r8, pc}
jump_1920:
    mov r0, r7
    bl usb_get_ep_buff
    mov r1, r0
    adds r0, r4, #3
    lsrs r2, r0, #2
    mov r0, r8
    bl call_1ea0
    str r4, [r5, #0xc]
    movs r0, #2
    str r0, [r5]
    mov r0, r4
    b jump_191c
call_193c:
    ldr r1, [pc, #8] /* data_1948 */ 
    ldr r2, [r1, #4]
    orrs r2, r0
    str r2, [r1, #4]
    bx lr

.byte 0x0
.byte 0x0

data_1948:
.word 0x400a8000

call_194c:
    mov r3, r0
    movs r1, #7
jump_1950:
    add.w r2, r1, #8
    lsr.w r0, r3, r2
    lsls r0, r0, #0x1f
    beq jump_1960
    sxtb r0, r1
    bx lr
jump_1960:
    .short 0x1e49 /* subs r1, r1, #1 */ 
    cmp r1, #0
    bgt jump_1950
    mov.w r0, #-1
    bx lr
call_196c:
    ldr r0, [pc, #8] /* data_1978 */ 
    ldr r1, [r0, #4]
    ldr r0, [r0, #8]
    ands r0, r1
    bx lr

.byte 0x0
.byte 0x0

data_1978:
.word 0x400a8000

jump_197c:
    b.w jump_1a14
call_1980:
    ldr r0, [pc, #8] /* data_198c */ 
    ldr r1, [r0]
    orr r1, r1, #0xc
    str r1, [r0]
    bx lr

data_198c:
.word 0x400a8000

usb_clear_csr:
    ldr r0, [pc, #8] /* data_199c */ 
    ldr r1, [r0]
    and r1, r1, #0x400
    str r1, [r0]
    bx lr

data_199c:
.word 0x400a8000

call_19a0:
    push {r4, lr}
    mov r4, r0
    ldr r0, [pc, #0x64] /* data_1a0c */ 
    ldr r2, [r0]
    cmp r2, #1
    bne jump_1a0a
    movs r2, #0
    str r2, [r0]
    ldr r0, [pc, #0x5c] /* data_1a10 */ 
    ldr r2, [r0]
    lsls r3, r2, #0x19
    mov.w r2, #-1
    bpl jump_19d6
    movw r3, #0x40c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_19cc
    movs r0, #0
    bl call_b50
jump_19cc:
    ldr r0, [r4]
    pop.w {r4, lr}
    b.w call_193c
jump_19d6:
    movw r3, #0xc0c
    str r3, [r0]
    str r2, [r0, #8]
    cbnz r1, jump_19e6
    movs r0, #0
    bl call_b50
jump_19e6:
    movs r0, #0
    bl call_1744
    ldr r0, [r4]
    bl call_193c
    movs r0, #0
    bl usb_dp_pull_up
    movs r0, #0
jump_19fa:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    cmp r0, #0xc8
    blo jump_19fa
    pop.w {r4, lr}
    movs r0, #1
    b.w usb_dp_pull_up
jump_1a0a:
    pop {r4, pc}

data_1a0c:
.word 0x200000b4
data_1a10:
.word 0x400a8000

jump_1a14:
    movw r1, #0x171d
    str r1, [r0]
    ldr r1, [pc, #0x28] /* data_1a44 */ 
    str r1, [r0, #4]
    movw r1, #0x212
    str r1, [r0, #8]
    ldr r1, [pc, #0x20] /* data_1a48 */ 
    str r1, [r0, #0xc]
    ldr r2, [pc, #0x20] /* data_1a4c */ 
    movs r1, #0x10
    strd r1, r2, [r0, #0x10]
    str r1, [r0, #0x18]
    ldr r1, [pc, #0x1c] /* data_1a50 */ 
    str r1, [r0, #0x1c]
    movs r1, #0
    str r1, [r0, #0x20]
    ldr r1, [pc, #0x18] /* data_1a54 */ 
    str r1, [r0, #0x24]
    movs r1, #2
    str r1, [r0, #0x28]
    bx lr

data_1a44:
.word 0x80010008
data_1a48:
.word 0x91002088
data_1a4c:
.word 0x92010090
data_1a50:
.word 0x930100d0
data_1a54:
.word 0x84010110

call_1a58:
    ldr r1, [pc, #8] /* data_1a64 */ 
    ldr r2, [r1]
    str r2, [r0]
    ldr r1, [r1, #4]
    str r1, [r0, #4]
    bx lr

data_1a64:
.word 0x400aa000

jump_1a68:
    ldr r0, [pc, #8] /* data_1a74 */ 
    ldr r1, [r0]
    orr r1, r1, #0x20
    str r1, [r0]
    bx lr

data_1a74:
.word 0x400a8000

call_1a78:
    ldr r1, [pc, #0xc] /* data_1a88 */ 
    ldr r2, [r1]
    orr r2, r2, #0x100
    str r2, [r1]
    str r0, [r1, #0x10]
    bx lr

.byte 0x0
.byte 0x0

data_1a88:
.word 0x400a8000

usb_intr:
    ldr r0, [pc, #4] /* data_1a94 */ 
    b.w usb_entry

.byte 0x0
.byte 0x0

data_1a94:
.word 0x200000b8

.thumb_func
call_1a98:
    ldr r1, [pc, #0x4c] /* data_1ae8 */ 
    ldr r0, [pc, #0x48] /* data_1ae4 */ 
    ldr r2, [r1, #0x30]
    orr r2, r2, #0x10
    str r2, [r1, #0x30]
    ldr r1, [pc, #0x44] /* data_1aec */ 
    ldr r2, [r1, #4]
    ubfx r2, r2, #0, #0xc
    orr r2, r2, #0x1a000
    b jump_1aba
jump_1ab2:
    str r2, [r1, #4]
    ldr r3, [r1, #4]
    lsls r3, r3, #0xf
    bmi jump_1abe
jump_1aba:
    .short 0x1e40 /* subs r0, r0, #1 */ 
    bhs jump_1ab2
jump_1abe:
    ldr r0, [r1, #8]
    ubfx r0, r0, #0, #0xc
    orr r0, r0, #0x5000
    str r0, [r1, #8]
    ldr r0, [r1, #4]
    and r0, r0, #0x1f000
    orr r0, r0, #0x7d0
    str r0, [r1, #4]
    ldr r0, [pc, #0x18] /* data_1af0 */ 
    str r0, [r1]
    movw r0, #0xca35
    str r0, [r1, #0x10]
    bx lr

.byte 0x0
.byte 0x0

data_1ae4:
.word 0x6ddd00
data_1ae8:
.word 0x40088000
data_1aec:
.word 0x40068000
data_1af0:
.word 0x5fa00001

watchdog_reload_timer:
    ldr r1, [pc, #8] /* data_1b00 */ 
    ldr r0, [pc, #4] /* data_1afc */ 
    str r0, [r1]
    bx lr

data_1afc:
.word 0x5fa00001
data_1b00:
.word 0x40068000

flash_crc_cmd:
    push {r4, lr}
    bl crc16
    mov r4, r0
    mov r1, r0
    ldr r0, [pc, #0x10] /* data_1b20 */ 
    bl function_14
    lsrs r1, r4, #8
    ldr r0, [pc, #8] /* data_1b20 */ 
    bl function_14
    movs r0, #0x4f
    pop {r4, pc}

data_1b20:
.word 0x200001bc

flash_erase_cmd:
    push.w {r4, r5, r6, r7, r8, sb, sl, lr}
    mov r6, r2
    cmp r0, #0xa
    beq jump_1b34
    cmp.w r1, #0x2800
    bhs jump_1b3a
jump_1b34:
    movs r0, #0x46
jump_1b36:
    pop.w {r4, r5, r6, r7, r8, sb, sl, pc}
jump_1b3a:
    movs r5, #0
    mov r4, r1
    subs r7, r5, #1
    ldr.w r8, [pc, #0x2c] /* data_1b70 */ 
    mov.w sb, #0x1e
    b jump_1b68
jump_1b4a:
    mov r0, r4
    bl flash_page_erase
    udiv r1, r5, sb
    mls r0, sb, r1, r5
    str.w r7, [r8, #4]
    cbnz r0, jump_1b62
    bl watchdog_reload_timer
jump_1b62:
    add.w r4, r4, #0x400
    .short 0x1c6d /* adds r5, r5, #1 */ 
jump_1b68:
    cmp r4, r6
    bls jump_1b4a
    movs r0, #0x4f
    b jump_1b36

data_1b70:
.word 0x20000048

disconnect_cmd:
    bl usb_disable_dppu
jump_1b78:
    b jump_1b78

.byte 0x0
.byte 0x0

flash_read_write_cmd:
    push.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, lr}
    mov.w r7, #0
    ldr r5, [pc, #0x100] /* data_1c88 */ 
    ldr.w fp, [pc, #0x104] /* data_1c8c */ 
    movs.w r8, r0
    mov r4, r1
    mov sb, r2
    mov r6, r7
    mov sl, r7
    bne jump_1bb6
    ldr r1, [pc, #0xf4] /* data_1c90 */ 
    ldrb r0, [r1]
    cbnz r0, jump_1ba6
    subs r0, r7, #1
    str r0, [r1, #4]
    movs r0, #1
    strb r0, [r1]
jump_1ba6:
    ldr r0, [r1, #4]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    str r0, [r1, #4]
    subs r0, #0xa
    cmp r0, #0x5a
    bhi jump_1bb6
    bl firmware_decrypt
jump_1bb6:
    bl flash_get_protection_status
    lsls r0, r0, #0x1f
    bne jump_1bc2
    mov.w sl, #1
jump_1bc2:
    cmp.w r8, #1
    bne jump_1c7e
    cmp.w sl, #1
    bne jump_1be8
    sub.w r0, sb, r4
    .short 0x1c40 /* adds r0, r0, #1 */ 
    b jump_1bde
jump_1bd6:
    ldr r1, [r4, r7]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    bne jump_1c40
    .short 0x1d3f /* adds r7, r7, #4 */ 
jump_1bde:
    cmp r0, r7
    bhi jump_1bd6
    cmp.w r8, #1
    bne jump_1c7e
jump_1be8:
    ldr r1, [pc, #0xa4] /* data_1c90 */ 
    movs r0, #0
    strb r0, [r1]
    ldr r0, [r1, #4]
    .short 0x1c40 /* adds r0, r0, #1 */ 
    str r0, [r1, #4]
    subs r0, #0xa
    cmp r0, #0x5a
    bhi jump_1c0e
    bl firmware_decrypt
    b jump_1c0e
jump_1c00:
    mov r1, r4
    movs r0, #4
    ldr r2, [r5]
    bl flash_write
    .short 0x1d24 /* adds r4, r4, #4 */ 
    .short 0x1d2d /* adds r5, r5, #4 */ 
jump_1c0e:
    cmp r4, sb
    bls jump_1c00
    b jump_1c7e
jump_1c14:
    ldr r0, [pc, #0x7c] /* data_1c94 */ 
    cmp r4, r0
    bls jump_1c1e
    movs r0, #0
    b jump_1c20
jump_1c1e:
    ldr r0, [r4]
jump_1c20:
    cmp.w r8, #0
    beq jump_1c34
    cmp.w r8, #3
    beq jump_1c3c
    cmp.w sl, #1
    beq jump_1c46
    b jump_1c5a
jump_1c34:
    ldr r1, [r5]
    cmp r1, r0
    bne jump_1c40
    b jump_1c7a
jump_1c3c:
    .short 0x1c40 /* adds r0, r0, #1 */ 
    beq jump_1c7a
jump_1c40:
    movs r0, #0x46
jump_1c42:
    pop.w {r4, r5, r6, r7, r8, sb, sl, fp, ip, pc}
jump_1c46:
    sub.w r1, r4, #0x2800
    cmp.w r1, #0x400
    blo jump_1c5a
    ldr r1, [pc, #0x44] /* data_1c98 */ 
    add r1, r4
    cmp r1, #0x50
    blo jump_1c5a
    movs r0, #0
jump_1c5a:
    str.w r0, [fp, r6, lsl #2]
    .short 0x1c76 /* adds r6, r6, #1 */ 
    cmp r6, #0x10
    bne jump_1c7a
    ldr r0, [pc, #0x34] /* data_1c9c */ 
    movs r6, #0
    movs r1, #0x10
    str r1, [r0, #0x58]
    movs r1, #0x40
    str r1, [r0, #0x5c]
    movs r1, #2
    str r1, [r0, #0x50]
jump_1c74:
    ldr r1, [r0, #0x58]
    lsls r1, r1, #0x1b
    bpl jump_1c74
jump_1c7a:
    .short 0x1d24 /* adds r4, r4, #4 */ 
    .short 0x1d2d /* adds r5, r5, #4 */ 
jump_1c7e:
    cmp r4, sb
    bls jump_1c14
    movs r0, #0x4f
    b jump_1c42

.byte 0x0
.byte 0x0

data_1c88:
.word 0x2000063c
data_1c8c:
.word 0x400aa0d0
data_1c90:
.word 0x20000048
data_1c94:
.word 0x1ff003fc
data_1c98:
.word 0xe0100000
data_1c9c:
.word 0x400a8000

function_e_77:
    push {r4, lr}
    movs r2, #0x40
    ldr r1, [pc, #0x10] /* data_1cb8 */ 
    movs r0, #3
    bl usb_copy_send
    ldr r1, [pc, #0xc] /* data_1cbc */ 
    mov.w r0, #-1
    str r0, [r1, #4]
    movs r0, #0x4f
    pop {r4, pc}

data_1cb8:
.word 0x20000620
data_1cbc:
.word 0x20000048

call_1cc0:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r0, #0
    bl usb_get_ep_len
    mov r5, r0
    ldr r0, [r4, #0x20]
    adds r1, r0, #1
    beq jump_1d00
    ldrb.w r1, [r4, #0x24]
    cmp r1, #1
    bne jump_1d00
    cmp r0, r5
    blo jump_1ce4
    subs r0, r0, r5
    str r0, [r4, #0x20]
    b jump_1cf0
jump_1ce4:
    mov r5, r0
    movs r0, #0
    str r0, [r4, #0x20]
    movs r0, #2
    strb.w r0, [r4, #0x24]
jump_1cf0:
    mov r2, r5
    movs r0, #0
    ldr r1, [r4, #0x1c]
    bl usb_copy_send
    ldr r0, [r4, #0x1c]
    add r0, r5
    str r0, [r4, #0x1c]
jump_1d00:
    pop {r4, r5, r6, pc}
jump_1d02:
    push {r4, lr}
    mov r4, r0
    movs r0, #0
    strb r0, [r4, #0x19]
    cbz r1, jump_1d20
    cmp r1, #1
    beq jump_1d24
    cmp r1, #2
    bne jump_1d36
    ldrh r0, [r4, #4]
    and r0, r0, #0xf
    bl call_17fa
    b jump_1d24
jump_1d20:
    ldrb.w r0, [r4, #0x34]
jump_1d24:
    strb r0, [r4, #0x18]
    add.w r0, r4, #0x18
    str r0, [r4, #0x1c]
    movs r0, #2
    str r0, [r4, #0x20]
    movs r0, #1
    strb.w r0, [r4, #0x24]
jump_1d36:
    pop {r4, pc}
call_1d38:
    push {r4, r5, r6, lr}
    mov r4, r0
    ldrh r0, [r0]
    movs r5, #1
    cmp.w r0, #0x500
    beq jump_1de2
    bgt jump_1d8a
    cmp.w r0, #0x100
    beq jump_1dd4
    bgt jump_1d68
    cmp r0, #0x80
    beq jump_1dcc
    cmp r0, #0x81
    beq jump_1dd0
    cmp r0, #0x82
    bne jump_1e26
    movs r1, #2
jump_1d5e:
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    b.w jump_1d02
jump_1d68:
    cmp.w r0, #0x102
    beq jump_1dd8
    cmp.w r0, #0x300
    beq jump_1ddc
    sub.w r0, r0, #0x300
    subs r0, #2
    bne jump_1e26
    movs r2, #1
jump_1d7e:
    movs r1, #2
jump_1d80:
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    b.w jump_1e54
jump_1d8a:
    cmp.w r0, #0x900
    beq jump_1e2c
    bgt jump_1db2
    cmp.w r0, #0x680
    beq jump_1df0
    sub.w r0, r0, #0x600
    subs r0, #0x81
    beq jump_1e28
    sub.w r0, r0, #0x100
    subs r0, #0xff
    bne jump_1e26
    add.w r0, r4, #0x30
    strd r0, r5, [r4, #0x1c]
    b jump_1e22
jump_1db2:
    sub.w r0, r0, #0xa00
    subs r0, #0x81
    beq jump_1e50
    cmp r0, #0x80
    bne jump_1e26
    ldr r1, [r4, #0x58]
jump_1dc0:
    cmp r1, #0
    beq jump_1e26
    mov r0, r4
    pop.w {r4, r5, r6, lr}
    bx r1
jump_1dcc:
    movs r1, #0
    b jump_1d5e
jump_1dd0:
    movs r1, #1
    b jump_1d5e
jump_1dd4:
    movs r2, #0
    b jump_1dde
jump_1dd8:
    movs r2, #0
    b jump_1d7e
jump_1ddc:
    movs r2, #1
jump_1dde:
    movs r1, #0
    b jump_1d80
jump_1de2:
    ldrb r0, [r4, #2]
    bl call_1a78
    strb.w r5, [r4, #0x24]
    movs r0, #5
    b jump_1e4a
jump_1df0:
    ldrb r0, [r4, #3]
    cmp r0, #1
    beq jump_1e16
    cmp r0, #2
    beq jump_1e1a
    cmp r0, #3
    bne jump_1e26
    ldrb r0, [r4, #2]
    ldr r1, [r4, #0x14]
    cmp r1, r0
    bls jump_1e26
    ldr r1, [r4, #0x10]
    ldr.w r0, [r1, r0, lsl #2]
    cmp r0, #0
    beq jump_1e26
jump_1e10:
    str r0, [r4, #0x1c]
    ldrb r0, [r0]
    b jump_1e20
jump_1e16:
    ldr r0, [r4, #8]
    b jump_1e10
jump_1e1a:
    ldr r0, [r4, #0xc]
    str r0, [r4, #0x1c]
    ldrh r0, [r0, #2]
jump_1e20:
    str r0, [r4, #0x20]
jump_1e22:
    strb.w r5, [r4, #0x24]
jump_1e26:
    pop {r4, r5, r6, pc}
jump_1e28:
    ldr r1, [r4, #0x54]
    b jump_1dc0
jump_1e2c:
    ldrb r0, [r4, #2]
    strb.w r0, [r4, #0x30]
    strb.w r5, [r4, #0x24]
    movs r5, #1
jump_1e38:
    sxtb r0, r5
    ldr.w r1, [r4, #0x84]
    bl call_1834
    .short 0x1c6d /* adds r5, r5, #1 */ 
    cmp r5, #8
    blo jump_1e38
    movs r0, #6
jump_1e4a:
    strb.w r0, [r4, #0x32]
    pop {r4, r5, r6, pc}
jump_1e50:
    ldr r1, [r4, #0x5c]
    b jump_1dc0
jump_1e54:
    push {r4, r5, r6, lr}
    mov r4, r0
    movs r6, #1
    cbz r1, jump_1e76
    cmp r1, #2
    bne jump_1e74
    ldrh r0, [r4, #4]
    ands r5, r0, #0xf
    beq jump_1e70
    cbz r2, jump_1e8c
    mov r0, r5
    bl call_18e0
jump_1e70:
    strb.w r6, [r4, #0x24]
jump_1e74:
    pop {r4, r5, r6, pc}
jump_1e76:
    ldrb r0, [r4, #2]
    cmp r0, #1
    bne jump_1e74
    add.w r4, r4, #0x24
    ldrb r0, [r4, #0x10]
    bfi r0, r2, #1, #1
    strb r0, [r4, #0x10]
    strb r6, [r4]
    pop {r4, r5, r6, pc}
jump_1e8c:
    ldr r0, [r4, #0x38]
    cmp r0, #0
    bne jump_1e70
    mov r0, r5
    bl call_1794
    sxtb r0, r5
    bl call_1784
    b jump_1e70
call_1ea0:
    .short 0x1e52 /* subs r2, r2, #1 */ 
    bmi jump_1eae
    ldr.w r3, [r0, r2, lsl #2]
    str.w r3, [r1, r2, lsl #2]
    b call_1ea0
jump_1eae:
    bx lr
usb_get_ep_reg:
    ldr r1, [pc, #8] /* data_1ebc */ 
    add.w r0, r0, r0, lsl #2
    add.w r0, r1, r0, lsl #2
    bx lr

data_1ebc:
.word 0x400a8014

.byte 0x2
.byte 0xe0
.byte 0x8
.byte 0xc8
.byte 0x12
.byte 0x1f
.byte 0x8
.byte 0xc1
.byte 0x0
.byte 0x2a
.byte 0xfa
.byte 0xd1
.byte 0x70
.byte 0x47
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x20
.byte 0x1
.byte 0xe0
.byte 0x1
.byte 0xc1
.byte 0x12
.byte 0x1f
.byte 0x0
.byte 0x2a
.byte 0xfb
.byte 0xd1
.byte 0x70
.byte 0x47
.byte 0x0
.byte 0x0

.thumb_func
main:
    ldr r0, [pc, #0x9c] /* data_1f80 */ 
    ldr r0, [r0]
    ldr r1, [pc, #0x9c] /* data_1f84 */ 
    cmp r0, r1
    beq jump_1f0a
    bl check_ver_str
    cmp r0, #1
    bne jump_1f0a
    bl call_7e8
    cmp r0, #1
    bne jump_1f0a
    movs r1, #1
    movs r0, #0x10
    bl ckcu_set_wtf
    mov.w r0, #0x2c00
    bl load_jump_fw
jump_1f0a:
    bl setup_afio_gpio
    bl function_b_1
    movs r0, #1
    bl function_b_2
    bl function_b_3
    bl usb_init
    movs r7, #0
    ldr r5, [pc, #0x64] /* data_1f88 */ 
    ldr r4, [pc, #0x64] /* data_1f8c */ 
    movs r6, #1
jump_1f28:
    ldr r0, [r4, #4]
    cbnz r0, jump_1f3c
    ldrb.w r0, [r5, #0x32]
    cmp r0, #6
    bne jump_1f72
    movs r0, #0
    str r6, [r4, #4]
    bl function_b_2
jump_1f3c:
    ldr r0, [r4, #4]
    cmp r0, #1
    bne jump_1f72
    ldr r0, [r4, #0xc]
    cbz r0, jump_1f50
    str r7, [r4, #0xc]
    movs r0, #1
    str r7, [r4, #8]
    bl function_b_2
jump_1f50:
    ldr r0, [r4, #8]
    cbnz r0, jump_1f68
    ldr r0, [r4, #0xc]
    cbnz r0, jump_1f72
    ldrb.w r0, [r5, #0x32]
    cmp r0, #6
    bne jump_1f72
    movs r0, #0
    str r6, [r4, #8]
    bl function_b_2
jump_1f68:
    ldr r0, [r4, #8]
    cmp r0, #1
    bne jump_1f72
    bl call_a9c
jump_1f72:
    ldr r0, [pc, #0x14] /* data_1f88 */ 
    bl call_1676
    bl watchdog_reload_timer
    b jump_1f28

.byte 0x0
.byte 0x0

data_1f80:
.word 0x40080304
data_1f84:
.word 0x55aafaf5
data_1f88:
.word 0x200000b8
data_1f8c:
.word 0x20000000

firmware_decrypt:
    push {r4, r5, r6, lr}
    ldr r0, [pc, #0x84] /* data_2018 */ 
    ldr r2, [pc, #0x84] /* data_201c */ 
    mov r4, r0
    movs r1, #0
jump_1f9a:
    ldr r3, [r0]
    ldr.w r5, [r2, r1, lsl #2]
    .short 0x1c49 /* adds r1, r1, #1 */ 
    eors r3, r5
    stm r0!, {r3}
    cmp r1, #0xd
    bls jump_1f9a
    ldr r0, [pc, #0x74] /* data_2020 */ 
    movs r5, #0
    ldr r0, [r0, #4]
    and r6, r0, #7
jump_1fb4:
    ldr r3, [r4]
    cmp r6, #8
    uxtb r1, r3
    and r2, r3, #0xff00
    and r0, r3, #0xff0000
    and r3, r3, #0xff000000
    bhs switch_2008
    tbb [pc, r6]

.byte 0x1e
.byte 0x4
.byte 0x8
.byte 0xc
.byte 0x10
.byte 0x14
.byte 0x17
.byte 0x1c

switch_1fd4:
    lsls r1, r1, #0x18
    lsrs r2, r2, #8
switch_1fd8:
    lsrs r0, r0, #8
    b switch_1fe0
switch_1fdc:
    lsls r1, r1, #0x18
switch_1fde:
    lsrs r0, r0, #0x10
switch_1fe0:
    lsrs r3, r3, #8
    b switch_2008
switch_1fe4:
    lsls r1, r1, #0x18
    lsls r2, r2, #8
    lsrs r0, r0, #8
    b switch_1ff0
switch_1fec:
    lsls r1, r1, #0x10
    lsls r0, r0, #8
switch_1ff0:
    lsrs r3, r3, #0x18
    b switch_2008
switch_1ff4:
    lsls r1, r1, #0x10
    lsrs r2, r2, #8
    b jump_2006
switch_1ffa:
    lsls r1, r1, #0x18
    lsls r2, r2, #8
    lsrs r0, r0, #0x10
    lsrs r3, r3, #0x10
    b switch_2008
switch_2004:
    lsls r2, r2, #8
jump_2006:
    lsrs r0, r0, #8
switch_2008:
    orrs r1, r2
    orrs r1, r0
    orrs r1, r3
    stm r4!, {r1}
    .short 0x1c6d /* adds r5, r5, #1 */ 
    cmp r5, #0xd
    bls jump_1fb4
    pop {r4, r5, r6, pc}

data_2018:
.word 0x2000063c
data_201c:
.word 0x2188
data_2020:
.word 0x20000048

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
.byte 0x0
.byte 0x0
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
.byte 0x41
.byte 0x11
.byte 0x1
.byte 0x1
.byte 0x0
.byte 0x2
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0

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
.byte 0x65
.byte 0x0

usb_endpoint2_desc:
.byte 0x7
.byte 0x5
.byte 0x82
.byte 0x3
.byte 0x40
.byte 0x0
.byte 0x1
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

xor_key:
.byte 0xaa
.byte 0x55
.byte 0xaa
.byte 0x55
.byte 0x55
.byte 0xaa
.byte 0x55
.byte 0xaa
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xff
.byte 0xf
.byte 0xf
.byte 0xf
.byte 0xf
.byte 0xf0
.byte 0xf0
.byte 0xf0
.byte 0xf0
.byte 0xaa
.byte 0xaa
.byte 0xaa
.byte 0xaa
.byte 0x55
.byte 0x55
.byte 0x55
.byte 0x55
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0

update_handlers:
.byte 0x25
.byte 0x1b
.byte 0x0
.byte 0x0
.byte 0x7d
.byte 0x1b
.byte 0x0
.byte 0x0
.byte 0x5
.byte 0x1b
.byte 0x0
.byte 0x0
.byte 0xa1
.byte 0x1c
.byte 0x0
.byte 0x0
.byte 0x41
.byte 0x7
.byte 0x0
.byte 0x0
.byte 0x75
.byte 0x1b
.byte 0x0
.byte 0x0
.byte 0x35
.byte 0x1e
.byte 0x1f
.byte 0x20
.byte 0x21
.byte 0x22
.byte 0x23
.byte 0x24
.byte 0x25
.byte 0x26
.byte 0x27
.byte 0x2d
.byte 0x2e
.byte 0x2a
.byte 0x18
.byte 0xc
.byte 0x12
.byte 0x13
.byte 0x2f
.byte 0x30
.byte 0xd
.byte 0xe
.byte 0xf
.byte 0x33
.byte 0x34
.byte 0x1d
.byte 0x11
.byte 0x36
.byte 0x37
.byte 0x38
.byte 0xb
.byte 0x29
.byte 0x29
.byte 0x3a
.byte 0x3b
.byte 0x3c
.byte 0x3d
.byte 0x3e
.byte 0x3f
.byte 0x40
.byte 0x41
.byte 0x42
.byte 0x43
.byte 0x44
.byte 0x45
.byte 0x4c
.byte 0x4b
.byte 0x52
.byte 0x4e
.byte 0x46
.byte 0x47
.byte 0x48
.byte 0x50
.byte 0x51
.byte 0x4f
.byte 0x49
.byte 0x4c
.byte 0x65
.byte 0x4d
.byte 0xf5
.byte 0xf6
.byte 0xf4
.byte 0x4a
.byte 0x35
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
.byte 0xce
.byte 0xcd
.byte 0xcc
.byte 0xe6
.byte 0xe7
.byte 0x65
.byte 0xcb
.byte 0xe4
.byte 0x20
.byte 0x10
.byte 0x40
.byte 0x80
.byte 0x1
.byte 0x2
.byte 0x4
.byte 0x8

data_9:
.byte 0x0
.byte 0x60
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
.byte 0x0
.byte 0x8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x80
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb
.byte 0x40
.byte 0x2
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
.byte 0x10
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
.byte 0x40
.byte 0xb
.byte 0x40
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0

task_1:
.byte 0xcc
.byte 0x22
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0xb8
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0xc0
.byte 0x1e
.byte 0x0
.byte 0x0

task_2:
.byte 0x84
.byte 0x23
.byte 0x0
.byte 0x0
.byte 0xb8
.byte 0x0
.byte 0x0
.byte 0x20
.byte 0x20
.byte 0xe
.byte 0x0
.byte 0x0
.byte 0xd0
.byte 0x1e
.byte 0x0
.byte 0x0

sram_init_data:
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
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
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
.byte 0x60
.byte 0x21
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x64
.byte 0x21
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
.byte 0xff
.byte 0xff
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
.byte 0x90
.byte 0xd0
.byte 0x2
.byte 0x40
.byte 0x90
.byte 0xf0
.byte 0x6
.byte 0x40
.byte 0x94
.byte 0xf0
.byte 0x6
.byte 0x40
.byte 0x98
.byte 0xf0
.byte 0x6
.byte 0x40
.byte 0x9c
.byte 0xe0
.byte 0x6
.byte 0x40
.byte 0x90
.byte 0xe0
.byte 0x6
.byte 0x40
.byte 0x94
.byte 0xe0
.byte 0x6
.byte 0x40
.byte 0x98
.byte 0xe0
.byte 0x6
.byte 0x40
.byte 0x9c
.byte 0xc0
.byte 0x2
.byte 0x40
.byte 0x98
.byte 0xc0
.byte 0x2
.byte 0x40
.byte 0x9c
.byte 0xf0
.byte 0x6
.byte 0x40
.byte 0x94
.byte 0xd0
.byte 0x2
.byte 0x40
.byte 0x90
.byte 0xc0
.byte 0x2
.byte 0x40
.byte 0x94
.byte 0xc0
.byte 0x2
.byte 0x40
.byte 0x98
.byte 0xd0
.byte 0x2
.byte 0x40
.byte 0x9c
.byte 0xd0
.byte 0x2
.byte 0x40
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x0
.byte 0x1
.byte 0x0
.byte 0x0
.byte 0x0
