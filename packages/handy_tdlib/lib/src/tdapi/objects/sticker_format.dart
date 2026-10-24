part of '../tdapi.dart';

/// **StickerFormat** *(stickerFormat)* - parent
///
/// Describes format of a sticker.
sealed class StickerFormat extends TdObject {
  /// **StickerFormat** *(stickerFormat)* - parent
  ///
  /// Describes format of a sticker.
  const StickerFormat();

  /// a StickerFormat return type can be :
  /// * [StickerFormatWebp]
  /// * [StickerFormatTgs]
  /// * [StickerFormatWebm]
  factory StickerFormat.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StickerFormatWebp.defaultObjectId:
        return StickerFormatWebp.fromJson(json);
      case StickerFormatTgs.defaultObjectId:
        return StickerFormatTgs.fromJson(json);
      case StickerFormatWebm.defaultObjectId:
        return StickerFormatWebm.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StickerFormat)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StickerFormat copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'stickerFormat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerFormatWebp** *(stickerFormatWebp)* - child of StickerFormat
///
/// The sticker is an image in WEBP format.
final class StickerFormatWebp extends StickerFormat {
  /// **StickerFormatWebp** *(stickerFormatWebp)* - child of StickerFormat
  ///
  /// The sticker is an image in WEBP format.
  const StickerFormatWebp();

  /// Parse from a json
  factory StickerFormatWebp.fromJson(Map<String, dynamic> json) =>
      const StickerFormatWebp();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StickerFormatWebp copyWith() => const StickerFormatWebp();

  /// TDLib object type
  static const String defaultObjectId = 'stickerFormatWebp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerFormatTgs** *(stickerFormatTgs)* - child of StickerFormat
///
/// The sticker is an animation in TGS format.
final class StickerFormatTgs extends StickerFormat {
  /// **StickerFormatTgs** *(stickerFormatTgs)* - child of StickerFormat
  ///
  /// The sticker is an animation in TGS format.
  const StickerFormatTgs();

  /// Parse from a json
  factory StickerFormatTgs.fromJson(Map<String, dynamic> json) =>
      const StickerFormatTgs();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StickerFormatTgs copyWith() => const StickerFormatTgs();

  /// TDLib object type
  static const String defaultObjectId = 'stickerFormatTgs';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StickerFormatWebm** *(stickerFormatWebm)* - child of StickerFormat
///
/// The sticker is a video in WEBM format.
final class StickerFormatWebm extends StickerFormat {
  /// **StickerFormatWebm** *(stickerFormatWebm)* - child of StickerFormat
  ///
  /// The sticker is a video in WEBM format.
  const StickerFormatWebm();

  /// Parse from a json
  factory StickerFormatWebm.fromJson(Map<String, dynamic> json) =>
      const StickerFormatWebm();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StickerFormatWebm copyWith() => const StickerFormatWebm();

  /// TDLib object type
  static const String defaultObjectId = 'stickerFormatWebm';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
