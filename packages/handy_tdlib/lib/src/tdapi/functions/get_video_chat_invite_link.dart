part of '../tdapi.dart';

/// **GetVideoChatInviteLink** *(getVideoChatInviteLink)* - TDLib function
///
/// Returns invite link to a video chat in a public chat.
///
/// * [groupCallId]: Group call identifier.
/// * [canSelfUnmute]: Pass true if the invite link needs to contain an invite hash, passing which to joinVideoChat would allow the invited user to unmute themselves. Requires groupCall.can_be_managed right.
///
/// [HttpUrl] is returned on completion.
final class GetVideoChatInviteLink extends TdFunction {
  /// **GetVideoChatInviteLink** *(getVideoChatInviteLink)* - TDLib function
  ///
  /// Returns invite link to a video chat in a public chat.
  ///
  /// * [groupCallId]: Group call identifier.
  /// * [canSelfUnmute]: Pass true if the invite link needs to contain an invite hash, passing which to joinVideoChat would allow the invited user to unmute themselves. Requires groupCall.can_be_managed right.
  ///
  /// [HttpUrl] is returned on completion.
  const GetVideoChatInviteLink({
    required this.groupCallId,
    required this.canSelfUnmute,
  });

  /// Group call identifier
  final int groupCallId;

  /// Pass true if the invite link needs to contain an invite hash, passing which to joinVideoChat would allow the invited user to unmute themselves. Requires groupCall.can_be_managed right
  final bool canSelfUnmute;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "can_self_unmute": canSelfUnmute,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  /// * [can_self_unmute]: Pass true if the invite link needs to contain an invite hash, passing which to joinVideoChat would allow the invited user to unmute themselves. Requires groupCall.can_be_managed right
  GetVideoChatInviteLink copyWith({
    int? groupCallId,
    bool? canSelfUnmute,
  }) =>
      GetVideoChatInviteLink(
        groupCallId: groupCallId ?? this.groupCallId,
        canSelfUnmute: canSelfUnmute ?? this.canSelfUnmute,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getVideoChatInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
