part of '../tdapi.dart';

/// **RichMessageSource** *(richMessageSource)* - parent
///
/// Describes source of a rich message.
sealed class RichMessageSource extends TdObject {
  /// **RichMessageSource** *(richMessageSource)* - parent
  ///
  /// Describes source of a rich message.
  const RichMessageSource();

  /// a RichMessageSource return type can be :
  /// * [RichMessageSourceBlocks]
  /// * [RichMessageSourceMarkdown]
  /// * [RichMessageSourceHtml]
  factory RichMessageSource.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case RichMessageSourceBlocks.defaultObjectId:
        return RichMessageSourceBlocks.fromJson(json);
      case RichMessageSourceMarkdown.defaultObjectId:
        return RichMessageSourceMarkdown.fromJson(json);
      case RichMessageSourceHtml.defaultObjectId:
        return RichMessageSourceHtml.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of RichMessageSource)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  RichMessageSource copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'richMessageSource';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichMessageSourceBlocks** *(richMessageSourceBlocks)* - child of RichMessageSource
///
/// A rich message defined by blocks.
///
/// * [blocks]: Content of the message.
final class RichMessageSourceBlocks extends RichMessageSource {
  /// **RichMessageSourceBlocks** *(richMessageSourceBlocks)* - child of RichMessageSource
  ///
  /// A rich message defined by blocks.
  ///
  /// * [blocks]: Content of the message.
  const RichMessageSourceBlocks({
    required this.blocks,
  });

  /// Content of the message
  final List<InputPageBlock> blocks;

  /// Parse from a json
  factory RichMessageSourceBlocks.fromJson(Map<String, dynamic> json) =>
      RichMessageSourceBlocks(
        blocks: List<InputPageBlock>.from((json['blocks'] ?? [])
            .map((item) => InputPageBlock.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "blocks": blocks.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [blocks]: Content of the message
  @override
  RichMessageSourceBlocks copyWith({
    List<InputPageBlock>? blocks,
  }) =>
      RichMessageSourceBlocks(
        blocks: blocks ?? this.blocks,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richMessageSourceBlocks';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichMessageSourceMarkdown** *(richMessageSourceMarkdown)* - child of RichMessageSource
///
/// A Markdown-formatted rich message; for bots only.
///
/// * [text]: Markdown-formatted text of the message.
/// * [media]: Media used in the message.
final class RichMessageSourceMarkdown extends RichMessageSource {
  /// **RichMessageSourceMarkdown** *(richMessageSourceMarkdown)* - child of RichMessageSource
  ///
  /// A Markdown-formatted rich message; for bots only.
  ///
  /// * [text]: Markdown-formatted text of the message.
  /// * [media]: Media used in the message.
  const RichMessageSourceMarkdown({
    required this.text,
    required this.media,
  });

  /// Markdown-formatted text of the message
  final String text;

  /// Media used in the message
  final List<InputRichMessageMedia> media;

  /// Parse from a json
  factory RichMessageSourceMarkdown.fromJson(Map<String, dynamic> json) =>
      RichMessageSourceMarkdown(
        text: json['text'],
        media: List<InputRichMessageMedia>.from((json['media'] ?? [])
            .map((item) => InputRichMessageMedia.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
      "media": media.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: Markdown-formatted text of the message
  /// * [media]: Media used in the message
  @override
  RichMessageSourceMarkdown copyWith({
    String? text,
    List<InputRichMessageMedia>? media,
  }) =>
      RichMessageSourceMarkdown(
        text: text ?? this.text,
        media: media ?? this.media,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richMessageSourceMarkdown';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **RichMessageSourceHtml** *(richMessageSourceHtml)* - child of RichMessageSource
///
/// An HTML-formatted rich message; for bots only.
///
/// * [text]: HTML-formatted text of the message.
/// * [media]: Media used in the message.
final class RichMessageSourceHtml extends RichMessageSource {
  /// **RichMessageSourceHtml** *(richMessageSourceHtml)* - child of RichMessageSource
  ///
  /// An HTML-formatted rich message; for bots only.
  ///
  /// * [text]: HTML-formatted text of the message.
  /// * [media]: Media used in the message.
  const RichMessageSourceHtml({
    required this.text,
    required this.media,
  });

  /// HTML-formatted text of the message
  final String text;

  /// Media used in the message
  final List<InputRichMessageMedia> media;

  /// Parse from a json
  factory RichMessageSourceHtml.fromJson(Map<String, dynamic> json) =>
      RichMessageSourceHtml(
        text: json['text'],
        media: List<InputRichMessageMedia>.from((json['media'] ?? [])
            .map((item) => InputRichMessageMedia.fromJson(item))
            .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "text": text,
      "media": media.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [text]: HTML-formatted text of the message
  /// * [media]: Media used in the message
  @override
  RichMessageSourceHtml copyWith({
    String? text,
    List<InputRichMessageMedia>? media,
  }) =>
      RichMessageSourceHtml(
        text: text ?? this.text,
        media: media ?? this.media,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richMessageSourceHtml';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
