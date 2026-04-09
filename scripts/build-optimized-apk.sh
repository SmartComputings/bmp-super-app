#!/bin/bash

# APK Size Optimization Build Script
# This script builds an optimized APK with maximum size reduction

set -e

echo "🚀 Starting APK Size Optimization Build..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Configuration
BUILD_TYPE="releaseMinified"
OUTPUT_DIR="build/app/outputs/apk/release"
TEMP_DIR="build/temp_optimized"

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean
rm -rf $OUTPUT_DIR
rm -rf $TEMP_DIR

# Get dependencies
echo "📦 Getting Flutter dependencies..."
flutter pub get

# Build optimized APK
echo "🔨 Building optimized APK with type: $BUILD_TYPE..."
flutter build apk --build-type=$BUILD_TYPE --target-platform android-arm64

# Check if build was successful
if [ ! -f "$OUTPUT_DIR/app-$BUILD_TYPE.apk" ]; then
    echo -e "${RED}  Build failed! APK not found.${NC}"
    exit 1
fi

# Get APK size before optimization
ORIGINAL_SIZE=$(du -h "$OUTPUT_DIR/app-$BUILD_TYPE.apk" | cut -f1)
echo -e "${GREEN}✅ Build successful! Original APK size: $ORIGINAL_SIZE${NC}"

# Create optimized APK directory
mkdir -p $TEMP_DIR

# Copy APK to temp directory
cp "$OUTPUT_DIR/app-$BUILD_TYPE.apk" "$TEMP_DIR/app-optimized.apk"

# Use zipalign for better compression
echo "📐 Optimizing APK with zipalign..."
if command -v zipalign &> /dev/null; then
    zipalign -v -p 4 "$TEMP_DIR/app-optimized.apk" "$TEMP_DIR/app-aligned.apk"
    mv "$TEMP_DIR/app-aligned.apk" "$TEMP_DIR/app-optimized.apk"
    echo "✅ APK aligned successfully"
else
    echo -e "${YELLOW}⚠️  zipalign not found, skipping alignment${NC}"
fi

# Get final APK size
FINAL_SIZE=$(du -h "$TEMP_DIR/app-optimized.apk" | cut -f1)

# Calculate size reduction
if [ -f "$OUTPUT_DIR/app-$BUILD_TYPE.apk" ]; then
    ORIGINAL_BYTES=$(stat -f%z "$OUTPUT_DIR/app-$BUILD_TYPE.apk" 2>/dev/null || stat -c%s "$OUTPUT_DIR/app-$BUILD_TYPE.apk" 2>/dev/null || echo "0")
    FINAL_BYTES=$(stat -f%z "$TEMP_DIR/app-optimized.apk" 2>/dev/null || stat -c%s "$TEMP_DIR/app-optimized.apk" 2>/dev/null || echo "0")
    
    if [ "$ORIGINAL_BYTES" -gt 0 ] && [ "$FINAL_BYTES" -gt 0 ]; then
        REDUCTION=$(( (ORIGINAL_BYTES - FINAL_BYTES) * 100 / ORIGINAL_BYTES ))
        echo -e "${BLUE}📊 Size Analysis:${NC}"
        echo -e "   Original: $ORIGINAL_SIZE"
        echo -e "   Final:    $FINAL_SIZE"
        echo -e "   Reduction: ${REDUCTION}%"
    fi
fi

# Copy optimized APK to output directory
cp "$TEMP_DIR/app-optimized.apk" "$OUTPUT_DIR/app-optimized.apk"

# Clean up temp directory
rm -rf $TEMP_DIR

echo -e "${GREEN}🎉 APK Optimization Complete!${NC}"
echo -e "📱 Optimized APK location: $OUTPUT_DIR/app-optimized.apk"
echo -e "📏 Final size: $FINAL_SIZE"

# Show APK info
echo -e "\n${BLUE}📋 APK Information:${NC}"
if command -v aapt &> /dev/null; then
    echo "Package info:"
    aapt dump badging "$OUTPUT_DIR/app-optimized.apk" | grep -E "(package|sdkVersion|targetSdkVersion)" | head -3
else
    echo -e "${YELLOW}⚠️  aapt not found, cannot show package info${NC}"
fi

echo -e "\n${GREEN}✨ Build completed successfully!${NC}"
