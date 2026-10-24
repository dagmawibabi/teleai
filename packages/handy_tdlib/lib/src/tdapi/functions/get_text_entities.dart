part of '../tdapi.dart';

/// **GetTextEntities** *(getTextEntities)* - TDLib function
///
/// Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, TON blockchain addresses, URLs, and email addresses) found in the text. Can be called synchronously.
///
/// * [text]: The text in which to look for entities.
///
/// [TextEntities] is returned on completion.
final class GetTextEntities extends TdFunction {
  /// **GetTextEntities** *(getTextEntities)* - TDLib function
  ///
  /// Returns all entities (mentions, hashtags, cashtags, bot commands, bank card numbers, TON blockchain addresses, URLs, and email addresses) found in the text. Can be called synchronously.
  ///
  /// * [text]: The text in which to look for entities.
  ///
  /// [TextEntities] is returned on completion.
  const GetTextEntities({
    required this.text,
  });

  /// The text in which to look for entities
  final String text;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "text": text,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The text in which to look for entities
  GetTextEntities copyWith({
    String? text,
  }) =>
      GetTextEntities(
        text: text ?? this.text,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getTextEntities';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
