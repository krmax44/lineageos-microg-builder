#!/bin/bash

# install deps
apt-get install -y bc bison bsdmainutils build-essential ccache cgpt cron \
      curl flex g++-multilib gcc-multilib git gnupg gnutls-bin gperf imagemagick kmod \
      lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool \
      libncurses5-dev libsdl1.2-dev libssl-dev libwxgtk3.0-dev libxml2 \
      libxml2-utils lsof lzop maven openjdk-8-jdk pngcrush procps python python3 rsync \
      schedtool squashfs-tools wget xdelta3 xsltproc yasm zip zlib1g-dev

# install repo
curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo
chmod a+x /usr/local/bin/repo

# create workspace
mkdir -p lineage/
cd lineage

# init repo
repo init -u https://github.com/LineageOS/android.git -b lineage-17.1

cd ..

# copy manifest
mkdir -p ./lineage/.repo/local_manifests
cp ./davinci/manifest.xml ./lineage/.repo/local_manifests/manifest.xml

# create signing keys
chmod +x ./utils/make_key.sh
mkdir -p keys

KEYHOLDER="/C=US/ST=California/L=Mountain View/O=Android/OU=Android/CN=Android/emailAddress=android@android.com"
for c in testkey releasekey platform shared media networkstack; do
      ./utils/make_key.sh "keys/$c" "$KEYHOLDER"
done

# prepare before script
chmod +x ./davinci/before.sh
