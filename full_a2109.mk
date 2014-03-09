#
# This file is the build configuration for a full Android
# build for grouper hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, device/Lenovo/A2109A/device.mk)
# This is where we'd set a backup provider if we had one
#$(call inherit-product, device/sample/products/backup_overlay.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := full_A2109A
PRODUCT_DEVICE := A2109A
PRODUCT_BRAND := Android
# Don't restrict vendor folder
PRODUCT_RESTRICT_VENDOR_FILES := false
PRODUCT_MODEL := CyanogenMod on A2109A
