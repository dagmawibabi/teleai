part of '../tdapi.dart';

/// **GetAllPassportElements** *(getAllPassportElements)* - TDLib function
///
/// Returns all available Telegram Passport elements.
///
/// * [password]: The 2-step verification password of the current user.
///
/// [PassportElements] is returned on completion.
final class GetAllPassportElements extends TdFunction {
  /// **GetAllPassportElements** *(getAllPassportElements)* - TDLib function
  ///
  /// Returns all available Telegram Passport elements.
  ///
  /// * [password]: The 2-step verification password of the current user.
  ///
  /// [PassportElements] is returned on completion.
  const GetAllPassportElements({
    required this.password,
  });

  /// The 2-step verification password of the current user
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [password]: The 2-step verification password of the current user
  GetAllPassportElements copyWith({
    String? password,
  }) =>
      GetAllPassportElements(
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getAllPassportElements';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
