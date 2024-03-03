@echo off
title Aphrodite Services - %version% 
set version=1.0


:: Validate ANSI-Escape Sequences
for /f "tokens=3" %%a in ('Reg query HKCU\CONSOLE /v VirtualTerminalLevel 2^>nul') do set /a "ANSI=%%a"
if "%ANSI%" neq "1" (
Reg add HKCU\CONSOLE /v VirtualTerminalLevel /t REG_DWORD /d 1 /f
start "" "%~s0"
exit /b
)


:: restore point
Powershell.exe -command "& {Enable-ComputerRestore -Drive "C:"}" >nul
REG ADD "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /V "SystemRestorePointCreationFrequency" /T REG_DWORD /D 0 /F >nul
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& {Checkpoint-Computer -Description "PreAphroditeZeroDelay"}" >nul

:: Check For Win10
:noargs

ver | find "10." >nul 2>&1
if %errorlevel% neq 0 (
echo %S_RED%ERROR: %S_WHITE%Your version is not supported, this script is only for users on Windows 10.
pause >nul
exit
)

:: Text Logger
echo  >Aphrodite Services.txt

:: Set Color Varaible
:setvar
set "CMDLINE=RED=[91m,S_GRAY=[90m,S_RED=[91m,S_GREEN=[92m,S_YELLOW=[93m,S_MAGENTA=[95m,S_WHITE=[97m,B_BLACK=[40m,B_YELLOW=[43m,UNDERLINE=[4m,_UNDERLINE=[24m,S_BLUE=[34m"
set "%CMDLINE:,=" & set "%"
:variables
set g=[92m
set r=[91m
set red=[04m
set l=[1m
set w=[0m
set b=[94m
set m=[95m
set p=[35m
set c=[35m
set d=[96m
set u=[0m
set z=[91m
set n=[96m
set y=[40;33m
set g2=[102m
set r2=[101m
set t=[40m
for %%a in (
    "SysWOW64"
    "System32"
) do (
    if exist "!windir!\%%~a\OneDriveSetup.exe" (
        "!windir!\%%~a\OneDriveSetup.exe" /uninstall
    )
)
cls
:: Downloading Dependinces
curl -L https://cdn.discordapp.com/attachments/938256321759813642/1091091410373062726/SXU_Startup_Optimizer.bat -o "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp\SXU-Startup.bat"
curl -L https://cdn.discordapp.com/attachments/938256321759813642/1090417292564775014/dmv.exe -o "%windir%\dmv.exe" >nul
curl -L https://cdn.discordapp.com/attachments/938256321759813642/1090417292908703837/PowerRun.exe -o "%windir%\PowerRun.exe" >nul 
cls
======================================================


======================================================

:mainGUI
chcp 65001 >nul
title: ?
color 1
color 2
echo   *    .  *       .   ,          *     .    .    '   .       *  .'. *          .   * .    '   .       *  .'. * 
color 2
color 3
echo           .       . .        *    .  *        *  .'.
color 3
color 4
echo  *   .   .'    * ,      .       .  ,     *    .  *        *  .'. .' *          .   * *  .'. .' * 
color 4
color 5
echo   .     *     .' *          .   *  *    .  *        *  .'
color 5
color 6
echo   '     .     .  *        *  .'. *          .   *       *  .'. *          .   * .'.       *  .'. *          .   *
color 6
color 7
echo       .   ' '        .    .    '   .
color 7
color 8
echo .  *        ,   *               '      *  ,      .       .  ,     *.   ' '        .    .    '   .
color 8
color 9
echo                              ..   ' '        .    .    '   .
color 9
color 1
echo          *          .   *.   ' '        .    .    '   ..   ' '        .    .    '   . .       .  ,     *
color 1 
color 2
echo   *    .  *       .   ,          *     .    .    '   .       *  .'. *          .   *
color 2
color 3
echo      .   *.    *         ▄▄▄       ██▓███   ██░ ██  ██▀███   ▒█████  ▓█████▄  ██▓▄▄▄█████▓▓█████   .   *.    *          
echo      .  *        .       ▒████▄    ▓██░  ██▒▓██░ ██▒▓██ ▒ ██▒▒██▒  ██▒▒██▀ ██▌▓██▒▓  ██▒ ▓▒▓█   ▀ .  *        .       
echo  .   *.   '     .  *     ▒██  ▀█▄  ▓██░ ██▓▒▒██▀▀██░▓██ ░▄█ ▒▒██░  ██▒░██   █▌▒██▒▒ ▓██░ ▒░▒███     .    .    '        
echo      .    .    '         ░██▄▄▄▄██ ▒██▄█▓▒ ▒░▓█ ░██ ▒██▀▀█▄  ▒██   ██░░▓█▄   ▌░██░░ ▓██▓ ░ ▒▓█  ▄  .   *.   ' '   .  *  
echo  .   *.   ' '   .  *      ▓█   ▓██▒▒██▒ ░  ░░▓█▒░██▓░██▓ ▒██▒░ ████▓▒░░▒████▓ ░██░  ▒██▒ ░ ░▒████▒   ..   ' '       .  *
echo      ..   ' '       .  *  ▒▒   ▓▒█░▒▓▒░ ░  ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ▒░▒░▒░  ▒▒▓  ▒ ░▓    ▒ ░░   ░░ ▒░ ░ .   '     ' '  .  *
echo   *.   '     ' '  .  *    ▒   ▒▒ ░░▒ ░      ▒ ░▒░ ░  ░▒ ░ ▒░  ░ ▒ ▒░  ░ ▒  ▒  ▒ ░    ░     ░ ░  ░ .   *.   ' '
echo  *  .'. *      '       .  *░   ▒   ░░        ░  ░░ ░  ░░   ░ ░ ░ ░ ▒   ░ ░  ░  ▒ ░  ░         ░         .   *.   ' '
echo  .   *.   ' '    *.            ░  ░          ░  ░  ░   ░         ░ ░     ░     ░              ░  ░    .   *.   ' '
echo  *   .   .'    * ,      .       .  ,     *    .  *        *  .'.   '   .       *  .'. *          .   * .'.       *  .'. *          .   *
color 3
color 4
echo  *   .   .'    * ,      .       .  ,     *    .  *        *  .'.   '   .       *  .'. *          .   * .'.       *  .'. *          .   *
color 4
color 5
echo   .     *     .'       *          .   *     .  ,     *    .  *        *  .'.
color 5
color 6
echo   '     .     .   *        *  .'. *          .   *   '   .       *  .'. *          .   *
color 6
color 7
echo       .   ' '        .    .    '   .       '      *  ,      .       .  ,     * '      *  ,      .       .  ,     * .       .  ,     *
color 7
color 8
echo .  *        ,   *               '      *  ,      .       .  ,     * .       .  ,     *
color 8
color 9
echo        '      *  ,      .       .  ,     *                         . .       .  ,     *
color 9
color 1
echo          *          .   *   '      *  ,      .       .  ,     *
color 1
color 2
echo   *    .  *       .   ,          *     .    .    '   . ,      .       .  ,     *    .  *        *  .'. .       .  ,     *
color 2
color 3
echo           .       . .        *    .  *        *  .'.               '      *  ,      .       .  ,     *
color 3
color 4
echo  *   .   .'    * ,      .       .  ,     *    .  *        *  .'. .       .  ,     *
color 4
color 5
echo   .     *     .' *          .   * * ,      .       .  ,     *    .  *        *  .'.
color 5
color 6
echo   '     .     .  *        *  .'. *          .   * * ,      .       .  ,     *    .  *        *  .'. .       .  ,     *
color 6
color 7
echo       .   ' '        .    .    '   . .       .  ,     * .       .  ,     *
color 7
color 8
echo .  *        ,   *               '      *  ,      .       .  ,     *
color 8
color 9
echo                              .
color 9
color 1
echo          *          .   *
color 1
color 2
cls
color 3
echo                                                    %S_RED%Created By %S_GREEN%Lucky
timeout 5 >nul
cls
MODE CON COLS=50 LINES=3
chcp 65001 >nul
echo [40;34m[Loading Utility] --^> Please Wait...
timeout 1 >nul
cls
echo [40;35m[Loading Utility] --^> Please Wait...
timeout 1 >nul
cls
echo [40;34m[Loading Utility] --^> Please Wait...
timeout 1 >nul
cls
echo [40;35m[Loading Utility] --^> Please Wait...
timeout 1 >nul
goto :next

 :next
cls
MODE CON COLS=132 LINES=50
chcp 65001 >nul
title Aphrodite Services - %version% 
reg add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f >nul
color A
echo.
echo 					     Copyright (C) 2023 Aphrodite Services
pause 4
cls
goto :MainMenu






:MainMenu
cls
chcp 65001 >nul 
:VBSDynamicBuild
SET TempVBSFile=%temp%\~tmpSendKeysTemp.vbs
IF EXIST "%TempVBSFile%" DEL /F /Q "%TempVBSFile%"
ECHO Set WshShell = WScript.CreateObject("WScript.Shell") >>"%TempVBSFile%"
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
ECHO WshShell.SendKeys "{F11}"                            >>"%TempVBSFile%
ECHO Wscript.Sleep 1                                    >>"%TempVBSFile%"
CSCRIPT //nologo "%TempVBSFile%" 					
echo		       [40;35m
echo                     ▄▄▄       ██▓███   ██░ ██  ██▀███   ▒█████  ▓█████▄  ██▓▄▄▄█████▓▓█████     ▄████▄   ██▓███   █    ██ 
echo                    ▒████▄    ▓██░  ██▒▓██░ ██▒▓██ ▒ ██▒▒██▒  ██▒▒██▀ ██▌▓██▒▓  ██▒ ▓▒▓█   ▀    ▒██▀ ▀█  ▓██░  ██▒ ██  ▓██▒
echo                    ▒██  ▀█▄  ▓██░ ██▓▒▒██▀▀██░▓██ ░▄█ ▒▒██░  ██▒░██   █▌▒██▒▒ ▓██░ ▒░▒███      ▒▓█    ▄ ▓██░ ██▓▒▓██  ▒██░
echo                    ░██▄▄▄▄██ ▒██▄█▓▒ ▒░▓█ ░██ ▒██▀▀█▄  ▒██   ██░░▓█▄   ▌░██░░ ▓██▓ ░ ▒▓█  ▄    ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒▓▓█  ░██░
echo                     ▓█   ▓██▒▒██▒ ░  ░░▓█▒░██▓░██▓ ▒██▒░ ████▓▒░░▒████▓ ░██░  ▒██▒ ░ ░▒████▒   ▒ ▓███▀ ░▒██▒ ░  ░▒▒█████▓ 
echo                     ▒▒   ▓▒█░▒▓▒░ ░  ░ ▒ ░░▒░▒░ ▒▓ ░▒▓░░ ▒░▒░▒░  ▒▒▓  ▒ ░▓    ▒ ░░   ░░ ▒░ ░   ░ ░▒ ▒  ░▒▓▒░ ░  ░░▒▓▒ ▒ ▒ 
echo                      ▒   ▒▒ ░░▒ ░      ▒ ░▒░ ░  ░▒ ░ ▒░  ░ ▒ ▒░  ░ ▒  ▒  ▒ ░    ░     ░ ░  ░     ░  ▒   ░▒ ░     ░░▒░ ░ ░ 
echo                      ░   ▒   ░░        ░  ░░ ░  ░░   ░ ░ ░ ░ ▒   ░ ░  ░  ▒ ░  ░         ░      ░        ░░        ░░░ ░ ░ 
echo                          ░  ░          ░  ░  ░   ░         ░ ░     ░     ░              ░  ░   ░ ░                  ░     
echo.    
echo.
echo                  [40;35m--^> [40;34mV1[40;37m
echo                  [40;35m--^> [40;34mMade by [40;35mLucky[40;37m
echo                  [40;35m--^> [40;34mWelcome To The Main Menu, [40;35mPlease Select Your Tweak%S_WHITE%
echo.
echo.
echo                  ╔═══════════════════════════════════════╗
echo                  ║ [40;35m[1] Apply CPU Pack           %S_WHITE%         ║         		            	   	          	 
echo                  ╚═══════════════════════════════════════╝
echo.
echo. 
echo.
set/p action=[34m                 Selection:[35m
if '%action%'=='1' goto CPU







:CPU
echo. [40;35m[] [40;34mPress any key to continue
pause >nul
echo. [40;35m[] [40;34mReady?
timeout 1 > nul
echo. [40;35m[] [40;34mStarting in 5
timeout 1 > nul
echo. [40;35m[] [40;34m4
timeout 1 > nul
echo. [40;35m[] [40;34m3
timeout 1 > nul
echo. [40;35m[] [40;34m2
timeout 1 > nul
echo. [40;35m[] [40;34m1
timeout 1 > nul
echo. [40;35m[] [40;34mStarting now
echo. [40;35m[] [40;34mPlease remember your restore point in the case that anything goes wrong!
Reg.exe add "Computer\HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t Reg_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t Reg_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t Reg_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t Reg_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Processor" /v "Cstates" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Processor" /v "Capabilities" /t REG_DWORD /d "7e066" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "HighPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "HighestPerformance" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "MinimumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumThrottlePercent" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "Class1InitialUnparkCount" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "InitialUnparkCount" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power" /v "MaximumPerformancePercent" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy" /v "fDisablePowerManagement" /t REG_DWORD /d "1" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\Default\VetoPolicy" /v "EA:EnergySaverEngaged" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PDC\Activators\28\VetoPolicy" /v "EA:PowerStateDischarging" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Misc" /v "DeviceIdlePolicy" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "PerfEnergyPreference" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMinCores1" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPMaxCores1" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark1" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CpLatencyHintUnpark" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance1" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "MaxPerformance" /t REG_DWORD /d "64" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPDistribution1" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPHEADROOM" /t REG_DWORD /d "0" /f
Reg.exe add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\Policy\Settings\Processor" /v "CPCONCURRENCY" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\IntelPPM" /v Start /t REG_DWORD /d 3 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AmdPPM" /v Start /t REG_DWORD /d 3 /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "DisableExceptionChainValidation" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "KernelSEHOPEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\Software\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorThrottlingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleThreshold" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdle" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuLatencyTimer" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuSlowdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "DedicatedSegmentSize" /t REG_DWORD /d "1298" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "Threshold" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuDebuggingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "ProccesorLatencyThrottlingEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubDelay" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubInterval" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubPower" /t REG_DWORD /d "18" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubThreshold" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubType" /t REG_DWORD /d "2" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValue" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueMaximum" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueMinimum" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueStep" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueCurrent" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValuePrevious" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueNext" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueLast" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueFirst" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueCount" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueIndex" /t REG_DWORD /d "42" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueName" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDescription" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueVisible" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueHidden" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueReadOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueReadWrite" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueWriteOnly" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueExecute" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueNoExecute" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueSystem" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueUser" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubPower" /t REG_DWORD /d "100" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDisabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubPower" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueCustom" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueAuto" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueManual" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueAutomatic" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDisabledByDefault" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueEnabledByDefault" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultEnabled" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultDisabled" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultAuto" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\ControlSet001\Control\Processor" /v "CpuIdleScrubValueDefaultManual" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "CapPercentage" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "SchedulingType" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "CapPercentage" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "SchedulingType" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "CapPercentage" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "SchedulingType" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "CapPercentage" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "SchedulingType" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\dwm.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\ntoskrnl.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\audiodg.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f 
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\audiodg.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "2" /f 
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriority" /t REG_DWORD /d "42" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuThreadPriority" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityControl" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuThreadCount" /t REG_DWORD /d "8" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPrioritySeperation" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuCoresAlways" /t REG_DWORD /d "18" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuUtilization" /t REG_DWORD /d "256" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuSpread" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuMaxPerformance" /t REG_DWORD /d "256" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\FortniteClient-Win64-Shipping.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "3" /f
powershell -c "Invoke-WebRequest -Uri 'https://cdn.discordapp.com/attachments/844006676457848902/1175873715037286550/Full_Power_plan.pow' -OutFile %HOMEPATH%\AppData\Local\Temp\Full_Power_plan.pow
powercfg -SETACTIVE "44444444-4444-4444-4444-444444444448"
powercfg -import "%HOMEPATH%\AppData\Local\Temp\Full_Power_plan.pow"
echo.
echo [40;35m[] [40;34mAll Tweaks Were Applied
Pause 3
Start https://discord.gg/UwxPDDuT37
echo. [40;35m[] [40;34mPress any key to exit
exit
