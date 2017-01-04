# Makefile for ARM7 Cortex-M3

APP_NAME = pok3r

SRC_DIR = .
BIN_DIR = build

OUTPUT = $(APP_NAME)

CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OC = arm-none-eabi-objcopy

RM = rm
MKDIR = mkdir -p

ARM_CPU = arm7tdmi

CC_FLAGS = -c -mthumb -nostdlib -nostartfiles -ffreestanding -Wall -o $@
AS_FLAGS = -o $@
LD_FLAGS = -T $(SRC_DIR)/$(APP_NAME).ld -Map $(OUTOUT).map -o $(OUTPUT).elf

all: $(OUTPUT).bin

$(OUTPUT).bin: $(OUTPUT).elf
	$(OC) $(OUTPUT).elf -O binary $(OUTPUT).bin
	
$(OUTPUT).elf: $(SRC_DIR)/$(APP_NAME).ld startup.o
	$(MKDIR) $(BIN_DIR)
	$(LD) $(LD_FLAGS) startup.o main.o
	
startup.o: $(SRC_DIR)/startup.s
	$(AS) $(AS_FLAGS) $<
	
main.o: $(SRC_DIR)/main.c
	$(CC) $(CC_FLAGS) $<
	
clean:
	-$(RM) $(OUTPUT).bin
	-$(RM) $(OUTPUT).elf
	-$(RM) *.o
	-$(RM) *.map
