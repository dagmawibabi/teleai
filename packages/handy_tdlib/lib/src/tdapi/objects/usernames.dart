part of '../tdapi.dart';

/// **Usernames** *(usernames)* - basic class
///
/// Describes usernames assigned to a user, a supergroup, or a channel.
///
/// * [activeUsernames]: List of active usernames; the first one must be shown as the primary username. The order of active usernames can be changed with reorderActiveUsernames, reorderBotActiveUsernames, or reorderSupergroupActiveUsernames.
/// * [disabledUsernames]: List of currently disabled usernames; the username can be activated with toggleUsernameIsActive, toggleBotUsernameIsActive, or toggleSupergroupUsernameIsActive.
/// * [editableUsername]: Active or disabled username, which may be changed with setUsername or setSupergroupUsername.
/// * [collectibleUsernames]: Collectible usernames that were purchased at https://fragment.com and can be passed to getCollectibleItemInfo for more details.
/// * [secondaryUsername]: Secondary non-collectible username. Currently, must be non-empty only for bot accounts. Can't be used in toggleBotUsernameIsActive;. use addBotSecondaryUsername or deleteBotSecondaryUsername to edit it. If the username is disabled, then Telegram Premium subscription is required to re-enable it.
final class Usernames extends TdObject {
  /// **Usernames** *(usernames)* - basic class
  ///
  /// Describes usernames assigned to a user, a supergroup, or a channel.
  ///
  /// * [activeUsernames]: List of active usernames; the first one must be shown as the primary username. The order of active usernames can be changed with reorderActiveUsernames, reorderBotActiveUsernames, or reorderSupergroupActiveUsernames.
  /// * [disabledUsernames]: List of currently disabled usernames; the username can be activated with toggleUsernameIsActive, toggleBotUsernameIsActive, or toggleSupergroupUsernameIsActive.
  /// * [editableUsername]: Active or disabled username, which may be changed with setUsername or setSupergroupUsername.
  /// * [collectibleUsernames]: Collectible usernames that were purchased at https://fragment.com and can be passed to getCollectibleItemInfo for more details.
  /// * [secondaryUsername]: Secondary non-collectible username. Currently, must be non-empty only for bot accounts. Can't be used in toggleBotUsernameIsActive;. use addBotSecondaryUsername or deleteBotSecondaryUsername to edit it. If the username is disabled, then Telegram Premium subscription is required to re-enable it.
  const Usernames({
    required this.activeUsernames,
    required this.disabledUsernames,
    required this.editableUsername,
    required this.collectibleUsernames,
    required this.secondaryUsername,
  });

  /// List of active usernames; the first one must be shown as the primary username. The order of active usernames can be changed with reorderActiveUsernames, reorderBotActiveUsernames, or reorderSupergroupActiveUsernames
  final List<String> activeUsernames;

  /// List of currently disabled usernames; the username can be activated with toggleUsernameIsActive, toggleBotUsernameIsActive, or toggleSupergroupUsernameIsActive
  final List<String> disabledUsernames;

  /// Active or disabled username, which may be changed with setUsername or setSupergroupUsername
  final String editableUsername;

  /// Collectible usernames that were purchased at https://fragment.com and can be passed to getCollectibleItemInfo for more details
  final List<String> collectibleUsernames;

  /// Secondary non-collectible username. Currently, must be non-empty only for bot accounts. Can't be used in toggleBotUsernameIsActive;. use addBotSecondaryUsername or deleteBotSecondaryUsername to edit it. If the username is disabled, then Telegram Premium subscription is required to re-enable it
  final String secondaryUsername;

  /// Parse from a json
  factory Usernames.fromJson(Map<String, dynamic> json) => Usernames(
        activeUsernames: List<String>.from(
            (json['active_usernames'] ?? []).map((item) => item).toList()),
        disabledUsernames: List<String>.from(
            (json['disabled_usernames'] ?? []).map((item) => item).toList()),
        editableUsername: json['editable_username'],
        collectibleUsernames: List<String>.from(
            (json['collectible_usernames'] ?? []).map((item) => item).toList()),
        secondaryUsername: json['secondary_username'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "active_usernames": activeUsernames.map((i) => i).toList(),
      "disabled_usernames": disabledUsernames.map((i) => i).toList(),
      "editable_username": editableUsername,
      "collectible_usernames": collectibleUsernames.map((i) => i).toList(),
      "secondary_username": secondaryUsername,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [active_usernames]: List of active usernames; the first one must be shown as the primary username. The order of active usernames can be changed with reorderActiveUsernames, reorderBotActiveUsernames, or reorderSupergroupActiveUsernames
  /// * [disabled_usernames]: List of currently disabled usernames; the username can be activated with toggleUsernameIsActive, toggleBotUsernameIsActive, or toggleSupergroupUsernameIsActive
  /// * [editable_username]: Active or disabled username, which may be changed with setUsername or setSupergroupUsername
  /// * [collectible_usernames]: Collectible usernames that were purchased at https://fragment.com and can be passed to getCollectibleItemInfo for more details
  /// * [secondary_username]: Secondary non-collectible username. Currently, must be non-empty only for bot accounts. Can't be used in toggleBotUsernameIsActive;. use addBotSecondaryUsername or deleteBotSecondaryUsername to edit it. If the username is disabled, then Telegram Premium subscription is required to re-enable it
  Usernames copyWith({
    List<String>? activeUsernames,
    List<String>? disabledUsernames,
    String? editableUsername,
    List<String>? collectibleUsernames,
    String? secondaryUsername,
  }) =>
      Usernames(
        activeUsernames: activeUsernames ?? this.activeUsernames,
        disabledUsernames: disabledUsernames ?? this.disabledUsernames,
        editableUsername: editableUsername ?? this.editableUsername,
        collectibleUsernames: collectibleUsernames ?? this.collectibleUsernames,
        secondaryUsername: secondaryUsername ?? this.secondaryUsername,
      );

  /// TDLib object type
  static const String defaultObjectId = 'usernames';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
