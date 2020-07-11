#!/bin/bash

# taken from https://gist.github.com/PIPIPIG233666/f3c365ebf23da6a0a8a31b25447f6f74/

set -e
source build/envsetup.sh

git -C device/xiaomi/davinci/ fetch https://github.com/sm6150-dev/android_device_xiaomi_davinci && git -C device/xiaomi/davinci/ checkout FETCH_HEAD
git -C device/xiaomi/sm6150-common/ fetch https://github.com/sm6150-dev/android_device_xiaomi_sm6150-common && git -C device/xiaomi/sm6150-common/ checkout FETCH_HEAD
git -C kernel/xiaomi/sm6150/ fetch https://github.com/sm6150-dev/android_kernel_xiaomi_sm6150 && git -C kernel/xiaomi/sm6150/ checkout FETCH_HEAD

changes=(
278020 # FODCircleView: handle more visibility cases
278021 # FODCircleView: let's smoothly fade-out the view, before going to View.GONE
272303 # DozeSensors: only use proximity sensor if supported
266130 # FODCircleView: Add Support for custom FP pressed icon
274433 # SystemUI: use DOUBLE_TAP_TO_WAKE setting also for wake from aod
280082 # FingerprintService: hide InDisplayFingerprintView on Error
276156 # sdm: mark FOD pressed layer by setting a bit on ZPOS
279890 # Allow to drop existing fd cache of cgroup path
)
repopick ${changes[@]}&

repopick -p 278063 # hal: Add tfa98xx feedback extension
repopick -p 277176 # VolumeDialog: Implement expand/collapse animation
repopick -p 279893 # [DNM] Enable USAP by default
repopick -p 275821 # interfaces: Fix blueprint generation
repopick -p 272451 # org.ifaa.android.manager: Add ifaa apis to unrestricted greylist
repopick -p 277273 # MediaProvider: Check hidden directories recursively
repopick -t ten-network-isolation
repopick -t ten-firewall

