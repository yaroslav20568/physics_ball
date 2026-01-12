# Physics Ball

## Русский

### Описание проекта

Physics Ball — это Flutter приложение, демонстрирующее симуляцию физики мяча с гравитацией, отскоками и трением. Мяч падает с верхней части экрана и отскакивает от стен, постепенно замедляясь из-за трения.

### Что было сделано

- Реализована физическая симуляция с гравитацией
- Добавлена система отскоков от стен с затуханием
- Реализовано трение при контакте с нижней границей
- Создан интерфейс с кнопкой для сброса мяча
- Мяч случайным образом появляется слева или справа при сбросе
- Автоматическая остановка анимации при достижении покоя

### Используемые пакеты

- `flutter` — основной SDK Flutter
- `cupertino_icons` — иконки в стиле iOS
- `flutter_lints` — линтер для проверки кода (dev)
- `flutter_launcher_icons` — генерация иконок приложения (dev)

---

## English

### Project Description

Physics Ball is a Flutter application that demonstrates ball physics simulation with gravity, bouncing, and friction. The ball falls from the top of the screen and bounces off walls, gradually slowing down due to friction.

### What Was Done

- Implemented physics simulation with gravity
- Added wall bouncing system with damping
- Implemented friction when in contact with the bottom boundary
- Created interface with a button to reset the ball
- Ball randomly appears from left or right when reset
- Automatic animation stop when the ball comes to rest

### Used Packages

- `flutter` — Flutter core SDK
- `cupertino_icons` — iOS-style icons
- `flutter_lints` — code linter (dev)
- `flutter_launcher_icons` — app icon generation (dev)

---

## Getting Started

To run this project:

```bash
flutter pub get
flutter run
```

To build a release APK:

```bash
flutter build apk --release
```
