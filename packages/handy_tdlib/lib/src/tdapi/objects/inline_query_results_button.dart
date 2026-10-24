part of '../tdapi.dart';

/// **InlineQueryResultsButton** *(inlineQueryResultsButton)* - basic class
///
/// Represents a button to be shown above inline query results.
///
/// * [text]: The text of the button.
/// * [type]: Type of the button.
final class InlineQueryResultsButton extends TdObject {
  /// **InlineQueryResultsButton** *(inlineQueryResultsButton)* - basic class
  ///
  /// Represents a button to be shown above inline query results.
  ///
  /// * [text]: The text of the button.
  /// * [type]: Type of the button.
  const InlineQueryResultsButton({
    required this.text,
    required this.type,
  });

  /// The text of the button
  final String text;

  /// Type of the button
  final InlineQueryResultsButtonType type;

  /// Parse from a json
  factory InlineQueryResultsButton.fromJson(Map<String, dynamic> json) =>
      InlineQueryResultsButton(
        text: json['text'],
        type: InlineQueryResultsButtonType.fromJson(json['type']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: The text of the button
  /// * [type]: Type of the button
  InlineQueryResultsButton copyWith({
    String? text,
    InlineQueryResultsButtonType? type,
  }) =>
      InlineQueryResultsButton(
        text: text ?? this.text,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inlineQueryResultsButton';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
