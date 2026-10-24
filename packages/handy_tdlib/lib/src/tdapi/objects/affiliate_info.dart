part of '../tdapi.dart';

/// **AffiliateInfo** *(affiliateInfo)* - basic class
///
/// Contains information about an affiliate that received commission from a Telegram Star transaction.
///
/// * [commissionPerMille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner.
/// * [affiliateChatId]: Identifier of the chat which received the commission.
/// * [starAmount]: The Telegram Star amount that was received by the affiliate; can be negative for refunds.
final class AffiliateInfo extends TdObject {
  /// **AffiliateInfo** *(affiliateInfo)* - basic class
  ///
  /// Contains information about an affiliate that received commission from a Telegram Star transaction.
  ///
  /// * [commissionPerMille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner.
  /// * [affiliateChatId]: Identifier of the chat which received the commission.
  /// * [starAmount]: The Telegram Star amount that was received by the affiliate; can be negative for refunds.
  const AffiliateInfo({
    required this.commissionPerMille,
    required this.affiliateChatId,
    required this.starAmount,
  });

  /// The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner
  final int commissionPerMille;

  /// Identifier of the chat which received the commission
  final int affiliateChatId;

  /// The Telegram Star amount that was received by the affiliate; can be negative for refunds
  final StarAmount starAmount;

  /// Parse from a json
  factory AffiliateInfo.fromJson(Map<String, dynamic> json) => AffiliateInfo(
        commissionPerMille: json['commission_per_mille'],
        affiliateChatId: json['affiliate_chat_id'],
        starAmount: StarAmount.fromJson(json['star_amount']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "commission_per_mille": commissionPerMille,
      "affiliate_chat_id": affiliateChatId,
      "star_amount": starAmount.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [commission_per_mille]: The number of Telegram Stars received by the affiliate for each 1000 Telegram Stars received by the program owner
  /// * [affiliate_chat_id]: Identifier of the chat which received the commission
  /// * [star_amount]: The Telegram Star amount that was received by the affiliate; can be negative for refunds
  AffiliateInfo copyWith({
    int? commissionPerMille,
    int? affiliateChatId,
    StarAmount? starAmount,
  }) =>
      AffiliateInfo(
        commissionPerMille: commissionPerMille ?? this.commissionPerMille,
        affiliateChatId: affiliateChatId ?? this.affiliateChatId,
        starAmount: starAmount ?? this.starAmount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'affiliateInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
