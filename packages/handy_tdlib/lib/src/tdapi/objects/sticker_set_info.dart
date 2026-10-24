part of '../tdapi.dart';

/// **StickerSetInfo** *(stickerSetInfo)* - basic class
///
/// Represents short information about a sticker set.
///
/// * [id]: Identifier of the sticker set.
/// * [title]: Title of the sticker set.
/// * [name]: Name of the sticker set.
/// * [thumbnail]: Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed *(optional)*.
/// * [thumbnailOutline]: Sticker set thumbnail's outline; may be null if unknown *(optional)*.
/// * [isOwned]: True, if the sticker set is owned by the current user.
/// * [isInstalled]: True, if the sticker set has been installed by the current user.
/// * [isArchived]: True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously.
/// * [isOfficial]: True, if the sticker set is official.
/// * [stickerType]: Type of the stickers in the set.
/// * [needsRepainting]: True, if stickers in the sticker set are custom emoji that must be repainted; for custom emoji sticker sets only.
/// * [isAllowedAsChatEmojiStatus]: True, if stickers in the sticker set are custom emoji that can be used as chat emoji status; for custom emoji sticker sets only.
/// * [isViewed]: True for already viewed trending sticker sets.
/// * [size]: Total number of stickers in the set.
/// * [covers]: Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested.
final class StickerSetInfo extends TdObject {
  /// **StickerSetInfo** *(stickerSetInfo)* - basic class
  ///
  /// Represents short information about a sticker set.
  ///
  /// * [id]: Identifier of the sticker set.
  /// * [title]: Title of the sticker set.
  /// * [name]: Name of the sticker set.
  /// * [thumbnail]: Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed *(optional)*.
  /// * [thumbnailOutline]: Sticker set thumbnail's outline; may be null if unknown *(optional)*.
  /// * [isOwned]: True, if the sticker set is owned by the current user.
  /// * [isInstalled]: True, if the sticker set has been installed by the current user.
  /// * [isArchived]: True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously.
  /// * [isOfficial]: True, if the sticker set is official.
  /// * [stickerType]: Type of the stickers in the set.
  /// * [needsRepainting]: True, if stickers in the sticker set are custom emoji that must be repainted; for custom emoji sticker sets only.
  /// * [isAllowedAsChatEmojiStatus]: True, if stickers in the sticker set are custom emoji that can be used as chat emoji status; for custom emoji sticker sets only.
  /// * [isViewed]: True for already viewed trending sticker sets.
  /// * [size]: Total number of stickers in the set.
  /// * [covers]: Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested.
  const StickerSetInfo({
    required this.id,
    required this.title,
    required this.name,
    this.thumbnail,
    this.thumbnailOutline,
    required this.isOwned,
    required this.isInstalled,
    required this.isArchived,
    required this.isOfficial,
    required this.stickerType,
    required this.needsRepainting,
    required this.isAllowedAsChatEmojiStatus,
    required this.isViewed,
    required this.size,
    required this.covers,
  });

  /// Identifier of the sticker set
  final int id;

  /// Title of the sticker set
  final String title;

  /// Name of the sticker set
  final String name;

  /// Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
  final Thumbnail? thumbnail;

  /// Sticker set thumbnail's outline; may be null if unknown
  final Outline? thumbnailOutline;

  /// True, if the sticker set is owned by the current user
  final bool isOwned;

  /// True, if the sticker set has been installed by the current user
  final bool isInstalled;

  /// True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
  final bool isArchived;

  /// True, if the sticker set is official
  final bool isOfficial;

  /// Type of the stickers in the set
  final StickerType stickerType;

  /// True, if stickers in the sticker set are custom emoji that must be repainted; for custom emoji sticker sets only
  final bool needsRepainting;

  /// True, if stickers in the sticker set are custom emoji that can be used as chat emoji status; for custom emoji sticker sets only
  final bool isAllowedAsChatEmojiStatus;

  /// True for already viewed trending sticker sets
  final bool isViewed;

  /// Total number of stickers in the set
  final int size;

  /// Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
  final List<Sticker> covers;

