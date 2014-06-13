export ARCH="arm"
export CORES="24"
export CROSS_COMPILE="arm-linux-gnueabihf-"
export PATH="/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:/opt/gcc-linaro-arm-linux-gnueabihf-4.8-2013.06_linux/bin:$PATH"

make -j16 uImage LOADADDR=0x10008000
make -j16 modules
make imx6q-sabresd.dtb

rm -rf deploy
mkdir -p deploy/mod
cp arch/arm/boot/uImage deploy/
cp arch/arm/boot/dts/imx6q-sabresd.dtb deploy/

make modules_install INSTALL_MOD_PATH=deploy/mod

mkdir -p deploy/mod/usr/src/linux
make headers_install INSTALL_HDR_PATH=deploy/mod/usr/src/linux

make firmware
make firmware_install INSTALL_MOD_PATH=deploy/mod

cd deploy/mod
tar -czf ../mod.tar.gz ./
cd ../..
