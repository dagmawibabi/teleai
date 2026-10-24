part of '../tdapi.dart';

/// **CanSendGift** *(canSendGift)* - TDLib function
///
/// Checks whether a gift with next_send_date in the future can be sent already.
///
/// * [giftId]: Identifier of the gift to send.
///
/// [CanSendGiftResult] is returned on completion.
final class CanSendGift extends TdFunction {
  /// **CanSendGift** *(canSendGift)* - TDLib function
  ///
  /// Checks whether a gift with next_send_date in the future can be sent already.
  ///
  /// * [giftId]: Identifier of the gift to send.
  ///
  /// [CanSendGiftResult] is returned on completion.
  const CanSendGift({
    required this.giftId,
  });

  /// Identifier of the gift to send
  final int giftId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "gift_id": giftId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [gift_id]: Identifier of the gift to send
  CanSendGift copyWith({
    int? giftId,
  }) =>
      CanSendGift(
        giftId: giftId ?? this.giftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'canSendGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
