part of '../tdapi.dart';

/// **ChatBoostStatus** *(chatBoostStatus)* - basic class
///
/// Describes current boost status of a chat.
///
/// * [boostUrl]: An HTTP URL, which can be used to boost the chat.
/// * [appliedSlotIds]: Identifiers of boost slots of the current user applied to the chat.
/// * [level]: Current boost level of the chat.
/// * [giftCodeBoostCount]: The number of boosts received by the chat from created Telegram Premium gift codes and giveaways; always 0 if the current user isn't an administrator in the chat.
/// * [boostCount]: The number of boosts received by the chat.
/// * [currentLevelBoostCount]: The number of boosts added to reach the current level.
/// * [nextLevelBoostCount]: The number of boosts needed to reach the next level; 0 if the next level isn't available.
/// * [premiumMemberCount]: Approximate number of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat.
/// * [premiumMemberPercentage]: A percentage of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat.
/// * [prepaidGiveaways]: The list of prepaid giveaways available for the chat; only for chat administrators.
final class ChatBoostStatus extends TdObject {
  /// **ChatBoostStatus** *(chatBoostStatus)* - basic class
  ///
  /// Describes current boost status of a chat.
  ///
  /// * [boostUrl]: An HTTP URL, which can be used to boost the chat.
  /// * [appliedSlotIds]: Identifiers of boost slots of the current user applied to the chat.
  /// * [level]: Current boost level of the chat.
  /// * [giftCodeBoostCount]: The number of boosts received by the chat from created Telegram Premium gift codes and giveaways; always 0 if the current user isn't an administrator in the chat.
  /// * [boostCount]: The number of boosts received by the chat.
  /// * [currentLevelBoostCount]: The number of boosts added to reach the current level.
  /// * [nextLevelBoostCount]: The number of boosts needed to reach the next level; 0 if the next level isn't available.
  /// * [premiumMemberCount]: Approximate number of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat.
  /// * [premiumMemberPercentage]: A percentage of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat.
  /// * [prepaidGiveaways]: The list of prepaid giveaways available for the chat; only for chat administrators.
  const ChatBoostStatus({
    required this.boostUrl,
    required this.appliedSlotIds,
    required this.level,
    required this.giftCodeBoostCount,
    required this.boostCount,
    required this.currentLevelBoostCount,
    required this.nextLevelBoostCount,
    required this.premiumMemberCount,
    required this.premiumMemberPercentage,
    required this.prepaidGiveaways,
    this.extra,
    this.clientId,
  });

  /// An HTTP URL, which can be used to boost the chat
  final String boostUrl;

  /// Identifiers of boost slots of the current user applied to the chat
  final List<int> appliedSlotIds;

  /// Current boost level of the chat
  final int level;

  /// The number of boosts received by the chat from created Telegram Premium gift codes and giveaways; always 0 if the current user isn't an administrator in the chat
  final int giftCodeBoostCount;

  /// The number of boosts received by the chat
  final int boostCount;

  /// The number of boosts added to reach the current level
  final int currentLevelBoostCount;

  /// The number of boosts needed to reach the next level; 0 if the next level isn't available
  final int nextLevelBoostCount;

  /// Approximate number of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
  final int premiumMemberCount;

  /// A percentage of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
  final double premiumMemberPercentage;

  /// The list of prepaid giveaways available for the chat; only for chat administrators
  final List<PrepaidGiveaway> prepaidGiveaways;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatBoostStatus.fromJson(Map<String, dynamic> json) =>
      ChatBoostStatus(
        boostUrl: json['boost_url'],
        appliedSlotIds: List<int>.from(
            (json['applied_slot_ids'] ?? []).map((item) => item).toList()),
        level: json['level'],
        giftCodeBoostCount: json['gift_code_boost_count'],
        boostCount: json['boost_count'],
        currentLevelBoostCount: json['current_level_boost_count'],
        nextLevelBoostCount: json['next_level_boost_count'],
        premiumMemberCount: json['premium_member_count'],
        premiumMemberPercentage: json['premium_member_percentage'],
        prepaidGiveaways: List<PrepaidGiveaway>.from(
            (json['prepaid_giveaways'] ?? [])
                .map((item) => PrepaidGiveaway.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "boost_url": boostUrl,
      "applied_slot_ids": appliedSlotIds.map((i) => i).toList(),
      "level": level,
      "gift_code_boost_count": giftCodeBoostCount,
      "boost_count": boostCount,
      "current_level_boost_count": currentLevelBoostCount,
      "next_level_boost_count": nextLevelBoostCount,
      "premium_member_count": premiumMemberCount,
      "premium_member_percentage": premiumMemberPercentage,
      "prepaid_giveaways": prepaidGiveaways.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [boost_url]: An HTTP URL, which can be used to boost the chat
  /// * [applied_slot_ids]: Identifiers of boost slots of the current user applied to the chat
  /// * [level]: Current boost level of the chat
  /// * [gift_code_boost_count]: The number of boosts received by the chat from created Telegram Premium gift codes and giveaways; always 0 if the current user isn't an administrator in the chat
  /// * [boost_count]: The number of boosts received by the chat
  /// * [current_level_boost_count]: The number of boosts added to reach the current level
  /// * [next_level_boost_count]: The number of boosts needed to reach the next level; 0 if the next level isn't available
  /// * [premium_member_count]: Approximate number of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
  /// * [premium_member_percentage]: A percentage of Telegram Premium subscribers joined the chat; always 0 if the current user isn't an administrator in the chat
  /// * [prepaid_giveaways]: The list of prepaid giveaways available for the chat; only for chat administrators
  ChatBoostStatus copyWith({
    String? boostUrl,
    List<int>? appliedSlotIds,
    int? level,
    int? giftCodeBoostCount,
    int? boostCount,
    int? currentLevelBoostCount,
    int? nextLevelBoostCount,
    int? premiumMemberCount,
    double? premiumMemberPercentage,
    List<PrepaidGiveaway>? prepaidGiveaways,
    dynamic extra,
    int? clientId,
  }) =>
      ChatBoostStatus(
        boostUrl: boostUrl ?? this.boostUrl,
        appliedSlotIds: appliedSlotIds ?? this.appliedSlotIds,
        level: level ?? this.level,
        giftCodeBoostCount: giftCodeBoostCount ?? this.giftCodeBoostCount,
        boostCount: boostCount ?? this.boostCount,
        currentLevelBoostCount:
            currentLevelBoostCount ?? this.currentLevelBoostCount,
        nextLevelBoostCount: nextLevelBoostCount ?? this.nextLevelBoostCount,
        premiumMemberCount: premiumMemberCount ?? this.premiumMemberCount,
        premiumMemberPercentage:
            premiumMemberPercentage ?? this.premiumMemberPercentage,
        prepaidGiveaways: prepaidGiveaways ?? this.prepaidGiveaways,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostStatus';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
