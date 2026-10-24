part of '../tdapi.dart';

/// **FixedText** *(fixedText)* - basic class
///
/// A text fixed using fixTextWithAi.
///
/// * [text]: The resulting text.
/// * [diffText]: Changes made to the original text.
final class FixedText extends TdObject {
  /// **FixedText** *(fixedText)* - basic class
  ///
  /// A text fixed using fixTextWithAi.
  ///
  /// * [text]: The resulting text.
  /// * [diffText]: Changes made to the original text.
  const FixedText({
    required this.text,
    required this.diffText,
    this.extra,
    this.clientId,
  });

  /// The resulting text
  final FormattedText text;

  /// Changes made to the original text
  final DiffText diffText;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FixedText.fromJson(Map<String, dynamic> json) => FixedText(
        text: FormattedText.fromJson(json['text']),
        diffText: DiffText.fromJson(json['diff_text']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "diff_text": diffText.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The resulting text
  /// * [diff_text]: Changes made to the original text
  FixedText copyWith({
    FormattedText? text,
    DiffText? diffText,
    dynamic extra,
    int? clientId,
  }) =>
      FixedText(
        text: text ?? this.text,
        diffText: diffText ?? this.diffText,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'fixedText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
