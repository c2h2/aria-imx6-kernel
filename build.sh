export ARCH="arm"
export CROSS_COMPILE="arm-fsl-linux-gnueabi-"
export PATH="/opt/freescale/usr/local/gcc-4.6.2-glibc-2.13-linaro-multilib-2011.12/fsl-linaro-toolchain/bin/:$PATH"

make -j4 uImage LOADADDR=0x10008000
make -j4 modules

make imx6dl-sabresd.dtb

rm -rf deploy
mkdir -p deploy/mod

cp arch/arm/boot/uImage deploy/
cp arch/arm/boot/dts/imx6dl-sabresd.dtb deploy/
