#!/bin/bash

PATCHDIR="../../../microg/patches"

mkdir -p "vendor/lineage/overlay/microg/"
sed -i "1s;^;PRODUCT_PACKAGE_OVERLAYS := vendor/lineage/overlay/microg\n;" "vendor/lineage/config/common.mk"

cd frameworks/base

sed 's/android:protectionLevel="dangerous"/android:protectionLevel="signature|privileged"/' "$PATCHDIR/framework.patch" | patch --quiet -p1

mkdir -p "vendor/lineage/overlay/microg/frameworks/base/core/res/res/values/"
cp "$PATCHDIR/frameworks_base_config.xml" "vendor/lineage/overlay/microg/frameworks/base/core/res/res/values/config.xml"

# nlp patch
patch --quiet -p1 -i "$PATCHDIR/nlp.patch"

git clean -q -f
cd ../../
