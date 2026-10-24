part of '../tdapi.dart';

/// **ChatStatisticsMessageSenderInfo** *(chatStatisticsMessageSenderInfo)* - basic class
///
/// Contains statistics about messages sent by a user.
///
/// * [userId]: User identifier.
/// * [sentMessageCount]: Number of sent messages.
/// * [averageCharacterCount]: Average number of characters in sent messages; 0 if unknown.
final class ChatStatisticsMessageSenderInfo extends TdObject {
  /// **ChatStatisticsMessageSenderInfo** *(chatStatisticsMessageSenderInfo)* - basic class
  ///
  /// Contains statistics about messages sent by a user.
  ///
  /// * [userId]: User identifier.
  /// * [sentMessageCount]: Number of sent messages.
  /// * [averageCharacterCount]: Average number of characters in sent messages; 0 if unknown.
  const ChatStatisticsMessageSenderInfo({
    required this.userId,
    required this.sentMessageCount,
    required this.averageCharacterCount,
  });

  /// User identifier
  final int userId;

  /// Number of sent messages
  final int sentMessageCount;

  /// Average number of characters in sent messages; 0 if unknown
  final int averageCharacterCount;

  /// Parse from a json
  factory ChatStatisticsMessageSenderInfo.fromJson(Map<String, dynamic> json) =>
      ChatStatisticsMessageSenderInfo(
        userId: json['user_id'],
        sentMessageCount: json['sent_message_count'],
        averageCharacterCount: json['average_character_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "sent_message_count": sentMessageCount,
      "average_character_count": averageCharacterCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [sent_message_count]: Number of sent messages
  /// * [average_character_count]: Average number of characters in sent messages; 0 if unknown
  ChatStatisticsMessageSenderInfo copyWith({
    int? userId,
    int? sentMessageCount,
    int? averageCharacterCount,
  }) =>
      ChatStatisticsMessageSenderInfo(
        userId: userId ?? this.userId,
        sentMessageCount: sentMessageCount ?? this.sentMessageCount,
        averageCharacterCount:
            averageCharacterCount ?? this.averageCharacterCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatStatisticsMessageSenderInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
