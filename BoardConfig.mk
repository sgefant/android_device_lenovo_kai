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
TARGET_CPU_VARIANT := cortex-a9

TARGET_NO_RADIOIMAGE := true

TARGET_USERIMAGES_USE_EXT4 := true
TARGET_BOOTLOADER_BOARD_NAME := a2109a

BOARD_KERNEL_CMDLINE := androidboot.selinux=enforcing
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
#WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/bcm4329.ko"
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

TARGET_BOOTLOADER_BOARD_NAME := kai
#TARGET_BOARD_INFO_FILE := device/lenovo/kai/board-info.txt

TARGET_NO_BOOTLOADER := true

BOARD_USES_GENERIC_INVENSENSE := false

# Audio Options
USE_PROPRIETARY_AUDIO_EXTENSIONS := true
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_ALSA_AUDIO := false
BOARD_USES_TINY_AUDIO_HW := false
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true
BOARD_HAVE_PRE_KITKAT_AUDIO_POLICY_BLOB := true
COMMON_GLOBAL_CFLAGS += -DMR0_AUDIO_BLOB

# Camera options
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Kai HAL libraries
BOARD_HAL_STATIC_LIBRARIES := \
    libdumpstate.kai

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
USE_OPENGL_RENDERER := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_EGL_CFG := device/lenovo/kai/config/egl.cfg
BOARD_EGL_SKIP_FIRST_DEQUEUE := true
BOARD_EGL_WORKAROUND_BUG_10194508 := true
BOARD_USE_MHEAP_SCREENSHOT := true

ifneq ($(HAVE_NVIDIA_PROP_SRC),false)
# needed for source compilation of nvidia libraries
-include vendor/nvidia/proprietary_src/build/definitions.mk
-include vendor/nvidia/build/definitions.mk
endif

BOARD_SEPOLICY_DIRS := \
        device/lenovo/kai/sepolicy

BOARD_SEPOLICY_UNION := \
        file_contexts \
        genfs_contexts \
        app.te \
        btmacwriter.te \
        device.te \
        init_shell.te \
        file.te \
        rild.te \
        sensors_config.te \
        surfaceflinger.te \
        system.te \
        zygote.te

# Avoid the generation of ldrcc instructions
NEED_WORKAROUND_CORTEX_A9_745320 := true

TARGET_RECOVERY_FSTAB = device/lenovo/kai/fstab.kai

# Required for CWM
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := false
