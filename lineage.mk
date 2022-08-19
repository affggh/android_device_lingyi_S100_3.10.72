## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := S100

# Inherit some common CM stuff.
$(call inherit-product, vendor/dot/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/lingyi/S100/device_S100.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := S100
PRODUCT_NAME := lineage_S100
PRODUCT_BRAND := LINGYI
PRODUCT_MODEL := S100
PRODUCT_MANUFACTURER := lingyi

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=LINGYI/S100/S100:5.1/LMY47I/:user/test-keys \
    PRIVATE_BUILD_DESC="full_keytak6580_weg_l-user 5.1 LMY47I 1550659099 test-keys"

#SuperUser
WITH_SU := true
