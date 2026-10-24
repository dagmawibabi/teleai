part of '../tdapi.dart';

/// **CheckChatFolderInviteLink** *(checkChatFolderInviteLink)* - TDLib function
///
/// Checks the validity of an invite link for a chat folder and returns information about the corresponding chat folder.
///
/// * [inviteLink]: Invite link to be checked.
///
/// [ChatFolderInviteLinkInfo] is returned on completion.
final class CheckChatFolderInviteLink extends TdFunction {
  /// **CheckChatFolderInviteLink** *(checkChatFolderInviteLink)* - TDLib function
  ///
  /// Checks the validity of an invite link for a chat folder and returns information about the corresponding chat folder.
  ///
  /// * [inviteLink]: Invite link to be checked.
  ///
  /// [ChatFolderInviteLinkInfo] is returned on completion.
  const CheckChatFolderInviteLink({
    required this.inviteLink,
  });

  /// Invite link to be checked
  final String inviteLink;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "invite_link": inviteLink,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [invite_link]: Invite link to be checked
  CheckChatFolderInviteLink copyWith({
    String? inviteLink,
  }) =>
      CheckChatFolderInviteLink(
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkChatFolderInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
