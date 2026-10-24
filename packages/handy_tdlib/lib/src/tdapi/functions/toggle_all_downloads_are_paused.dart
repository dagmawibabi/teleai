part of '../tdapi.dart';

/// **ToggleAllDownloadsArePaused** *(toggleAllDownloadsArePaused)* - TDLib function
///
/// Changes pause state of all files in the file download list.
///
/// * [arePaused]: Pass true to pause all downloads; pass false to unpause them.
///
/// [Ok] is returned on completion.
final class ToggleAllDownloadsArePaused extends TdFunction {
  /// **ToggleAllDownloadsArePaused** *(toggleAllDownloadsArePaused)* - TDLib function
  ///
  /// Changes pause state of all files in the file download list.
  ///
  /// * [arePaused]: Pass true to pause all downloads; pass false to unpause them.
  ///
  /// [Ok] is returned on completion.
  const ToggleAllDownloadsArePaused({
    required this.arePaused,
  });

  /// Pass true to pause all downloads; pass false to unpause them
  final bool arePaused;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "are_paused": arePaused,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [are_paused]: Pass true to pause all downloads; pass false to unpause them
  ToggleAllDownloadsArePaused copyWith({
    bool? arePaused,
  }) =>
      ToggleAllDownloadsArePaused(
        arePaused: arePaused ?? this.arePaused,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleAllDownloadsArePaused';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
