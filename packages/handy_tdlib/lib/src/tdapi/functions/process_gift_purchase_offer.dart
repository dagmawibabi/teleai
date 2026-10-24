part of '../tdapi.dart';

/// **ProcessGiftPurchaseOffer** *(processGiftPurchaseOffer)* - TDLib function
///
/// Handles a pending gift purchase offer.
///
/// * [messageId]: Identifier of the message with the gift purchase offer.
/// * [accept]: Pass true to accept the request; pass false to reject it.
///
/// [Ok] is returned on completion.
final class ProcessGiftPurchaseOffer extends TdFunction {
  /// **ProcessGiftPurchaseOffer** *(processGiftPurchaseOffer)* - TDLib function
  ///
  /// Handles a pending gift purchase offer.
  ///
  /// * [messageId]: Identifier of the message with the gift purchase offer.
  /// * [accept]: Pass true to accept the request; pass false to reject it.
  ///
  /// [Ok] is returned on completion.
  const ProcessGiftPurchaseOffer({
    required this.messageId,
    required this.accept,
  });

  /// Identifier of the message with the gift purchase offer
  final int messageId;

  /// Pass true to accept the request; pass false to reject it
  final bool accept;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "message_id": messageId,
      "accept": accept,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [message_id]: Identifier of the message with the gift purchase offer
  /// * [accept]: Pass true to accept the request; pass false to reject it
  ProcessGiftPurchaseOffer copyWith({
    int? messageId,
    bool? accept,
  }) =>
      ProcessGiftPurchaseOffer(
        messageId: messageId ?? this.messageId,
        accept: accept ?? this.accept,
      );

  /// TDLib object type
  static const String defaultObjectId = 'processGiftPurchaseOffer';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
