part of '../tdapi.dart';

/// **GetFavoriteStickers** *(getFavoriteStickers)* - TDLib function
///
/// Returns favorite stickers.
///
/// [Stickers] is returned on completion.
final class GetFavoriteStickers extends TdFunction {
  /// **GetFavoriteStickers** *(getFavoriteStickers)* - TDLib function
  ///
  /// Returns favorite stickers.
  ///
  /// [Stickers] is returned on completion.
  const GetFavoriteStickers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetFavoriteStickers copyWith() => const GetFavoriteStickers();

  /// TDLib object type
  static const String defaultObjectId = 'getFavoriteStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
