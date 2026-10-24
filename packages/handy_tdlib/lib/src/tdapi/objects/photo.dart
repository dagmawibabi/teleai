part of '../tdapi.dart';

/// **Photo** *(photo)* - basic class
///
/// Describes a photo.
///
/// * [hasStickers]: True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets.
/// * [minithumbnail]: Photo minithumbnail; may be null *(optional)*.
/// * [sizes]: Available variants of the photo, in different sizes.
final class Photo extends TdObject {
  /// **Photo** *(photo)* - basic class
  ///
  /// Describes a photo.
  ///
  /// * [hasStickers]: True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets.
  /// * [minithumbnail]: Photo minithumbnail; may be null *(optional)*.
  /// * [sizes]: Available variants of the photo, in different sizes.
  const Photo({
    required this.hasStickers,
    this.minithumbnail,
    required this.sizes,
  });

  /// True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets
  final bool hasStickers;

  /// Photo minithumbnail; may be null
  final Minithumbnail? minithumbnail;

  /// Available variants of the photo, in different sizes
  final List<PhotoSize> sizes;

  /// Parse from a json
  factory Photo.fromJson(Map<String, dynamic> json) => Photo(
        hasStickers: json['has_stickers'],
        minithumbnail: json['minithumbnail'] == null
            ? null
            : Minithumbnail.fromJson(json['minithumbnail']),
        sizes: List<PhotoSize>.from((json['sizes'] ?? [])
            .map((item) => PhotoSize.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "has_stickers": hasStickers,
      "minithumbnail": minithumbnail?.toJson(),
      "sizes": sizes.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [has_stickers]: True, if stickers were added to the photo. The list of corresponding sticker sets can be received using getAttachedStickerSets
  /// * [minithumbnail]: Photo minithumbnail; may be null
  /// * [sizes]: Available variants of the photo, in different sizes
  Photo copyWith({
    bool? hasStickers,
    Minithumbnail? minithumbnail,
    List<PhotoSize>? sizes,
  }) =>
      Photo(
        hasStickers: hasStickers ?? this.hasStickers,
        minithumbnail: minithumbnail ?? this.minithumbnail,
        sizes: sizes ?? this.sizes,
      );

  /// TDLib object type
  static const String defaultObjectId = 'photo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
