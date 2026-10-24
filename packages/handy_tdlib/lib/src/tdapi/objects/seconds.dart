part of '../tdapi.dart';

/// **Seconds** *(seconds)* - basic class
///
/// Contains a value representing a number of seconds.
///
/// * [seconds]: Number of seconds.
final class Seconds extends TdObject {
  /// **Seconds** *(seconds)* - basic class
  ///
  /// Contains a value representing a number of seconds.
  ///
  /// * [seconds]: Number of seconds.
  const Seconds({
    required this.seconds,
    this.extra,
    this.clientId,
  });

  /// Number of seconds
  final double seconds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Seconds.fromJson(Map<String, dynamic> json) => Seconds(
        seconds: json['seconds'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "seconds": seconds,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [seconds]: Number of seconds
  Seconds copyWith({
    double? seconds,
    dynamic extra,
    int? clientId,
  }) =>
      Seconds(
        seconds: seconds ?? this.seconds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'seconds';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
