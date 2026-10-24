part of '../tdapi.dart';

/// **StartGroupCallRecording** *(startGroupCallRecording)* - TDLib function
///
/// Starts recording of an active group call; for video chats only. Requires groupCall.can_be_managed right.
///
/// * [groupCallId]: Group call identifier.
/// * [title]: Group call recording title; 0-64 characters.
/// * [recordVideo]: Pass true to record a video file instead of an audio file.
/// * [usePortraitOrientation]: Pass true to use portrait orientation for video instead of landscape one.
///
/// [Ok] is returned on completion.
final class StartGroupCallRecording extends TdFunction {
  /// **StartGroupCallRecording** *(startGroupCallRecording)* - TDLib function
  ///
  /// Starts recording of an active group call; for video chats only. Requires groupCall.can_be_managed right.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [title]: Group call recording title; 0-64 characters.
  /// * [recordVideo]: Pass true to record a video file instead of an audio file.
  /// * [usePortraitOrientation]: Pass true to use portrait orientation for video instead of landscape one.
  ///
  /// [Ok] is returned on completion.
  const StartGroupCallRecording({
    required this.groupCallId,
    required this.title,
    required this.recordVideo,
    required this.usePortraitOrientation,
  });

  /// Group call identifier
  final int groupCallId;

  /// Group call recording title; 0-64 characters
  final String title;

  /// Pass true to record a video file instead of an audio file
  final bool recordVideo;

  /// Pass true to use portrait orientation for video instead of landscape one
  final bool usePortraitOrientation;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "title": title,
      "record_video": recordVideo,
      "use_portrait_orientation": usePortraitOrientation,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [title]: Group call recording title; 0-64 characters
  /// * [record_video]: Pass true to record a video file instead of an audio file
  /// * [use_portrait_orientation]: Pass true to use portrait orientation for video instead of landscape one
  StartGroupCallRecording copyWith({
    int? groupCallId,
    String? title,
    bool? recordVideo,
    bool? usePortraitOrientation,
  }) =>
      StartGroupCallRecording(
        groupCallId: groupCallId ?? this.groupCallId,
        title: title ?? this.title,
        recordVideo: recordVideo ?? this.recordVideo,
        usePortraitOrientation:
            usePortraitOrientation ?? this.usePortraitOrientation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'startGroupCallRecording';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
