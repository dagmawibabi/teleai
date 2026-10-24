part of '../tdapi.dart';

/// **GetPushReceiverId** *(getPushReceiverId)* - TDLib function
///
/// Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously.
///
/// * [payload]: JSON-encoded push notification payload.
///
/// [PushReceiverId] is returned on completion.
final class GetPushReceiverId extends TdFunction {
  /// **GetPushReceiverId** *(getPushReceiverId)* - TDLib function
  ///
  /// Returns a globally unique push notification subscription identifier for identification of an account, which has received a push notification. Can be called synchronously.
  ///
  /// * [payload]: JSON-encoded push notification payload.
  ///
  /// [PushReceiverId] is returned on completion.
  const GetPushReceiverId({
    required this.payload,
  });

  /// JSON-encoded push notification payload
  final String payload;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "payload": payload,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [payload]: JSON-encoded push notification payload
  GetPushReceiverId copyWith({
    String? payload,
  }) =>
      GetPushReceiverId(
        payload: payload ?? this.payload,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPushReceiverId';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
