part of '../tdapi.dart';

/// **GetPremiumGiveawayPaymentOptions** *(getPremiumGiveawayPaymentOptions)* - TDLib function
///
/// Returns available options for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members.
///
/// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by receivers of the gift codes and which is administered by the user.
///
/// [PremiumGiveawayPaymentOptions] is returned on completion.
final class GetPremiumGiveawayPaymentOptions extends TdFunction {
  /// **GetPremiumGiveawayPaymentOptions** *(getPremiumGiveawayPaymentOptions)* - TDLib function
  ///
  /// Returns available options for creating of Telegram Premium giveaway or manual distribution of Telegram Premium among chat members.
  ///
  /// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by receivers of the gift codes and which is administered by the user.
  ///
  /// [PremiumGiveawayPaymentOptions] is returned on completion.
  const GetPremiumGiveawayPaymentOptions({
    required this.boostedChatId,
  });

  /// Identifier of the supergroup or channel chat, which will be automatically boosted by receivers of the gift codes and which is administered by the user
  final int boostedChatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "boosted_chat_id": boostedChatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [boosted_chat_id]: Identifier of the supergroup or channel chat, which will be automatically boosted by receivers of the gift codes and which is administered by the user
  GetPremiumGiveawayPaymentOptions copyWith({
    int? boostedChatId,
  }) =>
      GetPremiumGiveawayPaymentOptions(
        boostedChatId: boostedChatId ?? this.boostedChatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPremiumGiveawayPaymentOptions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
