@if not defined packer_debug echo off

setlocal EnableExtensions EnableDelayedExpansion

set VAGRANT_KEY_URL=https://raw.githubusercontent.com/mitchellh/vagrant/master/keys/vagrant.pub
set AUTHORIZED_KEYS=%USERPROFILE%\.ssh\authorized_keys

echo ==^> Installing vagrant public key
if not exist "%USERPROFILE%\.ssh" mkdir "%USERPROFILE%\.ssh"

PATH=%PATH%;a:\
for %%i in (_download.cmd) do set _download=%%~$PATH:i
if defined _download (
  call "%_download%" "%VAGRANT_KEY_URL%" "%AUTHORIZED_KEYS%"
) else (
  powershell -Command "(New-Object System.Net.WebClient).DownloadFile('%VAGRANT_KEY_URL%', '%AUTHORIZED_KEYS%')" <NUL
)

echo ==^> Disabling vagrant account password expiration
wmic USERACCOUNT WHERE "Name='vagrant'" set PasswordExpires=FALSE

:: create synced folder
echo ==^> Linking synced folder c:\vagrant
if not exist %CYGWIN_HOME%\vagrant mkdir %CYGWIN_HOME%\vagrant
if not exist %SystemDrive%\vagrant mklink %SystemDrive%\vagrant %CYGWIN_HOME%\vagrant 

:: permanently add c:\cygwin\bin to system PATH
echo ==^> Add Cygwin to path for which rsync via winrm
for /F "tokens=2* delims= " %%f IN ('reg query "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v Path ^| findstr /i path') do set OLD_SYSTEM_PATH=%%g
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Environment" /v Path /d "%OLD_SYSTEM_PATH%;%CYGWIN_HOME%\bin" /f

PATH=%PATH%;%CYGWIN_HOME%\bin

