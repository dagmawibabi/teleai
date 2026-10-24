part of '../tdapi.dart';

/// **AllowUnpaidMessagesFromUser** *(allowUnpaidMessagesFromUser)* - TDLib function
///
/// Allows the specified user to send unpaid private messages to the current user by adding a rule to userPrivacySettingAllowUnpaidMessages.
///
/// * [userId]: Identifier of the user.
/// * [refundPayments]: Pass true to refund the user previously paid messages.
///
/// [Ok] is returned on completion.
final class AllowUnpaidMessagesFromUser extends TdFunction {
  /// **AllowUnpaidMessagesFromUser** *(allowUnpaidMessagesFromUser)* - TDLib function
  ///
  /// Allows the specified user to send unpaid private messages to the current user by adding a rule to userPrivacySettingAllowUnpaidMessages.
  ///
  /// * [userId]: Identifier of the user.
  /// * [refundPayments]: Pass true to refund the user previously paid messages.
  ///
  /// [Ok] is returned on completion.
  const AllowUnpaidMessagesFromUser({
    required this.userId,
    required this.refundPayments,
  });

  /// Identifier of the user
  final int userId;

  /// Pass true to refund the user previously paid messages
  final bool refundPayments;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "refund_payments": refundPayments,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user
  /// * [refund_payments]: Pass true to refund the user previously paid messages
  AllowUnpaidMessagesFromUser copyWith({
    int? userId,
    bool? refundPayments,
  }) =>
      AllowUnpaidMessagesFromUser(
        userId: userId ?? this.userId,
        refundPayments: refundPayments ?? this.refundPayments,
      );

  /// TDLib object type
  static const String defaultObjectId = 'allowUnpaidMessagesFromUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
