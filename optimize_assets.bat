@echo off
echo Optimizing assets for smaller APK size...

REM Remove unused image files (keep only essential ones)
if exist "assets\images\networks.rar" del "assets\images\networks.rar"

REM Remove duplicate logos (keep only logo_main.png)
if exist "assets\logo.png" del "assets\logo.png"
if exist "assets\logo1.jpg" del "assets\logo1.jpg"
if exist "assets\logo_transparent.png" del "assets\logo_transparent.png"

REM Remove test files
if exist "assets\test-countries-without-states.json" del "assets\test-countries-without-states.json"

echo Asset optimization completed!
echo Now run: flutter build apk --release --split-per-abi --obfuscate --split-debug-info=debug-info --tree-shake-icons
pause