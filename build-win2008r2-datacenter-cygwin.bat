if not exist box\virtualbox mkdir box\virtualbox
packer build --only=virtualbox-iso -var "iso_url=%WIN2008R2_X64%" win2008r2-datacenter-cygwin.json  | addtime
