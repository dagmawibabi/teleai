part of '../tdapi.dart';

/// **ChatEventAction** *(chatEventAction)* - parent
///
/// Represents a chat event.
sealed class ChatEventAction extends TdObject {
  /// **ChatEventAction** *(chatEventAction)* - parent
  ///
  /// Represents a chat event.
  const ChatEventAction();

  /// a ChatEventAction return type can be :
  /// * [ChatEventMessageEdited]
  /// * [ChatEventMessageDeleted]
  /// * [ChatEventMessagePinned]
  /// * [ChatEventMessageUnpinned]
  /// * [ChatEventPollStopped]
  /// * [ChatEventMemberJoined]
  /// * [ChatEventMemberJoinedByInviteLink]
  /// * [ChatEventMemberJoinedByRequest]
  /// * [ChatEventMemberInvited]
  /// * [ChatEventMemberLeft]
  /// * [ChatEventMemberPromoted]
  /// * [ChatEventMemberRestricted]
  /// * [ChatEventMemberTagChanged]
  /// * [ChatEventMemberSubscriptionExtended]
  /// * [ChatEventAvailableReactionsChanged]
  /// * [ChatEventBackgroundChanged]
  /// * [ChatEventDescriptionChanged]
  /// * [ChatEventEmojiStatusChanged]
  /// * [ChatEventLinkedChatChanged]
  /// * [ChatEventLocationChanged]
  /// * [ChatEventMessageAutoDeleteTimeChanged]
  /// * [ChatEventPermissionsChanged]
  /// * [ChatEventPhotoChanged]
  /// * [ChatEventSlowModeDelayChanged]
  /// * [ChatEventStickerSetChanged]
  /// * [ChatEventCustomEmojiStickerSetChanged]
  /// * [ChatEventTitleChanged]
  /// * [ChatEventUsernameChanged]
  /// * [ChatEventActiveUsernamesChanged]
  /// * [ChatEventAccentColorChanged]
  /// * [ChatEventProfileAccentColorChanged]
  /// * [ChatEventHasProtectedContentToggled]
  /// * [ChatEventInvitesToggled]
  /// * [ChatEventIsAllHistoryAvailableToggled]
  /// * [ChatEventHasAggressiveAntiSpamEnabledToggled]
  /// * [ChatEventSignMessagesToggled]
  /// * [ChatEventShowMessageSenderToggled]
  /// * [ChatEventAutomaticTranslationToggled]
  /// * [ChatEventInviteLinkEdited]
  /// * [ChatEventInviteLinkRevoked]
  /// * [ChatEventInviteLinkDeleted]
  /// * [ChatEventVideoChatCreated]
  /// * [ChatEventVideoChatEnded]
  /// * [ChatEventVideoChatMuteNewParticipantsToggled]
  /// * [ChatEventVideoChatParticipantIsMutedToggled]
  /// * [ChatEventVideoChatParticipantVolumeLevelChanged]
  /// * [ChatEventIsForumToggled]
  /// * [ChatEventForumTopicCreated]
  /// * [ChatEventForumTopicEdited]
  /// * [ChatEventForumTopicToggleIsClosed]
  /// * [ChatEventForumTopicToggleIsHidden]
  /// * [ChatEventForumTopicDeleted]
  /// * [ChatEventForumTopicPinned]
  factory ChatEventAction.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case ChatEventMessageEdited.defaultObjectId:
        return ChatEventMessageEdited.fromJson(json);
      case ChatEventMessageDeleted.defaultObjectId:
        return ChatEventMessageDeleted.fromJson(json);
      case ChatEventMessagePinned.defaultObjectId:
        return ChatEventMessagePinned.fromJson(json);
      case ChatEventMessageUnpinned.defaultObjectId:
        return ChatEventMessageUnpinned.fromJson(json);
      case ChatEventPollStopped.defaultObjectId:
        return ChatEventPollStopped.fromJson(json);
      case ChatEventMemberJoined.defaultObjectId:
        return ChatEventMemberJoined.fromJson(json);
      case ChatEventMemberJoinedByInviteLink.defaultObjectId:
        return ChatEventMemberJoinedByInviteLink.fromJson(json);
      case ChatEventMemberJoinedByRequest.defaultObjectId:
        return ChatEventMemberJoinedByRequest.fromJson(json);
      case ChatEventMemberInvited.defaultObjectId:
        return ChatEventMemberInvited.fromJson(json);
      case ChatEventMemberLeft.defaultObjectId:
        return ChatEventMemberLeft.fromJson(json);
      case ChatEventMemberPromoted.defaultObjectId:
        return ChatEventMemberPromoted.fromJson(json);
      case ChatEventMemberRestricted.defaultObjectId:
        return ChatEventMemberRestricted.fromJson(json);
      case ChatEventMemberTagChanged.defaultObjectId:
        return ChatEventMemberTagChanged.fromJson(json);
      case ChatEventMemberSubscriptionExtended.defaultObjectId:
        return ChatEventMemberSubscriptionExtended.fromJson(json);
      case ChatEventAvailableReactionsChanged.defaultObjectId:
        return ChatEventAvailableReactionsChanged.fromJson(json);
      case ChatEventBackgroundChanged.defaultObjectId:
        return ChatEventBackgroundChanged.fromJson(json);
      case ChatEventDescriptionChanged.defaultObjectId:
        return ChatEventDescriptionChanged.fromJson(json);
      case ChatEventEmojiStatusChanged.defaultObjectId:
        return ChatEventEmojiStatusChanged.fromJson(json);
      case ChatEventLinkedChatChanged.defaultObjectId:
        return ChatEventLinkedChatChanged.fromJson(json);
      case ChatEventLocationChanged.defaultObjectId:
        return ChatEventLocationChanged.fromJson(json);
      case ChatEventMessageAutoDeleteTimeChanged.defaultObjectId:
        return ChatEventMessageAutoDeleteTimeChanged.fromJson(json);
      case ChatEventPermissionsChanged.defaultObjectId:
        return ChatEventPermissionsChanged.fromJson(json);
      case ChatEventPhotoChanged.defaultObjectId:
        return ChatEventPhotoChanged.fromJson(json);
      case ChatEventSlowModeDelayChanged.defaultObjectId:
        return ChatEventSlowModeDelayChanged.fromJson(json);
      case ChatEventStickerSetChanged.defaultObjectId:
        return ChatEventStickerSetChanged.fromJson(json);
      case ChatEventCustomEmojiStickerSetChanged.defaultObjectId:
        return ChatEventCustomEmojiStickerSetChanged.fromJson(json);
      case ChatEventTitleChanged.defaultObjectId:
        return ChatEventTitleChanged.fromJson(json);
      case ChatEventUsernameChanged.defaultObjectId:
        return ChatEventUsernameChanged.fromJson(json);
      case ChatEventActiveUsernamesChanged.defaultObjectId:
        return ChatEventActiveUsernamesChanged.fromJson(json);
      case ChatEventAccentColorChanged.defaultObjectId:
        return ChatEventAccentColorChanged.fromJson(json);
      case ChatEventProfileAccentColorChanged.defaultObjectId:
        return ChatEventProfileAccentColorChanged.fromJson(json);
      case ChatEventHasProtectedContentToggled.defaultObjectId:
        return ChatEventHasProtectedContentToggled.fromJson(json);
      case ChatEventInvitesToggled.defaultObjectId:
        return ChatEventInvitesToggled.fromJson(json);
      case ChatEventIsAllHistoryAvailableToggled.defaultObjectId:
        return ChatEventIsAllHistoryAvailableToggled.fromJson(json);
      case ChatEventHasAggressiveAntiSpamEnabledToggled.defaultObjectId:
        return ChatEventHasAggressiveAntiSpamEnabledToggled.fromJson(json);
      case ChatEventSignMessagesToggled.defaultObjectId:
        return ChatEventSignMessagesToggled.fromJson(json);
      case ChatEventShowMessageSenderToggled.defaultObjectId:
        return ChatEventShowMessageSenderToggled.fromJson(json);
      case ChatEventAutomaticTranslationToggled.defaultObjectId:
        return ChatEventAutomaticTranslationToggled.fromJson(json);
      case ChatEventInviteLinkEdited.defaultObjectId:
        return ChatEventInviteLinkEdited.fromJson(json);
      case ChatEventInviteLinkRevoked.defaultObjectId:
        return ChatEventInviteLinkRevoked.fromJson(json);
      case ChatEventInviteLinkDeleted.defaultObjectId:
        return ChatEventInviteLinkDeleted.fromJson(json);
      case ChatEventVideoChatCreated.defaultObjectId:
        return ChatEventVideoChatCreated.fromJson(json);
      case ChatEventVideoChatEnded.defaultObjectId:
        return ChatEventVideoChatEnded.fromJson(json);
      case ChatEventVideoChatMuteNewParticipantsToggled.defaultObjectId:
        return ChatEventVideoChatMuteNewParticipantsToggled.fromJson(json);
      case ChatEventVideoChatParticipantIsMutedToggled.defaultObjectId:
        return ChatEventVideoChatParticipantIsMutedToggled.fromJson(json);
      case ChatEventVideoChatParticipantVolumeLevelChanged.defaultObjectId:
        return ChatEventVideoChatParticipantVolumeLevelChanged.fromJson(json);
      case ChatEventIsForumToggled.defaultObjectId:
        return ChatEventIsForumToggled.fromJson(json);
      case ChatEventForumTopicCreated.defaultObjectId:
        return ChatEventForumTopicCreated.fromJson(json);
      case ChatEventForumTopicEdited.defaultObjectId:
        return ChatEventForumTopicEdited.fromJson(json);
      case ChatEventForumTopicToggleIsClosed.defaultObjectId:
        return ChatEventForumTopicToggleIsClosed.fromJson(json);
      case ChatEventForumTopicToggleIsHidden.defaultObjectId:
        return ChatEventForumTopicToggleIsHidden.fromJson(json);
      case ChatEventForumTopicDeleted.defaultObjectId:
        return ChatEventForumTopicDeleted.fromJson(json);
      case ChatEventForumTopicPinned.defaultObjectId:
        return ChatEventForumTopicPinned.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of ChatEventAction)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  ChatEventAction copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'chatEventAction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMessageEdited** *(chatEventMessageEdited)* - child of ChatEventAction
///
/// A message was edited.
///
/// * [oldMessage]: The original message before the edit.
/// * [newMessage]: The message after it was edited.
final class ChatEventMessageEdited extends ChatEventAction {
  /// **ChatEventMessageEdited** *(chatEventMessageEdited)* - child of ChatEventAction
  ///
  /// A message was edited.
  ///
  /// * [oldMessage]: The original message before the edit.
  /// * [newMessage]: The message after it was edited.
  const ChatEventMessageEdited({
    required this.oldMessage,
    required this.newMessage,
  });

  /// The original message before the edit
  final Message oldMessage;

  /// The message after it was edited
  final Message newMessage;

