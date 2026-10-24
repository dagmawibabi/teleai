part of '../tdapi.dart';

/// **CreateTemporaryPassword** *(createTemporaryPassword)* - TDLib function
///
/// Creates a new temporary password for processing payments and withdrawal of upgraded gifts.
///
/// * [password]: The 2-step verification password of the current user.
/// * [validFor]: Time during which the temporary password will be valid, in seconds; must be between 60 and 86400.
///
/// [TemporaryPasswordState] is returned on completion.
final class CreateTemporaryPassword extends TdFunction {
  /// **CreateTemporaryPassword** *(createTemporaryPassword)* - TDLib function
  ///
  /// Creates a new temporary password for processing payments and withdrawal of upgraded gifts.
  ///
  /// * [password]: The 2-step verification password of the current user.
  /// * [validFor]: Time during which the temporary password will be valid, in seconds; must be between 60 and 86400.
  ///
  /// [TemporaryPasswordState] is returned on completion.
  const CreateTemporaryPassword({
    required this.password,
    required this.validFor,
  });

  /// The 2-step verification password of the current user
  final String password;

  /// Time during which the temporary password will be valid, in seconds; must be between 60 and 86400
  final int validFor;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "password": password,
      "valid_for": validFor,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [password]: The 2-step verification password of the current user
  /// * [valid_for]: Time during which the temporary password will be valid, in seconds; must be between 60 and 86400
  CreateTemporaryPassword copyWith({
    String? password,
    int? validFor,
  }) =>
      CreateTemporaryPassword(
        password: password ?? this.password,
        validFor: validFor ?? this.validFor,
      );

  /// TDLib object type
  static const String defaultObjectId = 'createTemporaryPassword';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
