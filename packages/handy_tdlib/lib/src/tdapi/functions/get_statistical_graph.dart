part of '../tdapi.dart';

/// **GetStatisticalGraph** *(getStatisticalGraph)* - TDLib function
///
/// Loads an asynchronous or a zoomed in statistical graph.
///
/// * [chatId]: Chat identifier.
/// * [token]: The token for graph loading.
/// * [x]: X-value for zoomed in graph or 0 otherwise.
///
/// [StatisticalGraph] is returned on completion.
final class GetStatisticalGraph extends TdFunction {
  /// **GetStatisticalGraph** *(getStatisticalGraph)* - TDLib function
  ///
  /// Loads an asynchronous or a zoomed in statistical graph.
  ///
  /// * [chatId]: Chat identifier.
  /// * [token]: The token for graph loading.
  /// * [x]: X-value for zoomed in graph or 0 otherwise.
  ///
  /// [StatisticalGraph] is returned on completion.
  const GetStatisticalGraph({
    required this.chatId,
    required this.token,
    required this.x,
  });

  /// Chat identifier
  final int chatId;

  /// The token for graph loading
  final String token;

  /// X-value for zoomed in graph or 0 otherwise
  final int x;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "chat_id": chatId,
      "token": token,
      "x": x,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [chat_id]: Chat identifier
  /// * [token]: The token for graph loading
  /// * [x]: X-value for zoomed in graph or 0 otherwise
  GetStatisticalGraph copyWith({
    int? chatId,
    String? token,
    int? x,
  }) =>
      GetStatisticalGraph(
        chatId: chatId ?? this.chatId,
        token: token ?? this.token,
        x: x ?? this.x,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getStatisticalGraph';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
