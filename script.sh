#!/bin/sh
# export KERNELDIR=`readlink -f .`
DEFCONFIG=kangaroox-whyred_defconfig 
ANYKERNEL_DIR=/work/AnyKernel3
ZIP_NAME="KangarooX-whyred-r5.4"

export KBUILD_BUILD_USER="jungle"
export KBUILD_BUILD_HOST="ryzen"

export CROSS_COMPILE=/work/aarch64-buildroot-linux-musl/bin/aarch64-buildroot-linux-musl-
export CROSS_COMPILE_ARM32=/work/arm-eabi-4.8/bin/arm-eabi-

export ARCH=arm64
export SUBARCH=arm64
mkdir -p .out

echo ""
echo "Running make clean..."
echo ""
make clean

echo ""
echo "Running make mrproper..."
echo ""
make mrproper

echo ""
echo " Cross-compiling KangarooX kernel whyred..."
echo ""

# cd $KERNELDIR/

make O=.out $DEFCONFIG

make -j4 O=.out 


#find -name '*.ko' -exec mv -v {} $KERNELDIR/BUILT_whyred-pie/system/lib/modules \;
rm -f ${ANYKERNEL_DIR}/Image.gz*
rm -f ${ANYKERNEL_DIR}/zImage*
rm -f ${ANYKERNEL_DIR}/dtb*
mv .out/arch/arm64/boot/Image.gz-dtb ${ANYKERNEL_DIR}/zImage-dtb


cd ${ANYKERNEL_DIR}
rm *.zip
zip -r9 ${ZIP_NAME}.zip * -x README ${ZIP_NAME}.zip
echo ""
echo "KangarooX has been built for whyred !!!"
