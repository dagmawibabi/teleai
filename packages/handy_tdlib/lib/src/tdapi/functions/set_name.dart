part of '../tdapi.dart';

/// **SetName** *(setName)* - TDLib function
///
/// Changes the first and last name of the current user.
///
/// * [firstName]: The new value of the first name for the current user; 1-64 characters.
/// * [lastName]: The new value of the optional last name for the current user; 0-64 characters.
///
/// [Ok] is returned on completion.
final class SetName extends TdFunction {
  /// **SetName** *(setName)* - TDLib function
  ///
  /// Changes the first and last name of the current user.
  ///
  /// * [firstName]: The new value of the first name for the current user; 1-64 characters.
  /// * [lastName]: The new value of the optional last name for the current user; 0-64 characters.
  ///
  /// [Ok] is returned on completion.
  const SetName({
    required this.firstName,
    required this.lastName,
  });

  /// The new value of the first name for the current user; 1-64 characters
  final String firstName;

  /// The new value of the optional last name for the current user; 0-64 characters
  final String lastName;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "first_name": firstName,
      "last_name": lastName,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [first_name]: The new value of the first name for the current user; 1-64 characters
  /// * [last_name]: The new value of the optional last name for the current user; 0-64 characters
  SetName copyWith({
    String? firstName,
    String? lastName,
  }) =>
      SetName(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
