part of '../tdapi.dart';

/// **InlineMessageId** *(inlineMessageId)* - basic class
///
/// Contains identifier of a sent guest message.
///
/// * [id]: Unique identifier for the message.
final class InlineMessageId extends TdObject {
  /// **InlineMessageId** *(inlineMessageId)* - basic class
  ///
  /// Contains identifier of a sent guest message.
  ///
  /// * [id]: Unique identifier for the message.
  const InlineMessageId({
    required this.id,
    this.extra,
    this.clientId,
  });

  /// Unique identifier for the message
  final String id;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory InlineMessageId.fromJson(Map<String, dynamic> json) =>
      InlineMessageId(
        id: json['id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier for the message
  InlineMessageId copyWith({
    String? id,
    dynamic extra,
    int? clientId,
  }) =>
      InlineMessageId(
        id: id ?? this.id,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineMessageId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
