part of '../tdapi.dart';

/// **ChatPhoto** *(chatPhoto)* - basic class
///
/// Describes a chat or user profile photo.
///
/// * [id]: Unique photo identifier.
/// * [addedDate]: Point in time (Unix timestamp) when the photo has been added.
/// * [minithumbnail]: Photo minithumbnail; may be null *(optional)*.
/// * [sizes]: Available variants of the photo in JPEG format, in different sizes.
/// * [animation]: A big (up to 1280x1280) animated variant of the photo in MPEG4 format; may be null *(optional)*.
/// * [smallAnimation]: A small (160x160) animated variant of the photo in MPEG4 format; may be null even if the big animation is available *(optional)*.
/// * [sticker]: Sticker-based version of the chat photo; may be null *(optional)*.
final class ChatPhoto extends TdObject {
  /// **ChatPhoto** *(chatPhoto)* - basic class
  ///
  /// Describes a chat or user profile photo.
  ///
  /// * [id]: Unique photo identifier.
  /// * [addedDate]: Point in time (Unix timestamp) when the photo has been added.
  /// * [minithumbnail]: Photo minithumbnail; may be null *(optional)*.
  /// * [sizes]: Available variants of the photo in JPEG format, in different sizes.
  /// * [animation]: A big (up to 1280x1280) animated variant of the photo in MPEG4 format; may be null *(optional)*.
  /// * [smallAnimation]: A small (160x160) animated variant of the photo in MPEG4 format; may be null even if the big animation is available *(optional)*.
  /// * [sticker]: Sticker-based version of the chat photo; may be null *(optional)*.
  const ChatPhoto({
    required this.id,
    required this.addedDate,
    this.minithumbnail,
    required this.sizes,
    this.animation,
    this.smallAnimation,
    this.sticker,
  });

  /// Unique photo identifier
  final int id;

  /// Point in time (Unix timestamp) when the photo has been added
  final int addedDate;

  /// Photo minithumbnail; may be null
  final Minithumbnail? minithumbnail;

  /// Available variants of the photo in JPEG format, in different sizes
  final List<PhotoSize> sizes;

  /// A big (up to 1280x1280) animated variant of the photo in MPEG4 format; may be null
  final AnimatedChatPhoto? animation;

  /// A small (160x160) animated variant of the photo in MPEG4 format; may be null even if the big animation is available
  final AnimatedChatPhoto? smallAnimation;

  /// Sticker-based version of the chat photo; may be null
  final ChatPhotoSticker? sticker;

  /// Parse from a json
  factory ChatPhoto.fromJson(Map<String, dynamic> json) => ChatPhoto(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        addedDate: json['added_date'],
        minithumbnail: json['minithumbnail'] == null
            ? null
            : Minithumbnail.fromJson(json['minithumbnail']),
        sizes: List<PhotoSize>.from((json['sizes'] ?? [])
            .map((item) => PhotoSize.fromJson(item))
            .toList()),
        animation: json['animation'] == null
            ? null
            : AnimatedChatPhoto.fromJson(json['animation']),
        smallAnimation: json['small_animation'] == null
            ? null
            : AnimatedChatPhoto.fromJson(json['small_animation']),
        sticker: json['sticker'] == null
            ? null
            : ChatPhotoSticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "added_date": addedDate,
      "minithumbnail": minithumbnail?.toJson(),
      "sizes": sizes.map((i) => i.toJson()).toList(),
      "animation": animation?.toJson(),
      "small_animation": smallAnimation?.toJson(),
      "sticker": sticker?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique photo identifier
  /// * [added_date]: Point in time (Unix timestamp) when the photo has been added
  /// * [minithumbnail]: Photo minithumbnail; may be null
  /// * [sizes]: Available variants of the photo in JPEG format, in different sizes
  /// * [animation]: A big (up to 1280x1280) animated variant of the photo in MPEG4 format; may be null
  /// * [small_animation]: A small (160x160) animated variant of the photo in MPEG4 format; may be null even if the big animation is available
  /// * [sticker]: Sticker-based version of the chat photo; may be null
  ChatPhoto copyWith({
    int? id,
    int? addedDate,
    Minithumbnail? minithumbnail,
    List<PhotoSize>? sizes,
    AnimatedChatPhoto? animation,
    AnimatedChatPhoto? smallAnimation,
    ChatPhotoSticker? sticker,
  }) =>
      ChatPhoto(
        id: id ?? this.id,
        addedDate: addedDate ?? this.addedDate,
        minithumbnail: minithumbnail ?? this.minithumbnail,
        sizes: sizes ?? this.sizes,
        animation: animation ?? this.animation,
        smallAnimation: smallAnimation ?? this.smallAnimation,
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
