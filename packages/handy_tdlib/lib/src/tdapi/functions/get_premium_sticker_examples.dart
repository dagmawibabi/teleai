part of '../tdapi.dart';

/// **GetPremiumStickerExamples** *(getPremiumStickerExamples)* - TDLib function
///
/// Returns examples of premium stickers for demonstration purposes.
///
/// [Stickers] is returned on completion.
final class GetPremiumStickerExamples extends TdFunction {
  /// **GetPremiumStickerExamples** *(getPremiumStickerExamples)* - TDLib function
  ///
  /// Returns examples of premium stickers for demonstration purposes.
  ///
  /// [Stickers] is returned on completion.
  const GetPremiumStickerExamples();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetPremiumStickerExamples copyWith() => const GetPremiumStickerExamples();

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumStickerExamples';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
