#!/bin/bash

echo "Compiling Android..."


export USE_CCACHE=1
export CCACHE_DIR=/home/jab416171/.ccache
export PATH=$PATH:/home/jab416171/bin:/home/jab416171/android-sdk-linux/tools:/home/jab416171/android-sdk-linux/platform-tools
set

rm -rf /home/jab416171/Dropbox/android/jab_aosp_output/*
echo `date` >> /home/jab416171/Dropbox/android/jab_aosp_output/time.txt
repo init -u git://github.com/jab-aosp/jab-aosp.git
repo sync
prebuilt/linux-x86/ccache/ccache -M 20G
make clean
source build/envsetup.sh
lunch full_toro-userdebug
make otapackage -j$MAKE
echo `date` >> /home/jab416171/Dropbox/android/jab_aosp_output/time.txt
ls -ltra out/target/product/toro/
#cp out/target/product/toro/*.img /home/jab416171/Dropbox/android/jab_aosp_output/
#cp out/target/product/toro/*.txt /home/jab416171/Dropbox/android/jab_aosp_output/
cp out/target/product/toro/*.zip /home/jab416171/Dropbox/android/jab_aosp_output/
rm -rf artifacts/
mkdir artifacts/
#cp out/target/product/toro/*.img artifacts/
#cp out/target/product/toro/*.txt artifacts/
cp out/target/product/toro/*.zip artifacts/