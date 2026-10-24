part of '../tdapi.dart';

/// **StoryContentType** *(storyContentType)* - parent
///
/// Contains the type of the content of a story.
sealed class StoryContentType extends TdObject {
  /// **StoryContentType** *(storyContentType)* - parent
  ///
  /// Contains the type of the content of a story.
  const StoryContentType();

  /// a StoryContentType return type can be :
  /// * [StoryContentTypePhoto]
  /// * [StoryContentTypeVideo]
  /// * [StoryContentTypeLive]
  /// * [StoryContentTypeUnsupported]
  factory StoryContentType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoryContentTypePhoto.defaultObjectId:
        return StoryContentTypePhoto.fromJson(json);
      case StoryContentTypeVideo.defaultObjectId:
        return StoryContentTypeVideo.fromJson(json);
      case StoryContentTypeLive.defaultObjectId:
        return StoryContentTypeLive.fromJson(json);
      case StoryContentTypeUnsupported.defaultObjectId:
        return StoryContentTypeUnsupported.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoryContentType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoryContentType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storyContentType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentTypePhoto** *(storyContentTypePhoto)* - child of StoryContentType
///
/// A photo story.
final class StoryContentTypePhoto extends StoryContentType {
  /// **StoryContentTypePhoto** *(storyContentTypePhoto)* - child of StoryContentType
  ///
  /// A photo story.
  const StoryContentTypePhoto();

  /// Parse from a json
  factory StoryContentTypePhoto.fromJson(Map<String, dynamic> json) =>
      const StoryContentTypePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryContentTypePhoto copyWith() => const StoryContentTypePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'storyContentTypePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentTypeVideo** *(storyContentTypeVideo)* - child of StoryContentType
///
/// A video story.
final class StoryContentTypeVideo extends StoryContentType {
  /// **StoryContentTypeVideo** *(storyContentTypeVideo)* - child of StoryContentType
  ///
  /// A video story.
  const StoryContentTypeVideo();

  /// Parse from a json
  factory StoryContentTypeVideo.fromJson(Map<String, dynamic> json) =>
      const StoryContentTypeVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryContentTypeVideo copyWith() => const StoryContentTypeVideo();

  /// TDLib object type
  static const String defaultObjectId = 'storyContentTypeVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentTypeLive** *(storyContentTypeLive)* - child of StoryContentType
///
/// A live story.
final class StoryContentTypeLive extends StoryContentType {
  /// **StoryContentTypeLive** *(storyContentTypeLive)* - child of StoryContentType
  ///
  /// A live story.
  const StoryContentTypeLive();

  /// Parse from a json
  factory StoryContentTypeLive.fromJson(Map<String, dynamic> json) =>
      const StoryContentTypeLive();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryContentTypeLive copyWith() => const StoryContentTypeLive();

  /// TDLib object type
  static const String defaultObjectId = 'storyContentTypeLive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentTypeUnsupported** *(storyContentTypeUnsupported)* - child of StoryContentType
///
/// A story of unknown content type.
final class StoryContentTypeUnsupported extends StoryContentType {
  /// **StoryContentTypeUnsupported** *(storyContentTypeUnsupported)* - child of StoryContentType
  ///
  /// A story of unknown content type.
  const StoryContentTypeUnsupported();

  /// Parse from a json
  factory StoryContentTypeUnsupported.fromJson(Map<String, dynamic> json) =>
      const StoryContentTypeUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryContentTypeUnsupported copyWith() => const StoryContentTypeUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'storyContentTypeUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
