part of '../tdapi.dart';

/// **StickerType** *(stickerType)* - parent
///
/// Describes type of sticker.
sealed class StickerType extends TdObject {
  /// **StickerType** *(stickerType)* - parent
  ///
  /// Describes type of sticker.
  const StickerType();

  /// a StickerType return type can be :
  /// * [StickerTypeRegular]
  /// * [StickerTypeMask]
  /// * [StickerTypeCustomEmoji]
  factory StickerType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StickerTypeRegular.defaultObjectId:
        return StickerTypeRegular.fromJson(json);
      case StickerTypeMask.defaultObjectId:
        return StickerTypeMask.fromJson(json);
      case StickerTypeCustomEmoji.defaultObjectId:
        return StickerTypeCustomEmoji.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StickerType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StickerType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'stickerType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerTypeRegular** *(stickerTypeRegular)* - child of StickerType
///
/// The sticker is a regular sticker.
final class StickerTypeRegular extends StickerType {
  /// **StickerTypeRegular** *(stickerTypeRegular)* - child of StickerType
  ///
  /// The sticker is a regular sticker.
  const StickerTypeRegular();

  /// Parse from a json
  factory StickerTypeRegular.fromJson(Map<String, dynamic> json) =>
      const StickerTypeRegular();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StickerTypeRegular copyWith() => const StickerTypeRegular();

  /// TDLib object type
  static const String defaultObjectId = 'stickerTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerTypeMask** *(stickerTypeMask)* - child of StickerType
///
/// The sticker is a mask in WEBP format to be placed on photos or videos.
final class StickerTypeMask extends StickerType {
  /// **StickerTypeMask** *(stickerTypeMask)* - child of StickerType
  ///
  /// The sticker is a mask in WEBP format to be placed on photos or videos.
  const StickerTypeMask();

  /// Parse from a json
  factory StickerTypeMask.fromJson(Map<String, dynamic> json) =>
      const StickerTypeMask();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StickerTypeMask copyWith() => const StickerTypeMask();

  /// TDLib object type
  static const String defaultObjectId = 'stickerTypeMask';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerTypeCustomEmoji** *(stickerTypeCustomEmoji)* - child of StickerType
///
/// The sticker is a custom emoji to be used inside message text and caption.
final class StickerTypeCustomEmoji extends StickerType {
  /// **StickerTypeCustomEmoji** *(stickerTypeCustomEmoji)* - child of StickerType
  ///
  /// The sticker is a custom emoji to be used inside message text and caption.
  const StickerTypeCustomEmoji();

  /// Parse from a json
  factory StickerTypeCustomEmoji.fromJson(Map<String, dynamic> json) =>
      const StickerTypeCustomEmoji();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StickerTypeCustomEmoji copyWith() => const StickerTypeCustomEmoji();

  /// TDLib object type
  static const String defaultObjectId = 'stickerTypeCustomEmoji';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
