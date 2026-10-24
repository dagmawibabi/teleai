part of '../tdapi.dart';

/// **ChatMessageSenders** *(chatMessageSenders)* - basic class
///
/// Represents a list of message senders, which can be used to send messages in a chat.
///
/// * [senders]: List of available message senders.
final class ChatMessageSenders extends TdObject {
  /// **ChatMessageSenders** *(chatMessageSenders)* - basic class
  ///
  /// Represents a list of message senders, which can be used to send messages in a chat.
  ///
  /// * [senders]: List of available message senders.
  const ChatMessageSenders({
    required this.senders,
    this.extra,
    this.clientId,
  });

  /// List of available message senders
  final List<ChatMessageSender> senders;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatMessageSenders.fromJson(Map<String, dynamic> json) =>
      ChatMessageSenders(
        senders: List<ChatMessageSender>.from((json['senders'] ?? [])
            .map((item) => ChatMessageSender.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "senders": senders.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [senders]: List of available message senders
  ChatMessageSenders copyWith({
    List<ChatMessageSender>? senders,
    dynamic extra,
    int? clientId,
  }) =>
      ChatMessageSenders(
        senders: senders ?? this.senders,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatMessageSenders';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
