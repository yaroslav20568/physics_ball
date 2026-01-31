# Physics Ball

Приложение для симуляции физики падающего мяча с гравитацией, отскоками и трением.

## Описание проекта

Physics Ball - это мобильное приложение на Flutter для симуляции физики мяча с гравитацией, отскоками и трением. Приложение позволяет пользователям наблюдать за падением мяча с гравитацией, его отскоками от стен с затуханием и трением при контакте с нижней границей экрана.

## Демонстрация

![Демонстрация работы](video/demo.gif)

## Что было сделано

- Создана структура проекта с разделением на экраны, виджеты, модели, сервисы и константы
- Реализована физическая симуляция с гравитацией
- Добавлена система отскоков от стен с затуханием (bounce damping)
- Реализовано трение при контакте с нижней границей
- Создан интерфейс с кнопкой для сброса мяча (Drop)
- Мяч случайным образом появляется слева или справа при сбросе
- Автоматическая остановка анимации при достижении покоя
- Вынесены все цвета в отдельный файл констант
- Добавлен цвет для AppBar (синий)
- Организованы виджеты по экранам (widgets/game_screen/)
- Декомпозирована логика в модели (BallState) и сервисы (PhysicsService)
- Настроены цвета приложения в отдельном файле констант
- Адаптирован интерфейс для портретной ориентации
- Добавлена иконка приложения для Android
- Настроено название приложения "Physics Ball" для Android

## Используемые пакеты

- `flutter` - основной фреймворк
- `cupertino_icons` - иконки для iOS стиля
- `flutter_lints` - линтеры для проверки кода
- `flutter_launcher_icons` - генерация иконок приложения (dev dependency)

## Архитектура

Проект следует принципам SOLID и KISS. Код организован в следующие директории:

- `lib/screens/` - экраны приложения
- `lib/widgets/` - переиспользуемые виджеты, организованные по экранам (widgets/<screen_name>/)
- `lib/models/` - модели данных (BallState)
- `lib/services/` - бизнес-логика (PhysicsService)
- `lib/constants/` - константы (цвета, игровые константы)

---

# Physics Ball

A mobile application for simulating falling ball physics with gravity, bouncing, and friction.

## Project Description

Physics Ball is a Flutter mobile application for simulating ball physics with gravity, bouncing, and friction. The application allows users to observe the ball falling with gravity, bouncing off walls with damping, and friction when in contact with the bottom boundary of the screen.

## Demo

![Demo](video/demo.gif)

## What Was Done

- Created project structure with separation into screens, widgets, models, services, and constants
- Implemented physics simulation with gravity
- Added wall bouncing system with damping (bounce damping)
- Implemented friction when in contact with the bottom boundary
- Created interface with a button to reset the ball (Drop)
- Ball randomly appears from left or right when reset
- Automatic animation stop when the ball comes to rest
- Extracted all colors to a separate constants file
- Added color for AppBar (blue)
- Organized widgets by screens (widgets/game_screen/)
- Decomposed logic into models (BallState) and services (PhysicsService)
- Configured application colors in a separate constants file
- Adapted interface for portrait orientation
- Added application icon for Android
- Configured application name "Physics Ball" for Android

## Used Packages

- `flutter` - main framework
- `cupertino_icons` - icons for iOS style
- `flutter_lints` - linters for code checking
- `flutter_launcher_icons` - application icon generation (dev dependency)

## Architecture

The project follows SOLID and KISS principles. Code is organized into the following directories:

- `lib/screens/` - application screens
- `lib/widgets/` - reusable widgets, organized by screens (widgets/<screen_name>/)
- `lib/models/` - data models (BallState)
- `lib/services/` - business logic (PhysicsService)
- `lib/constants/` - constants (colors, game constants)
