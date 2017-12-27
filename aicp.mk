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
PRODUCT_MODEL := Infinix x510
PRODUCT_MANUFACTURER := INFINIX

# SuperSU
PRODUCT_COPY_FILES += \
	vendor/aicp/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
	vendor/aicp/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon

