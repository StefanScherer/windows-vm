if not exist box\vcloud mkdir box\vcloud
set ISO=http://roecloudsrv001/windows/win2008r2sp1_datacenter_en/SW_DVD5_Windows_Svr_DC_EE_SE_Web_2008_R2_64Bit_English_w_SP1_MLF_X17-22580.ISO
set CHECKSUM=7e7e9425041b3328ccf723a0855c2bc4f462ec57
packer build --only=vmware-iso -var "iso_url=%ISO%" -var "iso_checksum=%CHECKSUM%" win2008r2-datacenter-cygwin-vcloud.json  | addtime
