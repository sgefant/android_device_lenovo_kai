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

PRODUCT_NAME := kai
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
    persist.tegra.nvmmlite = 1 \
    persist.sys.NV_FPSLIMIT=0 \
    ro.debuggable=1 \
    tf.enable=y \
    ro.opengles.version = 131072

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
    tinymix \
    tinyplay \
    tinyrec \
    libinvensense_mpl \
    audio.primary.kai \
    power.kai

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

# HW-libs
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/audio_policy.tegra.so:system/lib/hw/audio_policy.tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/camera.tegra.so:system/lib/hw/camera.tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/gps.tegra.so:system/lib/hw/gps.tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/lights.kai.so:system/lib/hw/lights.kai.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/nfc.tegra.so:system/lib/hw/nfc.tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/sensors.kai.so:system/lib/hw/sensors.kai.so \
#    device/lenovo/kai/lenovo-kai-proprietary/hw/ts.default.so:system/lib/hw/ts.default.so
#    device/lenovo/kai/lenovo-kai-proprietary/hw/audio.primary.tegra.so:system/lib/hw/audio.primary.tegra.so \

# Some sensors and associated deps
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/libsensors.base.so:system/lib/libsensors.base.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libsensors.jsa1127.so:system/lib/libsensors.jsa1127.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libsensors.lis3dh.so:system/lib/libsensors.lis3dh.so \
#    device/lenovo/kai/lenovo-kai-proprietary/sensors/libsensors.isl29018.so:system/lib/libsensors.isl29018.so \
#    device/lenovo/kai/lenovo-kai-proprietary/sensors/libsensors.isl29028.so:system/lib/libsensors.isl29028.so \
#    device/lenovo/kai/lenovo-kai-proprietary/sensors/libsensors.mpl.so:system/lib/libsensors.mpl.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libakmd.so:system/lib/libakmd.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libmplmpu.so:system/lib/libmplmpu.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libmllite.so:system/lib/libmllite.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libmlplatform.so:system/lib/libmlplatform.so \
3    device/lenovo/kai/lenovo-kai-proprietary/libinvensense_hal.so:system/lib/libinvensense_hal.so

# TF-daemon
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/tf_daemon:system/bin/tf_daemon \
#    device/lenovo/kai/lenovo-kai-proprietary/libtf_crypto_sst.so:system/lib/libtf_crypto_sst.so 

# TS server
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/rm_ts_server:system/bin/rm_ts_server \
#    device/lenovo/kai/lenovo-kai-proprietary/librm31080.so:system/lib/librm31080.so \
#    device/lenovo/kai/lenovo-kai-proprietary/librm_ts_service.so:system/lib/librm_ts_service.so 

# NVCPUD
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/nvcpud:system/bin/nvcpud \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvcpud.so:system/lib/libnvcpud.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvcpud_client.so:system/lib/libnvcpud_client.so
 
# USB-config
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/usb_config:system/bin/usb_config 

# EGL
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libEGL_perfhud.so:system/lib/egl/libEGL_perfhud.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libEGL_tegra_impl.so:system/lib/egl/libEGL_tegra_impl.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libGLESv1_CM_perfhud.so:system/lib/egl/libGLESv1_CM_perfhud.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libGLESv1_CM_tegra_impl.so:system/lib/egl/libGLESv1_CM_tegra_impl.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libGLESv2_perfhud.so:system/lib/egl/libGLESv2_perfhud.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so \
#    device/lenovo/kai/lenovo-kai-proprietary/egl/libGLESv2_tegra_impl.so:system/lib/egl/libGLESv2_tegra_impl.so

# Nvidia proprietary libs
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/libardrv_dynamic.so:system/lib/libardrv_dynamic.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvaudioservice.so:system/lib/libnvaudioservice.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libcgdrv.so:system/lib/libcgdrv.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvavp.so:system/lib/libnvavp.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvcamerahdr.so:system/lib/libnvcamerahdr.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvcap_video.so:system/lib/libnvcap_video.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvddk_2d.so:system/lib/libnvddk_2d.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvddk_2d_v2.so:system/lib/libnvddk_2d_v2.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvglsi.so:system/lib/libnvglsi.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm.so:system/lib/libnvmm.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_manager.so:system/lib/libnvmm_manager.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_service.so:system/lib/libnvmm_service.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_utils.so:system/lib/libnvmm_utils.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvomxadaptor.so:system/lib/libnvomxadaptor.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvomxilclient.so:system/lib/libnvomxilclient.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvos.so:system/lib/libnvos.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvrm.so:system/lib/libnvrm.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvtvmr.so:system/lib/libnvtvmr.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvwsi.so:system/lib/libnvwsi.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libstagefrighthw.so:system/lib/libstagefrighthw.so 


# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/libaudioavp.so:system/lib/libaudioavp.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvcap.so:system/lib/libnvcap.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvcapclk.so:system/lib/libnvcapclk.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvcontrol_jni.so:system/lib/libnvcontrol_jni.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvhdmi3dplay_jni.so:system/lib/libnvhdmi3dplay_jni.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_asfparser.so:system/lib/libnvmm_asfparser.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_aviparser.so:system/lib/libnvmm_aviparser.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_msaudio.so:system/lib/libnvmm_msaudio.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_vc1_video.so:system/lib/libnvmm_vc1_video.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmmlite_msaudio.so:system/lib/libnvmmlite_msaudio.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvsystemuiext_jni.so:system/lib/libnvsystemuiext_jni.so \


# Prefer Grouper blobs for:
#    device/lenovo/kai/lenovo-kai-proprietary/libnvapputil.so:system/lib/libnvapputil.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvasfparserhal.so:system/lib/libnvasfparserhal.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvaviparserhal.so:system/lib/libnvaviparserhal.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_audio.so:system/lib/libnvmm_audio.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_camera.so:system/lib/libnvmm_camera.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_contentpipe.so:system/lib/libnvmm_contentpipe.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_image.so:system/lib/libnvmm_image.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_parser.so:system/lib/libnvmm_parser.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_video.so:system/lib/libnvmm_video.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmm_writer.so:system/lib/libnvmm_writer.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmmlite.so:system/lib/libnvmmlite.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmmlite_audio.so:system/lib/libnvmmlite_audio.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmmlite_image.so:system/lib/libnvmmlite_image.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmmlite_utils.so:system/lib/libnvmmlite_utils.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvmmlite_video.so:system/lib/libnvmmlite_video.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvodm_dtvtuner.so:system/lib/libnvodm_dtvtuner.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvodm_hdmi.so:system/lib/libnvodm_hdmi.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvodm_imager.so:system/lib/libnvodm_imager.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvodm_misc.so:system/lib/libnvodm_misc.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvodm_query.so:system/lib/libnvodm_query.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvomx.so:system/lib/libnvomx.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvparser.so:system/lib/libnvparser.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvsm.so:system/lib/libnvsm.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libnvwinsys.so:system/lib/libnvwinsys.so 


# Camera
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/nvcamera.conf:system/etc/nvcamera.conf \
#    device/lenovo/kai/lenovo-kai-proprietary/libjpeg.so:system/lib/libjpeg.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libskia.so:system/lib/libskia.so


# Broadcom (Bluetooth, WiFi)
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.le.conf:system/etc/bluetooth/main.conf
#    device/lenovo/kai/lenovo-kai-proprietary/brcm_patchram_plus:system/bin/brcm_patchram_plus \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/bcm4330.hcd:system/etc/firmware/bcm4330.hcd \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/fw_bcmdhd.bin:system/vendor/firmware/bcm4330/fw_bcmdhd.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/fw_bcmdhd_apsta.bin:system/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/fw_bcmdhd_p2p.bin:system/vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/mfg.bin:system/vendor/firmware/bcm4330/mfg.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/nvram_4330.txt:system/etc/nvram_4330.txt \
#    device/lenovo/kai/lenovo-kai-proprietary/bcm4330_bt_fw_loader.sh:system/bin/bcm4330_bt_fw_loader.sh \
#    device/lenovo/kai/lenovo-kai-proprietary/bdaddr:system/etc/bluetooth/bdaddr \

# GPS executables and config
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/glgps:system/bin/glgps \
#    device/lenovo/kai/lenovo-kai-proprietary/gps_util:system/bin/gps_util \
#    device/lenovo/kai/lenovo-kai-proprietary/gpsconfig.xml:system/etc/gps/gpsconfig.xml \
#    device/lenovo/kai/lenovo-kai-proprietary/lto.dat:system/etc/gps/lto.dat 


# Other firmwares
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/nvavp_aud_ucode.bin:system/etc/firmware/nvavp_aud_ucode.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/nvavp_vid_ucode.bin:system/etc/firmware/nvavp_vid_ucode.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/nvavp_os_0ff00000.bin:system/etc/firmware/nvavp_os_0ff00000.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/nvavp_os_eff00000.bin:system/etc/firmware/nvavp_os_eff00000.bin \
#    device/lenovo/kai/lenovo-kai-proprietary/firmware/nvavp_vid_ucode_alt.bin:system/etc/firmware/nvavp_vid_ucode_alt.bin


# WVM Widevine
# PRODUCT_COPY_FILES += \
#    device/lenovo/kai/lenovo-kai-proprietary/libWVStreamControlAPI_L1.so:system/vendor/lib/libWVStreamControlAPI_L1.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libwvdrm_L1.so:system/vendor/lib/libwvdrm_L1.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libwvm.so:system/vendor/lib/libwvm.so \
#    device/lenovo/kai/lenovo-kai-proprietary/libdrmwvmplugin.so:system/vendor/lib/drm/libdrmwvmplugin.so \
#    device/lenovo/kai/lenovo-kai-proprietary/com.google.widevine.software.drm.xml:system/etc/permissions/com.google.widevine.software.drm.xml \
#    device/lenovo/kai/lenovo-kai-proprietary/com.google.widevine.software.drm.jar:system/framework/com.google.widevine.software.drm.jar 


