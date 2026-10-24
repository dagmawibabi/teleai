part of '../tdapi.dart';

/// **ChatFolderInviteLinkInfo** *(chatFolderInviteLinkInfo)* - basic class
///
/// Contains information about an invite link to a chat folder.
///
/// * [chatFolderInfo]: Basic information about the chat folder; chat folder identifier will be 0 if the user didn't have the chat folder yet.
/// * [missingChatIds]: Identifiers of the chats from the link, which aren't added to the folder yet.
/// * [addedChatIds]: Identifiers of the chats from the link, which are added to the folder already.
final class ChatFolderInviteLinkInfo extends TdObject {
  /// **ChatFolderInviteLinkInfo** *(chatFolderInviteLinkInfo)* - basic class
  ///
  /// Contains information about an invite link to a chat folder.
  ///
  /// * [chatFolderInfo]: Basic information about the chat folder; chat folder identifier will be 0 if the user didn't have the chat folder yet.
  /// * [missingChatIds]: Identifiers of the chats from the link, which aren't added to the folder yet.
  /// * [addedChatIds]: Identifiers of the chats from the link, which are added to the folder already.
  const ChatFolderInviteLinkInfo({
    required this.chatFolderInfo,
    required this.missingChatIds,
    required this.addedChatIds,
    this.extra,
    this.clientId,
  });

  /// Basic information about the chat folder; chat folder identifier will be 0 if the user didn't have the chat folder yet
  final ChatFolderInfo chatFolderInfo;

  /// Identifiers of the chats from the link, which aren't added to the folder yet
  final List<int> missingChatIds;

  /// Identifiers of the chats from the link, which are added to the folder already
  final List<int> addedChatIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatFolderInviteLinkInfo.fromJson(Map<String, dynamic> json) =>
      ChatFolderInviteLinkInfo(
        chatFolderInfo: ChatFolderInfo.fromJson(json['chat_folder_info']),
        missingChatIds: List<int>.from(
            (json['missing_chat_ids'] ?? []).map((item) => item).toList()),
        addedChatIds: List<int>.from(
            (json['added_chat_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "chat_folder_info": chatFolderInfo.toJson(),
      "missing_chat_ids": missingChatIds.map((i) => i).toList(),
      "added_chat_ids": addedChatIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_folder_info]: Basic information about the chat folder; chat folder identifier will be 0 if the user didn't have the chat folder yet
  /// * [missing_chat_ids]: Identifiers of the chats from the link, which aren't added to the folder yet
  /// * [added_chat_ids]: Identifiers of the chats from the link, which are added to the folder already
  ChatFolderInviteLinkInfo copyWith({
    ChatFolderInfo? chatFolderInfo,
    List<int>? missingChatIds,
    List<int>? addedChatIds,
    dynamic extra,
    int? clientId,
  }) =>
      ChatFolderInviteLinkInfo(
        chatFolderInfo: chatFolderInfo ?? this.chatFolderInfo,
        missingChatIds: missingChatIds ?? this.missingChatIds,
        addedChatIds: addedChatIds ?? this.addedChatIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatFolderInviteLinkInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
