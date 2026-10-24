part of '../tdapi.dart';

/// **PollOptionProperties** *(pollOptionProperties)* - basic class
///
/// Contains properties of a poll option and describes actions that can be done with the option right now.
///
/// * [canBeDeleted]: True, if the option can be deleted using deletePollOption.
/// * [canBeReplied]: True, if the poll option can be replied in the same chat and forum topic using inputMessageReplyToMessage.
/// * [canBeRepliedInAnotherChat]: True, if the poll option can be replied in another chat or forum topic using inputMessageReplyToExternalMessage.
/// * [canGetLink]: True, if a link can be generated for the poll option using getMessageLink.
final class PollOptionProperties extends TdObject {
  /// **PollOptionProperties** *(pollOptionProperties)* - basic class
  ///
  /// Contains properties of a poll option and describes actions that can be done with the option right now.
  ///
  /// * [canBeDeleted]: True, if the option can be deleted using deletePollOption.
  /// * [canBeReplied]: True, if the poll option can be replied in the same chat and forum topic using inputMessageReplyToMessage.
  /// * [canBeRepliedInAnotherChat]: True, if the poll option can be replied in another chat or forum topic using inputMessageReplyToExternalMessage.
  /// * [canGetLink]: True, if a link can be generated for the poll option using getMessageLink.
  const PollOptionProperties({
    required this.canBeDeleted,
    required this.canBeReplied,
    required this.canBeRepliedInAnotherChat,
    required this.canGetLink,
    this.extra,
    this.clientId,
  });

  /// True, if the option can be deleted using deletePollOption
  final bool canBeDeleted;

  /// True, if the poll option can be replied in the same chat and forum topic using inputMessageReplyToMessage
  final bool canBeReplied;

  /// True, if the poll option can be replied in another chat or forum topic using inputMessageReplyToExternalMessage
  final bool canBeRepliedInAnotherChat;

  /// True, if a link can be generated for the poll option using getMessageLink
  final bool canGetLink;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PollOptionProperties.fromJson(Map<String, dynamic> json) =>
      PollOptionProperties(
        canBeDeleted: json['can_be_deleted'],
        canBeReplied: json['can_be_replied'],
        canBeRepliedInAnotherChat: json['can_be_replied_in_another_chat'],
        canGetLink: json['can_get_link'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_be_deleted": canBeDeleted,
      "can_be_replied": canBeReplied,
      "can_be_replied_in_another_chat": canBeRepliedInAnotherChat,
      "can_get_link": canGetLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_be_deleted]: True, if the option can be deleted using deletePollOption
  /// * [can_be_replied]: True, if the poll option can be replied in the same chat and forum topic using inputMessageReplyToMessage
  /// * [can_be_replied_in_another_chat]: True, if the poll option can be replied in another chat or forum topic using inputMessageReplyToExternalMessage
  /// * [can_get_link]: True, if a link can be generated for the poll option using getMessageLink
  PollOptionProperties copyWith({
    bool? canBeDeleted,
    bool? canBeReplied,
    bool? canBeRepliedInAnotherChat,
    bool? canGetLink,
    dynamic extra,
    int? clientId,
  }) =>
      PollOptionProperties(
        canBeDeleted: canBeDeleted ?? this.canBeDeleted,
        canBeReplied: canBeReplied ?? this.canBeReplied,
        canBeRepliedInAnotherChat:
            canBeRepliedInAnotherChat ?? this.canBeRepliedInAnotherChat,
        canGetLink: canGetLink ?? this.canGetLink,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'pollOptionProperties';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
