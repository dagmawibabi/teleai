part of '../tdapi.dart';

/// **JoinChatByInviteLink** *(joinChatByInviteLink)* - TDLib function
///
/// Uses an invite link to add the current user to the chat if possible.
///
/// * [inviteLink]: Invite link to use.
///
/// [ChatJoinResult] is returned on completion.
final class JoinChatByInviteLink extends TdFunction {
  /// **JoinChatByInviteLink** *(joinChatByInviteLink)* - TDLib function
  ///
  /// Uses an invite link to add the current user to the chat if possible.
  ///
  /// * [inviteLink]: Invite link to use.
  ///
  /// [ChatJoinResult] is returned on completion.
  const JoinChatByInviteLink({
    required this.inviteLink,
  });

  /// Invite link to use
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
  /// * [invite_link]: Invite link to use
  JoinChatByInviteLink copyWith({
    String? inviteLink,
  }) =>
      JoinChatByInviteLink(
        inviteLink: inviteLink ?? this.inviteLink,
      );

  /// TDLib object type
  static const String defaultObjectId = 'joinChatByInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
