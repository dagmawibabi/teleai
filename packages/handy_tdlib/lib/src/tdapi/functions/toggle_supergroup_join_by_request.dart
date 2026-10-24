part of '../tdapi.dart';

/// **ToggleSupergroupJoinByRequest** *(toggleSupergroupJoinByRequest)* - TDLib function
///
/// Toggles whether all users directly joining the supergroup need to be approved by supergroup administrators; requires can_restrict_members administrator right.
///
/// * [supergroupId]: Identifier of the supergroup that isn't a broadcast group and isn't a channel direct message group.
/// * [joinByRequest]: New value of join_by_request.
/// * [guardBotUserId]: Identifier of the bot which will be the guard bot in the group; pass 0 if none; ignored if join_by_request == false.. The bot must have administrator privileges and can_invite_users right in the supergroup chat, and must have userTypeBot.is_guard == true.
/// * [applyToInviteLinks]: Pass true to apply the change to the existing invite links, including primary links.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupJoinByRequest extends TdFunction {
  /// **ToggleSupergroupJoinByRequest** *(toggleSupergroupJoinByRequest)* - TDLib function
  ///
  /// Toggles whether all users directly joining the supergroup need to be approved by supergroup administrators; requires can_restrict_members administrator right.
  ///
  /// * [supergroupId]: Identifier of the supergroup that isn't a broadcast group and isn't a channel direct message group.
  /// * [joinByRequest]: New value of join_by_request.
  /// * [guardBotUserId]: Identifier of the bot which will be the guard bot in the group; pass 0 if none; ignored if join_by_request == false.. The bot must have administrator privileges and can_invite_users right in the supergroup chat, and must have userTypeBot.is_guard == true.
  /// * [applyToInviteLinks]: Pass true to apply the change to the existing invite links, including primary links.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupJoinByRequest({
    required this.supergroupId,
    required this.joinByRequest,
    required this.guardBotUserId,
    required this.applyToInviteLinks,
  });

  /// Identifier of the supergroup that isn't a broadcast group and isn't a channel direct message group
  final int supergroupId;

  /// New value of join_by_request
  final bool joinByRequest;

  /// Identifier of the bot which will be the guard bot in the group; pass 0 if none; ignored if join_by_request == false.. The bot must have administrator privileges and can_invite_users right in the supergroup chat, and must have userTypeBot.is_guard == true
  final int guardBotUserId;

  /// Pass true to apply the change to the existing invite links, including primary links
  final bool applyToInviteLinks;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "join_by_request": joinByRequest,
      "guard_bot_user_id": guardBotUserId,
      "apply_to_invite_links": applyToInviteLinks,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup that isn't a broadcast group and isn't a channel direct message group
  /// * [join_by_request]: New value of join_by_request
  /// * [guard_bot_user_id]: Identifier of the bot which will be the guard bot in the group; pass 0 if none; ignored if join_by_request == false.. The bot must have administrator privileges and can_invite_users right in the supergroup chat, and must have userTypeBot.is_guard == true
  /// * [apply_to_invite_links]: Pass true to apply the change to the existing invite links, including primary links
  ToggleSupergroupJoinByRequest copyWith({
    int? supergroupId,
    bool? joinByRequest,
    int? guardBotUserId,
    bool? applyToInviteLinks,
  }) =>
      ToggleSupergroupJoinByRequest(
        supergroupId: supergroupId ?? this.supergroupId,
        joinByRequest: joinByRequest ?? this.joinByRequest,
        guardBotUserId: guardBotUserId ?? this.guardBotUserId,
        applyToInviteLinks: applyToInviteLinks ?? this.applyToInviteLinks,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupJoinByRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
