#!/bin/sh

# We need several functions here. We should read proprietary_files.txt
# For each line, we should check whether it is commented out, ("#"),
# whether it contains a filename ("/") and to which package it belongs.

set -e

DEVICE=kai
VENDORS="broadcom invensense nvidia widevine"


# Function: Interchange file
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
      echo Uncommented: $(basename $FILE)

      EXISTING="false"
      echo Existing is $EXISTING
      while [[ $EXISTING == "false" ]]; do
        for i in $( cat $OUTDIR/device-partial.mk | grep -v \# | awk '{print $1}' ); do
          if [[ $(basename $FILE) == "$i" ]] ; then
            EXISTING="true"
            ls $OUTDIR/proprietary/$(basename $FILE)
            echo cp lenovo-kai-proprietary/$FILE $OUTDIR/proprietary/$(basename $FILE)
            echo Existing is $EXISTING
            EXISTING="false"
          fi
        done
        break
      done
     

#        cp lenovo-kai-proprietary/$FILE  OUTDIR/proprietary/$FILE

      else # Still not commented out, but not in dir; file is additional
#        LINEEND=" \\"
#        COUNT=`wc -l proprietary-files.txt | awk {'print $1'}`
#        for FILE in `cat proprietary-files.txt`; do
#          COUNT=`expr $COUNT - 1`
#          if [ $COUNT = "0" ]; then
#            LINEEND=""
#          fi
          echo "    $OUTDIR/proprietary/$FILE:system/$FILE$LINEEND" 
#        done
      ;;
  esac

done
