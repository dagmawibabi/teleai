part of '../tdapi.dart';

/// **GiftCollections** *(giftCollections)* - basic class
///
/// Contains a list of gift collections.
///
/// * [collections]: List of gift collections.
final class GiftCollections extends TdObject {
  /// **GiftCollections** *(giftCollections)* - basic class
  ///
  /// Contains a list of gift collections.
  ///
  /// * [collections]: List of gift collections.
  const GiftCollections({
    required this.collections,
    this.extra,
    this.clientId,
  });

  /// List of gift collections
  final List<GiftCollection> collections;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftCollections.fromJson(Map<String, dynamic> json) =>
      GiftCollections(
        collections: List<GiftCollection>.from((json['collections'] ?? [])
            .map((item) => GiftCollection.fromJson(item))
            .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "collections": collections.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [collections]: List of gift collections
  GiftCollections copyWith({
    List<GiftCollection>? collections,
    dynamic extra,
    int? clientId,
  }) =>
      GiftCollections(
        collections: collections ?? this.collections,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftCollections';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
