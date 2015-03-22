$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# This directory did not exist, adapted from grouper proprietary files
$(call inherit-product-if-exists, vendor/lenovo/kai/device-vendor.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/kai/overlay

LOCAL_PATH := device/lenovo/kai
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_NAME := full_kai
PRODUCT_DEVICE := kai
PRODUCT_MODEL := Lenovo A2109A


PRODUCT_AAPT_CONFIG := normal large tvdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := tvdpi
    
# Init files
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/lenovo/kai/fstab.kai:root/fstab.kai \
    device/lenovo/kai/init.kai.rc:root/init.kai.rc \
    device/lenovo/kai/init.tf.rc:root/init.tf.rc \
    device/lenovo/kai/init.IdeaTabA2109A_board.usb.rc:root/init.IdeaTabA2109A_board.usb.rc \
    device/lenovo/kai/ueventd.kai.rc:root/ueventd.kai.rc \
    device/lenovo/kai/vold.fstab:system/etc/vold.fstab 

# Kernel modules
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kernel-modules/baseband_usb_chr.ko:system/lib/modules/baseband_usb_chr.ko \
    device/lenovo/kai/kernel-modules/baseband-xmm-power2.ko:system/lib/modules/baseband-xmm-power2.ko \
    device/lenovo/kai/kernel-modules/bcmdhd.ko:system/lib/modules/bcmdhd.ko \
    device/lenovo/kai/kernel-modules/cfg80211.ko:system/lib/modules/cfg80211.ko \
    device/lenovo/kai/kernel-modules/inv_mpu_ak8975.ko:system/lib/modules/inv_mpu_ak8975.ko \
    device/lenovo/kai/kernel-modules/inv_mpu_ak89xx.ko:system/lib/modules/inv_mpu_ak89xx.ko \
    device/lenovo/kai/kernel-modules/inv_mpu_kxtf9.ko:system/lib/modules/inv_mpu_kxtf9.ko \
    device/lenovo/kai/kernel-modules/lib80211.ko:system/lib/modules/lib80211.ko \
    device/lenovo/kai/kernel-modules/mac80211.ko:system/lib/modules/mac80211.ko \
    device/lenovo/kai/kernel-modules/mpu3050.ko:system/lib/modules/mpu3050.ko \
    device/lenovo/kai/kernel-modules/mpu6050b1.ko:system/lib/modules/mpu6050b1.ko \
    device/lenovo/kai/kernel-modules/raw_ip_net.ko:system/lib/modules/raw_ip_net.ko \
    device/lenovo/kai/kernel-modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko \
    device/lenovo/kai/kernel-modules/tcrypt.ko:system/lib/modules/tcrypt.ko 

# Build characteristics setting 
PRODUCT_CHARACTERISTICS := tablet


PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=15 \
    ro.wifi.channels=14 \
    ap.interface=wlan0 \
    ro.carrier=wifi-only \
    ro.sf.lcd_density=160 \
    ro.sf.override_null_lcd_density = 1 \
    keyguard.no_require_sim=true \
    persist.sys.usb.config=mtp,adb \
    drm.service.enabled=true \
    persist.sys.NV_FPSLIMIT=0 \
    ro.debuggable=1 \
    tf.enable=y \
    ro.opengles.version = 131072 \
    persist.tegra.nvmmlite = 1 

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
# From Grouper and additions from superhansi (NvCPLSvc and further down the list)
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.usb.default \
    librs_jni \
    make_ext4fs \
    setup_fs \
    l2ping \
    hcitool \
    bttest \
    com.android.future.usb.accessory \
    whisperd \
    NvCPLSvc \
    libaudioutils \
    libinvensense_mpl \
    libnetcmdiface \
    keymaster.kai
#    tinymix \
#    tinyplay \
#    tinyrec \
#    audio.primary.kai \
#    power.kai

    #lights.grouper \


# for bugmailer
PRODUCT_PACKAGES += send_bug
PRODUCT_COPY_FILES += \
    system/extras/bugmailer/bugmailer.sh:system/bin/bugmailer.sh \
    system/extras/bugmailer/send_bug:system/bin/send_bug

# NFC packages, from grouper
#PRODUCT_PACKAGES += \
#    nfc.grouper \
#    libnfc \
#    libnfc_jni \
#    Nfc \
#    Tag \
#    com.android.nfc_extras

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# Broadcom (Bluetooth, WiFi)
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.le.conf:system/etc/bluetooth/main.conf \
    device/lenovo/kai/lenovo-kai-proprietary/etc/bluetooth/bdaddr:system/etc/bluetooth/bdaddr

# A2109A specific config files
PRODUCT_COPY_FILES += \
    device/lenovo/kai/lenovo-kai-proprietary/usr/idc/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/lenovo/kai/lenovo-kai-proprietary/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/lenovo/kai/lenovo-kai-proprietary/usr/idc/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
    device/lenovo/kai/lenovo-kai-proprietary/usr/idc/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Vendor_046d_Product_c21e.kl:system/usr/keylayout/Vendor_046d_Product_c21e.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/lenovo/kai/lenovo-kai-proprietary/usr/keylayout/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    device/lenovo/kai/config/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
    device/lenovo/kai/config/gps.conf:system/etc/gps.conf \
    device/lenovo/kai/config/media_profiles.xml:system/etc/media_profiles.xml \
    device/lenovo/kai/config/media_codecs.xml:system/etc/media_codecs.xml \
    device/lenovo/kai/config/audio_policy.conf:system/etc/audio_policy.conf \
    device/lenovo/kai/lenovo-kai-proprietary/etc/asound.conf:system/etc/asound.conf \
    device/lenovo/kai/lenovo-kai-proprietary/etc/enctune.conf:system/etc/enctune.conf \
    device/lenovo/kai/config/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    device/lenovo/kai/config/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/side.conf:system/usr/share/alsa/pcm/side.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/front.conf:system/usr/share/alsa/pcm/front.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/default.conf:system/usr/share/alsa/pcm/default.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/pcm/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/cards/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    device/lenovo/kai/lenovo-kai-proprietary/usr/share/alsa/alsa.conf:system/usr/share/alsa/alsa.conf 

# GPS ; This is the GPS HAL from asus tf700
PRODUCT_COPY_FILES += \
    device/lenovo/kai/blobs/gps.tegra.so:system/lib/hw/gps.tegra.so

# Camera...
PRODUCT_COPY_FILES += \
    device/lenovo/kai/lenovo-kai-proprietary/lib/libjpeg.so:system/lib/libjpeg.so
    #device/lenovo/kai/lenovo-kai-proprietary/lib/libskia.so:system/lib/libskia.so 

# Miscellaneous
PRODUCT_COPY_FILES += \
    device/lenovo/kai/lenovo-kai-proprietary/media/audio/notifications/bootsound_depop.wav:system/media/audio/notifications/bootsound_depop.wav \
    device/lenovo/kai/lenovo-kai-proprietary/media/audio/notifications/bootsound.wav:system/media/audio/notifications/bootsound.wav 
    #device/lenovo/kai/mixer_paths.xml:system/etc/mixer_paths.xml
    #device/lenovo/kai/nvstereoutils/com.nvidia.nvstereoutils.jar:system/framework/com.nvidia.nvstereoutils.jar \
    #device/lenovo/kai/nvstereoutils/com.nvidia.nvstereoutils.xml:system/etc/permissions/com.nvidia.nvstereoutils.xml \
    #device/lenovo/kai/nvstereoutils/libnvstereoutils_jni.so:system/lib/libnvstereoutils_jni.so \


# Add permissions, copied straight from grouper
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
