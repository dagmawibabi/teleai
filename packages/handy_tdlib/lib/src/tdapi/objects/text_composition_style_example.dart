part of '../tdapi.dart';

/// **TextCompositionStyleExample** *(textCompositionStyleExample)* - basic class
///
/// Contains an example of text composition style usage.
///
/// * [sourceText]: Source text.
/// * [resultText]: The text after the style was applied to the source text.
final class TextCompositionStyleExample extends TdObject {
  /// **TextCompositionStyleExample** *(textCompositionStyleExample)* - basic class
  ///
  /// Contains an example of text composition style usage.
  ///
  /// * [sourceText]: Source text.
  /// * [resultText]: The text after the style was applied to the source text.
  const TextCompositionStyleExample({
    required this.sourceText,
    required this.resultText,
    this.extra,
    this.clientId,
  });

  /// Source text
  final FormattedText sourceText;

  /// The text after the style was applied to the source text
  final FormattedText resultText;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TextCompositionStyleExample.fromJson(Map<String, dynamic> json) =>
      TextCompositionStyleExample(
        sourceText: FormattedText.fromJson(json['source_text']),
        resultText: FormattedText.fromJson(json['result_text']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "source_text": sourceText.toJson(),
      "result_text": resultText.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [source_text]: Source text
  /// * [result_text]: The text after the style was applied to the source text
  TextCompositionStyleExample copyWith({
    FormattedText? sourceText,
    FormattedText? resultText,
    dynamic extra,
    int? clientId,
  }) =>
      TextCompositionStyleExample(
        sourceText: sourceText ?? this.sourceText,
        resultText: resultText ?? this.resultText,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textCompositionStyleExample';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
