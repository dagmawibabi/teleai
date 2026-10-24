part of '../tdapi.dart';

/// **PaymentReceipt** *(paymentReceipt)* - basic class
///
/// Contains information about a successful payment.
///
/// * [productInfo]: Information about the product.
/// * [date]: Point in time (Unix timestamp) when the payment was made.
/// * [sellerBotUserId]: User identifier of the seller bot.
/// * [type]: Type of the payment receipt.
final class PaymentReceipt extends TdObject {
  /// **PaymentReceipt** *(paymentReceipt)* - basic class
  ///
  /// Contains information about a successful payment.
  ///
  /// * [productInfo]: Information about the product.
  /// * [date]: Point in time (Unix timestamp) when the payment was made.
  /// * [sellerBotUserId]: User identifier of the seller bot.
  /// * [type]: Type of the payment receipt.
  const PaymentReceipt({
    required this.productInfo,
    required this.date,
    required this.sellerBotUserId,
    required this.type,
    this.extra,
    this.clientId,
  });

  /// Information about the product
  final ProductInfo productInfo;

  /// Point in time (Unix timestamp) when the payment was made
  final int date;

  /// User identifier of the seller bot
  final int sellerBotUserId;

  /// Type of the payment receipt
  final PaymentReceiptType type;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PaymentReceipt.fromJson(Map<String, dynamic> json) => PaymentReceipt(
        productInfo: ProductInfo.fromJson(json['product_info']),
        date: json['date'],
        sellerBotUserId: json['seller_bot_user_id'],
        type: PaymentReceiptType.fromJson(json['type']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "product_info": productInfo.toJson(),
      "date": date,
      "seller_bot_user_id": sellerBotUserId,
      "type": type.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [product_info]: Information about the product
  /// * [date]: Point in time (Unix timestamp) when the payment was made
  /// * [seller_bot_user_id]: User identifier of the seller bot
  /// * [type]: Type of the payment receipt
  PaymentReceipt copyWith({
    ProductInfo? productInfo,
    int? date,
    int? sellerBotUserId,
    PaymentReceiptType? type,
    dynamic extra,
    int? clientId,
  }) =>
      PaymentReceipt(
        productInfo: productInfo ?? this.productInfo,
        date: date ?? this.date,
        sellerBotUserId: sellerBotUserId ?? this.sellerBotUserId,
        type: type ?? this.type,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentReceipt';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
