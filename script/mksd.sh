#!/bin/sh

card=/dev/sdd
p=""

mkfs.vfat ${card}${p}1
mkfs.ext4 ${card}${p}2




