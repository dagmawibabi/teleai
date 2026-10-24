part of '../tdapi.dart';

/// **GiftsForCrafting** *(giftsForCrafting)* - basic class
///
/// Represents a list of gifts received by a user or a chat.
///
/// * [totalCount]: The total number of received gifts.
/// * [gifts]: The list of gifts.
/// * [attributePersistenceProbabilities]: The 4 objects that describe probabilities of the crafted gift to have the backdrop or symbol of one of the original gifts. for the cases when 1-4 gifts are used in the craft correspondingly.
/// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
final class GiftsForCrafting extends TdObject {
  /// **GiftsForCrafting** *(giftsForCrafting)* - basic class
  ///
  /// Represents a list of gifts received by a user or a chat.
  ///
  /// * [totalCount]: The total number of received gifts.
  /// * [gifts]: The list of gifts.
  /// * [attributePersistenceProbabilities]: The 4 objects that describe probabilities of the crafted gift to have the backdrop or symbol of one of the original gifts. for the cases when 1-4 gifts are used in the craft correspondingly.
  /// * [nextOffset]: The offset for the next request. If empty, then there are no more results.
  const GiftsForCrafting({
    required this.totalCount,
    required this.gifts,
    required this.attributePersistenceProbabilities,
    required this.nextOffset,
    this.extra,
    this.clientId,
  });

  /// The total number of received gifts
  final int totalCount;

  /// The list of gifts
  final List<ReceivedGift> gifts;

  /// The 4 objects that describe probabilities of the crafted gift to have the backdrop or symbol of one of the original gifts. for the cases when 1-4 gifts are used in the craft correspondingly
  final List<AttributeCraftPersistenceProbability>
      attributePersistenceProbabilities;

  /// The offset for the next request. If empty, then there are no more results
  final String nextOffset;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftsForCrafting.fromJson(Map<String, dynamic> json) =>
      GiftsForCrafting(
        totalCount: json['total_count'],
        gifts: List<ReceivedGift>.from((json['gifts'] ?? [])
            .map((item) => ReceivedGift.fromJson(item))
            .toList()),
        attributePersistenceProbabilities:
            List<AttributeCraftPersistenceProbability>.from(
                (json['attribute_persistence_probabilities'] ?? [])
                    .map((item) =>
                        AttributeCraftPersistenceProbability.fromJson(item))
                    .toList()),
        nextOffset: json['next_offset'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "total_count": totalCount,
      "gifts": gifts.map((i) => i.toJson()).toList(),
      "attribute_persistence_probabilities":
          attributePersistenceProbabilities.map((i) => i.toJson()).toList(),
      "next_offset": nextOffset,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [total_count]: The total number of received gifts
  /// * [gifts]: The list of gifts
  /// * [attribute_persistence_probabilities]: The 4 objects that describe probabilities of the crafted gift to have the backdrop or symbol of one of the original gifts. for the cases when 1-4 gifts are used in the craft correspondingly
  /// * [next_offset]: The offset for the next request. If empty, then there are no more results
  GiftsForCrafting copyWith({
    int? totalCount,
    List<ReceivedGift>? gifts,
    List<AttributeCraftPersistenceProbability>?
        attributePersistenceProbabilities,
    String? nextOffset,
    dynamic extra,
    int? clientId,
  }) =>
      GiftsForCrafting(
        totalCount: totalCount ?? this.totalCount,
        gifts: gifts ?? this.gifts,
        attributePersistenceProbabilities: attributePersistenceProbabilities ??
            this.attributePersistenceProbabilities,
        nextOffset: nextOffset ?? this.nextOffset,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftsForCrafting';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
