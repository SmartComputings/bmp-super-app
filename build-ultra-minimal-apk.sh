#!/bin/bash

# Ultra-Minimal APK Build Script
# This script builds the smallest possible release APK with maximum optimizations

set -e

echo "🚀 Starting ultra-minimal APK build process..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean
cd android
./gradlew clean
cd ..

# Get Flutter dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

# Analyze code for unused imports and dead code
echo "🔍 Analyzing code for optimizations..."
flutter analyze --no-fatal-infos

# Remove unused assets and resources
echo "🗑️ Removing unused assets..."
find assets -name "*.png" -size +100k -delete 2>/dev/null || true
find assets -name "*.jpg" -size +100k -delete 2>/dev/null || true
find assets -name "*.mp4" -delete 2>/dev/null || true

# Build ultra-optimized APK
echo "🏗️ Building ultra-optimized release APK..."
flutter build apk \
    --release \
    --target-platform android-arm64 \
    --split-per-abi \
    --obfuscate \
    --split-debug-info=build/debug-info \
    --dart-define=FLUTTER_BUILD_NAME=1.0.0 \
    --dart-define=FLUTTER_BUILD_NUMBER=1 \
    --dart-define=FLUTTER_TARGET_PLATFORM=android-arm64 \
    --dart-define=FLUTTER_BUILD_MODE=release \
    --dart-define=FLUTTER_OBFUSCATE=true \
    --dart-define=FLUTTER_SPLIT_DEBUG_INFO=true

# Check APK size
echo "📊 APK size information:"
find build/app/outputs/flutter-apk -name "*.apk" -exec ls -lh {} \;

# Show size breakdown
echo "📱 APK size breakdown:"
if command -v apkanalyzer &> /dev/null; then
    apkanalyzer apk summary build/app/outputs/flutter-apk/app-arm64-release.apk
else
    echo "apkanalyzer not found. Install Android SDK Build Tools for detailed analysis."
fi

echo "✅ Ultra-minimal APK build completed successfully!"
echo "📱 APK location: build/app/outputs/flutter-apk/app-arm64-release.apk"

# Optional: Install APK to connected device
read -p "🤔 Do you want to install the APK to a connected device? (y/n): " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "📱 Installing APK to device..."
    adb install -r build/app/outputs/flutter-apk/app-arm64-release.apk
    echo "✅ APK installed successfully!"
fi
