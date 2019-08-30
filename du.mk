#
# Copyright 2019 The Android Open Source Project
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

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from device configuration
$(call inherit-product, device/oneplus/oneplus3/device.mk)

# Inherit DU product configuration
$(call inherit-product, vendor/du/config/common_full_phone.mk)

# Inherit from PixelGapps
$(call inherit-product-if-exists, vendor/pixelgapps/pixel-gapps.mk)

## IMS
PRODUCT_PACKAGES += \
    com.android.ims.rcsmanager \
    PresencePolling \
    RcsService

PRODUCT_NAME := du_oneplus3
PRODUCT_DEVICE := oneplus3
PRODUCT_BRAND := Android
PRODUCT_MODEL := OnePlus 3
PRODUCT_MANUFACTURER := OnePlus

PRODUCT_COPY_FILES += device/oneplus/oneplus3/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=OnePlus/OnePlus3/OnePlus3:9/PKQ1.181203.001/1907311932:user/release-keys \
    PRIVATE_BUILD_DESC="OnePlus3-user 9 PKQ1.181203.001 1907311932 release-keys"

