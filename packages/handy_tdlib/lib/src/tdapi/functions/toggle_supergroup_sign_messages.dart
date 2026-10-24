part of '../tdapi.dart';

/// **ToggleSupergroupSignMessages** *(toggleSupergroupSignMessages)* - TDLib function
///
/// Toggles whether sender signature or link to the account is added to sent messages in a channel; requires can_change_info member right.
///
/// * [supergroupId]: Identifier of the channel.
/// * [signMessages]: New value of sign_messages.
/// * [showMessageSender]: New value of show_message_sender.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupSignMessages extends TdFunction {
  /// **ToggleSupergroupSignMessages** *(toggleSupergroupSignMessages)* - TDLib function
  ///
  /// Toggles whether sender signature or link to the account is added to sent messages in a channel; requires can_change_info member right.
  ///
  /// * [supergroupId]: Identifier of the channel.
  /// * [signMessages]: New value of sign_messages.
  /// * [showMessageSender]: New value of show_message_sender.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupSignMessages({
    required this.supergroupId,
    required this.signMessages,
    required this.showMessageSender,
  });

  /// Identifier of the channel
  final int supergroupId;

  /// New value of sign_messages
  final bool signMessages;

  /// New value of show_message_sender
  final bool showMessageSender;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "sign_messages": signMessages,
      "show_message_sender": showMessageSender,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the channel
  /// * [sign_messages]: New value of sign_messages
  /// * [show_message_sender]: New value of show_message_sender
  ToggleSupergroupSignMessages copyWith({
    int? supergroupId,
    bool? signMessages,
    bool? showMessageSender,
  }) =>
      ToggleSupergroupSignMessages(
        supergroupId: supergroupId ?? this.supergroupId,
        signMessages: signMessages ?? this.signMessages,
        showMessageSender: showMessageSender ?? this.showMessageSender,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupSignMessages';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
