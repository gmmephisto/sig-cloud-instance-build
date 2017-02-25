#!/bin/bash

LOCATION="http://vault.centos.org/7.2.1511/os/x86_64/"
VMNAME="CentOS-7-x86_64-GenericCloud-1511"
DISKFILE="CentOS-7-x86_64-GenericCloud-1511"
DISKSIZE="8"

virt-install \
    --virt-type kvm --ram 1024 \
    --location="${LOCATION}" --name "${VMNAME}" \
    --disk ${DISKFILE},format=qcow2 \
    --network network=default \
    --os-variant=centos7.0 \
    --extra-args="ks=file:/${VMNAME}.ks console=ttyS0" \
    --initrd-inject="${VMNAME}.ks" \
    --graphics none --noreboot -d
