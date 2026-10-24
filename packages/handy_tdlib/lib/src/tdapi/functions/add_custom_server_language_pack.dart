part of '../tdapi.dart';

/// **AddCustomServerLanguagePack** *(addCustomServerLanguagePack)* - TDLib function
///
/// Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization.
///
/// * [languagePackId]: Identifier of a language pack to be added.
///
/// [Ok] is returned on completion.
final class AddCustomServerLanguagePack extends TdFunction {
  /// **AddCustomServerLanguagePack** *(addCustomServerLanguagePack)* - TDLib function
  ///
  /// Adds a custom server language pack to the list of installed language packs in current localization target. Can be called before authorization.
  ///
  /// * [languagePackId]: Identifier of a language pack to be added.
  ///
  /// [Ok] is returned on completion.
  const AddCustomServerLanguagePack({
    required this.languagePackId,
  });

  /// Identifier of a language pack to be added
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
  /// * [language_pack_id]: Identifier of a language pack to be added
  AddCustomServerLanguagePack copyWith({
    String? languagePackId,
  }) =>
      AddCustomServerLanguagePack(
        languagePackId: languagePackId ?? this.languagePackId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addCustomServerLanguagePack';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
