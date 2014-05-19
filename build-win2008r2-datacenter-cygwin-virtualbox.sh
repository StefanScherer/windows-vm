#!/bin/bash
ISO=file:///Users/stefan/.packer_cache/e525b0fd74b6bdc00c75fbc145b549206f44e608e31312d58dca8f4be306e2bc.iso
CHECKSUM=beed231a34e90e1dd9a04b3afabec31d62ce3889

if [ ! -d box/virtualbox ]; then
  mkdir -p box/virtualbox
fi
packer build --only=virtualbox-iso -var "cm=nocm" -var "iso_url=$ISO" -var "iso_checksum=$CHECKSUM" win2008r2-datacenter-cygwin.json | addtime
