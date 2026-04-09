#!/bin/bash

echo "🍎 iOS Code Signing Setup Helper"
echo "================================="
echo ""

# Check if Xcode is installed
if ! command -v xcodebuild &> /dev/null; then
    echo "  Xcode is not installed or not in PATH"
    exit 1
fi

echo "✅ Xcode found: $(xcodebuild -version | head -n1)"
echo ""

# Open Xcode project
echo "📱 Opening Xcode project..."
echo "Please follow these steps in Xcode:"
echo ""
echo "1. 🔐 Sign in to your Apple Developer Account:"
echo "   - Go to Xcode > Settings > Accounts"
echo "   - Click '+' and add your Apple ID"
echo ""
echo "2. 🎯 Configure the project:"
echo "   - Select 'Runner' project in navigator"
echo "   - Select 'Runner' target"
echo "   - Go to 'Signing & Capabilities' tab"
echo "   - Select your Development Team"
echo "   - Ensure 'Automatically manage signing' is checked"
echo ""
echo "3. 📦 Update Bundle Identifier (if needed):"
echo "   - Change from 'im.fluffychat.app' to your unique identifier"
echo "   - Example: 'com.yourcompany.yourapp'"
echo ""
echo "4. 🔧 Fix Capabilities:"
echo "   - Ensure App Groups, Push Notifications, and Associated Domains are properly configured"
echo "   - Xcode should automatically create/update provisioning profiles"
echo ""

# Open the Xcode workspace
open ios/Runner.xcworkspace

echo "Opening Xcode workspace..."
echo ""
echo "After configuring in Xcode, run:"
echo "  flutter build ipa --release"
echo ""
echo "Or for development build:"
echo "  flutter build ipa --debug"