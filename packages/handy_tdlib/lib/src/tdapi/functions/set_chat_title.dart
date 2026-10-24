part of '../tdapi.dart';

/// **SetChatTitle** *(setChatTitle)* - TDLib function
///
/// Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info member right.
///
/// * [chatId]: Chat identifier.
/// * [title]: New title of the chat; 1-128 characters.
///
/// [Ok] is returned on completion.
final class SetChatTitle extends TdFunction {
  /// **SetChatTitle** *(setChatTitle)* - TDLib function
  ///
  /// Changes the chat title. Supported only for basic groups, supergroups and channels. Requires can_change_info member right.
  ///
  /// * [chatId]: Chat identifier.
  /// * [title]: New title of the chat; 1-128 characters.
  ///
  /// [Ok] is returned on completion.
  const SetChatTitle({
    required this.chatId,
    required this.title,
  });

  /// Chat identifier
  final int chatId;

  /// New title of the chat; 1-128 characters
  final String title;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "title": title,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [title]: New title of the chat; 1-128 characters
  SetChatTitle copyWith({
    int? chatId,
    String? title,
  }) =>
      SetChatTitle(
        chatId: chatId ?? this.chatId,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setChatTitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
