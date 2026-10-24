part of '../tdapi.dart';

/// **AnswerChatJoinRequestQuery** *(answerChatJoinRequestQuery)* - TDLib function
///
/// Sets the result of a chat join query; for bots only.
///
/// * [queryId]: Identifier of the query.
/// * [result]: The result; must be null if a URL is passed.
/// * [url]: URL of the Web App to open; must be empty if a result is passed.
///
/// [Ok] is returned on completion.
final class AnswerChatJoinRequestQuery extends TdFunction {
  /// **AnswerChatJoinRequestQuery** *(answerChatJoinRequestQuery)* - TDLib function
  ///
  /// Sets the result of a chat join query; for bots only.
  ///
  /// * [queryId]: Identifier of the query.
  /// * [result]: The result; must be null if a URL is passed.
  /// * [url]: URL of the Web App to open; must be empty if a result is passed.
  ///
  /// [Ok] is returned on completion.
  const AnswerChatJoinRequestQuery({
    required this.queryId,
    required this.result,
    required this.url,
  });

  /// Identifier of the query
  final int queryId;

  /// The result; must be null if a URL is passed
  final ChatJoinRequestResult result;

  /// URL of the Web App to open; must be empty if a result is passed
  final String url;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "query_id": queryId,
      "result": result.toJson(),
      "url": url,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query_id]: Identifier of the query
  /// * [result]: The result; must be null if a URL is passed
  /// * [url]: URL of the Web App to open; must be empty if a result is passed
  AnswerChatJoinRequestQuery copyWith({
    int? queryId,
    ChatJoinRequestResult? result,
    String? url,
  }) =>
      AnswerChatJoinRequestQuery(
        queryId: queryId ?? this.queryId,
        result: result ?? this.result,
        url: url ?? this.url,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerChatJoinRequestQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
