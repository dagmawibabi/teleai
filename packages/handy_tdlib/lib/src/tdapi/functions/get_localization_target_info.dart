part of '../tdapi.dart';

/// **GetLocalizationTargetInfo** *(getLocalizationTargetInfo)* - TDLib function
///
/// Returns information about the current localization target. This is an offline method if only_local is true. Can be called before authorization.
///
/// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
///
/// [LocalizationTargetInfo] is returned on completion.
final class GetLocalizationTargetInfo extends TdFunction {
  /// **GetLocalizationTargetInfo** *(getLocalizationTargetInfo)* - TDLib function
  ///
  /// Returns information about the current localization target. This is an offline method if only_local is true. Can be called before authorization.
  ///
  /// * [onlyLocal]: Pass true to get only locally available information without sending network requests.
  ///
  /// [LocalizationTargetInfo] is returned on completion.
  const GetLocalizationTargetInfo({
    required this.onlyLocal,
  });

  /// Pass true to get only locally available information without sending network requests
  final bool onlyLocal;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "only_local": onlyLocal,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [only_local]: Pass true to get only locally available information without sending network requests
  GetLocalizationTargetInfo copyWith({
    bool? onlyLocal,
  }) =>
      GetLocalizationTargetInfo(
        onlyLocal: onlyLocal ?? this.onlyLocal,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getLocalizationTargetInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
