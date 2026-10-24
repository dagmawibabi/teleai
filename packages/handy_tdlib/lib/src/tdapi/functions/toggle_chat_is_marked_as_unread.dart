part of '../tdapi.dart';

/// **ToggleChatIsMarkedAsUnread** *(toggleChatIsMarkedAsUnread)* - TDLib function
///
/// Changes the marked as unread state of a chat.
///
/// * [chatId]: Chat identifier.
/// * [isMarkedAsUnread]: New value of is_marked_as_unread.
///
/// [Ok] is returned on completion.
final class ToggleChatIsMarkedAsUnread extends TdFunction {
  /// **ToggleChatIsMarkedAsUnread** *(toggleChatIsMarkedAsUnread)* - TDLib function
  ///
  /// Changes the marked as unread state of a chat.
  ///
  /// * [chatId]: Chat identifier.
  /// * [isMarkedAsUnread]: New value of is_marked_as_unread.
  ///
  /// [Ok] is returned on completion.
  const ToggleChatIsMarkedAsUnread({
    required this.chatId,
    required this.isMarkedAsUnread,
  });

  /// Chat identifier
  final int chatId;

  /// New value of is_marked_as_unread
  final bool isMarkedAsUnread;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_marked_as_unread": isMarkedAsUnread,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [is_marked_as_unread]: New value of is_marked_as_unread
  ToggleChatIsMarkedAsUnread copyWith({
    int? chatId,
    bool? isMarkedAsUnread,
  }) =>
      ToggleChatIsMarkedAsUnread(
        chatId: chatId ?? this.chatId,
        isMarkedAsUnread: isMarkedAsUnread ?? this.isMarkedAsUnread,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleChatIsMarkedAsUnread';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
