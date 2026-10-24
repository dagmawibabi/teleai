part of '../tdapi.dart';

/// **PreparedInlineMessageId** *(preparedInlineMessageId)* - basic class
///
/// Represents an inline message that can be sent via the bot.
///
/// * [id]: Unique identifier for the message.
/// * [expirationDate]: Point in time (Unix timestamp) when the message can't be used anymore.
final class PreparedInlineMessageId extends TdObject {
  /// **PreparedInlineMessageId** *(preparedInlineMessageId)* - basic class
  ///
  /// Represents an inline message that can be sent via the bot.
  ///
  /// * [id]: Unique identifier for the message.
  /// * [expirationDate]: Point in time (Unix timestamp) when the message can't be used anymore.
  const PreparedInlineMessageId({
    required this.id,
    required this.expirationDate,
    this.extra,
    this.clientId,
  });

  /// Unique identifier for the message
  final String id;

  /// Point in time (Unix timestamp) when the message can't be used anymore
  final int expirationDate;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PreparedInlineMessageId.fromJson(Map<String, dynamic> json) =>
      PreparedInlineMessageId(
        id: json['id'],
        expirationDate: json['expiration_date'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "expiration_date": expirationDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier for the message
  /// * [expiration_date]: Point in time (Unix timestamp) when the message can't be used anymore
  PreparedInlineMessageId copyWith({
    String? id,
    int? expirationDate,
    dynamic extra,
    int? clientId,
  }) =>
      PreparedInlineMessageId(
        id: id ?? this.id,
        expirationDate: expirationDate ?? this.expirationDate,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'preparedInlineMessageId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
