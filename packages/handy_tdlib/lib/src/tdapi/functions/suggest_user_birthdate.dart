part of '../tdapi.dart';

/// **SuggestUserBirthdate** *(suggestUserBirthdate)* - TDLib function
///
/// Suggests a birthdate to another regular user with common messages and allowing non-paid messages.
///
/// * [userId]: User identifier.
/// * [birthdate]: Birthdate to suggest.
///
/// [Ok] is returned on completion.
final class SuggestUserBirthdate extends TdFunction {
  /// **SuggestUserBirthdate** *(suggestUserBirthdate)* - TDLib function
  ///
  /// Suggests a birthdate to another regular user with common messages and allowing non-paid messages.
  ///
  /// * [userId]: User identifier.
  /// * [birthdate]: Birthdate to suggest.
  ///
  /// [Ok] is returned on completion.
  const SuggestUserBirthdate({
    required this.userId,
    required this.birthdate,
  });

  /// User identifier
  final int userId;

  /// Birthdate to suggest
  final Birthdate birthdate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "user_id": userId,
      "birthdate": birthdate.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [user_id]: User identifier
  /// * [birthdate]: Birthdate to suggest
  SuggestUserBirthdate copyWith({
    int? userId,
    Birthdate? birthdate,
  }) =>
      SuggestUserBirthdate(
        userId: userId ?? this.userId,
        birthdate: birthdate ?? this.birthdate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'suggestUserBirthdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
