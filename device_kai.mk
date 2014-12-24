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

# EGL
PRODUCT_COPY_FILES += \
    device/lenovo/kai/kai-blobs/egl.cfg:system/lib/egl/egl.cfg \
    device/lenovo/kai/kai-blobs/gralloc.tegra.so:system/lib/hw/gralloc.tegra3.so \
    device/lenovo/kai/kai-blobs/hwcomposer.tegra.so:system/lib/hw/hwcomposer.tegra3.so \
    device/lenovo/kai/kai-blobs/libEGL_tegra_impl.so:system/lib/egl/libEGL_tegra_impl.so \
    device/lenovo/kai/kai-blobs/libnvrm.so:system/lib/libnvrm.so \
    device/lenovo/kai/kai-blobs/libnvcap_video.so:system/lib/libnvcap_video.so \
    device/lenovo/kai/kai-blobs/libnvomxadaptor.so:system/lib/libnvomxadaptor.so


$(call inherit-product, build/target/product/full.mk)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.carrier=wifi-only \
    persist.sys.usb.config=mtp,adb
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := kai
PRODUCT_DEVICE := kai
PRODUCT_MODEL := Lenovo A2109A
