# 📚 Mind Focus Books Tracker — ombook

> **Wooden bookshelf edition** — Flutter mobile app for tracking your reading journey

![Status](https://img.shields.io/badge/status-active-brightgreen)
![Flutter](https://img.shields.io/badge/Flutter-3.10+-blue)
![Platform](https://img.shields.io/badge/platform-Android%20%7C%20iOS-lightgrey)

## ✨ Features

- 📚 **Wooden Bookshelf Design** — Cinematic, warm, immersive
- 📖 **5 Tabs**: Home · My Library · Focus Timer · Profile · Settings
- 🔥 **Reading Streaks** — Track daily reading
- ⏱️ **Focus Timer** — Pomodoro-style sessions
- 📊 **Reading Stats** — Books read, hours, achievements
- 🎨 **Dark Wood Theme** — Warm brown + gold accents
- 📱 **Bottom Navigation** — Easy thumb access

## 🚀 Run

```bash
flutter pub get
flutter run
```

## 📁 Structure

```
lib/
├── main.dart
├── theme/app_theme.dart
├── models/book.dart
├── screens/
│   ├── home_shell.dart
│   ├── home_screen.dart
│   ├── library_screen.dart
│   ├── focus_screen.dart
│   ├── profile_screen.dart
│   └── settings_screen.dart
└── widgets/
    ├── bookshelf_widget.dart
    ├── book_cover.dart
    └── status_pill.dart
```

## 🛠 Build APK

```bash
flutter build apk --release
```

---

Made with ❤️ by **ankitburdak05-oss**
