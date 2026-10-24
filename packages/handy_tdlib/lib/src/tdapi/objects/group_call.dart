part of '../tdapi.dart';

/// **GroupCall** *(groupCall)* - basic class
///
/// Describes a group call.
///
/// * [id]: Group call identifier.
/// * [uniqueId]: Persistent unique group call identifier.
/// * [title]: Group call title; for video chats only.
/// * [inviteLink]: Invite link for the group call; for group calls that aren't bound to a chat. For video chats call getVideoChatInviteLink to get the link.. For live stories in chats with username call getInternalLink with internalLinkTypeLiveStory.
/// * [paidMessageStarCount]: The minimum number of Telegram Stars that must be paid by general participant for each sent message to the call; for live stories only.
/// * [scheduledStartDate]: Point in time (Unix timestamp) when the group call is expected to be started by an administrator; 0 if it is already active or was ended; for video chats only.
/// * [enabledStartNotification]: True, if the group call is scheduled and the current user will receive a notification when the group call starts; for video chats only.
/// * [isActive]: True, if the call is active.
/// * [isVideoChat]: True, if the call is bound to a chat.
/// * [isLiveStory]: True, if the call is a live story of a chat.
/// * [isRtmpStream]: True, if the call is an RTMP stream instead of an ordinary video chat; for video chats and live stories only.
/// * [isJoined]: True, if the call is joined.
/// * [needRejoin]: True, if user was kicked from the call because of network loss and the call needs to be rejoined.
/// * [isOwned]: True, if the user is the owner of the call and can end the call, change volume level of other users, or ban users there; for group calls that aren't bound to a chat.
/// * [canBeManaged]: True, if the current user can manage the group call; for video chats and live stories only.
/// * [participantCount]: Number of participants in the group call.
/// * [hasHiddenListeners]: True, if group call participants, which are muted, aren't returned in participant list; for video chats only.
/// * [loadedAllParticipants]: True, if all group call participants are loaded.
/// * [messageSenderId]: Message sender chosen to send messages to the group call; for live stories only; may be null if the call isn't a live story *(optional)*.
/// * [recentSpeakers]: At most 3 recently speaking users in the group call.
/// * [isMyVideoEnabled]: True, if the current user's video is enabled.
/// * [isMyVideoPaused]: True, if the current user's video is paused.
/// * [canEnableVideo]: True, if the current user can broadcast video or share screen.
/// * [muteNewParticipants]: True, if only group call administrators can unmute new participants; for video chats only.
/// * [canToggleMuteNewParticipants]: True, if the current user can enable or disable mute_new_participants setting; for video chats only.
/// * [canSendMessages]: True, if the current user can send messages to the group call.
/// * [areMessagesAllowed]: True, if sending of messages is allowed in the group call.
/// * [canToggleAreMessagesAllowed]: True, if the current user can enable or disable sending of messages in the group call.
/// * [canDeleteMessages]: True, if the user can delete messages in the group call.
/// * [recordDuration]: Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on.
/// * [isVideoRecorded]: True, if a video file is being recorded for the call.
/// * [duration]: Call duration, in seconds; for ended calls only.
final class GroupCall extends TdObject {
  /// **GroupCall** *(groupCall)* - basic class
  ///
  /// Describes a group call.
  ///
  /// * [id]: Group call identifier.
  /// * [uniqueId]: Persistent unique group call identifier.
  /// * [title]: Group call title; for video chats only.
  /// * [inviteLink]: Invite link for the group call; for group calls that aren't bound to a chat. For video chats call getVideoChatInviteLink to get the link.. For live stories in chats with username call getInternalLink with internalLinkTypeLiveStory.
  /// * [paidMessageStarCount]: The minimum number of Telegram Stars that must be paid by general participant for each sent message to the call; for live stories only.
  /// * [scheduledStartDate]: Point in time (Unix timestamp) when the group call is expected to be started by an administrator; 0 if it is already active or was ended; for video chats only.
  /// * [enabledStartNotification]: True, if the group call is scheduled and the current user will receive a notification when the group call starts; for video chats only.
  /// * [isActive]: True, if the call is active.
  /// * [isVideoChat]: True, if the call is bound to a chat.
  /// * [isLiveStory]: True, if the call is a live story of a chat.
  /// * [isRtmpStream]: True, if the call is an RTMP stream instead of an ordinary video chat; for video chats and live stories only.
  /// * [isJoined]: True, if the call is joined.
  /// * [needRejoin]: True, if user was kicked from the call because of network loss and the call needs to be rejoined.
  /// * [isOwned]: True, if the user is the owner of the call and can end the call, change volume level of other users, or ban users there; for group calls that aren't bound to a chat.
  /// * [canBeManaged]: True, if the current user can manage the group call; for video chats and live stories only.
  /// * [participantCount]: Number of participants in the group call.
  /// * [hasHiddenListeners]: True, if group call participants, which are muted, aren't returned in participant list; for video chats only.
  /// * [loadedAllParticipants]: True, if all group call participants are loaded.
  /// * [messageSenderId]: Message sender chosen to send messages to the group call; for live stories only; may be null if the call isn't a live story *(optional)*.
  /// * [recentSpeakers]: At most 3 recently speaking users in the group call.
  /// * [isMyVideoEnabled]: True, if the current user's video is enabled.
  /// * [isMyVideoPaused]: True, if the current user's video is paused.
  /// * [canEnableVideo]: True, if the current user can broadcast video or share screen.
  /// * [muteNewParticipants]: True, if only group call administrators can unmute new participants; for video chats only.
  /// * [canToggleMuteNewParticipants]: True, if the current user can enable or disable mute_new_participants setting; for video chats only.
  /// * [canSendMessages]: True, if the current user can send messages to the group call.
  /// * [areMessagesAllowed]: True, if sending of messages is allowed in the group call.
  /// * [canToggleAreMessagesAllowed]: True, if the current user can enable or disable sending of messages in the group call.
  /// * [canDeleteMessages]: True, if the user can delete messages in the group call.
  /// * [recordDuration]: Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on.
  /// * [isVideoRecorded]: True, if a video file is being recorded for the call.
  /// * [duration]: Call duration, in seconds; for ended calls only.
  const GroupCall({
    required this.id,
    required this.uniqueId,
    required this.title,
    required this.inviteLink,
    required this.paidMessageStarCount,
    required this.scheduledStartDate,
    required this.enabledStartNotification,
    required this.isActive,
    required this.isVideoChat,
    required this.isLiveStory,
    required this.isRtmpStream,
    required this.isJoined,
    required this.needRejoin,
    required this.isOwned,
    required this.canBeManaged,
    required this.participantCount,
    required this.hasHiddenListeners,
    required this.loadedAllParticipants,
    this.messageSenderId,
    required this.recentSpeakers,
    required this.isMyVideoEnabled,
    required this.isMyVideoPaused,
    required this.canEnableVideo,
    required this.muteNewParticipants,
    required this.canToggleMuteNewParticipants,
    required this.canSendMessages,
    required this.areMessagesAllowed,
    required this.canToggleAreMessagesAllowed,
    required this.canDeleteMessages,
    required this.recordDuration,
    required this.isVideoRecorded,
    required this.duration,
    this.extra,
    this.clientId,
  });

