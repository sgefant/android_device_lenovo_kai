$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# This directory did not exist, adapted from grouper proprietary files
$(call inherit-product-if-exists, vendor/lenovo/kai/device-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/lenovo/kai/overlay

LOCAL_PATH := device/lenovo/kai
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/lenovo/kai/fstab.kai:root/fstab.kai \
    device/lenovo/kai/init.kai.rc:root/init.kai.rc

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
    device/lenovo/kai/kai-blobs/libnvos.so:system/lib/libnvos.so

$(call inherit-product, build/target/product/full.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    persist.sys.usb.config=mtp,adb \

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0 \
    ro.sf.lcd_density=240 \
    ro.sf.override_null_lcd_density = 1

PRODUCT_NAME := kai
PRODUCT_DEVICE := kai
PRODUCT_MODEL := Lenovo A2109A
