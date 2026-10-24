part of '../tdapi.dart';

/// **RichMessage** *(richMessage)* - basic class
///
/// Describes a message with rich formatting.
///
/// * [blocks]: Content of the message.
/// * [isRtl]: True, if the message must be shown from right to left.
/// * [isFull]: True, if the object contains the full message. Otherwise, getFullRichMessage must be used to get the full message.
final class RichMessage extends TdObject {
  /// **RichMessage** *(richMessage)* - basic class
  ///
  /// Describes a message with rich formatting.
  ///
  /// * [blocks]: Content of the message.
  /// * [isRtl]: True, if the message must be shown from right to left.
  /// * [isFull]: True, if the object contains the full message. Otherwise, getFullRichMessage must be used to get the full message.
  const RichMessage({
    required this.blocks,
    required this.isRtl,
    required this.isFull,
    this.extra,
    this.clientId,
  });

  /// Content of the message
  final List<PageBlock> blocks;

  /// True, if the message must be shown from right to left
  final bool isRtl;

  /// True, if the object contains the full message. Otherwise, getFullRichMessage must be used to get the full message
  final bool isFull;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory RichMessage.fromJson(Map<String, dynamic> json) => RichMessage(
        blocks: List<PageBlock>.from((json['blocks'] ?? [])
            .map((item) => PageBlock.fromJson(item))
            .toList()),
        isRtl: json['is_rtl'],
        isFull: json['is_full'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "blocks": blocks.map((i) => i.toJson()).toList(),
      "is_rtl": isRtl,
      "is_full": isFull,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [blocks]: Content of the message
  /// * [is_rtl]: True, if the message must be shown from right to left
  /// * [is_full]: True, if the object contains the full message. Otherwise, getFullRichMessage must be used to get the full message
  RichMessage copyWith({
    List<PageBlock>? blocks,
    bool? isRtl,
    bool? isFull,
    dynamic extra,
    int? clientId,
  }) =>
      RichMessage(
        blocks: blocks ?? this.blocks,
        isRtl: isRtl ?? this.isRtl,
        isFull: isFull ?? this.isFull,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'richMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
