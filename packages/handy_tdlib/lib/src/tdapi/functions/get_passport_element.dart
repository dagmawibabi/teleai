part of '../tdapi.dart';

/// **GetPassportElement** *(getPassportElement)* - TDLib function
///
/// Returns one of the available Telegram Passport elements.
///
/// * [type]: Telegram Passport element type.
/// * [password]: The 2-step verification password of the current user.
///
/// [PassportElement] is returned on completion.
final class GetPassportElement extends TdFunction {
  /// **GetPassportElement** *(getPassportElement)* - TDLib function
  ///
  /// Returns one of the available Telegram Passport elements.
  ///
  /// * [type]: Telegram Passport element type.
  /// * [password]: The 2-step verification password of the current user.
  ///
  /// [PassportElement] is returned on completion.
  const GetPassportElement({
    required this.type,
    required this.password,
  });

  /// Telegram Passport element type
  final PassportElementType type;

  /// The 2-step verification password of the current user
  final String password;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "type": type.toJson(),
      "password": password,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [type]: Telegram Passport element type
  /// * [password]: The 2-step verification password of the current user
  GetPassportElement copyWith({
    PassportElementType? type,
    String? password,
  }) =>
      GetPassportElement(
        type: type ?? this.type,
        password: password ?? this.password,
      );

  /// TDLib object type
  static const String defaultObjectId = 'getPassportElement';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
