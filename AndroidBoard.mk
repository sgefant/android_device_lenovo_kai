LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

file := $(INSTALLED_KERNEL_TARGET)
ALL_PREBUILT += $(file)
$(file): $(TARGET_PREBUILT_KERNEL) | $(ACP)
    $(transform-prebuilt-to-target)

# include the non-open-source counterpart to this file
-include vendor/lenovo/kai/BoardConfigVendor.mk
