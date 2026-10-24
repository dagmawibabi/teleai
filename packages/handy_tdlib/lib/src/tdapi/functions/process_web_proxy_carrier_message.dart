part of '../tdapi.dart';

/// **ProcessWebProxyCarrierMessage** *(processWebProxyCarrierMessage)* - TDLib function
///
/// Passes a message, which the page of a web proxy carrier passed to postMessage of the bridge object, to TDLib. Must be called in the order in which the messages were passed.. Can be called before authorization.
///
/// * [carrierId]: Identifier of the carrier.
/// * [message]: The received message.
///
/// [Ok] is returned on completion.
final class ProcessWebProxyCarrierMessage extends TdFunction {
  /// **ProcessWebProxyCarrierMessage** *(processWebProxyCarrierMessage)* - TDLib function
  ///
  /// Passes a message, which the page of a web proxy carrier passed to postMessage of the bridge object, to TDLib. Must be called in the order in which the messages were passed.. Can be called before authorization.
  ///
  /// * [carrierId]: Identifier of the carrier.
  /// * [message]: The received message.
  ///
  /// [Ok] is returned on completion.
  const ProcessWebProxyCarrierMessage({
    required this.carrierId,
    required this.message,
  });

  /// Identifier of the carrier
  final int carrierId;

  /// The received message
  final WebProxyCarrierMessage message;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "carrier_id": carrierId,
      "message": message.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [carrier_id]: Identifier of the carrier
  /// * [message]: The received message
  ProcessWebProxyCarrierMessage copyWith({
    int? carrierId,
    WebProxyCarrierMessage? message,
  }) =>
      ProcessWebProxyCarrierMessage(
        carrierId: carrierId ?? this.carrierId,
        message: message ?? this.message,
      );

  /// TDLib object type
  static const String defaultObjectId = 'processWebProxyCarrierMessage';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
