IGNITION_CONFIG="/home/georg/work/1_notes/core/coreos/fcos-basic.ign"
IMAGE="/home/georg/work/1_notes/core/coreos/data/fedora-coreos-41.20250105.3.0-qemu.x86_64.qcow2"
IGNITION_DEVICE_ARG="-fw_cfg name=opt/com.coreos/config,file=${IGNITION_CONFIG}"


# qemu-system-x86_64 -m 2048 -nographic -snapshot \
#   -drive "if=virtio,file=${IMAGE}" ${IGNITION_DEVICE_ARG} \
#   -nic user,model=virtio,hostfwd=tcp::2222-:22




qemu-img create -f qcow2 -F qcow2 -b "${IMAGE}" ./data/41.20250105.qcow2

qemu-system-x86_64 -m 2048 -nographic \
  -drive if=virtio,file=./data/41.20250105.qcow2 ${IGNITION_DEVICE_ARG} \
  -nic user,model=virtio,hostfwd=tcp::2222-:22