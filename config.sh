export ARCH="arm"
export CROSS_COMPILE="arm-fsl-linux-gnueabi-"
export PATH="/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/:$PATH"

make menuconfig
