#
# Copyright (C) 2012 The Android Open Source Project
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


DEVICE_PACKAGE_OVERLAYS += device/htc/espresso/overlay

# Keylayouts

# Keychars / Keylayout
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/usr/keylayout/latte-keypad-v0.kl:system/usr/keylayout/latte-keypad-v0.kl \
    device/htc/espresso/prebuilt/usr/keylayout/latte-keypad-v1.kl:system/usr/keylayout/latte-keypad-v1.kl \
    device/htc/espresso/prebuilt/usr/keylayout/latte-keypad-v2.kl:system/usr/keylayout/latte-keypad-v2.kl \
    device/htc/espresso/prebuilt/usr/keychars/latte-keypad-v0.kcm.bin:system/usr/keychars/latte-keypad-v0.kcm.bin \
    device/htc/espresso/prebuilt/usr/keychars/latte-keypad-v1.kcm.bin:system/usr/keychars/latte-keypad-v1.kcm.bin \
    device/htc/espresso/prebuilt/usr/keychars/latte-keypad-v2.kcm.bin:system/usr/keychars/latte-keypad-v2.kcm.bin \
    device/htc/espresso/prebuilt/usr/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/espresso/prebuilt/usr/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/espresso/prebuilt/usr/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/espresso/prebuilt/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl

# Keylayouts -- espresso especific
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/usr/keylayout/latte-keypad-v2.kl:system/usr/keylayout/latte-keypad-v2.kl \
    device/htc/espresso/prebuilt/usr/keylayout/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl

# Keychars --  espresso especific
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/usr/keychars/latte-keypad-v2.kcm:system/usr/keychars/latte-keypad-v2.kcm

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/usr/idc/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/espresso/prebuilt/usr/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/espresso/prebuilt/usr/idc/curcial-oj.idc:system/usr/idc/curcial-oj.idc

PRODUCT_COPY_FILES += \
    device/htc/espresso/init.latte.rc:root/init.latte.rc \
    device/htc/espresso/ueventd.latte.rc:root/ueventd.latte.rc


# Default network type.
# 0 => WCDMA preferred.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.telephony.default_network=0

# This is a 512MB device, so 32mb heapsize
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapsize=32m

PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 


# Enable TI HotSpot
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.hotspot.ti=1

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

PRODUCT_PACKAGES += \
    gps.latte \
    sensors.latte

PRODUCT_COPY_FILES += \
    device/htc/espresso/vold.fstab:system/etc/vold.fstab \
    device/common/gps/gps.conf_US:system/etc/gps.conf \
    vendor/cm/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml \
    device/htc/espresso/prebuilt/bin/trackballwake:system/bin/trackballwake \
    device/htc/espresso/prebuilt/etc/init.d/05mountsd:system/etc/init.d/05mountsd \
    device/htc/espresso/prebuilt/lib/libcamera.so:system/lib/libcamera.so \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf


PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/modules/sdio.ko:system/lib/modules/sdio.ko \
    device/htc/espresso/prebuilt/modules/tiwlan_drv.ko:system/lib/modules/tiwlan_drv.ko \
    device/htc/espresso/prebuilt/modules/tiap_drv.ko:system/lib/modules/tiap_drv.ko \
    device/htc/espresso/prebuilt/modules/tun.ko:system/lib/modules/tun.ko


#WiFi stuff
PRODUCT_PACKAGES += \
    wpa_supplicant.conf \
    tiwlan.ini \
    dhcpcd.conf \
    wlan_cu \
    wlan_loader \
    libCustomWifi

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/espresso/espresso-vendor.mk)



# media profiles and capabilities spec
$(call inherit-product, device/htc/espresso/media_a1026.mk)

# Sets copy files for all HTC-specific device
PRODUCT_COPY_FILES += device/htc/espresso/prebuilt/etc/ecclist_for_mcc.conf:system/etc/ecclist_for_mcc.conf

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \
    device/htc/espresso/prebuilt/lib/libcamera.so:obj/lib/libcamera.so

# inherit from common msm7x27
$(call inherit-product, device/htc/msm7x27-tiwlan-common/msm7x27.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

PRODUCT_NAME := generic_espresso
PRODUCT_MANUFACTURER := HTC
PRODUCT_DEVICE := espresso
