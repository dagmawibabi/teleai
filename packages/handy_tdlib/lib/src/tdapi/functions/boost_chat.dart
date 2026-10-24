part of '../tdapi.dart';

/// **BoostChat** *(boostChat)* - TDLib function
///
/// Boosts a chat and returns the list of available chat boost slots for the current user after the boost.
///
/// * [chatId]: Identifier of the chat.
/// * [slotIds]: Identifiers of boost slots of the current user from which to apply boosts to the chat.
///
/// [ChatBoostSlots] is returned on completion.
final class BoostChat extends TdFunction {
  /// **BoostChat** *(boostChat)* - TDLib function
  ///
  /// Boosts a chat and returns the list of available chat boost slots for the current user after the boost.
  ///
  /// * [chatId]: Identifier of the chat.
  /// * [slotIds]: Identifiers of boost slots of the current user from which to apply boosts to the chat.
  ///
  /// [ChatBoostSlots] is returned on completion.
  const BoostChat({
    required this.chatId,
    required this.slotIds,
  });

  /// Identifier of the chat
  final int chatId;

  /// Identifiers of boost slots of the current user from which to apply boosts to the chat
  final List<int> slotIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "slot_ids": slotIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Identifier of the chat
  /// * [slot_ids]: Identifiers of boost slots of the current user from which to apply boosts to the chat
  BoostChat copyWith({
    int? chatId,
    List<int>? slotIds,
  }) =>
      BoostChat(
        chatId: chatId ?? this.chatId,
        slotIds: slotIds ?? this.slotIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'boostChat';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
