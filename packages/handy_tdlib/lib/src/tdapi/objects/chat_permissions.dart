part of '../tdapi.dart';

/// **ChatPermissions** *(chatPermissions)* - basic class
///
/// Describes actions that a user is allowed to take in a chat.
///
/// * [canSendBasicMessages]: True, if the user can send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations, and venues.
/// * [canSendAudios]: True, if the user can send music files.
/// * [canSendDocuments]: True, if the user can send documents.
/// * [canSendPhotos]: True, if the user can send photos.
/// * [canSendVideos]: True, if the user can send videos.
/// * [canSendVideoNotes]: True, if the user can send video notes.
/// * [canSendVoiceNotes]: True, if the user can send voice notes.
/// * [canSendPolls]: True, if the user can send polls and checklists.
/// * [canSendOtherMessages]: True, if the user can send animations, games, stickers, and dice and use inline bots.
/// * [canAddLinkPreviews]: True, if the user may add a link preview to their messages.
/// * [canReactToMessages]: True, if the user can react to messages.
/// * [canEditTag]: True, if the user may change the tag of self.
/// * [canChangeInfo]: True, if the user can change the chat title, photo, and other settings.
/// * [canInviteUsers]: True, if the user can invite new users to the chat.
/// * [canPinMessages]: True, if the user can pin messages.
/// * [canCreateTopics]: True, if the user can create topics.
final class ChatPermissions extends TdObject {
  /// **ChatPermissions** *(chatPermissions)* - basic class
  ///
  /// Describes actions that a user is allowed to take in a chat.
  ///
  /// * [canSendBasicMessages]: True, if the user can send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations, and venues.
  /// * [canSendAudios]: True, if the user can send music files.
  /// * [canSendDocuments]: True, if the user can send documents.
  /// * [canSendPhotos]: True, if the user can send photos.
  /// * [canSendVideos]: True, if the user can send videos.
  /// * [canSendVideoNotes]: True, if the user can send video notes.
  /// * [canSendVoiceNotes]: True, if the user can send voice notes.
  /// * [canSendPolls]: True, if the user can send polls and checklists.
  /// * [canSendOtherMessages]: True, if the user can send animations, games, stickers, and dice and use inline bots.
  /// * [canAddLinkPreviews]: True, if the user may add a link preview to their messages.
  /// * [canReactToMessages]: True, if the user can react to messages.
  /// * [canEditTag]: True, if the user may change the tag of self.
  /// * [canChangeInfo]: True, if the user can change the chat title, photo, and other settings.
  /// * [canInviteUsers]: True, if the user can invite new users to the chat.
  /// * [canPinMessages]: True, if the user can pin messages.
  /// * [canCreateTopics]: True, if the user can create topics.
  const ChatPermissions({
    required this.canSendBasicMessages,
    required this.canSendAudios,
    required this.canSendDocuments,
    required this.canSendPhotos,
    required this.canSendVideos,
    required this.canSendVideoNotes,
    required this.canSendVoiceNotes,
    required this.canSendPolls,
    required this.canSendOtherMessages,
    required this.canAddLinkPreviews,
    required this.canReactToMessages,
    required this.canEditTag,
    required this.canChangeInfo,
    required this.canInviteUsers,
    required this.canPinMessages,
    required this.canCreateTopics,
  });

  /// True, if the user can send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations, and venues
  final bool canSendBasicMessages;

  /// True, if the user can send music files
  final bool canSendAudios;

  /// True, if the user can send documents
  final bool canSendDocuments;

  /// True, if the user can send photos
  final bool canSendPhotos;

  /// True, if the user can send videos
  final bool canSendVideos;

  /// True, if the user can send video notes
  final bool canSendVideoNotes;

  /// True, if the user can send voice notes
  final bool canSendVoiceNotes;

  /// True, if the user can send polls and checklists
  final bool canSendPolls;

  /// True, if the user can send animations, games, stickers, and dice and use inline bots
  final bool canSendOtherMessages;

  /// True, if the user may add a link preview to their messages
  final bool canAddLinkPreviews;

  /// True, if the user can react to messages
  final bool canReactToMessages;

  /// True, if the user may change the tag of self
  final bool canEditTag;

  /// True, if the user can change the chat title, photo, and other settings
  final bool canChangeInfo;

  /// True, if the user can invite new users to the chat
  final bool canInviteUsers;

  /// True, if the user can pin messages
  final bool canPinMessages;

  /// True, if the user can create topics
  final bool canCreateTopics;

