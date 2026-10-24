part of '../tdapi.dart';

/// **InputPaidMediaType** *(inputPaidMediaType)* - parent
///
/// Describes type of paid media to send.
sealed class InputPaidMediaType extends TdObject {
  /// **InputPaidMediaType** *(inputPaidMediaType)* - parent
  ///
  /// Describes type of paid media to send.
  const InputPaidMediaType();

  /// a InputPaidMediaType return type can be :
  /// * [InputPaidMediaTypePhoto]
  /// * [InputPaidMediaTypeVideo]
  factory InputPaidMediaType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case InputPaidMediaTypePhoto.defaultObjectId:
        return InputPaidMediaTypePhoto.fromJson(json);
      case InputPaidMediaTypeVideo.defaultObjectId:
        return InputPaidMediaTypeVideo.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of InputPaidMediaType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  InputPaidMediaType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'inputPaidMediaType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPaidMediaTypePhoto** *(inputPaidMediaTypePhoto)* - child of InputPaidMediaType
///
/// The media is a photo. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20.
///
/// * [video]: Video of the live photo; pass null if the photo isn't a live photo *(optional)*.
final class InputPaidMediaTypePhoto extends InputPaidMediaType {
  /// **InputPaidMediaTypePhoto** *(inputPaidMediaTypePhoto)* - child of InputPaidMediaType
  ///
  /// The media is a photo. The photo must be at most 10 MB in size. The photo's width and height must not exceed 10000 in total. Width and height ratio must be at most 20.
  ///
  /// * [video]: Video of the live photo; pass null if the photo isn't a live photo *(optional)*.
  const InputPaidMediaTypePhoto({
    this.video,
  });

  /// Video of the live photo; pass null if the photo isn't a live photo
  final InputFile? video;

  /// Parse from a json
  factory InputPaidMediaTypePhoto.fromJson(Map<String, dynamic> json) =>
      InputPaidMediaTypePhoto(
        video: json['video'] == null ? null : InputFile.fromJson(json['video']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "video": video?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [video]: Video of the live photo; pass null if the photo isn't a live photo
  @override
  InputPaidMediaTypePhoto copyWith({
    InputFile? video,
  }) =>
      InputPaidMediaTypePhoto(
        video: video ?? this.video,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPaidMediaTypePhoto';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **InputPaidMediaTypeVideo** *(inputPaidMediaTypeVideo)* - child of InputPaidMediaType
///
/// The media is a video.
///
/// * [cover]: Cover of the video; pass null to skip cover uploading *(optional)*.
/// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
/// * [duration]: Duration of the video, in seconds.
/// * [supportsStreaming]: True, if the video is expected to be streamed.
final class InputPaidMediaTypeVideo extends InputPaidMediaType {
  /// **InputPaidMediaTypeVideo** *(inputPaidMediaTypeVideo)* - child of InputPaidMediaType
  ///
  /// The media is a video.
  ///
  /// * [cover]: Cover of the video; pass null to skip cover uploading *(optional)*.
  /// * [startTimestamp]: Timestamp from which the video playing must start, in seconds.
  /// * [duration]: Duration of the video, in seconds.
  /// * [supportsStreaming]: True, if the video is expected to be streamed.
  const InputPaidMediaTypeVideo({
    this.cover,
    required this.startTimestamp,
    required this.duration,
    required this.supportsStreaming,
  });

  /// Cover of the video; pass null to skip cover uploading
  final InputFile? cover;

  /// Timestamp from which the video playing must start, in seconds
  final int startTimestamp;

  /// Duration of the video, in seconds
  final int duration;

  /// True, if the video is expected to be streamed
  final bool supportsStreaming;

  /// Parse from a json
  factory InputPaidMediaTypeVideo.fromJson(Map<String, dynamic> json) =>
      InputPaidMediaTypeVideo(
        cover: json['cover'] == null ? null : InputFile.fromJson(json['cover']),
        startTimestamp: json['start_timestamp'],
        duration: json['duration'],
        supportsStreaming: json['supports_streaming'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "cover": cover?.toJson(),
      "start_timestamp": startTimestamp,
      "duration": duration,
      "supports_streaming": supportsStreaming,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [cover]: Cover of the video; pass null to skip cover uploading
  /// * [start_timestamp]: Timestamp from which the video playing must start, in seconds
  /// * [duration]: Duration of the video, in seconds
  /// * [supports_streaming]: True, if the video is expected to be streamed
  @override
  InputPaidMediaTypeVideo copyWith({
    InputFile? cover,
    int? startTimestamp,
    int? duration,
    bool? supportsStreaming,
  }) =>
      InputPaidMediaTypeVideo(
        cover: cover ?? this.cover,
        startTimestamp: startTimestamp ?? this.startTimestamp,
        duration: duration ?? this.duration,
        supportsStreaming: supportsStreaming ?? this.supportsStreaming,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputPaidMediaTypeVideo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
