part of '../tdapi.dart';

/// **GetBusinessConnectedBot** *(getBusinessConnectedBot)* - TDLib function
///
/// Returns information about the business bot that is connected to the current user account. Returns a 404 error if there is no connected bot.
///
/// [BusinessConnectedBotInfo] is returned on completion.
final class GetBusinessConnectedBot extends TdFunction {
  /// **GetBusinessConnectedBot** *(getBusinessConnectedBot)* - TDLib function
  ///
  /// Returns information about the business bot that is connected to the current user account. Returns a 404 error if there is no connected bot.
  ///
  /// [BusinessConnectedBotInfo] is returned on completion.
  const GetBusinessConnectedBot();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetBusinessConnectedBot copyWith() => const GetBusinessConnectedBot();

  /// TDLib object type
  static const String defaultObjectId = 'getBusinessConnectedBot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
