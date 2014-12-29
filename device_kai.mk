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
    
PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/lenovo/kai/fstab.kai:root/fstab.kai \
    device/lenovo/kai/init.kai.rc:root/init.kai.rc \
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
    ap.interface=wlan0 \
    ro.carrier=wifi-only \
    ro.sf.lcd_density=160 \
    ro.sf.override_null_lcd_density = 1 \
    persist.sys.usb.config=mtp,adb \
    #tf.enable=y \
    #drm.service.enabled=true

include frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

# HW
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/hw/gralloc.tegra.so:system/lib/hw/gralloc.tegra3.so \
    device/lenovo/kai/kai-blobs/hw/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra3.so \
    device/lenovo/kai/kai-blobs/hw/audio.primary.tegra.so:system/lib/hw/audio.primary.tegra.so \
    device/lenovo/kai/kai-blobs/hw/audio_policy.tegra.so:system/lib/hw/audio_policy.tegra.so \
    device/lenovo/kai/kai-blobs/hw/camera.tegra.so:system/lib/hw/camera.tegra.so \
    device/lenovo/kai/kai-blobs/hw/gps.tegra.so:system/lib/hw/gps.tegra.so \
    device/lenovo/kai/kai-blobs/hw/lights.kai.so:system/lib/hw/lights.kai.so \
    device/lenovo/kai/kai-blobs/hw/nfc.tegra.so:system/lib/hw/nfc.tegra.so \
    device/lenovo/kai/kai-blobs/hw/sensors.kai.so:system/lib/hw/sensors.kai.so \
    device/lenovo/kai/kai-blobs/hw/ts.default.so:system/lib/hw/ts.default.so

# HW deps unique to a2109a, not available as oss Android
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/libaudioavp.so:system/lib/libaudioavp.so \
    device/lenovo/kai/kai-blobs/libnvaudioservice.so:system/lib/libnvaudioservice.so \
    device/lenovo/kai/kai-blobs/libsensors.base.so:system/lib/libsensors.base.so \
    device/lenovo/kai/kai-blobs/libsensors.jsa1127.so:system/lib/libsensors.jsa1127.so \
    device/lenovo/kai/kai-blobs/libsensors.lis3dh.so:system/lib/libsensors.lis3dh.so 

# Some sensors and associated unique deps
PRODUCT_COPY_FILES += \
   device/lenovo/kai/kai-blobs/sensors/libsensors.isl29018.so:system/lib/libsensors.isl29018.so \
   device/lenovo/kai/kai-blobs/sensors/libsensors.isl29028.so:system/lib/libsensors.isl29028.so \
   device/lenovo/kai/kai-blobs/sensors/libsensors.mpl.so:system/lib/libsensors.mpl.so \
   device/lenovo/kai/kai-blobs/libmplmpu.so:system/lib/libmplmpu.so \
   device/lenovo/kai/kai-blobs/libakmd.so:system/lib/libakmd.so

# EGL
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/egl/libEGL_perfhud.so:system/lib/egl/libEGL_perfhud.so \
    device/lenovo/kai/kai-blobs/egl/libEGL_tegra.so:system/lib/egl/libEGL_tegra.so \
    device/lenovo/kai/kai-blobs/egl/libEGL_tegra_impl.so:system/lib/egl/libEGL_tegra_impl.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv1_CM_perfhud.so:system/lib/egl/libGLESv1_CM_perfhud.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv1_CM_tegra.so:system/lib/egl/libGLESv1_CM_tegra.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv1_CM_tegra_impl.so:system/lib/egl/libGLESv1_CM_tegra_impl.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv2_perfhud.so:system/lib/egl/libGLESv2_perfhud.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv2_tegra.so:system/lib/egl/libGLESv2_tegra.so \
    device/lenovo/kai/kai-blobs/egl/libGLESv2_tegra_impl.so:system/lib/egl/libGLESv2_tegra_impl.so \
    device/lenovo/kai/kai-blobs/libnvrm.so:system/lib/libnvrm.so \
    device/lenovo/kai/kai-blobs/libnvrm_graphics.so:system/lib/libnvrm_graphics.so \
    device/lenovo/kai/kai-blobs/libnvcap_video.so:system/lib/libnvcap_video.so \
    device/lenovo/kai/kai-blobs/libnvomxadaptor.so:system/lib/libnvomxadaptor.so \
    device/lenovo/kai/kai-blobs/libnvglsi.so:system/lib/libnvglsi.so \
    device/lenovo/kai/kai-blobs/libnvos.so:system/lib/libnvos.so \
    device/lenovo/kai/kai-blobs/libnvddk_2d.so:system/lib/libnvddk_2d.so \
    device/lenovo/kai/kai-blobs/libnvwsi.so:system/lib/libnvwsi.so \
    device/lenovo/kai/kai-blobs/libardrv_dynamic.so:system/lib/libardrv_dynamic.so \
    device/lenovo/kai/kai-blobs/libcgdrv.so:system/lib/libcgdrv.so

