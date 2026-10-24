part of '../tdapi.dart';

/// **ThumbnailFormat** *(thumbnailFormat)* - parent
///
/// Describes format of a thumbnail.
sealed class ThumbnailFormat extends TdObject {
  /// **ThumbnailFormat** *(thumbnailFormat)* - parent
  ///
  /// Describes format of a thumbnail.
  const ThumbnailFormat();

  /// a ThumbnailFormat return type can be :
  /// * [ThumbnailFormatJpeg]
  /// * [ThumbnailFormatGif]
  /// * [ThumbnailFormatMpeg4]
  /// * [ThumbnailFormatPng]
  /// * [ThumbnailFormatTgs]
  /// * [ThumbnailFormatWebm]
  /// * [ThumbnailFormatWebp]
  factory ThumbnailFormat.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ThumbnailFormatJpeg.defaultObjectId:
        return ThumbnailFormatJpeg.fromJson(json);
      case ThumbnailFormatGif.defaultObjectId:
        return ThumbnailFormatGif.fromJson(json);
      case ThumbnailFormatMpeg4.defaultObjectId:
        return ThumbnailFormatMpeg4.fromJson(json);
      case ThumbnailFormatPng.defaultObjectId:
        return ThumbnailFormatPng.fromJson(json);
      case ThumbnailFormatTgs.defaultObjectId:
        return ThumbnailFormatTgs.fromJson(json);
      case ThumbnailFormatWebm.defaultObjectId:
        return ThumbnailFormatWebm.fromJson(json);
      case ThumbnailFormatWebp.defaultObjectId:
        return ThumbnailFormatWebp.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ThumbnailFormat)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ThumbnailFormat copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ThumbnailFormatJpeg** *(thumbnailFormatJpeg)* - child of ThumbnailFormat
///
/// The thumbnail is in JPEG format.
final class ThumbnailFormatJpeg extends ThumbnailFormat {
  /// **ThumbnailFormatJpeg** *(thumbnailFormatJpeg)* - child of ThumbnailFormat
  ///
  /// The thumbnail is in JPEG format.
  const ThumbnailFormatJpeg();

  /// Parse from a json
  factory ThumbnailFormatJpeg.fromJson(Map<String, dynamic> json) =>
      const ThumbnailFormatJpeg();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ThumbnailFormatJpeg copyWith() => const ThumbnailFormatJpeg();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormatJpeg';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ThumbnailFormatGif** *(thumbnailFormatGif)* - child of ThumbnailFormat
///
/// The thumbnail is in static GIF format. It will be used only for some bot inline query results.
final class ThumbnailFormatGif extends ThumbnailFormat {
  /// **ThumbnailFormatGif** *(thumbnailFormatGif)* - child of ThumbnailFormat
  ///
  /// The thumbnail is in static GIF format. It will be used only for some bot inline query results.
  const ThumbnailFormatGif();

  /// Parse from a json
  factory ThumbnailFormatGif.fromJson(Map<String, dynamic> json) =>
      const ThumbnailFormatGif();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ThumbnailFormatGif copyWith() => const ThumbnailFormatGif();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormatGif';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ThumbnailFormatMpeg4** *(thumbnailFormatMpeg4)* - child of ThumbnailFormat
///
/// The thumbnail is in MPEG4 format. It will be used only for some animations and videos.
final class ThumbnailFormatMpeg4 extends ThumbnailFormat {
  /// **ThumbnailFormatMpeg4** *(thumbnailFormatMpeg4)* - child of ThumbnailFormat
  ///
  /// The thumbnail is in MPEG4 format. It will be used only for some animations and videos.
  const ThumbnailFormatMpeg4();

  /// Parse from a json
  factory ThumbnailFormatMpeg4.fromJson(Map<String, dynamic> json) =>
      const ThumbnailFormatMpeg4();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ThumbnailFormatMpeg4 copyWith() => const ThumbnailFormatMpeg4();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormatMpeg4';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ThumbnailFormatPng** *(thumbnailFormatPng)* - child of ThumbnailFormat
///
/// The thumbnail is in PNG format. It will be used only for background patterns.
final class ThumbnailFormatPng extends ThumbnailFormat {
  /// **ThumbnailFormatPng** *(thumbnailFormatPng)* - child of ThumbnailFormat
  ///
  /// The thumbnail is in PNG format. It will be used only for background patterns.
  const ThumbnailFormatPng();

  /// Parse from a json
  factory ThumbnailFormatPng.fromJson(Map<String, dynamic> json) =>
      const ThumbnailFormatPng();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ThumbnailFormatPng copyWith() => const ThumbnailFormatPng();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormatPng';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ThumbnailFormatTgs** *(thumbnailFormatTgs)* - child of ThumbnailFormat
///
/// The thumbnail is in TGS format. It will be used only for sticker sets.
final class ThumbnailFormatTgs extends ThumbnailFormat {
  /// **ThumbnailFormatTgs** *(thumbnailFormatTgs)* - child of ThumbnailFormat
  ///
  /// The thumbnail is in TGS format. It will be used only for sticker sets.
  const ThumbnailFormatTgs();

  /// Parse from a json
  factory ThumbnailFormatTgs.fromJson(Map<String, dynamic> json) =>
      const ThumbnailFormatTgs();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ThumbnailFormatTgs copyWith() => const ThumbnailFormatTgs();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormatTgs';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ThumbnailFormatWebm** *(thumbnailFormatWebm)* - child of ThumbnailFormat
///
/// The thumbnail is in WEBM format. It will be used only for sticker sets.
final class ThumbnailFormatWebm extends ThumbnailFormat {
  /// **ThumbnailFormatWebm** *(thumbnailFormatWebm)* - child of ThumbnailFormat
  ///
  /// The thumbnail is in WEBM format. It will be used only for sticker sets.
  const ThumbnailFormatWebm();

  /// Parse from a json
  factory ThumbnailFormatWebm.fromJson(Map<String, dynamic> json) =>
      const ThumbnailFormatWebm();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ThumbnailFormatWebm copyWith() => const ThumbnailFormatWebm();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormatWebm';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ThumbnailFormatWebp** *(thumbnailFormatWebp)* - child of ThumbnailFormat
///
/// The thumbnail is in WEBP format. It will be used only for some stickers and sticker sets.
final class ThumbnailFormatWebp extends ThumbnailFormat {
  /// **ThumbnailFormatWebp** *(thumbnailFormatWebp)* - child of ThumbnailFormat
  ///
  /// The thumbnail is in WEBP format. It will be used only for some stickers and sticker sets.
  const ThumbnailFormatWebp();

  /// Parse from a json
  factory ThumbnailFormatWebp.fromJson(Map<String, dynamic> json) =>
      const ThumbnailFormatWebp();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ThumbnailFormatWebp copyWith() => const ThumbnailFormatWebp();

  /// TDLib object type
  static const String defaultObjectId = 'thumbnailFormatWebp';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
