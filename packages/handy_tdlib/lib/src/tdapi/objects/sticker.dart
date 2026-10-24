part of '../tdapi.dart';

/// **Sticker** *(sticker)* - basic class
///
/// Describes a sticker.
///
/// * [id]: Unique sticker identifier within the set; 0 if none.
/// * [setId]: Identifier of the sticker set to which the sticker belongs; 0 if none.
/// * [width]: Sticker width; as defined by the sender.
/// * [height]: Sticker height; as defined by the sender.
/// * [emoji]: Emoji corresponding to the sticker; may be empty if unknown.
/// * [format]: Sticker format.
/// * [fullType]: Sticker's full type.
/// * [thumbnail]: Sticker thumbnail in WEBP or JPEG format; may be null *(optional)*.
/// * [sticker]: File containing the sticker.
final class Sticker extends TdObject {
  /// **Sticker** *(sticker)* - basic class
  ///
  /// Describes a sticker.
  ///
  /// * [id]: Unique sticker identifier within the set; 0 if none.
  /// * [setId]: Identifier of the sticker set to which the sticker belongs; 0 if none.
  /// * [width]: Sticker width; as defined by the sender.
  /// * [height]: Sticker height; as defined by the sender.
  /// * [emoji]: Emoji corresponding to the sticker; may be empty if unknown.
  /// * [format]: Sticker format.
  /// * [fullType]: Sticker's full type.
  /// * [thumbnail]: Sticker thumbnail in WEBP or JPEG format; may be null *(optional)*.
  /// * [sticker]: File containing the sticker.
  const Sticker({
    required this.id,
    required this.setId,
    required this.width,
    required this.height,
    required this.emoji,
    required this.format,
    required this.fullType,
    this.thumbnail,
    required this.sticker,
    this.extra,
    this.clientId,
  });

  /// Unique sticker identifier within the set; 0 if none
  final int id;

  /// Identifier of the sticker set to which the sticker belongs; 0 if none
  final int setId;

  /// Sticker width; as defined by the sender
  final int width;

  /// Sticker height; as defined by the sender
  final int height;

  /// Emoji corresponding to the sticker; may be empty if unknown
  final String emoji;

  /// Sticker format
  final StickerFormat format;

  /// Sticker's full type
  final StickerFullType fullType;

  /// Sticker thumbnail in WEBP or JPEG format; may be null
  final Thumbnail? thumbnail;

  /// File containing the sticker
  final File sticker;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Sticker.fromJson(Map<String, dynamic> json) => Sticker(
        id: json['id'] is int
            ? json['id']
            : int.tryParse(json['id'] ?? "") ?? 0,
        setId: json['set_id'] is int
            ? json['set_id']
            : int.tryParse(json['set_id'] ?? "") ?? 0,
        width: json['width'],
        height: json['height'],
        emoji: json['emoji'],
        format: StickerFormat.fromJson(json['format']),
        fullType: StickerFullType.fromJson(json['full_type']),
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
        sticker: File.fromJson(json['sticker']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "set_id": setId,
      "width": width,
      "height": height,
      "emoji": emoji,
      "format": format.toJson(),
      "full_type": fullType.toJson(),
      "thumbnail": thumbnail?.toJson(),
      "sticker": sticker.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique sticker identifier within the set; 0 if none
  /// * [set_id]: Identifier of the sticker set to which the sticker belongs; 0 if none
  /// * [width]: Sticker width; as defined by the sender
  /// * [height]: Sticker height; as defined by the sender
  /// * [emoji]: Emoji corresponding to the sticker; may be empty if unknown
  /// * [format]: Sticker format
  /// * [full_type]: Sticker's full type
  /// * [thumbnail]: Sticker thumbnail in WEBP or JPEG format; may be null
  /// * [sticker]: File containing the sticker
  Sticker copyWith({
    int? id,
    int? setId,
    int? width,
    int? height,
    String? emoji,
    StickerFormat? format,
    StickerFullType? fullType,
    Thumbnail? thumbnail,
    File? sticker,
    dynamic extra,
    int? clientId,
  }) =>
      Sticker(
        id: id ?? this.id,
        setId: setId ?? this.setId,
        width: width ?? this.width,
        height: height ?? this.height,
        emoji: emoji ?? this.emoji,
        format: format ?? this.format,
        fullType: fullType ?? this.fullType,
        thumbnail: thumbnail ?? this.thumbnail,
        sticker: sticker ?? this.sticker,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
