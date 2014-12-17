USE_CAMERA_STUB := true
# TARGET_RECOVERY_UI_LIB := librecovery_ui_a2109a
RECOVERY_FSTAB_VERSION := 2

# inherit from the proprietary version
-include vendor/lenovo/kai/BoardConfigVendor.mk
include device/lenovo/kai/BoardConfigCommon.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_BOOTLOADER_BOARD_NAME := a2109a

BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# fix this up by examining /proc/mtd on a running device

TARGET_PREBUILT_KERNEL := device/lenovo/kai/kernel
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 681574400
BOARD_USERDATAIMAGE_PARTITION_SIZE := 6567231488
BOARD_FLASH_BLOCK_SIZE := 4096

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Required for CWM
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
# TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
