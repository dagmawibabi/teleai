part of '../tdapi.dart';

/// **PaymentForm** *(paymentForm)* - basic class
///
/// Contains information about an invoice payment form.
///
/// * [id]: The payment form identifier.
/// * [type]: Type of the payment form.
/// * [sellerBotUserId]: User identifier of the seller bot.
/// * [productInfo]: Information about the product.
final class PaymentForm extends TdObject {
  /// **PaymentForm** *(paymentForm)* - basic class
  ///
  /// Contains information about an invoice payment form.
  ///
  /// * [id]: The payment form identifier.
  /// * [type]: Type of the payment form.
  /// * [sellerBotUserId]: User identifier of the seller bot.
  /// * [productInfo]: Information about the product.
  const PaymentForm({
    required this.id,
    required this.type,
    required this.sellerBotUserId,
    required this.productInfo,
    this.extra,
    this.clientId,
  });

  /// The payment form identifier
  final int id;

  /// Type of the payment form
  final PaymentFormType type;

  /// User identifier of the seller bot
  final int sellerBotUserId;

  /// Information about the product
  final ProductInfo productInfo;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory PaymentForm.fromJson(Map<String, dynamic> json) => PaymentForm(
        id: json['id'] is int ? json['id'] : int.parse(json['id']),
        type: PaymentFormType.fromJson(json['type']),
        sellerBotUserId: json['seller_bot_user_id'],
        productInfo: ProductInfo.fromJson(json['product_info']),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "id": id,
      "type": type.toJson(),
      "seller_bot_user_id": sellerBotUserId,
      "product_info": productInfo.toJson(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [id]: The payment form identifier
  /// * [type]: Type of the payment form
  /// * [seller_bot_user_id]: User identifier of the seller bot
  /// * [product_info]: Information about the product
  PaymentForm copyWith({
    int? id,
    PaymentFormType? type,
    int? sellerBotUserId,
    ProductInfo? productInfo,
    dynamic extra,
    int? clientId,
  }) =>
      PaymentForm(
        id: id ?? this.id,
        type: type ?? this.type,
        sellerBotUserId: sellerBotUserId ?? this.sellerBotUserId,
        productInfo: productInfo ?? this.productInfo,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentForm';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
