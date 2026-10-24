part of '../tdapi.dart';

/// **StarGiveawayPaymentOption** *(starGiveawayPaymentOption)* - basic class
///
/// Describes an option for creating of Telegram Star giveaway. Use telegramPaymentPurposeStarGiveaway for out-of-store payments.
///
/// * [currency]: ISO 4217 currency code for the payment.
/// * [amount]: The amount to pay, in the smallest units of the currency.
/// * [starCount]: Number of Telegram Stars that will be distributed among winners.
/// * [storeProductId]: Identifier of the store product associated with the option; may be empty if none.
/// * [yearlyBoostCount]: Number of times the chat will be boosted for one year if the option is chosen.
/// * [winnerOptions]: Allowed options for the number of giveaway winners.
/// * [isDefault]: True, if the option must be chosen by default.
/// * [isAdditional]: True, if the option must be shown only in the full list of payment options.
final class StarGiveawayPaymentOption extends TdObject {
  /// **StarGiveawayPaymentOption** *(starGiveawayPaymentOption)* - basic class
  ///
  /// Describes an option for creating of Telegram Star giveaway. Use telegramPaymentPurposeStarGiveaway for out-of-store payments.
  ///
  /// * [currency]: ISO 4217 currency code for the payment.
  /// * [amount]: The amount to pay, in the smallest units of the currency.
  /// * [starCount]: Number of Telegram Stars that will be distributed among winners.
  /// * [storeProductId]: Identifier of the store product associated with the option; may be empty if none.
  /// * [yearlyBoostCount]: Number of times the chat will be boosted for one year if the option is chosen.
  /// * [winnerOptions]: Allowed options for the number of giveaway winners.
  /// * [isDefault]: True, if the option must be chosen by default.
  /// * [isAdditional]: True, if the option must be shown only in the full list of payment options.
  const StarGiveawayPaymentOption({
    required this.currency,
    required this.amount,
    required this.starCount,
    required this.storeProductId,
    required this.yearlyBoostCount,
    required this.winnerOptions,
    required this.isDefault,
    required this.isAdditional,
  });

  /// ISO 4217 currency code for the payment
  final String currency;

  /// The amount to pay, in the smallest units of the currency
  final int amount;

  /// Number of Telegram Stars that will be distributed among winners
  final int starCount;

  /// Identifier of the store product associated with the option; may be empty if none
  final String storeProductId;

  /// Number of times the chat will be boosted for one year if the option is chosen
  final int yearlyBoostCount;

  /// Allowed options for the number of giveaway winners
  final List<StarGiveawayWinnerOption> winnerOptions;

  /// True, if the option must be chosen by default
  final bool isDefault;

  /// True, if the option must be shown only in the full list of payment options
  final bool isAdditional;

  /// Parse from a json
  factory StarGiveawayPaymentOption.fromJson(Map<String, dynamic> json) =>
      StarGiveawayPaymentOption(
        currency: json['currency'],
        amount: json['amount'],
        starCount: json['star_count'],
        storeProductId: json['store_product_id'],
        yearlyBoostCount: json['yearly_boost_count'],
        winnerOptions: List<StarGiveawayWinnerOption>.from(
            (json['winner_options'] ?? [])
                .map((item) => StarGiveawayWinnerOption.fromJson(item))
                .toList()),
        isDefault: json['is_default'],
        isAdditional: json['is_additional'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "currency": currency,
      "amount": amount,
      "star_count": starCount,
      "store_product_id": storeProductId,
      "yearly_boost_count": yearlyBoostCount,
      "winner_options": winnerOptions.map((i) => i.toJson()).toList(),
      "is_default": isDefault,
      "is_additional": isAdditional,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [currency]: ISO 4217 currency code for the payment
  /// * [amount]: The amount to pay, in the smallest units of the currency
  /// * [star_count]: Number of Telegram Stars that will be distributed among winners
  /// * [store_product_id]: Identifier of the store product associated with the option; may be empty if none
  /// * [yearly_boost_count]: Number of times the chat will be boosted for one year if the option is chosen
  /// * [winner_options]: Allowed options for the number of giveaway winners
  /// * [is_default]: True, if the option must be chosen by default
  /// * [is_additional]: True, if the option must be shown only in the full list of payment options
  StarGiveawayPaymentOption copyWith({
    String? currency,
    int? amount,
    int? starCount,
    String? storeProductId,
    int? yearlyBoostCount,
    List<StarGiveawayWinnerOption>? winnerOptions,
    bool? isDefault,
    bool? isAdditional,
  }) =>
      StarGiveawayPaymentOption(
        currency: currency ?? this.currency,
        amount: amount ?? this.amount,
        starCount: starCount ?? this.starCount,
        storeProductId: storeProductId ?? this.storeProductId,
        yearlyBoostCount: yearlyBoostCount ?? this.yearlyBoostCount,
        winnerOptions: winnerOptions ?? this.winnerOptions,
        isDefault: isDefault ?? this.isDefault,
        isAdditional: isAdditional ?? this.isAdditional,
      );

  /// TDLib object type
  static const String defaultObjectId = 'starGiveawayPaymentOption';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
