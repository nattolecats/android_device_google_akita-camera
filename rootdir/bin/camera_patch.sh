#!/vendor/bin/sh

TARGET=com.google.pixel.camera.hal

cd "/vendor/apex_overlay/${TARGET}"

for f in `ls -d */*` ; do
    echo "${f}"
    umount "/apex/${TARGET}/${f}" 2> /dev/null
    mount --bind "/vendor/apex_overlay/${TARGET}/${f}" "/apex/${TARGET}/${f}"
done
