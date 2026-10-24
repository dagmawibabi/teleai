part of '../tdapi.dart';

/// **SetUsername** *(setUsername)* - TDLib function
///
/// Changes the editable username of the current user.
///
/// * [username]: The new value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username.
///
/// [Ok] is returned on completion.
final class SetUsername extends TdFunction {
  /// **SetUsername** *(setUsername)* - TDLib function
  ///
  /// Changes the editable username of the current user.
  ///
  /// * [username]: The new value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username.
  ///
  /// [Ok] is returned on completion.
  const SetUsername({
    required this.username,
  });

  /// The new value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
  final String username;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "username": username,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: The new value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
  SetUsername copyWith({
    String? username,
  }) =>
      SetUsername(
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
