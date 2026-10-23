/// A request TDLib refused, with the numeric code kept so rate limits can be
/// told apart from bad input.
class TelegramException implements Exception {
  const TelegramException(this.code, this.message);

  /// 400 bad request, 401 unauthorised, 420/429 flood wait, 406 silent.
  final int code;

  /// Raw Telegram error string, e.g. `PHONE_CODE_INVALID`.
  final String message;

  static final RegExp _retryAfter = RegExp(r'(?:FLOOD_WAIT_|retry after\s*)(\d+)', caseSensitive: false);

  bool get isFloodWait => code == 420 || code == 429 || message.contains('FLOOD_WAIT');

  /// Seconds Telegram asked us to wait, when it said.
  int? get retryAfterSeconds {
    final match = _retryAfter.firstMatch(message);
    return match == null ? null : int.tryParse(match.group(1)!);
  }

  static String inWords(int seconds) {
    if (seconds < 90) return '$seconds seconds';
    if (seconds < 5400) return '${(seconds / 60).round()} minutes';
    return '${(seconds / 3600).round()} hours';
  }

  /// What to show a person instead of Telegram's SCREAMING_SNAKE codes.
  String get friendlyMessage {
    if (isFloodWait) {
      final seconds = retryAfterSeconds;
      return seconds == null
          ? 'Telegram is rate limiting this account. Try again shortly.'
          : 'Too many attempts. Try again in ${inWords(seconds)}.';
    }
    for (final entry in _friendly.entries) {
      if (message.contains(entry.key)) return entry.value;
    }
    return message
        .replaceAll('_', ' ')
        .toLowerCase()
        .replaceFirstMapped(RegExp(r'^[a-z]'), (m) => m.group(0)!.toUpperCase());
  }

  static const Map<String, String> _friendly = {
    'PHONE_NUMBER_INVALID': 'That phone number doesn\'t look right.',
    'PHONE_NUMBER_BANNED': 'This phone number is banned from Telegram.',
    'PHONE_CODE_INVALID': 'That code isn\'t right. Check it and try again.',
    'PHONE_CODE_EXPIRED': 'That code expired. Ask for a new one.',
    'PASSWORD_HASH_INVALID': 'Wrong password. Try again.',
    'API_ID_INVALID': 'Telegram rejected this API ID and hash.',
    'API_ID_PUBLISHED_FLOOD': 'This API ID is blocked. Create your own.',
    'AUTH_KEY_UNREGISTERED': 'Your session expired. Sign in again.',
    'SESSION_REVOKED': 'This session was ended from another device.',
    'Request timeout': 'Telegram took too long to answer.',
    'CHAT_WRITE_FORBIDDEN': 'You can\'t write in this chat.',
    'CHAT_ADMIN_REQUIRED': 'Only admins can post here.',
  };

  @override
  String toString() => 'TelegramException($code, $message)';
}
