part of '../tdapi.dart';

/// **ToggleBotUsernameIsActive** *(toggleBotUsernameIsActive)* - TDLib function
///
/// Changes active state for a username of a bot. The editable username can be disabled only if there are other active usernames.. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached. Can be called only if userTypeBot.can_be_edited == true.
///
/// * [botUserId]: Identifier of the target bot.
/// * [username]: The username to change.
/// * [isActive]: Pass true to activate the username; pass false to disable it.
///
/// [Ok] is returned on completion.
final class ToggleBotUsernameIsActive extends TdFunction {
  /// **ToggleBotUsernameIsActive** *(toggleBotUsernameIsActive)* - TDLib function
  ///
  /// Changes active state for a username of a bot. The editable username can be disabled only if there are other active usernames.. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached. Can be called only if userTypeBot.can_be_edited == true.
  ///
  /// * [botUserId]: Identifier of the target bot.
  /// * [username]: The username to change.
  /// * [isActive]: Pass true to activate the username; pass false to disable it.
  ///
  /// [Ok] is returned on completion.
  const ToggleBotUsernameIsActive({
    required this.botUserId,
    required this.username,
    required this.isActive,
  });

  /// Identifier of the target bot
  final int botUserId;

  /// The username to change
  final String username;

  /// Pass true to activate the username; pass false to disable it
  final bool isActive;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "username": username,
      "is_active": isActive,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the target bot
  /// * [username]: The username to change
  /// * [is_active]: Pass true to activate the username; pass false to disable it
  ToggleBotUsernameIsActive copyWith({
    int? botUserId,
    String? username,
    bool? isActive,
  }) =>
      ToggleBotUsernameIsActive(
        botUserId: botUserId ?? this.botUserId,
        username: username ?? this.username,
        isActive: isActive ?? this.isActive,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleBotUsernameIsActive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
