part of '../tdapi.dart';

/// **GetStickerSetName** *(getStickerSetName)* - TDLib function
///
/// Returns name of a sticker set by its identifier.
///
/// * [setId]: Identifier of the sticker set.
///
/// [Text] is returned on completion.
final class GetStickerSetName extends TdFunction {
  /// **GetStickerSetName** *(getStickerSetName)* - TDLib function
  ///
  /// Returns name of a sticker set by its identifier.
  ///
  /// * [setId]: Identifier of the sticker set.
  ///
  /// [Text] is returned on completion.
  const GetStickerSetName({
    required this.setId,
  });

  /// Identifier of the sticker set
  final int setId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "set_id": setId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [set_id]: Identifier of the sticker set
  GetStickerSetName copyWith({
    int? setId,
  }) =>
      GetStickerSetName(
        setId: setId ?? this.setId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStickerSetName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
