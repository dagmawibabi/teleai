part of '../tdapi.dart';

/// **GetPreparedInlineMessage** *(getPreparedInlineMessage)* - TDLib function
///
/// Returns an inline message prepared by a bot to be sent by the current user.
///
/// * [botUserId]: Identifier of the bot that created the message.
/// * [preparedMessageId]: Identifier of the prepared message.
///
/// [PreparedInlineMessage] is returned on completion.
final class GetPreparedInlineMessage extends TdFunction {
  /// **GetPreparedInlineMessage** *(getPreparedInlineMessage)* - TDLib function
  ///
  /// Returns an inline message prepared by a bot to be sent by the current user.
  ///
  /// * [botUserId]: Identifier of the bot that created the message.
  /// * [preparedMessageId]: Identifier of the prepared message.
  ///
  /// [PreparedInlineMessage] is returned on completion.
  const GetPreparedInlineMessage({
    required this.botUserId,
    required this.preparedMessageId,
  });

  /// Identifier of the bot that created the message
  final int botUserId;

  /// Identifier of the prepared message
  final String preparedMessageId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "bot_user_id": botUserId,
      "prepared_message_id": preparedMessageId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [bot_user_id]: Identifier of the bot that created the message
  /// * [prepared_message_id]: Identifier of the prepared message
  GetPreparedInlineMessage copyWith({
    int? botUserId,
    String? preparedMessageId,
  }) =>
      GetPreparedInlineMessage(
        botUserId: botUserId ?? this.botUserId,
        preparedMessageId: preparedMessageId ?? this.preparedMessageId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPreparedInlineMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
