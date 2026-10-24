part of '../tdapi.dart';

/// **FormattedText** *(formattedText)* - basic class
///
/// A text with some entities.
///
/// * [text]: The text.
/// * [entities]: Entities contained in the text. Entities can be nested, but must not mutually intersect with each other.. Pre, Code, PreCode, and DateTime entities can't contain other entities. BlockQuote entities can't contain other BlockQuote entities.. Bold, Italic, Underline, Strikethrough, and Spoiler entities can contain and can be part of any other entities.. All other entities can't contain each other.
final class FormattedText extends TdObject {
  /// **FormattedText** *(formattedText)* - basic class
  ///
  /// A text with some entities.
  ///
  /// * [text]: The text.
  /// * [entities]: Entities contained in the text. Entities can be nested, but must not mutually intersect with each other.. Pre, Code, PreCode, and DateTime entities can't contain other entities. BlockQuote entities can't contain other BlockQuote entities.. Bold, Italic, Underline, Strikethrough, and Spoiler entities can contain and can be part of any other entities.. All other entities can't contain each other.
  const FormattedText({
    required this.text,
    required this.entities,
    this.extra,
    this.clientId,
  });

  /// The text
  final String text;

  /// Entities contained in the text. Entities can be nested, but must not mutually intersect with each other.. Pre, Code, PreCode, and DateTime entities can't contain other entities. BlockQuote entities can't contain other BlockQuote entities.. Bold, Italic, Underline, Strikethrough, and Spoiler entities can contain and can be part of any other entities.. All other entities can't contain each other
  final List<TextEntity> entities;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory FormattedText.fromJson(Map<String, dynamic> json) => FormattedText(
        text: json['text'],
        entities: List<TextEntity>.from((json['entities'] ?? [])
            .map((item) => TextEntity.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
      "entities": entities.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The text
  /// * [entities]: Entities contained in the text. Entities can be nested, but must not mutually intersect with each other.. Pre, Code, PreCode, and DateTime entities can't contain other entities. BlockQuote entities can't contain other BlockQuote entities.. Bold, Italic, Underline, Strikethrough, and Spoiler entities can contain and can be part of any other entities.. All other entities can't contain each other
  FormattedText copyWith({
    String? text,
    List<TextEntity>? entities,
    dynamic extra,
    int? clientId,
  }) =>
      FormattedText(
        text: text ?? this.text,
        entities: entities ?? this.entities,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'formattedText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
