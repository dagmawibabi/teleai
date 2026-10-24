part of '../tdapi.dart';

/// **GetChatNotificationSettingsExceptions** *(getChatNotificationSettingsExceptions)* - TDLib function
///
/// Returns the list of chats with non-default notification settings for new messages.
///
/// * [scope]: If specified, only chats from the scope will be returned; pass null to return chats from all scopes *(optional)*.
/// * [compareSound]: Pass true to include in the response chats with only non-default sound.
///
/// [Chats] is returned on completion.
final class GetChatNotificationSettingsExceptions extends TdFunction {
  /// **GetChatNotificationSettingsExceptions** *(getChatNotificationSettingsExceptions)* - TDLib function
  ///
  /// Returns the list of chats with non-default notification settings for new messages.
  ///
  /// * [scope]: If specified, only chats from the scope will be returned; pass null to return chats from all scopes *(optional)*.
  /// * [compareSound]: Pass true to include in the response chats with only non-default sound.
  ///
  /// [Chats] is returned on completion.
  const GetChatNotificationSettingsExceptions({
    this.scope,
    required this.compareSound,
  });

  /// If specified, only chats from the scope will be returned; pass null to return chats from all scopes
  final NotificationSettingsScope? scope;

  /// Pass true to include in the response chats with only non-default sound
  final bool compareSound;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "scope": scope?.toJson(),
      "compare_sound": compareSound,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [scope]: If specified, only chats from the scope will be returned; pass null to return chats from all scopes
  /// * [compare_sound]: Pass true to include in the response chats with only non-default sound
  GetChatNotificationSettingsExceptions copyWith({
    NotificationSettingsScope? scope,
    bool? compareSound,
  }) =>
      GetChatNotificationSettingsExceptions(
        scope: scope ?? this.scope,
        compareSound: compareSound ?? this.compareSound,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatNotificationSettingsExceptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
