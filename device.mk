#
#  Copyright (C) 2024 The 2by2 Project
#
#  SPDX-License-Identifier: Apache-2.0
#

# Init
PRODUCT_PACKAGES += \
    camera_patch.rc \
    camera_patch.sh

# Prebuilts
PRODUCT_COPY_FILES += \
    $(call find-copy-subdir-files,*,device/google/akita-camera/apex_overlay/,$(TARGET_COPY_OUT_VENDOR)/apex_overlay/)

# Shim
PRODUCT_PACKAGES += \
    libshim_pixel_camera
