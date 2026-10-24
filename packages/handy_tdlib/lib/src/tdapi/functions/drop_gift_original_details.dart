part of '../tdapi.dart';

/// **DropGiftOriginalDetails** *(dropGiftOriginalDetails)* - TDLib function
///
/// Drops original details for an upgraded gift.
///
/// * [receivedGiftId]: Identifier of the gift.
/// * [starCount]: The Telegram Star amount required to pay for the operation.
///
/// [Ok] is returned on completion.
final class DropGiftOriginalDetails extends TdFunction {
  /// **DropGiftOriginalDetails** *(dropGiftOriginalDetails)* - TDLib function
  ///
  /// Drops original details for an upgraded gift.
  ///
  /// * [receivedGiftId]: Identifier of the gift.
  /// * [starCount]: The Telegram Star amount required to pay for the operation.
  ///
  /// [Ok] is returned on completion.
  const DropGiftOriginalDetails({
    required this.receivedGiftId,
    required this.starCount,
  });

  /// Identifier of the gift
  final String receivedGiftId;

  /// The Telegram Star amount required to pay for the operation
  final int starCount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "received_gift_id": receivedGiftId,
      "star_count": starCount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [received_gift_id]: Identifier of the gift
  /// * [star_count]: The Telegram Star amount required to pay for the operation
  DropGiftOriginalDetails copyWith({
    String? receivedGiftId,
    int? starCount,
  }) =>
      DropGiftOriginalDetails(
        receivedGiftId: receivedGiftId ?? this.receivedGiftId,
        starCount: starCount ?? this.starCount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'dropGiftOriginalDetails';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
