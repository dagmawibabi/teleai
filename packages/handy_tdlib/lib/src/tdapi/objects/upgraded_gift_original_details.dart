part of '../tdapi.dart';

/// **UpgradedGiftOriginalDetails** *(upgradedGiftOriginalDetails)* - basic class
///
/// Describes the original details about the gift.
///
/// * [senderId]: Identifier of the user or the chat that sent the gift; may be null if the gift was private *(optional)*.
/// * [receiverId]: Identifier of the user or the chat that received the gift.
/// * [text]: Message added to the gift.
/// * [date]: Point in time (Unix timestamp) when the gift was sent.
final class UpgradedGiftOriginalDetails extends TdObject {
  /// **UpgradedGiftOriginalDetails** *(upgradedGiftOriginalDetails)* - basic class
  ///
  /// Describes the original details about the gift.
  ///
  /// * [senderId]: Identifier of the user or the chat that sent the gift; may be null if the gift was private *(optional)*.
  /// * [receiverId]: Identifier of the user or the chat that received the gift.
  /// * [text]: Message added to the gift.
  /// * [date]: Point in time (Unix timestamp) when the gift was sent.
  const UpgradedGiftOriginalDetails({
    this.senderId,
    required this.receiverId,
    required this.text,
    required this.date,
  });

  /// Identifier of the user or the chat that sent the gift; may be null if the gift was private
  final MessageSender? senderId;

  /// Identifier of the user or the chat that received the gift
  final MessageSender receiverId;

  /// Message added to the gift
  final FormattedText text;

  /// Point in time (Unix timestamp) when the gift was sent
  final int date;

  /// Parse from a json
  factory UpgradedGiftOriginalDetails.fromJson(Map<String, dynamic> json) =>
      UpgradedGiftOriginalDetails(
        senderId: json['sender_id'] == null
            ? null
            : MessageSender.fromJson(json['sender_id']),
        receiverId: MessageSender.fromJson(json['receiver_id']),
        text: FormattedText.fromJson(json['text']),
        date: json['date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "sender_id": senderId?.toJson(),
      "receiver_id": receiverId.toJson(),
      "text": text.toJson(),
      "date": date,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [sender_id]: Identifier of the user or the chat that sent the gift; may be null if the gift was private
  /// * [receiver_id]: Identifier of the user or the chat that received the gift
  /// * [text]: Message added to the gift
  /// * [date]: Point in time (Unix timestamp) when the gift was sent
  UpgradedGiftOriginalDetails copyWith({
    MessageSender? senderId,
    MessageSender? receiverId,
    FormattedText? text,
    int? date,
  }) =>
      UpgradedGiftOriginalDetails(
        senderId: senderId ?? this.senderId,
        receiverId: receiverId ?? this.receiverId,
        text: text ?? this.text,
        date: date ?? this.date,
      );

  /// TDLib object type
  static const String defaultObjectId = 'upgradedGiftOriginalDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
