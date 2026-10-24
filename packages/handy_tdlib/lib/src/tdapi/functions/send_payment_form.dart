part of '../tdapi.dart';

/// **SendPaymentForm** *(sendPaymentForm)* - TDLib function
///
/// Sends a filled-out payment form to the bot for final verification.
///
/// * [inputInvoice]: The invoice.
/// * [paymentFormId]: Payment form identifier returned by getPaymentForm.
/// * [orderInfoId]: Identifier returned by validateOrderInfo, or an empty string.
/// * [shippingOptionId]: Identifier of a chosen shipping option, if applicable.
/// * [credentials]: The credentials chosen by user for payment; pass null for a payment in Telegram Stars *(optional)*.
/// * [tipAmount]: Chosen by the user amount of tip in the smallest units of the currency.
///
/// [PaymentResult] is returned on completion.
final class SendPaymentForm extends TdFunction {
  /// **SendPaymentForm** *(sendPaymentForm)* - TDLib function
  ///
  /// Sends a filled-out payment form to the bot for final verification.
  ///
  /// * [inputInvoice]: The invoice.
  /// * [paymentFormId]: Payment form identifier returned by getPaymentForm.
  /// * [orderInfoId]: Identifier returned by validateOrderInfo, or an empty string.
  /// * [shippingOptionId]: Identifier of a chosen shipping option, if applicable.
  /// * [credentials]: The credentials chosen by user for payment; pass null for a payment in Telegram Stars *(optional)*.
  /// * [tipAmount]: Chosen by the user amount of tip in the smallest units of the currency.
  ///
  /// [PaymentResult] is returned on completion.
  const SendPaymentForm({
    required this.inputInvoice,
    required this.paymentFormId,
    required this.orderInfoId,
    required this.shippingOptionId,
    this.credentials,
    required this.tipAmount,
  });

  /// The invoice
  final InputInvoice inputInvoice;

  /// Payment form identifier returned by getPaymentForm
  final int paymentFormId;

  /// Identifier returned by validateOrderInfo, or an empty string
  final String orderInfoId;

  /// Identifier of a chosen shipping option, if applicable
  final String shippingOptionId;

  /// The credentials chosen by user for payment; pass null for a payment in Telegram Stars
  final InputCredentials? credentials;

  /// Chosen by the user amount of tip in the smallest units of the currency
  final int tipAmount;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "input_invoice": inputInvoice.toJson(),
      "payment_form_id": paymentFormId,
      "order_info_id": orderInfoId,
      "shipping_option_id": shippingOptionId,
      "credentials": credentials?.toJson(),
      "tip_amount": tipAmount,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [input_invoice]: The invoice
  /// * [payment_form_id]: Payment form identifier returned by getPaymentForm
  /// * [order_info_id]: Identifier returned by validateOrderInfo, or an empty string
  /// * [shipping_option_id]: Identifier of a chosen shipping option, if applicable
  /// * [credentials]: The credentials chosen by user for payment; pass null for a payment in Telegram Stars
  /// * [tip_amount]: Chosen by the user amount of tip in the smallest units of the currency
  SendPaymentForm copyWith({
    InputInvoice? inputInvoice,
    int? paymentFormId,
    String? orderInfoId,
    String? shippingOptionId,
    InputCredentials? credentials,
    int? tipAmount,
  }) =>
      SendPaymentForm(
        inputInvoice: inputInvoice ?? this.inputInvoice,
        paymentFormId: paymentFormId ?? this.paymentFormId,
        orderInfoId: orderInfoId ?? this.orderInfoId,
        shippingOptionId: shippingOptionId ?? this.shippingOptionId,
        credentials: credentials ?? this.credentials,
        tipAmount: tipAmount ?? this.tipAmount,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendPaymentForm';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
