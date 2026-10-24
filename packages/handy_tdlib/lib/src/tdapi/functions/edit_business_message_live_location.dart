part of '../tdapi.dart';

/// **EditBusinessMessageLiveLocation** *(editBusinessMessageLiveLocation)* - TDLib function
///
/// Edits the content of a live location in a message sent on behalf of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
/// * [chatId]: The chat the message belongs to.
/// * [messageId]: Identifier of the message.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
/// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days *(optional)*.
///
/// [BusinessMessage] is returned on completion.
final class EditBusinessMessageLiveLocation extends TdFunction {
  /// **EditBusinessMessageLiveLocation** *(editBusinessMessageLiveLocation)* - TDLib function
  ///
  /// Edits the content of a live location in a message sent on behalf of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which the message was sent.
  /// * [chatId]: The chat the message belongs to.
  /// * [messageId]: Identifier of the message.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  /// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days *(optional)*.
  ///
  /// [BusinessMessage] is returned on completion.
  const EditBusinessMessageLiveLocation({
    required this.businessConnectionId,
    required this.chatId,
    required this.messageId,
    this.replyMarkup,
    this.location,
  });

  /// Unique identifier of business connection on behalf of which the message was sent
  final String businessConnectionId;

  /// The chat the message belongs to
  final int chatId;

  /// Identifier of the message
  final int messageId;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
  final LiveLocation? location;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
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
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which the message was sent
  /// * [chat_id]: The chat the message belongs to
  /// * [message_id]: Identifier of the message
  /// * [reply_markup]: The new message reply markup; pass null if none
  /// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
  EditBusinessMessageLiveLocation copyWith({
    String? businessConnectionId,
    int? chatId,
    int? messageId,
    ReplyMarkup? replyMarkup,
    LiveLocation? location,
  }) =>
      EditBusinessMessageLiveLocation(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        chatId: chatId ?? this.chatId,
        messageId: messageId ?? this.messageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editBusinessMessageLiveLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
