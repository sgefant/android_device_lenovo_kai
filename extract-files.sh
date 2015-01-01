#!/bin/bash

# make the directory tree
mkdir -p kai-blobs
cd kai-blobs
mkdir -p `for i in $(grep kai-blobs ../device_kai.mk | awk -F : '{print $2}' | awk  '{print $1}') ; do grep $i ../device_kai.mk | awk -F : '{print $1}' | rev | cut -f 2 -d / | rev | grep -v kai-blobs ; done | sort -u ` 
cd ..

# pull the blobs
cd kai-blobs
for i in $(grep kai-blobs ../device_kai.mk | awk -F : '{print $2}' | awk  '{print $1}') ; do adb pull \/$(grep $i ../device_kai.mk | awk -F : '{print $2}' |  awk  '{print $1}') ../../../../$(grep $i ../device_kai.mk | awk -F : '{print $1}' |  awk  '{print $1}') ; done
cd ..

# pull the confs
cd kai-confs
for i in $(grep kai-confs ../device_kai.mk | awk -F : '{print $2}' | awk  '{print $1}') ; do adb pull \/$(grep $i ../device_kai.mk | awk -F : '{print $2}' |  awk  '{print $1}') ../../../../$(grep $i ../device_kai.mk | awk -F : '{print $1}' |  awk  '{print $1}') ; done
cd ..

# Silly file names...
cd kai-blobs
adb pull /system/lib/hw/gralloc.tegra.so hw/gralloc.tegra.so
adb pull /system/lib/hw/hwcomposer.tegra.so hw/hwcomposer.tegra.so
cd ..
