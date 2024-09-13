################################################################################
# 自动生成的文件。不要编辑！
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_UPPER_SRCS += \
../startup/HPM5361/toolchains/gcc/port_gcc.S \
../startup/HPM5361/toolchains/gcc/start.S 

OBJS += \
./startup/HPM5361/toolchains/gcc/port_gcc.o \
./startup/HPM5361/toolchains/gcc/start.o 

S_UPPER_DEPS += \
./startup/HPM5361/toolchains/gcc/port_gcc.d \
./startup/HPM5361/toolchains/gcc/start.d 


# Each subdirectory must supply rules for building sources it contributes
startup/HPM5361/toolchains/gcc/%.o: ../startup/HPM5361/toolchains/gcc/%.S
	riscv32-unknown-elf-gcc -march=rv32imac -mabi=ilp32 -msmall-data-limit=8 -mno-strict-align -mno-save-restore -Og -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections  -g3 -gdwarf-2 -x assembler-with-cpp -I"F:\RT-ThreadStudio\workspace\two4" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\ip" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\soc\HPM5300\HPM5361" -I"F:\RT-ThreadStudio\workspace\two4\rt-thread\libcpu\risc-v\common" -I"F:\RT-ThreadStudio\workspace\two4\libraries\hpm_sdk\arch" -I"F:\RT-ThreadStudio\workspace\two4\startup\HPM5361" -ffunction-sections -fdata-sections -fno-common -mcmodel=medlow -MMD -MP -MF"$(@:%.o=%.d)" -MT"$(@)" -c -o "$@" "$<"