  /// Parse from a json
  factory StickerSetInfo.fromJson(Map<String, dynamic> json) => StickerSetInfo(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        title: json['title'],
        name: json['name'],
        thumbnail: json['thumbnail'] == null
            ? null
            : Thumbnail.fromJson(json['thumbnail']),
        thumbnailOutline: json['thumbnail_outline'] == null
            ? null
            : Outline.fromJson(json['thumbnail_outline']),
        isOwned: json['is_owned'],
        isInstalled: json['is_installed'],
        isArchived: json['is_archived'],
        isOfficial: json['is_official'],
        stickerType: StickerType.fromJson(json['sticker_type']),
        needsRepainting: json['needs_repainting'],
        isAllowedAsChatEmojiStatus: json['is_allowed_as_chat_emoji_status'],
        isViewed: json['is_viewed'],
        size: json['size'],
        covers: List<Sticker>.from((json['covers'] ?? [])
            .map((item) => Sticker.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "title": title,
      "name": name,
      "thumbnail": thumbnail?.toJson(),
      "thumbnail_outline": thumbnailOutline?.toJson(),
      "is_owned": isOwned,
      "is_installed": isInstalled,
      "is_archived": isArchived,
      "is_official": isOfficial,
      "sticker_type": stickerType.toJson(),
      "needs_repainting": needsRepainting,
      "is_allowed_as_chat_emoji_status": isAllowedAsChatEmojiStatus,
      "is_viewed": isViewed,
      "size": size,
      "covers": covers.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Identifier of the sticker set
  /// * [title]: Title of the sticker set
  /// * [name]: Name of the sticker set
  /// * [thumbnail]: Sticker set thumbnail in WEBP, TGS, or WEBM format with width and height 100; may be null. The file can be downloaded only before the thumbnail is changed
  /// * [thumbnail_outline]: Sticker set thumbnail's outline; may be null if unknown
  /// * [is_owned]: True, if the sticker set is owned by the current user
  /// * [is_installed]: True, if the sticker set has been installed by the current user
  /// * [is_archived]: True, if the sticker set has been archived. A sticker set can't be installed and archived simultaneously
  /// * [is_official]: True, if the sticker set is official
  /// * [sticker_type]: Type of the stickers in the set
  /// * [needs_repainting]: True, if stickers in the sticker set are custom emoji that must be repainted; for custom emoji sticker sets only
  /// * [is_allowed_as_chat_emoji_status]: True, if stickers in the sticker set are custom emoji that can be used as chat emoji status; for custom emoji sticker sets only
  /// * [is_viewed]: True for already viewed trending sticker sets
  /// * [size]: Total number of stickers in the set
  /// * [covers]: Up to the first 5 stickers from the set, depending on the context. If the application needs more stickers the full sticker set needs to be requested
  StickerSetInfo copyWith({
    int? id,
    String? title,
    String? name,
    Thumbnail? thumbnail,
    Outline? thumbnailOutline,
    bool? isOwned,
    bool? isInstalled,
    bool? isArchived,
    bool? isOfficial,
    StickerType? stickerType,
    bool? needsRepainting,
    bool? isAllowedAsChatEmojiStatus,
    bool? isViewed,
    int? size,
    List<Sticker>? covers,
  }) =>
      StickerSetInfo(
        id: id ?? this.id,
        title: title ?? this.title,
        name: name ?? this.name,
        thumbnail: thumbnail ?? this.thumbnail,
        thumbnailOutline: thumbnailOutline ?? this.thumbnailOutline,
        isOwned: isOwned ?? this.isOwned,
        isInstalled: isInstalled ?? this.isInstalled,
        isArchived: isArchived ?? this.isArchived,
        isOfficial: isOfficial ?? this.isOfficial,
        stickerType: stickerType ?? this.stickerType,
        needsRepainting: needsRepainting ?? this.needsRepainting,
        isAllowedAsChatEmojiStatus:
            isAllowedAsChatEmojiStatus ?? this.isAllowedAsChatEmojiStatus,
        isViewed: isViewed ?? this.isViewed,
        size: size ?? this.size,
        covers: covers ?? this.covers,
      );

  /// TDLib object type
  static const String defaultObjectId = 'stickerSetInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
