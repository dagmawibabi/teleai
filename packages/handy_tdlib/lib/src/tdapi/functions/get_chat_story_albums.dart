part of '../tdapi.dart';

/// **GetChatStoryAlbums** *(getChatStoryAlbums)* - TDLib function
///
/// Returns the list of story albums owned by the given chat.
///
/// * [chatId]: Chat identifier.
///
/// [StoryAlbums] is returned on completion.
final class GetChatStoryAlbums extends TdFunction {
  /// **GetChatStoryAlbums** *(getChatStoryAlbums)* - TDLib function
  ///
  /// Returns the list of story albums owned by the given chat.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [StoryAlbums] is returned on completion.
  const GetChatStoryAlbums({
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
  GetChatStoryAlbums copyWith({
    int? chatId,
  }) =>
      GetChatStoryAlbums(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getChatStoryAlbums';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
