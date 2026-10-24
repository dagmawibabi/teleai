part of '../tdapi.dart';

/// **GetBusinessConnection** *(getBusinessConnection)* - TDLib function
///
/// Returns information about a business connection by its identifier; for bots only.
///
/// * [connectionId]: Identifier of the business connection to return.
///
/// [BusinessConnection] is returned on completion.
final class GetBusinessConnection extends TdFunction {
  /// **GetBusinessConnection** *(getBusinessConnection)* - TDLib function
  ///
  /// Returns information about a business connection by its identifier; for bots only.
  ///
  /// * [connectionId]: Identifier of the business connection to return.
  ///
  /// [BusinessConnection] is returned on completion.
  const GetBusinessConnection({
    required this.connectionId,
  });

  /// Identifier of the business connection to return
  final String connectionId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "connection_id": connectionId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [connection_id]: Identifier of the business connection to return
  GetBusinessConnection copyWith({
    String? connectionId,
  }) =>
      GetBusinessConnection(
        connectionId: connectionId ?? this.connectionId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getBusinessConnection';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
