part of '../tdapi.dart';

/// **SendCallSignalingData** *(sendCallSignalingData)* - TDLib function
///
/// Sends call signaling data.
///
/// * [callId]: Call identifier.
/// * [data]: The data.
///
/// [Ok] is returned on completion.
final class SendCallSignalingData extends TdFunction {
  /// **SendCallSignalingData** *(sendCallSignalingData)* - TDLib function
  ///
  /// Sends call signaling data.
  ///
  /// * [callId]: Call identifier.
  /// * [data]: The data.
  ///
  /// [Ok] is returned on completion.
  const SendCallSignalingData({
    required this.callId,
    required this.data,
  });

  /// Call identifier
  final int callId;

  /// The data
  final String data;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "call_id": callId,
      "data": data,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [call_id]: Call identifier
  /// * [data]: The data
  SendCallSignalingData copyWith({
    int? callId,
    String? data,
  }) =>
      SendCallSignalingData(
        callId: callId ?? this.callId,
        data: data ?? this.data,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sendCallSignalingData';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
