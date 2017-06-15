################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/TMP75.c \
../Src/main.c \
../Src/stm32l1xx_hal_msp.c \
../Src/stm32l1xx_it.c \
../Src/system_stm32l1xx.c 

OBJS += \
./Src/TMP75.o \
./Src/main.o \
./Src/stm32l1xx_hal_msp.o \
./Src/stm32l1xx_it.o \
./Src/system_stm32l1xx.o 

C_DEPS += \
./Src/TMP75.d \
./Src/main.d \
./Src/stm32l1xx_hal_msp.d \
./Src/stm32l1xx_it.d \
./Src/system_stm32l1xx.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o: ../Src/%.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m3 -mthumb -mfloat-abi=soft -D__weak="__attribute__((weak))" -D__packed="__attribute__((__packed__))" -DUSE_HAL_DRIVER -DSTM32L152xC -I"/Users/ignacioinda/Documents/workspace/TMP75/Inc" -I"/Users/ignacioinda/Documents/workspace/TMP75/Drivers/STM32L1xx_HAL_Driver/Inc" -I"/Users/ignacioinda/Documents/workspace/TMP75/Drivers/STM32L1xx_HAL_Driver/Inc/Legacy" -I"/Users/ignacioinda/Documents/workspace/TMP75/Drivers/CMSIS/Device/ST/STM32L1xx/Include" -I"/Users/ignacioinda/Documents/workspace/TMP75/Drivers/CMSIS/Include" -I"/Users/ignacioinda/Documents/workspace/TMP75/Inc"  -Og -g3 -Wall -fmessage-length=0 -ffunction-sections -c -fmessage-length=0 -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


