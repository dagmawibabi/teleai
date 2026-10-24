part of '../tdapi.dart';

/// **CommunityPermissions** *(communityPermissions)* - basic class
///
/// Describes actions that a user is allowed to take in a community.
///
/// * [canEditChatList]: True, if the user can change the chats added to the community.
final class CommunityPermissions extends TdObject {
  /// **CommunityPermissions** *(communityPermissions)* - basic class
  ///
  /// Describes actions that a user is allowed to take in a community.
  ///
  /// * [canEditChatList]: True, if the user can change the chats added to the community.
  const CommunityPermissions({
    required this.canEditChatList,
  });

  /// True, if the user can change the chats added to the community
  final bool canEditChatList;

  /// Parse from a json
  factory CommunityPermissions.fromJson(Map<String, dynamic> json) =>
      CommunityPermissions(
        canEditChatList: json['can_edit_chat_list'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "can_edit_chat_list": canEditChatList,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [can_edit_chat_list]: True, if the user can change the chats added to the community
  CommunityPermissions copyWith({
    bool? canEditChatList,
  }) =>
      CommunityPermissions(
        canEditChatList: canEditChatList ?? this.canEditChatList,
      );

  /// TDLib object type
  static const String defaultObjectId = 'communityPermissions';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
