# Makefile for ARM7 Cortex-M3

APP_NAME = pok3r

SRC_DIR = .
BIN_DIR = build

OUTPUT = $(BIN_DIR)/$(APP_NAME)

CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-gcc
OC = arm-none-eabi-objcopy

RM = rm
MKDIR = mkdir -p

ARM_CPU = arm7tdmi

CC_FLAGS = -gdwarf-2 -c -mcpu=$(ARM_CPU) -mthumb-interwork -O -mlong-calls -ffunction-sections -Wall -o$@
AS_FLAGS = -gdwarf2 -mcpu=$(ARM_CPU) -mthumb-interwork -o$@
LD_FLAGS = -T $(SRC_DIR)/$(APP_NAME).ld -o $(OUTPUT).elf -Wl,-Map,$(OUTPUT).map,--cref -lm

all: $(OUTPUT).bin

$(OUTPUT).bin: $(OUTPUT).elf
	$(OC) -O binary $(OUTPUT).elf $(OUTPUT).bin
	
$(OUTPUT).elf: $(SRC_DIR)/$(APP_NAME).ld $(BIN_DIR)/startup.o
	$(MKDIR) $(BIN_DIR)
	$(LD) $(BIN_DIR)/startup.o $(LD_FLAGS)
	
$(BIN_DIR)/startup.o: $(SRC_DIR)/startup.s
	$(AS) $(AS_FLAGS) $<
	
clean:
	-$(RM) $(BIN_DIR)\$(OUTPUT).bin
	-$(RM) $(BIN_DIR)\$(OUTPUT).elf
	-$(RM) $(BIN_DIR)\*.o
	-$(RM) $(BIN_DIR)\*.map
