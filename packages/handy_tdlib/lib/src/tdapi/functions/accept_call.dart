part of '../tdapi.dart';

/// **AcceptCall** *(acceptCall)* - TDLib function
///
/// Accepts an incoming call.
///
/// * [callId]: Call identifier.
/// * [protocol]: The call protocols supported by the application.
///
/// [Ok] is returned on completion.
final class AcceptCall extends TdFunction {
  /// **AcceptCall** *(acceptCall)* - TDLib function
  ///
  /// Accepts an incoming call.
  ///
  /// * [callId]: Call identifier.
  /// * [protocol]: The call protocols supported by the application.
  ///
  /// [Ok] is returned on completion.
  const AcceptCall({
    required this.callId,
    required this.protocol,
  });

  /// Call identifier
  final int callId;

  /// The call protocols supported by the application
  final CallProtocol protocol;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "call_id": callId,
      "protocol": protocol.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [call_id]: Call identifier
  /// * [protocol]: The call protocols supported by the application
  AcceptCall copyWith({
    int? callId,
    CallProtocol? protocol,
  }) =>
      AcceptCall(
        callId: callId ?? this.callId,
        protocol: protocol ?? this.protocol,
      );

  /// TDLib object type
  static const String defaultObjectId = 'acceptCall';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
