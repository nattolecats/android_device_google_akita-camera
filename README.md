This patch is needed for QPR2 with QPR1 camera blobs

## Usage

1. Inherit on your `device.mk` .

```
$(call inherit-product-if-exists, device/google/akita-camera/device.mk)
```

2. Add this line to your `conf/init.${DEVICE}.rc` .

```
import /vendor/etc/init/hw/camera_patch.rc
