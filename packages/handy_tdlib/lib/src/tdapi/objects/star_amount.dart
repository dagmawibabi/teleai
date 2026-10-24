part of '../tdapi.dart';

/// **StarAmount** *(starAmount)* - basic class
///
/// Describes a possibly non-integer Telegram Star amount.
///
/// * [starCount]: The integer Telegram Star amount rounded to 0.
/// * [nanostarCount]: The number of 1/1000000000 shares of Telegram Stars; from -999999999 to 999999999.
final class StarAmount extends TdObject {
  /// **StarAmount** *(starAmount)* - basic class
  ///
  /// Describes a possibly non-integer Telegram Star amount.
  ///
  /// * [starCount]: The integer Telegram Star amount rounded to 0.
  /// * [nanostarCount]: The number of 1/1000000000 shares of Telegram Stars; from -999999999 to 999999999.
  const StarAmount({
    required this.starCount,
    required this.nanostarCount,
    this.extra,
    this.clientId,
  });

  /// The integer Telegram Star amount rounded to 0
  final int starCount;

  /// The number of 1/1000000000 shares of Telegram Stars; from -999999999 to 999999999
  final int nanostarCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory StarAmount.fromJson(Map<String, dynamic> json) => StarAmount(
        starCount: json['star_count'],
        nanostarCount: json['nanostar_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "nanostar_count": nanostarCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: The integer Telegram Star amount rounded to 0
  /// * [nanostar_count]: The number of 1/1000000000 shares of Telegram Stars; from -999999999 to 999999999
  StarAmount copyWith({
    int? starCount,
    int? nanostarCount,
    dynamic extra,
    int? clientId,
  }) =>
      StarAmount(
        starCount: starCount ?? this.starCount,
        nanostarCount: nanostarCount ?? this.nanostarCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starAmount';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
