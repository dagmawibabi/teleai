part of '../tdapi.dart';

/// **SynchronizeLanguagePack** *(synchronizeLanguagePack)* - TDLib function
///
/// Fetches the latest versions of all strings from a language pack in the current localization target from the server.. This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization.
///
/// * [languagePackId]: Language pack identifier.
///
/// [Ok] is returned on completion.
final class SynchronizeLanguagePack extends TdFunction {
  /// **SynchronizeLanguagePack** *(synchronizeLanguagePack)* - TDLib function
  ///
  /// Fetches the latest versions of all strings from a language pack in the current localization target from the server.. This method doesn't need to be called explicitly for the current used/base language packs. Can be called before authorization.
  ///
  /// * [languagePackId]: Language pack identifier.
  ///
  /// [Ok] is returned on completion.
  const SynchronizeLanguagePack({
    required this.languagePackId,
  });

  /// Language pack identifier
  final String languagePackId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "language_pack_id": languagePackId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [language_pack_id]: Language pack identifier
  SynchronizeLanguagePack copyWith({
    String? languagePackId,
  }) =>
      SynchronizeLanguagePack(
        languagePackId: languagePackId ?? this.languagePackId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'synchronizeLanguagePack';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
