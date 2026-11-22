#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-License-Identifier: Apache-2.0
#
# DRAFT — updated from device_google_lynx branch 16 aosp_lynx.mk.
# Only the product identity lines change to match the grizzly (17) pattern;
# the hardware inherit stays gs201 (Tensor G2), NOT malibu.
#

$(call inherit-product, device/google/gs201/aosp_common.mk)
$(call inherit-product, device/google/lynx/device-lynx.mk)

PRODUCT_NAME := aosp_lynx
PRODUCT_DEVICE := lynx
PRODUCT_MODEL := Pixel 7a
PRODUCT_BRAND := google
PRODUCT_MANUFACTURER := Google

PRODUCT_NAME_FOR_ATTESTATION := lynx
PRODUCT_DEVICE_FOR_ATTESTATION := lynx
PRODUCT_MODEL_FOR_ATTESTATION := Pixel 7a
PRODUCT_BRAND_FOR_ATTESTATION := google
PRODUCT_MANUFACTURER_FOR_ATTESTATION := Google
