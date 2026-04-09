@echo off
echo ========================================
echo  16KB Page Size Migration Script
echo ========================================
echo.

echo Step 1: Cleaning previous builds...
call flutter clean
if errorlevel 1 (
    echo Error: Flutter clean failed
    pause
    exit /b 1
)

echo.
echo Step 2: Getting Flutter dependencies...
call flutter pub get
if errorlevel 1 (
    echo Error: Flutter pub get failed
    pause
    exit /b 1
)

echo.
echo Step 3: Cleaning Android build...
cd android
call gradlew clean
if errorlevel 1 (
    echo Error: Gradle clean failed
    cd ..
    pause
    exit /b 1
)
cd ..

echo.
echo Step 4: Building release APK...
call flutter build apk --release
if errorlevel 1 (
    echo Error: Flutter build failed
    pause
    exit /b 1
)

echo.
echo Step 5: Checking 16KB alignment...
if exist "check_elf_alignment.ps1" (
    powershell -ExecutionPolicy Bypass -File check_elf_alignment.ps1 build\app\outputs\flutter-apk\app-release.apk
) else (
    echo Warning: check_elf_alignment.ps1 not found, skipping alignment check
)

echo.
echo ========================================
echo  Build completed successfully!
echo ========================================
echo APK location: build\app\outputs\flutter-apk\app-release.apk
echo.
pause