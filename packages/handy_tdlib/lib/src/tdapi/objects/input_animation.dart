part of '../tdapi.dart';

/// **InputAnimation** *(inputAnimation)* - basic class
///
/// An animation to be sent.
///
/// * [animation]: Animation file to be sent.
/// * [thumbnail]: Animation thumbnail; pass null to skip thumbnail uploading *(optional)*.
/// * [addedStickerFileIds]: File identifiers of the stickers added to the animation, if applicable.
/// * [duration]: Duration of the animation, in seconds; may be replaced by the server.
/// * [width]: Width of the animation; may be replaced by the server.
/// * [height]: Height of the animation; may be replaced by the server.
final class InputAnimation extends TdObject {
  /// **InputAnimation** *(inputAnimation)* - basic class
  ///
  /// An animation to be sent.
  ///
  /// * [animation]: Animation file to be sent.
  /// * [thumbnail]: Animation thumbnail; pass null to skip thumbnail uploading *(optional)*.
  /// * [addedStickerFileIds]: File identifiers of the stickers added to the animation, if applicable.
  /// * [duration]: Duration of the animation, in seconds; may be replaced by the server.
  /// * [width]: Width of the animation; may be replaced by the server.
  /// * [height]: Height of the animation; may be replaced by the server.
  const InputAnimation({
    required this.animation,
    this.thumbnail,
    required this.addedStickerFileIds,
    required this.duration,
    required this.width,
    required this.height,
  });

  /// Animation file to be sent
  final InputFile animation;

  /// Animation thumbnail; pass null to skip thumbnail uploading
  final InputThumbnail? thumbnail;

  /// File identifiers of the stickers added to the animation, if applicable
  final List<int> addedStickerFileIds;

  /// Duration of the animation, in seconds; may be replaced by the server
  final int duration;

  /// Width of the animation; may be replaced by the server
  final int width;

  /// Height of the animation; may be replaced by the server
  final int height;

  /// Parse from a json
  factory InputAnimation.fromJson(Map<String, dynamic> json) => InputAnimation(
        animation: InputFile.fromJson(json['animation']),
        thumbnail: json['thumbnail'] == null
            ? null
            : InputThumbnail.fromJson(json['thumbnail']),
        addedStickerFileIds: List<int>.from(
            (json['added_sticker_file_ids'] ?? [])
                .map((item) => item)
                .toList()),
        duration: json['duration'],
        width: json['width'],
        height: json['height'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "added_sticker_file_ids": addedStickerFileIds.map((i) => i).toList(),
      "duration": duration,
      "width": width,
      "height": height,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: Animation file to be sent
  /// * [thumbnail]: Animation thumbnail; pass null to skip thumbnail uploading
  /// * [added_sticker_file_ids]: File identifiers of the stickers added to the animation, if applicable
  /// * [duration]: Duration of the animation, in seconds; may be replaced by the server
  /// * [width]: Width of the animation; may be replaced by the server
  /// * [height]: Height of the animation; may be replaced by the server
  InputAnimation copyWith({
    InputFile? animation,
    InputThumbnail? thumbnail,
    List<int>? addedStickerFileIds,
    int? duration,
    int? width,
    int? height,
  }) =>
      InputAnimation(
        animation: animation ?? this.animation,
        thumbnail: thumbnail ?? this.thumbnail,
        addedStickerFileIds: addedStickerFileIds ?? this.addedStickerFileIds,
        duration: duration ?? this.duration,
        width: width ?? this.width,
        height: height ?? this.height,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
