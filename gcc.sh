#!/bin/sh
# export KERNELDIR=`readlink -f .`
DEFCONFIG=kangaroox-whyred_defconfig 
ANYKERNEL_DIR=/home/jungle/Desktop/android/AnyKernel3
ZIP_NAME="KangarooX-whyred-r5.4"

#mkdir /home/tamas/Desktop/ccache
#export BR2_CCACHE_DIR="/home/tamas/Desktop/ccache" 
#export KBUILD_BUILD_VERSION="1"
export KBUILD_BUILD_USER="jungle"
export KBUILD_BUILD_HOST="ryzen"

export CROSS_COMPILE=/home/jungle/Desktop/android/toolchains/aarch64-buildroot-linux-musl/bin/aarch64-buildroot-linux-musl-
export CROSS_COMPILE_ARM32=/home/jungle/Desktop/android/toolchains/arm-eabi-4.8/bin/arm-eabi-

export ARCH=arm64
export SUBARCH=arm64
mkdir -p .out

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
