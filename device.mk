
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/lingyi/S100/S100-vendor.mk)

LOCAL_PATH := device/lingyi/S100

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# Boot animation
# Select the 720-width one; despite the variables' names, they seem to be
# used by bootanimation only.
TARGET_SCREEN_HEIGHT := 854
TARGET_SCREEN_WIDTH := 480

PRODUCT_PACKAGES += \
	libxlog

# init
#PRODUCT_PACKAGES += \
#	proj-dev-setup

# various MTK ABI fixes
# this is the approach of the cm-13.0 sprout port
PRODUCT_PACKAGES += \
	libmtkabi

# Display
PRODUCT_PACKAGES += \
	libgralloc_extra \
	libion_mtk \
	libion \
	libui_ext \
	libgui_ext \
	guiext-server \
	libmtk_drvb

# Offline charge
PRODUCT_PACKAGES += \
	charger \
	charger_res_images \
	kpoc_charger \
	libshowlogo

# Power
PRODUCT_PACKAGES += \
	power.mt6580

# Lights
PRODUCT_PACKAGES += \
	lights.mt6580

# Camera
PRODUCT_PACKAGES += \
	libnvramagentclient \
	libcamera_client_mtk

# Audio
PRODUCT_PACKAGES += \
	audio.r_submix.default \
	audio_policy.default \
	libtinycompress \
	libtinyxml \
	libblisrc \
	libblisrc32

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
	$(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
	$(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf
		
# Digital Restrictions Management
# many many many segfaults, disable for now
#PRODUCT_PACKAGES += \
#	com.google.widevine.software.drm.xml \
#	libdrmctaplugin \
#	libdrmmtkplugin \
#	libdrmwvmplugin \
#	libwvm \
#	# libdrmmtkutil -- pulled in by libwvm
#	# libwvdrm_L3 libWVStreamControlAPI_L3 -- pulled in by libdrmwvmplugin
#	# libdrmmtkwhitelist -- pulled in by libdrmmtkutil

# Wifi
PRODUCT_PACKAGES += \
	libwpa_client \
	hostapd \
	dhcpcd.conf \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
	$(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
	$(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Bluetooth
PRODUCT_PACKAGES += \
	libbt-vendor \
	audio.a2dp.default

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/bluetooth/auto_pair_blacklist.conf:system/etc/bluetooth/auto_pair_blacklist.conf \
	$(LOCAL_PATH)/configs/bluetooth/auto_pair_devlist.conf:system/etc/bluetooth/auto_pair_devlist.conf \
	$(LOCAL_PATH)/configs/bluetooth/btconfig.xml:system/etc/bluetooth/btconfig.xml \
	$(LOCAL_PATH)/configs/bluetooth/bt_did.conf:system/etc/bluetooth/bt_did.conf \
	$(LOCAL_PATH)/configs/bluetooth/bt_stack.conf:system/etc/bluetooth/bt_stack.conf

# Telecom
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
	$(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml \
	$(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# GPS
PRODUCT_COPY_FILES += \
	 $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \
	 $(LOCAL_PATH)/configs/slp_conf:system/etc/slp_conf

PRODUCT_PACKAGES += \
	gps.mt6580 \
	mnld \
	libmnl \
	wifi2agps \
	libwifi2agps \
	mtk_agpsd \
	slpd

# Torch
PRODUCT_PACKAGES += \
	Torch

# MiraVision
PRODUCT_PACKAGES += \
	MiraVision

# EngineerMode
#PRODUCT_PACKAGES += \
#	EngineerMode

# Keyhandler & Gestures
#PRODUCT_PACKAGES += \
#	com.cyanogenmod.keyhandler \
#	Gestures

#PRODUCT_SYSTEM_SERVER_JARS += \
#	com.cyanogenmod.keyhandler

# Thermal
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/.ht120.mtc:system/etc/.tp/.ht120.mtc \
	$(LOCAL_PATH)/configs/thermal.conf:system/etc/.tp/thermal.conf \
	$(LOCAL_PATH)/configs/thermal.off.conf:system/etc/.tp/thermal.off.conf

# Ramdisk
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/fstab.mt6580:root/fstab.mt6580 \
	$(LOCAL_PATH)/root/twrp.fstab:recovery/root/etc/twrp.fstab \
	$(LOCAL_PATH)/root/init.mt6580.rc:root/init.mt6580.rc \
	$(LOCAL_PATH)/root/init.mt6580.usb.rc:root/init.mt6580.usb.rc \
	$(LOCAL_PATH)/root/init.recovery.mt6580.rc:root/init.recovery.mt6580.rc \
	$(LOCAL_PATH)/root/init.6580.modem.rc:root/init.6580.modem.rc \
	$(LOCAL_PATH)/root/init.project.rc:root/init.project.rc \
	$(LOCAL_PATH)/root/ueventd.mt6580.rc:root/ueventd.mt6580.rc \
	$(LOCAL_PATH)/root/sbin/busybox:root/sbin/busybox \
	$(LOCAL_KERNEL):kernel

# Hack for disable deep sleep reboots
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/99wakelock_for_no_reboots:system/etc/init.d/99wakelock_for_no_reboots

#  
#PRODUCT_COPY_FILES += \
#	$(LOCAL_PATH)/configs/custom.conf:system/etc/custom.conf \
#	$(LOCAL_PATH)/configs/mtklog-config.prop:system/etc/mtklog-config.prop

# MTK rc script
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/root/etc/atrace.rc:system/etc/init/atrace.rc \
	$(LOCAL_PATH)/root/etc/audioserver.rc:system/etc/init/audioserver.rc \
	$(LOCAL_PATH)/root/etc/drmserver.rc:system/etc/init/drmserver.rc \
	$(LOCAL_PATH)/root/etc/mediacodec.rc:system/etc/init/mediacodec.rc \
	$(LOCAL_PATH)/root/etc/mediadrmserver.rc:system/etc/init/mediadrmserver.rc \
	$(LOCAL_PATH)/root/etc/mediaserver.rc:system/etc/init/mediaserver.rc

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
	frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_sensor.xml:system/etc/permissions/android.hardware.camera.manual_sensor.xml \
	frameworks/native/data/etc/android.hardware.camera.manual_postprocessing.xml:system/etc/permissions/android.hardware.camera.manual_postprocessing.xml \
	frameworks/native/data/etc/android.hardware.camera.raw.xml:system/etc/permissions/android.hardware.camera.raw.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	ro.zygote=zygote32 \
	camera.disable_zsl_mode=1 \
	ro.mount.fs=EXT4 \
	persist.sys.usb.config=mtp,adb \
	ro.hardware=mt6580

ADDITIONAL_DEFAULT_PROPERTIES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.allow.mock.location=1 \
	ro.debuggable=1 \
	persist.service.acm.enable=0 \
	ro.oem_unlock_supported=1

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.timezone=Asia/Shanghai \
	ro.product.locale=zh-CN \
	ro.product.locale.region=CN \
	ro.product.locale.language=zh

# Extended JNI checks
# The extended JNI checks will cause the system to run more slowly, but they can spot a variety of nasty bugs 
# before they have a chance to cause problems.
# Default=true for development builds, set by android buildsystem.
PRODUCT_PROPERTY_OVERRIDES += \
	ro.kernel.android.checkjni=0 \
	dalvik.vm.checkjni=false

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_CHARACTERISTICS := default

$(call inherit-product, build/target/product/full.mk)
$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)
# never dexopt the keyhandler
#$(call add-product-dex-preopt-module-config,com.cyanogenmod.keyhandler,disable)

