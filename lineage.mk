## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := x510

# Inherit some common CM stuff.
$(call inherit-product, vendor/dot/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/Infinix/x510/device_x510.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := x510
PRODUCT_NAME := dot_x510
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix_x510
PRODUCT_MANUFACTURER := Infinix

#SuperUser
WITH_SU := true