part of '../tdapi.dart';

/// **FileType** *(fileType)* - parent
///
/// Represents the type of file.
sealed class FileType extends TdObject {
  /// **FileType** *(fileType)* - parent
  ///
  /// Represents the type of file.
  const FileType();

  /// a FileType return type can be :
  /// * [FileTypeNone]
  /// * [FileTypeAnimation]
  /// * [FileTypeAudio]
  /// * [FileTypeDocument]
  /// * [FileTypeLivePhotoVideo]
  /// * [FileTypeNotificationSound]
  /// * [FileTypePhoto]
  /// * [FileTypePhotoStory]
  /// * [FileTypeProfilePhoto]
  /// * [FileTypeSecret]
  /// * [FileTypeSecretThumbnail]
  /// * [FileTypeSecure]
  /// * [FileTypeSelfDestructingLivePhotoVideo]
  /// * [FileTypeSelfDestructingPhoto]
  /// * [FileTypeSelfDestructingVideo]
  /// * [FileTypeSelfDestructingVideoNote]
  /// * [FileTypeSelfDestructingVoiceNote]
  /// * [FileTypeSticker]
  /// * [FileTypeThumbnail]
  /// * [FileTypeUnknown]
  /// * [FileTypeVideo]
  /// * [FileTypeVideoNote]
  /// * [FileTypeVideoStory]
  /// * [FileTypeVoiceNote]
  /// * [FileTypeWallpaper]
  factory FileType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case FileTypeNone.defaultObjectId:
        return FileTypeNone.fromJson(json);
      case FileTypeAnimation.defaultObjectId:
        return FileTypeAnimation.fromJson(json);
      case FileTypeAudio.defaultObjectId:
        return FileTypeAudio.fromJson(json);
      case FileTypeDocument.defaultObjectId:
        return FileTypeDocument.fromJson(json);
      case FileTypeLivePhotoVideo.defaultObjectId:
        return FileTypeLivePhotoVideo.fromJson(json);
      case FileTypeNotificationSound.defaultObjectId:
        return FileTypeNotificationSound.fromJson(json);
      case FileTypePhoto.defaultObjectId:
        return FileTypePhoto.fromJson(json);
      case FileTypePhotoStory.defaultObjectId:
        return FileTypePhotoStory.fromJson(json);
      case FileTypeProfilePhoto.defaultObjectId:
        return FileTypeProfilePhoto.fromJson(json);
      case FileTypeSecret.defaultObjectId:
        return FileTypeSecret.fromJson(json);
      case FileTypeSecretThumbnail.defaultObjectId:
        return FileTypeSecretThumbnail.fromJson(json);
      case FileTypeSecure.defaultObjectId:
        return FileTypeSecure.fromJson(json);
      case FileTypeSelfDestructingLivePhotoVideo.defaultObjectId:
        return FileTypeSelfDestructingLivePhotoVideo.fromJson(json);
      case FileTypeSelfDestructingPhoto.defaultObjectId:
        return FileTypeSelfDestructingPhoto.fromJson(json);
      case FileTypeSelfDestructingVideo.defaultObjectId:
        return FileTypeSelfDestructingVideo.fromJson(json);
      case FileTypeSelfDestructingVideoNote.defaultObjectId:
        return FileTypeSelfDestructingVideoNote.fromJson(json);
      case FileTypeSelfDestructingVoiceNote.defaultObjectId:
        return FileTypeSelfDestructingVoiceNote.fromJson(json);
      case FileTypeSticker.defaultObjectId:
        return FileTypeSticker.fromJson(json);
      case FileTypeThumbnail.defaultObjectId:
        return FileTypeThumbnail.fromJson(json);
      case FileTypeUnknown.defaultObjectId:
        return FileTypeUnknown.fromJson(json);
      case FileTypeVideo.defaultObjectId:
        return FileTypeVideo.fromJson(json);
      case FileTypeVideoNote.defaultObjectId:
        return FileTypeVideoNote.fromJson(json);
      case FileTypeVideoStory.defaultObjectId:
        return FileTypeVideoStory.fromJson(json);
      case FileTypeVoiceNote.defaultObjectId:
        return FileTypeVoiceNote.fromJson(json);
      case FileTypeWallpaper.defaultObjectId:
        return FileTypeWallpaper.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of FileType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  FileType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'fileType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeNone** *(fileTypeNone)* - child of FileType
///
/// The data is not a file.
final class FileTypeNone extends FileType {
  /// **FileTypeNone** *(fileTypeNone)* - child of FileType
  ///
  /// The data is not a file.
  const FileTypeNone();

