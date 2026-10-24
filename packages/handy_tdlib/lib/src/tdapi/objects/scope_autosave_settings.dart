part of '../tdapi.dart';

/// **ScopeAutosaveSettings** *(scopeAutosaveSettings)* - basic class
///
/// Contains autosave settings for an autosave settings scope.
///
/// * [autosavePhotos]: True, if photo autosave is enabled.
/// * [autosaveVideos]: True, if video autosave is enabled.
/// * [maxVideoFileSize]: The maximum size of a video file to be autosaved, in bytes; 512 KB - 4000 MB.
final class ScopeAutosaveSettings extends TdObject {
  /// **ScopeAutosaveSettings** *(scopeAutosaveSettings)* - basic class
  ///
  /// Contains autosave settings for an autosave settings scope.
  ///
  /// * [autosavePhotos]: True, if photo autosave is enabled.
  /// * [autosaveVideos]: True, if video autosave is enabled.
  /// * [maxVideoFileSize]: The maximum size of a video file to be autosaved, in bytes; 512 KB - 4000 MB.
  const ScopeAutosaveSettings({
    required this.autosavePhotos,
    required this.autosaveVideos,
    required this.maxVideoFileSize,
  });

  /// True, if photo autosave is enabled
  final bool autosavePhotos;

  /// True, if video autosave is enabled
  final bool autosaveVideos;

  /// The maximum size of a video file to be autosaved, in bytes; 512 KB - 4000 MB
  final int maxVideoFileSize;

  /// Parse from a json
  factory ScopeAutosaveSettings.fromJson(Map<String, dynamic> json) =>
      ScopeAutosaveSettings(
        autosavePhotos: json['autosave_photos'],
        autosaveVideos: json['autosave_videos'],
        maxVideoFileSize: json['max_video_file_size'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "autosave_photos": autosavePhotos,
      "autosave_videos": autosaveVideos,
      "max_video_file_size": maxVideoFileSize,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [autosave_photos]: True, if photo autosave is enabled
  /// * [autosave_videos]: True, if video autosave is enabled
  /// * [max_video_file_size]: The maximum size of a video file to be autosaved, in bytes; 512 KB - 4000 MB
  ScopeAutosaveSettings copyWith({
    bool? autosavePhotos,
    bool? autosaveVideos,
    int? maxVideoFileSize,
  }) =>
      ScopeAutosaveSettings(
        autosavePhotos: autosavePhotos ?? this.autosavePhotos,
        autosaveVideos: autosaveVideos ?? this.autosaveVideos,
        maxVideoFileSize: maxVideoFileSize ?? this.maxVideoFileSize,
      );

  /// TDLib object type
  static const String defaultObjectId = 'scopeAutosaveSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
