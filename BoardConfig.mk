# config.mk
#
# Product-specific compile-time definitions
#

TARGET_BOARD_PLATFORM := msm8996
TARGET_BOOTLOADER_BOARD_NAME := oneplus3

TARGET_USES_INTERACTION_BOOST := true

TARGET_USES_AOSP := true
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := false
TARGET_NO_RECOVERY := true
TARGET_RECOVERY_FSTAB := device/oneplus/oneplus3/fstab.qcom
BOARD_USES_RECOVERY_AS_BOOT := true
BOARD_BUILD_SYSTEM_ROOT_IMAGE := true
BOOTLOADER_GCC_VERSION := arm-eabi-4.8
# use msm8996 LK configuration
BOOTLOADER_PLATFORM := msm8996

TARGET_USES_OVERLAY := true
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
MAX_VIRTUAL_DISPLAY_DIMENSION := 4096
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
VSYNC_EVENT_PHASE_OFFSET_NS := 2000000
SF_VSYNC_EVENT_PHASE_OFFSET_NS := 6000000

BOARD_USES_GENERIC_AUDIO := true

BOARD_USES_ALSA_AUDIO := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
AUDIO_FEATURE_ENABLED_SND_MONITOR := true

TARGET_USES_QCOM_MM_AUDIO := true

-include $(QCPATH)/common/msm8996/BoardConfigVendor.mk

TARGET_AUX_OS_VARIANT_LIST := oneplus3

# Some framework code requires this to enable BT
BOARD_HAVE_BLUETOOTH := true
BOARD_USES_WIPOWER := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/oneplus/oneplus3/bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_USES_SDM845_BLUETOOTH_HAL := true
BOARD_HAS_QCA_BT_ROME := true
WCNSS_FILTER_USES_SIBS := true

BOARD_HAS_QCOM_WLAN := true
BOARD_WLAN_DEVICE := qcwcn
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_FW_PATH_STA := "sta"
WIFI_DRIVER_FW_PATH_AP  := "ap"

USE_OPENGL_RENDERER := true
BOARD_USE_LEGACY_UI := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
OVERRIDE_RS_DRIVER:= libRSDriver_adreno.so

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x02000000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2147483648
BOARD_SYSTEMIMAGE_EXTFS_INODE_COUNT := 4096
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10737418240
BOARD_PERSISTIMAGE_PARTITION_SIZE := 33554432
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)

TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
ifneq ($(TARGET_USES_AOSP),true)
TARGET_USES_QCOM_BSP := true
endif

BOARD_KERNEL_CMDLINE := androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 cma=32M@0-0xffffffff firmware_class.path=/vendor/firmware_mnt/image loop.max_part=7

BOARD_ROOT_EXTRA_FOLDERS := firmware firmware/radio persist
BOARD_ROOT_EXTRA_SYMLINKS := /vendor/lib/dsp:/dsp

BOARD_SEPOLICY_DIRS += device/oneplus/oneplus3/sepolicy
ifneq ($(filter oneplus3 oneplus3f, $(TARGET_PRODUCT)),)
BOARD_SEPOLICY_DIRS += device/oneplus/oneplus3/sepolicy/verizon
endif
BOARD_PLAT_PRIVATE_SEPOLICY_DIR := device/oneplus/oneplus3/sepolicy/private

BOARD_EGL_CFG := device/oneplus/oneplus3/egl.cfg

BOARD_KERNEL_BASE        := 0x80000000
BOARD_KERNEL_PAGESIZE    := 4096
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_RAMDISK_OFFSET     := 0x02200000

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64

BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_SOURCE := kernel/oneplus/msm8996
TARGET_KERNEL_CONFIG := du_oneplus3_defconfig
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

TARGET_NO_RPC := true

TARGET_PLATFORM_DEVICE_BASE := /devices/soc/

#Let charger mode enter suspend
BOARD_CHARGER_ENABLE_SUSPEND := true

#Enable Peripheral Manager
TARGET_PER_MGR_ENABLED := true

#Enable HW based full disk encryption
# TODO: disable due to compile error due to mismatch with system/vold
# TARGET_HW_DISK_ENCRYPTION := true

#Enable SW based full disk encryption
TARGET_SWV8_DISK_ENCRYPTION := false

#Enable PD locater/notifier
TARGET_PD_SERVICE_ENABLED := true

BOARD_QTI_CAMERA_32BIT_ONLY := true
TARGET_BOOTIMG_SIGNED := true

# HTC_SENSOR_HUB
LIBHTC_SENSORHUB_PROJECT := g_project

#Enable/Disable Camera daemon
CAMERA_DAEMON_NOT_PRESENT := true

#TARGET_LDPRELOAD := libNimsWrap.so

# Added to indicate that protobuf-c is supported in this build
PROTOBUF_SUPPORTED := false

#Add NON-HLOS files for ota upgrade
ADD_RADIO_FILES := true
TARGET_RECOVERY_UI_LIB := librecovery_ui_nanohub

#Add support for firmare upgrade on 8996
HAVE_SYNAPTICS_DSX_FW_UPGRADE := true

# Enable MDTP (Mobile Device Theft Protection)
TARGET_USE_MDTP := true

TARGET_BOARD_KERNEL_HEADERS := device/oneplus/oneplus3/kernel-headers

# Install odex files into the other system image
BOARD_USES_SYSTEM_OTHER_ODEX := true

-include vendor/oneplus_devices/oneplus3/BoardConfigVendor.mk
# Build a separate vendor.img
TARGET_COPY_OUT_VENDOR := vendor

#NFC
NXP_CHIP_TYPE := 3

# Testing related defines
BOARD_PERFSETUP_SCRIPT := platform_testing/scripts/perf-setup/sailin-setup.sh

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

BOARD_PROPERTY_OVERRIDES_SPLIT_ENABLED := true

DEVICE_MANIFEST_FILE := device/oneplus/oneplus3/manifest.xml
DEVICE_MATRIX_FILE   := device/oneplus/oneplus3/compatibility_matrix.xml
DEVICE_FRAMEWORK_COMPATIBILITY_MATRIX_FILE := device/oneplus/oneplus3/device_framework_matrix.xml

# Exclude serif fonts for saving system.img size.
EXCLUDE_SERIF_FONTS := true
