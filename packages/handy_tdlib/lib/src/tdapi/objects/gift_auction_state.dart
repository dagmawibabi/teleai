part of '../tdapi.dart';

/// **GiftAuctionState** *(giftAuctionState)* - basic class
///
/// Represents auction state of a gift.
///
/// * [gift]: The gift.
/// * [state]: Auction state of the gift.
final class GiftAuctionState extends TdObject {
  /// **GiftAuctionState** *(giftAuctionState)* - basic class
  ///
  /// Represents auction state of a gift.
  ///
  /// * [gift]: The gift.
  /// * [state]: Auction state of the gift.
  const GiftAuctionState({
    required this.gift,
    required this.state,
    this.extra,
    this.clientId,
  });

  /// The gift
  final Gift gift;

  /// Auction state of the gift
  final AuctionState state;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory GiftAuctionState.fromJson(Map<String, dynamic> json) =>
      GiftAuctionState(
        gift: Gift.fromJson(json['gift']),
        state: AuctionState.fromJson(json['state']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "gift": gift.toJson(),
      "state": state.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift]: The gift
  /// * [state]: Auction state of the gift
  GiftAuctionState copyWith({
    Gift? gift,
    AuctionState? state,
    dynamic extra,
    int? clientId,
  }) =>
      GiftAuctionState(
        gift: gift ?? this.gift,
        state: state ?? this.state,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'giftAuctionState';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
