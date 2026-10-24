part of '../tdapi.dart';

/// **ClaimTonConnectRequest** *(claimTonConnectRequest)* - TDLib function
///
/// Claims a request received through TON Connect for processing on this device.
///
/// * [sessionId]: Unique identifier of the TON Connect session.
/// * [messageId]: Identifier of the message with the request.
/// * [dappRequestId]: Identifier of the request assigned by the dApp.
/// * [isRejected]: Pass true to reject the request.
///
/// [Ok] is returned on completion.
final class ClaimTonConnectRequest extends TdFunction {
  /// **ClaimTonConnectRequest** *(claimTonConnectRequest)* - TDLib function
  ///
  /// Claims a request received through TON Connect for processing on this device.
  ///
  /// * [sessionId]: Unique identifier of the TON Connect session.
  /// * [messageId]: Identifier of the message with the request.
  /// * [dappRequestId]: Identifier of the request assigned by the dApp.
  /// * [isRejected]: Pass true to reject the request.
  ///
  /// [Ok] is returned on completion.
  const ClaimTonConnectRequest({
    required this.sessionId,
    required this.messageId,
    required this.dappRequestId,
    required this.isRejected,
  });

  /// Unique identifier of the TON Connect session
  final int sessionId;

  /// Identifier of the message with the request
  final int messageId;

  /// Identifier of the request assigned by the dApp
  final String dappRequestId;

  /// Pass true to reject the request
  final bool isRejected;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "session_id": sessionId,
      "message_id": messageId,
      "dapp_request_id": dappRequestId,
      "is_rejected": isRejected,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [session_id]: Unique identifier of the TON Connect session
  /// * [message_id]: Identifier of the message with the request
  /// * [dapp_request_id]: Identifier of the request assigned by the dApp
  /// * [is_rejected]: Pass true to reject the request
  ClaimTonConnectRequest copyWith({
    int? sessionId,
    int? messageId,
    String? dappRequestId,
    bool? isRejected,
  }) =>
      ClaimTonConnectRequest(
        sessionId: sessionId ?? this.sessionId,
        messageId: messageId ?? this.messageId,
        dappRequestId: dappRequestId ?? this.dappRequestId,
        isRejected: isRejected ?? this.isRejected,
      );

  /// TDLib object type
  static const String defaultObjectId = 'claimTonConnectRequest';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
