part of '../tdapi.dart';

/// **SetCustomLanguagePackString** *(setCustomLanguagePackString)* - TDLib function
///
/// Adds, edits, or deletes a string in a custom local language pack. Can be called before authorization.
///
/// * [languagePackId]: Identifier of a previously added custom local language pack in the current localization target.
/// * [newString]: New language pack string.
///
/// [Ok] is returned on completion.
final class SetCustomLanguagePackString extends TdFunction {
  /// **SetCustomLanguagePackString** *(setCustomLanguagePackString)* - TDLib function
  ///
  /// Adds, edits, or deletes a string in a custom local language pack. Can be called before authorization.
  ///
  /// * [languagePackId]: Identifier of a previously added custom local language pack in the current localization target.
  /// * [newString]: New language pack string.
  ///
  /// [Ok] is returned on completion.
  const SetCustomLanguagePackString({
    required this.languagePackId,
    required this.newString,
  });

  /// Identifier of a previously added custom local language pack in the current localization target
  final String languagePackId;

  /// New language pack string
  final LanguagePackString newString;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "language_pack_id": languagePackId,
      "new_string": newString.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_pack_id]: Identifier of a previously added custom local language pack in the current localization target
  /// * [new_string]: New language pack string
  SetCustomLanguagePackString copyWith({
    String? languagePackId,
    LanguagePackString? newString,
  }) =>
      SetCustomLanguagePackString(
        languagePackId: languagePackId ?? this.languagePackId,
        newString: newString ?? this.newString,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setCustomLanguagePackString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
