part of '../tdapi.dart';

/// **SellGift** *(sellGift)* - TDLib function
///
/// Sells a gift for Telegram Stars; requires owner privileges for gifts owned by a chat.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
/// * [receivedGiftId]: Identifier of the gift.
///
/// [Ok] is returned on completion.
final class SellGift extends TdFunction {
  /// **SellGift** *(sellGift)* - TDLib function
  ///
  /// Sells a gift for Telegram Stars; requires owner privileges for gifts owned by a chat.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
  /// * [receivedGiftId]: Identifier of the gift.
  ///
  /// [Ok] is returned on completion.
  const SellGift({
    required this.businessConnectionId,
    required this.receivedGiftId,
  });

  /// Unique identifier of business connection on behalf of which to send the request; for bots only
  final String businessConnectionId;

  /// Identifier of the gift
  final String receivedGiftId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "received_gift_id": receivedGiftId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection on behalf of which to send the request; for bots only
  /// * [received_gift_id]: Identifier of the gift
  SellGift copyWith({
    String? businessConnectionId,
    String? receivedGiftId,
  }) =>
      SellGift(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sellGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
