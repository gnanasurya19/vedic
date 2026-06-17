# Vedic - Ritual Booking App

A Flutter-based booking workflow application built with feature-based architecture.

---

## Prerequisites

Ensure the following are installed on your machine:

| Tool | Version |
|------|---------|
| Flutter SDK | 3.24.0 or above |
| Dart SDK | 3.5.0 or above |
| Android Studio | Hedgehog or above |
| Xcode (macOS only) | 15.0 or above |
| Java JDK | 17 or above |

---

## Getting Started

### 1. Clone the Repository

```bash
git clone https://github.com/gnanasurya19/vedic.git
cd vedic
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run Code Generation

This project uses build_runner for Hive adapters and JSON serialization.

```bash
dart run build_runner build --delete-conflicting-outputs
```

### 4. Run the Application

**Debug mode:**
```bash
flutter run
```

**Specific device:**
```bash
flutter devices                         # list available devices
flutter run -d <device_id>
```

---

## Build APK

**Debug APK:**
```bash
flutter build apk --debug
```

**Release APK:**
```bash
flutter build apk --release
```

Output path:
