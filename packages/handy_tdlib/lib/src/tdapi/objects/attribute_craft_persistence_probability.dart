part of '../tdapi.dart';

/// **AttributeCraftPersistenceProbability** *(attributeCraftPersistenceProbability)* - basic class
///
/// Describes chance of the crafted gift to have the backdrop or symbol of one of the original gifts.
///
/// * [persistenceChancePerMille]: The 4 numbers that describe probability of the craft result to have the same attribute as one of the original gifts. if 1, 2, 3, or 4 gifts with the attribute are used in the craft. Each number represents the number of crafted gifts with the original attribute per 1000 successful crafts.
final class AttributeCraftPersistenceProbability extends TdObject {
  /// **AttributeCraftPersistenceProbability** *(attributeCraftPersistenceProbability)* - basic class
  ///
  /// Describes chance of the crafted gift to have the backdrop or symbol of one of the original gifts.
  ///
  /// * [persistenceChancePerMille]: The 4 numbers that describe probability of the craft result to have the same attribute as one of the original gifts. if 1, 2, 3, or 4 gifts with the attribute are used in the craft. Each number represents the number of crafted gifts with the original attribute per 1000 successful crafts.
  const AttributeCraftPersistenceProbability({
    required this.persistenceChancePerMille,
  });

  /// The 4 numbers that describe probability of the craft result to have the same attribute as one of the original gifts. if 1, 2, 3, or 4 gifts with the attribute are used in the craft. Each number represents the number of crafted gifts with the original attribute per 1000 successful crafts
  final List<int> persistenceChancePerMille;

  /// Parse from a json
  factory AttributeCraftPersistenceProbability.fromJson(
          Map<String, dynamic> json) =>
      AttributeCraftPersistenceProbability(
        persistenceChancePerMille: List<int>.from(
            (json['persistence_chance_per_mille'] ?? [])
                .map((item) => item)
                .toList()),
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "persistence_chance_per_mille":
          persistenceChancePerMille.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [persistence_chance_per_mille]: The 4 numbers that describe probability of the craft result to have the same attribute as one of the original gifts. if 1, 2, 3, or 4 gifts with the attribute are used in the craft. Each number represents the number of crafted gifts with the original attribute per 1000 successful crafts
  AttributeCraftPersistenceProbability copyWith({
    List<int>? persistenceChancePerMille,
  }) =>
      AttributeCraftPersistenceProbability(
        persistenceChancePerMille:
            persistenceChancePerMille ?? this.persistenceChancePerMille,
      );

  /// TDLib object type
  static const String defaultObjectId = 'attributeCraftPersistenceProbability';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
