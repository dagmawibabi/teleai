part of '../tdapi.dart';

/// **AddStickerToSet** *(addStickerToSet)* - TDLib function
///
/// Adds a new sticker to a set.
///
/// * [userId]: Sticker set owner; ignored for regular users.
/// * [name]: Sticker set name. The sticker set must be owned by the current user, and contain less than 200 stickers for custom emoji sticker sets and less than 120 otherwise.
/// * [sticker]: Sticker to add to the set.
///
/// [Ok] is returned on completion.
final class AddStickerToSet extends TdFunction {
  /// **AddStickerToSet** *(addStickerToSet)* - TDLib function
  ///
  /// Adds a new sticker to a set.
  ///
  /// * [userId]: Sticker set owner; ignored for regular users.
  /// * [name]: Sticker set name. The sticker set must be owned by the current user, and contain less than 200 stickers for custom emoji sticker sets and less than 120 otherwise.
  /// * [sticker]: Sticker to add to the set.
  ///
  /// [Ok] is returned on completion.
  const AddStickerToSet({
    required this.userId,
    required this.name,
    required this.sticker,
  });

  /// Sticker set owner; ignored for regular users
  final int userId;

  /// Sticker set name. The sticker set must be owned by the current user, and contain less than 200 stickers for custom emoji sticker sets and less than 120 otherwise
  final String name;

  /// Sticker to add to the set
  final NewSticker sticker;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "name": name,
      "sticker": sticker.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Sticker set owner; ignored for regular users
  /// * [name]: Sticker set name. The sticker set must be owned by the current user, and contain less than 200 stickers for custom emoji sticker sets and less than 120 otherwise
  /// * [sticker]: Sticker to add to the set
  AddStickerToSet copyWith({
    int? userId,
    String? name,
    NewSticker? sticker,
  }) =>
      AddStickerToSet(
        userId: userId ?? this.userId,
        name: name ?? this.name,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addStickerToSet';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
