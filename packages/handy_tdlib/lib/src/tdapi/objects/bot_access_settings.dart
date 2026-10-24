part of '../tdapi.dart';

/// **BotAccessSettings** *(botAccessSettings)* - basic class
///
/// Describes users that have access to a bot.
///
/// * [isRestricted]: True, if access to the bot is restricted to its owner and selected users.
/// * [addedUserIds]: Identifiers of the users who can use the bot additionally to the owner of the bot.
final class BotAccessSettings extends TdObject {
  /// **BotAccessSettings** *(botAccessSettings)* - basic class
  ///
  /// Describes users that have access to a bot.
  ///
  /// * [isRestricted]: True, if access to the bot is restricted to its owner and selected users.
  /// * [addedUserIds]: Identifiers of the users who can use the bot additionally to the owner of the bot.
  const BotAccessSettings({
    required this.isRestricted,
    required this.addedUserIds,
    this.extra,
    this.clientId,
  });

  /// True, if access to the bot is restricted to its owner and selected users
  final bool isRestricted;

  /// Identifiers of the users who can use the bot additionally to the owner of the bot
  final List<int> addedUserIds;

  /// [extra] callback sign
  @override
  final dynamic extra;

  /// [clientId] client identifier
  @override
  final int? clientId;

  /// Parse from a json
  factory BotAccessSettings.fromJson(Map<String, dynamic> json) =>
      BotAccessSettings(
        isRestricted: json['is_restricted'],
        addedUserIds: List<int>.from(
            (json['added_user_ids'] ?? []).map((item) => item).toList()),
        extra: json['@extra'],
        clientId: json['@client_id'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "is_restricted": isRestricted,
      "added_user_ids": addedUserIds.map((i) => i).toList(),
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [is_restricted]: True, if access to the bot is restricted to its owner and selected users
  /// * [added_user_ids]: Identifiers of the users who can use the bot additionally to the owner of the bot
  BotAccessSettings copyWith({
    bool? isRestricted,
    List<int>? addedUserIds,
    dynamic extra,
    int? clientId,
  }) =>
      BotAccessSettings(
        isRestricted: isRestricted ?? this.isRestricted,
        addedUserIds: addedUserIds ?? this.addedUserIds,
        extra: extra ?? this.extra,
        clientId: clientId ?? this.clientId,
      );

  /// TDLib object type
  static const String defaultObjectId = 'botAccessSettings';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
