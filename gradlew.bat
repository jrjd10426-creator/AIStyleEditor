@echo off
setlocal
where gradle >nul 2>nul
if %ERRORLEVEL% EQU 0 (
  gradle %*
  exit /b %ERRORLEVEL%
)
echo Gradle is not installed on this Windows machine.
echo For Appcircle/cloud build, use the Linux build environment or install Gradle 8.9.
exit /b 1
