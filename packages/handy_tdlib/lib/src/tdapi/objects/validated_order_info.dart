part of '../tdapi.dart';

/// **ValidatedOrderInfo** *(validatedOrderInfo)* - basic class
///
/// Contains a temporary identifier of validated order information, which is stored for one hour, and the available shipping options.
///
/// * [orderInfoId]: Temporary identifier of the order information.
/// * [shippingOptions]: Available shipping options.
final class ValidatedOrderInfo extends TdObject {
  /// **ValidatedOrderInfo** *(validatedOrderInfo)* - basic class
  ///
  /// Contains a temporary identifier of validated order information, which is stored for one hour, and the available shipping options.
  ///
  /// * [orderInfoId]: Temporary identifier of the order information.
  /// * [shippingOptions]: Available shipping options.
  const ValidatedOrderInfo({
    required this.orderInfoId,
    required this.shippingOptions,
    this.extra,
    this.clientId,
  });

  /// Temporary identifier of the order information
  final String orderInfoId;

  /// Available shipping options
  final List<ShippingOption> shippingOptions;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory ValidatedOrderInfo.fromJson(Map<String, dynamic> json) =>
      ValidatedOrderInfo(
        orderInfoId: json['order_info_id'],
        shippingOptions: List<ShippingOption>.from(
            (json['shipping_options'] ?? [])
                .map((item) => ShippingOption.fromJson(item))
                .toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "order_info_id": orderInfoId,
      "shipping_options": shippingOptions.map((i) => i.toJson()).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [order_info_id]: Temporary identifier of the order information
  /// * [shipping_options]: Available shipping options
  ValidatedOrderInfo copyWith({
    String? orderInfoId,
    List<ShippingOption>? shippingOptions,
    dynamic extra,
    int? clientId,
  }) =>
      ValidatedOrderInfo(
        orderInfoId: orderInfoId ?? this.orderInfoId,
        shippingOptions: shippingOptions ?? this.shippingOptions,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'validatedOrderInfo';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