  /// Parse from a json
  factory ChatEventMessageEdited.fromJson(Map<String, dynamic> json) =>
      ChatEventMessageEdited(
        oldMessage: Message.fromJson(json['old_message']),
        newMessage: Message.fromJson(json['new_message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_message": oldMessage.toJson(),
      "new_message": newMessage.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_message]: The original message before the edit
  /// * [new_message]: The message after it was edited
  @override
  ChatEventMessageEdited copyWith({
    Message? oldMessage,
    Message? newMessage,
  }) =>
      ChatEventMessageEdited(
        oldMessage: oldMessage ?? this.oldMessage,
        newMessage: newMessage ?? this.newMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMessageEdited';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMessageDeleted** *(chatEventMessageDeleted)* - child of ChatEventAction
///
/// A message was deleted.
///
/// * [message]: Deleted message.
/// * [canReportAntiSpamFalsePositive]: True, if the message deletion can be reported via reportSupergroupAntiSpamFalsePositive.
final class ChatEventMessageDeleted extends ChatEventAction {
  /// **ChatEventMessageDeleted** *(chatEventMessageDeleted)* - child of ChatEventAction
  ///
  /// A message was deleted.
  ///
  /// * [message]: Deleted message.
  /// * [canReportAntiSpamFalsePositive]: True, if the message deletion can be reported via reportSupergroupAntiSpamFalsePositive.
  const ChatEventMessageDeleted({
    required this.message,
    required this.canReportAntiSpamFalsePositive,
  });

  /// Deleted message
  final Message message;

  /// True, if the message deletion can be reported via reportSupergroupAntiSpamFalsePositive
  final bool canReportAntiSpamFalsePositive;

  /// Parse from a json
  factory ChatEventMessageDeleted.fromJson(Map<String, dynamic> json) =>
      ChatEventMessageDeleted(
        message: Message.fromJson(json['message']),
        canReportAntiSpamFalsePositive:
            json['can_report_anti_spam_false_positive'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
      "can_report_anti_spam_false_positive": canReportAntiSpamFalsePositive,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: Deleted message
  /// * [can_report_anti_spam_false_positive]: True, if the message deletion can be reported via reportSupergroupAntiSpamFalsePositive
  @override
  ChatEventMessageDeleted copyWith({
    Message? message,
    bool? canReportAntiSpamFalsePositive,
  }) =>
      ChatEventMessageDeleted(
        message: message ?? this.message,
        canReportAntiSpamFalsePositive: canReportAntiSpamFalsePositive ??
            this.canReportAntiSpamFalsePositive,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMessageDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMessagePinned** *(chatEventMessagePinned)* - child of ChatEventAction
///
/// A message was pinned.
///
/// * [message]: Pinned message.
final class ChatEventMessagePinned extends ChatEventAction {
  /// **ChatEventMessagePinned** *(chatEventMessagePinned)* - child of ChatEventAction
  ///
  /// A message was pinned.
  ///
  /// * [message]: Pinned message.
  const ChatEventMessagePinned({
    required this.message,
  });

  /// Pinned message
  final Message message;

  /// Parse from a json
  factory ChatEventMessagePinned.fromJson(Map<String, dynamic> json) =>
      ChatEventMessagePinned(
        message: Message.fromJson(json['message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: Pinned message
  @override
  ChatEventMessagePinned copyWith({
    Message? message,
  }) =>
      ChatEventMessagePinned(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMessagePinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMessageUnpinned** *(chatEventMessageUnpinned)* - child of ChatEventAction
///
/// A message was unpinned.
///
/// * [message]: Unpinned message.
final class ChatEventMessageUnpinned extends ChatEventAction {
  /// **ChatEventMessageUnpinned** *(chatEventMessageUnpinned)* - child of ChatEventAction
  ///
  /// A message was unpinned.
  ///
  /// * [message]: Unpinned message.
  const ChatEventMessageUnpinned({
    required this.message,
  });

  /// Unpinned message
  final Message message;

  /// Parse from a json
  factory ChatEventMessageUnpinned.fromJson(Map<String, dynamic> json) =>
      ChatEventMessageUnpinned(
        message: Message.fromJson(json['message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: Unpinned message
  @override
  ChatEventMessageUnpinned copyWith({
    Message? message,
  }) =>
      ChatEventMessageUnpinned(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMessageUnpinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventPollStopped** *(chatEventPollStopped)* - child of ChatEventAction
///
/// A poll in a message was stopped.
///
/// * [message]: The message with the poll.
final class ChatEventPollStopped extends ChatEventAction {
  /// **ChatEventPollStopped** *(chatEventPollStopped)* - child of ChatEventAction
  ///
  /// A poll in a message was stopped.
  ///
  /// * [message]: The message with the poll.
  const ChatEventPollStopped({
    required this.message,
  });

  /// The message with the poll
  final Message message;

  /// Parse from a json
  factory ChatEventPollStopped.fromJson(Map<String, dynamic> json) =>
      ChatEventPollStopped(
        message: Message.fromJson(json['message']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "message": message.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message]: The message with the poll
  @override
  ChatEventPollStopped copyWith({
    Message? message,
  }) =>
      ChatEventPollStopped(
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventPollStopped';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberJoined** *(chatEventMemberJoined)* - child of ChatEventAction
///
/// A new member joined the chat.
final class ChatEventMemberJoined extends ChatEventAction {
  /// **ChatEventMemberJoined** *(chatEventMemberJoined)* - child of ChatEventAction
  ///
  /// A new member joined the chat.
  const ChatEventMemberJoined();

  /// Parse from a json
  factory ChatEventMemberJoined.fromJson(Map<String, dynamic> json) =>
      const ChatEventMemberJoined();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatEventMemberJoined copyWith() => const ChatEventMemberJoined();

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberJoined';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberJoinedByInviteLink** *(chatEventMemberJoinedByInviteLink)* - child of ChatEventAction
///
/// A new member joined the chat via an invite link.
///
/// * [inviteLink]: Invite link used to join the chat.
/// * [viaChatFolderInviteLink]: True, if the user has joined the chat using an invite link for a chat folder.
final class ChatEventMemberJoinedByInviteLink extends ChatEventAction {
  /// **ChatEventMemberJoinedByInviteLink** *(chatEventMemberJoinedByInviteLink)* - child of ChatEventAction
  ///
  /// A new member joined the chat via an invite link.
  ///
  /// * [inviteLink]: Invite link used to join the chat.
  /// * [viaChatFolderInviteLink]: True, if the user has joined the chat using an invite link for a chat folder.
  const ChatEventMemberJoinedByInviteLink({
    required this.inviteLink,
    required this.viaChatFolderInviteLink,
  });

  /// Invite link used to join the chat
  final ChatInviteLink inviteLink;

  /// True, if the user has joined the chat using an invite link for a chat folder
  final bool viaChatFolderInviteLink;

  /// Parse from a json
  factory ChatEventMemberJoinedByInviteLink.fromJson(
          Map<String, dynamic> json) =>
      ChatEventMemberJoinedByInviteLink(
        inviteLink: ChatInviteLink.fromJson(json['invite_link']),
        viaChatFolderInviteLink: json['via_chat_folder_invite_link'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink.toJson(),
      "via_chat_folder_invite_link": viaChatFolderInviteLink,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Invite link used to join the chat
  /// * [via_chat_folder_invite_link]: True, if the user has joined the chat using an invite link for a chat folder
  @override
  ChatEventMemberJoinedByInviteLink copyWith({
    ChatInviteLink? inviteLink,
    bool? viaChatFolderInviteLink,
  }) =>
      ChatEventMemberJoinedByInviteLink(
        inviteLink: inviteLink ?? this.inviteLink,
        viaChatFolderInviteLink:
            viaChatFolderInviteLink ?? this.viaChatFolderInviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberJoinedByInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberJoinedByRequest** *(chatEventMemberJoinedByRequest)* - child of ChatEventAction
///
/// A new member was accepted to the chat by an administrator.
///
/// * [approverUserId]: User identifier of the chat administrator, approved user join request.
/// * [inviteLink]: Invite link used to join the chat; may be null *(optional)*.
final class ChatEventMemberJoinedByRequest extends ChatEventAction {
  /// **ChatEventMemberJoinedByRequest** *(chatEventMemberJoinedByRequest)* - child of ChatEventAction
  ///
  /// A new member was accepted to the chat by an administrator.
  ///
  /// * [approverUserId]: User identifier of the chat administrator, approved user join request.
  /// * [inviteLink]: Invite link used to join the chat; may be null *(optional)*.
  const ChatEventMemberJoinedByRequest({
    required this.approverUserId,
    this.inviteLink,
  });

  /// User identifier of the chat administrator, approved user join request
  final int approverUserId;

  /// Invite link used to join the chat; may be null
  final ChatInviteLink? inviteLink;

  /// Parse from a json
  factory ChatEventMemberJoinedByRequest.fromJson(Map<String, dynamic> json) =>
      ChatEventMemberJoinedByRequest(
        approverUserId: json['approver_user_id'],
        inviteLink: json['invite_link'] == null
            ? null
            : ChatInviteLink.fromJson(json['invite_link']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "approver_user_id": approverUserId,
      "invite_link": inviteLink?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [approver_user_id]: User identifier of the chat administrator, approved user join request
  /// * [invite_link]: Invite link used to join the chat; may be null
  @override
  ChatEventMemberJoinedByRequest copyWith({
    int? approverUserId,
    ChatInviteLink? inviteLink,
  }) =>
      ChatEventMemberJoinedByRequest(
        approverUserId: approverUserId ?? this.approverUserId,
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberJoinedByRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberInvited** *(chatEventMemberInvited)* - child of ChatEventAction
///
/// A new chat member was invited.
///
/// * [userId]: New member user identifier.
/// * [status]: New member status.
final class ChatEventMemberInvited extends ChatEventAction {
  /// **ChatEventMemberInvited** *(chatEventMemberInvited)* - child of ChatEventAction
  ///
  /// A new chat member was invited.
  ///
  /// * [userId]: New member user identifier.
  /// * [status]: New member status.
  const ChatEventMemberInvited({
    required this.userId,
    required this.status,
  });

  /// New member user identifier
  final int userId;

  /// New member status
  final ChatMemberStatus status;

  /// Parse from a json
  factory ChatEventMemberInvited.fromJson(Map<String, dynamic> json) =>
      ChatEventMemberInvited(
        userId: json['user_id'],
        status: ChatMemberStatus.fromJson(json['status']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "status": status.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: New member user identifier
  /// * [status]: New member status
  @override
  ChatEventMemberInvited copyWith({
    int? userId,
    ChatMemberStatus? status,
  }) =>
      ChatEventMemberInvited(
        userId: userId ?? this.userId,
        status: status ?? this.status,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberInvited';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberLeft** *(chatEventMemberLeft)* - child of ChatEventAction
///
/// A member left the chat.
final class ChatEventMemberLeft extends ChatEventAction {
  /// **ChatEventMemberLeft** *(chatEventMemberLeft)* - child of ChatEventAction
  ///
  /// A member left the chat.
  const ChatEventMemberLeft();

  /// Parse from a json
  factory ChatEventMemberLeft.fromJson(Map<String, dynamic> json) =>
      const ChatEventMemberLeft();

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
    };
  }

  /// Copy instance with no modifications.
  @override
  ChatEventMemberLeft copyWith() => const ChatEventMemberLeft();

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberLeft';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberPromoted** *(chatEventMemberPromoted)* - child of ChatEventAction
///
/// A chat member has gained/lost administrator status, or the list of their administrator privileges has changed.
///
/// * [userId]: Affected chat member user identifier.
/// * [oldStatus]: Previous status of the chat member.
/// * [newStatus]: New status of the chat member.
final class ChatEventMemberPromoted extends ChatEventAction {
  /// **ChatEventMemberPromoted** *(chatEventMemberPromoted)* - child of ChatEventAction
  ///
  /// A chat member has gained/lost administrator status, or the list of their administrator privileges has changed.
  ///
  /// * [userId]: Affected chat member user identifier.
  /// * [oldStatus]: Previous status of the chat member.
  /// * [newStatus]: New status of the chat member.
  const ChatEventMemberPromoted({
    required this.userId,
    required this.oldStatus,
    required this.newStatus,
  });

  /// Affected chat member user identifier
  final int userId;

  /// Previous status of the chat member
  final ChatMemberStatus oldStatus;

  /// New status of the chat member
  final ChatMemberStatus newStatus;

  /// Parse from a json
  factory ChatEventMemberPromoted.fromJson(Map<String, dynamic> json) =>
      ChatEventMemberPromoted(
        userId: json['user_id'],
        oldStatus: ChatMemberStatus.fromJson(json['old_status']),
        newStatus: ChatMemberStatus.fromJson(json['new_status']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "old_status": oldStatus.toJson(),
      "new_status": newStatus.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Affected chat member user identifier
  /// * [old_status]: Previous status of the chat member
  /// * [new_status]: New status of the chat member
  @override
  ChatEventMemberPromoted copyWith({
    int? userId,
    ChatMemberStatus? oldStatus,
    ChatMemberStatus? newStatus,
  }) =>
      ChatEventMemberPromoted(
        userId: userId ?? this.userId,
        oldStatus: oldStatus ?? this.oldStatus,
        newStatus: newStatus ?? this.newStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberPromoted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberRestricted** *(chatEventMemberRestricted)* - child of ChatEventAction
///
/// A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed.
///
/// * [memberId]: Affected chat member identifier.
/// * [oldStatus]: Previous status of the chat member.
/// * [newStatus]: New status of the chat member.
final class ChatEventMemberRestricted extends ChatEventAction {
  /// **ChatEventMemberRestricted** *(chatEventMemberRestricted)* - child of ChatEventAction
  ///
  /// A chat member was restricted/unrestricted or banned/unbanned, or the list of their restrictions has changed.
  ///
  /// * [memberId]: Affected chat member identifier.
  /// * [oldStatus]: Previous status of the chat member.
  /// * [newStatus]: New status of the chat member.
  const ChatEventMemberRestricted({
    required this.memberId,
    required this.oldStatus,
    required this.newStatus,
  });

  /// Affected chat member identifier
  final MessageSender memberId;

  /// Previous status of the chat member
  final ChatMemberStatus oldStatus;

  /// New status of the chat member
  final ChatMemberStatus newStatus;

  /// Parse from a json
  factory ChatEventMemberRestricted.fromJson(Map<String, dynamic> json) =>
      ChatEventMemberRestricted(
        memberId: MessageSender.fromJson(json['member_id']),
        oldStatus: ChatMemberStatus.fromJson(json['old_status']),
        newStatus: ChatMemberStatus.fromJson(json['new_status']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "member_id": memberId.toJson(),
      "old_status": oldStatus.toJson(),
      "new_status": newStatus.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [member_id]: Affected chat member identifier
  /// * [old_status]: Previous status of the chat member
  /// * [new_status]: New status of the chat member
  @override
  ChatEventMemberRestricted copyWith({
    MessageSender? memberId,
    ChatMemberStatus? oldStatus,
    ChatMemberStatus? newStatus,
  }) =>
      ChatEventMemberRestricted(
        memberId: memberId ?? this.memberId,
        oldStatus: oldStatus ?? this.oldStatus,
        newStatus: newStatus ?? this.newStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberRestricted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberTagChanged** *(chatEventMemberTagChanged)* - child of ChatEventAction
///
/// A chat member tag has been changed.
///
/// * [userId]: Affected chat member user identifier.
/// * [oldTag]: Previous tag of the chat member.
/// * [newTag]: New tag of the chat member.
final class ChatEventMemberTagChanged extends ChatEventAction {
  /// **ChatEventMemberTagChanged** *(chatEventMemberTagChanged)* - child of ChatEventAction
  ///
  /// A chat member tag has been changed.
  ///
  /// * [userId]: Affected chat member user identifier.
  /// * [oldTag]: Previous tag of the chat member.
  /// * [newTag]: New tag of the chat member.
  const ChatEventMemberTagChanged({
    required this.userId,
    required this.oldTag,
    required this.newTag,
  });

  /// Affected chat member user identifier
  final int userId;

  /// Previous tag of the chat member
  final String oldTag;

  /// New tag of the chat member
  final String newTag;

  /// Parse from a json
  factory ChatEventMemberTagChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventMemberTagChanged(
        userId: json['user_id'],
        oldTag: json['old_tag'],
        newTag: json['new_tag'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "old_tag": oldTag,
      "new_tag": newTag,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Affected chat member user identifier
  /// * [old_tag]: Previous tag of the chat member
  /// * [new_tag]: New tag of the chat member
  @override
  ChatEventMemberTagChanged copyWith({
    int? userId,
    String? oldTag,
    String? newTag,
  }) =>
      ChatEventMemberTagChanged(
        userId: userId ?? this.userId,
        oldTag: oldTag ?? this.oldTag,
        newTag: newTag ?? this.newTag,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberTagChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMemberSubscriptionExtended** *(chatEventMemberSubscriptionExtended)* - child of ChatEventAction
///
/// A chat member extended their subscription to the chat.
///
/// * [userId]: Affected chat member user identifier.
/// * [oldStatus]: Previous status of the chat member.
/// * [newStatus]: New status of the chat member.
final class ChatEventMemberSubscriptionExtended extends ChatEventAction {
  /// **ChatEventMemberSubscriptionExtended** *(chatEventMemberSubscriptionExtended)* - child of ChatEventAction
  ///
  /// A chat member extended their subscription to the chat.
  ///
  /// * [userId]: Affected chat member user identifier.
  /// * [oldStatus]: Previous status of the chat member.
  /// * [newStatus]: New status of the chat member.
  const ChatEventMemberSubscriptionExtended({
    required this.userId,
    required this.oldStatus,
    required this.newStatus,
  });

  /// Affected chat member user identifier
  final int userId;

  /// Previous status of the chat member
  final ChatMemberStatus oldStatus;

  /// New status of the chat member
  final ChatMemberStatus newStatus;

  /// Parse from a json
  factory ChatEventMemberSubscriptionExtended.fromJson(
          Map<String, dynamic> json) =>
      ChatEventMemberSubscriptionExtended(
        userId: json['user_id'],
        oldStatus: ChatMemberStatus.fromJson(json['old_status']),
        newStatus: ChatMemberStatus.fromJson(json['new_status']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "old_status": oldStatus.toJson(),
      "new_status": newStatus.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Affected chat member user identifier
  /// * [old_status]: Previous status of the chat member
  /// * [new_status]: New status of the chat member
  @override
  ChatEventMemberSubscriptionExtended copyWith({
    int? userId,
    ChatMemberStatus? oldStatus,
    ChatMemberStatus? newStatus,
  }) =>
      ChatEventMemberSubscriptionExtended(
        userId: userId ?? this.userId,
        oldStatus: oldStatus ?? this.oldStatus,
        newStatus: newStatus ?? this.newStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMemberSubscriptionExtended';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventAvailableReactionsChanged** *(chatEventAvailableReactionsChanged)* - child of ChatEventAction
///
/// The chat available reactions were changed.
///
/// * [oldAvailableReactions]: Previous chat available reactions.
/// * [newAvailableReactions]: New chat available reactions.
final class ChatEventAvailableReactionsChanged extends ChatEventAction {
  /// **ChatEventAvailableReactionsChanged** *(chatEventAvailableReactionsChanged)* - child of ChatEventAction
  ///
  /// The chat available reactions were changed.
  ///
  /// * [oldAvailableReactions]: Previous chat available reactions.
  /// * [newAvailableReactions]: New chat available reactions.
  const ChatEventAvailableReactionsChanged({
    required this.oldAvailableReactions,
    required this.newAvailableReactions,
  });

  /// Previous chat available reactions
  final ChatAvailableReactions oldAvailableReactions;

  /// New chat available reactions
  final ChatAvailableReactions newAvailableReactions;

  /// Parse from a json
  factory ChatEventAvailableReactionsChanged.fromJson(
          Map<String, dynamic> json) =>
      ChatEventAvailableReactionsChanged(
        oldAvailableReactions:
            ChatAvailableReactions.fromJson(json['old_available_reactions']),
        newAvailableReactions:
            ChatAvailableReactions.fromJson(json['new_available_reactions']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_available_reactions": oldAvailableReactions.toJson(),
      "new_available_reactions": newAvailableReactions.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_available_reactions]: Previous chat available reactions
  /// * [new_available_reactions]: New chat available reactions
  @override
  ChatEventAvailableReactionsChanged copyWith({
    ChatAvailableReactions? oldAvailableReactions,
    ChatAvailableReactions? newAvailableReactions,
  }) =>
      ChatEventAvailableReactionsChanged(
        oldAvailableReactions:
            oldAvailableReactions ?? this.oldAvailableReactions,
        newAvailableReactions:
            newAvailableReactions ?? this.newAvailableReactions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventAvailableReactionsChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventBackgroundChanged** *(chatEventBackgroundChanged)* - child of ChatEventAction
///
/// The chat background was changed.
///
/// * [oldBackground]: Previous background; may be null if none *(optional)*.
/// * [newBackground]: New background; may be null if none *(optional)*.
final class ChatEventBackgroundChanged extends ChatEventAction {
  /// **ChatEventBackgroundChanged** *(chatEventBackgroundChanged)* - child of ChatEventAction
  ///
  /// The chat background was changed.
  ///
  /// * [oldBackground]: Previous background; may be null if none *(optional)*.
  /// * [newBackground]: New background; may be null if none *(optional)*.
  const ChatEventBackgroundChanged({
    this.oldBackground,
    this.newBackground,
  });

  /// Previous background; may be null if none
  final ChatBackground? oldBackground;

  /// New background; may be null if none
  final ChatBackground? newBackground;

  /// Parse from a json
  factory ChatEventBackgroundChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventBackgroundChanged(
        oldBackground: json['old_background'] == null
            ? null
            : ChatBackground.fromJson(json['old_background']),
        newBackground: json['new_background'] == null
            ? null
            : ChatBackground.fromJson(json['new_background']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_background": oldBackground?.toJson(),
      "new_background": newBackground?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_background]: Previous background; may be null if none
  /// * [new_background]: New background; may be null if none
  @override
  ChatEventBackgroundChanged copyWith({
    ChatBackground? oldBackground,
    ChatBackground? newBackground,
  }) =>
      ChatEventBackgroundChanged(
        oldBackground: oldBackground ?? this.oldBackground,
        newBackground: newBackground ?? this.newBackground,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventBackgroundChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventDescriptionChanged** *(chatEventDescriptionChanged)* - child of ChatEventAction
///
/// The chat description was changed.
///
/// * [oldDescription]: Previous chat description.
/// * [newDescription]: New chat description.
final class ChatEventDescriptionChanged extends ChatEventAction {
  /// **ChatEventDescriptionChanged** *(chatEventDescriptionChanged)* - child of ChatEventAction
  ///
  /// The chat description was changed.
  ///
  /// * [oldDescription]: Previous chat description.
  /// * [newDescription]: New chat description.
  const ChatEventDescriptionChanged({
    required this.oldDescription,
    required this.newDescription,
  });

  /// Previous chat description
  final String oldDescription;

  /// New chat description
  final String newDescription;

  /// Parse from a json
  factory ChatEventDescriptionChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventDescriptionChanged(
        oldDescription: json['old_description'],
        newDescription: json['new_description'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_description": oldDescription,
      "new_description": newDescription,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_description]: Previous chat description
  /// * [new_description]: New chat description
  @override
  ChatEventDescriptionChanged copyWith({
    String? oldDescription,
    String? newDescription,
  }) =>
      ChatEventDescriptionChanged(
        oldDescription: oldDescription ?? this.oldDescription,
        newDescription: newDescription ?? this.newDescription,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventDescriptionChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventEmojiStatusChanged** *(chatEventEmojiStatusChanged)* - child of ChatEventAction
///
/// The chat emoji status was changed.
///
/// * [oldEmojiStatus]: Previous emoji status; may be null if none *(optional)*.
/// * [newEmojiStatus]: New emoji status; may be null if none *(optional)*.
final class ChatEventEmojiStatusChanged extends ChatEventAction {
  /// **ChatEventEmojiStatusChanged** *(chatEventEmojiStatusChanged)* - child of ChatEventAction
  ///
  /// The chat emoji status was changed.
  ///
  /// * [oldEmojiStatus]: Previous emoji status; may be null if none *(optional)*.
  /// * [newEmojiStatus]: New emoji status; may be null if none *(optional)*.
  const ChatEventEmojiStatusChanged({
    this.oldEmojiStatus,
    this.newEmojiStatus,
  });

  /// Previous emoji status; may be null if none
  final EmojiStatus? oldEmojiStatus;

  /// New emoji status; may be null if none
  final EmojiStatus? newEmojiStatus;

  /// Parse from a json
  factory ChatEventEmojiStatusChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventEmojiStatusChanged(
        oldEmojiStatus: json['old_emoji_status'] == null
            ? null
            : EmojiStatus.fromJson(json['old_emoji_status']),
        newEmojiStatus: json['new_emoji_status'] == null
            ? null
            : EmojiStatus.fromJson(json['new_emoji_status']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_emoji_status": oldEmojiStatus?.toJson(),
      "new_emoji_status": newEmojiStatus?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_emoji_status]: Previous emoji status; may be null if none
  /// * [new_emoji_status]: New emoji status; may be null if none
  @override
  ChatEventEmojiStatusChanged copyWith({
    EmojiStatus? oldEmojiStatus,
    EmojiStatus? newEmojiStatus,
  }) =>
      ChatEventEmojiStatusChanged(
        oldEmojiStatus: oldEmojiStatus ?? this.oldEmojiStatus,
        newEmojiStatus: newEmojiStatus ?? this.newEmojiStatus,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventEmojiStatusChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventLinkedChatChanged** *(chatEventLinkedChatChanged)* - child of ChatEventAction
///
/// The linked chat of a supergroup was changed.
///
/// * [oldLinkedChatId]: Previous supergroup linked chat identifier.
/// * [newLinkedChatId]: New supergroup linked chat identifier.
final class ChatEventLinkedChatChanged extends ChatEventAction {
  /// **ChatEventLinkedChatChanged** *(chatEventLinkedChatChanged)* - child of ChatEventAction
  ///
  /// The linked chat of a supergroup was changed.
  ///
  /// * [oldLinkedChatId]: Previous supergroup linked chat identifier.
  /// * [newLinkedChatId]: New supergroup linked chat identifier.
  const ChatEventLinkedChatChanged({
    required this.oldLinkedChatId,
    required this.newLinkedChatId,
  });

  /// Previous supergroup linked chat identifier
  final int oldLinkedChatId;

  /// New supergroup linked chat identifier
  final int newLinkedChatId;

  /// Parse from a json
  factory ChatEventLinkedChatChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventLinkedChatChanged(
        oldLinkedChatId: json['old_linked_chat_id'],
        newLinkedChatId: json['new_linked_chat_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_linked_chat_id": oldLinkedChatId,
      "new_linked_chat_id": newLinkedChatId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_linked_chat_id]: Previous supergroup linked chat identifier
  /// * [new_linked_chat_id]: New supergroup linked chat identifier
  @override
  ChatEventLinkedChatChanged copyWith({
    int? oldLinkedChatId,
    int? newLinkedChatId,
  }) =>
      ChatEventLinkedChatChanged(
        oldLinkedChatId: oldLinkedChatId ?? this.oldLinkedChatId,
        newLinkedChatId: newLinkedChatId ?? this.newLinkedChatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventLinkedChatChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventLocationChanged** *(chatEventLocationChanged)* - child of ChatEventAction
///
/// The supergroup location was changed.
///
/// * [oldLocation]: Previous location; may be null *(optional)*.
/// * [newLocation]: New location; may be null *(optional)*.
final class ChatEventLocationChanged extends ChatEventAction {
  /// **ChatEventLocationChanged** *(chatEventLocationChanged)* - child of ChatEventAction
  ///
  /// The supergroup location was changed.
  ///
  /// * [oldLocation]: Previous location; may be null *(optional)*.
  /// * [newLocation]: New location; may be null *(optional)*.
  const ChatEventLocationChanged({
    this.oldLocation,
    this.newLocation,
  });

  /// Previous location; may be null
  final ChatLocation? oldLocation;

  /// New location; may be null
  final ChatLocation? newLocation;

  /// Parse from a json
  factory ChatEventLocationChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventLocationChanged(
        oldLocation: json['old_location'] == null
            ? null
            : ChatLocation.fromJson(json['old_location']),
        newLocation: json['new_location'] == null
            ? null
            : ChatLocation.fromJson(json['new_location']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_location": oldLocation?.toJson(),
      "new_location": newLocation?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_location]: Previous location; may be null
  /// * [new_location]: New location; may be null
  @override
  ChatEventLocationChanged copyWith({
    ChatLocation? oldLocation,
    ChatLocation? newLocation,
  }) =>
      ChatEventLocationChanged(
        oldLocation: oldLocation ?? this.oldLocation,
        newLocation: newLocation ?? this.newLocation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventLocationChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventMessageAutoDeleteTimeChanged** *(chatEventMessageAutoDeleteTimeChanged)* - child of ChatEventAction
///
/// The message auto-delete timer was changed.
///
/// * [oldMessageAutoDeleteTime]: Previous value of message_auto_delete_time.
/// * [newMessageAutoDeleteTime]: New value of message_auto_delete_time.
final class ChatEventMessageAutoDeleteTimeChanged extends ChatEventAction {
  /// **ChatEventMessageAutoDeleteTimeChanged** *(chatEventMessageAutoDeleteTimeChanged)* - child of ChatEventAction
  ///
  /// The message auto-delete timer was changed.
  ///
  /// * [oldMessageAutoDeleteTime]: Previous value of message_auto_delete_time.
  /// * [newMessageAutoDeleteTime]: New value of message_auto_delete_time.
  const ChatEventMessageAutoDeleteTimeChanged({
    required this.oldMessageAutoDeleteTime,
    required this.newMessageAutoDeleteTime,
  });

  /// Previous value of message_auto_delete_time
  final int oldMessageAutoDeleteTime;

  /// New value of message_auto_delete_time
  final int newMessageAutoDeleteTime;

  /// Parse from a json
  factory ChatEventMessageAutoDeleteTimeChanged.fromJson(
          Map<String, dynamic> json) =>
      ChatEventMessageAutoDeleteTimeChanged(
        oldMessageAutoDeleteTime: json['old_message_auto_delete_time'],
        newMessageAutoDeleteTime: json['new_message_auto_delete_time'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_message_auto_delete_time": oldMessageAutoDeleteTime,
      "new_message_auto_delete_time": newMessageAutoDeleteTime,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_message_auto_delete_time]: Previous value of message_auto_delete_time
  /// * [new_message_auto_delete_time]: New value of message_auto_delete_time
  @override
  ChatEventMessageAutoDeleteTimeChanged copyWith({
    int? oldMessageAutoDeleteTime,
    int? newMessageAutoDeleteTime,
  }) =>
      ChatEventMessageAutoDeleteTimeChanged(
        oldMessageAutoDeleteTime:
            oldMessageAutoDeleteTime ?? this.oldMessageAutoDeleteTime,
        newMessageAutoDeleteTime:
            newMessageAutoDeleteTime ?? this.newMessageAutoDeleteTime,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventMessageAutoDeleteTimeChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventPermissionsChanged** *(chatEventPermissionsChanged)* - child of ChatEventAction
///
/// The chat permissions were changed.
///
/// * [oldPermissions]: Previous chat permissions.
/// * [newPermissions]: New chat permissions.
final class ChatEventPermissionsChanged extends ChatEventAction {
  /// **ChatEventPermissionsChanged** *(chatEventPermissionsChanged)* - child of ChatEventAction
  ///
  /// The chat permissions were changed.
  ///
  /// * [oldPermissions]: Previous chat permissions.
  /// * [newPermissions]: New chat permissions.
  const ChatEventPermissionsChanged({
    required this.oldPermissions,
    required this.newPermissions,
  });

  /// Previous chat permissions
  final ChatPermissions oldPermissions;

  /// New chat permissions
  final ChatPermissions newPermissions;

  /// Parse from a json
  factory ChatEventPermissionsChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventPermissionsChanged(
        oldPermissions: ChatPermissions.fromJson(json['old_permissions']),
        newPermissions: ChatPermissions.fromJson(json['new_permissions']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_permissions": oldPermissions.toJson(),
      "new_permissions": newPermissions.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_permissions]: Previous chat permissions
  /// * [new_permissions]: New chat permissions
  @override
  ChatEventPermissionsChanged copyWith({
    ChatPermissions? oldPermissions,
    ChatPermissions? newPermissions,
  }) =>
      ChatEventPermissionsChanged(
        oldPermissions: oldPermissions ?? this.oldPermissions,
        newPermissions: newPermissions ?? this.newPermissions,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventPermissionsChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventPhotoChanged** *(chatEventPhotoChanged)* - child of ChatEventAction
///
/// The chat photo was changed.
///
/// * [oldPhoto]: Previous chat photo value; may be null *(optional)*.
/// * [newPhoto]: New chat photo value; may be null *(optional)*.
final class ChatEventPhotoChanged extends ChatEventAction {
  /// **ChatEventPhotoChanged** *(chatEventPhotoChanged)* - child of ChatEventAction
  ///
  /// The chat photo was changed.
  ///
  /// * [oldPhoto]: Previous chat photo value; may be null *(optional)*.
  /// * [newPhoto]: New chat photo value; may be null *(optional)*.
  const ChatEventPhotoChanged({
    this.oldPhoto,
    this.newPhoto,
  });

  /// Previous chat photo value; may be null
  final ChatPhoto? oldPhoto;

  /// New chat photo value; may be null
  final ChatPhoto? newPhoto;

  /// Parse from a json
  factory ChatEventPhotoChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventPhotoChanged(
        oldPhoto: json['old_photo'] == null
            ? null
            : ChatPhoto.fromJson(json['old_photo']),
        newPhoto: json['new_photo'] == null
            ? null
            : ChatPhoto.fromJson(json['new_photo']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_photo": oldPhoto?.toJson(),
      "new_photo": newPhoto?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_photo]: Previous chat photo value; may be null
  /// * [new_photo]: New chat photo value; may be null
  @override
  ChatEventPhotoChanged copyWith({
    ChatPhoto? oldPhoto,
    ChatPhoto? newPhoto,
  }) =>
      ChatEventPhotoChanged(
        oldPhoto: oldPhoto ?? this.oldPhoto,
        newPhoto: newPhoto ?? this.newPhoto,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventPhotoChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventSlowModeDelayChanged** *(chatEventSlowModeDelayChanged)* - child of ChatEventAction
///
/// The slow_mode_delay setting of a supergroup was changed.
///
/// * [oldSlowModeDelay]: Previous value of slow_mode_delay, in seconds.
/// * [newSlowModeDelay]: New value of slow_mode_delay, in seconds.
final class ChatEventSlowModeDelayChanged extends ChatEventAction {
  /// **ChatEventSlowModeDelayChanged** *(chatEventSlowModeDelayChanged)* - child of ChatEventAction
  ///
  /// The slow_mode_delay setting of a supergroup was changed.
  ///
  /// * [oldSlowModeDelay]: Previous value of slow_mode_delay, in seconds.
  /// * [newSlowModeDelay]: New value of slow_mode_delay, in seconds.
  const ChatEventSlowModeDelayChanged({
    required this.oldSlowModeDelay,
    required this.newSlowModeDelay,
  });

  /// Previous value of slow_mode_delay, in seconds
  final int oldSlowModeDelay;

  /// New value of slow_mode_delay, in seconds
  final int newSlowModeDelay;

  /// Parse from a json
  factory ChatEventSlowModeDelayChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventSlowModeDelayChanged(
        oldSlowModeDelay: json['old_slow_mode_delay'],
        newSlowModeDelay: json['new_slow_mode_delay'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_slow_mode_delay": oldSlowModeDelay,
      "new_slow_mode_delay": newSlowModeDelay,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_slow_mode_delay]: Previous value of slow_mode_delay, in seconds
  /// * [new_slow_mode_delay]: New value of slow_mode_delay, in seconds
  @override
  ChatEventSlowModeDelayChanged copyWith({
    int? oldSlowModeDelay,
    int? newSlowModeDelay,
  }) =>
      ChatEventSlowModeDelayChanged(
        oldSlowModeDelay: oldSlowModeDelay ?? this.oldSlowModeDelay,
        newSlowModeDelay: newSlowModeDelay ?? this.newSlowModeDelay,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventSlowModeDelayChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventStickerSetChanged** *(chatEventStickerSetChanged)* - child of ChatEventAction
///
/// The supergroup sticker set was changed.
///
/// * [oldStickerSetId]: Previous identifier of the chat sticker set; 0 if none.
/// * [newStickerSetId]: New identifier of the chat sticker set; 0 if none.
final class ChatEventStickerSetChanged extends ChatEventAction {
  /// **ChatEventStickerSetChanged** *(chatEventStickerSetChanged)* - child of ChatEventAction
  ///
  /// The supergroup sticker set was changed.
  ///
  /// * [oldStickerSetId]: Previous identifier of the chat sticker set; 0 if none.
  /// * [newStickerSetId]: New identifier of the chat sticker set; 0 if none.
  const ChatEventStickerSetChanged({
    required this.oldStickerSetId,
    required this.newStickerSetId,
  });

  /// Previous identifier of the chat sticker set; 0 if none
  final int oldStickerSetId;

  /// New identifier of the chat sticker set; 0 if none
  final int newStickerSetId;

  /// Parse from a json
  factory ChatEventStickerSetChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventStickerSetChanged(
        oldStickerSetId: json['old_sticker_set_id'] is int
            ? json['old_sticker_set_id']
            : int.tryParse(json['old_sticker_set_id'] ?? "") ?? 0,
        newStickerSetId: json['new_sticker_set_id'] is int
            ? json['new_sticker_set_id']
            : int.tryParse(json['new_sticker_set_id'] ?? "") ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_sticker_set_id": oldStickerSetId,
      "new_sticker_set_id": newStickerSetId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_sticker_set_id]: Previous identifier of the chat sticker set; 0 if none
  /// * [new_sticker_set_id]: New identifier of the chat sticker set; 0 if none
  @override
  ChatEventStickerSetChanged copyWith({
    int? oldStickerSetId,
    int? newStickerSetId,
  }) =>
      ChatEventStickerSetChanged(
        oldStickerSetId: oldStickerSetId ?? this.oldStickerSetId,
        newStickerSetId: newStickerSetId ?? this.newStickerSetId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventStickerSetChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventCustomEmojiStickerSetChanged** *(chatEventCustomEmojiStickerSetChanged)* - child of ChatEventAction
///
/// The supergroup sticker set with allowed custom emoji was changed.
///
/// * [oldStickerSetId]: Previous identifier of the chat sticker set; 0 if none.
/// * [newStickerSetId]: New identifier of the chat sticker set; 0 if none.
final class ChatEventCustomEmojiStickerSetChanged extends ChatEventAction {
  /// **ChatEventCustomEmojiStickerSetChanged** *(chatEventCustomEmojiStickerSetChanged)* - child of ChatEventAction
  ///
  /// The supergroup sticker set with allowed custom emoji was changed.
  ///
  /// * [oldStickerSetId]: Previous identifier of the chat sticker set; 0 if none.
  /// * [newStickerSetId]: New identifier of the chat sticker set; 0 if none.
  const ChatEventCustomEmojiStickerSetChanged({
    required this.oldStickerSetId,
    required this.newStickerSetId,
  });

  /// Previous identifier of the chat sticker set; 0 if none
  final int oldStickerSetId;

  /// New identifier of the chat sticker set; 0 if none
  final int newStickerSetId;

  /// Parse from a json
  factory ChatEventCustomEmojiStickerSetChanged.fromJson(
          Map<String, dynamic> json) =>
      ChatEventCustomEmojiStickerSetChanged(
        oldStickerSetId: json['old_sticker_set_id'] is int
            ? json['old_sticker_set_id']
            : int.tryParse(json['old_sticker_set_id'] ?? "") ?? 0,
        newStickerSetId: json['new_sticker_set_id'] is int
            ? json['new_sticker_set_id']
            : int.tryParse(json['new_sticker_set_id'] ?? "") ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_sticker_set_id": oldStickerSetId,
      "new_sticker_set_id": newStickerSetId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_sticker_set_id]: Previous identifier of the chat sticker set; 0 if none
  /// * [new_sticker_set_id]: New identifier of the chat sticker set; 0 if none
  @override
  ChatEventCustomEmojiStickerSetChanged copyWith({
    int? oldStickerSetId,
    int? newStickerSetId,
  }) =>
      ChatEventCustomEmojiStickerSetChanged(
        oldStickerSetId: oldStickerSetId ?? this.oldStickerSetId,
        newStickerSetId: newStickerSetId ?? this.newStickerSetId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventCustomEmojiStickerSetChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventTitleChanged** *(chatEventTitleChanged)* - child of ChatEventAction
///
/// The chat title was changed.
///
/// * [oldTitle]: Previous chat title.
/// * [newTitle]: New chat title.
final class ChatEventTitleChanged extends ChatEventAction {
  /// **ChatEventTitleChanged** *(chatEventTitleChanged)* - child of ChatEventAction
  ///
  /// The chat title was changed.
  ///
  /// * [oldTitle]: Previous chat title.
  /// * [newTitle]: New chat title.
  const ChatEventTitleChanged({
    required this.oldTitle,
    required this.newTitle,
  });

  /// Previous chat title
  final String oldTitle;

  /// New chat title
  final String newTitle;

  /// Parse from a json
  factory ChatEventTitleChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventTitleChanged(
        oldTitle: json['old_title'],
        newTitle: json['new_title'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_title": oldTitle,
      "new_title": newTitle,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_title]: Previous chat title
  /// * [new_title]: New chat title
  @override
  ChatEventTitleChanged copyWith({
    String? oldTitle,
    String? newTitle,
  }) =>
      ChatEventTitleChanged(
        oldTitle: oldTitle ?? this.oldTitle,
        newTitle: newTitle ?? this.newTitle,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventTitleChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventUsernameChanged** *(chatEventUsernameChanged)* - child of ChatEventAction
///
/// The chat editable username was changed.
///
/// * [oldUsername]: Previous chat username.
/// * [newUsername]: New chat username.
final class ChatEventUsernameChanged extends ChatEventAction {
  /// **ChatEventUsernameChanged** *(chatEventUsernameChanged)* - child of ChatEventAction
  ///
  /// The chat editable username was changed.
  ///
  /// * [oldUsername]: Previous chat username.
  /// * [newUsername]: New chat username.
  const ChatEventUsernameChanged({
    required this.oldUsername,
    required this.newUsername,
  });

  /// Previous chat username
  final String oldUsername;

  /// New chat username
  final String newUsername;

  /// Parse from a json
  factory ChatEventUsernameChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventUsernameChanged(
        oldUsername: json['old_username'],
        newUsername: json['new_username'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_username": oldUsername,
      "new_username": newUsername,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_username]: Previous chat username
  /// * [new_username]: New chat username
  @override
  ChatEventUsernameChanged copyWith({
    String? oldUsername,
    String? newUsername,
  }) =>
      ChatEventUsernameChanged(
        oldUsername: oldUsername ?? this.oldUsername,
        newUsername: newUsername ?? this.newUsername,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventUsernameChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventActiveUsernamesChanged** *(chatEventActiveUsernamesChanged)* - child of ChatEventAction
///
/// The chat active usernames were changed.
///
/// * [oldUsernames]: Previous list of active usernames.
/// * [newUsernames]: New list of active usernames.
final class ChatEventActiveUsernamesChanged extends ChatEventAction {
  /// **ChatEventActiveUsernamesChanged** *(chatEventActiveUsernamesChanged)* - child of ChatEventAction
  ///
  /// The chat active usernames were changed.
  ///
  /// * [oldUsernames]: Previous list of active usernames.
  /// * [newUsernames]: New list of active usernames.
  const ChatEventActiveUsernamesChanged({
    required this.oldUsernames,
    required this.newUsernames,
  });

  /// Previous list of active usernames
  final List<String> oldUsernames;

  /// New list of active usernames
  final List<String> newUsernames;

  /// Parse from a json
  factory ChatEventActiveUsernamesChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventActiveUsernamesChanged(
        oldUsernames: List<String>.from(
            (json['old_usernames'] ?? []).map((item) => item).toList()),
        newUsernames: List<String>.from(
            (json['new_usernames'] ?? []).map((item) => item).toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_usernames": oldUsernames.map((i) => i).toList(),
      "new_usernames": newUsernames.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_usernames]: Previous list of active usernames
  /// * [new_usernames]: New list of active usernames
  @override
  ChatEventActiveUsernamesChanged copyWith({
    List<String>? oldUsernames,
    List<String>? newUsernames,
  }) =>
      ChatEventActiveUsernamesChanged(
        oldUsernames: oldUsernames ?? this.oldUsernames,
        newUsernames: newUsernames ?? this.newUsernames,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventActiveUsernamesChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventAccentColorChanged** *(chatEventAccentColorChanged)* - child of ChatEventAction
///
/// The chat accent color or background custom emoji were changed.
///
/// * [oldAccentColorId]: Previous identifier of chat accent color.
/// * [oldBackgroundCustomEmojiId]: Previous identifier of the custom emoji; 0 if none.
/// * [newAccentColorId]: New identifier of chat accent color.
/// * [newBackgroundCustomEmojiId]: New identifier of the custom emoji; 0 if none.
final class ChatEventAccentColorChanged extends ChatEventAction {
  /// **ChatEventAccentColorChanged** *(chatEventAccentColorChanged)* - child of ChatEventAction
  ///
  /// The chat accent color or background custom emoji were changed.
  ///
  /// * [oldAccentColorId]: Previous identifier of chat accent color.
  /// * [oldBackgroundCustomEmojiId]: Previous identifier of the custom emoji; 0 if none.
  /// * [newAccentColorId]: New identifier of chat accent color.
  /// * [newBackgroundCustomEmojiId]: New identifier of the custom emoji; 0 if none.
  const ChatEventAccentColorChanged({
    required this.oldAccentColorId,
    required this.oldBackgroundCustomEmojiId,
    required this.newAccentColorId,
    required this.newBackgroundCustomEmojiId,
  });

  /// Previous identifier of chat accent color
  final int oldAccentColorId;

  /// Previous identifier of the custom emoji; 0 if none
  final int oldBackgroundCustomEmojiId;

  /// New identifier of chat accent color
  final int newAccentColorId;

  /// New identifier of the custom emoji; 0 if none
  final int newBackgroundCustomEmojiId;

  /// Parse from a json
  factory ChatEventAccentColorChanged.fromJson(Map<String, dynamic> json) =>
      ChatEventAccentColorChanged(
        oldAccentColorId: json['old_accent_color_id'],
        oldBackgroundCustomEmojiId: json['old_background_custom_emoji_id']
                is int
            ? json['old_background_custom_emoji_id']
            : int.tryParse(json['old_background_custom_emoji_id'] ?? "") ?? 0,
        newAccentColorId: json['new_accent_color_id'],
        newBackgroundCustomEmojiId: json['new_background_custom_emoji_id']
                is int
            ? json['new_background_custom_emoji_id']
            : int.tryParse(json['new_background_custom_emoji_id'] ?? "") ?? 0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_accent_color_id": oldAccentColorId,
      "old_background_custom_emoji_id": oldBackgroundCustomEmojiId,
      "new_accent_color_id": newAccentColorId,
      "new_background_custom_emoji_id": newBackgroundCustomEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_accent_color_id]: Previous identifier of chat accent color
  /// * [old_background_custom_emoji_id]: Previous identifier of the custom emoji; 0 if none
  /// * [new_accent_color_id]: New identifier of chat accent color
  /// * [new_background_custom_emoji_id]: New identifier of the custom emoji; 0 if none
  @override
  ChatEventAccentColorChanged copyWith({
    int? oldAccentColorId,
    int? oldBackgroundCustomEmojiId,
    int? newAccentColorId,
    int? newBackgroundCustomEmojiId,
  }) =>
      ChatEventAccentColorChanged(
        oldAccentColorId: oldAccentColorId ?? this.oldAccentColorId,
        oldBackgroundCustomEmojiId:
            oldBackgroundCustomEmojiId ?? this.oldBackgroundCustomEmojiId,
        newAccentColorId: newAccentColorId ?? this.newAccentColorId,
        newBackgroundCustomEmojiId:
            newBackgroundCustomEmojiId ?? this.newBackgroundCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventAccentColorChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventProfileAccentColorChanged** *(chatEventProfileAccentColorChanged)* - child of ChatEventAction
///
/// The chat's profile accent color or profile background custom emoji were changed.
///
/// * [oldProfileAccentColorId]: Previous identifier of chat's profile accent color; -1 if none.
/// * [oldProfileBackgroundCustomEmojiId]: Previous identifier of the custom emoji; 0 if none.
/// * [newProfileAccentColorId]: New identifier of chat's profile accent color; -1 if none.
/// * [newProfileBackgroundCustomEmojiId]: New identifier of the custom emoji; 0 if none.
final class ChatEventProfileAccentColorChanged extends ChatEventAction {
  /// **ChatEventProfileAccentColorChanged** *(chatEventProfileAccentColorChanged)* - child of ChatEventAction
  ///
  /// The chat's profile accent color or profile background custom emoji were changed.
  ///
  /// * [oldProfileAccentColorId]: Previous identifier of chat's profile accent color; -1 if none.
  /// * [oldProfileBackgroundCustomEmojiId]: Previous identifier of the custom emoji; 0 if none.
  /// * [newProfileAccentColorId]: New identifier of chat's profile accent color; -1 if none.
  /// * [newProfileBackgroundCustomEmojiId]: New identifier of the custom emoji; 0 if none.
  const ChatEventProfileAccentColorChanged({
    required this.oldProfileAccentColorId,
    required this.oldProfileBackgroundCustomEmojiId,
    required this.newProfileAccentColorId,
    required this.newProfileBackgroundCustomEmojiId,
  });

  /// Previous identifier of chat's profile accent color; -1 if none
  final int oldProfileAccentColorId;

  /// Previous identifier of the custom emoji; 0 if none
  final int oldProfileBackgroundCustomEmojiId;

  /// New identifier of chat's profile accent color; -1 if none
  final int newProfileAccentColorId;

  /// New identifier of the custom emoji; 0 if none
  final int newProfileBackgroundCustomEmojiId;

  /// Parse from a json
  factory ChatEventProfileAccentColorChanged.fromJson(
          Map<String, dynamic> json) =>
      ChatEventProfileAccentColorChanged(
        oldProfileAccentColorId: json['old_profile_accent_color_id'],
        oldProfileBackgroundCustomEmojiId:
            json['old_profile_background_custom_emoji_id'] is int
                ? json['old_profile_background_custom_emoji_id']
                : int.tryParse(
                        json['old_profile_background_custom_emoji_id'] ?? "") ??
                    0,
        newProfileAccentColorId: json['new_profile_accent_color_id'],
        newProfileBackgroundCustomEmojiId:
            json['new_profile_background_custom_emoji_id'] is int
                ? json['new_profile_background_custom_emoji_id']
                : int.tryParse(
                        json['new_profile_background_custom_emoji_id'] ?? "") ??
                    0,
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_profile_accent_color_id": oldProfileAccentColorId,
      "old_profile_background_custom_emoji_id":
          oldProfileBackgroundCustomEmojiId,
      "new_profile_accent_color_id": newProfileAccentColorId,
      "new_profile_background_custom_emoji_id":
          newProfileBackgroundCustomEmojiId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_profile_accent_color_id]: Previous identifier of chat's profile accent color; -1 if none
  /// * [old_profile_background_custom_emoji_id]: Previous identifier of the custom emoji; 0 if none
  /// * [new_profile_accent_color_id]: New identifier of chat's profile accent color; -1 if none
  /// * [new_profile_background_custom_emoji_id]: New identifier of the custom emoji; 0 if none
  @override
  ChatEventProfileAccentColorChanged copyWith({
    int? oldProfileAccentColorId,
    int? oldProfileBackgroundCustomEmojiId,
    int? newProfileAccentColorId,
    int? newProfileBackgroundCustomEmojiId,
  }) =>
      ChatEventProfileAccentColorChanged(
        oldProfileAccentColorId:
            oldProfileAccentColorId ?? this.oldProfileAccentColorId,
        oldProfileBackgroundCustomEmojiId: oldProfileBackgroundCustomEmojiId ??
            this.oldProfileBackgroundCustomEmojiId,
        newProfileAccentColorId:
            newProfileAccentColorId ?? this.newProfileAccentColorId,
        newProfileBackgroundCustomEmojiId: newProfileBackgroundCustomEmojiId ??
            this.newProfileBackgroundCustomEmojiId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventProfileAccentColorChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventHasProtectedContentToggled** *(chatEventHasProtectedContentToggled)* - child of ChatEventAction
///
/// The has_protected_content setting of a chat was toggled.
///
/// * [hasProtectedContent]: New value of has_protected_content.
final class ChatEventHasProtectedContentToggled extends ChatEventAction {
  /// **ChatEventHasProtectedContentToggled** *(chatEventHasProtectedContentToggled)* - child of ChatEventAction
  ///
  /// The has_protected_content setting of a chat was toggled.
  ///
  /// * [hasProtectedContent]: New value of has_protected_content.
  const ChatEventHasProtectedContentToggled({
    required this.hasProtectedContent,
  });

  /// New value of has_protected_content
  final bool hasProtectedContent;

  /// Parse from a json
  factory ChatEventHasProtectedContentToggled.fromJson(
          Map<String, dynamic> json) =>
      ChatEventHasProtectedContentToggled(
        hasProtectedContent: json['has_protected_content'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "has_protected_content": hasProtectedContent,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [has_protected_content]: New value of has_protected_content
  @override
  ChatEventHasProtectedContentToggled copyWith({
    bool? hasProtectedContent,
  }) =>
      ChatEventHasProtectedContentToggled(
        hasProtectedContent: hasProtectedContent ?? this.hasProtectedContent,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventHasProtectedContentToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventInvitesToggled** *(chatEventInvitesToggled)* - child of ChatEventAction
///
/// The can_invite_users permission of a supergroup chat was toggled.
///
/// * [canInviteUsers]: New value of can_invite_users permission.
final class ChatEventInvitesToggled extends ChatEventAction {
  /// **ChatEventInvitesToggled** *(chatEventInvitesToggled)* - child of ChatEventAction
  ///
  /// The can_invite_users permission of a supergroup chat was toggled.
  ///
  /// * [canInviteUsers]: New value of can_invite_users permission.
  const ChatEventInvitesToggled({
    required this.canInviteUsers,
  });

  /// New value of can_invite_users permission
  final bool canInviteUsers;

  /// Parse from a json
  factory ChatEventInvitesToggled.fromJson(Map<String, dynamic> json) =>
      ChatEventInvitesToggled(
        canInviteUsers: json['can_invite_users'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_invite_users": canInviteUsers,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_invite_users]: New value of can_invite_users permission
  @override
  ChatEventInvitesToggled copyWith({
    bool? canInviteUsers,
  }) =>
      ChatEventInvitesToggled(
        canInviteUsers: canInviteUsers ?? this.canInviteUsers,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventInvitesToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventIsAllHistoryAvailableToggled** *(chatEventIsAllHistoryAvailableToggled)* - child of ChatEventAction
///
/// The is_all_history_available setting of a supergroup was toggled.
///
/// * [isAllHistoryAvailable]: New value of is_all_history_available.
final class ChatEventIsAllHistoryAvailableToggled extends ChatEventAction {
  /// **ChatEventIsAllHistoryAvailableToggled** *(chatEventIsAllHistoryAvailableToggled)* - child of ChatEventAction
  ///
  /// The is_all_history_available setting of a supergroup was toggled.
  ///
  /// * [isAllHistoryAvailable]: New value of is_all_history_available.
  const ChatEventIsAllHistoryAvailableToggled({
    required this.isAllHistoryAvailable,
  });

  /// New value of is_all_history_available
  final bool isAllHistoryAvailable;

  /// Parse from a json
  factory ChatEventIsAllHistoryAvailableToggled.fromJson(
          Map<String, dynamic> json) =>
      ChatEventIsAllHistoryAvailableToggled(
        isAllHistoryAvailable: json['is_all_history_available'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_all_history_available": isAllHistoryAvailable,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_all_history_available]: New value of is_all_history_available
  @override
  ChatEventIsAllHistoryAvailableToggled copyWith({
    bool? isAllHistoryAvailable,
  }) =>
      ChatEventIsAllHistoryAvailableToggled(
        isAllHistoryAvailable:
            isAllHistoryAvailable ?? this.isAllHistoryAvailable,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventIsAllHistoryAvailableToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventHasAggressiveAntiSpamEnabledToggled** *(chatEventHasAggressiveAntiSpamEnabledToggled)* - child of ChatEventAction
///
/// The has_aggressive_anti_spam_enabled setting of a supergroup was toggled.
///
/// * [hasAggressiveAntiSpamEnabled]: New value of has_aggressive_anti_spam_enabled.
final class ChatEventHasAggressiveAntiSpamEnabledToggled
    extends ChatEventAction {
  /// **ChatEventHasAggressiveAntiSpamEnabledToggled** *(chatEventHasAggressiveAntiSpamEnabledToggled)* - child of ChatEventAction
  ///
  /// The has_aggressive_anti_spam_enabled setting of a supergroup was toggled.
  ///
  /// * [hasAggressiveAntiSpamEnabled]: New value of has_aggressive_anti_spam_enabled.
  const ChatEventHasAggressiveAntiSpamEnabledToggled({
    required this.hasAggressiveAntiSpamEnabled,
  });

  /// New value of has_aggressive_anti_spam_enabled
  final bool hasAggressiveAntiSpamEnabled;

  /// Parse from a json
  factory ChatEventHasAggressiveAntiSpamEnabledToggled.fromJson(
          Map<String, dynamic> json) =>
      ChatEventHasAggressiveAntiSpamEnabledToggled(
        hasAggressiveAntiSpamEnabled: json['has_aggressive_anti_spam_enabled'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "has_aggressive_anti_spam_enabled": hasAggressiveAntiSpamEnabled,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [has_aggressive_anti_spam_enabled]: New value of has_aggressive_anti_spam_enabled
  @override
  ChatEventHasAggressiveAntiSpamEnabledToggled copyWith({
    bool? hasAggressiveAntiSpamEnabled,
  }) =>
      ChatEventHasAggressiveAntiSpamEnabledToggled(
        hasAggressiveAntiSpamEnabled:
            hasAggressiveAntiSpamEnabled ?? this.hasAggressiveAntiSpamEnabled,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatEventHasAggressiveAntiSpamEnabledToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventSignMessagesToggled** *(chatEventSignMessagesToggled)* - child of ChatEventAction
///
/// The sign_messages setting of a channel was toggled.
///
/// * [signMessages]: New value of sign_messages.
final class ChatEventSignMessagesToggled extends ChatEventAction {
  /// **ChatEventSignMessagesToggled** *(chatEventSignMessagesToggled)* - child of ChatEventAction
  ///
  /// The sign_messages setting of a channel was toggled.
  ///
  /// * [signMessages]: New value of sign_messages.
  const ChatEventSignMessagesToggled({
    required this.signMessages,
  });

  /// New value of sign_messages
  final bool signMessages;

  /// Parse from a json
  factory ChatEventSignMessagesToggled.fromJson(Map<String, dynamic> json) =>
      ChatEventSignMessagesToggled(
        signMessages: json['sign_messages'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sign_messages": signMessages,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sign_messages]: New value of sign_messages
  @override
  ChatEventSignMessagesToggled copyWith({
    bool? signMessages,
  }) =>
      ChatEventSignMessagesToggled(
        signMessages: signMessages ?? this.signMessages,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventSignMessagesToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventShowMessageSenderToggled** *(chatEventShowMessageSenderToggled)* - child of ChatEventAction
///
/// The show_message_sender setting of a channel was toggled.
///
/// * [showMessageSender]: New value of show_message_sender.
final class ChatEventShowMessageSenderToggled extends ChatEventAction {
  /// **ChatEventShowMessageSenderToggled** *(chatEventShowMessageSenderToggled)* - child of ChatEventAction
  ///
  /// The show_message_sender setting of a channel was toggled.
  ///
  /// * [showMessageSender]: New value of show_message_sender.
  const ChatEventShowMessageSenderToggled({
    required this.showMessageSender,
  });

  /// New value of show_message_sender
  final bool showMessageSender;

  /// Parse from a json
  factory ChatEventShowMessageSenderToggled.fromJson(
          Map<String, dynamic> json) =>
      ChatEventShowMessageSenderToggled(
        showMessageSender: json['show_message_sender'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "show_message_sender": showMessageSender,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [show_message_sender]: New value of show_message_sender
  @override
  ChatEventShowMessageSenderToggled copyWith({
    bool? showMessageSender,
  }) =>
      ChatEventShowMessageSenderToggled(
        showMessageSender: showMessageSender ?? this.showMessageSender,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventShowMessageSenderToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventAutomaticTranslationToggled** *(chatEventAutomaticTranslationToggled)* - child of ChatEventAction
///
/// The has_automatic_translation setting of a channel was toggled.
///
/// * [hasAutomaticTranslation]: New value of has_automatic_translation.
final class ChatEventAutomaticTranslationToggled extends ChatEventAction {
  /// **ChatEventAutomaticTranslationToggled** *(chatEventAutomaticTranslationToggled)* - child of ChatEventAction
  ///
  /// The has_automatic_translation setting of a channel was toggled.
  ///
  /// * [hasAutomaticTranslation]: New value of has_automatic_translation.
  const ChatEventAutomaticTranslationToggled({
    required this.hasAutomaticTranslation,
  });

  /// New value of has_automatic_translation
  final bool hasAutomaticTranslation;

  /// Parse from a json
  factory ChatEventAutomaticTranslationToggled.fromJson(
          Map<String, dynamic> json) =>
      ChatEventAutomaticTranslationToggled(
        hasAutomaticTranslation: json['has_automatic_translation'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "has_automatic_translation": hasAutomaticTranslation,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [has_automatic_translation]: New value of has_automatic_translation
  @override
  ChatEventAutomaticTranslationToggled copyWith({
    bool? hasAutomaticTranslation,
  }) =>
      ChatEventAutomaticTranslationToggled(
        hasAutomaticTranslation:
            hasAutomaticTranslation ?? this.hasAutomaticTranslation,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventAutomaticTranslationToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventInviteLinkEdited** *(chatEventInviteLinkEdited)* - child of ChatEventAction
///
/// A chat invite link was edited.
///
/// * [oldInviteLink]: Previous information about the invite link.
/// * [newInviteLink]: New information about the invite link.
final class ChatEventInviteLinkEdited extends ChatEventAction {
  /// **ChatEventInviteLinkEdited** *(chatEventInviteLinkEdited)* - child of ChatEventAction
  ///
  /// A chat invite link was edited.
  ///
  /// * [oldInviteLink]: Previous information about the invite link.
  /// * [newInviteLink]: New information about the invite link.
  const ChatEventInviteLinkEdited({
    required this.oldInviteLink,
    required this.newInviteLink,
  });

  /// Previous information about the invite link
  final ChatInviteLink oldInviteLink;

  /// New information about the invite link
  final ChatInviteLink newInviteLink;

  /// Parse from a json
  factory ChatEventInviteLinkEdited.fromJson(Map<String, dynamic> json) =>
      ChatEventInviteLinkEdited(
        oldInviteLink: ChatInviteLink.fromJson(json['old_invite_link']),
        newInviteLink: ChatInviteLink.fromJson(json['new_invite_link']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_invite_link": oldInviteLink.toJson(),
      "new_invite_link": newInviteLink.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_invite_link]: Previous information about the invite link
  /// * [new_invite_link]: New information about the invite link
  @override
  ChatEventInviteLinkEdited copyWith({
    ChatInviteLink? oldInviteLink,
    ChatInviteLink? newInviteLink,
  }) =>
      ChatEventInviteLinkEdited(
        oldInviteLink: oldInviteLink ?? this.oldInviteLink,
        newInviteLink: newInviteLink ?? this.newInviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventInviteLinkEdited';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventInviteLinkRevoked** *(chatEventInviteLinkRevoked)* - child of ChatEventAction
///
/// A chat invite link was revoked.
///
/// * [inviteLink]: The invite link.
final class ChatEventInviteLinkRevoked extends ChatEventAction {
  /// **ChatEventInviteLinkRevoked** *(chatEventInviteLinkRevoked)* - child of ChatEventAction
  ///
  /// A chat invite link was revoked.
  ///
  /// * [inviteLink]: The invite link.
  const ChatEventInviteLinkRevoked({
    required this.inviteLink,
  });

  /// The invite link
  final ChatInviteLink inviteLink;

  /// Parse from a json
  factory ChatEventInviteLinkRevoked.fromJson(Map<String, dynamic> json) =>
      ChatEventInviteLinkRevoked(
        inviteLink: ChatInviteLink.fromJson(json['invite_link']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: The invite link
  @override
  ChatEventInviteLinkRevoked copyWith({
    ChatInviteLink? inviteLink,
  }) =>
      ChatEventInviteLinkRevoked(
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventInviteLinkRevoked';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventInviteLinkDeleted** *(chatEventInviteLinkDeleted)* - child of ChatEventAction
///
/// A revoked chat invite link was deleted.
///
/// * [inviteLink]: The invite link.
final class ChatEventInviteLinkDeleted extends ChatEventAction {
  /// **ChatEventInviteLinkDeleted** *(chatEventInviteLinkDeleted)* - child of ChatEventAction
  ///
  /// A revoked chat invite link was deleted.
  ///
  /// * [inviteLink]: The invite link.
  const ChatEventInviteLinkDeleted({
    required this.inviteLink,
  });

  /// The invite link
  final ChatInviteLink inviteLink;

  /// Parse from a json
  factory ChatEventInviteLinkDeleted.fromJson(Map<String, dynamic> json) =>
      ChatEventInviteLinkDeleted(
        inviteLink: ChatInviteLink.fromJson(json['invite_link']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: The invite link
  @override
  ChatEventInviteLinkDeleted copyWith({
    ChatInviteLink? inviteLink,
  }) =>
      ChatEventInviteLinkDeleted(
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventInviteLinkDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventVideoChatCreated** *(chatEventVideoChatCreated)* - child of ChatEventAction
///
/// A video chat was created.
///
/// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
final class ChatEventVideoChatCreated extends ChatEventAction {
  /// **ChatEventVideoChatCreated** *(chatEventVideoChatCreated)* - child of ChatEventAction
  ///
  /// A video chat was created.
  ///
  /// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
  const ChatEventVideoChatCreated({
    required this.groupCallId,
  });

  /// Identifier of the video chat. The video chat can be received through the method getGroupCall
  final int groupCallId;

  /// Parse from a json
  factory ChatEventVideoChatCreated.fromJson(Map<String, dynamic> json) =>
      ChatEventVideoChatCreated(
        groupCallId: json['group_call_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the video chat. The video chat can be received through the method getGroupCall
  @override
  ChatEventVideoChatCreated copyWith({
    int? groupCallId,
  }) =>
      ChatEventVideoChatCreated(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventVideoChatCreated';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventVideoChatEnded** *(chatEventVideoChatEnded)* - child of ChatEventAction
///
/// A video chat was ended.
///
/// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
final class ChatEventVideoChatEnded extends ChatEventAction {
  /// **ChatEventVideoChatEnded** *(chatEventVideoChatEnded)* - child of ChatEventAction
  ///
  /// A video chat was ended.
  ///
  /// * [groupCallId]: Identifier of the video chat. The video chat can be received through the method getGroupCall.
  const ChatEventVideoChatEnded({
    required this.groupCallId,
  });

  /// Identifier of the video chat. The video chat can be received through the method getGroupCall
  final int groupCallId;

  /// Parse from a json
  factory ChatEventVideoChatEnded.fromJson(Map<String, dynamic> json) =>
      ChatEventVideoChatEnded(
        groupCallId: json['group_call_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Identifier of the video chat. The video chat can be received through the method getGroupCall
  @override
  ChatEventVideoChatEnded copyWith({
    int? groupCallId,
  }) =>
      ChatEventVideoChatEnded(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventVideoChatEnded';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventVideoChatMuteNewParticipantsToggled** *(chatEventVideoChatMuteNewParticipantsToggled)* - child of ChatEventAction
///
/// The mute_new_participants setting of a video chat was toggled.
///
/// * [muteNewParticipants]: New value of the mute_new_participants setting.
final class ChatEventVideoChatMuteNewParticipantsToggled
    extends ChatEventAction {
  /// **ChatEventVideoChatMuteNewParticipantsToggled** *(chatEventVideoChatMuteNewParticipantsToggled)* - child of ChatEventAction
  ///
  /// The mute_new_participants setting of a video chat was toggled.
  ///
  /// * [muteNewParticipants]: New value of the mute_new_participants setting.
  const ChatEventVideoChatMuteNewParticipantsToggled({
    required this.muteNewParticipants,
  });

  /// New value of the mute_new_participants setting
  final bool muteNewParticipants;

  /// Parse from a json
  factory ChatEventVideoChatMuteNewParticipantsToggled.fromJson(
          Map<String, dynamic> json) =>
      ChatEventVideoChatMuteNewParticipantsToggled(
        muteNewParticipants: json['mute_new_participants'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "mute_new_participants": muteNewParticipants,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [mute_new_participants]: New value of the mute_new_participants setting
  @override
  ChatEventVideoChatMuteNewParticipantsToggled copyWith({
    bool? muteNewParticipants,
  }) =>
      ChatEventVideoChatMuteNewParticipantsToggled(
        muteNewParticipants: muteNewParticipants ?? this.muteNewParticipants,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatEventVideoChatMuteNewParticipantsToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventVideoChatParticipantIsMutedToggled** *(chatEventVideoChatParticipantIsMutedToggled)* - child of ChatEventAction
///
/// A video chat participant was muted or unmuted.
///
/// * [participantId]: Identifier of the affected group call participant.
/// * [isMuted]: New value of is_muted.
final class ChatEventVideoChatParticipantIsMutedToggled
    extends ChatEventAction {
  /// **ChatEventVideoChatParticipantIsMutedToggled** *(chatEventVideoChatParticipantIsMutedToggled)* - child of ChatEventAction
  ///
  /// A video chat participant was muted or unmuted.
  ///
  /// * [participantId]: Identifier of the affected group call participant.
  /// * [isMuted]: New value of is_muted.
  const ChatEventVideoChatParticipantIsMutedToggled({
    required this.participantId,
    required this.isMuted,
  });

  /// Identifier of the affected group call participant
  final MessageSender participantId;

  /// New value of is_muted
  final bool isMuted;

  /// Parse from a json
  factory ChatEventVideoChatParticipantIsMutedToggled.fromJson(
          Map<String, dynamic> json) =>
      ChatEventVideoChatParticipantIsMutedToggled(
        participantId: MessageSender.fromJson(json['participant_id']),
        isMuted: json['is_muted'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "participant_id": participantId.toJson(),
      "is_muted": isMuted,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [participant_id]: Identifier of the affected group call participant
  /// * [is_muted]: New value of is_muted
  @override
  ChatEventVideoChatParticipantIsMutedToggled copyWith({
    MessageSender? participantId,
    bool? isMuted,
  }) =>
      ChatEventVideoChatParticipantIsMutedToggled(
        participantId: participantId ?? this.participantId,
        isMuted: isMuted ?? this.isMuted,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatEventVideoChatParticipantIsMutedToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventVideoChatParticipantVolumeLevelChanged** *(chatEventVideoChatParticipantVolumeLevelChanged)* - child of ChatEventAction
///
/// A video chat participant volume level was changed.
///
/// * [participantId]: Identifier of the affected group call participant.
/// * [volumeLevel]: New value of volume_level; 1-20000 in hundreds of percents.
final class ChatEventVideoChatParticipantVolumeLevelChanged
    extends ChatEventAction {
  /// **ChatEventVideoChatParticipantVolumeLevelChanged** *(chatEventVideoChatParticipantVolumeLevelChanged)* - child of ChatEventAction
  ///
  /// A video chat participant volume level was changed.
  ///
  /// * [participantId]: Identifier of the affected group call participant.
  /// * [volumeLevel]: New value of volume_level; 1-20000 in hundreds of percents.
  const ChatEventVideoChatParticipantVolumeLevelChanged({
    required this.participantId,
    required this.volumeLevel,
  });

  /// Identifier of the affected group call participant
  final MessageSender participantId;

  /// New value of volume_level; 1-20000 in hundreds of percents
  final int volumeLevel;

  /// Parse from a json
  factory ChatEventVideoChatParticipantVolumeLevelChanged.fromJson(
          Map<String, dynamic> json) =>
      ChatEventVideoChatParticipantVolumeLevelChanged(
        participantId: MessageSender.fromJson(json['participant_id']),
        volumeLevel: json['volume_level'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "participant_id": participantId.toJson(),
      "volume_level": volumeLevel,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [participant_id]: Identifier of the affected group call participant
  /// * [volume_level]: New value of volume_level; 1-20000 in hundreds of percents
  @override
  ChatEventVideoChatParticipantVolumeLevelChanged copyWith({
    MessageSender? participantId,
    int? volumeLevel,
  }) =>
      ChatEventVideoChatParticipantVolumeLevelChanged(
        participantId: participantId ?? this.participantId,
        volumeLevel: volumeLevel ?? this.volumeLevel,
      );

  /// TDLib object type
  static const String defaultObjectId =
      'chatEventVideoChatParticipantVolumeLevelChanged';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventIsForumToggled** *(chatEventIsForumToggled)* - child of ChatEventAction
///
/// The is_forum setting of a supergroup was toggled.
///
/// * [isForum]: New value of is_forum.
final class ChatEventIsForumToggled extends ChatEventAction {
  /// **ChatEventIsForumToggled** *(chatEventIsForumToggled)* - child of ChatEventAction
  ///
  /// The is_forum setting of a supergroup was toggled.
  ///
  /// * [isForum]: New value of is_forum.
  const ChatEventIsForumToggled({
    required this.isForum,
  });

  /// New value of is_forum
  final bool isForum;

  /// Parse from a json
  factory ChatEventIsForumToggled.fromJson(Map<String, dynamic> json) =>
      ChatEventIsForumToggled(
        isForum: json['is_forum'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_forum": isForum,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_forum]: New value of is_forum
  @override
  ChatEventIsForumToggled copyWith({
    bool? isForum,
  }) =>
      ChatEventIsForumToggled(
        isForum: isForum ?? this.isForum,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventIsForumToggled';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventForumTopicCreated** *(chatEventForumTopicCreated)* - child of ChatEventAction
///
/// A new forum topic was created.
///
/// * [topicInfo]: Information about the topic.
final class ChatEventForumTopicCreated extends ChatEventAction {
  /// **ChatEventForumTopicCreated** *(chatEventForumTopicCreated)* - child of ChatEventAction
  ///
  /// A new forum topic was created.
  ///
  /// * [topicInfo]: Information about the topic.
  const ChatEventForumTopicCreated({
    required this.topicInfo,
  });

  /// Information about the topic
  final ForumTopicInfo topicInfo;

  /// Parse from a json
  factory ChatEventForumTopicCreated.fromJson(Map<String, dynamic> json) =>
      ChatEventForumTopicCreated(
        topicInfo: ForumTopicInfo.fromJson(json['topic_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic_info": topicInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic_info]: Information about the topic
  @override
  ChatEventForumTopicCreated copyWith({
    ForumTopicInfo? topicInfo,
  }) =>
      ChatEventForumTopicCreated(
        topicInfo: topicInfo ?? this.topicInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventForumTopicCreated';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventForumTopicEdited** *(chatEventForumTopicEdited)* - child of ChatEventAction
///
/// A forum topic was edited.
///
/// * [oldTopicInfo]: Old information about the topic.
/// * [newTopicInfo]: New information about the topic.
final class ChatEventForumTopicEdited extends ChatEventAction {
  /// **ChatEventForumTopicEdited** *(chatEventForumTopicEdited)* - child of ChatEventAction
  ///
  /// A forum topic was edited.
  ///
  /// * [oldTopicInfo]: Old information about the topic.
  /// * [newTopicInfo]: New information about the topic.
  const ChatEventForumTopicEdited({
    required this.oldTopicInfo,
    required this.newTopicInfo,
  });

  /// Old information about the topic
  final ForumTopicInfo oldTopicInfo;

  /// New information about the topic
  final ForumTopicInfo newTopicInfo;

  /// Parse from a json
  factory ChatEventForumTopicEdited.fromJson(Map<String, dynamic> json) =>
      ChatEventForumTopicEdited(
        oldTopicInfo: ForumTopicInfo.fromJson(json['old_topic_info']),
        newTopicInfo: ForumTopicInfo.fromJson(json['new_topic_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_topic_info": oldTopicInfo.toJson(),
      "new_topic_info": newTopicInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_topic_info]: Old information about the topic
  /// * [new_topic_info]: New information about the topic
  @override
  ChatEventForumTopicEdited copyWith({
    ForumTopicInfo? oldTopicInfo,
    ForumTopicInfo? newTopicInfo,
  }) =>
      ChatEventForumTopicEdited(
        oldTopicInfo: oldTopicInfo ?? this.oldTopicInfo,
        newTopicInfo: newTopicInfo ?? this.newTopicInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventForumTopicEdited';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventForumTopicToggleIsClosed** *(chatEventForumTopicToggleIsClosed)* - child of ChatEventAction
///
/// A forum topic was closed or reopened.
///
/// * [topicInfo]: New information about the topic.
final class ChatEventForumTopicToggleIsClosed extends ChatEventAction {
  /// **ChatEventForumTopicToggleIsClosed** *(chatEventForumTopicToggleIsClosed)* - child of ChatEventAction
  ///
  /// A forum topic was closed or reopened.
  ///
  /// * [topicInfo]: New information about the topic.
  const ChatEventForumTopicToggleIsClosed({
    required this.topicInfo,
  });

  /// New information about the topic
  final ForumTopicInfo topicInfo;

  /// Parse from a json
  factory ChatEventForumTopicToggleIsClosed.fromJson(
          Map<String, dynamic> json) =>
      ChatEventForumTopicToggleIsClosed(
        topicInfo: ForumTopicInfo.fromJson(json['topic_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic_info": topicInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic_info]: New information about the topic
  @override
  ChatEventForumTopicToggleIsClosed copyWith({
    ForumTopicInfo? topicInfo,
  }) =>
      ChatEventForumTopicToggleIsClosed(
        topicInfo: topicInfo ?? this.topicInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventForumTopicToggleIsClosed';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventForumTopicToggleIsHidden** *(chatEventForumTopicToggleIsHidden)* - child of ChatEventAction
///
/// The General forum topic was hidden or unhidden.
///
/// * [topicInfo]: New information about the topic.
final class ChatEventForumTopicToggleIsHidden extends ChatEventAction {
  /// **ChatEventForumTopicToggleIsHidden** *(chatEventForumTopicToggleIsHidden)* - child of ChatEventAction
  ///
  /// The General forum topic was hidden or unhidden.
  ///
  /// * [topicInfo]: New information about the topic.
  const ChatEventForumTopicToggleIsHidden({
    required this.topicInfo,
  });

  /// New information about the topic
  final ForumTopicInfo topicInfo;

  /// Parse from a json
  factory ChatEventForumTopicToggleIsHidden.fromJson(
          Map<String, dynamic> json) =>
      ChatEventForumTopicToggleIsHidden(
        topicInfo: ForumTopicInfo.fromJson(json['topic_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic_info": topicInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic_info]: New information about the topic
  @override
  ChatEventForumTopicToggleIsHidden copyWith({
    ForumTopicInfo? topicInfo,
  }) =>
      ChatEventForumTopicToggleIsHidden(
        topicInfo: topicInfo ?? this.topicInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventForumTopicToggleIsHidden';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventForumTopicDeleted** *(chatEventForumTopicDeleted)* - child of ChatEventAction
///
/// A forum topic was deleted.
///
/// * [topicInfo]: Information about the topic.
final class ChatEventForumTopicDeleted extends ChatEventAction {
  /// **ChatEventForumTopicDeleted** *(chatEventForumTopicDeleted)* - child of ChatEventAction
  ///
  /// A forum topic was deleted.
  ///
  /// * [topicInfo]: Information about the topic.
  const ChatEventForumTopicDeleted({
    required this.topicInfo,
  });

  /// Information about the topic
  final ForumTopicInfo topicInfo;

  /// Parse from a json
  factory ChatEventForumTopicDeleted.fromJson(Map<String, dynamic> json) =>
      ChatEventForumTopicDeleted(
        topicInfo: ForumTopicInfo.fromJson(json['topic_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "topic_info": topicInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [topic_info]: Information about the topic
  @override
  ChatEventForumTopicDeleted copyWith({
    ForumTopicInfo? topicInfo,
  }) =>
      ChatEventForumTopicDeleted(
        topicInfo: topicInfo ?? this.topicInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventForumTopicDeleted';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **ChatEventForumTopicPinned** *(chatEventForumTopicPinned)* - child of ChatEventAction
///
/// A pinned forum topic was changed.
///
/// * [oldTopicInfo]: Information about the old pinned topic; may be null *(optional)*.
/// * [newTopicInfo]: Information about the new pinned topic; may be null *(optional)*.
final class ChatEventForumTopicPinned extends ChatEventAction {
  /// **ChatEventForumTopicPinned** *(chatEventForumTopicPinned)* - child of ChatEventAction
  ///
  /// A pinned forum topic was changed.
  ///
  /// * [oldTopicInfo]: Information about the old pinned topic; may be null *(optional)*.
  /// * [newTopicInfo]: Information about the new pinned topic; may be null *(optional)*.
  const ChatEventForumTopicPinned({
    this.oldTopicInfo,
    this.newTopicInfo,
  });

  /// Information about the old pinned topic; may be null
  final ForumTopicInfo? oldTopicInfo;

  /// Information about the new pinned topic; may be null
  final ForumTopicInfo? newTopicInfo;

  /// Parse from a json
  factory ChatEventForumTopicPinned.fromJson(Map<String, dynamic> json) =>
      ChatEventForumTopicPinned(
        oldTopicInfo: json['old_topic_info'] == null
            ? null
            : ForumTopicInfo.fromJson(json['old_topic_info']),
        newTopicInfo: json['new_topic_info'] == null
            ? null
            : ForumTopicInfo.fromJson(json['new_topic_info']),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "old_topic_info": oldTopicInfo?.toJson(),
      "new_topic_info": newTopicInfo?.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [old_topic_info]: Information about the old pinned topic; may be null
  /// * [new_topic_info]: Information about the new pinned topic; may be null
  @override
  ChatEventForumTopicPinned copyWith({
    ForumTopicInfo? oldTopicInfo,
    ForumTopicInfo? newTopicInfo,
  }) =>
      ChatEventForumTopicPinned(
        oldTopicInfo: oldTopicInfo ?? this.oldTopicInfo,
        newTopicInfo: newTopicInfo ?? this.newTopicInfo,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatEventForumTopicPinned';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
