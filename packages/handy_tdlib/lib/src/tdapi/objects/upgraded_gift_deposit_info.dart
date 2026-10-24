part of '../tdapi.dart';

/// **UpgradedGiftDepositInfo** *(upgradedGiftDepositInfo)* - basic class
///
/// Contains information needed to deposit an upgraded gift from the TON wallet of the current user to a Telegram account.. The gift must be transferred by an internal message from the wallet to nft_address with gram_amount attached and with payload as the message body.
///
/// * [nftAddress]: Address in TON blockchain to which the message must be sent.
/// * [payload]: Body of the NFT transfer message.
/// * [gramAmount]: The amount of TON Grams that must be attached to the message to cover fees, in the smallest units of the cryptocurrency; excess amount will be returned to the wallet.
final class UpgradedGiftDepositInfo extends TdObject {
  /// **UpgradedGiftDepositInfo** *(upgradedGiftDepositInfo)* - basic class
  ///
  /// Contains information needed to deposit an upgraded gift from the TON wallet of the current user to a Telegram account.. The gift must be transferred by an internal message from the wallet to nft_address with gram_amount attached and with payload as the message body.
  ///
  /// * [nftAddress]: Address in TON blockchain to which the message must be sent.
  /// * [payload]: Body of the NFT transfer message.
  /// * [gramAmount]: The amount of TON Grams that must be attached to the message to cover fees, in the smallest units of the cryptocurrency; excess amount will be returned to the wallet.
  const UpgradedGiftDepositInfo({
    required this.nftAddress,
    required this.payload,
    required this.gramAmount,
    this.extra,
    this.clientId,
  });

  /// Address in TON blockchain to which the message must be sent
  final String nftAddress;

  /// Body of the NFT transfer message
  final String payload;

  /// The amount of TON Grams that must be attached to the message to cover fees, in the smallest units of the cryptocurrency; excess amount will be returned to the wallet
  final int gramAmount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory UpgradedGiftDepositInfo.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftDepositInfo(
        nftAddress: json['nft_address'],
        payload: json['payload'],
        gramAmount: json['gram_amount'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "nft_address": nftAddress,
      "payload": payload,
      "gram_amount": gramAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [nft_address]: Address in TON blockchain to which the message must be sent
  /// * [payload]: Body of the NFT transfer message
  /// * [gram_amount]: The amount of TON Grams that must be attached to the message to cover fees, in the smallest units of the cryptocurrency; excess amount will be returned to the wallet
  UpgradedGiftDepositInfo copyWith({
    String? nftAddress,
    String? payload,
    int? gramAmount,
    dynamic extra,
    int? clientId,
  }) =>
      UpgradedGiftDepositInfo(
        nftAddress: nftAddress ?? this.nftAddress,
        payload: payload ?? this.payload,
        gramAmount: gramAmount ?? this.gramAmount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftDepositInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
