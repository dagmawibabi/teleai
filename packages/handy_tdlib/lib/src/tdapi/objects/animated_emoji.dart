part of '../tdapi.dart';

/// **AnimatedEmoji** *(animatedEmoji)* - basic class
///
/// Describes an animated or custom representation of an emoji.
///
/// * [sticker]: Sticker for the emoji; may be null if yet unknown for a custom emoji. If the sticker is a custom emoji, then it can have arbitrary format *(optional)*.
/// * [stickerWidth]: Expected width of the sticker, which can be used if the sticker is null.
/// * [stickerHeight]: Expected height of the sticker, which can be used if the sticker is null.
/// * [fitzpatrickType]: Emoji modifier fitzpatrick type; 0-6; 0 if none.
/// * [sound]: File containing the sound to be played when the sticker is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container *(optional)*.
/// * [isRegularEmoji]: True, if the emoji is a regular emoji.
final class AnimatedEmoji extends TdObject {
  /// **AnimatedEmoji** *(animatedEmoji)* - basic class
  ///
  /// Describes an animated or custom representation of an emoji.
  ///
  /// * [sticker]: Sticker for the emoji; may be null if yet unknown for a custom emoji. If the sticker is a custom emoji, then it can have arbitrary format *(optional)*.
  /// * [stickerWidth]: Expected width of the sticker, which can be used if the sticker is null.
  /// * [stickerHeight]: Expected height of the sticker, which can be used if the sticker is null.
  /// * [fitzpatrickType]: Emoji modifier fitzpatrick type; 0-6; 0 if none.
  /// * [sound]: File containing the sound to be played when the sticker is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container *(optional)*.
  /// * [isRegularEmoji]: True, if the emoji is a regular emoji.
  const AnimatedEmoji({
    this.sticker,
    required this.stickerWidth,
    required this.stickerHeight,
    required this.fitzpatrickType,
    this.sound,
    required this.isRegularEmoji,
    this.extra,
    this.clientId,
  });

  /// Sticker for the emoji; may be null if yet unknown for a custom emoji. If the sticker is a custom emoji, then it can have arbitrary format
  final Sticker? sticker;

  /// Expected width of the sticker, which can be used if the sticker is null
  final int stickerWidth;

  /// Expected height of the sticker, which can be used if the sticker is null
  final int stickerHeight;

  /// Emoji modifier fitzpatrick type; 0-6; 0 if none
  final int fitzpatrickType;

  /// File containing the sound to be played when the sticker is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
  final File? sound;

  /// True, if the emoji is a regular emoji
  final bool isRegularEmoji;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AnimatedEmoji.fromJson(Map<String, dynamic> json) => AnimatedEmoji(
        sticker:
            json['sticker'] == null ? null : Sticker.fromJson(json['sticker']),
        stickerWidth: json['sticker_width'],
        stickerHeight: json['sticker_height'],
        fitzpatrickType: json['fitzpatrick_type'] ?? 0,
        sound: json['sound'] == null ? null : File.fromJson(json['sound']),
        isRegularEmoji: json['is_regular_emoji'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker?.toJson(),
      "sticker_width": stickerWidth,
      "sticker_height": stickerHeight,
      "fitzpatrick_type": fitzpatrickType,
      "sound": sound?.toJson(),
      "is_regular_emoji": isRegularEmoji,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Sticker for the emoji; may be null if yet unknown for a custom emoji. If the sticker is a custom emoji, then it can have arbitrary format
  /// * [sticker_width]: Expected width of the sticker, which can be used if the sticker is null
  /// * [sticker_height]: Expected height of the sticker, which can be used if the sticker is null
  /// * [fitzpatrick_type]: Emoji modifier fitzpatrick type; 0-6; 0 if none
  /// * [sound]: File containing the sound to be played when the sticker is clicked; may be null. The sound is encoded with the Opus codec, and stored inside an OGG container
  /// * [is_regular_emoji]: True, if the emoji is a regular emoji
  AnimatedEmoji copyWith({
    Sticker? sticker,
    int? stickerWidth,
    int? stickerHeight,
    int? fitzpatrickType,
    File? sound,
    bool? isRegularEmoji,
    dynamic extra,
    int? clientId,
  }) =>
      AnimatedEmoji(
        sticker: sticker ?? this.sticker,
        stickerWidth: stickerWidth ?? this.stickerWidth,
        stickerHeight: stickerHeight ?? this.stickerHeight,
        fitzpatrickType: fitzpatrickType ?? this.fitzpatrickType,
        sound: sound ?? this.sound,
        isRegularEmoji: isRegularEmoji ?? this.isRegularEmoji,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'animatedEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
