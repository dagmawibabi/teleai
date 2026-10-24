part of '../tdapi.dart';

/// **Messages** *(messages)* - basic class
///
/// Contains a list of messages.
///
/// * [totalCount]: Approximate total number of messages found.
/// * [messages]: List of messages; messages may be null.
final class Messages extends TdObject {
  /// **Messages** *(messages)* - basic class
  ///
  /// Contains a list of messages.
  ///
  /// * [totalCount]: Approximate total number of messages found.
  /// * [messages]: List of messages; messages may be null.
  const Messages({
    required this.totalCount,
    required this.messages,
    this.extra,
    this.clientId,
  });

  /// Approximate total number of messages found
  final int totalCount;

  /// List of messages; messages may be null
  final List<Message> messages;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        totalCount: json['total_count'],
        messages: List<Message>.from((json['messages'] ?? [])
            .map((item) => Message.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "messages": messages.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: Approximate total number of messages found
  /// * [messages]: List of messages; messages may be null
  Messages copyWith({
    int? totalCount,
    List<Message>? messages,
    dynamic extra,
    int? clientId,
  }) =>
      Messages(
        totalCount: totalCount ?? this.totalCount,
        messages: messages ?? this.messages,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
