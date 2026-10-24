part of '../tdapi.dart';

/// **CloseGiftAuction** *(closeGiftAuction)* - TDLib function
///
/// Informs TDLib that a gift auction was closed by the user.
///
/// * [giftId]: Identifier of the gift, which auction was closed.
///
/// [Ok] is returned on completion.
final class CloseGiftAuction extends TdFunction {
  /// **CloseGiftAuction** *(closeGiftAuction)* - TDLib function
  ///
  /// Informs TDLib that a gift auction was closed by the user.
  ///
  /// * [giftId]: Identifier of the gift, which auction was closed.
  ///
  /// [Ok] is returned on completion.
  const CloseGiftAuction({
    required this.giftId,
  });

  /// Identifier of the gift, which auction was closed
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
  /// * [gift_id]: Identifier of the gift, which auction was closed
  CloseGiftAuction copyWith({
    int? giftId,
  }) =>
      CloseGiftAuction(
        giftId: giftId ?? this.giftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'closeGiftAuction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
