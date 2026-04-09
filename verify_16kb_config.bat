@echo off
echo ========================================
echo  16KB Configuration Verification
echo ========================================
echo.

echo Checking Gradle Wrapper version...
findstr "distributionUrl" android\gradle\wrapper\gradle-wrapper.properties
echo.

echo Checking Android Gradle Plugin version...
findstr "com.android.application" android\settings.gradle
echo.

echo Checking NDK version...
findstr "ndkVersion" android\app\build.gradle
echo.

echo Checking Kotlin version...
findstr "kotlin.android" android\settings.gradle
echo.

echo ========================================
echo  Required versions for 16KB support:
echo ========================================
echo - Gradle: 8.13+
echo - Android Gradle Plugin: 8.12.2+
echo - NDK: r29+ (29.0.13113456)
echo - Kotlin: 2.2.10+
echo - Flutter: 3.32+
echo.

echo Current Flutter version:
flutter --version | findstr "Flutter"
echo.

pause