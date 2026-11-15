# chat_pet

Flutter-мессенджер на Clean Architecture (Cubit, go_router, get_it/injectable, Dio, Firebase).

## Запуск

1. Установите зависимости и сгенерируйте код:
   ```bash
   flutter pub get
   dart run build_runner build --delete-conflicting-outputs
   ```
2. Настройте Firebase. Конфиги не хранятся в репозитории, создайте свой проект:
   ```bash
   dart pub global activate flutterfire_cli
   flutterfire configure
   ```
   Команда сгенерирует `android/app/google-services.json` (структура есть в `google-services.json.example`).
3. Создайте файл окружения из шаблона и заполните значения из Firebase Console:
   ```bash
   cp general_configs.env.example general_configs.env
   ```
4. По умолчанию используется `https://chat-backend-9n4f.onrender.com` (WebSocket через WSS). Конфигурация находится в `lib/core/config/api_config.dart`: `ApiConfig.prod()` для сервера, `ApiConfig.dev(serverHost: ..., serverPort: ...)` для локальной разработки.
5. Запустите:
   ```bash
   flutter run
   ```

## Лицензия

[MIT](LICENSE)
