# LineageOS + microG for davinci buildscript

Simple script for Debian/Ubuntu-based build servers. Tested on Ubuntu bionic (18.x).

```bash
# run only once
sudo ./setup.sh

# run when you want to build
./build.sh
```

Works with Lineage 17.1 for `davinci`. Adapted from the LineageOS wiki and the [LineageOS 4 microG Docker container](https://github.com/lineageos4microg/docker-lineage-cicd). Patches are from microG.

## Why not just the Docker container?

The Docker container is great when it works. In my experience, unfortunately, that has seldomly been the case and digging around in a Docker container with many long, complex scripts is quite time-consuming.

This script is meant to be messed around with quickly and to run semi-automated. You can edit it easily so it fits your needs. It's hacky by design (following hack-driven development, a patent-pending design pattern).