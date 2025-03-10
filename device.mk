#
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

# Include espresso-common makefile
$(call inherit-product, device/samsung/espressowifi/device-common.mk)

LOCAL_PATH := device/samsung/espresso3g

# Include 3g overlays
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay/aosp

# Audio configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/audio/tiny_hw_espresso.xml:system/etc/sound/espresso \
    $(LOCAL_PATH)/audio/tiny_hw_espresso10.xml:system/etc/sound/espresso10

# RIL
PRODUCT_PACKAGES += \
    libsecril-client \
    libsecril-compat \
    libsecril-shim \
    libsecnativefeature

# Radio
PRODUCT_PACKAGES += \
    android.hardware.radio@1.0 \
    android.hardware.radio.deprecated@1.0

PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=pdp0,wlan0,gprs,ppp0

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Use the non-open-source parts, if they're present
$(call inherit-product-if-exists, vendor/samsung/espresso3g/espresso3g-vendor.mk)
