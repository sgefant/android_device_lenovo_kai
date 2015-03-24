# Copyright (C) 2010 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

USE_CAMERA_STUB := false
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# TARGET_RECOVERY_UI_LIB := librecovery_ui_a2109a
RECOVERY_FSTAB_VERSION := 2

# inherit from the proprietary version
-include vendor/lenovo/kai/BoardConfigVendor.mk

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
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

TARGET_PREBUILT_KERNEL := device/lenovo/kai/kernel
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 671088640
BOARD_USERDATAIMAGE_PARTITION_SIZE := 805306368
BOARD_FLASH_BLOCK_SIZE := 4096

BOARD_HAVE_WIFI := true
# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
#WIFI_DRIVER_MODULE_NAME     := "bcmdhd"
##WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcmdhd.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/bcm4330/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin"

TARGET_BOOTLOADER_BOARD_NAME := kai
#TARGET_BOARD_INFO_FILE := device/lenovo/a2109a/board-info.txt

TARGET_NO_BOOTLOADER := true

BOARD_USES_GENERIC_INVENSENSE := false

# Audio Options
USE_PROPRIETARY_AUDIO_EXTENSIONS := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_TINY_AUDIO_HW := false
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

# Camera
#COMMON_GLOBAL_CFLAGS += -DMR0_CAMERA_BLOB

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/lenovo/kai/bluetooth/vnd_kai.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/lenovo/kai/bluetooth

# Use Cortex A9 optimizations for A7
USE_ALL_OPTIMIZED_STRING_FUNCS := true

# Turn on Cortex A9 Optimizations for A7
TARGET_EXTRA_CFLAGS += $(call cc-option,-mtune=cortex-a9) $(call cc-option,-mcpu=cortex-a9)

# EGL
BOARD_USES_HGL := true
BOARD_EGL_NEEDS_LEGACY_FB := true
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/lenovo/kai/config/egl.cfg
ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# needed for source compilation of nvidia libraries
-include vendor/nvidia/proprietary_src/build/definitions.mk
-include vendor/nvidia/build/definitions.mk
endif

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
