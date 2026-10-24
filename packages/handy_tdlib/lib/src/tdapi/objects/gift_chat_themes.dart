part of '../tdapi.dart';

/// **GiftChatThemes** *(giftChatThemes)* - basic class
///
/// Contains a list of chat themes based on upgraded gifts.
///
/// * [themes]: A list of chat themes.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class GiftChatThemes extends TdObject {
  /// **GiftChatThemes** *(giftChatThemes)* - basic class
  ///
  /// Contains a list of chat themes based on upgraded gifts.
  ///
  /// * [themes]: A list of chat themes.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const GiftChatThemes({
    required this.themes,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// A list of chat themes
  final List<GiftChatTheme> themes;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftChatThemes.fromJson(Map<String, dynamic> json) => GiftChatThemes(
        themes: List<GiftChatTheme>.from((json['themes'] ?? [])
            .map((item) => GiftChatTheme.fromJson(item))
            .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "themes": themes.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [themes]: A list of chat themes
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  GiftChatThemes copyWith({
    List<GiftChatTheme>? themes,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      GiftChatThemes(
        themes: themes ?? this.themes,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftChatThemes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
