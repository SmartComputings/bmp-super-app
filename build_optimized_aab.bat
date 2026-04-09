@echo off
echo Building optimized App Bundle (AAB)...
flutter clean
flutter pub get
flutter build appbundle --release --obfuscate --split-debug-info=debug-info
echo.
echo Done! Check: build\app\outputs\bundle\release\app-release.aab
pause
