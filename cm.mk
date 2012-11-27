## Specify phone tech before including mini_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := Espresso

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_mini_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/espresso/espresso.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := espresso
PRODUCT_NAME := cm_espresso
PRODUCT_BRAND := htc
PRODUCT_MODEL := Espresso
PRODUCT_MANUFACTURER := HTC
PRODUCT_VERSION_DEVICE_SPECIFIC := -UNOFFICIAL-ALPHA5
CM_RELEASE := true
