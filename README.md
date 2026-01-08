# 💧 Aqualert - Water Reminder App

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.8.1-02569B?logo=flutter)
![Dart](https://img.shields.io/badge/Dart-3.0-0175C2?logo=dart)
![Firebase](https://img.shields.io/badge/Firebase-Enabled-FFCA28?logo=firebase)
![License](https://img.shields.io/badge/License-MIT-green)
![Tests](https://img.shields.io/badge/Tests-65.5%25-yellow)

**A beautiful and feature-rich water drinking reminder app built with Flutter**

[Features](#-features) • [Screenshots](#-screenshots) • [Tech Stack](#-tech-stack) • [Getting Started](#-getting-started) • [Architecture](#-architecture) • [Testing](#-testing)

</div>

---

## 📋 Overview

Aqualert is a professional water tracking application that helps users maintain proper hydration throughout the day. Built with modern Flutter best practices and Clean Architecture principles, it offers a beautiful Material 3 UI with smooth animations and comprehensive features.

### 🎯 Key Highlights

- ✅ **Complete Feature Set**: Water tracking, smart reminders, statistics, achievements, and streaks
- 🎨 **Modern UI**: Material 3 design with Light/Dark/System themes
- 🌍 **Localization**: Full Turkish and English support
- 🔐 **Authentication**: Firebase Auth with Google Sign-In and email/password
- 📊 **Analytics**: Comprehensive statistics with beautiful charts
- 🏆 **Gamification**: Achievement system with 8 different achievements
- 🔔 **Smart Reminders**: Customizable notification schedules
- ☁️ **Cloud Sync**: Firestore integration for data backup
- 📱 **Offline Support**: Local storage with Hive
- ✨ **Smooth Animations**: Delightful user experience with flutter_animate

---

## ✨ Features

### 🚰 Core Water Tracking
- **Quick Add Buttons**: 250ml, 350ml, 500ml, 750ml presets
- **Custom Amount**: Add any water amount with unit conversion (ml/fl oz)
- **Real-time Progress**: Circular wave animation showing daily progress
- **History View**: Today's intake history with swipe-to-delete
- **Motivational Messages**: Dynamic encouraging messages based on progress

### 🔔 Smart Reminders
- **Customizable Schedule**: Set reminder start/end times
- **Flexible Intervals**: 30-180 minute reminder frequency
- **Local Notifications**: Works even when app is closed
- **Firebase Cloud Messaging**: Push notification support
- **Test Notification**: Verify notification setup

### 📊 Statistics & Analytics
- **Multiple Time Ranges**: View daily, weekly, monthly, and yearly data
- **Interactive Charts**: Beautiful bar charts with fl_chart
- **Summary Cards**: Average intake, total consumption, goal achievement rate
- **Best Day Tracking**: See your highest consumption day
- **Streak Integration**: View your consistency statistics

### 🏆 Gamification
- **Achievement System**: 8 unique achievements to unlock
  - First Drop (1st water intake)
  - Daily Goal Master (complete daily goal)
  - Week Warrior (7-day streak)
  - Hydration Hero (30-day streak)
  - Century Club (100 total liters)
  - Marathon Master (1000 total liters)
  - Consistency Champion (90% weekly consistency)
  - Early Riser (log water before 8 AM)
- **Points System**: Earn reward points for achievements
- **Progress Tracking**: Visual progress bars for each achievement
- **Streak System**: Daily streak tracking with automatic updates

### 👤 Profile & Settings
- **Personal Info**: Age, weight, height, gender, activity level
- **Smart Goal Calculation**: BMI-based daily water goal recommendation
- **Custom Goal**: Set your own daily target
- **Theme Customization**: Light/Dark/System modes with persistence
- **Unit Preferences**: Switch between ml and fl oz with auto-conversion
- **Language Selection**: Turkish and English
- **Data Export/Import**: Backup and restore your data (JSON format)

### 🔐 Authentication & Security
- **Email/Password Auth**: Traditional authentication with validation
- **Google Sign-In**: Quick OAuth login
- **Email Verification**: Secure account activation
- **Password Reset**: Forgot password functionality
- **Firebase Security Rules**: Protected user data

### 🎨 Design & UX
- **Material 3**: Latest Material Design guidelines
- **Dynamic Colors**: Adaptive color schemes
- **Smooth Animations**: Flutter_animate integration
- **Custom Widgets**: Reusable, beautiful components
- **Responsive Layout**: Works on all screen sizes
- **Accessibility**: Screen reader support (in progress)

---

## 📸 Screenshots

> Screenshots will be added here once the app is released

<div align="center">
  <table>
    <tr>
      <td><img src="screenshots/home.png" width="200" alt="Home Screen"/></td>
      <td><img src="screenshots/statistics.png" width="200" alt="Statistics"/></td>
      <td><img src="screenshots/achievements.png" width="200" alt="Achievements"/></td>
      <td><img src="screenshots/settings.png" width="200" alt="Settings"/></td>
    </tr>
  </table>
</div>

---

## 🛠️ Tech Stack

### Core Framework
- **Flutter**: 3.8.1
- **Dart**: 3.0+

### State Management
- **Riverpod**: 2.5.1 (with Riverpod Generator)
- **Freezed**: Immutable data models
- **JSON Serialization**: json_annotation + json_serializable

### Navigation
- **go_router**: 14.2.3 (Declarative routing with auth state handling)

### Backend & Database
- **Firebase Core**: 3.3.0
- **Firebase Auth**: 5.1.4 (Email/Password, Google Sign-In)
- **Cloud Firestore**: 5.2.1 (Cloud database)
- **Firebase Messaging**: 15.0.4 (Push notifications)
- **Firebase Analytics**: 11.2.1 (User analytics)
- **Hive**: 2.2.3 (Local NoSQL database)
- **SharedPreferences**: 2.3.2 (Key-value storage)

### UI & Design
- **Material Design Icons**: 7.0.7296
- **Google Fonts**: 6.2.1 (Poppins typography)
- **flutter_animate**: 4.5.0 (Smooth animations)
- **Lottie**: 3.1.2 (Lottie animations)
- **fl_chart**: 0.69.0 (Beautiful charts)

### Notifications
- **flutter_local_notifications**: 17.2.2
- **timezone**: 0.9.4

### Utilities
- **intl**: 0.20.2 (Internationalization)
- **permission_handler**: 11.3.1
- **connectivity_plus**: 6.0.4
- **package_info_plus**: 8.0.2
- **file_picker**: 8.1.2
- **share_plus**: 10.0.2
- **url_launcher**: 6.3.0
- **uuid**: 4.5.1

### Testing
- **flutter_test**: SDK
- **mocktail**: 1.0.4 (Mocking)
- **fake_cloud_firestore**: 3.0.3 (Firestore mocking)
- **firebase_auth_mocks**: 0.14.1 (Auth mocking)
- **integration_test**: SDK

---

## 🏗️ Architecture

### Clean Architecture + Feature-First

```
lib/
├── core/                           # Core functionality
│   ├── constants/                  # App-wide constants
│   ├── errors/                     # Error handling (Failures)
│   ├── providers/                  # Global providers
│   ├── routing/                    # App routing (GoRouter)
│   ├── services/                   # Core services
│   ├── themes/                     # Theme configuration
│   └── utils/                      # Utilities & extensions
├── features/                       # Feature modules
│   ├── auth/                       # Authentication feature
│   │   ├── data/                   # Data layer
│   │   │   ├── datasources/        # Remote & local data sources
│   │   │   └── repositories/       # Repository implementations
│   │   ├── domain/                 # Domain layer
│   │   │   ├── models/             # Domain models (Freezed)
│   │   │   └── repositories/       # Repository interfaces
│   │   └── presentation/           # Presentation layer
│   │       ├── providers/          # Feature providers
│   │       ├── screens/            # UI screens
│   │       └── widgets/            # Feature widgets
│   ├── home/                       # Home/Dashboard feature
│   ├── statistics/                 # Statistics feature
│   ├── achievements/               # Achievements feature
│   ├── settings/                   # Settings feature
│   ├── profile/                    # Profile feature
│   ├── reminders/                  # Reminders feature
│   ├── onboarding/                 # Onboarding feature
│   ├── splash/                     # Splash screen
│   └── help/                       # Help & FAQ
├── shared/                         # Shared across features
│   ├── models/                     # Shared models
│   ├── providers/                  # Shared providers
│   ├── services/                   # Shared services
│   └── widgets/                    # Shared widgets
├── l10n/                           # Localization
│   ├── app_en.arb                  # English translations
│   └── app_tr.arb                  # Turkish translations
└── main.dart                       # App entry point
```

### Design Patterns
- **Repository Pattern**: Abstraction over data sources
- **Provider Pattern**: State management with Riverpod
- **MVVM**: Model-View-ViewModel separation
- **Dependency Injection**: Constructor injection via Riverpod
- **Observer Pattern**: Stream-based reactive updates

---

## 🚀 Getting Started

### Prerequisites

- **Flutter SDK**: 3.8.1 or higher
- **Dart SDK**: 3.0 or higher
- **Firebase Project**: Create a project at [Firebase Console](https://console.firebase.google.com)
- **Android Studio** or **VS Code** with Flutter extensions
- **Xcode**: (for iOS development on macOS)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/dilaraacikgoz/water_reminder.git
   cd water_reminder
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Firebase Setup**

   a. Create a Firebase project at [Firebase Console](https://console.firebase.google.com)

   b. Add Android and iOS apps to your Firebase project

   c. Download configuration files:
      - `google-services.json` for Android → Place in `android/app/`
      - `GoogleService-Info.plist` for iOS → Place in `ios/Runner/`

   d. Run FlutterFire CLI to configure:
      ```bash
      flutterfire configure
      ```

4. **Enable Firebase Services**
   - Authentication (Email/Password, Google)
   - Cloud Firestore
   - Firebase Messaging
   - Firebase Analytics

5. **Generate code**
   ```bash
   flutter pub run build_runner build --delete-conflicting-outputs
   ```

6. **Run the app**
   ```bash
   flutter run
   ```

### Configuration

#### Firebase Security Rules

**Firestore Rules** (`firestore.rules`):
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    // User data
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
    }

    // Water records
    match /water_records/{recordId} {
      allow read, write: if request.auth != null &&
        resource.data.userId == request.auth.uid;
    }

    // Achievements
    match /achievements/{achievementId} {
      allow read, write: if request.auth != null &&
        resource.data.userId == request.auth.uid;
    }
  }
}
```

#### Environment Variables

For production builds, consider using environment variables for sensitive data:

```dart
// lib/core/config/env.dart
class Env {
  static const String apiKey = String.fromEnvironment('API_KEY');
  static const String projectId = String.fromEnvironment('PROJECT_ID');
}
```

---

## 🧪 Testing

### Run All Tests
```bash
flutter test
```

### Run Specific Test File
```bash
flutter test test/unit/services/auth_service_test.dart
```

### Run Tests with Coverage
```bash
flutter test --coverage
genhtml coverage/lcov.info -o coverage/html
open coverage/html/index.html
```

### Test Structure
```
test/
├── unit/                           # Unit tests
│   ├── repositories/
│   └── services/
├── widget/                         # Widget tests
│   ├── screens/
│   └── widgets/
├── integration/                    # Integration tests
└── helpers/                        # Test helpers & mocks
```

### Current Test Coverage
- **Total**: 55/84 tests passing (65.5%)
- **Unit Tests**: 48/51 (94%) ✅
- **Widget Tests**: 7/33 (21%) ⚠️
- **Integration Tests**: Functional ✅

---

## 📦 Building for Release

### Android APK
```bash
flutter build apk --release
```

### Android App Bundle (for Play Store)
```bash
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
```

### Build Configuration

#### Android Signing
Create `android/key.properties`:
```properties
storePassword=<your-store-password>
keyPassword=<your-key-password>
keyAlias=<your-key-alias>
storeFile=<path-to-keystore>
```

#### Version Bump
Update `pubspec.yaml`:
```yaml
version: 1.0.0+1  # version+buildNumber
```

---

## 📱 Supported Platforms

- ✅ **Android**: API 21+ (Android 5.0 Lollipop)
- ✅ **iOS**: iOS 14.0+
- ⚠️ **Web**: Not tested
- ⚠️ **Desktop**: Not tested

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Code Style
- Follow [Effective Dart](https://dart.dev/guides/language/effective-dart) guidelines
- Use `flutter analyze` to check for issues
- Format code with `dart format .`
- Write tests for new features

---

## 🐛 Known Issues

- Widget tests have some timeout issues (23/33 passing)
- Some TODOs pending for navigation handlers
- Apple Sign-In not implemented yet (optional)

See [PROJECT_PLAN.md](PROJECT_PLAN.md) for detailed project status and roadmap.

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 👨‍💻 Author

**Dilara Açıkgöz**
- GitHub: [@dilaraacikgoz](https://github.com/dilaraacikgoz)
- Email: dilaraacikgoz.dev@gmail.com

---

## 🙏 Acknowledgments

- [Flutter Team](https://flutter.dev) for the amazing framework
- [Firebase](https://firebase.google.com) for backend services
- [Riverpod](https://riverpod.dev) for state management
- All open-source contributors whose packages made this project possible

---

## 📞 Support

For support, email dilaraacikgoz.dev@gmail.com or open an issue on GitHub.

---

<div align="center">

**Made with ❤️ and Flutter**

⭐ Star this repo if you found it helpful!

</div>
