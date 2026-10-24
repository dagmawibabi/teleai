part of '../tdapi.dart';

/// **GetStorageStatistics** *(getStorageStatistics)* - TDLib function
///
/// Returns storage usage statistics. Can be called before authorization.
///
/// * [chatLimit]: The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0.. If the chat info database is not used, the chat_limit is ignored and is always set to 0.
///
/// [StorageStatistics] is returned on completion.
final class GetStorageStatistics extends TdFunction {
  /// **GetStorageStatistics** *(getStorageStatistics)* - TDLib function
  ///
  /// Returns storage usage statistics. Can be called before authorization.
  ///
  /// * [chatLimit]: The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0.. If the chat info database is not used, the chat_limit is ignored and is always set to 0.
  ///
  /// [StorageStatistics] is returned on completion.
  const GetStorageStatistics({
    required this.chatLimit,
  });

  /// The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0.. If the chat info database is not used, the chat_limit is ignored and is always set to 0
  final int chatLimit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_limit": chatLimit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_limit]: The maximum number of chats with the largest storage usage for which separate statistics need to be returned. All other chats will be grouped in entries with chat_id == 0.. If the chat info database is not used, the chat_limit is ignored and is always set to 0
  GetStorageStatistics copyWith({
    int? chatLimit,
  }) =>
      GetStorageStatistics(
        chatLimit: chatLimit ?? this.chatLimit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStorageStatistics';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
