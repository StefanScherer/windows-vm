if not exist box\vcloud mkdir box\vcloud
set ISO=http://roecloudsrv001/windows/win7sp1_enterprise_en/x64/en_windows_7_enterprise_with_sp1_x64_dvd_u_677651.iso
set CHECKSUM=a491f985dccfb5863f31b728dddbedb2ff4df8d1
packer build --only=vmware-iso -var "iso_url=%ISO%" -var "iso_checksum=%CHECKSUM%" win7x64-enterprise-cygwin-vcloud.json  | addtime
