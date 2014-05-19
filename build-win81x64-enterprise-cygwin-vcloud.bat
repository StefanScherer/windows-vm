if not exist box\vcloud mkdir box\vcloud
set ISO=http://roecloudsrv001/windows/win81_enterprise_en/SW_DVD5_SA_Win_Ent_8_64BIT_English_Full_MLF_X18-16254.ISO
set CHECKSUM=4eadfe83e736621234c63e8465986f0af6aa3c82
packer build --only=vmware-iso -var "cm=nocm" -var "iso_url=%ISO%" -var "iso_checksum=%CHECKSUM%" win81x64-enterprise-cygwin-vcloud.json  | addtime
