<div align="center">

<img src="assets/images/splash_screen.png" width="200" alt="Splash Screen"/>

# 💬 QuoteVerse
### Random Quote Generator

**CodeAlpha Internship — Task 2**

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![License](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-blue)]()

> *Wisdom for every moment — a beautifully crafted random quote generator built with Flutter.*

</div>

---

## 📱 Screenshots

<div align="center">
<table>
  <tr>
    <td align="center">
      <img src="assets/images/splash_screen.png" width="220" alt="Splash Screen"/><br/>
      <b>Splash Screen</b>
    </td>
    <td align="center">
      <img src="assets/images/home_screen.png" width="220" alt="Home Screen"/><br/>
      <b>Home Screen</b>
    </td>
    <td align="center">
      <img src="assets/images/favorites_screen.png" width="220" alt="Favorites Screen"/><br/>
      <b>Favorites Screen</b>
    </td>
  </tr>
</table>
</div>

---

## ✨ Features

| Feature | Description |
|---|---|
| 🎲 **Random Quotes** | Displays a new random quote every time the app opens or the button is clicked |
| 📚 **50+ Quotes** | Curated library of 50 inspirational quotes across 15+ categories |
| 🏷️ **Category Badges** | Every quote is tagged with a color-coded category (Motivation, Wisdom, Life, etc.) |
| ❤️ **Favorites** | Save quotes you love and manage them from the Favorites screen |
| 📋 **Copy to Clipboard** | One-tap copy of any quote with a confirmation snack bar |
| 🔀 **Shuffle Mode** | Three ways to get a new quote: New Quote button, Shuffle action, or tap Shuffle |
| 📊 **Live Stats** | Real-time counters for total quotes, explored count, and saved favorites |
| 🌟 **Splash Screen** | Animated splash with shimmer logo, loading dots, and smooth transition |
| 🎨 **Dark Premium UI** | Deep navy theme with purple gradient accents, glowing orbs, and micro-animations |

---

## 🗂️ Project Structure

```
lib/
├── main.dart                    # App entry point
│
├── models/
│   └── quote_model.dart         # Quote data model
│
├── data/
│   └── quotes_data.dart         # 50+ predefined quotes
│
├── theme/
│   └── app_theme.dart           # Color palette, gradients, ThemeData
│
├── screens/
│   ├── splash_screen.dart       # Animated splash screen
│   ├── home_screen.dart         # Main quote screen
│   └── favorites_screen.dart    # Saved quotes screen
│
└── widgets/
    ├── quote_card.dart          # Animated quote display card
    ├── animated_button.dart     # Press-scale "New Quote" button
    └── category_badge.dart      # Color-coded category pill
```

---

## 🎨 Design System

### Color Palette

| Token | Color | Hex |
|---|---|---|
| Primary | ![#6C63FF](https://placehold.co/15x15/6C63FF/6C63FF.png) Purple | `#6C63FF` |
| Secondary | ![#FF6584](https://placehold.co/15x15/FF6584/FF6584.png) Pink | `#FF6584` |
| Accent | ![#43E97B](https://placehold.co/15x15/43E97B/43E97B.png) Green | `#43E97B` |
| Background | ![#0D0D1A](https://placehold.co/15x15/0D0D1A/0D0D1A.png) Dark Navy | `#0D0D1A` |
| Card | ![#16162A](https://placehold.co/15x15/16162A/16162A.png) Dark Card | `#16162A` |
| Text Primary | ![#F0F0FF](https://placehold.co/15x15/F0F0FF/F0F0FF.png) Off-White | `#F0F0FF` |

### Typography
- **Headings / Quotes**: `Playfair Display` (Google Fonts) — elegant serif
- **UI Text / Labels**: `Poppins` (Google Fonts) — modern sans-serif

---

## 🚀 Getting Started

### Prerequisites
- Flutter SDK `>=3.0.0`
- Dart SDK `>=3.0.0`
- Android Studio / VS Code with Flutter extension

### Installation

```bash
# 1. Clone the repository
git clone https://github.com/your-username/random_quote_generator.git

# 2. Navigate into the project
cd random_quote_generator

# 3. Install dependencies
flutter pub get

# 4. Run the app
flutter run
```

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  google_fonts: ^6.2.1      # Premium typography
  cupertino_icons: ^1.0.8   # iOS-style icons
```

---

## 🏛️ Architecture

The app follows a clean, layered architecture:

```
┌─────────────────────────────────┐
│           Screens               │  ← UI layer (Stateful widgets)
│  SplashScreen │ HomeScreen      │
│  FavoritesScreen               │
├─────────────────────────────────┤
│           Widgets               │  ← Reusable components
│  QuoteCard │ AnimatedButton     │
│  CategoryBadge                 │
├─────────────────────────────────┤
│           Theme                 │  ← Design system
│  AppTheme (colors, gradients)  │
├─────────────────────────────────┤
│        Data / Models            │  ← Data layer
│  quotes_data.dart │ Quote model │
└─────────────────────────────────┘
```

---

## 📖 Quote Categories

The app includes quotes from **15+ categories**:

| 🔴 Motivation | 🟡 Wisdom | 🟢 Life | 🔵 Success |
|---|---|---|---|
| 🟠 Perseverance | 💜 Dreams | ❤️ Love | 🩷 Courage |
| 😄 Humor | 🔷 Philosophy | 🌿 Adventure | 🧠 Mindset |
| 💪 Resilience | 🩵 Gratitude | 🌸 Empathy | |

---

## 👤 Author

**Ghufran** — CodeAlpha Intern

> *Built with ❤️ using Flutter for the CodeAlpha Internship Program*

---

<div align="center">

⭐ **Star this repo if you found it helpful!**

*CodeAlpha Internship · Task 2 · Random Quote Generator*

</div>
