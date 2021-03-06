# LineageOS + microG for davinci buildscript

Simple script for Debian/Ubuntu-based build servers. Tested on Ubuntu bionic (18.x).

## Usage

```bash
# run only once
sudo ./setup.sh

# run when you want to build
./build.sh

# you may want to create a screen session for building
screen -S lineage
./build.sh
# now, you can detach from the session by pressing Ctrl + A, then Ctrl + D
# the build will continue, even when you disconnect via ssh
# to reattach, enter
screen -r lineage
```

Works with Lineage 17.1 for `davinci`. Adapted from the LineageOS wiki and the [LineageOS 4 microG Docker container](https://github.com/lineageos4microg/docker-lineage-cicd). Patches are from microG.

## Why not just the Docker container?

The Docker container is great when it works. In my experience, unfortunately, that has seldomly been the case and digging around in a Docker container with many long, complex scripts is quite time-consuming.

This script is meant to be messed around with quickly and to run semi-automated. You can edit it easily so it fits your needs. It's hacky by design (following hack-driven development, a patent-pending design pattern), which means it probably won't "just work" - but it's easy to wrap your head around what's going on and fix it.