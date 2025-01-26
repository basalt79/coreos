
## Download a coreos version and decompress

```sh
sudo podman run --pull=always --privileged --rm     -v /dev:/dev -v /run/udev:/run/udev -v ./data:/data -w /data  quay.io/coreos/coreos-installer:release download -s "stable" -p qemu -f qcow2.xz --decompress -C /data/
```