part of '../tdapi.dart';

/// **SetCustomLanguagePack** *(setCustomLanguagePack)* - TDLib function
///
/// Adds or changes a custom local language pack to the current localization target.
///
/// * [info]: Information about the language pack. Language pack identifier must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization.
/// * [strings]: Strings of the new language pack.
///
/// [Ok] is returned on completion.
final class SetCustomLanguagePack extends TdFunction {
  /// **SetCustomLanguagePack** *(setCustomLanguagePack)* - TDLib function
  ///
  /// Adds or changes a custom local language pack to the current localization target.
  ///
  /// * [info]: Information about the language pack. Language pack identifier must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization.
  /// * [strings]: Strings of the new language pack.
  ///
  /// [Ok] is returned on completion.
  const SetCustomLanguagePack({
    required this.info,
    required this.strings,
  });

  /// Information about the language pack. Language pack identifier must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
  final LanguagePackInfo info;

  /// Strings of the new language pack
  final List<LanguagePackString> strings;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "info": info.toJson(),
      "strings": strings.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [info]: Information about the language pack. Language pack identifier must start with 'X', consist only of English letters, digits and hyphens, and must not exceed 64 characters. Can be called before authorization
  /// * [strings]: Strings of the new language pack
  SetCustomLanguagePack copyWith({
    LanguagePackInfo? info,
    List<LanguagePackString>? strings,
  }) =>
      SetCustomLanguagePack(
        info: info ?? this.info,
        strings: strings ?? this.strings,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCustomLanguagePack';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
