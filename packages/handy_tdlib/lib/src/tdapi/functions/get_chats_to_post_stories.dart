part of '../tdapi.dart';

/// **GetChatsToPostStories** *(getChatsToPostStories)* - TDLib function
///
/// Returns supergroup and channel chats in which the current user has the right to post stories. The chats must be rechecked with canPostStory before actually trying to post a story there.
///
/// [Chats] is returned on completion.
final class GetChatsToPostStories extends TdFunction {
  /// **GetChatsToPostStories** *(getChatsToPostStories)* - TDLib function
  ///
  /// Returns supergroup and channel chats in which the current user has the right to post stories. The chats must be rechecked with canPostStory before actually trying to post a story there.
  ///
  /// [Chats] is returned on completion.
  const GetChatsToPostStories();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetChatsToPostStories copyWith() => const GetChatsToPostStories();

  /// TDLib object type
  static const String defaultObjectId = 'getChatsToPostStories';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
