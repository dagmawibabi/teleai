part of '../tdapi.dart';

/// **ToggleDownloadIsPaused** *(toggleDownloadIsPaused)* - TDLib function
///
/// Changes pause state of a file in the file download list.
///
/// * [fileId]: Identifier of the downloaded file.
/// * [isPaused]: Pass true if the download is paused.
///
/// [Ok] is returned on completion.
final class ToggleDownloadIsPaused extends TdFunction {
  /// **ToggleDownloadIsPaused** *(toggleDownloadIsPaused)* - TDLib function
  ///
  /// Changes pause state of a file in the file download list.
  ///
  /// * [fileId]: Identifier of the downloaded file.
  /// * [isPaused]: Pass true if the download is paused.
  ///
  /// [Ok] is returned on completion.
  const ToggleDownloadIsPaused({
    required this.fileId,
    required this.isPaused,
  });

  /// Identifier of the downloaded file
  final int fileId;

  /// Pass true if the download is paused
  final bool isPaused;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "file_id": fileId,
      "is_paused": isPaused,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [file_id]: Identifier of the downloaded file
  /// * [is_paused]: Pass true if the download is paused
  ToggleDownloadIsPaused copyWith({
    int? fileId,
    bool? isPaused,
  }) =>
      ToggleDownloadIsPaused(
        fileId: fileId ?? this.fileId,
        isPaused: isPaused ?? this.isPaused,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleDownloadIsPaused';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
