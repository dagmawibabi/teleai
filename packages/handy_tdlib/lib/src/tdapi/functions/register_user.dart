part of '../tdapi.dart';

/// **RegisterUser** *(registerUser)* - TDLib function
///
/// Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration.
///
/// * [firstName]: The first name of the user; 1-64 characters.
/// * [lastName]: The last name of the user; 0-64 characters.
/// * [disableNotification]: Pass true to disable notification about the current user joining Telegram for other users that added them to contact list.
///
/// [Ok] is returned on completion.
final class RegisterUser extends TdFunction {
  /// **RegisterUser** *(registerUser)* - TDLib function
  ///
  /// Finishes user registration. Works only when the current authorization state is authorizationStateWaitRegistration.
  ///
  /// * [firstName]: The first name of the user; 1-64 characters.
  /// * [lastName]: The last name of the user; 0-64 characters.
  /// * [disableNotification]: Pass true to disable notification about the current user joining Telegram for other users that added them to contact list.
  ///
  /// [Ok] is returned on completion.
  const RegisterUser({
    required this.firstName,
    required this.lastName,
    required this.disableNotification,
  });

  /// The first name of the user; 1-64 characters
  final String firstName;

  /// The last name of the user; 0-64 characters
  final String lastName;

  /// Pass true to disable notification about the current user joining Telegram for other users that added them to contact list
  final bool disableNotification;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "first_name": firstName,
      "last_name": lastName,
      "disable_notification": disableNotification,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [first_name]: The first name of the user; 1-64 characters
  /// * [last_name]: The last name of the user; 0-64 characters
  /// * [disable_notification]: Pass true to disable notification about the current user joining Telegram for other users that added them to contact list
  RegisterUser copyWith({
    String? firstName,
    String? lastName,
    bool? disableNotification,
  }) =>
      RegisterUser(
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        disableNotification: disableNotification ?? this.disableNotification,
      );

  /// TDLib object type
  static const String defaultObjectId = 'registerUser';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
