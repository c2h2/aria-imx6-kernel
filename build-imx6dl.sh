export ARCH="arm"
export CORES="24"
export CROSS_COMPILE="arm-linux-gnueabihf-"
export PATH="/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:$PATH"

make -j16 uImage LOADADDR=0x10008000
make -j16 modules
make imx6dl-sabresd.dtb

rm -rf deploy/imx6dl
mkdir -p deploy/imx6dl/mod
cp arch/arm/boot/uImage deploy/imx6dl
cp arch/arm/boot/dts/imx6dl-sabresd.dtb deploy/imx6dl

make modules_install INSTALL_MOD_PATH=deploy/imx6dl/mod

mkdir -p deploy/imx6dl/mod/usr/src/linux
make headers_install INSTALL_HDR_PATH=deploy/imx6dl/mod/usr/src/linux

make firmware
make firmware_install INSTALL_MOD_PATH=deploy/imx6dl/mod

cd deploy/imx6dl/mod
tar -czf ../mod.tar.gz ./
cd ../../..
