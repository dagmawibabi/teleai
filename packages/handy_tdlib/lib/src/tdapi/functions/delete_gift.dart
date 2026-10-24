part of '../tdapi.dart';

/// **DeleteGift** *(deleteGift)* - TDLib function
///
/// Deletes a gift without receiving Telegram Stars for it. Use receivedGift.can_be_deleted or messageGift.can_be_deleted to check whether the gift can be deleted.
///
/// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
/// * [receivedGiftId]: Identifier of the gift.
///
/// [Ok] is returned on completion.
final class DeleteGift extends TdFunction {
  /// **DeleteGift** *(deleteGift)* - TDLib function
  ///
  /// Deletes a gift without receiving Telegram Stars for it. Use receivedGift.can_be_deleted or messageGift.can_be_deleted to check whether the gift can be deleted.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection on behalf of which to send the request; for bots only.
  /// * [receivedGiftId]: Identifier of the gift.
  ///
  /// [Ok] is returned on completion.
  const DeleteGift({
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
  DeleteGift copyWith({
    String? businessConnectionId,
    String? receivedGiftId,
  }) =>
      DeleteGift(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'deleteGift';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
