part of '../tdapi.dart';

/// **SetBusinessAccountName** *(setBusinessAccountName)* - TDLib function
///
/// Changes the first and last name of a business account; for bots only.
///
/// * [businessConnectionId]: Unique identifier of business connection.
/// * [firstName]: The new value of the first name for the business account; 1-64 characters.
/// * [lastName]: The new value of the optional last name for the business account; 0-64 characters.
///
/// [Ok] is returned on completion.
final class SetBusinessAccountName extends TdFunction {
  /// **SetBusinessAccountName** *(setBusinessAccountName)* - TDLib function
  ///
  /// Changes the first and last name of a business account; for bots only.
  ///
  /// * [businessConnectionId]: Unique identifier of business connection.
  /// * [firstName]: The new value of the first name for the business account; 1-64 characters.
  /// * [lastName]: The new value of the optional last name for the business account; 0-64 characters.
  ///
  /// [Ok] is returned on completion.
  const SetBusinessAccountName({
    required this.businessConnectionId,
    required this.firstName,
    required this.lastName,
  });

  /// Unique identifier of business connection
  final String businessConnectionId;

  /// The new value of the first name for the business account; 1-64 characters
  final String firstName;

  /// The new value of the optional last name for the business account; 0-64 characters
  final String lastName;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "business_connection_id": businessConnectionId,
      "first_name": firstName,
      "last_name": lastName,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [business_connection_id]: Unique identifier of business connection
  /// * [first_name]: The new value of the first name for the business account; 1-64 characters
  /// * [last_name]: The new value of the optional last name for the business account; 0-64 characters
  SetBusinessAccountName copyWith({
    String? businessConnectionId,
    String? firstName,
    String? lastName,
  }) =>
      SetBusinessAccountName(
        businessConnectionId: businessConnectionId ?? this.businessConnectionId,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBusinessAccountName';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
