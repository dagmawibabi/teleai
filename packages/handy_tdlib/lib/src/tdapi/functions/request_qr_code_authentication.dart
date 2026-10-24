part of '../tdapi.dart';

/// **RequestQrCodeAuthentication** *(requestQrCodeAuthentication)* - TDLib function
///
/// Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,. or if there is no pending authentication query and the current authorization state is authorizationStateWaitPremiumPurchase, authorizationStateWaitEmailAddress,. authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword.
///
/// * [otherUserIds]: List of user identifiers of other users currently using the application.
///
/// [Ok] is returned on completion.
final class RequestQrCodeAuthentication extends TdFunction {
  /// **RequestQrCodeAuthentication** *(requestQrCodeAuthentication)* - TDLib function
  ///
  /// Requests QR code authentication by scanning a QR code on another logged in device. Works only when the current authorization state is authorizationStateWaitPhoneNumber,. or if there is no pending authentication query and the current authorization state is authorizationStateWaitPremiumPurchase, authorizationStateWaitEmailAddress,. authorizationStateWaitEmailCode, authorizationStateWaitCode, authorizationStateWaitRegistration, or authorizationStateWaitPassword.
  ///
  /// * [otherUserIds]: List of user identifiers of other users currently using the application.
  ///
  /// [Ok] is returned on completion.
  const RequestQrCodeAuthentication({
    required this.otherUserIds,
  });

  /// List of user identifiers of other users currently using the application
  final List<int> otherUserIds;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "other_user_ids": otherUserIds.map((i) => i).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [other_user_ids]: List of user identifiers of other users currently using the application
  RequestQrCodeAuthentication copyWith({
    List<int>? otherUserIds,
  }) =>
      RequestQrCodeAuthentication(
        otherUserIds: otherUserIds ?? this.otherUserIds,
      );

  /// TDLib object type
  static const String defaultObjectId = 'requestQrCodeAuthentication';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
