part of '../tdapi.dart';

/// **AnswerPreCheckoutQuery** *(answerPreCheckoutQuery)* - TDLib function
///
/// Sets the result of a pre-checkout query; for bots only.
///
/// * [preCheckoutQueryId]: Identifier of the pre-checkout query.
/// * [errorMessage]: An error message, empty on success.
///
/// [Ok] is returned on completion.
final class AnswerPreCheckoutQuery extends TdFunction {
  /// **AnswerPreCheckoutQuery** *(answerPreCheckoutQuery)* - TDLib function
  ///
  /// Sets the result of a pre-checkout query; for bots only.
  ///
  /// * [preCheckoutQueryId]: Identifier of the pre-checkout query.
  /// * [errorMessage]: An error message, empty on success.
  ///
  /// [Ok] is returned on completion.
  const AnswerPreCheckoutQuery({
    required this.preCheckoutQueryId,
    required this.errorMessage,
  });

  /// Identifier of the pre-checkout query
  final int preCheckoutQueryId;

  /// An error message, empty on success
  final String errorMessage;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "pre_checkout_query_id": preCheckoutQueryId,
      "error_message": errorMessage,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [pre_checkout_query_id]: Identifier of the pre-checkout query
  /// * [error_message]: An error message, empty on success
  AnswerPreCheckoutQuery copyWith({
    int? preCheckoutQueryId,
    String? errorMessage,
  }) =>
      AnswerPreCheckoutQuery(
        preCheckoutQueryId: preCheckoutQueryId ?? this.preCheckoutQueryId,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerPreCheckoutQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
