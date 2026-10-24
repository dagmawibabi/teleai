part of '../tdapi.dart';

/// **GetPaymentForm** *(getPaymentForm)* - TDLib function
///
/// Returns an invoice payment form. This method must be called when the user presses inline button of the type inlineKeyboardButtonTypeBuy, or wants to buy access to media in a messagePaidMedia message.
///
/// * [inputInvoice]: The invoice.
/// * [theme]: Preferred payment form theme; pass null to use the default theme *(optional)*.
///
/// [PaymentForm] is returned on completion.
final class GetPaymentForm extends TdFunction {
  /// **GetPaymentForm** *(getPaymentForm)* - TDLib function
  ///
  /// Returns an invoice payment form. This method must be called when the user presses inline button of the type inlineKeyboardButtonTypeBuy, or wants to buy access to media in a messagePaidMedia message.
  ///
  /// * [inputInvoice]: The invoice.
  /// * [theme]: Preferred payment form theme; pass null to use the default theme *(optional)*.
  ///
  /// [PaymentForm] is returned on completion.
  const GetPaymentForm({
    required this.inputInvoice,
    this.theme,
  });

  /// The invoice
  final InputInvoice inputInvoice;

  /// Preferred payment form theme; pass null to use the default theme
  final ThemeParameters? theme;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "input_invoice": inputInvoice.toJson(),
      "theme": theme?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [input_invoice]: The invoice
  /// * [theme]: Preferred payment form theme; pass null to use the default theme
  GetPaymentForm copyWith({
    InputInvoice? inputInvoice,
    ThemeParameters? theme,
  }) =>
      GetPaymentForm(
        inputInvoice: inputInvoice ?? this.inputInvoice,
        theme: theme ?? this.theme,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPaymentForm';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
