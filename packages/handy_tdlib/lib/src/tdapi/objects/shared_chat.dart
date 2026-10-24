part of '../tdapi.dart';

/// **SharedChat** *(sharedChat)* - basic class
///
/// Contains information about a chat shared with a bot.
///
/// * [chatId]: Chat identifier.
/// * [title]: Title of the chat; for bots only.
/// * [username]: Username of the chat; for bots only.
/// * [photo]: Photo of the chat; for bots only; may be null *(optional)*.
final class SharedChat extends TdObject {
  /// **SharedChat** *(sharedChat)* - basic class
  ///
  /// Contains information about a chat shared with a bot.
  ///
  /// * [chatId]: Chat identifier.
  /// * [title]: Title of the chat; for bots only.
  /// * [username]: Username of the chat; for bots only.
  /// * [photo]: Photo of the chat; for bots only; may be null *(optional)*.
  const SharedChat({
    required this.chatId,
    required this.title,
    required this.username,
    this.photo,
  });

  /// Chat identifier
  final int chatId;

  /// Title of the chat; for bots only
  final String title;

  /// Username of the chat; for bots only
  final String username;

  /// Photo of the chat; for bots only; may be null
  final Photo? photo;

  /// Parse from a json
  factory SharedChat.fromJson(Map<String, dynamic> json) => SharedChat(
        chatId: json['chat_id'],
        title: json['title'],
        username: json['username'],
        photo: json['photo'] == null ? null : Photo.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "title": title,
      "username": username,
      "photo": photo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [title]: Title of the chat; for bots only
  /// * [username]: Username of the chat; for bots only
  /// * [photo]: Photo of the chat; for bots only; may be null
  SharedChat copyWith({
    int? chatId,
    String? title,
    String? username,
    Photo? photo,
  }) =>
      SharedChat(
        chatId: chatId ?? this.chatId,
        title: title ?? this.title,
        username: username ?? this.username,
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sharedChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
