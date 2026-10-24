part of '../tdapi.dart';

/// **StorageStatisticsByChat** *(storageStatisticsByChat)* - basic class
///
/// Contains the storage usage statistics for a specific chat.
///
/// * [chatId]: Chat identifier; 0 if none.
/// * [size]: Total size of the files in the chat, in bytes.
/// * [count]: Total number of files in the chat.
/// * [byFileType]: Statistics split by file types.
final class StorageStatisticsByChat extends TdObject {
  /// **StorageStatisticsByChat** *(storageStatisticsByChat)* - basic class
  ///
  /// Contains the storage usage statistics for a specific chat.
  ///
  /// * [chatId]: Chat identifier; 0 if none.
  /// * [size]: Total size of the files in the chat, in bytes.
  /// * [count]: Total number of files in the chat.
  /// * [byFileType]: Statistics split by file types.
  const StorageStatisticsByChat({
    required this.chatId,
    required this.size,
    required this.count,
    required this.byFileType,
  });

  /// Chat identifier; 0 if none
  final int chatId;

  /// Total size of the files in the chat, in bytes
  final int size;

  /// Total number of files in the chat
  final int count;

  /// Statistics split by file types
  final List<StorageStatisticsByFileType> byFileType;

  /// Parse from a json
  factory StorageStatisticsByChat.fromJson(Map<String, dynamic> json) =>
      StorageStatisticsByChat(
        chatId: json['chat_id'] ?? 0,
        size: json['size'],
        count: json['count'],
        byFileType: List<StorageStatisticsByFileType>.from(
            (json['by_file_type'] ?? [])
                .map((item) => StorageStatisticsByFileType.fromJson(item))
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "size": size,
      "count": count,
      "by_file_type": byFileType.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier; 0 if none
  /// * [size]: Total size of the files in the chat, in bytes
  /// * [count]: Total number of files in the chat
  /// * [by_file_type]: Statistics split by file types
  StorageStatisticsByChat copyWith({
    int? chatId,
    int? size,
    int? count,
    List<StorageStatisticsByFileType>? byFileType,
  }) =>
      StorageStatisticsByChat(
        chatId: chatId ?? this.chatId,
        size: size ?? this.size,
        count: count ?? this.count,
        byFileType: byFileType ?? this.byFileType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storageStatisticsByChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
