if not exist box\vcloud mkdir box\vcloud
set ISO=http://roecloudsrv001/windows/win2012r2_datacenter_en/SW_DVD9_Windows_Svr_Std_and_DataCtr_2012_R2_64Bit_English_-2_Core_MLF_X19-31419.ISO
set CHECKSUM=a73fc07c1b9f560f960f1c4a5857fac062041235
packer build --only=vmware-iso -var "cm=nocm" -var "iso_url=%ISO%" -var "iso_checksum=%CHECKSUM%" win2012r2-datacenter-cygwin-vcloud.json  | addtime
