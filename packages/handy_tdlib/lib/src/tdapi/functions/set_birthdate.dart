part of '../tdapi.dart';

/// **SetBirthdate** *(setBirthdate)* - TDLib function
///
/// Changes the birthdate of the current user.
///
/// * [birthdate]: The new value of the current user's birthdate; pass null to remove the birthdate *(optional)*.
///
/// [Ok] is returned on completion.
final class SetBirthdate extends TdFunction {
  /// **SetBirthdate** *(setBirthdate)* - TDLib function
  ///
  /// Changes the birthdate of the current user.
  ///
  /// * [birthdate]: The new value of the current user's birthdate; pass null to remove the birthdate *(optional)*.
  ///
  /// [Ok] is returned on completion.
  const SetBirthdate({
    this.birthdate,
  });

  /// The new value of the current user's birthdate; pass null to remove the birthdate
  final Birthdate? birthdate;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "birthdate": birthdate?.toJson(),
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [birthdate]: The new value of the current user's birthdate; pass null to remove the birthdate
  SetBirthdate copyWith({
    Birthdate? birthdate,
  }) =>
      SetBirthdate(
        birthdate: birthdate ?? this.birthdate,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setBirthdate';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