  /// Group call identifier
  final int id;

  /// Persistent unique group call identifier
  final int uniqueId;

  /// Group call title; for video chats only
  final String title;

  /// Invite link for the group call; for group calls that aren't bound to a chat. For video chats call getVideoChatInviteLink to get the link.. For live stories in chats with username call getInternalLink with internalLinkTypeLiveStory
  final String inviteLink;

  /// The minimum number of Telegram Stars that must be paid by general participant for each sent message to the call; for live stories only
  final int paidMessageStarCount;

  /// Point in time (Unix timestamp) when the group call is expected to be started by an administrator; 0 if it is already active or was ended; for video chats only
  final int scheduledStartDate;

  /// True, if the group call is scheduled and the current user will receive a notification when the group call starts; for video chats only
  final bool enabledStartNotification;

  /// True, if the call is active
  final bool isActive;

  /// True, if the call is bound to a chat
  final bool isVideoChat;

  /// True, if the call is a live story of a chat
  final bool isLiveStory;

  /// True, if the call is an RTMP stream instead of an ordinary video chat; for video chats and live stories only
  final bool isRtmpStream;

  /// True, if the call is joined
  final bool isJoined;

  /// True, if user was kicked from the call because of network loss and the call needs to be rejoined
  final bool needRejoin;

