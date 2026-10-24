part of '../tdapi.dart';

/// **Story** *(story)* - basic class
///
/// Represents a story.
///
/// * [id]: Unique story identifier among stories posted by the given chat.
/// * [posterChatId]: Identifier of the chat that posted the story.
/// * [posterId]: Identifier of the user or chat that posted the story; may be null if the story is posted on behalf of the poster_chat_id *(optional)*.
/// * [date]: Point in time (Unix timestamp) when the story was published.
/// * [isBeingPosted]: True, if the story is being posted by the current user.
/// * [isBeingEdited]: True, if the story is being edited by the current user.
/// * [isEdited]: True, if the story was edited.
/// * [isPostedToChatPage]: True, if the story is saved in the profile of the chat that posted it and will be available there after expiration.
/// * [isVisibleOnlyForSelf]: True, if the story is visible only for the current user.
/// * [canBeAddedToAlbum]: True, if the story can be added to an album using createStoryAlbum and addStoryAlbumStories.
/// * [canBeDeleted]: True, if the story can be deleted.
/// * [canBeEdited]: True, if the story can be edited.
/// * [canBeForwarded]: True, if the story can be forwarded as a message or reposted as a story. Otherwise, screenshotting and saving of the story content must be also forbidden.
/// * [canBeReplied]: True, if the story can be replied in the chat with the user who posted the story.
/// * [canSetPrivacySettings]: True, if the story privacy settings can be changed.
/// * [canToggleIsPostedToChatPage]: True, if the story's is_posted_to_chat_page value can be changed.
/// * [canGetStatistics]: True, if the story statistics are available through getStoryStatistics.
/// * [canGetInteractions]: True, if interactions with the story can be received through getStoryInteractions.
/// * [hasExpiredViewers]: True, if users who viewed the story can't be received, because the story has expired more than getOption("story_viewers_expiration_delay") seconds ago.
/// * [repostInfo]: Information about the original story; may be null if the story wasn't reposted *(optional)*.
/// * [interactionInfo]: Information about interactions with the story; may be null if the story isn't owned or there were no interactions *(optional)*.
/// * [chosenReactionType]: Type of the chosen reaction; may be null if none *(optional)*.
/// * [privacySettings]: Privacy rules affecting story visibility; may be approximate for non-owned stories.
/// * [content]: Content of the story.
/// * [areas]: Clickable areas to be shown on the story content.
/// * [caption]: Caption of the story.
/// * [albumIds]: Identifiers of story albums to which the story is added; only for manageable stories.
final class Story extends TdObject {
  /// **Story** *(story)* - basic class
  ///
  /// Represents a story.
  ///
  /// * [id]: Unique story identifier among stories posted by the given chat.
  /// * [posterChatId]: Identifier of the chat that posted the story.
  /// * [posterId]: Identifier of the user or chat that posted the story; may be null if the story is posted on behalf of the poster_chat_id *(optional)*.
  /// * [date]: Point in time (Unix timestamp) when the story was published.
  /// * [isBeingPosted]: True, if the story is being posted by the current user.
  /// * [isBeingEdited]: True, if the story is being edited by the current user.
  /// * [isEdited]: True, if the story was edited.
  /// * [isPostedToChatPage]: True, if the story is saved in the profile of the chat that posted it and will be available there after expiration.
  /// * [isVisibleOnlyForSelf]: True, if the story is visible only for the current user.
  /// * [canBeAddedToAlbum]: True, if the story can be added to an album using createStoryAlbum and addStoryAlbumStories.
  /// * [canBeDeleted]: True, if the story can be deleted.
  /// * [canBeEdited]: True, if the story can be edited.
  /// * [canBeForwarded]: True, if the story can be forwarded as a message or reposted as a story. Otherwise, screenshotting and saving of the story content must be also forbidden.
  /// * [canBeReplied]: True, if the story can be replied in the chat with the user who posted the story.
  /// * [canSetPrivacySettings]: True, if the story privacy settings can be changed.
  /// * [canToggleIsPostedToChatPage]: True, if the story's is_posted_to_chat_page value can be changed.
  /// * [canGetStatistics]: True, if the story statistics are available through getStoryStatistics.
  /// * [canGetInteractions]: True, if interactions with the story can be received through getStoryInteractions.
  /// * [hasExpiredViewers]: True, if users who viewed the story can't be received, because the story has expired more than getOption("story_viewers_expiration_delay") seconds ago.
  /// * [repostInfo]: Information about the original story; may be null if the story wasn't reposted *(optional)*.
  /// * [interactionInfo]: Information about interactions with the story; may be null if the story isn't owned or there were no interactions *(optional)*.
  /// * [chosenReactionType]: Type of the chosen reaction; may be null if none *(optional)*.
  /// * [privacySettings]: Privacy rules affecting story visibility; may be approximate for non-owned stories.
  /// * [content]: Content of the story.
  /// * [areas]: Clickable areas to be shown on the story content.
  /// * [caption]: Caption of the story.
  /// * [albumIds]: Identifiers of story albums to which the story is added; only for manageable stories.
  const Story({
    required this.id,
    required this.posterChatId,
    this.posterId,
    required this.date,
    required this.isBeingPosted,
    required this.isBeingEdited,
    required this.isEdited,
    required this.isPostedToChatPage,
    required this.isVisibleOnlyForSelf,
    required this.canBeAddedToAlbum,
    required this.canBeDeleted,
    required this.canBeEdited,
    required this.canBeForwarded,
    required this.canBeReplied,
    required this.canSetPrivacySettings,
    required this.canToggleIsPostedToChatPage,
    required this.canGetStatistics,
    required this.canGetInteractions,
    required this.hasExpiredViewers,
    this.repostInfo,
    this.interactionInfo,
    this.chosenReactionType,
    required this.privacySettings,
    required this.content,
    required this.areas,
    required this.caption,
    required this.albumIds,
    this.extra,
    this.clientId,
  });

