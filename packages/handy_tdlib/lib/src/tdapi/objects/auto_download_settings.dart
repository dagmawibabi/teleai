part of '../tdapi.dart';

/// **AutoDownloadSettings** *(autoDownloadSettings)* - basic class
///
/// Contains auto-download settings.
///
/// * [isAutoDownloadEnabled]: True, if the auto-download is enabled.
/// * [maxPhotoFileSize]: The maximum size of a photo file to be auto-downloaded, in bytes.
/// * [maxVideoFileSize]: The maximum size of a video file to be auto-downloaded, in bytes.
/// * [maxOtherFileSize]: The maximum size of other file types to be auto-downloaded, in bytes.
/// * [videoUploadBitrate]: The maximum suggested bitrate for uploaded videos, in kbit/s.
/// * [preloadLargeVideos]: True, if the beginning of video files needs to be preloaded for instant playback.
/// * [preloadNextAudio]: True, if the next audio track needs to be preloaded while the user is listening to an audio file.
/// * [preloadStories]: True, if stories need to be preloaded.
/// * [useLessDataForCalls]: True, if "use less data for calls" option needs to be enabled.
final class AutoDownloadSettings extends TdObject {
  /// **AutoDownloadSettings** *(autoDownloadSettings)* - basic class
  ///
  /// Contains auto-download settings.
  ///
  /// * [isAutoDownloadEnabled]: True, if the auto-download is enabled.
  /// * [maxPhotoFileSize]: The maximum size of a photo file to be auto-downloaded, in bytes.
  /// * [maxVideoFileSize]: The maximum size of a video file to be auto-downloaded, in bytes.
  /// * [maxOtherFileSize]: The maximum size of other file types to be auto-downloaded, in bytes.
  /// * [videoUploadBitrate]: The maximum suggested bitrate for uploaded videos, in kbit/s.
  /// * [preloadLargeVideos]: True, if the beginning of video files needs to be preloaded for instant playback.
  /// * [preloadNextAudio]: True, if the next audio track needs to be preloaded while the user is listening to an audio file.
  /// * [preloadStories]: True, if stories need to be preloaded.
  /// * [useLessDataForCalls]: True, if "use less data for calls" option needs to be enabled.
  const AutoDownloadSettings({
    required this.isAutoDownloadEnabled,
    required this.maxPhotoFileSize,
    required this.maxVideoFileSize,
    required this.maxOtherFileSize,
    required this.videoUploadBitrate,
    required this.preloadLargeVideos,
    required this.preloadNextAudio,
    required this.preloadStories,
    required this.useLessDataForCalls,
  });

  /// True, if the auto-download is enabled
  final bool isAutoDownloadEnabled;

  /// The maximum size of a photo file to be auto-downloaded, in bytes
  final int maxPhotoFileSize;

  /// The maximum size of a video file to be auto-downloaded, in bytes
  final int maxVideoFileSize;

  /// The maximum size of other file types to be auto-downloaded, in bytes
  final int maxOtherFileSize;

  /// The maximum suggested bitrate for uploaded videos, in kbit/s
  final int videoUploadBitrate;

  /// True, if the beginning of video files needs to be preloaded for instant playback
  final bool preloadLargeVideos;

  /// True, if the next audio track needs to be preloaded while the user is listening to an audio file
  final bool preloadNextAudio;

  /// True, if stories need to be preloaded
  final bool preloadStories;

  /// True, if "use less data for calls" option needs to be enabled
  final bool useLessDataForCalls;

  /// Parse from a json
  factory AutoDownloadSettings.fromJson(Map<String, dynamic> json) =>
      AutoDownloadSettings(
        isAutoDownloadEnabled: json['is_auto_download_enabled'],
        maxPhotoFileSize: json['max_photo_file_size'],
        maxVideoFileSize: json['max_video_file_size'],
        maxOtherFileSize: json['max_other_file_size'],
        videoUploadBitrate: json['video_upload_bitrate'],
        preloadLargeVideos: json['preload_large_videos'],
        preloadNextAudio: json['preload_next_audio'],
        preloadStories: json['preload_stories'],
        useLessDataForCalls: json['use_less_data_for_calls'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_auto_download_enabled": isAutoDownloadEnabled,
      "max_photo_file_size": maxPhotoFileSize,
      "max_video_file_size": maxVideoFileSize,
      "max_other_file_size": maxOtherFileSize,
      "video_upload_bitrate": videoUploadBitrate,
      "preload_large_videos": preloadLargeVideos,
      "preload_next_audio": preloadNextAudio,
      "preload_stories": preloadStories,
      "use_less_data_for_calls": useLessDataForCalls,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_auto_download_enabled]: True, if the auto-download is enabled
  /// * [max_photo_file_size]: The maximum size of a photo file to be auto-downloaded, in bytes
  /// * [max_video_file_size]: The maximum size of a video file to be auto-downloaded, in bytes
  /// * [max_other_file_size]: The maximum size of other file types to be auto-downloaded, in bytes
  /// * [video_upload_bitrate]: The maximum suggested bitrate for uploaded videos, in kbit/s
  /// * [preload_large_videos]: True, if the beginning of video files needs to be preloaded for instant playback
  /// * [preload_next_audio]: True, if the next audio track needs to be preloaded while the user is listening to an audio file
  /// * [preload_stories]: True, if stories need to be preloaded
  /// * [use_less_data_for_calls]: True, if "use less data for calls" option needs to be enabled
  AutoDownloadSettings copyWith({
    bool? isAutoDownloadEnabled,
    int? maxPhotoFileSize,
    int? maxVideoFileSize,
    int? maxOtherFileSize,
    int? videoUploadBitrate,
    bool? preloadLargeVideos,
    bool? preloadNextAudio,
    bool? preloadStories,
    bool? useLessDataForCalls,
  }) =>
      AutoDownloadSettings(
        isAutoDownloadEnabled:
            isAutoDownloadEnabled ?? this.isAutoDownloadEnabled,
        maxPhotoFileSize: maxPhotoFileSize ?? this.maxPhotoFileSize,
        maxVideoFileSize: maxVideoFileSize ?? this.maxVideoFileSize,
        maxOtherFileSize: maxOtherFileSize ?? this.maxOtherFileSize,
        videoUploadBitrate: videoUploadBitrate ?? this.videoUploadBitrate,
        preloadLargeVideos: preloadLargeVideos ?? this.preloadLargeVideos,
        preloadNextAudio: preloadNextAudio ?? this.preloadNextAudio,
        preloadStories: preloadStories ?? this.preloadStories,
        useLessDataForCalls: useLessDataForCalls ?? this.useLessDataForCalls,
      );

  /// TDLib object type
  static const String defaultObjectId = 'autoDownloadSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
