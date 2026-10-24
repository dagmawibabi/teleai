part of '../tdapi.dart';

/// **SetTonWalletCardStickers** *(setTonWalletCardStickers)* - TDLib function
///
/// Changes the list of stickers on the TON wallet card of the current user; can be used only if getOption("can_use_ton_wallet").. The whole list of stickers is replaced. The request can take up to 20 seconds to complete, so it must be called only on explicit user action.. Stickers are removed automatically if the corresponding NFT leaves the wallet or the wallet is replaced. Returns the updated card.
///
/// * [stickers]: The new list of stickers; pass an empty list to remove all stickers. Up to 10 stickers can be added. Each NFT can be used only once.
/// * [backgroundNftAddress]: Address of the NFT from the new list of stickers, whose colors will be used for the card background; pass an empty string to use the default background.. The NFT must correspond to an upgraded gift with can_be_ton_wallet_card_background == true.
///
/// [TonWalletCard] is returned on completion.
final class SetTonWalletCardStickers extends TdFunction {
  /// **SetTonWalletCardStickers** *(setTonWalletCardStickers)* - TDLib function
  ///
  /// Changes the list of stickers on the TON wallet card of the current user; can be used only if getOption("can_use_ton_wallet").. The whole list of stickers is replaced. The request can take up to 20 seconds to complete, so it must be called only on explicit user action.. Stickers are removed automatically if the corresponding NFT leaves the wallet or the wallet is replaced. Returns the updated card.
  ///
  /// * [stickers]: The new list of stickers; pass an empty list to remove all stickers. Up to 10 stickers can be added. Each NFT can be used only once.
  /// * [backgroundNftAddress]: Address of the NFT from the new list of stickers, whose colors will be used for the card background; pass an empty string to use the default background.. The NFT must correspond to an upgraded gift with can_be_ton_wallet_card_background == true.
  ///
  /// [TonWalletCard] is returned on completion.
  const SetTonWalletCardStickers({
    required this.stickers,
    required this.backgroundNftAddress,
  });

  /// The new list of stickers; pass an empty list to remove all stickers. Up to 10 stickers can be added. Each NFT can be used only once
  final List<InputTonWalletCardSticker> stickers;

  /// Address of the NFT from the new list of stickers, whose colors will be used for the card background; pass an empty string to use the default background.. The NFT must correspond to an upgraded gift with can_be_ton_wallet_card_background == true
  final String backgroundNftAddress;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "stickers": stickers.map((i) => i.toJson()).toList(),
      "background_nft_address": backgroundNftAddress,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [stickers]: The new list of stickers; pass an empty list to remove all stickers. Up to 10 stickers can be added. Each NFT can be used only once
  /// * [background_nft_address]: Address of the NFT from the new list of stickers, whose colors will be used for the card background; pass an empty string to use the default background.. The NFT must correspond to an upgraded gift with can_be_ton_wallet_card_background == true
  SetTonWalletCardStickers copyWith({
    List<InputTonWalletCardSticker>? stickers,
    String? backgroundNftAddress,
  }) =>
      SetTonWalletCardStickers(
        stickers: stickers ?? this.stickers,
        backgroundNftAddress: backgroundNftAddress ?? this.backgroundNftAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setTonWalletCardStickers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
