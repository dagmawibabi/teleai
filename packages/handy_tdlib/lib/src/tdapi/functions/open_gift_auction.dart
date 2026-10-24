part of '../tdapi.dart';

/// **OpenGiftAuction** *(openGiftAuction)* - TDLib function
///
/// Informs TDLib that a gift auction was opened by the user.
///
/// * [giftId]: Identifier of the gift, which auction was opened.
///
/// [Ok] is returned on completion.
final class OpenGiftAuction extends TdFunction {
  /// **OpenGiftAuction** *(openGiftAuction)* - TDLib function
  ///
  /// Informs TDLib that a gift auction was opened by the user.
  ///
  /// * [giftId]: Identifier of the gift, which auction was opened.
  ///
  /// [Ok] is returned on completion.
  const OpenGiftAuction({
    required this.giftId,
  });

  /// Identifier of the gift, which auction was opened
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
  /// * [gift_id]: Identifier of the gift, which auction was opened
  OpenGiftAuction copyWith({
    int? giftId,
  }) =>
      OpenGiftAuction(
        giftId: giftId ?? this.giftId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'openGiftAuction';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
