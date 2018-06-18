#!/bin/bash
cd ../../../..
cd system/core
#git apply -v --check ../../device/Infinix/x510/patches_3.18/0001-Remove-CAP_SYS_NICE-from-surfaceflinger.patch
#git apply -v --check ../../device/Infinix/x510/patches_3.18/0004-libnetutils-add-MTK-bits-ifc_ccmni_md_cfg.patch
#git apply -v --check ../../device/Infinix/x510/patches_3.18/0012-PATCH-xen0n-some-MTK-services-e.g.-ril-daemon-mtk-re.patch
cd ../..
cd bionic
#git apply -v --check ../device/Infinix/x510/patches_3.18/0002-Apply-LIBC-version-to-__pthread_gettid.patch
cd ..
cd system/sepolicy
#git apply -v --check ../../device/Infinix/x510/patches_3.18/0001-system_sepolicy.patch
cd ../..
cd frameworks/av
git apply -v --check ../../device/Infinix/x510/patches_3.18/0002-Use-hw-encoder-only-for-camera-fire855.patch
cd ../..
cd frameworks/native
#git apply -v --check ../../device/Infinix/x510/patches_3.18/frameworks_native.patch
cd ../..
cd frameworks/base
#git apply -v --check ../../device/Infinix/x510/patches_3.18/frameworks_base.patch
cd ../..
cd system/netd
#git apply -v --check ../../device/Infinix/x510/patches_3.18/0010-wifi-tethering-fix.patch
cd ../..
cd packages/apps/Settings
git apply -v --check ../../../device/Infinix/x510/patches_3.18/0001-Lunch-MiraVision-from-Settings.patch
cd ../../..
