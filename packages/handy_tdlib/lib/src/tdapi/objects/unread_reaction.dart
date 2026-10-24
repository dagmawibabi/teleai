part of '../tdapi.dart';

/// **UnreadReaction** *(unreadReaction)* - basic class
///
/// Contains information about an unread reaction to a message.
///
/// * [type]: Type of the reaction.
/// * [senderId]: Identifier of the sender, added the reaction.
/// * [isBig]: True, if the reaction was added with a big animation.
final class UnreadReaction extends TdObject {
  /// **UnreadReaction** *(unreadReaction)* - basic class
  ///
  /// Contains information about an unread reaction to a message.
  ///
  /// * [type]: Type of the reaction.
  /// * [senderId]: Identifier of the sender, added the reaction.
  /// * [isBig]: True, if the reaction was added with a big animation.
  const UnreadReaction({
    required this.type,
    required this.senderId,
    required this.isBig,
  });

  /// Type of the reaction
  final ReactionType type;

  /// Identifier of the sender, added the reaction
  final MessageSender senderId;

  /// True, if the reaction was added with a big animation
  final bool isBig;

  /// Parse from a json
  factory UnreadReaction.fromJson(Map<String, dynamic> json) => UnreadReaction(
        type: ReactionType.fromJson(json['type']),
        senderId: MessageSender.fromJson(json['sender_id']),
        isBig: json['is_big'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "sender_id": senderId.toJson(),
      "is_big": isBig,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Type of the reaction
  /// * [sender_id]: Identifier of the sender, added the reaction
  /// * [is_big]: True, if the reaction was added with a big animation
  UnreadReaction copyWith({
    ReactionType? type,
    MessageSender? senderId,
    bool? isBig,
  }) =>
      UnreadReaction(
        type: type ?? this.type,
        senderId: senderId ?? this.senderId,
        isBig: isBig ?? this.isBig,
      );

  /// TDLib object type
  static const String defaultObjectId = 'unreadReaction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
