part of '../tdapi.dart';

/// **CanPostStory** *(canPostStory)* - TDLib function
///
/// Checks whether the current user can post a story on behalf of a chat; requires can_post_stories administrator right for supergroup and channel chats.
///
/// * [chatId]: Chat identifier. Pass Saved Messages chat identifier when posting a story on behalf of the current user.
///
/// [CanPostStoryResult] is returned on completion.
final class CanPostStory extends TdFunction {
  /// **CanPostStory** *(canPostStory)* - TDLib function
  ///
  /// Checks whether the current user can post a story on behalf of a chat; requires can_post_stories administrator right for supergroup and channel chats.
  ///
  /// * [chatId]: Chat identifier. Pass Saved Messages chat identifier when posting a story on behalf of the current user.
  ///
  /// [CanPostStoryResult] is returned on completion.
  const CanPostStory({
    required this.chatId,
  });

  /// Chat identifier. Pass Saved Messages chat identifier when posting a story on behalf of the current user
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier. Pass Saved Messages chat identifier when posting a story on behalf of the current user
  CanPostStory copyWith({
    int? chatId,
  }) =>
      CanPostStory(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canPostStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
