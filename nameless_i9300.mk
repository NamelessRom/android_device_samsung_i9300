# Copyright (C) 2012 The CyanogenMod Project
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
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

# Release name
PRODUCT_RELEASE_NAME := i9300

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/nameless/config/common.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/samsung/i9300/i9300.mk)

# Configure dalvik heap
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := nameless_i9300
PRODUCT_DEVICE := i9300
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := GT-I9300

# Inherit the SIM Toolkit
PRODUCT_PACKAGES += Stk

# Build description
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="samsung/m0xx/m0:4.3/JSS15J/I9300XXUGMJ9:user/release-keys" \
    PRIVATE_BUILD_DESC="m0xx-user 4.3 JSS15J I9300XXUGMJ9 release-keys"

# Override product name and device
PRODUCT_BUILD_PROP_OVERRIDES += \
     PRODUCT_NAME=m0xx \
     TARGET_DEVICE=m0
