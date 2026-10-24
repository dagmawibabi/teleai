part of '../tdapi.dart';

/// **ChatBoostSlot** *(chatBoostSlot)* - basic class
///
/// Describes a slot for chat boost.
///
/// * [slotId]: Unique identifier of the slot.
/// * [currentlyBoostedChatId]: Identifier of the currently boosted chat; 0 if none.
/// * [startDate]: Point in time (Unix timestamp) when the chat was boosted; 0 if none.
/// * [expirationDate]: Point in time (Unix timestamp) when the boost will expire.
/// * [cooldownUntilDate]: Point in time (Unix timestamp) after which the boost can be used for another chat.
final class ChatBoostSlot extends TdObject {
  /// **ChatBoostSlot** *(chatBoostSlot)* - basic class
  ///
  /// Describes a slot for chat boost.
  ///
  /// * [slotId]: Unique identifier of the slot.
  /// * [currentlyBoostedChatId]: Identifier of the currently boosted chat; 0 if none.
  /// * [startDate]: Point in time (Unix timestamp) when the chat was boosted; 0 if none.
  /// * [expirationDate]: Point in time (Unix timestamp) when the boost will expire.
  /// * [cooldownUntilDate]: Point in time (Unix timestamp) after which the boost can be used for another chat.
  const ChatBoostSlot({
    required this.slotId,
    required this.currentlyBoostedChatId,
    required this.startDate,
    required this.expirationDate,
    required this.cooldownUntilDate,
  });

  /// Unique identifier of the slot
  final int slotId;

  /// Identifier of the currently boosted chat; 0 if none
  final int currentlyBoostedChatId;

  /// Point in time (Unix timestamp) when the chat was boosted; 0 if none
  final int startDate;

  /// Point in time (Unix timestamp) when the boost will expire
  final int expirationDate;

  /// Point in time (Unix timestamp) after which the boost can be used for another chat
  final int cooldownUntilDate;

  /// Parse from a json
  factory ChatBoostSlot.fromJson(Map<String, dynamic> json) => ChatBoostSlot(
        slotId: json['slot_id'],
        currentlyBoostedChatId: json['currently_boosted_chat_id'] ?? 0,
        startDate: json['start_date'] ?? 0,
        expirationDate: json['expiration_date'],
        cooldownUntilDate: json['cooldown_until_date'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "slot_id": slotId,
      "currently_boosted_chat_id": currentlyBoostedChatId,
      "start_date": startDate,
      "expiration_date": expirationDate,
      "cooldown_until_date": cooldownUntilDate,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [slot_id]: Unique identifier of the slot
  /// * [currently_boosted_chat_id]: Identifier of the currently boosted chat; 0 if none
  /// * [start_date]: Point in time (Unix timestamp) when the chat was boosted; 0 if none
  /// * [expiration_date]: Point in time (Unix timestamp) when the boost will expire
  /// * [cooldown_until_date]: Point in time (Unix timestamp) after which the boost can be used for another chat
  ChatBoostSlot copyWith({
    int? slotId,
    int? currentlyBoostedChatId,
    int? startDate,
    int? expirationDate,
    int? cooldownUntilDate,
  }) =>
      ChatBoostSlot(
        slotId: slotId ?? this.slotId,
        currentlyBoostedChatId:
            currentlyBoostedChatId ?? this.currentlyBoostedChatId,
        startDate: startDate ?? this.startDate,
        expirationDate: expirationDate ?? this.expirationDate,
        cooldownUntilDate: cooldownUntilDate ?? this.cooldownUntilDate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostSlot';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