  /// True, if the user is the owner of the call and can end the call, change volume level of other users, or ban users there; for group calls that aren't bound to a chat
  final bool isOwned;

  /// True, if the current user can manage the group call; for video chats and live stories only
  final bool canBeManaged;

  /// Number of participants in the group call
  final int participantCount;

  /// True, if group call participants, which are muted, aren't returned in participant list; for video chats only
  final bool hasHiddenListeners;

  /// True, if all group call participants are loaded
  final bool loadedAllParticipants;

  /// Message sender chosen to send messages to the group call; for live stories only; may be null if the call isn't a live story
  final MessageSender? messageSenderId;

  /// At most 3 recently speaking users in the group call
  final List<GroupCallRecentSpeaker> recentSpeakers;

  /// True, if the current user's video is enabled
  final bool isMyVideoEnabled;

  /// True, if the current user's video is paused
  final bool isMyVideoPaused;

  /// True, if the current user can broadcast video or share screen
  final bool canEnableVideo;

  /// True, if only group call administrators can unmute new participants; for video chats only
  final bool muteNewParticipants;

  /// True, if the current user can enable or disable mute_new_participants setting; for video chats only
  final bool canToggleMuteNewParticipants;

  /// True, if the current user can send messages to the group call
  final bool canSendMessages;

  /// True, if sending of messages is allowed in the group call
  final bool areMessagesAllowed;

  /// True, if the current user can enable or disable sending of messages in the group call
  final bool canToggleAreMessagesAllowed;

  /// True, if the user can delete messages in the group call
  final bool canDeleteMessages;

  /// Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
  final int recordDuration;

  /// True, if a video file is being recorded for the call
  final bool isVideoRecorded;

