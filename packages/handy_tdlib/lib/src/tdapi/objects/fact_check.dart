part of '../tdapi.dart';

/// **FactCheck** *(factCheck)* - basic class
///
/// Describes a fact-check added to the message by an independent checker.
///
/// * [text]: Text of the fact-check.
/// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code of the country for which the fact-check is shown.
final class FactCheck extends TdObject {
  /// **FactCheck** *(factCheck)* - basic class
  ///
  /// Describes a fact-check added to the message by an independent checker.
  ///
  /// * [text]: Text of the fact-check.
  /// * [countryCode]: A two-letter ISO 3166-1 alpha-2 country code of the country for which the fact-check is shown.
  const FactCheck({
    required this.text,
    required this.countryCode,
  });

  /// Text of the fact-check
  final FormattedText text;

  /// A two-letter ISO 3166-1 alpha-2 country code of the country for which the fact-check is shown
  final String countryCode;

  /// Parse from a json
  factory FactCheck.fromJson(Map<String, dynamic> json) => FactCheck(
        text: FormattedText.fromJson(json['text']),
        countryCode: json['country_code'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "country_code": countryCode,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Text of the fact-check
  /// * [country_code]: A two-letter ISO 3166-1 alpha-2 country code of the country for which the fact-check is shown
  FactCheck copyWith({
    FormattedText? text,
    String? countryCode,
  }) =>
      FactCheck(
        text: text ?? this.text,
        countryCode: countryCode ?? this.countryCode,
      );

  /// TDLib object type
  static const String defaultObjectId = 'factCheck';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
