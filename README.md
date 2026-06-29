# 🎬 Flutter Animation Marathon

A collection of seven Flutter animation built as a focused learning project.

Each screen demonstrates a different animation technique used in modern Flutter applications. The project was created to practice both implicit and explicit animations, Hero transitions, CustomPainter and Lottie.

---

## ✨ Features

- 7 dedicated animation demos
- Implicit animations
- Hero page transitions
- TweenAnimationBuilder + Curves comparison
- AnimationController
- AnimatedSwitcher + AnimatedList
- CustomPainter
- Lottie animations
- Shared AppColors, AppSpacing and AppDurations
- flutter analyze — 0 issues

---

## 📱 Tech Stack

- Flutter (Stable)
- Dart 3.x
- StatefulWidget
- AnimationController
- CustomPainter
- Lottie

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── app_colors.dart
│   ├── app_durations.dart
│   ├── app_sizes.dart
│   └── app_spacing.dart
│
├── home/
│   └── home_page.dart
│
└── days/
    ├── day_1_implicit.dart
    ├── day_2_hero.dart
    ├── day_3_curves.dart
    ├── day_4_controller.dart
    ├── day_5_switcher.dart
    ├── day_6_custom_paint.dart
    └── day_7_lottie.dart
```

---

# 🎥 Screens

## Day 1 — Implicit Animations

<p align="center">
<img src="assets/readme/day1.gif" width="320">
</p>

Demonstrates:

- AnimatedContainer
- AnimatedOpacity
- AnimatedAlign
- AnimatedPositioned
- AnimatedCrossFade

Shows how Flutter automatically animates widget state changes without using an AnimationController.

---

## Day 2 — Hero Transitions

<p align="center">
<img src="assets/readme/day2.gif" width="320">
</p>

Demonstrates Hero animations between a list page and a details page.

Includes a custom `flightShuttleBuilder` transition.

---

## Day 3 — TweenAnimationBuilder + Curves

<p align="center">
<img src="assets/readme/day3.gif" width="320">
</p>

Compares four animation curves side by side:

- Linear
- EaseIn
- ElasticOut
- BounceOut

Demonstrates how curves affect animation feel and timing.

---

## Day 4 — AnimationController

<p align="center">
<img src="assets/readme/day4.gif" width="320">
</p>

Explicit animation using AnimationController.

Shows:

- repeat(reverse: true)
- manual pause/resume
- proper controller disposal

---

## Day 5 — AnimatedSwitcher + AnimatedList

<p align="center">
<img src="assets/readme/day5.gif" width="320">
</p>

Animated switching between List and Grid layouts.

Demonstrates:

- AnimatedSwitcher
- AnimatedList
- custom insert/remove transitions
- animated Grid appearance

---

## Day 6 — CustomPainter

<p align="center">
<img src="assets/readme/day6.gif" width="320">
</p>

Animated progress ring drawn with Canvas.

Demonstrates:

- CustomPainter
- Canvas API
- SweepGradient
- AnimationController

---

## Day 7 — Lottie

<p align="center">
<img src="assets/readme/day7.gif" width="320">
</p>

Demonstrates integration of a local Lottie animation.

Animation playback is fully controlled using AnimationController.

---

# 🚀 Getting Started

Install dependencies

```bash
flutter pub get
```

Run the project

```bash
flutter run
```

---

# ✅ Code Quality

- flutter analyze — 0 issues
- Builds successfully on Android
- Builds successfully on iOS Simulator
- Proper AnimationController disposal
- Shared AppColors
- Shared AppSpacing
- Shared AppDurations
- One screen per file

---

# 📚 What this project demonstrates

- Implicit vs Explicit animations
- Hero transitions
- AnimationController lifecycle
- TweenAnimationBuilder
- Animation curves
- AnimatedSwitcher
- AnimatedList
- CustomPainter
- Lottie integration
- Flutter animation best practices
