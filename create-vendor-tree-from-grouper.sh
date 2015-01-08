#!/bin/sh
# This script assumes that you have downloaded all relevant binaries for Grouper
# and put them in a vendor tree in the root of the aosp repo.
# This script assumes that it is run from the device/lenovo/kai directory.

set -e

# Exclude asus directory, as well as elan and nxp
DIRECTORIES="broadcom invensense lenovo nvidia widevine"

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


cp -a asus lenovo

mv lenovo/grouper lenovo/kai

for i in $DIRECTORIES ; do
  cd $i

  if [ -d "grouper" ]; then
    cp -a grouper kai
  fi

  cd kai

  for j in `grep -r -l grouper . | grep .mk` ; do
    sed -i s/grouper/kai/g $j
  done

  cd ../.. 

done
