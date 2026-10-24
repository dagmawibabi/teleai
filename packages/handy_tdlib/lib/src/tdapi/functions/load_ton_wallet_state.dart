part of '../tdapi.dart';

/// **LoadTonWalletState** *(loadTonWalletState)* - TDLib function
///
/// Loads state of the TON wallet of the current user; can be used only if getOption("can_use_ton_wallet").
///
/// [Ok] is returned on completion.
final class LoadTonWalletState extends TdFunction {
  /// **LoadTonWalletState** *(loadTonWalletState)* - TDLib function
  ///
  /// Loads state of the TON wallet of the current user; can be used only if getOption("can_use_ton_wallet").
  ///
  /// [Ok] is returned on completion.
  const LoadTonWalletState();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  LoadTonWalletState copyWith() => const LoadTonWalletState();

  /// TDLib object type
  static const String defaultObjectId = 'loadTonWalletState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
