#!/bin/bash
ISO=file:///Users/stefan/.packer_cache/25353b7aaeaa448ae990836d7fe0ce9310c81064473e438a4fd337fa85c46802.iso
CHECKSUM=15ddabafa72071a06d5213b486a02d5b55cb7070

packer build -only=virtualbox-iso -var "iso_url=$ISO" -var "iso_checksum=$CHECKSUM" win7x64-enterprise.json
