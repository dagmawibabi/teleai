part of '../tdapi.dart';

/// **GiveawayParameters** *(giveawayParameters)* - basic class
///
/// Describes parameters of a giveaway.
///
/// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by the winners of the giveaway for duration of the Telegram Premium subscription,. or for the specified time. If the chat is a channel, then can_post_messages administrator right is required in the channel, otherwise, the user must be an administrator in the supergroup.
/// * [additionalChatIds]: Identifiers of other supergroup or channel chats that must be subscribed by the users to be eligible for the giveaway. There can be up to getOption("giveaway_additional_chat_count_max") additional chats.
/// * [winnersSelectionDate]: Point in time (Unix timestamp) when the giveaway is expected to be performed; must be 60-getOption("giveaway_duration_max") seconds in the future in scheduled giveaways.
/// * [onlyNewMembers]: True, if only new members of the chats will be eligible for the giveaway.
/// * [hasPublicWinners]: True, if the list of winners of the giveaway will be available to everyone.
/// * [countryCodes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be eligible for the giveaway. If empty, then all users can participate in the giveaway.. There can be up to getOption("giveaway_country_count_max") chosen countries. Users with phone number that was bought at https://fragment.com can participate in any giveaway and the country code "FT" must not be specified in the list.
/// * [prizeDescription]: Additional description of the giveaway prize; 0-128 characters.
final class GiveawayParameters extends TdObject {
  /// **GiveawayParameters** *(giveawayParameters)* - basic class
  ///
  /// Describes parameters of a giveaway.
  ///
  /// * [boostedChatId]: Identifier of the supergroup or channel chat, which will be automatically boosted by the winners of the giveaway for duration of the Telegram Premium subscription,. or for the specified time. If the chat is a channel, then can_post_messages administrator right is required in the channel, otherwise, the user must be an administrator in the supergroup.
  /// * [additionalChatIds]: Identifiers of other supergroup or channel chats that must be subscribed by the users to be eligible for the giveaway. There can be up to getOption("giveaway_additional_chat_count_max") additional chats.
  /// * [winnersSelectionDate]: Point in time (Unix timestamp) when the giveaway is expected to be performed; must be 60-getOption("giveaway_duration_max") seconds in the future in scheduled giveaways.
  /// * [onlyNewMembers]: True, if only new members of the chats will be eligible for the giveaway.
  /// * [hasPublicWinners]: True, if the list of winners of the giveaway will be available to everyone.
  /// * [countryCodes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be eligible for the giveaway. If empty, then all users can participate in the giveaway.. There can be up to getOption("giveaway_country_count_max") chosen countries. Users with phone number that was bought at https://fragment.com can participate in any giveaway and the country code "FT" must not be specified in the list.
  /// * [prizeDescription]: Additional description of the giveaway prize; 0-128 characters.
  const GiveawayParameters({
    required this.boostedChatId,
    required this.additionalChatIds,
    required this.winnersSelectionDate,
    required this.onlyNewMembers,
    required this.hasPublicWinners,
    required this.countryCodes,
    required this.prizeDescription,
  });

  /// Identifier of the supergroup or channel chat, which will be automatically boosted by the winners of the giveaway for duration of the Telegram Premium subscription,. or for the specified time. If the chat is a channel, then can_post_messages administrator right is required in the channel, otherwise, the user must be an administrator in the supergroup
  final int boostedChatId;

  /// Identifiers of other supergroup or channel chats that must be subscribed by the users to be eligible for the giveaway. There can be up to getOption("giveaway_additional_chat_count_max") additional chats
  final List<int> additionalChatIds;

  /// Point in time (Unix timestamp) when the giveaway is expected to be performed; must be 60-getOption("giveaway_duration_max") seconds in the future in scheduled giveaways
  final int winnersSelectionDate;

  /// True, if only new members of the chats will be eligible for the giveaway
  final bool onlyNewMembers;

  /// True, if the list of winners of the giveaway will be available to everyone
  final bool hasPublicWinners;

  /// The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be eligible for the giveaway. If empty, then all users can participate in the giveaway.. There can be up to getOption("giveaway_country_count_max") chosen countries. Users with phone number that was bought at https://fragment.com can participate in any giveaway and the country code "FT" must not be specified in the list
  final List<String> countryCodes;

  /// Additional description of the giveaway prize; 0-128 characters
  final String prizeDescription;

  /// Parse from a json
  factory GiveawayParameters.fromJson(Map<String, dynamic> json) =>
      GiveawayParameters(
        boostedChatId: json['boosted_chat_id'],
        additionalChatIds: List<int>.from(
            (json['additional_chat_ids'] ?? []).map((item) => item).toList()),
        winnersSelectionDate: json['winners_selection_date'],
        onlyNewMembers: json['only_new_members'],
        hasPublicWinners: json['has_public_winners'],
        countryCodes: List<String>.from(
            (json['country_codes'] ?? []).map((item) => item).toList()),
        prizeDescription: json['prize_description'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "boosted_chat_id": boostedChatId,
      "additional_chat_ids": additionalChatIds.map((i) => i).toList(),
      "winners_selection_date": winnersSelectionDate,
      "only_new_members": onlyNewMembers,
      "has_public_winners": hasPublicWinners,
      "country_codes": countryCodes.map((i) => i).toList(),
      "prize_description": prizeDescription,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [boosted_chat_id]: Identifier of the supergroup or channel chat, which will be automatically boosted by the winners of the giveaway for duration of the Telegram Premium subscription,. or for the specified time. If the chat is a channel, then can_post_messages administrator right is required in the channel, otherwise, the user must be an administrator in the supergroup
  /// * [additional_chat_ids]: Identifiers of other supergroup or channel chats that must be subscribed by the users to be eligible for the giveaway. There can be up to getOption("giveaway_additional_chat_count_max") additional chats
  /// * [winners_selection_date]: Point in time (Unix timestamp) when the giveaway is expected to be performed; must be 60-getOption("giveaway_duration_max") seconds in the future in scheduled giveaways
  /// * [only_new_members]: True, if only new members of the chats will be eligible for the giveaway
  /// * [has_public_winners]: True, if the list of winners of the giveaway will be available to everyone
  /// * [country_codes]: The list of two-letter ISO 3166-1 alpha-2 codes of countries, users from which will be eligible for the giveaway. If empty, then all users can participate in the giveaway.. There can be up to getOption("giveaway_country_count_max") chosen countries. Users with phone number that was bought at https://fragment.com can participate in any giveaway and the country code "FT" must not be specified in the list
  /// * [prize_description]: Additional description of the giveaway prize; 0-128 characters
  GiveawayParameters copyWith({
    int? boostedChatId,
    List<int>? additionalChatIds,
    int? winnersSelectionDate,
    bool? onlyNewMembers,
    bool? hasPublicWinners,
    List<String>? countryCodes,
    String? prizeDescription,
  }) =>
      GiveawayParameters(
        boostedChatId: boostedChatId ?? this.boostedChatId,
        additionalChatIds: additionalChatIds ?? this.additionalChatIds,
        winnersSelectionDate: winnersSelectionDate ?? this.winnersSelectionDate,
        onlyNewMembers: onlyNewMembers ?? this.onlyNewMembers,
        hasPublicWinners: hasPublicWinners ?? this.hasPublicWinners,
        countryCodes: countryCodes ?? this.countryCodes,
        prizeDescription: prizeDescription ?? this.prizeDescription,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giveawayParameters';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