  /// Parse from a json
  factory FileTypeNone.fromJson(Map<String, dynamic> json) =>
      const FileTypeNone();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeNone copyWith() => const FileTypeNone();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeNone';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeAnimation** *(fileTypeAnimation)* - child of FileType
///
/// The file is an animation.
final class FileTypeAnimation extends FileType {
  /// **FileTypeAnimation** *(fileTypeAnimation)* - child of FileType
  ///
  /// The file is an animation.
  const FileTypeAnimation();

  /// Parse from a json
  factory FileTypeAnimation.fromJson(Map<String, dynamic> json) =>
      const FileTypeAnimation();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeAnimation copyWith() => const FileTypeAnimation();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeAudio** *(fileTypeAudio)* - child of FileType
///
/// The file is an audio file.
final class FileTypeAudio extends FileType {
  /// **FileTypeAudio** *(fileTypeAudio)* - child of FileType
  ///
  /// The file is an audio file.
  const FileTypeAudio();

  /// Parse from a json
  factory FileTypeAudio.fromJson(Map<String, dynamic> json) =>
      const FileTypeAudio();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeAudio copyWith() => const FileTypeAudio();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeAudio';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeDocument** *(fileTypeDocument)* - child of FileType
///
/// The file is a document.
final class FileTypeDocument extends FileType {
  /// **FileTypeDocument** *(fileTypeDocument)* - child of FileType
  ///
  /// The file is a document.
  const FileTypeDocument();

  /// Parse from a json
  factory FileTypeDocument.fromJson(Map<String, dynamic> json) =>
      const FileTypeDocument();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeDocument copyWith() => const FileTypeDocument();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeDocument';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeLivePhotoVideo** *(fileTypeLivePhotoVideo)* - child of FileType
///
/// The file is a video for a live photo.
final class FileTypeLivePhotoVideo extends FileType {
  /// **FileTypeLivePhotoVideo** *(fileTypeLivePhotoVideo)* - child of FileType
  ///
  /// The file is a video for a live photo.
  const FileTypeLivePhotoVideo();

  /// Parse from a json
  factory FileTypeLivePhotoVideo.fromJson(Map<String, dynamic> json) =>
      const FileTypeLivePhotoVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeLivePhotoVideo copyWith() => const FileTypeLivePhotoVideo();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeLivePhotoVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeNotificationSound** *(fileTypeNotificationSound)* - child of FileType
///
/// The file is a notification sound.
final class FileTypeNotificationSound extends FileType {
  /// **FileTypeNotificationSound** *(fileTypeNotificationSound)* - child of FileType
  ///
  /// The file is a notification sound.
  const FileTypeNotificationSound();

  /// Parse from a json
  factory FileTypeNotificationSound.fromJson(Map<String, dynamic> json) =>
      const FileTypeNotificationSound();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeNotificationSound copyWith() => const FileTypeNotificationSound();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeNotificationSound';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypePhoto** *(fileTypePhoto)* - child of FileType
///
/// The file is a photo.
final class FileTypePhoto extends FileType {
  /// **FileTypePhoto** *(fileTypePhoto)* - child of FileType
  ///
  /// The file is a photo.
  const FileTypePhoto();

  /// Parse from a json
  factory FileTypePhoto.fromJson(Map<String, dynamic> json) =>
      const FileTypePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypePhoto copyWith() => const FileTypePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypePhotoStory** *(fileTypePhotoStory)* - child of FileType
///
/// The file is a photo published as a story.
final class FileTypePhotoStory extends FileType {
  /// **FileTypePhotoStory** *(fileTypePhotoStory)* - child of FileType
  ///
  /// The file is a photo published as a story.
  const FileTypePhotoStory();

  /// Parse from a json
  factory FileTypePhotoStory.fromJson(Map<String, dynamic> json) =>
      const FileTypePhotoStory();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypePhotoStory copyWith() => const FileTypePhotoStory();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypePhotoStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeProfilePhoto** *(fileTypeProfilePhoto)* - child of FileType
///
/// The file is a profile photo.
final class FileTypeProfilePhoto extends FileType {
  /// **FileTypeProfilePhoto** *(fileTypeProfilePhoto)* - child of FileType
  ///
  /// The file is a profile photo.
  const FileTypeProfilePhoto();

  /// Parse from a json
  factory FileTypeProfilePhoto.fromJson(Map<String, dynamic> json) =>
      const FileTypeProfilePhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeProfilePhoto copyWith() => const FileTypeProfilePhoto();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeProfilePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSecret** *(fileTypeSecret)* - child of FileType
///
/// The file was sent to a secret chat (the file type is not known to the server).
final class FileTypeSecret extends FileType {
  /// **FileTypeSecret** *(fileTypeSecret)* - child of FileType
  ///
  /// The file was sent to a secret chat (the file type is not known to the server).
  const FileTypeSecret();

