part of '../tdapi.dart';

/// **TestBytes** *(testBytes)* - basic class
///
/// A simple object containing a sequence of bytes; for testing only.
///
/// * [value]: Bytes.
final class TestBytes extends TdObject {
  /// **TestBytes** *(testBytes)* - basic class
  ///
  /// A simple object containing a sequence of bytes; for testing only.
  ///
  /// * [value]: Bytes.
  const TestBytes({
    required this.value,
    this.extra,
    this.clientId,
  });

  /// Bytes
  final String value;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TestBytes.fromJson(Map<String, dynamic> json) => TestBytes(
        value: json['value'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "value": value,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [value]: Bytes
  TestBytes copyWith({
    String? value,
    dynamic extra,
    int? clientId,
  }) =>
      TestBytes(
        value: value ?? this.value,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'testBytes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
