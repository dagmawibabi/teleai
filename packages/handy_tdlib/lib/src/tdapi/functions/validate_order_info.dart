part of '../tdapi.dart';

/// **ValidateOrderInfo** *(validateOrderInfo)* - TDLib function
///
/// Validates the order information provided by a user and returns the available shipping options for a flexible invoice.
///
/// * [inputInvoice]: The invoice.
/// * [orderInfo]: The order information, provided by the user; pass null if empty *(optional)*.
/// * [allowSave]: Pass true to save the order information.
///
/// [ValidatedOrderInfo] is returned on completion.
final class ValidateOrderInfo extends TdFunction {
  /// **ValidateOrderInfo** *(validateOrderInfo)* - TDLib function
  ///
  /// Validates the order information provided by a user and returns the available shipping options for a flexible invoice.
  ///
  /// * [inputInvoice]: The invoice.
  /// * [orderInfo]: The order information, provided by the user; pass null if empty *(optional)*.
  /// * [allowSave]: Pass true to save the order information.
  ///
  /// [ValidatedOrderInfo] is returned on completion.
  const ValidateOrderInfo({
    required this.inputInvoice,
    this.orderInfo,
    required this.allowSave,
  });

  /// The invoice
  final InputInvoice inputInvoice;

  /// The order information, provided by the user; pass null if empty
  final OrderInfo? orderInfo;

  /// Pass true to save the order information
  final bool allowSave;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "input_invoice": inputInvoice.toJson(),
      "order_info": orderInfo?.toJson(),
      "allow_save": allowSave,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [input_invoice]: The invoice
  /// * [order_info]: The order information, provided by the user; pass null if empty
  /// * [allow_save]: Pass true to save the order information
  ValidateOrderInfo copyWith({
    InputInvoice? inputInvoice,
    OrderInfo? orderInfo,
    bool? allowSave,
  }) =>
      ValidateOrderInfo(
        inputInvoice: inputInvoice ?? this.inputInvoice,
        orderInfo: orderInfo ?? this.orderInfo,
        allowSave: allowSave ?? this.allowSave,
      );

  /// TDLib object type
  static const String defaultObjectId = 'validateOrderInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
