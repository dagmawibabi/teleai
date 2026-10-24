part of '../tdapi.dart';

/// **InputRichMessage** *(inputRichMessage)* - basic class
///
/// A rich message to send. Total length of all texts, including custom emoji alternative text and formula source, must not exceed getOption("rich_message_text_length_max").. The total number of all blocks, list items and table rows must not exceed getOption("rich_message_block_count_max").. The maximum allowed depth of nested blocks and rich texts is getOption("rich_message_depth_max").. The total number of media in all blocks must not exceed getOption("rich_message_media_count_max").. The maximum allowed number of table columns is getOption("rich_message_table_column_count_max").
///
/// * [source]: Source of the rich message.
/// * [isRtl]: Pass true if the message must be shown from right to left.
/// * [detectAutomaticBlocks]: Pass true to enable detection of URLs, email addresses and other automatic blocks.
final class InputRichMessage extends TdObject {
  /// **InputRichMessage** *(inputRichMessage)* - basic class
  ///
  /// A rich message to send. Total length of all texts, including custom emoji alternative text and formula source, must not exceed getOption("rich_message_text_length_max").. The total number of all blocks, list items and table rows must not exceed getOption("rich_message_block_count_max").. The maximum allowed depth of nested blocks and rich texts is getOption("rich_message_depth_max").. The total number of media in all blocks must not exceed getOption("rich_message_media_count_max").. The maximum allowed number of table columns is getOption("rich_message_table_column_count_max").
  ///
  /// * [source]: Source of the rich message.
  /// * [isRtl]: Pass true if the message must be shown from right to left.
  /// * [detectAutomaticBlocks]: Pass true to enable detection of URLs, email addresses and other automatic blocks.
  const InputRichMessage({
    required this.source,
    required this.isRtl,
    required this.detectAutomaticBlocks,
  });

  /// Source of the rich message
  final RichMessageSource source;

  /// Pass true if the message must be shown from right to left
  final bool isRtl;

  /// Pass true to enable detection of URLs, email addresses and other automatic blocks
  final bool detectAutomaticBlocks;

  /// Parse from a json
  factory InputRichMessage.fromJson(Map<String, dynamic> json) =>
      InputRichMessage(
        source: RichMessageSource.fromJson(json['source']),
        isRtl: json['is_rtl'],
        detectAutomaticBlocks: json['detect_automatic_blocks'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "source": source.toJson(),
      "is_rtl": isRtl,
      "detect_automatic_blocks": detectAutomaticBlocks,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [source]: Source of the rich message
  /// * [is_rtl]: Pass true if the message must be shown from right to left
  /// * [detect_automatic_blocks]: Pass true to enable detection of URLs, email addresses and other automatic blocks
  InputRichMessage copyWith({
    RichMessageSource? source,
    bool? isRtl,
    bool? detectAutomaticBlocks,
  }) =>
      InputRichMessage(
        source: source ?? this.source,
        isRtl: isRtl ?? this.isRtl,
        detectAutomaticBlocks:
            detectAutomaticBlocks ?? this.detectAutomaticBlocks,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputRichMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
