part of '../tdapi.dart';

/// **LoadDirectMessagesChatTopics** *(loadDirectMessagesChatTopics)* - TDLib function
///
/// Loads more topics in a channel direct messages chat administered by the current user. The loaded topics will be sent through updateDirectMessagesChatTopic.. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded.
///
/// * [chatId]: Chat identifier of the channel direct messages chat.
/// * [limit]: The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached.
///
/// [Ok] is returned on completion.
final class LoadDirectMessagesChatTopics extends TdFunction {
  /// **LoadDirectMessagesChatTopics** *(loadDirectMessagesChatTopics)* - TDLib function
  ///
  /// Loads more topics in a channel direct messages chat administered by the current user. The loaded topics will be sent through updateDirectMessagesChatTopic.. Topics are sorted by their topic.order in descending order. Returns a 404 error if all topics have been loaded.
  ///
  /// * [chatId]: Chat identifier of the channel direct messages chat.
  /// * [limit]: The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached.
  ///
  /// [Ok] is returned on completion.
  const LoadDirectMessagesChatTopics({
    required this.chatId,
    required this.limit,
  });

  /// Chat identifier of the channel direct messages chat
  final int chatId;

  /// The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier of the channel direct messages chat
  /// * [limit]: The maximum number of topics to be loaded. For optimal performance, the number of loaded topics is chosen by TDLib and can be smaller than the specified limit, even if the end of the list is not reached
  LoadDirectMessagesChatTopics copyWith({
    int? chatId,
    int? limit,
  }) =>
      LoadDirectMessagesChatTopics(
        chatId: chatId ?? this.chatId,
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'loadDirectMessagesChatTopics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
