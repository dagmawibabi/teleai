part of '../tdapi.dart';

/// **SetStickerSetTitle** *(setStickerSetTitle)* - TDLib function
///
/// Sets a sticker set title.
///
/// * [name]: Sticker set name. The sticker set must be owned by the current user.
/// * [title]: New sticker set title.
///
/// [Ok] is returned on completion.
final class SetStickerSetTitle extends TdFunction {
  /// **SetStickerSetTitle** *(setStickerSetTitle)* - TDLib function
  ///
  /// Sets a sticker set title.
  ///
  /// * [name]: Sticker set name. The sticker set must be owned by the current user.
  /// * [title]: New sticker set title.
  ///
  /// [Ok] is returned on completion.
  const SetStickerSetTitle({
    required this.name,
    required this.title,
  });

  /// Sticker set name. The sticker set must be owned by the current user
  final String name;

  /// New sticker set title
  final String title;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "name": name,
      "title": title,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: Sticker set name. The sticker set must be owned by the current user
  /// * [title]: New sticker set title
  SetStickerSetTitle copyWith({
    String? name,
    String? title,
  }) =>
      SetStickerSetTitle(
        name: name ?? this.name,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setStickerSetTitle';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
