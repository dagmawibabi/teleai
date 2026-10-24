part of '../tdapi.dart';

/// **AnswerWebAppQuery** *(answerWebAppQuery)* - TDLib function
///
/// Sets the result of interaction with a Web App and sends corresponding message on behalf of the user to the chat from which the query originated; for bots only.
///
/// * [webAppQueryId]: Identifier of the Web App query.
/// * [result]: The result of the query.
///
/// [InlineMessageId] is returned on completion.
final class AnswerWebAppQuery extends TdFunction {
  /// **AnswerWebAppQuery** *(answerWebAppQuery)* - TDLib function
  ///
  /// Sets the result of interaction with a Web App and sends corresponding message on behalf of the user to the chat from which the query originated; for bots only.
  ///
  /// * [webAppQueryId]: Identifier of the Web App query.
  /// * [result]: The result of the query.
  ///
  /// [InlineMessageId] is returned on completion.
  const AnswerWebAppQuery({
    required this.webAppQueryId,
    required this.result,
  });

  /// Identifier of the Web App query
  final String webAppQueryId;

  /// The result of the query
  final InputInlineQueryResult result;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "web_app_query_id": webAppQueryId,
      "result": result.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [web_app_query_id]: Identifier of the Web App query
  /// * [result]: The result of the query
  AnswerWebAppQuery copyWith({
    String? webAppQueryId,
    InputInlineQueryResult? result,
  }) =>
      AnswerWebAppQuery(
        webAppQueryId: webAppQueryId ?? this.webAppQueryId,
        result: result ?? this.result,
      );

  /// TDLib object type
  static const String defaultObjectId = 'answerWebAppQuery';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
