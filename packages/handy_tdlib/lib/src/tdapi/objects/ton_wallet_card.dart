part of '../tdapi.dart';

/// **TonWalletCard** *(tonWalletCard)* - basic class
///
/// Describes a TON wallet card, which is shown on the profile page of a user to everyone.
///
/// * [address]: Address of the wallet.
/// * [gramAmount]: Balance of the wallet, in the smallest units of the cryptocurrency; may be slightly outdated.
/// * [stickers]: Stickers placed on the card.
/// * [backgroundNftAddress]: Address of the NFT of one of the stickers, whose colors must be used for the card background; may be empty if the default background must be used.
final class TonWalletCard extends TdObject {
  /// **TonWalletCard** *(tonWalletCard)* - basic class
  ///
  /// Describes a TON wallet card, which is shown on the profile page of a user to everyone.
  ///
  /// * [address]: Address of the wallet.
  /// * [gramAmount]: Balance of the wallet, in the smallest units of the cryptocurrency; may be slightly outdated.
  /// * [stickers]: Stickers placed on the card.
  /// * [backgroundNftAddress]: Address of the NFT of one of the stickers, whose colors must be used for the card background; may be empty if the default background must be used.
  const TonWalletCard({
    required this.address,
    required this.gramAmount,
    required this.stickers,
    required this.backgroundNftAddress,
    this.extra,
    this.clientId,
  });

  /// Address of the wallet
  final String address;

  /// Balance of the wallet, in the smallest units of the cryptocurrency; may be slightly outdated
  final int gramAmount;

  /// Stickers placed on the card
  final List<TonWalletCardSticker> stickers;

  /// Address of the NFT of one of the stickers, whose colors must be used for the card background; may be empty if the default background must be used
  final String backgroundNftAddress;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory TonWalletCard.fromJson(Map<String, dynamic> json) => TonWalletCard(
        address: json['address'],
        gramAmount: json['gram_amount'],
        stickers: List<TonWalletCardSticker>.from((json['stickers'] ?? [])
            .map((item) => TonWalletCardSticker.fromJson(item))
            .toList()),
        backgroundNftAddress: json['background_nft_address'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "address": address,
      "gram_amount": gramAmount,
      "stickers": stickers.map((i) => i.toJson()).toList(),
      "background_nft_address": backgroundNftAddress,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [address]: Address of the wallet
  /// * [gram_amount]: Balance of the wallet, in the smallest units of the cryptocurrency; may be slightly outdated
  /// * [stickers]: Stickers placed on the card
  /// * [background_nft_address]: Address of the NFT of one of the stickers, whose colors must be used for the card background; may be empty if the default background must be used
  TonWalletCard copyWith({
    String? address,
    int? gramAmount,
    List<TonWalletCardSticker>? stickers,
    String? backgroundNftAddress,
    dynamic extra,
    int? clientId,
  }) =>
      TonWalletCard(
        address: address ?? this.address,
        gramAmount: gramAmount ?? this.gramAmount,
        stickers: stickers ?? this.stickers,
        backgroundNftAddress: backgroundNftAddress ?? this.backgroundNftAddress,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'tonWalletCard';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
