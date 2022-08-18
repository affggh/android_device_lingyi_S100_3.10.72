## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := S100

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lingyi/S100/device_S100.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := S100
PRODUCT_NAME := lineage_S100
PRODUCT_BRAND := LINGYI
PRODUCT_MODEL := S100
PRODUCT_MANUFACTURER := lingyi

#SuperUser
WITH_SU := true

