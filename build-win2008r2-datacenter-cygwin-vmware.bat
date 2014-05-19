if not exist box\vmware mkdir box\vmware
packer build --only=vmware-iso -var "iso_url=%WIN2008R2_X64%" win2008r2-datacenter-cygwin.json  | addtime
