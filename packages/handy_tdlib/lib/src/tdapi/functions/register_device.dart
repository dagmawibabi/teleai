part of '../tdapi.dart';

/// **RegisterDevice** *(registerDevice)* - TDLib function
///
/// Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription.
///
/// * [deviceToken]: Device token.
/// * [otherUserIds]: List of user identifiers of other users currently using the application.
///
/// [PushReceiverId] is returned on completion.
final class RegisterDevice extends TdFunction {
  /// **RegisterDevice** *(registerDevice)* - TDLib function
  ///
  /// Registers the currently used device for receiving push notifications. Returns a globally unique identifier of the push notification subscription.
  ///
  /// * [deviceToken]: Device token.
  /// * [otherUserIds]: List of user identifiers of other users currently using the application.
  ///
  /// [PushReceiverId] is returned on completion.
  const RegisterDevice({
    required this.deviceToken,
    required this.otherUserIds,
  });

  /// Device token
  final DeviceToken deviceToken;

  /// List of user identifiers of other users currently using the application
  final List<int> otherUserIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "device_token": deviceToken.toJson(),
      "other_user_ids": otherUserIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [device_token]: Device token
  /// * [other_user_ids]: List of user identifiers of other users currently using the application
  RegisterDevice copyWith({
    DeviceToken? deviceToken,
    List<int>? otherUserIds,
  }) =>
      RegisterDevice(
        deviceToken: deviceToken ?? this.deviceToken,
        otherUserIds: otherUserIds ?? this.otherUserIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'registerDevice';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