  /// Parse from a json
  factory ChatPermissions.fromJson(Map<String, dynamic> json) =>
      ChatPermissions(
        canSendBasicMessages: json['can_send_basic_messages'],
        canSendAudios: json['can_send_audios'],
        canSendDocuments: json['can_send_documents'],
        canSendPhotos: json['can_send_photos'],
        canSendVideos: json['can_send_videos'],
        canSendVideoNotes: json['can_send_video_notes'],
        canSendVoiceNotes: json['can_send_voice_notes'],
        canSendPolls: json['can_send_polls'],
        canSendOtherMessages: json['can_send_other_messages'],
        canAddLinkPreviews: json['can_add_link_previews'],
        canReactToMessages: json['can_react_to_messages'],
        canEditTag: json['can_edit_tag'],
        canChangeInfo: json['can_change_info'],
        canInviteUsers: json['can_invite_users'],
        canPinMessages: json['can_pin_messages'],
        canCreateTopics: json['can_create_topics'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_send_basic_messages": canSendBasicMessages,
      "can_send_audios": canSendAudios,
      "can_send_documents": canSendDocuments,
      "can_send_photos": canSendPhotos,
      "can_send_videos": canSendVideos,
      "can_send_video_notes": canSendVideoNotes,
      "can_send_voice_notes": canSendVoiceNotes,
      "can_send_polls": canSendPolls,
      "can_send_other_messages": canSendOtherMessages,
      "can_add_link_previews": canAddLinkPreviews,
      "can_react_to_messages": canReactToMessages,
      "can_edit_tag": canEditTag,
      "can_change_info": canChangeInfo,
      "can_invite_users": canInviteUsers,
      "can_pin_messages": canPinMessages,
      "can_create_topics": canCreateTopics,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_send_basic_messages]: True, if the user can send text messages, rich messages, contacts, giveaways, giveaway winners, invoices, locations, and venues
  /// * [can_send_audios]: True, if the user can send music files
  /// * [can_send_documents]: True, if the user can send documents
  /// * [can_send_photos]: True, if the user can send photos
  /// * [can_send_videos]: True, if the user can send videos
  /// * [can_send_video_notes]: True, if the user can send video notes
  /// * [can_send_voice_notes]: True, if the user can send voice notes
  /// * [can_send_polls]: True, if the user can send polls and checklists
  /// * [can_send_other_messages]: True, if the user can send animations, games, stickers, and dice and use inline bots
  /// * [can_add_link_previews]: True, if the user may add a link preview to their messages
  /// * [can_react_to_messages]: True, if the user can react to messages
  /// * [can_edit_tag]: True, if the user may change the tag of self
  /// * [can_change_info]: True, if the user can change the chat title, photo, and other settings
  /// * [can_invite_users]: True, if the user can invite new users to the chat
  /// * [can_pin_messages]: True, if the user can pin messages
  /// * [can_create_topics]: True, if the user can create topics
  ChatPermissions copyWith({
    bool? canSendBasicMessages,
    bool? canSendAudios,
    bool? canSendDocuments,
    bool? canSendPhotos,
    bool? canSendVideos,
    bool? canSendVideoNotes,
    bool? canSendVoiceNotes,
    bool? canSendPolls,
    bool? canSendOtherMessages,
    bool? canAddLinkPreviews,
    bool? canReactToMessages,
    bool? canEditTag,
    bool? canChangeInfo,
    bool? canInviteUsers,
    bool? canPinMessages,
    bool? canCreateTopics,
  }) =>
      ChatPermissions(
        canSendBasicMessages: canSendBasicMessages ?? this.canSendBasicMessages,
        canSendAudios: canSendAudios ?? this.canSendAudios,
        canSendDocuments: canSendDocuments ?? this.canSendDocuments,
        canSendPhotos: canSendPhotos ?? this.canSendPhotos,
        canSendVideos: canSendVideos ?? this.canSendVideos,
        canSendVideoNotes: canSendVideoNotes ?? this.canSendVideoNotes,
        canSendVoiceNotes: canSendVoiceNotes ?? this.canSendVoiceNotes,
        canSendPolls: canSendPolls ?? this.canSendPolls,
        canSendOtherMessages: canSendOtherMessages ?? this.canSendOtherMessages,
        canAddLinkPreviews: canAddLinkPreviews ?? this.canAddLinkPreviews,
        canReactToMessages: canReactToMessages ?? this.canReactToMessages,
        canEditTag: canEditTag ?? this.canEditTag,
        canChangeInfo: canChangeInfo ?? this.canChangeInfo,
        canInviteUsers: canInviteUsers ?? this.canInviteUsers,
        canPinMessages: canPinMessages ?? this.canPinMessages,
        canCreateTopics: canCreateTopics ?? this.canCreateTopics,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatPermissions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
