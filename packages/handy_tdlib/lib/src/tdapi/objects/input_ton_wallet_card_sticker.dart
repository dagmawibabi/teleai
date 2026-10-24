part of '../tdapi.dart';

/// **InputTonWalletCardSticker** *(inputTonWalletCardSticker)* - basic class
///
/// Describes a sticker to be placed on the TON wallet card of the current user.
///
/// * [position]: Position of the sticker on the card.
/// * [nftAddress]: Address of an NFT owned by the wallet, which is an upgraded gift; use getTonWalletNfts to get the list of owned NFTs.
final class InputTonWalletCardSticker extends TdObject {
  /// **InputTonWalletCardSticker** *(inputTonWalletCardSticker)* - basic class
  ///
  /// Describes a sticker to be placed on the TON wallet card of the current user.
  ///
  /// * [position]: Position of the sticker on the card.
  /// * [nftAddress]: Address of an NFT owned by the wallet, which is an upgraded gift; use getTonWalletNfts to get the list of owned NFTs.
  const InputTonWalletCardSticker({
    required this.position,
    required this.nftAddress,
  });

  /// Position of the sticker on the card
  final AreaPosition position;

  /// Address of an NFT owned by the wallet, which is an upgraded gift; use getTonWalletNfts to get the list of owned NFTs
  final String nftAddress;

  /// Parse from a json
  factory InputTonWalletCardSticker.fromJson(Map<String, dynamic> json) =>
      InputTonWalletCardSticker(
        position: AreaPosition.fromJson(json['position']),
        nftAddress: json['nft_address'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "position": position.toJson(),
      "nft_address": nftAddress,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [position]: Position of the sticker on the card
  /// * [nft_address]: Address of an NFT owned by the wallet, which is an upgraded gift; use getTonWalletNfts to get the list of owned NFTs
  InputTonWalletCardSticker copyWith({
    AreaPosition? position,
    String? nftAddress,
  }) =>
      InputTonWalletCardSticker(
        position: position ?? this.position,
        nftAddress: nftAddress ?? this.nftAddress,
      );

  /// TDLib object type
  static const String defaultObjectId = 'inputTonWalletCardSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
