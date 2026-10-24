part of '../tdapi.dart';

/// **SendTonCenterApiRequest** *(sendTonCenterApiRequest)* - TDLib function
///
/// Sends a request to TON Center API and returns its response in JSON format.
///
/// * [endpoint]: The path of the requested endpoint. See https://toncenter.com/api/v3/index.html for the list of supported endpoints.
/// * [type]: Type of the request.
///
/// [Text] is returned on completion.
final class SendTonCenterApiRequest extends TdFunction {
  /// **SendTonCenterApiRequest** *(sendTonCenterApiRequest)* - TDLib function
  ///
  /// Sends a request to TON Center API and returns its response in JSON format.
  ///
  /// * [endpoint]: The path of the requested endpoint. See https://toncenter.com/api/v3/index.html for the list of supported endpoints.
  /// * [type]: Type of the request.
  ///
  /// [Text] is returned on completion.
  const SendTonCenterApiRequest({
    required this.endpoint,
    required this.type,
  });

  /// The path of the requested endpoint. See https://toncenter.com/api/v3/index.html for the list of supported endpoints
  final String endpoint;

  /// Type of the request
  final TonCenterApiRequestType type;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "endpoint": endpoint,
      "type": type.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [endpoint]: The path of the requested endpoint. See https://toncenter.com/api/v3/index.html for the list of supported endpoints
  /// * [type]: Type of the request
  SendTonCenterApiRequest copyWith({
    String? endpoint,
    TonCenterApiRequestType? type,
  }) =>
      SendTonCenterApiRequest(
        endpoint: endpoint ?? this.endpoint,
        type: type ?? this.type,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendTonCenterApiRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
