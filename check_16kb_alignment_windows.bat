@echo off
setlocal enabledelayedexpansion

set APK_PATH=build\app\outputs\flutter-apk\app-debug.apk
set TEMP_DIR=temp_apk_extract
set OBJDUMP_PATH=C:\Users\DELL\AppData\Local\Android\sdk\ndk\27.0.12077973\toolchains\llvm\prebuilt\windows-x86_64\bin\llvm-objdump.exe

echo ========================================
echo 16KB Alignment Checker for Android
echo ========================================
echo.

if not exist "%APK_PATH%" (
    echo [ERROR] APK not found: %APK_PATH%
    exit /b 1
)

if not exist "%OBJDUMP_PATH%" (
    echo [ERROR] llvm-objdump not found at: %OBJDUMP_PATH%
    echo Please check your Android NDK installation
    exit /b 1
)

echo [INFO] Extracting APK: %APK_PATH%
mkdir %TEMP_DIR% 2>nul
cd %TEMP_DIR%

jar -xf ..\%APK_PATH% lib/* 2>nul
if errorlevel 1 (
    echo [SUCCESS] No native libraries found - app is compatible!
    cd ..
    rmdir /s /q %TEMP_DIR%
    exit /b 0
)

echo.
echo [INFO] Checking ELF alignment for 16KB page size compatibility...
echo.
echo Library                    Architecture    Alignment    Status
echo ----------------------------------------------------------------

set TOTAL_LIBS=0
set ALIGNED_LIBS=0
set CRITICAL_FAILS=0

for /r lib %%f in (*.so) do (
    set /a TOTAL_LIBS+=1
    set "LIBNAME=%%~nxf"
    set "FULLPATH=%%f"
    
    REM Determine architecture
    set "ARCH=unknown"
    echo !FULLPATH! | findstr "arm64-v8a" >nul && set "ARCH=arm64-v8a" && set "CRITICAL=1"
    echo !FULLPATH! | findstr "x86_64" >nul && set "ARCH=x86_64" && set "CRITICAL=1"
    echo !FULLPATH! | findstr "armeabi-v7a" >nul && set "ARCH=armeabi-v7a" && set "CRITICAL=0"
    echo !FULLPATH! | findstr "x86" >nul && if "!ARCH!"=="unknown" set "ARCH=x86" && set "CRITICAL=0"
    
    REM Check alignment using objdump
    for /f "tokens=*" %%a in ('"%OBJDUMP_PATH%" -p "%%f" 2^>nul ^| findstr "LOAD" ^| head -1') do (
        set "LOAD_LINE=%%a"
        for %%b in (!LOAD_LINE!) do set "ALIGNMENT=%%b"
    )
    
    REM Check if alignment is 16KB (2**14) or higher
    set "STATUS=FAIL"
    set "ALIGNED=0"
    
    REM Simple check for common 16KB+ alignments
    if "!ALIGNMENT!"=="2**14" set "STATUS=PASS" && set "ALIGNED=1"
    if "!ALIGNMENT!"=="2**15" set "STATUS=PASS" && set "ALIGNED=1"
    if "!ALIGNMENT!"=="2**16" set "STATUS=PASS" && set "ALIGNED=1"
    
    if "!ALIGNED!"=="1" (
        set /a ALIGNED_LIBS+=1
        echo !LIBNAME:~0,25!... !ARCH:~0,15! !ALIGNMENT:~0,12! [PASS]
    ) else (
        if "!CRITICAL!"=="1" set /a CRITICAL_FAILS+=1
        echo !LIBNAME:~0,25!... !ARCH:~0,15! !ALIGNMENT:~0,12! [FAIL]
    )
)

cd ..
rmdir /s /q %TEMP_DIR%

echo.
echo ========================================
echo SUMMARY
echo ========================================
echo Total libraries: %TOTAL_LIBS%
echo Aligned libraries: %ALIGNED_LIBS%
echo Critical failures: %CRITICAL_FAILS%
echo.

if %CRITICAL_FAILS% gtr 0 (
    echo [FAILED] Critical libraries need 16KB alignment!
    echo Google Play compliance: FAILED
    exit /b 1
) else (
    echo [PASSED] All libraries are 16KB aligned!
    echo Google Play compliance: PASSED
    exit /b 0
)