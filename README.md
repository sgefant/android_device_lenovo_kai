android_device_lenovo_kai
=========================

Lenovo Ideatab A2109A (kai)

This is cm-12.1 for Lenovo Ideatab A2109A (kai)

Special thanks to the tf700t and tf300t developers for Cyanogenmod:
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
|  |Client mode | | |X |
|  |P2P | | |X |
|Bluetooth | | | |
|  |Send files | | |X |
|  |Receive files | | |X |
|  |Headset | | |X |
|  |Browse files | | |X |
|Camera | | | | |
|  |Preview | | |X |
|  |Regular pictures | | |X |
|  |Panorama pictures | | |X |
|  |SD Video recording | | |X |
|  |HD Video recording | | |X |
|Media | | | |X |
|  |Playing videos | | |X |
|  |Playing sound | | |X |
|  |Microphone | | |X |
|GPS | | | |X |
|HDMI out | | | |X |
|USB-OTG | | | |X |
|SELinux | | | |X |


Other tegra3 devices and their repos:
grouper (Nexus 7 2012)
https://github.com/CyanogenMod/android_device_asus_grouper
devs: Lloir, jrizzoli, thoemy, dhacker29
https://android.googlesource.com/device/asus/grouper/

tf300t (Asus Transformer Pad TF300T)
https://github.com/CyanogenMod/android_device_asus_tf300t
devs: chrmhoffmann, jruesga, dasunsrule32

tf700t (Asus Transformer Pad Infinity TF700T)
https://github.com/CyanogenMod/android_device_asus_tf700t
devs: jruesga, dasunsrule32, tombriden, rmcc

a500 (Acer Iconia A500 Picasso)
https://github.com/CyanogenMod/android_device_acer_a500

p880 (LG Optimus 4X HD)
https://github.com/CyanogenMod/android_device_lge_p880
devs: Ntemis, rmcc
https://github.com/P880-dev/proprietary_vendor_lge
devs: laufersteppenwolf

endeavoru (HTC One X)
https://github.com/CyanogenMod/android_device_htc_endeavoru
enrc2b (HTC One X+ (international))
https://github.com/cyanogenmod/android_device_htc_enrc2b
https://github.com/CyanogenMod/android_device_htc_tegra3-common
devs: Lloir, thoemy


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


Try from grouper
libEGL_tegra.so
libEGL_tegra_impl.so
libGLESv1_CM_tegra.so
libGLESv2_tegra.so
libGLESv1_CM_tegra_impl.so
libGLESv2_tegra_impl.so
libnvwsi.tegra.so
libnvos.so
hwcomposer.tegra.so
libcgdrv.so
gralloc.tegra.so
libnvddk_2d_v2.so

libstagefrighthw.so
#libnvmm* ### THIS IS ALSO PROBLEMATIC: OMX GRAPH CREATION FAILED

libnvrm.so ### THIS IS ALSO PROBLEMATIC: OMX GRAPH CREATION FAILED
libnvrm_graphics.so  ### THIS IS ALSO PROBLEMATIC: OMX GRAPH CREATION FAILED
libardrv_dynamic.so ### THIS IS THE PROBLEMATIC LIB FOR THE CAM!

Note-- If I then add 
libnvrm.so
libnvrm_graphics.so
libardrv_dynamic.so
... it is actually libnvomx.so that appears to choke, in the camera thread

And after adding libnvomx.so:
connectCameraGraph: setup video port [1280x720] failed
