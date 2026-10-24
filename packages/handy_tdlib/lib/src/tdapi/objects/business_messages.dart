part of '../tdapi.dart';

/// **BusinessMessages** *(businessMessages)* - basic class
///
/// Contains a list of messages from a business account as received by a bot.
///
/// * [messages]: List of business messages.
final class BusinessMessages extends TdObject {
  /// **BusinessMessages** *(businessMessages)* - basic class
  ///
  /// Contains a list of messages from a business account as received by a bot.
  ///
  /// * [messages]: List of business messages.
  const BusinessMessages({
    required this.messages,
    this.extra,
    this.clientId,
  });

  /// List of business messages
  final List<BusinessMessage> messages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BusinessMessages.fromJson(Map<String, dynamic> json) =>
      BusinessMessages(
        messages: List<BusinessMessage>.from((json['messages'] ?? [])
            .map((item) => BusinessMessage.fromJson(item))
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
  /// * [messages]: List of business messages
  BusinessMessages copyWith({
    List<BusinessMessage>? messages,
    dynamic extra,
    int? clientId,
  }) =>
      BusinessMessages(
        messages: messages ?? this.messages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'businessMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
