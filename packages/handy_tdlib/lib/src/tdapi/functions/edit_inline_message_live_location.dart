part of '../tdapi.dart';

/// **EditInlineMessageLiveLocation** *(editInlineMessageLiveLocation)* - TDLib function
///
/// Edits the content of a live location in an inline message sent via a bot; for bots only.
///
/// * [inlineMessageId]: Inline message identifier.
/// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
/// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days *(optional)*.
///
/// [Ok] is returned on completion.
final class EditInlineMessageLiveLocation extends TdFunction {
  /// **EditInlineMessageLiveLocation** *(editInlineMessageLiveLocation)* - TDLib function
  ///
  /// Edits the content of a live location in an inline message sent via a bot; for bots only.
  ///
  /// * [inlineMessageId]: Inline message identifier.
  /// * [replyMarkup]: The new message reply markup; pass null if none *(optional)*.
  /// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const EditInlineMessageLiveLocation({
    required this.inlineMessageId,
    this.replyMarkup,
    this.location,
  });

  /// Inline message identifier
  final String inlineMessageId;

  /// The new message reply markup; pass null if none
  final ReplyMarkup? replyMarkup;

  /// New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
  final LiveLocation? location;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "inline_message_id": inlineMessageId,
      "reply_markup": replyMarkup?.toJson(),
      "location": location?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [inline_message_id]: Inline message identifier
  /// * [reply_markup]: The new message reply markup; pass null if none
  /// * [location]: New live location of the message; pass null to stop sharing the live location. If the new live_period isn't set to 0x7FFFFFFF,. then it must not exceed the current live_period by more than a day, and the live location expiration date must remain in the next 90 days
  EditInlineMessageLiveLocation copyWith({
    String? inlineMessageId,
    ReplyMarkup? replyMarkup,
    LiveLocation? location,
  }) =>
      EditInlineMessageLiveLocation(
        inlineMessageId: inlineMessageId ?? this.inlineMessageId,
        replyMarkup: replyMarkup ?? this.replyMarkup,
        location: location ?? this.location,
      );

  /// TDLib object type
  static const String defaultObjectId = 'editInlineMessageLiveLocation';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
