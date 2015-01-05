#!/bin/sh

# We need several functions here. We should read proprietary_files.txt
# For each line, we should check whether it is commented out, ("#"),
# whether it contains a filename ("/") and to which package it belongs.

set -e

DEVICE=kai
VENDORS="broadcom invensense nvidia widevine"


for FILE in `cat proprietary-files.txt`; do
  case $FILE in
    "#"*)
      echo Commented: $FILE
      for i in $VENDORS; do
        if [[ "$i" == "$(echo $FILE | sed s'/#//')" ]] ; then
          VENDOR=$i
          OUTDIR="../../../vendor/$VENDOR/$DEVICE"
        fi
      done
      ;;
    *"/"*)
      if [ -e $OUTDIR/proprietary/$(basename $FILE) ] ; then
        echo cp lenovo-kai-proprietary/$FILE $OUTDIR/proprietary/$(basename $FILE)
      elif [ ! -e $OUTDIR/proprietary/$(basename $FILE) ] ; then
         # The first time we encounter a new file:
         # make a new device-partial.mk file. First cat the licence.
         # Then, cat the existing device-partial.mk. For each line,
         # awk the filename and 
         # IF IT SHOULD NOT BE REMOVED
         # cat it with a trailing backslash
         # to the new file.
         # For every time we encounter an addition (for this vendor)
         # we then add the additional filename like superhansi did:
                 LINEEND=" \\"
         #        COUNT=`wc -l proprietary-files.txt | awk {'print $1'}`
         #        for FILE in `cat proprietary-files.txt`; do
         #          COUNT=`expr $COUNT - 1`
         #          if [ $COUNT = "0" ]; then
         #            LINEEND=""
         #          fi
                   echo "    $(basename $FILE)$LINEEND" \>\> $OUTDIR/device-partial.mk
         #        done
         # However, we only echo $(basename file). Also, with echo, rev, and awk we split
         # the suffix from the name so that we can also write an addition to 
         # $OUTDIR/proprietary/Android.mk
         # With regard to the latter; this file always ends with an endif statement. We use wordcount
         # to count the number of lines and the head the file with -n (number of lines -1 ) to a 
         # new file. After that, we add module descriptions to the makefile, and then 
         # at the end we echo back in the endif statement.
         # Module structure (note the trailing line of whitespace:
         # include $(CLEAR_VARS)
         # LOCAL_MODULE := libdrmdecrypt
         # LOCAL_SRC_FILES := libdrmdecrypt.so
         # LOCAL_MODULE_SUFFIX := .so
         # LOCAL_MODULE_CLASS := SHARED_LIBRARIES
         # LOCAL_MODULE_PATH := $(TARGET_OUT)/lib
         # LOCAL_MODULE_TAGS := optional
         # LOCAL_MODULE_OWNER := widevine
         # include $(BUILD_PREBUILT)
         #
         # LOCAL_MODULE_CLASS can be EXECUTABLES (no module suffix), SHARED_LIBRARIES (filename ends .so) or ETC (any other)
      fi
      ;;
  esac

done
