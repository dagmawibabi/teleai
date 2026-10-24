part of '../tdapi.dart';

/// **GetUpgradedGiftDepositInfo** *(getUpgradedGiftDepositInfo)* - TDLib function
///
/// Returns information needed to deposit an upgraded gift from the TON wallet of the current user to a Telegram account. Use sendTonWalletTransfer to complete transfer of the gift.. The gift will be received by the new owner with a message about the gift after the transfer is confirmed in the blockchain.
///
/// * [ownerId]: Identifier of the user or the channel chat that will receive the gift.
/// * [name]: Unique name of the upgraded gift.
/// * [hideSender]: Pass true to hide the sender of the gift in the message received by the new owner.
///
/// [UpgradedGiftDepositInfo] is returned on completion.
final class GetUpgradedGiftDepositInfo extends TdFunction {
  /// **GetUpgradedGiftDepositInfo** *(getUpgradedGiftDepositInfo)* - TDLib function
  ///
  /// Returns information needed to deposit an upgraded gift from the TON wallet of the current user to a Telegram account. Use sendTonWalletTransfer to complete transfer of the gift.. The gift will be received by the new owner with a message about the gift after the transfer is confirmed in the blockchain.
  ///
  /// * [ownerId]: Identifier of the user or the channel chat that will receive the gift.
  /// * [name]: Unique name of the upgraded gift.
  /// * [hideSender]: Pass true to hide the sender of the gift in the message received by the new owner.
  ///
  /// [UpgradedGiftDepositInfo] is returned on completion.
  const GetUpgradedGiftDepositInfo({
    required this.ownerId,
    required this.name,
    required this.hideSender,
  });

  /// Identifier of the user or the channel chat that will receive the gift
  final MessageSender ownerId;

  /// Unique name of the upgraded gift
  final String name;

  /// Pass true to hide the sender of the gift in the message received by the new owner
  final bool hideSender;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "owner_id": ownerId.toJson(),
      "name": name,
      "hide_sender": hideSender,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [owner_id]: Identifier of the user or the channel chat that will receive the gift
  /// * [name]: Unique name of the upgraded gift
  /// * [hide_sender]: Pass true to hide the sender of the gift in the message received by the new owner
  GetUpgradedGiftDepositInfo copyWith({
    MessageSender? ownerId,
    String? name,
    bool? hideSender,
  }) =>
      GetUpgradedGiftDepositInfo(
        ownerId: ownerId ?? this.ownerId,
        name: name ?? this.name,
        hideSender: hideSender ?? this.hideSender,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUpgradedGiftDepositInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
