part of '../tdapi.dart';

/// **ChatBoostSlots** *(chatBoostSlots)* - basic class
///
/// Contains a list of chat boost slots.
///
/// * [slots]: List of boost slots.
final class ChatBoostSlots extends TdObject {
  /// **ChatBoostSlots** *(chatBoostSlots)* - basic class
  ///
  /// Contains a list of chat boost slots.
  ///
  /// * [slots]: List of boost slots.
  const ChatBoostSlots({
    required this.slots,
    this.extra,
    this.clientId,
  });

  /// List of boost slots
  final List<ChatBoostSlot> slots;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ChatBoostSlots.fromJson(Map<String, dynamic> json) => ChatBoostSlots(
        slots: List<ChatBoostSlot>.from((json['slots'] ?? [])
            .map((item) => ChatBoostSlot.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "slots": slots.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [slots]: List of boost slots
  ChatBoostSlots copyWith({
    List<ChatBoostSlot>? slots,
    dynamic extra,
    int? clientId,
  }) =>
      ChatBoostSlots(
        slots: slots ?? this.slots,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'chatBoostSlots';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
