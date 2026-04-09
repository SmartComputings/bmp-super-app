#!/bin/bash

# Build Minimal APK Script
# This script builds a highly optimized and minimal-sized release APK

set -e

echo "🚀 Starting minimal APK build process..."

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

# Build optimized APK
echo "🏗️ Building optimized release APK..."
flutter build apk \
    --release \
    --target-platform android-arm64 \
    --split-per-abi \
    --obfuscate \
    --split-debug-info=build/debug-info \
    --dart-define=FLUTTER_BUILD_NAME=1.0.0 \
    --dart-define=FLUTTER_BUILD_NUMBER=1

# Check APK size
echo "📊 APK size information:"
find build/app/outputs/flutter-apk -name "*.apk" -exec ls -lh {} \;

echo "✅ Minimal APK build completed successfully!"
echo "📱 APK location: build/app/outputs/flutter-apk/app-arm64-release.apk"
