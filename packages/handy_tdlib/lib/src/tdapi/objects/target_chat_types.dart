part of '../tdapi.dart';

/// **TargetChatTypes** *(targetChatTypes)* - basic class
///
/// Describes allowed types for the target chat.
///
/// * [allowUserChats]: True, if private chats with ordinary users are allowed.
/// * [allowBotChats]: True, if private chats with other bots are allowed.
/// * [allowGroupChats]: True, if basic group and supergroup chats are allowed.
/// * [allowChannelChats]: True, if channel chats are allowed.
final class TargetChatTypes extends TdObject {
  /// **TargetChatTypes** *(targetChatTypes)* - basic class
  ///
  /// Describes allowed types for the target chat.
  ///
  /// * [allowUserChats]: True, if private chats with ordinary users are allowed.
  /// * [allowBotChats]: True, if private chats with other bots are allowed.
  /// * [allowGroupChats]: True, if basic group and supergroup chats are allowed.
  /// * [allowChannelChats]: True, if channel chats are allowed.
  const TargetChatTypes({
    required this.allowUserChats,
    required this.allowBotChats,
    required this.allowGroupChats,
    required this.allowChannelChats,
  });

  /// True, if private chats with ordinary users are allowed
  final bool allowUserChats;

  /// True, if private chats with other bots are allowed
  final bool allowBotChats;

  /// True, if basic group and supergroup chats are allowed
  final bool allowGroupChats;

  /// True, if channel chats are allowed
  final bool allowChannelChats;

  /// Parse from a json
  factory TargetChatTypes.fromJson(Map<String, dynamic> json) =>
      TargetChatTypes(
        allowUserChats: json['allow_user_chats'],
        allowBotChats: json['allow_bot_chats'],
        allowGroupChats: json['allow_group_chats'],
        allowChannelChats: json['allow_channel_chats'],
      );

  /// Convert model to TDLib JSON format
  @override
  Map<String, dynamic> toJson() {
    return {
      "@type": defaultObjectId,
      "allow_user_chats": allowUserChats,
      "allow_bot_chats": allowBotChats,
      "allow_group_chats": allowGroupChats,
      "allow_channel_chats": allowChannelChats,
    };
  }

  /// Copy model with modified properties.
  ///
  /// Properties:
  /// * [allow_user_chats]: True, if private chats with ordinary users are allowed
  /// * [allow_bot_chats]: True, if private chats with other bots are allowed
  /// * [allow_group_chats]: True, if basic group and supergroup chats are allowed
  /// * [allow_channel_chats]: True, if channel chats are allowed
  TargetChatTypes copyWith({
    bool? allowUserChats,
    bool? allowBotChats,
    bool? allowGroupChats,
    bool? allowChannelChats,
  }) =>
      TargetChatTypes(
        allowUserChats: allowUserChats ?? this.allowUserChats,
        allowBotChats: allowBotChats ?? this.allowBotChats,
        allowGroupChats: allowGroupChats ?? this.allowGroupChats,
        allowChannelChats: allowChannelChats ?? this.allowChannelChats,
      );

  /// TDLib object type
  static const String defaultObjectId = 'targetChatTypes';

  /// Convert model to TDLib JSON format, encoded into String.
  @override
  String toString() => jsonEncode(toJson());

  /// TDLib object type for current class instance
  @override
  String get currentObjectId => defaultObjectId;
}
