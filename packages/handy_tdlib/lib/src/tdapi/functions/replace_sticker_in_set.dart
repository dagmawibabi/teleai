part of '../tdapi.dart';

/// **ReplaceStickerInSet** *(replaceStickerInSet)* - TDLib function
///
/// Replaces existing sticker in a set. The function is equivalent to removeStickerFromSet, then addStickerToSet, then setStickerPositionInSet.
///
/// * [userId]: Sticker set owner; ignored for regular users.
/// * [name]: Sticker set name. The sticker set must be owned by the current user.
/// * [oldSticker]: Sticker to remove from the set.
/// * [newSticker]: Sticker to add to the set.
///
/// [Ok] is returned on completion.
final class ReplaceStickerInSet extends TdFunction {
  /// **ReplaceStickerInSet** *(replaceStickerInSet)* - TDLib function
  ///
  /// Replaces existing sticker in a set. The function is equivalent to removeStickerFromSet, then addStickerToSet, then setStickerPositionInSet.
  ///
  /// * [userId]: Sticker set owner; ignored for regular users.
  /// * [name]: Sticker set name. The sticker set must be owned by the current user.
  /// * [oldSticker]: Sticker to remove from the set.
  /// * [newSticker]: Sticker to add to the set.
  ///
  /// [Ok] is returned on completion.
  const ReplaceStickerInSet({
    required this.userId,
    required this.name,
    required this.oldSticker,
    required this.newSticker,
  });

  /// Sticker set owner; ignored for regular users
  final int userId;

  /// Sticker set name. The sticker set must be owned by the current user
  final String name;

  /// Sticker to remove from the set
  final InputFile oldSticker;

  /// Sticker to add to the set
  final NewSticker newSticker;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "name": name,
      "old_sticker": oldSticker.toJson(),
      "new_sticker": newSticker.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Sticker set owner; ignored for regular users
  /// * [name]: Sticker set name. The sticker set must be owned by the current user
  /// * [old_sticker]: Sticker to remove from the set
  /// * [new_sticker]: Sticker to add to the set
  ReplaceStickerInSet copyWith({
    int? userId,
    String? name,
    InputFile? oldSticker,
    NewSticker? newSticker,
  }) =>
      ReplaceStickerInSet(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        oldSticker: oldSticker ?? this.oldSticker,
        newSticker: newSticker ?? this.newSticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replaceStickerInSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
