part of '../tdapi.dart';

/// **LocalizationTargetInfo** *(localizationTargetInfo)* - basic class
///
/// Contains information about the current localization target.
///
/// * [languagePacks]: List of available language packs for this application.
final class LocalizationTargetInfo extends TdObject {
  /// **LocalizationTargetInfo** *(localizationTargetInfo)* - basic class
  ///
  /// Contains information about the current localization target.
  ///
  /// * [languagePacks]: List of available language packs for this application.
  const LocalizationTargetInfo({
    required this.languagePacks,
    this.extra,
    this.clientId,
  });

  /// List of available language packs for this application
  final List<LanguagePackInfo> languagePacks;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory LocalizationTargetInfo.fromJson(Map<String, dynamic> json) =>
      LocalizationTargetInfo(
        languagePacks: List<LanguagePackInfo>.from(
            (json['language_packs'] ?? [])
                .map((item) => LanguagePackInfo.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "language_packs": languagePacks.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_packs]: List of available language packs for this application
  LocalizationTargetInfo copyWith({
    List<LanguagePackInfo>? languagePacks,
    dynamic extra,
    int? clientId,
  }) =>
      LocalizationTargetInfo(
        languagePacks: languagePacks ?? this.languagePacks,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'localizationTargetInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
