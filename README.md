# 📚 Mind Focus Books Tracker — ombook

> **Wooden bookshelf edition** — Beautiful book tracking app

![Status](https://img.shields.io/badge/status-active-brightgreen)
![Platform](https://img.shields.io/badge/platform-Web%20%7C%20Android%20%7C%20iOS-lightgrey)

## ✨ Live Web App

**[👉 Open Live App](https://ankitburdak05-oss.github.io/ombook/)**

Browse the running web app directly in your browser — no install needed!

## 🎯 Features

- 🪵 **Wooden Bookshelf Design** — Cinematic, warm, immersive
- 📱 **5 Tabs**: Home · My Library · Focus Timer · Profile · Settings
- 🔥 **Reading Streaks** — Track daily reading
- ⏱️ **Focus Timer** — Pomodoro-style sessions
- 📊 **Reading Stats** — Books read, hours, achievements
- 🎨 **Dark Wood Theme** — Warm brown + gold accents
- 📚 **Bottom Navigation** — Easy thumb access

## 🛠 Tech Stack

### Web (this repo)
- Pure HTML + CSS + JavaScript
- No frameworks, no build step
- Mobile-first responsive design
- Wood-themed UI with custom palette

### Mobile (Flutter app)
- Flutter 3.10+
- Material 3 dark theme
- google_fonts (Inter)
- Dart

## 📁 Structure

```
ombook/
├── index.html              # Web app (live on GitHub Pages)
├── web/index.html          # Same web app (alt location)
├── lib/                    # Flutter mobile app source
│   ├── main.dart
│   ├── theme/app_theme.dart
│   ├── models/book.dart
│   ├── screens/
│   └── widgets/
├── android/                # Flutter Android build config
├── pubspec.yaml            # Flutter dependencies
└── README.md
```

## 🚀 Run

### Web (in browser)
Just open `index.html` — no build needed!

### Mobile (Flutter)
```bash
flutter pub get
flutter run
```

## 📱 Build APK
```bash
flutter build apk --release
```

---

Made with ❤️ by **ankitburdak05-oss**
