#!/bin/bash

# taken from https://github.com/sm6150-dev/build_scripts/

set -e
source build/envsetup.sh

# patch location for microg
# see xda https://forum.xda-developers.com/showpost.php?p=80779507&postcount=9755
# and https://github.com/lineageos4microg/android_prebuilts_prebuiltapks/issues/22
cat ../davinci/location.patch | git -C device/xiaomi/ apply

# patches from upstream
git -C device/xiaomi/davinci/ fetch https://github.com/sm6150-dev/android_device_xiaomi_davinci && git -C device/xiaomi/davinci/ checkout FETCH_HEAD
git -C device/xiaomi/sm6150-common/ fetch https://github.com/sm6150-dev/android_device_xiaomi_sm6150-common && git -C device/xiaomi/sm6150-common/ checkout FETCH_HEAD
git -C kernel/xiaomi/sm6150/ fetch https://github.com/sm6150-dev/android_kernel_xiaomi_sm6150 && git -C kernel/xiaomi/sm6150/ checkout FETCH_HEAD
git -C hardware/xiaomi/ fetch https://github.com/sm6150-dev/android_hardware_xiaomi && git -C hardware/xiaomi/ checkout FETCH_HEAD

changes=(
272303 # DozeSensors: only use proximity sensor if supported
266130 # FODCircleView: Add Support for custom FP pressed icon
280082 # FingerprintService: hide InDisplayFingerprintView on Error
274433 # SystemUI: use DOUBLE_TAP_TO_WAKE setting also for wake from aod
276156 # sdm: mark FOD pressed layer by setting a bit on ZPOS
279890 # Allow to drop existing fd cache of cgroup path
281412 # SystemUI: Don't re add brightness slider if its already present
)

repopick -f ${changes[@]}

repopick -f -p 278063 # hal: Add tfa98xx feedback extension
repopick -f -p 277176 # VolumeDialog: Implement expand/collapse animation
repopick -f -p 279893 # [DNM] Enable USAP by default
repopick -f -p 275821 # interfaces: Fix blueprint generation
repopick -f -p 272451 # org.ifaa.android.manager: Add ifaa apis to unrestricted greylist
repopick -f -p 277273 # MediaProvider: Check hidden directories recursively
repopick -f -p 278021 # FODCircleView: let's smoothly fade-out the view, before going to View.GONE
