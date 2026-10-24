part of '../tdapi.dart';

/// **InputSticker** *(inputSticker)* - basic class
///
/// A sticker to be sent.
///
/// * [sticker]: Sticker to be sent.
/// * [thumbnail]: Sticker thumbnail; pass null to skip thumbnail uploading *(optional)*.
/// * [width]: Sticker width.
/// * [height]: Sticker height.
final class InputSticker extends TdObject {
  /// **InputSticker** *(inputSticker)* - basic class
  ///
  /// A sticker to be sent.
  ///
  /// * [sticker]: Sticker to be sent.
  /// * [thumbnail]: Sticker thumbnail; pass null to skip thumbnail uploading *(optional)*.
  /// * [width]: Sticker width.
  /// * [height]: Sticker height.
  const InputSticker({
    required this.sticker,
    this.thumbnail,
    required this.width,
    required this.height,
  });

  /// Sticker to be sent
  final InputFile sticker;

  /// Sticker thumbnail; pass null to skip thumbnail uploading
  final InputThumbnail? thumbnail;

  /// Sticker width
  final int width;

  /// Sticker height
  final int height;

  /// Parse from a json
  factory InputSticker.fromJson(Map<String, dynamic> json) => InputSticker(
        sticker: InputFile.fromJson(json['sticker']),
        thumbnail: json['thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['thumbnail']),
        width: json['width'],
        height: json['height'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker to be sent
  /// * [thumbnail]: Sticker thumbnail; pass null to skip thumbnail uploading
  /// * [width]: Sticker width
  /// * [height]: Sticker height
  InputSticker copyWith({
    InputFile? sticker,
    InputThumbnail? thumbnail,
    int? width,
    int? height,
  }) =>
      InputSticker(
        sticker: sticker ?? this.sticker,
        thumbnail: thumbnail ?? this.thumbnail,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
