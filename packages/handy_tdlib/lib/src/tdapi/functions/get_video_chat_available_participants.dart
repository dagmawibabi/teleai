part of '../tdapi.dart';

/// **GetVideoChatAvailableParticipants** *(getVideoChatAvailableParticipants)* - TDLib function
///
/// Returns the list of participant identifiers, on whose behalf a video chat in the chat can be joined.
///
/// * [chatId]: Chat identifier.
///
/// [MessageSenders] is returned on completion.
final class GetVideoChatAvailableParticipants extends TdFunction {
  /// **GetVideoChatAvailableParticipants** *(getVideoChatAvailableParticipants)* - TDLib function
  ///
  /// Returns the list of participant identifiers, on whose behalf a video chat in the chat can be joined.
  ///
  /// * [chatId]: Chat identifier.
  ///
  /// [MessageSenders] is returned on completion.
  const GetVideoChatAvailableParticipants({
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
  GetVideoChatAvailableParticipants copyWith({
    int? chatId,
  }) =>
      GetVideoChatAvailableParticipants(
        chatId: chatId ?? this.chatId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getVideoChatAvailableParticipants';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
