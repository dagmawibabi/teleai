part of '../tdapi.dart';

/// **CheckAuthenticationBotToken** *(checkAuthenticationBotToken)* - TDLib function
///
/// Checks the authentication token of a bot; to log in as a bot.. Works only when the current authorization state is authorizationStateWaitPhoneNumber.. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in.
///
/// * [token]: The bot token.
///
/// [Ok] is returned on completion.
final class CheckAuthenticationBotToken extends TdFunction {
  /// **CheckAuthenticationBotToken** *(checkAuthenticationBotToken)* - TDLib function
  ///
  /// Checks the authentication token of a bot; to log in as a bot.. Works only when the current authorization state is authorizationStateWaitPhoneNumber.. Can be used instead of setAuthenticationPhoneNumber and checkAuthenticationCode to log in.
  ///
  /// * [token]: The bot token.
  ///
  /// [Ok] is returned on completion.
  const CheckAuthenticationBotToken({
    required this.token,
  });

  /// The bot token
  final String token;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "token": token,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [token]: The bot token
  CheckAuthenticationBotToken copyWith({
    String? token,
  }) =>
      CheckAuthenticationBotToken(
        token: token ?? this.token,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkAuthenticationBotToken';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
