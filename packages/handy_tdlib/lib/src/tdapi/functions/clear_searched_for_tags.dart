part of '../tdapi.dart';

/// **ClearSearchedForTags** *(clearSearchedForTags)* - TDLib function
///
/// Clears the list of recently searched for hashtags or cashtags.
///
/// * [clearCashtags]: Pass true to clear the list of recently searched for cashtags; otherwise, the list of recently searched for hashtags will be cleared.
///
/// [Ok] is returned on completion.
final class ClearSearchedForTags extends TdFunction {
  /// **ClearSearchedForTags** *(clearSearchedForTags)* - TDLib function
  ///
  /// Clears the list of recently searched for hashtags or cashtags.
  ///
  /// * [clearCashtags]: Pass true to clear the list of recently searched for cashtags; otherwise, the list of recently searched for hashtags will be cleared.
  ///
  /// [Ok] is returned on completion.
  const ClearSearchedForTags({
    required this.clearCashtags,
  });

  /// Pass true to clear the list of recently searched for cashtags; otherwise, the list of recently searched for hashtags will be cleared
  final bool clearCashtags;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "clear_cashtags": clearCashtags,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [clear_cashtags]: Pass true to clear the list of recently searched for cashtags; otherwise, the list of recently searched for hashtags will be cleared
  ClearSearchedForTags copyWith({
    bool? clearCashtags,
  }) =>
      ClearSearchedForTags(
        clearCashtags: clearCashtags ?? this.clearCashtags,
      );

  /// TDLib object type
  static const String defaultObjectId = 'clearSearchedForTags';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
