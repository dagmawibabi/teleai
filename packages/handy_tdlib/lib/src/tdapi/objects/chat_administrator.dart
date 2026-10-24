part of '../tdapi.dart';

/// **ChatAdministrator** *(chatAdministrator)* - basic class
///
/// Contains information about a chat administrator.
///
/// * [userId]: User identifier of the administrator.
/// * [customTitle]: Custom title of the administrator.
/// * [isOwner]: True, if the user is the owner of the chat.
/// * [canBeEdited]: True, if the current user can edit the administrator privileges for the administrator.
final class ChatAdministrator extends TdObject {
  /// **ChatAdministrator** *(chatAdministrator)* - basic class
  ///
  /// Contains information about a chat administrator.
  ///
  /// * [userId]: User identifier of the administrator.
  /// * [customTitle]: Custom title of the administrator.
  /// * [isOwner]: True, if the user is the owner of the chat.
  /// * [canBeEdited]: True, if the current user can edit the administrator privileges for the administrator.
  const ChatAdministrator({
    required this.userId,
    required this.customTitle,
    required this.isOwner,
    required this.canBeEdited,
  });

  /// User identifier of the administrator
  final int userId;

  /// Custom title of the administrator
  final String customTitle;

  /// True, if the user is the owner of the chat
  final bool isOwner;

  /// True, if the current user can edit the administrator privileges for the administrator
  final bool canBeEdited;

  /// Parse from a json
  factory ChatAdministrator.fromJson(Map<String, dynamic> json) =>
      ChatAdministrator(
        userId: json['user_id'],
        customTitle: json['custom_title'],
        isOwner: json['is_owner'],
        canBeEdited: json['can_be_edited'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "custom_title": customTitle,
      "is_owner": isOwner,
      "can_be_edited": canBeEdited,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier of the administrator
  /// * [custom_title]: Custom title of the administrator
  /// * [is_owner]: True, if the user is the owner of the chat
  /// * [can_be_edited]: True, if the current user can edit the administrator privileges for the administrator
  ChatAdministrator copyWith({
    int? userId,
    String? customTitle,
    bool? isOwner,
    bool? canBeEdited,
  }) =>
      ChatAdministrator(
        userId: userId ?? this.userId,
        customTitle: customTitle ?? this.customTitle,
        isOwner: isOwner ?? this.isOwner,
        canBeEdited: canBeEdited ?? this.canBeEdited,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatAdministrator';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
