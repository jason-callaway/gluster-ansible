#!/bin/bash

for letter in b c d e f g h i; do
    if [ ! -b /dev/xvd${letter}1 ]
    then
        (echo n; echo p; echo; echo; echo; echo w) | fdisk /dev/xvd${letter}
    fi
done