#!/system/bin/sh

echo "4330"
brcm_patchram_plus --enable_hci --use_baudrate_for_download --scopcm=0,2,0,0,0,0,0,0,0,0  --baudrate 3000000 --patchram /etc/firmware/bcm4330.hcd --no2bytes --enable_lpm --tosleep=50000 /dev/ttyHS2
