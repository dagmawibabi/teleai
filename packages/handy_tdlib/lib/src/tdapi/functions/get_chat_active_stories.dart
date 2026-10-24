part of '../tdapi.dart';

/// **GetChatActiveStories** *(getChatActiveStories)* - TDLib function
///
/// Returns the list of active stories posted by the given chat.
///
/// * [chatId]: Chat identifier.
///
/// [ChatActiveStories] is returned on completion.
final class GetChatActiveStories extends TdFunction {
  /// **GetChatActiveStories** *(getChatActiveStories)* - TDLib function
  ///
  /// Returns the list of active stories posted by the given chat.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [ChatActiveStories] is returned on completion.
  const GetChatActiveStories({
    required this.chatId,
  });

  /// Chat identifier
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
  /// * [chat_id]: Chat identifier
  GetChatActiveStories copyWith({
    int? chatId,
  }) =>
      GetChatActiveStories(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatActiveStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
