part of '../tdapi.dart';

/// **GetReceivedGift** *(getReceivedGift)* - TDLib function
///
/// Returns information about a received gift.
///
/// * [receivedGiftId]: Identifier of the gift.
///
/// [ReceivedGift] is returned on completion.
final class GetReceivedGift extends TdFunction {
  /// **GetReceivedGift** *(getReceivedGift)* - TDLib function
  ///
  /// Returns information about a received gift.
  ///
  /// * [receivedGiftId]: Identifier of the gift.
  ///
  /// [ReceivedGift] is returned on completion.
  const GetReceivedGift({
    required this.receivedGiftId,
  });

  /// Identifier of the gift
  final String receivedGiftId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Identifier of the gift
  GetReceivedGift copyWith({
    String? receivedGiftId,
  }) =>
      GetReceivedGift(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getReceivedGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