  /// Unique story identifier among stories posted by the given chat
  final int id;

  /// Identifier of the chat that posted the story
  final int posterChatId;

  /// Identifier of the user or chat that posted the story; may be null if the story is posted on behalf of the poster_chat_id
  final MessageSender? posterId;

  /// Point in time (Unix timestamp) when the story was published
  final int date;

  /// True, if the story is being posted by the current user
  final bool isBeingPosted;

  /// True, if the story is being edited by the current user
  final bool isBeingEdited;

  /// True, if the story was edited
  final bool isEdited;

  /// True, if the story is saved in the profile of the chat that posted it and will be available there after expiration
  final bool isPostedToChatPage;

  /// True, if the story is visible only for the current user
  final bool isVisibleOnlyForSelf;

  /// True, if the story can be added to an album using createStoryAlbum and addStoryAlbumStories
  final bool canBeAddedToAlbum;

  /// True, if the story can be deleted
  final bool canBeDeleted;

  /// True, if the story can be edited
  final bool canBeEdited;

  /// True, if the story can be forwarded as a message or reposted as a story. Otherwise, screenshotting and saving of the story content must be also forbidden
  final bool canBeForwarded;

  /// True, if the story can be replied in the chat with the user who posted the story
  final bool canBeReplied;

  /// True, if the story privacy settings can be changed
  final bool canSetPrivacySettings;

  /// True, if the story's is_posted_to_chat_page value can be changed
  final bool canToggleIsPostedToChatPage;

  /// True, if the story statistics are available through getStoryStatistics
  final bool canGetStatistics;

  /// True, if interactions with the story can be received through getStoryInteractions
  final bool canGetInteractions;

  /// True, if users who viewed the story can't be received, because the story has expired more than getOption("story_viewers_expiration_delay") seconds ago
  final bool hasExpiredViewers;

  /// Information about the original story; may be null if the story wasn't reposted
  final StoryRepostInfo? repostInfo;

  /// Information about interactions with the story; may be null if the story isn't owned or there were no interactions
  final StoryInteractionInfo? interactionInfo;

  /// Type of the chosen reaction; may be null if none
  final ReactionType? chosenReactionType;

  /// Privacy rules affecting story visibility; may be approximate for non-owned stories
  final StoryPrivacySettings privacySettings;

  /// Content of the story
  final StoryContent content;

  /// Clickable areas to be shown on the story content
  final List<StoryArea> areas;

  /// Caption of the story
  final FormattedText caption;

