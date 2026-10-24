part of '../tdapi.dart';

/// **ChatFolder** *(chatFolder)* - basic class
///
/// Represents a folder for user chats.
///
/// * [name]: The name of the folder.
/// * [icon]: The chosen icon for the chat folder; may be null. If null, use getChatFolderDefaultIconName to get default icon name for the folder *(optional)*.
/// * [colorId]: The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled. Can't be changed if folder tags are disabled or the current user doesn't have Telegram Premium subscription.
/// * [isShareable]: True, if at least one link has been created for the folder.
/// * [pinnedChatIds]: The chat identifiers of pinned chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium.
/// * [includedChatIds]: The chat identifiers of always included chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium.
/// * [excludedChatIds]: The chat identifiers of always excluded chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") always excluded non-secret chats. and the same number of secret chats, but the limit can be increased with Telegram Premium.
/// * [excludeMuted]: True, if muted chats need to be excluded.
/// * [excludeRead]: True, if read chats need to be excluded.
/// * [excludeArchived]: True, if archived chats need to be excluded.
/// * [includeContacts]: True, if contacts need to be included.
/// * [includeNonContacts]: True, if non-contact users need to be included.
/// * [includeBots]: True, if bots need to be included.
/// * [includeGroups]: True, if basic groups and supergroups need to be included.
/// * [includeChannels]: True, if channels need to be included.
final class ChatFolder extends TdObject {
  /// **ChatFolder** *(chatFolder)* - basic class
  ///
  /// Represents a folder for user chats.
  ///
  /// * [name]: The name of the folder.
  /// * [icon]: The chosen icon for the chat folder; may be null. If null, use getChatFolderDefaultIconName to get default icon name for the folder *(optional)*.
  /// * [colorId]: The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled. Can't be changed if folder tags are disabled or the current user doesn't have Telegram Premium subscription.
  /// * [isShareable]: True, if at least one link has been created for the folder.
  /// * [pinnedChatIds]: The chat identifiers of pinned chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium.
  /// * [includedChatIds]: The chat identifiers of always included chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium.
  /// * [excludedChatIds]: The chat identifiers of always excluded chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") always excluded non-secret chats. and the same number of secret chats, but the limit can be increased with Telegram Premium.
  /// * [excludeMuted]: True, if muted chats need to be excluded.
  /// * [excludeRead]: True, if read chats need to be excluded.
  /// * [excludeArchived]: True, if archived chats need to be excluded.
  /// * [includeContacts]: True, if contacts need to be included.
  /// * [includeNonContacts]: True, if non-contact users need to be included.
  /// * [includeBots]: True, if bots need to be included.
  /// * [includeGroups]: True, if basic groups and supergroups need to be included.
  /// * [includeChannels]: True, if channels need to be included.
  const ChatFolder({
    required this.name,
    this.icon,
    required this.colorId,
    required this.isShareable,
    required this.pinnedChatIds,
    required this.includedChatIds,
    required this.excludedChatIds,
    required this.excludeMuted,
    required this.excludeRead,
    required this.excludeArchived,
    required this.includeContacts,
    required this.includeNonContacts,
    required this.includeBots,
    required this.includeGroups,
    required this.includeChannels,
    this.extra,
    this.clientId,
  });

  /// The name of the folder
  final ChatFolderName name;

  /// The chosen icon for the chat folder; may be null. If null, use getChatFolderDefaultIconName to get default icon name for the folder
  final ChatFolderIcon? icon;

  /// The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled. Can't be changed if folder tags are disabled or the current user doesn't have Telegram Premium subscription
  final int colorId;

  /// True, if at least one link has been created for the folder
  final bool isShareable;

  /// The chat identifiers of pinned chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
  final List<int> pinnedChatIds;

  /// The chat identifiers of always included chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
  final List<int> includedChatIds;

  /// The chat identifiers of always excluded chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") always excluded non-secret chats. and the same number of secret chats, but the limit can be increased with Telegram Premium
  final List<int> excludedChatIds;

  /// True, if muted chats need to be excluded
  final bool excludeMuted;

  /// True, if read chats need to be excluded
  final bool excludeRead;

  /// True, if archived chats need to be excluded
  final bool excludeArchived;

  /// True, if contacts need to be included
  final bool includeContacts;

  /// True, if non-contact users need to be included
  final bool includeNonContacts;

  /// True, if bots need to be included
  final bool includeBots;

  /// True, if basic groups and supergroups need to be included
  final bool includeGroups;

