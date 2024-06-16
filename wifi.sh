#!/bin/bash
echo "deb http://deb.debian.org/debian bookworm main contrib non-free-firmware non-free"

apt update
apt install linux-image-$(uname -r|sed 's,[^-]*-[^-]*-,,') linux-headers-$(uname -r|sed 's,[^-]*-[^-]*-,,') broadcom-sta-dkms
modprobe -r b44 b43 b43legacy ssb brcmsmac bcma
modprobe wl
