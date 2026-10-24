part of '../tdapi.dart';

/// **WithdrawUpgradedGift** *(withdrawUpgradedGift)* - TDLib function
///
/// Withdraws an upgraded gift to the TON blockchain as an NFT directly to the TON wallet of the current user, which is created automatically if the user has no wallet yet;. requires owner privileges for gifts owned by a chat. The user must have a valid temporary password; see createTemporaryPassword.. The gift will be received by the wallet in a few seconds after the request succeeds.
///
/// * [receivedGiftId]: Identifier of the gift.
/// * [keepOnProfile]: Pass true to keep the gift displayed on the user's or the chat's profile page after withdrawal.
///
/// [Ok] is returned on completion.
final class WithdrawUpgradedGift extends TdFunction {
  /// **WithdrawUpgradedGift** *(withdrawUpgradedGift)* - TDLib function
  ///
  /// Withdraws an upgraded gift to the TON blockchain as an NFT directly to the TON wallet of the current user, which is created automatically if the user has no wallet yet;. requires owner privileges for gifts owned by a chat. The user must have a valid temporary password; see createTemporaryPassword.. The gift will be received by the wallet in a few seconds after the request succeeds.
  ///
  /// * [receivedGiftId]: Identifier of the gift.
  /// * [keepOnProfile]: Pass true to keep the gift displayed on the user's or the chat's profile page after withdrawal.
  ///
  /// [Ok] is returned on completion.
  const WithdrawUpgradedGift({
    required this.receivedGiftId,
    required this.keepOnProfile,
  });

  /// Identifier of the gift
  final String receivedGiftId;

  /// Pass true to keep the gift displayed on the user's or the chat's profile page after withdrawal
  final bool keepOnProfile;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
      "keep_on_profile": keepOnProfile,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Identifier of the gift
  /// * [keep_on_profile]: Pass true to keep the gift displayed on the user's or the chat's profile page after withdrawal
  WithdrawUpgradedGift copyWith({
    String? receivedGiftId,
    bool? keepOnProfile,
  }) =>
      WithdrawUpgradedGift(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        keepOnProfile: keepOnProfile ?? this.keepOnProfile,
      );

  /// TDLib object type
  static const String defaultObjectId = 'withdrawUpgradedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
