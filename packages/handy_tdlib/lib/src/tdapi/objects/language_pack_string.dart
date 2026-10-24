part of '../tdapi.dart';

/// **LanguagePackString** *(languagePackString)* - basic class
///
/// Represents one language pack string.
///
/// * [key]: String key.
/// * [value]: String value; pass null if the string needs to be taken from the built-in English language pack *(optional)*.
final class LanguagePackString extends TdObject {
  /// **LanguagePackString** *(languagePackString)* - basic class
  ///
  /// Represents one language pack string.
  ///
  /// * [key]: String key.
  /// * [value]: String value; pass null if the string needs to be taken from the built-in English language pack *(optional)*.
  const LanguagePackString({
    required this.key,
    this.value,
  });

  /// String key
  final String key;

  /// String value; pass null if the string needs to be taken from the built-in English language pack
  final LanguagePackStringValue? value;

  /// Parse from a json
  factory LanguagePackString.fromJson(Map<String, dynamic> json) =>
      LanguagePackString(
        key: json['key'],
        value: json['value'] == null
            ? null
            : LanguagePackStringValue.fromJson(json['value']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "key": key,
      "value": value?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [key]: String key
  /// * [value]: String value; pass null if the string needs to be taken from the built-in English language pack
  LanguagePackString copyWith({
    String? key,
    LanguagePackStringValue? value,
  }) =>
      LanguagePackString(
        key: key ?? this.key,
        value: value ?? this.value,
      );

  /// TDLib object type
  static const String defaultObjectId = 'languagePackString';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
