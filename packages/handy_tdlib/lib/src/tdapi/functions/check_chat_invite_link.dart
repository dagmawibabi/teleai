part of '../tdapi.dart';

/// **CheckChatInviteLink** *(checkChatInviteLink)* - TDLib function
///
/// Checks the validity of an invite link for a chat and returns information about the corresponding chat.
///
/// * [inviteLink]: Invite link to be checked.
///
/// [ChatInviteLinkInfo] is returned on completion.
final class CheckChatInviteLink extends TdFunction {
  /// **CheckChatInviteLink** *(checkChatInviteLink)* - TDLib function
  ///
  /// Checks the validity of an invite link for a chat and returns information about the corresponding chat.
  ///
  /// * [inviteLink]: Invite link to be checked.
  ///
  /// [ChatInviteLinkInfo] is returned on completion.
  const CheckChatInviteLink({
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
  CheckChatInviteLink copyWith({
    String? inviteLink,
  }) =>
      CheckChatInviteLink(
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'checkChatInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
