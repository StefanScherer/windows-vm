if not exist box\vcloud mkdir box\vcloud
packer build --only=vmware-iso -var "iso_url=%WIN2008R2_X64%" win2008r2-datacenter-cygwin-vcloud.json  | addtime
