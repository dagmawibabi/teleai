part of '../tdapi.dart';

/// **AvailableReactions** *(availableReactions)* - basic class
///
/// Represents a list of reactions that can be added to a message.
///
/// * [topReactions]: List of reactions to be shown at the top.
/// * [recentReactions]: List of recently used reactions.
/// * [popularReactions]: List of popular reactions.
/// * [allowCustomEmoji]: True, if any custom emoji reaction can be added by Telegram Premium subscribers.
/// * [areTags]: True, if the reactions will be tags and the message can be found by them.
/// * [unavailabilityReason]: The reason why the current user can't add reactions to the message, despite some other users can; may be null if none *(optional)*.
final class AvailableReactions extends TdObject {
  /// **AvailableReactions** *(availableReactions)* - basic class
  ///
  /// Represents a list of reactions that can be added to a message.
  ///
  /// * [topReactions]: List of reactions to be shown at the top.
  /// * [recentReactions]: List of recently used reactions.
  /// * [popularReactions]: List of popular reactions.
  /// * [allowCustomEmoji]: True, if any custom emoji reaction can be added by Telegram Premium subscribers.
  /// * [areTags]: True, if the reactions will be tags and the message can be found by them.
  /// * [unavailabilityReason]: The reason why the current user can't add reactions to the message, despite some other users can; may be null if none *(optional)*.
  const AvailableReactions({
    required this.topReactions,
    required this.recentReactions,
    required this.popularReactions,
    required this.allowCustomEmoji,
    required this.areTags,
    this.unavailabilityReason,
    this.extra,
    this.clientId,
  });

  /// List of reactions to be shown at the top
  final List<AvailableReaction> topReactions;

  /// List of recently used reactions
  final List<AvailableReaction> recentReactions;

  /// List of popular reactions
  final List<AvailableReaction> popularReactions;

  /// True, if any custom emoji reaction can be added by Telegram Premium subscribers
  final bool allowCustomEmoji;

  /// True, if the reactions will be tags and the message can be found by them
  final bool areTags;

  /// The reason why the current user can't add reactions to the message, despite some other users can; may be null if none
  final ReactionUnavailabilityReason? unavailabilityReason;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AvailableReactions.fromJson(Map<String, dynamic> json) =>
      AvailableReactions(
        topReactions: List<AvailableReaction>.from((json['top_reactions'] ?? [])
            .map((item) => AvailableReaction.fromJson(item))
            .toList()),
        recentReactions: List<AvailableReaction>.from(
            (json['recent_reactions'] ?? [])
                .map((item) => AvailableReaction.fromJson(item))
                .toList()),
        popularReactions: List<AvailableReaction>.from(
            (json['popular_reactions'] ?? [])
                .map((item) => AvailableReaction.fromJson(item))
                .toList()),
        allowCustomEmoji: json['allow_custom_emoji'],
        areTags: json['are_tags'],
        unavailabilityReason: json['unavailability_reason'] == null
            ? null
            : ReactionUnavailabilityReason.fromJson(
                json['unavailability_reason']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "top_reactions": topReactions.map((i) => i.toJson()).toList(),
      "recent_reactions": recentReactions.map((i) => i.toJson()).toList(),
      "popular_reactions": popularReactions.map((i) => i.toJson()).toList(),
      "allow_custom_emoji": allowCustomEmoji,
      "are_tags": areTags,
      "unavailability_reason": unavailabilityReason?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [top_reactions]: List of reactions to be shown at the top
  /// * [recent_reactions]: List of recently used reactions
  /// * [popular_reactions]: List of popular reactions
  /// * [allow_custom_emoji]: True, if any custom emoji reaction can be added by Telegram Premium subscribers
  /// * [are_tags]: True, if the reactions will be tags and the message can be found by them
  /// * [unavailability_reason]: The reason why the current user can't add reactions to the message, despite some other users can; may be null if none
  AvailableReactions copyWith({
    List<AvailableReaction>? topReactions,
    List<AvailableReaction>? recentReactions,
    List<AvailableReaction>? popularReactions,
    bool? allowCustomEmoji,
    bool? areTags,
    ReactionUnavailabilityReason? unavailabilityReason,
    dynamic extra,
    int? clientId,
  }) =>
      AvailableReactions(
        topReactions: topReactions ?? this.topReactions,
        recentReactions: recentReactions ?? this.recentReactions,
        popularReactions: popularReactions ?? this.popularReactions,
        allowCustomEmoji: allowCustomEmoji ?? this.allowCustomEmoji,
        areTags: areTags ?? this.areTags,
        unavailabilityReason: unavailabilityReason ?? this.unavailabilityReason,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'availableReactions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
