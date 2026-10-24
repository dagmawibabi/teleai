part of '../tdapi.dart';

/// **ParseMarkdown** *(parseMarkdown)* - TDLib function
///
/// Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously.
///
/// * [text]: The text to parse. For example, "__italic__.
///
/// [FormattedText] is returned on completion.
final class ParseMarkdown extends TdFunction {
  /// **ParseMarkdown** *(parseMarkdown)* - TDLib function
  ///
  /// Parses Markdown entities in a human-friendly format, ignoring markup errors. Can be called synchronously.
  ///
  /// * [text]: The text to parse. For example, "__italic__.
  ///
  /// [FormattedText] is returned on completion.
  const ParseMarkdown({
    required this.text,
  });

  /// The text to parse. For example, "__italic__
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
  /// * [text]: The text to parse. For example, "__italic__
  ParseMarkdown copyWith({
    FormattedText? text,
  }) =>
      ParseMarkdown(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'parseMarkdown';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