  /// Parse from a json
  factory FileTypeSecret.fromJson(Map<String, dynamic> json) =>
      const FileTypeSecret();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSecret copyWith() => const FileTypeSecret();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSecret';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSecretThumbnail** *(fileTypeSecretThumbnail)* - child of FileType
///
/// The file is a thumbnail of a file from a secret chat.
final class FileTypeSecretThumbnail extends FileType {
  /// **FileTypeSecretThumbnail** *(fileTypeSecretThumbnail)* - child of FileType
  ///
  /// The file is a thumbnail of a file from a secret chat.
  const FileTypeSecretThumbnail();

  /// Parse from a json
  factory FileTypeSecretThumbnail.fromJson(Map<String, dynamic> json) =>
      const FileTypeSecretThumbnail();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSecretThumbnail copyWith() => const FileTypeSecretThumbnail();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSecretThumbnail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSecure** *(fileTypeSecure)* - child of FileType
///
/// The file is a file from Secure storage used for storing Telegram Passport files.
final class FileTypeSecure extends FileType {
  /// **FileTypeSecure** *(fileTypeSecure)* - child of FileType
  ///
  /// The file is a file from Secure storage used for storing Telegram Passport files.
  const FileTypeSecure();

  /// Parse from a json
  factory FileTypeSecure.fromJson(Map<String, dynamic> json) =>
      const FileTypeSecure();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSecure copyWith() => const FileTypeSecure();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSecure';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSelfDestructingLivePhotoVideo** *(fileTypeSelfDestructingLivePhotoVideo)* - child of FileType
///
/// The file is a self-destructing video for a live photo in a private chat.
final class FileTypeSelfDestructingLivePhotoVideo extends FileType {
  /// **FileTypeSelfDestructingLivePhotoVideo** *(fileTypeSelfDestructingLivePhotoVideo)* - child of FileType
  ///
  /// The file is a self-destructing video for a live photo in a private chat.
  const FileTypeSelfDestructingLivePhotoVideo();

  /// Parse from a json
  factory FileTypeSelfDestructingLivePhotoVideo.fromJson(
          Map<String, dynamic> json) =>
      const FileTypeSelfDestructingLivePhotoVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSelfDestructingLivePhotoVideo copyWith() =>
      const FileTypeSelfDestructingLivePhotoVideo();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSelfDestructingLivePhotoVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSelfDestructingPhoto** *(fileTypeSelfDestructingPhoto)* - child of FileType
///
/// The file is a self-destructing photo in a private chat.
final class FileTypeSelfDestructingPhoto extends FileType {
  /// **FileTypeSelfDestructingPhoto** *(fileTypeSelfDestructingPhoto)* - child of FileType
  ///
  /// The file is a self-destructing photo in a private chat.
  const FileTypeSelfDestructingPhoto();

  /// Parse from a json
  factory FileTypeSelfDestructingPhoto.fromJson(Map<String, dynamic> json) =>
      const FileTypeSelfDestructingPhoto();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSelfDestructingPhoto copyWith() =>
      const FileTypeSelfDestructingPhoto();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSelfDestructingPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSelfDestructingVideo** *(fileTypeSelfDestructingVideo)* - child of FileType
///
/// The file is a self-destructing video in a private chat.
final class FileTypeSelfDestructingVideo extends FileType {
  /// **FileTypeSelfDestructingVideo** *(fileTypeSelfDestructingVideo)* - child of FileType
  ///
  /// The file is a self-destructing video in a private chat.
  const FileTypeSelfDestructingVideo();

  /// Parse from a json
  factory FileTypeSelfDestructingVideo.fromJson(Map<String, dynamic> json) =>
      const FileTypeSelfDestructingVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSelfDestructingVideo copyWith() =>
      const FileTypeSelfDestructingVideo();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSelfDestructingVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSelfDestructingVideoNote** *(fileTypeSelfDestructingVideoNote)* - child of FileType
///
/// The file is a self-destructing video note in a private chat.
final class FileTypeSelfDestructingVideoNote extends FileType {
  /// **FileTypeSelfDestructingVideoNote** *(fileTypeSelfDestructingVideoNote)* - child of FileType
  ///
  /// The file is a self-destructing video note in a private chat.
  const FileTypeSelfDestructingVideoNote();

  /// Parse from a json
  factory FileTypeSelfDestructingVideoNote.fromJson(
          Map<String, dynamic> json) =>
      const FileTypeSelfDestructingVideoNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSelfDestructingVideoNote copyWith() =>
      const FileTypeSelfDestructingVideoNote();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSelfDestructingVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSelfDestructingVoiceNote** *(fileTypeSelfDestructingVoiceNote)* - child of FileType
///
/// The file is a self-destructing voice note in a private chat.
final class FileTypeSelfDestructingVoiceNote extends FileType {
  /// **FileTypeSelfDestructingVoiceNote** *(fileTypeSelfDestructingVoiceNote)* - child of FileType
  ///
  /// The file is a self-destructing voice note in a private chat.
  const FileTypeSelfDestructingVoiceNote();

