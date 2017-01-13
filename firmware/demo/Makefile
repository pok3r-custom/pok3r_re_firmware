# Makefile for ARM7 Cortex-M3

APP_NAME = usbd

# Directories
SRC_DIR = .
BIN_DIR = .
OUT_DIR = .

# Files
OUT_ELF = $(BIN_DIR)/$(APP_NAME).elf
OUT_BIN = $(OUT_DIR)/$(APP_NAME).bin
OUT_MAP = $(BIN_DIR)/$(APP_NAME).map

CC_SRCS = main.c \
system_ht32f165x.c \
ht32_usbd_class.c \
ht32_usbd_descriptor.c \
ht32f165x_it.c \
lib/ht32_retarget.c \
lib/ht32_serial.c \
lib/ht32_usbd_core.c \
lib/ht32f1655_56_ckcu.c \
lib/ht32f1655_56_exti.c \
lib/ht32f1655_56_gpio.c \
lib/ht32f1655_56_mctm.c \
lib/ht32f1655_56_rstcu.c \
lib/ht32f1655_56_usart.c \
lib/ht32f1655_56_usbd.c \
lib/HT32_board/ht32f1656_dvb.c

OBJ_NAMES = $(CC_SRCS:.c=.o)
OBJS = $(addprefix $(BIN_DIR)/, $(OBJ_NAMES))

# Config
ARM_CPU = cortex-m3

# Commands
CC = arm-none-eabi-gcc
AS = arm-none-eabi-as
LD = arm-none-eabi-ld
OC = arm-none-eabi-objcopy

RM = rm -f
MKDIR = mkdir -p

# Flags
CC_FLAGS += -mcpu=$(ARM_CPU)
AS_FLAGS += -mcpu=$(ARM_CPU)
CC_FLAGS += -c -mthumb -std=c11 -nostdlib -nostartfiles -Wall -I lib -D USE_HT32_DRIVER -D USE_HT32F1656_DVB
LD_FLAGS = -T $(SRC_DIR)/linker.ld -Map $(OUT_MAP) -nostdlib -o $(OUT_ELF)

# Targets
all: $(OUT_BIN)

$(OUT_BIN): $(OUT_ELF)
	$(OC) $(OUT_ELF) -O binary $(OUT_BIN)

$(OUT_ELF): $(SRC_DIR)/linker.ld $(BIN_DIR)/startup.o | dirs $(OBJS)
	$(LD) $(LD_FLAGS) startup.o $(OBJS)

$(BIN_DIR)/startup.o: $(SRC_DIR)/startup_ht32f165x.s
	$(AS) $(AS_FLAGS) -o $@ $<

$(BIN_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CC_FLAGS) -o $@ $<
	
dirs:
	$(MKDIR) $(BIN_DIR)/lib

clean:
	$(RM) $(OUT_ELF)
	$(RM) $(OUT_BIN)
	$(RM) $(OUT_MAP)
	$(RM) *.o

.PHONY: all clean dirs

