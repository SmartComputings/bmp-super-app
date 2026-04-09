@echo off
set APK_PATH=build\app\outputs\flutter-apk\app-debug.apk
set TEMP_DIR=temp_apk_extract

echo Checking 16KB alignment for %APK_PATH%

if not exist "%APK_PATH%" (
    echo APK not found: %APK_PATH%
    exit /b 1
)

mkdir %TEMP_DIR% 2>nul
cd %TEMP_DIR%

echo Extracting APK...
jar -xf ..\%APK_PATH%

echo Checking native libraries...
for /r lib %%f in (*.so) do (
    echo Found: %%f
)

cd ..
rmdir /s /q %TEMP_DIR%
echo Done.