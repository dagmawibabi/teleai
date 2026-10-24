part of '../tdapi.dart';

/// **AnswerCustomQuery** *(answerCustomQuery)* - TDLib function
///
/// Answers a custom query; for bots only.
///
/// * [customQueryId]: Identifier of a custom query.
/// * [data]: JSON-serialized answer to the query.
///
/// [Ok] is returned on completion.
final class AnswerCustomQuery extends TdFunction {
  /// **AnswerCustomQuery** *(answerCustomQuery)* - TDLib function
  ///
  /// Answers a custom query; for bots only.
  ///
  /// * [customQueryId]: Identifier of a custom query.
  /// * [data]: JSON-serialized answer to the query.
  ///
  /// [Ok] is returned on completion.
  const AnswerCustomQuery({
    required this.customQueryId,
    required this.data,
  });

  /// Identifier of a custom query
  final int customQueryId;

  /// JSON-serialized answer to the query
  final String data;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "custom_query_id": customQueryId,
      "data": data,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [custom_query_id]: Identifier of a custom query
  /// * [data]: JSON-serialized answer to the query
  AnswerCustomQuery copyWith({
    int? customQueryId,
    String? data,
  }) =>
      AnswerCustomQuery(
        customQueryId: customQueryId ?? this.customQueryId,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerCustomQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
