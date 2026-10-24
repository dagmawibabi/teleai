part of '../tdapi.dart';

/// **SetPassportElementErrors** *(setPassportElementErrors)* - TDLib function
///
/// Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed.
///
/// * [userId]: User identifier.
/// * [errors]: The errors.
///
/// [Ok] is returned on completion.
final class SetPassportElementErrors extends TdFunction {
  /// **SetPassportElementErrors** *(setPassportElementErrors)* - TDLib function
  ///
  /// Informs the user that some of the elements in their Telegram Passport contain errors; for bots only. The user will not be able to resend the elements, until the errors are fixed.
  ///
  /// * [userId]: User identifier.
  /// * [errors]: The errors.
  ///
  /// [Ok] is returned on completion.
  const SetPassportElementErrors({
    required this.userId,
    required this.errors,
  });

  /// User identifier
  final int userId;

  /// The errors
  final List<InputPassportElementError> errors;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "errors": errors.map((i) => i.toJson()).toList(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [errors]: The errors
  SetPassportElementErrors copyWith({
    int? userId,
    List<InputPassportElementError>? errors,
  }) =>
      SetPassportElementErrors(
        userId: userId ?? this.userId,
        errors: errors ?? this.errors,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setPassportElementErrors';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
