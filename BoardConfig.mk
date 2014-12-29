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

#BOARD_KERNEL_CMDLINE := tegraid=30.1.3.0.0 mem=1022M@2048M commchip_id=0 androidboot.countrycode=UK androidboot.serialno=FD60295900 androidboot.commchip_id=0 video=tegrafb no_console_suspend=1 console=null,115200n8 debug_uartport=lsport,3 usbcore.old_scheme_first=1 lp0_vec=8192@0xbddf9000 tegra_fbmem=8197120@0xabc01000 core_edp_mv=0 displayboard=0x802a:0x50a0:0x35:0x80:0x00 board_info=f41:a00:1:44:2 tegraboot=sdmmc gpt gpt_sector=30535679 androidboot.hw_ramcode=0 androidboot.board_strap=1 androidboot.bootloader=20121126.15:56 android.kerneltype=normal
BOARD_KERNEL_CMDLINE := tegraid=30.1.3.0.0 mem=1022M@2048M commchip_id=0 androidboot.commchip_id=0 video=tegrafb no_console_suspend=1 console=null,115200n8 debug_uartport=lsport,3 usbcore.old_scheme_first=1 lp0_vec=8192@0xbddf9000 tegra_fbmem=8197120@0xabc01000 core_edp_mv=0 displayboard=0x802a:0x50a0:0x35:0x80:0x00 board_info=f41:a00:1:44:2 tegraboot=sdmmc gpt gpt_sector=30535679 androidboot.hw_ramcode=0 androidboot.board_strap=1
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
