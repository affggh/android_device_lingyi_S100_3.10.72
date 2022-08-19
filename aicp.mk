## Specify phone tech before including full_phone

# Release name
PRODUCT_RELEASE_NAME := x510

# Inherit some common AICP stuff.
$(call inherit-product, vendor/aicp/configs/common.mk)

# Inherit phone stuff
$(call inherit-product, vendor/aicp/configs/gsm.mk)

# Inherit telephony stuff
$(call inherit-product, vendor/aicp/configs/telephony.mk)

# Inherit device configuration
$(call inherit-product, device/Infinix/x510/device_x510.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := x510
PRODUCT_NAME := aicp_x510
PRODUCT_BRAND := infinix
PRODUCT_MODEL := Infinix_x510
PRODUCT_MANUFACTURER := INIFNIX

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=Infinix/cm_x510/x510:7.1.2/NJH47F/ibrahim_02051933:userdebug/release-keys \
    PRIVATE_BUILD_DESC="cm_x510-userdebug 7.1.2 NJH47F dev.ibrahim_.20180205.193358 release-keys"

#SuperUser
WITH_SU := true
