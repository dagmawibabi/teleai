part of '../tdapi.dart';

/// **AddChatMembers** *(addChatMembers)* - TDLib function
///
/// Adds multiple new members to a chat; requires can_invite_users member right. Currently, this method is available only in supergroups and channels.. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members. Returns information about members that weren't added.
///
/// * [chatId]: Chat identifier.
/// * [userIds]: Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels.
///
/// [FailedToAddMembers] is returned on completion.
final class AddChatMembers extends TdFunction {
  /// **AddChatMembers** *(addChatMembers)* - TDLib function
  ///
  /// Adds multiple new members to a chat; requires can_invite_users member right. Currently, this method is available only in supergroups and channels.. This method can't be used to join a chat. Members can't be added to a channel if it has more than 200 members. Returns information about members that weren't added.
  ///
  /// * [chatId]: Chat identifier.
  /// * [userIds]: Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels.
  ///
  /// [FailedToAddMembers] is returned on completion.
  const AddChatMembers({
    required this.chatId,
    required this.userIds,
  });

  /// Chat identifier
  final int chatId;

  /// Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
  final List<int> userIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "user_ids": userIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [user_ids]: Identifiers of the users to be added to the chat. The maximum number of added users is 20 for supergroups and 100 for channels
  AddChatMembers copyWith({
    int? chatId,
    List<int>? userIds,
  }) =>
      AddChatMembers(
        chatId: chatId ?? this.chatId,
        userIds: userIds ?? this.userIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'addChatMembers';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
