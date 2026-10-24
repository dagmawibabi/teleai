part of '../tdapi.dart';

/// **PaymentReceiptType** *(paymentReceiptType)* - parent
///
/// Describes type of successful payment.
sealed class PaymentReceiptType extends TdObject {
  /// **PaymentReceiptType** *(paymentReceiptType)* - parent
  ///
  /// Describes type of successful payment.
  const PaymentReceiptType();

  /// a PaymentReceiptType return type can be :
  /// * [PaymentReceiptTypeRegular]
  /// * [PaymentReceiptTypeStars]
  factory PaymentReceiptType.fromJson(Map<String, dynamic> json) {
    switch (json["@type"]) {
      case PaymentReceiptTypeRegular.defaultObjectId:
        return PaymentReceiptTypeRegular.fromJson(json);
      case PaymentReceiptTypeStars.defaultObjectId:
        return PaymentReceiptTypeStars.fromJson(json);
      default:
        throw FormatException(
          "Unknown object ${json["@type"]} (expected child of PaymentReceiptType)",
          json,
        );
    }
  }

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson();

  /// Copy instance with no modifications.
  PaymentReceiptType copyWith();

  /// TDLib object type
  static const String defaultObjectId = 'paymentReceiptType';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentReceiptTypeRegular** *(paymentReceiptTypeRegular)* - child of PaymentReceiptType
///
/// The payment was done using a third-party payment provider.
///
/// * [paymentProviderUserId]: User identifier of the payment provider bot.
/// * [invoice]: Information about the invoice.
/// * [orderInfo]: Order information; may be null *(optional)*.
/// * [shippingOption]: Chosen shipping option; may be null *(optional)*.
/// * [credentialsTitle]: Title of the saved credentials chosen by the buyer.
/// * [tipAmount]: The amount of tip chosen by the buyer in the smallest units of the currency.
final class PaymentReceiptTypeRegular extends PaymentReceiptType {
  /// **PaymentReceiptTypeRegular** *(paymentReceiptTypeRegular)* - child of PaymentReceiptType
  ///
  /// The payment was done using a third-party payment provider.
  ///
  /// * [paymentProviderUserId]: User identifier of the payment provider bot.
  /// * [invoice]: Information about the invoice.
  /// * [orderInfo]: Order information; may be null *(optional)*.
  /// * [shippingOption]: Chosen shipping option; may be null *(optional)*.
  /// * [credentialsTitle]: Title of the saved credentials chosen by the buyer.
  /// * [tipAmount]: The amount of tip chosen by the buyer in the smallest units of the currency.
  const PaymentReceiptTypeRegular({
    required this.paymentProviderUserId,
    required this.invoice,
    this.orderInfo,
    this.shippingOption,
    required this.credentialsTitle,
    required this.tipAmount,
  });

  /// User identifier of the payment provider bot
  final int paymentProviderUserId;

  /// Information about the invoice
  final Invoice invoice;

  /// Order information; may be null
  final OrderInfo? orderInfo;

  /// Chosen shipping option; may be null
  final ShippingOption? shippingOption;

  /// Title of the saved credentials chosen by the buyer
  final String credentialsTitle;

  /// The amount of tip chosen by the buyer in the smallest units of the currency
  final int tipAmount;

  /// Parse from a json
  factory PaymentReceiptTypeRegular.fromJson(Map<String, dynamic> json) =>
      PaymentReceiptTypeRegular(
        paymentProviderUserId: json['payment_provider_user_id'],
        invoice: Invoice.fromJson(json['invoice']),
        orderInfo: json['order_info'] == null
            ? null
            : OrderInfo.fromJson(json['order_info']),
        shippingOption: json['shipping_option'] == null
            ? null
            : ShippingOption.fromJson(json['shipping_option']),
        credentialsTitle: json['credentials_title'],
        tipAmount: json['tip_amount'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "payment_provider_user_id": paymentProviderUserId,
      "invoice": invoice.toJson(),
      "order_info": orderInfo?.toJson(),
      "shipping_option": shippingOption?.toJson(),
      "credentials_title": credentialsTitle,
      "tip_amount": tipAmount,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payment_provider_user_id]: User identifier of the payment provider bot
  /// * [invoice]: Information about the invoice
  /// * [order_info]: Order information; may be null
  /// * [shipping_option]: Chosen shipping option; may be null
  /// * [credentials_title]: Title of the saved credentials chosen by the buyer
  /// * [tip_amount]: The amount of tip chosen by the buyer in the smallest units of the currency
  @override
  PaymentReceiptTypeRegular copyWith({
    int? paymentProviderUserId,
    Invoice? invoice,
    OrderInfo? orderInfo,
    ShippingOption? shippingOption,
    String? credentialsTitle,
    int? tipAmount,
  }) =>
      PaymentReceiptTypeRegular(
        paymentProviderUserId:
            paymentProviderUserId ?? this.paymentProviderUserId,
        invoice: invoice ?? this.invoice,
        orderInfo: orderInfo ?? this.orderInfo,
        shippingOption: shippingOption ?? this.shippingOption,
        credentialsTitle: credentialsTitle ?? this.credentialsTitle,
        tipAmount: tipAmount ?? this.tipAmount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentReceiptTypeRegular';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}

/// **PaymentReceiptTypeStars** *(paymentReceiptTypeStars)* - child of PaymentReceiptType
///
/// The payment was done using Telegram Stars.
///
/// * [starCount]: Number of Telegram Stars that were paid.
/// * [transactionId]: Unique identifier of the transaction that can be used to dispute it.
final class PaymentReceiptTypeStars extends PaymentReceiptType {
  /// **PaymentReceiptTypeStars** *(paymentReceiptTypeStars)* - child of PaymentReceiptType
  ///
  /// The payment was done using Telegram Stars.
  ///
  /// * [starCount]: Number of Telegram Stars that were paid.
  /// * [transactionId]: Unique identifier of the transaction that can be used to dispute it.
  const PaymentReceiptTypeStars({
    required this.starCount,
    required this.transactionId,
  });

  /// Number of Telegram Stars that were paid
  final int starCount;

  /// Unique identifier of the transaction that can be used to dispute it
  final String transactionId;

  /// Parse from a json
  factory PaymentReceiptTypeStars.fromJson(Map<String, dynamic> json) =>
      PaymentReceiptTypeStars(
        starCount: json['star_count'],
        transactionId: json['transaction_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "star_count": starCount,
      "transaction_id": transactionId,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [star_count]: Number of Telegram Stars that were paid
  /// * [transaction_id]: Unique identifier of the transaction that can be used to dispute it
  @override
  PaymentReceiptTypeStars copyWith({
    int? starCount,
    String? transactionId,
  }) =>
      PaymentReceiptTypeStars(
        starCount: starCount ?? this.starCount,
        transactionId: transactionId ?? this.transactionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'paymentReceiptTypeStars';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
