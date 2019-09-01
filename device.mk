# Copyright (C) 2019 The Linux Foundation. All rights reserved.
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

$(call inherit-product, device/oneplus/oneplus3/hidl/hidl.mk)

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Add soft home, back and multitask keys
PRODUCT_PROPERTY_OVERRIDES += \
    qemu.hw.mainkeys=0

# copy customized media_profiles and media_codecs xmls for msm8996
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/media/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/media/media_profiles.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_vendor.xml \
    $(LOCAL_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
    $(LOCAL_PATH)/media/media_codecs_vendor.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
    $(LOCAL_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/media/media_codecs_vendor_audio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor_audio.xml

# Opengles v3.2
PRODUCT_PROPERTY_OVERRIDES  += \
    ro.opengles.version=196610

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += telephony-ext

PRODUCT_BOOT_JARS += WfdCommon

DEVICE_MANIFEST_FILE := $(LOCAL_PATH)/hidl/manifest.xml
DEVICE_MATRIX_FILE   := $(LOCAL_PATH)/hidl/compatibility_matrix.xml
DEVICE_FRAMEWORK_MANIFEST_FILE := $(LOCAL_PATH)/hidl/framework_manifest.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := $(LOCAL_PATH)/hidl/vendor_framework_compatibility_matrix.xml

# WLAN driver configuration files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:$(TARGET_COPY_OUT_VENDOR)/etc/wifi/WCNSS_qcom_cfg.ini

# MIDI feature
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.midi.xml

PRODUCT_PACKAGES += \
    wpa_supplicant_overlay.conf \
    p2p_supplicant_overlay.conf

#ANT+ stack
PRODUCT_PACKAGES += \
    AntHalService \
    libantradio \
    antradio_app \
    libvolumelistener

# VB xml
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:system/etc/permissions/android.software.verified_boot.xml

# Sensor features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.sensor.ambient_temperature.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.ambient_temperature.xml \
    frameworks/native/data/etc/android.hardware.sensor.relative_humidity.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.relative_humidity.xml \
    frameworks/native/data/etc/android.hardware.sensor.hifi_sensors.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.sensor.hifi_sensors.xml

#FEATURE_OPENGLES_EXTENSION_PACK support string config file
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.opengles.aep.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.opengles.aep.xml

# MSM IRQ Balancer configuration file
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/msm_irqbalance.conf:$(TARGET_COPY_OUT_VENDOR)/etc/msm_irqbalance.conf

PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1

# List of AAPT configurations
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Powerhint configuration file
PRODUCT_COPY_FILES += \
$(LOCAL_PATH)/configs/powerhint.xml:system/etc/powerhint.xml

# Init
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/fstab.qti:$(TARGET_OUT_VENDOR_ETC)/fstab.qti \
    $(LOCAL_PATH)/init.target.rc:$(TARGET_OUT_VENDOR_ETC)/init/hw/init.target.rc

# Treble
PRODUCT_FULL_TREBLE_OVERRIDE := true
PRODUCT_VENDOR_MOVE_ENABLED := true

TARGET_SUPPORT_SOTER := true

# system prop for Bluetooth SOC type
PRODUCT_PROPERTY_OVERRIDES += \
    vendor.qcom.bluetooth.soc=rome

# Set this true as ROME which is programmed
# as embedded wipower mode by deafult
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.emb_wp_mode=true \
    ro.vendor.bluetooth.emb_wp_mode=true

#system prop for wipower support
PRODUCT_PROPERTY_OVERRIDES += \
    ro.bluetooth.wipower=true \
    ro.vendor.bluetooth.wipower=true
