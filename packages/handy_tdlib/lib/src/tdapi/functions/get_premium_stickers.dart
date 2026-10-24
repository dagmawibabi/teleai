part of '../tdapi.dart';

/// **GetPremiumStickers** *(getPremiumStickers)* - TDLib function
///
/// Returns premium stickers from regular sticker sets.
///
/// * [limit]: The maximum number of stickers to be returned; 0-100.
///
/// [Stickers] is returned on completion.
final class GetPremiumStickers extends TdFunction {
  /// **GetPremiumStickers** *(getPremiumStickers)* - TDLib function
  ///
  /// Returns premium stickers from regular sticker sets.
  ///
  /// * [limit]: The maximum number of stickers to be returned; 0-100.
  ///
  /// [Stickers] is returned on completion.
  const GetPremiumStickers({
    required this.limit,
  });

  /// The maximum number of stickers to be returned; 0-100
  final int limit;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "limit": limit,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [limit]: The maximum number of stickers to be returned; 0-100
  GetPremiumStickers copyWith({
    int? limit,
  }) =>
      GetPremiumStickers(
        limit: limit ?? this.limit,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
