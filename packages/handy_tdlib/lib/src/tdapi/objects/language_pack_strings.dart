part of '../tdapi.dart';

/// **LanguagePackStrings** *(languagePackStrings)* - basic class
///
/// Contains a list of language pack strings.
///
/// * [strings]: A list of language pack strings.
final class LanguagePackStrings extends TdObject {
  /// **LanguagePackStrings** *(languagePackStrings)* - basic class
  ///
  /// Contains a list of language pack strings.
  ///
  /// * [strings]: A list of language pack strings.
  const LanguagePackStrings({
    required this.strings,
    this.extra,
    this.clientId,
  });

  /// A list of language pack strings
  final List<LanguagePackString> strings;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LanguagePackStrings.fromJson(Map<String, dynamic> json) =>
      LanguagePackStrings(
        strings: List<LanguagePackString>.from((json['strings'] ?? [])
            .map((item) => LanguagePackString.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "strings": strings.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [strings]: A list of language pack strings
  LanguagePackStrings copyWith({
    List<LanguagePackString>? strings,
    dynamic extra,
    int? clientId,
  }) =>
      LanguagePackStrings(
        strings: strings ?? this.strings,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'languagePackStrings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
