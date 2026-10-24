part of '../tdapi.dart';

/// **SetSupergroupUsername** *(setSupergroupUsername)* - TDLib function
///
/// Changes the editable username of a supergroup or channel, requires owner privileges in the supergroup or channel.
///
/// * [supergroupId]: Identifier of the supergroup or channel.
/// * [username]: New value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username.
///
/// [Ok] is returned on completion.
final class SetSupergroupUsername extends TdFunction {
  /// **SetSupergroupUsername** *(setSupergroupUsername)* - TDLib function
  ///
  /// Changes the editable username of a supergroup or channel, requires owner privileges in the supergroup or channel.
  ///
  /// * [supergroupId]: Identifier of the supergroup or channel.
  /// * [username]: New value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username.
  ///
  /// [Ok] is returned on completion.
  const SetSupergroupUsername({
    required this.supergroupId,
    required this.username,
  });

  /// Identifier of the supergroup or channel
  final int supergroupId;

  /// New value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
  final String username;

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson([dynamic extra]) {
    return {
      "@type": defaultObjectId,
      "supergroup_id": supergroupId,
      "username": username,
      "@extra": extra,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [supergroup_id]: Identifier of the supergroup or channel
  /// * [username]: New value of the username. Use an empty string to remove the username. The username can't be completely removed if there is another active or disabled username
  SetSupergroupUsername copyWith({
    int? supergroupId,
    String? username,
  }) =>
      SetSupergroupUsername(
        supergroupId: supergroupId ?? this.supergroupId,
        username: username ?? this.username,
      );

  /// TDLib object type
  static const String defaultObjectId = 'setSupergroupUsername';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
