part of '../tdapi.dart';

/// **SavePreparedInlineMessage** *(savePreparedInlineMessage)* - TDLib function
///
/// Saves an inline message to be sent by the given user; for bots only.
///
/// * [userId]: Identifier of the user.
/// * [result]: The description of the message.
/// * [chatTypes]: Types of the chats to which the message can be sent.
///
/// [PreparedInlineMessageId] is returned on completion.
final class SavePreparedInlineMessage extends TdFunction {
  /// **SavePreparedInlineMessage** *(savePreparedInlineMessage)* - TDLib function
  ///
  /// Saves an inline message to be sent by the given user; for bots only.
  ///
  /// * [userId]: Identifier of the user.
  /// * [result]: The description of the message.
  /// * [chatTypes]: Types of the chats to which the message can be sent.
  ///
  /// [PreparedInlineMessageId] is returned on completion.
  const SavePreparedInlineMessage({
    required this.userId,
    required this.result,
    required this.chatTypes,
  });

  /// Identifier of the user
  final int userId;

  /// The description of the message
  final InputInlineQueryResult result;

  /// Types of the chats to which the message can be sent
  final TargetChatTypes chatTypes;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "result": result.toJson(),
      "chat_types": chatTypes.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  /// * [result]: The description of the message
  /// * [chat_types]: Types of the chats to which the message can be sent
  SavePreparedInlineMessage copyWith({
    int? userId,
    InputInlineQueryResult? result,
    TargetChatTypes? chatTypes,
  }) =>
      SavePreparedInlineMessage(
        userId: userId ?? this.userId,
        result: result ?? this.result,
        chatTypes: chatTypes ?? this.chatTypes,
      );

  /// TDLib object type
  static const String defaultObjectId = 'savePreparedInlineMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
