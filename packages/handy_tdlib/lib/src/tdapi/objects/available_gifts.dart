part of '../tdapi.dart';

/// **AvailableGifts** *(availableGifts)* - basic class
///
/// Contains a list of gifts that can be sent to another user or channel chat.
///
/// * [gifts]: The list of gifts.
final class AvailableGifts extends TdObject {
  /// **AvailableGifts** *(availableGifts)* - basic class
  ///
  /// Contains a list of gifts that can be sent to another user or channel chat.
  ///
  /// * [gifts]: The list of gifts.
  const AvailableGifts({
    required this.gifts,
    this.extra,
    this.clientId,
  });

  /// The list of gifts
  final List<AvailableGift> gifts;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory AvailableGifts.fromJson(Map<String, dynamic> json) => AvailableGifts(
        gifts: List<AvailableGift>.from((json['gifts'] ?? [])
            .map((item) => AvailableGift.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gifts": gifts.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gifts]: The list of gifts
  AvailableGifts copyWith({
    List<AvailableGift>? gifts,
    dynamic extra,
    int? clientId,
  }) =>
      AvailableGifts(
        gifts: gifts ?? this.gifts,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'availableGifts';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
