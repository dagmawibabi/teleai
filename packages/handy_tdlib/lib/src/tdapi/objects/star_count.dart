part of '../tdapi.dart';

/// **StarCount** *(starCount)* - basic class
///
/// Contains a number of Telegram Stars.
///
/// * [starCount]: Number of Telegram Stars.
final class StarCount extends TdObject {
  /// **StarCount** *(starCount)* - basic class
  ///
  /// Contains a number of Telegram Stars.
  ///
  /// * [starCount]: Number of Telegram Stars.
  const StarCount({
    required this.starCount,
    this.extra,
    this.clientId,
  });

  /// Number of Telegram Stars
  final int starCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StarCount.fromJson(Map<String, dynamic> json) => StarCount(
        starCount: json['star_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars
  StarCount copyWith({
    int? starCount,
    dynamic extra,
    int? clientId,
  }) =>
      StarCount(
        starCount: starCount ?? this.starCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starCount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
