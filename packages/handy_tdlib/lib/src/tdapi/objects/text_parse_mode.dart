part of '../tdapi.dart';

/// **TextParseMode** *(textParseMode)* - parent
///
/// Describes the way the text needs to be parsed for text entities.
sealed class TextParseMode extends TdObject {
  /// **TextParseMode** *(textParseMode)* - parent
  ///
  /// Describes the way the text needs to be parsed for text entities.
  const TextParseMode();

  /// a TextParseMode return type can be :
  /// * [TextParseModeMarkdown]
  /// * [TextParseModeHTML]
  factory TextParseMode.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case TextParseModeMarkdown.defaultObjectId:
        return TextParseModeMarkdown.fromJson(json);
      case TextParseModeHTML.defaultObjectId:
        return TextParseModeHTML.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of TextParseMode)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  TextParseMode copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'textParseMode';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextParseModeMarkdown** *(textParseModeMarkdown)* - child of TextParseMode
///
/// The text uses Markdown-style formatting.
///
/// * [version]: Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode.
final class TextParseModeMarkdown extends TextParseMode {
  /// **TextParseModeMarkdown** *(textParseModeMarkdown)* - child of TextParseMode
  ///
  /// The text uses Markdown-style formatting.
  ///
  /// * [version]: Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode.
  const TextParseModeMarkdown({
    required this.version,
  });

  /// Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
  final int version;

  /// Parse from a json
  factory TextParseModeMarkdown.fromJson(Map<String, dynamic> json) =>
      TextParseModeMarkdown(
        version: json['version'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "version": version,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [version]: Version of the parser: 0 or 1 - Telegram Bot API "Markdown" parse mode, 2 - Telegram Bot API "MarkdownV2" parse mode
  @override
  TextParseModeMarkdown copyWith({
    int? version,
  }) =>
      TextParseModeMarkdown(
        version: version ?? this.version,
      );

  /// TDLib object type
  static const String defaultObjectId = 'textParseModeMarkdown';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **TextParseModeHTML** *(textParseModeHTML)* - child of TextParseMode
///
/// The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode.
final class TextParseModeHTML extends TextParseMode {
  /// **TextParseModeHTML** *(textParseModeHTML)* - child of TextParseMode
  ///
  /// The text uses HTML-style formatting. The same as Telegram Bot API "HTML" parse mode.
  const TextParseModeHTML();

  /// Parse from a json
  factory TextParseModeHTML.fromJson(Map<String, dynamic> json) =>
      const TextParseModeHTML();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  TextParseModeHTML copyWith() => const TextParseModeHTML();

  /// TDLib object type
  static const String defaultObjectId = 'textParseModeHTML';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
