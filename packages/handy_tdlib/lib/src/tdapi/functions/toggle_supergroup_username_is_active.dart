part of '../tdapi.dart';

/// **ToggleSupergroupUsernameIsActive** *(toggleSupergroupUsernameIsActive)* - TDLib function
///
/// Changes active state for a username of a supergroup or channel, requires owner privileges in the supergroup or channel. The editable username can't be disabled.. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached.
///
/// * [supergroupId]: Identifier of the supergroup or channel.
/// * [username]: The username to change.
/// * [isActive]: Pass true to activate the username; pass false to disable it.
///
/// [Ok] is returned on completion.
final class ToggleSupergroupUsernameIsActive extends TdFunction {
  /// **ToggleSupergroupUsernameIsActive** *(toggleSupergroupUsernameIsActive)* - TDLib function
  ///
  /// Changes active state for a username of a supergroup or channel, requires owner privileges in the supergroup or channel. The editable username can't be disabled.. May return an error with a message "USERNAMES_ACTIVE_TOO_MUCH" if the maximum number of active usernames has been reached.
  ///
  /// * [supergroupId]: Identifier of the supergroup or channel.
  /// * [username]: The username to change.
  /// * [isActive]: Pass true to activate the username; pass false to disable it.
  ///
  /// [Ok] is returned on completion.
  const ToggleSupergroupUsernameIsActive({
    required this.supergroupId,
    required this.username,
    required this.isActive,
  });

  /// Identifier of the supergroup or channel
  final int supergroupId;

  /// The username to change
  final String username;

  /// Pass true to activate the username; pass false to disable it
  final bool isActive;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "username": username,
      "is_active": isActive,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup or channel
  /// * [username]: The username to change
  /// * [is_active]: Pass true to activate the username; pass false to disable it
  ToggleSupergroupUsernameIsActive copyWith({
    int? supergroupId,
    String? username,
    bool? isActive,
  }) =>
      ToggleSupergroupUsernameIsActive(
        supergroupId: supergroupId ?? this.supergroupId,
        username: username ?? this.username,
        isActive: isActive ?? this.isActive,
      );

  /// TDLib object type
  static const String defaultObjectId = 'toggleSupergroupUsernameIsActive';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
