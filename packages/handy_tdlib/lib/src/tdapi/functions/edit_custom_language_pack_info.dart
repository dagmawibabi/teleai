part of '../tdapi.dart';

/// **EditCustomLanguagePackInfo** *(editCustomLanguagePackInfo)* - TDLib function
///
/// Edits information about a custom local language pack in the current localization target. Can be called before authorization.
///
/// * [info]: New information about the custom local language pack.
///
/// [Ok] is returned on completion.
final class EditCustomLanguagePackInfo extends TdFunction {
  /// **EditCustomLanguagePackInfo** *(editCustomLanguagePackInfo)* - TDLib function
  ///
  /// Edits information about a custom local language pack in the current localization target. Can be called before authorization.
  ///
  /// * [info]: New information about the custom local language pack.
  ///
  /// [Ok] is returned on completion.
  const EditCustomLanguagePackInfo({
    required this.info,
  });

  /// New information about the custom local language pack
  final LanguagePackInfo info;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "info": info.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [info]: New information about the custom local language pack
  EditCustomLanguagePackInfo copyWith({
    LanguagePackInfo? info,
  }) =>
      EditCustomLanguagePackInfo(
        info: info ?? this.info,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editCustomLanguagePackInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
