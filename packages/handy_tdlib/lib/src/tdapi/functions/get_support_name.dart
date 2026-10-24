part of '../tdapi.dart';

/// **GetSupportName** *(getSupportName)* - TDLib function
///
/// Returns localized name of the Telegram support user; for Telegram support only.
///
/// [Text] is returned on completion.
final class GetSupportName extends TdFunction {
  /// **GetSupportName** *(getSupportName)* - TDLib function
  ///
  /// Returns localized name of the Telegram support user; for Telegram support only.
  ///
  /// [Text] is returned on completion.
  const GetSupportName();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetSupportName copyWith() => const GetSupportName();

  /// TDLib object type
  static const String defaultObjectId = 'getSupportName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
