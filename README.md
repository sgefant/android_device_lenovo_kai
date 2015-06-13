android_device_lenovo_kai
=========================

Lenovo Ideatab A2109A (kai)

This is cm-11.0 for Lenovo Ideatab A2109A (kai)

WARNING: THIS BRANCH WAS NEVER BUILT!!!

Special thanks to the tf700t developers for Cyanogenmod:
  dasunsrule32
  xplodwild
  nycbjr

Thanks to the A2109A pioneers:
  superhansi
  gmarkall
  kahlo007

|Category |Feature |Working |Not working |Unknown |
|---------|--------|--------|------------|--------|
|EGL | |X | | |
|WLAN | | | | |
|  |Client mode |X | | |
|  |P2P | |X | |
|Bluetooth | | | |
|  |Send files |X | | |
|  |Receive files |X | | |
|  |Headset | | |X |
|  |Browse files |X | | |
|Camera | | | |X |
|  |Preview | | |X |
|  |Regular pictures | | |X |
|  |Panorama pictures | | |X |
|  |SD Video recording | | |X |
|  |HD Video recording | | |X |
|Media | | | | |
|  |Playing videos |X | | |
|  |Playing sound |X | | |
|  |Microphone |X | | |
|GPS | |X | | |
|HDMI out | |X | | |
|USB-OTG | | |X | |
|SELinux | | | |X |



Some basic hardware info
-Bluetooth: BCM4330
-GPS: BCM47511
-WiFi: BCMDHD
-Audio: tegra-aic326x
-Touchscreen: ft5x0x_ts
-Accelerometer: lis3dh
-Ambient light sensor: Solteam JSA1127	
-Back camera: s5k5cag
-Front camera: mt9m114

Working GPS combo's:
tf700 gpsconfig.xml gps.tegra.so and kai glgps

Some notes on other repos. ParanoidAndroid uses the following from tf700 (excluding gsm / apps):
device/common
frameworks/av
frameworks/native
hardware/libhardware
hardware/libhardware_legacy


camera.tegra.so
  #libnvomxilclient.so
  libnvos.so
  #libjpeg.so
  #libnvmm_utils.so
  libnvddk_2d_v2.so
    libardrv_dynamic.so
       libnvrm.so
       libnvrm_graphics.so
    libnvos.so
    libnvrm.so
    libnvrm_graphics.so
       libnvrm.so
       libnvos.so
  libnvrm.so
     libnvos.so
  #libnvcamerahdr.so
  #libnvtvmr.so


0: libnvos.so
1: libnvrm.so
2: libnvrm_graphics.so, libardrv_dynamic.so
3: libnvddk_2d_v2.so
