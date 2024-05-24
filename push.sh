#!/bin/bash

DEVICE=akita

echo "* Waiting for device connect"
adb wait-for-device

if [ "$(adb shell getprop ro.lineage.device)" != "${DEVICE}" ] ; then
    echo "* This device is not ${DEVICE}"
    exit 1
fi

echo "* Getting root and re-mounting partitions as RW mode"
adb root && adb remount

echo "* Removing existing blobs"
adb shell su 0 "umount /apex/*/*/*.*  2> /dev/null"
adb shell su 0 "rm -rf /vendor/apex_overlay"

echo "* Pushing new blobs"
adb push apex_overlay /vendor
adb push rootdir/bin/camera_patch.sh /vendor/bin
adb push rootdir/etc/camera_patch.rc /vendor/etc/init/hw

echo "* Running bind-mount script"
adb shell su 0 "sh /vendor/bin/camera_patch.sh"

echo "* Done"

exit 0
