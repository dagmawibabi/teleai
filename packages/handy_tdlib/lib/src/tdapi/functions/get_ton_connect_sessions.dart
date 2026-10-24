part of '../tdapi.dart';

/// **GetTonConnectSessions** *(getTonConnectSessions)* - TDLib function
///
/// Returns active TON Connect sessions; can be used only if getOption("can_use_ton_wallet").
///
/// [TonConnectSessions] is returned on completion.
final class GetTonConnectSessions extends TdFunction {
  /// **GetTonConnectSessions** *(getTonConnectSessions)* - TDLib function
  ///
  /// Returns active TON Connect sessions; can be used only if getOption("can_use_ton_wallet").
  ///
  /// [TonConnectSessions] is returned on completion.
  const GetTonConnectSessions();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetTonConnectSessions copyWith() => const GetTonConnectSessions();

  /// TDLib object type
  static const String defaultObjectId = 'getTonConnectSessions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
