part of '../tdapi.dart';

/// **RevokeGroupCallInviteLink** *(revokeGroupCallInviteLink)* - TDLib function
///
/// Revokes invite link for a group call. Requires groupCall.can_be_managed right for video chats or groupCall.is_owned otherwise.
///
/// * [groupCallId]: Group call identifier.
///
/// [Ok] is returned on completion.
final class RevokeGroupCallInviteLink extends TdFunction {
  /// **RevokeGroupCallInviteLink** *(revokeGroupCallInviteLink)* - TDLib function
  ///
  /// Revokes invite link for a group call. Requires groupCall.can_be_managed right for video chats or groupCall.is_owned otherwise.
  ///
  /// * [groupCallId]: Group call identifier.
  ///
  /// [Ok] is returned on completion.
  const RevokeGroupCallInviteLink({
    required this.groupCallId,
  });

  /// Group call identifier
  final int groupCallId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "group_call_id": groupCallId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [group_call_id]: Group call identifier
  RevokeGroupCallInviteLink copyWith({
    int? groupCallId,
  }) =>
      RevokeGroupCallInviteLink(
        groupCallId: groupCallId ?? this.groupCallId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'revokeGroupCallInviteLink';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