# Camera
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/libjpeg.so:system/lib/libjpeg.so \
    device/lenovo/kai/kai-blobs/libskia.so:system/lib/libskia.so \
    device/lenovo/kai/kai-blobs/libnvavp.so:system/lib/libnvavp.so \
    device/lenovo/kai/kai-blobs/libnvcamerahdr.so:system/lib/libnvcamerahdr.so \
    device/lenovo/kai/kai-blobs/libnvddk_2d_v2.so:system/lib/libnvddk_2d_v2.so \
    device/lenovo/kai/kai-blobs/libnvmm_manager.so:system/lib/libnvmm_manager.so \
    device/lenovo/kai/kai-blobs/libnvmm_service.so:system/lib/libnvmm_service.so \
    device/lenovo/kai/kai-blobs/libnvmm_utils.so:system/lib/libnvmm_utils.so \
    device/lenovo/kai/kai-blobs/libnvomxilclient.so:system/lib/libnvomxilclient.so \
    device/lenovo/kai/kai-blobs/libnvtvmr.so:system/lib/libnvtvmr.so


# WVM
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/libwvm.so:system/vendor/lib/libwvm.so

# Some executables
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/glgps:system/bin/glgps \
    device/lenovo/kai/kai-blobs/brcm_patchram_plus:system/bin/brcm_patchram_plus

# A2109A specific config files and firmware
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-confs/ft5x0x_ts.idc:system/usr/idc/ft5x0x_ts.idc \
    device/lenovo/kai/kai-confs/qwerty2.idc:system/usr/qwerty2.idc \
    device/lenovo/kai/kai-confs/raydium_ts.idc:system/usr/raydium_ts.idc \
    device/lenovo/kai/kai-confs/sensor00fn11.idc:system/usr/sensor00fn11.idc \
    device/lenovo/kai/kai-confs/nvcamera.conf:etc/nvcamera.conf \
    device/lenovo/kai/kai-confs/Bluetooth_00_06_66_42.kl:system/usr/keylayout/Bluetooth_00_06_66_42.kl \
    device/lenovo/kai/kai-confs/Vendor_044f_Product_d007.kl:system/usr/keylayout/Vendor_044f_Product_d007.kl \
    device/lenovo/kai/kai-confs/Vendor_045e_Product_0719.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl \
    device/lenovo/kai/kai-confs/Vendor_046d_Product_c21d.kl:system/usr/keylayout/Vendor_046d_Product_c21d.kl \
    device/lenovo/kai/kai-confs/Vendor_046d_Product_c21e.kl:system/usr/keylayout/Vendor_046d_Product_c21e.kl \
    device/lenovo/kai/kai-confs/Vendor_046d_Product_c21f.kl:system/usr/keylayout/Vendor_046d_Product_c21f.kl \
    device/lenovo/kai/kai-confs/Vendor_057e_Product_0306.kl:system/usr/keylayout/Vendor_057e_Product_0306.kl \
    device/lenovo/kai/kai-confs/Vendor_2378_Product_100a.kl:system/usr/keylayout/Vendor_2378_Product_100a.kl \
    device/lenovo/kai/kai-confs/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/lenovo/kai/kai-confs/tegra-kbc.kl:system/usr/keylayout/tegra-kbc.kl \
    device/lenovo/kai/kai-confs/nvram_4330.txt:system/etc/nvram_4330.txt \
    device/lenovo/kai/kai-blobs/firmware/bcm4330.hcd:system/etc/firmware/bcm4330.hcd \
    device/lenovo/kai/kai-blobs/firmware/fw_bcmdhd.bin:system/vendor/firmware/bcm4330/fw_bcmdhd.bin \
    device/lenovo/kai/kai-blobs/firmware/fw_bcmdhd_apsta.bin:system/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin \
    device/lenovo/kai/kai-blobs/firmware/fw_bcmdhd_p2p.bin:system/vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin \
    device/lenovo/kai/kai-blobs/firmware/mfg.bin:system/vendor/firmware/bcm4330/mfg.bin \
    device/lenovo/kai/kai-confs/bcm4330_bt_fw_loader.sh:/system/bin/bcm4330_bt_fw_loader.sh \
    device/lenovo/kai/kai-blobs/firmware/nvavp_aud_ucode.bin:system/etc/firmware/nvavp_aud_ucode.bin \
    device/lenovo/kai/kai-blobs/firmware/nvavp_vid_ucode.bin:system/etc/firmware/nvavp_vid_ucode.bin


