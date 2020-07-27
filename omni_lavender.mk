#
# Copyright 2017 The Android Open Source Project
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
PRODUCT_RELEASE_NAME := lavender

$(call inherit-product, build/target/product/embedded.mk)

# Inherit from our custom product configuration
$(call inherit-product, vendor/omni/config/common.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := lavender
PRODUCT_NAME := omni_lavender
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 7
PRODUCT_MANUFACTURER := Xiaomi

# enable stock zip packages flash
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
    ro.secure=1 \
    ro.adb.secure=0 \
    ro.allow.mock.location=0 \
    ro.hardware.keystore=sdm660

# Copy updated tzdata
PRODUCT_COPY_FILES += system/timezone/output_data/iana/tzdata:recovery/root/system_root/system/usr/share/zoneinfo/tzdata

# Copy root file
PRODUCT_COPY_FILES += \
    device/xiaomi/lavender/file-root/MAGISK-2040.zip:recovery/root/sbin/iceroot/MAGISK-2040.zip \
    device/xiaomi/lavender/file-root/NO_VERITY_ENCRYPT.zip:recovery/root/sbin/iceroot/NO_VERITY_ENCRYPT.zip \
    device/xiaomi/lavender/file-root/SIGNED_BOOT.zip:recovery/root/sbin/iceroot/SIGNED_BOOT.zip \
    device/xiaomi/lavender/file-root/UNROOT.zip:recovery/root/sbin/iceroot/UNROOT.zip \
	device/xiaomi/lavender/file-root/portrait.xml:recovery/root/twres/portrait.xml