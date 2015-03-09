#!/bin/sh

TEMP=sq_tmp
IMAGE=${IMAGE:=`pwd`/../image}
TOOLCHAIN_PATH=${TOOLCHAIN_PATH:=`pwd`/../../gcc-linaro-arm-linux-gnueabihf-4.8-2013.10_linux}

mkdir $TEMP
cp -rf $IMAGE/rootfs/* $TEMP/
cp -rf $TOOLCHAIN_PATH/arm-linux-gnueabihf/lib $TEMP/
cp -rf $TOOLCHAIN_PATH/arm-linux-gnueabihf/libc $TEMP/

mksquashfs $TEMP $IMAGE/rootfs.sq

