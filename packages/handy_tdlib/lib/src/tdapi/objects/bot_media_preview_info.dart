part of '../tdapi.dart';

/// **BotMediaPreviewInfo** *(botMediaPreviewInfo)* - basic class
///
/// Contains a list of media previews of a bot for the given language and the list of languages for which the bot has dedicated previews.
///
/// * [previews]: List of media previews.
/// * [languageCodes]: List of language codes for which the bot has dedicated previews.
final class BotMediaPreviewInfo extends TdObject {
  /// **BotMediaPreviewInfo** *(botMediaPreviewInfo)* - basic class
  ///
  /// Contains a list of media previews of a bot for the given language and the list of languages for which the bot has dedicated previews.
  ///
  /// * [previews]: List of media previews.
  /// * [languageCodes]: List of language codes for which the bot has dedicated previews.
  const BotMediaPreviewInfo({
    required this.previews,
    required this.languageCodes,
    this.extra,
    this.clientId,
  });

  /// List of media previews
  final List<BotMediaPreview> previews;

  /// List of language codes for which the bot has dedicated previews
  final List<String> languageCodes;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BotMediaPreviewInfo.fromJson(Map<String, dynamic> json) =>
      BotMediaPreviewInfo(
        previews: List<BotMediaPreview>.from((json['previews'] ?? [])
            .map((item) => BotMediaPreview.fromJson(item))
            .toList()),
        languageCodes: List<String>.from(
            (json['language_codes'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "previews": previews.map((i) => i.toJson()).toList(),
      "language_codes": languageCodes.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [previews]: List of media previews
  /// * [language_codes]: List of language codes for which the bot has dedicated previews
  BotMediaPreviewInfo copyWith({
    List<BotMediaPreview>? previews,
    List<String>? languageCodes,
    dynamic extra,
    int? clientId,
  }) =>
      BotMediaPreviewInfo(
        previews: previews ?? this.previews,
        languageCodes: languageCodes ?? this.languageCodes,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botMediaPreviewInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
