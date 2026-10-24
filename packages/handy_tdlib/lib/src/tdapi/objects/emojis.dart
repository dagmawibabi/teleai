part of '../tdapi.dart';

/// **Emojis** *(emojis)* - basic class
///
/// Represents a list of emojis.
///
/// * [emojis]: List of emojis.
final class Emojis extends TdObject {
  /// **Emojis** *(emojis)* - basic class
  ///
  /// Represents a list of emojis.
  ///
  /// * [emojis]: List of emojis.
  const Emojis({
    required this.emojis,
    this.extra,
    this.clientId,
  });

  /// List of emojis
  final List<String> emojis;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Emojis.fromJson(Map<String, dynamic> json) => Emojis(
        emojis: List<String>.from(
            (json['emojis'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emojis": emojis.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emojis]: List of emojis
  Emojis copyWith({
    List<String>? emojis,
    dynamic extra,
    int? clientId,
  }) =>
      Emojis(
        emojis: emojis ?? this.emojis,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojis';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
