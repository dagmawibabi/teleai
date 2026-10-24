part of '../tdapi.dart';

/// **GetRecentStickers** *(getRecentStickers)* - TDLib function
///
/// Returns a list of recently used stickers.
///
/// * [isAttached]: Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers.
///
/// [Stickers] is returned on completion.
final class GetRecentStickers extends TdFunction {
  /// **GetRecentStickers** *(getRecentStickers)* - TDLib function
  ///
  /// Returns a list of recently used stickers.
  ///
  /// * [isAttached]: Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers.
  ///
  /// [Stickers] is returned on completion.
  const GetRecentStickers({
    required this.isAttached,
  });

  /// Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
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
  /// * [is_attached]: Pass true to return stickers and masks that were recently attached to photos or video files; pass false to return recently sent stickers
  GetRecentStickers copyWith({
    bool? isAttached,
  }) =>
      GetRecentStickers(
        isAttached: isAttached ?? this.isAttached,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getRecentStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
