#!/bin/bash

echo "🚀 Starting ULTRA-OPTIMIZED APK build process..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Build with maximum optimizations
echo "🏗️ Building ULTRA-OPTIMIZED APK for ARM64..."
flutter build apk \
  --release \
  --obfuscate \
  --split-debug-info=build/debug-info \
  --target-platform android-arm64 \
  --dart-define=FLUTTER_BUILD_NAME=1.0.2 \
  --dart-define=FLUTTER_BUILD_NUMBER=1 \
  --tree-shake-icons

# Check if build was successful
if [ $? -eq 0 ]; then
    echo "✅ ULTRA-OPTIMIZED APK built successfully!"
    
    # Get APK size
    APK_SIZE=$(ls -lh build/app/outputs/flutter-apk/app-release.apk | awk '{print $5}')
    echo "📱 APK Size: $APK_SIZE"
    
    # Show APK location
    echo "📁 APK Location: build/app/outputs/flutter-apk/app-release.apk"
    
    # Calculate size reduction
    ORIGINAL_SIZE=175
    CURRENT_SIZE=$(echo $APK_SIZE | sed 's/M//')
    REDUCTION=$((ORIGINAL_SIZE - CURRENT_SIZE))
    PERCENTAGE=$((REDUCTION * 100 / ORIGINAL_SIZE))
    
    echo "📊 Size Optimization Results:"
    echo "   Original Size: 175MB"
    echo "   Current Size: ${APK_SIZE}"
    echo "   Reduction: ${REDUCTION}MB (${PERCENTAGE}%)"
    
    # List all generated APKs
    echo "📋 Generated APKs:"
    ls -lh build/app/outputs/flutter-apk/*.apk
else
    echo "  Build failed!"
    exit 1
fi

echo "🎉 ULTRA-OPTIMIZED build completed!"
