part of '../tdapi.dart';

/// **SetSupergroupStickerSet** *(setSupergroupStickerSet)* - TDLib function
///
/// Changes the sticker set of a supergroup; requires can_change_info administrator right.
///
/// * [supergroupId]: Identifier of the supergroup.
/// * [stickerSetId]: New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set.
///
/// [Ok] is returned on completion.
final class SetSupergroupStickerSet extends TdFunction {
  /// **SetSupergroupStickerSet** *(setSupergroupStickerSet)* - TDLib function
  ///
  /// Changes the sticker set of a supergroup; requires can_change_info administrator right.
  ///
  /// * [supergroupId]: Identifier of the supergroup.
  /// * [stickerSetId]: New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set.
  ///
  /// [Ok] is returned on completion.
  const SetSupergroupStickerSet({
    required this.supergroupId,
    required this.stickerSetId,
  });

  /// Identifier of the supergroup
  final int supergroupId;

  /// New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
  final int stickerSetId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "sticker_set_id": stickerSetId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup
  /// * [sticker_set_id]: New value of the supergroup sticker set identifier. Use 0 to remove the supergroup sticker set
  SetSupergroupStickerSet copyWith({
    int? supergroupId,
    int? stickerSetId,
  }) =>
      SetSupergroupStickerSet(
        supergroupId: supergroupId ?? this.supergroupId,
        stickerSetId: stickerSetId ?? this.stickerSetId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setSupergroupStickerSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
