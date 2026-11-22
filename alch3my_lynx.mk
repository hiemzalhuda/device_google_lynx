#
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#
# alch3my_lynx.mk — DRAFT port of lynx (Pixel 7a) to Alch3myOS 17
# Source pattern: Alch3myOS-Devices/device_google_grizzly branch 17,
# file alch3my_grizzly.mk (Pixel 11 Pro, Android 17).
# Hardware kept from: Alch3myOS-Devices/device_google_lynx branch 16,
# file lineage_lynx.mk (Pixel 7a, Android 16).
# DO NOT flash this as-is: fingerprint below is a TODO, see README-PORTING.md.
#

# Inherit some Alch3myOS stuff (was vendor/lineage in lineage_lynx.mk)
$(call inherit-product, vendor/alch3my/config/common_full_phone.mk)

# Alch3myOS flags — mirrored from alch3my_grizzly.mk
# UDFPS: confirmed for lynx, see lynx/vendor.prop
#   persist.vendor.udfps.als_feed_forward_supported=true
#   persist.vendor.udfps.lhbm_controlled_in_hal_supported=true
# Quick Tap / Face Unlock: Pixel 7a supports both in stock; verify on
# first boot if Face Unlock (TARGET_SUPPORTS_GFU) misbehaves, drop it.
WITH_GMS := true
ALCH3MY_BUILD_TYPE := UNOFFICIAL
IS_PIXEL := true
TARGET_HAS_UDFPS := true
TARGET_SUPPORTS_QUICK_TAP := true
TARGET_DOES_NOT_SUPPORT_GOOGLE_BATTERY := false
TARGET_FACE_UNLOCK_SUPPORTED := true
TARGET_SUPPORTS_GFU := true

DEVICE_CODENAME := lynx
DEVICE_PATH := device/google/lynx
VENDOR_PATH := vendor/google/lynx
$(call inherit-product, $(DEVICE_PATH)/aosp_$(DEVICE_CODENAME).mk)

PRODUCT_NAME := alch3my_$(DEVICE_CODENAME)
PRODUCT_SYSTEM_BRAND := google
PRODUCT_SYSTEM_MANUFACTURER := Google
PRODUCT_SYSTEM_NAME := generic_system_google

# Boot animation — kept from lineage_lynx.mk (Pixel 7a, 1080x2400)
TARGET_SCREEN_HEIGHT := 2400
TARGET_SCREEN_WIDTH := 1080

# Report the stock build these blobs come from; update it with the blobs.
# TODO: replace TODO_17_BUILD_ID / TODO_17_BUILD_NUMBER with the real
# stock Android 17 build for lynx (factory image / vendor blobs).
# Do NOT keep the old Android 16 fingerprint BP4A.260205.001 here.
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="lynx-user 17 TODO_17_BUILD_ID TODO_17_BUILD_NUMBER release-keys" \
    BuildFingerprint=google/lynx/lynx:17/TODO_17_BUILD_ID/TODO_17_BUILD_NUMBER:user/release-keys \
    BuildSystemFingerprint=google/generic_system_google/generic:17/TODO_17_BUILD_ID/TODO_17_BUILD_NUMBER:user/release-keys \
    DeviceProduct=$(DEVICE_CODENAME)

# The extracted blobs. This has to come after the inherits above, since it appends to
# PRODUCT_PACKAGES and PRODUCT_COPY_FILES.
$(call inherit-product, $(VENDOR_PATH)/$(DEVICE_CODENAME)-vendor.mk)
