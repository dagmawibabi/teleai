part of '../tdapi.dart';

/// **EmojiStatuses** *(emojiStatuses)* - basic class
///
/// Contains a list of emoji statuses.
///
/// * [emojiStatuses]: The list of emoji statuses identifiers.
final class EmojiStatuses extends TdObject {
  /// **EmojiStatuses** *(emojiStatuses)* - basic class
  ///
  /// Contains a list of emoji statuses.
  ///
  /// * [emojiStatuses]: The list of emoji statuses identifiers.
  const EmojiStatuses({
    required this.emojiStatuses,
    this.extra,
    this.clientId,
  });

  /// The list of emoji statuses identifiers
  final List<EmojiStatus> emojiStatuses;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory EmojiStatuses.fromJson(Map<String, dynamic> json) => EmojiStatuses(
        emojiStatuses: List<EmojiStatus>.from((json['emoji_statuses'] ?? [])
            .map((item) => EmojiStatus.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "emoji_statuses": emojiStatuses.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [emoji_statuses]: The list of emoji statuses identifiers
  EmojiStatuses copyWith({
    List<EmojiStatus>? emojiStatuses,
    dynamic extra,
    int? clientId,
  }) =>
      EmojiStatuses(
        emojiStatuses: emojiStatuses ?? this.emojiStatuses,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'emojiStatuses';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
