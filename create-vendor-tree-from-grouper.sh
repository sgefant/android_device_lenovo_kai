#!/bin/sh
# This script assumes that you have downloaded all relevant binaries for Grouper
# and put them in a vendor tree in the root of the aosp repo.
# This script assumes that it is run from the device/lenovo/kai directory.

set -e

# Exclude elan and nxp
DIRECTORIES="asus broadcom invensense nvidia widevine"

cd ../../../vendor

# Clear out the results from a previous try.

if [ -e lenovo ] ; then
  for i in $DIRECTORIES; do
    if [ -e $i/kai ] ; then
      rm -r $i/kai
    fi
  done
  rm -r lenovo
fi


for i in $DIRECTORIES ; do
  cd $i
  if [ -d "grouper" ]; then
    cp -a grouper kai
  fi

  cd kai
  # Remove any other directory than proprietary
  for l in `ls | grep -v proprietary` ; do
    if [ -d "$l" ] ; then 
      echo Deleting directory $l
      rm -r $l
    fi
  done

  for j in `grep -r -l grouper . | grep .mk` ; do
    sed -i 's/tegra3/tegra/g' $j
    sed -i 's/asus/lenovo/g' $j
    sed -i 's/Asus/Lenovo/g' $j
    sed -i 's/grouper/kai/g' $j
    sed -i 's/Grouper/Kai/g' $j
  done

  cd ../.. 
done

mkdir lenovo

mv asus/kai lenovo/kai

# Deal with different names for same files
#mv nvidia/kai/keymaster/keymaster_grouper.cpp 	nvidia/kai/keymaster/keymaster_kai.cpp
mv lenovo/kai/proprietary/sensors.grouper.so 	lenovo/kai/proprietary/sensors.kai.so
mv lenovo/kai/proprietary/camera.tegra3.so 	lenovo/kai/proprietary/camera.tegra.so
mv broadcom/kai/proprietary/gps.tegra3.so 	broadcom/kai/proprietary/gps.tegra.so
mv nvidia/kai/proprietary/gralloc.tegra3.so 	nvidia/kai/proprietary/gralloc.tegra.so
mv nvidia/kai/proprietary/hwcomposer.tegra3.so 	nvidia/kai/proprietary/hwcomposer.tegra.so
mv nvidia/kai/proprietary/nvram.txt 		nvidia/kai/proprietary/nvram_4330.txt

