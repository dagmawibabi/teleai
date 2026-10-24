part of '../tdapi.dart';

/// **MessageReactions** *(messageReactions)* - basic class
///
/// Contains a list of reactions added to a message.
///
/// * [reactions]: List of added reactions.
/// * [areTags]: True, if the reactions are tags and Telegram Premium users can filter messages by them.
/// * [paidReactors]: Information about top users that added the paid reaction.
/// * [canGetAddedReactions]: True, if the list of added reactions is available using getMessageAddedReactions.
final class MessageReactions extends TdObject {
  /// **MessageReactions** *(messageReactions)* - basic class
  ///
  /// Contains a list of reactions added to a message.
  ///
  /// * [reactions]: List of added reactions.
  /// * [areTags]: True, if the reactions are tags and Telegram Premium users can filter messages by them.
  /// * [paidReactors]: Information about top users that added the paid reaction.
  /// * [canGetAddedReactions]: True, if the list of added reactions is available using getMessageAddedReactions.
  const MessageReactions({
    required this.reactions,
    required this.areTags,
    required this.paidReactors,
    required this.canGetAddedReactions,
  });

  /// List of added reactions
  final List<MessageReaction> reactions;

  /// True, if the reactions are tags and Telegram Premium users can filter messages by them
  final bool areTags;

  /// Information about top users that added the paid reaction
  final List<PaidReactor> paidReactors;

  /// True, if the list of added reactions is available using getMessageAddedReactions
  final bool canGetAddedReactions;

  /// Parse from a json
  factory MessageReactions.fromJson(Map<String, dynamic> json) =>
      MessageReactions(
        reactions: List<MessageReaction>.from((json['reactions'] ?? [])
            .map((item) => MessageReaction.fromJson(item))
            .toList()),
        areTags: json['are_tags'],
        paidReactors: List<PaidReactor>.from((json['paid_reactors'] ?? [])
            .map((item) => PaidReactor.fromJson(item))
            .toList()),
        canGetAddedReactions: json['can_get_added_reactions'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "reactions": reactions.map((i) => i.toJson()).toList(),
      "are_tags": areTags,
      "paid_reactors": paidReactors.map((i) => i.toJson()).toList(),
      "can_get_added_reactions": canGetAddedReactions,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [reactions]: List of added reactions
  /// * [are_tags]: True, if the reactions are tags and Telegram Premium users can filter messages by them
  /// * [paid_reactors]: Information about top users that added the paid reaction
  /// * [can_get_added_reactions]: True, if the list of added reactions is available using getMessageAddedReactions
  MessageReactions copyWith({
    List<MessageReaction>? reactions,
    bool? areTags,
    List<PaidReactor>? paidReactors,
    bool? canGetAddedReactions,
  }) =>
      MessageReactions(
        reactions: reactions ?? this.reactions,
        areTags: areTags ?? this.areTags,
        paidReactors: paidReactors ?? this.paidReactors,
        canGetAddedReactions: canGetAddedReactions ?? this.canGetAddedReactions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'messageReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
