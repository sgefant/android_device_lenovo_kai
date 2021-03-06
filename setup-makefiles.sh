#!/bin/sh

set -e

./create-vendor-tree-from-grouper.sh

DEVICE=kai
VENDORS="broadcom invensense lenovo nvidia widevine"

init_makefiles () {
# Call this function with $OUTDIR as argument
MAKEFILES="device-partial.mk.new proprietary/Android.mk.new"
for n in $MAKEFILES ; do
(cat << EOF) > $1/$n
# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# This file is generated by device/lenovo/kai/setup-makefiles.sh
EOF
done

# Set definitions
echo "" >> $1/proprietary/Android.mk.new
echo "LOCAL_PATH := \$(call my-dir)" >> $1/proprietary/Android.mk.new
echo "" >> $1/proprietary/Android.mk.new
echo "ifeq (\$(TARGET_DEVICE),kai)" >> $1/proprietary/Android.mk.new
echo "" >> $1/proprietary/Android.mk.new

old_ifs=$IFS
IFS=$'\n'

# Then, echo the existing device-partial.mk into the new makefile
# and copy over the module definitions from to the new Android.mk
for i in $(cat $1/device-partial.mk | grep -v \# ) ; do
  if [[ $i == "PRODUCT_PACKAGES := \\" ]] ; then
    echo $i >> $1/device-partial.mk.new
  # Exclude additional (open source) modules
  elif [[ $i == "PRODUCT_PACKAGES +="* ]] ; then
    continue
  # echo to device-partial.mk
  else
    modname=$(echo $i | awk '{ print $1 }' )
    COPY=true
    for m in $(cat grouper-unique-blob-list.txt | grep \# | sed 's/^#[[:space:]]\+.*//g' | sed 's/\.[^.]*$//') ; do
      if [[ \#$modname == $m ]] ; then
        COPY=false
        echo Ignoring $modname...
      fi
    done
    if [[ $COPY == true ]] ; then
      echo "    $modname \\" >> $1/device-partial.mk.new
      # Now grep over the module definitions; have to deal with
      # grepping the filename.
      #IFS=$old_ifs
      for FULLNAME in $(grep -A 1 LOCAL_MODULE\ :=\ $modname $1/proprietary/Android.mk | grep LOCAL_SRC_FILES | awk -F = '{print $2}' | sed 's/[[:space:]]//g') ; do
        MODULE=$(echo $FULLNAME | sed 's/\.[^.]*$//')
        if [[ "$modname" == "$MODULE" ]] ; then
          grep -B 2 -A 7 "$FULLNAME" $1/proprietary/Android.mk | sed -- 's/TARGET_OUT)/TARGET_OUT_VENDOR)/' >>  $1/proprietary/Android.mk.new
        fi
      done
      #IFS=$'\n'
    fi
  fi
done


IFS=$old_ifs

# Deal with different names for same files
sed -i 's/tegra3/tegra/' $1/device-partial.mk.new
sed -i 's/tegra3/tegra/' $1/proprietary/Android.mk.new
sed -i 's/nvram/nvram_4330/' $1/device-partial.mk.new
sed -i 's/nvram/nvram_4330/' $1/proprietary/Android.mk.new
}

for j in $VENDORS; do
  echo Initiating $j makefiles
  init_makefiles ../../../vendor/$j/$DEVICE
done

add_module() {
# Call this function with $FILE as argument

# Copy the file
cp $SRCDIR/$FILE $OUTDIR/proprietary/

# Add to Android.mk: We need to set several fields. First the simple ones.
LOCAL_SRC_FILES=$(basename $FILE)
LOCAL_MODULE_PATH=$(dirname $FILE)
LOCAL_MODULE_OWNER=$(echo $VENDOR | sed -e 's/\(.*\)/\L\1/')

# Now,LOCAL_MODULE and LOCAL_MODULE_SUFFIX are different,
# depending on whether the file has an extension.
if [[ "$LOCAL_SRC_FILES" == *.* ]] ; then
  LOCAL_MODULE_SUFFIX=\."$(echo $LOCAL_SRC_FILES | rev | awk -F . '{ print $1 }' | rev)"
  LOCAL_MODULE=$(echo $LOCAL_SRC_FILES | sed 's/\.[^.]*$//')
else
  LOCAL_MODULE=$LOCAL_SRC_FILES
  LOCAL_MODULE_SUFFIX=""
fi

# LOCAL_MODULE_CLASS is one of :
#    EXECUTABLES (no module suffix or .sh),
#    SHARED_LIBRARIES (filename ends .so),
#    APPS for an apk, or
#    ETC (any other)
case $LOCAL_MODULE_SUFFIX in
  "")
    LOCAL_MODULE_CLASS=EXECUTABLES
    ;;
  ".sh")
    LOCAL_MODULE_CLASS=EXECUTABLES
    ;;
  ".so")
    LOCAL_MODULE_CLASS=SHARED_LIBRARIES
    ;;
  ".apk")
    LOCAL_MODULE_CLASS=APPS
    ;;
  *)
    LOCAL_MODULE_CLASS=ETC
    ;;
