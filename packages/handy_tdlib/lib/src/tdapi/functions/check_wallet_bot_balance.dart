part of '../tdapi.dart';

/// **CheckWalletBotBalance** *(checkWalletBotBalance)* - TDLib function
///
/// Returns information about balance of the current user in the bot https://t.me/walt; can be used only if getOption("can_use_ton_wallet").
///
/// [WalletBotBalance] is returned on completion.
final class CheckWalletBotBalance extends TdFunction {
  /// **CheckWalletBotBalance** *(checkWalletBotBalance)* - TDLib function
  ///
  /// Returns information about balance of the current user in the bot https://t.me/walt; can be used only if getOption("can_use_ton_wallet").
  ///
  /// [WalletBotBalance] is returned on completion.
  const CheckWalletBotBalance();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  CheckWalletBotBalance copyWith() => const CheckWalletBotBalance();

  /// TDLib object type
  static const String defaultObjectId = 'checkWalletBotBalance';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