  /// Parse from a json
  factory FileTypeSelfDestructingVoiceNote.fromJson(
          Map<String, dynamic> json) =>
      const FileTypeSelfDestructingVoiceNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSelfDestructingVoiceNote copyWith() =>
      const FileTypeSelfDestructingVoiceNote();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSelfDestructingVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeSticker** *(fileTypeSticker)* - child of FileType
///
/// The file is a sticker.
final class FileTypeSticker extends FileType {
  /// **FileTypeSticker** *(fileTypeSticker)* - child of FileType
  ///
  /// The file is a sticker.
  const FileTypeSticker();

  /// Parse from a json
  factory FileTypeSticker.fromJson(Map<String, dynamic> json) =>
      const FileTypeSticker();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeSticker copyWith() => const FileTypeSticker();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeThumbnail** *(fileTypeThumbnail)* - child of FileType
///
/// The file is a thumbnail of another file.
final class FileTypeThumbnail extends FileType {
  /// **FileTypeThumbnail** *(fileTypeThumbnail)* - child of FileType
  ///
  /// The file is a thumbnail of another file.
  const FileTypeThumbnail();

  /// Parse from a json
  factory FileTypeThumbnail.fromJson(Map<String, dynamic> json) =>
      const FileTypeThumbnail();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeThumbnail copyWith() => const FileTypeThumbnail();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeThumbnail';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeUnknown** *(fileTypeUnknown)* - child of FileType
///
/// The file type is not yet known.
final class FileTypeUnknown extends FileType {
  /// **FileTypeUnknown** *(fileTypeUnknown)* - child of FileType
  ///
  /// The file type is not yet known.
  const FileTypeUnknown();

  /// Parse from a json
  factory FileTypeUnknown.fromJson(Map<String, dynamic> json) =>
      const FileTypeUnknown();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeUnknown copyWith() => const FileTypeUnknown();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeUnknown';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeVideo** *(fileTypeVideo)* - child of FileType
///
/// The file is a video.
final class FileTypeVideo extends FileType {
  /// **FileTypeVideo** *(fileTypeVideo)* - child of FileType
  ///
  /// The file is a video.
  const FileTypeVideo();

  /// Parse from a json
  factory FileTypeVideo.fromJson(Map<String, dynamic> json) =>
      const FileTypeVideo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeVideo copyWith() => const FileTypeVideo();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeVideoNote** *(fileTypeVideoNote)* - child of FileType
///
/// The file is a video note.
final class FileTypeVideoNote extends FileType {
  /// **FileTypeVideoNote** *(fileTypeVideoNote)* - child of FileType
  ///
  /// The file is a video note.
  const FileTypeVideoNote();

  /// Parse from a json
  factory FileTypeVideoNote.fromJson(Map<String, dynamic> json) =>
      const FileTypeVideoNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeVideoNote copyWith() => const FileTypeVideoNote();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeVideoNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeVideoStory** *(fileTypeVideoStory)* - child of FileType
///
/// The file is a video published as a story.
final class FileTypeVideoStory extends FileType {
  /// **FileTypeVideoStory** *(fileTypeVideoStory)* - child of FileType
  ///
  /// The file is a video published as a story.
  const FileTypeVideoStory();

  /// Parse from a json
  factory FileTypeVideoStory.fromJson(Map<String, dynamic> json) =>
      const FileTypeVideoStory();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeVideoStory copyWith() => const FileTypeVideoStory();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeVideoStory';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeVoiceNote** *(fileTypeVoiceNote)* - child of FileType
///
/// The file is a voice note.
final class FileTypeVoiceNote extends FileType {
  /// **FileTypeVoiceNote** *(fileTypeVoiceNote)* - child of FileType
  ///
  /// The file is a voice note.
  const FileTypeVoiceNote();

  /// Parse from a json
  factory FileTypeVoiceNote.fromJson(Map<String, dynamic> json) =>
      const FileTypeVoiceNote();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeVoiceNote copyWith() => const FileTypeVoiceNote();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeVoiceNote';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **FileTypeWallpaper** *(fileTypeWallpaper)* - child of FileType
///
/// The file is a wallpaper or a background pattern.
final class FileTypeWallpaper extends FileType {
  /// **FileTypeWallpaper** *(fileTypeWallpaper)* - child of FileType
  ///
  /// The file is a wallpaper or a background pattern.
  const FileTypeWallpaper();

  /// Parse from a json
  factory FileTypeWallpaper.fromJson(Map<String, dynamic> json) =>
      const FileTypeWallpaper();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  FileTypeWallpaper copyWith() => const FileTypeWallpaper();

  /// TDLib object type
  static const String defaultObjectId = 'fileTypeWallpaper';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
