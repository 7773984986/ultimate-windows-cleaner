@echo off
title ULTIMATE WINDOWS CLEANER v2 (FULL SYSTEM + GPU + INSTALL + NETWORK)
echo ================================================================
echo              ULTIMATE WINDOWS CLEANER v2 STARTED
echo ================================================================
echo.

:: ------------------------------------------------
:: 1. REMOVE CORRUPTED INSTALLATION LEFTOVERS
:: ------------------------------------------------
echo Removing corrupted installation leftovers...
del /s /q "C:\Windows\Installer\$PatchCache$\*"
del /s /q "C:\Windows\Downloaded Installations\*"
del /s /q "C:\Windows\SoftwareDistribution\Download\*"
echo Corrupted installation files removed.
echo.

:: ------------------------------------------------
:: 2. RESET WINDOWS UPDATE COMPONENTS
:: ------------------------------------------------
echo Resetting Windows Update components...
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
echo Windows Update components reset.
echo.

:: ------------------------------------------------
:: 3. DELETE UNWANTED REPOS & DEPENDENCIES
:: ------------------------------------------------
echo Removing unwanted Git repos (.git folders)...
for /r %%i in (.git) do rmdir /s /q "%%i"

echo Removing node_modules and build folders...
for /r %%i in (node_modules) do rmdir /s /q "%%i"
for /r %%i in (dist) do rmdir /s /q "%%i"
for /r %%i in (out) do rmdir /s /q "%%i"
for /r %%i in (target) do rmdir /s /q "%%i"
echo Repo + dependency cleanup done.
echo.

:: ------------------------------------------------
:: 4. SYSTEM TEMP + CACHE CLEANUP
:: ------------------------------------------------
echo Cleaning Windows Temp...
del /s /q %temp%\*
rd /s /q %temp%
mkdir %temp%

echo Cleaning System Temp...
del /s /q C:\Windows\Temp\*
rd /s /q C:\Windows\Temp
mkdir C:\Windows\Temp

echo Cleaning LocalAppData Temp...
del /s /q "%LocalAppData%\Temp\*"

echo Cleaning browser cache...
del /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*"
del /s /q "%LocalAppData%\Microsoft\Edge\User Data\Default\Cache\*"
echo Temp + cache cleanup done.
echo.

:: ------------------------------------------------
:: 5. GPU SHADER CACHE CLEANUP
:: ------------------------------------------------
echo Clearing DirectX Shader Cache...
del /s /q "%LocalAppData%\D3DSCache\*"

echo Clearing NVIDIA Shader Cache...
del /s /q "%LocalAppData%\NVIDIA\DXCache\*"
del /s /q "%LocalAppData%\NVIDIA\GLCache\*"
del /s /q "%LocalAppData%\NVIDIA\NvBackend\*"

echo Clearing AMD Shader Cache...
del /s /q "%LocalAppData%\AMD\DxCache\*"
del /s /q "%LocalAppData%\AMD\GLCache\*"

echo Clearing Intel Shader Cache...
del /s /q "%LocalAppData%\Intel\ShaderCache\*"
echo GPU shader caches cleared.
echo.

:: ------------------------------------------------
:: 6. FULL SYSTEM & DIRECTX REPAIR (SFC + DISM)
:: ------------------------------------------------
echo Running System File Checker (SFC)...
sfc /scannow

echo Running DISM health and repair...
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /CheckHealth
DISM /Online /Cleanup-Image /RestoreHealth

echo Cleaning Component Store (old updates)...
DISM /Online /Cleanup-Image /StartComponentCleanup
echo System & DirectX repair completed.
echo.

:: ------------------------------------------------
:: 7. RE-REGISTER CORE DIRECTX DLLs
:: ------------------------------------------------
echo Re-registering core DirectX DLLs...
for %%i in (
    d3d11.dll d3d12.dll dxgi.dll d3dcompiler_47.dll
) do regsvr32 /s "C:\Windows\System32\%%i"
echo DirectX DLLs re-registered.
echo.

:: ------------------------------------------------
:: 8. GPU DRIVER DEEP CLEANUP
:: ------------------------------------------------
echo Cleaning NVIDIA leftover files...
del /s /q "%ProgramData%\NVIDIA Corporation\Downloader\*"

echo Cleaning AMD leftover files...
del /s /q "%ProgramData%\AMD\*"

echo Cleaning GPU crash dumps...
del /s /q "%LocalAppData%\CrashDumps\*"

echo Resetting GPU driver registry profiles...
reg delete "HKLM\System\CurrentControlSet\Control\GraphicsDrivers" /f
echo GPU driver cleanup completed.
echo.

:: ------------------------------------------------
:: 9. INSTALLER REGISTRY CLEANUP
:: ------------------------------------------------
echo Cleaning installer in-progress / rollback keys...
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\InProgress" /f
reg delete "HKLM\Software\Microsoft\Windows\CurrentVersion\Installer\Rollback" /f
echo Installer registry cleaned.
echo.

:: ------------------------------------------------
:: 10. NETWORK STACK REPAIR
:: ------------------------------------------------
echo Repairing network stack...
netsh int ip reset
netsh winsock reset
ipconfig /flushdns
echo Network stack repaired.
echo.

:: ------------------------------------------------
:: 11. GRAPHICS PIPELINE RESET
:: ------------------------------------------------
echo Resetting Windows Graphics Pipeline...
net stop uxsms
net start uxsms
echo Graphics pipeline reset.
echo.

:: ------------------------------------------------
:: 12. OPTIONAL: APPX / STORE REPAIR
:: ------------------------------------------------
echo Repairing AppX / Windows Store apps (this may take time)...
powershell -command "Get-AppXPackage -AllUsers ^| Foreach {Add-AppxPackage -DisableDevelopmentMode -Register '$($_.InstallLocation)\AppXManifest.xml'}"
echo AppX / Store repair completed.
echo.

echo ================================================================
echo          ULTIMATE WINDOWS CLEANER v2 COMPLETED
echo        Restart PC for maximum stability & performance
echo ================================================================
pause
