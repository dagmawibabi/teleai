part of '../tdapi.dart';

/// **ReplacePrimaryChatInviteLink** *(replacePrimaryChatInviteLink)* - TDLib function
///
/// Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right.
///
/// * [chatId]: Chat identifier.
///
/// [ChatInviteLink] is returned on completion.
final class ReplacePrimaryChatInviteLink extends TdFunction {
  /// **ReplacePrimaryChatInviteLink** *(replacePrimaryChatInviteLink)* - TDLib function
  ///
  /// Replaces current primary invite link for a chat with a new primary invite link. Available for basic groups, supergroups, and channels. Requires administrator privileges and can_invite_users right.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [ChatInviteLink] is returned on completion.
  const ReplacePrimaryChatInviteLink({
    required this.chatId,
  });

  /// Chat identifier
  final int chatId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  ReplacePrimaryChatInviteLink copyWith({
    int? chatId,
  }) =>
      ReplacePrimaryChatInviteLink(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'replacePrimaryChatInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
