import 'telegram_api.dart';

/// App-wide constants.
abstract final class AppConfig {
  static const String appName = 'TeleAI';

  /// Telegram API credentials from https://my.telegram.org. A build given
  /// TELEGRAM_API_ID and TELEGRAM_API_HASH with `--dart-define` (or
  /// `--dart-define-from-file=telegram_api.json`) uses those; otherwise they
  /// come from the git-ignored telegram_api.dart.
  static const int telegramApiId = int.fromEnvironment('TELEGRAM_API_ID', defaultValue: TelegramApi.apiId);
  static const String telegramApiHash = String.fromEnvironment('TELEGRAM_API_HASH', defaultValue: TelegramApi.apiHash);

  static bool get hasTelegramCredentials => telegramApiId != 0 && telegramApiHash.isNotEmpty;

  static const String version = '1.0.0';
}
