#!/bin/sh

card=/dev/sdd
p=""

echo "1st partition:"
echo -n "\tPartition number: 1\n"
echo -n "\tSector: 2048(default)\n"
echo -n "\tLast sector: +20M\n"

echo "2nd partition:"
echo -n "\tPartition number: 2\n"
echo -n "\tSector: 43008(default)\n"
echo -n "\tLast sector: +5G\n"

echo "3rd partition:"
echo -n "\tPartition number: 3\n"
echo -n "\tSector: (default)\n"
echo -n "\tLast sector: (default)\n"


fdisk ${card}

