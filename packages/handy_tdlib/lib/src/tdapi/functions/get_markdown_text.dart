part of '../tdapi.dart';

/// **GetMarkdownText** *(getMarkdownText)* - TDLib function
///
/// Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously.
///
/// * [text]: The text.
///
/// [FormattedText] is returned on completion.
final class GetMarkdownText extends TdFunction {
  /// **GetMarkdownText** *(getMarkdownText)* - TDLib function
  ///
  /// Replaces text entities with Markdown formatting in a human-friendly format. Entities that can't be represented in Markdown unambiguously are kept as is. Can be called synchronously.
  ///
  /// * [text]: The text.
  ///
  /// [FormattedText] is returned on completion.
  const GetMarkdownText({
    required this.text,
  });

  /// The text
  final FormattedText text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The text
  GetMarkdownText copyWith({
    FormattedText? text,
  }) =>
      GetMarkdownText(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getMarkdownText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
