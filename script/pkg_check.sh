#!/bin/bash

check_pkg() {
    result=`dpkg --get-selections | awk ' $1 == "'$1'" {print $1}'`
    if [ "$result" == "" ];then
        inst="Not install"
    else
        inst="Installed"
    fi
    printf "%-20s [%s]\n" $1 $inst
}

check_pkg expect

