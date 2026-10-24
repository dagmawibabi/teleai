part of '../tdapi.dart';

/// **SharePhoneNumber** *(sharePhoneNumber)* - TDLib function
///
/// Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber.
///
/// * [userId]: Identifier of the user with whom to share the phone number. The user must be a mutual contact.
///
/// [Ok] is returned on completion.
final class SharePhoneNumber extends TdFunction {
  /// **SharePhoneNumber** *(sharePhoneNumber)* - TDLib function
  ///
  /// Shares the phone number of the current user with a mutual contact. Supposed to be called when the user clicks on chatActionBarSharePhoneNumber.
  ///
  /// * [userId]: Identifier of the user with whom to share the phone number. The user must be a mutual contact.
  ///
  /// [Ok] is returned on completion.
  const SharePhoneNumber({
    required this.userId,
  });

  /// Identifier of the user with whom to share the phone number. The user must be a mutual contact
  final int userId;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: Identifier of the user with whom to share the phone number. The user must be a mutual contact
  SharePhoneNumber copyWith({
    int? userId,
  }) =>
      SharePhoneNumber(
        userId: userId ?? this.userId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'sharePhoneNumber';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
