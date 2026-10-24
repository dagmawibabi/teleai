part of '../tdapi.dart';

/// **GetGuardBotWebAppUrl** *(getGuardBotWebAppUrl)* - TDLib function
///
/// Returns an HTTPS URL of a Web App of a guard bot to open after receiving chatJoinResultGuardBotApprovalRequired.
///
/// * [queryId]: Unique identifier of the join request as received in chatJoinResultGuardBotApprovalRequired.
/// * [parameters]: Parameters to use to open the Web App.
///
/// [WebAppUrl] is returned on completion.
final class GetGuardBotWebAppUrl extends TdFunction {
  /// **GetGuardBotWebAppUrl** *(getGuardBotWebAppUrl)* - TDLib function
  ///
  /// Returns an HTTPS URL of a Web App of a guard bot to open after receiving chatJoinResultGuardBotApprovalRequired.
  ///
  /// * [queryId]: Unique identifier of the join request as received in chatJoinResultGuardBotApprovalRequired.
  /// * [parameters]: Parameters to use to open the Web App.
  ///
  /// [WebAppUrl] is returned on completion.
  const GetGuardBotWebAppUrl({
    required this.queryId,
    required this.parameters,
  });

  /// Unique identifier of the join request as received in chatJoinResultGuardBotApprovalRequired
  final int queryId;

  /// Parameters to use to open the Web App
  final WebAppOpenParameters parameters;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "query_id": queryId,
      "parameters": parameters.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [query_id]: Unique identifier of the join request as received in chatJoinResultGuardBotApprovalRequired
  /// * [parameters]: Parameters to use to open the Web App
  GetGuardBotWebAppUrl copyWith({
    int? queryId,
    WebAppOpenParameters? parameters,
  }) =>
      GetGuardBotWebAppUrl(
        queryId: queryId ?? this.queryId,
        parameters: parameters ?? this.parameters,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getGuardBotWebAppUrl';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
