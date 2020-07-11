#!/bin/bash

cd lineage

# prepare java
export ANDROID_JACK_VM_ARGS="-Dfile.encoding=UTF-8 -XX:+TieredCompilation -Xmx4G"
export JAVA_TOOL_OPTIONS="-Xmx6g"

# prepare ccache
export USE_CCACHE=1
export CCACHE_EXEC=/usr/bin/ccache
ccache -M 50G

# sync
cp ../davinci/manifest.xml .repo/local_manifests/manifest.xml
repo sync --force-sync

# prepare env
source build/envsetup.sh

# apply device patches
../davinci/patches.sh

# apply microg patches
../microg/patches.sh

# move keys for soong
sed -i "1s;^;PRODUCT_DEFAULT_DEV_CERTIFICATE := user-keys/releasekey\nPRODUCT_OTA_PUBLIC_KEYS := user-keys/releasekey\n\n;" "vendor/lineage/config/common.mk"

brunch davinci