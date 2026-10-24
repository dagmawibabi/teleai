part of '../tdapi.dart';

/// **GetConnectedWebsites** *(getConnectedWebsites)* - TDLib function
///
/// Returns all websites where the current user used Telegram to log in.
///
/// [ConnectedWebsites] is returned on completion.
final class GetConnectedWebsites extends TdFunction {
  /// **GetConnectedWebsites** *(getConnectedWebsites)* - TDLib function
  ///
  /// Returns all websites where the current user used Telegram to log in.
  ///
  /// [ConnectedWebsites] is returned on completion.
  const GetConnectedWebsites();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetConnectedWebsites copyWith() => const GetConnectedWebsites();

  /// TDLib object type
  static const String defaultObjectId = 'getConnectedWebsites';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
