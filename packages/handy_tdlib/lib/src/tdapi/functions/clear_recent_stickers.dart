part of '../tdapi.dart';

/// **ClearRecentStickers** *(clearRecentStickers)* - TDLib function
///
/// Clears the list of recently used stickers.
///
/// * [isAttached]: Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers.
///
/// [Ok] is returned on completion.
final class ClearRecentStickers extends TdFunction {
  /// **ClearRecentStickers** *(clearRecentStickers)* - TDLib function
  ///
  /// Clears the list of recently used stickers.
  ///
  /// * [isAttached]: Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers.
  ///
  /// [Ok] is returned on completion.
  const ClearRecentStickers({
    required this.isAttached,
  });

  /// Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
  final bool isAttached;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "is_attached": isAttached,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_attached]: Pass true to clear the list of stickers recently attached to photo or video files; pass false to clear the list of recently sent stickers
  ClearRecentStickers copyWith({
    bool? isAttached,
  }) =>
      ClearRecentStickers(
        isAttached: isAttached ?? this.isAttached,
      );

  /// TDLib object type
  static const String defaultObjectId = 'clearRecentStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
