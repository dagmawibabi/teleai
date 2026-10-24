part of '../tdapi.dart';

/// **StoryContent** *(storyContent)* - parent
///
/// Contains the content of a story.
sealed class StoryContent extends TdObject {
  /// **StoryContent** *(storyContent)* - parent
  ///
  /// Contains the content of a story.
  const StoryContent();

  /// a StoryContent return type can be :
  /// * [StoryContentPhoto]
  /// * [StoryContentVideo]
  /// * [StoryContentLive]
  /// * [StoryContentUnsupported]
  factory StoryContent.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case StoryContentPhoto.defaultObjectId:
        return StoryContentPhoto.fromJson(json);
      case StoryContentVideo.defaultObjectId:
        return StoryContentVideo.fromJson(json);
      case StoryContentLive.defaultObjectId:
        return StoryContentLive.fromJson(json);
      case StoryContentUnsupported.defaultObjectId:
        return StoryContentUnsupported.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of StoryContent)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  StoryContent copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'storyContent';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentPhoto** *(storyContentPhoto)* - child of StoryContent
///
/// A photo story.
///
/// * [photo]: The photo.
final class StoryContentPhoto extends StoryContent {
  /// **StoryContentPhoto** *(storyContentPhoto)* - child of StoryContent
  ///
  /// A photo story.
  ///
  /// * [photo]: The photo.
  const StoryContentPhoto({
    required this.photo,
  });

  /// The photo
  final Photo photo;

  /// Parse from a json
  factory StoryContentPhoto.fromJson(Map<String, dynamic> json) =>
      StoryContentPhoto(
        photo: Photo.fromJson(json['photo']),
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
  /// * [photo]: The photo
  @override
  StoryContentPhoto copyWith({
    Photo? photo,
  }) =>
      StoryContentPhoto(
        photo: photo ?? this.photo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyContentPhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentVideo** *(storyContentVideo)* - child of StoryContent
///
/// A video story.
///
/// * [video]: The video in MPEG4 format.
/// * [alternativeVideo]: Alternative version of the video in MPEG4 format, encoded with H.264 codec; may be null *(optional)*.
final class StoryContentVideo extends StoryContent {
  /// **StoryContentVideo** *(storyContentVideo)* - child of StoryContent
  ///
  /// A video story.
  ///
  /// * [video]: The video in MPEG4 format.
  /// * [alternativeVideo]: Alternative version of the video in MPEG4 format, encoded with H.264 codec; may be null *(optional)*.
  const StoryContentVideo({
    required this.video,
    this.alternativeVideo,
  });

  /// The video in MPEG4 format
  final StoryVideo video;

  /// Alternative version of the video in MPEG4 format, encoded with H.264 codec; may be null
  final StoryVideo? alternativeVideo;

  /// Parse from a json
  factory StoryContentVideo.fromJson(Map<String, dynamic> json) =>
      StoryContentVideo(
        video: StoryVideo.fromJson(json['video']),
        alternativeVideo: json['alternative_video'] == null
            ? null
            : StoryVideo.fromJson(json['alternative_video']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video.toJson(),
      "alternative_video": alternativeVideo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: The video in MPEG4 format
  /// * [alternative_video]: Alternative version of the video in MPEG4 format, encoded with H.264 codec; may be null
  @override
  StoryContentVideo copyWith({
    StoryVideo? video,
    StoryVideo? alternativeVideo,
  }) =>
      StoryContentVideo(
        video: video ?? this.video,
        alternativeVideo: alternativeVideo ?? this.alternativeVideo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyContentVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentLive** *(storyContentLive)* - child of StoryContent
///
/// A live story.
///
/// * [groupCallId]: Identifier of the corresponding group call. The group call can be received through the method getGroupCall.
/// * [isRtmpStream]: True, if the call is an RTMP stream instead of an ordinary group call.
final class StoryContentLive extends StoryContent {
  /// **StoryContentLive** *(storyContentLive)* - child of StoryContent
  ///
  /// A live story.
  ///
  /// * [groupCallId]: Identifier of the corresponding group call. The group call can be received through the method getGroupCall.
  /// * [isRtmpStream]: True, if the call is an RTMP stream instead of an ordinary group call.
  const StoryContentLive({
    required this.groupCallId,
    required this.isRtmpStream,
  });

  /// Identifier of the corresponding group call. The group call can be received through the method getGroupCall
  final int groupCallId;

  /// True, if the call is an RTMP stream instead of an ordinary group call
  final bool isRtmpStream;

  /// Parse from a json
  factory StoryContentLive.fromJson(Map<String, dynamic> json) =>
      StoryContentLive(
        groupCallId: json['group_call_id'],
        isRtmpStream: json['is_rtmp_stream'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "is_rtmp_stream": isRtmpStream,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the corresponding group call. The group call can be received through the method getGroupCall
  /// * [is_rtmp_stream]: True, if the call is an RTMP stream instead of an ordinary group call
  @override
  StoryContentLive copyWith({
    int? groupCallId,
    bool? isRtmpStream,
  }) =>
      StoryContentLive(
        groupCallId: groupCallId ?? this.groupCallId,
        isRtmpStream: isRtmpStream ?? this.isRtmpStream,
      );

  /// TDLib object type
  static const String defaultObjectId = 'storyContentLive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **StoryContentUnsupported** *(storyContentUnsupported)* - child of StoryContent
///
/// A story content that is not supported in the current TDLib version.
final class StoryContentUnsupported extends StoryContent {
  /// **StoryContentUnsupported** *(storyContentUnsupported)* - child of StoryContent
  ///
  /// A story content that is not supported in the current TDLib version.
  const StoryContentUnsupported();

  /// Parse from a json
  factory StoryContentUnsupported.fromJson(Map<String, dynamic> json) =>
      const StoryContentUnsupported();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  StoryContentUnsupported copyWith() => const StoryContentUnsupported();

  /// TDLib object type
  static const String defaultObjectId = 'storyContentUnsupported';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