  /// Call duration, in seconds; for ended calls only
  final int duration;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GroupCall.fromJson(Map<String, dynamic> json) => GroupCall(
        id: json['id'],
        uniqueId: json['unique_id'] is int
            ? json['unique_id']
            : int.parse(json['unique_id']),
        title: json['title'],
        inviteLink: json['invite_link'],
        paidMessageStarCount: json['paid_message_star_count'],
        scheduledStartDate: json['scheduled_start_date'],
        enabledStartNotification: json['enabled_start_notification'],
        isActive: json['is_active'],
        isVideoChat: json['is_video_chat'],
        isLiveStory: json['is_live_story'],
        isRtmpStream: json['is_rtmp_stream'],
        isJoined: json['is_joined'],
        needRejoin: json['need_rejoin'],
        isOwned: json['is_owned'],
        canBeManaged: json['can_be_managed'],
        participantCount: json['participant_count'],
        hasHiddenListeners: json['has_hidden_listeners'],
        loadedAllParticipants: json['loaded_all_participants'],
        messageSenderId: json['message_sender_id'] == null
            ? null
            : MessageSender.fromJson(json['message_sender_id']),
        recentSpeakers: List<GroupCallRecentSpeaker>.from(
            (json['recent_speakers'] ?? [])
                .map((item) => GroupCallRecentSpeaker.fromJson(item))
                .toList()),
        isMyVideoEnabled: json['is_my_video_enabled'],
        isMyVideoPaused: json['is_my_video_paused'],
        canEnableVideo: json['can_enable_video'],
        muteNewParticipants: json['mute_new_participants'],
        canToggleMuteNewParticipants: json['can_toggle_mute_new_participants'],
        canSendMessages: json['can_send_messages'],
        areMessagesAllowed: json['are_messages_allowed'],
        canToggleAreMessagesAllowed: json['can_toggle_are_messages_allowed'],
        canDeleteMessages: json['can_delete_messages'],
        recordDuration: json['record_duration'] ?? 0,
        isVideoRecorded: json['is_video_recorded'],
        duration: json['duration'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "unique_id": uniqueId,
      "title": title,
      "invite_link": inviteLink,
      "paid_message_star_count": paidMessageStarCount,
      "scheduled_start_date": scheduledStartDate,
      "enabled_start_notification": enabledStartNotification,
      "is_active": isActive,
      "is_video_chat": isVideoChat,
      "is_live_story": isLiveStory,
      "is_rtmp_stream": isRtmpStream,
      "is_joined": isJoined,
      "need_rejoin": needRejoin,
      "is_owned": isOwned,
      "can_be_managed": canBeManaged,
      "participant_count": participantCount,
      "has_hidden_listeners": hasHiddenListeners,
      "loaded_all_participants": loadedAllParticipants,
      "message_sender_id": messageSenderId?.toJson(),
      "recent_speakers": recentSpeakers.map((i) => i.toJson()).toList(),
      "is_my_video_enabled": isMyVideoEnabled,
      "is_my_video_paused": isMyVideoPaused,
      "can_enable_video": canEnableVideo,
      "mute_new_participants": muteNewParticipants,
      "can_toggle_mute_new_participants": canToggleMuteNewParticipants,
      "can_send_messages": canSendMessages,
      "are_messages_allowed": areMessagesAllowed,
      "can_toggle_are_messages_allowed": canToggleAreMessagesAllowed,
      "can_delete_messages": canDeleteMessages,
      "record_duration": recordDuration,
      "is_video_recorded": isVideoRecorded,
      "duration": duration,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Group call identifier
  /// * [unique_id]: Persistent unique group call identifier
  /// * [title]: Group call title; for video chats only
  /// * [invite_link]: Invite link for the group call; for group calls that aren't bound to a chat. For video chats call getVideoChatInviteLink to get the link.. For live stories in chats with username call getInternalLink with internalLinkTypeLiveStory
  /// * [paid_message_star_count]: The minimum number of Telegram Stars that must be paid by general participant for each sent message to the call; for live stories only
  /// * [scheduled_start_date]: Point in time (Unix timestamp) when the group call is expected to be started by an administrator; 0 if it is already active or was ended; for video chats only
  /// * [enabled_start_notification]: True, if the group call is scheduled and the current user will receive a notification when the group call starts; for video chats only
  /// * [is_active]: True, if the call is active
  /// * [is_video_chat]: True, if the call is bound to a chat
  /// * [is_live_story]: True, if the call is a live story of a chat
  /// * [is_rtmp_stream]: True, if the call is an RTMP stream instead of an ordinary video chat; for video chats and live stories only
  /// * [is_joined]: True, if the call is joined
  /// * [need_rejoin]: True, if user was kicked from the call because of network loss and the call needs to be rejoined
  /// * [is_owned]: True, if the user is the owner of the call and can end the call, change volume level of other users, or ban users there; for group calls that aren't bound to a chat
  /// * [can_be_managed]: True, if the current user can manage the group call; for video chats and live stories only
  /// * [participant_count]: Number of participants in the group call
  /// * [has_hidden_listeners]: True, if group call participants, which are muted, aren't returned in participant list; for video chats only
  /// * [loaded_all_participants]: True, if all group call participants are loaded
  /// * [message_sender_id]: Message sender chosen to send messages to the group call; for live stories only; may be null if the call isn't a live story
  /// * [recent_speakers]: At most 3 recently speaking users in the group call
  /// * [is_my_video_enabled]: True, if the current user's video is enabled
  /// * [is_my_video_paused]: True, if the current user's video is paused
  /// * [can_enable_video]: True, if the current user can broadcast video or share screen
  /// * [mute_new_participants]: True, if only group call administrators can unmute new participants; for video chats only
  /// * [can_toggle_mute_new_participants]: True, if the current user can enable or disable mute_new_participants setting; for video chats only
  /// * [can_send_messages]: True, if the current user can send messages to the group call
  /// * [are_messages_allowed]: True, if sending of messages is allowed in the group call
  /// * [can_toggle_are_messages_allowed]: True, if the current user can enable or disable sending of messages in the group call
  /// * [can_delete_messages]: True, if the user can delete messages in the group call
  /// * [record_duration]: Duration of the ongoing group call recording, in seconds; 0 if none. An updateGroupCall update is not triggered when value of this field changes, but the same recording goes on
  /// * [is_video_recorded]: True, if a video file is being recorded for the call
  /// * [duration]: Call duration, in seconds; for ended calls only
  GroupCall copyWith({
    int? id,
    int? uniqueId,
    String? title,
    String? inviteLink,
    int? paidMessageStarCount,
    int? scheduledStartDate,
    bool? enabledStartNotification,
    bool? isActive,
    bool? isVideoChat,
    bool? isLiveStory,
    bool? isRtmpStream,
    bool? isJoined,
    bool? needRejoin,
    bool? isOwned,
    bool? canBeManaged,
    int? participantCount,
    bool? hasHiddenListeners,
    bool? loadedAllParticipants,
    MessageSender? messageSenderId,
    List<GroupCallRecentSpeaker>? recentSpeakers,
    bool? isMyVideoEnabled,
    bool? isMyVideoPaused,
    bool? canEnableVideo,
    bool? muteNewParticipants,
    bool? canToggleMuteNewParticipants,
    bool? canSendMessages,
    bool? areMessagesAllowed,
    bool? canToggleAreMessagesAllowed,
    bool? canDeleteMessages,
    int? recordDuration,
    bool? isVideoRecorded,
    int? duration,
    dynamic extra,
    int? clientId,
  }) =>
      GroupCall(
        id: id ?? this.id,
        uniqueId: uniqueId ?? this.uniqueId,
        title: title ?? this.title,
        inviteLink: inviteLink ?? this.inviteLink,
        paidMessageStarCount: paidMessageStarCount ?? this.paidMessageStarCount,
        scheduledStartDate: scheduledStartDate ?? this.scheduledStartDate,
        enabledStartNotification:
            enabledStartNotification ?? this.enabledStartNotification,
        isActive: isActive ?? this.isActive,
        isVideoChat: isVideoChat ?? this.isVideoChat,
        isLiveStory: isLiveStory ?? this.isLiveStory,
        isRtmpStream: isRtmpStream ?? this.isRtmpStream,
        isJoined: isJoined ?? this.isJoined,
        needRejoin: needRejoin ?? this.needRejoin,
        isOwned: isOwned ?? this.isOwned,
        canBeManaged: canBeManaged ?? this.canBeManaged,
        participantCount: participantCount ?? this.participantCount,
        hasHiddenListeners: hasHiddenListeners ?? this.hasHiddenListeners,
        loadedAllParticipants:
            loadedAllParticipants ?? this.loadedAllParticipants,
        messageSenderId: messageSenderId ?? this.messageSenderId,
        recentSpeakers: recentSpeakers ?? this.recentSpeakers,
        isMyVideoEnabled: isMyVideoEnabled ?? this.isMyVideoEnabled,
        isMyVideoPaused: isMyVideoPaused ?? this.isMyVideoPaused,
        canEnableVideo: canEnableVideo ?? this.canEnableVideo,
        muteNewParticipants: muteNewParticipants ?? this.muteNewParticipants,
        canToggleMuteNewParticipants:
            canToggleMuteNewParticipants ?? this.canToggleMuteNewParticipants,
        canSendMessages: canSendMessages ?? this.canSendMessages,
        areMessagesAllowed: areMessagesAllowed ?? this.areMessagesAllowed,
        canToggleAreMessagesAllowed:
            canToggleAreMessagesAllowed ?? this.canToggleAreMessagesAllowed,
        canDeleteMessages: canDeleteMessages ?? this.canDeleteMessages,
        recordDuration: recordDuration ?? this.recordDuration,
        isVideoRecorded: isVideoRecorded ?? this.isVideoRecorded,
        duration: duration ?? this.duration,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'groupCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
