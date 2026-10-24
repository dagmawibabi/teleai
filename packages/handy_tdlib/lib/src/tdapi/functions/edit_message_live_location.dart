part of '../tdapi.dart';

/// **EditMessageLiveLocation** *(editMessageLiveLocation)* - TDLib function
///
/// Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location.. Returns the edited message after the edit is completed on the server side.
///
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
/// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
/// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days *(optional)*.
///
/// [Message] is returned on completion.
final class EditMessageLiveLocation extends TdFunction {
  /// **EditMessageLiveLocation** *(editMessageLiveLocation)* - TDLib function
  ///
  /// Edits the message content of a live location. Messages can be edited for a limited period of time specified in the live location.. Returns the edited message after the edit is completed on the server side.
  ///
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited.
  /// * [replyMarkup]: The new message reply markup; pass null if none; for bots only *(optional)*.
  /// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days *(optional)*.
  ///
  /// [Message] is returned on completion.
  const EditMessageLiveLocation({
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.location,
  });

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  final int messageId;

  /// The new message reply markup; pass null if none; for bots only
  final ReplyMarkup? replyMarkup;

  /// New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
  final LiveLocation? location;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "message_id": messageId,
      "reply_markup": replyMarkup?.toJson(),
      "location": location?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message. Use messageProperties.can_be_edited to check whether the message can be edited
  /// * [reply_markup]: The new message reply markup; pass null if none; for bots only
  /// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
  EditMessageLiveLocation copyWith({
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
    LiveLocation? location,
  }) =>
      EditMessageLiveLocation(
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editMessageLiveLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
