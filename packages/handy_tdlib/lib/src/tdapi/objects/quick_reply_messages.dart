part of '../tdapi.dart';

/// **QuickReplyMessages** *(quickReplyMessages)* - basic class
///
/// Contains a list of quick reply messages.
///
/// * [messages]: List of quick reply messages; messages may be null.
final class QuickReplyMessages extends TdObject {
  /// **QuickReplyMessages** *(quickReplyMessages)* - basic class
  ///
  /// Contains a list of quick reply messages.
  ///
  /// * [messages]: List of quick reply messages; messages may be null.
  const QuickReplyMessages({
    required this.messages,
    this.extra,
    this.clientId,
  });

  /// List of quick reply messages; messages may be null
  final List<QuickReplyMessage> messages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory QuickReplyMessages.fromJson(Map<String, dynamic> json) =>
      QuickReplyMessages(
        messages: List<QuickReplyMessage>.from((json['messages'] ?? [])
            .map((item) => QuickReplyMessage.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "messages": messages.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [messages]: List of quick reply messages; messages may be null
  QuickReplyMessages copyWith({
    List<QuickReplyMessage>? messages,
    dynamic extra,
    int? clientId,
  }) =>
      QuickReplyMessages(
        messages: messages ?? this.messages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'quickReplyMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
