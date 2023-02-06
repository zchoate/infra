#!/bin/bash

IMAGE_URL=$1
STORAGE_POOL=local-lvm
TEMPLATE_NAME=$2
TEMPLATE_IMAGE=${TEMPLATE_NAME}.img
TEMPLATE_ID=$3

# If the template ID already exists, exit with success.
VM_CONF_FILE=/etc/pve/nodes/${HOSTNAME}/qemu-server/${TEMPLATE_ID}.conf

if [[ -f "${VM_CONF_FILE}" ]]; then
    echo "${TEMPLATE_ID} exists"
    exit 0
fi

# Download specified image
curl -sL ${IMAGE_URL} -o ${TEMPLATE_IMAGE}

# Create template VM
qm create ${TEMPLATE_ID} --memory 1024 --net0 virtio,bridge=vmbr0
qm importdisk ${TEMPLATE_ID} ${TEMPLATE_IMAGE} ${STORAGE_POOL}
qm set ${TEMPLATE_ID} --scsihw virtio-scsi-pci --virtio0 ${STORAGE_POOL}:vm-${TEMPLATE_ID}-disk-0
qm set ${TEMPLATE_ID} --boot c --bootdisk virtio0
qm set ${TEMPLATE_ID} --serial0 socket --vga serial0
qm set ${TEMPLATE_ID} --agent 1
qm set ${TEMPLATE_ID} --hotplug disk,network,usb
qm set ${TEMPLATE_ID} --name ${TEMPLATE_NAME}

# Enable Cloud-Init
qm set ${TEMPLATE_ID} --ide2 ${STORAGE_POOL}:cloudinit

# Increase disk size
qm resize ${TEMPLATE_ID} virtio0 +6G

# Make VM a template
qm template ${TEMPLATE_ID}