# Misc. E.g., Libasound?
PRODUCT_COPY_FILES += \
    device/lenovo/kai/lenovo-kai-proprietary/bootsound_depop.wav:system/media/audio/notifications/bootsound_depop.wav \
    device/lenovo/kai/lenovo-kai-proprietary/bootsound.wav:system/media/audio/notifications/bootsound.wav \
    device/lenovo/kai/mixer_paths.xml:system/etc/mixer_paths.xml
#    device/lenovo/kai/lenovo-kai-proprietary/libasound.so:system/lib/libasound.so \

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# A2109A specific config files
PRODUCT_COPY_FILES += \
    device/lenovo/kai/lenovo-kai-proprietary/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/lenovo/kai/lenovo-kai-proprietary/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/lenovo/kai/lenovo-kai-proprietary/raydium_ts.idc:system/usr/idc/raydium_ts.idc \
    device/lenovo/kai/lenovo-kai-proprietary/sensor00fn11.idc:system/usr/idc/sensor00fn11.idc \
    device/lenovo/kai/lenovo-kai-proprietary/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    device/lenovo/kai/lenovo-kai-proprietary/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    device/lenovo/kai/lenovo-kai-proprietary/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    device/lenovo/kai/lenovo-kai-proprietary/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    device/lenovo/kai/lenovo-kai-proprietary/Vendor_046d_Product_c21e.kl:system/usr/keylayout/Vendor_046d_Product_c21e.kl \
    device/lenovo/kai/lenovo-kai-proprietary/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    device/lenovo/kai/lenovo-kai-proprietary/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    device/lenovo/kai/lenovo-kai-proprietary/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl \
    device/lenovo/kai/lenovo-kai-proprietary/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/lenovo/kai/lenovo-kai-proprietary/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    device/lenovo/kai/lenovo-kai-proprietary/media_profiles.xml:system/etc/media_profiles.xml \
    device/lenovo/kai/lenovo-kai-proprietary/media_codecs.xml:system/etc/media_codecs.xml \
    device/lenovo/kai/lenovo-kai-proprietary/audio_policy.conf:system/etc/audio_policy.conf \
    device/lenovo/kai/lenovo-kai-proprietary/asound.conf:system/etc/asound.conf \
    device/lenovo/kai/lenovo-kai-proprietary/nvaudio_conf.xml:system/etc/nvaudio_conf.xml \
    device/lenovo/kai/lenovo-kai-proprietary/surround71.conf:system/usr/share/alsa/pcm/surround71.conf \
    device/lenovo/kai/lenovo-kai-proprietary/surround51.conf:system/usr/share/alsa/pcm/surround51.conf \
    device/lenovo/kai/lenovo-kai-proprietary/surround50.conf:system/usr/share/alsa/pcm/surround50.conf \
    device/lenovo/kai/lenovo-kai-proprietary/surround41.conf:system/usr/share/alsa/pcm/surround41.conf \
    device/lenovo/kai/lenovo-kai-proprietary/surround40.conf:system/usr/share/alsa/pcm/surround40.conf \
    device/lenovo/kai/lenovo-kai-proprietary/side.conf:system/usr/share/alsa/pcm/side.conf \
    device/lenovo/kai/lenovo-kai-proprietary/rear.conf:system/usr/share/alsa/pcm/rear.conf \
    device/lenovo/kai/lenovo-kai-proprietary/modem.conf:system/usr/share/alsa/pcm/modem.conf \
    device/lenovo/kai/lenovo-kai-proprietary/iec958.conf:system/usr/share/alsa/pcm/iec958.conf \
    device/lenovo/kai/lenovo-kai-proprietary/front.conf:system/usr/share/alsa/pcm/front.conf \
    device/lenovo/kai/lenovo-kai-proprietary/dsnoop.conf:system/usr/share/alsa/pcm/dsnoop.conf \
    device/lenovo/kai/lenovo-kai-proprietary/dpl.conf:system/usr/share/alsa/pcm/dpl.conf \
    device/lenovo/kai/lenovo-kai-proprietary/dmix.conf:system/usr/share/alsa/pcm/dmix.conf \
    device/lenovo/kai/lenovo-kai-proprietary/default.conf:system/usr/share/alsa/pcm/default.conf \
    device/lenovo/kai/lenovo-kai-proprietary/center_lfe.conf:system/usr/share/alsa/pcm/center_lfe.conf \
    device/lenovo/kai/lenovo-kai-proprietary/aliases.conf:system/usr/share/alsa/cards/aliases.conf \
    device/lenovo/kai/lenovo-kai-proprietary/alsa.conf:system/usr/share/alsa/alsa.conf \
#    device/lenovo/kai/lenovo-kai-proprietary/com.nvidia.nvstereoutils.xml:system/etc/permissions/com.nvidia.nvstereoutils.xml


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
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml
