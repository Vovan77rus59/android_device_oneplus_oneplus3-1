#
# Copyright (C) 2017 The Android Open Source Project
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

# Release name
PRODUCT_RELEASE_NAME := oneplus3

$(call inherit-product, build/target/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware.keystore=msm8996

## Device identifier. This must come after all inclusions
PRODUCT_NAME := omni_oneplus3
PRODUCT_DEVICE := oneplus3
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus

TARGET_VENDOR_PRODUCT_NAME := OnePlus3
TARGET_VENDOR_DEVICE_NAME := OnePlus3
PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=OnePlus3 PRODUCT_NAME=OnePlus3

PRODUCT_SYSTEM_PROPERTY_BLACKLIST += ro.product.model

# AVB
PRODUCT_SUPPORTS_BOOT_SIGNER := true
PRODUCT_VERITY_SIGNING_KEY := build/target/product/security/verity