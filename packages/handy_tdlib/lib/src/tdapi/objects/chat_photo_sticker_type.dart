part of '../tdapi.dart';

/// **ChatPhotoStickerType** *(chatPhotoStickerType)* - parent
///
/// Describes type of sticker, which was used to create a chat photo.
sealed class ChatPhotoStickerType extends TdObject {
  /// **ChatPhotoStickerType** *(chatPhotoStickerType)* - parent
  ///
  /// Describes type of sticker, which was used to create a chat photo.
  const ChatPhotoStickerType();

  /// a ChatPhotoStickerType return type can be :
  /// * [ChatPhotoStickerTypeRegularOrMask]
  /// * [ChatPhotoStickerTypeCustomEmoji]
  factory ChatPhotoStickerType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatPhotoStickerTypeRegularOrMask.defaultObjectId:
        return ChatPhotoStickerTypeRegularOrMask.fromJson(json);
      case ChatPhotoStickerTypeCustomEmoji.defaultObjectId:
        return ChatPhotoStickerTypeCustomEmoji.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatPhotoStickerType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatPhotoStickerType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatPhotoStickerType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatPhotoStickerTypeRegularOrMask** *(chatPhotoStickerTypeRegularOrMask)* - child of ChatPhotoStickerType
///
/// Information about the sticker, which was used to create the chat photo.
///
/// * [stickerSetId]: Sticker set identifier.
/// * [stickerId]: Identifier of the sticker in the set.
final class ChatPhotoStickerTypeRegularOrMask extends ChatPhotoStickerType {
  /// **ChatPhotoStickerTypeRegularOrMask** *(chatPhotoStickerTypeRegularOrMask)* - child of ChatPhotoStickerType
  ///
  /// Information about the sticker, which was used to create the chat photo.
  ///
  /// * [stickerSetId]: Sticker set identifier.
  /// * [stickerId]: Identifier of the sticker in the set.
  const ChatPhotoStickerTypeRegularOrMask({
    required this.stickerSetId,
    required this.stickerId,
  });

  /// Sticker set identifier
  final int stickerSetId;

  /// Identifier of the sticker in the set
  final int stickerId;

  /// Parse from a json
  factory ChatPhotoStickerTypeRegularOrMask.fromJson(
          Map<String, dynamic> json) =>
      ChatPhotoStickerTypeRegularOrMask(
        stickerSetId: json['sticker_set_id'] is int
            ? json['sticker_set_id']
            : int.parse(json['sticker_set_id']),
        stickerId: json['sticker_id'] is int
            ? json['sticker_id']
            : int.parse(json['sticker_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker_set_id": stickerSetId,
      "sticker_id": stickerId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker_set_id]: Sticker set identifier
  /// * [sticker_id]: Identifier of the sticker in the set
  @override
  ChatPhotoStickerTypeRegularOrMask copyWith({
    int? stickerSetId,
    int? stickerId,
  }) =>
      ChatPhotoStickerTypeRegularOrMask(
        stickerSetId: stickerSetId ?? this.stickerSetId,
        stickerId: stickerId ?? this.stickerId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatPhotoStickerTypeRegularOrMask';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatPhotoStickerTypeCustomEmoji** *(chatPhotoStickerTypeCustomEmoji)* - child of ChatPhotoStickerType
///
/// Information about the custom emoji, which was used to create the chat photo.
///
/// * [customEmojiId]: Identifier of the custom emoji.
final class ChatPhotoStickerTypeCustomEmoji extends ChatPhotoStickerType {
  /// **ChatPhotoStickerTypeCustomEmoji** *(chatPhotoStickerTypeCustomEmoji)* - child of ChatPhotoStickerType
  ///
  /// Information about the custom emoji, which was used to create the chat photo.
  ///
  /// * [customEmojiId]: Identifier of the custom emoji.
  const ChatPhotoStickerTypeCustomEmoji({
    required this.customEmojiId,
  });

  /// Identifier of the custom emoji
  final int customEmojiId;

  /// Parse from a json
  factory ChatPhotoStickerTypeCustomEmoji.fromJson(Map<String, dynamic> json) =>
      ChatPhotoStickerTypeCustomEmoji(
        customEmojiId: json['custom_emoji_id'] is int
            ? json['custom_emoji_id']
            : int.parse(json['custom_emoji_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "custom_emoji_id": customEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_emoji_id]: Identifier of the custom emoji
  @override
  ChatPhotoStickerTypeCustomEmoji copyWith({
    int? customEmojiId,
  }) =>
      ChatPhotoStickerTypeCustomEmoji(
        customEmojiId: customEmojiId ?? this.customEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatPhotoStickerTypeCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
