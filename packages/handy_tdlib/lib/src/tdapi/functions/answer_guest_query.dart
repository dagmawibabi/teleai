part of '../tdapi.dart';

/// **AnswerGuestQuery** *(answerGuestQuery)* - TDLib function
///
/// Sets the result of a guest query; for bots only.
///
/// * [guestQueryId]: Identifier of the guest query.
/// * [result]: The result of the query.
///
/// [InlineMessageId] is returned on completion.
final class AnswerGuestQuery extends TdFunction {
  /// **AnswerGuestQuery** *(answerGuestQuery)* - TDLib function
  ///
  /// Sets the result of a guest query; for bots only.
  ///
  /// * [guestQueryId]: Identifier of the guest query.
  /// * [result]: The result of the query.
  ///
  /// [InlineMessageId] is returned on completion.
  const AnswerGuestQuery({
    required this.guestQueryId,
    required this.result,
  });

  /// Identifier of the guest query
  final int guestQueryId;

  /// The result of the query
  final InputInlineQueryResult result;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "guest_query_id": guestQueryId,
      "result": result.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [guest_query_id]: Identifier of the guest query
  /// * [result]: The result of the query
  AnswerGuestQuery copyWith({
    int? guestQueryId,
    InputInlineQueryResult? result,
  }) =>
      AnswerGuestQuery(
        guestQueryId: guestQueryId ?? this.guestQueryId,
        result: result ?? this.result,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerGuestQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
