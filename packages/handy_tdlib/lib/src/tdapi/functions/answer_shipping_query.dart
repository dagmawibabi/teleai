part of '../tdapi.dart';

/// **AnswerShippingQuery** *(answerShippingQuery)* - TDLib function
///
/// Sets the result of a shipping query; for bots only.
///
/// * [shippingQueryId]: Identifier of the shipping query.
/// * [shippingOptions]: Available shipping options.
/// * [errorMessage]: An error message, empty on success.
///
/// [Ok] is returned on completion.
final class AnswerShippingQuery extends TdFunction {
  /// **AnswerShippingQuery** *(answerShippingQuery)* - TDLib function
  ///
  /// Sets the result of a shipping query; for bots only.
  ///
  /// * [shippingQueryId]: Identifier of the shipping query.
  /// * [shippingOptions]: Available shipping options.
  /// * [errorMessage]: An error message, empty on success.
  ///
  /// [Ok] is returned on completion.
  const AnswerShippingQuery({
    required this.shippingQueryId,
    required this.shippingOptions,
    required this.errorMessage,
  });

  /// Identifier of the shipping query
  final int shippingQueryId;

  /// Available shipping options
  final List<ShippingOption> shippingOptions;

  /// An error message, empty on success
  final String errorMessage;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "shipping_query_id": shippingQueryId,
      "shipping_options": shippingOptions.map((i) => i.toJson()).toList(),
      "error_message": errorMessage,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [shipping_query_id]: Identifier of the shipping query
  /// * [shipping_options]: Available shipping options
  /// * [error_message]: An error message, empty on success
  AnswerShippingQuery copyWith({
    int? shippingQueryId,
    List<ShippingOption>? shippingOptions,
    String? errorMessage,
  }) =>
      AnswerShippingQuery(
        shippingQueryId: shippingQueryId ?? this.shippingQueryId,
        shippingOptions: shippingOptions ?? this.shippingOptions,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerShippingQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
