part of '../tdapi.dart';

/// **GetUpgradedGiftWithdrawalUrl** *(getUpgradedGiftWithdrawalUrl)* - TDLib function
///
/// Returns a URL for upgraded gift withdrawal in the TON blockchain as an NFT; requires owner privileges for gifts owned by a chat.. The user must have a valid temporary password; see createTemporaryPassword.
///
/// * [receivedGiftId]: Identifier of the gift.
///
/// [HttpUrl] is returned on completion.
final class GetUpgradedGiftWithdrawalUrl extends TdFunction {
  /// **GetUpgradedGiftWithdrawalUrl** *(getUpgradedGiftWithdrawalUrl)* - TDLib function
  ///
  /// Returns a URL for upgraded gift withdrawal in the TON blockchain as an NFT; requires owner privileges for gifts owned by a chat.. The user must have a valid temporary password; see createTemporaryPassword.
  ///
  /// * [receivedGiftId]: Identifier of the gift.
  ///
  /// [HttpUrl] is returned on completion.
  const GetUpgradedGiftWithdrawalUrl({
    required this.receivedGiftId,
  });

  /// Identifier of the gift
  final String receivedGiftId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Identifier of the gift
  GetUpgradedGiftWithdrawalUrl copyWith({
    String? receivedGiftId,
  }) =>
      GetUpgradedGiftWithdrawalUrl(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getUpgradedGiftWithdrawalUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
