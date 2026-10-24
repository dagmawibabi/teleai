part of '../tdapi.dart';

/// **DisconnectAllWebsites** *(disconnectAllWebsites)* - TDLib function
///
/// Disconnects all websites from the current user's Telegram account.
///
/// [Ok] is returned on completion.
final class DisconnectAllWebsites extends TdFunction {
  /// **DisconnectAllWebsites** *(disconnectAllWebsites)* - TDLib function
  ///
  /// Disconnects all websites from the current user's Telegram account.
  ///
  /// [Ok] is returned on completion.
  const DisconnectAllWebsites();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  DisconnectAllWebsites copyWith() => const DisconnectAllWebsites();

  /// TDLib object type
  static const String defaultObjectId = 'disconnectAllWebsites';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
