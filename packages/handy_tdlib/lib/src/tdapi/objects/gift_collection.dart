part of '../tdapi.dart';

/// **GiftCollection** *(giftCollection)* - basic class
///
/// Describes collection of gifts.
///
/// * [id]: Unique identifier of the collection.
/// * [name]: Name of the collection.
/// * [icon]: Icon of the collection; may be null if none *(optional)*.
/// * [giftCount]: Total number of gifts in the collection.
final class GiftCollection extends TdObject {
  /// **GiftCollection** *(giftCollection)* - basic class
  ///
  /// Describes collection of gifts.
  ///
  /// * [id]: Unique identifier of the collection.
  /// * [name]: Name of the collection.
  /// * [icon]: Icon of the collection; may be null if none *(optional)*.
  /// * [giftCount]: Total number of gifts in the collection.
  const GiftCollection({
    required this.id,
    required this.name,
    this.icon,
    required this.giftCount,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the collection
  final int id;

  /// Name of the collection
  final String name;

  /// Icon of the collection; may be null if none
  final Sticker? icon;

  /// Total number of gifts in the collection
  final int giftCount;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftCollection.fromJson(Map<String, dynamic> json) => GiftCollection(
        id: json['id'],
        name: json['name'],
        icon: json['icon'] == null ? null : Sticker.fromJson(json['icon']),
        giftCount: json['gift_count'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "name": name,
      "icon": icon?.toJson(),
      "gift_count": giftCount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: Unique identifier of the collection
  /// * [name]: Name of the collection
  /// * [icon]: Icon of the collection; may be null if none
  /// * [gift_count]: Total number of gifts in the collection
  GiftCollection copyWith({
    int? id,
    String? name,
    Sticker? icon,
    int? giftCount,
    dynamic extra,
    int? clientId,
  }) =>
      GiftCollection(
        id: id ?? this.id,
        name: name ?? this.name,
        icon: icon ?? this.icon,
        giftCount: giftCount ?? this.giftCount,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftCollection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
