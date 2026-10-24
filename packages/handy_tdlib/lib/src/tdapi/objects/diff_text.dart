part of '../tdapi.dart';

/// **DiffText** *(diffText)* - basic class
///
/// A text with some changes highlighted.
///
/// * [text]: The text.
/// * [entities]: Entities describing changes in the text. Entities don't mutually intersect with each other.
final class DiffText extends TdObject {
  /// **DiffText** *(diffText)* - basic class
  ///
  /// A text with some changes highlighted.
  ///
  /// * [text]: The text.
  /// * [entities]: Entities describing changes in the text. Entities don't mutually intersect with each other.
  const DiffText({
    required this.text,
    required this.entities,
  });

  /// The text
  final String text;

  /// Entities describing changes in the text. Entities don't mutually intersect with each other
  final List<DiffEntity> entities;

  /// Parse from a json
  factory DiffText.fromJson(Map<String, dynamic> json) => DiffText(
        text: json['text'],
        entities: List<DiffEntity>.from((json['entities'] ?? [])
            .map((item) => DiffEntity.fromJson(item))
            .toList()),
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
  /// * [entities]: Entities describing changes in the text. Entities don't mutually intersect with each other
  DiffText copyWith({
    String? text,
    List<DiffEntity>? entities,
  }) =>
      DiffText(
        text: text ?? this.text,
        entities: entities ?? this.entities,
      );

  /// TDLib object type
  static const String defaultObjectId = 'diffText';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