  /// True, if channels need to be included
  final bool includeChannels;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatFolder.fromJson(Map<String, dynamic> json) => ChatFolder(
        name: ChatFolderName.fromJson(json['name']),
        icon:
            json['icon'] == null ? null : ChatFolderIcon.fromJson(json['icon']),
        colorId: json['color_id'],
        isShareable: json['is_shareable'],
        pinnedChatIds: List<int>.from(
            (json['pinned_chat_ids'] ?? []).map((item) => item).toList()),
        includedChatIds: List<int>.from(
            (json['included_chat_ids'] ?? []).map((item) => item).toList()),
        excludedChatIds: List<int>.from(
            (json['excluded_chat_ids'] ?? []).map((item) => item).toList()),
        excludeMuted: json['exclude_muted'],
        excludeRead: json['exclude_read'],
        excludeArchived: json['exclude_archived'],
        includeContacts: json['include_contacts'],
        includeNonContacts: json['include_non_contacts'],
        includeBots: json['include_bots'],
        includeGroups: json['include_groups'],
        includeChannels: json['include_channels'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "name": name.toJson(),
      "icon": icon?.toJson(),
      "color_id": colorId,
      "is_shareable": isShareable,
      "pinned_chat_ids": pinnedChatIds.map((i) => i).toList(),
      "included_chat_ids": includedChatIds.map((i) => i).toList(),
      "excluded_chat_ids": excludedChatIds.map((i) => i).toList(),
      "exclude_muted": excludeMuted,
      "exclude_read": excludeRead,
      "exclude_archived": excludeArchived,
      "include_contacts": includeContacts,
      "include_non_contacts": includeNonContacts,
      "include_bots": includeBots,
      "include_groups": includeGroups,
      "include_channels": includeChannels,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [name]: The name of the folder
  /// * [icon]: The chosen icon for the chat folder; may be null. If null, use getChatFolderDefaultIconName to get default icon name for the folder
  /// * [color_id]: The identifier of the chosen color for the chat folder icon; from -1 to 6. If -1, then color is disabled. Can't be changed if folder tags are disabled or the current user doesn't have Telegram Premium subscription
  /// * [is_shareable]: True, if at least one link has been created for the folder
  /// * [pinned_chat_ids]: The chat identifiers of pinned chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
  /// * [included_chat_ids]: The chat identifiers of always included chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") pinned. and always included non-secret chats and the same number of secret chats, but the limit can be increased with Telegram Premium
  /// * [excluded_chat_ids]: The chat identifiers of always excluded chats in the folder. There can be up to getOption("chat_folder_chosen_chat_count_max") always excluded non-secret chats. and the same number of secret chats, but the limit can be increased with Telegram Premium
  /// * [exclude_muted]: True, if muted chats need to be excluded
  /// * [exclude_read]: True, if read chats need to be excluded
  /// * [exclude_archived]: True, if archived chats need to be excluded
  /// * [include_contacts]: True, if contacts need to be included
  /// * [include_non_contacts]: True, if non-contact users need to be included
  /// * [include_bots]: True, if bots need to be included
  /// * [include_groups]: True, if basic groups and supergroups need to be included
  /// * [include_channels]: True, if channels need to be included
  ChatFolder copyWith({
    ChatFolderName? name,
    ChatFolderIcon? icon,
    int? colorId,
    bool? isShareable,
    List<int>? pinnedChatIds,
    List<int>? includedChatIds,
    List<int>? excludedChatIds,
    bool? excludeMuted,
    bool? excludeRead,
    bool? excludeArchived,
    bool? includeContacts,
    bool? includeNonContacts,
    bool? includeBots,
    bool? includeGroups,
    bool? includeChannels,
    dynamic extra,
    int? clientId,
  }) =>
      ChatFolder(
        name: name ?? this.name,
        icon: icon ?? this.icon,
        colorId: colorId ?? this.colorId,
        isShareable: isShareable ?? this.isShareable,
        pinnedChatIds: pinnedChatIds ?? this.pinnedChatIds,
        includedChatIds: includedChatIds ?? this.includedChatIds,
        excludedChatIds: excludedChatIds ?? this.excludedChatIds,
        excludeMuted: excludeMuted ?? this.excludeMuted,
        excludeRead: excludeRead ?? this.excludeRead,
        excludeArchived: excludeArchived ?? this.excludeArchived,
        includeContacts: includeContacts ?? this.includeContacts,
        includeNonContacts: includeNonContacts ?? this.includeNonContacts,
        includeBots: includeBots ?? this.includeBots,
        includeGroups: includeGroups ?? this.includeGroups,
        includeChannels: includeChannels ?? this.includeChannels,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatFolder';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
