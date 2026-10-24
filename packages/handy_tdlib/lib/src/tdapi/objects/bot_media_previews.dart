part of '../tdapi.dart';

/// **BotMediaPreviews** *(botMediaPreviews)* - basic class
///
/// Contains a list of media previews of a bot.
///
/// * [previews]: List of media previews.
final class BotMediaPreviews extends TdObject {
  /// **BotMediaPreviews** *(botMediaPreviews)* - basic class
  ///
  /// Contains a list of media previews of a bot.
  ///
  /// * [previews]: List of media previews.
  const BotMediaPreviews({
    required this.previews,
    this.extra,
    this.clientId,
  });

  /// List of media previews
  final List<BotMediaPreview> previews;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BotMediaPreviews.fromJson(Map<String, dynamic> json) =>
      BotMediaPreviews(
        previews: List<BotMediaPreview>.from((json['previews'] ?? [])
            .map((item) => BotMediaPreview.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "previews": previews.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [previews]: List of media previews
  BotMediaPreviews copyWith({
    List<BotMediaPreview>? previews,
    dynamic extra,
    int? clientId,
  }) =>
      BotMediaPreviews(
        previews: previews ?? this.previews,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botMediaPreviews';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
