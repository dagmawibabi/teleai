part of '../tdapi.dart';

/// **TonWalletCardSticker** *(tonWalletCardSticker)* - basic class
///
/// Describes a sticker on a TON wallet card.
///
/// * [position]: Position of the sticker on the card.
/// * [nft]: The NFT shown as the sticker. If nft.gift is non-null, then it is enough to draw the sticker and there is no need to download the media of the NFT.
final class TonWalletCardSticker extends TdObject {
  /// **TonWalletCardSticker** *(tonWalletCardSticker)* - basic class
  ///
  /// Describes a sticker on a TON wallet card.
  ///
  /// * [position]: Position of the sticker on the card.
  /// * [nft]: The NFT shown as the sticker. If nft.gift is non-null, then it is enough to draw the sticker and there is no need to download the media of the NFT.
  const TonWalletCardSticker({
    required this.position,
    required this.nft,
  });

  /// Position of the sticker on the card
  final AreaPosition position;

  /// The NFT shown as the sticker. If nft.gift is non-null, then it is enough to draw the sticker and there is no need to download the media of the NFT
  final TonNft nft;

  /// Parse from a json
  factory TonWalletCardSticker.fromJson(Map<String, dynamic> json) =>
      TonWalletCardSticker(
        position: AreaPosition.fromJson(json['position']),
        nft: TonNft.fromJson(json['nft']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "position": position.toJson(),
      "nft": nft.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [position]: Position of the sticker on the card
  /// * [nft]: The NFT shown as the sticker. If nft.gift is non-null, then it is enough to draw the sticker and there is no need to download the media of the NFT
  TonWalletCardSticker copyWith({
    AreaPosition? position,
    TonNft? nft,
  }) =>
      TonWalletCardSticker(
        position: position ?? this.position,
        nft: nft ?? this.nft,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletCardSticker';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
