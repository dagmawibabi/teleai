part of '../tdapi.dart';

/// **CheckBotUsername** *(checkBotUsername)* - TDLib function
///
/// Checks whether a username can be set for a new bot or assigned as a secondary username to an existing bot. Use checkChatUsername to check username for other chat types.
///
/// * [username]: Username to be checked.
/// * [isSecondary]: Pass true to check whether the username is suitable as a secondary username for an existing bot; pass false to check whether the username is suitable for createBot.
///
/// [CheckChatUsernameResult] is returned on completion.
final class CheckBotUsername extends TdFunction {
  /// **CheckBotUsername** *(checkBotUsername)* - TDLib function
  ///
  /// Checks whether a username can be set for a new bot or assigned as a secondary username to an existing bot. Use checkChatUsername to check username for other chat types.
  ///
  /// * [username]: Username to be checked.
  /// * [isSecondary]: Pass true to check whether the username is suitable as a secondary username for an existing bot; pass false to check whether the username is suitable for createBot.
  ///
  /// [CheckChatUsernameResult] is returned on completion.
  const CheckBotUsername({
    required this.username,
    required this.isSecondary,
  });

  /// Username to be checked
  final String username;

  /// Pass true to check whether the username is suitable as a secondary username for an existing bot; pass false to check whether the username is suitable for createBot
  final bool isSecondary;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "username": username,
      "is_secondary": isSecondary,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: Username to be checked
  /// * [is_secondary]: Pass true to check whether the username is suitable as a secondary username for an existing bot; pass false to check whether the username is suitable for createBot
  CheckBotUsername copyWith({
    String? username,
    bool? isSecondary,
  }) =>
      CheckBotUsername(
        username: username ?? this.username,
        isSecondary: isSecondary ?? this.isSecondary,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkBotUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
