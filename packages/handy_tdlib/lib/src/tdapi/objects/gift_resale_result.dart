part of '../tdapi.dart';

/// **GiftResaleResult** *(giftResaleResult)* - parent
///
/// Describes result of sending a resold gift.
sealed class GiftResaleResult extends TdObject {
  /// **GiftResaleResult** *(giftResaleResult)* - parent
  ///
  /// Describes result of sending a resold gift.
  const GiftResaleResult();

  /// a GiftResaleResult return type can be :
  /// * [GiftResaleResultOk]
  /// * [GiftResaleResultPriceIncreased]
  factory GiftResaleResult.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case GiftResaleResultOk.defaultObjectId:
        return GiftResaleResultOk.fromJson(json);
      case GiftResaleResultPriceIncreased.defaultObjectId:
        return GiftResaleResultPriceIncreased.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of GiftResaleResult)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  GiftResaleResult copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'giftResaleResult';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftResaleResultOk** *(giftResaleResultOk)* - child of GiftResaleResult
///
/// Operation was successfully completed.
///
/// * [receivedGiftId]: Unique identifier of the received gift; only for the gifts sent to the current user.
final class GiftResaleResultOk extends GiftResaleResult {
  /// **GiftResaleResultOk** *(giftResaleResultOk)* - child of GiftResaleResult
  ///
  /// Operation was successfully completed.
  ///
  /// * [receivedGiftId]: Unique identifier of the received gift; only for the gifts sent to the current user.
  const GiftResaleResultOk({
    required this.receivedGiftId,
    this.extra,
    this.clientId,
  });

  /// Unique identifier of the received gift; only for the gifts sent to the current user
  final String receivedGiftId;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftResaleResultOk.fromJson(Map<String, dynamic> json) =>
      GiftResaleResultOk(
        receivedGiftId: json['received_gift_id'],
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Unique identifier of the received gift; only for the gifts sent to the current user
  @override
  GiftResaleResultOk copyWith({
    String? receivedGiftId,
    dynamic extra,
    int? clientId,
  }) =>
      GiftResaleResultOk(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftResaleResultOk';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **GiftResaleResultPriceIncreased** *(giftResaleResultPriceIncreased)* - child of GiftResaleResult
///
/// Operation has failed, because price has increased. If the price has decreased, then the buying will succeed anyway.
///
/// * [price]: New price for the gift.
final class GiftResaleResultPriceIncreased extends GiftResaleResult {
  /// **GiftResaleResultPriceIncreased** *(giftResaleResultPriceIncreased)* - child of GiftResaleResult
  ///
  /// Operation has failed, because price has increased. If the price has decreased, then the buying will succeed anyway.
  ///
  /// * [price]: New price for the gift.
  const GiftResaleResultPriceIncreased({
    required this.price,
    this.extra,
    this.clientId,
  });

  /// New price for the gift
  final GiftResalePrice price;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftResaleResultPriceIncreased.fromJson(Map<String, dynamic> json) =>
      GiftResaleResultPriceIncreased(
        price: GiftResalePrice.fromJson(json['price']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "price": price.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [price]: New price for the gift
  @override
  GiftResaleResultPriceIncreased copyWith({
    GiftResalePrice? price,
    dynamic extra,
    int? clientId,
  }) =>
      GiftResaleResultPriceIncreased(
        price: price ?? this.price,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftResaleResultPriceIncreased';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
