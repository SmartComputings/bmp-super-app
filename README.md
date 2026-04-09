# MindPower Super App

A comprehensive communication and social application built with Flutter.

## Project Overview

MindPower Super App is a feature-rich mobile application that provides:

* **Chat & Communication**: Real-time messaging with end-to-end encryption, group chats, file sharing, and voice/video calls

## Tech Stack

* **Framework**: Flutter 3.0+
* **Language**: Dart
* **State Management**: Provider
* **Navigation**: GoRouter
* **Image Processing**: Image package
* **HTTP Client**: Built-in HTTP client
* **Architecture**: Clean Architecture with domain, data, and presentation layers

## Setup & Installation

### Prerequisites

* Flutter SDK (3.0+)
* Dart SDK
* Android Studio / VS Code
* iOS development tools (for iOS builds)

### Installation Steps

1. Clone the repository

```bash
git clone <repository-url>
cd be-mindpower-super-app
```

2. Install dependencies

```bash
flutter pub get
```

3. Configure environment (if needed)

* Set up API endpoints and configuration files

## Run & Build Commands

### Run the app

```bash
# Run on connected device/emulator
flutter run

# Run in debug mode
flutter run --debug

# Run in release mode
flutter run --release

# Run on specific device
flutter run -d <device-id>
```

### Build the app

```bash
# Build APK (Android)
flutter build apk

# Build App Bundle (Android)
flutter build appbundle

# Build iOS app
flutter build ios

# Build for release
flutter build apk --release
flutter build ios --release
```

### Other useful commands

```bash
# Check Flutter installation
flutter doctor

# List connected devices
flutter devices

# Clean build files
flutter clean

#
```
