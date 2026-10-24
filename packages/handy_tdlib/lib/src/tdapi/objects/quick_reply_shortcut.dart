part of '../tdapi.dart';

/// **QuickReplyShortcut** *(quickReplyShortcut)* - basic class
///
/// Describes a shortcut that can be used for a quick reply.
///
/// * [id]: Unique shortcut identifier.
/// * [name]: The name of the shortcut that can be used to use the shortcut.
/// * [firstMessage]: The first shortcut message.
/// * [messageCount]: The total number of messages in the shortcut.
final class QuickReplyShortcut extends TdObject {
  /// **QuickReplyShortcut** *(quickReplyShortcut)* - basic class
  ///
  /// Describes a shortcut that can be used for a quick reply.
  ///
  /// * [id]: Unique shortcut identifier.
  /// * [name]: The name of the shortcut that can be used to use the shortcut.
  /// * [firstMessage]: The first shortcut message.
  /// * [messageCount]: The total number of messages in the shortcut.
  const QuickReplyShortcut({
    required this.id,
    required this.name,
    required this.firstMessage,
    required this.messageCount,
  });

  /// Unique shortcut identifier
  final int id;

  /// The name of the shortcut that can be used to use the shortcut
  final String name;

  /// The first shortcut message
  final QuickReplyMessage firstMessage;

  /// The total number of messages in the shortcut
  final int messageCount;

  /// Parse from a json
  factory QuickReplyShortcut.fromJson(Map<String, dynamic> json) =>
      QuickReplyShortcut(
        id: json['id'],
        name: json['name'],
        firstMessage: QuickReplyMessage.fromJson(json['first_message']),
        messageCount: json['message_count'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "first_message": firstMessage.toJson(),
      "message_count": messageCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique shortcut identifier
  /// * [name]: The name of the shortcut that can be used to use the shortcut
  /// * [first_message]: The first shortcut message
  /// * [message_count]: The total number of messages in the shortcut
  QuickReplyShortcut copyWith({
    int? id,
    String? name,
    QuickReplyMessage? firstMessage,
    int? messageCount,
  }) =>
      QuickReplyShortcut(
        id: id ?? this.id,
        name: name ?? this.name,
        firstMessage: firstMessage ?? this.firstMessage,
        messageCount: messageCount ?? this.messageCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'quickReplyShortcut';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
