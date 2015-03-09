#!/bin/sh

card=/dev/sdd
p=""

uboot()
{
    dd if=/dev/zero of=${card} bs=1k count=1023 seek=1
    dd if=${ROOT}/image/u-boot.bin of=${card} bs=1024 seek=8
}

do_mount()
{
    mount ${card}${p}1 /mnt
}

do_umount()
{
    umount /mnt
}

kernel()
{

    cp ${ROOT}/image/uImage /mnt
}

evt()
{
    cp ${ROOT}/config/uEvt.txt /mnt
}

script()
{
    cp ${ROOT}/image/script.bin /mnt
}

case $1 in
    all)
        uboot;
        do_mount;
        evt;
        kernel;
        script;
        do_umount;
        ;;
    uboot)
        uboot;
        do_mount;
        evt;
        do_umount;
        ;;
    kernel)
        do_mount
        kernel
        do_umount
        ;;
    script)
        do_mount;
        script;
        do_umount;
        ;;
esac

