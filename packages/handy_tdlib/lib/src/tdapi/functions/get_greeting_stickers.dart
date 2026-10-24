part of '../tdapi.dart';

/// **GetGreetingStickers** *(getGreetingStickers)* - TDLib function
///
/// Returns greeting stickers from regular sticker sets that can be used for the start page of other users.
///
/// [Stickers] is returned on completion.
final class GetGreetingStickers extends TdFunction {
  /// **GetGreetingStickers** *(getGreetingStickers)* - TDLib function
  ///
  /// Returns greeting stickers from regular sticker sets that can be used for the start page of other users.
  ///
  /// [Stickers] is returned on completion.
  const GetGreetingStickers();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetGreetingStickers copyWith() => const GetGreetingStickers();

  /// TDLib object type
  static const String defaultObjectId = 'getGreetingStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
