part of '../tdapi.dart';

/// **GetTonWalletCardBackgroundGiftCollectionNames** *(getTonWalletCardBackgroundGiftCollectionNames)* - TDLib function
///
/// Returns names of upgraded gift collections whose NFTs can be used as background_nft_address in setTonWalletCardStickers; can be used only if getOption("can_use_ton_wallet").
///
/// [UpgradedGiftCollectionNames] is returned on completion.
final class GetTonWalletCardBackgroundGiftCollectionNames extends TdFunction {
  /// **GetTonWalletCardBackgroundGiftCollectionNames** *(getTonWalletCardBackgroundGiftCollectionNames)* - TDLib function
  ///
  /// Returns names of upgraded gift collections whose NFTs can be used as background_nft_address in setTonWalletCardStickers; can be used only if getOption("can_use_ton_wallet").
  ///
  /// [UpgradedGiftCollectionNames] is returned on completion.
  const GetTonWalletCardBackgroundGiftCollectionNames();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "@extra": extra,
    };
  }

  /// Copy instance with no modifications.
  GetTonWalletCardBackgroundGiftCollectionNames copyWith() =>
      const GetTonWalletCardBackgroundGiftCollectionNames();

  /// TDLib object type
  static const String defaultObjectId =
      'getTonWalletCardBackgroundGiftCollectionNames';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
