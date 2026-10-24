part of '../tdapi.dart';

/// **GetInstalledStickerSets** *(getInstalledStickerSets)* - TDLib function
///
/// Returns a list of installed sticker sets.
///
/// * [stickerType]: Type of the sticker sets to return.
///
/// [StickerSets] is returned on completion.
final class GetInstalledStickerSets extends TdFunction {
  /// **GetInstalledStickerSets** *(getInstalledStickerSets)* - TDLib function
  ///
  /// Returns a list of installed sticker sets.
  ///
  /// * [stickerType]: Type of the sticker sets to return.
  ///
  /// [StickerSets] is returned on completion.
  const GetInstalledStickerSets({
    required this.stickerType,
  });

  /// Type of the sticker sets to return
  final StickerType stickerType;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "sticker_type": stickerType.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_type]: Type of the sticker sets to return
  GetInstalledStickerSets copyWith({
    StickerType? stickerType,
  }) =>
      GetInstalledStickerSets(
        stickerType: stickerType ?? this.stickerType,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getInstalledStickerSets';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
