# docker_cmx_soc_compiler_build
cortex-m3/4 compiler

获取cortex M/R 交叉工具链的方式

方式一：
从apt直接安装
apt search gcc-arm-none-eabi
Sorting... Done
Full Text Search... Done
gcc-arm-none-eabi/oldstable,now 15:8-2019-q3-1+b1 amd64 [installed]
  GCC cross compiler for ARM Cortex-R/M processors

gcc-arm-none-eabi-source/oldstable 15:8-2019-q3-1 all
  GCC cross compiler for ARM Cortex-R/M processors (source)

安装,构建docker镜像时直接安装
apt install gcc-arm-none-eabi


方式二：
从ARM官方下载，可参见文件：README_Cross_ToolChain_GetInfo


程序下载工具最常用的是
(1)FlyMCU
这是windows程序，在tool目录下有安装包。

(2)stm32flash
apt search stm32flash
stm32flash/oldstable 0.5+git20200914+2b0f078-1 amd64
  STM32 chip flashing utility using a serial bootloader

apt install -y stm32flash

stm32flash --help
