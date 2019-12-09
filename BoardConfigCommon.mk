# Copyright (C) 2012 The CyanogenMod Project
# Copyright (C) 2017-2018,2021 The LineageOS Project
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

# inherit from qcom-common
include device/samsung/qcom-common/BoardConfigCommon.mk

# Platform
TARGET_BOARD_PLATFORM := msm8226
TARGET_BOARD_PLATFORM_GPU := qcom-adreno305

# Architecture
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := krait

# Audio
AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true
AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
AUDIO_FEATURE_ENABLED_EXTN_POST_PROC := true
AUDIO_FEATURE_ENABLED_FLUENCE := true
AUDIO_FEATURE_ENABLED_HFP := true
AUDIO_FEATURE_ENABLED_PROXY_DEVICE := true
AUDIO_FEATURE_ENABLED_LOW_LATENCY_CAPTURE := true
BOARD_USES_ALSA_AUDIO := true

# Bionic
MALLOC_SVELTE := true

# Binder API version
TARGET_USES_64_BIT_BINDER := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

# Camera
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE := true
TARGET_USES_MEDIA_EXTENSIONS := true
TARGET_USES_NON_TREBLE_CAMERA := true

# Dexpreopt
ifeq ($(HOST_OS),linux)
  ifneq ($(TARGET_BUILD_VARIANT),eng)
    WITH_DEXPREOPT_BOOT_IMG_AND_SYSTEM_SERVER_ONLY ?= false
    WITH_DEXPREOPT := true
  endif
endif

# Display
TARGET_ADDITIONAL_GRALLOC_10_USAGE_BITS := 0x2000U | 0x02000000U
TARGET_DISABLE_POSTRENDER_CLEANUP := true

# Shader cache config options
# Maximum size of the  GLES Shaders that can be cached for reuse.
# Increase the size if shaders of size greater than 12KB are used.
MAX_EGL_CACHE_KEY_SIZE := 12*1024

# Maximum GLES shader cache size for each app to store the compiled shader
# binaries. Decrease the size if RAM or Flash Storage size is a limitation
# of the device.
MAX_EGL_CACHE_SIZE := 2048*1024

# Filesystem
TARGET_FS_CONFIG_GEN := device/samsung/msm8226-common/config.fs

# HIDL
DEVICE_MANIFEST_FILE := device/samsung/msm8226-common/manifest.xml
DEVICE_MATRIX_FILE := device/samsung/msm8226-common/compatibility_matrix.xml
PRODUCT_ENFORCE_VINTF_MANIFEST_OVERRIDE := true

# Kernel
TARGET_KERNEL_ADDITIONAL_FLAGS := \
    HOSTCFLAGS="-fuse-ld=lld -Wno-unused-command-line-argument"

# Legacy memfd
TARGET_HAS_MEMFD_BACKPORT := true

# SELinux
include device/samsung/msm8226-common/sepolicy/sepolicy.mk

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true
BOARD_ROOT_EXTRA_FOLDERS := efs firmware firmware-modem persist
BOARD_ROOT_EXTRA_SYMLINKS := \
    /data/tombstones:/tombstones

# Netd
TARGET_NEEDS_NETD_DIRECT_CONNECT_RULE := true

# Power
TARGET_USES_INTERACTION_BOOST := true

# Properties
TARGET_SYSTEM_PROP += device/samsung/msm8226-common/system.prop

# Recovery
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/msm8226-common

# Time services
BOARD_USES_QC_TIME_SERVICES := true

# VNDK - Dedupe VNDK libraries with identical core variants.
TARGET_VNDK_USE_CORE_VARIANT := true

# Wifi
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_MODULE_PATH          := "/vendor/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true

# inherit from the proprietary version
include vendor/samsung/msm8226-common/BoardConfigVendor.mk
