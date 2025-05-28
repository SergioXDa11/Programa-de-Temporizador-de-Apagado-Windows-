@echo off
SET THEFILE=C:\Users\cherg\Documents\Lazarus\Apgado automatico de windows\program.exe
echo Linking %THEFILE%
C:\lazarus\fpc\3.2.2\bin\x86_64-win64\ld.exe -b pei-x86-64  --gc-sections   --subsystem windows --entry=_WinMainCRTStartup    -o "C:\Users\cherg\Documents\Lazarus\Apgado automatico de windows\program.exe" "C:\Users\cherg\Documents\Lazarus\Apgado automatico de windows\link13212.res"
if errorlevel 1 goto linkend
goto end
:asmend
echo An error occurred while assembling %THEFILE%
goto end
:linkend
echo An error occurred while linking %THEFILE%
:end
