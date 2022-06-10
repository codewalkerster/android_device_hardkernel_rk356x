#
# Copyright 2014 The Android Open-Source Project
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

# First lunching is R, api_level is 30
PRODUCT_SHIPPING_API_LEVEL := 30
PRODUCT_DTB_TARGET := kernel/arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb
PRODUCT_DTBO_TARGET := kernel/arch/arm64/boot/dts/rockchip/overlays/odroidm1/*.dtbo
PRODUCT_SDMMC_DEVICE := fe2b0000.dwmmc

include device/hardkernel/common/build/rockchip/DynamicPartitions.mk
include device/hardkernel/rk356x/odroidm1/BoardConfig.mk
include device/hardkernel/common/BoardConfig.mk

$(call inherit-product, device/hardkernel/rk356x/device.mk)
$(call inherit-product, device/hardkernel/common/device.mk)
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/../overlay

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_NAME := odroidm1
PRODUCT_DEVICE := odroidm1
PRODUCT_BRAND := hardkernel
PRODUCT_MODEL := odroidm1
PRODUCT_MANUFACTURER := hardkernel
PRODUCT_AAPT_PREF_CONFIG := mdpi

#
## add Rockchip properties
#
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=240
PRODUCT_PROPERTY_OVERRIDES += ro.wifi.sleep.power.down=true
PRODUCT_PROPERTY_OVERRIDES += persist.wifi.sleep.delay.ms=0
PRODUCT_PROPERTY_OVERRIDES += persist.bt.power.down=false

#
# Set the hwc display target
#
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.primary=DSI
PRODUCT_PROPERTY_OVERRIDES += vendor.hwc.device.extend=HDMI-A,TV

#
# ODROID-M1 Files
#

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/files/config.ini.template:$(TARGET_COPY_OUT_VENDOR)/etc/config.ini.template

ifeq ($(TARGET_BUILD_VARIANT),eng)
PRODUCT_PACKAGES += \
    AndroidTerm \

PRODUCT_PACKAGES += \
    SprUsr

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/../../proprietary/bin/phh-su:$(TARGET_COPY_OUT_SYSTEM)/bin/phh-su \
    $(LOCAL_PATH)/../../proprietary/bin/su:$(TARGET_COPY_OUT_SYSTEM)/bin/su \
    $(LOCAL_PATH)/../../proprietary/etc/init/su.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/su.rc
endif
