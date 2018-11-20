#!/bin/bash

if [ ! -d "build" ]
then
    mkdir build
fi

FILES=$1

if [ ! -f $FILES ]
then
    echo "DEMO_FILES is not exist, please input file name"
    exit
fi

cd build
cmake ../ -DDEMO_FILES=$FILES
make
cp FreeRTOS-POSIX ../
