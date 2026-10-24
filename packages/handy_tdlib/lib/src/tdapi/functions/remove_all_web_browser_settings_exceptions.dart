part of '../tdapi.dart';

/// **RemoveAllWebBrowserSettingsExceptions** *(removeAllWebBrowserSettingsExceptions)* - TDLib function
///
/// Removes special handling for the opening of all links.
///
/// [Ok] is returned on completion.
final class RemoveAllWebBrowserSettingsExceptions extends TdFunction {
  /// **RemoveAllWebBrowserSettingsExceptions** *(removeAllWebBrowserSettingsExceptions)* - TDLib function
  ///
  /// Removes special handling for the opening of all links.
  ///
  /// [Ok] is returned on completion.
  const RemoveAllWebBrowserSettingsExceptions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  RemoveAllWebBrowserSettingsExceptions copyWith() =>
      const RemoveAllWebBrowserSettingsExceptions();

  /// TDLib object type
  static const String defaultObjectId = 'removeAllWebBrowserSettingsExceptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
