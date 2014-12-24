#!/bin/sh
# This script assumes that you have downloaded all relevant binaries for Grouper
# and put them in a vendor tree in the root of the aosp repo.
# This script assumes that it is run from the device/lenovo/kai directory.

#TODO: add sanitytests

#test whether vendor directory exists
#test whether run from correct directory
cd ../../../vendor || exit 1
for i in `ls` ; do cd $i; mv grouper kai; cd .. ; done
mv asus lenovo
for j in `grep -r -l grouper . | grep .mk` ; do sed -i s/grouper/kai/g $j ; done # Should not be done on binaries.
