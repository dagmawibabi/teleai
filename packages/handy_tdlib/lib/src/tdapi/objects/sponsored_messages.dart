part of '../tdapi.dart';

/// **SponsoredMessages** *(sponsoredMessages)* - basic class
///
/// Contains a list of sponsored messages.
///
/// * [messages]: List of sponsored messages.
/// * [messagesBetween]: The minimum number of messages between shown sponsored messages, or 0 if only one sponsored message must be shown after all ordinary messages.
final class SponsoredMessages extends TdObject {
  /// **SponsoredMessages** *(sponsoredMessages)* - basic class
  ///
  /// Contains a list of sponsored messages.
  ///
  /// * [messages]: List of sponsored messages.
  /// * [messagesBetween]: The minimum number of messages between shown sponsored messages, or 0 if only one sponsored message must be shown after all ordinary messages.
  const SponsoredMessages({
    required this.messages,
    required this.messagesBetween,
    this.extra,
    this.clientId,
  });

  /// List of sponsored messages
  final List<SponsoredMessage> messages;

  /// The minimum number of messages between shown sponsored messages, or 0 if only one sponsored message must be shown after all ordinary messages
  final int messagesBetween;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory SponsoredMessages.fromJson(Map<String, dynamic> json) =>
      SponsoredMessages(
        messages: List<SponsoredMessage>.from((json['messages'] ?? [])
            .map((item) => SponsoredMessage.fromJson(item))
            .toList()),
        messagesBetween: json['messages_between'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "messages": messages.map((i) => i.toJson()).toList(),
      "messages_between": messagesBetween,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [messages]: List of sponsored messages
  /// * [messages_between]: The minimum number of messages between shown sponsored messages, or 0 if only one sponsored message must be shown after all ordinary messages
  SponsoredMessages copyWith({
    List<SponsoredMessage>? messages,
    int? messagesBetween,
    dynamic extra,
    int? clientId,
  }) =>
      SponsoredMessages(
        messages: messages ?? this.messages,
        messagesBetween: messagesBetween ?? this.messagesBetween,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sponsoredMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
