part of '../tdapi.dart';

/// **ToggleGeneralForumTopicIsHidden** *(toggleGeneralForumTopicIsHidden)* - TDLib function
///
/// Toggles whether a General topic is hidden in a forum supergroup chat; requires can_manage_topics administrator right in the supergroup.
///
/// * [chatId]: Identifier of the chat.
/// * [isHidden]: Pass true to hide and close the General topic; pass false to unhide it.
///
/// [Ok] is returned on completion.
final class ToggleGeneralForumTopicIsHidden extends TdFunction {
  /// **ToggleGeneralForumTopicIsHidden** *(toggleGeneralForumTopicIsHidden)* - TDLib function
  ///
  /// Toggles whether a General topic is hidden in a forum supergroup chat; requires can_manage_topics administrator right in the supergroup.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [isHidden]: Pass true to hide and close the General topic; pass false to unhide it.
  ///
  /// [Ok] is returned on completion.
  const ToggleGeneralForumTopicIsHidden({
    required this.chatId,
    required this.isHidden,
  });

  /// Identifier of the chat
  final int chatId;

  /// Pass true to hide and close the General topic; pass false to unhide it
  final bool isHidden;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "is_hidden": isHidden,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [is_hidden]: Pass true to hide and close the General topic; pass false to unhide it
  ToggleGeneralForumTopicIsHidden copyWith({
    int? chatId,
    bool? isHidden,
  }) =>
      ToggleGeneralForumTopicIsHidden(
        chatId: chatId ?? this.chatId,
        isHidden: isHidden ?? this.isHidden,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleGeneralForumTopicIsHidden';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
