part of '../tdapi.dart';

/// **InputBusinessChatLink** *(inputBusinessChatLink)* - basic class
///
/// Describes a business chat link to create or edit.
///
/// * [text]: Message draft text that will be added to the input field.
/// * [title]: Link title.
final class InputBusinessChatLink extends TdObject {
  /// **InputBusinessChatLink** *(inputBusinessChatLink)* - basic class
  ///
  /// Describes a business chat link to create or edit.
  ///
  /// * [text]: Message draft text that will be added to the input field.
  /// * [title]: Link title.
  const InputBusinessChatLink({
    required this.text,
    required this.title,
  });

  /// Message draft text that will be added to the input field
  final FormattedText text;

  /// Link title
  final String title;

  /// Parse from a json
  factory InputBusinessChatLink.fromJson(Map<String, dynamic> json) =>
      InputBusinessChatLink(
        text: FormattedText.fromJson(json['text']),
        title: json['title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text.toJson(),
      "title": title,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Message draft text that will be added to the input field
  /// * [title]: Link title
  InputBusinessChatLink copyWith({
    FormattedText? text,
    String? title,
  }) =>
      InputBusinessChatLink(
        text: text ?? this.text,
        title: title ?? this.title,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputBusinessChatLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
