part of '../tdapi.dart';

/// **SetChatLocation** *(setChatLocation)* - TDLib function
///
/// Changes the location of a chat. Available only for some location-based supergroups, use supergroupFullInfo.can_set_location to check whether the method is allowed to use.
///
/// * [chatId]: Chat identifier.
/// * [location]: New location for the chat; must be valid and not null.
///
/// [Ok] is returned on completion.
final class SetChatLocation extends TdFunction {
  /// **SetChatLocation** *(setChatLocation)* - TDLib function
  ///
  /// Changes the location of a chat. Available only for some location-based supergroups, use supergroupFullInfo.can_set_location to check whether the method is allowed to use.
  ///
  /// * [chatId]: Chat identifier.
  /// * [location]: New location for the chat; must be valid and not null.
  ///
  /// [Ok] is returned on completion.
  const SetChatLocation({
    required this.chatId,
    required this.location,
  });

  /// Chat identifier
  final int chatId;

  /// New location for the chat; must be valid and not null
  final ChatLocation location;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "location": location.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [location]: New location for the chat; must be valid and not null
  SetChatLocation copyWith({
    int? chatId,
    ChatLocation? location,
  }) =>
      SetChatLocation(
        chatId: chatId ?? this.chatId,
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
