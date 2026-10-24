part of '../tdapi.dart';

/// **SetVideoChatDefaultParticipant** *(setVideoChatDefaultParticipant)* - TDLib function
///
/// Changes default participant identifier, on whose behalf a video chat in the chat will be joined.
///
/// * [chatId]: Chat identifier.
/// * [defaultParticipantId]: Default group call participant identifier to join the video chats in the chat.
///
/// [Ok] is returned on completion.
final class SetVideoChatDefaultParticipant extends TdFunction {
  /// **SetVideoChatDefaultParticipant** *(setVideoChatDefaultParticipant)* - TDLib function
  ///
  /// Changes default participant identifier, on whose behalf a video chat in the chat will be joined.
  ///
  /// * [chatId]: Chat identifier.
  /// * [defaultParticipantId]: Default group call participant identifier to join the video chats in the chat.
  ///
  /// [Ok] is returned on completion.
  const SetVideoChatDefaultParticipant({
    required this.chatId,
    required this.defaultParticipantId,
  });

  /// Chat identifier
  final int chatId;

  /// Default group call participant identifier to join the video chats in the chat
  final MessageSender defaultParticipantId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "default_participant_id": defaultParticipantId.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [default_participant_id]: Default group call participant identifier to join the video chats in the chat
  SetVideoChatDefaultParticipant copyWith({
    int? chatId,
    MessageSender? defaultParticipantId,
  }) =>
      SetVideoChatDefaultParticipant(
        chatId: chatId ?? this.chatId,
        defaultParticipantId: defaultParticipantId ?? this.defaultParticipantId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setVideoChatDefaultParticipant';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
