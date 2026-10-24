part of '../tdapi.dart';

/// **InputChatPhoto** *(inputChatPhoto)* - parent
///
/// Describes a photo to be set as a user profile or chat photo.
sealed class InputChatPhoto extends TdObject {
  /// **InputChatPhoto** *(inputChatPhoto)* - parent
  ///
  /// Describes a photo to be set as a user profile or chat photo.
  const InputChatPhoto();

  /// a InputChatPhoto return type can be :
  /// * [InputChatPhotoPrevious]
  /// * [InputChatPhotoStatic]
  /// * [InputChatPhotoAnimation]
  /// * [InputChatPhotoSticker]
  factory InputChatPhoto.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputChatPhotoPrevious.defaultObjectId:
        return InputChatPhotoPrevious.fromJson(json);
      case InputChatPhotoStatic.defaultObjectId:
        return InputChatPhotoStatic.fromJson(json);
      case InputChatPhotoAnimation.defaultObjectId:
        return InputChatPhotoAnimation.fromJson(json);
      case InputChatPhotoSticker.defaultObjectId:
        return InputChatPhotoSticker.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputChatPhoto)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputChatPhoto copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputChatPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputChatPhotoPrevious** *(inputChatPhotoPrevious)* - child of InputChatPhoto
///
/// A previously used profile photo of the current user.
///
/// * [chatPhotoId]: Identifier of the current user's profile photo to reuse.
final class InputChatPhotoPrevious extends InputChatPhoto {
  /// **InputChatPhotoPrevious** *(inputChatPhotoPrevious)* - child of InputChatPhoto
  ///
  /// A previously used profile photo of the current user.
  ///
  /// * [chatPhotoId]: Identifier of the current user's profile photo to reuse.
  const InputChatPhotoPrevious({
    required this.chatPhotoId,
  });

  /// Identifier of the current user's profile photo to reuse
  final int chatPhotoId;

  /// Parse from a json
  factory InputChatPhotoPrevious.fromJson(Map<String, dynamic> json) =>
      InputChatPhotoPrevious(
        chatPhotoId: json['chat_photo_id'] is int
            ? json['chat_photo_id']
            : int.parse(json['chat_photo_id']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_photo_id": chatPhotoId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_photo_id]: Identifier of the current user's profile photo to reuse
  @override
  InputChatPhotoPrevious copyWith({
    int? chatPhotoId,
  }) =>
      InputChatPhotoPrevious(
        chatPhotoId: chatPhotoId ?? this.chatPhotoId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChatPhotoPrevious';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputChatPhotoStatic** *(inputChatPhotoStatic)* - child of InputChatPhoto
///
/// A static photo in JPEG format.
///
/// * [photo]: Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed.
final class InputChatPhotoStatic extends InputChatPhoto {
  /// **InputChatPhotoStatic** *(inputChatPhotoStatic)* - child of InputChatPhoto
  ///
  /// A static photo in JPEG format.
  ///
  /// * [photo]: Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed.
  const InputChatPhotoStatic({
    required this.photo,
  });

  /// Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
  final InputFile photo;

  /// Parse from a json
  factory InputChatPhotoStatic.fromJson(Map<String, dynamic> json) =>
      InputChatPhotoStatic(
        photo: InputFile.fromJson(json['photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "photo": photo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [photo]: Photo to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
  @override
  InputChatPhotoStatic copyWith({
    InputFile? photo,
  }) =>
      InputChatPhotoStatic(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChatPhotoStatic';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputChatPhotoAnimation** *(inputChatPhotoAnimation)* - child of InputChatPhoto
///
/// An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 1280 and be at most 2MB in size.
///
/// * [animation]: Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed.
/// * [mainFrameTimestamp]: Timestamp of the frame, which will be used as static chat photo.
final class InputChatPhotoAnimation extends InputChatPhoto {
  /// **InputChatPhotoAnimation** *(inputChatPhotoAnimation)* - child of InputChatPhoto
  ///
  /// An animation in MPEG4 format; must be square, at most 10 seconds long, have width between 160 and 1280 and be at most 2MB in size.
  ///
  /// * [animation]: Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed.
  /// * [mainFrameTimestamp]: Timestamp of the frame, which will be used as static chat photo.
  const InputChatPhotoAnimation({
    required this.animation,
    required this.mainFrameTimestamp,
  });

  /// Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
  final InputFile animation;

  /// Timestamp of the frame, which will be used as static chat photo
  final double mainFrameTimestamp;

  /// Parse from a json
  factory InputChatPhotoAnimation.fromJson(Map<String, dynamic> json) =>
      InputChatPhotoAnimation(
        animation: InputFile.fromJson(json['animation']),
        mainFrameTimestamp: json['main_frame_timestamp'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "animation": animation.toJson(),
      "main_frame_timestamp": mainFrameTimestamp,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [animation]: Animation to be set as profile photo. Only inputFileLocal and inputFileGenerated are allowed
  /// * [main_frame_timestamp]: Timestamp of the frame, which will be used as static chat photo
  @override
  InputChatPhotoAnimation copyWith({
    InputFile? animation,
    double? mainFrameTimestamp,
  }) =>
      InputChatPhotoAnimation(
        animation: animation ?? this.animation,
        mainFrameTimestamp: mainFrameTimestamp ?? this.mainFrameTimestamp,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChatPhotoAnimation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputChatPhotoSticker** *(inputChatPhotoSticker)* - child of InputChatPhoto
///
/// A sticker on a custom background.
///
/// * [sticker]: Information about the sticker.
final class InputChatPhotoSticker extends InputChatPhoto {
  /// **InputChatPhotoSticker** *(inputChatPhotoSticker)* - child of InputChatPhoto
  ///
  /// A sticker on a custom background.
  ///
  /// * [sticker]: Information about the sticker.
  const InputChatPhotoSticker({
    required this.sticker,
  });

  /// Information about the sticker
  final ChatPhotoSticker sticker;

  /// Parse from a json
  factory InputChatPhotoSticker.fromJson(Map<String, dynamic> json) =>
      InputChatPhotoSticker(
        sticker: ChatPhotoSticker.fromJson(json['sticker']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sticker": sticker.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sticker]: Information about the sticker
  @override
  InputChatPhotoSticker copyWith({
    ChatPhotoSticker? sticker,
  }) =>
      InputChatPhotoSticker(
        sticker: sticker ?? this.sticker,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputChatPhotoSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
