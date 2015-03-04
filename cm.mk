# Release name
PRODUCT_RELEASE_NAME := kai

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 800

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/lenovo/kai/full_kai.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kai
PRODUCT_NAME := cm_kai
PRODUCT_BRAND := Ideatab
PRODUCT_MODEL := A2109A
PRODUCT_MANUFACTURER := Lenovo

# Don't restrict vendor folder
PRODUCT_RESTRICT_VENDOR_FILES := false

##Set build fingerprint / ID / Product Name ect.
##PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=cm_kai BUILD_FINGERPRINT="lenovo/cm_kai/a2109a:4.3/JWR66V/000001:userdebug/test-keys" PRIVATE_BUILD_DESC="cm_kai-userdebug 4.3 JWR66V 000001 test-keys"
