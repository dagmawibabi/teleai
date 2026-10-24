part of '../tdapi.dart';

/// **ToggleSupergroupJoinToSendMessages** *(toggleSupergroupJoinToSendMessages)* - TDLib function
///
/// Toggles whether joining is mandatory to send messages to a discussion supergroup; requires can_restrict_members administrator right.
///
/// * [supergroupId]: Identifier of the supergroup that isn't a broadcast group.
/// * [joinToSendMessages]: New value of join_to_send_messages.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupJoinToSendMessages extends TdFunction {
  /// **ToggleSupergroupJoinToSendMessages** *(toggleSupergroupJoinToSendMessages)* - TDLib function
  ///
  /// Toggles whether joining is mandatory to send messages to a discussion supergroup; requires can_restrict_members administrator right.
  ///
  /// * [supergroupId]: Identifier of the supergroup that isn't a broadcast group.
  /// * [joinToSendMessages]: New value of join_to_send_messages.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupJoinToSendMessages({
    required this.supergroupId,
    required this.joinToSendMessages,
  });

  /// Identifier of the supergroup that isn't a broadcast group
  final int supergroupId;

  /// New value of join_to_send_messages
  final bool joinToSendMessages;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "join_to_send_messages": joinToSendMessages,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup that isn't a broadcast group
  /// * [join_to_send_messages]: New value of join_to_send_messages
  ToggleSupergroupJoinToSendMessages copyWith({
    int? supergroupId,
    bool? joinToSendMessages,
  }) =>
      ToggleSupergroupJoinToSendMessages(
        supergroupId: supergroupId ?? this.supergroupId,
        joinToSendMessages: joinToSendMessages ?? this.joinToSendMessages,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupJoinToSendMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
