#
# Copyright 2012 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Inherit APNs list
$(call inherit-product, vendor/omni/config/gsm.mk)

# Exclude live wallpapers
TARGET_EXCLUDE_LIVEWALLPAPERS := true

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Use specific resolution for bootanimation
TARGET_BOOTANIMATION_SIZE := 720x407

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/lge/hammerhead/device.mk)

PRODUCT_NAME := omni_hammerhead
PRODUCT_DEVICE := hammerhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hammerhead \
    BUILD_FINGERPRINT=google/hammerhead/hammerhead:6.0.1/MOB30M/2862625:user/release-keys \
    PRIVATE_BUILD_DESC="hammerhead-user 6.0.1 MOB30M 2862625 release-keys" \
    BUILD_ID=MOB30M

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/lge/hammerhead
TARGET_KERNEL_CONFIG := custom_hammerhead_defconfig
TARGET_VARIANT_CONFIG := custom_hammerhead_defconfig
TARGET_SELINUX_CONFIG := custom_hammerhead_defconfig

$(call inherit-product-if-exists, vendor/lge/hammerhead/lge/hammerhead/device-vendor.mk)