  /// Identifiers of story albums to which the story is added; only for manageable stories
  final List<int> albumIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json['id'],
        posterChatId: json['poster_chat_id'],
        posterId: json['poster_id'] == null
            ? null
            : MessageSender.fromJson(json['poster_id']),
        date: json['date'],
        isBeingPosted: json['is_being_posted'],
        isBeingEdited: json['is_being_edited'],
        isEdited: json['is_edited'],
        isPostedToChatPage: json['is_posted_to_chat_page'],
        isVisibleOnlyForSelf: json['is_visible_only_for_self'],
        canBeAddedToAlbum: json['can_be_added_to_album'],
        canBeDeleted: json['can_be_deleted'],
        canBeEdited: json['can_be_edited'],
        canBeForwarded: json['can_be_forwarded'],
        canBeReplied: json['can_be_replied'],
        canSetPrivacySettings: json['can_set_privacy_settings'],
        canToggleIsPostedToChatPage: json['can_toggle_is_posted_to_chat_page'],
        canGetStatistics: json['can_get_statistics'],
        canGetInteractions: json['can_get_interactions'],
        hasExpiredViewers: json['has_expired_viewers'],
        repostInfo: json['repost_info'] == null
            ? null
            : StoryRepostInfo.fromJson(json['repost_info']),
        interactionInfo: json['interaction_info'] == null
            ? null
            : StoryInteractionInfo.fromJson(json['interaction_info']),
        chosenReactionType: json['chosen_reaction_type'] == null
            ? null
            : ReactionType.fromJson(json['chosen_reaction_type']),
        privacySettings:
            StoryPrivacySettings.fromJson(json['privacy_settings']),
        content: StoryContent.fromJson(json['content']),
        areas: List<StoryArea>.from((json['areas'] ?? [])
            .map((item) => StoryArea.fromJson(item))
            .toList()),
        caption: FormattedText.fromJson(json['caption']),
        albumIds: List<int>.from(
            (json['album_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "poster_chat_id": posterChatId,
      "poster_id": posterId?.toJson(),
      "date": date,
      "is_being_posted": isBeingPosted,
      "is_being_edited": isBeingEdited,
      "is_edited": isEdited,
      "is_posted_to_chat_page": isPostedToChatPage,
      "is_visible_only_for_self": isVisibleOnlyForSelf,
      "can_be_added_to_album": canBeAddedToAlbum,
      "can_be_deleted": canBeDeleted,
      "can_be_edited": canBeEdited,
      "can_be_forwarded": canBeForwarded,
      "can_be_replied": canBeReplied,
      "can_set_privacy_settings": canSetPrivacySettings,
      "can_toggle_is_posted_to_chat_page": canToggleIsPostedToChatPage,
      "can_get_statistics": canGetStatistics,
      "can_get_interactions": canGetInteractions,
      "has_expired_viewers": hasExpiredViewers,
      "repost_info": repostInfo?.toJson(),
      "interaction_info": interactionInfo?.toJson(),
      "chosen_reaction_type": chosenReactionType?.toJson(),
      "privacy_settings": privacySettings.toJson(),
      "content": content.toJson(),
      "areas": areas.map((i) => i.toJson()).toList(),
      "caption": caption.toJson(),
      "album_ids": albumIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique story identifier among stories posted by the given chat
  /// * [poster_chat_id]: Identifier of the chat that posted the story
  /// * [poster_id]: Identifier of the user or chat that posted the story; may be null if the story is posted on behalf of the poster_chat_id
  /// * [date]: Point in time (Unix timestamp) when the story was published
  /// * [is_being_posted]: True, if the story is being posted by the current user
  /// * [is_being_edited]: True, if the story is being edited by the current user
  /// * [is_edited]: True, if the story was edited
  /// * [is_posted_to_chat_page]: True, if the story is saved in the profile of the chat that posted it and will be available there after expiration
  /// * [is_visible_only_for_self]: True, if the story is visible only for the current user
  /// * [can_be_added_to_album]: True, if the story can be added to an album using createStoryAlbum and addStoryAlbumStories
  /// * [can_be_deleted]: True, if the story can be deleted
  /// * [can_be_edited]: True, if the story can be edited
  /// * [can_be_forwarded]: True, if the story can be forwarded as a message or reposted as a story. Otherwise, screenshotting and saving of the story content must be also forbidden
  /// * [can_be_replied]: True, if the story can be replied in the chat with the user who posted the story
  /// * [can_set_privacy_settings]: True, if the story privacy settings can be changed
  /// * [can_toggle_is_posted_to_chat_page]: True, if the story's is_posted_to_chat_page value can be changed
  /// * [can_get_statistics]: True, if the story statistics are available through getStoryStatistics
  /// * [can_get_interactions]: True, if interactions with the story can be received through getStoryInteractions
  /// * [has_expired_viewers]: True, if users who viewed the story can't be received, because the story has expired more than getOption("story_viewers_expiration_delay") seconds ago
  /// * [repost_info]: Information about the original story; may be null if the story wasn't reposted
  /// * [interaction_info]: Information about interactions with the story; may be null if the story isn't owned or there were no interactions
  /// * [chosen_reaction_type]: Type of the chosen reaction; may be null if none
  /// * [privacy_settings]: Privacy rules affecting story visibility; may be approximate for non-owned stories
  /// * [content]: Content of the story
  /// * [areas]: Clickable areas to be shown on the story content
  /// * [caption]: Caption of the story
  /// * [album_ids]: Identifiers of story albums to which the story is added; only for manageable stories
  Story copyWith({
    int? id,
    int? posterChatId,
    MessageSender? posterId,
    int? date,
    bool? isBeingPosted,
    bool? isBeingEdited,
    bool? isEdited,
    bool? isPostedToChatPage,
    bool? isVisibleOnlyForSelf,
    bool? canBeAddedToAlbum,
    bool? canBeDeleted,
    bool? canBeEdited,
    bool? canBeForwarded,
    bool? canBeReplied,
    bool? canSetPrivacySettings,
    bool? canToggleIsPostedToChatPage,
    bool? canGetStatistics,
    bool? canGetInteractions,
    bool? hasExpiredViewers,
    StoryRepostInfo? repostInfo,
    StoryInteractionInfo? interactionInfo,
    ReactionType? chosenReactionType,
    StoryPrivacySettings? privacySettings,
    StoryContent? content,
    List<StoryArea>? areas,
    FormattedText? caption,
    List<int>? albumIds,
    dynamic extra,
    int? clientId,
  }) =>
      Story(
        id: id ?? this.id,
        posterChatId: posterChatId ?? this.posterChatId,
        posterId: posterId ?? this.posterId,
        date: date ?? this.date,
        isBeingPosted: isBeingPosted ?? this.isBeingPosted,
        isBeingEdited: isBeingEdited ?? this.isBeingEdited,
        isEdited: isEdited ?? this.isEdited,
        isPostedToChatPage: isPostedToChatPage ?? this.isPostedToChatPage,
        isVisibleOnlyForSelf: isVisibleOnlyForSelf ?? this.isVisibleOnlyForSelf,
        canBeAddedToAlbum: canBeAddedToAlbum ?? this.canBeAddedToAlbum,
        canBeDeleted: canBeDeleted ?? this.canBeDeleted,
        canBeEdited: canBeEdited ?? this.canBeEdited,
        canBeForwarded: canBeForwarded ?? this.canBeForwarded,
        canBeReplied: canBeReplied ?? this.canBeReplied,
        canSetPrivacySettings:
            canSetPrivacySettings ?? this.canSetPrivacySettings,
        canToggleIsPostedToChatPage:
            canToggleIsPostedToChatPage ?? this.canToggleIsPostedToChatPage,
        canGetStatistics: canGetStatistics ?? this.canGetStatistics,
        canGetInteractions: canGetInteractions ?? this.canGetInteractions,
        hasExpiredViewers: hasExpiredViewers ?? this.hasExpiredViewers,
        repostInfo: repostInfo ?? this.repostInfo,
        interactionInfo: interactionInfo ?? this.interactionInfo,
        chosenReactionType: chosenReactionType ?? this.chosenReactionType,
        privacySettings: privacySettings ?? this.privacySettings,
        content: content ?? this.content,
        areas: areas ?? this.areas,
        caption: caption ?? this.caption,
        albumIds: albumIds ?? this.albumIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'story';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
