part of '../tdapi.dart';

/// **ToggleUsernameIsActive** *(toggleUsernameIsActive)* - TDLib function
///
/// Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached.
///
/// * [username]: The username to change.
/// * [isActive]: Pass true to activate the username; pass false to disable it.
///
/// [Ok] is returned on completion.
final class ToggleUsernameIsActive extends TdFunction {
  /// **ToggleUsernameIsActive** *(toggleUsernameIsActive)* - TDLib function
  ///
  /// Changes active state for a username of the current user. The editable username can't be disabled. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached.
  ///
  /// * [username]: The username to change.
  /// * [isActive]: Pass true to activate the username; pass false to disable it.
  ///
  /// [Ok] is returned on completion.
  const ToggleUsernameIsActive({
    required this.username,
    required this.isActive,
  });

  /// The username to change
  final String username;

  /// Pass true to activate the username; pass false to disable it
  final bool isActive;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "username": username,
      "is_active": isActive,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [username]: The username to change
  /// * [is_active]: Pass true to activate the username; pass false to disable it
  ToggleUsernameIsActive copyWith({
    String? username,
    bool? isActive,
  }) =>
      ToggleUsernameIsActive(
        username: username ?? this.username,
        isActive: isActive ?? this.isActive,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleUsernameIsActive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
