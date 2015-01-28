USE_CAMERA_STUB := false
# TARGET_RECOVERY_UI_LIB := librecovery_ui_a2109a
RECOVERY_FSTAB_VERSION := 2

# inherit from the proprietary version
-include vendor/lenovo/kai/BoardConfigVendor.mk
include device/lenovo/kai/BoardConfigCommon.mk

TARGET_BOARD_PLATFORM := tegra3
TARGET_TEGRA_VERSION := t30
 
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

TARGET_NO_RADIOIMAGE := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_BOOTLOADER_BOARD_NAME := a2109a

BOARD_KERNEL_CMDLINE := tegraid=30.1.3.0.0 mem=1022M@2048M commchip_id=0 androidboot.commchip_id=0 video=tegrafb no_console_suspend=1 console=null,115200n8 debug_uartport=lsport,3 usbcore.old_scheme_first=1 lp0_vec=8192@0xbddf9000 tegra_fbmem=8197120@0xabc01000 core_edp_mv=0 displayboard=0x802a:0x50a0:0x35:0x80:0x00 board_info=f41:a00:1:44:2 tegraboot=sdmmc gpt gpt_sector=30535679 androidboot.hw_ramcode=0 androidboot.board_strap=1
#BOARD_KERNEL_CMDLINE := tegraid=30.1.3.0.0 mem=1022M@2048M commchip_id=0 androidboot.commchip_id=0 no_console_suspend=1 console=null,115200n8 debug_uartport=lsport,3 usbcore.old_scheme_first=1 lp0_vec=8192@0xbddf9000 tegra_fbmem=8197120@0xabc01000 core_edp_mv=0 displayboard=0x802a:0x50a0:0x35:0x80:0x00 board_info=f41:a00:1:44:2 tegraboot=sdmmc gpt gpt_sector=30535679 androidboot.hw_ramcode=0 androidboot.board_strap=1
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_PREBUILT_KERNEL := device/lenovo/kai/kernel
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 805306368
BOARD_FLASH_BLOCK_SIZE := 4096

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

# Required for CWM
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
# TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true

# TWRP
DEVICE_RESOLUTION := 1280x800
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := false

RECOVERY_GRAPHICS_USE_LINELENGTH := false
TW_INCLUDE_DUMLOCK := false
TW_NO_BATT_PERCENT := false
TW_CUSTOM_POWER_BUTTON := 107
TW_NO_REBOOT_BOOTLOADER := false
TW_NO_REBOOT_RECOVERY := false
TW_NO_USB_STORAGE := false
RECOVERY_TOUCHSCREEN_SWAP_XY := false
RECOVERY_TOUCHSCREEN_FLIP_Y := false
RECOVERY_TOUCHSCREEN_FLIP_X := false
TW_ALWAYS_RMRF := false
TW_NEVER_UNMOUNT_SYSTEM := false
TW_INCLUDE_INJECTTWRP := false
TW_DEFAULT_EXTERNAL_STORAGE := false
TWRP_EVENT_LOGGING := true
BOARD_HAS_FLIPPED_SCREEN := false
