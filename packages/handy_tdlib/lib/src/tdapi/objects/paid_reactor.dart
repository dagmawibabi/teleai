part of '../tdapi.dart';

/// **PaidReactor** *(paidReactor)* - basic class
///
/// Contains information about a user who added paid reactions.
///
/// * [senderId]: Identifier of the user or chat that added the reactions; may be null for anonymous reactors that aren't the current user *(optional)*.
/// * [starCount]: Number of Telegram Stars added.
/// * [isTop]: True, if the reactor is one of the most active reactors; may be false if the reactor is the current user.
/// * [isMe]: True, if the paid reaction was added by the current user.
/// * [isAnonymous]: True, if the reactor is anonymous.
final class PaidReactor extends TdObject {
  /// **PaidReactor** *(paidReactor)* - basic class
  ///
  /// Contains information about a user who added paid reactions.
  ///
  /// * [senderId]: Identifier of the user or chat that added the reactions; may be null for anonymous reactors that aren't the current user *(optional)*.
  /// * [starCount]: Number of Telegram Stars added.
  /// * [isTop]: True, if the reactor is one of the most active reactors; may be false if the reactor is the current user.
  /// * [isMe]: True, if the paid reaction was added by the current user.
  /// * [isAnonymous]: True, if the reactor is anonymous.
  const PaidReactor({
    this.senderId,
    required this.starCount,
    required this.isTop,
    required this.isMe,
    required this.isAnonymous,
  });

  /// Identifier of the user or chat that added the reactions; may be null for anonymous reactors that aren't the current user
  final MessageSender? senderId;

  /// Number of Telegram Stars added
  final int starCount;

  /// True, if the reactor is one of the most active reactors; may be false if the reactor is the current user
  final bool isTop;

  /// True, if the paid reaction was added by the current user
  final bool isMe;

  /// True, if the reactor is anonymous
  final bool isAnonymous;

  /// Parse from a json
  factory PaidReactor.fromJson(Map<String, dynamic> json) => PaidReactor(
        senderId: json['sender_id'] == null
            ? null
            : MessageSender.fromJson(json['sender_id']),
        starCount: json['star_count'],
        isTop: json['is_top'],
        isMe: json['is_me'],
        isAnonymous: json['is_anonymous'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_id": senderId?.toJson(),
      "star_count": starCount,
      "is_top": isTop,
      "is_me": isMe,
      "is_anonymous": isAnonymous,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_id]: Identifier of the user or chat that added the reactions; may be null for anonymous reactors that aren't the current user
  /// * [star_count]: Number of Telegram Stars added
  /// * [is_top]: True, if the reactor is one of the most active reactors; may be false if the reactor is the current user
  /// * [is_me]: True, if the paid reaction was added by the current user
  /// * [is_anonymous]: True, if the reactor is anonymous
  PaidReactor copyWith({
    MessageSender? senderId,
    int? starCount,
    bool? isTop,
    bool? isMe,
    bool? isAnonymous,
  }) =>
      PaidReactor(
        senderId: senderId ?? this.senderId,
        starCount: starCount ?? this.starCount,
        isTop: isTop ?? this.isTop,
        isMe: isMe ?? this.isMe,
        isAnonymous: isAnonymous ?? this.isAnonymous,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paidReactor';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
