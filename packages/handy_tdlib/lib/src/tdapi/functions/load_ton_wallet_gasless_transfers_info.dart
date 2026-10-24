part of '../tdapi.dart';

/// **LoadTonWalletGaslessTransfersInfo** *(loadTonWalletGaslessTransfersInfo)* - TDLib function
///
/// Loads or reloads the current state of gasless transfers for the current user; can be used only if getOption("can_use_ton_wallet").
///
/// [Ok] is returned on completion.
final class LoadTonWalletGaslessTransfersInfo extends TdFunction {
  /// **LoadTonWalletGaslessTransfersInfo** *(loadTonWalletGaslessTransfersInfo)* - TDLib function
  ///
  /// Loads or reloads the current state of gasless transfers for the current user; can be used only if getOption("can_use_ton_wallet").
  ///
  /// [Ok] is returned on completion.
  const LoadTonWalletGaslessTransfersInfo();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  LoadTonWalletGaslessTransfersInfo copyWith() =>
      const LoadTonWalletGaslessTransfersInfo();

  /// TDLib object type
  static const String defaultObjectId = 'loadTonWalletGaslessTransfersInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