esac

# Now echo the new module to Android.mk.new (note the trailing line of whitespace):

echo include \$\(CLEAR_VARS\) >> $OUTDIR/proprietary/Android.mk.new
echo LOCAL_MODULE := $LOCAL_MODULE >> $OUTDIR/proprietary/Android.mk.new
echo LOCAL_SRC_FILES := $LOCAL_SRC_FILES >> $OUTDIR/proprietary/Android.mk.new
echo LOCAL_MODULE_SUFFIX := $LOCAL_MODULE_SUFFIX >> $OUTDIR/proprietary/Android.mk.new
echo LOCAL_MODULE_CLASS := $LOCAL_MODULE_CLASS >> $OUTDIR/proprietary/Android.mk.new
echo LOCAL_MODULE_PATH := \$\(TARGET_OUT\)/$LOCAL_MODULE_PATH >> $OUTDIR/proprietary/Android.mk.new
echo LOCAL_MODULE_TAGS := optional >> $OUTDIR/proprietary/Android.mk.new
echo LOCAL_MODULE_OWNER := $LOCAL_MODULE_OWNER >> $OUTDIR/proprietary/Android.mk.new
echo include \$\(BUILD_PREBUILT\) >> $OUTDIR/proprietary/Android.mk.new
echo "" >> $OUTDIR/proprietary/Android.mk.new

# Finally add the module to device-partial.mk
echo "    $LOCAL_MODULE \\" >> $OUTDIR/device-partial.mk.new

}

# Now the real work starts
# We read proprietary-files.txt
# For each line, we check whether it is commented out, ("#"),
# whether it contains a filename ("/") and to which vendor package it belongs.
for FILE in `cat proprietary-files.txt` ; do
  SRCDIR="lenovo-kai-proprietary"
  case $FILE in
    "#"*)
      for k in $VENDORS; do
        if [[ "$k" == "$(echo $FILE | sed s'/#//')" ]] ; then
          VENDOR=$k
          OUTDIR="../../../vendor/$VENDOR/$DEVICE"
        fi
      done
      ;;
    *"/"*)
      EXISTING=false
      if [ -e $OUTDIR/proprietary/$(basename $FILE) ] ; then
        EXISTING=true
      fi

      case $EXISTING in
        true)
          echo Overwriting vendor/$VENDOR/$DEVICE/proprietary/$(basename $FILE)
          cp $SRCDIR/$FILE $OUTDIR/proprietary/
          ;;
        false)
          echo Adding vendor/$VENDOR/$DEVICE/proprietary/$(basename $FILE) to makefiles
          add_module $FILE
          ;;
      esac
      ;;
  esac
done

# Do the same for binary_hack_files.txt
# For each line, we check whether it is commented out, ("#"),
# whether it contains a filename ("/") and to which vendor package it belongs.
for FILE in `cat binary-hack-files.txt` ; do
  SRCDIR="lenovo-binary-hack"
  VENDOR="nvidia"
  OUTDIR="../../../vendor/$VENDOR/$DEVICE"
  echo Adding vendor/$VENDOR/$DEVICE/proprietary/$(basename $FILE) to makefiles
  add_module $FILE
done


# Now finish the makefiles
for l in $VENDORS; do
  if [ -e ../../../vendor/$l/$DEVICE/device-partial.mk.new ] ; then
    echo Moving $l makefiles in place

    # Deal with trailing slashes in device-partial.mk
    LENGTH=$(wc -l ../../../vendor/$l/$DEVICE/device-partial.mk.new | awk '{print $1}')
    LENGTH=$(( ${LENGTH} - 1 ))
    head -n $LENGTH ../../../vendor/$l/$DEVICE/device-partial.mk.new > ../../../vendor/$l/$DEVICE/device-partial.mk
    tail -n 1 ../../../vendor/$l/$DEVICE/device-partial.mk.new | sed 's/\\//g' >> ../../../vendor/$l/$DEVICE/device-partial.mk
    rm ../../../vendor/$l/$DEVICE/device-partial.mk.new

    # Echo endif into Android.mk.new and move it over
    echo endif >> ../../../vendor/$l/$DEVICE/proprietary/Android.mk.new
    mv ../../../vendor/$l/$DEVICE/proprietary/Android.mk.new ../../../vendor/$l/$DEVICE/proprietary/Android.mk
  fi
done
